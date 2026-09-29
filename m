Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DF08C9832A
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 04:18:38 +0000 (UTC)
Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.653.1790655517589887211
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2026 21:18:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=P4LZhz7q;
 spf=pass (domain: cisco.com, ip: 173.37.86.76, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2630; q=dns/txt;
  s=iport01; t=1790655517; x=1791865117;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Irzb6BnMhyUaSd/FsqKyoJymq4yFwnaIxdyyK7fqSvY=;
  b=P4LZhz7qKhY3mqE4S+Q1ELz3zGXKZiB6+1LTgNDQLvb7HgnvuKnrDVaY
   Mah+VDJBt4vHC4d2uTVDKsMyhI/8VvtlBqBfSFD45sA3l1ipZDflKsoiJ
   tLU3sDtwGZNaTPEXcCZfZH8UToxr3Brk5jQC0Ve6zwMapER1u2qXm1+VD
   Bs+pQAIBSbX01/qdwJAtAmN1egnC8QJrCer9tPtH1Og1qocVMVt5CSFWV
   kQPv8bdhclIicVIbwScthNLhuo65rWPMz3U3Lb9+ez1nyyhgDTt+8NXL8
   iCbdqXOxvjBw/arvo/UTz05+YYRpGYrrVteQyVXpB3kRGd6n1qC+jJnpc
   Q==;
X-CSE-ConnectionGUID: SeGt2wOBTvOmBfwcQA3xwQ==
X-CSE-MsgGUID: F+8K8gO6QzGIuObUBEUmJQ==
X-IPAS-Result: =?us-ascii?q?A0BNAgDTOrtq/43/Ja1aglmCV3VhQkmWTZoWhASBfg8BA?=
 =?us-ascii?q?QEPRA0EAQGEP0YCjggCJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBAQECA?=
 =?us-ascii?q?QcFgQ4Thk8NkBIBAgEDJwsBGAEtEBwDAQIvKyMIGYMCAYJ0AgERwAmBeTOBA?=
 =?us-ascii?q?YMpAT8CQ1DbMgELFAEFgTOFQIgjXRgBhHwnGxuBcoEVg2mBBYFcAQECgiuFe?=
 =?us-ascii?q?ASCIoEMgVoekzhIgR4DWSwBVRMNCgsHBYFmAzUSKhVuMh2BIz4XgQcbBgWBH?=
 =?us-ascii?q?YEgghkjGTZ6gQlegSspYAEQF4EHggcCglSCAQIBSUMOB0VTCSVFEkcmIggSC?=
 =?us-ascii?q?QETGjALgSE4QQkoPxgNSBEsNxUZBD5uB5A/HoIYTYEOASoBpgGCIaEPCiiDd?=
 =?us-ascii?q?owilToaM6pvC5h9igspg1aWUIRpgWg8gUcLB3AVgyIJShkPjjmDa4F/gxTHJ?=
 =?us-ascii?q?iQ1AgkyAQEHAgcOAwuBaJF+AQE?=
IronPort-Data: A9a23:sxXCzK8Dsx+u4dL6SopzDrUD1n+TJUtcMsCJ2f8bNWPcYEJGY0x3n
 zROUW2HOPqCZ2Xwf9t+boi+905VvMCGn9I1TFNsqC1EQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmB4E/rbei5xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mtyyHjEAX9gWAsYzhEs/jrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2kNMKIEoPlQK11Q0
 vkyJi8GVznYl/2PlefTpulE3qzPLeHxN48Z/3UlxjbDALN+HdbIQr7B4plT2zJYasJmRKmFI
 ZFGL2AyMVKZP0Qn1lQ/UPrSmM+omnn2cDRCgFmUvqEwpWPUyWSd1ZCwaoqEKoPTFJ89ckCwi
 CGW3DT2JU8jJvO+1B2Pz1iBu+rtpHauMG4VPPjinhJwu3WU3mEVBRgcWFe3rPX8gUmkVvpbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJKGOE8rQXIwa3O7kPBWi4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rEnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:hYStgatCyw9pme57bh17SsT67skDrtV00zEX/kB9WHVpmwKj+P
 xG+85rsiMc5wxxZJhNo7290ey7MBHhHP1OkO0s1MmZPDUO0VHAROoJ0WKh+UyEJ8SUzIBgPM
 lbH5SWIeeAa2SS9fyKgzWQIpIH3MSN9ryuiKP1yndgShwvVoRbhj0Jczpy1iZNNXJ77V1TLu
 vl2vZ6
X-Talos-CUID: 9a23:wl6qyG9tlK/6QdSOD0eVv3UZNdx/bVr38Gn3JmW2Fm1QYeaFVmbFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3AuSGbmQxZ5QDNceWLwXp/kjkpn9maqIrtWGNdnrJ?=
 =?us-ascii?q?YgturFDFXMQq3oQmyYLZyfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,129,1787011200"; 
   d="scan'208";a="528987192"
Received: from rcdn-l-core-04.cisco.com ([173.37.255.141])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 29 Sep 2026 04:18:36 +0000
Received: from sjc-ads-4178.cisco.com (sjc-ads-4178.cisco.com [171.70.54.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-04.cisco.com (Postfix) with ESMTPS id B38831800018D;
	Tue, 29 Sep 2026 04:18:36 +0000 (GMT)
Received: by sjc-ads-4178.cisco.com (Postfix, from userid 1887505)
	id 5A9E2CC1279; Mon, 28 Sep 2026 21:18:36 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][scarthgap][PATCH 5/8] libxml2: Fix CVE-2026-86141
Date: Mon, 28 Sep 2026 21:18:33 -0700
Message-Id: <20260929041836.2217090-5-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260929041836.2217090-1-hthakar@cisco.com>
References: <20260929041836.2217090-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-4178.cisco.com [171.70.54.199];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.54.199, sjc-ads-4178.cisco.com
X-Outbound-Node: rcdn-l-core-04.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2026 04:18:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246812

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/GNOME/libxml2/commit/e89a8aae4c9b40cdafcf66b3f9e57c62db37bb55
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-86141

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../libxml/libxml2/CVE-2026-86141.patch       | 35 +++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.12.10.bb   |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-86141.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2026-86141.patch b/meta/recipes-core/libxml/libxml2/CVE-2026-86141.patch
new file mode 100644
index 0000000000..416a50eda5
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2026-86141.patch
@@ -0,0 +1,35 @@
+From adb9287ae35770d9b281ed8f2160774198fbaf25 Mon Sep 17 00:00:00 2001
+From: Daniel Garcia Moreno <daniel.garcia@suse.com>
+Date: Mon, 4 May 2026 07:56:18 +0200
+Subject: [PATCH] xmlregexp: Calc string length after null checking
+
+Fix https://gitlab.gnome.org/GNOME/libxml2/-/work_items/1107
+
+CVE: CVE-2026-86141
+Upstream-Status: Backport [https://github.com/GNOME/libxml2/commit/e89a8aae4c9b40cdafcf66b3f9e57c62db37bb55]
+
+(cherry picked from commit e89a8aae4c9b40cdafcf66b3f9e57c62db37bb55)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ xmlregexp.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/xmlregexp.c b/xmlregexp.c
+index 320a35ce..72e8e459 100644
+--- a/xmlregexp.c
++++ b/xmlregexp.c
+@@ -702,12 +702,12 @@ xmlRegNewParserCtxt(const xmlChar *string) {
+ 	return(NULL);
+     memset(ret, 0, sizeof(xmlRegParserCtxt));
+     if (string != NULL) {
+-	ret->string = xmlStrdup(string);
+-	ret->len = strlen((const char *) ret->string);
++        ret->string = xmlStrdup(string);
+         if (ret->string == NULL) {
+             xmlFree(ret);
+             return(NULL);
+         }
++        ret->len = strlen((const char *) ret->string);
+     }
+     ret->cur = ret->string;
+     ret->neg = 0;
diff --git a/meta/recipes-core/libxml/libxml2_2.12.10.bb b/meta/recipes-core/libxml/libxml2_2.12.10.bb
index 9648228c43..49a1a8dbaa 100644
--- a/meta/recipes-core/libxml/libxml2_2.12.10.bb
+++ b/meta/recipes-core/libxml/libxml2_2.12.10.bb
@@ -35,6 +35,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testt
            file://CVE-2026-86137.patch \
            file://CVE-2026-86138.patch \
            file://CVE-2026-86140.patch \
+           file://CVE-2026-86141.patch \
            "
 
 SRC_URI[archive.sha256sum] = "c3d8c0c34aa39098f66576fe51969db12a5100b956233dc56506f7a8679be995"
-- 
2.35.6


