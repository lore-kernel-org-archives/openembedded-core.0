Return-Path: <adongare@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D6BED730B0
	for <webhook@archiver.kernel.org>; Fri,  3 Apr 2026 07:15:21 +0000 (UTC)
Received: from alln-iport-3.cisco.com (alln-iport-3.cisco.com [173.37.142.90])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6546.1775200515031848424
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Apr 2026 00:15:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=eF5WNBP7;
 spf=pass (domain: cisco.com, ip: 173.37.142.90, mailfrom: adongare@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4610; q=dns/txt;
  s=iport01; t=1775200515; x=1776410115;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=QZ8a+2U2h+aOF5sqEMgKrCV95v+CwN4TAEYG9miMXok=;
  b=eF5WNBP7iV+hVDNvgJ3LrWlptDpR/7hAbeVvTb3kR4zhBFZn8gzEN9CY
   hNMHQDDA4uDIT31FSL8SQI8jKgBZ7Q7t2GjhpYuobBZlQDTSyKL72SxcZ
   vckkvc77ge6Lqs73yz/zF6LDGDTKqIHAdrN3FOBy5rlYrFVajShAAVkPF
   KBpJXgP7aNP7foGAfUn2SYO0KVcIYklb7JjeIMhu13kzod2BvXd/CM8gh
   FOccSVvOSdczNW3QSt6FQE0DO/vQU8O2fRMAee1MilR5TdRCIVv5ax+t8
   jAd+S++sTOHVNSm7dFgQRJtKDnGnl+plCCqAlPp1Dq6g4qCW9BEajcFai
   A==;
X-CSE-ConnectionGUID: twBr2qcnRQGMBPpFRcNsbA==
X-CSE-MsgGUID: zUVAkBu+TkmLwubLd9FLfA==
X-IPAS-Result: =?us-ascii?q?A0BNAgCjaM9p/4v/Ja1agjQQGoJTcV5DSZVfbItnkjaBf?=
 =?us-ascii?q?w8BAQEPRA0EAQGEQUaNLAImNAkOAQIEAQEBAQMCAwEBAQEBAQEBAQEBAQoBA?=
 =?us-ascii?q?QUBAQECAQcFgQ4Thk8NhloBAgEqCwEYAS0sAwECTwsjIYMCAYI6AzYDEbF8G?=
 =?us-ascii?q?jeBeTOBAYMoAT8CQ0+yKQ2CUgELFAGBOIU+gnmFI1sYAYR6JxsbgXKEfYEFg?=
 =?us-ascii?q?RpCAQGBJ4Z9BIIigQ6BYR6CGgaCTYlnSIEeA1ksAVUTDQoLBwWBZgM1EioVb?=
 =?us-ascii?q?jIdgSM+F4EMGwcFgUuHGnRtgRODfF8DCxgNSBEsNxQbBD5uB4tNKII2gQQKA?=
 =?us-ascii?q?SuCOgOTAJJjoB1xCiiDdIwejz6FfBozqmsLmHuOCYQJkWpdhGiBaDyBRwsHc?=
 =?us-ascii?q?BWDIglJGQ+OLgoLg16Bf8RBJjICCTIBAQcCBw0DC4FokAACJgeBTgEB?=
IronPort-Data: A9a23:kDbZCKrUHHlkt8DZNYAa6+cptiReBmJfZBIvgKrLsJaIsI4StFCzt
 garIBmGP6vYZTb9c91ybNuw908DsJaEytE1GQI/rCw3HnwT9+PIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOWn9T8ghf/gqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgTNNwJcaDpOtfrf8Eg35ZwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86rIGaRpz6xE78FU7tJo56jGqE4aue60Tum1hK6b5Ofbi1q/UTe5EqU2M00Mi+7gx3R9zx4J
 U4kWZaYEW/FNYWU8AgRvoUx/yxWZcV7FLH7zXeXrdO51RffeH3W+tpLJnkuE7cT3P19KDQbn
 RAYAGhlghGrnem6xve/D+JrnMlmdJOtN4IEsXYmxjbcZRokacmcGOORupkCgWp235sfdRrdT
 5JxhT5HZRjHZRJGIFo/A5Mll+DujX76G9FdgA3P+ftpvTmIkWSd1pD/DeT8efaXBvlWm2KHu
 2ji8zXXJh8zYYn3JT2ttyjEavX0tSTjVYQfEbe1+vJnjBiYwXYeIBkXTkeg5/6hh0izXthSJ
 0AZ9mwpt6dayaCwZsP2Uxv9pDuPuQQRHoIKVeY78wqKjKHT5m51G1Q5c9KIU/R+3OdeeNDg/
 gXX9z81LVSDaIGodE8=
IronPort-HdrOrdr: A9a23:0JU00Kkpf8CrTEi8a2O7vtY37VbpDfIn3DAbv31ZSRFFG/FwWf
 rAoB19726QtN9/YhAdcLy7VZVoIkmsl6Kdg7NwAV7KZmCP0wGVxepZg7cKrQeNJ8SHzJ8/6U
 +lGJIOb+EZyjNB/KLH3DU=
X-Talos-CUID: 9a23:t6kXK2wZu6Vu1oE4+RFvBgUIBeo/KGTWyk3pDGqSMX5HcrazUlW5rfY=
X-Talos-MUID: 9a23:dEORrgWkGDmw2/rq/C3RuhhhHtor36erLF8Qm7EK6uegOwUlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,157,1770595200"; 
   d="scan'208";a="724966935"
Received: from rcdn-l-core-02.cisco.com ([173.37.255.139])
  by alln-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 03 Apr 2026 07:15:11 +0000
Received: from sjc-ads-10055.cisco.com (sjc-ads-10055.cisco.com [10.30.210.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-02.cisco.com (Postfix) with ESMTPS id 2AF17180007CF;
	Fri,  3 Apr 2026 07:15:11 +0000 (GMT)
Received: by sjc-ads-10055.cisco.com (Postfix, from userid 1870532)
	id C710CCC12A6; Fri,  3 Apr 2026 00:15:10 -0700 (PDT)
From: "Anil Dongare -X (adongare - E INFOCHIPS PRIVATE LIMITED at Cisco)" <adongare@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com, to@cisco.com,
	Anil Dongare <adongare@cisco.com>
Subject: [OE-core] [Scarthgap] [PATCH] nghttp2: Fix CVE-2026-27135
Date: Fri,  3 Apr 2026 00:14:56 -0700
Message-ID: <20260403071505.1406413-1-adongare@cisco.com>
X-Mailer: git-send-email 2.44.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 10.30.210.59, sjc-ads-10055.cisco.com
X-Outbound-Node: rcdn-l-core-02.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Apr 2026 07:15:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234558

From: Anil Dongare <adongare@cisco.com>

Pick patch from [1] also mentioned in [2]
[1] https://github.com/nghttp2/nghttp2/commit/5c7df8fa815ac1004d9ecb9d1f7595c4d37f46e1
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-27135

Signed-off-by: Anil Dongare <adongare@cisco.com>
---
 .../nghttp2/nghttp2/CVE-2026-27135.patch      | 110 ++++++++++++++++++
 .../recipes-support/nghttp2/nghttp2_1.61.0.bb |   4 +-
 2 files changed, 113 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/nghttp2/nghttp2/CVE-2026-27135.patch

diff --git a/meta/recipes-support/nghttp2/nghttp2/CVE-2026-27135.patch b/meta/recipes-support/nghttp2/nghttp2/CVE-2026-27135.patch
new file mode 100644
index 0000000000..c4977cded0
--- /dev/null
+++ b/meta/recipes-support/nghttp2/nghttp2/CVE-2026-27135.patch
@@ -0,0 +1,110 @@
+From f9812d447b14435de77751077ef48214ebf252ec Mon Sep 17 00:00:00 2001
+From: Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
+Date: Wed, 18 Feb 2026 18:04:30 +0900
+Subject: [PATCH] Fix missing iframe->state validations to avoid assertion
+ failure
+
+CVE: CVE-2026-27135
+Upstream-Status: Backport [https://github.com/nghttp2/nghttp2/commit/5c7df8fa815ac1004d9ecb9d1f7595c4d37f46e1]
+
+(cherry picked from commit 5c7df8fa815ac1004d9ecb9d1f7595c4d37f46e1)
+Signed-off-by: Anil Dongare <adongare@cisco.com>
+---
+ lib/nghttp2_session.c | 32 ++++++++++++++++++++++++++++++++
+ 1 file changed, 32 insertions(+)
+
+diff --git a/lib/nghttp2_session.c b/lib/nghttp2_session.c
+index 004a4dff..54312588 100644
+--- a/lib/nghttp2_session.c
++++ b/lib/nghttp2_session.c
+@@ -6079,6 +6079,10 @@ nghttp2_ssize nghttp2_session_mem_recv2(nghttp2_session *session,
+           return rv;
+         }
+ 
++        if (iframe->state == NGHTTP2_IB_IGN_ALL) {
++          return (nghttp2_ssize)inlen;
++        }
++
+         on_begin_frame_called = 1;
+ 
+         rv = session_process_headers_frame(session);
+@@ -6445,6 +6449,9 @@ nghttp2_ssize nghttp2_session_mem_recv2(nghttp2_session *session,
+           if (nghttp2_is_fatal(rv)) {
+             return rv;
+           }
++          if (iframe->state == NGHTTP2_IB_IGN_ALL) {
++            return (nghttp2_ssize)inlen;
++          }
+         }
+       }
+ 
+@@ -6701,6 +6708,10 @@ nghttp2_ssize nghttp2_session_mem_recv2(nghttp2_session *session,
+           return rv;
+         }
+ 
++        if (iframe->state == NGHTTP2_IB_IGN_ALL) {
++          return (nghttp2_ssize)inlen;
++        }
++
+         session_inbound_frame_reset(session);
+ 
+         break;
+@@ -7004,6 +7015,10 @@ nghttp2_ssize nghttp2_session_mem_recv2(nghttp2_session *session,
+         if (nghttp2_is_fatal(rv)) {
+           return rv;
+         }
++
++        if (iframe->state == NGHTTP2_IB_IGN_ALL) {
++          return (nghttp2_ssize)inlen;
++        }
+       } else {
+         iframe->state = NGHTTP2_IB_IGN_HEADER_BLOCK;
+       }
+@@ -7169,6 +7184,11 @@ nghttp2_ssize nghttp2_session_mem_recv2(nghttp2_session *session,
+             rv = session->callbacks.on_data_chunk_recv_callback(
+                 session, iframe->frame.hd.flags, iframe->frame.hd.stream_id,
+                 in - readlen, (size_t)data_readlen, session->user_data);
++
++            if (iframe->state == NGHTTP2_IB_IGN_ALL) {
++              return (nghttp2_ssize)inlen;
++            }
++
+             if (rv == NGHTTP2_ERR_PAUSE) {
+               return (nghttp2_ssize)(in - first);
+             }
+@@ -7256,6 +7276,10 @@ nghttp2_ssize nghttp2_session_mem_recv2(nghttp2_session *session,
+           return rv;
+         }
+ 
++        if (iframe->state == NGHTTP2_IB_IGN_ALL) {
++          return (nghttp2_ssize)inlen;
++        }
++
+         if (rv != 0) {
+           busy = 1;
+ 
+@@ -7274,6 +7298,10 @@ nghttp2_ssize nghttp2_session_mem_recv2(nghttp2_session *session,
+         return rv;
+       }
+ 
++      if (iframe->state == NGHTTP2_IB_IGN_ALL) {
++        return (nghttp2_ssize)inlen;
++      }
++
+       session_inbound_frame_reset(session);
+ 
+       break;
+@@ -7302,6 +7330,10 @@ nghttp2_ssize nghttp2_session_mem_recv2(nghttp2_session *session,
+         return rv;
+       }
+ 
++      if (iframe->state == NGHTTP2_IB_IGN_ALL) {
++        return (nghttp2_ssize)inlen;
++      }
++
+       session_inbound_frame_reset(session);
+ 
+       break;
+-- 
+2.43.7
+
diff --git a/meta/recipes-support/nghttp2/nghttp2_1.61.0.bb b/meta/recipes-support/nghttp2/nghttp2_1.61.0.bb
index ad85576dcb..ebba15db28 100644
--- a/meta/recipes-support/nghttp2/nghttp2_1.61.0.bb
+++ b/meta/recipes-support/nghttp2/nghttp2_1.61.0.bb
@@ -4,7 +4,9 @@ SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=764abdf30b2eadd37ce47dcbce0ea1ec"
 
-SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/nghttp2-${PV}.tar.xz"
+SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/nghttp2-${PV}.tar.xz \
+           file://CVE-2026-27135.patch \
+           "
 SRC_URI[sha256sum] = "c0e660175b9dc429f11d25b9507a834fb752eea9135ab420bb7cb7e9dbcc9654"
 
 inherit cmake manpages python3native github-releases
-- 
2.44.1


