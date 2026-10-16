Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 352AECCA491
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 03:52:45 +0000 (UTC)
Received: from rcdn-iport-3.cisco.com (rcdn-iport-3.cisco.com [173.37.86.74])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14417.1792122758616888354
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 20:52:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=fENrgNUD;
 spf=pass (domain: cisco.com, ip: 173.37.86.74, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1426; q=dns/txt;
  s=iport01; t=1792122758; x=1793332358;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=F2JbVUUHePYlDJXhLWo5EtdLpsIPVFP3plezZcFBQro=;
  b=fENrgNUDufpdthgecALc/pXk3jR4Ey0Mzc7f/mtHQSFcx8oAMkPyojbb
   Vda8MqpIRImipXdu/SgE9iWIb4ja+vC0s4dEnafwjFZVVMb4EZYJH2GAh
   9KENkM7obCjXE+H0AL8F0dMRzQG2pVLOrvG8pC2y9smuTYhffsMTUnr5m
   t4fjwJD0QF8XkDTgeOaE/cn0z9VurU89erHSFUVKm4J2LjCk1436ptswx
   TpSXCgX99LJ9wuhAtYPHI342teXYbd1KFCQdMyFi4ADHDqxoukW4yCTSn
   lb7/74ztVsrfKVMgKuA8byjiYH46do2CXV0M2DtJwF2i7esd+42+11nr4
   A==;
X-CSE-ConnectionGUID: VZfxaXeKRICyqkqGkQuh1A==
X-CSE-MsgGUID: d0GLoXXqQCG6bE5LwWinyQ==
X-IPAS-Result: =?us-ascii?q?A0D8AgCwntFq/47/Ja1aglmCV3VgQ0kDlkcDnhyBfg8BA?=
 =?us-ascii?q?QEPPRQEAQGFBQKOFQImNgcOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGTw2QEwIBAzIBGAEtECAxKysZgwIBgnQDEbxwgiyBAYMpAT8CQ1DbM?=
 =?us-ascii?q?gELFAEFgTOFQIgjdQGEfCcbG4FyhH6BBYQLhXgEgiJ6EoF4lSlIgR4DWSwBV?=
 =?us-ascii?q?RMNCgsHBYFoAzUSKhVuMh2BIz4XgQcbBgWBHYEgghYjGTZ6gQlegSspYAEQF?=
 =?us-ascii?q?4EJggcCglSCAAIBSUEOB0VTCSVDEkcmIggSCQETGjALgRs4PAkoQRcMcwwdB?=
 =?us-ascii?q?XIIAg0JBykYDUgRLDcVGQQ+bgeSFB6CZVo0LAQcgWUnEaVkoQ8KKIN2jCKVO?=
 =?us-ascii?q?hozqm8LmH2OCpZPhGmBbwUwgVlwFYMiCUoZD445g2vOWicyDi8BAQcCBw4DC?=
 =?us-ascii?q?4FokX4BAQ?=
IronPort-Data: A9a23:wK9b/aKg6PgCKRdXFE+Rh5QlxSXFcZb7ZxGr2PjKsXjdYENS0WADz
 zcYXG+EOfeMajehfI8jbYji9kMF65OEn4NrSVEd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZpCCea+Uf1WlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnS0
 T/Oi5eHYgH8g2cqajt8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN1QPk8mNL0V2dxWKnBX9
 uU3KwkQbkmq0rfeLLKTEoGAh+w5J8XteYdasXZ6wHSBULAtQIvIROPB4towMDUY358VW62BI
 ZBENHw2ME6ojx5nYj/7DLo+gOehhXDlWzZZs1mS46Ew5gA/ySQsi+azb4qLIIfiqcN9kh63g
 mX2z33AKT5EPvHC7SW683S9v7qa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+qv6jh2a6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYGUNZWVul/4waXx++MvkCSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXPIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:a8j5QKNmQG+1HsBcThmjsMiBIKoaSvp037Dk7S9MoHtuA6ulfq
 +V/cjzuSWYtN9VYgBDpTniAtjlfZqjz/5ICOAqVN/INjUO+lHYSb2KhrGN/9SPIUHDH8dmpM
 FdmtBFeb7NJGk/q9rm6w+lFNtl6tyG/Ke0wdr69R5WPHhXg2UK1XYDNu5deXcGPDV7OQ==
X-Talos-CUID: =?us-ascii?q?9a23=3A9pmuMmrQmHkpMUJKh0YUs8jmUf4XfG3U/HrzGW6?=
 =?us-ascii?q?TGH9qUZKWcEKQoYoxxg=3D=3D?=
X-Talos-MUID: 9a23:NvP19Qg+A17pLKXzZTcqOcMpOJ9Hx6OeOFk0urpYseTZETNPOjGMtWHi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="536678623"
Received: from rcdn-l-core-05.cisco.com ([173.37.255.142])
  by rcdn-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 03:52:37 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-05.cisco.com (Postfix) with ESMTPS id A957F18000346;
	Fri, 16 Oct 2026 03:52:37 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id 04EF7CBEF8A; Thu, 15 Oct 2026 20:52:37 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][wrynose][PATCH 06/10] openssh: Ignore CVE-2026-106588
Date: Thu, 15 Oct 2026 20:52:32 -0700
Message-Id: <20261016035236.442896-7-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261016035236.442896-1-hthakar@cisco.com>
References: <20261016035236.442896-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: rcdn-l-core-05.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 03:52:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247916

From: Hetvi Thakar <hthakar@cisco.com>

Analysis:
- This issue requires OpenSSH built with the macOS 27 or later SDK.
- Wrynose targets Linux and cannot select the Darwin sandbox.

Reference:
https://ubuntu.com/security/CVE-2026-106588

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 meta/recipes-connectivity/openssh/openssh_10.3p1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/openssh/openssh_10.3p1.bb b/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
index 3e927154f5..6799e10b99 100644
--- a/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
@@ -56,6 +56,7 @@ CVE_STATUS[CVE-2023-51767] = "upstream-wontfix: It was demonstrated on modified
 CVE_STATUS[CVE-2026-3497] = "not-applicable-platform: Only affects GSSAPI Key Exchange patches used by some Linux distributions and does not exist in upstream openssh."
 CVE_STATUS[CVE-2026-55653] = "not-applicable-platform: Only applies to RHEL FIPS patches."
 CVE_STATUS[CVE-2026-59998] = "${@bb.utils.contains('PACKAGECONFIG', 'kerberos', 'unpatched', 'not-applicable-config: GSSAPI/Kerberos support is disabled in the default OpenSSH configuration', d)}"
+CVE_STATUS[CVE-2026-106588] = "not-applicable-platform: Requires the macOS 27 or later SDK and Darwin sandbox; Wrynose builds OpenSSH for Linux."
 
 PAM_SRC_URI = "file://sshd"
 
-- 
2.35.6


