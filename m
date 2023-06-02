Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8330AC7EE37
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 13:35:08 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.13235.1685712902605356221
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 06:35:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=DtYfj4Ct;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-30ad99fa586so2021405f8f.2
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 06:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1685712901; x=1688304901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=otsYrUAmudVjB8p6IUNTE7UsKKXIDTHuSnsiXyyIOh8=;
        b=DtYfj4CtiuwruG09S8z7a3leXkXsPGWO2TeujRMd6OXqMyAVbNCiYBJxd+c8s7C6+0
         nvA6SJfYwunyGg+bLJPjSBJJLo93Lte1yFfZI+vnL9srFiq05y2H4vR2BvGsUhPX6MBR
         Sns7TzAPEbLVPWuafhBS+WQK/5M4cmJyxQy60=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685712901; x=1688304901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=otsYrUAmudVjB8p6IUNTE7UsKKXIDTHuSnsiXyyIOh8=;
        b=il9A9MuXFFcv017rmf4wfIrmgMijEKV10clGCVTTXuhEeN6+PSkslY6mLe8cWJfHVr
         w8GmBSpoLu94Ygb75sX6/iKQ3v8g9dAtz7G9pdXPJFxq6d24hE/j3qRzrpsQqIoJMJtR
         b7aRb+Rp8aBAd8+mzmFJhD5f0fCLHlmbjMP6AcgGbHY4MnO3vbGvDtBdi11RsTKQFgBK
         AG17loddLNTec5Oyep+enheP8jccRSaYFijbox11fKsPxoRk90rHhj44I1y7uF7I73fO
         tR3nc75zsopKoqVSA9x8a4OQYToB2ieL0oMxagk2lyzMCe7iZIxbaXkNMwjgcj0e2NKb
         qWXQ==
X-Gm-Message-State: AC+VfDwLgEhSV4jNiwaVONQ87A6ZMRC4KEXGr6YmXc9E9L8GeTFBIzWz
	yfugRlfJWz3KuTzLXZXA9Uqk0tYGkh5RAoEbGzA=
X-Google-Smtp-Source: ACHHUZ5PckdgZQMnHvJfsgjKKNYa1fiVv9w7DNWyKe/QAlJEmlZcSSrAUzPqMHL18faadoiUoJSf8A==
X-Received: by 2002:adf:ef45:0:b0:30a:eada:8b9b with SMTP id c5-20020adfef45000000b0030aeada8b9bmr3943004wrp.41.1685712900967;
        Fri, 02 Jun 2023 06:35:00 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:527f:ecab:4831:c523])
        by smtp.gmail.com with ESMTPSA id z10-20020a056000110a00b003063a92bbf5sm1734262wrw.70.2023.06.02.06.35.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jun 2023 06:35:00 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 07/11] layer.conf: Add missing dependency exclusion
Date: Fri,  2 Jun 2023 14:34:49 +0100
Message-Id: <20230602133453.229023-7-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230602133453.229023-1-richard.purdie@linuxfoundation.org>
References: <20230602133453.229023-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 13:35:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182325

Add a dependency which should have been in this list but wasn't, found
when debugging create-spdx hash issues.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/layer.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index 948ded667e8..2cc7ed84155 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -69,6 +69,7 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
   initramfs-module-install->grub \
   initramfs-module-install->parted \
   initramfs-module-install->util-linux \
+  initramfs-module-setup-live->udev-extraconf \
   grub-efi->grub-bootconf \
   liberation-fonts->fontconfig \
   cantarell-fonts->fontconfig \
-- 
2.39.2


