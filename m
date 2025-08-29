Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63B32CA0FF0
	for <webhook@archiver.kernel.org>; Fri, 29 Aug 2025 12:52:51 +0000 (UTC)
Received: from alln-iport-1.cisco.com (alln-iport-1.cisco.com [173.37.142.88])
 by mx.groups.io with SMTP id smtpd.web10.12858.1756471962675303601
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Aug 2025 05:52:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=R1eRQlH4;
 spf=pass (domain: cisco.com, ip: 173.37.142.88, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2924; q=dns/txt;
  s=iport01; t=1756471962; x=1757681562;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=EI10VTBKO62UMlpqbxlOQk+kpFNKCR2IUA05CPYUEXw=;
  b=R1eRQlH4H4GGDl5D0/dlbewC6UQ87J5L//PpyekLiTgiiysNDjeVhtgQ
   eBhPOg6ZuVbs4nXK6nyymHQ5RZbzgSWJYcdRXuVC3Qq5OJhzrJgVafinO
   rMVsvbguKxoC6pA9OmnmS5+BfFlY7JrCOu1DDbjM3Xzih2DLgUwFvAnVh
   kKI59zyQmNgtFj7vZ4UPeZ5qaWykwy/2eIq+S4y1yPUjdJ/tnJjJxtHRp
   qquojTHT0cv/obfb3f6eH93GXnLFm3Ymx3p1JUqWnedkYnuLrBr3qFj0W
   0yaOsMUi/dKQCJTaBNuAzgFOceuQ+JHicCrHiNMvsHkNna/x9b/FE+vpt
   w==;
X-CSE-ConnectionGUID: YEO1pMzmSXCx2kedYkVCKA==
X-CSE-MsgGUID: 7bfHcaIeTuaBbBmRz92hvw==
X-IPAS-Result: =?us-ascii?q?A0A+AABFobFo/5H/Ja1aHAECAgEHARQBBAQBggAHAQwBg?=
 =?us-ascii?q?kZ6WkJJjHCGZAGCcGyXU4VegX8PAQEBDz0UBAEBhQeMJwImNAkOAQIEAQEBA?=
 =?us-ascii?q?QMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBBwWBDhOGTw2GXTYBFDIwXESDAgGCc?=
 =?us-ascii?q?gIBEbZPgiyBAYJP3VaBSQGBYItshWcnGxuBcoJQgTd2gmEDgiyFdwSCDRWBF?=
 =?us-ascii?q?oQOghYSgWKIG4J+h3BIgR4DWSwBVRMNCgsHBYFjAzUMCy4VbjIdgSeFDYQeK?=
 =?us-ascii?q?0+FAoRqJGsPBoEVg18Gg21AAwsYDUgRLDcUGwY+bgeUPoMuAVIGChgJCgEpA?=
 =?us-ascii?q?QEUDIFtapJGJJI/oQ4KKIN0jB6VORozhVulEC6HZRaQXY4IlTRMUIRpgWg8g?=
 =?us-ascii?q?VlwFTuCZwlJGQ+OX4hVUbZWIzUCOgIHCwEBAwmTZwEB?=
IronPort-Data: A9a23:ERaCLKzvFloY3LQHc3d6t+dmxyrEfRIJ4+MujC+fZmUNrF6WrkUAm
 msaWm+GbvmDNGGkKd91bY2x80wE7JLRmtNkSFZs+VhgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCea/FH0a+KJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 IOaT/H3Ygf/hmYkaDJMsMpvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJHAbGtQA3/RyOlFl5
 aYbJTw8bS6opMvjldpXSsE07igiBNPgMIVavjRryivUSK52B5vCWK7No9Rf2V/chOgXQq2YP
 JVfM2cyKk2cPnWjOX9PYH46tOuli2P2bz1fgFmUvqEwpWPUyWSd1ZCwbIGLJoTUGZU9ckCw+
 WjI32/wIxwmKdW1wxCAyGD93O/RgnauMG4VPPjinhJwu3WU3mEVBRgcWFe3rPX8gUmkVvpbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJKGOE8rQXIwa3O7kPBVi4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rEnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:ldjPs6kT0zYPNbStvvbhZx5Zg4zpDfIn3DAbv31ZSRFFG/FwWf
 rAoB19726QtN9/YhAdcLy7VZVoIkmsl6Kdg7NwAV7KZmCP0wGVxepZg7cKrQeNJ8SHzJ8/6U
 +lGJIOb+EZyjNB/KLH3DU=
X-Talos-CUID: 9a23:1F2QsmOzLpnQou5DaQRArVYxCMUeQlbNlnTdL367N01KYejA
X-Talos-MUID: 9a23:xmqJAwWGcFdYMmvq/GDmihFpPeZl37mnIkonlK8U6pOEKzMlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.18,221,1751241600"; 
   d="scan'208";a="543640648"
Received: from rcdn-l-core-08.cisco.com ([173.37.255.145])
  by alln-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 29 Aug 2025 12:52:41 +0000
Received: from sjc-ads-5834.cisco.com (sjc-ads-5834.cisco.com [171.68.197.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-08.cisco.com (Postfix) with ESMTPS id BCB3418000442;
	Fri, 29 Aug 2025 12:52:41 +0000 (GMT)
Received: by sjc-ads-5834.cisco.com (Postfix, from userid 1795984)
	id 61C9DCC128E; Fri, 29 Aug 2025 05:52:41 -0700 (PDT)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: vchavda@cisco.com
Subject: [OE-core] [kirkstone] [PATCH] default-distrovars.inc: Fix CONNECTIVITY_CHECK_URIS redirect issue
Date: Fri, 29 Aug 2025 05:52:12 -0700
Message-ID: <20250829125226.449515-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.44.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.68.197.49, sjc-ads-5834.cisco.com
X-Outbound-Node: rcdn-l-core-08.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Aug 2025 12:52:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222614

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
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 60cdf960a3560f391babd559737f1afb31fb2c5c)
Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 meta/conf/distro/include/default-distrovars.inc | 2 +-
 meta/lib/oeqa/sdk/buildtools-cases/https.py     | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
index 3edba1b6d0..4ed2121b04 100644
--- a/meta/conf/distro/include/default-distrovars.inc
+++ b/meta/conf/distro/include/default-distrovars.inc
@@ -52,4 +52,4 @@ KERNEL_IMAGETYPES ??= "${KERNEL_IMAGETYPE}"
 # fetch from the network (and warn you if not). To disable the test set
 # the variable to be empty.
 # Git example url: git://git.yoctoproject.org/yocto-firewall-test;protocol=git;rev=master;branch=master
-CONNECTIVITY_CHECK_URIS ?= "https://yoctoproject.org/connectivity.html"
+CONNECTIVITY_CHECK_URIS ?= "https://www.yoctoproject.org/connectivity.html"
diff --git a/meta/lib/oeqa/sdk/buildtools-cases/https.py b/meta/lib/oeqa/sdk/buildtools-cases/https.py
index 35e549eb40..828aaea55b 100644
--- a/meta/lib/oeqa/sdk/buildtools-cases/https.py
+++ b/meta/lib/oeqa/sdk/buildtools-cases/https.py
@@ -13,8 +13,8 @@ class HTTPTests(OESDKTestCase):
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


