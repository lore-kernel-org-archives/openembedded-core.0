Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f177.google.com (mail-qt0-f177.google.com
	[209.85.216.177])
	by mail.openembedded.org (Postfix) with ESMTP id 821F6783FD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 12:50:56 +0000 (UTC)
Received: by mail-qt0-f177.google.com with SMTP id t46so1462852qtj.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 05:50:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=O4SpiyMGH2ZV7dnEcPaCJ2/+JVQj9GBNkaBljtK/Zlo=;
	b=MkV9eLB3TLgQfP5rWhty1viPgG5t02iVqWVU/4WDncE4QhyOWqJfVRDM5yDe8Aeu7w
	wmwkf4K4P1L8BIi9gX5Pbae1HlhlAaSW9UQsXSta4HdYiOXxEwLtoZx7w1SsDa3BJRfF
	8wozkx02UliiYG3xjfyKVdEdIxgCEH1Pn/qULs8dFmKU6QjvlqQlJI2aIdf+oj+p32c6
	3wfKrNXd94Ndx0QI3ibt6P5Bqe5B5icnF2l2x6dZaW/kMXwwRK+UK67Hk5shBT3P6yG+
	/iy+q82jMbFbd4tNHU/0rBJReRlzGERV8zn7ZYmpZZzWCBwVR3ewkYGZjJ37fCKB+OSp
	kIlA==
X-Gm-Message-State: AHPjjUg/VvN12wHpUnd+N939I0MKxILbX/n9p8qPeYqslHOySXOMfl94
	fc9XABa2M2wndSU1
X-Google-Smtp-Source: AOwi7QAdnFH7YgE7Xtl/BF14eYHpYluXAbiLzukriy3/8mXMdsJqLJovGwsaBwTXiY7agI0brt5Ssw==
X-Received: by 10.200.53.168 with SMTP id k37mr19869171qtb.237.1505220657040; 
	Tue, 12 Sep 2017 05:50:57 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	i84sm8187385qkh.17.2017.09.12.05.50.52
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 12 Sep 2017 05:50:56 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Tue, 12 Sep 2017 09:50:47 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue, 12 Sep 2017 09:50:18 -0300
Message-Id: <20170912125031.4009-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
Organization: O.S. Systems Software LTDA.
Cc: Will Newton <willn@resin.io>, Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v8 00/13] Revamp the Go support
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
X-List-Received-Date: Tue, 12 Sep 2017 12:50:56 -0000

This improves the Go support on OE-Core.

We are trying to port as much as possible work done by Matt on
meta-golang back to OE-Core and also to avoid carrying old releases as
there is no need to support more versions of Go toolchain.

This fixes issues in existing support as well as add support for SDK
generation which supports Go.

Changes in v8:
- new patch
- Fix patch header

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

Otavio Salvador (1):
  go-dep: Move bash dependency to -dev package

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
 meta/recipes-devtools/go/go-dep_0.3.0.bb           |   2 +-
 meta/recipes-devtools/go/go-native.inc             |  48 +++--
 meta/recipes-devtools/go/go-native_1.8.bb          |   1 -
 meta/recipes-devtools/go/go-runtime.inc            |  58 ++++++
 meta/recipes-devtools/go/go-runtime_1.8.bb         |   2 +
 meta/recipes-devtools/go/go-target.inc             |  54 +++++
 meta/recipes-devtools/go/go.inc                    |  81 --------
 meta/recipes-devtools/go/go_1.8.bb                 |   2 +-
 25 files changed, 394 insertions(+), 511 deletions(-)
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


