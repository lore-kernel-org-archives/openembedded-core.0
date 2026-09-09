Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6B51C79FB6
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 19:00:49 +0000 (UTC)
Received: from alln-iport-1.cisco.com (alln-iport-1.cisco.com [173.37.142.88])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20279.1788980446642694867
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2026 12:00:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=fNkJ2+ot;
 spf=pass (domain: cisco.com, ip: 173.37.142.88, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2523; q=dns/txt;
  s=iport01; t=1788980446; x=1790190046;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=6Rz2wuLtKeJnCXqnR59hj8HzS+xgjsqb1rcZ/ihM6u4=;
  b=fNkJ2+othTBfpDW9qquYjwetmy5Tkvq0vSUs0UrOcWghDjTr0DxC3zQ5
   7w8Z8ddfHalSA2s9TEOHVdBKmx//C4drDTtz+HQ6mSZMF1s6hFCtW+6tk
   MuEn89XKRNfqVXtJuOx8kluo8ZlPvX3DBR8lL4Rbv9nLKwSBSg5yAwjRj
   sjogkRZLM09JDWnIA7F2W83mzXF3VYDtJl1pPpDInOXQ2UxgshPji8AzB
   5S5utKPyw3Oava7/wrxJsEU0H9VrGZODFumN06s80KX7lP5AYNRLZdJS1
   +kzKfC1NC9qXG0yIeBXQZSB61iQ7hdFnXbrmDBlnnGJnQteB4+0C5nLcI
   A==;
X-CSE-ConnectionGUID: 3NORECX/TcCNIhfrk+twsw==
X-CSE-MsgGUID: rMPK2fA9SFqOlFqtDNCCeA==
X-IPAS-Result: =?us-ascii?q?A0BCAgAgrKFq/5MQJK1aglmCV3RgQ0mWSp4egX4PAQEBD?=
 =?us-ascii?q?0QNBAEBhQWOBwImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBBwWBD?=
 =?us-ascii?q?hOGTw2QFTYBGAEtMFxEG4JnAYJ0AxEGwTaCLIEBgygBPwICQAFQ2zEBCxQBB?=
 =?us-ascii?q?YEzhT+IInUBhHwnGxuBcoEVg2mBBYFcAgGCLIV4BIIiehKBeG5HkQFIgR4DW?=
 =?us-ascii?q?SwBVRMNCgsHBYFmAzUSKhVuMh2BIz4XgQcbBgWBHYEngz8jGTZ6gQlegSspY?=
 =?us-ascii?q?AESF4EHgggCglSCAQIBSUMOB0VTCSdBChJTKQQLGA1IESw3FRkEPm4HjyIfg?=
 =?us-ascii?q?lhhLSoBAYIFJxGTOJAMgiGhDwoog3aMIpU6GjOqbS6YWo4KlTZKUIRpgWg8g?=
 =?us-ascii?q?VlwFTuCZwkWNBkPjjmDa4ZAxXknMgIJMgEBBwIHDgMLgWiRfgEB?=
IronPort-Data: A9a23:We/trKygConBruWfOLt6t+dhxyrEfRIJ4+MujC+fZmUNrF6WrkUGy
 2VMWGrQOPuJamuhftBxbovjpxkFvJTVxtQ1TlE/rVhgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCKa/lHyYuCJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 46aT/H3Ygf/hWYlajNMsMpvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJBoQGrc10dYwPWpl0
 90YJioOLQycnP3jldpXSsE07igiBMDvOIVavjRryivUSK9+B5vCWK7No9Rf2V/chOgXQq2YP
 JRfMGQpNUifC/FMEg9/5JYWkOq2j3/kcyVwo1OOrq1x6G/WpOB0+OixaYSFIoPTG625mG6Cg
 1rlpWrQUyo0Lfub5yOZ3lSHreLmyHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rbyyjVSzc9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc9NUF+t/7ESGzbDZpl/BQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSv1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:jC1dQq6fzSSgkgHn2gPXwOTXdLJyesId70hD6qm+c3Nom6uj5q
 WTdZsgtCMc5Ax9ZJhCo6HjBED/exPhHPdOiOF7V4tKNzOJhILHFu1fBKLZslnd8lXFh41g/J
 YlVbRiA9vtClU/p8P77A6kV+sE+rC8gceVbSO09QYVcemsAJsQiTtENg==
X-Talos-CUID: =?us-ascii?q?9a23=3AeuKBuGjj0WifTn0IyvGXv25soDJuKVv69lr7Ewi?=
 =?us-ascii?q?EAk1Pab2bU1zT5Lx/jJ87?=
X-Talos-MUID: =?us-ascii?q?9a23=3Afe+Jtg1GyG1WhOSS8kdFgUr+PjUj+YGWKxoDuMQ?=
 =?us-ascii?q?9ldCjMQJpJxu7px+6a9py?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,270,1779148800"; 
   d="scan'208";a="841680716"
Received: from alln-l-core-10.cisco.com ([173.36.16.147])
  by alln-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 09 Sep 2026 19:00:45 +0000
Received: from sjc-ads-5197.cisco.com (sjc-ads-5197.cisco.com [10.28.35.211])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-10.cisco.com (Postfix) with ESMTPS id 992F718000580;
	Wed,  9 Sep 2026 19:00:45 +0000 (GMT)
Received: by sjc-ads-5197.cisco.com (Postfix, from userid 1887503)
	id 3EFB4CC12A7; Wed,  9 Sep 2026 12:00:45 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][wrynose][PATCH] curl: set CVE_STATUS for CVE-2026-8458
Date: Wed,  9 Sep 2026 12:00:45 -0700
Message-Id: <20260909190045.5000-1-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-5197.cisco.com [10.28.35.211];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.35.211, sjc-ads-5197.cisco.com
X-Outbound-Node: alln-l-core-10.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 19:00:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245488

From: Devansh Patel <devanshp@cisco.com>

CVE-2026-8458 allows a Negotiate-authenticated connection to be
incorrectly reused for a request using a different SASL service name.

Wrynose uses curl 8.19.0, which is within the affected version range.
The vulnerable code path on Linux requires both Negotiate authentication
and GSSAPI support, represented by the negotiate-auth and krb5
PACKAGECONFIG options.

The upstream fix [1] stores the SASL service name in struct Curl_creds
and includes it in connection-reuse comparisons. However, struct
Curl_creds was introduced by the credential-management rework in [2],
after curl 8.19.0. Therefore, the security fix cannot be cleanly
backported without introducing a substantial credential-management
refactor.

Use a conditional CVE_STATUS as the least invasive solution. Report the
CVE as unpatched when both krb5 and negotiate-auth are enabled. Otherwise,
mark it not-applicable-config because the vulnerable GSSAPI-backed
Negotiate implementation is not built. The default Wrynose configuration
enables negotiate-auth but does not enable krb5.

References:
[1] https://github.com/curl/curl/commit/5e99b73cf441d9c369768b9cd48b5389b9a2503d
[2] https://github.com/curl/curl/commit/8f71d0fde515aa4c68002477356c35bd79927729
[3] https://curl.se/docs/CVE-2026-8458.html

Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 meta/recipes-support/curl/curl_8.19.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-support/curl/curl_8.19.0.bb
index 7497337cb9..dec9d7a3eb 100644
--- a/meta/recipes-support/curl/curl_8.19.0.bb
+++ b/meta/recipes-support/curl/curl_8.19.0.bb
@@ -42,6 +42,7 @@ CVE_STATUS[CVE-2026-8924] = "not-applicable-config: public suffix list support i
 CVE_STATUS[CVE-2026-10536] = "${@bb.utils.contains('PACKAGECONFIG', 'nghttp2', 'unpatched', 'not-applicable-config: applicable only with HTTP/2', d)}"
 CVE_STATUS[CVE-2026-9547] = "not-applicable-config: vulnerable libssh backend is not enabled by the recipe"
 CVE_STATUS[CVE-2026-12064] = "${@bb.utils.contains('PACKAGECONFIG', 'libssh2', 'unpatched', 'not-applicable-config: SCP/SFTP support is not enabled in PACKAGECONFIG', d)}"
+CVE_STATUS[CVE-2026-8458] = "${@bb.utils.contains('PACKAGECONFIG', 'krb5 negotiate-auth', 'unpatched', 'not-applicable-config: applicable only with GSS-API-backed Negotiate authentication', d)}"
 
 inherit autotools pkgconfig binconfig multilib_header ptest
 
-- 
2.35.6


