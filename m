Return-Path: <junjie.cao@linux.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D900EC5B567
	for <webhook@archiver.kernel.org>; Wed, 12 Aug 2026 05:33:20 +0000 (UTC)
Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com [37.59.57.117])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1502.1786512798502560219
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Aug 2026 22:33:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@linux.dev header.s=key1 header.b=N4f/PhB3;
 spf=pass (domain: linux.dev, ip: 37.59.57.117, mailfrom: junjie.cao@linux.dev)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1786512796;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JcyfdIorAxCqa+NrHLQeR+0arq9JpIWM1Vab1fp751o=;
	b=N4f/PhB3BfRx28Tp+bkIIimy1gu1NYVkjvimJ6oxWgQqeHX+SKwdqpDWPZ8BCM5dJbZzpO
	9Oj/RQj4+xPsLTWk4d1SWz1Iiz/uSwQ950FQlyMBguBFOOPiNq1trer6MX7pW6m4Px+KU6
	BWJwvCdgxd4vht1+j1MjlKBTEXoTaCA=
From: Junjie Cao <junjie.cao@linux.dev>
To: openembedded-core@lists.openembedded.org
Cc: paul@pbarker.dev
Subject: [OE-core][PATCH v3 9/9] cve-exclusions: set status for CVE-2023-6240
Date: Wed, 12 Aug 2026 02:28:42 -0500
Message-ID: <20260812072842.1176341-10-junjie.cao@linux.dev>
In-Reply-To: <20260812072842.1176341-1-junjie.cao@linux.dev>
References: <20260812072842.1176341-1-junjie.cao@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2026 05:33:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243234

"Marvin" is Hubert Kario's Bleichenbacher-style timing oracle research:

  https://people.redhat.com/~hkario/marvin/

The affected code is the generic software RSA PKCS#1 v1.5 unpadding in
crypto/rsa-pkcs1pad.c. pkcs1pad_decrypt_complete() has three
secret-dependent early exits (leading zero byte, block type, minimum
padding length) and a loop whose trip count depends on the position of
the separator, so the time taken reveals padding validity. There is no
constant-time unpadding or implicit-rejection fallback in the tree.

Red Hat classifies it CWE-203 and has shipped fixes only in RHEL errata
(RHSA-2024:2758, RHSA-2024:3618 and others); the bugzilla is still NEW.
Ubuntu records it unfixed upstream as of 2024-08-24 and Debian lists
src:linux vulnerable in all suites:

  https://access.redhat.com/security/cve/CVE-2023-6240
  https://ubuntu.com/security/CVE-2023-6240
  https://security-tracker.debian.org/tracker/CVE-2023-6240

Practical exposure is narrow: kernel PKCS#1 v1.5 use is dominated by
signature verification rather than decryption, and an attacker needs a
service driving KEYCTL_PKEY_DECRYPT with a long-lived key. The leaky
primitive is nevertheless reachable.

CC: Paul Barker <paul@pbarker.dev>
AI-Generated: Uses Claude (claude-opus-5)
Signed-off-by: Junjie Cao <junjie.cao@linux.dev>
---
v3:
- drop the Marvell/s390 aside and the unrelated e8829ef1f73f paragraph
  flagged in review as LLM confusion artifacts

v2: https://lore.kernel.org/openembedded-core/20260803084827.1348810-1-ju=
njie.cao@linux.dev/

 meta/recipes-kernel/linux/cve-exclusion.inc | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-kernel/linux/cve-exclusion.inc b/meta/recipes-k=
ernel/linux/cve-exclusion.inc
index 35e0a66..637f8b6 100644
--- a/meta/recipes-kernel/linux/cve-exclusion.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion.inc
@@ -252,3 +252,10 @@ affected fs/jfs txEnd()/lmLogClose() unmount race is=
 unchanged"
 # https://lore.kernel.org/linux-nvme/20231016060519.231880-1-joshi.k@sam=
sung.com/
 CVE_STATUS[CVE-2023-6238] =3D "unpatched: the proposed fix was applied t=
o \
 nvme-6.6 and then reverted, no upstream fix has landed since"
+
+# "Marvin": the PKCS#1 v1.5 unpadding in crypto/rsa-pkcs1pad.c branches =
on
+# secret-derived data, leaking padding validity by timing. Still present=
 in
+# mainline; fixed only in RHEL errata.
+# https://people.redhat.com/~hkario/marvin/
+CVE_STATUS[CVE-2023-6240] =3D "unpatched: Bleichenbacher-style timing or=
acle in \
+crypto/rsa-pkcs1pad.c is still present in mainline, fixed only downstrea=
m in RHEL"
--=20
2.43.0


