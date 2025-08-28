Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FDFFC8303F
	for <webhook@archiver.kernel.org>; Thu, 28 Aug 2025 10:56:24 +0000 (UTC)
Received: from alln-iport-5.cisco.com (alln-iport-5.cisco.com [173.37.142.92])
 by mx.groups.io with SMTP id smtpd.web11.18019.1756378580265833558
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Aug 2025 03:56:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=ew1pn5/J;
 spf=pass (domain: cisco.com, ip: 173.37.142.92, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2714; q=dns/txt;
  s=iport01; t=1756378580; x=1757588180;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=eO2s9pZqLIE7zft3gr3lUXIp/73kHFB4BF+f0bQeIEw=;
  b=ew1pn5/J3c/FrEIVK2nrG/ens/Fv/jq9C0M2/X8WDsYcn2+4URpDqeqS
   gvmv/RQZ8C0NtVTVlsz0hAQYt9UabXyFGa88XOZjX9ywuKlbRDu3O3QwL
   QMf/9OiAmZZVdYkfG4juETjJ4wpwrhBNAtJp9V1w8ynSH7mshYTaD0HHV
   w3q1b54gGqTtbSK4+ybNqNMuFxJC39nXY0j8KZIpz5xQE0I5YyRObfCBd
   mJeRDagTm5V+FP6IFqsrF3Vr7DFauCByM8KJox8BaP00k/PGySZhLilFD
   S7HmhmfJtdaHOvfmhTLBNS42SCOA/Qca8qfQQYR+BCtshXy+sjKSMRDBX
   w==;
X-CSE-ConnectionGUID: VSE1E71xRQuWlGSYlEz8Og==
X-CSE-MsgGUID: Kr5c38q0RZ6A+BCNWMW2rw==
X-IPAS-Result: =?us-ascii?q?A0AHAABmNbBo/47/Ja1aGgEBAwMBAQMBARYBAQICAQGCA?=
 =?us-ascii?q?QUBAQ0BgkZ6WkJJk1QBgnCYP4VegX8PAQEBDz0UBAEBhQeMJwImNAkOAQIEA?=
 =?us-ascii?q?QEBAQMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBBwWBDhOGTw2GXTYBFDIwXESDA?=
 =?us-ascii?q?gGCcgIBEbkFgiyBAYJP3VaBSQGBYItshWcnGxuBcoJQgTd2gmEDgiyFdwSCD?=
 =?us-ascii?q?RWBFoQOghYSgWKIG4MAh1ZIgR4DWSwBVRMNCgsHBYFjAzUMCy4VbjIdgSeFD?=
 =?us-ascii?q?YQeK0+FAoRqJGsPBoEVg18GgzhAAwsYDUgRLDcUGwY+bgeUI4MuAVIGChgJC?=
 =?us-ascii?q?gEpAQEUDIFtapJGJJI/oQ4KKIN0jB6VORozhVulEC6HZRaQXY4IlTRMUIRpg?=
 =?us-ascii?q?Wg8gVlwFTuCZwlJGQ+OX4hVUbRfIzUCOgIHCwEBAwmTZwEB?=
IronPort-Data: A9a23:hYYQAq1qszhuRGFpNPbD5YJwkn2cJEfYwER7XKvMYLTBsI5bp2ZUy
 TYaUGuPPv6KNGCnftFyPo60pExQvcKGyddlGwBo3Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yFjmG4E70aNANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXU6
 bsen+WFYAX4g24ubTpPg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGMnobZKBHo/ZNOHxx8
 dMjGTQgfECkiLfjqF67YrEEasULNsLnOsYb/3pn1zycVatgSpHYSKKM7thdtNsyrpkRRrCFO
 IxDNGcpNUiaC/FMEg9/5JYWkOqlnHDjczpwo1OOrq1x6G/WpOB0+OW2YIuKK43bG625mG67v
 D/NpDTgWisoavXc4xGjzVeT3PXQyHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rbyyjVSzc9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc8BbH+t/7ESGzbDZpl7EQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSv1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:Sr/yAaG+xzvYQ/D2pLqE48eALOsnbusQ8zAXPo5KJiC9Ffbo8v
 xG88576faZslsssRIb6LK90de7IU80nKQdieJ6AV7IZmfbUQWTQL2KlbGSoAEJ30bFh4lgPW
 AKSdkbNOHN
X-Talos-CUID: 9a23:p+hXUWyaEL91IEIXqZAABgUqIe18XyKE3E3pPnC8Jl1YTJCHGXifrfY=
X-Talos-MUID: 9a23:zeU26wY/AQYAs+BTlCWxj2oyLZ9S0fqHS2omt6ojhJOeKnkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.18,217,1751241600"; 
   d="scan'208";a="538979996"
Received: from rcdn-l-core-05.cisco.com ([173.37.255.142])
  by alln-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 28 Aug 2025 10:56:19 +0000
Received: from sjc-ads-5834.cisco.com (sjc-ads-5834.cisco.com [171.68.197.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-05.cisco.com (Postfix) with ESMTPS id 33B5B18000223;
	Thu, 28 Aug 2025 10:56:19 +0000 (GMT)
Received: by sjc-ads-5834.cisco.com (Postfix, from userid 1795984)
	id CC0B2CC128E; Thu, 28 Aug 2025 03:56:18 -0700 (PDT)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: vchavda@cisco.com
Subject: [OE-core] [master] [PATCH] default-distrovars.inc: Fix CONNECTIVITY_CHECK_URIS redirect issue
Date: Thu, 28 Aug 2025 03:56:09 -0700
Message-Id: <20250828105609.1118506-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.68.197.49, sjc-ads-5834.cisco.com
X-Outbound-Node: rcdn-l-core-05.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Aug 2025 10:56:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222559

From: Deepak Rathore <deeratho@cisco.com>

The default CONNECTIVITY_CHECK_URIS uses "https://yoctoproject.org/connectivity.html"
which redirect to "https://www.yoctoproject.org/connectivity.html".

Some network configurations with proxies or restricted internet access
don't handle HTTP redirects properly during the sanity check phase,
causing build failures with:

ERROR:  OE-core's config sanity checker detected a potential misconfiguration.
Either fix the cause of this error or at your own risk disable the checker (see sanity.conf).
Following is the list of potential problems / advisories:

Fetcher failure for URL: 'https://yoctoproject.org/connectivity.html'. URL doesn't work.

Updated the default URL to use the final destination directly to avoid
redirect-related connectivity check failures.

Also updated SDK test cases in https.py to use the corrected URL for
consistency.

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 meta/conf/distro/include/default-distrovars.inc | 2 +-
 meta/lib/oeqa/buildtools/cases/https.py         | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
index 9ea3b5414c..bbd936efa6 100644
--- a/meta/conf/distro/include/default-distrovars.inc
+++ b/meta/conf/distro/include/default-distrovars.inc
@@ -63,4 +63,4 @@ KERNEL_IMAGETYPES ??= "${KERNEL_IMAGETYPE}"
 # fetch from the network (and warn you if not). To disable the test set
 # the variable to be empty.
 # Git example url: git://git.yoctoproject.org/yocto-firewall-test;protocol=git;rev=master;branch=master
-CONNECTIVITY_CHECK_URIS ?= "https://yoctoproject.org/connectivity.html"
+CONNECTIVITY_CHECK_URIS ?= "https://www.yoctoproject.org/connectivity.html"
diff --git a/meta/lib/oeqa/buildtools/cases/https.py b/meta/lib/oeqa/buildtools/cases/https.py
index 4525e3d758..98f27e5994 100644
--- a/meta/lib/oeqa/buildtools/cases/https.py
+++ b/meta/lib/oeqa/buildtools/cases/https.py
@@ -15,8 +15,8 @@ class HTTPTests(OESDKTestCase):
     """
 
     def test_wget(self):
-        self._run('env -i wget --debug --output-document /dev/null https://yoctoproject.org/connectivity.html')
+        self._run('env -i wget --debug --output-document /dev/null https://www.yoctoproject.org/connectivity.html')
 
     def test_python(self):
         # urlopen() returns a file-like object on success and throws an exception otherwise
-        self._run('python3 -c \'import urllib.request; urllib.request.urlopen("https://yoctoproject.org/connectivity.html")\'')
+        self._run('python3 -c \'import urllib.request; urllib.request.urlopen("https://www.yoctoproject.org/connectivity.html")\'')
-- 
2.35.6


