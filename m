Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE8EEC4332F
	for <webhook@archiver.kernel.org>; Wed,  8 Dec 2021 22:00:15 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.3037.1639000814874678489
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 14:00:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DdanWZrl;
 spf=pass (domain: gmail.com, ip: 209.85.221.49,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id j3so6543805wrp.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 14:00:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cdF9v6NxbAiPP53V/18LeN9GFl3zeyYoAzWvvjmcNXw=;
        b=DdanWZrlrCzht6Xc9fi3DNQpB1f5PsCkghuzNBcVlQW9uwFdXsSUGAThrbOWD08GS7
         s+/S+pe7c+7xqX+l9D3pKY7S6FFu6JvdlQ6cko6ypA0/SyIBKt6DKmr5+XlNAYIg055/
         YqgSsbss1bTIuZzEPdVraDIW8ti56okzxZ7tZ8GsRpwZBBo9tq35sZSFZsWvxbatKMIs
         lbRg51oz0f5eui/UEVcNWA+ekougu1cKwOr9JK7PyduodY1W2OyxUWxbqQpow+jPA99d
         oHEAbcNkhNL7qtozhZ60OZX8bP9gF0FjgnjwtCcYXyKNE2Avv3GVJ18E8Rw6GYuV0C9w
         jhgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cdF9v6NxbAiPP53V/18LeN9GFl3zeyYoAzWvvjmcNXw=;
        b=hNJ9qnysJQ98krLEbpypZX3YghW+rz+DqVTur3nRchqF6JPSVfeQkvqgnYA5+RcOz7
         6QnLG0oQ9FbTcCiFXv6ieQhmUG4X0ZB3Fm1dX15TpY6HsFPcChzQePQJGIKJes0iI8Ab
         fvyy4UfvHj+UXA1kEtqA79iN3hjhVZJYUjd/ZghdX9MyIOhWEHJO8n6gg5fytS6lfHKV
         efxUnhJtbJAWRNSlHYbpDAfKqngzg82jpYFpYqtIrEGfvthscpiTB8r1QLEwnNT4hAWg
         tdurbvruD7UTqreEMPH9fVKQPRvoGstHB8ttrpYd8D5RoobM/XBHQMFaxa7OQzA5/N//
         MWbw==
X-Gm-Message-State: AOAM533XuWa6oj1A1kYbsWoZvU/gCTvwvzPFFGkVnIuSF8e+0w+2hzA5
	DwsqVtpPm3lRfNV02Sj9OYJf00U6XY0/8w==
X-Google-Smtp-Source: 
 ABdhPJx+AH8YXBoawyfedoobJnJfiUDLoAXBy1VZQfAnQW9OHpwTkkENtoRyVNgbiahDl6cxdwBvTA==
X-Received: by 2002:a5d:5983:: with SMTP id n3mr1529237wri.372.1639000813519;
        Wed, 08 Dec 2021 14:00:13 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 c6sm9177170wmq.46.2021.12.08.14.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Dec 2021 14:00:13 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 24/29] diffoscope: upgrade 192 -> 194
Date: Wed,  8 Dec 2021 22:59:42 +0100
Message-Id: <20211208215947.1979470-24-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211208215947.1979470-1-alex@linutronix.de>
References: <20211208215947.1979470-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Dec 2021 22:00:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159390

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../diffoscope/{diffoscope_192.bb => diffoscope_194.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_192.bb => diffoscope_194.bb} (92%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_192.bb b/meta/recipes-support/diffoscope/diffoscope_194.bb
similarity index 92%
rename from meta/recipes-support/diffoscope/diffoscope_192.bb
rename to meta/recipes-support/diffoscope/diffoscope_194.bb
index 4dda858ef2..51d86ff052 100644
--- a/meta/recipes-support/diffoscope/diffoscope_192.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_194.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "ae2774334fce7905f1b938a155d487d55b9fef9da9a9d18eda3d74951a8a8084"
+SRC_URI[sha256sum] = "3d28f0325e00effc6c23c50f916d153524aa393623df2fd1fc8ae0f6a12daf94"
 
 RDEPENDS:${PN} += "binutils vim squashfs-tools python3-libarchive-c python3-magic python3-rpm"
 
-- 
2.20.1


