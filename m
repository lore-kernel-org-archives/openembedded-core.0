Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63D1ACA0FF9
	for <webhook@archiver.kernel.org>; Fri, 29 Aug 2025 12:51:51 +0000 (UTC)
Received: from alln-iport-6.cisco.com (alln-iport-6.cisco.com [173.37.142.93])
 by mx.groups.io with SMTP id smtpd.web11.12771.1756471910797072578
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Aug 2025 05:51:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=aR8si42o;
 spf=pass (domain: cisco.com, ip: 173.37.142.93, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2924; q=dns/txt;
  s=iport01; t=1756471910; x=1757681510;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=X8GeoFKRaX9V2zo3DRGnZefK8KbuwpfmJW34oM4wH+w=;
  b=aR8si42oME+oR1MmVi/z42Uz20atX1vSoyJPmdu3cozmyB93oQRoZlKQ
   gmtJagHV3vhk2e2tRSfs8RmoukO4Rj9BNdWMp7DSAhzTc4A8FAIGymFjf
   rimkm86vW+GMLAdw400chI/72ZpJL8SojtbU2sE4XLG3cw5fDprkBPUJI
   qZTBA7pXKM9/EalrNp1H/QjHwCEQlAlsmoU3o1TXdRHMPk4/ho4Mns/AX
   4nDPupPH7hG+K+GrAoSlXApCdYVW4Z2Tn+UP6swvw/yXB9RWls+oCt+zK
   caN4WGsrEOUTqiW7kSaYbPfzoIj9JEmDDPJkZdsNciEPZ4oXGszfwdvhZ
   Q==;
X-CSE-ConnectionGUID: PFCW+FN3QD64z9EAgLI5Hg==
X-CSE-MsgGUID: k6q6t4DdSpeYcL7xnys2bQ==
X-IPAS-Result: =?us-ascii?q?A0AUAABFobFo/4//Ja1aGwEBAgIBAQUBARQBAQMDAQGCA?=
 =?us-ascii?q?AYBAQwBgkZ6WkJJjHCGZAGCcGyXU4VegX8PAQEBDz0UBAEBhQeMJwImNAkOA?=
 =?us-ascii?q?QIEAQEBAQMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBBwWBDhOGTw2GXTYBFDIwX?=
 =?us-ascii?q?ESDAgGCcgIBEbZPgiyBAYJP3VaBSQGBYItshWcnGxuBcoJQgTd2gmEDgiyFd?=
 =?us-ascii?q?wSCDRWBFoQOghYSgWKIG4J+h3BIgR4DWSwBVRMNCgsHBYFjAzUMCy4VbjIdg?=
 =?us-ascii?q?SeFDYQeK0+FAoRqJGsPBoEVg18Gg21AAwsYDUgRLDcUGwY+bgeUPoMuAVIGC?=
 =?us-ascii?q?hgJCgEpAQEUDIFtapJGJJI/oQ4KKIN0jB6VORozhVulEC6HZRaQXY4IlTRMU?=
 =?us-ascii?q?IRpgWg8gVlwFTuCZwlJGQ+OX4hVUbZWIzUCOgIHCwEBAwmTZwEB?=
IronPort-Data: A9a23:vJC5AKCe9WXsNhVW/3jiw5YqxClBgxIJ4kV8jS/XYbTApDghgmcCm
 mIfUTvTP/2LZ2XxLdkkbN+ypxgEuJDQydAyOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGdIZuCCaF/H9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357gU2thh
 fuo+5eCYA//i2YvWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TE+9tFMwIYG9Yh1rgrEzBj3
 PM8CW0tYUXW7w626OrTpuhEnM8vKozveYgYoHwllW+fBvc9SpeFSKLPjTNa9G5v3YYVQrCEO
 pdfMGY0BPjDS0Un1lM/BJ8zhu60hn7XeDxDo1XTrq0yi4TW5FEqj+Sxb4CNK7RmQ+1WwF/Gu
 j7q81/hDyAREIOPzyueqHiV07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR6wpuO0okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflgQXV9wVF6gx7xuAj/KKpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOT9pa61nltMkQ6PBA==
IronPort-HdrOrdr: A9a23:uWcMeqENHBW6aoSNpLqE48eALOsnbusQ8zAXPo5KJiC9Ffbo8v
 xG88576faZslsssRIb6LK90cu7IU80nKQdieJ6AV7IZmfbUQWTQL2KlbGSoAEJ30bFh4lgPW
 AKSdkbNOHN
X-Talos-CUID: 9a23:9viLFWBfc4b1fC36ExFJ33FXNOZ+S1GDkGWBDma3LUc0aLLAHA==
X-Talos-MUID: 9a23:mv3TEwoa76AX2TBuqWsezzI8LZl0v4iiM1gAoJ4i5NmCJDcqMQ7I2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.18,221,1751241600"; 
   d="scan'208";a="537447209"
Received: from rcdn-l-core-06.cisco.com ([173.37.255.143])
  by alln-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 29 Aug 2025 12:51:50 +0000
Received: from sjc-ads-5834.cisco.com (sjc-ads-5834.cisco.com [171.68.197.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-06.cisco.com (Postfix) with ESMTPS id D6CCB18000251;
	Fri, 29 Aug 2025 12:51:49 +0000 (GMT)
Received: by sjc-ads-5834.cisco.com (Postfix, from userid 1795984)
	id 8570CCC128E; Fri, 29 Aug 2025 05:51:49 -0700 (PDT)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: vchavda@cisco.com
Subject: [OE-core] [walnascar] [PATCH] default-distrovars.inc: Fix CONNECTIVITY_CHECK_URIS redirect issue
Date: Fri, 29 Aug 2025 05:51:19 -0700
Message-ID: <20250829125136.401179-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.44.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.68.197.49, sjc-ads-5834.cisco.com
X-Outbound-Node: rcdn-l-core-06.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Aug 2025 12:51:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222613

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
index 85835c4c61..1eb39316cc 100644
--- a/meta/conf/distro/include/default-distrovars.inc
+++ b/meta/conf/distro/include/default-distrovars.inc
@@ -62,4 +62,4 @@ KERNEL_IMAGETYPES ??= "${KERNEL_IMAGETYPE}"
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
2.35.6


