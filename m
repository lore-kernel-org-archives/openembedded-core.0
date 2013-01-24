Received: from mail-da0-f50.google.com ([209.85.210.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TyUGF-0000qU-Bf
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Jan 2013 22:23:13 +0100
Received: by mail-da0-f50.google.com with SMTP id h15so4429507dan.37
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2013 13:07:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=xRuHa2U2UiEh5Z29IiKAbw1tmUcjnH3KQS3HK7lBOMk=;
	b=RoHlpoLOXxRIlCQnLliTZiFqyg3v/J3iFewdl/yp1HcIP1L6ZlcZ+0JpmLyFxZOgsP
	9uBnbV8HLlzkpJFvi7qL/s8QbgxHiIQ8BtCmr6jruJ1x4Gcpw/tViFOK8P8pp7SWbd85
	JwKQKn1nywsFuhntAoaZzb7YEE6e+DYBn4ZgcDXdObVDBv24JPAjqB6GSO1sQ1+G0zN4
	FWDHej9KV+aRQtrVBlZQzyOz1ZpdfN5CY1U4MuWj5FP7BN5iV/b6kj+eqw075dhMZT5v
	Dd1OWfdqPRUYlCFl0sjjBP/sfnPLChAA0crn9nCwjpTmB0/T9Mm58vkdflgC/ApbXBIq
	WqFQ==
X-Received: by 10.68.253.161 with SMTP id ab1mr8498950pbd.97.1359061649289;
	Thu, 24 Jan 2013 13:07:29 -0800 (PST)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id na7sm15478952pbc.48.2013.01.24.13.07.27
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 24 Jan 2013 13:07:28 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Jan 2013 13:07:11 -0800
Message-Id: <cover.1359061155.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 00/11] recipes refreshed for uclibc and systemd update to 197
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 24 Jan 2013 21:23:16 -0000

This patchset addresses few things

1. Upgrades systemd to 197 (tested on uclibc and eglibc with all qemu machines)

2. Fixes recipes to compile with uclibc and build core-image-sato for all supported
   qemu machines and booted them

3. Fix intermittent build failures seen on high parallism and rebuild from sstate
   while editing package recipe and causing rebuilds of certain recipes only.

4. Pin uclibc git as default provider of uclibc in OE-Core since its the one
   which has tested support for systemd

5. Enable reenterant nss functionality in uclibc needed for quota and rpcbind


The following changes since commit ffab86f13cafb10d8d6273b6af8cd9a3c84eae20:

  prserv: add LOCALCOUNT to AUTOINCs migration feature (2013-01-22 16:01:17 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib kraj/uclibc-systemd-updates
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/uclibc-systemd-updates

Khem Raj (11):
  libpcap: Add missing libusb dependency
  gettext: Fix build with uclibc remove upstreamed patches
  libtirpc: Disable DES functions on uclibc
  rpcbind: Dont use nss with uclibc
  quota: inherit gettext
  icu: Fix build on uclibc
  uclibc-git/uClibc.distro: Enable UCLIBC_HAS_REENTRANT_RPC
  tcmode-default.inc: Switch to git version of uclibc by default
  systemd: Fix build on ppc
  systemd: Upgrade to 197
  gawk: Add missing dependency on readline

 meta/conf/distro/include/tcmode-default.inc        |    2 +-
 meta/recipes-connectivity/libpcap/libpcap.inc      |    2 +-
 .../gnulib-uclibc-sched_param-def.patch            |   21 -
 .../gettext/gettext-0.18.2/wchar-uclibc.patch      |   74 --
 meta/recipes-core/gettext/gettext_0.18.2.bb        |    3 -
 ...emd-analyze-use-argparse-instead-of-getop.patch |  106 --
 .../0001-systemd-analyze-rewrite-in-C.patch        | 1087 ++++++++++++++++++++
 ...it-file-Add-libsystemd-daemon.la-to-LDADD.patch |   32 +
 ...-analyze-use-GDBus-instead-of-dbus-python.patch |   94 --
 .../systemd/{systemd_196.bb => systemd_197.bb}     |   13 +-
 meta/recipes-core/uclibc/uclibc-git/uClibc.distro  |    2 +-
 meta/recipes-extended/gawk/gawk_4.0.1.bb           |    2 +
 .../libtirpc-0.2.2/remove-des-uclibc.patch         |   47 +
 meta/recipes-extended/libtirpc/libtirpc_0.2.2.bb   |    2 +
 meta/recipes-extended/quota/quota_4.01.bb          |    2 +-
 .../rpcbind/rpcbind/0001-uclibc-nss.patch          |   30 +
 .../rpcbind/0002-uclibc-rpcsvc-defines.patch       |   60 ++
 meta/recipes-extended/rpcbind/rpcbind_0.2.0.bb     |    8 +
 meta/recipes-support/icu/icu.inc                   |    1 +
 19 files changed, 1281 insertions(+), 307 deletions(-)
 delete mode 100644 meta/recipes-core/gettext/gettext-0.18.2/gnulib-uclibc-sched_param-def.patch
 delete mode 100644 meta/recipes-core/gettext/gettext-0.18.2/wchar-uclibc.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-Revert-systemd-analyze-use-argparse-instead-of-getop.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0001-systemd-analyze-rewrite-in-C.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0001-test-unit-file-Add-libsystemd-daemon.la-to-LDADD.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0002-Revert-analyze-use-GDBus-instead-of-dbus-python.patch
 rename meta/recipes-core/systemd/{systemd_196.bb => systemd_197.bb} (95%)
 create mode 100644 meta/recipes-extended/libtirpc/libtirpc-0.2.2/remove-des-uclibc.patch
 create mode 100644 meta/recipes-extended/rpcbind/rpcbind/0001-uclibc-nss.patch
 create mode 100644 meta/recipes-extended/rpcbind/rpcbind/0002-uclibc-rpcsvc-defines.patch

-- 
1.7.9.5



