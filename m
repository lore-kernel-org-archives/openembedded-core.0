Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A3CBC0218E
	for <webhook@archiver.kernel.org>; Fri, 24 Jan 2025 15:57:14 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web11.15560.1737734226245478179
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jan 2025 07:57:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=UvEtyquk;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2efd81c7ca4so3214500a91.2
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Jan 2025 07:57:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1737734225; x=1738339025; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2bS3EnvPtqdujFy/QmD8f38Tj/M2eblVWJ+Kw4kfxzE=;
        b=UvEtyqukm1v2+zi7n0yu/kMBl4jBaPQlWeHPFRKdxSFttHB5T4Fp+m0ywqTceJkVxA
         eZemTnlT4epOiSCdhCzQ3egVv0SAS+idWVxqXzhynSohiJKpnunhVJnaxt/iB7Fhvtln
         nkOYlb8fz6JkVBb4zl0HtbN8Q0XmNxlnNUSW1Fu+ZjSVH7HAdkqu9h6+2pLfcktxwGzP
         tGC2RTfLCGBATWhGodQMd7rsq+soxXIfNsiiC8cXz6Al0UiLv7DAmzoDn3vQqii30RZx
         /KUzm9TXTmQvr4pls0pPYaNS4ztW/PreCg1mefacPUBd2xnQHQrW+ZJapq3ePmKs2oen
         Vw0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737734225; x=1738339025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2bS3EnvPtqdujFy/QmD8f38Tj/M2eblVWJ+Kw4kfxzE=;
        b=VVreJ9yMfWdpuXmMV1zaiNIXXR941GvnrZRMEQzjX95q/bpnqwlfA1bZ+dookurT5M
         JGJPKwKGGFzOyFt3aYtANuBBEfcUM8uscLYU+b68OdVxiMvJ6CHUVvDgDwQhvduJBfNm
         3c8g7cMaf3fzOC1OnzXfipvHrk/pjepMAZodLpKEpdJ92ua9/by3hJIfW9wyqJUELPdn
         ECn9FqWz8lbSRlL9/ew5RsnshEk05vC9CmqprEUWMbytt86YzHgrJUHSnvKnD2UMwMrx
         C25cMQllNFaJkPbSJIE2kCOoYZqpKA5LI9eyjzKMF5oVpJoHiNC9RQ7aGvcb1A5n7r7r
         PdeA==
X-Gm-Message-State: AOJu0YyhsCrWBCiijexAuhXavlO0jMBK3IzjgjUN/hb5KWFA5ovVZSs2
	IW3Uf7ctIr/05NjqA6CmNra5jZT9KLbLfO78phhDx2SUsQx1dJampLAKeI1/Tgv+VhkVXRdNERq
	BJk0=
X-Gm-Gg: ASbGncsDkM29Scj3bEt3RPhg79TGJSM3uXaflUD7pduGYcjmwn368zVk3GzYOVbIkHC
	ZmK9TPBs+qzC27Y7X8uw1xA645jEgRt1P/LvtYVchNEMC8R5meKG8WYPNN19qeuyF0PofIx8H8t
	OWrFzT4hCcBq4y9/pmbtSFbG2s2sUoraclSeBkXmWBObIxdwI12giZbCtquzBibE2rsGYEx62ui
	+One9X7IjH4cGOcwFbKcPIQj56wcpQ22lUIDEUqYt9uJnO52hV+0OK+dycG4F0TS7sVpA==
X-Google-Smtp-Source: AGHT+IHu0PmfFt5cVX8OMBKhGirW/tGtdVPU1Yeeq9wNC2RJwA4q5LnMNFH2QRDXuspb8nTfRA040w==
X-Received: by 2002:a17:90b:2f4d:b0:2ee:3cc1:793b with SMTP id 98e67ed59e1d1-2f782d3603bmr39460305a91.26.1737734225408;
        Fri, 24 Jan 2025 07:57:05 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7ffaf9e98sm1879168a91.38.2025.01.24.07.57.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 07:57:05 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 1/6] socat: patch CVE-2024-54661
Date: Fri, 24 Jan 2025 07:56:49 -0800
Message-ID: <624b91c23559d7d1bc51ec221331513529853cd2.1737734087.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1737734087.git.steve@sakoman.com>
References: <cover.1737734087.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Jan 2025 15:57:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210228

From: Peter Marko <peter.marko@siemens.com>

Picked upstream commit
https://repo.or.cz/socat.git/commitdiff/4ee1f31cf80019c5907876576d6dfd49368d660f

Since this was the only commit in 1.8.0.2 it also contained release
changes which were dropped.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../socat/files/CVE-2024-54661.patch          | 113 ++++++++++++++++++
 .../socat/socat_1.8.0.0.bb                    |   1 +
 2 files changed, 114 insertions(+)
 create mode 100644 meta/recipes-connectivity/socat/files/CVE-2024-54661.patch

diff --git a/meta/recipes-connectivity/socat/files/CVE-2024-54661.patch b/meta/recipes-connectivity/socat/files/CVE-2024-54661.patch
new file mode 100644
index 0000000000..3bf685ebd9
--- /dev/null
+++ b/meta/recipes-connectivity/socat/files/CVE-2024-54661.patch
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
+@@ -19154,6 +19154,69 @@ esac
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
diff --git a/meta/recipes-connectivity/socat/socat_1.8.0.0.bb b/meta/recipes-connectivity/socat/socat_1.8.0.0.bb
index 912605c95c..bb39730005 100644
--- a/meta/recipes-connectivity/socat/socat_1.8.0.0.bb
+++ b/meta/recipes-connectivity/socat/socat_1.8.0.0.bb
@@ -11,6 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 
 SRC_URI = "http://www.dest-unreach.org/socat/download/socat-${PV}.tar.bz2 \
            file://0001-fix-compile-procan.c-failed.patch \
+           file://CVE-2024-54661.patch \
 "
 
 SRC_URI[sha256sum] = "e1de683dd22ee0e3a6c6bbff269abe18ab0c9d7eb650204f125155b9005faca7"
-- 
2.43.0


