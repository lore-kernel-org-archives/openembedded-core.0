Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FA7AC19F2A
	for <webhook@archiver.kernel.org>; Thu,  4 Aug 2022 14:09:05 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web08.5201.1659622138912824570
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Aug 2022 07:08:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=PXHkLNbW;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id y141so19451214pfb.7
        for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Aug 2022 07:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=YpQhel4k9Iw1jJDFphbkwOK5PAEwXmIQg+IeyudthYQ=;
        b=PXHkLNbWH8ia7Ae+hI1CMxpEVrS+Ruiyr4nstLmVa0ADideot3kv66jbS605qxQzRf
         nTWCu4hsvc1k4+kfNoA1+Di+8bXZGyws0klm3+QQbVVAnuB5AX4vUsAnsXnVyjPkBRqE
         a7ve194mIWT5vQuquwU1gmp6i2jA29P36qIzD5YD0EvXRpPOlheJSaIEIg/tyto8jQrN
         zhPFikVHtuEJP+i4/q9agFtc405hrscjnqdg9EwUn7Exm6gY1udT09E7B4gZIsi/YVV8
         6O68KQn6YQ1I5AysKpGkv1MkYGdBemAz6QBuxo+RqiQChlOG11ehRX67gLE2PGE47yvj
         ZLMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YpQhel4k9Iw1jJDFphbkwOK5PAEwXmIQg+IeyudthYQ=;
        b=XIXucTRZ5Gt4HJQpxDv8BP6g5WoiEZNGTFWBnX2eGAbvByv4EOV5ChFUr6vCPPOY46
         capNYCZTHbJi9AjwT0OGiXDowZfJF+7A5VBoq7sgH7PRBWFVd5sPObE7kGL/j8QNP7t8
         +D1PNCa5KmTsXomHh9SGiqgFeh/aiS4brmwpN4sIkP5Vtte7eCJpL7JJR9gK90l9gUXS
         XWnTQArYSB+dOAvavPdP7Kq09g/qZZDvNn5PrCfNM4gAYORdeF8BCbuUYHwjUBDyRrj4
         Sb8Qno0BiGeAwTVWeqci/XDMulP2ds04ObGkcPfIVYsG/ZAln4xLJ6dgSWrJIF050U9G
         f6Sg==
X-Gm-Message-State: ACgBeo3bJrRpd8p9oXw71RLZ/fjHCpTwcTfQCWae+A4/A3VG21EEu7jp
	h0Sqxgufu73Mlfkg6BCf4y/jtbmpE7P1K+wz
X-Google-Smtp-Source: 
 AA6agR6AhTrPl0nY4VBE7q3dbMb1ypu/w43uqbAmoWmgu1XaICMvR0icuzpbyiccAXuZlt1qdSeG5A==
X-Received: by 2002:a05:6a00:a8b:b0:4e1:52db:9e5c with SMTP id
 b11-20020a056a000a8b00b004e152db9e5cmr1886910pfl.38.1659622137766;
        Thu, 04 Aug 2022 07:08:57 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 196-20020a6215cd000000b0052d5e93fcb7sm970261pfv.191.2022.08.04.07.08.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Aug 2022 07:08:43 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 3/7] libgcc: Fix standalone target builds with
 usrmerge distro feature
Date: Thu,  4 Aug 2022 04:06:06 -1000
Message-Id: 
 <38fb876253e28577b8fcf4dd47fbb1d0673c6220.1659621460.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1659621460.git.steve@sakoman.com>
References: <cover.1659621460.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Aug 2022 14:09:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168852

From: Khem Raj <raj.khem@gmail.com>

Ignore the rmdir cmd if using usrmerge distro feature since the
intention is to delete /lib or /lib64 but not libdir under /usr and
base_libdir = libdir when usrmerge is enabled in distro

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3b7f6b0e0f1f16f89cd924aac001b4f661c145ca)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/gcc/libgcc-common.inc | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/gcc/libgcc-common.inc b/meta/recipes-devtools/gcc/libgcc-common.inc
index d48dc8b823..31f629acaa 100644
--- a/meta/recipes-devtools/gcc/libgcc-common.inc
+++ b/meta/recipes-devtools/gcc/libgcc-common.inc
@@ -45,10 +45,14 @@ do_install () {
 }
 
 do_install:append:libc-baremetal () {
-	rmdir ${D}${base_libdir}
+	if [ "${base_libdir}" != "${libdir}" ]; then
+		rmdir ${D}${base_libdir}
+	fi
 }
 do_install:append:libc-newlib () {
-	rmdir ${D}${base_libdir}
+	if [ "${base_libdir}" != "${libdir}" ]; then
+		rmdir ${D}${base_libdir}
+	fi
 }
 
 # No rpm package is actually created but -dev depends on it, avoid dnf error
-- 
2.25.1


