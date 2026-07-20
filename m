Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0C4DC44535
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 17:23:47 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2898.1784568218676869037
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 10:23:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=jr9Dds7/;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4954d383e64so17012325e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 10:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784568217; x=1785173017; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YHEtEe7zaHqJApiyagDbgiIgLLHn6uuRrvv2cMYiya0=;
        b=jr9Dds7/uwmLQGE89vlhMzkauJG7p4j0+XjT7wRJkb/JcQz7cF3G39tOX5oYDDDdNt
         dm6doKDBpHM7eqeIZYBaX5dsRwZAGm11h80O8qcaxq62zo8Tk+zOfGUEpOuZd8IvPjVh
         dfcMuqeSSdOZAkLcmbjyEznAXoGCT+6UN2uMY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784568217; x=1785173017;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YHEtEe7zaHqJApiyagDbgiIgLLHn6uuRrvv2cMYiya0=;
        b=rhjWA1dEjWeP5TLAfNPJqwJyk33gBUJ7CRo8tVcr0lO5DqxXQai4Ff/Oxryd8OZhFw
         CS6/vKK1bWox5r5Lgd5F2jP3WcmTRGTDoEHwmruICIfl0qz8imhsws4/7JZFdyQOIPe9
         tUQAq/VC0lHs72PqxX2Atx+rk8sVJu5cTMSRA/CUqb45nn3tPwRHqBeouSTppy6TheI/
         gQPlGnyvfBScp5vBzw/WFfGEpzIVdf2l5fPBQPY43OEnlL6YoiGoYkCWHa8fLS4ISf3X
         zVjW9ctUQjRPD6YBwwxFp7kVM9qkfhZnZFY33um2tySlm0gzEDpGTPNqxE2dP+/8vxwS
         H9EA==
X-Gm-Message-State: AOJu0YyFCleDBcyeS/IdyFchoDcOXfqbDifraDIdCOvOcC0aJJcUZW49
	nLDxSSJ9aRQaGdm8hVtHYt438mIzYAGIi6ZzV8MH8NI/gnFz1In227BFHQqsCh17r7r1awaZ0vU
	Z/B6cdfw=
X-Gm-Gg: AfdE7cmO1YftsLNxUGwCGDvw+gTMwLFue0qzLrREufXA8Z0BI0Eek/cG15pvT+Y+szj
	sZqjYy4JaH+CJVUlQkjAewc4RS8DVwvMCr5rx6DX+noqoQQtI+CLT50DXJJOnBfnVy6VRdGcNKp
	m/7D7tSPT1a3pt7pL1wvBbGGoERdhuq5bdK2LhfiCJIXZNqNeHfjd6JMGTquA7YK1JgpQwZUNcz
	+Py8BGiuBE4Y7vaf0N/jgLRpAESFIsguEi23d3PahjYdFKIiqkdr2ZNPapOhkoOiN2dth14jXsE
	NRuyBv+lWqu/fGIYtdKV1q6z0x9LslUzp4xFKZMOYcddJ1G6IkQFRclNoMYRNWVAL7dv9ko63Ru
	RzmhyktAcf0oyYEkBYWWnCdB9nA+5/gKUBwsnrKta4YErya+zgccbcJo5K+UW8M9aUUjpGrODO7
	IKCZ2oMI5q8UHjEjafh5ccNad4bRSv5szqwkONFRVT5O0GmqhdD/Yaois71AiidkSNdxpK3T1un
	1rCI1OC
X-Received: by 2002:a05:600c:1c0b:b0:495:46dd:e238 with SMTP id 5b1f17b1804b1-4954a50ea30mr192977535e9.30.1784568216822;
        Mon, 20 Jul 2026 10:23:36 -0700 (PDT)
Received: from localhost.localdomain (2a02-8440-b501-5b7b-2580-caa3-ecc1-dea5.rev.sfr.net. [2a02:8440:b501:5b7b:2580:caa3:ecc1:dea5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49563eee22esm36508575e9.1.2026.07.20.10.23.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 10:23:36 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 14/33] socat: patch CVE-2026-56123
Date: Mon, 20 Jul 2026 19:22:47 +0200
Message-ID: <9d8f5eb7c10c17865b46ccaac03a71054c161219.1784567958.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1784567958.git.yoann.congal@smile.fr>
References: <cover.1784567958.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 17:23:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241448

From: Peter Marko <peter.marko@siemens.com>

Pick the only commit in release 1.8.1.2.
This release has a note for this CVE which was added by this commit.

Drop change in VERSION file (as we're not upgrading).
Resolve minor conflicts in CHANGES and test.sh.

Since we're not running tests, it's not worth to pick next commit from
1.8.1.3 which is fixing test on non-bash shell systems.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
[YC: project git repo seem down. A mirror is here:
https://third-party-mirror.googlesource.com/socat/+/d44cd1cc4fbb70a9ae9e71890024ae8367fcb912%5E%21/ ]
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
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

