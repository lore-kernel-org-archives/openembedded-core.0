Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95AE3CC6B2D
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 03:54:55 +0000 (UTC)
Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14431.1792122890257901324
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 20:54:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=hfZf1jyl;
 spf=pass (domain: cisco.com, ip: 173.37.86.77, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1203; q=dns/txt;
  s=iport01; t=1792122890; x=1793332490;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=yFtDHjUISZQYKlNiJsQG4DWTaXVhl2vuvHfvGE45c4c=;
  b=hfZf1jylUGUjEDgl+dZgVI+2WaadmjIE11v7DZD7ySDprOn/pfFPeCaA
   UI+WF9rfJsK9CpssMrAkhThnpBO5DpOQzc/6Cu4BLZggGjArfWgrpo1qT
   wP7K1fD/ipahRxCbP4MOtZKKB8WqWBSlcBRgIpEQ4tupw7WRC7zPsH4zr
   gKTAieZ8J8nMS+PmoPuVU3gmZon9wEI44UdEGMRAKw/HaS/ulBtONct2x
   UtlRrXUHs63vPZRnLjL5SonG3MnJ3u7DeYmixS/RWPu4H+SdfOi7HxDAB
   bwIYUncdbDN2wl7mYXqoLfafSvnpyfNPWArJfA1S3nDXm1PxdUG/LDeb4
   A==;
X-CSE-ConnectionGUID: 59EVJa1vTEa6QDJ7DSMVrg==
X-CSE-MsgGUID: cA9xkgIKTQKU9nDQl+hp3g==
X-IPAS-Result: =?us-ascii?q?A0DCBACwntFq/5P/Ja1aHgE8DA4LgVmDTGFCSQSTVQGCc?=
 =?us-ascii?q?KAdDwEBAQ9EDQQBAYUFjhcCJjcGDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBA?=
 =?us-ascii?q?QECAQcFgQ4Thk8NkBU2ARgBLTBcRIMCAYJ0AgERvHCCLIEBgykBgVTbPhUFg?=
 =?us-ascii?q?TOFQIgjdoR8JxsbgXKEfoQrZYV4BIIiehKDJ5N6SIEeA1ksAVUTDQoLBwWBa?=
 =?us-ascii?q?AM1EioVbjIdgSM+F4EHGwYFgR2BIIIWIxk2eoEJXoErKWABEBeBCYIHAoJUg?=
 =?us-ascii?q?gACAUlBDgdFUwklQxJHJiIIEgkBExowC4EbODwJKEEXDHMMHQVyCAINCQcpG?=
 =?us-ascii?q?A1IESw3FRkEPm4HkhQegkUggQ8rBYIOGaV1oQ8KKIN2jCKVOhozqm+ZCI4Kl?=
 =?us-ascii?q?k+EaYF+JoFZcBWCbgEBMgkKQBkPlzfJRyQ1AgE6AgcCBw4DC5FqLYFPAQE?=
IronPort-Data: A9a23:RR7ENap/RWwog2d5imVvw+JiDbFeBmJOZBIvgKrLsJaIsI4StFCzt
 garIBmEPKmCY2OgKtgjbt7jpksEuJOAyNNiSQc5qi5jQXkU8OPIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOWn9T8jhfngqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgDNNwJcaDpOtfvb8U035ZwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0rsmLF9s/
 KUGFB0EMCmvpb2a+5eFUOY506zPLOGzVG8ekmtrwTecCbMtRorOBvySo9RZxzw3wMtJGJ4yZ
 eJANmEpN0uGOUASfA5LV/rSn8/w7pX7Wz1EqFuWrLAf6GnIxws327/oWDbQUoHRG5wIxhfF/
 goq+UzyK0AKN9O+6ga80U/9gMP2mWD7QNkdQejQGvlCxQf7KnYoIBoOWF22pPO0hkKzV5dUL
 FYZ0i4vtrQpskuzQ9/wWhe1rHKJslgbQdU4LgEhwBuGxqyR50OSAXIJC2cZLtcnr8QxAzct0
 zdlgu/UONCmi5XNIVr1y1tehWna1fQ9RYPaWRI5cA==
IronPort-HdrOrdr: A9a23:1SGeEq/L0rHkhBqdajRuk+D0I+orL9Y04lQ7vn2ZhyY7TiX+rb
 HKoB11737JYVoqNU3I+urwWpVoP0m9yXcd2+B4Vt2ftWLd1ldAQrsP0WLK+UyFJ8SHzJ8/6Y
 5QN45jFdb3EV92yez+4AW+DpIc5ePvytHOuQ8bpE0dND2DrMpbnmFENjo=
X-Talos-CUID: =?us-ascii?q?9a23=3Atji7BGlPxxowZKH/9d02nyo0WdzXOSCM4UnyKha?=
 =?us-ascii?q?mNUtgFoS5awC8w4ZaicU7zg=3D=3D?=
X-Talos-MUID: 9a23:b1znEgUIPoIc5X3q/DTF1SFhO+ZL352NNRELvawC+MmcbiMlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="536150950"
Received: from rcdn-l-core-10.cisco.com ([173.37.255.147])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 03:54:49 +0000
Received: from sjc-ads-4178.cisco.com (sjc-ads-4178.cisco.com [171.70.54.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-10.cisco.com (Postfix) with ESMTPS id 5B1D718000274;
	Fri, 16 Oct 2026 03:54:49 +0000 (GMT)
Received: by sjc-ads-4178.cisco.com (Postfix, from userid 1887505)
	id 00862CC1292; Thu, 15 Oct 2026 20:54:48 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][scarthgap][PATCH 0/1] openssh: Security Fix
Date: Thu, 15 Oct 2026 20:54:47 -0700
Message-Id: <20261016035448.3083867-1-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-4178.cisco.com [171.70.54.199];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.54.199, sjc-ads-4178.cisco.com
X-Outbound-Node: rcdn-l-core-10.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 03:54:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247923

From: Hetvi Thakar <hthakar@cisco.com>

  This series addresses CVE-2026-106587 in the Scarthgap
  openssh 9.6p1 recipe. The patch backports the upstream
  fix for handling server options set to "none" in a Match block.
 
  The series is based on three OpenSSH patches already submitted
  to OE-Core and still under review:
 
    CVE-2026-73283:
    https://patchwork.yoctoproject.org/project/oe-core/patch/20260930060027.1560262-1-hthakar@cisco.com/
 
    CVE-2026-73282:
    https://patchwork.yoctoproject.org/project/oe-core/patch/20260930060027.1560262-2-hthakar@cisco.com/
 
    CVE-2026-73281:
    https://patchwork.yoctoproject.org/project/oe-core/patch/20260930060027.1560262-3-hthakar@cisco.com/
 
  Those three patches are prerequisites; they are not included or
  resent in this one-patch series.
 
  Validation: BitBake do_patch and do_compile, the image build,
  and OpenSSH ptest completed successfully.

Hetvi Thakar (1):
  openssh: fix CVE-2026-106587

 .../openssh/openssh/CVE-2026-106587.patch     | 76 +++++++++++++++++++
 .../openssh/openssh_9.6p1.bb                  |  1 +
 2 files changed, 77 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-106587.patch

-- 
2.35.6

