Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5805C7EE2D
	for <webhook@archiver.kernel.org>; Sun, 14 May 2023 16:32:06 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.70168.1684081921297500129
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 May 2023 09:32:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=ohNywVO5;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-64359d9c531so8781767b3a.3
        for <openembedded-core@lists.openembedded.org>; Sun, 14 May 2023 09:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1684081920; x=1686673920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N7ymsqdihMNAnQYBKCrbSTxViDBPZUcqmp9xniQVmLw=;
        b=ohNywVO5BKB6P7tkxj2wAhA9JS4nMMw4r5XkL21/wrUIH8/IO8F29d6RPkSuEn6WKj
         MzJS8EM4Zstfl9HfHp5GbwakSG336hvv8L4BAKDuZZmFvS+DIJAuYPHDEAoslljnjfbb
         w1PpVflTRVh84yhAJGqV3XO5EJ90rTeaemKt1mm259sF4d3AvQpVG6mh2FVACdJ/KSpN
         mh5HRWLhLcFqvJTfx6ZN/pXZ8KGv+AzRDWfdHxShleJPEbrEKoBxN2G0CBQ9V2xf297N
         ps6FqKx5P9GkwvAsgH6AK56/XFMb/qCA0W6xAbsZcEhyGIWELDY5ZuJsrK1AljClgn09
         M9tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684081920; x=1686673920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N7ymsqdihMNAnQYBKCrbSTxViDBPZUcqmp9xniQVmLw=;
        b=bQvyWYreP0AN/m+AqPhhOMDG6QGaTLQCzcUhwFncXm5/npN5aC7rt35JSHwFXQDbAG
         P6cAFNMnGtCFer1qeYeUfBgCteX23RgYIIWhtMwEKg9s2oCifsPQ46RlekAS8sEbOpJh
         s9l67DRF4GIpXjxcqQ5Ia9ZuNfRLxplzppNM5UzDuxndj32V5eIK36T79mEuxCXAs8Ck
         jwEfXUjdcjlzmfXpm3pEOqdcUyyp1h0i/yaUPCkXIs0qOjXQDOQAZB0t3tw9HkYIAN3T
         sg7ZyM7KRDGI9XgaWRJHP2ogKx+2XOPdlAd4s15vHZU/jZSBRtglALwrvpRAvDBJIvXa
         iKQg==
X-Gm-Message-State: AC+VfDx76JNopUxuvgVYVDJC4gAOQnkJt+EZWEEodZquvu5WQ9vcZK41
	WKQzq29mlJZvolT5SK+KK5jyyGbOaabsCK8wleo=
X-Google-Smtp-Source: ACHHUZ5MfV5sy12WnOb4bJiUBXAQyX8so2TMhzYcTXYUFzeCwb7NlXS25SLsiZ8fu3JTScaY7atEDA==
X-Received: by 2002:a05:6a00:a82:b0:646:e11c:f602 with SMTP id b2-20020a056a000a8200b00646e11cf602mr26154777pfl.0.1684081920195;
        Sun, 14 May 2023 09:32:00 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id x14-20020aa784ce000000b006475f831838sm981877pfn.30.2023.05.14.09.31.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 May 2023 09:31:59 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 08/15] gawk: Add skipped.txt to emit test to ignore
Date: Sun, 14 May 2023 06:31:33 -1000
Message-Id: <58818cf22dc378ee5fa9089da1f4b8f0fd02bc44.1684081748.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1684081748.git.steve@sakoman.com>
References: <cover.1684081748.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 May 2023 16:32:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181209

From: Khem Raj <raj.khem@gmail.com>

This file can be processed by run-ptest during runtime and tests
mentioned in skipped.txt will not be run.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
(cherry picked from commit 4d30f3535f53ad6d8f462f99b6cd2fe8d2ecbfb5)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/gawk/gawk/run-ptest | 5 +++++
 meta/recipes-extended/gawk/gawk_5.2.1.bb  | 6 ++++++
 2 files changed, 11 insertions(+)

diff --git a/meta/recipes-extended/gawk/gawk/run-ptest b/meta/recipes-extended/gawk/gawk/run-ptest
index 2675650600..f4ef3e7bd4 100644
--- a/meta/recipes-extended/gawk/gawk/run-ptest
+++ b/meta/recipes-extended/gawk/gawk/run-ptest
@@ -3,6 +3,11 @@
 cd test
 for i in `grep -E "^[a-z0-9_-]*:$" Maketests |awk -F: '{print $1}'`; do
   unset LANG
+  grep -q "^$i$" skipped.txt
+  if [ $? -eq 0 ]; then
+    echo "SKIP: $i"
+    continue
+  fi
   srcdir=`pwd` AWKPROG=gawk AWK=gawk CMP=cmp make -f Maketests $i >$i.tmp 2>&1
   if [ -e _$i ]; then
     cat _$i
diff --git a/meta/recipes-extended/gawk/gawk_5.2.1.bb b/meta/recipes-extended/gawk/gawk_5.2.1.bb
index c914326563..768c8eb364 100644
--- a/meta/recipes-extended/gawk/gawk_5.2.1.bb
+++ b/meta/recipes-extended/gawk/gawk_5.2.1.bb
@@ -59,6 +59,9 @@ do_install_ptest() {
 	# https://bugzilla.yoctoproject.org/show_bug.cgi?id=14371
 	rm -f ${D}${PTEST_PATH}/test/time.*
 	rm -f ${D}${PTEST_PATH}/test/timeout.*
+	for t in time timeout; do
+		echo $t >> ${D}${PTEST_PATH}/test/skipped.txt
+	done
 }
 
 do_install_ptest:append:libc-musl() {
@@ -71,6 +74,9 @@ do_install_ptest:append:libc-musl() {
 	# The below two need LANG=C inside the make rule for musl
 	rm -f ${D}${PTEST_PATH}/test/rebt8b1.*
 	rm -f ${D}${PTEST_PATH}/test/regx8bit.*
+	for t in clos1way6 backsmalls1 commas rebt8b1 regx8bit; do
+		echo $t >> ${D}${PTEST_PATH}/test/skipped.txt
+	done
 }
 
 RDEPENDS:${PN}-ptest += "make locale-base-en-us"
-- 
2.34.1


