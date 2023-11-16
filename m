Return-Path: <meenali.gupta@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38B64C197A0
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 10:39:07 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.4113.1700131144540210354
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Nov 2023 02:39:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=aYG2xDNN;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9684df30ff=meenali.gupta@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3AGAA2xS010735
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Nov 2023 02:39:04 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=XX6hB
	Z0RWRL+0mmfvg7XflqHLZw9hFWKSQkbGtgnnoI=; b=aYG2xDNNkzO3U0zPEPkXC
	/ZvNvZhSS9DDKJDJs9LcAU50EEzXOfvqCg+fQtIo8hMUWMAOydNnNEP1oPC5FTap
	MadphYWAZdaomRemVZ8E7SJ1CNhcK0qxv0DIfvIfFzOiwyJNxOYhSugw9XGWSFEt
	zk1caCvoyzffldFbxDhMmnobIuT6hRwwQIanVPu5HKkSq0SHCNY2NhvaNAM5tdDm
	d9DCBtsiSahTfLEgBt+OWcWZz+tymsPGuCZGht5JCzGAAyhfuPdFusjT6mlk6kT1
	rVTHOZxurGKqHtyfkdOsFVLqVSrU/+SoL0pITD0XxmpNN+e1vBhfqXKa1SPT6CeM
	g==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3uaa0kmjhs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Nov 2023 02:39:04 -0800 (PST)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 16 Nov 2023 02:39:07 -0800
From: mgupta1 <meenali.gupta@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][kirkstone][mickledore][PATCH 3/5] avahi: fix CVE-2023-38469
Date: Thu, 16 Nov 2023 10:38:42 +0000
Message-ID: <20231116103842.848601-1-meenali.gupta@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: k_FzjKk0EPREfgQWKcRUjdIgWza4YGOg
X-Proofpoint-GUID: k_FzjKk0EPREfgQWKcRUjdIgWza4YGOg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_09,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 mlxlogscore=972 lowpriorityscore=0 adultscore=0 mlxscore=0
 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311060001 definitions=main-2311160084
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Nov 2023 10:39:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190773

From: Meenali Gupta <meenali.gupta@windriver.com>

A vulnerability was found in Avahi, where a reachable assertion
exists in avahi_dns_packet_append_record.

Signed-off-by: Meenali Gupta <meenali.gupta@windriver.com>
---
 meta/recipes-connectivity/avahi/avahi_0.8.bb  |  1 +
 .../avahi/files/CVE-2023-38469.patch          | 47 +++++++++++++++++++
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2023-38469.patch

diff --git a/meta/recipes-connectivity/avahi/avahi_0.8.bb b/meta/recipes-connectivity/avahi/avahi_0.8.bb
index a2ad9058d6..c733f94e42 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.8.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.8.bb
@@ -28,6 +28,7 @@ SRC_URI = "https://github.com/lathiat/avahi/releases/download/v${PV}/avahi-${PV}
            file://local-ping.patch \
            file://CVE-2023-38471.patch \
            file://CVE-2023-38470.patch \
+           file://CVE-2023-38469.patch \
            "
 
 UPSTREAM_CHECK_URI = "https://github.com/lathiat/avahi/releases/"
diff --git a/meta/recipes-connectivity/avahi/files/CVE-2023-38469.patch b/meta/recipes-connectivity/avahi/files/CVE-2023-38469.patch
new file mode 100644
index 0000000000..f0f6c4bf7b
--- /dev/null
+++ b/meta/recipes-connectivity/avahi/files/CVE-2023-38469.patch
@@ -0,0 +1,47 @@
+From a337a1ba7d15853fb56deef1f464529af6e3a1cf Mon Sep 17 00:00:00 2001
+From: Evgeny Vereshchagin <evvers@ya.ru>
+Date: Mon, 23 Oct 2023 20:29:31 +0000
+Subject: [PATCH]core: reject overly long TXT resource records
+Closes https://github.com/lathiat/avahi/issues/455
+
+Upstream-Status: Backport [https://github.com/lathiat/avahi/pull/500/commits/a337a1ba7d15853fb56deef1f464529af6e3a1cf]
+CVE: CVE-2023-38469
+
+Signed-off-by: Meenali Gupta <meenali.gupta@windriver.com>
+---
+ avahi-core/rr.c | 9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/avahi-core/rr.c b/avahi-core/rr.c
+index 7fa0bee..b03a24c 100644
+--- a/avahi-core/rr.c
++++ b/avahi-core/rr.c
+@@ -32,6 +32,7 @@
+ #include <avahi-common/malloc.h>
+ #include <avahi-common/defs.h>
+
++#include "dns.h"
+ #include "rr.h"
+ #include "log.h"
+ #include "util.h"
+@@ -688,11 +689,17 @@ int avahi_record_is_valid(AvahiRecord *r) {
+         case AVAHI_DNS_TYPE_TXT: {
+
+             AvahiStringList *strlst;
++            size_t used = 0;
+
+-            for (strlst = r->data.txt.string_list; strlst; strlst = strlst->next)
++            for (strlst = r->data.txt.string_list; strlst; strlst = strlst->next) {
+                 if (strlst->size > 255 || strlst->size <= 0)
+                     return 0;
+
++                used += 1+strlst->size;
++                if (used > AVAHI_DNS_RDATA_MAX)
++                    return 0;
++            }
++
+             return 1;
+         }
+     }
+--
+2.40.0
-- 
2.40.0


