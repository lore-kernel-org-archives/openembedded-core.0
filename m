Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CDD5C07E97
	for <webhook@archiver.kernel.org>; Mon, 27 Nov 2023 10:18:18 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web11.91592.1701080288171254633
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Nov 2023 02:18:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PpkVv6a7;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5488bf9e193so5529781a12.2
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 02:18:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701080286; x=1701685086; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bslA+CXrK7064boo5AbekifOd/qWeSEFX7mJOUC6b5U=;
        b=PpkVv6a7caYmtliwecvtPdxDOkQRM3hT5i4U3X9X8E+RtDvjWjIYFTuhSWGPUI4HXL
         HtMLYAxZllIkjXvphb1cEu5pcyECCgj1bGEcn+Z3ucEtxFjvhXkGdewHHb/IfFLvzRh+
         fDl6zbGufhphHKg8eTBe4ne0M8o1QFXOtzR0ufoVHEcN0xfy0gp0b+tuNXkBsUlc9a9u
         oMeoWo2xOS+mzqtrrrjwdBDoES76am3lyhdXaLXrA/+lKfAXlzPD2gKeBhPIuc5Zsb0g
         vEADwd/86rdNnlJ5f85YfyGYFWwDGXP1JsaXFSj678ztgrm5gjI3op8MFeMWZ/M8OUh8
         ntXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701080286; x=1701685086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bslA+CXrK7064boo5AbekifOd/qWeSEFX7mJOUC6b5U=;
        b=pZcIeqfCmfsXcwrRqA3ik+xKgp73t/SbSHNiYeBQORB25Ns9grn/QhshS0dKwD0t3F
         XkwXDCBgMkVJBUDblBBXtdhJSXFPXoeR+L5EzmbiISy6W4PSN5fGYo0ChXaKYNJq8f62
         gLq+It79eL4WfWsn8oQS08luwUZlevYaN7VbincTKH5umDkNCI3E5NiCV6/lWPisGNpW
         O/5MQAtWe7GLh3Y92V6kJ27gKp7lyBGGUyVvietzWNSYX+ETtUW4eEYCoBYrQSKrCHJ+
         JvXZpT5yg+bEgnTfUYzWjdV+KjZh0BquhFZ/nSRq4o+T0jHAcbs61XggVUU4A9e8+IDz
         NHig==
X-Gm-Message-State: AOJu0Yxep8j7cfIeVeEossyg9g5gy2tAS4ShaAkRIhELMkOHpZeT/Z3v
	2R8Mi6u/SMWz7205nE+IBIagEc3DWJM=
X-Google-Smtp-Source: AGHT+IEObBAQMj2T+rD/hEePIzn2QLhc/hLHrAPda/fMHfgoGmMnLt/1ynkm5uy69gXE3ds1L+iwRA==
X-Received: by 2002:a17:906:b248:b0:a04:cc0e:ff3b with SMTP id ce8-20020a170906b24800b00a04cc0eff3bmr8302867ejb.27.1701080286617;
        Mon, 27 Nov 2023 02:18:06 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id h26-20020a170906585a00b00a0bf09c9483sm2757203ejs.35.2023.11.27.02.18.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 02:18:06 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 13/19] mpg123: upgrade 1.31.3 -> 1.32.3
Date: Mon, 27 Nov 2023 11:17:45 +0100
Message-Id: <20231127101751.3187950-13-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231127101751.3187950-1-alex@linutronix.de>
References: <20231127101751.3187950-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 10:18:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191280

--disable-lfs-alias removed upstream.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../mpg123/{mpg123_1.31.3.bb => mpg123_1.32.3.bb}              | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-multimedia/mpg123/{mpg123_1.31.3.bb => mpg123_1.32.3.bb} (95%)

diff --git a/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb b/meta/recipes-multimedia/mpg123/mpg123_1.32.3.bb
similarity index 95%
rename from meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb
rename to meta/recipes-multimedia/mpg123/mpg123_1.32.3.bb
index b03ee9f71a9..3ea68b12a8c 100644
--- a/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb
+++ b/meta/recipes-multimedia/mpg123/mpg123_1.32.3.bb
@@ -10,7 +10,7 @@ LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e7b9c15fcfb986abb4cc5e8400a24169"
 
 SRC_URI = "https://www.mpg123.de/download/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "1ca77d3a69a5ff845b7a0536f783fee554e1041139a6b978f6afe14f5814ad1a"
+SRC_URI[sha256sum] = "2d9913a57d4ee8f497a182c6e82582602409782a4fb481e989feebf4435867b4"
 
 UPSTREAM_CHECK_REGEX = "mpg123-(?P<pver>\d+(\.\d+)+)\.tar"
 
@@ -40,7 +40,6 @@ CACHED_CONFIGUREVARS:libc-musl = "ac_cv_sys_file_offset_bits=no"
 EXTRA_OECONF = " \
     --enable-shared \
     --enable-largefile \
-    --disable-lfs-alias \
     --with-audio='${AUDIOMODS}' \
     ${@bb.utils.contains('TUNE_FEATURES', 'neon', '--with-cpu=neon', '', d)} \
     ${@bb.utils.contains('TUNE_FEATURES', 'altivec', '--with-cpu=altivec', '', d)} \
-- 
2.39.2


