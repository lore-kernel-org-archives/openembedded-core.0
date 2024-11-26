Return-Path: <hiagofranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E77B8D59D82
	for <webhook@archiver.kernel.org>; Tue, 26 Nov 2024 00:10:37 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.34492.1732579834899624208
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Nov 2024 16:10:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iwMc/Yx2;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: hiagofranco@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-212348d391cso49125015ad.2
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 16:10:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732579834; x=1733184634; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tLXSr1vmj8Ka16qBMCdT87AfWhry/3puiT/77AUXApI=;
        b=iwMc/Yx2y4IcsJHR4fFc6pWfMuEbEklNOsqTmyKo7ivm17SVoFgviUeEgbvtN/EwtT
         nEkf33bfpN1b0Qb8FkMHuz6z7okwbOz+iiNhV0zhpeR7IlETsjFi1MZfeGIDet7Sxe0K
         f7Lb34A22eejnQN/j7iGHmBQqkU0Zir5nzGbBxt0RbOPR5l213KMzcso2nZYBpuCnOy2
         GZATLsSw+74eO4TwLsUl0+ch7/qq+xyG6Lc+7MCt5jWCHhDNUfJqFBGwf7iHywtHstCg
         cEexbSc6FmY/RDVXgGv88AWyFhHXs/1rUEAAokskJAe2/Xw5r+Uq3PMNftQVvjpj0qRX
         Ijlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732579834; x=1733184634;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tLXSr1vmj8Ka16qBMCdT87AfWhry/3puiT/77AUXApI=;
        b=VjlMJ7BPeJ1I11zXyqUxa/G+ojkrcO6ApO+HkP5k4Hgn76PCVZrrVg6+LEOG4teWEQ
         J33DWqhiVB7B8XNoh883sf5TtBWPViAyBH56kVEu6/kHYB5qH0vo210WDkosSKkahFCD
         IwqbkeAkBju4V2iLZ3MBP2t5L5ESuHMGsLC+UAI1vZUuhLY/X6XbdOhjgRWsbVxjzShA
         ncAxsYRlrK9B9E4PYBaBL+S6vxvmQMHTliineYSmEuBCFBlNcVQO+NzChI7qM/vN6AQJ
         w0JzNTuwTBHELUPeWqbEKmOhuuKPSwM30n4+2i2oVCu293ep1rZc6UDF7x00gSEgXK6A
         zyag==
X-Gm-Message-State: AOJu0YzTHTsnh6i+QSUAVP/6Xr4FeN4Y9tOHo+kOHHoc8R4Z8FOjNXSa
	zTDLLFPXxs//2UO7lbfj0MYdurgB473401unWVjFKvbNfmE5UB0W7pqsCQ==
X-Gm-Gg: ASbGnctDgSIL6b9pPxrov5olo12m0rmpqwCNlxVVMQIkYH3HJTEBZ2fLdhvNczCGASc
	EawWgsYukQWVD0bKBK9PJhawTtCRw9S9g9FEU0tnkOVg5iD/8T9tW0DODLruQ1Omz+xmH9E+a0y
	8i7IjcxCaBslVbixTjiJetk/wulKCfJqHqLF6KkvVJpToEwxkz0TblX8hil085eHoQ/gAEgzyEa
	GQGq7sw2s/6R0WMjvqElmi19IvgduhR1BX/Hi/+O5uyixe2BCSPWFR/Bq8acZi/
X-Google-Smtp-Source: AGHT+IH0z3rKn+fkt9oueFnYCbyjflxoNtC7fSwocB41kCdpgpFRIO1SOxlBRXDhu4AGzm1Z+lvisw==
X-Received: by 2002:a17:902:f54a:b0:212:5bb9:90a7 with SMTP id d9443c01a7336-2129f68fb09mr180319625ad.20.1732579833997;
        Mon, 25 Nov 2024 16:10:33 -0800 (PST)
Received: from localhost.localdomain ([2804:1b3:a7c1:5c7a:1bbe:c924:2a5:636])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2129dba1b40sm71383655ad.87.2024.11.25.16.10.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 16:10:33 -0800 (PST)
From: Hiago De Franco <hiagofranco@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Denys Dmytriyenko <denis@denix.org>,
	Ross Burton <Ross.Burton@arm.com>,
	Hiago De Franco <hiago.franco@toradex.com>
Subject: [PATCH v3 0/3] weston: upgrade and add libdisplay-info recipe
Date: Mon, 25 Nov 2024 21:08:33 -0300
Message-Id: <20241126000836.6901-1-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 00:10:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207803

From: Hiago De Franco <hiago.franco@toradex.com>

v1: https://lore.kernel.org/all/20241120203005.1802141-1-hiagofranco@gmail.com/

v2: https://lore.kernel.org/all/20241123193527.1435268-1-hiagofranco@gmail.com/
  - Added hwdata recipe, with DESCRIPTION variable.
  - DESCRIPTION added to libdisplay-info and SUMMARY fixed.

v3:
  - Added lib_package to inherit in libdisplay-info recipe.

Hiago De Franco (3):
  hwdata: add recipe from meta-openembedded
  libdisplay-info: add recipe
  weston: upgrade 13.0.3 -> 14.0.1

 meta/conf/distro/include/maintainers.inc      |  2 +
 ...Include-libgen.h-for-basename-signat.patch | 45 -------------------
 ...1-vnc-Allow-neatvnc-in-version-0.8.0.patch | 27 -----------
 .../{weston_13.0.3.bb => weston_14.0.1.bb}    |  8 +---
 meta/recipes-support/hwdata/hwdata_0.389.bb   | 30 +++++++++++++
 .../libdisplay-info/libdisplay-info_0.2.0.bb  | 16 +++++++
 6 files changed, 50 insertions(+), 78 deletions(-)
 delete mode 100644 meta/recipes-graphics/wayland/weston/0001-libweston-tools-Include-libgen.h-for-basename-signat.patch
 delete mode 100644 meta/recipes-graphics/wayland/weston/0001-vnc-Allow-neatvnc-in-version-0.8.0.patch
 rename meta/recipes-graphics/wayland/{weston_13.0.3.bb => weston_14.0.1.bb} (94%)
 create mode 100644 meta/recipes-support/hwdata/hwdata_0.389.bb
 create mode 100644 meta/recipes-support/libdisplay-info/libdisplay-info_0.2.0.bb

-- 
2.39.5


