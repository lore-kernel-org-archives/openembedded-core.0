Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id 2A96960603
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Sep 2017 21:04:55 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id 7so2240590qtz.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Sep 2017 14:04:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=jsX7slzD3PrpVul2Ceak2z3A+UmvOfvlmbQU3eHa52w=;
	b=dH9jlYIH1lFByupZXumuNwpY9SOvtQnBHlSd/cNHUApxzsAdz3m05koKJ2GdlNivXz
	4Yj539IGp5GMGpCEY3N6xWIwQbTv7jSb8uNk8V2qf2gaR0WH0597ouNVR+y/4FtS+WwP
	lpvUqTgclfUbeL6l1fVxsisbMLaO6nMMxl5MDTrDPVTFakSnfhOiYrp5TJAEGyQdYUgr
	RS78YhbVtEwXRVM1wToITTOjfCaO2aXbz7ax4qT/nFitJuESIiy89i3t1LcSzyyCMR1U
	INIiro7qq9yd84F1u9sw4wDwmDJNjMuh1DSbV9WeiPeqVELQ3zjrf49UFvbikTScpgaK
	lkyg==
X-Gm-Message-State: AHPjjUgsdb0aA5aIZt/hxzMKtZfR8KhYXRkn/9L6PgKTmWdJC9JjaLVP
	dzuQi6p7accdSjtb
X-Google-Smtp-Source: AOwi7QCFpeNl2MxaGGOctGdfaVeI8amZ7La9EyX2cjwJVgJE+AlzumtDbFi/r7otcQnFbJkyTMyKHg==
X-Received: by 10.200.27.85 with SMTP id p21mr5650932qtk.3.1504904696506;
	Fri, 08 Sep 2017 14:04:56 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	q52sm1902632qtc.12.2017.09.08.14.04.50
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 08 Sep 2017 14:04:54 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Fri, 08 Sep 2017 18:04:45 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Fri,  8 Sep 2017 18:04:30 -0300
Message-Id: <20170908210444.25763-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
Organization: O.S. Systems Software LTDA.
Cc: Will Newton <willn@resin.io>, Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v5 00/14] Revamp the Go support
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
X-List-Received-Date: Fri, 08 Sep 2017 21:04:56 -0000

This is not yet complete but does improve some parts of
Go support on OE-Core.

We are trying to port as much as possible work done by Matt on
meta-golang back to OE-Core and also to avoid carrying old releases as
there is no need to support more versions of Go toolchain.

The first commits on this patchset fix errors in current
implementation, the others are improvements and clean ups.

Changes in v5:
- new patch
- use new unpack support
- new patch

Changes in v4:
- new patch to consolidade in a single patchset all golang changes
- rebase on top of new "goarch.bbclass: Replace logic for setting
  GOARM"

Changes in v3:
- new patch
- new patch
- new patch

Changes in v2:
- Remove -x flag (madisongh)
- Remove GO_EXTLDFLAGS for now (madisongh)
- new patch

Matt Madison (4):
  go.bbclass: exported function cleanup
  go.bbclass: separate ${S} and ${B}
  go.bbclass: add do_unpack function to handle common cases
  go.bbclass: add GO_INSTALL_FILTEROUT variable

Otavio Salvador (9):
  goarch.bbclass: Stop passing True as second argument of d.getVar
  go.bbclass: Fix binary installation path detection
  go: Remove Go 1.6 and 1.7 releases
  goarch.bbclass: Add support for ARMv5
  go.bbclass: Use a global Go build flags
  go.bbclass: Enable parallel build
  go.bbclass: Use an auxiliary variable to add the build dependencies
  go-dep: Add 0.3.0 release
  go-helloworld: Use the Golang examples repository

Will Newton (1):
  goarch.bbclass: Replace logic for setting GOARM

 meta/classes/go.bbclass                            | 110 ++++++++++++++-------
 meta/classes/goarch.bbclass                        |  27 ++---
 meta/recipes-devtools/go/go-1.6.inc                |  19 ----
 .../go/go-1.6/armhf-elf-header.patch               |  23 -----
 .../go/go-1.6/fix-cc-handling.patch                |  50 ----------
 .../go/go-1.6/fix-target-cc-for-build.patch        |  17 ----
 meta/recipes-devtools/go/go-1.6/gotooldir.patch    |  30 ------
 .../go/go-1.6/split-host-and-target-build.patch    |  63 ------------
 meta/recipes-devtools/go/go-1.6/syslog.patch       |  62 ------------
 meta/recipes-devtools/go/go-1.7.inc                |  19 ----
 .../go/go-1.7/armhf-elf-header.patch               |  23 -----
 .../go/go-1.7/fix-cc-handling.patch                |  50 ----------
 .../go/go-1.7/fix-target-cc-for-build.patch        |  17 ----
 meta/recipes-devtools/go/go-1.7/gotooldir.patch    |  30 ------
 .../go/go-1.7/split-host-and-target-build.patch    |  62 ------------
 meta/recipes-devtools/go/go-1.7/syslog.patch       |  62 ------------
 meta/recipes-devtools/go/go-cross_1.7.bb           |   5 -
 meta/recipes-devtools/go/go-dep_0.3.0.bb           |  18 ++++
 meta/recipes-devtools/go/go_1.6.bb                 |   4 -
 meta/recipes-devtools/go/go_1.7.bb                 |   2 -
 .../go-examples/files/helloworld.go                |  10 --
 meta/recipes-extended/go-examples/go-examples.inc  |  10 --
 .../go-examples/go-helloworld_0.1.bb               |  24 +++--
 23 files changed, 121 insertions(+), 616 deletions(-)
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
 delete mode 100644 meta/recipes-extended/go-examples/files/helloworld.go
 delete mode 100644 meta/recipes-extended/go-examples/go-examples.inc

-- 
2.14.1


