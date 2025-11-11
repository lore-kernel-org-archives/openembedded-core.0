Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D6EBCD13D9
	for <webhook@archiver.kernel.org>; Tue, 11 Nov 2025 14:58:59 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19317.1762873138969816813
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Nov 2025 06:58:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=sHyFsTcG;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.51, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3437ea05540so2732172a91.0
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Nov 2025 06:58:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1762873138; x=1763477938; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CCjbwG/buJ6fhPkS+a7QGiYz2UiALoQcBdpT65EQyEQ=;
        b=sHyFsTcG+KstjIIo+nANOfUf45FtgGOivAEHb9w9igNAKLyxuuS2tVaXZWCqPDLS7F
         g+txyBOrX/EGLkga1dkLtzkWsnQ2dUaXmA1YUI2kIm6q9OeB93owygubNL6tRpqstElz
         i2E/rbwE0k4r1pghqkclv01tmQBhUnModhg4FYVZ09tpK0p+aPy1GfBC36ftOSpL73gx
         9z/E2ASbsO4F1kexxxxPAMXwK/bfnUSksIUfWpV2VJlKmX0QHACOrL3jthsdLz9CxZ4O
         r1nPdzITVCbqLWgjpVx9mPCS3rm4DrFmEiNBQJrvCRv5YjKilhwYp3jiqWrdhGudaeYr
         likg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762873138; x=1763477938;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CCjbwG/buJ6fhPkS+a7QGiYz2UiALoQcBdpT65EQyEQ=;
        b=mCF5M7gEdoRJjszQ6E1lt1Gcb7liizN9yX1LQFWFwXUzBB3IIYfdN+BtCpcZmpXMBb
         gU/4z960rSw9/eqg+cLP0llaLFFZATSI798tFSYLgAsTT5rKH4UR8lxsNyd3g2sgTZvH
         T1Z+J5bxhifdWA0S1TgErvt03DrR4MrPKsf969DltUUKmbPHK4EUIBr+NVpJvQ+bjBU3
         D83YXpDRJfnGptZyvfOodtytBAHmHL4XL5pgydEQDQB8U806aYz7mTBeXPZhJngU7V9k
         kRBkTPwRnrtw2uBKCk467c9zwjQ5gPpHhXSbGPtrZboXQEBgX2tzdAwtzN+qWg7nPXo+
         8WPw==
X-Gm-Message-State: AOJu0YwRwSsBmwnfLWhZZF8YRqRkSYtwBwqSbjLJl+W9WYmt4rsjN7lC
	uRkIzoWKtIJPVVCHFmcs58wEVtPW05XuULvQJYruUbQyypv9rjwhMeBk1RxnJCMrZ0QmL2txOl5
	sld2qUJ8=
X-Gm-Gg: ASbGncsBvIswxtSMvo1zkjEpf0gTG4wo+CGnjgNkc3YHqjECSOMlS0UaZsOZp6CTryQ
	OlhL6ILKLwuQvp9IRXqxMvLsDYZZMq78IkkA420UbKdUD8Qh8p8hoaKHH0dX9DVYFm8r0ueZWMd
	XJpq9xpiey0YvbkNDFbBTVK74wEwP4XS4xFsK8ng6IecjFG49XFHAEloTQmckof9+Zzyio82FwB
	k/jsJGNCeZQrgrEmpLsrv4Pbfc1az2GlfBKnLWbjrj7e0rG+y07y1i9cGkqV0B8TDONAHgMp4p6
	H+cM+YUWhKTW6ZQXo5/4SmMxsg0av/s3fftGCKfI4eJIEIKW/ENclwDEZ7r8tBaa6rUmzUi5MDd
	NNoEYKm4nwyko1bADYSlM1d4FDw/79yobE5h+bc4VNHZjnqAa8xIUDlTHrKloiI3wjRJnz7Wh3N
	u3qg==
X-Google-Smtp-Source: AGHT+IFfmNJjPwF28qnmwaAg0EGe+chCnguJD7xeJ+o924iGUaOfZOsMkOxUY8TE7yLtAGelrdQLiA==
X-Received: by 2002:a17:90b:2358:b0:343:a631:28a8 with SMTP id 98e67ed59e1d1-343a6312b31mr6187963a91.37.1762873138177;
        Tue, 11 Nov 2025 06:58:58 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:db6b:ed5a:7890:6b41])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-343685301f8sm11662588a91.5.2025.11.11.06.58.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 06:58:57 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 10/19] wireless-regdb: upgrade 2024.10.07 -> 2025.10.07
Date: Tue, 11 Nov 2025 06:58:18 -0800
Message-ID: <e0bdf9b4134b1c1f90687fb6e12e33bf77d4192c.1762872962.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1762872962.git.steve@sakoman.com>
References: <cover.1762872962.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Nov 2025 14:58:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226175

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...ireless-regdb_2024.10.07.bb => wireless-regdb_2025.10.07.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2024.10.07.bb => wireless-regdb_2025.10.07.bb} (94%)

diff --git a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.10.07.bb b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2025.10.07.bb
similarity index 94%
rename from meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.10.07.bb
rename to meta/recipes-kernel/wireless-regdb/wireless-regdb_2025.10.07.bb
index 0e4100fba7..68ae3b0464 100644
--- a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.10.07.bb
+++ b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2025.10.07.bb
@@ -5,7 +5,7 @@ LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
 
 SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "f76f2bd79a653e9f9dd50548d99d03a4a4eb157da056dfd5892f403ec28fb3d5"
+SRC_URI[sha256sum] = "d4c872a44154604c869f5851f7d21d818d492835d370af7f58de8847973801c3"
 
 inherit bin_package allarch
 
-- 
2.43.0


