Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D5A5C54EBE
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 11:06:11 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.9361.1672830356464596205
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 03:06:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=S8tClDtt;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id z16so16084576wrw.1
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 03:06:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xL7+eHbgItkNVKPRAxs53TNqAaIO/qwI/3ddH9Pu50I=;
        b=S8tClDtt4YLIxgF2QoPOMOfxAOo9Zj8LSqGSYWycm4UGgOX+M5JUyA89tBxeH52Hkc
         lCho4GBq2ymjEbqb/fC+etmRKuDR1o+kGx84xWH2pbWL2M/DRl0UkSJHKPWOefge62Pc
         VzWR1uj5v2foin0L4XNCxCA6PwcO3KYTZeffZfutWiGURE1rG615KP9pQ1atvk/ot47x
         gK2agpLi4w1P0pRF7irYgOVbRtdWj9eIShFhoi7fZ9vsU8kKfkVYWQsc/2tgzbRWCj/+
         BnXEToff+Qhhzwm4NPuyJrAQgzJeRrcA+cZOvXHvmKYIh4ksRoTAjt3cdOmikS/9DwmE
         ad7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xL7+eHbgItkNVKPRAxs53TNqAaIO/qwI/3ddH9Pu50I=;
        b=A/h0iKGRoWCuAhVMc2x4/vy6J6q94Qc179K+cuUPnsMu/+0nXGvMEzOqYMq7QPH0Z4
         TPyliDWIJYE9Pc8+IA1VFZs3EbXiUD5NI8ueTR2Cr0l1QSFAxmBoNsoTPlvTPl4LdmcK
         KShrRgm9nU9dPxjZxmdGSipgJy+hnD2zPYmjePrCm7UVV6s9vWrCzWHg/S0OZUBgfX6a
         QUogT4xmYus6w0BkrWYc2uvE8PtXVTFFZbXDCvXrYNb8CCGyBTQ2RYB25JZ7k6+QhreN
         RLWzuiks5OSF+/zcW4Hnqt/2dhtdU1eo6HWqcqgmyYWub1ePVDtCjXcZ1lk7E1/khdUd
         3FUA==
X-Gm-Message-State: AFqh2kp6FvKtiiSWB9XxEaz4Xj6XvTxwAP7M6Nu6TFzaJamARpj/wriF
	/NOXYYm+mT5xXywrTtbrkbvZo4trFzc=
X-Google-Smtp-Source: AMrXdXsQc6bxugGDpsNEwJgSQhb26EVOQgLiPWcx68Vq7ZLpf4zYhdGaiZkew1RejuKaqKc52YnIBA==
X-Received: by 2002:a5d:6890:0:b0:2a3:3ece:bf5a with SMTP id h16-20020a5d6890000000b002a33ecebf5amr1162356wru.61.1672830365889;
        Wed, 04 Jan 2023 03:06:05 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id h15-20020adfaa8f000000b002421888a011sm34102161wrc.69.2023.01.04.03.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 03:06:05 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 17/77] python3-attrs: upgrade 22.1.0 -> 22.2.0
Date: Wed,  4 Jan 2023 12:04:48 +0100
Message-Id: <20230104110548.2537259-17-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230104110548.2537259-1-alex@linutronix.de>
References: <20230104110548.2537259-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 11:06:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175401

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../python/{python3-attrs_22.1.0.bb => python3-attrs_22.2.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-attrs_22.1.0.bb => python3-attrs_22.2.0.bb} (82%)

diff --git a/meta/recipes-devtools/python/python3-attrs_22.1.0.bb b/meta/recipes-devtools/python/python3-attrs_22.2.0.bb
similarity index 82%
rename from meta/recipes-devtools/python/python3-attrs_22.1.0.bb
rename to meta/recipes-devtools/python/python3-attrs_22.2.0.bb
index ba07ac71e3..20dccc6639 100644
--- a/meta/recipes-devtools/python/python3-attrs_22.1.0.bb
+++ b/meta/recipes-devtools/python/python3-attrs_22.2.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.attrs.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5e55731824cf9205cfabeab9a0600887"
 
-SRC_URI[sha256sum] = "29adc2665447e5191d0e7c568fde78b21f9672d344281d0c6e1ab085429b22b6"
+SRC_URI[sha256sum] = "c9227bfc2f01993c03f68db37d1d15c9690188323c067c641f1a35ca58185f99"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.30.2


