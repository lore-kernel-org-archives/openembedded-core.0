Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f41.google.com (mail-pb0-f41.google.com
	[209.85.160.41])
	by mail.openembedded.org (Postfix) with ESMTP id 8AC406B59C
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Mar 2014 05:40:52 +0000 (UTC)
Received: by mail-pb0-f41.google.com with SMTP id jt11so4336525pbb.14
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Mar 2014 22:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=baTNZIVySq+xWoc7ga9I+7bwxEMP3a3hZMr+h2k/TCY=;
	b=L8WNkkBPDsER6knPqX4ek7ZqUXt8RJk/VlfqOQg7UwkbLvr+TaaLi65p8bxcHpWg5z
	I40naPciNvd8O0O/gytRZsgTiNKLxsBdBvmYFU7tV6+rXyE5fq/XkBZnpMukK++ZkesL
	1SbmmohVFPpunORkmfZENOEtYwoeZ5pPJt4yWe0t7GIWxJ41Q8ulDRAD8YOvsz2YUlpy
	nKywcD5bc+wdcF1Ww4N2l6f6lBs9fQSc7basjy7Rtgg5ZtXlxx/MWzQEL6aRVbP5orO+
	h9impfU2YBTYxzQDtZr+nl+7Xie+8ZbCthUGsgNMB7hmcTAebMzmkBlgVaszA/OlSGuz
	w7uA==
X-Received: by 10.69.2.2 with SMTP id bk2mr18175155pbd.75.1394948453775;
	Sat, 15 Mar 2014 22:40:53 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-140-30.lightspeed.sntcca.sbcglobal.net. [99.57.140.30])
	by mx.google.com with ESMTPSA id
	xk1sm51413504pac.21.2014.03.15.22.40.52 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 15 Mar 2014 22:40:52 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 15 Mar 2014 22:42:16 -0700
Message-Id: <cover.1394948105.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.9.0
Subject: [PATCH 0/7] systemd-211 upgrade and uclibc fixes
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
X-List-Received-Date: Sun, 16 Mar 2014 05:41:00 -0000

Finally, managed to get systemd 211 to boot on uclibc and eglibc
on all supported qemu machines, this should fix bug #5940

Additional functionality in uclibc is needed to support this
systemd

gnutls, glib-2.0, intltool fixes are uclibc specific and are needed
to get uclibc images going

util-linux fix is moulded to support uclibc

I have been testing this fix on the qemuarm/qemuppc/qemumips/qemux86/qemux86-64
on both uclibc/eglibc images and its been working good.

The following changes since commit 58aae40bbf8edd9c5ca70b2094eeb724391f1993:

  eglibc: Update SRC_URI to point to final download location (2014-03-13 20:44:48 -0700)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib kraj/systemd-211
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/systemd-211

Khem Raj (7):
  uclibc: Implement clock_adjtime()
  uclibc: Remove iconv.h
  gnutls: Link in pthread explicitly for uclibc
  glib-2.0: Fix localedir expectations for uclibc
  util-linux: scanf_cv_alloc_modifier changed from 'as' -> 'ms'
  intltool: Define DATADIRNAME=share for uclibc based systems
  Upgrade to systemd 211+

 meta/recipes-core/glib-2.0/glib-2.0/uclibc.patch   |  20 ++
 meta/recipes-core/glib-2.0/glib-2.0_2.38.2.bb      |   1 +
 ...1-uClibc-doesn-t-implement-pwritev-preadv.patch |  15 +-
 .../systemd-pam-configure-check-uclibc.patch       |  25 +-
 .../systemd/systemd/systemd-pam-fix-execvpe.patch  |  22 +-
 .../systemd/systemd-pam-fix-fallocate.patch        |  16 +-
 .../systemd/systemd-pam-fix-getty-unit.patch       |  20 +-
 .../systemd/systemd/systemd-pam-fix-mkostemp.patch | 166 +---------
 .../systemd/systemd/systemd-pam-fix-msformat.patch | 348 ---------------------
 .../systemd/systemd/uclibc-get-physmem.patch       |  37 +++
 .../systemd/systemd/uclibc-sysinfo_h.patch         |  19 ++
 .../systemd/{systemd_208.bb => systemd_211.bb}     |  31 +-
 meta/recipes-core/uclibc/uclibc-git.inc            |   3 +-
 .../0004-Add-clock_adjtime-syscall.patch           |  73 +++++
 meta/recipes-core/uclibc/uclibc.inc                |   3 +-
 meta/recipes-core/util-linux/util-linux_2.24.1.bb  |   3 +-
 .../intltool/intltool-0.50.2/uclibc.patch          |  19 ++
 meta/recipes-devtools/intltool/intltool_0.50.2.bb  |   1 +
 meta/recipes-support/gnutls/gnutls.inc             |   2 +
 19 files changed, 258 insertions(+), 566 deletions(-)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/uclibc.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/systemd-pam-fix-msformat.patch
 create mode 100644 meta/recipes-core/systemd/systemd/uclibc-get-physmem.patch
 create mode 100644 meta/recipes-core/systemd/systemd/uclibc-sysinfo_h.patch
 rename meta/recipes-core/systemd/{systemd_208.bb => systemd_211.bb} (93%)
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/0004-Add-clock_adjtime-syscall.patch
 create mode 100644 meta/recipes-devtools/intltool/intltool-0.50.2/uclibc.patch

-- 
1.9.0


