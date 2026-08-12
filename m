Return-Path: <junjie.cao@linux.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2AF8C5AD5A
	for <webhook@archiver.kernel.org>; Wed, 12 Aug 2026 05:32:40 +0000 (UTC)
Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com [91.218.175.189])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1498.1786512752336042813
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Aug 2026 22:32:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@linux.dev header.s=key1 header.b=C2UDwne+;
 spf=pass (domain: linux.dev, ip: 91.218.175.189, mailfrom: junjie.cao@linux.dev)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1786512749;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J/avDrfhvRyVuXGHRI1Id3GP2tBu2CDoVeiyVqmKRdE=;
	b=C2UDwne+gBM9NawxO2B2bFQEfvDFpRdPDL1BCU32tsvgjkvsdvH5m36Y1R+6wrDxq8qZzT
	aL5obaZZbRm0QMS/VaR8LbqmogPw54AGT6EX/+YHg5PTof3698XaGNxWh7vKriV7vo7bLf
	Ar24038GnXJswavuG9VbtLbGsjTGOQ4=
From: Junjie Cao <junjie.cao@linux.dev>
To: openembedded-core@lists.openembedded.org
Cc: paul@pbarker.dev
Subject: [OE-core][PATCH v3 7/9] cve-exclusions: set status for CVE-2023-3397
Date: Wed, 12 Aug 2026 02:28:40 -0500
Message-ID: <20260812072842.1176341-8-junjie.cao@linux.dev>
In-Reply-To: <20260812072842.1176341-1-junjie.cao@linux.dev>
References: <20260812072842.1176341-1-junjie.cao@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2026 05:32:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243232

txEnd() in fs/jfs/jfs_txnmgr.c reads the log pointer from the superblock
info, drops TXN_LOCK and then takes log->gclock, while lmLogClose() can
free that log during umount.

No fix has been merged. The 2023 proposal was withdrawn by its author
("I think my fix method is not a good solution"), and the 2026 proposals
for the same unmount race are unreviewed:

  https://lore.kernel.org/all/20230515095956.17898-1-zyytlz.wz@163.com/
  https://lore.kernel.org/all/20260505123330.2822833-1-tristmd@gmail.com/
  https://lore.kernel.org/all/20260603171620.2532527-1-jie.wang@intel.com=
/

The txEnd() sequence is unchanged in linux-next 20260727, and the
use-after-free was reported again in June 2026 against 7.0-rc1, with the
free stack in lmLogClose() via jfs_umount(); syzbot still lists it open:

  https://lore.kernel.org/all/6a3eedfa.fd822575.2d6b21.e180@mx.google.com=
/
  https://syzkaller.appspot.com/bug?extid=3Dea7ed3bb2f444cb4dfeb

CONFIG_JFS_FS=3Dn in both ktypes/standard and ktypes/preempt-rt in
yocto-kernel-cache, and no fragment enables it.

CC: Paul Barker <paul@pbarker.dev>
AI-Generated: Uses Claude (claude-opus-5)
Signed-off-by: Junjie Cao <junjie.cao@linux.dev>
---
v3:
- correct the claim that only one fix was proposed and withdrawn:
  further fixes were posted in 2026 but none is merged
- add the syzbot dashboard and the June 2026 report as evidence the
  race is still live in mainline

v2: https://lore.kernel.org/openembedded-core/20260803084827.1348810-1-ju=
njie.cao@linux.dev/

 meta/recipes-kernel/linux/cve-exclusion.inc | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-kernel/linux/cve-exclusion.inc b/meta/recipes-k=
ernel/linux/cve-exclusion.inc
index a909aef..c4a9dea 100644
--- a/meta/recipes-kernel/linux/cve-exclusion.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion.inc
@@ -237,3 +237,10 @@ CVE_STATUS[CVE-2022-1247] =3D "fixed-version: Fixed =
from version 6.17"
 # https://www.willsroot.io/2022/12/entrybleed.html
 CVE_STATUS[CVE-2022-4543] =3D "unpatched: no upstream fix, KASLR is not =
\
 treated as a defence against local attackers"
+
+# JFS txEnd()/lmLogClose() use-after-free on unmount. No fix merged: the
+# 2023 proposal was withdrawn, the 2026 proposals are unreviewed, and th=
e
+# racy code is unchanged; syzbot still reproduces it.
+# https://syzkaller.appspot.com/bug?extid=3Dea7ed3bb2f444cb4dfeb
+CVE_STATUS[CVE-2023-3397] =3D "unpatched: no upstream fix merged, the \
+affected fs/jfs txEnd()/lmLogClose() unmount race is unchanged"
--=20
2.43.0


