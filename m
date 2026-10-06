Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C11FBCA5FFC
	for <webhook@archiver.kernel.org>; Tue,  6 Oct 2026 15:46:28 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.48815.1791301585401946177
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Oct 2026 08:46:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=YfLXaSM/;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4998b5a63e2so29484635e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2026 08:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791301584; x=1791906384; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LyOELdmAvaGn0oe2Iu0GMm7uqJXeK7tTZHALUzRkrXE=;
        b=YfLXaSM/DYKMj7ZJ3LNSJ+lx4awQaSqjv7ejQCA53TvzpCpKYQsVchAS9mfIqze5pp
         EKqXE2ZqPCceAuGmGtEghaKRAtgCn5WMiUrlycGt7o8s82H2i0dJ5cqAP3Yhc6XCsGEW
         lcGNHaCYRDy+5KTWLB8Z13Dh0A2VpmTiI4bgA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791301584; x=1791906384;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LyOELdmAvaGn0oe2Iu0GMm7uqJXeK7tTZHALUzRkrXE=;
        b=mmDwUuymwiYz7Omnji4N6v+fGhEVfW+wA0N+BIwKaC5kOk+20ww7Pp5QT7VKm1Vo/Y
         9Wd8Fgv+iEsCMnPpqb55UBdCMDzynIC07a3/M06H3msW9ArzaLKRVx34n0UJTKFcAW6u
         K80mFPCOWo9DbB3vklqgRKWG3ZuCl6HaDdC89+eIx2vAYh57ng+iEKc+8LsFRXi6Ki8N
         090lTRthsaHv0nDO94VNxv1/iUJwqeERCIhOjbJu6QUflpcIlCi24SVx3G50t1tLILY/
         VMSZ4ouNi5CoXGJTz/Z1Fr+F0p/MAQpOc5qrocS5MgFJ47XDLVOTL9ZUxTtm0zXvdlOu
         EJJQ==
X-Gm-Message-State: AFuF++nK0AnMrvQOj602uEULX+TGO2qSfGA2eJY5PNX1qau9xHzz8VbJ
	qa96wfTRjNUo2KivNwTuXuBRivZ+I0UXxnefKZadTX/iIhC0ugD7zVquAD6i7vurN3jN/Y+fvUG
	jeSWN89c=
X-Gm-Gg: AYBFou3mnwhrzJmGXYIFsG2FJVt1AXJClPqQydvfQ5+LypIw2GrOhN1hpuOxnaBYihF
	SCrytskmttrnv3vVCJft27Ma8Fhx0XyioKrv6brotrGGfFDNiyiJiMSCK9PU5Ohvl7avc3GUL7E
	aoxsxyGXjNAhb+cy4pQlcOX+XM/xcjgQcS0geqWcyXuFf5AsKXtI3X1FeDyx10ArXiDXDDjeADz
	rwBPT4exQFq2sQcGOmzVXGjADgzwkhEJhO+2ME61BuCsWzUUOp/ZhjLBozq1USXVZeeUdRpiSbb
	0MT3fNSkPpSuC/A63gTCU2SR2aZ+BWXOKQeEx9/IHbkilRAD4mByQSggbaUGDGcFLUCc/ARHj39
	Z/lvNzMU9uMx3H53gdIznL7CovOL1VllPTFHPwCQXVf3CH0aEw73vGxsKW36hxVVY93wWaCUVFL
	QtG2dRprbtE03s9BMwgPilXOxWAEHC79dE6pUf3osXgtnAdkBLQQlqjUG0vnRsH33gFkLTG6T3H
	VpWS5A/lFcctPE2mqz4gWMA7Vmijq6LtpVQKkEjXSgBIyreQ44Kv0z6Iq+ZofCx+3RHjck5twER
	RgwGCI8=
X-Received: by 2002:a05:600c:4708:b0:4a1:706f:b40d with SMTP id 5b1f17b1804b1-4a17b533ff7mr29200225e9.7.1791301583324;
        Tue, 06 Oct 2026 08:46:23 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d3032csm257281f8f.45.2026.10.06.08.46.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 08:46:22 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail 00/19] Patch review
Date: Tue,  6 Oct 2026 17:45:46 +0200
Message-ID: <cover.1791299195.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2026 15:46:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247289

Please review this set of changes for blacksail and have comments back by
end of day Thursday, October 8.

Passed a-full on autobuilder:
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/4887
(The review branch slightly changed from this commit: SoBs, patch
comments, no code change.
* qemuriscv64-ptest failed on:
  * 16422 – AB-INT PTEST RISCV64: python3 ptest failure (python3-more-itertools)
  * 15896 – AB-INT PTEST RISCV64: e2fsprogs ptest failure
  ... both known AB-INT issues that a similar branch passed:
      https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/2553
  I don't think a re-spin is needed here.

The following changes since commit 419c1b0f1ed0e3ce22b1022061f763d007883121:

  build-appliance-image: Update to blacksail head revisions (2026-09-29 20:31:43 +0100)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/blacksail-review
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/blacksail-review

for you to fetch changes up to f59af8082a2f7cdb27a4ba5968b81d740bdeff35:

  recipes-support/gnutls: disable slow tests for RISCV64 (2026-10-06 17:04:27 +0200)

----------------------------------------------------------------

Ankur Tyagi (1):
  tzdata/tzcode-native: upgrade 2026d -> 2026e

Bhavikkumar Girishbhai Ronvelia (1):
  libpcre2-ptest: add testoutput3C for locale variant

Bruce Ashfield (2):
  linux-yocto/6.18: update to v6.18.54
  linux-yocto/7.2: update to v7.2.8

Jaipaul Cheernam (2):
  perlcross: Upgrade 1.6.4 -> 1.6.5
  perlcross: drop redundant LDFLAGS-when-linking-libperl patch

Jinwang Li (1):
  bluez5: fix obexd/pbap u128_to_string skipping data[4]

Joao Marcos Costa (1):
  recipes-support/gnutls: disable slow tests for RISCV64

Joerg Vehlow (1):
  tclibc-baremetal.inc: fix gcc-cross EXTRA_OECONF

Khem Raj (1):
  go: skip internal/cgrouptest when cpu.max is not available

Mathieu Dubois-Briand (3):
  libpcre2: upgrade 10.48 -> 10.49
  python3-pytz: upgrade 2026.3.post1 -> 2026.4
  python3-hypothesis: upgrade 6.168.1 -> 6.168.3

Peter Marko (1):
  alsa-lib: patch CVE-2026-90781

Pratik Farkase (1):
  util-linux: update flock test patch Upstream-Status to Backport

Richard Purdie (1):
  python3-hypothesis: upgrade 6.168.0 -> 6.168.1

Ross Burton (1):
  elfutils: fix handling of DWARF5 compilation units

Sunil Dora (1):
  opkg: take the default architecture from the target CPU

Yoann Congal (1):
  opkg: update Upstream-Status for a merged patch

 meta/conf/distro/include/tclibc-baremetal.inc |   1 -
 meta/recipes-connectivity/bluez5/bluez5.inc   |   1 +
 ...p-Fix-u128_to_string-skipping-data-4.patch |  33 ++++
 ...ncrease-wait-for-flock-child-timeout.patch |   2 +-
 .../elfutils/elfutils_0.196.bb                |   1 +
 .../elfutils/files/srcfiles.patch             |  65 +++++++
 meta/recipes-devtools/go/go-1.27.1.inc        |   1 +
 ...est-skip-when-cpu.max-is-not-availab.patch |  39 ++++
 ...the-default-architecture-from-the-ta.patch |  45 +++++
 meta/recipes-devtools/opkg/opkg_0.10.0.bb     |   1 +
 ...ile-check-the-file-if-patched-or-not.patch |   2 +-
 .../files/0001-patches-for-perl-5.44.0.patch  | 110 -----------
 ...oss-add-LDFLAGS-when-linking-libperl.patch |  24 ---
 ...Add-configure-checks-for-perl-5.44.0.patch |  47 -----
 ...Fix-checkfield-for-C23-compatibility.patch |  35 ----
 .../perl-cross/files/determinism.patch        |   4 +-
 ...{perlcross_1.6.4.bb => perlcross_1.6.5.bb} |   6 +-
 ...168.0.bb => python3-hypothesis_6.168.3.bb} |   2 +-
 ...2026.3.post1.bb => python3-pytz_2026.4.bb} |   2 +-
 meta/recipes-extended/timezone/timezone.inc   |   6 +-
 .../linux/linux-yocto-rt_6.18.bb              |   6 +-
 .../linux/linux-yocto-rt_7.2.bb               |   6 +-
 .../linux/linux-yocto-tiny_6.18.bb            |   6 +-
 .../linux/linux-yocto-tiny_7.2.bb             |   6 +-
 meta/recipes-kernel/linux/linux-yocto_6.18.bb |  24 +--
 meta/recipes-kernel/linux/linux-yocto_7.2.bb  |  24 +--
 .../alsa/alsa-lib/CVE-2026-90781.patch        |  41 +++++
 .../alsa/alsa-lib_1.2.16.1.bb                 |   4 +-
 meta/recipes-support/gnutls/gnutls/run-ptest  |   1 +
 meta/recipes-support/gnutls/gnutls_3.8.13.bb  |  18 ++
 .../libpcre/libpcre2/testoutput3C             | 174 ++++++++++++++++++
 .../{libpcre2_10.48.bb => libpcre2_10.49.bb}  |   4 +-
 32 files changed, 472 insertions(+), 269 deletions(-)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-obexd-pbap-Fix-u128_to_string-skipping-data-4.patch
 create mode 100644 meta/recipes-devtools/elfutils/files/srcfiles.patch
 create mode 100644 meta/recipes-devtools/go/go/0011-internal-cgrouptest-skip-when-cpu.max-is-not-availab.patch
 create mode 100644 meta/recipes-devtools/opkg/opkg/0003-CMakeLists-take-the-default-architecture-from-the-ta.patch
 delete mode 100644 meta/recipes-devtools/perl-cross/files/0001-patches-for-perl-5.44.0.patch
 delete mode 100644 meta/recipes-devtools/perl-cross/files/0001-perl-cross-add-LDFLAGS-when-linking-libperl.patch
 delete mode 100644 meta/recipes-devtools/perl-cross/files/0002-Add-configure-checks-for-perl-5.44.0.patch
 delete mode 100644 meta/recipes-devtools/perl-cross/files/0003-Fix-checkfield-for-C23-compatibility.patch
 rename meta/recipes-devtools/perl-cross/{perlcross_1.6.4.bb => perlcross_1.6.5.bb} (75%)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.168.0.bb => python3-hypothesis_6.168.3.bb} (91%)
 rename meta/recipes-devtools/python/{python3-pytz_2026.3.post1.bb => python3-pytz_2026.4.bb} (86%)
 create mode 100644 meta/recipes-multimedia/alsa/alsa-lib/CVE-2026-90781.patch
 create mode 100644 meta/recipes-support/libpcre/libpcre2/testoutput3C
 rename meta/recipes-support/libpcre/{libpcre2_10.48.bb => libpcre2_10.49.bb} (93%)


