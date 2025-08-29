Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78E8ACA0FF9
	for <webhook@archiver.kernel.org>; Fri, 29 Aug 2025 12:50:51 +0000 (UTC)
Received: from alln-iport-4.cisco.com (alln-iport-4.cisco.com [173.37.142.91])
 by mx.groups.io with SMTP id smtpd.web10.12824.1756471848332650922
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Aug 2025 05:50:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=IjpIANLZ;
 spf=pass (domain: cisco.com, ip: 173.37.142.91, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2924; q=dns/txt;
  s=iport01; t=1756471848; x=1757681448;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=kR5sVYyDzgH10hIlbOW9Esl0/vgI1HZRTsL8MT6/WpA=;
  b=IjpIANLZcsyFhwH7Bq1ZAbGC5oHs4eM9fZYJxLFeTaK+NMKbakvXyKyx
   a+qyIz5UiBiiXx78SV+9mwLOvC/FXw7ZMcD5Ahg/kiqQKUcYq8YulOrI8
   5XVSwTbhVPlmq4f0djyneacqJgkHjCFlY58dMreV2INekwrvjICX9I/cQ
   MBGLKcUZSV7NDu0J/qkdhwKCgVTxOFHgu160AuTqoHtS/sLar4sUIG9jG
   Tjez32ivyY68iveHEPVwI4RqbWZN/Gk5CY2ASVn1PvxcHaJ4Tgfb6u2Vo
   uLuUwRunivWFdp10yQ7AIlB7/cM6vvi1ESs+wW4ZBoGTV89ZebpMA0fxy
   Q==;
X-CSE-ConnectionGUID: xqW++WTVQXqDyG0o5y4GOg==
X-CSE-MsgGUID: ObjWIAaBSQyGw1DLlv00nw==
X-IPAS-Result: =?us-ascii?q?A0AUAADOoLFo/4r/Ja1aGwEBAgIBAQUBARQBAQMDAQGCA?=
 =?us-ascii?q?AYBAQwBgkZ6WkJJjHCGZAGCcGyXU4VegX8PAQEBDz0UBAEBhQeMJwImNAkOA?=
 =?us-ascii?q?QIEAQEBAQMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBBwWBDhOGTw2GXTYBFDIwX?=
 =?us-ascii?q?ESDAgGCcgIBEbZPgiyBAYJP3VaBSQGBYItshWcnGxuBcoJQgTd2gmEDgiyFd?=
 =?us-ascii?q?wSCDRWBFoQOghYSgWKIG4J+h3BIgR4DWSwBVRMNCgsHBYFjAzUMCy4VbjIdg?=
 =?us-ascii?q?SeFDYQeK0+FAoRqJGsPBoEVg18Gg21AAwsYDUgRLDcUGwY+bgeUPoMuAVIGC?=
 =?us-ascii?q?hgJCgEpAQEUDIFtapJGJJI/oQ4KKIN0jB6VORozhVulEC6HZRaQXY4IlTRMU?=
 =?us-ascii?q?IRpgWg8gVlwFTuCZwlJGQ+OX4hVUbZVIzUCOgIHCwEBAwmTZwEB?=
IronPort-Data: A9a23:tWkCn6JL/ee/FDb5FE+RgJQlxSXFcZb7ZxGr2PjKsXjdYENS1GAPm
 jdLWG2Pbv7bYGr9Kt90ao2xpBgAsMXTyN5rSwcd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZsCCWa/073WlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVrd0
 T/Oi5eHYgL9i2Qkajl8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN1+FX51frIkxN9HGE1f2
 qQfdSFRQTeM0rfeLLKTEoGAh+w5J8XteYdasXZ6wHSBVLAtQIvIROPB4towMDUY358VW62BI
 ZBENHw2N0Sojx5nYj/7DLoykeqyj2X/dBVTqUmeouw85G27IAlZjeO9aYqLK4LRLSlTtmGSp
 F3n1m3TOSgLG8PG5R6B7Cr0gPCayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PK+kEOWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0QdFcFag+rQqK0KeRu1/fDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9EBpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:guqzAaCvI5ncTuTlHemn55DYdb4zR+YMi2TDGXofdfUzSL38qy
 nAppUmPHPP5Qr5O0tQ++xoWpPhfZq0z/cciuMs1NyZMjUO1lHFEGgb1/qA/9UlcBeOkdK0Es
 xbAsxDNOE=
X-Talos-CUID: =?us-ascii?q?9a23=3AralUMWkqx/NGMUWHbWHCtJZGo5rXOW3E8zSTHHO?=
 =?us-ascii?q?GMFZwZKy6EVjN6f9LtMU7zg=3D=3D?=
X-Talos-MUID: 9a23:/CLkdAWUrBY+lZHq/Bjmhg5DHc5C2J2/J19UvbECpZHcMzMlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.18,221,1751241600"; 
   d="scan'208";a="538186963"
Received: from rcdn-l-core-01.cisco.com ([173.37.255.138])
  by alln-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 29 Aug 2025 12:50:47 +0000
Received: from sjc-ads-5834.cisco.com (sjc-ads-5834.cisco.com [171.68.197.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-01.cisco.com (Postfix) with ESMTPS id 61C53180001D3;
	Fri, 29 Aug 2025 12:50:47 +0000 (GMT)
Received: by sjc-ads-5834.cisco.com (Postfix, from userid 1795984)
	id 8EC9FCC128E; Fri, 29 Aug 2025 05:50:46 -0700 (PDT)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: vchavda@cisco.com
Subject: [OE-core] [scarthgap] [PATCH] default-distrovars.inc: Fix CONNECTIVITY_CHECK_URIS redirect issue
Date: Fri, 29 Aug 2025 05:50:22 -0700
Message-ID: <20250829125042.289719-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.44.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.68.197.49, sjc-ads-5834.cisco.com
X-Outbound-Node: rcdn-l-core-01.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Aug 2025 12:50:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222612

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
index 7554081e8b..42e6de216e 100644
--- a/meta/conf/distro/include/default-distrovars.inc
+++ b/meta/conf/distro/include/default-distrovars.inc
@@ -61,4 +61,4 @@ KERNEL_IMAGETYPES ??= "${KERNEL_IMAGETYPE}"
 # fetch from the network (and warn you if not). To disable the test set
 # the variable to be empty.
 # Git example url: git://git.yoctoproject.org/yocto-firewall-test;protocol=git;rev=master;branch=master
-CONNECTIVITY_CHECK_URIS ?= "https://yoctoproject.org/connectivity.html"
+CONNECTIVITY_CHECK_URIS ?= "https://www.yoctoproject.org/connectivity.html"
diff --git a/meta/lib/oeqa/sdk/buildtools-cases/https.py b/meta/lib/oeqa/sdk/buildtools-cases/https.py
index 4525e3d758..98f27e5994 100644
--- a/meta/lib/oeqa/sdk/buildtools-cases/https.py
+++ b/meta/lib/oeqa/sdk/buildtools-cases/https.py
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
2.44.3


