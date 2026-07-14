Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC0DFC43458
	for <webhook@archiver.kernel.org>; Tue, 14 Jul 2026 20:26:04 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3237.1784060761117345248
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jul 2026 13:26:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=CyhImaZH;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-20260714202557667750bee70002078c-8oxofm@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20260714202557667750bee70002078c
        for <openembedded-core@lists.openembedded.org>;
        Tue, 14 Jul 2026 22:25:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=61XvBwFnUWw5HdeTzMWOwCc2rwm62KggiZOLXWTnfr0=;
 b=CyhImaZHSHbeFPN0dIo7gF2rJTI7xJukgto6TuerK/SQ/eyxR94ECduv1ahkw9oAny/iRw
 kO7qiobO+Tj314H73oY/rXqYfHxBcUaK8CYlzJg12rrDahCsCEGj26Hhkz2uo0cTzDpqxIga
 KlkNT8nqy+4jpU9nWoHIynO+KNnUfBkNDQWbc+WV8DCEdIKTeLnE/LXcGODq+YKBnvLmZo0z
 uQUZzWnC6U3XvAd1ijynBZHXIA82XA79j8Wcv5l6NBG/m4CMuSJWoXq95Ut5dCnOn+01WwFz
 eyYcO4XsAJrq3sKWPYXxkSIGHt1GtcSJvjdNvLbQRnLb+CjBw8zQ812Q==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [scarthgap][PATCH] socat: patch CVE-2026-56123
Date: Tue, 14 Jul 2026 22:25:22 +0200
Message-ID: <20260714202524.30706-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Jul 2026 20:26:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240931

From: Peter Marko <peter.marko@siemens.com>

Pick the only commit in release 1.8.1.2.
This release has a note for this CVE which was added by this commit.

Drop change in VERSION file (as we're not upgrading).
Resolve minor conflicts in CHANGES and test.sh.

Since we're not running tests, it's not worth to pick next commit from
1.8.1.3 which is fixing test on non-bash shell systems.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../socat/files/CVE-2026-56123.patch          | 150 ++++++++++++++++++
 .../socat/socat_1.8.0.0.bb                    |   1 +
 2 files changed, 151 insertions(+)
 create mode 100644 meta/recipes-connectivity/socat/files/CVE-2026-56123.patch

diff --git a/meta/recipes-connectivity/socat/files/CVE-2026-56123.patch b/meta/recipes-connectivity/socat/files/CVE-2026-56123.patch
new file mode 100644
index 00000000000..e2552a74451
--- /dev/null
+++ b/meta/recipes-connectivity/socat/files/CVE-2026-56123.patch
@@ -0,0 +1,150 @@
+From d44cd1cc4fbb70a9ae9e71890024ae8367fcb912 Mon Sep 17 00:00:00 2001
+From: Gerhard Rieger <gerhard@dest-unreach.org>
+Date: Thu, 25 Jun 2026 14:55:59 +0200
+Subject: [PATCH] Version 1.8.1.2 - fixed SOCKS5 client buffer overflow
+ (CVE-2026-56123)
+
+CVE: CVE-2026-56123
+Upstream-Status: Backport [repo.or.cz/socat.git/commitdiff/d44cd1cc4fbb70a9ae9e71890024ae8367fcb912]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ CHANGES      | 13 ++++++++++
+ test.sh      | 73 ++++++++++++++++++++++++++++++++++++++++++++++++++++
+ xio-socks5.h |  4 +--
+ 3 files changed, 88 insertions(+), 2 deletions(-)
+
+diff --git a/CHANGES b/CHANGES
+index ba82024..3c2f230 100644
+--- a/CHANGES
++++ b/CHANGES
+@@ -1,4 +1,17 @@
+ ﻿
++Security:
++	Socat security advisory 10
++	CVE-2026-56123
++	There was a possible heap overflow in the socks5 client code. It could
++	be triggered by connecting to a malicious socks5 server that expected
++	this connection and had knowledge about details of the client binary
++	code.
++	Only builds with C signed char (vs.unsigned char) are affected.
++	Thanks to Tristan Madani for finding and reporting this issue, and for
++	conveying the process.
++	Test: SOCKS5_OVERFL
++
++
+ ####################### V 1.8.0.0
+ 
+ Security:
+diff --git a/test.sh b/test.sh
+index 53bbb2a..467ac57 100755
+--- a/test.sh
++++ b/test.sh
+@@ -601,6 +601,9 @@ rm -rf "$TD" || (echo "cannot rm $TD" >&2; exit 1)
+ mkdir -p "$TD"
+ #trap "rm -r $TD" 0 3
+ 
++BINDIR=$td/bin
++mkdir -p $BINDIR
++
+ echo "Using temp directory $TD"
+ 
+ case "$TESTS" in
+@@ -19217,6 +19220,76 @@ fi # NUMCOND
+ esac
+ N=$((N+1))
+ 
++# Above tests introduced with 1.8.1.0 (none with 1.8.1.1)
++#==============================================================================
++# Below tests introduced with 1.8.1.2
++
++
++# Test socks5 client buffer overflow (CVE-2026-56123)
++NAME=SOCKS5_OVERFL
++case "$TESTS" in
++*%$N%*|*%functions%*|*%bugs%*|*%security%*|*%socks5%*|*%socks%*|*%%*|*%%*|*%socket%*|*%$NAME%*)
++#*%internet%*|*%root%*|*%listen%*|*%fork%*|*%ip4%*|*%tcp4%*|*%bug%*|...
++TEST="$NAME: socks5 client buffer overflow"
++# Start a listener that emulates a malicious socks5 server, using a temporary
++# shell script;
++# connect using Socat with socks5 client;
++# when is terminates with rc=0 the test succeeded (not vulnerable)
++if ! eval $NUMCOND; then :
++# Check if this test can be performed meaningfully
++elif ! cond=$(checkconds \
++		  "" \
++		  "" \
++		  "" \
++		  "IP4 TCP LISTEN SHELL GOPEN SOCKS5" \
++		  "TCP4-LISTEN SHELL GOPEN SOCKS5" \
++		  "socksport" \
++		  "tcp4" ); then
++    $PRINTF "test $F_n $TEST... ${YELLOW}$cond${NORMAL}\n" $N
++    cant
++else
++    mkdir -p "$BINDIR"
++    tf="$td/test$N.stdout"
++    te="$td/test$N.stderr"
++    tdiff="$td/test$N.diff"
++    tsh="$BINDIR/test$N.sh"
++    cat >"$tsh" <<__EOF__
++$ECHO -n "\\x05\\x00"
++relsleep 1
++$ECHO -n "\\x05\\x00\\x00\\x03\\xfdAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
++__EOF__
++    chmod a+x "$tsh"
++    newport tcp4 	# -> PORT
++    CMD0="$TRACE $SOCAT $opts TCP4-LISTEN:$PORT SHELL:$tsh"
++    CMD1="$TRACE $SOCAT $opts /dev/null SOCKS5:$LOCALHOST4:17.34.51.68:85,socksport=$PORT"
++    printf "test $F_n $TEST... " $N
++    $CMD0 >/dev/null 2>"${te}0" &
++    pid0=$!
++    waittcp4port $PORT 1
++    $CMD1 >"${tf}1" 2>"${te}1"
++    rc1=$?
++    kill $pid0 2>/dev/null; wait
++    if [ "$rc1" -ne 0 ]; then
++	$PRINTF "$FAILED (rc1=$rc1)\n"
++	echo "$CMD0 &"
++	cat "${te}0" >&2
++	echo "$CMD1"
++	cat "${te}1" >&2
++	failed
++    else
++	$PRINTF "$OK\n"
++	if [ "$VERBOSE" ]; then echo "$CMD0 &"; fi
++	if [ "$DEBUG" ];   then cat "${te}0" >&2; fi
++	if [ "$VERBOSE" ]; then echo "$CMD1"; fi
++	if [ "$DEBUG" ];   then cat "${te}1" >&2; fi
++	ok
++    fi
++fi # NUMCOND
++ ;;
++esac
++N=$((N+1))
++
++
+ # end of common tests
+ 
+ ##################################################################################
+diff --git a/xio-socks5.h b/xio-socks5.h
+index 4dab76b..d4712d2 100644
+--- a/xio-socks5.h
++++ b/xio-socks5.h
+@@ -23,7 +23,7 @@ struct socks5_request {
+ 	uint8_t command;
+ 	uint8_t reserved;
+ 	uint8_t	address_type;
+-	char	dstdata[];
++	unsigned char dstdata[];
+ };
+ 
+ struct socks5_reply {
+@@ -31,7 +31,7 @@ struct socks5_reply {
+ 	uint8_t reply;
+ 	uint8_t reserved;
+ 	uint8_t address_type;
+-	char	dstdata[];
++	unsigned char dstdata[];
+ };
+ 
+ extern const struct addrdesc xioaddr_socks5_connect;
diff --git a/meta/recipes-connectivity/socat/socat_1.8.0.0.bb b/meta/recipes-connectivity/socat/socat_1.8.0.0.bb
index bb39730005a..156fd590aee 100644
--- a/meta/recipes-connectivity/socat/socat_1.8.0.0.bb
+++ b/meta/recipes-connectivity/socat/socat_1.8.0.0.bb
@@ -12,6 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 SRC_URI = "http://www.dest-unreach.org/socat/download/socat-${PV}.tar.bz2 \
            file://0001-fix-compile-procan.c-failed.patch \
            file://CVE-2024-54661.patch \
+           file://CVE-2026-56123.patch \
 "
 
 SRC_URI[sha256sum] = "e1de683dd22ee0e3a6c6bbff269abe18ab0c9d7eb650204f125155b9005faca7"

