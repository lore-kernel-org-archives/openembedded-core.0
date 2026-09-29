Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E18CC9832A
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 04:18:50 +0000 (UTC)
Received: from rcdn-iport-3.cisco.com (rcdn-iport-3.cisco.com [173.37.86.74])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.660.1790655522216984856
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2026 21:18:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=IKnfeA/j;
 spf=pass (domain: cisco.com, ip: 173.37.86.74, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3193; q=dns/txt;
  s=iport01; t=1790655522; x=1791865122;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=c53GFlJDIxjeKyUO8bzux1Aex5TNBmjtdUZexmFqc4k=;
  b=IKnfeA/jNchUHlhO+FXqOKiivb86DEd6uUPJnfbNHSHzNhti8e+m5TJS
   dTYafaeoQjLmMloXecqO0y5ZoVRxKxdmSZ3qL5VZFUjFrwnVEoYFF+Fjy
   9tfnPwIfenISWLlq8RfU92zBwTNJlaZoH0Wc4IQCfV9jwhC0Z/MEF/Vwy
   DGr+/oiu1Up5vGOTQf0kq/Lo5LMbdkhQz5rKaAK4DFdgxGjXDQYJ9J4MQ
   wzfo3xiuE0hcYjpANbVEzEv/S4NU1BZdef5IRk3QOmrQ7VCdoP+223ztI
   nBpHJvubz2Mybt6pAQXcnaZ7z7muVnOfxuSQ+AHyEMfq6gDfQ5vC3TUAh
   g==;
X-CSE-ConnectionGUID: Lqz1uVEITBm64gWFSUphGw==
X-CSE-MsgGUID: tycRhCQ0SLiDGDaXG80wFg==
X-IPAS-Result: =?us-ascii?q?A0BIAgDEO7tq/4z/Ja1aHgEBCxIMggULgld1YUJJlk2LZ?=
 =?us-ascii?q?JI2gX4PAQEBD0QNBAEBhD9GAo4IAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKA?=
 =?us-ascii?q?QEFAQEBAgEHBYEOE4ZPDZASAQIBAycLARgBLRAcAwECLyALIwgZgwIBgjoDN?=
 =?us-ascii?q?wIBEcAEgXkzgQGDKQE/AkNQ2EsNgloBCxQBBYEzhUCCf4UkXRgBhHwnGxuBc?=
 =?us-ascii?q?oEVg2mBBYEaQgEBAogjBIIigQyBWh6TOEiBHgNZLAFVEw0KCwcFgWYDNRIqF?=
 =?us-ascii?q?W4yHYEjPheBBxsGBYEdgSCCGSMZNnqBCV6BKylgARAXgQeCBwKCVIIBAgFJQ?=
 =?us-ascii?q?w4HRVMJJUUSRyYiCBIJARMaMAuBIThBCSg/GA1IESw3FRkEPm4HkD8eghhNg?=
 =?us-ascii?q?Q4BKgGCTqMzgiGgHnEKKIN2jCKPPoV8GjOqbwuYfY4KhAmSR4RpgWg8gUcLB?=
 =?us-ascii?q?3AVgyIJShkPjjmDa4F/gxTHJiQ1AgkyAQEHAgcOAwuBaJF+AQE?=
IronPort-Data: A9a23:JVpxoqPIdvHMswbvrR3zlsFynXyQoLVcMsEvi/4bfWQNrUok1GMBy
 mRJCG7Xa62PMTCgft9wYYSy/EwOv8SBn4NqGXM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeap1yFjmD9k/F3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WVzlV
 e/a+ZWFZgf0gW4saAr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj69F3HhgrA6A5xsxyXz1By
 tIjFSgNQQ/W0opawJrjIgVtrt4oIM+uOMYUvWttiGmCS/0nWpvEBa7N4Le03h9p2ZsIRqmYP
 ZdEL2MzNHwsYDUXUrsTIJIinO6rj2PXeDxDo1XTrq0yi4TW5FErgeK0boCNKrRmQ+1Jj02ip
 kn/p1/dAz01GNWv5mrd7Vyj07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR6wpuO0okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflgQXV9wVF6gx7xuAj/KPpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOf9pa61nltMkQ6PBA==
IronPort-HdrOrdr: A9a23:j9uloq1xNG/UQF9HhCwNWAqjBGokLtp133Aq2lEZdPWaSKOlfq
 eV7ZMmPHDP6Qr5NEtMpTnEAtjjfZq+z+8Q3WBuB9eftWDd0QPCRr2Kr7GSpgEIcBeRygcy78
 tdmoFFebvN5CBB/KXHyTj9Nco8y9+a963tr+Lfw3BxCTxOUchbnn5E4sLxKDwMeOGAbqBJbK
 ah2g==
X-Talos-CUID: =?us-ascii?q?9a23=3AObrlgGh4Fy3dRoI4krx5PxMyMzJuVmTPlWruDm6?=
 =?us-ascii?q?EI2M3FLKqZ2St4KNLjJ87?=
X-Talos-MUID: 9a23:HuhprQmgU00Qq2Ihe1K+dnp+JcxS44+XUHspkLkpl8C0GnwoJBmS2WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,129,1787011200"; 
   d="scan'208";a="529216208"
Received: from rcdn-l-core-03.cisco.com ([173.37.255.140])
  by rcdn-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 29 Sep 2026 04:18:36 +0000
Received: from sjc-ads-4178.cisco.com (sjc-ads-4178.cisco.com [171.70.54.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-03.cisco.com (Postfix) with ESMTPS id B032C18000587;
	Tue, 29 Sep 2026 04:18:36 +0000 (GMT)
Received: by sjc-ads-4178.cisco.com (Postfix, from userid 1887505)
	id 56478CC1273; Mon, 28 Sep 2026 21:18:36 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][scarthgap][PATCH 4/8] libxml2: Fix CVE-2026-86140
Date: Mon, 28 Sep 2026 21:18:32 -0700
Message-Id: <20260929041836.2217090-4-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260929041836.2217090-1-hthakar@cisco.com>
References: <20260929041836.2217090-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-4178.cisco.com [171.70.54.199];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.54.199, sjc-ads-4178.cisco.com
X-Outbound-Node: rcdn-l-core-03.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2026 04:18:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246817

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/GNOME/libxml2/commit/d1686f91dbda141a752200419d35639fd6b38340
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-86140

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../libxml/libxml2/CVE-2026-86140.patch       | 56 +++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.12.10.bb   |  1 +
 2 files changed, 57 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-86140.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2026-86140.patch b/meta/recipes-core/libxml/libxml2/CVE-2026-86140.patch
new file mode 100644
index 0000000000..bc7e069b09
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2026-86140.patch
@@ -0,0 +1,56 @@
+From 7d324fcfa71e8567678ad254c0e10e509ebae99b Mon Sep 17 00:00:00 2001
+From: mohammadmseet-hue <mohammadmseet@gmail.com>
+Date: Thu, 16 Apr 2026 02:54:37 +0200
+Subject: [PATCH] fix: add bounds checks to xmlSnprintfElements in valid.c
+
+CVE-2025-24928 fixed xmlSnprintfElementContent for unchecked strcat()
+writes, but the sibling function xmlSnprintfElements has the identical
+unfixed pattern. The strcat(buf, "(") before the while loop and
+strcat(buf, ")") after the loop exit have no bounds checks.
+
+Add remaining-space checks before both strcat calls, with early return
+and ellipsis when space is insufficient.
+
+CVE: CVE-2026-86140
+Upstream-Status: Backport [https://github.com/GNOME/libxml2/commit/d1686f91dbda141a752200419d35639fd6b38340]
+
+(cherry picked from commit d1686f91dbda141a752200419d35639fd6b38340)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ valid.c | 16 ++++++++++++++--
+ 1 file changed, 14 insertions(+), 2 deletions(-)
+
+diff --git a/valid.c b/valid.c
+index ae4bb822..718e6d85 100644
+--- a/valid.c
++++ b/valid.c
+@@ -5047,7 +5047,15 @@ xmlSnprintfElements(char *buf, int size, xmlNodePtr node, int glob) {
+     int len;
+ 
+     if (node == NULL) return;
+-    if (glob) strcat(buf, "(");
++    len = strlen(buf);
++    if (glob) {
++        if (size - len < 50) {
++            if ((size - len > 4) && (buf[len - 1] != '.'))
++                strcat(buf, " ...");
++            return;
++        }
++        strcat(buf, "(");
++    }
+     cur = node;
+     while (cur != NULL) {
+ 	len = strlen(buf);
+@@ -5111,7 +5119,11 @@ xmlSnprintfElements(char *buf, int size, xmlNodePtr node, int glob) {
+ 	}
+ 	cur = cur->next;
+     }
+-    if (glob) strcat(buf, ")");
++    if (glob) {
++        len = strlen(buf);
++        if (size - len > 1)
++            strcat(buf, ")");
++    }
+ }
+ 
+ /**
diff --git a/meta/recipes-core/libxml/libxml2_2.12.10.bb b/meta/recipes-core/libxml/libxml2_2.12.10.bb
index 93b7a23754..9648228c43 100644
--- a/meta/recipes-core/libxml/libxml2_2.12.10.bb
+++ b/meta/recipes-core/libxml/libxml2_2.12.10.bb
@@ -34,6 +34,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testt
            file://CVE-2026-11979.patch \
            file://CVE-2026-86137.patch \
            file://CVE-2026-86138.patch \
+           file://CVE-2026-86140.patch \
            "
 
 SRC_URI[archive.sha256sum] = "c3d8c0c34aa39098f66576fe51969db12a5100b956233dc56506f7a8679be995"
-- 
2.35.6


