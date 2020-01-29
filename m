Return-Path: <alex.kanavin@gmail.com>
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65])
	by mail.openembedded.org (Postfix) with ESMTP id 94D1660665
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2020 14:01:06 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id z26so2311269lfg.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2020 06:01:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=S3E8yT/G8rI3ida0FSY0VKaLSx3LskD6UYE10Qtp5D0=;
	b=e+rfE50OPuzymYXqEqf6uMY0gYrK1SGsivn6VdShYKNthT59mT0xnBqguW9RoeRCkw
	XfRA8GCFWw2JYO/S/qPggdmQtydmhGN5ExjYrFB71nXdYS0vlJgvX33VDq+XP1uKmcUu
	ymvyPCdidAk9hFYP3GEP2pPNdR6Iu1LWfvQlxw4xTUyAr11lT78Cxt5HNvNOZ7uWw5M3
	kxnebVuk+6KcVCmNg+t6iPRwtJZU1lavYRmceMzFm8g5ZEQw1T80MG+Y9LhJSlsJQnXi
	HKpoPrIXD5g2q9VIUPRMvx3DJRIBm1+I6GMaYhDrPSMs+Qm0TIB4ApgaL1pekze+5BYx
	CeOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=S3E8yT/G8rI3ida0FSY0VKaLSx3LskD6UYE10Qtp5D0=;
	b=G0FslPej2T2/mWiSi+h+wJvqZjZNMnAsAYTztHJ9ZJ1esc+WMDIYuE8+GUNlXwaSFK
	SV3QeKXBIA21aj7eO8l2ghKXuMGhtEaTZoSm7b59tepxq0Lga9x7zCXxlCQBH4qIfZtj
	n+9kP6xAod34+Q0ObJR4ZihS59cSsT4FS/QyR7QfIxzNj6f0Lq7rcrcf1NDYUVHn9JXf
	oxD/a/PAQQy+T8wN05jOjbVwhBhUCCD5AJn1RAkPAZQ7x2k7QFcnYpiqRr/sJFB9xmFM
	dfkSPnIOBRmHEHqQS9QipZ0uDYDQE2zrSxMkDfpLY0uTP8iy/+ett5FL2d6XOGVfXA/A
	bFww==
X-Gm-Message-State: APjAAAVbCUz1qSYJipceA36H50wIOc5cOOP4ybj89tynhb4X/j+j0SjW
	uQ/MHUGDICuk0wWsOUfYvd7ihjx5
X-Google-Smtp-Source: APXvYqys+tjVHpy/YOHSmFWmLjFOVRL+11e5NTY0OKo7erqT7HGzVLPIEgJGayalG5r1E9lcXLwc4A==
X-Received: by 2002:adf:dfcf:: with SMTP id q15mr33780755wrn.404.1580288886818;
	Wed, 29 Jan 2020 01:08:06 -0800 (PST)
Received: from linux-f9zs.box (cable-95-168-152-69.cust.telecolumbus.net.
	[95.168.152.69]) by smtp.gmail.com with ESMTPSA id
	a62sm1550224wmh.33.2020.01.29.01.08.05
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 29 Jan 2020 01:08:06 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Jan 2020 10:07:15 +0100
Message-Id: <20200129090738.1398-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [PATCH 01/24] core-image-sato-sdk-ptest: do not pull in ptest-pkgs
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 30 Jan 2020 14:01:14 -0000
Content-Transfer-Encoding: 8bit

The lists of ptests are defined via PTESTS_FAST and PTESTS_SLOW;
ptests-pkgs also pulls in additional items that are specifically
excluded from those due to causing issues with ptesting (particularly,
bash-ptest is non-deterministic and was dropped from PTESTS_FAST/SLOW
yet still gets pulled in via ptest-pkgs, and is causing failures).

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-sato/images/core-image-sato-sdk-ptest.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb b/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb
index 85b5adbc693..58c257c49fb 100644
--- a/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb
+++ b/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb
@@ -3,8 +3,6 @@ require conf/distro/include/ptest-packagelists.inc
 
 DESCRIPTION += "Also includes ptest packages."
 
-IMAGE_FEATURES += "ptest-pkgs"
-
 PROVIDES += "core-image-sato-ptest"
 
 # Also include ptests which may not otherwise be included in a sato image
-- 
2.25.0


