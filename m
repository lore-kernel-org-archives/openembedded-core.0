Return-Path: <shinucha@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A29C6C5B572
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 04:59:34 +0000 (UTC)
Received: from alln-iport-8.cisco.com (alln-iport-8.cisco.com [173.37.142.95])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15089.1787633973443206710
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 21:59:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=jYv7AAiJ;
 spf=pass (domain: cisco.com, ip: 173.37.142.95, mailfrom: shinucha@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2077; q=dns/txt;
  s=iport01; t=1787633973; x=1788843573;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=+6aX6ITkZg85kaH9cB6gIhxWXveT/6jYMGR7giBYjmo=;
  b=jYv7AAiJ/DFhu8CvpFvmUpOaWrEXvSR3PJePCzwWahmsXBLX10C1e+8q
   jqZCNE5R65cgt7pc04O5Dk7qwjv9dNmcdsmHV4eUPufu2vGPSRyjibDES
   5RX+nBD8uHDcTxZCkjTyID0i+ar0nUrDPTOLhJSybw7bccpO6d5Nibb14
   sPoY6yGUJXlRPyA00dDahxJMaaDPIRb96ljQmP33JC19u848x/g0uuNor
   fVG9xywca0VCZw0VLHhQX9VgLNLhENrXdmOFp0IgPxb9pEop4Db4VSqwJ
   OvG/wp4EtNmFcbKI2y78c6Nhi7LWcn9jYoyf5bcq57a/8WeIXkVsx40T9
   w==;
X-CSE-ConnectionGUID: X/8U0XefRtuUtjqM6DGS6A==
X-CSE-MsgGUID: yInGynfPTayB4BR/5Z01iA==
X-IPAS-Result: =?us-ascii?q?A0A/AgCMII1q/4sQJK1aglmCV4FTQkmWSp4eFIFqDwEBA?=
 =?us-ascii?q?Q9RBAEBhQWNbgImNAkOAQIEAwIDAQEBAQEBAQEBAQELAQEFAQEBAgEHBYEOE?=
 =?us-ascii?q?4Zchl02AT8HgQxEgwKCdQIBvjWCLIEB3keBZgELFAEFgTOFcYdwhXInG4FJR?=
 =?us-ascii?q?IR+hClnhXgEgy6BeJFdSIEeA1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F4ENG?=
 =?us-ascii?q?wYFgR2BKIQQIxk2fIEJXoErKWABEheBCYIHAoJaggUCAUlDDgdHIgsYDUgRL?=
 =?us-ascii?q?DcUGQQ+bgeOXR+CTFk1gUxdQAulWosvlWCEKIFmn3YaM5ttjn+ZCKRahGmBa?=
 =?us-ascii?q?DyBWU0jFYMiUxkP3lwkNT0CBwIHDgMLk2YBAQ?=
IronPort-Data: A9a23:pndtEamzCAI379zM06noZHro5gyeJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIYWTzQOfiKZWKjfopzbovno0IA7MXSzIM3HQY+/yFjQVtH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4E/raf658SUUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZC31GONgWYubDpEsf/b8XuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05Fb1fqtsvMWxAz
 +AFFSwPdzXdq82NnpvuH4GAhux7RCXqFIobvnclyXTSCuwrBMiZBa7L/tRfmjw3g6iiH96HO
 JFfMmQpNUqGOkYeUrsUIMpWcOOAnXn+dSBTqFu9rqss6G+Vxwt0uFToGIqMK4HTGJUIwi50o
 ErX3mLWExcUDOCW2BDZ2Ejr292XxCLSDdd6+LqQs6QCbEeo7mkaFB0XWEb9reSzjU+lHthFK
 kUS9gIkqq8u8E2tCNL6WnWQun+PvhcGV5xIDvc26QylzqvS/haXAXUCQjddadsg8sgsSlQC0
 UeEmd7sDzFjvLCZDHma7Lq8qTKpJTNTKncPYyIBRwYJ79Tv5oYpgXryos1LGaqxiJjxXDr32
 T3P9HJ4jLQIhslN3KK+lbzavw+RSlHyZlZdzm3qsqiNt2uVuKbNi1SU1GXm
IronPort-HdrOrdr: A9a23:6gge4KOqQDwIQMBcTu2jsMiBIKoaSvp037Dk7S9MoHtuA6mlfq
 +V/cjzuSWYtN9zYgBDpTn/Asm9qBrnnPYfi7X5Vo3NYOCJggeVxahZnO/fKkXbak7D398Y87
 t8eK5jD9C1J117gcHmpDScKb8bsb66GGTCv5am85+rJjsaDZ1d0w==
X-Talos-CUID: 9a23:feMdCG0El3PMCmfb093IUrxfKod1TyXtwXnqP1KFFWRwbeO5ZmTO0fYx
X-Talos-MUID: 9a23:tu29hwtI73eCUZserc2nlRBkG9Zu7ZySAVEnzb88/JS2bXVxEmLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,242,1779148800"; 
   d="scan'208";a="819515854"
Received: from alln-l-core-02.cisco.com ([173.36.16.139])
  by alln-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 25 Aug 2026 04:59:32 +0000
Received: from sjc-ads-8046.cisco.com (sjc-ads-8046.cisco.com [171.68.208.84])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-02.cisco.com (Postfix) with ESMTPS id 5E8511800015C;
	Tue, 25 Aug 2026 04:59:32 +0000 (GMT)
Received: by sjc-ads-8046.cisco.com (Postfix, from userid 1784405)
	id BF266CCD9AB; Mon, 24 Aug 2026 21:59:31 -0700 (PDT)
From: Shinu Chandran <shinucha@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com, to@cisco.com,
	Shinu Chandran <shinucha@cisco.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [OE-core] [scarthgap] [PATCH] boost: make ICU support configurable
Date: Mon, 24 Aug 2026 21:59:28 -0700
Message-Id: <20260825045928.1998989-1-shinucha@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-8046.cisco.com [171.68.208.84];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.68.208.84, sjc-ads-8046.cisco.com
X-Outbound-Node: alln-l-core-02.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 04:59:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244190

Boost.Locale and Boost.Regex both have optional ICU support, but the recipe depended on icu via
PACKAGECONFIG[locale] while still passing --disable-icu to b2. That made the dependency
relationship confusing and kept the Boost.Regex ICU toggle separate from the Boost.Locale one.

Add an explicit icu PACKAGECONFIG, enabled by default, and use PACKAGECONFIG_CONFARGS to pass
the generated b2 arguments. When icu is removed from PACKAGECONFIG the recipe drops the icu
dependency and passes boost.locale.icu=off --disable-icu; when enabled it passes
boost.locale.icu=on with ICU_PATH.

This lets distros remove the ICU dependency consistently without disabling the Boost.Locale
library itself.

Signed-off-by: Shinu Chandran <shinucha@cisco.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-support/boost/boost.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/boost/boost.inc
index 77105aa1fa..9701c87740 100644
--- a/meta/recipes-support/boost/boost.inc
+++ b/meta/recipes-support/boost/boost.inc
@@ -45,8 +45,9 @@ BOOST_LIBS = "\
 	"
 
 # optional libraries
-PACKAGECONFIG ??= "locale python"
-PACKAGECONFIG[locale] = ",,icu"
+PACKAGECONFIG ??= "locale python icu"
+PACKAGECONFIG[locale] = ",,"
+PACKAGECONFIG[icu] = "boost.locale.icu=on -sICU_PATH=${STAGING_EXECPREFIXDIR},boost.locale.icu=off --disable-icu,icu"
 PACKAGECONFIG[graph_parallel] = ",,,boost-mpi mpich"
 PACKAGECONFIG[mpi] = ",,mpich"
 PACKAGECONFIG[python] = ",,python3"
@@ -152,9 +153,8 @@ BOOST_PARALLEL_MAKE = "${@oe.utils.parallel_make_argument(d, '-j%d')}"
 BJAM_OPTS    = '${BOOST_PARALLEL_MAKE} -d+2 -q \
 		${BJAM_TOOLS} \
 		-sBOOST_BUILD_USER_CONFIG=${WORKDIR}/user-config.jam \
-		-sICU_PATH=${STAGING_EXECPREFIXDIR} \
+		${PACKAGECONFIG_CONFARGS} \
 		--build-dir=${B} \
-		--disable-icu \
 		${BJAM_EXTRA}'
 
 # Native compilation of bzip2 isn't working
-- 
2.35.6


