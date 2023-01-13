Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5EBAC54EBD
	for <webhook@archiver.kernel.org>; Fri, 13 Jan 2023 13:51:25 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web10.86434.1673617881636079741
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Jan 2023 05:51:21 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=O5cgXFJq;
 spf=pass (domain: intel.com, ip: 134.134.136.24, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673617881; x=1705153881;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=4PQcZZMOZLJZH9xguV5Cl/wUZnvjZl/ZhHHR0ZfrxpA=;
  b=O5cgXFJq0tKeNqXok6zsPWuqRlWc8Zu/ecBOIWdJIrgys+TEvz2Fmt4M
   RH2AFwXK6iYNfmwV4pc7+Z2BwSxa6fpd83R1WT+1gBogHIlRxls4y3hHy
   AbS6nsWFrWjm2nQ8z5hgse+rc3PtCUsneUxBOvFizORrkvAFp3G2GEtPZ
   0Rg9ibpc2vRm/1EUQIUcN9kG6p9aQftZETrgd84Vq4BU3+9UNhASLdoH+
   n/TbDm4XiAtrssVy+AuMWyWlMdyFn5gOBvssSrJVlLo5tTvizCQl9yDid
   tDPaMkdBIHRBdDXJlFaZHxYEwbuKUxP35DpFk6zSMLXw05TM9IIfM5wEt
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10589"; a="325252020"
X-IronPort-AV: E=Sophos;i="5.97,214,1669104000"; 
   d="scan'208";a="325252020"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2023 05:51:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10589"; a="658228124"
X-IronPort-AV: E=Sophos;i="5.97,214,1669104000"; 
   d="scan'208";a="658228124"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by orsmga002.jf.intel.com with ESMTP; 13 Jan 2023 05:51:19 -0800
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [master][langdale][kirkstone][patch] ppp: fix CVE-2022-4603
Date: Fri, 13 Jan 2023 21:51:12 +0800
Message-Id: <20230113135112.2848659-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Jan 2023 13:51:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175826

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../ppp/ppp/CVE-2022-4603.patch               | 50 +++++++++++++++++++
 meta/recipes-connectivity/ppp/ppp_2.4.9.bb    |  1 +
 2 files changed, 51 insertions(+)
 create mode 100644 meta/recipes-connectivity/ppp/ppp/CVE-2022-4603.patch

diff --git a/meta/recipes-connectivity/ppp/ppp/CVE-2022-4603.patch b/meta/recipes-connectivity/ppp/ppp/CVE-2022-4603.patch
new file mode 100644
index 0000000000..2b63422cc1
--- /dev/null
+++ b/meta/recipes-connectivity/ppp/ppp/CVE-2022-4603.patch
@@ -0,0 +1,50 @@
+From a75fb7b198eed50d769c80c36629f38346882cbf Mon Sep 17 00:00:00 2001
+From: Paul Mackerras <paulus@ozlabs.org>
+Date: Thu, 4 Aug 2022 12:23:08 +1000
+Subject: [PATCH] pppdump: Avoid out-of-range access to packet buffer
+
+This fixes a potential vulnerability where data is written to spkt.buf
+and rpkt.buf without a check on the array index.  To fix this, we
+check the array index (pkt->cnt) before storing the byte or
+incrementing the count.  This also means we no longer have a potential
+signed integer overflow on the increment of pkt->cnt.
+
+Fortunately, pppdump is not used in the normal process of setting up a
+PPP connection, is not installed setuid-root, and is not invoked
+automatically in any scenario that I am aware of.
+
+Signed-off-by: Paul Mackerras <paulus@ozlabs.org>
+
+CVE: CVE-2022-4603
+https://github.com/ppp-project/ppp/commit/a75fb7b198eed50d769c80c36629f38346882cbf
+Upstream-Status: Backport
+Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
+---
+ pppdump/pppdump.c | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/pppdump/pppdump.c b/pppdump/pppdump.c
+index 2b815fc9..b85a8627 100644
+--- a/pppdump/pppdump.c
++++ b/pppdump/pppdump.c
+@@ -297,6 +297,10 @@ dumpppp(f)
+ 			    printf("%s aborted packet:\n     ", dir);
+ 			    q = "    ";
+ 			}
++			if (pkt->cnt >= sizeof(pkt->buf)) {
++			    printf("%s over-long packet truncated:\n     ", dir);
++			    q = "    ";
++			}
+ 			nb = pkt->cnt;
+ 			p = pkt->buf;
+ 			pkt->cnt = 0;
+@@ -400,7 +404,8 @@ dumpppp(f)
+ 			c ^= 0x20;
+ 			pkt->esc = 0;
+ 		    }
+-		    pkt->buf[pkt->cnt++] = c;
++		    if (pkt->cnt < sizeof(pkt->buf))
++			pkt->buf[pkt->cnt++] = c;
+ 		    break;
+ 		}
+ 	    }
diff --git a/meta/recipes-connectivity/ppp/ppp_2.4.9.bb b/meta/recipes-connectivity/ppp/ppp_2.4.9.bb
index 700ece61dc..7e3ae43b58 100644
--- a/meta/recipes-connectivity/ppp/ppp_2.4.9.bb
+++ b/meta/recipes-connectivity/ppp/ppp_2.4.9.bb
@@ -25,6 +25,7 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/${BP}.tar.gz \
            file://provider \
            file://ppp@.service \
            file://0001-ppp-fix-build-against-5.15-headers.patch \
+           file://CVE-2022-4603.patch \
            "
 
 SRC_URI[sha256sum] = "f938b35eccde533ea800b15a7445b2f1137da7f88e32a16898d02dee8adc058d"
-- 
2.37.3


