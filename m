Received: from alln-iport-6.cisco.com (alln-iport-6.cisco.com [173.37.142.93])
 by mx.groups.io with SMTP id smtpd.web11.716.1602103136315256683
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Oct 2020 13:38:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cisco.com header.s=iport header.b=cI3aSsX/;
 spf=pass (domain: cisco.com, ip: 173.37.142.93, mailfrom: kamensky@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=1163; q=dns/txt; s=iport;
  t=1602103136; x=1603312736;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uiCgEe7+TfWt2LvBd6AunHS17Br6m3rOgoCrgeivX7g=;
  b=cI3aSsX/Gwnu39dyztMWsqyNIkGN3Wkm8/MzAx3duMGFPfldU/kCkFgF
   wp+1koLExFd21z0jSISvvNo/UyC+W8fs+sQ0/7OKB3wQ1zEHfVTa45c1o
   kyG1qNvM8UnxEM0p5Lq32j9GZBFHhCfGgyaZwviwk5SO6IjcVHLREbV6C
   I=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0A4BQDZJn5f/5hdJa1ghQJwVQEyLLI?=
 =?us-ascii?q?iCwEBAQ0BASMMBAEBhEoCggcCJTgTAgMBAQsBAQUBAQECAQYEbYVcDIVzBjI?=
 =?us-ascii?q?BRhBRVxmDJgGCfA+oRYIohVSFBwaBOIg0hH8bggCEX4JcBBeBDYEGhSoEkAu?=
 =?us-ascii?q?Cd4lUmwKCcoMUhWyGWop+DyKhLZ4KlSsCBAYFAhWBayOBV00jFYMkUBkNlyS?=
 =?us-ascii?q?FYiEDMAI1AgYKAQEDCYwCgkYBAQ?=
X-IronPort-AV: E=Sophos;i="5.77,348,1596499200"; 
   d="scan'208";a="591489764"
Received: from rcdn-core-1.cisco.com ([173.37.93.152])
  by alln-iport-6.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 07 Oct 2020 20:38:53 +0000
Received: from kamensky-p53s.cisco.com ([10.24.45.79])
	(authenticated bits=0)
	by rcdn-core-1.cisco.com (8.15.2/8.15.2) with ESMTPSA id 097Kceit028064
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 7 Oct 2020 20:38:52 GMT
From: "Victor Kamensky" <kamensky@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
        Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] qemumips: use 34Kf-64tlb CPU emulation
Date: Wed,  7 Oct 2020 13:38:38 -0700
Message-Id: <20201007203838.19096-3-kamensky@cisco.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20201007203838.19096-1-kamensky@cisco.com>
References: <20201007203838.19096-1-kamensky@cisco.com>
MIME-Version: 1.0
X-Authenticated-User: kamensky@cisco.com
X-Outbound-SMTP-Client: 10.24.45.79, [10.24.45.79]
X-Outbound-Node: rcdn-core-1.cisco.com
Content-Transfer-Encoding: 8bit

In order to improve performance of qemumips autobuilder
test runs, let's use 34Kf-64tlb cpu type that was introduced
in OE version of qemu. 34Kf-64tlb cpu type is identical to
34Kf but it has 64 TLBs configure vs original 16 TLBs.

The change in number of TLBs in emulated CPU reduces
TLB trash and reduces number of times TLB refill kernel
code runs, and therefore siginificantly improves tests
execution time.

Note 34Kf-64tlb qemu cpu type does not exist in upstream,
so far it is added as patch in OE. See qemu 34Kf-64tlb
cpu addition commit for more details.

Fixes https://bugzilla.yoctoproject.org/show_bug.cgi?id=13992

Signed-off-by: Victor Kamensky <kamensky@cisco.com>
---
 meta/conf/machine/qemumips.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/qemumips.conf b/meta/conf/machine/qemumips.conf
index 1373e4cba0..b8c80f02ef 100644
--- a/meta/conf/machine/qemumips.conf
+++ b/meta/conf/machine/qemumips.conf
@@ -15,4 +15,4 @@ SERIAL_CONSOLES ?= "115200;ttyS0 115200;ttyS1"
 
 QB_SYSTEM_NAME = "qemu-system-mips"
 
-QB_CPU = "-cpu 34Kf"
+QB_CPU = "-cpu 34Kf-64tlb"
-- 
2.14.5

