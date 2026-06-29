Return-Path: <asparmar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88A71C43638
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 12:44:44 +0000 (UTC)
Received: from rcdn-iport-4.cisco.com (rcdn-iport-4.cisco.com [173.37.86.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36701.1782737079056422195
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2026 05:44:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=ZC4WX+Z+;
 spf=pass (domain: cisco.com, ip: 173.37.86.75, mailfrom: asparmar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3083; q=dns/txt;
  s=iport01; t=1782737079; x=1783946679;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7Y0g9w4yo0um5MdLyZs4/e0LsStvKlFvu6Pg0VhefK8=;
  b=ZC4WX+Z+nl4kotmmEJ+FgdY8i1G9jyKxWIrB6yBORiExjrTHte6RpRSO
   tyikJjqfKuzv7cfK3u6xsoDcf0NNFGyRSZ4UMqv/TbsobSUT7qvqCW2s7
   XhnT+0lK+0GNo7lnXBxTnmzooZAfSHLxS0yu6mfzyrL53XSKdzy1toN2K
   fcl+3JWrwuUy03ZY+xphw00Neg2Hrj8oWY1fsZ1FaLRHaVMpvvzUMCUau
   Kd2E1cAHMyGZlE8QpOWJ2xrudjei3SJwte8A1RVPoKJICd9TVoUHi3Zqa
   uRG6nXnmcrPcO/Soqnzw1UI3FazUJ+Q1YyaR6INYuVh1rErgaG8f1Prlt
   A==;
X-CSE-ConnectionGUID: z37uPiTBTUeLi+BgQad6EQ==
X-CSE-MsgGUID: WZFqfYgEQGG2qgPWbhsP6Q==
X-IPAS-Result: =?us-ascii?q?A0BGAgBFZ0Jq/4r/Ja1aglmCV3RfQkmWSwOeG4F+DwEBA?=
 =?us-ascii?q?Q9EDQQBAYUGAo1LAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECAQcFg?=
 =?us-ascii?q?Q4Thk8NhloBAgEDJwsBRhAcAwECLysjCBmDAgGCcwIBEQa2MBo3gXkzgQGEf?=
 =?us-ascii?q?dssAQsUAQWBM4U/iB9bGAGEfCcbG4FygRWDaYEFgVwCA4Ekhn4EgiKBDIFaH?=
 =?us-ascii?q?oF6ggiBGIl3SIEeA1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F4EMGwcFgR2Ba?=
 =?us-ascii?q?YEEhH0jHwM5f4EwdVhmFTA1gQIBER4KgVInAwsYDUgRLDcUGwQ+bgeMXhcPg?=
 =?us-ascii?q?WlUAYENASsiLoFEKaVloQ8KKIN1jCGVOhozhVulEZkIjgqWUIRogWg8gVlwF?=
 =?us-ascii?q?YMiCQpAGQ+OOINrhRPCcSQ1AgEIMgEBBwIHDgMLgWiQAIF9AQE?=
IronPort-Data: A9a23:492hfKpohYdFyP4WMsjuulViQVleBmJJZBIvgKrLsJaIsI4StFCzt
 garIBnQPazeM2bxLd8nPtnl9BkFvZSDzd5lSQNr/nw3RX4S+ePIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOCn9j8kif3gqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgPNNwJcaDpOtfrd8kM35pwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0vQsXnx29
 MAyFA0AShHAre2Pyb7lZ9A506zPLOGzVG8ekmtrwTecCbMtRorOBv2To9RZxzw3wMtJGJ4yZ
 eJANmEpN0uGOUASfA5MWPrSn8/w7pX7WzRDsFuPoKMty2PS1wd2lrPqNbI5f/TXHZ8MxBjA9
 z+uE2LRPSM0LdKuxhe83V32n+D3oin7Q7pMLejtnhJtqBjJroAJMzURTVa9rPyzh0KyVt4aI
 EsO9wIqrLMu7wqsVtT7UhiyrXKIsxJaXMBfe9DW8ymXwabSpgLcDW8eQ3sZMZottdQ9Qnoh0
 Vrhc87VOAGDeYa9ERq1nop4ZxvoUcTJBQfuvRM5cDY=
IronPort-HdrOrdr: A9a23:T8BsJat+5ejgqvzOPTMjvhqT7skDrtV00zEX/kB9WHVpmwKj+P
 xG+85rsiMc5wxxZJhNo7290ey7MBHhHP1OkO0s1MmZPDUO0VHAROoJ0WKh+UyEJ8SUzIBgPM
 lbH5SWIeeAa2SS9fyKgzWQIpIH3MSN9ryuiKP1yndgShwvVoRbhj0Jczpy1iZNNXJ77V1TLu
 vl2vZ6
X-Talos-CUID: =?us-ascii?q?9a23=3AY/Nnvmies3Q7bnGwgyRgG6jI/jJuYCaC0U/RH2W?=
 =?us-ascii?q?ENGtNSf6/RmaZ9P1Jqp87?=
X-Talos-MUID: 9a23:OnzpZgRky5ugA3jkRXTTth97OvZnzp2BJxoUnq05scmfDXJJbmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.24,231,1774310400"; 
   d="scan'208";a="502126095"
Received: from rcdn-l-core-01.cisco.com ([173.37.255.138])
  by rcdn-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 29 Jun 2026 12:44:38 +0000
Received: from sjc-ads-20495.cisco.com (sjc-ads-20495.cisco.com [171.70.188.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-01.cisco.com (Postfix) with ESMTPS id 027B4180001C2;
	Mon, 29 Jun 2026 12:44:38 +0000 (GMT)
Received: by sjc-ads-20495.cisco.com (Postfix, from userid 1877012)
	id 9F16ECC1611; Mon, 29 Jun 2026 05:44:37 -0700 (PDT)
From: "Ashishkumar Parmar X (asparmar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <asparmar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com, to@cisco.com,
	Ashishkumar Parmar <asparmar@cisco.com>
Subject: [OE-core][wrynose][PATCH 2/3] qemu: Fix CVE-2026-0665
Date: Mon, 29 Jun 2026 05:44:30 -0700
Message-Id: <20260629124431.2000781-2-asparmar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260629124431.2000781-1-asparmar@cisco.com>
References: <20260629124431.2000781-1-asparmar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-20495.cisco.com [171.70.188.248];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.188.248, sjc-ads-20495.cisco.com
X-Outbound-Node: rcdn-l-core-01.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 12:44:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239770

From: Ashishkumar Parmar <asparmar@cisco.com>

This patch applies the upstream stable-10.2 backport for CVE-2026-0665.
The upstream fix commit is referenced in [1], and the public CVE advisory
is referenced in [2].

[1] https://gitlab.com/qemu-project/qemu/-/commit/058e1774d678031ec207441a51efcf8ae94cc6af
[2] https://github.com/advisories/GHSA-4pq4-6gr5-cr69

Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2026-0665.patch             | 38 +++++++++++++++++++
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2026-0665.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 1d493ee1a3..518ef69789 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -38,6 +38,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://qemu-guest-agent.udev \
            file://CVE-2024-6519.patch \
            file://CVE-2026-2243.patch \
+           file://CVE-2026-0665.patch \
            "
 # file index at download.qemu.org isn't reliable: https://gitlab.com/qemu-project/qemu-web/-/issues/9
 UPSTREAM_CHECK_URI = "https://www.qemu.org"
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2026-0665.patch b/meta/recipes-devtools/qemu/qemu/CVE-2026-0665.patch
new file mode 100644
index 0000000000..ed8623c225
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2026-0665.patch
@@ -0,0 +1,38 @@
+From 77705f3f91dc1ede803228a0eaf4593103466e3a Mon Sep 17 00:00:00 2001
+From: Vulnerability Report <vr@darknavy.com>
+Date: Fri, 9 Jan 2026 10:35:48 +0800
+Subject: [PATCH] hw/i386/kvm: fix PIRQ bounds check in xen_physdev_map_pirq()
+
+Reject pirq == s->nr_pirqs in xen_physdev_map_pirq().
+
+CVE: CVE-2026-0665
+Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit/058e1774d678031ec207441a51efcf8ae94cc6af]
+
+Fixes: aa98ee38a5 ("hw/xen: Implement emulated PIRQ hypercall support")
+Fixes: CVE-2026-0665
+Reported-by: DARKNAVY (@DarkNavyOrg) <vr@darknavy.com>
+Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
+Signed-off-by: Vulnerability Report <vr@darknavy.com>
+Link: https://lore.kernel.org/r/13FE03BE60EA78D6+20260109023548.4047-1-vr@darknavy.com
+Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
+(cherry picked from commit c7504ba2a560fd884557f6e5142f03b491aad0c7)
+Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
+(cherry picked from commit 058e1774d678031ec207441a51efcf8ae94cc6af)
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ hw/i386/kvm/xen_evtchn.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/hw/i386/kvm/xen_evtchn.c b/hw/i386/kvm/xen_evtchn.c
+index dd566c496..173e0818c 100644
+--- a/hw/i386/kvm/xen_evtchn.c
++++ b/hw/i386/kvm/xen_evtchn.c
+@@ -1877,7 +1877,7 @@ int xen_physdev_map_pirq(struct physdev_map_pirq *map)
+             return pirq;
+         }
+         map->pirq = pirq;
+-    } else if (pirq > s->nr_pirqs) {
++    } else if (pirq >= s->nr_pirqs) {
+         return -EINVAL;
+     } else {
+         /*
-- 
2.35.6


