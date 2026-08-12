Return-Path: <junjie.cao@linux.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAF6DC5AD5A
	for <webhook@archiver.kernel.org>; Wed, 12 Aug 2026 05:31:00 +0000 (UTC)
Received: from out-180.mta1.migadu.com (out-180.mta1.migadu.com [95.215.58.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1525.1786512660422921983
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Aug 2026 22:31:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@linux.dev header.s=key1 header.b=Lb+LUIMB;
 spf=pass (domain: linux.dev, ip: 95.215.58.180, mailfrom: junjie.cao@linux.dev)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1786512657;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D4g14Uo/dPdwN6YIoVIbHNrsskUGuv+VgxvJH0L5raU=;
	b=Lb+LUIMBEo2KAEsag9c596YTXwPCw2vAahSvlNQFZ6+QKCERHY2dz2itpAwRMLwcQj5B4g
	gYBsxdDRsALtY7FYTfIpAoT80qo0I25V5KmMAFyoNlilW4/4PrCbR/fDbaR3l0cOG/yhoM
	UirDDczZgV/FmuC/yuGQtKbXd/T7ZNw=
From: Junjie Cao <junjie.cao@linux.dev>
To: openembedded-core@lists.openembedded.org
Cc: paul@pbarker.dev
Subject: [OE-core][PATCH v3 1/9] cve-exclusions: set status for CVE-2019-14899
Date: Wed, 12 Aug 2026 02:28:34 -0500
Message-ID: <20260812072842.1176341-2-junjie.cao@linux.dev>
In-Reply-To: <20260812072842.1176341-1-junjie.cao@linux.dev>
References: <20260812072842.1176341-1-junjie.cao@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2026 05:31:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243226

A network-adjacent attacker can send packets addressed to a host's VPN
tunnel address over the physical interface. Because Linux uses the weak
host model by default, the host replies, which lets the attacker infer
the tunnel address, confirm active connections and eventually inject
into the tunneled TCP stream.

No upstream kernel fix exists. The disclosure notes that reverse path
filtering is not a complete solution because the attack also works over
IPv6, which has no rp_filter; the mitigation that shipped was a firewall
rule added to wg-quick(8) in userspace:

  https://www.openwall.com/lists/oss-security/2019/12/05/1
  https://lore.kernel.org/all/20191205191318.GA44156@zx2c4.com/

Distribution trackers record the same state: Ubuntu has it deferred
since 2019-12-13, Debian does not track it against the kernel, and Red
Hat scopes it to openvpn:

  https://ubuntu.com/security/CVE-2019-14899
  https://security-tracker.debian.org/tracker/CVE-2019-14899

Record it unpatched so it stays visible rather than excluded.

CC: Paul Barker <paul@pbarker.dev>
AI-Generated: Uses Claude (claude-opus-5)
Signed-off-by: Junjie Cao <junjie.cao@linux.dev>
---
v3:
- use "unpatched" instead of "upstream-wontfix": there is no upstream
  statement, only distribution and disclosure sources

v2: https://lore.kernel.org/openembedded-core/20260803084827.1348810-1-ju=
njie.cao@linux.dev/

 meta/recipes-kernel/linux/cve-exclusion.inc | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-kernel/linux/cve-exclusion.inc b/meta/recipes-k=
ernel/linux/cve-exclusion.inc
index d27d764..5ed4a00 100644
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
+# Consequence of the default weak host model, not a specific defect;
+# mitigation is firewall configuration only (rp_filter for IPv4, a
+# strong host model rule such as wg-quick(8)'s, which also covers IPv6).
+# https://ubuntu.com/security/CVE-2019-14899
+CVE_STATUS[CVE-2019-14899] =3D "unpatched: consequence of the default we=
ak \
+host model, no upstream kernel fix, mitigated by firewall configuration"
--=20
2.43.0


