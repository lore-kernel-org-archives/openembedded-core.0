Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1Qo8DZ-0001UV-C1
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Aug 2011 08:12:41 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 01 Aug 2011 23:08:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,305,1309762800"; d="scan'208";a="34812620"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.36.112])
	by fmsmga002.fm.intel.com with ESMTP; 01 Aug 2011 23:08:19 -0700
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Aug 2011 14:08:32 +0800
Message-Id: <6def4624e63c8c7cf439dff32cb155dd2bba0ebe.1312265186.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1312265186.git.dexuan.cui@intel.com>
References: <cover.1312265186.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1312265186.git.dexuan.cui@intel.com>
References: <cover.1312265186.git.dexuan.cui@intel.com>
Subject: [PATCH 1/1] oe-init-build-env, scripts/oe-buildenv-internal: add error detecting for $BDIR
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
X-List-Received-Date: Tue, 02 Aug 2011 06:12:41 -0000

[YOCTO #671]

"readlink -f" in Ubuntu 10.04 is buggy: it doesn't ignore a trailing / (e.g.,
"readlink -f /tmp/non-existent-dir/" returns nothing, but according to
http://www.gnu.org/s/coreutils/manual/coreutils.pdf it should do that --
hence we get bug 671. It seems Ubuntu 10.10 or even later Ubuntu 11.04,
and other Linux distributions(e.g., Open Suse 11.4) haven't such an issue.

So I think we should detect this and ask Ubuntu 10.04 users to avoid supply
a path with trailing slash here.

Moreever, I also add the detection of non-existent path, e.g.,
source oe-init-build-env /non-existent-dir/build
can be detected and we'll print an error msg.
And, if we get errors in oe-buildenv-internal, we should stop the script
and shouldn't further run.

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 oe-init-build-env            |    6 +++---
 scripts/oe-buildenv-internal |   13 +++++++++++--
 2 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/oe-init-build-env b/oe-init-build-env
index 77332a7..cc30a3b 100755
--- a/oe-init-build-env
+++ b/oe-init-build-env
@@ -35,10 +35,10 @@ else
    fi
    OEROOT=`readlink -f "$OEROOT"`
    export OEROOT
-   . $OEROOT/scripts/oe-buildenv-internal
-   $OEROOT/scripts/oe-setup-builddir
+   . $OEROOT/scripts/oe-buildenv-internal && \
+        $OEROOT/scripts/oe-setup-builddir && \
+        [ -n "$BUILDDIR" ] && cd $BUILDDIR
    unset OEROOT
    unset BBPATH
-   [ -n "$BUILDDIR" ] && cd $BUILDDIR
 fi
 
diff --git a/scripts/oe-buildenv-internal b/scripts/oe-buildenv-internal
index c13fc40..117b0c5 100755
--- a/scripts/oe-buildenv-internal
+++ b/scripts/oe-buildenv-internal
@@ -21,7 +21,7 @@
 # It is assumed OEROOT is already defined when this is called
 if [ -z "$OEROOT" ]; then
     echo >&2 "Error: OEROOT is not defined!"
-    return
+    return 1
 fi
 
 if [ "x$BDIR" = "x" ]; then
@@ -29,6 +29,15 @@ if [ "x$BDIR" = "x" ]; then
         BDIR="build"
     else
         BDIR=`readlink -f "$1"`
+        if [ -z "$BDIR"  ]; then
+            if expr "$1" : '.*/$' >/dev/null; then
+                echo >&2 "Error: please remove any trailing / in the argument."
+            else
+                PARENTDIR=`dirname "$1"`
+                echo >&2 "Error: the directory $PARENTDIR doesn't exist?"
+            fi
+            return 1
+        fi
     fi
 fi
 if expr "$BDIR" : '/.*' > /dev/null ; then
@@ -45,7 +54,7 @@ BUILDDIR=`readlink -f "$BUILDDIR"`
 
 if ! (test -d "$BITBAKEDIR"); then
     echo >&2 "Error: The bitbake directory ($BITBAKEDIR) does not exist!  Please ensure a copy of bitbake exists at this location"
-    return
+    return 1
 fi
 
 PATH="${OEROOT}/scripts:$BITBAKEDIR/bin/:$PATH"
-- 
1.7.6



