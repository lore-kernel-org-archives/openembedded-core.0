Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3EDCC5DF81
	for <webhook@archiver.kernel.org>; Thu, 20 Aug 2026 05:45:25 +0000 (UTC)
Received: from alln-iport-5.cisco.com (alln-iport-5.cisco.com [173.37.142.92])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.834.1787204719655079936
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Aug 2026 22:45:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=d/22fPEc;
 spf=pass (domain: cisco.com, ip: 173.37.142.92, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1716; q=dns/txt;
  s=iport01; t=1787204719; x=1788414319;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Ka2fwPN6BsOZTn6GW8sYd2UEol7VNDuEoOi3S8FTm8w=;
  b=d/22fPEcrK8T/uqNUhO5CQwj1dsHMpr9e8qgYmakRK+IulZ3TG1XpjBW
   cKTrLc9s9FrGGVw+D+GSI22SwF88ugMQGnu90drJmq7p/KOvAbeZzHW0q
   b1jGXXWdJOMTqJaxAliHc66KXKIzbnyEAziyWzihcvA6TG7SA8J8qm/Fh
   faRm3dy91DA5H/hi4APbU9rdiBm3PhSt0KEifdO3cdDoX1TlSbBeQ6vcz
   fuaTFMK1MT60fQVTZNXXeZePbx0WyR5xF3b7ApQVTMepPaXnY7koYsa68
   6w2WHPbyxMBxeTePDjFUK0T7cyZ7PKiaooYgIXkcIdue3h+7ELCW5rdvq
   g==;
X-CSE-ConnectionGUID: cmHn9yaTTdu3bpW/ayrz1Q==
X-CSE-MsgGUID: 3IfCRXN9RmWcxwkrtdSMvw==
X-IPAS-Result: =?us-ascii?q?A0BCAgDak4Zq/5EQJK1aglmCV3ReQ0mTWQGCBJ8KgX4PA?=
 =?us-ascii?q?QEBDzcaBAEBhQWNbQImNAkOAQIEAwIDAQEBAQEBAQEBAQELAQEFAQEBAgEHB?=
 =?us-ascii?q?YEOE4ZPDYZdKwsBGAEtMFxEgwIBgnQDwkOBeTOBAYMoAd0EAQsUAYE4hT+II?=
 =?us-ascii?q?nUBhHwnGxuBcoEVg2mEChF1hXgEgiJ6EpNKSIEeA1ksAVUTDQoLBwWBZgM1E?=
 =?us-ascii?q?ioVbjIdgSM+F4ENGwYFgR2BKIQ3Ixk2fIEJXoErKmEBEheBCYIKAoJwggYCA?=
 =?us-ascii?q?UlFDgkXCxgNSBEsNxQZBD5uB45RIIJLgQ4rgUSUY5F8oQ8KKIN2jCGVOhozh?=
 =?us-ascii?q?VulEZkIjgqVZ2mEaYFoPIFZcBWDIglKGQ+OLhWIOMdhJzICOwEBBwIHDgMLg?=
 =?us-ascii?q?WiQAAEngVYBAQ?=
IronPort-Data: A9a23:eJPxC6Ijd8FOrRSCFE+R3pQlxSXFcZb7ZxGr2PjKsXjdYENS3jFVn
 2YXWmmDOvnfMzfweNwgPY/l8EhUscSBm9ZkGgcd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZsCCSa/kvxWlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnQ0
 T/Oi5eHYgH9i2clajh8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN1lCWEwbJwRxtp7HDpE7
 cNfISEXfEm60rfeLLKTEoGAh+wqKM3teYdasXZ6wHSBXbAtQIvIROPB4towMDUY358VW62AI
 ZNHL2MzMXwsYDUXUrsTIJ49keOhh2j2WzZZs1mS46Ew5gA/ySQhieS8YYGFKobiqcN9xWeWj
 Vj22TXDBy4RJMOc0yaJyVeymbqa9c/8cMdIfFGizdZviUGTx2EOThELX1y6uryzkE+3Xd53I
 UsT5i4vq+4580nDZsb0WRK9sVaKoxwdR8FNVeY97WmlzbLZ5QucDGUIQjNNLdchrsIeQT0xy
 kTPmMvkAzFqurCZRX+RsLCOoluP1TM9JGsGY2oACAAC+dSm+NF1hRPURdElG6mw5jHoJQzNL
 /mxhHBWr90uYQQjjs1XIXivb+qQm6X0
IronPort-HdrOrdr: A9a23:OTvxP69mydiyof4sw6xuk+DuI+orL9Y04lQ7vn2ZhyY7TiX+rb
 HKoB11737JYVoqNU3I+urwWpVoP0m9yXcd2+B4Vt2ftWLd1ldAQrsP0WKb+UyCJwTOsshAyK
 xnb69yTPf0DVR8kILGxTPQKadF/DFCm5rY49s3CBxWPGZXV50=
X-Talos-CUID: 9a23:of2qLG8pKzpOe4etbbuVv0UROsZ0Y3Th8HvNeEWgNiFgWaeHEGbFrQ==
X-Talos-MUID: 9a23:uM+sagv8iKMEQ9J1X82n3xBsH/1YxfWUDX8GgYoFodWIDgluJGLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,232,1779148800"; 
   d="scan'208";a="814993882"
Received: from alln-l-core-08.cisco.com ([173.36.16.145])
  by alln-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Aug 2026 05:45:18 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-08.cisco.com (Postfix) with ESMTPS id AE9ED18000443;
	Thu, 20 Aug 2026 05:45:18 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 4505CCCA79B; Wed, 19 Aug 2026 22:45:18 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [OE-core][wrynose][PATCH 1/2] python3-pyasn1: upgrade 0.6.2 -> 0.6.3
Date: Wed, 19 Aug 2026 22:45:12 -0700
Message-Id: <20260820054513.1485187-1-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: alln-l-core-08.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2026 05:45:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243801

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- CVE-2026-30922 (GHSA-jr27-m4p2-rc6r): Added nesting depth limit to ASN.1
  decoder to prevent stack overflow from deeply nested structures
- Fixed OverflowError from oversized BER length field
- Fixed DeprecationWarning stacklevel for deprecated attributes
- Fixed asDateTime incorrect fractional seconds parsing

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit a82592f0a7d104f617f206fe0b9bcaf7f9df3efc)
Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../python/{python3-pyasn1_0.6.2.bb => python3-pyasn1_0.6.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pyasn1_0.6.2.bb => python3-pyasn1_0.6.3.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-pyasn1_0.6.2.bb b/meta/recipes-devtools/python/python3-pyasn1_0.6.3.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-pyasn1_0.6.2.bb
rename to meta/recipes-devtools/python/python3-pyasn1_0.6.3.bb
index b44e877447..60b38c57c5 100644
--- a/meta/recipes-devtools/python/python3-pyasn1_0.6.2.bb
+++ b/meta/recipes-devtools/python/python3-pyasn1_0.6.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://pyasn1.sourceforge.net/"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=190f79253908c986e6cacf380c3a5f6d"
 
-SRC_URI[sha256sum] = "9b59a2b25ba7e4f8197db7686c09fb33e658b98339fadb826e9512629017833b"
+SRC_URI[sha256sum] = "697a8ecd6d98891189184ca1fa05d1bb00e2f84b5977c481452050549c8a72cf"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
-- 
2.35.6


