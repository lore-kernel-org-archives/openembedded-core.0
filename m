Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25964C02182
	for <webhook@archiver.kernel.org>; Mon, 20 Jan 2025 17:51:15 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.42239.1737395473432689958
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jan 2025 09:51:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=DkRU/8Dt;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2163b0c09afso85540565ad.0
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Jan 2025 09:51:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1737395473; x=1738000273; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=isaZ67ycp3pXabfYFTxWCslCZFn4kQUPK4GQeViT6do=;
        b=DkRU/8Dt+tq4GAMIhGlBWKqj8NCZyyXBZSczHAwM/QG96N1BeSfZZ0Z4cXbiHlg5Ju
         8KKrHkPawQGRChAxRBh5dR2aLxDxUTiFfHHatwjP4u4HYyNBLDLvMmZP0Yq7yh52R+16
         g8WLV43ljbwLllV9xi4MIFQnPndNLcfYzJJcnaSSQT95azYr5fksWJqw3qhjQJBk28jm
         n8+/hUkBSbb4YGwFdr5AhiOkKad+kS/a9ujeDgzZLwVhLqjLjWdM7LDgNltmElEIGuA/
         928L5GKE2dLEWZFpbf8YMLIOQfce8pu7Y3IllarxlpVTxGrboUHD+KZ6uk9F9hXDv1qr
         eNrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737395473; x=1738000273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=isaZ67ycp3pXabfYFTxWCslCZFn4kQUPK4GQeViT6do=;
        b=bE5TUjVvzsg2OqIq9WE0+BZdm7SIL5JYPNZuVF5Adk+SnsgcBaW1oOUjdXC23bbjmu
         29MsYAPpvYE3NhpaqYwumxQV+1hZSj9fXqSOQazUJiWMIUVp0Cj0/CMGuc1ytTxig44W
         ghMBcnwY7jYMzlQixwTXP1QT230IEbQQmuzRtbf2TqjmaW5a49084Szmn1ujATl8yzyH
         rps2PmJdfMsyPlTbadhliSe0VQxBCzzbjkLWgbX9Nw8fhFJT7BRykQ1R0+HrME116Wkj
         /NXFh7dI/NlZnrB/3pwm90YdGrqSMiYLnM0Z/qB2eCHHT7KyO5Gom+QMEtRO/KoR3CJn
         APjw==
X-Gm-Message-State: AOJu0YzXgDPkZk+mY1+IwLpTGQXIKIhbgfaIfsfl66paXkYsbg+43jm2
	RyvqhEqPo43KriZFWEj0fY0NmIZZASAdAoEYxBizcQJ1+URY95jmQISsnyo0NGN5sQr4RbJ2zGQ
	0oHU=
X-Gm-Gg: ASbGncuh1aXPSy6imV7qKul4EMVRyup9jSRYImohX0nXCZJG41gUeIfuxv1Tbc/hst7
	RcHPbKZnm2ckmzVyxh714DyjSBuC/k7grim0O+VUVZwCA2KPs6M+wUu+ldDodO3WKflLcBMoTYI
	DtGkRM6l3sm9nwffJCY2lHCG1RjGpYpqCzwvIHTWSBlW3632HxKQa93OqDhTn04knhomYoKPfpC
	aqiNyhi01j5SuId8tYsFnb+Y+YlUsnR1V+Dj8wGnatJf9HIC2PEvSrNhL0=
X-Google-Smtp-Source: AGHT+IGcSIVSpOQGB5Np8nFGyqO7m9VBg4EWag2ve0DTIgJyjU993d4N6R+loiz+2E1T0NCkB7HpKw==
X-Received: by 2002:a05:6a00:882:b0:725:e057:c3de with SMTP id d2e1a72fcca58-72dafab0376mr20239377b3a.23.1737395472611;
        Mon, 20 Jan 2025 09:51:12 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-a9bcdcf643esm6155565a12.38.2025.01.20.09.51.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 09:51:12 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 02/16] socat: patch CVE-2024-54661
Date: Mon, 20 Jan 2025 09:50:46 -0800
Message-ID: <aa3187749ae9e04b91ad18be733ce09be63a50db.1737395091.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1737395091.git.steve@sakoman.com>
References: <cover.1737395091.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jan 2025 17:51:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210046

From: Peter Marko <peter.marko@siemens.com>

Picked upstream commit
https://repo.or.cz/socat.git/commitdiff/4ee1f31cf80019c5907876576d6dfd49368d660f

Since this was the only commit in 1.8.0.2 it also contained release
changes which were dropped.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.43.0


