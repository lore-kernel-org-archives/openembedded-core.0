Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 69E5C6A8D1
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jun 2013 17:18:05 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r57HNAjM002438 for <openembedded-core@lists.openembedded.org>;
	Fri, 7 Jun 2013 18:23:10 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id l3pEmS0GHlwO
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jun 2013 18:23:10 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r57HN3SE002432
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Fri, 7 Jun 2013 18:23:05 +0100
Message-ID: <1370625469.6864.62.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 07 Jun 2013 18:17:49 +0100
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] scripts/bitbake: Drop horrible double execution mess
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
X-List-Received-Date: Fri, 07 Jun 2013 17:18:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

There is no longer anything of value in the bitbake wrapper script since pseudo
is handled by bitbake internally. We can therefore drop it (yay).

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/scripts/bitbake b/scripts/bitbake
deleted file mode 100755
index dde61c4..0000000
--- a/scripts/bitbake
+++ /dev/null
@@ -1,125 +0,0 @@
-#!/bin/sh
-
-# This is the bitbake wrapper script that ensures everything is set up
-# correctly in the environment, builds pseudo separately if it hasn't
-# already been built, and then runs bitbake within pseudo.
-
-export BBFETCH2=True
-export BB_ENV_EXTRAWHITE="PSEUDO_BUILD PSEUDO_DISABLED $BB_ENV_EXTRAWHITE"
-
-# For certain operations (i.e. that won't be actually running any tasks)
-# we don't need pseudo
-NO_BUILD_OPTS="--version -h --help -p --parse-only -s --show-versions -e --environment -g --graphviz"
-
-# Some options are useful to pass through to the initial pseudo build if
-# that needs to be run (for debugging)
-PASSTHROUGH_OPTS="-D -DD -DDD -DDDD -v"
-
-needpseudo="1"
-for opt in $@; do
-for key in $NO_BUILD_OPTS; do
-    if [ $opt = $key ]
-    then
-        needpseudo="0"
-        break
-    fi
-done
-[ $needpseudo = "0" ] && break
-done
-
-if [ ! -e conf/bblayers.conf ] ; then
-    BDPRINT=""
-    [ -n "$BUILDDIR" ] && BDPRINT=": $BUILDDIR"
-    echo "Unable to find conf/bblayers.conf"
-    echo "BitBake must be run from within your build directory$BDPRINT"
-    exit 1
-elif [ -z "$BUILDDIR" ] ; then
-    BUILDDIR="`pwd`"
-fi
-
-buildpseudo="1"
-if [ $needpseudo = "1" ]; then
-    if [ -e "$BUILDDIR/pseudodone" ]; then
-        PSEUDOBINDIR=`cat $BUILDDIR/pseudodone`
-    else
-        PSEUDOBINDIR=`bitbake -e | grep STAGING_BINDIR_NATIVE=\" | cut -d '=' -f2 | cut -d '"' -f2`
-    fi
-    if [ -e "$PSEUDOBINDIR/pseudo" ]; then
-        buildpseudo="0"
-    fi
-
-    # Verify that the pseudo recipes are older then the pseudodone file
-    PSEUDO_RECIPE="`dirname $0`/../meta/recipes-devtools/pseudo"
-    if [ $buildpseudo -eq 0 ] && [ ! -d "$PSEUDO_RECIPE" ]; then
-        echo "Unable to verify if pseudo-native is up to date..." >&2
-    elif [ $buildpseudo -eq 0 ]; then
-	PSEUDO_NEWER=`find $PSEUDO_RECIPE -type f -newer $BUILDDIR/pseudodone`
-	if [ -n "$PSEUDO_NEWER" ]; then
-            buildpseudo="2"
-	fi
-    fi
-    if [ $buildpseudo = "0" -a ! -e "$BUILDDIR/pseudodone" ] ; then
-        echo $PSEUDOBINDIR > $BUILDDIR/pseudodone
-    fi
-fi
-
-
-if [ $needpseudo = "0" ]; then
-    buildpseudo="0"
-fi
-
-# If pseudo-native is an argument, assume the user wants to build pseudo-native!
-if [ $needpseudo != "0" -a $buildpseudo -eq 0 ]; then
-    for opt in $@; do
-        if [ "$opt" = "pseudo-native" ]; then
-            buildpseudo="3"
-            break
-        fi
-    done
-fi
-
-OLDPATH=$PATH
-export PATH=`echo $PATH | sed s#[^:]*/scripts:##g`
-if [ $buildpseudo -gt 0 ]; then
-    [ $buildpseudo -eq 1 ] && echo "Pseudo is not present but is required, building this first before the main build"
-    [ $buildpseudo -eq 2 ] && echo "Pseudo may be out of date, rebuilding pseudo before the main build"
-    [ $buildpseudo -eq 3 ] && echo "Building pseudo-native before main build"
-    export PSEUDO_BUILD=1
-
-    # Pass through debug options
-    additionalopts=""
-    for opt in $@; do
-        for key in $PASSTHROUGH_OPTS; do
-            if [ $opt = $key ]
-            then
-                additionalopts="$additionalopts $opt"
-                break
-            fi
-        done
-    done
-
-    bitbake pseudo-native $additionalopts -c populate_sysroot
-    ret=$?
-    if [ "$ret" != "0" ]; then
-        exit 1
-    fi
-    PSEUDOBINDIR=`bitbake -e | grep STAGING_BINDIR_NATIVE=\" | cut -d '=' -f2 | cut -d '"' -f2`
-    ret=$?
-    if [ "$ret" != "0" ]; then
-        exit 1
-    fi
-    echo $PSEUDOBINDIR > $BUILDDIR/pseudodone
-    # This needs to exist in case pseudo has to log somewhere
-    mkdir -p $PSEUDOBINDIR/../../var/pseudo
-fi
-BITBAKE=`which bitbake`
-export PATH=$OLDPATH
-if [ $needpseudo = "1" ]; then
-    export PSEUDO_BUILD=2
-    PSEUDO_BINDIR=$PSEUDOBINDIR PSEUDO_LIBDIR=$PSEUDOBINDIR/../lib/pseudo/lib PSEUDO_PREFIX=$PSEUDOBINDIR/../../ PSEUDO_DISABLED=1 $PSEUDOBINDIR/pseudo $BITBAKE $@
-else
-    export PSEUDO_BUILD=0
-    $BITBAKE $@
-fi
-ret=$?
-exit $ret



