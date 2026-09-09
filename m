Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC1C1C79FB6
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 13:52:48 +0000 (UTC)
Received: from alln-iport-6.cisco.com (alln-iport-6.cisco.com [173.37.142.93])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12597.1788961964492473758
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2026 06:52:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=avkegnDK;
 spf=pass (domain: cisco.com, ip: 173.37.142.93, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2687; q=dns/txt;
  s=iport01; t=1788961964; x=1790171564;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=c0lOYfsUwFXl9NP78shRW6tVPj5vw5v9mtgBqklHGGQ=;
  b=avkegnDKOUVomOVHWIx6cLfzY/Y7wAazBqx5CDP8Wi9+jDUQDXATpIVB
   QWiCBqCxW9cWSnj7JJ2X/LIGdiVCkYW25NDh4IKhmK+1+cK9nCzSn2pk8
   vMRk/CZOW4iEdCZDruST74icY2q4UUjD9Y5durIfdRCRMhfbcwnAL78oS
   5IIH0TW8ztlvpfI8qzrnR8ShJy5Qp0cAJkJGkJ/h3VEF+7aZ00ZAtkCuL
   vz5px6iOwGW/xawRS+JXTbauPZwaqqq8R/hwIF+OVOYRdCIesyqT+HB3P
   JNU+NjDTmjaXy+3oU8bbPeMxKF3ZlX/dF2UqbfoEHJbh4F7bTeazLagWq
   g==;
X-CSE-ConnectionGUID: PCOqCaq9TLWSvdojbP658w==
X-CSE-MsgGUID: y8RRVZdLQjqGYVz7b5OTCw==
X-IPAS-Result: =?us-ascii?q?A0AmAAAsZKFq/5QQJK1aHQEBAQEJARIBBQUBgXwIAQsBg?=
 =?us-ascii?q?lZ0YUJJjHKHN4E1bAOeG4F7Aw8BAQEPNxoEAQGFBQKOBAImNAkOAQIEAwIDA?=
 =?us-ascii?q?QEBAQEBAQEBAQEBCgEBBQEBAQIBBwWBDhOGXJAdAgEDMgEYAT0gMSsrGYMCA?=
 =?us-ascii?q?YJ0AgHBIkKCLIEBgygBgVTbMQELFAGBOAGFPogidoR8JxsbgXKBE4NrhRCFe?=
 =?us-ascii?q?ASCIoEMlCpIgR4DWSwBVRMNCgsHBYFmAzUSKhVuMh2BIz4XgQcbBgWBHYEng?=
 =?us-ascii?q?z8jGTZ6gQlegSspYRIXgQeCCAKCVIIBAgFJQw4HRVMJJ0EKElMmCxgNSBEsN?=
 =?us-ascii?q?xUZBD5uB48gH4JYMSgBGgcJCoIZEAemHqEPCiiDdowilToaM6ptmQikWoRpg?=
 =?us-ascii?q?Wg8gVlwFYMiCUoZD44uARXQGSQ1AjsCBwIHDgMLk2YBAQ?=
IronPort-Data: A9a23:C4DW/6iPNtZhmFGDv3ub0H0ZX161NhEKZh0ujC45NGQN5FlHY01je
 htvCmCCOP/ZNDH2fth/aY7io08PvMPUyNcxHFdtrHxjEy9jpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FHwdOCn8ikkvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeCULOZ82QsaDxMuvrS8EoHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqUg0cFuKmhXp
 MA8FwsTYheBjdroneKkH7wEasQLdKEHPasWvnVmiDWcBvE8TNWaGuPB5MRT23E7gcUm8fT2P
 pVCL2ExKk2eJUQTaj/7C7pm9AusrnXyfidRtFKSjaE2+GPUigd21dABNfKFIYHSFJ8FxR/wS
 mTu7jTDOC8oOPimyyOqw0y+2eWSuh/QR9dHfFG/3rsw6LGJ/UQUEBAQWF6xrPW1h0L7UNVFJ
 mQQ+zEytu417EGtQ9z3UhG0rXLCuQQTM+e8CMUz7AWLj66R6AGDCy1dF3hKaccts4k9QjlCO
 kK1ou4FzAdH6NW9IU9xPJ/Nxd9uEUD59VM/WBI=
IronPort-HdrOrdr: A9a23:C7BAmqykG9tokajMqlmZKrPwAL1zdoMgy1knxilNoHtuA6ilfq
 +V8sjzuSWYtN9VYgBCpTniAtjkfZqjz/9ICOAqVN/INjUO+lHYTr2KhrGM/9SPIUHDH5ZmtZ
 tIQuxZFMD6C0R8gILR5Qm1FMtl/fy8mZrY4ts3CxxWPHhXg2YK1XYeNjqm
X-Talos-CUID: 9a23:E58gzmBRqa1gNoL6ExFM01c/E9l0Tlni92ncJE2yMTg0GKLAHA==
X-Talos-MUID: 9a23:97odAQuJRl08y5MBLs2nlWFYDvla74CXClkioKsU5MPZEhBbJGLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,270,1779148800"; 
   d="scan'208";a="835092831"
Received: from alln-l-core-11.cisco.com ([173.36.16.148])
  by alln-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 09 Sep 2026 13:52:43 +0000
Received: from sjc-ads-3552.cisco.com (sjc-ads-3552.cisco.com [171.68.249.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-11.cisco.com (Postfix) with ESMTPS id 6A381180001EB
	for <openembedded-core@lists.openembedded.org>; Wed,  9 Sep 2026 13:52:43 +0000 (GMT)
Received: by sjc-ads-3552.cisco.com (Postfix, from userid 1795984)
	id 08F37CC2EC3; Wed,  9 Sep 2026 06:52:43 -0700 (PDT)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH v2] cmake-native: use bundled nghttp2 with bundled curl
Date: Wed,  9 Sep 2026 06:51:53 -0700
Message-Id: <20260909135153.4017038-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260827062638.2141533-1-deeratho@cisco.com>
References: <20260827062638.2141533-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-3552.cisco.com [171.68.249.250];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.68.249.250, sjc-ads-3552.cisco.com
X-Outbound-Node: alln-l-core-11.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 13:52:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245474

From: Himanshu Jadon <hjadon@cisco.com>

cmake.inc enables system library lookup through
CMAKE_USE_SYSTEM_LIBRARIES=1. cmake-native already keeps curl bundled,
but it did not also disable system nghttp2 lookup. With CMake 4.3.1,
the bundled cmcurl configure can enable nghttp2 when headers are found
on the host. The later compile uses only the OE native sysroot, so the
build can fail with:

  fatal error: nghttp2/nghttp2.h: No such file or directory

Disable system nghttp2 lookup for cmake-native also. This keeps it
consistent with the existing bundled curl setting instead of adding a
new native dependency because the host happened to expose nghttp2
during configure.

Add the bundled cmnghttp2 license checksum because the native build now
uses that copy explicitly.

Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0b20ba549d6f17af40b9877eb9ab0c52ca62a18c)
Backport note:
CMake 4.3.1 used by Wrynose has the same behavior: with
CMAKE_USE_SYSTEM_LIBRARIES=1 and system curl disabled,
CMAKE_USE_SYSTEM_NGHTTP2 defaults to ON. If the host provides nghttp2,
configure records the host include and library paths, while do_compile
uses only the OE native sysroot. Therefore this setting is needed for
Wrynose as well.
Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
Changes in v2:
- Clarify that the host nghttp2 detection failure also affects CMake 4.3.1
  used by Wrynose.
- Add a backport note explaining why the setting is required on Wrynose.

 meta/recipes-devtools/cmake/cmake-native_4.3.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/cmake/cmake-native_4.3.1.bb b/meta/recipes-devtools/cmake/cmake-native_4.3.1.bb
index a859cef151..911155773c 100644
--- a/meta/recipes-devtools/cmake/cmake-native_4.3.1.bb
+++ b/meta/recipes-devtools/cmake/cmake-native_4.3.1.bb
@@ -15,6 +15,7 @@ LIC_FILES_CHKSUM:append = " \
     file://Utilities/cmlibrhash/COPYING;md5=a8c2a557a5c53b1c12cddbee98c099af \
     file://Utilities/cmlibuv/LICENSE;md5=ad93ca1fffe931537fcf64f6fcce084d \
     file://Utilities/cmcurl/COPYING;md5=72f4e9890e99e68d77b7e40703d789b8 \
+    file://Utilities/cmnghttp2/COPYING;md5=764abdf30b2eadd37ce47dcbce0ea1ec \
     file://Utilities/cmcppdap/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57 \
 "
 
@@ -34,6 +35,7 @@ EXTRA_OECMAKE += "\
     -DCMAKE_DISABLE_FIND_PACKAGE_Libidn2=ON \
     -DENABLE_ACL=0 -DHAVE_ACL_LIBACL_H=0 \
     -DHAVE_SYS_ACL_H=0 \
+    -DCMAKE_USE_SYSTEM_LIBRARY_NGHTTP2=0 \
 "
 
 # Ensure e2fsprogs isn't found on the host to remove a build dependency and reproducible builds.
-- 
2.53.0

