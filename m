Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 595B0C44533
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 18:58:02 +0000 (UTC)
Received: from rcdn-iport-7.cisco.com (rcdn-iport-7.cisco.com [173.37.86.78])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4968.1784573873503117380
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 11:57:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=l0gs0d1N;
 spf=pass (domain: cisco.com, ip: 173.37.86.78, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2928; q=dns/txt;
  s=iport01; t=1784573873; x=1785783473;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=La3YpEflsTKsd9uSGgQ9UK+2P6WqNyWRVf/W+BlYgfo=;
  b=l0gs0d1NvrRZIyF+u4uhVCJuYAed+k83lkik/Sv6ycR7YGunmLQ8S+L0
   sZYADKDQX9Snq1cLYrSRGDzMotvzSrrS52Cc+SP+QTkPe49sTgBF92R6z
   djcNmz+FC/Yzih7IzdR5eWPHLSl/Oi7/oX0+DNYJoAhqSuQ9vyG6OMJoz
   U85Z5AUwzpaFmwv9M+OX1iuihnaL2JP+8WR6dXUzhHofqkwTs/5sgZ0KM
   zZ+XUWkhdwPmrpnXiB7qqs6O+hNFDJiSrARShE+NuVI+0qVow4mgFSeRw
   Jenhv8mI14YcVwrHVpBzXrFXlgDuCMGgbhL7d4n1hnTguwzpspplHlBKR
   w==;
X-CSE-ConnectionGUID: wlUwaiZTQPaaI0fO8Juf1g==
X-CSE-MsgGUID: ibxif7EWRfuuZ7UxSJIiug==
X-IPAS-Result: =?us-ascii?q?A0BIAgCabl5q/5X/Ja1aglmCV3ReQ0mWTZ4bgX4PAQEBD?=
 =?us-ascii?q?0QNBAEBhD9GAo1VAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECAQcFg?=
 =?us-ascii?q?Q4Thk8NhloBAgEDMgEYAS0QHAMBAi8rHQEFCBmDAgGCdAMRvAGCLIEBgygBP?=
 =?us-ascii?q?wJDUNsuAQsUAQWBM4U/iCBcGAGEfCcbG4FyhH6BBYFcAQEDgiqFeASCInoSg?=
 =?us-ascii?q?VoegX09jT9IgR4DWSwBVRMNCgsHBYFmAzUSKhVuMh2BIz4XgQwbBwWBHYE6g?=
 =?us-ascii?q?QKEdCMfAzl/gS91SnctaQESF4EmghICgTsCEwMLGA1IESw3FBkEPm4HjUEjg?=
 =?us-ascii?q?kBqJAEqAagioQ8KKIN1jCGVOhozqmwLmH2OCpU2gRqEaYFoPIFHCwdwFTuCZ?=
 =?us-ascii?q?wlKGQ+OOINrgX+DFMlHJzILMgEBBwIHDgMLgWiRfgEB?=
IronPort-Data: A9a23:2yS7naMBJLr/2c3vrR30lsFynXyQoLVcMsEvi/4bfWQNrUp23jQGn
 2pOCmuHaaqIN2uhKtggOoyw8U8E6p/VzNJmGXM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeaphyFTmE+kvF3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WV7lV
 e/a+ZWFZgf6gWYsbAr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj6+pqMV4/PL8kw95+CEAW+
 9tICi0DNx/W0opawJrjIgVtrt4oIM+uOMYUvWttiGiDS/0nWpvEBa7N4Le03h9p2ZsIRqmYP
 ZdEL2MzPXwsYDUXUrsTIJ4zgu6unXnnWzZZs1mS46Ew5gA/ySQsieK3bYeFJIXiqcN9n0yIp
 2yZ0lvDDAwHBoOi2QGn03Oxibqa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+qv6jh2a6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYGUNZWVul/4waXx++NuUCSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXOIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:O1PLY6r4aO7bOa6kMtAK2IAaV5rzeYIsimQD101hICG9vPb2qy
 nIpoV96faaslcssR0b9OxofZPwI080lqQFhbX5X43DYOCOggLBR+tfBMnZsljd8kbFmNK1u5
 0NT0FWMqyXMbEDt7eY3CCIV/A93dKA7Kekwc3az3trUEVWTpsI1XYBNu5eeXcGPzWvwvECZe
 Kh2vY=
X-Talos-CUID: =?us-ascii?q?9a23=3AxtYNgGnAXJxjZk/BxIW2itGklN/XOWLZ8WjZIn2?=
 =?us-ascii?q?EMF5gQZzNR3jA2r5qysU7zg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3A/fiVTA1j+qYrxxWYRx/BJNGmlTUj4q6+CU5SvKo?=
 =?us-ascii?q?8tdSZB3NNKwy/rTWqTdpy?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,175,1779148800"; 
   d="scan'208";a="512255861"
Received: from rcdn-l-core-12.cisco.com ([173.37.255.149])
  by rcdn-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Jul 2026 18:57:52 +0000
Received: from sjc-ads-9357.cisco.com (sjc-ads-9357.cisco.com [10.30.212.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-12.cisco.com (Postfix) with ESMTPS id 81F8018000335;
	Mon, 20 Jul 2026 18:57:52 +0000 (GMT)
Received: by sjc-ads-9357.cisco.com (Postfix, from userid 1887503)
	id 2C15CCC12A9; Mon, 20 Jul 2026 11:57:52 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Devansh Patel <devanshp@cisco.com>
Subject: [OE-core][scarthgap][PATCH 3/8] openssh: Fix CVE-2026-59998
Date: Mon, 20 Jul 2026 11:57:44 -0700
Message-ID: <20260720185749.4098075-4-devanshp@cisco.com>
X-Mailer: git-send-email 2.44.4
In-Reply-To: <20260720185749.4098075-1-devanshp@cisco.com>
References: <20260720185749.4098075-1-devanshp@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-9357.cisco.com [10.30.212.121];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.30.212.121, sjc-ads-9357.cisco.com
X-Outbound-Node: rcdn-l-core-12.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 18:58:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241479

From: Devansh Patel <devanshp@cisco.com>

This patch applies the upstream OpenSSH 10.4 backport for
CVE-2026-59998. The upstream fix commit is referenced in [1],
and the public CVE advisory is referenced in [2].

[1] https://github.com/openssh/openssh-portable/commit/8058c5bdb507591b79ec926221fbe6fcc296d432
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-59998

Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 .../openssh/openssh/CVE-2026-59998.patch      | 34 +++++++++++++++++++
 .../openssh/openssh_9.6p1.bb                  |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-59998.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2026-59998.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2026-59998.patch
new file mode 100644
index 0000000000..a9a13aa70e
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2026-59998.patch
@@ -0,0 +1,34 @@
+From f1fd8585548735bcba25faa13073aafb5f8686ca Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Wed, 24 Jun 2026 06:55:12 +0000
+Subject: [PATCH] upstream: mention a caveat regarding
+ GSSAPIStrictAcceptorCheck in
+
+some environments
+
+CVE: CVE-2026-59998
+Upstream-Status: Backport [https://github.com/openssh/openssh-portable/commit/8058c5bdb507591b79ec926221fbe6fcc296d432]
+
+Backport Changes:
+- Retained the Scarthgap sshd_config.5 OpenBSD revision identifier and
+  Mdocdate because the 10.4 values do not describe the older manual page.
+
+OpenBSD-Commit-ID: aa7158d8f22cb34063c1c2d3cbcf30a9489847c2
+(cherry picked from commit 8058c5bdb507591b79ec926221fbe6fcc296d432)
+Signed-off-by: Devansh Patel <devanshp@cisco.com>
+---
+ sshd_config.5 | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/sshd_config.5 b/sshd_config.5
+index 7e1a56cd0..e1c8dcaa2 100644
+--- a/sshd_config.5
++++ b/sshd_config.5
+@@ -745,6 +745,7 @@ machine's default store.
+ This facility is provided to assist with operation on multi homed machines.
+ The default is
+ .Cm yes .
++This option may not be effective in Windows Active Directory environments.
+ .It Cm HostbasedAcceptedAlgorithms
+ Specifies the signature algorithms that will be accepted for hostbased
+ authentication as a list of comma-separated patterns.
diff --git a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
index 3c706b00ae..256d90e7bd 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
@@ -39,6 +39,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://CVE-2026-35388.patch \
            file://CVE-2026-59999.patch \
            file://CVE-2026-59997.patch \
+           file://CVE-2026-59998.patch \
            "
 SRC_URI[sha256sum] = "910211c07255a8c5ad654391b40ee59800710dd8119dd5362de09385aa7a777c"
 
-- 
2.44.4


