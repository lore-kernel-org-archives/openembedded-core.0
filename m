Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CDD3C433F5
	for <webhook@archiver.kernel.org>; Thu, 20 Jan 2022 21:24:16 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web12.2645.1642713855636133308
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jan 2022 13:24:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=0NHhdxqd;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.48,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f48.google.com with SMTP id
 s2-20020a17090ad48200b001b501977b23so6556629pju.2
        for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jan 2022 13:24:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=CEdlUDrxGSLL9G8GyKj/PH9d7zNtJqwDPN0l/5+hC1s=;
        b=0NHhdxqd535e9UzqxB7Lcf3FlgANcF5JMep5Mf6hOfuZ05eb5jC4Gg+T/LbdHTpL0N
         uZM2cp0goSoH5FPJ7PBIAEuApQNkDJWBdFn1R1WxNCdPaCBhkDZj4oAHFjktPeWp+KAs
         xMX7sbHAMtXJnz3UBh1MCcboYMfpNrwME23YKbeNQTbaw7/2YLIjFWfCakG7paROO5m6
         lidhe3C0MMUc/7+TA2BoSkmzdx7aAaNKmq1JZ7QXi4+QrJjduXUspGh/GiPBRgtojWQT
         WetbAYqWEbuvBtr470nFS6JrPA4QIcOwBoSc3ga4OzMZWV32DqSRT9B4jN36VPMOyeM3
         cVeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CEdlUDrxGSLL9G8GyKj/PH9d7zNtJqwDPN0l/5+hC1s=;
        b=YCHcB74Xnri2tD2taSljNxeLVI+Bqz8zqCBviQrQNa6FLroLFqrx4vZex8LXpL9UW5
         nCSdepsvuIf8+usgxWx1wpq02Y5E7pdSkR0x4HPWnEkmS/6rw/j4NDDOdhYCiC9f4Yu9
         rYHtSe/I/OvASym4SMMai5ltlu3iJ5qwO5drFwhOjQ936ZTXNThHfod1jnruBvFj/FnL
         olUV6GMtHlCCXGTB0v6tNxB2yh3NnURnw5wSskJ4FnLfbClhv6Yngr3Tp6ZFP5hWrHK7
         NHqOQBJsjnOiPi9lRxcjI/Ubx91vefcn5R6Bq3jDErTghGNKwg1RJkOzvTdSGFSry0H9
         BE7g==
X-Gm-Message-State: AOAM532GNbmEgnmbnDXziA8Yr7jbsuGKgYWw8intAACzJTMq9tE83RCr
	JcYIMnSLvD2o+im1nNDjB9NQ4QxuF6TsybAFbNw=
X-Google-Smtp-Source: 
 ABdhPJyd47COB+MlO4btrzAs87DqOZo+H4RMBOuZB+ls6yZ0M4WtvWJHg9X+5kmOB0o2Pn0AdjPHPw==
X-Received: by 2002:a17:903:187:b0:14a:6ee7:682c with SMTP id
 z7-20020a170903018700b0014a6ee7682cmr946889plg.105.1642713853751;
        Thu, 20 Jan 2022 13:24:13 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 o5sm4029115pfk.172.2022.01.20.13.24.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jan 2022 13:24:13 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 03/11] expat: fix CVE-2021-46143
Date: Thu, 20 Jan 2022 11:23:42 -1000
Message-Id: 
 <41a65d27e4ecdc11977e2944d8af2f51c48f32ec.1642693490.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1642693490.git.steve@sakoman.com>
References: <cover.1642693490.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Jan 2022 21:24:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160793

In doProlog in xmlparse.c in Expat (aka libexpat) before 2.4.3, an
integer overflow exists for m_groupSize.

Backport patch from:
https://github.com/libexpat/libexpat/pull/538/commits/85ae9a2d7d0e9358f356b33977b842df8ebaec2b

CVE: CVE-2021-46143
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../expat/expat/CVE-2021-46143.patch          | 43 +++++++++++++++++++
 meta/recipes-core/expat/expat_2.2.9.bb        |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2021-46143.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2021-46143.patch b/meta/recipes-core/expat/expat/CVE-2021-46143.patch
new file mode 100644
index 0000000000..d6bafba0ff
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2021-46143.patch
@@ -0,0 +1,43 @@
+From 85ae9a2d7d0e9358f356b33977b842df8ebaec2b Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Sat, 25 Dec 2021 20:52:08 +0100
+Subject: [PATCH] lib: Prevent integer overflow on m_groupSize in function
+ doProlog (CVE-2021-46143)
+
+---
+ expat/lib/xmlparse.c | 15 +++++++++++++++
+ 1 file changed, 15 insertions(+)
+
+diff --git a/expat/lib/xmlparse.c b/expat/lib/xmlparse.c
+index b47c31b0..8f243126 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -5046,6 +5046,11 @@ doProlog(XML_Parser parser, const ENCODING *enc, const char *s, const char *end,
+       if (parser->m_prologState.level >= parser->m_groupSize) {
+         if (parser->m_groupSize) {
+           {
++            /* Detect and prevent integer overflow */
++            if (parser->m_groupSize > (unsigned int)(-1) / 2u) {
++              return XML_ERROR_NO_MEMORY;
++            }
++
+             char *const new_connector = (char *)REALLOC(
+                 parser, parser->m_groupConnector, parser->m_groupSize *= 2);
+             if (new_connector == NULL) {
+@@ -5056,6 +5061,16 @@ doProlog(XML_Parser parser, const ENCODING *enc, const char *s, const char *end,
+           }
+ 
+           if (dtd->scaffIndex) {
++            /* Detect and prevent integer overflow.
++             * The preprocessor guard addresses the "always false" warning
++             * from -Wtype-limits on platforms where
++             * sizeof(unsigned int) < sizeof(size_t), e.g. on x86_64. */
++#if UINT_MAX >= SIZE_MAX
++            if (parser->m_groupSize > (size_t)(-1) / sizeof(int)) {
++              return XML_ERROR_NO_MEMORY;
++            }
++#endif
++
+             int *const new_scaff_index = (int *)REALLOC(
+                 parser, dtd->scaffIndex, parser->m_groupSize * sizeof(int));
+             if (new_scaff_index == NULL)
diff --git a/meta/recipes-core/expat/expat_2.2.9.bb b/meta/recipes-core/expat/expat_2.2.9.bb
index a21e59f987..757c18c5fa 100644
--- a/meta/recipes-core/expat/expat_2.2.9.bb
+++ b/meta/recipes-core/expat/expat_2.2.9.bb
@@ -9,6 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5b8620d98e49772d95fc1d291c26aa79"
 SRC_URI = "git://github.com/libexpat/libexpat.git;protocol=https;branch=master \
            file://CVE-2013-0340.patch \
            file://CVE-2021-45960.patch \
+           file://CVE-2021-46143.patch \
            file://CVE-2022-22822-27.patch \
            file://libtool-tag.patch \
          "
-- 
2.25.1


