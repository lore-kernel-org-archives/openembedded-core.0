Return-Path: <jacob.kroon@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18752C433FE
	for <webhook@archiver.kernel.org>; Sun, 28 Nov 2021 09:46:24 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web09.46033.1638092782996314247
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Nov 2021 01:46:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kA9FCXFr;
 spf=pass (domain: gmail.com, ip: 209.85.167.43,
 mailfrom: jacob.kroon@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id c32so36415009lfv.4
        for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Nov 2021 01:46:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=gWb/aF3BnhHiPU7aCfAobhgmdmxDsDvDdgi3PB6NhBs=;
        b=kA9FCXFrRAGgK8bC7H+fkI+EuLyGMuWM6xABTTD86SbJAnn+V1+ZxcR5SlTM9jnjZu
         7pXgd04bZ1p8z1f4OOXgGLJbHlCRxKwUvUtx/1Y6PPGFFZMfvbUzE+VNCGCZbjY/3xps
         tVuFBYjppyT4MBm7clHZ/tjNjG/QISOlIRQEIof+Ij1RWcBz5AZ2drz8npFAS7Cci2Y6
         sF2eTXMwxCWM3M9AjTFdFlg0K/0FaBrrYexbSeN37vJLVTB3G5IBND1/QFRCPGlkd15D
         d86G2EWYvLa8YoBJKqs88Kxzv8el5mJpfF8nlDfAp1AcJp5GsjFYg8xzGosxn/BU3CJL
         0BLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gWb/aF3BnhHiPU7aCfAobhgmdmxDsDvDdgi3PB6NhBs=;
        b=ba9/2zxprY1RRKag+RYukydmGH+B3b45bhx01no15v5+/yi/TOxXGpX/wRmYtVz1+X
         dWC8tSp3hiG7jkAPGvnZV6Yq6GSrxziEZ37DIQXnw5FlCNpl6dCWGxWeOi2w+rabe30F
         k4+nx448EdQhiZ+Gsi3Ioj5O7da0F5IA/hwzUjUSl1FBZLpYlmrY6zdgXQ3AR2HuFQni
         pGBloKc+ZzZ6Q9kwGknAC3h+Lq9h+9t0uQyDFXX7XH582ZMd1iYV3OGfU34vxt36FebC
         fBVkImUTOePYJrL/MlfNNsQPjYbwLjvwCjOzYIl1/9opsY2Xl6/AyKecupzbRLvoc7Vq
         8YnQ==
X-Gm-Message-State: AOAM530dLl3vKNeSFrsHavKC8i2j1HMeVyW+lZdbp2Pvj2VVnWenZ0Vi
	BTte1vAaIzeWZNgoYg2gv9Hr3Y3h0a60Lg==
X-Google-Smtp-Source: 
 ABdhPJzF1GFrSLm2c1o4fxEcZxO66mw/fIj2CRDzX9/r6XM96ZTRgY7xkdWZg9TYIJZeDEv7cqikrQ==
X-Received: by 2002:a05:6512:22c7:: with SMTP id
 g7mr40004110lfu.417.1638092781252;
        Sun, 28 Nov 2021 01:46:21 -0800 (PST)
Received: from localhost.localdomain (37-247-29-68.customers.ownit.se.
 [37.247.29.68])
        by smtp.gmail.com with ESMTPSA id
 k15sm1031749ljg.123.2021.11.28.01.46.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Nov 2021 01:46:20 -0800 (PST)
From: Jacob Kroon <jacob.kroon@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [RFC PATCH 5/9] pkgconfig: Improve native reproducibility
Date: Sun, 28 Nov 2021 10:45:28 +0100
Message-Id: <20211128094532.1145820-6-jacob.kroon@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211128094532.1145820-1-jacob.kroon@gmail.com>
References: <20211128094532.1145820-1-jacob.kroon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Nov 2021 09:46:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158872

Avoid encoding build-specific paths in the resulting binaries.

Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
---
 meta/recipes-devtools/pkgconfig/pkgconfig_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb b/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
index c220bafd90..a7b2cae624 100644
--- a/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
+++ b/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
@@ -28,6 +28,7 @@ inherit autotools
 # so just continue that behaviour.
 #
 EXTRA_OECONF += "--disable-indirect-deps"
+EXTRA_OECONF:append:class-native = " --libdir=/non/existent --with-pc-path=/non/existent"
 
 PACKAGECONFIG ??= "glib"
 PACKAGECONFIG:class-native = ""

