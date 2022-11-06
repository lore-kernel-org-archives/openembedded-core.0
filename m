Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56FE0C43219
	for <webhook@archiver.kernel.org>; Sun,  6 Nov 2022 16:04:12 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web08.17567.1667750649379873045
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Nov 2022 08:04:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=Cf5IBk6K;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id l6so8508096pjj.0
        for <openembedded-core@lists.openembedded.org>; Sun, 06 Nov 2022 08:04:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ULwbGoYNT72gxmpGhUdxezikKhfyZVyoE50s+aSXUZ8=;
        b=Cf5IBk6KJCh0Thf+O46x8Q5UGYVEt5use2WHiJOGW3Cg3yKj3Okq5TgUc1Ie6DHtwP
         oRvKMF3I++qIbVBcQoBDv2sHnzjsVG10p9IKjEnnxbtEvlAUDn1mW3SyEri0csBGlOGm
         nD0zmYa3hjeC/I8miTQaG32SYt2hKFffUKy105Y2Ppvw44yeXSoFHaDCTSjCBZ3+FQjD
         Mf9pqbphCZGwwitnZfqSFPZv6CULloqOHdq1p3uKL+8oNPke1Vd9yGGQmEnjbFmdcHKC
         FaU3JNzZ+pHJDkNnWmhArtfMJ9gtSiOdHbHTAKKDCLCD8B3BwkTnfzLSzgfxjpR6SgCb
         AX7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ULwbGoYNT72gxmpGhUdxezikKhfyZVyoE50s+aSXUZ8=;
        b=AUjyu0Hk8u+l4qC4O6ENeam7HjUQQGqXnLaL+sAEsBGs6BA2i8v4i0C+JVkzMciHVw
         7c47EpzSI7JYwJWBjeEX+E6ih3cmBChWvb8gTEopYZRtxCURysrjZa0lGnH5nN2SdR+K
         zeCnX683UH3FS87IhNMTuNaAgFdJTAvs5DRfwj9JBH2E78bZ4TgNb5pnEDpglDlB8Q6P
         eS8hXCBCSmAfD7CsA0ex9OCXl/HcGE/R7u2p+CNtw/TkFGfCq+cNKWfXu5Jh8zxppW8l
         Xpj/n0lDE7LI2M74DJvECCrIKBqasiGw+8Y8TGWX4VBIHUNSDpaNAB3YPrS3nkj0m/2q
         moMQ==
X-Gm-Message-State: ACrzQf2yColwqDpUk8ULsv5mrtqnRrLoj2Tyvk4MmTTNgpAVFdL6P+dG
	EqTzdruQr16Ga9j7A/xETzdGFsLVCwGsq2r9
X-Google-Smtp-Source: AMsMyM5d5Z0uEb6jWfslg6mWeqjWfphIY8BpXoV4MPbEalgv64C+qOf/Q12QpOtUGqMfDk7f5D2t7g==
X-Received: by 2002:a17:902:ea95:b0:186:a6b7:4410 with SMTP id x21-20020a170902ea9500b00186a6b74410mr47468287plb.109.1667750648412;
        Sun, 06 Nov 2022 08:04:08 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id s11-20020a170902ea0b00b0018700ba9090sm3294683plg.185.2022.11.06.08.04.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Nov 2022 08:04:07 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 3/8] expat: Fix CVE-2022-43680 for expat
Date: Sun,  6 Nov 2022 06:03:48 -1000
Message-Id: <ac4476e6594417b14bfb05a110009ef245f419b0.1667750511.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667750511.git.steve@sakoman.com>
References: <cover.1667750511.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Nov 2022 16:04:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172809

From: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>

Add a patch to fix CVE-2022-43680 issue where use-after free caused by
overeager destruction of a shared DTD in XML_ExternalEntityParserCreate
in out-of-memory situations
Link: https://nvd.nist.gov/vuln/detail/CVE-2022-43680

Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../expat/expat/CVE-2022-43680.patch          | 33 +++++++++++++++++++
 meta/recipes-core/expat/expat_2.2.9.bb        |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2022-43680.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2022-43680.patch b/meta/recipes-core/expat/expat/CVE-2022-43680.patch
new file mode 100644
index 0000000000..6f93bc3ed7
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2022-43680.patch
@@ -0,0 +1,33 @@
+From 5290462a7ea1278a8d5c0d5b2860d4e244f997e4 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Tue, 20 Sep 2022 02:44:34 +0200
+Subject: [PATCH] lib: Fix overeager DTD destruction in
+ XML_ExternalEntityParserCreate
+
+CVE: CVE-2022-43680
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/5290462a7ea1278a8d5c0d5b2860d4e244f997e4.patch]
+Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
+Comments: Hunk refreshed
+---
+ lib/xmlparse.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index aacd6e7fc..57bf103cc 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -1035,6 +1035,14 @@ parserCreate(const XML_Char *encodingNam
+   parserInit(parser, encodingName);
+ 
+   if (encodingName && ! parser->m_protocolEncodingName) {
++    if (dtd) {
++      // We need to stop the upcoming call to XML_ParserFree from happily
++      // destroying parser->m_dtd because the DTD is shared with the parent
++      // parser and the only guard that keeps XML_ParserFree from destroying
++      // parser->m_dtd is parser->m_isParamEntity but it will be set to
++      // XML_TRUE only later in XML_ExternalEntityParserCreate (or not at all).
++      parser->m_dtd = NULL;
++    }
+     XML_ParserFree(parser);
+     return NULL;
+   }
diff --git a/meta/recipes-core/expat/expat_2.2.9.bb b/meta/recipes-core/expat/expat_2.2.9.bb
index 578edfcbff..8a5006e59a 100644
--- a/meta/recipes-core/expat/expat_2.2.9.bb
+++ b/meta/recipes-core/expat/expat_2.2.9.bb
@@ -21,6 +21,7 @@ SRC_URI = "git://github.com/libexpat/libexpat.git;protocol=https;branch=master \
            file://CVE-2022-25315.patch \
            file://libtool-tag.patch \
            file://CVE-2022-40674.patch \
+           file://CVE-2022-43680.patch \
          "
 
 SRCREV = "a7bc26b69768f7fb24f0c7976fae24b157b85b13"
-- 
2.25.1


