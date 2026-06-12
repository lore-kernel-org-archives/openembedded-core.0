Return-Path: <asparmar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A010CCD98D9
	for <webhook@archiver.kernel.org>; Fri, 12 Jun 2026 12:18:40 +0000 (UTC)
Received: from rcdn-iport-8.cisco.com (rcdn-iport-8.cisco.com [173.37.86.79])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.69119.1781266706208214585
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jun 2026 05:18:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=S+CjLM6A;
 spf=pass (domain: cisco.com, ip: 173.37.86.79, mailfrom: asparmar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3176; q=dns/txt;
  s=iport01; t=1781266706; x=1782476306;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HRA8s9JHwMDnyTBYQOLxH15MusY4v8NJXzN5npqtYWk=;
  b=S+CjLM6Aa/3OBQV4rx+VA1PPkiaD64K4qxHV/058/wVGlZk6J3OF7Y0f
   BxabXNjXSom8HVhaFyU75UadscIwX6ksg5PQYyb4hpL6aWVVzN74oMH/o
   0iYcBpv9GbgxBzqBgbR0GQ8FI0QNHiLPJPb18CvR5iyAfkKCdtLW+cb+b
   zqzW4+u6yD41uVG5Y09ujbte0B4k43pm9g44iESAiJzUSJTHHan+yselm
   kQVBpCTvJelmViFMbt1f5Sm+gsIP/Q5YOwSjNUisKly59vmf8V/OlR7lh
   Ul5JC1kngYfmGB1yP2sRFETXUxiItSZuvQt56fCkuXyCKlNbPCb8uiHTV
   Q==;
X-CSE-ConnectionGUID: mwQmHJ1zQpmsSroiD8gfKw==
X-CSE-MsgGUID: C5onEgEKT7Cbf2COrZ2gFg==
X-IPAS-Result: =?us-ascii?q?A0BHAgDf9ytq/5L/Ja1aglmCGD90X0JJA5ZIA54bgX4PA?=
 =?us-ascii?q?QEBD0QNBAEBhQYCjUACJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGTw2GWgECAQMnCwFGEBwDAQIvKyMIGYIqWAGCcwIBEQayQBo3gXkzg?=
 =?us-ascii?q?QGDWgUJAkNQ2ywBBQYUAQWBM4U/iB9bGAGEfCcbG4FygRWDaYEFgVwFgSSGf?=
 =?us-ascii?q?gSCIoEMgV0eUoFcggqKM0iBHgNZLAFVEw0KCwcFgWYDNRIqFW4yHYEjPheBD?=
 =?us-ascii?q?BsHBYFKgStqgQOFDSMfAzl/gXSBKGdpFTA1gQEBERIDCxgNSBEsNxQbBD5uB?=
 =?us-ascii?q?4xCFw+BSx9UAYENAStQK4EZGBGTAJJloQ8KKIN1jCGVOhozqmyZCI4KlTSBH?=
 =?us-ascii?q?IRogWg8gVlwFYMiE0AZD1aNYoNrhRPCfiQ1AgEIAy8BAQcCBw4DC4FokACBf?=
 =?us-ascii?q?QEB?=
IronPort-Data: A9a23:FjQttKyOHN5sJHsW8vF6t+dmxyrEfRIJ4+MujC+fZmUNrF6WrkVRy
 2dKC2CAafeOYzDxKNB/Oo/i/RsAvMTUztU2Hgs++FhgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCea/VH1buSJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 4+aT/H3Ygf/hWYqazhMsspvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJEQpBIg42L9lOHlL7
 scCLzEhPh+NpP3jldpXSsE07igiBNPgMIVavjRryivUSK53B5vCWK7No9Rf2V/chOgXQq2YP
 JVfM2cyKk2cPXWjOX9PYH46tO6znnDldjRCgFmUvqEwpWPUyWSd1ZCxYIeMIILbHJs9ckCwj
 T/B+Un2LzIma/eVx2Cu1Wie3ODhknauMG4VPPjinhJwu3WU3mEVBRgcWFe3rPX8gUmkVvpbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJKGOE8rQXIwa3O7kPBVy4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rEnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:5irozarZsBa0B7OKeAV+1UkaV5rzeYIsimQD101hICG9vPb2qy
 nIpoV96faaslcssR0b9OxofZPwI080lqQFhbX5X43DYOCOggLBR+tfBMnZsljd8kbFmNK1u5
 0NT0FWMqyXMbEDt7eY3CCIV/A93dKA7Kekwc3az3trUEVWTpsI1XYBNu5eeXcGPzWvwvECZe
 Kh2vY=
X-Talos-CUID: 9a23:8pXcJG3HKYBLo1LRg8llGLxfH98cd13/lWXpO0qjMnxuSZHFRlGz5/Yx
X-Talos-MUID: 9a23:mAGrHAqHA64b6WHeLQwezxo/M8FF7ImNNB8mm5tckO6eB3Z/FTjI2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.24,200,1774310400"; 
   d="scan'208";a="485126916"
Received: from rcdn-l-core-09.cisco.com ([173.37.255.146])
  by rcdn-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 12 Jun 2026 12:18:25 +0000
Received: from sjc-ads-20495.cisco.com (sjc-ads-20495.cisco.com [171.70.188.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-09.cisco.com (Postfix) with ESMTPS id 24AC518000233;
	Fri, 12 Jun 2026 12:18:25 +0000 (GMT)
Received: by sjc-ads-20495.cisco.com (Postfix, from userid 1877012)
	id 9DD99CBF202; Fri, 12 Jun 2026 05:18:24 -0700 (PDT)
From: "Ashishkumar Parmar X (asparmar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <asparmar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Ashishkumar Parmar <asparmar@cisco.com>
Subject: [OE-core][scarthgap][PATCH 2/3] qemu: Fix CVE-2026-0665
Date: Fri, 12 Jun 2026 05:18:16 -0700
Message-ID: <20260612121820.2298565-2-asparmar@cisco.com>
X-Mailer: git-send-email 2.44.1
In-Reply-To: <20260612121820.2298565-1-asparmar@cisco.com>
References: <20260612121820.2298565-1-asparmar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-20495.cisco.com [171.70.188.248];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.188.248, sjc-ads-20495.cisco.com
X-Outbound-Node: rcdn-l-core-09.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jun 2026 12:18:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238612

From: Ashishkumar Parmar <asparmar@cisco.com>

This patch applies the upstream v10.0.8 stable backport for
CVE-2026-0665. The upstream fix commit is referenced in [1],
and the public CVE advisory is referenced in [2]. The individual
backported commit links are recorded in the embedded patch headers
when the fix expands to multiple commits.

[1] https://gitlab.com/qemu-project/qemu/-/commit/4ba877461e6b1a8637b15ff1a8c77ba97639c927
[2] https://access.redhat.com/security/cve/CVE-2026-0665

Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2026-0665.patch             | 38 +++++++++++++++++++
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2026-0665.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 26d10991a7..3b5146e981 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -47,6 +47,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://0002-python-backport-avoid-creating-additional-event-loop.patch \
            file://CVE-2025-14876_p1.patch \
            file://CVE-2025-14876_p2.patch \
+           file://CVE-2026-0665.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2026-0665.patch b/meta/recipes-devtools/qemu/qemu/CVE-2026-0665.patch
new file mode 100644
index 0000000000..9264ba38cc
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2026-0665.patch
@@ -0,0 +1,38 @@
+From 91e98ce0a879010ef5b5ab5778cc71c0e9e92a57 Mon Sep 17 00:00:00 2001
+From: Vulnerability Report <vr@darknavy.com>
+Date: Fri, 9 Jan 2026 10:35:48 +0800
+Subject: [PATCH] hw/i386/kvm: fix PIRQ bounds check in xen_physdev_map_pirq()
+
+Reject pirq == s->nr_pirqs in xen_physdev_map_pirq().
+
+CVE: CVE-2026-0665
+Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit/4ba877461e6b1a8637b15ff1a8c77ba97639c927]
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
+(cherry picked from commit 4ba877461e6b1a8637b15ff1a8c77ba97639c927)
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ hw/i386/kvm/xen_evtchn.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/hw/i386/kvm/xen_evtchn.c b/hw/i386/kvm/xen_evtchn.c
+index 02b8cbf8d..5a1ad3782 100644
+--- a/hw/i386/kvm/xen_evtchn.c
++++ b/hw/i386/kvm/xen_evtchn.c
+@@ -1843,7 +1843,7 @@ int xen_physdev_map_pirq(struct physdev_map_pirq *map)
+             return pirq;
+         }
+         map->pirq = pirq;
+-    } else if (pirq > s->nr_pirqs) {
++    } else if (pirq >= s->nr_pirqs) {
+         return -EINVAL;
+     } else {
+         /*
-- 
2.44.1


