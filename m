Return-Path: <junjie.cao@linux.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F747C55175
	for <webhook@archiver.kernel.org>; Mon,  3 Aug 2026 08:50:28 +0000 (UTC)
Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39084.1785747017996417977
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Aug 2026 01:50:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@linux.dev header.s=key1 header.b=cWglyNyq;
 spf=pass (domain: linux.dev, ip: 91.218.175.181, mailfrom: junjie.cao@linux.dev)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785747015;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pywFFLxEQ0YD1Jvb1j+qUEjyeWpPyTbtW1n2ftGvkrQ=;
	b=cWglyNyq1gniDYtru+mF1ySqDobdomDu9msgJO2Kpq+RYZxK6JayJ5QOmShfJjaacSrnJq
	eokYi582YyGkgU56Pdl9VCt8nOQ7GztQgyWW1CFG0Nh7pr/S36nI3YSl+oHPuD/QGjqp7V
	uFuxoYO86k7YxysXkif8sbRYeGN90U4=
From: Junjie Cao <junjie.cao@linux.dev>
To: openembedded-core@lists.openembedded.org
Cc: paul@pbarker.dev,
	randy.macleod@windriver.com,
	Venkata.Navuduri@windriver.com
Subject: [OE-core][PATCH v2 07/10] cve-exclusion: set status for CVE-2023-3397
Date: Mon,  3 Aug 2026 01:48:24 -0700
Message-ID: <20260803084827.1348810-8-junjie.cao@linux.dev>
In-Reply-To: <20260803084827.1348810-1-junjie.cao@linux.dev>
References: <20260803084827.1348810-1-junjie.cao@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Aug 2026 08:50:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242633

txEnd() in fs/jfs/jfs_txnmgr.c reads the log pointer from the superblock
info, drops TXN_LOCK and then takes log->gclock, while lmLogClose() can
free that log during umount.

The subsystem in the public CVE data is misleading: the "slub"
association comes from the KASAN slab report, but the affected code is
JFS. Red Hat's own title for the issue is "slab-use-after-free write in
txend due to race condition".

A fix adding a new mutex was posted, reviewed, and then withdrawn by its
author, who wrote "I think my fix method is not a good solution":

  https://lore.kernel.org/all/20230515095956.17898-1-zyytlz.wz@163.com/

No other fix has been posted, and the sequence in txEnd() is unchanged
in mainline as of linux-next 20260727. syzkaller was still reporting
"KASAN: slab-use-after-free Write in txEnd" in June 2026.

Ubuntu records "unfixed upstream as of 2023-09-01"; Debian lists
src:linux as vulnerable in every suite:

  https://ubuntu.com/security/CVE-2023-3397
  https://security-tracker.debian.org/tracker/CVE-2023-3397

CONFIG_JFS_FS=3Dn in both ktypes/standard/standard.cfg and
ktypes/preempt-rt/preempt-rt.cfg in yocto-kernel-cache, and no fragment
there enables it; the only other occurrence is CONFIG_JFS_SECURITY in
the selinux feature, which has no effect without JFS_FS.

CC: Paul Barker <paul@pbarker.dev>
AI-Generated: Uses Claude (claude-opus-5)
Signed-off-by: Junjie Cao <junjie.cao@linux.dev>
---
changes in v2:
- split out of the single combined patch, one CVE per patch as requested
- added primary source links (disclosures, distribution trackers, mailing
  list threads, upstream commits) to every commit message
- added the three CVEs with no upstream fix as "unpatched" entries instea=
d
  of leaving them undocumented
- disclosed AI assistance per the contributor guide

v1: https://lore.kernel.org/openembedded-core/20260802143444.1178575-1-ju=
njie.cao@linux.dev/

 meta/recipes-kernel/linux/cve-exclusion.inc | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-kernel/linux/cve-exclusion.inc b/meta/recipes-k=
ernel/linux/cve-exclusion.inc
index 3517318e..827a487e 100644
--- a/meta/recipes-kernel/linux/cve-exclusion.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion.inc
@@ -232,3 +232,10 @@ CVE_STATUS[CVE-2022-1247] =3D "fixed-version: Fixed =
from version 6.17"
 # https://www.willsroot.io/2022/12/entrybleed.html
 CVE_STATUS[CVE-2022-4543] =3D "upstream-wontfix: no fix planned, KASLR i=
s not \
 considered a defence against local attackers"
+
+# JFS txEnd()/lmLogClose() use-after-free, not slub as the CVE data says=
.
+# The only proposed fix was withdrawn by its author; the racy code is
+# unchanged and syzbot still reproduces it as of June 2026.
+# https://lore.kernel.org/all/20230515095956.17898-1-zyytlz.wz@163.com/
+CVE_STATUS[CVE-2023-3397] =3D "unpatched: no upstream fix, the only prop=
osed \
+patch was withdrawn by its author and the affected fs/jfs code is unchan=
ged"
--=20
2.43.0


