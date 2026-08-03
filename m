Return-Path: <junjie.cao@linux.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36C42C55184
	for <webhook@archiver.kernel.org>; Mon,  3 Aug 2026 08:49:08 +0000 (UTC)
Received: from out-180.mta1.migadu.com (out-180.mta1.migadu.com [95.215.58.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39070.1785746946718491009
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Aug 2026 01:49:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@linux.dev header.s=key1 header.b=bltcXLSA;
 spf=pass (domain: linux.dev, ip: 95.215.58.180, mailfrom: junjie.cao@linux.dev)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785746944;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vr1etC4ZimpGJlnpSHt4rpf8hUsn/jbQfvKQTojn8is=;
	b=bltcXLSAv531dOpgOynxcSmbtonY5lWjP0TXUh5aZo64srYamFACqgV66UQF66+K9y+OHL
	UZB2+5ARaYhSE38IWK3Vj5tCO22kqTnvfwlAfQkX8FmgrvLSJWkQXB0TCLaRnxAJ4tn+1t
	aFFm77hPSejp+0MsAmMKlB1cHkR6ZTQ=
From: Junjie Cao <junjie.cao@linux.dev>
To: openembedded-core@lists.openembedded.org
Cc: paul@pbarker.dev,
	randy.macleod@windriver.com,
	Venkata.Navuduri@windriver.com
Subject: [OE-core][PATCH v2 01/10] cve-exclusion: set status for CVE-2019-14899
Date: Mon,  3 Aug 2026 01:48:18 -0700
Message-ID: <20260803084827.1348810-2-junjie.cao@linux.dev>
In-Reply-To: <20260803084827.1348810-1-junjie.cao@linux.dev>
References: <20260803084827.1348810-1-junjie.cao@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Aug 2026 08:49:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242627

A network-adjacent attacker can send packets addressed to a host's VPN
tunnel address over the physical interface. Because Linux uses the weak
host model by default, the host replies, which lets the attacker infer
the tunnel address, confirm active connections and eventually inject
into the tunneled TCP stream.

No kernel fix exists. The original disclosure states that reverse path
filtering is not a solution because the attack also works over IPv6,
which has no rp_filter at all:

  https://www.openwall.com/lists/oss-security/2019/12/05/1

Kernel-level mitigations were discussed on netdev and the WireGuard list
in December 2019 but nothing was merged; the mitigation that shipped was
a firewall rule added to wg-quick(8) in userspace:

  https://lore.kernel.org/all/20191205191318.GA44156@zx2c4.com/

Ubuntu has the issue deferred for every release since 2019-12-13 and
records "No current fix from upstream":

  https://ubuntu.com/security/CVE-2019-14899

Debian does not track it against the kernel source package at all, and
Red Hat scopes it to openvpn rather than the kernel:

  https://security-tracker.debian.org/tracker/CVE-2019-14899
  https://access.redhat.com/security/cve/CVE-2019-14899

The NVD entry carries an unversioned linux_kernel CPE, so no fixed
version can ever match it.

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
index d27d7644..aaba26fe 100644
--- a/meta/recipes-kernel/linux/cve-exclusion.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion.inc
@@ -192,3 +192,10 @@ CVE_STATUS[CVE-2025-68195] =3D "fixed-version: Fixed=
 from 6.18"
 # Fix https://git.kernel.org/stable/c/b4b64fda4d30a83a7f00e92a0c8a1d4769=
9609f3
 # Backport https://git.kernel.org/stable/c/75c5d9bce072abbbc09b701a49869=
ac23c34a906
 CVE_STATUS[CVE-2025-71145] =3D "cpe-stable-backport: Fixed from v6.18.3"
+
+# Consequence of the default weak host model, not a specific defect.
+# Mitigation is configuration only: rp_filter for IPv4, or a strong host
+# model rule such as the one wg-quick(8) installs, which also covers IPv=
6.
+# https://www.openwall.com/lists/oss-security/2019/12/05/1
+CVE_STATUS[CVE-2019-14899] =3D "upstream-wontfix: consequence of the def=
ault weak \
+host model, no kernel fix exists or is planned, mitigated by firewall co=
nfiguration"
--=20
2.43.0


