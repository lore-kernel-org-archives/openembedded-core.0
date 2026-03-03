Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00475E67A85
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 06:56:56 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12820.1772521005992855446
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Mar 2026 22:56:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=FrAVlTre;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=75229269e5=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6234sKoX1536224
	for <openembedded-core@lists.openembedded.org>; Tue, 3 Mar 2026 06:56:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=sauyVL6BRZuAVE0bZDYGzM6GpTZcFN1i6jW06DI5I+E=; b=FrAVlTrevRRQ
	9ytRhgd+vX4h7qCP5iDfKl8ui/QxMmnbI53qRwp8dGAJkN4UeVwEexw15BrVb2w/
	XEwVe0Keha9TlpkBDrsAzrO5O807wUMQemKFu7mTFau1ZkgwCX46lTkzg+9MELc6
	JIyXuX8I+aUuDRXQ+ewJLSv0WeGQ263EnE+cPtdxzHokg0PWBRT+SbNFSIpqZaTT
	8Ms/Ck27FSOICJCar/TwrsGoaylo9dGCzc1eiYBMm8WISL7jkyfE6S/yTx7JzwVx
	J5ePYZGgKfoyxNBHwbWeJjIhPkPyUBSbWJ+6LKcZQYi25v1zH/vT6xJWQ8dQgCXj
	uiyYnqAmoA==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ckqb4kac0-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 06:56:44 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 2 Mar 2026 22:56:44 -0800
Received: from pek-lpg-core5.wrs.com (128.224.153.45) by
 ala-exchng01.corp.ad.wrs.com (10.11.232.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Mon, 2 Mar 2026 22:56:43 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 03/19] connman: upgrade 1.45 -> 2.0
Date: Tue, 3 Mar 2026 14:56:24 +0800
Message-ID: <20260303065640.2541884-3-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260303065640.2541884-1-hongxu.jia@windriver.com>
References: <20260303065640.2541884-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=LqWfC3dc c=1 sm=1 tr=0 ts=69a6862c cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=fTW__CHxibyLmBMfj2wP:22 a=Oh2cFVv5AAAA:8 a=t7CeM3EgAAAA:8 a=a_U1oVfrAAAA:8
 a=pGLkceISAAAA:8 a=QyXUC8HyAAAA:8 a=tiDzwS1ZLICzJJZXxMYA:9
 a=7KeoIwV6GZqOttXkcoxL:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: irbCwc5hrhcMM9qGWpjzsPLhlMd_FBwL
X-Proofpoint-ORIG-GUID: irbCwc5hrhcMM9qGWpjzsPLhlMd_FBwL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDA0NyBTYWx0ZWRfX72ph3W+n5lba
 tGmpGe5GBLwYVVSNS0Fo3f8teccFvjRM3vJZ3RY4tLcapE/Myd0qeQhMKmOyCbH3uw1qsFsusWm
 uKw8ZSk+RLSzPliuk840c89zvkdJVRWyNhcDUfHv2vcpYU4EyS+qlg9Vnvibi1exgGjj7MuYIvA
 haDupA7G8CuhLmE9mzSQRYzVcmugMzisLKhx9+2ss3KY/a1FbMLWxLEa8UImF46IlSGOoAkAx2u
 vbFRw+T0/nio3mUuyOiK2aTySpp07afze7nTw1y0Cu0kp40CCsk+oULIlgLjAFRT28O4ZSDHLhN
 RHXjBHzV+EXmZH3ubLzX8ZIX8CHmqe++oDjQNtFq4LoqtsWAbEW9QLIJ/3FtmRJXmZlKLlPOimv
 0ubeo7E0dm/0ZCCnulF2sIfmN8DEmcFEiekaA+jbteTsgEQmAEoLuI7DU02byxhWI8+W7YTdxkT
 uMptznyR4KpOEfZwalg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 phishscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030047
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 06:56:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232241

ver 2.0 [1]:
	Fix issue with agent request on NoReply D-Bus error.
	Add support for DefaultEnabledTechnologies setting.
	Remove installation of include headers.

[1] https://kernel.googlesource.com/pub/scm/network/connman/connman/+/refs/tags/2.0%5E%21/

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...man-vpn-avoid-hiding-implementation-reserved-sym.patch | 5 +----
 .../0002-resolve-musl-does-not-implement-res_ninit.patch  | 2 +-
 .../connman/connman/no-version-scripts.patch              | 8 ++++----
 .../connman/{connman_1.45.bb => connman_2.0.bb}           | 2 +-
 4 files changed, 7 insertions(+), 10 deletions(-)
 mode change 100755 => 100644 meta/recipes-connectivity/connman/connman/0001-connman-vpn-avoid-hiding-implementation-reserved-sym.patch
 rename meta/recipes-connectivity/connman/{connman_1.45.bb => connman_2.0.bb} (99%)

diff --git a/meta/recipes-connectivity/connman/connman/0001-connman-vpn-avoid-hiding-implementation-reserved-sym.patch b/meta/recipes-connectivity/connman/connman/0001-connman-vpn-avoid-hiding-implementation-reserved-sym.patch
old mode 100755
new mode 100644
index 3b7b5a096e..6940e81006
--- a/meta/recipes-connectivity/connman/connman/0001-connman-vpn-avoid-hiding-implementation-reserved-sym.patch
+++ b/meta/recipes-connectivity/connman/connman/0001-connman-vpn-avoid-hiding-implementation-reserved-sym.patch
@@ -1,4 +1,4 @@
-From eac489c872c775c88bbd85b4cec6c1d47ad9e6a6 Mon Sep 17 00:00:00 2001
+From 37ccc55f9493bdcd31bcca29ac35347ca156da2d Mon Sep 17 00:00:00 2001
 From: Peter Tatrai <peter.tatrai.ext@siemens.com>
 Date: Sun, 7 Sep 2025 09:25:20 +0200
 Subject: [PATCH] connman, vpn: avoid hiding implementation-reserved symbols
@@ -45,6 +45,3 @@ index b887706..5cad344 100644
 -		*;
 +		[!_]*;
  };
--- 
-2.47.2
-
diff --git a/meta/recipes-connectivity/connman/connman/0002-resolve-musl-does-not-implement-res_ninit.patch b/meta/recipes-connectivity/connman/connman/0002-resolve-musl-does-not-implement-res_ninit.patch
index 2c612039ee..a75b55d6e7 100644
--- a/meta/recipes-connectivity/connman/connman/0002-resolve-musl-does-not-implement-res_ninit.patch
+++ b/meta/recipes-connectivity/connman/connman/0002-resolve-musl-does-not-implement-res_ninit.patch
@@ -1,4 +1,4 @@
-From 4e726a5aaa75d60fab6a56bc37dbec48be53ff79 Mon Sep 17 00:00:00 2001
+From 16caa22ca9ec9ccd735cf9743dfb70b59b87ef66 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 6 Apr 2015 23:02:21 -0700
 Subject: [PATCH] gweb/gresolv.c: make use of res_ninit optional and subject to
diff --git a/meta/recipes-connectivity/connman/connman/no-version-scripts.patch b/meta/recipes-connectivity/connman/connman/no-version-scripts.patch
index c96ab311e5..54d1fe2c58 100644
--- a/meta/recipes-connectivity/connman/connman/no-version-scripts.patch
+++ b/meta/recipes-connectivity/connman/connman/no-version-scripts.patch
@@ -1,4 +1,4 @@
-From 67f37aafcc8ef5d2eb006387e7bec21f74518727 Mon Sep 17 00:00:00 2001
+From 6a5ac5476207fa745f9a2890042cc98dd892b999 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Tue, 9 Aug 2016 12:12:02 +0100
 Subject: [PATCH] connman: disable version-scripts to fix crashes at startup
@@ -23,10 +23,10 @@ Signed-off-by: Peter Tatrai <peter.tatrai.ext@siemens.com>
  1 file changed, 2 insertions(+), 4 deletions(-)
 
 diff --git a/Makefile.am b/Makefile.am
-index 3dc3bb5..3be5ccb 100644
+index 1e44314..f5366ad 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -143,8 +143,7 @@ src_connmand_LDADD = gdbus/libgdbus-internal.la $(builtin_libadd) \
+@@ -142,8 +142,7 @@ src_connmand_LDADD = gdbus/libgdbus-internal.la $(builtin_libadd) \
  			@GIO_LIBS@ @GLIB_LIBS@ @DBUS_LIBS@ @GNUTLS_LIBS@ \
  			-lresolv -ldl -lrt
  
@@ -36,7 +36,7 @@ index 3dc3bb5..3be5ccb 100644
  
  src_connmand_wait_online_SOURCES = src/connmand-wait-online.c
  
-@@ -187,8 +186,7 @@ vpn_connman_vpnd_LDADD = gdbus/libgdbus-internal.la $(builtin_vpn_libadd) \
+@@ -186,8 +185,7 @@ vpn_connman_vpnd_LDADD = gdbus/libgdbus-internal.la $(builtin_vpn_libadd) \
  				@GIO_LIBS@ @GLIB_LIBS@ @DBUS_LIBS@ @GNUTLS_LIBS@ \
  				-lresolv -ldl
  
diff --git a/meta/recipes-connectivity/connman/connman_1.45.bb b/meta/recipes-connectivity/connman/connman_2.0.bb
similarity index 99%
rename from meta/recipes-connectivity/connman/connman_1.45.bb
rename to meta/recipes-connectivity/connman/connman_2.0.bb
index ca0337b4d3..6f7093301b 100644
--- a/meta/recipes-connectivity/connman/connman_1.45.bb
+++ b/meta/recipes-connectivity/connman/connman_2.0.bb
@@ -25,7 +25,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
            file://0002-resolve-musl-does-not-implement-res_ninit.patch \
            "
 
-SRC_URI[sha256sum] = "77128cce80865455c4f106b5901a575e2dfdb35a7d2e2e2996f16e85cba10913"
+SRC_URI[sha256sum] = "d25c2ddc0b5ad13e986ec35ad765ae8d2f4b7acb47c958a05616c943cd082527"
 
 RRECOMMENDS:${PN} = "connman-conf"
 RCONFLICTS:${PN} = "networkmanager"
-- 
2.34.1


