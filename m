Return-Path: <matt@madison.systems>
Received: from mail-pl0-f52.google.com (mail-pl0-f52.google.com
	[209.85.160.52])
	by mail.openembedded.org (Postfix) with ESMTP id BA509788CE
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Mar 2018 20:33:29 +0000 (UTC)
Received: by mail-pl0-f52.google.com with SMTP id k8-v6so6322411pli.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Mar 2018 12:33:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=uhHtXLpl9Bl4gt1Emcb7AVZGaLvHNuL8jLPdiyfvTTo=;
	b=aMiym7yqkMtI0fKk6Qfeh/DhqQUyuUyvxb+lhmm+KDOMy2To5h1JzkaRLSKhqRc2C7
	hAfDdzHG5n/GIxAQLv/g6JJZGUhAG8jT8qdQDQ6zs7GTEyiQj2UOiBaE5gugISqLucpz
	VDJSyeBaQBfgzZulJ8K9zWMfWtazLnDdUMBqplt/6nYnBzM9zV26+aUwEumNykaRQ2Cj
	Z0QMfRMgWG3rw3MfZtS+4CaJDgeWkmJG3Tl8TPXBSIimQHFVXZih52yCO7yWIORz49/K
	cDEqSRUYXzgB/CJ/DTtBmbQJyvGXpnggOOqlONPynZJNF1rw52OQuwSv4aN0hWrDfnLc
	R6xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=uhHtXLpl9Bl4gt1Emcb7AVZGaLvHNuL8jLPdiyfvTTo=;
	b=J/uRzCqOdQaELwa8T771jwb9Us4MUtDnEg4g9NqB9SD5Mr7Wv3HvfQ4WdGInmqbHOZ
	ZYZnp3AFTYzGvKZ8bZ0QhorczUf8YdBFZZGKzNy8Rej0sbidCdvxfikZ1wHiT7cULyke
	IZ0Hsr8Y1oh/KX4b1GP4kmAbGMcA149O8G2z1oRtliwhSwVYs2csnOuGs85SGDdnkqPh
	iGO4o6+zmDbD2Xr4fEASqerjBS6sv1H8xgWXMUr4SmwPsJCCe5P3DUSltZSw5eHQJCm4
	zJOzyM70xS4gE5GY3BnNDE0zKYIaumTRwkmQ+mkKmXZDlBqEmyqSVBUZ7vo3dfGp1Pop
	OVlQ==
X-Gm-Message-State: APf1xPAvUXI78FLVrBEzj24dL59yP40p6Ok2OSj7AnR9lUPgmeTzKwhz
	xhEMvGtwsaUXMgMUSDjDrKyqeNxe
X-Google-Smtp-Source: AG47ELuZZXcwfiw5DQX71T1GCMf1VZuyp5Gv1gBLerY4imTaW985vgWS74Y4YVLLqpZ/6xrGPDlgHw==
X-Received: by 2002:a17:902:60cf:: with SMTP id
	k15-v6mr6223250pln.347.1520022810117; 
	Fri, 02 Mar 2018 12:33:30 -0800 (PST)
Received: from workhorse.athrat.org (c-67-170-200-185.hsd1.ca.comcast.net.
	[67.170.200.185]) by smtp.gmail.com with ESMTPSA id
	m12sm11193338pgr.35.2018.03.02.12.33.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 02 Mar 2018 12:33:28 -0800 (PST)
From: Matt Madison <matt@madison.systems>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Mar 2018 12:33:01 -0800
Message-Id: <20180302203314.32737-1-matt@madison.systems>
X-Mailer: git-send-email 2.14.1
Subject: [PATCH v4 00/13] go1.10 update and misc improvements
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
X-List-Received-Date: Fri, 02 Mar 2018 20:33:29 -0000

New in v4:
    * updated the go source patch to protect
      GOROOT to defer generating an error
      until a build action would try to update
      something in GOROOT
    * updated go.bbclass to compile for both
      static and dynamic linking, similar to
      go-runtime
    * fixed missing sign-off

New in v3:
    * reduced one of the go source patches,
      eliminating an unneeded change (thanks
      Otavio)
    * Added bbclass and recipe patches to
      handle SECURITY_CFLAGS settings if
      they're enabled
    * Added go-runtime-staticdev to target-side
      SDK, needed for go static builds (fixes
      test case failure in oe-selftest)
    * two more minor cleanups

New in v2:
    * Fixed Upstream-Status line in go patches
    * Added GOTMPDIR to do_configure[dirs]

Updates to the go recipes and bbclasses for go1.10, which
moves the bulk of the toolchain bootstrap and build out
of the 'make.bash' script and to the 'dist' tool.  This
required a rework of the patches to the go source.

go1.10 introduces significant changes to the go build
tool as well, requiring some further patches to make
it work for OE builds.

See https://golang.org/doc/go1.10 for a complete list
of new features and changes.

Following the update are some cleanup/improvement
patches.

Matt Madison (13):
  go: update go 1.9 -> go 1.10
  go: set GOMIPS envrionment variable
  go.bbclass: rename GO_TMPDIR -> GOTMPDIR
  go.bbclass: remove debug-related commands
  go.bbclass: don't stage test data with sources
  go.bbclass: ptest cleanup and improvements
  goarch.bbclass: disable shared runtime for nativesdk builds
  go: move common settings to go-common.inc
  go.bbclass, goarch.bbclass: update SECURITY_CFLAGS
  go: disable PIE CFLAGS for nativesdk and cross-canadian builds
  packagegroup-go-sdk-target: add go-runtime-staticdev
  go-runtime: remove unneeded nativesdk override, rename variable
  go-cross-canadian: remove verbosity setting from GO_LDFLAGS

 meta/classes/go.bbclass                            | 112 +++++----
 meta/classes/goarch.bbclass                        |  13 +
 .../packagegroups/packagegroup-go-sdk-target.bb    |   1 +
 meta/recipes-devtools/go/go-1.10.inc               |  21 ++
 ...1-allow-CC-and-CXX-to-have-multiple-words.patch |  33 +++
 ...-content-based-hash-generation-less-pedan.patch | 220 ++++++++++++++++
 ...OLDIR-to-be-overridden-in-the-environment.patch |  64 +++++
 .../0004-ld-add-soname-to-shareable-objects.patch  |  47 ++++
 ...verride-CC-when-building-dist-and-go_boot.patch |  40 +++
 ...-cmd-dist-separate-host-and-target-builds.patch | 277 +++++++++++++++++++++
 ...07-cmd-go-make-GOROOT-precious-by-default.patch | 108 ++++++++
 ...ld-replace-glibc-dynamic-linker-with-musl.patch | 130 ++++++++++
 meta/recipes-devtools/go/go-1.9.inc                |  26 --
 .../0001-make.bash-quote-CC_FOR_TARGET.patch       |  32 ---
 ...CC-and-CXX-environment-variable-construct.patch |  67 -----
 ...sh-better-separate-host-and-target-builds.patch |  92 -------
 ...w-GOTOOLDIR-to-be-overridden-in-the-envir.patch |  68 -----
 ...05-cmd-go-make-GOROOT-precious-by-default.patch |  41 ---
 ...dd-GOTOOLDIR_BOOTSTRAP-environment-variab.patch |  36 ---
 .../0007-ld-add-soname-to-shareable-objects.patch  |  46 ----
 ...dd-GOHOSTxx-indirection-for-cross-canadia.patch |  33 ---
 ...dmode-pie-forces-external-linking-mode-on.patch |  47 ----
 ...verride-CC-when-building-dist-and-go_boot.patch |  43 ----
 .../go/go-1.9/set-external-linker.patch            | 111 ---------
 meta/recipes-devtools/go/go-common.inc             |   6 +
 meta/recipes-devtools/go/go-cross-canadian.inc     |  26 +-
 ...s-canadian_1.9.bb => go-cross-canadian_1.10.bb} |   0
 meta/recipes-devtools/go/go-cross.inc              |  56 ++---
 .../go/{go-cross_1.9.bb => go-cross_1.10.bb}       |   0
 meta/recipes-devtools/go/go-crosssdk.inc           |  14 +-
 .../go/{go-crosssdk_1.9.bb => go-crosssdk_1.10.bb} |   0
 meta/recipes-devtools/go/go-native.inc             |  25 +-
 .../go/{go-native_1.9.bb => go-native_1.10.bb}     |   0
 meta/recipes-devtools/go/go-runtime.inc            |  56 ++---
 .../go/{go-runtime_1.9.bb => go-runtime_1.10.bb}   |   0
 meta/recipes-devtools/go/go-target.inc             |  24 +-
 meta/recipes-devtools/go/{go_1.9.bb => go_1.10.bb} |   0
 37 files changed, 1110 insertions(+), 805 deletions(-)
 create mode 100644 meta/recipes-devtools/go/go-1.10.inc
 create mode 100644 meta/recipes-devtools/go/go-1.10/0001-allow-CC-and-CXX-to-have-multiple-words.patch
 create mode 100644 meta/recipes-devtools/go/go-1.10/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch
 create mode 100644 meta/recipes-devtools/go/go-1.10/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch
 create mode 100644 meta/recipes-devtools/go/go-1.10/0004-ld-add-soname-to-shareable-objects.patch
 create mode 100644 meta/recipes-devtools/go/go-1.10/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch
 create mode 100644 meta/recipes-devtools/go/go-1.10/0006-cmd-dist-separate-host-and-target-builds.patch
 create mode 100644 meta/recipes-devtools/go/go-1.10/0007-cmd-go-make-GOROOT-precious-by-default.patch
 create mode 100644 meta/recipes-devtools/go/go-1.10/0008-ld-replace-glibc-dynamic-linker-with-musl.patch
 delete mode 100644 meta/recipes-devtools/go/go-1.9.inc
 delete mode 100644 meta/recipes-devtools/go/go-1.9/0001-make.bash-quote-CC_FOR_TARGET.patch
 delete mode 100644 meta/recipes-devtools/go/go-1.9/0002-cmd-go-fix-CC-and-CXX-environment-variable-construct.patch
 delete mode 100644 meta/recipes-devtools/go/go-1.9/0003-make.bash-better-separate-host-and-target-builds.patch
 delete mode 100644 meta/recipes-devtools/go/go-1.9/0004-cmd-go-allow-GOTOOLDIR-to-be-overridden-in-the-envir.patch
 delete mode 100644 meta/recipes-devtools/go/go-1.9/0005-cmd-go-make-GOROOT-precious-by-default.patch
 delete mode 100644 meta/recipes-devtools/go/go-1.9/0006-make.bash-add-GOTOOLDIR_BOOTSTRAP-environment-variab.patch
 delete mode 100644 meta/recipes-devtools/go/go-1.9/0007-ld-add-soname-to-shareable-objects.patch
 delete mode 100644 meta/recipes-devtools/go/go-1.9/0008-make.bash-add-GOHOSTxx-indirection-for-cross-canadia.patch
 delete mode 100644 meta/recipes-devtools/go/go-1.9/0009-cmd-go-buildmode-pie-forces-external-linking-mode-on.patch
 delete mode 100644 meta/recipes-devtools/go/go-1.9/0010-make.bash-override-CC-when-building-dist-and-go_boot.patch
 delete mode 100644 meta/recipes-devtools/go/go-1.9/set-external-linker.patch
 rename meta/recipes-devtools/go/{go-cross-canadian_1.9.bb => go-cross-canadian_1.10.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.9.bb => go-cross_1.10.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.9.bb => go-crosssdk_1.10.bb} (100%)
 rename meta/recipes-devtools/go/{go-native_1.9.bb => go-native_1.10.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.9.bb => go-runtime_1.10.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.9.bb => go_1.10.bb} (100%)

-- 
2.14.1


