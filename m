Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
 by mx.groups.io with SMTP id smtpd.web10.7574.1588715738910991796
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 May 2020 14:55:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@skidata.com header.s=selector1 header.b=OEt/P7e4;
 spf=pass (domain: skidata.com, ip: 91.230.2.99, mailfrom: prvs=3877ea1dc=richard.leitner@skidata.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
  t=1588715739; x=1620251739;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=6Jr3V8Kv5PF1RqdCkuKx+0nPfSkhW/Y79xs7NWvz3AU=;
  b=OEt/P7e49Snyjjc93iwM0v+OiCk5118KGuIJT/PLO46vEU8N0Ii6hrx+
   8otWDe2W/bXtnLDR07sK2lCrqwFndyM1uBZnihlVKW6TU2NxvWXoqy8MP
   Dn3PV1MHDoTKnRg6GE2enFRVtAsYmwUZv4Wu9dUFRdc1dEejmNLi9XZj6
   vT+wUW/O4NNnWKUf6GATeaUpnuGVGM6BvGjx9BtTolLjcbmGfEkQOXim9
   1/JZirUafspRYmcLlXTvhvhfnGjh3xcR6XgiioEHB11RH1pLcS7Sz2gDo
   +WnIJpdd3X2pFnmjTwc6ri2tSolPO+8gRavUwlR/IAo5l0NWCOqBwkOEx
   Q==;
IronPort-SDR: YZSZnb4XvRdhiYzbL+vDBlbXO/Lzc4l2FliSpkFyBWsp/ROF5Jlm0uBo0tWWGW8Zua54Cl7Nsr
 SPz644upGg01LrD81GoSbKibQ8jx4mMjQitNcUJTzMISl3TYAurMxG9ycSstPX+zlAr1AWwOqQ
 A7J3Rrn2jeC28o5Ip4EilGA6yqU6T+myZdBzpvxvyb1UjcxHUOrGlmQeYDTCDoZcD44LF48pV/
 j/qLte0ChbdHGI34CBpJxT85Y54QDis7HeT9+vl/oo5+wk3NU2yjDNNPh0mS8sQtHE6HnrNTI3
 iqM=
X-IronPort-AV: E=Sophos;i="5.73,356,1583190000"; 
   d="scan'208";a="24176979"
From: "Richard Leitner" <richard.leitner@skidata.com>
To: <openembedded-core@lists.openembedded.org>
CC: Richard Leitner <richard.leitner@skidata.com>
Subject: [PATCH 1/2] libtirpc: remove extra "-fcommon" from CFLAGS
Date: Tue, 5 May 2020 23:55:20 +0200
Message-ID: <20200505215521.238753-1-richard.leitner@skidata.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Return-Path: richard.leitner@skidata.com
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex3srv.skidata.net (192.168.111.81) To
 sdex5srv.skidata.net (192.168.111.83)
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

commit daed7eedba ("Avoid multiple-definiton with gcc -fno-common") of
libtirpc fixed the -fno-common issues. Therefore it should be save to
remove the extra "-fcommon" in CFLAGS.

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
---
 meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb b/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb
index 6100d157e5..10a324c3b6 100644
--- a/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb
+++ b/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb
@@ -19,8 +19,6 @@ inherit autotools pkgconfig
 
 EXTRA_OECONF = "--disable-gssapi"
 
-CFLAGS += "-fcommon"
-
 do_install_append() {
 	chown root:root ${D}${sysconfdir}/netconfig
 }
-- 
2.26.2

