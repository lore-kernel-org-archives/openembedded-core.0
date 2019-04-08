Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 409947D574
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Apr 2019 17:47:39 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id z9so4800931pgu.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Apr 2019 10:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=hCxLrwf+wPDcC0/k7ghSJtxRQ5a/7fzu2G+3KSDZcic=;
	b=ld9DUj9KFxJ4nc2TvcjBAntmmE38a7DRkZEV8qdM9/6Mm4JoZQR5g2Jlw/b84UrXZw
	wTO4DVUAzW+5zvCPtZegFQfIa9hfXaop1/e/0pZb/yOwbUAjQOCIc0CUtACwbziWo5oK
	Kgn5yvz93gnqbfHo/iUV0H11xPBAtWKnnWqpIPolIYZkVQd8FlbSAUaeQ2MEhA3VyCE2
	Hrp6FNcGiKXdSSoMMEgiwYlxYO6q6Wt6RvJrS8Dh2RvPuZZITCX5NjBFzUFF1ZgJS+vf
	q7uiqoZRMlO/E1gOhIVEWpsze0T5a/ewLSMQ5k62vaVqMuw73XErIUFMny0a/kvHjJbL
	OnOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=hCxLrwf+wPDcC0/k7ghSJtxRQ5a/7fzu2G+3KSDZcic=;
	b=CjQrr9bioDAzXrJUv+Tpz61/49IKuv6sL5Jx774rL1wSZuWKfyJT3h4C/rBvFPozxb
	WL1wQnRPfcMcrMCh0cPEUYwbb/Vs0Tg57wKfpu6z2zXhz3KM6KNnn9jFUKIEcUaJhgDi
	Jc3BVbk+wQoEe31LyDMh65A9vZfy7Dvfrh0OVmIPWvEFjHNYujCXZfBjlOJ79Eo5bDNT
	HprUYGCCdOt9NGV+4X09LU0Vdkr8rp9z4Tw65HhYlGeGFuUNhkdKAYKvXcGA9sXyOLTE
	nhHnxOp78FmSuhh3hH79WIo2Fm6kVsBQdKwFaKSFEyRbe6xB3ZjxWUx1v7UJPuhTyXcb
	ZG+w==
X-Gm-Message-State: APjAAAWizcxHbTWuwkrsQKNlBZp06lvgNETG5koo32IdUFWPPJt1wl6g
	aqe16GzH43rACzD8Y+C8dJ6I5l4JYrc=
X-Google-Smtp-Source: APXvYqxuzS6LX6vljy74+lYVWwb+sW6A003UO8sSGShrOtJiqDb1B9jgGwdrWM9HaPpKfOwGb3F+AQ==
X-Received: by 2002:a65:5ac3:: with SMTP id d3mr30487839pgt.168.1554745659419; 
	Mon, 08 Apr 2019 10:47:39 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::8ec8])
	by smtp.gmail.com with ESMTPSA id
	b72sm67232254pga.86.2019.04.08.10.47.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Apr 2019 10:47:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Apr 2019 10:47:32 -0700
Message-Id: <20190408174732.20703-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH V2] Revert "mdadm: fix gcc8 maybe-uninitialized/format-overflow warning"
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
X-List-Received-Date: Mon, 08 Apr 2019 17:47:39 -0000
Content-Transfer-Encoding: 8bit

This patch tried to address a gcc problem when -Og is used, but it did
cause regressions on normal compiles when using clang e.g. the real
problem is to fix the compiler until then disable the warning in
DEBUG_FLAGS

This reverts commit 630281663893cdcfa9c4323b717b415d87d5510f.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-uninitialized-format-overflow-warni.patch | 60 -------------------
 meta/recipes-extended/mdadm/mdadm_4.1.bb      |  1 -
 2 files changed, 61 deletions(-)
 delete mode 100644 meta/recipes-extended/mdadm/files/0001-mdadm-gcc8-maybe-uninitialized-format-overflow-warni.patch

diff --git a/meta/recipes-extended/mdadm/files/0001-mdadm-gcc8-maybe-uninitialized-format-overflow-warni.patch b/meta/recipes-extended/mdadm/files/0001-mdadm-gcc8-maybe-uninitialized-format-overflow-warni.patch
deleted file mode 100644
index 237f83a87e..0000000000
--- a/meta/recipes-extended/mdadm/files/0001-mdadm-gcc8-maybe-uninitialized-format-overflow-warni.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From bf457a83834932ba06de3528b8779a023e73fa7b Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Tue, 12 Mar 2019 16:17:29 +0800
-Subject: [PATCH] mdadm: gcc8 maybe-uninitialized/format-overflow warning
-
-while compiled with -Werror=maybe-uninitialized/-Werror=format-overflow=,
-it failed
-
-[snip]
-| Incremental.c: In function 'Incremental_container':
-| Incremental.c:1593:3: error: 'mdfd' may be used uninitialized in this function [-Werror=maybe-uninitialized]
-| close(mdfd);
-| ^~~~~~~~~~~
-
-[snip]
-super-intel.c: In function 'apply_takeover_update':
-| super-intel.c:9615:15: error: '%d' directive writing between 1 and 11 bytes into a region of size 7 [-Werror=format-overflow=]
-| " MISSING_%d", du->index);
-| ^~
-
-Upstream-Status: Submitted [https://github.com/neilbrown/mdadm/pull/36]
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- Incremental.c | 2 +-
- super-intel.c | 4 ++--
- 2 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/Incremental.c b/Incremental.c
-index a4ff7d4..b667868 100644
---- a/Incremental.c
-+++ b/Incremental.c
-@@ -1500,7 +1500,7 @@ static int Incremental_container(struct supertype *st, char *devname,
- 		return 0;
- 	}
- 	for (ra = list ; ra ; ra = ra->next) {
--		int mdfd;
-+		int mdfd = 0;
- 		char chosen_name[1024];
- 		struct map_ent *mp;
- 		struct mddev_ident *match = NULL;
-diff --git a/super-intel.c b/super-intel.c
-index 10d7218..c3741ea 100644
---- a/super-intel.c
-+++ b/super-intel.c
-@@ -9612,9 +9612,9 @@ static int apply_takeover_update(struct imsm_update_takeover *u,
- 			du->major = 0;
- 			du->index = (i * 2) + 1;
- 			sprintf((char *)du->disk.serial,
--				" MISSING_%d", du->index);
-+				" MISSING_%hu", du->index);
- 			sprintf((char *)du->serial,
--				"MISSING_%d", du->index);
-+				"MISSING_%hu", du->index);
- 			du->next = super->missing;
- 			super->missing = du;
- 		}
--- 
-2.7.4
-
diff --git a/meta/recipes-extended/mdadm/mdadm_4.1.bb b/meta/recipes-extended/mdadm/mdadm_4.1.bb
index 9862a38dc3..947706ff5f 100644
--- a/meta/recipes-extended/mdadm/mdadm_4.1.bb
+++ b/meta/recipes-extended/mdadm/mdadm_4.1.bb
@@ -19,7 +19,6 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/raid/mdadm/${BPN}-${PV}.tar.xz \
            file://0001-fix-gcc-8-format-truncation-warning.patch \
 	   file://mdadm.init \
 	   file://mdmonitor.service \
-           file://0001-mdadm-gcc8-maybe-uninitialized-format-overflow-warni.patch \
            "
 SRC_URI[md5sum] = "51bf3651bd73a06c413a2f964f299598"
 SRC_URI[sha256sum] = "ab7688842908d3583a704d491956f31324c3a5fc9f6a04653cb75d19f1934f4a"
-- 
2.21.0


