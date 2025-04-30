Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E51BC369DC
	for <webhook@archiver.kernel.org>; Wed, 30 Apr 2025 03:00:47 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.8300.1745982037837887828
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Apr 2025 20:00:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=afVLr8um;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-225477548e1so71191125ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Apr 2025 20:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1745982037; x=1746586837; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bfgAOC9ZJwuGD6vI4Seto0HF5ffogu45Seb3Rjtfjnk=;
        b=afVLr8umEIY3FSxhu3UB+XgC6OshNzh1PlCgJtm7exwV71u12+X1/CFeP9xflbhWsY
         axJ9OuUuKt2Rh5Z2WlN+6C2DRVhSk3+RxAN0njO0aR9t2glQM/r12sagk1akfGTGhTML
         Uz8mwX/gd2a7BbMIaXuXmJsRfmaVczGzF5jOqB7yMyhCtF94I6KqELYHBV3ZO7i4DNAz
         6MZy3/6Yw64NtbOIuF2cAEV6cwdRQp0ADLA66JRw9v3rF19S1yhAmq8jGSrLhS4HcBPi
         mpNCLw/0X49TKG9JiJvpQFM/nT1XQ9gXPC3pNCWRa5HL3/6jBPy+3sZTUkoPSkkLxvRK
         i+EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745982037; x=1746586837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bfgAOC9ZJwuGD6vI4Seto0HF5ffogu45Seb3Rjtfjnk=;
        b=SvUEhmmGJy8fhQuK6tTisV2ZZ23AruQQu2i2b6sLkApaSraDSk5nck4wwF4375EZ3N
         q6D8S1T33dxkwgb3DR2QjzBFCTrJYJXo6Sn+ngGM9q8jrg0KC0LsvnQteB3tNrp58t8Q
         FdvZPOZjqNOAYbX4vFjxxx8rfYWWakg83w90vPvtOp0paUR6paxcy1dJEsVOkIDrVzww
         lpnUIgjPcIHkr/sNrQIzb41vn5KYU8kXlTF72VH4jUS9OtMiscZFKj07n394TwIyfER8
         5+n00LvXgBP4iLHTErK9Hs2Pu+9z0b9aUo0PbKW/leSiL20YB6urytfPiaP56IVbXmYj
         qAwQ==
X-Gm-Message-State: AOJu0YxsI/RZLIOuwY/VDVDi7MaenyFssT4XHOqKSujdDxEmwNcRuwiz
	QVgI7s1RnlqwK+Q4X/QXql1/wDakfylVkfskwQmXAbaZVJFJ0nEirYNAwR/BotxbTQNpjB1PNFk
	z
X-Gm-Gg: ASbGncsy6ReoidJl8uxWJcsw/X8cK1XYWjAM0lgU7MEd1IP9nUGNoq2idJ8nNWN/JWB
	a5cRXiGdVN1Yz6MXWh4Hrlcb7uOZl6BZRuDvTbeXaWjxsZg3KGVzoTCVawX+W7ifi6E2fV8zVsC
	0fZduLQiTjb4IpM8pIXi5OZtGFC26PzLMyAKC+2BtnC6urLAkQOOjZocdUUdhyQuRCYFEKu3Ww5
	btKtrycfsFDEe/osjSafpy2ZVY0xPUD3dpb0BzNZ9/SvtWwX9dvMe3YnzTbH71bTXvGnzi5C3jD
	SYfBBXW2nbdGrEhfSU8FI2RNZwVsP6Zzo42dneN0Lg==
X-Google-Smtp-Source: AGHT+IGVSONefCEdOeXxhcd+LARLrh9vxBD2tvFwhS5Drhylx+vQswL7NPeDKm1M2vEUub+VEnRCyw==
X-Received: by 2002:a17:903:910:b0:223:432b:593d with SMTP id d9443c01a7336-22df3576684mr23267885ad.42.1745982037050;
        Tue, 29 Apr 2025 20:00:37 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:34b:e5e0:c38a:7e03])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22de49dccd3sm30461175ad.123.2025.04.29.20.00.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 20:00:36 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 15/15] Revert "cve-update-nvd2-native: Tweak to work better with NFS DL_DIR"
Date: Tue, 29 Apr 2025 20:00:03 -0700
Message-ID: <00dd4901e364d16d96cfab864823a9cfdd336eeb.1745981742.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1745981742.git.steve@sakoman.com>
References: <cover.1745981742.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Apr 2025 03:00:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215721

From: Peter Marko <peter.marko@siemens.com>

This reverts commit 7adaec468d3a61d88c990b1b319b34850bee7e44.

It does not seem to fix the issue it was supposed to fix.
Additionally it breaks code which decides in full/partial update,
because it manipulates timestamp that code is relying on.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ebc65fdddd7ce51f0f1008baa30d0ae7918ae0bb)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/meta/cve-update-nvd2-native.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb b/meta/recipes-core/meta/cve-update-nvd2-native.bb
index 74c780493d..945bd1d927 100644
--- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
+++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
@@ -90,8 +90,6 @@ python do_fetch() {
     if update_db_file(db_tmp_file, d, database_time) == True:
         # Update downloaded correctly, can swap files
         shutil.move(db_tmp_file, db_file)
-        # Need to 'touch' the file to ensure NFS sees the data
-        os.utime(db_file)
     else:
         # Update failed, do not modify the database
         bb.warn("CVE database update failed")
-- 
2.43.0


