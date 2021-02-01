Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
 by mx.groups.io with SMTP id smtpd.web08.36656.1612196834207317327
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Feb 2021 08:27:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=YY464HXa;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.49, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f49.google.com with SMTP id i30so16855500ota.6
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Feb 2021 08:27:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=5LpXA/HfIdLPjYX4tk1z3INwf1iFWC8HsGOiDNlGazs=;
        b=YY464HXam7WMBy2UjESn0tHECMdTK6r6PmNur9R6J9f5SSDZLv654EpZTe9E3fBFZc
         SuVJP/OiZDkjzTiMKuxXDZiR6fGu9tqLtyZ1ub4WqMxi9nX50nmhz2nnG+AoXdNgkz41
         hNkm2tqfxPfDDkvAHkPCdTdujXiN7Pk7Hd3BLPF4oObHmSLoilXpxtn72YWzUHalxFW3
         BkNwoVhlqOyZlqraOFj5e6qnOg8xpN0Z5L+h8oMFmYYwOe1Cq3VCrHT7fZQiwGnPV4jZ
         aMo8w+NI1+KaBR9L0+1PWM2mPnnqmbmfhf08GOG88ZP5EJ7xalyXfDQIRBv4qDy1sq4N
         xJuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5LpXA/HfIdLPjYX4tk1z3INwf1iFWC8HsGOiDNlGazs=;
        b=bpV2Z3wU8mEyG36kNelPmO65ftAbA31WJzRklSaUqjXjrmIa3DiBHJmQF9Hb1x3UUN
         W6jmAPEC4PzUmU9Hu6ZY8w/qm2Rk+8+0QYsa2wj3AgPGuJl6Ad5YjEut30ZkDKXb6G5+
         wqScxISZc3wzx2gl5+XPPBsxSOIjnjFbieTiIzSr9AENu4Gz09EFmkBYf6Gbjti9gmHU
         kHxP7fBCcRszJyVEOYmkYEtMpbAFXGyRmaEugPPABiwDOe5GOjU3ukihb1nZQBq/BHdu
         y3HDPQIYI3VYOHDnSAfUx8Dj5k6I1O83uvCrQqwEn9V/OycbJNRyqiR38Zh8pbiWhhOC
         l25A==
X-Gm-Message-State: AOAM531367JAouvmLIn5DiU2EQN+Fq3ZIYintLgsFYcwxQiR2t/IRlDR
	Hi22Oa4a1OlwgdsXlRBXSMvnCl2t9PgxEWC4eKM=
X-Google-Smtp-Source: ABdhPJztvx2mC9nyOrNDSLeQY+NttEyBgKqTTgX0S4cRlxTePw4oEfCGjD4P+Bto8gqz4GT8GKwXxw==
X-Received: by 2002:a9d:6201:: with SMTP id g1mr12496613otj.66.1612196833102;
        Mon, 01 Feb 2021 08:27:13 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id o16sm3980726ote.79.2021.02.01.08.27.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Feb 2021 08:27:12 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 19/21] ncurses: Don't put terminfo into the sysroot
Date: Mon,  1 Feb 2021 06:24:50 -1000
Message-Id: <7789eb844a1f0033cec7d7d42f1dd42d571cb6c2.1612188857.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1612188857.git.steve@sakoman.com>
References: <cover.1612188857.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

This recudes the file count from ~2850 to ~100 which is a huge win
for reducing build directory clutter, its unlikely anything uses the
terminfo data or man pages in the sysroot. This is especially helpful
as we usually end up with two copies of these sets of files.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 443633dfc20177ef88a388d96745675817510c99)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/ncurses/ncurses.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
index 630c5f26d6..7f1834f0dc 100644
--- a/meta/recipes-core/ncurses/ncurses.inc
+++ b/meta/recipes-core/ncurses/ncurses.inc
@@ -319,3 +319,8 @@ FILES_${PN}-terminfo-base = "\
 
 RSUGGESTS_${PN}-libtinfo = "${PN}-terminfo"
 RRECOMMENDS_${PN}-libtinfo = "${PN}-terminfo-base"
+
+# Putting terminfo into the sysroot adds around 2800 files to
+# each recipe specific sysroot. We can live without this, particularly
+# as many recipes may have native and target copies.
+SYSROOT_DIRS_remove = "${datadir}"
-- 
2.25.1

