Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1PzvEW-0005lt-NO
	for openembedded-core@lists.openembedded.org;
	Wed, 16 Mar 2011 19:14:08 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 16 Mar 2011 10:52:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.63,195,1299484800"; d="scan'208";a="897955955"
Received: from unknown (HELO helios) ([10.255.12.144])
	by fmsmga001.fm.intel.com with SMTP; 16 Mar 2011 10:52:25 -0700
Received: by helios (sSMTP sendmail emulation); Wed, 16 Mar 2011 17:52:23 +0000
Message-Id: <72630e485ee5606ee308b97f58c645662f9e2108.1300297594.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1300297594.git.paul.eggleton@linux.intel.com>
References: <cover.1300297594.git.paul.eggleton@linux.intel.com>
Old-Date: Wed, 16 Mar 2011 16:51:40 +0000
Date: Wed, 16 Mar 2011 17:52:23 +0000
To: openembedded-core@lists.openembedded.org
CC: 
From: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] sanity: detect if bitbake wrapper is not being used or pseudo is broken
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 16 Mar 2011 18:14:08 -0000

From: Paul Eggleton <paul.eggleton@linux.intel.com>

* Shows a warning during sanity checking if the scripts/bitbake wrapper is
  not being used
* Check to see if pseudo is working during sanity checking, and if it
  isn't an error occurs (if we are using the wrapper script and pseudo
  has been built; otherwise it is a warning).

Fixes [YOCTO #653]

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/sanity.bbclass |   25 ++++++++++++++++++++++++-
 scripts/bitbake             |    3 +++
 scripts/poky-env-internal   |    2 +-
 3 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index a6d320b..6e13d2a 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -40,7 +40,26 @@ def check_sanity_tmpdir_change(tmpdir):
 def check_sanity_version_change():
     # Sanity checks to be done when SANITY_VERSION changes
     return ""
-    
+
+def check_pseudo_wrapper():
+    import subprocess as sub
+    # Check if bitbake wrapper is being used
+    pseudo_build = os.environ.get( 'PSEUDO_BUILD' )
+    if not pseudo_build:
+        bb.warn("Bitbake has not been run using the bitbake wrapper (scripts/bitbake); this is likely because your PATH has been altered from that normally set up by the poky-init-build-env script. Not using the wrapper may result in failures during package installation, so it is highly recommended that you set your PATH back so that the wrapper script is being executed.")
+
+    if (not pseudo_build) or pseudo_build == '2':
+        # pseudo ought to be working, let's see if it is...
+        p = sub.Popen(['sh', '-c', 'PSEUDO_DISABLED=0 id -u'],stdout=sub.PIPE,stderr=sub.PIPE)
+        out, err = p.communicate()
+        if out.rstrip() != '0':
+            msg = "Pseudo is not functioning correctly, which will cause failures during package installation. Please check your configuration."
+            if pseudo_build == '2':
+                return msg
+            else:
+                bb.warn(msg)
+    return ""
+
 def check_create_long_filename(filepath, pathname):
     testfile = os.path.join(filepath, ''.join([`num`[-1] for num in xrange(1,200)]))
     try:
@@ -187,6 +206,10 @@ def check_sanity(e):
         missing = missing.rstrip(',')
         messages = messages + "Please install following missing utilities: %s\n" % missing
 
+    pseudo_msg = check_pseudo_wrapper()
+    if pseudo_msg != "":
+        messages = messages + pseudo_msg + '\n'
+
     # Check if DISPLAY is set if IMAGETEST is set
     if not data.getVar( 'DISPLAY', e.data, True ) and data.getVar( 'IMAGETEST', e.data, True ) == 'qemu':
         messages = messages + 'qemuimagetest needs a X desktop to start qemu, please set DISPLAY correctly (e.g. DISPLAY=:1.0)\n'
diff --git a/scripts/bitbake b/scripts/bitbake
index cad4dbe..29e7bcd 100755
--- a/scripts/bitbake
+++ b/scripts/bitbake
@@ -27,6 +27,7 @@ OLDPATH=$PATH
 export PATH=`echo $PATH | sed s#[^:]*/scripts:##`
 if [ $buildpseudo = "1" ]; then
     echo "Pseudo is not present but is required, building this first before the main build"
+    export PSEUDO_BUILD=1
     bitbake pseudo-native tar-replacement-native -c populate_sysroot
     ret=$?
     if [ "$ret" != "0" ]; then
@@ -44,9 +45,11 @@ fi
 BITBAKE=`which bitbake`
 export PATH=$OLDPATH
 if [ $needpseudo = "1" ]; then
+    export PSEUDO_BUILD=2
     PSEUDOBINDIR=`cat $BUILDDIR/pseudodone`
     PSEUDO_BINDIR=$PSEUDOBINDIR PSEUDO_LIBDIR=$PSEUDOBINDIR/../lib/pseudo/lib PSEUDO_PREFIX=$PSEUDOBINDIR/../../ PSEUDO_DISABLED=1 $PSEUDOBINDIR/pseudo $BITBAKE $@
 else
+    export PSEUDO_BUILD=0
     $BITBAKE $@
 fi
 ret=$?
diff --git a/scripts/poky-env-internal b/scripts/poky-env-internal
index 724a6e4..5549454 100755
--- a/scripts/poky-env-internal
+++ b/scripts/poky-env-internal
@@ -55,6 +55,6 @@ unset BITBAKEDIR
 export BUILDDIR
 export PATH
 
-export BB_ENV_EXTRAWHITE="MACHINE DISTRO POKYMODE POKYLIBC http_proxy ftp_proxy https_proxy all_proxy ALL_PROXY no_proxy SSH_AGENT_PID SSH_AUTH_SOCK BB_SRCREV_POLICY SDKMACHINE BB_NUMBER_THREADS GIT_PROXY_COMMAND PSEUDO_DISABLED"
+export BB_ENV_EXTRAWHITE="MACHINE DISTRO POKYMODE POKYLIBC http_proxy ftp_proxy https_proxy all_proxy ALL_PROXY no_proxy SSH_AGENT_PID SSH_AUTH_SOCK BB_SRCREV_POLICY SDKMACHINE BB_NUMBER_THREADS GIT_PROXY_COMMAND PSEUDO_DISABLED PSEUDO_BUILD"
 
 export BBFETCH2=True
-- 
1.7.1



