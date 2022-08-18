Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8E38C32774
	for <webhook@archiver.kernel.org>; Thu, 18 Aug 2022 16:57:02 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web09.44933.1660841819502244616
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Aug 2022 09:56:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=kpA7AwxE;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id y4so2012949plb.2
        for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Aug 2022 09:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=dUsRxEdIYOU1kKaKtwXCY8y9jmY9eYKQPTvLA4xmAKs=;
        b=kpA7AwxEXz9RtU+EgZf42me5uiXuB/s3KN2RbmesE81GbujamRY9IF74vOBJ/isejv
         aIMPGVqLQyNycis0H6+tzCDvppu53CsqwAPMS/3H8b3frKys475pDiFuHPIW8eV4PXUZ
         2g8EOir42sLamu8daRylcGoEOAByxesxPn/ErF6maPvDxBvXDE/zJ0Hoa4tid3Xsihy6
         joUqElMcbXiRN6SZuVmytJcEWf6pQ1lw+ZynpprzMknL+U405mIWzfXpkINVMwuc37R1
         c4WSZUojvAVvmG+QKZmBEe/5Uhyi/epGe+z3bHBsB2FaluzltI+nHW6GwJ3fz/fy0nUI
         c8Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=dUsRxEdIYOU1kKaKtwXCY8y9jmY9eYKQPTvLA4xmAKs=;
        b=hyzRiuF9m13a2+Oxno/0/xW1tMHRqgot+esk1I8jTrL4HhawpUQc0rMFOhwCLK9qAn
         tYm+dgyqFVV3HceErACZFx7Xp8qGmqIULFG26ScQPIkvNUGY8+JmEKaLoqNZhNOjsD4H
         bV2EQWGGMleFYnixXN5vlmwrnER94q7QBy37XiiB6/n+xTplobTWgH4ATtynGOTB+HdW
         KkjYAdgPHe/OS42IqD1zu8fdZYGCIiMlIRlGT03CmGqXTAx9Ye2z/Xi7a08AcdpCFwuR
         apbrEteKA2MZNm2w2wGwy8H13bDRy74p6fiWTiEYIuXQdBfPVxcUBh3y67CbBqEtuBCF
         5gzQ==
X-Gm-Message-State: ACgBeo2Z1+O+f5vNPVpdA+2YPjRDICE1fjgRGpsJQANcnPvelWiAhsMv
	AePFoPzRsXtkGB4ZNlkdq9bQ3mFAZx3c6bSN
X-Google-Smtp-Source: 
 AA6agR7h31VaAmoR0JJBv3gcofjmJXl2Dc9V+J7UbBRMRLoTDq76klyIYtdJMSUg++DtkvRMa/jsBw==
X-Received: by 2002:a17:90a:c483:b0:1fa:a442:ed8a with SMTP id
 j3-20020a17090ac48300b001faa442ed8amr9734925pjt.151.1660841818522;
        Thu, 18 Aug 2022 09:56:58 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 h135-20020a62838d000000b0052d432b4cc0sm1897446pfe.33.2022.08.18.09.56.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Aug 2022 09:56:58 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 03/11] zlib: CVE-2022-37434 a heap-based buffer
 over-read
Date: Thu, 18 Aug 2022 06:56:20 -1000
Message-Id: 
 <10ed7cf347d9e73b29e4a3f6ef77e0a4b08e350b.1660841536.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1660841536.git.steve@sakoman.com>
References: <cover.1660841536.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Aug 2022 16:57:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169525

From: Hitendra Prajapati <hprajapati@mvista.com>

Source: https://github.com/madler/zlib
MR: 120531
Type: Security Fix
Disposition: Backport from https://github.com/madler/zlib/commit/eff308af425b67093bab25f80f1ae950166bece1 & https://github.com/madler/zlib/commit/1eb7682f845ac9e9bf9ae35bbfb3bad5dacbd91d
ChangeID: 364c17d74213c64fe40b9b37ee78aa172ff93acf
Description:
          CVE-2022-37434 zlib: a heap-based buffer over-read or buffer overflow in inflate in inflate.c via a large gzip header extra field.

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../zlib/zlib/CVE-2022-37434.patch            | 44 +++++++++++++++++++
 meta/recipes-core/zlib/zlib_1.2.11.bb         |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-core/zlib/zlib/CVE-2022-37434.patch

diff --git a/meta/recipes-core/zlib/zlib/CVE-2022-37434.patch b/meta/recipes-core/zlib/zlib/CVE-2022-37434.patch
new file mode 100644
index 0000000000..d29e6e0f1f
--- /dev/null
+++ b/meta/recipes-core/zlib/zlib/CVE-2022-37434.patch
@@ -0,0 +1,44 @@
+From 8617d83d6939754ae3a04fc2d22daa18eeea2a43 Mon Sep 17 00:00:00 2001
+From: Hitendra Prajapati <hprajapati@mvista.com>
+Date: Wed, 17 Aug 2022 10:15:57 +0530
+Subject: [PATCH] CVE-2022-37434
+
+Upstream-Status: Backport [https://github.com/madler/zlib/commit/eff308af425b67093bab25f80f1ae950166bece1 & https://github.com/madler/zlib/commit/1eb7682f845ac9e9bf9ae35bbfb3bad5dacbd91d]
+CVE: CVE-2022-37434
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+
+Fix a bug when getting a gzip header extra field with inflate().
+
+If the extra field was larger than the space the user provided with
+inflateGetHeader(), and if multiple calls of inflate() delivered
+the extra header data, then there could be a buffer overflow of the
+provided space. This commit assures that provided space is not
+exceeded.
+
+ Fix extra field processing bug that dereferences NULL state->head.
+
+The recent commit to fix a gzip header extra field processing bug
+introduced the new bug fixed here.
+---
+ inflate.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/inflate.c b/inflate.c
+index ac333e8..cd01857 100644
+--- a/inflate.c
++++ b/inflate.c
+@@ -759,8 +759,9 @@ int flush;
+                 if (copy > have) copy = have;
+                 if (copy) {
+                     if (state->head != Z_NULL &&
+-                        state->head->extra != Z_NULL) {
+-                        len = state->head->extra_len - state->length;
++                        state->head->extra != Z_NULL &&
++                        (len = state->head->extra_len - state->length) <
++                            state->head->extra_max) {
+                         zmemcpy(state->head->extra + len, next,
+                                 len + copy > state->head->extra_max ?
+                                 state->head->extra_max - len : copy);
+-- 
+2.25.1
+
diff --git a/meta/recipes-core/zlib/zlib_1.2.11.bb b/meta/recipes-core/zlib/zlib_1.2.11.bb
index bc42cd64e9..e2fbc12bd8 100644
--- a/meta/recipes-core/zlib/zlib_1.2.11.bb
+++ b/meta/recipes-core/zlib/zlib_1.2.11.bb
@@ -10,6 +10,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/libpng/${BPN}/${PV}/${BPN}-${PV}.tar.xz \
            file://ldflags-tests.patch \
            file://CVE-2018-25032.patch \
            file://run-ptest \
+	    file://CVE-2022-37434.patch \
            "
 UPSTREAM_CHECK_URI = "http://zlib.net/"
 
-- 
2.25.1


