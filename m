Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 366EB781E2
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Sep 2017 14:45:04 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id d70so1650507qkc.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Sep 2017 07:45:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=TeNWRDVcxO3U/ANxaVR9i66fp13HM8pEdIH7OgbPstI=;
	b=Aqoc6y34fKiG6tgjbPxLWWFGuWhO0NbOIcYzdGR9AkUF6VL7UEurvYkuLpnAdZ22cU
	QeOXKYWIzSuQFkB93wGvhF0L4Cf6qkND0s7Nu396yeHpOCXwmhgs4/CGl3jqkpUMqAgR
	3NvdP43V4dX/2X3hsLqodt+56PtOJpn+9nUIZljvHoXlqK9e0/2zPn6mINohmSDZBr4A
	tzND+/Sne4WE41iweiWMl3DR35ZO++9fApGHLwejGsBGeIocFIBsEDE1ybup9UltP3Da
	LL+Bh6nAYHbHOXFfasLHnjTfWf0jSy2/J7412G8YOvF79pcxvBjzSbzeOr3X0qoDz3ng
	6b2w==
X-Gm-Message-State: AHPjjUjXtcB5vOzD6htEDvzTxkB6Y4bS0O5zr92MgDpuNY82MdyHwLLw
	GcTD2qyh3xx1yOHg
X-Google-Smtp-Source: AOwi7QAyiw89HK+qsA9WeCmbQ/M3FpgKSFukzG+AEc8d6YhjcCxI0sXFNPOrkOYLlCcqX/0j7CcVCA==
X-Received: by 10.55.71.79 with SMTP id u76mr4126428qka.289.1504881905869;
	Fri, 08 Sep 2017 07:45:05 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id 36sm1385513qtz.89.2017.09.08.07.45.01
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 08 Sep 2017 07:45:05 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Fri, 08 Sep 2017 11:44:56 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Fri,  8 Sep 2017 11:44:42 -0300
Message-Id: <20170908144454.14308-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v4 00/12] Revamp the Go support
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
X-List-Received-Date: Fri, 08 Sep 2017 14:45:05 -0000

This is not yet complete but does improve some parts of
Go support on OE-Core.

We are trying to port as much as possible work done by Matt on
meta-golang back to OE-Core and also to avoid carrying old releases as
there is no need to support more versions of Go toolchain.

The first commits on this patchset fix errors in current
implementation, the others are improvements and clean ups.

Changes in v4:
- new patch to consolidade in a single patchset all golang changes
- rebase on top of new "goarch.bbclass: Replace logic for setting
  GOARM"

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

Will Newton (1):
  goarch.bbclass: Replace logic for setting GOARM

 meta/classes/go.bbclass                            | 104 +++++++++++++--------
 meta/classes/goarch.bbclass                        |  27 +++---
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
 20 files changed, 102 insertions(+), 587 deletions(-)
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


