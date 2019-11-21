Return-Path: <jpewhacker@gmail.com>
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com
	[209.85.166.170])
	by mail.openembedded.org (Postfix) with ESMTP id 8D8127C4DB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2019 16:59:16 +0000 (UTC)
Received: by mail-il1-f170.google.com with SMTP id p6so4008506ilp.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2019 08:59:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=EltMBn2tPsr4xjiK3JCFKxyoGpru9sEQ7/ENvFZ2P/0=;
	b=A+Ofk2jZUAPG+bVkvSFM8k0M4w4dBpHSNQaY1ru0iTGYoVBXmiNAPPFmkNwb7CgGI4
	4EM93cPmDpx79r3fngT++cHydXYvyJH7xgTkXvVwsAxlno2ciuLO33NKMpM5iabkwU3w
	Eq0biLYc0J0xCecdxTBL4qQnTEu9hzbYuJnkM+0e5eTE2m0T76BlGb+O3CLnHwEwR9KM
	OCzDS57YoOfSwNJopwhKiG8vnOiAE9LC9j2XjB0wK43W3SzPG0hpVho74nRZrE0z/wdQ
	nKV6Kx3QjCUO6PHObbaT1IsJsw/tK8CcSrC/RwvJaeeYiban1f6pmbTDG2hCbZOeGhm4
	eNtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=EltMBn2tPsr4xjiK3JCFKxyoGpru9sEQ7/ENvFZ2P/0=;
	b=lhL9WhspmttCmmf5jYhRM4CP+p5HAMDbINa9GDzEuV61YaAWb+VeJH9gMTnSG8Usox
	c7vjRqpO/iMQGtpMc6bQVpmcSfOVx4i9aGci6PFYYte/LFjRiv56YdWX4yJLJz/w1BJV
	IRJ8T+ZXiVakhB7HAwBsPOh7wwWmBZVLLyO6GbNQDcpKhOBgMVpD7MB2epnZrUvdWJq0
	O/rvldggMvUREDtxDb2nmVg1554oZFzvLwoSRaBle+jzqih9vmBDV84bXAHdm1O4BsDX
	DhRF2fbVY96zNg6LTVC/3Pl7hJz07nLNq+irZV14vWzfLpUylPo3Q8l7gifKOOOz6ten
	N0Hg==
X-Gm-Message-State: APjAAAUHIkG/sUzObsNoGl98iQPJr0WWEB7VR/rpr93N2jFRfB+4ayoN
	6yDm69qC6lqhfe1iJ3JjvqOFDISCpPA=
X-Google-Smtp-Source: APXvYqwPBy+Bsrkyd2CU7n8v7jcfdnHGnfOxXQwONuIYZbWLG1+9kjzjrwKDzvv27WhgQYZlEr/VJg==
X-Received: by 2002:a92:17ce:: with SMTP id 75mr11055949ilx.88.1574355557302; 
	Thu, 21 Nov 2019 08:59:17 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id d8sm1365839ilr.82.2019.11.21.08.59.15
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 21 Nov 2019 08:59:16 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Nov 2019 10:59:11 -0600
Message-Id: <20191121165911.1220156-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [PATCH] classes/cmake: Use relative RPATHs
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
X-List-Received-Date: Thu, 21 Nov 2019 16:59:17 -0000
Content-Transfer-Encoding: 8bit

In most cases, the RPATH is stripped out when the ELF file is packages,
but by then the damage is done from a reproducible perspective because
this absolute path is hashed as part of the build-id generated at link
time ([1] has a good explanation). Fortunately, newer cmake has an
option to generated relative RPATHs that use $ORIGIN to set the path, so
set it in the toolchain file.

[1]: https://gitlab.kitware.com/cmake/cmake/issues/18413

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/cmake.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
index 291f1e8d448..8ccb1eefc7d 100644
--- a/meta/classes/cmake.bbclass
+++ b/meta/classes/cmake.bbclass
@@ -120,6 +120,9 @@ set( ENV{QT_CONF_PATH} ${WORKDIR}/qt.conf )
 # directory as rpath by default
 set( CMAKE_INSTALL_RPATH ${OECMAKE_RPATH} )
 
+# Use RPATHs relative to build directory for reproducibility
+set( CMAKE_BUILD_RPATH_USE_ORIGIN ON )
+
 # Use our cmake modules
 list(APPEND CMAKE_MODULE_PATH "${STAGING_DATADIR}/cmake/Modules/")
 
-- 
2.23.0


