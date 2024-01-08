Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 967DEC4707B
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 11:12:34 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.4404.1704712353059535833
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jan 2024 03:12:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=T4vGEmoS;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-40e4a611182so1930455e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Jan 2024 03:12:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704712351; x=1705317151; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JjoIYlTpaYoxmJ9h9Nk0WD8GLByDF+tuP6U4+PNij8o=;
        b=T4vGEmoSIQHXg2KcE6cQ45z9AZMBcpiKt1oYi0dpxuTIVXwvBvX4k7dh7+H3ZbRc+T
         V/uR+Xk2pF/27jaG69gFG4k71KB3ZioWYXNAu1x9Z2dPdZIPWOGWHBs/wI/zNMtjyaGY
         kDJ7nTrS4hSkjl/0kt0lABVJfc23KA0OqWMvglf5YQ25rWWrUNUtllBdR1mdYX4YlXKJ
         3+tgHTrxOgYFmZX+VgLakcedNoGnflf9jZDt3HmboQdftI4c805rHbabx7Hn9y3gowPe
         GoUrHRXEoZT0gL+7xbjVw+MVrgTej+iGETNmDpZGJq4DnZO+JE3llBU67nyn56PWbGyC
         YgWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704712351; x=1705317151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JjoIYlTpaYoxmJ9h9Nk0WD8GLByDF+tuP6U4+PNij8o=;
        b=n5GL3sFfxupsh1jVKL3QcTFUMOEiAnp4gYPcz/pe1ERl3t1+21h9sqXXt37bk6QZOJ
         /pSbIYrYDWi592yjjxrhIGi20pwfMyZu4mQP5HfCNVFbTq3oBCLGEfiX5H5pOhn6YENv
         Bmhfuz+ccLD+yE9aq9bRtXC1rJa8Wxozm07uN5+gsaLaiueyi9W9IlKmrl3D4omr3tl6
         iB/YafYwemQUKROhRE/pUErt7n99YbXjbGZNbgC+5g25I90ZzshLWytJG38rkfrMseEu
         7tT9yGrx9V6QzvMObEjcTOBzzDmXSga/CQHkKFZ3jDnsEJIHGk2amcmG9szHvYEhzfUV
         YN/w==
X-Gm-Message-State: AOJu0Yzfsi1x16lj6mF8h92uLibpT8LnHi86J5KQ0rsLg2Z82GujSBo6
	9lagc/dgP/mgHa4yhJcW2aHM++lqflM=
X-Google-Smtp-Source: AGHT+IE1t8IG/vW1aLs/IfawYGvBBk1ywy+qjp9JBL6v204ar0op5M6uVtT/TwRBgRreGQDRu4Tz+w==
X-Received: by 2002:a05:600c:ad7:b0:40d:5ceb:82fc with SMTP id c23-20020a05600c0ad700b0040d5ceb82fcmr1764053wmr.42.1704712351525;
        Mon, 08 Jan 2024 03:12:31 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id s11-20020a05600c45cb00b0040e395cd20bsm10523886wmo.7.2024.01.08.03.12.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 03:12:31 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 3/3] icon-naming-utils: take tarball from debian
Date: Mon,  8 Jan 2024 12:12:27 +0100
Message-Id: <20240108111227.3261354-3-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240108111227.3261354-1-alex@linutronix.de>
References: <20240108111227.3261354-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Jan 2024 11:12:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193400

Upstream website has disappeared; the tarball can still be downloaded
but this is probably not for long.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-sato/sato-icon-theme/icon-naming-utils_0.8.90.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-sato/sato-icon-theme/icon-naming-utils_0.8.90.bb b/meta/recipes-sato/sato-icon-theme/icon-naming-utils_0.8.90.bb
index 67cbd031002..5502b66905d 100644
--- a/meta/recipes-sato/sato-icon-theme/icon-naming-utils_0.8.90.bb
+++ b/meta/recipes-sato/sato-icon-theme/icon-naming-utils_0.8.90.bb
@@ -14,7 +14,7 @@ DEPENDS = "libxml-simple-perl-native"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-SRC_URI = "http://tango.freedesktop.org/releases/icon-naming-utils-${PV}.tar.gz"
+SRC_URI = "${DEBIAN_MIRROR}/main/i/icon-naming-utils/icon-naming-utils_${PV}.orig.tar.gz"
 SRC_URI[sha256sum] = "044ab2199ed8c6a55ce36fd4fcd8b8021a5e21f5bab028c0a7cdcf52a5902e1c"
 
 inherit autotools allarch perlnative
@@ -26,4 +26,4 @@ do_configure:append() {
 
 FILES:${PN} += "${datadir}/dtds"
 
-BBCLASSEXTEND = "native"
\ No newline at end of file
+BBCLASSEXTEND = "native"
-- 
2.39.2


