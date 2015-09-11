Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id 8F633736B6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Sep 2015 23:53:49 +0000 (UTC)
Received: by padhy16 with SMTP id hy16so56613135pad.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Sep 2015 16:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=V+D7h4aZk4jqq754SiejGyfMbh2rLRAuu63ZNNrLA6c=;
	b=yWK4/B6ZL9KNM1h1rHplBB33AtN5y7VVwWRPh/cDHtWKv4Kf1nlXIAYO2FBpolzcZ7
	RTvJ1xJ6XQGVQIyu8fikrns8nRyL3WUd9rXbjqd1rIhzno63TH8Habmk5zYfbJ0nu5wa
	Gir/INZ1FXjlMXbHaHBU4cVcwbfBT+CgUZMWUUTxeCyhMxDJ92y7pVkgw2EU/qsAr+YJ
	pGUbjmCad8L8cf4PUbIcQdz274SeOWKMGlSXuSXCjUokDo/Y4xEuKIZFl3ETnI19QDRR
	iEzm5FOOzO3MvXEvuL87EJNhi8b28YTlC6ZduLB6d3DqbGrWtNuP5vb2ILFIYF1d71yu
	AuWw==
X-Received: by 10.68.143.70 with SMTP id sc6mr87867929pbb.87.1441929230344;
	Thu, 10 Sep 2015 16:53:50 -0700 (PDT)
Received: from haswell.localdomain ([2601:646:8601:4580:baca:3aff:fe80:aa8f])
	by smtp.gmail.com with ESMTPSA id
	xi1sm14189320pac.48.2015.09.10.16.53.49
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 10 Sep 2015 16:53:49 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Sep 2015 17:02:57 -0700
Message-Id: <cover.1441929533.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.5.1
Subject: [PATCH V2 0/3] Systemd Upgrade
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
X-List-Received-Date: Thu, 10 Sep 2015 23:53:50 -0000

Changes Since V1:
Install update-rc.d conditionally when both systemd and sysvinit are in distro features
and we are not building r/o image

The following changes since commit 56c5fa106eeccda2ca92dbeb73ff01ba40992e7d:

  ptest: use fakeroot for do_install_ptest_base (2015-09-09 14:25:09 +0100)

are available in the git repository at:

  git://github.com/kraj/openembedded-core kraj/systemd-225
  https://github.com/kraj/openembedded-core/tree/kraj/systemd-225

Khem Raj (3):
  rootfs: Conditionally uninstall update-rc.d
  systemd: Upgrade 219 -> 225
  systemd: Implement OE-Specific systemd-sysv-install

 meta/lib/oe/rootfs.py                              |  10 +-
 ...-mount-add-dependencies-to-dynamically-mo.patch |  36 ----
 ...ed-missing.h-fall-back-to-insecure-getenv.patch |  25 ---
 ...t-install-dependency-links-at-install-tim.patch |  35 ++--
 ...heck-for-additional-features-that-uclibc-.patch |  23 ++-
 ...wn-Use-execvpe-only-when-libc-supports-it.patch |  37 ++---
 ...til-Use-mkostemp-only-if-libc-supports-it.patch |   8 +-
 ...-unimplemented-_SC_PHYS_PAGES-system-conf.patch |   8 +-
 ...0-Make-root-s-home-directory-configurable.patch | 136 ++++++++-------
 ...0012-implment-systemd-sysv-install-for-OE.patch |  40 +++++
 ...files.c-Honor-ordering-within-files-as-th.patch | 185 ---------------------
 ...-remove-userspace-firmware-loading-suppor.patch |  99 ++++++-----
 .../systemd/systemd/tmpfiles-pam.patch             |  30 ----
 .../systemd/{systemd_219.bb => systemd_225.bb}     |  29 ++--
 14 files changed, 226 insertions(+), 475 deletions(-)
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-Revert-core-mount-add-dependencies-to-dynamically-mo.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0002-shared-missing.h-fall-back-to-insecure-getenv.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0012-implment-systemd-sysv-install-for-OE.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0012-systemd-tmpfiles.c-Honor-ordering-within-files-as-th.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/tmpfiles-pam.patch
 rename meta/recipes-core/systemd/{systemd_219.bb => systemd_225.bb} (95%)

-- 
2.5.1


