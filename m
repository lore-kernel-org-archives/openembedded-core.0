Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69BB6C43458
	for <webhook@archiver.kernel.org>; Thu,  9 Jul 2026 10:07:28 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5814.1783591638313069854
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jul 2026 03:07:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Dik7X3RN;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-493b77b150aso13231705e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2026 03:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783591636; x=1784196436; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fDkT9xPH1h1E+AKakJANNa/nIGstryzl+fuiatN2iu0=;
        b=Dik7X3RNEEwC0iaAJNnCZxuypKHI2pvVZTk+XQanjZfgOPTKbKeksJnhsBBFsaLB9s
         nUw2MqvqlORWzP7qxFqwm/buYBpRJtDGfySoG9M9fV1YWOF4efXBojUrlfnRK1pDx+r4
         fBGFilO2vcaghJfDqt0apjGqCMYxoC8bM8aic=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783591636; x=1784196436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=fDkT9xPH1h1E+AKakJANNa/nIGstryzl+fuiatN2iu0=;
        b=DGhCJYVBTvpNpsOT5mBrrht4M4VtjaAzBbbGpcIEdxYjZHlBZWGifKGOmunlZ+zRhp
         MjKAHu2vZJVcET4Rq7BvGkW6oiWi7Et9vWTYS0RuTk+PYog9PJraYNsKaIr+4Nro1RkW
         kqrHaLaXEeVr4dbnSxYI44fJwM98g1xwnw3aBOUtzkj7/18DcjUuKXrjP8xT2C4L5iN4
         GpvkT9QAFWvDLghW/iYSorZ0s5nUPfac3OTdJ5WUANHsJNStF473uXqjX3bc3Rd8AKIw
         OBd9EmIGmjFYQzj7c1lwq0u30xitu5Vf+8Xy8cvXJdSX/MThKqX40hpuZwW48X7PofCU
         wA8w==
X-Gm-Message-State: AOJu0YwTBG6h5zxa/FYr0Axz+5d9/p1cDZQ5y3SFMX7uTL6Ae4UipLP3
	zZ1vn4XrbeCDr91SvyYV3n1PlOEogRIlcFbmBNvF2o2Xfk913iySVJ21Ec7wpSZfcyYzqHbB3dE
	IcJTuOlQ=
X-Gm-Gg: AfdE7ckj3S8ctg2e2qhPvru8tLu849DjM5iwlygmSGIlQK/9EpB+UKsvtYUOLaiRg+b
	ix2YnnZg2P6EkkIQHYdxCaPoHqZs1jV4rcEGCAlmWkr67gXYZXjQH34sQ+SKG257042dUgEpDMR
	CalWVn4BmE6pjTmcMilpEs6B5K2EWnmWUt/f8dCqvAoqsZCWDEVSrG4QPK9VMxUQzKWWlTSWJFC
	Ci81J3HX65JVU21fgjeFEUNCjfdBXQzkiTrEmEEhccjkuGA8+FpnYl9Ajlvz6xG6pz7f5yskdc9
	9gbvfrGFE2kLYamf9jjRC2uqgyJx8GtKwNKzoGu3n7YlZHHUvScqdMH/SiGwxDyXMNjZi1fo7JT
	mhJ3Ha0vfbxf+YXgywrtEhGr2Y7izsEFRRUoLiQ5n9LLus9kB47UJkYu/vrURd1FBWmf/Pr/gg3
	LxLDgyGgQwLCtc/QA4z1f+qzrkXnz+QkLqcIuxv/lpBzS4Fj2tkmMa25dsKrr3jQcm+Qm6vKUjm
	mvOZp1NWwjC32BphQ==
X-Received: by 2002:a05:600c:4512:b0:493:b7cb:c5f with SMTP id 5b1f17b1804b1-493e6893c66mr61369595e9.11.1783591636443;
        Thu, 09 Jul 2026 03:07:16 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00fd88810a86c49142.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:fd88:810a:86c4:9142])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e5a5d174sm149687135e9.2.2026.07.09.03.07.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 03:07:15 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 25/25] cve-update: Avoid NFS caching issues
Date: Thu,  9 Jul 2026 12:06:41 +0200
Message-ID: <728706a9dc79a8c70429b805fc40429bcd8e09fc.1783590688.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783590688.git.yoann.congal@smile.fr>
References: <cover.1783590688.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2026 10:07:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240572

From: Paul Barker <paul@pbarker.dev>

When moving the updated CVE database file to the downloads directory,
ensure that it has a different inode number to the previous version of
this file.

We have seen "sqlite3.DatabaseError: database disk image is malformed"
exceptions on our autobuilder when trying to read the CVE database in
do_cve_check tasks. The context here is that the downloads directory
(where the updated database file is copied to) is shared between workers
as an NFS mount. Different autobuilder workers were seeing different
checksums for the database file, which indicates that a mix of both new
and stale data was being read. Forcing each new version of the database
file to have a different inode number will prevent stale data from being
read from local caches.

This should fix [YOCTO #16086].

Signed-off-by: Paul Barker <paul@pbarker.dev>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f63622bbec1cfaca6d0b3e05e11466e4c10fa86e)
[YC: removed cve-update-db-native part, file was removed in
17eb0788514 (cve-update-db-native: remove, 2023-06-23)]
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-core/meta/cve-update-nvd2-native.bb | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb b/meta/recipes-core/meta/cve-update-nvd2-native.bb
index 945bd1d927c..303309bebdc 100644
--- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
+++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
@@ -88,8 +88,13 @@ python do_fetch() {
         shutil.copy2(db_file, db_tmp_file)
 
     if update_db_file(db_tmp_file, d, database_time) == True:
-        # Update downloaded correctly, can swap files
-        shutil.move(db_tmp_file, db_file)
+        # Update downloaded correctly, we can swap files. To avoid potential
+        # NFS caching issues, ensure that the destination file has a new inode
+        # number. We do this in two steps as the downloads directory may be on
+        # a different filesystem to tmpdir we're working in.
+        new_file = "%s.new" % (db_file)
+        shutil.move(db_tmp_file, new_file)
+        os.rename(new_file, db_file)
     else:
         # Update failed, do not modify the database
         bb.warn("CVE database update failed")

