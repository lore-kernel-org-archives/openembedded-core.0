Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f171.google.com (mail-qk0-f171.google.com
	[209.85.220.171])
	by mail.openembedded.org (Postfix) with ESMTP id 9B06278221
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 18:29:03 +0000 (UTC)
Received: by mail-qk0-f171.google.com with SMTP id b23so20458799qkg.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 11:29:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=zwtmILoeWcJvWQ90bsjK5wBizlRcdf+bzFF1uivuBNo=;
	b=P8/8RnbxLUpuVAavb7xSoEoRW8K57rKcm97H7Xpf0mGJqyJ2/yzXaIZc2ExH1xrYaj
	HRKNmWWv3OhCzcZCQnLnETf/oe3L27sX8HWYlnoidmP9UPpGc5hIk4p9WC4X+64Gk5Va
	KUmOyuo3/mPeqpN0FDvMk9gySbqzm2Y35+lWICybe8lJp7/dAHDxUbXRJ+7lMc/AJdBj
	p6yn4etcLDkHwivoY/GtwdkV+J0LGnshFgTliXuBWKTbu2TA+akSKpHY0gK7/NK95ltb
	CrFFY4kEIXa3PJIriT2WM0iA0p2YYd4i+Hq5EIIYS41KkcF7sCbXw77Ug/iSK1NfI2l1
	xO9A==
X-Gm-Message-State: AHPjjUjb7ZPl2uYlbsRvPPIo3c/VUS5wfNCzMhu5hZ6VhzSi7oUsqHzb
	bCRpg2hIc4+iSgjr
X-Google-Smtp-Source: AOwi7QD9COmLy4hI1QC+R8qd1/ZNk/L57hGqx+MaRwv/5/SzsG89r+m8j255G5yBdhTkBfM75ysOsg==
X-Received: by 10.55.168.12 with SMTP id r12mr15404096qke.283.1505154544404;
	Mon, 11 Sep 2017 11:29:04 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	n88sm4702347qki.49.2017.09.11.11.28.59
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 11 Sep 2017 11:29:03 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Mon, 11 Sep 2017 15:28:54 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon, 11 Sep 2017 15:28:41 -0300
Message-Id: <20170911182853.11076-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
Organization: O.S. Systems Software LTDA.
Cc: Will Newton <willn@resin.io>, Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v7 00/12] Revamp the Go support
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
X-List-Received-Date: Mon, 11 Sep 2017 18:29:03 -0000

This improves the Go support on OE-Core.

We are trying to port as much as possible work done by Matt on
meta-golang back to OE-Core and also to avoid carrying old releases as
there is no need to support more versions of Go toolchain.

This fixes issues in existing support as well as add support for SDK
generation which supports Go.

Changes in v7:
- Fix Upstream-Status header typo
- Add patch header

Changes in v6:
- new patch
- new patch
- new patch
- new patch
- new patch
- new patch
- new patch
- new patch
- new patch
- new patch
- new patch
- new patch

Matt Madison (12):
  go-native: remove dependency on go-bootstrap-native
  go-bootstrap-native: remove recipe
  go: split out go-runtime into separate recipe
  go.bbclass: remove GO_GCFLAGS nad GO_LDFLAGS
  go.bbclass: remove some xxx_FINAL variables
  go.bbclass: clean up CGO_xxx settings
  go: rename go.inc -> go-target.inc
  go-cross: take GOARM environment setting
  go: enable nativesdk builds for the toolchain
  go-crosssdk: add recipe
  go.bbclass: enable nativesdk builds for Go packages
  go-cross-canadian: add recipe

 meta/classes/go.bbclass                            |  54 +++--
 meta/recipes-devtools/go/go-1.4.inc                |  16 --
 ...alignment-for-the-.rel.plt-section-on-32-.patch |  33 ---
 .../go/go-1.4/016-armhf-elf-header.patch           |  24 ---
 ...ckport-cmd-link-support-new-386-amd64-rel.patch | 225 ---------------------
 meta/recipes-devtools/go/go-1.4/syslog.patch       |  62 ------
 meta/recipes-devtools/go/go-1.8.inc                |   6 +-
 .../go/go-1.8/make-goroot-precious.patch           |  21 ++
 .../go/go-1.8/set-gotooldir-during-bootstrap.patch |  22 ++
 .../recipes-devtools/go/go-bootstrap-native_1.4.bb |   3 -
 meta/recipes-devtools/go/go-common.inc             |   2 +-
 meta/recipes-devtools/go/go-cross-canadian.inc     |  64 ++++++
 meta/recipes-devtools/go/go-cross-canadian_1.8.bb  |   2 +
 meta/recipes-devtools/go/go-cross.inc              |  61 +++++-
 meta/recipes-devtools/go/go-cross_1.8.bb           |   5 +-
 meta/recipes-devtools/go/go-crosssdk.inc           |  55 +++++
 meta/recipes-devtools/go/go-crosssdk_1.8.bb        |   2 +
 meta/recipes-devtools/go/go-native.inc             |  48 +++--
 meta/recipes-devtools/go/go-native_1.8.bb          |   1 -
 meta/recipes-devtools/go/go-runtime.inc            |  58 ++++++
 meta/recipes-devtools/go/go-runtime_1.8.bb         |   2 +
 meta/recipes-devtools/go/go-target.inc             |  54 +++++
 meta/recipes-devtools/go/go.inc                    |  81 --------
 meta/recipes-devtools/go/go_1.8.bb                 |   2 +-
 24 files changed, 393 insertions(+), 510 deletions(-)
 delete mode 100644 meta/recipes-devtools/go/go-1.4.inc
 delete mode 100644 meta/recipes-devtools/go/go-1.4/0001-cmd-ld-set-alignment-for-the-.rel.plt-section-on-32-.patch
 delete mode 100644 meta/recipes-devtools/go/go-1.4/016-armhf-elf-header.patch
 delete mode 100644 meta/recipes-devtools/go/go-1.4/go-cross-backport-cmd-link-support-new-386-amd64-rel.patch
 delete mode 100644 meta/recipes-devtools/go/go-1.4/syslog.patch
 create mode 100644 meta/recipes-devtools/go/go-1.8/make-goroot-precious.patch
 create mode 100644 meta/recipes-devtools/go/go-1.8/set-gotooldir-during-bootstrap.patch
 delete mode 100644 meta/recipes-devtools/go/go-bootstrap-native_1.4.bb
 create mode 100644 meta/recipes-devtools/go/go-cross-canadian.inc
 create mode 100644 meta/recipes-devtools/go/go-cross-canadian_1.8.bb
 create mode 100644 meta/recipes-devtools/go/go-crosssdk.inc
 create mode 100644 meta/recipes-devtools/go/go-crosssdk_1.8.bb
 create mode 100644 meta/recipes-devtools/go/go-runtime.inc
 create mode 100644 meta/recipes-devtools/go/go-runtime_1.8.bb
 create mode 100644 meta/recipes-devtools/go/go-target.inc
 delete mode 100644 meta/recipes-devtools/go/go.inc

-- 
2.14.1


