Return-Path: <max.oss.09@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFF69D74EFF
	for <webhook@archiver.kernel.org>; Mon, 26 Jan 2026 09:38:15 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16694.1769420292006475055
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Jan 2026 01:38:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PuRb6x6G;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: max.oss.09@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-42fb5810d39so2677680f8f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 01:38:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769420290; x=1770025090; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vmkhXMvWHAL6KakDPR7IQuTUvksw4Zc9UqYMZGvqNhc=;
        b=PuRb6x6GFRx6jfB1HvWYF6tH4UTRDkatF3kMMX6T8z/PXlyMj7YI1azfKsyrwj1Fx+
         nB0JM3mK6o/62a0Vp0xwi3PmjasKdBt3xxoeWltEHUctEW/z+SWyEtEi+coFzi1ebooZ
         KNh51lP0Emc17SpCOsvvU3w818VcA2oGY9sdO1Q37+vyQlbOqebaPVl5A5ZrFVWr79LK
         NvVEey+Vz9V82pWpj1ThlP+NRjLO9av80qMYlHat4QV+vWM/gxGGTBREOHPc0oNflfOj
         rmP7J4Nop01Fw9/0LcHOqeOvTwxrVTTtwhXVAC6QDfgrFhowcBePz3qGDLtK5ZdlN7T5
         QZIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769420290; x=1770025090;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vmkhXMvWHAL6KakDPR7IQuTUvksw4Zc9UqYMZGvqNhc=;
        b=K2e4SWJvLNSVHiUMvwTJba+UxogZx06kuC41Qo69YAkDXYiJ9tzSzAwEl0NoToH+IZ
         2CWIZMfLOhF0qXirUbqx/+pifN52ES1QGOnjaHTnRHC+s2JYTaBH7hXNPSDLnt0oZVb4
         MpcYuA9avJRbqHoRiFAP4qk6PeTr92VjnTgdvh++9yc97k17Br8Lj77Mh+KGPXEdKeTD
         CYAZdNCYwJnQSPI7aYioM6EWffBaNk6KkOoZh9faNo8x4/gJNAjkq1HfCvJpgYVJnMJw
         7KYmaZr+H21V/Td2FeAMP1Qs19m1Gjjf7iXZjieMvUmpXX95fWggFJ0PHJlwQhRglDPO
         0vMg==
X-Gm-Message-State: AOJu0YxwywkZQr+Y70O7bzed1JuLKek3PLdKdbhkSEVIl+DmJuYBhScN
	LA0S8VKn3PMn3lAzf8oftnQEb3spjd8nxIchCSU+lR7jr4XlJgsFQz+X4NtPoA==
X-Gm-Gg: AZuq6aLh7tiVl5xD8iWjXyTR4ZU1gzrztwrsN7He3PUK5hbXuOoRFreDTYbn7rIJyhO
	kNj9nxYo5no0W9swBR69iAWLRO3O/87Yqu+b0/PuegvQ/im3Sz/bs0W8q/mSlqBhe/99BNgifwh
	8vGcGEUtzReHpWYaBah1PY8OALb1D1bA5dPsIOtbA4WuNzPyxfXAvHlXPjngmCDrlaYRLtW0atB
	njdY6sc9Ey7na3jYS3M/w2wqb2hYtoyM+tZaUwjnO2qgpQQe/bwf8XAhsuTKrWW9wcvOxK5hmFQ
	R7D1LRmUE0fvSnOlollOMmGg3Sv43NXge03GTJpSuvVJHa5aXgPoDGq/TYG/TPlxBH1J0uh2hHE
	bfB5nN4ztGk56bllRg7mktsechnRuuURGBHk1hPCNPk5Tr+n4nfNglnzU+3nY4LrR4Ocr/eTXLG
	ndApXYsQBM9Q5A11j3DWfXQbOxfaoh64fvaM/UkJ/+hqkztp+RqVZzjBnUVlB/AiSNLEecLsQo5
	zrfAzr7I3dJHyND2iCUsgY6Nt4=
X-Received: by 2002:a05:6000:178f:b0:432:8537:85ca with SMTP id ffacd0b85a97d-435ca198cd4mr6042392f8f.50.1769420289803;
        Mon, 26 Jan 2026 01:38:09 -0800 (PST)
Received: from toolbox.int.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1f74942sm27818479f8f.36.2026.01.26.01.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 01:38:09 -0800 (PST)
From: max.oss.09@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ross Burton <ross.burton@arm.com>,
	Max Krummenacher <max.krummenacher@toradex.com>
Subject: [PATCH] alsa-utils: fix packaging of alsabat
Date: Mon, 26 Jan 2026 10:36:55 +0100
Message-ID: <20260126093655.2552127-1-max.oss.09@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 09:38:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229975

From: Max Krummenacher <max.krummenacher@toradex.com>

If bat is in PACKAGECONFIG two additional binaries are created which
by the dynamic package split creates two additional packages.
However due to explicitely adding the file alsabat-test.sh to the
alsabat package the alsa-utils-alsabat-test package now is empty
and not created.

Complete commit 4c6d5f96990d ("alsa-utils: fix packaging") which fixed
the same issue for all other affected packages.

Fixes: 26a28ee79350 ("alsa-utils: dynamically split the packages instead of doing it manually")
Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
---
 meta/recipes-multimedia/alsa/alsa-utils_1.2.15.2.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.2.bb b/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.2.bb
index 6d75bff09e5c..b792302c9fae 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.2.bb
+++ b/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.2.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
 DEPENDS = "alsa-lib ncurses libsamplerate0 bash"
 
 # Only needed as the dynamic packaging was altered, remove on upgrade
-PR = "r1"
+PR = "r2"
 
 # alsa-utils specified in SRC_URI due to alsa-utils-scripts recipe
 SRC_URI = "https://www.alsa-project.org/files/pub/utils/alsa-utils-${PV}.tar.bz2"
@@ -63,6 +63,7 @@ SUMMARY:${PN}-speaker-test   = "ALSA surround speaker test utility"
 
 RRECOMMENDS:${PN}-alsactl = "alsa-states"
 
+RPROVIDES:${PN}-alsabat += "${PN}-alsabat-test"
 RPROVIDES:${PN}-aplay += "${PN}-arecord"
 RPROVIDES:${PN}-amidi += "${PN}-aplaymidi ${PN}-aplaymidi2 ${PN}-arecordmidi ${PN}-arecordmidi2"
 
-- 
2.42.0


