Return-Path: <paul.eggleton@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3DFBC43217
	for <webhook@archiver.kernel.org>; Mon, 20 Dec 2021 21:58:51 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web09.3149.1640037530391328691
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Dec 2021 13:58:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=e7U/YUiz;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182,
 mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id AB32120B7179; Mon, 20 Dec 2021 13:58:49 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com AB32120B7179
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1640037529;
	bh=7zbX9M0ie4US5PX6jYnr16OyxMI0LnjxqS5GYOShAuY=;
	h=From:To:Subject:Date:From;
	b=e7U/YUizkLTyJ7q8Mf5ZTlHadj08IC5jAZPrKYbERKrluSuvwTZo8GXXppwT2YiWs
	 hnZFOJ83ZjRvLSMNho83oLw/taVL8J3H4olVupBVCiZjNtVZ5siOuovxSrvZyyZ7l6
	 A+P3CvAMIQR17y8KS9/bPYupMWtm3GzWg35fv4IE=
From: Paul Eggleton <paul.eggleton@linux.microsoft.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 0/3] Enable replacing image symlinks with unversioned files
Date: Mon, 20 Dec 2021 13:58:21 -0800
Message-Id: <cover.1640036988.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Dec 2021 21:58:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159900

This patchset puts in the remaining pieces to allow disabling symlinks
and then renaming the real files to avoid having the version in their
names, for example:

IMAGE_LINK_NAME = ""
IMAGE_VERSION_SUFFIX = ""
IMAGE_NAME_SUFFIX = ""

INITRAMFS_LINK_NAME = ""

KERNEL_ARTIFACT_NAME = "${MACHINE}"
KERNEL_ARTIFACT_LINK_NAME = ""

KERNEL_FIT_BIN_EXT = ""
KERNEL_IMAGETYPE_SYMLINK = "0"


Changes since v1 (a year ago!):
* Add KERNEL_IMAGETYPE_SYMLINK to allow explicitly disabling kernel
  image type named symlinks (e.g. "bzImage")
* Add variables to allow changing/disabling kernel artifact .bin extension
* Fix unconditional IMAGE_LINK_NAME usage in qemuboot.bbclass


The following changes since commit a5459e42f1a6be9c08f303653cc1f73514eca9ef:

  oeqa/selftest/bbtests: Use YP sources mirror instead of GNU (2021-12-20 15:28:57 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/kernel-symlinks
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=paule/kernel-symlinks

Paul Eggleton (3):
  classes/kernel*: allow disabling symlink creation
  classes/kernel*: add variables to allow changing artifact extension
  classes/qemuboot: allow IMAGE_LINK_NAME to be empty

 meta/classes/kernel-artifact-names.bbclass |  5 +++++
 meta/classes/kernel-devicetree.bbclass     | 24 ++++++++++++++++--------
 meta/classes/kernel-fitimage.bbclass       | 20 ++++++++++++++------
 meta/classes/kernel.bbclass                | 20 ++++++++++++++------
 meta/classes/qemuboot.bbclass              |  7 +++++--
 5 files changed, 54 insertions(+), 22 deletions(-)

-- 
1.8.3.1


