Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A53ADC531C7
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 09:07:29 +0000 (UTC)
Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19343.1784797647656323295
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2026 02:07:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=UyOGnXou;
 spf=pass (domain: cisco.com, ip: 173.37.86.76, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2050; q=dns/txt;
  s=iport01; t=1784797647; x=1786007247;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WaFgfItfflIecmHRGF6MqP6/gW/28AiSm2lS1Doixj4=;
  b=UyOGnXousNEZY/ADSkOjfSKoAsoLERWP1iq6aVDqM12gkUcbRhiZmZt1
   LgveWm849gSDnK/5iFY7zEC+t4Id/pgcqCyGeLwCTT4+twNoaqeE72wqM
   Z8AMP+z2QZxjc0E7CL0b3yRGKFNfmmosyHGRUb1775Fc9dd72jD7OcOyr
   npRRTJ3LmDdJ9iqrn3IOmF/1GFhI0g2zbNYBsDKIw9Or3vah8xsKLbAWq
   YJQk4SneIndlFIsggC7NvUhUlz5BMDHBeTZ7NFoSD6+EsDlP8gXg+xBZ0
   5RkLuqBLWJD/pvTQ4oUI+4xFFnwQTB9Nk+1TO5yYqMZT5kwyx9t3nileC
   g==;
X-CSE-ConnectionGUID: 3sHtXdm8Tiaj0VsTvDIdeg==
X-CSE-MsgGUID: brWe1/NGS9WmBbULz1+O8g==
X-IPAS-Result: =?us-ascii?q?A0BFAgCm2GFq/4r/Ja1aglmCV3RfQkmWSgOeG4F+DwEBA?=
 =?us-ascii?q?Q9EDQQBAYUFAo1aAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECAQcFg?=
 =?us-ascii?q?Q4Thk8NhlsCAQMyARgBLRAgMSsdAQ0ZgwIBgnQCARHBOIIsgQGDKAE/AkNQ2?=
 =?us-ascii?q?y4BCxQBBYEzhT+IIHQBhHwnGxuBcoEVg2mBBYFcAQECGIIThXgEgiJ6EoF4k?=
 =?us-ascii?q?DZIgR4DWSwBVRMNCgsHBYFmAzUSKhVuMh2BIz4XgQwbBwWBHYEugQKEXCMfA?=
 =?us-ascii?q?zl/gTB1SnctaQESF4EmghSBOgKBHQMLGA1IESw3FBkEPm4HjXAjgjtaCiosT?=
 =?us-ascii?q?YFwpWWhDwoog3WMIZU6GjOqbAuYfY4KllCEaYFoPIFHCwdwFYMiCUoZD444g?=
 =?us-ascii?q?2uBf4MUyR0kNQIJMgEBBwIHDgMLgWiRfgEB?=
IronPort-Data: A9a23:CeHo3aP/O41TPIzvrR30lsFynXyQoLVcMsEvi/4bfWQNrUol3jACm
 mtJWG7Xbv6JZGr8KNFwYIS3/EJUuJHQz9NrQHM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeaphyFTmE+kvF3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WV7lV
 e/a+ZWFZgf6gWUsawr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj6651LF0GMYhIxud+Azlw7
 sAGBBEBYx/W0opawJrjIgVtrt4oIM+uOMYUvWttiGmAS/0nWpvEBa7N4Le03h9p2ZsIRqmYP
 ZdEL2M0PHwsYDUXUrsTIJ4zgu6unXnnWzZZs1mS46Ew5gA/ySQsieSxbIKJIoPiqcN9lFynq
 zuB2UvCUy4fHtai7SjcsVX8ibqa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+qv6jh2a6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYGUNZWVul/4waXx++MukCSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXMIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:0TmszqkOmOOA9yGhLCeHfspF0l3pDfL03DAbv31ZSRFFG/FwWf
 rAoB19726StN9/YhAdcLy7VZVoBEmsl6KdgrNhWYtKIjOHhILAFugLhuHfKn/bakjDH4Vmu5
 uIHZITNDTYNykdsS+D2njaL/8QhP+a7auvmeDSi11pTQ1sduVcyj0RMHfjLqWzLzM2fqbQ0/
 Gnl7J6mwY=
X-Talos-CUID: 9a23:yRsx3G6yY8sOB328e9ssr1U0BvApdy3hzX7Se3GjNXhFabGYRgrF
X-Talos-MUID: 9a23:lUskIwbLAs/i8eBTvSXTiWglEuhTspurIkowtYdf+O7UOnkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,180,1779148800"; 
   d="scan'208";a="514440407"
Received: from rcdn-l-core-01.cisco.com ([173.37.255.138])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 23 Jul 2026 09:07:26 +0000
Received: from sjc-ads-20746.cisco.com (sjc-ads-20746.cisco.com [171.70.189.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-01.cisco.com (Postfix) with ESMTPS id BCC8318000322;
	Thu, 23 Jul 2026 09:07:26 +0000 (GMT)
Received: by sjc-ads-20746.cisco.com (Postfix, from userid 1887503)
	id 646BFCEC315; Thu, 23 Jul 2026 02:07:26 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Devansh Patel <devanshp@cisco.com>
Subject: [OE-core][wrynose][PATCH v2] openssh: set status for CVE-2026-59998
Date: Thu, 23 Jul 2026 02:07:04 -0700
Message-Id: <20260723090704.1625527-1-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260720175518.3546447-3-devanshp@cisco.com>
References: <20260720175518.3546447-3-devanshp@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-20746.cisco.com [171.70.189.245];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 171.70.189.245, sjc-ads-20746.cisco.com
X-Outbound-Node: rcdn-l-core-01.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 09:07:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241801

From: Devansh Patel <devanshp@cisco.com>

Analysis:
- CVE-2026-59998 concerns an undocumented limitation of
  GSSAPIStrictAcceptorCheck in Windows Active Directory environments [1].
- Upstream OpenSSH 10.4 only documents the existing behavior and provides no
  code remediation [2].
- The recipe disables Kerberos/GSSAPI by default. Mark the CVE
  not-applicable-config when PACKAGECONFIG lacks kerberos, and unpatched when
  kerberos is enabled.

Reference:
[1] https://nvd.nist.gov/vuln/detail/CVE-2026-59998
[2] https://github.com/openssh/openssh-portable/commit/8058c5bdb507591b79ec926221fbe6fcc296d432

Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
Changes in v2:
- Drop the documentation-only backport for CVE-2026-59998.
- Add a configuration-aware CVE_STATUS that reports unpatched when Kerberos
  support is enabled and not-applicable-config otherwise.

 meta/recipes-connectivity/openssh/openssh_10.3p1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/openssh/openssh_10.3p1.bb b/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
index f5184b1fce..b13488e265 100644
--- a/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
@@ -44,6 +44,7 @@ Red Hat Enterprise Linux 7 and when running in a Kerberos environment"
 CVE_STATUS[CVE-2008-3844] = "not-applicable-platform: Only applies to some distributed RHEL binaries."
 CVE_STATUS[CVE-2023-51767] = "upstream-wontfix: It was demonstrated on modified sshd and does not exist in upstream openssh https://bugzilla.mindrot.org/show_bug.cgi?id=3656#c1."
 CVE_STATUS[CVE-2026-3497] = "not-applicable-platform: Only affects GSSAPI Key Exchange patches used by some Linux distributions and does not exist in upstream openssh."
+CVE_STATUS[CVE-2026-59998] = "${@bb.utils.contains('PACKAGECONFIG', 'kerberos', 'unpatched', 'not-applicable-config: GSSAPI/Kerberos support is disabled in the default OpenSSH configuration', d)}"
 
 PAM_SRC_URI = "file://sshd"
 
-- 
2.35.6

