Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 7F8DB73CBD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Sep 2015 15:57:57 +0000 (UTC)
Received: by wiclk2 with SMTP id lk2so147121685wic.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Sep 2015 08:57:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=Wtcz+oDTYJaeqJnAkVsO4TCk5GJwQQkgsgvgMcMhBw4=;
	b=PQtrCT5fRZWLUhdeMH8vQ4dNHX+zATz1ds+hWUWHue4fmQf9SGBRdIXrTxh0Dxu4GL
	1Rkb7eQGY0tp95k33HG8a2D7YuFsqUZAJHTjCD9X4024P5MGmhETeL/kI4afBpXKM76o
	AULvNznCskQitgPJbHtWksefKh7rrYTFkF6+10wDTx450GSLjGRPrcMmFh4JCUqL1poc
	1bhL9SoxL4jzKDp9nnULVRUWYLCe1kqsvSVLoLbw6OZ5UDT0ALtL9KgvS3URWC2YXqMe
	CnUmNIcG2GfHKmk0XbKi5OFpTGT6yb2xyZ/ds0CiGsF+6TCm2aK8V2RCcWFGqtlRPvcS
	1ofw==
X-Gm-Message-State: ALoCoQmq9keQavCycX//V2ygzeldydjk1QWcfiPjy35Z0L1jklBXlpL3npkcUU4ziPtz+JUQDcH3
X-Received: by 10.180.89.101 with SMTP id bn5mr26709661wib.20.1442246277089;
	Mon, 14 Sep 2015 08:57:57 -0700 (PDT)
Received: from localhost.localdomain (94.197.121.81.threembb.co.uk.
	[94.197.121.81]) by smtp.gmail.com with ESMTPSA id
	cm6sm15023675wib.22.2015.09.14.08.57.55
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 14 Sep 2015 08:57:56 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Sep 2015 16:57:47 +0100
Message-Id: <1442246267-35258-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.3.2 (Apple Git-55)
Subject: [PATCH] glibc: don't require bash for nscd init script
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
X-List-Received-Date: Mon, 14 Sep 2015 15:58:00 -0000

The nscd init script uses #! /bin/bash but only really uses one bashism
(translated strings), so remove them and switch the shell to #! /bin/sh.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/glibc/glibc/nscd-no-bash.patch | 61 ++++++++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.22.bb            |  1 +
 2 files changed, 62 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/nscd-no-bash.patch

diff --git a/meta/recipes-core/glibc/glibc/nscd-no-bash.patch b/meta/recipes-core/glibc/glibc/nscd-no-bash.patch
new file mode 100644
index 0000000..c306ce6
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/nscd-no-bash.patch
@@ -0,0 +1,61 @@
+Don't use bashisms (except for echo -n, which busybox supports) to avoid needing bash to start nscd.
+
+Upstream-Status: Pending
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+diff --git a/nscd/nscd.init b/nscd/nscd.init
+index a882da7..b02986e 100644
+--- a/nscd/nscd.init
++++ b/nscd/nscd.init
+@@ -1,4 +1,4 @@
+-#!/bin/bash
++#!/bin/sh
+ #
+ # nscd:		Starts the Name Switch Cache Daemon
+ #
+@@ -49,7 +49,7 @@ prog=nscd
+ start () {
+     [ -d /var/run/nscd ] || mkdir /var/run/nscd
+     [ -d /var/db/nscd ] || mkdir /var/db/nscd
+-    echo -n $"Starting $prog: "
++    echo -n "Starting $prog: "
+     daemon /usr/sbin/nscd
+     RETVAL=$?
+     echo
+@@ -58,7 +58,7 @@ start () {
+ }
+ 
+ stop () {
+-    echo -n $"Stopping $prog: "
++    echo -n "Stopping $prog: "
+     /usr/sbin/nscd -K
+     RETVAL=$?
+     if [ $RETVAL -eq 0 ]; then
+@@ -67,9 +67,9 @@ stop () {
+ 	# a non-privileged user
+ 	rm -f /var/run/nscd/nscd.pid
+ 	rm -f /var/run/nscd/socket
+-       	success $"$prog shutdown"
++	success "$prog shutdown"
+     else
+-       	failure $"$prog shutdown"
++	failure "$prog shutdown"
+     fi
+     echo
+     return $RETVAL
+@@ -103,13 +103,13 @@ case "$1" in
+ 	RETVAL=$?
+ 	;;
+     force-reload | reload)
+-    	echo -n $"Reloading $prog: "
++	echo -n "Reloading $prog: "
+ 	killproc /usr/sbin/nscd -HUP
+ 	RETVAL=$?
+ 	echo
+ 	;;
+     *)
+-	echo $"Usage: $0 {start|stop|status|restart|reload|condrestart}"
++	echo "Usage: $0 {start|stop|status|restart|reload|condrestart}"
+ 	RETVAL=1
+ 	;;
+ esac
diff --git a/meta/recipes-core/glibc/glibc_2.22.bb b/meta/recipes-core/glibc/glibc_2.22.bb
index f0e1fad..09f0428 100644
--- a/meta/recipes-core/glibc/glibc_2.22.bb
+++ b/meta/recipes-core/glibc/glibc_2.22.bb
@@ -38,6 +38,7 @@ SRC_URI = "${GLIBC_GIT_URI};branch=${BRANCH};name=glibc \
            file://0025-eglibc-Install-PIC-archives.patch \
            file://0026-eglibc-dl_debug_mask-is-controlled-by-__OPTION_EGLIB.patch \
            file://0027-eglibc-use-option-groups-Conditionally-exclude-c-tes.patch \
+           file://nscd-no-bash.patch \
 "
 
 SRC_URI += "\
-- 
2.3.2 (Apple Git-55)


