Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 1967478190
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Sep 2017 13:48:05 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id d70so1555874qkc.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Sep 2017 06:48:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=bRv5jd4fmJtRnZB8emBy2Kd/jugJ49yVcf/hBU+R/zw=;
	b=pSiGHSTn0tfcSBnYir7O+LQJmZ4V785/nX+27RcF1Yw9yeddM1Wlq7YhY4qvAcyeMQ
	wKOfDS+dwYcBnr9xaKa/oRMZAiyirUchdd7ZunMiuhNrNLSDXY0Td3mubr3yPCO9AHHl
	L8HULugLe8GKhHohSNJXSEmZG8qENrTyLD30zuNOVu+p2oQ3or9Uv3EfKL7M/cg1vsBN
	d/IyiDadZ8PucBDnlDTNxC8Y+sRW8u4uY66zSj5EeDyS/6+/x2YH89cQjaVNgZtZuArV
	cqMUKY8gsq6C1Evu3+QpmmstVVPwCwbcKV+H1MKUpTXxvJTCxn7xCdqPaE9Mps8Jv/GV
	HYvw==
X-Gm-Message-State: AHPjjUgqTJyKVOFxzTfZVxxEilUrfGJN1oya+W/JHhEm4BNpLfvHuISI
	pUEpLoKmxVLMft0L
X-Google-Smtp-Source: AOwi7QC5w1cKf2pdaXKQfbidlTPujL+/t5lX/kdPyqRlOhuXcYshsBsEA0W2QsXo5W9QDZfeAT6Rrg==
X-Received: by 10.55.159.81 with SMTP id i78mr4007353qke.81.1504878486609;
	Fri, 08 Sep 2017 06:48:06 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	t65sm1271966qke.12.2017.09.08.06.48.02
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 08 Sep 2017 06:48:05 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Fri, 08 Sep 2017 10:47:59 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Fri,  8 Sep 2017 10:47:47 -0300
Message-Id: <20170908134758.7570-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v3 00/11] Revamp the Go support
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
X-List-Received-Date: Fri, 08 Sep 2017 13:48:06 -0000

This is not yet complete but does improve some parts of
Go support on OE-Core.

We are trying to port as much as possible work done by Matt on
meta-golang back to OE-Core and also to avoid carrying old releases as
there is no need to support more versions of Go toolchain.

The first commits on this patchset fix errors in current
implementation, the others are improvements and clean ups.

Changes in v3:
- new patch
- new patch
- new patch

Changes in v2:
- New patch
- Remove -x flag (madisongh)
- Remove GO_EXTLDFLAGS for now (madisongh)

Matt Madison (3):
  go.bbclass: exported function cleanup
  go.bbclass: separate ${S} and ${B}
  go.bbclass: add do_unpack function to handle common cases

Otavio Salvador (8):
  goarch.bbclass: Stop passing True as second argument of d.getVar
  go.bbclass: Fix binary installation path detection
  go-dep: Add 0.3.0 release
  go: Remove Go 1.6 and 1.7 releases
  goarch.bbclass: Add support for ARMv5
  go.bbclass: Use a global Go build flags
  go.bbclass: Enable parallel build
  go.bbclass: Use an auxiliary variable to add the build dependencies

 meta/classes/go.bbclass                            | 104 +++++++++++++--------
 meta/classes/goarch.bbclass                        |  20 ++--
 meta/recipes-devtools/go/go-1.6.inc                |  19 ----
 .../go/go-1.6/armhf-elf-header.patch               |  23 -----
 .../go/go-1.6/fix-cc-handling.patch                |  50 ----------
 .../go/go-1.6/fix-target-cc-for-build.patch        |  17 ----
 meta/recipes-devtools/go/go-1.6/gotooldir.patch    |  30 ------
 .../go/go-1.6/split-host-and-target-build.patch    |  63 -------------
 meta/recipes-devtools/go/go-1.6/syslog.patch       |  62 ------------
 meta/recipes-devtools/go/go-1.7.inc                |  19 ----
 .../go/go-1.7/armhf-elf-header.patch               |  23 -----
 .../go/go-1.7/fix-cc-handling.patch                |  50 ----------
 .../go/go-1.7/fix-target-cc-for-build.patch        |  17 ----
 meta/recipes-devtools/go/go-1.7/gotooldir.patch    |  30 ------
 .../go/go-1.7/split-host-and-target-build.patch    |  62 ------------
 meta/recipes-devtools/go/go-1.7/syslog.patch       |  62 ------------
 meta/recipes-devtools/go/go-cross_1.7.bb           |   5 -
 meta/recipes-devtools/go/go-dep_0.3.0.bb           |  20 ++++
 meta/recipes-devtools/go/go_1.6.bb                 |   4 -
 meta/recipes-devtools/go/go_1.7.bb                 |   2 -
 20 files changed, 97 insertions(+), 585 deletions(-)
 delete mode 100644 meta/recipes-devtools/go/go-1.6.inc
 delete mode 100644 meta/recipes-devtools/go/go-1.6/armhf-elf-header.patch
 delete mode 100644 meta/recipes-devtools/go/go-1.6/fix-cc-handling.patch
 delete mode 100644 meta/recipes-devtools/go/go-1.6/fix-target-cc-for-build.patch
 delete mode 100644 meta/recipes-devtools/go/go-1.6/gotooldir.patch
 delete mode 100644 meta/recipes-devtools/go/go-1.6/split-host-and-target-build.patch
 delete mode 100644 meta/recipes-devtools/go/go-1.6/syslog.patch
 delete mode 100644 meta/recipes-devtools/go/go-1.7.inc
 delete mode 100644 meta/recipes-devtools/go/go-1.7/armhf-elf-header.patch
 delete mode 100644 meta/recipes-devtools/go/go-1.7/fix-cc-handling.patch
 delete mode 100644 meta/recipes-devtools/go/go-1.7/fix-target-cc-for-build.patch
 delete mode 100644 meta/recipes-devtools/go/go-1.7/gotooldir.patch
 delete mode 100644 meta/recipes-devtools/go/go-1.7/split-host-and-target-build.patch
 delete mode 100644 meta/recipes-devtools/go/go-1.7/syslog.patch
 delete mode 100644 meta/recipes-devtools/go/go-cross_1.7.bb
 create mode 100644 meta/recipes-devtools/go/go-dep_0.3.0.bb
 delete mode 100644 meta/recipes-devtools/go/go_1.6.bb
 delete mode 100644 meta/recipes-devtools/go/go_1.7.bb

-- 
2.14.1


