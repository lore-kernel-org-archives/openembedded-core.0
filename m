Return-Path: <martin@hundeboll.net>
Received: from mail.hundeboll.net (mail.hundeboll.net [88.198.92.70])
	by mail.openembedded.org (Postfix) with ESMTP id F400E6E63E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Oct 2014 10:43:28 +0000 (UTC)
Received: from hundeboll.localdomain (5634263f.rev.stofanet.dk [86.52.38.63])
	by mail.hundeboll.net (Postfix) with ESMTPSA id 763731BF393;
	Thu, 30 Oct 2014 11:43:27 +0100 (CET)
From: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@hundeboll.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Oct 2014 11:43:25 +0100
Message-Id: <1414665805-21734-3-git-send-email-martin@hundeboll.net>
X-Mailer: git-send-email 2.1.2
In-Reply-To: <1414665805-21734-1-git-send-email-martin@hundeboll.net>
References: <1414665805-21734-1-git-send-email-martin@hundeboll.net>
MIME-Version: 1.0
Cc: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@hundeboll.net>
Subject: [RFCv2 2/2] scripts: modify environment to use python2 instead
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 30 Oct 2014 10:43:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In distributions where /usr/bin/python points at python3, the check for
python version fails even when python2 is available at /usr/bin/python2.

The usual way to circumvent this is to manually create a fake
environment, where python is a symlink to python2. Since openembedded
already sets up a semi fake environment, we might as well add a python
symlink to this.

This patch adds a check in oe-buildenv-internal, that runs through a
list of possible python names, and check for their existance and
version. Once a compatible version is found, a symlink is created in
./bitbake/bin/python.

If no compatible version is found, an error is printed and
oe-init-build-env fails.

Signed-off-by: Martin Hundebøll <martin@hundeboll.net>
---
 scripts/oe-buildenv-internal | 30 ++++++++++-------------------
 scripts/python-env.sh        | 46 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 56 insertions(+), 20 deletions(-)
 create mode 100755 scripts/python-env.sh

diff --git a/scripts/oe-buildenv-internal b/scripts/oe-buildenv-internal
index bba6f8f..3841ccb 100755
--- a/scripts/oe-buildenv-internal
+++ b/scripts/oe-buildenv-internal
@@ -29,26 +29,6 @@ if [ ! -z "$OECORE_SDK_VERSION" ]; then
     return 1
 fi
 
-# Make sure we're not using python v3.x. This check can't go into
-# sanity.bbclass because bitbake's source code doesn't even pass
-# parsing stage when used with python v3, so we catch it here so we
-# can offer a meaningful error message.
-py_v3_check=`/usr/bin/env python --version 2>&1 | grep "Python 3"`
-if [ "$py_v3_check" != "" ]; then
-	echo >&2 "Bitbake is not compatible with python v3"
-	echo >&2 "Please set up python v2 as your default python interpreter"
-	return 1
-fi
-
-# Similarly, we now have code that doesn't parse correctly with older
-# versions of Python, and rather than fixing that and being eternally
-# vigilant for any other new feature use, just check the version here.
-py_v26_check=`python -c 'import sys; print sys.version_info >= (2,7,3)'`
-if [ "$py_v26_check" != "True" ]; then
-	echo >&2 "BitBake requires Python 2.7.3 or later"
-	return 1
-fi
-
 if [ "x$BDIR" = "x" ]; then
     if [ "x$1" = "x" ]; then
         BDIR="build"
@@ -94,6 +74,16 @@ if ! (test -d "$BITBAKEDIR"); then
     return 1
 fi
 
+# Make sure we're not using python v3.x. This check can't go into
+# sanity.bbclass because bitbake's source code doesn't even pass
+# parsing stage when used with python v3, so we catch it here so we
+# can offer a meaningful error message.
+source ${OEROOT}/scripts/python-env.sh
+if ! env_set_python; then
+    echo "env_set_python failed"
+    return 1
+fi
+
 # Make sure our paths are at the beginning of $PATH
 NEWPATHS="${OEROOT}/scripts:$BITBAKEDIR/bin:"
 PATH=$NEWPATHS$(echo $PATH | sed -e "s|:$NEWPATHS|:|g" -e "s|^$NEWPATHS||")
diff --git a/scripts/python-env.sh b/scripts/python-env.sh
new file mode 100755
index 0000000..d88587e
--- /dev/null
+++ b/scripts/python-env.sh
@@ -0,0 +1,46 @@
+function env_set_python() {
+    # List of possible python executables to check in environment
+    py_names=(python python2 python2.7)
+
+    # Minimum supported python version
+    py_minver="(2,7,3)"
+
+    # Maximum supported python version
+    py_maxver="(2,9,9)"
+
+    # For each python name listed abobe
+    for py_name in ${py_names[@]}; do
+        # Get the full path from the shell environment
+        py=$(command -v $py_name)
+
+        # Skip this name if it doesn't exist
+        if [ -z $py ]; then
+            continue
+        fi
+
+        # Skip this name if version is too old
+        minver=$($py_name -c "import sys; print(sys.version_info >= $py_minver)")
+        if [ "$minver" != "True" ]; then
+            continue
+        fi
+
+        # Skip this name if version is too new
+        maxver=$($py_name -c "import sys; print(sys.version_info <= $py_maxver)")
+        if [ "$maxver" != "True" ]; then
+            continue
+        fi
+
+        # Found a compatible python name. Install it in the environment
+        echo Setting $py as python env
+        ln -sf $py $BITBAKEDIR/bin/python
+
+        # Return with success
+        return 0
+    done
+
+    # None of the listed python name were usable. Complain and exit with error
+    echo >&2 "No compatible python interpreter was found."
+    echo >&2 "Please install python v2 and make sure it is available in your $$PATH"
+
+    return 1
+}
-- 
2.1.2


