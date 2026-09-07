Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F702C79F89
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 08:22:31 +0000 (UTC)
Received: from alln-iport-6.cisco.com (alln-iport-6.cisco.com [173.37.142.93])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30273.1788769348583659393
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2026 01:22:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=d0bEWvfZ;
 spf=pass (domain: cisco.com, ip: 173.37.142.93, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1790; q=dns/txt;
  s=iport01; t=1788769348; x=1789978948;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=OWqz1bgAhTkeRWxwqmq8w1eXUP7CYS1AUa7Vsb/rxVs=;
  b=d0bEWvfZmivrHZPhmZJQ08r1shkxYNYTSr8MQTPPrWrBMAvsRdq859Xf
   EJPvmbORMRdIUTkkzHdL5/0NQVtnHsJnhphVzkHbu+kZIt3pYN5TPaYYA
   bBtV16OF9VoxiA4NYahlAnVyaIjbCtt0AaZp9Y3WRDzx2ohT7Z8H0Ii1E
   2VA8VNuzJWvtMvdXtpF3DlZirfGwOpVQEUrTSoKFcPmmB9AFRyaDWs1iZ
   +D02w+FN7r2ghhGFAlhY7WDzDPxQNj2JdLj7+2DcgEjxrOO9DG8jhfvd/
   +UTLEqgMNNq299HVZd0w7e3XUkLhBZ5+DzzQm6XZUG+gVVFzNr8phKphk
   A==;
X-CSE-ConnectionGUID: j/jkDkD7Ttm71vLA9jqyiA==
X-CSE-MsgGUID: +BC3Yk7JQaybSMpIe+tAyw==
X-IPAS-Result: =?us-ascii?q?A0BDAgA9c55q/4oQJK1aglmCGD90YENJlkqeHoF+DwEBA?=
 =?us-ascii?q?Q89FAQBAYUFjgUCJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBAQECAQcFg?=
 =?us-ascii?q?Q4Thk8NkB82ARgBLTBcHQEmgwIBgnQDEcQugiyBAYMoAYFU2zEBCxQBBYEzh?=
 =?us-ascii?q?T+IInUBhHwnGxuBcoR+gQWBXAEBAhiCE4V4BIIigQyEDY9lSIEeA1ksAVUTD?=
 =?us-ascii?q?QoLBwWBZgM1EioVbjIdgSM+F4EHGwYFgR2BJ4M/Ixk2eoEJXoErKWABEheBC?=
 =?us-ascii?q?YIIAoJUggECAUlDDgdFUwknQQoSDAsYDUgRLDcVGQQ+bgeObR+CVw6BACwgA?=
 =?us-ascii?q?nlRGaN8giGhDwoog3aMIpU6GjOqbQsjmFqOCpVoaIRpgWg8gSgfCwdwFYJuA?=
 =?us-ascii?q?QEyCUoZD445gR8BB4JEgX9lyVUnMgI7AQEHAgcOAwuBaJF+AQE?=
IronPort-Data: A9a23:OGpZHqnbwamU9sNGL7BfypDo5gzWJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIbCz/XOavbZWSjfYgiOYS/px5Q7JKHmNNhGQds+389F1tH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4Errav6+/SEUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZC31GONgWYubDpFs/3b8XuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05FY9f+OVbAk0Ry
 eAdd2kTSjnShfunwZvuH4GAhux7RCXqFIobvnclyXTSCuwrBMiaBa7L/tRfmjw3g6iiH96HO
 JFfMmQpNUqGOkYfUrsUIMpWcOOAhmX/ej5RsnqepLE85C7YywkZPL3FYIGPI4DRFZ8I9qqej
 iHs1D/IAU44DdWOwwGg6lOhxfPmjDyuDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0W5Qd93L
 00P5jFoqrA/8kGuRNTxUxC05nmesXYht8F4Guk+7kSJj6HT+QvcXjFCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1rN94cRva1fApEFI/
IronPort-HdrOrdr: A9a23:tB7dN6w/nvuKm811gK5/KrPwAL1zdoMgy1knxilNoNJuHfBw8P
 re+cjzuiWUtN98YhwdcLO7Scu9qA3nlaKdiLN5VdzJYOCMggWVxe9ZgbcK6geQfxEWjtQttp
 tIQuxZFMD6C0R8gILR5Qm1FMtl/fy8mZrY4ts3CxxWPHhXg2YK1XYeNjqm
X-Talos-CUID: =?us-ascii?q?9a23=3ATAnhVGmOG11EE3b+1UnA1BpTmv3XOX+aznT8IGP?=
 =?us-ascii?q?nNXpsF+SLbXbB+rp1kuM7zg=3D=3D?=
X-Talos-MUID: 9a23:1TDrIgZScamT8eBT9BXH3wBha+VR6rWkM2UVsJhFp+CVKnkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,267,1779148800"; 
   d="scan'208";a="832143825"
Received: from alln-l-core-01.cisco.com ([173.36.16.138])
  by alln-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 07 Sep 2026 08:22:27 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-01.cisco.com (Postfix) with ESMTPS id 7B6C118000181;
	Mon,  7 Sep 2026 08:22:27 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id 0DD83CC1611; Mon,  7 Sep 2026 01:22:27 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Hetvi Thakar <hthakar@cisco.com>
Subject: [OE-core][wrynose][PATCH] python3-pip: set CVE_STATUS for CVE-2018-20225
Date: Mon,  7 Sep 2026 01:22:18 -0700
Message-Id: <20260907082218.2177656-1-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: alln-l-core-01.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 08:22:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245240

From: Hetvi Thakar <hthakar@cisco.com>

Analysis:
- NVD marks CVE-2018-20225 as disputed. [1]
- pip searches all configured package indexes without priority and selects
  the highest matching version. --extra-index-url adds an equal-priority
  package source. [2]
- Exploitation requires use of --extra-index-url and an attacker-published,
  higher-version package with the name of a private package. [1]
- Upstream closed the related report as not planned, and Red Hat classified
  the issue as WONTFIX because this behavior is intentional. [3][4]
- Record the disputed status; no source patch is available.

Reference:
[1] https://nvd.nist.gov/vuln/detail/CVE-2018-20225
[2] https://pip.pypa.io/en/stable/cli/pip_install/
[3] https://github.com/pypa/pip/issues/12874
[4] https://bugzilla.redhat.com/show_bug.cgi?id=1835736

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 meta/recipes-devtools/python/python3-pip_26.0.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-pip_26.0.1.bb b/meta/recipes-devtools/python/python3-pip_26.0.1.bb
index 1a2cbc397a..46fa63e6a6 100644
--- a/meta/recipes-devtools/python/python3-pip_26.0.1.bb
+++ b/meta/recipes-devtools/python/python3-pip_26.0.1.bb
@@ -34,6 +34,8 @@ SRC_URI[sha256sum] = "c4037d8a277c89b320abe636d59f91e6d0922d08a05b60e85e53b29661
 
 CVE_PRODUCT = "pypa:pip"
 
+CVE_STATUS[CVE-2018-20225] = "disputed: Exploitation requires use of --extra-index-url with a private package not present on the primary public index; pip intentionally selects the highest version across configured indexes"
+
 do_install:append(){
 	# pip vendors distlib which ships Windows launcher templates (*.exe).
 	# Keep them only when building for a Windows (mingw) host.
-- 
2.35.6


