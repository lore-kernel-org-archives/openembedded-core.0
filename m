Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f68.google.com (mail-pa0-f68.google.com
	[209.85.220.68])
	by mail.openembedded.org (Postfix) with ESMTP id 8D5F860107
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 04:40:19 +0000 (UTC)
Received: by mail-pa0-f68.google.com with SMTP id xm6so3715796pab.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2016 21:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=KUw2jJtnA+xgIyOklt5umMAvHkeS5TeNSfIus06Xw+o=;
	b=BXueztZ3Ol/x2T9NYufvVCA+htlOHlAZVjMFWQOkq43D5e8ToCT9pvlDjrDaPLnhIa
	xF3SVZ3f+3zJqbOAsghsqaL+nlCJje9eZNUM2GcrlHHYvFLZl3ElFr9I6AuUea3KVV6p
	JnYHblKGKIRuI8g8BCgrM0VppUo+z0EVGlRlOBZjICtVMENSdM+LBms7mpQwS6iHfWh3
	enDXWq69KcEcLeK3sZkZFqkvsGJwB4x1uU3rvEk/MWpx2oi/CjLOma8qp3ysx+chHEgu
	RNukpq2PrCxUxgjc/1R6NJL8svawbZYT1GqiSUDkwF7cnrCDNge7TkGQWRnTgYbNWPnQ
	q/PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=KUw2jJtnA+xgIyOklt5umMAvHkeS5TeNSfIus06Xw+o=;
	b=Myw2qbAewCOPE7qo/3N3Mbll/B1mTzTu02+VhWdAAexstMPgGkBP0+R5TWSbevKEdh
	BCPfxEE9NW4+L1d6yZgT+YrYVEso7WqKhPjw7vWhWCGiTK6fePVRoly1CdpiG1Wkjg0U
	fmlHiXOAR+M4IWLFBKZCdoVqZyPqDQlDr6Iv5ZabEUThqU/KDhbfxaIsTFoFHRzh45S/
	dZL0ASPTgmAv1960syBmT1TughrbSLwuD6rgv6DrmVT4caf/W5ijcrzcM3qyp0MoCwqH
	5uxNQmjGDupHg/52QeIdt7/uQ6Q5TU1NZjgZYBXPDMrWdWRLxrcu+d27CBjshQoxx84K
	jDlA==
X-Gm-Message-State: AOPr4FXg38d2gdeqXo58lLvA+p+Eo8RQamj5YFQyJnYVGTDLc0MZvcO/st7ppVjSiYTjIw==
X-Received: by 10.66.221.167 with SMTP id qf7mr7680201pac.94.1463546420029;
	Tue, 17 May 2016 21:40:20 -0700 (PDT)
Received: from haswell.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	yp9sm8309686pab.42.2016.05.17.21.40.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 17 May 2016 21:40:19 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 May 2016 21:40:13 -0700
Message-Id: <cover.1463546289.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.8.2
Cc: Marek Vasut <marex@denx.de>, Walter Goossens <waltergoossens@home.nl>,
	Thomas Chou <thomas@wytron.com.tw>, Ley Foon Tan <lftan@altera.com>
Subject: [PATCH 0/5] systemd and nios2 fixes
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
X-List-Received-Date: Wed, 18 May 2016 04:40:20 -0000

These patches address the useradd problem which was exposed
by the systemd useradd patch.

Additionally, few patches to help packages build with nios2

Khem Raj (3):
  useradd.bbclass: Strip trailing ';' in cmd params
  systemd: Create missing sysusers offline
  pixman: Fix build on arches not defining FE_INVALID exception

Marek Vasut (2):
  kernel: fitimage: Repair misuse of shell test command
  sysprof: Disable nios2 support

 meta/classes/kernel-fitimage.bbclass               |  2 +-
 meta/classes/useradd.bbclass                       |  2 +-
 .../packagegroup-core-tools-profile.bb             |  3 +-
 meta/recipes-core/systemd/systemd_229.bb           |  8 +++++-
 ...Check-for-FE_INVALID-definition-before-us.patch | 33 ++++++++++++++++++++++
 meta/recipes-graphics/xorg-lib/pixman_0.34.0.bb    |  1 +
 6 files changed, 45 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-graphics/xorg-lib/pixman/0001-test-utils-Check-for-FE_INVALID-definition-before-us.patch

-- 
2.8.2


