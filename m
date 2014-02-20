Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id 6EED16F1A3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2014 10:17:46 +0000 (UTC)
Received: by mail-pa0-f50.google.com with SMTP id kp14so1732898pab.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2014 02:17:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=bRQEAQ4h1etDOWRRq85uLZ9gJd23ZgqVK2t9z2L+BFU=;
	b=iiOYBB3MxIot487NvUuj0YEnI30OG6SgowqzCF2BhILD2UlOhDhR5nzxooeszxHzw1
	dQRIAMVIcS9hK5l2S+DpEy0lnp38zuFaKvi/LJoKEPFkEOVxeOrQErLymYrEb+nBN18J
	F+xKMNRwv8Wrpe/KNj/UGwQPRQGYxmaOR4deBxNEJbbuCHaZtsj9BB+6Fe2+Uh6yNd5N
	f2dz0qv7JTDRS4LJM2V3aQ5v7fv0hnhEoT5h622kkpwZinzeAqfDgneqJzhy5aSbBSD+
	XEzTxQU/EDDZaD7siyvMpp26SaQIQtYaE0Bvzr8ydh4HWlUXsqv3LOR+6aoK5F6TbKWh
	fiGw==
X-Received: by 10.68.171.4 with SMTP id aq4mr1068994pbc.150.1392891467216;
	Thu, 20 Feb 2014 02:17:47 -0800 (PST)
Received: from localhost.localdomain
	(99-57-140-30.lightspeed.sntcca.sbcglobal.net. [99.57.140.30])
	by mx.google.com with ESMTPSA id bc4sm9610257pbb.2.2014.02.20.02.17.44
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 20 Feb 2014 02:17:46 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Feb 2014 02:18:56 -0800
Message-Id: <cover.1392891203.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.9.0
Subject: [RFT][PATCH 0/2] Systemd 209
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
X-List-Received-Date: Thu, 20 Feb 2014 10:17:47 -0000

This patchset upgrades systemd to 209 as can be seen some enahancements
to uclibc were neeed. As of now. It builds for me on both uclibc/eglibc
Please test it out in your setups and report back any issues

The following changes since commit 9a98b8bfe13b94d89a9e39cca821f26fdeaeffc3:

  image_types.bbclass: Fix tar IMAGE_CMD to not change directories (2014-02-18 08:37:03 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib kraj/systemd-209
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/systemd-209

Khem Raj (2):
  uclibc: Add new functionality needed for systemd 209
  systemd: Upgrade 208 -> 209

 ...-Use-bin-mkdir-instead-of-host-mkdir-path.patch |  31 --
 ...1-uClibc-doesn-t-implement-pwritev-preadv.patch |  15 +-
 ...ournal-Add-missing-byte-order-conversions.patch |  60 ----
 .../journal-file-protect-against-alloca-0.patch    |  23 --
 ...n-appending-to-journal-file-allocate-larg.patch |  83 -----
 .../systemd/journald-add-missing-error-check.patch |  16 -
 .../systemd/systemd/systemd-pam-fix-execvpe.patch  |  22 +-
 .../systemd/systemd-pam-fix-fallocate.patch        |  24 +-
 .../systemd/systemd-pam-fix-getty-unit.patch       |  20 +-
 .../systemd/systemd/systemd-pam-fix-mkostemp.patch | 166 +--------
 .../systemd/systemd/systemd-pam-fix-msformat.patch | 115 ++++---
 .../systemd/systemd/uclibc-sysinfo_h.patch         |  19 ++
 .../systemd/{systemd_208.bb => systemd_209.bb}     |  14 +-
 meta/recipes-core/uclibc/uclibc-git.inc            |   3 +
 .../0001-Add-eventfd_read-and-eventfd_write.patch  | 120 +++++++
 .../uclibc-git/0002-wire-setns-syscall.patch       |  68 ++++
 ...tl.h-Define-F_SETPIPE_SZ-and-F_GETPIPE_SZ.patch | 377 +++++++++++++++++++++
 17 files changed, 702 insertions(+), 474 deletions(-)
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-Use-bin-mkdir-instead-of-host-mkdir-path.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/journal-Add-missing-byte-order-conversions.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/journal-file-protect-against-alloca-0.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/journal-when-appending-to-journal-file-allocate-larg.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/journald-add-missing-error-check.patch
 create mode 100644 meta/recipes-core/systemd/systemd/uclibc-sysinfo_h.patch
 rename meta/recipes-core/systemd/{systemd_208.bb => systemd_209.bb} (96%)
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/0001-Add-eventfd_read-and-eventfd_write.patch
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/0002-wire-setns-syscall.patch
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/0003-fcntl.h-Define-F_SETPIPE_SZ-and-F_GETPIPE_SZ.patch

-- 
1.9.0


