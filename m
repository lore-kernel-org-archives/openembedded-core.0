Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DBD5C433F5
	for <webhook@archiver.kernel.org>; Tue, 17 May 2022 18:25:47 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web12.1097.1652811944816896309
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 11:25:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=x9JSHHL+;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.170,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f170.google.com with SMTP id x12so17648256pgj.7
        for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 11:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=doec5HGEYOcoM09kXisBkglZcHYwbQZEaVuRZG1L4xc=;
        b=x9JSHHL+9cvbr0ccDF1qDMGIfilM0Klp0lZtnOWldVWZDVomjBOL8bnar5qnRGVuWA
         XbPXVNnsNm1u/un3eHEi9Fd0Kf7GUSig0QXbyJu7ZNXKJjck/vKT/U0l2d4zc9EZmRQ/
         qjiU2cKcakWgOeU27lzgIZBgLHd9C6HM3ubKD7DGd8yxpAbK3KaxvxN2YLxeVRlXiGuo
         Buvh8RABv+LfZpj7Bart7CTvB3MO1TaWPnms/cWk9MvhLlVD/DtI34PYJRLwz/9zr6hu
         RQshcyV02U7XvUY3bYs5+gyOKmzPGGzdB99cwapmPO9okDVxQRUm29ijpBCn485LUITz
         Yv9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=doec5HGEYOcoM09kXisBkglZcHYwbQZEaVuRZG1L4xc=;
        b=x3b/6Cpi/v6seS8IQOs8HxkwAJYQOZiYpsj1SIv/Oog+kvBygP37ZAfsGSceGKK2dL
         UnKdyP6x+hP1r0KBwAAVtw7gQyM9ENo2kpsd9x0IaRBIQvs2Hh1ZdXDU8uxSgDHGlgoy
         AsHt6PtzTqVTe6E31ZJUdrqK68/hkd0h1YM1xgeE68kIYQb+zTu+uY+VjYJx/e5r5sRb
         arGlpX2Wjo4uDG3oun0zmmKYjOPQyg/lfKujtykASTyhoG1xXux1Q2k1q1TvE8TEuXW0
         MzLdRt/1so8H0KaM4MLrU+vzWE3/lXjF18Sg/LF6dk7KQwNV6qX0x0YhX6NdGdmGBFBn
         LjCw==
X-Gm-Message-State: AOAM532cFl9vcSB1zWctfG0h2mZqkCzvFUxCgksUPBUNJkEQv/x2cQR0
	iv+KgpLFGHs+EdJAhpJVFAk+KsVj3NcFP9zl
X-Google-Smtp-Source: 
 ABdhPJxHLIPmsJuK7pVbG2CYg4P9KwPyp++LPK1VlOzBn+nhPYZ6b0fB3Am1DqY5BIBn/bI5ncA+Xg==
X-Received: by 2002:a63:db17:0:b0:3c1:dc15:7a6e with SMTP id
 e23-20020a63db17000000b003c1dc157a6emr20941203pgg.107.1652811943597;
        Tue, 17 May 2022 11:25:43 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 f9-20020a170902684900b0015e8d4eb1d1sm9408188pln.27.2022.05.17.11.25.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 May 2022 11:25:42 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 27/31] image.bbclass: allow overriding dependency
 on virtual/kernel:do_deploy
Date: Tue, 17 May 2022 08:24:13 -1000
Message-Id: 
 <4caf244256e150fea19cd4f2ca04c13d95d49fee.1652811454.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1652811454.git.steve@sakoman.com>
References: <cover.1652811454.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 May 2022 18:25:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165772

From: Dmitry Baryshkov <dbaryshkov@gmail.com>

Since the commit fe26b2379ecd ("image.bbclass: Depend on
virtual/kernel:do_deploy"), the image.bbclass made building images
depend on virtual/kernel. For some images, including small initramfs,
this is not the case. Allow overriding this dependency in case
developers knows what they are doing.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 55875f68212657167ac6dc26f5fd93eac24b098e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/image.bbclass | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 7f1f6f80a4..2139a7e576 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -132,7 +132,12 @@ def rootfs_variables(d):
 
 do_rootfs[vardeps] += "${@rootfs_variables(d)}"
 
-do_build[depends] += "virtual/kernel:do_deploy"
+# This is needed to have kernel image in DEPLOY_DIR.
+# This follows many common usecases and user expectations.
+# But if you are building an image which doesn't need the kernel image at all,
+# you can unset this variable manually.
+KERNEL_DEPLOY_DEPEND ?= "virtual/kernel:do_deploy"
+do_build[depends] += "${KERNEL_DEPLOY_DEPEND}"
 
 
 python () {
-- 
2.25.1


