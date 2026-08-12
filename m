Return-Path: <junjie.cao@linux.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8852C5B567
	for <webhook@archiver.kernel.org>; Wed, 12 Aug 2026 05:32:00 +0000 (UTC)
Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1531.1786512716552142226
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Aug 2026 22:31:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@linux.dev header.s=key1 header.b=aBkVNGM2;
 spf=pass (domain: linux.dev, ip: 91.218.175.179, mailfrom: junjie.cao@linux.dev)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1786512714;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xNAXrbYx7bdElRyOIEnNH3bfS48FtYGtJQBYXY6bDsc=;
	b=aBkVNGM2CiYzZr0eR5kmptri5rz+TGDOSrdRpftQEiWWWjo8suoVtUx+5Cv+yjJeBTyQE1
	cyWqflekIc3O/kyHe1dmkGjrW0t+EQyrqqVtCvsNKy3VCqI3J7vZoWF+65e7nc1a/Y2IjH
	cpHf3SzntHDFCiWQtwjuLvQsI7tl0fQ=
From: Junjie Cao <junjie.cao@linux.dev>
To: openembedded-core@lists.openembedded.org
Cc: paul@pbarker.dev
Subject: [OE-core][PATCH v3 6/9] cve-exclusions: set status for CVE-2022-4543
Date: Wed, 12 Aug 2026 02:28:39 -0500
Message-ID: <20260812072842.1176341-7-junjie.cao@linux.dev>
In-Reply-To: <20260812072842.1176341-1-junjie.cao@linux.dev>
References: <20260812072842.1176341-1-junjie.cao@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2026 05:32:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243231

KPTI clones the kernel entry text into the user page tables at its
KASLR-slid address and, on CPUs with PGE, sets the global bit on those
PTEs. The mapping survives the CR3 write on kernel exit, and a local
attacker can time prefetch instructions across the kernel range to
recover the KASLR base in well under a second.

Disclosure and write-up:

  https://www.openwall.com/lists/oss-security/2022/12/16/3
  https://www.willsroot.io/2022/12/entrybleed.html

The disclosure states that after discussion with security@kernel.org and
linux-distros "a fix for this is currently not available", and none has
appeared since; arch/x86/mm/pti.c still clones the entry text and sets
_PAGE_GLOBAL on the cloned PTEs. This is an unfixed issue, not a stated
wontfix - Debian notes "Ignored upstream and KASLR is not expected to be
resistant to local attacks", Ubuntu has it deferred since 2023-01-10:

  https://security-tracker.debian.org/tracker/CVE-2022-4543
  https://ubuntu.com/security/CVE-2022-4543

97e3d26b5e5f ("x86/mm: Randomize per-cpu entry area", v6.2) randomizes
the separate cpu_entry_area; it predates this disclosure and does not
change the offset of entry_SYSCALL_64 from the KASLR base.

CC: Paul Barker <paul@pbarker.dev>
AI-Generated: Uses Claude (claude-opus-5)
Signed-off-by: Junjie Cao <junjie.cao@linux.dev>
---
v3:
- use "unpatched" instead of "upstream-wontfix": the security-team
  discussion produced no clear wontfix decision

v2: https://lore.kernel.org/openembedded-core/20260803084827.1348810-1-ju=
njie.cao@linux.dev/

 meta/recipes-kernel/linux/cve-exclusion.inc | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/recipes-kernel/linux/cve-exclusion.inc b/meta/recipes-k=
ernel/linux/cve-exclusion.inc
index b08eaa1..a909aef 100644
--- a/meta/recipes-kernel/linux/cve-exclusion.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion.inc
@@ -229,3 +229,11 @@ was never substantiated and was closed as not-a-bug =
by Red Hat, SUSE and Debian"
 # Fix https://git.kernel.org/linus/d860d1faa6b2ce3becfdb8b0c2b048ad31800=
061
 # Fix https://git.kernel.org/linus/da9c9c877597170b929a6121a68dcd3dd9a80=
f45
 CVE_STATUS[CVE-2022-1247] =3D "fixed-version: Fixed from version 6.17"
+
+# "EntryBleed": KPTI maps the entry text into the user page tables with
+# the global bit set, leaking the KASLR base by prefetch timing. Discuss=
ed
+# with the kernel security team; no fix, KASLR is not treated as a bound=
ary
+# against local attackers. Distinct from CVE-2023-3640 (cpu_entry_area).
+# https://www.willsroot.io/2022/12/entrybleed.html
+CVE_STATUS[CVE-2022-4543] =3D "unpatched: no upstream fix, KASLR is not =
\
+treated as a defence against local attackers"
--=20
2.43.0


