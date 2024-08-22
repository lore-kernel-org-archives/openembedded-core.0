Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEEB6C54722
	for <webhook@archiver.kernel.org>; Thu, 22 Aug 2024 09:35:30 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web11.9385.1724319329164453357
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Aug 2024 02:35:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HweNkOBs;
 spf=pass (domain: gmail.com, ip: 209.85.208.174, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2f3f163e379so8514481fa.3
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Aug 2024 02:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724319327; x=1724924127; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QxsVI/O17OUubJNJ+IxtE33L7lteICzmjFhQpTEyMG8=;
        b=HweNkOBsVTCQsMtobKqDC/RZSkO/dYoYOk/SvqTn6zd/+4LKEzl6C0413pDkOUWuxK
         CXt403i9CEbZjvmFObgACPgDdbCr86BFE3q+PT6JBwMpJXE7ifbumnep979VOX3ALpNZ
         7hjCtrAl8a2xNNXcr6I6H+GeKoIxfWwHGutvfdWyPPWphDt+8t+/HQxvBqTjL44F/9DF
         Tqc1pRrSCUbjXL0Phv/4ifON60gdMl3TkeBctHZu/RXc0qNUzTMZlb24dzfxJXaf+Cwj
         mDkZnb/drjCcEgZGAcJ6MLumdDB+t8tG87u/0Cqeg15wDaTqRjx4tPzc0C48c+EJHdXP
         X6/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724319327; x=1724924127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QxsVI/O17OUubJNJ+IxtE33L7lteICzmjFhQpTEyMG8=;
        b=mpNz/dB7PVuDtUMfXivzWRc+pyKMXeeu4komtfNPBaUfTROLIjFW2pmqkmWWt2Zyda
         gvJ2zfkGSymOyJ18le4iTbpmZhrkAcGnhsnM31asLX5CDGNlw3BYEEpYEqi5Zl4P5Haw
         DHLnv9MHE2EVBoK2T7SkATbIcwwUzJJpM4cOW5DURrNmJmWUskD6sNcuHOC7xpTA5LU3
         2YGFzAa5JXN076LfADgEY3m7p/gTMIr/eiiasBEULIHcS3jEU3QZnldXiCmdk08uBL8b
         h5yaw4FuraVkJsg1+DkBl3IHsO6r+AgNfUcL85YoAlLdJiWKPpJ66LPIj+Qtp9EyKogt
         OVlA==
X-Gm-Message-State: AOJu0YyGWQu2mzMAq5QFozlRNA7LPpNhuQtP0SE0PXMD21rXp9rLM61y
	VOIPfUh3KiTPDp27agOT5XeMxs3CZSr2zOw4P+e45/uf9djjI/aF/C0J9Q==
X-Google-Smtp-Source: AGHT+IFDolKv+y0Nqsw7a36B2Uu5KWv65kGWgBDQh34S8ZfC9C6QSfVwVrXgvZST7uVO01gm7mxtYQ==
X-Received: by 2002:a2e:9e41:0:b0:2f3:f182:49f3 with SMTP id 38308e7fff4ca-2f405da8d68mr9189731fa.22.1724319326591;
        Thu, 22 Aug 2024 02:35:26 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c044ddbce5sm698502a12.4.2024.08.22.02.35.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 02:35:26 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 02/32] sysvinit: take release tarballs from github
Date: Thu, 22 Aug 2024 11:34:51 +0200
Message-Id: <20240822093521.36790-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240822093521.36790-1-alex.kanavin@gmail.com>
References: <20240822093521.36790-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Aug 2024 09:35:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203617

From: Alexander Kanavin <alex@linutronix.de>

Upstream no longer publishes them on savannah, e.g.
release announcement for 3.10:
https://lists.gnu.org/archive/html/sysvinit-devel/2024-07/msg00016.html

There's been several new versions since:
https://github.com/slicer69/sysvinit/releases

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-core/sysvinit/sysvinit_3.04.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/sysvinit/sysvinit_3.04.bb b/meta/recipes-core/sysvinit/sysvinit_3.04.bb
index fb9d00891c6..27ab4162a79 100644
--- a/meta/recipes-core/sysvinit/sysvinit_3.04.bb
+++ b/meta/recipes-core/sysvinit/sysvinit_3.04.bb
@@ -9,7 +9,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
 
 RDEPENDS:${PN} = "${PN}-inittab"
 
-SRC_URI = "${SAVANNAH_GNU_MIRROR}/sysvinit/sysvinit-${PV}.tar.xz \
+GITHUB_BASE_URI = "https://github.com/slicer69/${BPN}/releases/"
+SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BP}.tar.xz \
            file://install.patch \
            file://crypt-lib.patch \
            file://pidof-add-m-option.patch \
@@ -27,7 +28,7 @@ SRC_URI[sha256sum] = "2a621fe6e4528bc91308b74867ddaaebbdf7753f02395c0c5bae817bd2
 
 S = "${WORKDIR}/sysvinit-${PV}"
 
-inherit update-alternatives features_check
+inherit update-alternatives features_check github-releases
 DEPENDS:append = " update-rc.d-native base-passwd virtual/crypt"
 do_package_setscene[depends] = "${MLPREFIX}base-passwd:do_populate_sysroot"
 
-- 
2.39.2


