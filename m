Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39A74C433FE
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 19:01:56 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web08.12235.1641927715486013208
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 11:01:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kuVVRk0s;
 spf=pass (domain: gmail.com, ip: 209.85.214.175,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id i6so307800pla.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 11:01:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=4RpdyXqJEAzbOstBSbReY2MawfWiZGhxP0QNt4oZ7Ys=;
        b=kuVVRk0sGd22dWQ0OpDYq4m9Pr93NnqEzncezRwbQCxt8GAQ2woeYc96rIjBjKip3a
         F0Sx+DCuSEaTh4A7MyZrBL60Y1QGOBirVmVD6K0vqsdr0U6Hk7CP5MUsXyO/yOHHzwkv
         EIkgfpFTBklaBk3ap1xaX8x4aAVcwz9I4wt4rS68G6gcAt2aGLCyBk+PJLXsse71YOVu
         YHKCMYg8IlijbOd711sdxEaxrS9u4Tu7tiQ7sHeLmDN2eNJRvbyI8ft2YtEmeDvdMe/4
         rjSbV3boXvAaWEDvVx+wUa4hcZQQyF6AHTCJ1WwcpKMz4VuLTjxkko4Vgb4F890bLYWR
         bTyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4RpdyXqJEAzbOstBSbReY2MawfWiZGhxP0QNt4oZ7Ys=;
        b=rdO57hTSSRfn1hC9e0QA840MqNotBiBdF+uXJUheDUF+hra+6Y+uvBkCnprNWT76K2
         lh/HhCIBYRraiGk4s17hFexL/pwuCc3l88hvqj7bcgzBYy0i63u21Q9fU96ldpPIrdCR
         jkd0eSrX+4ZwoiKYtaQ2mt7IyY5syJUgSXgf5dK7331GwgWUOYW3G+d6Rv9jLYulnySs
         Tw7dug11tAuom74S9K8+kPtf29zl7Gvc/kc5VcuLF/uLje8Oc123UxKCAVz4Y0iL4Nve
         dTkInLNZF40bQMcXuKfF4w7PeJMFYPDNk2sTJ4NJeNbG/BM7wEx5G9Or1YINL2Wzxrw8
         EW5g==
X-Gm-Message-State: AOAM531RA4q/s9k5l80NvMUbpw+OdBxdgUL59nVOGL931+t8ZseUQ6hT
	RdL86VH8lBJ3434zB4OjYsZ3i9gtajI=
X-Google-Smtp-Source: 
 ABdhPJyeI2M1M8OX8kEJbbIq8/fjEfyiQsmmXmk38MrQmiPKiOa2uhSTt+oUvt0watldrEHPbyD7zA==
X-Received: by 2002:a17:902:e3d5:b0:14a:37bd:5ca3 with SMTP id
 r21-20020a170902e3d500b0014a37bd5ca3mr5775509ple.65.1641927714743;
        Tue, 11 Jan 2022 11:01:54 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:9b84:60d5:95c9:ae8b])
        by smtp.gmail.com with ESMTPSA id
 u3sm11509977pfk.82.2022.01.11.11.01.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 11:01:54 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 01/22] classes/distutils-*: add warning of deprecation
Date: Tue, 11 Jan 2022 11:01:10 -0800
Message-Id: 
 <20a0ba5480c6a1938234b12768e5bfceece92372.1641920605.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1641920605.git.tim.orling@konsulko.com>
References: <cover.1641920605.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jan 2022 19:01:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160437

distutils has been deprecated in Python 3.10 and will be removed in
Python 3.12 (predicted release date October 2023).

Add a warning now that recommends using the roughly equivalent
setuptools-* classes.

[YOCTO #14610]

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/classes/distutils-common-base.bbclass | 3 +++
 meta/classes/distutils3-base.bbclass       | 3 +++
 meta/classes/distutils3.bbclass            | 4 ++++
 3 files changed, 10 insertions(+)

diff --git a/meta/classes/distutils-common-base.bbclass b/meta/classes/distutils-common-base.bbclass
index bc994f78de3..59c750a3cf7 100644
--- a/meta/classes/distutils-common-base.bbclass
+++ b/meta/classes/distutils-common-base.bbclass
@@ -23,3 +23,6 @@ FILES:${PN}-dev += "\
   ${libdir}/pkgconfig \
   ${PYTHON_SITEPACKAGES_DIR}/*.la \
 "
+python __anonymous() {
+    bb.warn("distutils-common-base.bbclass is deprecated, please use setuptools3-base.bbclass instead")
+}
diff --git a/meta/classes/distutils3-base.bbclass b/meta/classes/distutils3-base.bbclass
index d41873e4869..850c535bb17 100644
--- a/meta/classes/distutils3-base.bbclass
+++ b/meta/classes/distutils3-base.bbclass
@@ -4,3 +4,6 @@ RDEPENDS:${PN} += "${@['', '${PYTHON_PN}-core']['${CLASSOVERRIDE}' == 'class-tar
 
 inherit distutils-common-base python3native python3targetconfig
 
+python __anonymous() {
+    bb.warn("distutils3-base.bbclass is deprecated, please use setuptools3-base.bbclass instead")
+
diff --git a/meta/classes/distutils3.bbclass b/meta/classes/distutils3.bbclass
index be645d37bd0..a6d8e8763f3 100644
--- a/meta/classes/distutils3.bbclass
+++ b/meta/classes/distutils3.bbclass
@@ -14,6 +14,10 @@ DISTUTILS_PYTHON:class-native = "nativepython3"
 
 DISTUTILS_SETUP_PATH ?= "${S}"
 
+python __anonymous() {
+    bb.warn("distutils3.bbclass is deprecated, please use setuptools3.bbclass instead")
+}
+
 distutils3_do_configure() {
     :
 }
-- 
2.30.2


