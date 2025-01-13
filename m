Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB6CAC02185
	for <webhook@archiver.kernel.org>; Mon, 13 Jan 2025 20:47:18 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.28729.1736801235601996930
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jan 2025 12:47:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=QuyR4t2H;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-21619108a6bso81842415ad.3
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Jan 2025 12:47:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1736801235; x=1737406035; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rgf5ZiJVnUsLIIIIlDSmo0hzeZ1FODjwERzy1UVhm8Q=;
        b=QuyR4t2H5pjNArUpGqO36LC30Bui+xpNd7reQNNxDPaqULVwhEEArpHF6nlNAugEA1
         efkFgddPBrC44WnqvQQgjcHOuAVZal0FQZzphjlg3GyqgTybOMmDpqZzED88HU1Hho2H
         BsLDG0IbS3Bq9lxR2dFmPA0oU4o0nT//JwtBptwn9ac3roHbER36fvgqMZe+PVPP7UYf
         9NSbLxtscMLRDsyfazpFx4pKvPizbamNMvcAO/TQYBLSuU7mJ6ddQWDPFQX53FfqRfZG
         cVDxSGhylrT1ceILb2+uvOpPKi7xVDS7wKwQbh/iOx4n3+nWvVNu3IH+trddzX6hW2xI
         DABw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736801235; x=1737406035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rgf5ZiJVnUsLIIIIlDSmo0hzeZ1FODjwERzy1UVhm8Q=;
        b=Juejz3EWHMhjtTr/qwMtRR7znzajDT9jP1Z69WntFhJJZbGj6SPaFVkUZ125R4q5AC
         ttaQCIz2KQ4TwTVKuh+ZMEdR0kQzvo3lo3gXOZzDTZUdScMw1IM6Ri0RYMicDO+3ejcr
         DVhKbDaWdWM1ZZMzSHWORpHV9Rk6edc9SLz02u8U/cDkrMl5DgHmEQVs34BLl2QkEASS
         Rvu8IaTMOcIM6IPblOCD/qL9xi3kjmCLnO+8ExurU9wrcW//WYE5uJcfY/agw8SU4wZU
         PViktyMTcOKQjGuR5sf0JgGRsH4jAnPI7QlQUXuWZkYzlPIXEl/y+LFrBFeb6QGRRH41
         P97g==
X-Gm-Message-State: AOJu0YwZNjpw1YM7gosqLjIkQm6FcXC5def1wZ6l1nA3p8nnfEePb5+g
	x816ttVfp5Ck5It2Sl53lwr32vAOfIQ0veomJCL9urV0bgkwECLHbkw+ZbU7BJdmAOrJnt4le9P
	57RE=
X-Gm-Gg: ASbGncvKS8NC6KXEzCvYBs3lAaM8W/DG+krnSkznrKx/7KGKbqpsct2v/uLcpJYwV4s
	mdrDA6tUpHUzeZvP/g71BdRHauRbklJbEnRqsvY6m01WZKAm+oetDJdtAcibC7Qiw3rL/9CJN5u
	HtPJoSTBfeCE+rXVZnXQxPpnq4P3nxFHN4kBUC6dDG8+XTtfZpoOCsL+FUIrvgE4CTQLKAn1uru
	BLJg/hPggOW4c+HpjPPBY+KRRoN9qm1OV9/ndzdtszGHA==
X-Google-Smtp-Source: AGHT+IG9WnCpopXteXoL+JEtnkOZiah+oICrEB3XKvZ8OB46ui/g3ur6Wt8cha1qpU/6E+bDJPpuAA==
X-Received: by 2002:a05:6a20:3d83:b0:1e1:cba5:8e1b with SMTP id adf61e73a8af0-1e88d12b176mr34593492637.18.1736801234567;
        Mon, 13 Jan 2025 12:47:14 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d40549413sm6449435b3a.12.2025.01.13.12.47.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 12:47:14 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 01/15] cve-update-nvd2-native: Handle BB_NO_NETWORK and missing db
Date: Mon, 13 Jan 2025 12:46:53 -0800
Message-ID: <062c125f41c3fc3fec0938b24f847ed566357c84.1736801113.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1736801113.git.steve@sakoman.com>
References: <cover.1736801113.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jan 2025 20:47:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209745

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
(cherry picked from commit 2bc4623a910dfa3a22cd054ea1e0f2dd59d74eea)
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


