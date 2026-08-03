Return-Path: <junjie.cao@linux.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30635C55184
	for <webhook@archiver.kernel.org>; Mon,  3 Aug 2026 08:49:48 +0000 (UTC)
Received: from out-185.mta0.migadu.com (out-185.mta0.migadu.com [91.218.175.185])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.39021.1785746987184853137
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Aug 2026 01:49:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@linux.dev header.s=key1 header.b=dF0iGndh;
 spf=pass (domain: linux.dev, ip: 91.218.175.185, mailfrom: junjie.cao@linux.dev)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785746985;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0QJHRXPeQrwu+ftHqGPsNXYPm2lvOXOppYHFhVVI39M=;
	b=dF0iGndh6cWA4iJcXg9Jg+UZa8ehQVb4gqAfUfqLayLGL5fAOhlgrAcRmn6mv59n/HlanT
	lGv0rUbeZmEm9w21iQBrxNai6qjMs31blMnfyvpO/H5u0XWlOaV3HTeojs2gOD8P4OdaqX
	2Op97w3SXcZkQV5Ej+0nRVQZ1muimXU=
From: Junjie Cao <junjie.cao@linux.dev>
To: openembedded-core@lists.openembedded.org
Cc: paul@pbarker.dev,
	randy.macleod@windriver.com,
	Venkata.Navuduri@windriver.com
Subject: [OE-core][PATCH v2 04/10] cve-exclusion: set status for CVE-2022-0400
Date: Mon,  3 Aug 2026 01:48:21 -0700
Message-ID: <20260803084827.1348810-5-junjie.cao@linux.dev>
In-Reply-To: <20260803084827.1348810-1-junjie.cao@linux.dev>
References: <20260803084827.1348810-1-junjie.cao@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Aug 2026 08:49:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242630

The CVE describes an out-of-bounds read in the SMC protocol stack, but
no vulnerable code was ever identified. The MITRE record lists the
affected version as "Not Known" and references only two Red Hat
bugzillas, the originating one of which was never made public.

The public bugzilla is closed as NOTABUG, with the statement "There was
no shipped kernel version that was seen affected by this problem":

  https://bugzilla.redhat.com/show_bug.cgi?id=3D2044575
  https://access.redhat.com/security/cve/CVE-2022-0400

SUSE reached the same conclusion independently, closing bsc#1195329 as
RESOLVED / INVALID:

  https://www.suse.com/security/cve/CVE-2022-0400.html

So did Debian, which marks it unimportant with the note "non issue, no
security impact":

  https://security-tracker.debian.org/tracker/CVE-2022-0400

There is no commit in mainline referencing this CVE. The net/smc
out-of-bounds fixes that landed in v5.18 (b1871fd48efc, 0558226cebee)
are in local, privileged paths and are not linked to this CVE by any
tracker.

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
index d7ae3b03..0ae3a0d6 100644
--- a/meta/recipes-kernel/linux/cve-exclusion.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion.inc
@@ -212,3 +212,10 @@ KSM page deduplication, closed WONTFIX by Red Hat, n=
o upstream fix planned"
 # https://www.openwall.com/lists/oss-security/2021/10/20/2
 CVE_STATUS[CVE-2021-3864] =3D "upstream-wontfix: no accepted mainline fi=
x after \
 several attempts, exploitation requires a relative kernel.core_pattern"
+
+# Never substantiated: no affected version, reproducer or commit was eve=
r
+# identified. Closed NOTABUG by Red Hat, INVALID by SUSE (bsc#1195329) a=
nd
+# "non issue, no security impact" by Debian.
+# https://bugzilla.redhat.com/show_bug.cgi?id=3D2044575
+CVE_STATUS[CVE-2022-0400] =3D "disputed: the reported net/smc out-of-bou=
nds read \
+was never substantiated and was closed as not-a-bug by Red Hat, SUSE and=
 Debian"
--=20
2.43.0


