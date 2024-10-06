Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF434CFB424
	for <webhook@archiver.kernel.org>; Sun,  6 Oct 2024 06:57:33 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web11.26975.1728197850325346895
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Oct 2024 23:57:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JxG4DWMm;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5c88e45f467so5581202a12.1
        for <openembedded-core@lists.openembedded.org>; Sat, 05 Oct 2024 23:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728197849; x=1728802649; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h1T3KpAIM2guphguUjiyxTOpOGO+lHykiY2BFbP/vus=;
        b=JxG4DWMm0T21aCksy5IZgC5x+o1RWxsJd4ywrgE65FQzscnJpBYwrpRJiPC9qxBZ1x
         wnFV+PFzY/fZJqa6tlG+L+MY/M4hRlePmu6JyGSgqONFmtng3/egHkb841xbCwwWRtdE
         Pl/UbQtXsK2rAedRDoG+kjb3aE0+499PeyM6bYQW/pBmDHdHpEa6KAbpG5ct4pLkgMNl
         YRXfkLM8nsGteIY6/m30AZ5q1x+M5eTbf34o8zettReUDBB+kGXHaql5p1AsU5mjJFgb
         9zg6R97V39yK3R3r2hLT4uq5hn3tKKf04/fsdDoxvcOKP7lRUkYYzObszSCUenVD6uVN
         Ph9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728197849; x=1728802649;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h1T3KpAIM2guphguUjiyxTOpOGO+lHykiY2BFbP/vus=;
        b=gPxV9CgX1cRtPFQjqyMq9LsxM4CECaEPFUqONdA01BbkmjkagFDYL14Ffzgda3P7Vz
         vxwDXisCT2CAEHJ9l47yQuYQqR9d9aWSzzisPOZYN6ox+gOpMGlnYMV8cK9BJ+nNxVVg
         hkfNe4heb5koKdN60Pf489bPvtxC9BiMPnkw7P/4hAgehgXoU5t8KrcOVmsfv7frV+TI
         SvCQKyqQepgLmaECkBh9ydO/UWjIwCUoVuTansKlEpPkigu/eeOpDeQmqvjuiRMWkERx
         PuzffwLfXevht1XE5VsjEssK78cDJABDrczoRD/P7Ie3XGpLbvTZmCbr2MWIc61NEEIh
         6LJg==
X-Gm-Message-State: AOJu0YxNU+hCsHdRcrKuK0iFMTjLXJOD5zjbydDZ3f0rCyvAbbXlLLYg
	hQdWyHwysuIt5hSBx2VpQ88E5Jp+nbzFDbTVXEHiQhnxqphsMfi/HpKaUw==
X-Google-Smtp-Source: AGHT+IGLPAJXK5WWJMQ/wcI3/Vchm2OubcTTNA+pwbAqbFEU+S/H30ENLnqSBtuaIS+lT/1Pwd2kUQ==
X-Received: by 2002:a05:6402:e82:b0:5c4:178a:7162 with SMTP id 4fb4d7f45d1cf-5c8d2fb37cbmr8120305a12.19.1728197848453;
        Sat, 05 Oct 2024 23:57:28 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c8e05a92c3sm1761448a12.25.2024.10.05.23.57.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 23:57:27 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Martin Jansa <martin.jansa@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap][PATCH] meta-world-pkgdata: Inherit nopackages
Date: Sun,  6 Oct 2024 08:57:23 +0200
Message-ID: <20241006065723.2926-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.46.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Oct 2024 06:57:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205241

Since this is a recipe with PACKAGES = "", inherit the nopackages
class to skip the various packaging functions which wouldn't do anything anyway.

This fixes errors from buildhistory changes where packages-split would be empty.

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/meta/meta-world-pkgdata.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/meta/meta-world-pkgdata.bb b/meta/recipes-core/meta/meta-world-pkgdata.bb
index 0438bf6138..954675f383 100644
--- a/meta/recipes-core/meta/meta-world-pkgdata.bb
+++ b/meta/recipes-core/meta/meta-world-pkgdata.bb
@@ -27,6 +27,7 @@ python do_collect_packagedata() {
     oe.copy_buildsystem.generate_locked_sigs(sigfile, d)
 }
 
+inherit nopackages
 deltask do_fetch
 deltask do_unpack
 deltask do_patch
-- 
2.46.2


