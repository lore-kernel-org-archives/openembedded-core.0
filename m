Return-Path: <shinucha@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9780C5DF6D
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 12:11:07 +0000 (UTC)
Received: from alln-iport-8.cisco.com (alln-iport-8.cisco.com [173.37.142.95])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5579.1787141460688929370
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Aug 2026 05:11:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=DTPZw4XY;
 spf=pass (domain: cisco.com, ip: 173.37.142.95, mailfrom: shinucha@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2427; q=dns/txt;
  s=iport01; t=1787141460; x=1788351060;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8vSlc8dAVrDk/CtA3vWl5LTJUBK67Gf1R0cMGnP6Oww=;
  b=DTPZw4XY50eDhss5qMi85td4F6B9A03IwUBHZDLlcXmukYygbowLTCdP
   FrkY22CK6CSINdrvExl+A8Q4HIZYsloeztePzX3k3jWJy+pyvcZPXhNMS
   mUsKlXX8Ndnm2yf6yNKR1nwM7y6NCHc/zG2+6xKFqk1ZQA8YMtz47GbwJ
   xy8rIsFgfkrciVoia1vaolXKI9UdED/pIkYhwwH36c1Z3ghreFLVSKSvE
   MvpBSXd6GLRqwiJNwlhumUlzmcIi2rvAbsikjg8mJf6xRa2I3Gvu/lOq3
   bVXsqkLwL6g8OW5dTrTvWmgvgO2gGRPYaHcS6PitpT94Tjsl0ikGV1Fyf
   A==;
X-CSE-ConnectionGUID: Tvm2lv1jSXytlbx7aSkZFg==
X-CSE-MsgGUID: NMOmg656Sf+7n+a8mJOadQ==
X-IPAS-Result: =?us-ascii?q?A0D6AgAmnIVq/44QJK1aH4I6gld0X0JJlkqeHhSBag8BA?=
 =?us-ascii?q?QEPMSAEAQGFBQKNawImNgcOAQIEAwIDAQEBAQEBAQEBAQELAQEFAQEBAgEHB?=
 =?us-ascii?q?YEOE4ZPDYZbAgEDMgE/BxBRKysZgwIBgnQCAcNCgiyBAd5HgWYBCxQBBYEzh?=
 =?us-ascii?q?XGHcHaEfCcbgUlEhH6EKWeFeASDLoF4kUdIgR4DWSwBVRMNCgsHBYFmAzUSK?=
 =?us-ascii?q?hVuMh2BIz4XgQ0bBgWBHYEohDcjGTZ6gQlegSsqYQESF4EJggoCgnOCBgIBS?=
 =?us-ascii?q?UURCgsLGA1IESw3FBkEPm4HjkkggkdYATWBTF1AC6Vaiy+VYIQogWaKO5U6G?=
 =?us-ascii?q?jOFW5YSjn+ZCKRahGmBbwwpgVlNIxWDIglKGQ+RRc0XJDU/BwIHDwKRdS2BT?=
 =?us-ascii?q?wEB?=
IronPort-Data: A9a23:I2iAdaPqYIe04GPvrR3IlsFynXyQoLVcMsEvi/4bfWQNrUoqhWABy
 DROCjyPOPbbNGKkfoxzaNy+8kkHvJ6Em9AyQXM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeaphyFTmE+kvF3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WV7lV
 e/a+ZWFZgf1gm8sawr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj68lwCRsyI9QawdZmHWVE5
 aMREzM/QB/W0opawJrjIgVtrs0nKM+uOMYUvWttiGmES/0nWpvEBa7N4Le03h9p2ZsIRqiYP
 pRfMGY1BPjDS0Un1lM/E5I/mvqjhnDXeDxDo1XTrq0yi4TW5Fwoi+e2bYeJJrRmQ+1zu2Gdq
 TyboV/3QU4cd9XPzBii+36V07qncSTTHdh6+KeD3uRtm0bVzHEJFBoQfVKhpL+yjUvWc9VHJ
 koZ/yAjoaQ/+AmgScPwdxm5u2Kf+BkEVtxdFuc35A2AxuzT+QnxO4QfZjdFbNpjsIo9QiYnk
 wfU2djoHjdo9raSTBpx64upkN97AgBNRUdqWMPOZVJtDwXLyG3rsi/ycw==
IronPort-HdrOrdr: A9a23:wuw/e6CRNDElXkvlHel055DYdb4zR+YMi2TDGXofdfUzSL3+qy
 nAppUmPHPP5Qr5HUtQ++xoW5PwJU80i6QU3WB5B97LN2PbUSmTXeRfBODZrQEIdReTygd179
 YHT0EHMqySMXFKyeDn/QK/D9EshPOD8KyumKPi6k0Fd3ASV0mlhD0JcTpy1SZNNXF7OaY=
X-Talos-CUID: 9a23:PwYjmm/BcttpxtzmY5KVv3IKH5ohbCTf90fBP0uyGTlgc76nZ1DFrQ==
X-Talos-MUID: 9a23:MQR+fQQ40f4HD2mORXTKoRZnO5k1vZ+gSx8L0pxWvuujPCBJbmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,231,1779148800"; 
   d="scan'208";a="813735544"
Received: from alln-l-core-05.cisco.com ([173.36.16.142])
  by alln-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 19 Aug 2026 12:10:59 +0000
Received: from sjc-ads-8046.cisco.com (sjc-ads-8046.cisco.com [171.68.208.84])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-05.cisco.com (Postfix) with ESMTPS id A9536180004AA;
	Wed, 19 Aug 2026 12:10:59 +0000 (GMT)
Received: by sjc-ads-8046.cisco.com (Postfix, from userid 1784405)
	id 3E55FE1DB3D; Wed, 19 Aug 2026 05:10:59 -0700 (PDT)
From: Shinu Chandran <shinucha@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Ross@cisco.com, Burton@cisco.com, ross.burton@arm.com,
	xe-linux-external@cisco.com, Shinu Chandran <shinucha@cisco.com>
Subject: [OE-core] [master] [PATCH v3] boost: make ICU support configurable
Date: Wed, 19 Aug 2026 05:10:58 -0700
Message-Id: <20260819121058.2019725-1-shinucha@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260729061232.3547458-1-shinucha@cisco.com>
References: <20260729061232.3547458-1-shinucha@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-8046.cisco.com [171.68.208.84];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.68.208.84, sjc-ads-8046.cisco.com
X-Outbound-Node: alln-l-core-05.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 12:11:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243728

Boost.Locale and Boost.Regex both have optional ICU support, but the recipe depended on icu via PACKAGECONFIG[locale] while still passing --disable-icu to b2. That made the dependency relationship confusing and kept the Boost.Regex ICU toggle separate from the Boost.Locale one.

Add an explicit icu PACKAGECONFIG, enabled by default, and use PACKAGECONFIG_CONFARGS to pass the generated b2 arguments. When icu is removed from PACKAGECONFIG the recipe drops the icu dependency and passes boost.locale.icu=off --disable-icu; when enabled it passes boost.locale.icu=on with ICU_PATH.

This lets distros remove the ICU dependency consistently without disabling the Boost.Locale library itself.

Signed-off-by: Shinu Chandran <shinucha@cisco.com>
---
  Changes in v3:
  - Replace locale-icu with a single icu PACKAGECONFIG covering ICU use in Boost.
  - Drop BOOST_LOCALE_ICU_DEP and use a direct icu dependency.
  - Move Boost.Build enable/disable arguments into PACKAGECONFIG[icu].
  - Pass ${PACKAGECONFIG_CONFARGS} through BJAM_OPTS.
  - Validate both default and PACKAGECONFIG:remove:pn-boost = "icu" builds.

  Changes in v2:
  - Rename the PACKAGECONFIG option from icu to locale-icu.
  - Pass boost.locale.icu=on explicitly when enabled.
  
 meta/recipes-support/boost/boost.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/boost/boost.inc
index 7a343e54f6..bff5120e18 100644
--- a/meta/recipes-support/boost/boost.inc
+++ b/meta/recipes-support/boost/boost.inc
@@ -49,8 +49,9 @@ BOOST_LIBS = "\
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
@@ -148,9 +149,8 @@ BOOST_PARALLEL_MAKE = "${@oe.utils.parallel_make_argument(d, '-j%d')}"
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


