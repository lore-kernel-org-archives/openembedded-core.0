Return-Path: <junjie.cao@linux.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3755EC55175
	for <webhook@archiver.kernel.org>; Mon,  3 Aug 2026 08:49:58 +0000 (UTC)
Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com [91.218.175.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39077.1785746997393580999
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Aug 2026 01:49:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@linux.dev header.s=key1 header.b=QeSiBtaK;
 spf=pass (domain: linux.dev, ip: 91.218.175.177, mailfrom: junjie.cao@linux.dev)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785746995;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PTx+5SaOOeACOLVOogdEN5GezcLEA8jP6JOscJQarbY=;
	b=QeSiBtaKMqb0sqpPFaNkDTcV3lCbyc0IwchyTn9RTPjy8twl/vj+KAK1Pycolpe/lNUl8I
	9+hqsehulfiG4J7AIJk0pAUJaZ8bapgpxwWb29Koi72YkPh5x/BKxwtWjrzwh1rgtwG3mV
	IO34gKvfUl6o2neMHpTTD4hGldPSQ+0=
From: Junjie Cao <junjie.cao@linux.dev>
To: openembedded-core@lists.openembedded.org
Cc: paul@pbarker.dev,
	randy.macleod@windriver.com,
	Venkata.Navuduri@windriver.com
Subject: [OE-core][PATCH v2 05/10] cve-exclusion: set status for CVE-2022-1247
Date: Mon,  3 Aug 2026 01:48:22 -0700
Message-ID: <20260803084827.1348810-6-junjie.cao@linux.dev>
In-Reply-To: <20260803084827.1348810-1-junjie.cao@linux.dev>
References: <20260803084827.1348810-1-junjie.cao@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Aug 2026 08:49:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242631

The CVE describes a race between rose_connect() and the code that frees
a rose_neigh once its count and use fields reach zero.

Takamitsu Iwai's August 2025 series converts that field to a proper
reference count and removes the unlocked increment in rose_connect()
which is exactly the operation the CVE describes:

  https://git.kernel.org/linus/d860d1faa6b2ce3becfdb8b0c2b048ad31800061
  ("net: rose: convert 'use' field to refcount_t", v6.17)

  https://git.kernel.org/linus/da9c9c877597170b929a6121a68dcd3dd9a80f45
  ("net: rose: include node references in rose_neigh refcount", v6.17)

The first commit message states the premise of the CVE almost verbatim:
"The 'use' field in struct rose_neigh is used as a reference counter but
lacks atomicity. This can lead to race conditions where a rose_neigh
structure is freed while still being referenced by other code paths",
and its diff deletes the "rose->neighbour->use++;" statement from
rose_connect(). The second merges the separate count and use counters,
which is the other half of the condition described by the CVE, and
closes a syzbot-reported slab-use-after-free.

Both are in v6.17 and were backported to 6.1.y, 6.6.y, 6.12.y and
6.16.y in the 2025-09-02 stable round.

Kernels from v7.1 onwards are unaffected by construction, since the AX.25
and hamradio subsystems were removed:

  https://git.kernel.org/linus/dd8d4bc28ad7252610d8e79c1313a2d1e3499a51

The commits predate the association of this CVE with
any fix, so no tracker links them yet - Ubuntu, Debian and Red Hat all
still show the CVE as open. The identification above is based on the
commit contents matching the CVE description; the two 2022 rose patches
from Duoming Zhou that Ubuntu's tracker references fix different rose
bugs and are not the fix for this issue.

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

 meta/recipes-kernel/linux/cve-exclusion.inc | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-kernel/linux/cve-exclusion.inc b/meta/recipes-k=
ernel/linux/cve-exclusion.inc
index 0ae3a0d6..7547cdfd 100644
--- a/meta/recipes-kernel/linux/cve-exclusion.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion.inc
@@ -219,3 +219,9 @@ several attempts, exploitation requires a relative ke=
rnel.core_pattern"
 # https://bugzilla.redhat.com/show_bug.cgi?id=3D2044575
 CVE_STATUS[CVE-2022-0400] =3D "disputed: the reported net/smc out-of-bou=
nds read \
 was never substantiated and was closed as not-a-bug by Red Hat, SUSE and=
 Debian"
+
+# Fix https://git.kernel.org/linus/d860d1faa6b2ce3becfdb8b0c2b048ad31800=
061
+# Fix https://git.kernel.org/linus/da9c9c877597170b929a6121a68dcd3dd9a80=
f45
+# Also in 6.1.150, 6.6.104, 6.12.y and 6.16.5 via the 2025-09-02 stable =
round.
+# The rose/hamradio subsystem was removed entirely in v7.1 (dd8d4bc28ad7=
).
+CVE_STATUS[CVE-2022-1247] =3D "fixed-version: Fixed from version 6.17"
--=20
2.43.0


