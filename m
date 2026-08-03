Return-Path: <junjie.cao@linux.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 371A2C55175
	for <webhook@archiver.kernel.org>; Mon,  3 Aug 2026 08:51:08 +0000 (UTC)
Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com [91.218.175.189])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39099.1785747059919858781
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Aug 2026 01:51:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@linux.dev header.s=key1 header.b=BxcvSbVo;
 spf=pass (domain: linux.dev, ip: 91.218.175.189, mailfrom: junjie.cao@linux.dev)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785747057;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OJQPS/QikPsn+CVxX88CQ4ElnIPEhXE59yy0y5khDcw=;
	b=BxcvSbVoK+JjzWCUIzjR9e9/VopwUY4Ni0DwpQ0tn/i16IFAsNyX7zf8T/7HwW+hHvv9Xh
	Bz7gvCJlYlkhI/fjIU45TwnDEoAnM0+pACE1xKpTQXdpKhDccgbxFBn4Y8u2IbVUfbk1qk
	RjEUMk+mhlfMO45UVelqbkIBJR4pbGI=
From: Junjie Cao <junjie.cao@linux.dev>
To: openembedded-core@lists.openembedded.org
Cc: paul@pbarker.dev,
	randy.macleod@windriver.com,
	Venkata.Navuduri@windriver.com
Subject: [OE-core][PATCH v2 10/10] cve-exclusion: set status for CVE-2023-6240
Date: Mon,  3 Aug 2026 01:48:27 -0700
Message-ID: <20260803084827.1348810-11-junjie.cao@linux.dev>
In-Reply-To: <20260803084827.1348810-1-junjie.cao@linux.dev>
References: <20260803084827.1348810-1-junjie.cao@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Aug 2026 08:51:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242636

"Marvin" is Hubert Kario's Bleichenbacher-style timing oracle research,
not a Marvell or s390 issue as some data sets suggest:

  https://people.redhat.com/~hkario/marvin/

The affected code is the generic software RSA PKCS#1 v1.5 unpadding in
crypto/rsa-pkcs1pad.c. pkcs1pad_decrypt_complete() has three
secret-dependent early exits (leading zero byte, block type, minimum
padding length) and a loop whose trip count depends on the position of
the separator, so the time taken reveals padding validity. There is no
constant-time unpadding and no implicit-rejection fallback in the tree,
and no commit touching that file addresses decryption timing.

Red Hat classifies it CWE-203 and has shipped fixes only in RHEL
errata (RHSA-2024:2758 for 9.4, RHSA-2024:3618 for 8.10 and others);
the corresponding bugzilla is still NEW:

  https://access.redhat.com/security/cve/CVE-2023-6240

Ubuntu records "appears unfixed in upstream as of 2024.08.24" and
Debian lists src:linux as vulnerable in all suites:

  https://ubuntu.com/security/CVE-2023-6240
  https://security-tracker.debian.org/tracker/CVE-2023-6240

Practical exposure is narrow: kernel PKCS#1 v1.5 use is dominated by
signature verification rather than decryption, and an attacker needs a
service driving KEYCTL_PKEY_DECRYPT with a long-lived key. The leaky
primitive is nevertheless reachable.

e8829ef1f73f ("crypto: rsa - restrict plaintext/ciphertext values
more", v6.9) is unrelated: it enforces SP800-56B value restrictions and
is not a timing fix.

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
index 506d3705..4ac5e343 100644
--- a/meta/recipes-kernel/linux/cve-exclusion.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion.inc
@@ -252,3 +252,10 @@ CVE_STATUS[CVE-2023-4010] =3D "fixed-version: Fixed =
from version 6.18"
 # https://lore.kernel.org/linux-nvme/20231016060519.231880-1-joshi.k@sam=
sung.com/
 CVE_STATUS[CVE-2023-6238] =3D "unpatched: the proposed fix was applied t=
o \
 nvme-6.6 and then reverted, no upstream fix has landed since"
+
+# "Marvin": the PKCS#1 v1.5 unpadding in crypto/rsa-pkcs1pad.c branches =
on
+# secret-derived data, leaking padding validity by timing. Not a Marvell=
 or
+# s390 issue despite some data sets. Fixed only in RHEL downstream.
+# https://people.redhat.com/~hkario/marvin/
+CVE_STATUS[CVE-2023-6240] =3D "unpatched: Bleichenbacher-style timing or=
acle in \
+crypto/rsa-pkcs1pad.c is still present in mainline, fixed only downstrea=
m in RHEL"
--=20
2.43.0


