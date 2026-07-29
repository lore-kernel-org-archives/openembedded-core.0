Return-Path: <shinucha@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 225DEC53219
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 06:12:43 +0000 (UTC)
Received: from alln-iport-6.cisco.com (alln-iport-6.cisco.com [173.37.142.93])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5364.1785305557181177720
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jul 2026 23:12:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=S4Sb0Hc+;
 spf=pass (domain: cisco.com, ip: 173.37.142.93, mailfrom: shinucha@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2957; q=dns/txt;
  s=iport01; t=1785305557; x=1786515157;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xMt2GwyPtaB3WjZIfMap11Sz99ZywzqvYBTLCSlNWMI=;
  b=S4Sb0Hc+aXckTOwIiXLsAjwejROh/OiDtz2zmw27nK2hQHYTNfHkowmc
   fAXGFwqgvD7kgX/34jOvP2czHJ5VYnBR4XLCrCoFSyXNV9oYus8ufFCgP
   9zMh4hR4KmHJ+xv0OjR+RqtcOy+pJJLSVBXHVwonnpB39l6U8tSh4FTme
   GzJMioKsnETgcQoADtGQRRfENXuy4gG5kjCs2+nnTX9m6eX0Bj3+1vX+o
   zVV+hTosmVUtn0TZ2nojbWg9w/e/q+XYl3aU5p74KaVx5fjJitOUot2RX
   3nJgvhD/2/rYcip/i15FCEO0RiZTVRsi9X3A8We/aVuVNVvszORM2xxnk
   w==;
X-CSE-ConnectionGUID: +dWF9ONOSey/eNPioUTRoA==
X-CSE-MsgGUID: X/8d5OdAQaSCS50CbekTKQ==
X-IPAS-Result: =?us-ascii?q?A0BDAgD5mGlq/44QJK1aglmCV3RfQkmWSp4eFIFqDwEBA?=
 =?us-ascii?q?Q8xIAQBAYUFAo1mAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECAQcFg?=
 =?us-ascii?q?Q4Thk8NhlsCAQMyAUYQUSsrGYMCAYJ0AgG9ZIIsgQGEfdlIgWYBCxQBBYEzh?=
 =?us-ascii?q?XGHbnWEfCcbgUlEhH6EKWeFeASDLoF4kDdIgR4DWSwBVRMNCgsHBYFmAzUSK?=
 =?us-ascii?q?hVuMh2BIz4XgQ0bBwWBHYEsP4RXIxk2f4EvdUp3LWkBEheBGoM5AoJBAwsYD?=
 =?us-ascii?q?UgRLDcUGQQ+bgeNbyGCRQ8uHDUwgRyBHQsCkxiSQKEPhCeBZoo7lToaM4Vbp?=
 =?us-ascii?q?RGZCKNyG02EaYFoPIFZTSMVgyIJShkPkUXPOCQ1PQIHAgcOAwuTZgEB?=
IronPort-Data: A9a23:XrxLZKJPfhzi92L6FE+Rh5QlxSXFcZb7ZxGr2PjKsXjdYENShDADx
 jZJUDiPP/rYZ2f3fIpxO4S+oRgFupHSndFhSQEd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZsCCSa/kvxWlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnQ0
 T/Oi5eHYgH9hGQkajh8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN0tAH4YbKo+3d16ECZD0
 8QZLw0xVBeq0rfeLLKTEoGAh+wqKM3teYdasXZ6wHSBULAtQIvIROPB4towMDUY358VW62AI
 ZNHL2MzNnwsYDUXUrsTIIk+neG1jXn2WzZZs1mS46Ew5gA/ySQugOm9aYuEKobiqcN9rgHIq
 j/h803ACyoxD4HH4jCI8U6Pv7qa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+qv6jh2a6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYVX95WVul/4waXx++MvkCSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXMIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:lRPGrKAYlIRO9JDlHel055DYdb4zR+YMi2TDGXofdfUzSL3+qy
 nAppUmPHPP5Qr5HUtQ++xoW5PwJU80i6QU3WB5B97LN2PbUSmTXeRfBODZrQEIdReTygd179
 YHT0EHMqySMXFKyeDn/QK/D9EshPOD8KyumKPi6k0Fd3ASV0mlhD0JcTpy1SZNNXF7OaY=
X-Talos-CUID: =?us-ascii?q?9a23=3AQtK1rWrthm1wvBHlQtDpq2bmUYMpTVOM61H3GEK?=
 =?us-ascii?q?pTmtPcLySdGOq/4oxxg=3D=3D?=
X-Talos-MUID: 9a23:u3I4jAaz/A0ee+BTh3i8iGxFOO5R6p+FMx1Vup8LuPWnDHkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,191,1779148800"; 
   d="scan'208";a="789819982"
Received: from alln-l-core-05.cisco.com ([173.36.16.142])
  by alln-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 29 Jul 2026 06:12:36 +0000
Received: from sjc-ads-8046.cisco.com (sjc-ads-8046.cisco.com [171.68.208.84])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-05.cisco.com (Postfix) with ESMTPS id 2ED621800015E;
	Wed, 29 Jul 2026 06:12:36 +0000 (GMT)
Received: by sjc-ads-8046.cisco.com (Postfix, from userid 1784405)
	id C12DECC160A; Tue, 28 Jul 2026 23:12:35 -0700 (PDT)
From: Shinu Chandran <shinucha@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Shinu Chandran <shinucha@cisco.com>
Subject: [OE-core][PATCH v2] boost: make Boost.Locale ICU backend optional
Date: Tue, 28 Jul 2026 23:12:32 -0700
Message-Id: <20260729061232.3547458-1-shinucha@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260728051641.1997335-1-shinucha@cisco.com>
References: <20260728051641.1997335-1-shinucha@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-8046.cisco.com [171.68.208.84];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.68.208.84, sjc-ads-8046.cisco.com
X-Outbound-Node: alln-l-core-05.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2026 06:12:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242235

Boost.Locale currently always depends on ICU when the locale library is
enabled. That makes ICU a mandatory dependency for users that need
boost-locale but do not need the ICU backend.

Add a separate locale-icu PACKAGECONFIG option and keep it enabled by
default so existing builds retain the same feature set and runtime
linkage. When locale-icu is removed, pass boost.locale.icu=off to
Boost.Build so boost-locale can still be built using the non-ICU
backends without pulling ICU into the dependency graph.

Pass boost.locale.icu=on explicitly when the option is enabled instead
of relying on Boost's default probing behavior. Keep the existing
--disable-icu argument, which controls Boost.Regex ICU support, separate
from the Boost.Locale backend selection.

Tie the ICU dependency to the locale and locale-icu options so
configurations that disable either locale or the ICU backend do not keep
an unused ICU build dependency. This gives distros and SDK builds a
smaller dependency closure while preserving the current default behavior.

Signed-off-by: Shinu Chandran <shinucha@cisco.com>
---
Changes in v2:
- Rename the PACKAGECONFIG option from icu to locale-icu to clarify that
  it controls the Boost.Locale ICU backend only.
- Pass boost.locale.icu=on explicitly when the backend is enabled.
- Keep --disable-icu unchanged because it controls Boost.Regex ICU support.

 meta/recipes-support/boost/boost.inc | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/boost/boost.inc
index 7a343e54f6..7033da181b 100644
--- a/meta/recipes-support/boost/boost.inc
+++ b/meta/recipes-support/boost/boost.inc
@@ -49,8 +49,10 @@ BOOST_LIBS = "\
 	"
 
 # optional libraries
-PACKAGECONFIG ??= "locale python"
-PACKAGECONFIG[locale] = ",,icu"
+PACKAGECONFIG ??= "locale python locale-icu"
+BOOST_LOCALE_ICU_DEP = "${@bb.utils.contains('PACKAGECONFIG', 'locale', 'icu', '', d)}"
+PACKAGECONFIG[locale] = ",,"
+PACKAGECONFIG[locale-icu] = ",,${BOOST_LOCALE_ICU_DEP}"
 PACKAGECONFIG[graph_parallel] = ",,,boost-mpi mpich"
 PACKAGECONFIG[mpi] = ",,mpich"
 PACKAGECONFIG[python] = ",,python3"
@@ -145,10 +147,13 @@ BJAM_TOOLS   = "--ignore-site-config \
 
 # use PARALLEL_MAKE to speed up the build
 BOOST_PARALLEL_MAKE = "${@oe.utils.parallel_make_argument(d, '-j%d')}"
+# --disable-icu below controls Boost.Regex ICU support. Boost.Locale ICU is
+# handled independently with boost.locale.icu.
+BOOST_LOCALE_ICU_OPTS = "${@bb.utils.contains('PACKAGECONFIG', 'locale locale-icu', 'boost.locale.icu=on -sICU_PATH=${STAGING_EXECPREFIXDIR}', 'boost.locale.icu=off', d)}"
 BJAM_OPTS    = '${BOOST_PARALLEL_MAKE} -d+2 -q \
 		${BJAM_TOOLS} \
 		-sBOOST_BUILD_USER_CONFIG=${WORKDIR}/user-config.jam \
-		-sICU_PATH=${STAGING_EXECPREFIXDIR} \
+		${BOOST_LOCALE_ICU_OPTS} \
 		--build-dir=${B} \
 		--disable-icu \
 		${BJAM_EXTRA}'
-- 
2.35.6

