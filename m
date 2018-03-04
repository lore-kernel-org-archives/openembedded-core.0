Return-Path: <matt@madison.systems>
Received: from mail-pl0-f42.google.com (mail-pl0-f42.google.com
	[209.85.160.42])
	by mail.openembedded.org (Postfix) with ESMTP id 9AAB578748
	for <openembedded-core@lists.openembedded.org>;
	Sun,  4 Mar 2018 21:09:40 +0000 (UTC)
Received: by mail-pl0-f42.google.com with SMTP id s13-v6so8540355plq.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 04 Mar 2018 13:09:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=Nh+AhF7x8QpgLuHTT2E80siQSqSaT3AN4I/eCQ1H080=;
	b=A7/mLL0bT7CsBeYL16p/D04i1+jhlSM/40h/wsRKChEKx9eYKq8M+vxK+l2vXdaNKy
	xHjNYSxQ15FJNiD9fDXH3dbDf/XRZhWUbCoxhqGVPstQOxAbs6F2x+WRwcJAT39a++4g
	VpW5qBfrdlR7jjn63K2eBuNwWM5ZFuK/4AmCaA6biGbMfqbSReXn7iYYlZ98VpMxfFlY
	IILzO4u6NO/eZ4LpWikelgoat1zWgjGzl8byQGDIBy+6lgOQIXadYv32uBDo4MWCqHW2
	GZSrlF7KDWeSXdo9XY8kAoQLMzld7RZfNCke+MOuMB9wwMt/fyrvnbgB5Hp3z4TPdO+3
	yikw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Nh+AhF7x8QpgLuHTT2E80siQSqSaT3AN4I/eCQ1H080=;
	b=QYK0XDCtlc365lQagD7hZfTsYFktkCq+XLHBgriKaI6KpBbDley2V7w2hRg96zlBV+
	yc03BQszuuve9xJAmngXfh/mPSWF8lX+XT68btrjKSWIT1vWDMrHpyEVQpg+0SB87Zyj
	Qc5ohF6CrhSn6FX5vg3vo3kaEoqzWWTWwj09K62I25MyLigBwgjlNFBzAldEhW2ftzBV
	XH7melSEWfMRV6kUSPq9pTymFWpmzRXKUxO1SnjFgYbQkWyIKYOYiVF5xacTmmP6mFxY
	PZSIAniqfYplbOlMicSLqQfaK9E7cFbw/XhwPOo4vDPRwNd9n4y+b4HLPKYPd3RexNeY
	eYuA==
X-Gm-Message-State: APf1xPAZeJuGYWEOcenVVi+EpZd1te8GvzsjXUZi4kz+RSXzOsn4wBCP
	R2zdBpRSh1tBtY10mExuLxNYMw1U
X-Google-Smtp-Source: AG47ELsJZ2t6wWb0gMxBo6WKLzEIvPJ1Rz1SzbjpQe2vP5YRG6TUDJBETABNDAQTSulEZQ/oOSA2zw==
X-Received: by 2002:a17:902:4381:: with SMTP id
	j1-v6mr10917360pld.297.1520197781172; 
	Sun, 04 Mar 2018 13:09:41 -0800 (PST)
Received: from workhorse.athrat.org (c-67-170-200-185.hsd1.ca.comcast.net.
	[67.170.200.185]) by smtp.gmail.com with ESMTPSA id
	x123sm18594829pgb.5.2018.03.04.13.09.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 04 Mar 2018 13:09:39 -0800 (PST)
From: Matt Madison <matt@madison.systems>
To: openembedded-core@lists.openembedded.org
Date: Sun,  4 Mar 2018 13:09:24 -0800
Message-Id: <20180304210937.29727-1-matt@madison.systems>
X-Mailer: git-send-email 2.14.1
Subject: [PATCH v5 00/13] go1.10 update and misc improvements
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
X-List-Received-Date: Sun, 04 Mar 2018 21:09:40 -0000

New in v5:
    * Fixed build problem introduced in v3
      when *not* using security flags
    * Added in a backported go source patch
      fixing a an aarch64 issue (via Khem)
    * Updated the recipe changes to keep the
      1.9 recipes in place
    * Added a GOVERSION setting to tcmode-default.inc
      to allow choosing 1.9 instead of 1.10
    * Collapsed the '-v' removal patch, since
      it was really a fixup for an earlier
      patch in the series.

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
  tcmode-default.inc: add settings for go

 meta/classes/go.bbclass                            | 114 +++++----
 meta/classes/goarch.bbclass                        |  14 ++
 meta/conf/distro/include/tcmode-default.inc        |  10 +
 .../packagegroups/packagegroup-go-sdk-target.bb    |   1 +
 meta/recipes-devtools/go/go-1.10.inc               |  22 ++
 ...1-allow-CC-and-CXX-to-have-multiple-words.patch |  33 +++
 ...-content-based-hash-generation-less-pedan.patch | 220 ++++++++++++++++
 ...OLDIR-to-be-overridden-in-the-environment.patch |  64 +++++
 .../0004-ld-add-soname-to-shareable-objects.patch  |  47 ++++
 ...verride-CC-when-building-dist-and-go_boot.patch |  40 +++
 ...-cmd-dist-separate-host-and-target-builds.patch | 277 +++++++++++++++++++++
 ...07-cmd-go-make-GOROOT-precious-by-default.patch | 108 ++++++++
 ...l-obj-arm64-fix-branch-too-far-with-TBZ-l.patch |  58 +++++
 ...ld-replace-glibc-dynamic-linker-with-musl.patch | 130 ++++++++++
 meta/recipes-devtools/go/go-common.inc             |   6 +
 meta/recipes-devtools/go/go-cross-canadian.inc     |  26 +-
 meta/recipes-devtools/go/go-cross-canadian_1.10.bb |   2 +
 meta/recipes-devtools/go/go-cross-canadian_1.9.bb  |  10 +
 meta/recipes-devtools/go/go-cross.inc              |  56 ++---
 meta/recipes-devtools/go/go-cross_1.10.bb          |   2 +
 meta/recipes-devtools/go/go-cross_1.9.bb           |   8 +
 meta/recipes-devtools/go/go-crosssdk.inc           |  14 +-
 meta/recipes-devtools/go/go-crosssdk_1.10.bb       |   2 +
 meta/recipes-devtools/go/go-crosssdk_1.9.bb        |   9 +
 meta/recipes-devtools/go/go-native.inc             |  25 +-
 meta/recipes-devtools/go/go-native_1.10.bb         |   2 +
 meta/recipes-devtools/go/go-native_1.9.bb          |   2 +
 meta/recipes-devtools/go/go-runtime.inc            |  56 ++---
 meta/recipes-devtools/go/go-runtime_1.10.bb        |   2 +
 meta/recipes-devtools/go/go-runtime_1.9.bb         |  21 ++
 meta/recipes-devtools/go/go-target.inc             |  24 +-
 meta/recipes-devtools/go/go_1.10.bb                |   2 +
 meta/recipes-devtools/go/go_1.9.bb                 |  15 ++
 33 files changed, 1260 insertions(+), 162 deletions(-)
 create mode 100644 meta/recipes-devtools/go/go-1.10.inc
 create mode 100644 meta/recipes-devtools/go/go-1.10/0001-allow-CC-and-CXX-to-have-multiple-words.patch
 create mode 100644 meta/recipes-devtools/go/go-1.10/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch
 create mode 100644 meta/recipes-devtools/go/go-1.10/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch
 create mode 100644 meta/recipes-devtools/go/go-1.10/0004-ld-add-soname-to-shareable-objects.patch
 create mode 100644 meta/recipes-devtools/go/go-1.10/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch
 create mode 100644 meta/recipes-devtools/go/go-1.10/0006-cmd-dist-separate-host-and-target-builds.patch
 create mode 100644 meta/recipes-devtools/go/go-1.10/0007-cmd-go-make-GOROOT-precious-by-default.patch
 create mode 100644 meta/recipes-devtools/go/go-1.10/0008-cmd-internal-obj-arm64-fix-branch-too-far-with-TBZ-l.patch
 create mode 100644 meta/recipes-devtools/go/go-1.10/0009-ld-replace-glibc-dynamic-linker-with-musl.patch
 create mode 100644 meta/recipes-devtools/go/go-cross-canadian_1.10.bb
 create mode 100644 meta/recipes-devtools/go/go-cross_1.10.bb
 create mode 100644 meta/recipes-devtools/go/go-crosssdk_1.10.bb
 create mode 100644 meta/recipes-devtools/go/go-native_1.10.bb
 create mode 100644 meta/recipes-devtools/go/go-runtime_1.10.bb
 create mode 100644 meta/recipes-devtools/go/go_1.10.bb

-- 
2.14.1


