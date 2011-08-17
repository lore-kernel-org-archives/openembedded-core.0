Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Qtl4K-0001c0-PC
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Aug 2011 20:42:25 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 17 Aug 2011 11:37:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,240,1312182000"; d="scan'208";a="39516519"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.255.18.37])
	by azsmga001.ch.intel.com with ESMTP; 17 Aug 2011 11:37:44 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Aug 2011 19:37:38 +0100
Message-Id: <5e4613d910b644db95a096b7637ceecf85e2c179.1313606178.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1313606178.git.paul.eggleton@linux.intel.com>
References: <cover.1313606178.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1313606178.git.paul.eggleton@linux.intel.com>
References: <cover.1313606178.git.paul.eggleton@linux.intel.com>
Subject: [RFC PATCH 2/2] sanity.bbclass: add optional untested host distro warning
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
X-List-Received-Date: Wed, 17 Aug 2011 18:42:25 -0000

SANITY_TESTED_DISTROS, if specified, is expected to be a
newline-delimited list of distro identifier strings, e.g.

SANITY_TESTED_DISTROS = " \
        Ubuntu 11.04 \
        Fedora release 14 (Laughlin) \
        "

(spaces, tabs etc. are trimmed)

If SANITY_TESTED_DISTROS is defined, we will attempt to detect the host
distribution. If the distribution is not in SANITY_TESTED_DISTROS or we
could not detect the distribution then we show a warning during sanity
checking.

Provides the mechanism for fixing [YOCTO #1096].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/sanity.bbclass |   48 +++++++++++++++++++++++++++++++++++++++++++
 1 files changed, 48 insertions(+), 0 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index d50c843..16af029 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -118,6 +118,52 @@ def check_connectivity(d):
 
     return retval
 
+def check_supported_distro(e):
+    tested_distros = e.data.getVar('SANITY_TESTED_DISTROS', True)
+    if not tested_distros:
+        return
+
+    if os.path.exists("/etc/redhat-release"):
+        f = open("/etc/redhat-release", "r")
+        try:
+            distro = f.readline()
+        finally:
+            f.close()
+    elif os.path.exists("/etc/SuSE-release"):
+        f = open("/etc/SuSE-release", "r")
+        try:
+            distro = f.readline()
+            # Remove the architecture suffix e.g. (i586)
+            distro = re.sub(r' \([a-zA-Z0-9\-_]*\)$', '', distro).strip()
+        finally:
+            f.close()
+    else:
+        # Use LSB method
+        import subprocess as sub
+        try:
+            p = sub.Popen(['lsb_release','-d','-s'],stdout=sub.PIPE,stderr=sub.PIPE)
+            out, err = p.communicate()
+            distro = out.rstrip()
+        except Exception:
+            distro = None
+
+        if not distro:
+            if os.path.exists("/etc/lsb-release"):
+                f = open("/etc/lsb-release", "r")
+                try:
+                    for line in f:
+                        lns = line.split('=')
+                        if lns[0] == "DISTRIB_DESCRIPTION":
+                            distro = lns[1].strip('"\n')
+                            break
+                finally:
+                    f.close()
+    if distro:
+        if distro not in [x.strip() for x in tested_distros.split('\n')]:
+            bb.warn('Host distribution "%s" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.' % distro)
+    else:
+        bb.warn('Host distribution could not be determined; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.')
+
 def check_sanity(e):
     from bb import note, error, data, __version__
 
@@ -249,6 +295,8 @@ def check_sanity(e):
     if pseudo_msg != "":
         messages = messages + pseudo_msg + '\n'
 
+    check_supported_distro(e)
+
     # Check if DISPLAY is set if IMAGETEST is set
     if not data.getVar( 'DISPLAY', e.data, True ) and data.getVar( 'IMAGETEST', e.data, True ) == 'qemu':
         messages = messages + 'qemuimagetest needs a X desktop to start qemu, please set DISPLAY correctly (e.g. DISPLAY=:1.0)\n'
-- 
1.7.4.1



