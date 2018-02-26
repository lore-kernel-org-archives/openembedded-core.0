Return-Path: <matt@madison.systems>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 8D9F76FFD3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Feb 2018 19:33:58 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id u5so182247pfh.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Feb 2018 11:34:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=ihlb0vCD5ZRBZRI6zhDpK2AX3+IPW+X/rhKtKve68ZE=;
	b=vNJVHSymj5r+md1eAmq9dY48vz6z50uaZsT5kRJ7HSKu2Pv4FW0JdT77cf9QLkHyr/
	NYaNLoNM2RGUVgrJlzZ/udrEymN4CXPMh8bCjJgni9+zpcGwReBaqB8jFwPJP3Jed4JF
	3Ga6Z4NgwP+EuyWQYOIiPOy3yEmLPzHFai98/4IxB3m5G0pYTZhi5K+InoUWqJujihpL
	D3azVrdmtVgTv4/0AqzI+WKW43vLZBQBg+XtrKcKPQeNh3/I6o67dCmRM/+QTA2IZ8n7
	zVi4tcy2J9u/rf8/WC46mPiNiV05pZ0VvYTZjHn1P+chpeNhyymoOiEaeYKsDqAOSOg4
	wZXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ihlb0vCD5ZRBZRI6zhDpK2AX3+IPW+X/rhKtKve68ZE=;
	b=J4nqbR1hOGCXgiHHDBdmfW24zW2lXorhY+2ffj0yYviEzM9bHIjwWLXk/2FbjwDIg5
	/RnqVlA7HDTxYtb/h/mcaypRikfDQpSvwQ+bCUxSWAK9Sb9mm09T0Mi/TCXUsJB09Ez/
	kK2jP8I1cXZmB25ktMxwRjmOULkGeVNueTpnunQspIr6P2WDqphPqgPfB2vN1Z20vnEl
	0ajW7D21zv/9xkK5lukMp1tNPKcYNkBw1fC0CTOn7+iF9sIsoVhIxjfCszZypXdF8tHA
	n8RVSyn/VwJCN7JYoigv7ur/HobpgSXfc2YfL7GpCiqkGJnPtYYRtt3gBOWCKgtcQJ60
	K4dg==
X-Gm-Message-State: APf1xPCKRZVx32HNhfmoBKP0xvdiTvP1YGnd280oI4FeqOOcqngbyZBE
	JLpbtCTN6Y3XflQZ22Ef9x0aKCe/
X-Google-Smtp-Source: AH8x225kMK4ediwBYI7enGKiOI+/3GakjWg42p4V4oF0ybqtb1M+1dCIWvO3UBBHSIwxwUWFY8CBvw==
X-Received: by 10.101.83.3 with SMTP id m3mr9285047pgq.396.1519673639122;
	Mon, 26 Feb 2018 11:33:59 -0800 (PST)
Received: from ip-172-31-34-104.us-west-2.compute.internal
	(ec2-34-218-58-157.us-west-2.compute.amazonaws.com. [34.218.58.157])
	by smtp.gmail.com with ESMTPSA id 84sm8542736pge.23.2018.02.26.11.33.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 26 Feb 2018 11:33:57 -0800 (PST)
From: Matt Madison <matt@madison.systems>
To: openembedded-core@lists.openembedded.org
Date: Mon, 26 Feb 2018 19:33:08 +0000
Message-Id: <1519673596-4750-1-git-send-email-matt@madison.systems>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 0/8] go1.10 update and misc improvements
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
X-List-Received-Date: Mon, 26 Feb 2018 19:33:58 -0000

Updates to the go recipes and bbclasses for go1.10, which
moves the bulk of the toolchain bootstrap and build out
of the 'make.bash' script and to the 'dist' tool.  This
required a rework of the patches.

go1.10 introduces significant changes to the go build
tool as well, requiring some further patches to make
it work for OE builds.

See https://golang.org/doc/go1.10 for a complete list
of new features and changes.

Following the update are some cleanup/improvement
patches.

Matt Madison (8):
  go: update go 1.9 -> go 1.10
  go: set GOMIPS envrionment variable
  go.bbclass: rename GO_TMPDIR -> GOTMPDIR
  go.bbclass: remove debug-related commands
  go.bbclass: don't stage test data with sources
  go.bbclass: ptest cleanup and improvements
  goarch.bbclass: disable shared runtime for nativesdk builds
  go: move common settings to go-common.inc

 meta/classes/go.bbclass                            | 104 ++++----
 meta/classes/goarch.bbclass                        |  12 +
 meta/recipes-devtools/go/go-1.10.inc               |  21 ++
 ...1-allow-CC-and-CXX-to-have-multiple-words.patch |  49 ++++
 ...-content-based-hash-generation-less-pedan.patch | 220 ++++++++++++++++
 ...OLDIR-to-be-overridden-in-the-environment.patch |  64 +++++
 .../0004-ld-add-soname-to-shareable-objects.patch  |  47 ++++
 ...verride-CC-when-building-dist-and-go_boot.patch |  40 +++
 ...-cmd-dist-separate-host-and-target-builds.patch | 277 +++++++++++++++++++++
 ...07-cmd-go-make-GOROOT-precious-by-default.patch |  97 ++++++++
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
 meta/recipes-devtools/go/go-cross-canadian_1.10.bb |   2 +
 meta/recipes-devtools/go/go-cross-canadian_1.9.bb  |   2 -
 meta/recipes-devtools/go/go-cross.inc              |  56 ++---
 meta/recipes-devtools/go/go-cross_1.10.bb          |   2 +
 meta/recipes-devtools/go/go-cross_1.9.bb           |   2 -
 meta/recipes-devtools/go/go-crosssdk.inc           |  14 +-
 meta/recipes-devtools/go/go-crosssdk_1.10.bb       |   2 +
 meta/recipes-devtools/go/go-crosssdk_1.9.bb        |   2 -
 meta/recipes-devtools/go/go-native.inc             |  25 +-
 meta/recipes-devtools/go/go-native_1.10.bb         |   2 +
 meta/recipes-devtools/go/go-native_1.9.bb          |   2 -
 meta/recipes-devtools/go/go-runtime.inc            |  58 ++---
 meta/recipes-devtools/go/go-runtime_1.10.bb        |   2 +
 meta/recipes-devtools/go/go-runtime_1.9.bb         |   2 -
 meta/recipes-devtools/go/go-target.inc             |  20 +-
 meta/recipes-devtools/go/go_1.10.bb                |   2 +
 meta/recipes-devtools/go/go_1.9.bb                 |   2 -
 42 files changed, 1121 insertions(+), 811 deletions(-)
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
 create mode 100644 meta/recipes-devtools/go/go-cross-canadian_1.10.bb
 delete mode 100644 meta/recipes-devtools/go/go-cross-canadian_1.9.bb
 create mode 100644 meta/recipes-devtools/go/go-cross_1.10.bb
 delete mode 100644 meta/recipes-devtools/go/go-cross_1.9.bb
 create mode 100644 meta/recipes-devtools/go/go-crosssdk_1.10.bb
 delete mode 100644 meta/recipes-devtools/go/go-crosssdk_1.9.bb
 create mode 100644 meta/recipes-devtools/go/go-native_1.10.bb
 delete mode 100644 meta/recipes-devtools/go/go-native_1.9.bb
 create mode 100644 meta/recipes-devtools/go/go-runtime_1.10.bb
 delete mode 100644 meta/recipes-devtools/go/go-runtime_1.9.bb
 create mode 100644 meta/recipes-devtools/go/go_1.10.bb
 delete mode 100644 meta/recipes-devtools/go/go_1.9.bb

-- 
2.7.4


