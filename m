Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31ED4D6ED35
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 13:42:53 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.10898.1732196567732001367
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Nov 2024 05:42:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UAc7RVJi;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-431548bd1b4so7660435e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 05:42:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732196566; x=1732801366; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XQHYFSUSbEbW8KsLV9VBvww0BAiTeSh7GgJqOYniBw4=;
        b=UAc7RVJi8Mclx2114ikJJdCdtjXAyafh7Z6HKsHTsvt+/bf1EZtOB1S2yOMmsrRRl6
         qw+TNLpsXWE55W0lvKAMk7rbyFa28e1QReHS0WlQlKkd3cUS7JlGUu3aruGe7//59iEq
         3EntbJk9GZeTfAGrW2vyuKRx5Vk4osWgNOZrBJ7+vCMobYuauOMTYCmxRdnOmCD6ot1a
         /bIGIO8ch6xkmDmyBsNMIfWgp+VcBeIL6/D6+IvHOkF+QhID6hfZ+rn1lq+UKAUY73Xe
         FSrjAdjaiCxYXr2fqD5A9qZAndlK8nJ1gfhveU6agqwg2rpG0gXcQfIZ4DQXwhjuZvit
         9pNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732196566; x=1732801366;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XQHYFSUSbEbW8KsLV9VBvww0BAiTeSh7GgJqOYniBw4=;
        b=CANJGGE+PgpJ2Vu5yPowFuXKG3VzX4VvOrKf5v/hQU0j+LmyZsmSJeQaxQToXbSLys
         cXslx8uENWtLqBejtOL9XrsN4ajjXqazP4ZW+FAGVZsgBheS7G2y4P88ZIIcUH+jTlTE
         2CSXXYHwR5ayG2086KAbO1gKhrlQs5P+A6OUH1+PZ/YgMWf9hOCZQJqlOcO8t/p8dBbZ
         b0PRu2+lJx9YZfEmlZItEukWWvv4eDqWZ/5zsun/dwUaYCdzbMrh8ghxq+wmgYP1U28c
         eNV2dlATtoXM/pvcv/nOdYMROe40Qi6G8Rbe/aV/15cKAkuoW7MriqeACMsVSD1wl0cI
         KRWw==
X-Gm-Message-State: AOJu0YxZe0U2nm1kX8a5bYAf//pWX/teeaGm1NAtui8ZRZIvysEpxzqy
	cIuu/LHiHq6KK1zFU+RUtmN85LLPYko3qknkjmRy0vU/amD1sx1KBSRa+w==
X-Gm-Gg: ASbGncvHYRIBmizZkxwe8j2MmWWm8hQxqefWwC1YmT+XGv2Hz74HwNx7TrXhiv0aRfN
	ebATv3pyYAiARtdFGRm4JOpkUnnk4PLA4I5Vje+wdjtvMkMDSbCn8WrrhnQ2ADIFRb8rqxJtTsp
	OF5AaBhTdO+mDc6fkhCtIwyqtlquHeLSi4t8xODxp78uomPGfyTDmbPlSie2CJnUvmjaRz0ezf/
	4TP6WmhknRgx2lKau+07SeLrw1KKO1KrJKUTp4+Sq+qWjczytxxBKN0eXLNR0SRgONsKfLmiTqZ
	8ccGvMc/RFc=
X-Google-Smtp-Source: AGHT+IGhebyGfwk2K7FU4FreeaI00S4ufn2tSZbsxjydg1Eu8oJ+LKe+P77KbSV9sw96GNfOub/cBw==
X-Received: by 2002:a05:600c:4712:b0:426:64a2:5362 with SMTP id 5b1f17b1804b1-433489b4777mr57549865e9.8.1732196566051;
        Thu, 21 Nov 2024 05:42:46 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38254910e82sm5060734f8f.57.2024.11.21.05.42.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 05:42:45 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [scarthgap][PATCH 1/2] package_rpm: use zstd's default compression level
Date: Thu, 21 Nov 2024 14:42:41 +0100
Message-Id: <20241121134242.1072796-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 13:42:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207533

From: Alexander Kanavin <alex@linutronix.de>

zstd uses 3 by default, while 19 is the highest and slowest.
It's not clear why 19 was picked to begin with, possibly
I copy-pasted it from rpm's examples without thinking:
https://git.yoctoproject.org/poky/commit/?h=master-next&id=4a4d5f78a6962dda5f63e9891825c80a8a87bf66

This brings significant speedups in rpm's compression step:
for example compressing webkitgtk takes 11s instead of 36s.

The rpm size increases from 175648k to 234860k. I think it's
a worthy default tradeoff.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes-global/package_rpm.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-global/package_rpm.bbclass b/meta/classes-global/package_rpm.bbclass
index 2e3e4e8c790..9a5d04c472e 100644
--- a/meta/classes-global/package_rpm.bbclass
+++ b/meta/classes-global/package_rpm.bbclass
@@ -10,7 +10,7 @@ IMAGE_PKGTYPE ?= "rpm"
 
 RPM = "rpm"
 RPMBUILD = "rpmbuild"
-RPMBUILD_COMPMODE ?= "${@'w19T%d.zstdio' % int(d.getVar('ZSTD_THREADS'))}"
+RPMBUILD_COMPMODE ?= "${@'w3T%d.zstdio' % int(d.getVar('ZSTD_THREADS'))}"
 
 PKGWRITEDIRRPM = "${WORKDIR}/deploy-rpms"
 
-- 
2.39.5


