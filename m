Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66811C02183
	for <webhook@archiver.kernel.org>; Thu, 16 Jan 2025 22:26:35 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web11.5565.1737066393023597143
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jan 2025 14:26:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=tEkWliX9;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-2025011622263004726479e6bc6eaa92-_ip7lr@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 2025011622263004726479e6bc6eaa92
        for <openembedded-core@lists.openembedded.org>;
        Thu, 16 Jan 2025 23:26:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=deU6UlV0nYRqy3DOZKllEA/2n1kmRZQOG5cDk6ngqes=;
 b=tEkWliX9COKnRcqDjJ2Vaw5ifvJBl05cheij5ICBEe6F9egzr/PDIbQqI+caV3eNxiphJf
 KmyuR1lmY+2bWrq9EvyUjeEt+PtJMGshRQV1dGucUC+Vn64Zqr6X+y02lTTavHLXXOxwbXRM
 RO7kGxDo+CzwAecHx1b7j4Pc2pM6sB/IhZ2cgTUuw65mCL2/93LZTTHq+CSlyjru5q15rSzN
 UA+xn4vrWNsKP5Xe4toR5TQWJH2VcgXElTPljuoSRcpZjtO7UsdMjD+JK/9be2Kc8Q9y9uLO
 I4vqVb0evh0norsA0kVJkJetF0H5IRhvtPp9E+Er0IDZTxqLO7C/awGg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH] socat: patch CVE-2024-54661
Date: Thu, 16 Jan 2025 23:25:42 +0100
Message-Id: <20250116222542.247381-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Jan 2025 22:26:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209971

From: Peter Marko <peter.marko@siemens.com>

Picked upstream commit
https://repo.or.cz/socat.git/commitdiff/4ee1f31cf80019c5907876576d6dfd49368d660f

Since this was the only commit in 1.8.0.2 it also contained release
changes which were dropped.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../socat/socat/CVE-2024-54661.patch          | 113 ++++++++++++++++++
 .../socat/socat_1.7.4.4.bb                    |   4 +-
 2 files changed, 116 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/socat/socat/CVE-2024-54661.patch

diff --git a/meta/recipes-connectivity/socat/socat/CVE-2024-54661.patch b/meta/recipes-connectivity/socat/socat/CVE-2024-54661.patch
new file mode 100644
index 0000000000..d1ac148cbd
--- /dev/null
+++ b/meta/recipes-connectivity/socat/socat/CVE-2024-54661.patch
@@ -0,0 +1,113 @@
+From 4ee1f31cf80019c5907876576d6dfd49368d660f Mon Sep 17 00:00:00 2001
+From: Gerhard Rieger <gerhard@dest-unreach.org>
+Date: Fri, 6 Dec 2024 11:42:09 +0100
+Subject: [PATCH] Version 1.8.0.2 - CVE-2024-54661: Arbitrary file overwrite in
+ readline.sh
+
+CVE: CVE-2024-54661
+Upstream-Status: Backport [https://repo.or.cz/socat.git/commitdiff/4ee1f31cf80019c5907876576d6dfd49368d660f]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ readline.sh | 10 +++++++--
+ test.sh     | 63 +++++++++++++++++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 71 insertions(+), 2 deletions(-)
+
+diff --git a/readline.sh b/readline.sh
+index b6f8438..1045303 100755
+--- a/readline.sh
++++ b/readline.sh
+@@ -22,9 +22,15 @@ if [ "$withhistfile" ]; then
+ else
+     HISTOPT=
+ fi
+-mkdir -p /tmp/$USER || exit 1
+ #
+ #
+ 
+-exec socat -d readline"$HISTOPT",noecho='[Pp]assword:' exec:"$PROGRAM",sigint,pty,setsid,ctty,raw,echo=0,stderr 2>/tmp/$USER/stderr2
++if test -w .; then
++    STDERR=./socat-readline.${1##*/}.log
++    rm -f $STDERR
++else
++    STDERR=/dev/null
++fi
++
++exec socat -d readline"$HISTOPT",noecho='[Pp]assword:' exec:"$PROGRAM",sigint,pty,setsid,ctty,raw,echo=0,stderr 2>$STDERR
+ 
+diff --git a/test.sh b/test.sh
+index 46bebf8..5204ac7 100755
+--- a/test.sh
++++ b/test.sh
+@@ -15657,6 +15657,69 @@ esac
+ N=$((N+1))
+ 
+ 
++# Test the readline.sh file overwrite vulnerability
++NAME=READLINE_SH_OVERWRITE
++case "$TESTS" in
++*%$N%*|*%functions%*|*%bugs%*|*%readline%*|*%security%*|*%$NAME%*)
++TEST="$NAME: Test the readline.sh file overwrite vulnerability"
++# Create a symlink /tmp/$USER/stderr2 pointing to a temporary file,
++# run readline.sh
++# When the temporary file is kept the test succeeded
++if ! eval $NUMCOND; then :
++elif ! cond=$(checkconds \
++		  "" \
++		  "" \
++		  "readline.sh" \
++		  "" \
++		  "" \
++		  "" \
++		  "" ); then
++    $PRINTF "test $F_n $TEST... ${YELLOW}$cond${NORMAL}\n" $N
++    numCANT=$((numCANT+1))
++    listCANT="$listCANT $N"
++    namesCANT="$namesCANT $NAME"
++else
++    tf="$td/test$N.file"
++    te="$td/test$N.stderr"
++    tdiff="$td/test$N.diff"
++    da="test$N $(date) $RANDOM"
++    echo "$da" >"$tf"
++    ln -sf "$tf" /tmp/$USER/stderr2
++    CMD0="readline.sh cat"
++    printf "test $F_n $TEST... " $N
++    $CMD0 </dev/null >/dev/null 2>"${te}0"
++    rc0=$?
++#    if [ "$rc0" -ne 0 ]; then
++#	$PRINTF "$CANT (rc0=$rc0)\n"
++#	echo "$CMD0"
++#	cat "${te}0" >&2
++#	numCANT=$((numCANT+1))
++#	listCANT="$listCANT $N"
++#	namesCANT="$namesCANT $NAME"
++#    elif ! echo "$da" |diff - "$tf" >$tdiff; then
++    if ! echo "$da" |diff - "$tf" >$tdiff; then
++	$PRINTF "$FAILED (diff)\n"
++	echo "$CMD0 &"
++	cat "${te}0" >&2
++	echo "// diff:" >&2
++	cat "$tdiff" >&2
++	numFAIL=$((numFAIL+1))
++	listFAIL="$listFAIL $N"
++	namesFAIL="$namesFAIL $NAME"
++    else
++	$PRINTF "$OK\n"
++	if [ "$VERBOSE" ]; then echo "$CMD0 &"; fi
++	if [ "$DEBUG" ];   then cat "${te}0" >&2; fi
++	if [ "$VERBOSE" ]; then echo "$CMD1"; fi
++	if [ "$DEBUG" ];   then cat "${te}1" >&2; fi
++	numOK=$((numOK+1))
++	listOK="$listOK $N"
++    fi
++fi # NUMCOND
++ ;;
++esac
++N=$((N+1))
++
+ # end of common tests
+ 
+ ##################################################################################
+-- 
+2.30.2
+
diff --git a/meta/recipes-connectivity/socat/socat_1.7.4.4.bb b/meta/recipes-connectivity/socat/socat_1.7.4.4.bb
index 5a379380d1..86ca5879be 100644
--- a/meta/recipes-connectivity/socat/socat_1.7.4.4.bb
+++ b/meta/recipes-connectivity/socat/socat_1.7.4.4.bb
@@ -9,7 +9,9 @@ LICENSE = "GPL-2.0-with-OpenSSL-exception"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://README;beginline=257;endline=287;md5=82520b052f322ac2b5b3dfdc7c7eea86"
 
-SRC_URI = "http://www.dest-unreach.org/socat/download/socat-${PV}.tar.bz2"
+SRC_URI = "http://www.dest-unreach.org/socat/download/socat-${PV}.tar.bz2 \
+           file://CVE-2024-54661.patch \
+          "
 
 SRC_URI[sha256sum] = "fbd42bd2f0e54a3af6d01bdf15385384ab82dbc0e4f1a5e153b3e0be1b6380ac"
 
-- 
2.30.2


