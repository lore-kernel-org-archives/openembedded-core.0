Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f43.google.com (mail-qg0-f43.google.com
	[209.85.192.43])
	by mail.openembedded.org (Postfix) with ESMTP id C43F2755F4
	for <openembedded-core@lists.openembedded.org>;
	Sun,  6 Sep 2015 15:25:36 +0000 (UTC)
Received: by qgez77 with SMTP id z77so48557211qge.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 06 Sep 2015 08:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=/mGNl3wvbkLlNqYl7KGEpGrR/V6taEwkyu1qhF82w+c=;
	b=yV2R6QpvOFKXDUyLgCH48VpCMVwGukVncHKR4DVjaaBrrmEL/7psnzh1jk3sr8ah/6
	z/9BOyVwzNdGvr+ClJHd/2tn9Acsbq5gkrSRDZYRh+wsUa0FhPmdVMcvQzqGMg9v0uU/
	F+S7u2sSB589uUxrMYbJC12NqiKi1LD50l+LLm+zyfnIU1c4LXkZToCNR37NzcgZl5tX
	UmUppi66TtbFTtG76SI9G4AqNZQLvKb7jH6R2ioZzGKRGzjzqThDIzfnwlsQE8lxiIbn
	moGOCIBQRf/uVMHkcnUpTyVy58SfqJvpFaOXcBiP6g+nOZeOj+G+a3U4giCclRYji79a
	S3kg==
X-Received: by 10.140.237.209 with SMTP id i200mr2697434qhc.92.1441553136342; 
	Sun, 06 Sep 2015 08:25:36 -0700 (PDT)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	e131sm5106055qhc.10.2015.09.06.08.25.35
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 06 Sep 2015 08:25:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  6 Sep 2015 15:25:30 +0000
Message-Id: <cover.1441552859.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.5.1
Subject: [PATCH 0/4] Systemd Upgrade
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
X-List-Received-Date: Sun, 06 Sep 2015 15:25:44 -0000

Changes Since last time
- Now that 225 is out upgrade recipe to 225, changes between 224 and 225 are minor
  but fixes in networkd are important
- Implement systemd-sysv-install for OE
- Enable getopt in busybox needed for systemd-sysv-install
- Remove update-rc.d from default uninstall list in rootfs creation
- Tested date and systemd unit tests manually to pass
- Booted core-image-cmdline-full on all qemu targets

Khem Raj (4):
  busybox: Enable getopt applet
  rootfs: Do not uninstall update-rc.d
  systemd: Upgrade 219 -> 225
  systemd: Implement OE-Specific systemd-sysv-install

 meta/lib/oe/rootfs.py                              |   3 +-
 meta/recipes-core/busybox/busybox/getopts.cfg      |   3 +
 meta/recipes-core/busybox/busybox_1.23.2.bb        |   1 +
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
 16 files changed, 222 insertions(+), 476 deletions(-)
 create mode 100644 meta/recipes-core/busybox/busybox/getopts.cfg
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-Revert-core-mount-add-dependencies-to-dynamically-mo.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0002-shared-missing.h-fall-back-to-insecure-getenv.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0012-implment-systemd-sysv-install-for-OE.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0012-systemd-tmpfiles.c-Honor-ordering-within-files-as-th.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/tmpfiles-pam.patch
 rename meta/recipes-core/systemd/{systemd_219.bb => systemd_225.bb} (94%)

-- 
2.5.1


