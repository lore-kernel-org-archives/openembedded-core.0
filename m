Return-Path: <serhe.popovych@gmail.com>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id 9E68171BF9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2018 17:55:43 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id u6-v6so5658448ljd.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2018 09:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=1BQzWYhtDZQJjXiMIIyf+Xf6/FJuGpe+pbJCAYiHMPk=;
	b=tZzXfiQFBLj+RnqB+mLs+lgpCsp87oGYTsaBuwUR6xV43FC2cTfYQ5Ht/e6f7jSWVs
	G6sK0Ees6+az4cMUZ3zNiGCgsbRlK89NzYaN2evcll0dMJAk6KqtYVVwPS423UBbr+il
	BuLAelrmdw/Ef7qSLiJpmrgpeN9EuTyTa5zFoRsOL4Um/399+dlAjbSTmqCvNxyUO/aD
	XvNw48dELkHuz2me9PsNfG2Ln2Pe4aoOYxri4i/+Rku/ITPof8Q/QJQbvkls3V43ICNn
	rL8fscSRfnzuP0X+fXmOabAOzMvFGwW+UpUf0J03KxnnsVPijZrxbD+6sRZ1pN+zAJ0H
	lR7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=1BQzWYhtDZQJjXiMIIyf+Xf6/FJuGpe+pbJCAYiHMPk=;
	b=XfXoPCchlooyVQp5DG5mecVWNgYADzJKs8YFyaYM4v+Q96aGHiZFsvpNuJUgVUdAMg
	z7tVlv99F9kN/UNqZhmDljrp82ne8eJfm/aoAP2sBo8EZBDN7FwC3s7E8df0v9Zl7ioY
	i16B2eKHFw/FBkJPA/nxX4HXtmNtZpIqTT7fFS0ceOtCWymEGk0RbPJriUF1EQyuKmMO
	wrTdz8ZRu1wjycdN76R5BlzjtKDr/YPq7rMZ/IQp2QFOvdwR3PMlzHNy1+mkIMI7nu5y
	E/mJGGpKWus3wyZ468F8TEuqV/xn6R3G+k0heegvg+3idGOHhb6gTcI13iJ7dYg6PlBu
	LiCg==
X-Gm-Message-State: AA+aEWaY7HH/iEdvuzoz8X+LPnp6h8JJyPWApOWoc0nNM7+Bxfc8Eze/
	VyfjFCyx8mRtvBTSAcbl1j2zbCCa
X-Google-Smtp-Source: AFSGD/WWIqLY4VX6gaZERlPebgi25bZODyhYKlOQxoz4dh5whG/bFz30Ba9YseNP5S6bOGLUM8scUA==
X-Received: by 2002:a2e:630a:: with SMTP id
	x10-v6mr2327440ljb.11.1544810143533; 
	Fri, 14 Dec 2018 09:55:43 -0800 (PST)
Received: from v-ubt16-x64-sonic.as41781.net ([193.34.155.16])
	by smtp.gmail.com with ESMTPSA id
	r27-v6sm991033lja.65.2018.12.14.09.55.42
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 14 Dec 2018 09:55:42 -0800 (PST)
From: Serhey Popovych <serhe.popovych@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Dec 2018 19:54:29 +0200
Message-Id: <1544810082-22164-1-git-send-email-serhe.popovych@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 00/13] powerpc/powerpc64: Support build with musl as libc
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
X-List-Received-Date: Fri, 14 Dec 2018 17:55:43 -0000

Musl has support for ppc (32bit) and ppc64 (64bit). OE still missing
several tricks in configuration to make builds possible:

  1) Most important part is that musl implements elfv2 ABI only for
     64bit PowerPC. That ABI is default for little-endian but supports
     big-endian too. Historically elfv1 ABI is used for big-endian
     PowerPC.

  2) Using uncommon elfv2 ABI for big-endian requires to disable all
     assembler optimizations in openssl: unfortunately I can't find more
     smart way at the moment.

  3) LDSO path need to be adjusted to support /lib64 path which is
     default for powerpc64 (see bitbake.conf) instead of $baselibdir.

  4) Default library search path is hardcoded to
     "/lib:/usr/local/lib:/usr/lib": pass -DSYSLIBDIR and -DLIBDIR and
     use them to set path.

  5) Need to add more tweaks to patch that adds --with-ldbl-128 knob
     to gcc configure: there is a set of functions that use TFtype in
     ppc64-fp.c in libgcc. This should be compatible with glibc.

  6) Disable qemu-userspace for powerpc64 bit: there is no support.
     While there change qemuwrapper to exit explicitly to fix infinite
     execution in do_rootfs() task when building on IBM POWER8 machine.

  7) Misc fixes that map powerpc-linux-musl python3 triplet to
     powerpc-linux-gnu, remove conflicting sed in do_configure() vs
     patch settings in gcc and fix DEFAULTTUNE settings for various
     IBM POWER platforms.

Build is done on IBM POWER8 machine running RHEL7:

Images:
-------
    core-image-sato
    core-image-full-cmdline

For powerpc64:
--------------
              glibc                musl
         systemd sysvinit    systemd sysvinit
  gcc-7.3   y       y           y       y
  gcc-8.2   y       y           y       y

For powerpc:
------------
              glibc                musl
         systemd sysvinit    systemd sysvinit
  gcc-7.3   n       x           x       x      (*)
  gcc-8.2   y       y           y       y

Note that gcc-7.3 builds for 32bit powerpc fail due to:
  https://bugzilla.yoctoproject.org/show_bug.cgi?id=11754

Kernel/images are boot tested using KVM-HV on IBM POWER8.

Serhey Popovych (13):
  lib/oe/elf.py: Add powerpc64 architecture definition for musl
  tune-power[5-7].inc: Fix DEFAULTTUNE values
  tune-power[5-7].inc: Disable QEMU usermode usage
  qemuwrapper: Explicitly exit in case of no qemu supported for target
  arch-powerpc64.inc: Use elfv2 ABI when building with musl
  musl: Create default library search path based on configuration
  musl: Ensure GLIBC_LDSO symlink target does not exist on reinstall
  openssl: Skip assembler optimized code for powerpc64 with musl
  python3: Fix do_configure check platform triplet error (2)
  gcc: Fix preprocessor redefines for header pathes
  gcc: More places to patch to disable ldbl 128 for musl on PPC
  gcc: Enable secureplt for powerpc64 target too
  gcc-7.3,gcc-8.2: Use variable SYSTEMLIBS_DIR instead of hardcoding it
    for ppc64

 .../machine/include/powerpc/arch-powerpc64.inc     |   3 +
 meta/conf/machine/include/tune-power5.inc          |   5 +-
 meta/conf/machine/include/tune-power6.inc          |   5 +-
 meta/conf/machine/include/tune-power7.inc          |   5 +-
 meta/lib/oe/elf.py                                 |   1 +
 .../openssl/openssl10_1.0.2q.bb                    |   1 +
 .../recipes-connectivity/openssl/openssl_1.1.1a.bb |   1 +
 ...slibdir-and-libdir-as-default-pathes-to-l.patch |  61 ++++
 meta/recipes-core/musl/musl_git.bb                 |   3 +-
 meta/recipes-devtools/gcc/gcc-7.3.inc              |   1 +
 ...Ensure-target-gcc-headers-can-be-included.patch |  36 --
 ...44-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch | 391 ++++++++++++++++++++-
 ...werpc-powerpc64-Add-support-for-musl-ldso.patch |  31 ++
 meta/recipes-devtools/gcc/gcc-8.2.inc              |   1 +
 ...Ensure-target-gcc-headers-can-be-included.patch |  36 --
 ...34-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch | 342 +++++++++++++++++-
 ...werpc-powerpc64-Add-support-for-musl-ldso.patch |  31 ++
 meta/recipes-devtools/gcc/gcc-common.inc           |   2 +-
 .../tweak-MULTIARCH-for-powerpc-linux-musl.patch   |  40 +++
 meta/recipes-devtools/python/python3_3.5.6.bb      |   1 +
 .../recipes-devtools/qemu/qemuwrapper-cross_1.0.bb |   3 +-
 21 files changed, 920 insertions(+), 80 deletions(-)
 create mode 100644 meta/recipes-core/musl/musl/0002-ldso-Use-syslibdir-and-libdir-as-default-pathes-to-l.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-7.3/0050-powerpc-powerpc64-Add-support-for-musl-ldso.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.2/0042-powerpc-powerpc64-Add-support-for-musl-ldso.patch
 create mode 100644 meta/recipes-devtools/python/python3/tweak-MULTIARCH-for-powerpc-linux-musl.patch

-- 
2.7.4


