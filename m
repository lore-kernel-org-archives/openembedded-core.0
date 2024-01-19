Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9F16C47DB7
	for <webhook@archiver.kernel.org>; Fri, 19 Jan 2024 11:34:06 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.19996.1705664039515849744
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jan 2024 03:33:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=eOzki7MG;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1748114a0b=mingli.yu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40J9wrZB012464
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Jan 2024 11:33:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PPS06212021; bh=e3BMi1VPoeGxmwSKXum1uh4i+ua5xkUXBxpbUa6T0ek=; b=
	eOzki7MGrdf0KdWM8cbyAoPW5JyjgOUhXKe6EXVetKhD8Bo6o+BZGdWjzIAWIb+D
	8YtsU48hfiS2N1ZLiF/ZcysxoTQf5stavUV0wIkUChBeF+rwuBOe7IkWn9F8i6Vt
	e7WtEUrPE9hdqy6GGNjnL42bW3BS6JUgyZJzm0CqGXHY+/VhlVuoISEX9HwxJODQ
	5gkcoFzCdNrv7wlotO5ZLlkqOEXT34iAX5KVGg1dN74nDFPL/vVsZNUKEeYtXOOS
	gBCu6Rwa3O35S6qJtH5J3wRNN4PXHLSISig+6/2DlVWxikClDpF0/4KsKTWAWup4
	ls0Z5qMWj3SSlZhbun38KA==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vkfqxf01k-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Jan 2024 11:33:58 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 19 Jan 2024 03:34:09 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Fri, 19 Jan 2024 03:34:08 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 3/3] libgcrypt: Make the version consistent
Date: Fri, 19 Jan 2024 19:33:54 +0800
Message-ID: <20240119113354.3000697-3-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240119113354.3000697-1-mingli.yu@windriver.com>
References: <20240119113354.3000697-1-mingli.yu@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: sJAbG2qDV-iSycYFc_n85RHIRoTGNWzw
X-Proofpoint-ORIG-GUID: sJAbG2qDV-iSycYFc_n85RHIRoTGNWzw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-19_06,2024-01-19_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 mlxlogscore=999 clxscore=1015 bulkscore=0 mlxscore=0 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401190055
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jan 2024 11:34:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194031

From: Mingli Yu <mingli.yu@windriver.com>

The change [1] extends a -unknown suffix to version and introduces
the version inconsistency.

Before the patch:
   # rpm -qa | grep libgcrypt
   libgcrypt-1.10.3-r0.core2_64
   libgcrypt-ptest-1.10.3-r0.core2_64
   # rpm -ql libgcrypt
   /usr
   /usr/bin
   /usr/bin/mpicalc
   /usr/lib64
   /usr/lib64/libgcrypt.so.20
   /usr/lib64/libgcrypt.so.20.4.3
   # mpicalc --help
   mpicalc 2.0
   libgcrypt 1.10.3-unknown
   [snip]

After the patch:
   # rpm -qa | grep libgcrypt
   libgcrypt-1.10.3-r0.core2_64
   libgcrypt-ptest-1.10.3-r0.core2_64
   # rpm -ql libgcrypt
   /usr
   /usr/bin
   /usr/bin/mpicalc
   /usr/lib64
   /usr/lib64/libgcrypt.so.20
   /usr/lib64/libgcrypt.so.20.4.3
   # mpicalc --help
   mpicalc 2.0
   libgcrypt 1.10.3
   [snip]

[1] https://git.gnupg.org/cgi-bin/gitweb.cgi?p=libgcrypt.git;a=commitdiff;h=0f2c6ce2;hp=86e5e06a97ae13b8bbf6923ecc76e02b9c429b46

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...autogen.sh-Remove-the-unknown-suffix.patch | 50 +++++++++++++++++++
 .../libgcrypt/libgcrypt_1.10.3.bb             |  1 +
 2 files changed, 51 insertions(+)
 create mode 100644 meta/recipes-support/libgcrypt/files/0001-autogen.sh-Remove-the-unknown-suffix.patch

diff --git a/meta/recipes-support/libgcrypt/files/0001-autogen.sh-Remove-the-unknown-suffix.patch b/meta/recipes-support/libgcrypt/files/0001-autogen.sh-Remove-the-unknown-suffix.patch
new file mode 100644
index 0000000000..6023eb82b2
--- /dev/null
+++ b/meta/recipes-support/libgcrypt/files/0001-autogen.sh-Remove-the-unknown-suffix.patch
@@ -0,0 +1,50 @@
+From c951a588d63d0fdf8571112a04dec5d09b27bc3c Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Thu, 18 Jan 2024 16:45:56 +0800
+Subject: [PATCH] autogen.sh: Remove the unknown suffix
+
+The commit [0f2c6ce2 build: Let configure create the VERSION file.] [1]
+extends the version to make the version inconsistent as below:
+   # rpm -qa | grep libgcrypt
+   libgcrypt-1.10.3-r0.core2_64
+   libgcrypt-ptest-1.10.3-r0.core2_64
+   # rpm -ql libgcrypt
+   /usr
+   /usr/bin
+   /usr/bin/mpicalc
+   /usr/lib64
+   /usr/lib64/libgcrypt.so.20
+   /usr/lib64/libgcrypt.so.20.4.3
+   # mpicalc --help
+   mpicalc 2.0
+   libgcrypt 1.10.3-unknown
+   [snip]
+
+Considering we mainly use a release version in oe, so remove the added
+suffix to keep consistent.
+
+[1] https://git.gnupg.org/cgi-bin/gitweb.cgi?p=libgcrypt.git;a=commitdiff;h=0f2c6ce2;hp=86e5e06a97ae13b8bbf6923ecc76e02b9c429b46
+
+Upstream-Status: Inappropriate [OE-Specific as we use a release version in oe]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ .../libgcrypt/1.10.3/libgcrypt-1.10.3/autogen.sh                | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/autogen.sh b/autogen.sh
+index 9b36158..d5cccd2 100755
+--- a/autogen.sh
++++ b/autogen.sh
+@@ -266,7 +266,7 @@ if [ "$myhost" = "find-version" ]; then
+     else
+       ingit=no
+       beta=yes
+-      tmp="-unknown"
++      tmp=""
+       rev="0000000"
+       rvd="0"
+     fi
+-- 
+2.25.1
+
diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb b/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb
index 1c4f4d6038..a2f97d08f0 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb
+++ b/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb
@@ -25,6 +25,7 @@ SRC_URI = "${GNUPG_MIRROR}/libgcrypt/libgcrypt-${PV}.tar.bz2 \
            file://0004-tests-Makefile.am-fix-undefined-reference-to-pthread.patch \
            file://no-native-gpg-error.patch \
            file://no-bench-slope.patch \
+           file://0001-autogen.sh-Remove-the-unknown-suffix.patch \
            file://run-ptest \
            "
 SRC_URI[sha256sum] = "8b0870897ac5ac67ded568dcfadf45969cfa8a6beb0fd60af2a9eadc2a3272aa"
-- 
2.25.1


