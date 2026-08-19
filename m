Return-Path: <fabien.thomas@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0F7FC5DF8C
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 15:58:02 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10416.1787155076851396055
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Aug 2026 08:57:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=kvsFwtJ8;
 spf=pass (domain: smile.fr, ip: 209.85.221.52, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-47fe2d179e2so743517f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 08:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787155075; x=1787759875; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1nasIIslVor5G1xtUaSAT1GOHXVScZtOsNvDwXa+MYw=;
        b=kvsFwtJ8KgD2eI06zuh00f6FRqji9lt8PXerOSYdKgCgMvN6+bm9E/QZQZkY/E/vhi
         iI/bCNMa6INAuX6QJo2mJfpJcsXR9om0WQrLp+z3nF2KOFwdkYvr5oscWs40lBQt3/nT
         EKFNB/AY6sUkffB/R/zjFenumgzO/ZquIs2z0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787155075; x=1787759875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=1nasIIslVor5G1xtUaSAT1GOHXVScZtOsNvDwXa+MYw=;
        b=bAj90bAknScyySSWO5rprM/kI9x1J0KTBAdGfqAnpE0Ybab3NWcp7fwCL4ogwKQqMc
         f82bwnhvrM5ZlKCk+Rc1OZrpxztWt4u54HHmCzjC+7mv7bntY/cXyn+NpZkI6ANwV60V
         ON1krneo7b7GggAEUZ7FB+/YD1h0CHG3ud5QacxfHhzGLTHO/0D/8vo5p8tbw6Y9QU3X
         015OTyoZZhYn4HGwo8xiXlF1+S5gApUrSSf/zF3VY4FNqI0ofScluQmlokzIMJmRelHT
         oYqr3dBt+7QADZP+abU33WXwZteeTc2NzvqlBOJREK7RovIZYGpoASjNFQrSuATZb4B5
         f86Q==
X-Gm-Message-State: AFuF++mkSGaeVpUbZu1U1UNDgKpmxLPISsBH9YemsXQCBy59XRgH5eMW
	qZHL7OqOe8F5FpQZkaxGUjbaTdoysWFmV5Lfu/+Hx8vz2c4V7RppDpqtS8GVW4fMOA4Km7/9m9d
	HWe6kEB4=
X-Gm-Gg: AR+sD12CIB8dWAyWCV2W3c09qkB4xfsd6U2yda8xCsBqD5uc+aSPuJERe0ANyK3hDG+
	cZZYFM9lW1EPkAUHlYdWsrrY2ChCyv5HdEre+DTrwPZAxisOYPgY1QZisREStaI+j26cIMMfXnW
	HQOhFPFreLetSVYD8VLPdBIJw5/z4eQPx8FaeSmKW6B6oUIFCYjQIp3mKcAvVcxGT7KAMMVF4TJ
	aJXLhD153H/W+kGuKdyhjXclz9mqjyrzrVR0VuK8HoLafNAHOssFQSe6FLUFAZ5YEn7MackuuOg
	dawYnXJOntWr6mrGSStkG0XlqtBg251KVURMBgS7QaxDoDfr427k4Lg4276BqsJOtWIrLB00l/P
	oFXn1Md2J8ZcLzDVUU4hpFSzru5WCnqHZ1tREZhT4brhC/ptbaIGuLS6J+YH9DplbgzmTavhyTJ
	H00aX1WSNrlsEZsyLTMRJx9pvnw0OAf09AXNQ7BwTvE1TnlhwJ/1H0nRltiBOR5FyEmPwTGPRka
	VCgTf9ltcUpiD89o3wYvAZTQTmWOovWlvmZO28/I7HaMoRJYpMbqvGy8es4Eqg9E34qkJj1kwsb
	bjKexgLigoh4M8xt30iKSjPlTxwysqo5bewm+OQf
X-Received: by 2002:a05:6000:2902:b0:47f:90cb:630c with SMTP id ffacd0b85a97d-482b1e977c9mr9793608f8f.8.1787155075083;
        Wed, 19 Aug 2026 08:57:55 -0700 (PDT)
Received: from FRSMI25-GIGUE (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14d05a6sm7215698f8f.35.2026.08.19.08.57.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 08:57:54 -0700 (PDT)
From: Fabien Thomas <fabien.thomas@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 28/37] sudo: set CVE_PRODUCT
Date: Wed, 19 Aug 2026 17:56:59 +0200
Message-ID: <da121d1a9643a011d24dd5a23e26b1e6f779b09a.1787154074.git.fabien.thomas@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1787154074.git.fabien.thomas@smile.fr>
References: <cover.1787154074.git.fabien.thomas@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 15:58:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243764

From: Peter Marko <peter.marko@siemens.com>

This change removes currently open CVE-2025-64170 and CVE-2025-64517
from reports which are for "trifectatech:sudo-rs".

It also removes following "patched" ones:
* CVE-2023-42456 (memorysafety:sudo)
* CVE-2025-46717 (trifectatech:sudo)
* CVE-2025-46718 (trifectatech:sudo)
All these are also for "sudo-rs".

(From OE-Core rev: 00c2ea8cd0c1e1a1f841b8af0bacc6b9c179973a)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0459398d31f74e9653cb55a57d8d0f6bfbdfa2ad)
Signed-off-by: Devansh Patel <devanshp@cisco.com>
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
---
 meta/recipes-extended/sudo/sudo_1.9.17p2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/sudo/sudo_1.9.17p2.bb b/meta/recipes-extended/sudo/sudo_1.9.17p2.bb
index 90672ed7afd..69bd654d08f 100644
--- a/meta/recipes-extended/sudo/sudo_1.9.17p2.bb
+++ b/meta/recipes-extended/sudo/sudo_1.9.17p2.bb
@@ -10,6 +10,8 @@ PAM_SRC_URI = "file://sudo.pam"
 
 SRC_URI[sha256sum] = "4a38a1ab3adb1199257edc2a7c4a2bd714665eb605b04368843b06dada2cfcfb"
 
+CVE_PRODUCT = "gratisoft:sudo sudo:sudo sudo_project:sudo todd_miller:sudo"
+
 DEPENDS += " virtual/crypt ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS:${PN} += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
 

