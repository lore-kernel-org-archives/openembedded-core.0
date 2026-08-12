Return-Path: <junjie.cao@linux.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6BC6C5B567
	for <webhook@archiver.kernel.org>; Wed, 12 Aug 2026 05:31:50 +0000 (UTC)
Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1489.1786512702501115657
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Aug 2026 22:31:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@linux.dev header.s=key1 header.b=bWHi30eg;
 spf=pass (domain: linux.dev, ip: 91.218.175.184, mailfrom: junjie.cao@linux.dev)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1786512700;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=veoR9S/qyMeG68COmJgvTTE8pNstaGApfTEA+b/9o4A=;
	b=bWHi30egpJ7GhkXHk05FIZKsA6Aar8od47Y7jGm9wFKSvEKOIapxTiCvdcezPHyH5H6626
	s8dpfpZ/adkMSggDc0CkHK0zP1g0H6+2er3ZcxroL/XygSygJWRgba7E9fzWPMXjtIHQih
	y1syj6kqEmoNaCr9dkLPexYHpNv9a+8=
From: Junjie Cao <junjie.cao@linux.dev>
To: openembedded-core@lists.openembedded.org
Cc: paul@pbarker.dev
Subject: [OE-core][PATCH v3 5/9] cve-exclusions: set status for CVE-2022-1247
Date: Wed, 12 Aug 2026 02:28:38 -0500
Message-ID: <20260812072842.1176341-6-junjie.cao@linux.dev>
In-Reply-To: <20260812072842.1176341-1-junjie.cao@linux.dev>
References: <20260812072842.1176341-1-junjie.cao@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2026 05:31:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243230

The CVE describes a race between rose_connect() and the code that frees
a rose_neigh once its count and use fields reach zero.

net/rose, and rose_connect() with it, was removed entirely in v7.1:

  https://git.kernel.org/linus/dd8d4bc28ad7252610d8e79c1313a2d1e3499a51
  ("net: remove ax25 and amateur radio (hamradio) subsystem", v7.1)

The linux-yocto kernel on master is 6.18, which still carries net/rose.
There the race is closed by Takamitsu Iwai's August 2025 refcount
conversion, which converts the 'use' field to refcount_t and removes the
unlocked rose->neighbour->use++ in rose_connect() that the CVE describes:

  https://git.kernel.org/linus/d860d1faa6b2ce3becfdb8b0c2b048ad31800061
  ("net: rose: convert 'use' field to refcount_t", v6.17)
  https://git.kernel.org/linus/da9c9c877597170b929a6121a68dcd3dd9a80f45
  ("net: rose: include node references in rose_neigh refcount", v6.17)

Both are in v6.17 and were backported to 6.1.y, 6.6.y, 6.12.y and 6.16.y
in the 2025-09-02 stable round. Upstream assigned these two commits their
own identifiers, CVE-2025-39826 and CVE-2025-39827 (both fixed in
v6.17-rc4), so the identification does not rest on this reading of the
diff alone. The Red Hat record for CVE-2022-1247 still shows it open and
lists no fix.

CC: Paul Barker <paul@pbarker.dev>
AI-Generated: Uses Claude (claude-opus-5)
Signed-off-by: Junjie Cao <junjie.cao@linux.dev>
---
v3:
- lead with the v7.1 removal of net/rose per review; keep the v6.17
  commits, which are what covers the 6.18 kernel on master
- cite the upstream CVE-2025-39826 / CVE-2025-39827 assignments for
  the two fixing commits instead of relying on the diff match alone

v2: https://lore.kernel.org/openembedded-core/20260803084827.1348810-1-ju=
njie.cao@linux.dev/

 meta/recipes-kernel/linux/cve-exclusion.inc | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/recipes-kernel/linux/cve-exclusion.inc b/meta/recipes-k=
ernel/linux/cve-exclusion.inc
index be74672..b08eaa1 100644
--- a/meta/recipes-kernel/linux/cve-exclusion.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion.inc
@@ -221,3 +221,11 @@ exploitation requires a relative kernel.core_pattern=
"
 # https://bugzilla.redhat.com/show_bug.cgi?id=3D2044575
 CVE_STATUS[CVE-2022-0400] =3D "disputed: the reported net/smc out-of-bou=
nds read \
 was never substantiated and was closed as not-a-bug by Red Hat, SUSE and=
 Debian"
+
+# net/rose and rose_connect() were removed entirely in v7.1 (dd8d4bc28ad=
7).
+# The 6.18 kernel on master still carries net/rose; there the race is
+# closed by the v6.17 refcount conversion, which upstream tracks as
+# CVE-2025-39826 / CVE-2025-39827.
+# Fix https://git.kernel.org/linus/d860d1faa6b2ce3becfdb8b0c2b048ad31800=
061
+# Fix https://git.kernel.org/linus/da9c9c877597170b929a6121a68dcd3dd9a80=
f45
+CVE_STATUS[CVE-2022-1247] =3D "fixed-version: Fixed from version 6.17"
--=20
2.43.0


