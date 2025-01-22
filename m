Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F5B5C02182
	for <webhook@archiver.kernel.org>; Wed, 22 Jan 2025 03:03:37 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web11.34191.1737515015358302138
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jan 2025 19:03:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=V/lAQUws;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.42, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2eed82ca5b4so10991192a91.2
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Jan 2025 19:03:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1737515015; x=1738119815; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2bS3EnvPtqdujFy/QmD8f38Tj/M2eblVWJ+Kw4kfxzE=;
        b=V/lAQUws7k/bDgtMjbw5CqMZplvURPA3ljsMFVsUHbOcYdfSdbHIYkMdUb312rX14c
         Fgurdt/ajHVJC8AnoXyrqvuNqF9uLeoIZy1b20f7jXnymqIfVrh6WaSE1Ed+sqjmwFjH
         H7JXwFoyjhSkSGurmSP6eLRg0aEchKEXg+73mkkcGiUJp+b1mAraSkyNEeE21O+lR9le
         80bcWtY/rg6xwNQPtOGOG86qO7GbuLIfVGZc5xAAAQO6wVUMcK+LcdKgVI/lnCSVGZ+M
         3n7LvkMcOb6Ln+F9mJd/yTHnj0Zx01CdhzDpo/cDKtAQGAJZPRSSATh2Lv2pHM4rna9/
         PdxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737515015; x=1738119815;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2bS3EnvPtqdujFy/QmD8f38Tj/M2eblVWJ+Kw4kfxzE=;
        b=u47U2VZ+VIdn7Ku0UOMysTfu96toxssoewoHrnR14oW9RlrDVW2R/NFMrQIbXF8yJx
         rUQOVTHfntCmktWHQF/uH3OXyBCpg0goGC8yCesUnPgii7nM2Pv4VhwbMxW7FSRxXspI
         BHox3Ng/HeZUczIqwAzedQ9uW3dXOfj3EzH8QV5wnzFq26iNMTqccymTDOIAEGIM6lTe
         RbAcMcE7UJdSr6Bpmwl6yxhdYNPIvpvtVTdqlhsatgI3mA84n6setZ91YDL9QdNi68XD
         YFZ4x9vlM0/gw+wXUtAppLayaDJo2f3+0ktHche72v7P+wDWqd3Lrn38ScEuYiLSGjIk
         Gcrw==
X-Gm-Message-State: AOJu0Yw0iXg4Xz/1RnS3PQ+dtdpB20CUfDMf9uMhb2joEH8BbNwKhtU6
	MJB6s3EvcnGP/NGl4MPPO+kUN6oC1zN7clIdK41y2vO1OwV41jJ5U0RmoK6WLxkLgPVK7hyrsvj
	pzgo=
X-Gm-Gg: ASbGncv1yZBK4vzXzivdql0sgnj8RPVui5iHN/lFuvXbQOqsM60zvwULwnStlt1Apwu
	5WbRudAupJQRyv7jtAyNUAqINXOJTHXY5TLTFT0B1oS9DFc10MgzM7TYocelsdzV6SrxYRFsSj7
	/4s7JQh/EDZOiF1hwBU6wVIsOKJwUQqjjRxT1etMQC9JQP6sBH4FXlT0ed3nkyCGi/I0sjxaytJ
	xYKUAetMIg0u2A/EdLM0711LFr90GzsMZLYH7wfsnOM8sN0TKODPqhkDgM=
X-Google-Smtp-Source: AGHT+IHcTXNIdkP+8Vx4iiZfv+wvqQNpuWkBfJ1pniIUGEd3Q8tLkobUW1sS88PbCPnzIEdBoPHhKw==
X-Received: by 2002:a05:6a00:a95:b0:72d:8fa2:9998 with SMTP id d2e1a72fcca58-72dafa44feamr30439186b3a.14.1737515014673;
        Tue, 21 Jan 2025 19:03:34 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72dab8112c1sm9800337b3a.37.2025.01.21.19.03.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 19:03:34 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 04/14] socat: patch CVE-2024-54661
Date: Tue, 21 Jan 2025 19:03:00 -0800
Message-ID: <efa7a5e5a8448ae52152ee8ebbf5c51d691a34d2.1737514842.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1737514842.git.steve@sakoman.com>
References: <cover.1737514842.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jan 2025 03:03:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210118

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


