Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
	[209.85.216.47])
	by mail.openembedded.org (Postfix) with ESMTP id 1FFF260BAB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 08:21:43 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id d5so2048984pjz.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 00:21:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=gPZO3JsWPIbwE+LW/BLK5L8lMJPQzKX5sZvXnU9BcsY=;
	b=cIZlSMFBiisZMoOQqEG8b1H7VZX9Hg5mfn84rJLU91L1ONonRzCZRLdmDdPiS9xatH
	sDtkhaXu9o6ktNWznwEuME2rH65k57RvO31ofFZJrJo0dxsk/qol1BDV/JwGiJfkYqht
	yUqIyuPIsrRJe9cb8wpiGzoCthBHRpFqwtL7nupbvc/NtNSzc1Vs604HfflCJXEx1thP
	ArrUjQPcRwHkpK9ns6BAUFZVySKRGSNRBiFabkn2VHiXdoJj9odp4JfUsBN4sp4yblDi
	7A1jPx5hNm/uO5HCXVhdKs9KsPtTpU1UQ04d8RCQwuVdSw0oALyAMQXr855vC2/41TUq
	xnbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=gPZO3JsWPIbwE+LW/BLK5L8lMJPQzKX5sZvXnU9BcsY=;
	b=MAgSbaQgmTsettfLTgu0rCiHZat6aCIK7WPCWHiw26LXb9xEdUilUZc/eGhi09bpW+
	BSbRd+Doo6oH044qh9Vw9ys0TQSn+LkM9NwKiGodhpeaQlFjoFvO+BPsGQBtcPkluYD/
	ADVYdg8Rh6I2yq1XlPZizNBgW4w+zrbnYX5vxZvZSzxZAupegtwvWxiaaDE56eJcTJh4
	K+X81sjP08+yhVuqsoxrv+e/NFULKXZ884N68cAu12hfOUcFbakfgC2sHW7g7HFc+PNr
	4BIZOHyZVbX9IgATaogBkrAaZJlwHOSu/nMPhDf0aw/nhhjLrTYcoMqqkwnPiHcJ0Mu2
	mNgQ==
X-Gm-Message-State: APjAAAUPR+GEmSNml4Z4uwodAjpyo+w8TnTFDh48Xf0of4+mYxG4hxGr
	s0GG5vKxPwJNPpYQztQ9mir7wX3WxsI=
X-Google-Smtp-Source: APXvYqyneTNm/7Jna5nYdl0jqdPGKMK0TTNFHpbcBzRgApf6/skdJuBRxKXNZNuikFPPzB6w4EDShw==
X-Received: by 2002:a17:902:bf49:: with SMTP id
	u9mr12459737pls.199.1581582103673; 
	Thu, 13 Feb 2020 00:21:43 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::c740])
	by smtp.gmail.com with ESMTPSA id w2sm1790419pgj.41.2020.02.13.00.21.42
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 13 Feb 2020 00:21:43 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Feb 2020 00:21:43 -0800
Message-Id: <cover.1581580428.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [PATCH v2 00/10] recipe updates, testing fixes
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
X-List-Received-Date: Thu, 13 Feb 2020 08:21:44 -0000
Content-Transfer-Encoding: 8bit

- Update gdb to 9.1 and musl to latest
- Fix packages busybox, ltp to build with musl exposed 64bit time_t
  problems
- rest of all fixes are found testing core-image-sato-sdk on
  qemuarm/qemux86_64
- Add a check for gold being used on rv32/rv64
- crosssdk is changed to not use target distro features

The following changes since commit 34535f3e0ca6f6e37e6457fc800dfbfff64d9298:

  bitbake: doc: minor tweaks to ch 1 of BB user manual (2020-02-08 17:41:17 +0000)

are available in the Git repository at:

  git://git.yoctoproject.org/poky-contrib kraj/pu
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=kraj/pu

Khem Raj (10):
  qemuarm: Disable highmem when QB_MACHINE is virt
  oeqa: Use --disable-maintainer-mode configure option
  libsolv: Enable rpm packageconfig by default only if rpm O_P_M is
    enabled
  dnf,libdnf: Ignore if PACKAGE_CLASSES does not have rpm
  musl: Update to latest tip
  gdb: Upgrade to 9.1 release
  busybox: Backport patches to support removal of __NR_clock_gettime
  ltp: Fix tescases with 64bit time_t using 32bit arches
  crosssdk: Set natisdk specific distro features
  binutils: Bail out if gold is used on 32/64 bit RISC-V

 meta/classes/crosssdk.bbclass                 |   6 +
 meta/conf/distro/include/tcmode-default.inc   |   2 +-
 meta/conf/machine/qemuarm.conf                |   2 +-
 meta/lib/oeqa/runtime/cases/buildcpio.py      |   2 +-
 meta/lib/oeqa/sdk/cases/buildcpio.py          |   2 +-
 ...rappers-around-clock_gettime-closes-.patch | 113 +++++++++++++++
 ...-Use-64-prefix-syscall-if-we-have-to.patch |  53 +++++++
 ...-Use-64-prefix-syscall-if-we-have-to.patch |  43 ++++++
 meta/recipes-core/busybox/busybox_1.31.1.bb   |   3 +
 meta/recipes-core/musl/musl_git.bb            |   2 +-
 meta/recipes-devtools/binutils/binutils.inc   |   7 +
 meta/recipes-devtools/dnf/dnf_4.2.2.bb        |   2 +
 meta/recipes-devtools/gdb/gdb-8.3.1.inc       |  22 ---
 meta/recipes-devtools/gdb/gdb-9.1.inc         |  21 +++
 ...ian_8.3.1.bb => gdb-cross-canadian_9.1.bb} |   0
 .../{gdb-cross_8.3.1.bb => gdb-cross_9.1.bb}  |   0
 ...ake-man-install-relative-to-DESTDIR.patch} |   9 +-
 ...x-nat-Define-_ABIO32-if-not-defined.patch} |   9 +-
 ...-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch} |   7 +-
 ...ort-for-Renesas-SH-sh4-architecture.patch} |  41 +++---
 ...eadline.a-when-using-disable-static.patch} |  13 +-
 ...s.h.patch => 0006-use-asm-sgidefs.h.patch} |   9 +-
 ...Use-exorted-definitions-of-SIGRTMIN.patch} |  11 +-
 ...atch => 0008-Change-order-of-CFLAGS.patch} |  13 +-
 ...9-resolve-restrict-keyword-conflict.patch} |  17 +--
 ...> 0010-Fix-invalid-sigprocmask-call.patch} |  23 ++-
 ...h => 0011-gdbserver-ctrl-c-handling.patch} |  31 ++--
 .../gdb/gdb/CVE-2019-1010180.patch            | 132 ------------------
 .../gdb/{gdb_8.3.1.bb => gdb_9.1.bb}          |   0
 meta/recipes-devtools/libdnf/libdnf_0.28.1.bb |   1 +
 .../libsolv/libsolv_0.7.10.bb                 |   2 +-
 ...or-time64-unsafe-syscalls-before-usi.patch |  81 +++++++++++
 meta/recipes-extended/ltp/ltp_20190930.bb     |   1 +
 33 files changed, 422 insertions(+), 258 deletions(-)
 create mode 100644 meta/recipes-core/busybox/busybox/0001-Remove-syscall-wrappers-around-clock_gettime-closes-.patch
 create mode 100644 meta/recipes-core/busybox/busybox/0001-date-Use-64-prefix-syscall-if-we-have-to.patch
 create mode 100644 meta/recipes-core/busybox/busybox/0001-time-Use-64-prefix-syscall-if-we-have-to.patch
 delete mode 100644 meta/recipes-devtools/gdb/gdb-8.3.1.inc
 create mode 100644 meta/recipes-devtools/gdb/gdb-9.1.inc
 rename meta/recipes-devtools/gdb/{gdb-cross-canadian_8.3.1.bb => gdb-cross-canadian_9.1.bb} (100%)
 rename meta/recipes-devtools/gdb/{gdb-cross_8.3.1.bb => gdb-cross_9.1.bb} (100%)
 rename meta/recipes-devtools/gdb/gdb/{0002-make-man-install-relative-to-DESTDIR.patch => 0001-make-man-install-relative-to-DESTDIR.patch} (77%)
 rename meta/recipes-devtools/gdb/gdb/{0003-mips-linux-nat-Define-_ABIO32-if-not-defined.patch => 0002-mips-linux-nat-Define-_ABIO32-if-not-defined.patch} (82%)
 rename meta/recipes-devtools/gdb/gdb/{0004-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch => 0003-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch} (89%)
 rename meta/recipes-devtools/gdb/gdb/{0005-Add-support-for-Renesas-SH-sh4-architecture.patch => 0004-Add-support-for-Renesas-SH-sh4-architecture.patch} (96%)
 rename meta/recipes-devtools/gdb/gdb/{0006-Dont-disable-libreadline.a-when-using-disable-static.patch => 0005-Dont-disable-libreadline.a-when-using-disable-static.patch} (83%)
 rename meta/recipes-devtools/gdb/gdb/{0007-use-asm-sgidefs.h.patch => 0006-use-asm-sgidefs.h.patch} (84%)
 rename meta/recipes-devtools/gdb/gdb/{0008-Use-exorted-definitions-of-SIGRTMIN.patch => 0007-Use-exorted-definitions-of-SIGRTMIN.patch} (81%)
 rename meta/recipes-devtools/gdb/gdb/{0009-Change-order-of-CFLAGS.patch => 0008-Change-order-of-CFLAGS.patch} (75%)
 rename meta/recipes-devtools/gdb/gdb/{0010-resolve-restrict-keyword-conflict.patch => 0009-resolve-restrict-keyword-conflict.patch} (80%)
 rename meta/recipes-devtools/gdb/gdb/{0011-Fix-invalid-sigprocmask-call.patch => 0010-Fix-invalid-sigprocmask-call.patch} (65%)
 rename meta/recipes-devtools/gdb/gdb/{0001-gdbserver-ctrl-c-handling.patch => 0011-gdbserver-ctrl-c-handling.patch} (45%)
 delete mode 100644 meta/recipes-devtools/gdb/gdb/CVE-2019-1010180.patch
 rename meta/recipes-devtools/gdb/{gdb_8.3.1.bb => gdb_9.1.bb} (100%)
 create mode 100644 meta/recipes-extended/ltp/ltp/0001-syscalls-Check-for-time64-unsafe-syscalls-before-usi.patch

-- 
2.25.0


