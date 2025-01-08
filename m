Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EA50E77188
	for <webhook@archiver.kernel.org>; Wed,  8 Jan 2025 21:17:24 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.32440.1736371037891766575
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jan 2025 13:17:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=byWco3KX;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2166651f752so3458405ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 13:17:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1736371037; x=1736975837; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iV2OkE8iZaHqm8STLHYeUbi4GZvGCB3bsT+W7/huhZ8=;
        b=byWco3KXSwybCbIKCCKhGzNEfzSPD7PaPRGLzsDUsbr5yccS31PTP4hMfcQ5r3Cbfl
         zplfYkNIcCRi/ARazJFmAzgfOcFiQTO8Xyl42ce201SBE9T2dewMGTGfu7d0m4Xqye1v
         J0nTlI17yokmusSmN7Fi9kRwBKRsozUG878Kph+4LbDqeygXxI+wqWueRXKeuQGc0frj
         SbicmdTFAx/jvBbLqOsIPXoBaNbidD08aR6gxDbHVY5dydyQEBySbrjgwe5oBbYAu1OJ
         o12C/dXD0xgfgMsRn0b2ZYEEAg73BWQk11rgc4uudyNB+vjZhUD2XrQbqdLYAnWDyn/3
         NZBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736371037; x=1736975837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iV2OkE8iZaHqm8STLHYeUbi4GZvGCB3bsT+W7/huhZ8=;
        b=cmUSS3FW+Idove71j6tyE90sRoMbooZVnNpKqwU8g/MNyUvYs5Okasgz7HYh2bcDuH
         NEme/8QQr93NT6h6/72TjAwnIl3J8SXjpQhRRsZbvtf/Ko4T/srOAqKx6WygOGPsg2ah
         x6kLzbJSkrVu2o7+w/hpoNLaCkel0tmougSOtL1JM1/FKTw91hKYjhBtpADVtie1Z4sG
         D6JC0bOrv8xL6dc9kmN6CHv+5oruPya0LEJKTgdT9F//Tp2rNOCmXZ3eM9g7qiC0gLOt
         SskzLd3gJ1cJ9h61xJdPXz+0Dcmrr4Helgr6vFnfggOHyj7qEv+6CmGkzYyCxz7YA2GW
         IrHw==
X-Gm-Message-State: AOJu0Yx73fHKmJM+zX5BEY35PCKSNIF5j0z0M5EWUmi6BDmTp8o2a6fl
	OQXkVRz/ZcZP8nKvbBPnY0om19YZ0GQDPV8b3LSQPbgh0MjFkX4CAF2UE5DeGJpnKHsYQXqNs67
	EqFU=
X-Gm-Gg: ASbGncs5ftfLAbLEuX31wXfeWO8ZsqM4n8dZG85HIcziCTmH21G+JTeW4lFcAVo97u1
	DcobM46LOkNiHW+9cY6vhZCZ35cOxTt7H05fO8c5VuLpEKmlxRAE0mWrG7fNGlnq6nt6dsxUH9p
	hTLuplJoPjnS2/DkRkwvQ5U4WHfxSSGWUuJ0hxrvd6I457fMA8BFXuxNVI5MyrqtRxiMKzD4FQm
	wY+HMkjqPrLHgK8kqLQ4wLVZmYToOWwy+RWMhKsO7NIFQ==
X-Google-Smtp-Source: AGHT+IEdNuV0rrt0N7dSsb4R1cu3mDsW/LBlAHMZ08XdjAaOWe58VTTfiSoNh0G+xFkN9rnXCXjMeQ==
X-Received: by 2002:a17:902:ea08:b0:216:6ef9:621 with SMTP id d9443c01a7336-21a83f765famr61318965ad.31.1736371037143;
        Wed, 08 Jan 2025 13:17:17 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9cdd9bsm331403495ad.132.2025.01.08.13.17.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 13:17:16 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 01/18] cve-update-nvd2-native: Handle BB_NO_NETWORK and missing db
Date: Wed,  8 Jan 2025 13:16:51 -0800
Message-ID: <0a41b929ae3f768e3aa6917233f39ff30d71eab4.1736370890.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1736370890.git.steve@sakoman.com>
References: <cover.1736370890.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 21:17:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209591

From: Mark Hatle <mark.hatle@amd.com>

The custom do_fetch routine is ignoring BB_NO_NETWORK, add a check for this
as the correct behavior for the user is to set:
  CVE_DB_UPDATE_INTERVAL = "-1"

If CVE_DB_UPDATE_INTERNAL is set to -1, check that a DB file exists, if not
we need to error so the user can deal with this.

Note, MIRRORs are NOT handled by this code.

Signed-off-by: Mark Hatle <mark.hatle@amd.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 337c0806d2784d74bee8d6420fb8b4d48795d5fa)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/meta/cve-update-nvd2-native.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb b/meta/recipes-core/meta/cve-update-nvd2-native.bb
index c05c47d42e..441559471f 100644
--- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
+++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
@@ -68,6 +68,8 @@ python do_fetch() {
         update_interval = int(d.getVar("CVE_DB_UPDATE_INTERVAL"))
         if update_interval < 0:
             bb.note("CVE database update skipped")
+            if not os.path.exists(db_file):
+                bb.error("CVE database %s not present, database fetch/update skipped" % db_file)
             return
         if time.time() - os.path.getmtime(db_file) < update_interval:
             bb.note("CVE database recently updated, skipping")
@@ -77,6 +79,9 @@ python do_fetch() {
     except OSError:
         pass
 
+    if bb.utils.to_boolean(d.getVar("BB_NO_NETWORK")):
+        bb.error("BB_NO_NETWORK attempted to disable fetch, this recipe uses CVE_DB_UPDATE_INTERVAL to control download, set to '-1' to disable fetch or update")
+
     bb.utils.mkdirhier(db_dir)
     bb.utils.mkdirhier(os.path.dirname(db_tmp_file))
     if os.path.exists(db_file):
-- 
2.43.0


