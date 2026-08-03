Return-Path: <junjie.cao@linux.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3641CC55175
	for <webhook@archiver.kernel.org>; Mon,  3 Aug 2026 08:50:08 +0000 (UTC)
Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.39025.1785747005700604975
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Aug 2026 01:50:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@linux.dev header.s=key1 header.b=bklBbRWz;
 spf=pass (domain: linux.dev, ip: 91.218.175.181, mailfrom: junjie.cao@linux.dev)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785747003;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B3d2RLakSAdFqAQu5/5q3WoyjBuHBaRHRa6U84R9bDY=;
	b=bklBbRWzgJbbuTC8CWOBjq5Fk7NVJnEB9XltonrFqIjZbFt5OWvLB+j/23zMPTJE4JwBQ2
	OfxZVQ7CZNGqRg+DDVWHaoBlK/zPot2has6ApAeuCFGrcyK0WTRMkLrHWO8vzcfEWIpI1K
	UyoyO0woptM63MlWQAaBAADVk5ZOnfs=
From: Junjie Cao <junjie.cao@linux.dev>
To: openembedded-core@lists.openembedded.org
Cc: paul@pbarker.dev,
	randy.macleod@windriver.com,
	Venkata.Navuduri@windriver.com
Subject: [OE-core][PATCH v2 06/10] cve-exclusion: set status for CVE-2022-4543
Date: Mon,  3 Aug 2026 01:48:23 -0700
Message-ID: <20260803084827.1348810-7-junjie.cao@linux.dev>
In-Reply-To: <20260803084827.1348810-1-junjie.cao@linux.dev>
References: <20260803084827.1348810-1-junjie.cao@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Aug 2026 08:50:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242632

KPTI clones the kernel entry text into the user page tables at its
KASLR-slid address and, on CPUs with PGE, sets the global bit on those
PTEs. The mapping therefore survives the CR3 write on kernel exit, and a
local attacker can time prefetch instructions across the kernel range to
recover the KASLR base in well under a second.

Disclosure and technical write-up:

  https://www.openwall.com/lists/oss-security/2022/12/16/3
  https://www.willsroot.io/2022/12/entrybleed.html

The disclosure states that after discussion with security@kernel.org and
linux-distros "a fix for this is currently not available", and none has
appeared since. arch/x86/mm/pti.c still clones the entry text and still
sets _PAGE_GLOBAL on the cloned PTEs as of v7.2, and no commit in
mainline references the issue.

Debian marks it unimportant with the note "Ignored upstream and KASLR is
not expected to be resistant to local attacks":

  https://security-tracker.debian.org/tracker/CVE-2022-4543

Ubuntu has it deferred since 2023-01-10 with "unfixed upstream", and
Red Hat lists current RHEL as Affected with no mitigation available:

  https://ubuntu.com/security/CVE-2022-4543
  https://access.redhat.com/security/cve/CVE-2022-4543

97e3d26b5e5f ("x86/mm: Randomize per-cpu entry area", v6.2) randomizes
the CPU entry area, which is CVE-2023-3640. It predates this disclosure
and does not address it - the offset of entry_SYSCALL_64 from the KASLR
base is unchanged by that commit.

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
index 7547cdfd..3517318e 100644
--- a/meta/recipes-kernel/linux/cve-exclusion.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion.inc
@@ -225,3 +225,10 @@ was never substantiated and was closed as not-a-bug =
by Red Hat, SUSE and Debian"
 # Also in 6.1.150, 6.6.104, 6.12.y and 6.16.5 via the 2025-09-02 stable =
round.
 # The rose/hamradio subsystem was removed entirely in v7.1 (dd8d4bc28ad7=
).
 CVE_STATUS[CVE-2022-1247] =3D "fixed-version: Fixed from version 6.17"
+
+# "EntryBleed": KPTI maps __entry_text into the user page tables with th=
e
+# global bit set, leaking the KASLR base by prefetch timing. Intel only.
+# Not CVE-2023-3640, which is the separate cpu_entry_area (fixed in v6.2=
).
+# https://www.willsroot.io/2022/12/entrybleed.html
+CVE_STATUS[CVE-2022-4543] =3D "upstream-wontfix: no fix planned, KASLR i=
s not \
+considered a defence against local attackers"
--=20
2.43.0


