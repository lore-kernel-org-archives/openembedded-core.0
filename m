Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93B8BE6F076
	for <webhook@archiver.kernel.org>; Tue, 23 Dec 2025 08:55:12 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.97598.1766480103544566007
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Dec 2025 00:55:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=QNF++0ER;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=44520b30bf=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN4F5h01715505
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 08:55:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=5WF5D6nhD5V8KCoWR8xa
	2gAaVObQkH3koBagbmaQY7g=; b=QNF++0ERj+2RSdjVe6O1orfP9ZSNZ0z7F1sh
	kMg8/YgD/ntwR944yRg3d4n6KG4jfImPzBdzEbpFUGz/RHPLnsGXwZ6PnyLDVKHp
	ePtSohPKCQzR93gJdHMQxcd2VH0QezFoEgcv5l1NAD0FePLXpGcYK9VXWOtwZD90
	Mp+0Qcqw5SFroI/uUMgEgMUZaxOJDgLFJoVq0j+B4PSS8632Zs0GFWPM5Vv2kubO
	EyVEBVl7Mq/w3RXn4zzEQHKSqNVv7QaSg1YX9dYOlScg1nISONtOwQ2b4HGm9Y0n
	pElo+GfrI+RpCX5kMdZPcGv19dyO/VPDQzRIwWr3ytoYInIVHw==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b5h0vjwge-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 08:55:02 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Tue, 23 Dec 2025 00:55:01 -0800
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Tue, 23 Dec 2025 00:55:00 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] vte: fix build failed for ppc64
Date: Tue, 23 Dec 2025 16:54:53 +0800
Message-ID: <20251223085453.1635323-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: U6xthVZt9qwHsSKy_ZyIb_401c7qNCM2
X-Authority-Analysis: v=2.4 cv=I6Fohdgg c=1 sm=1 tr=0 ts=694a58e6 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8
 a=3cCsK628I2U-VFOQBP4A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: U6xthVZt9qwHsSKy_ZyIb_401c7qNCM2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA3MyBTYWx0ZWRfX0L8vns9LJ2uG
 GaH0QHQ2lsZPI4ZqAd5hvnN+jKWgQlVvKYdV8kJY04g4LJZFuIO4pUFILo/uYWyIJSAvpbXsnUT
 MLngDmsLZnRWNZVNNwDEMV/fjE58xNYcmY0ieX63jEq/OuuTIRNHZEo2GXYLaiBYhjVgoh0VPDt
 WAtGgEt6ddfh9IENcHYONVm9ehuGimhuPZZOKwJtCSzD3O7HRY8zTJYPljAD9tu+Nn4Dmx6CAv0
 mv75Cfn2khmMHN63nr0B4EOro7V290yC/YbDFOLonVfZGouBO4pHXoHwZk4IS5T7dc6jqlw/MkN
 +VI+smfRMQzk/UnmqAmeywphn86n5h3bBv93J9nrZY6kLzo1rBlb3uKu98v8DO/WUzv57PauLf5
 Y4VfXFM9X//M45d3YS3bzggOkBmXpHq75otUGdRbiHRlhXRRpL29abEQMbkwHQ7IlTlYvs/eX55
 IJBmn2yTxYBEX0MxKxA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230073
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 08:55:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228459

$ echo 'MACHINE = "qemuppc64"' >> conf/local.conf
$ bitbake vte
...
|subprojects/simdutf/simdutf.cpp:20533:7: error: there are no arguments to 'write_v_u16_11bits_to_utf8' that depend on a template parameter, so a declaration of 'write_v_u16_11bits_to_utf8' must be available [-Wtemplate-body]
|20533 |       write_v_u16_11bits_to_utf8(
|      |       ^~~~~~~~~~~~~~~~~~~~~~~~~~
|subprojects/simdutf/simdutf.cpp:20533:7: note: (if you use '-fpermissive', G++ will accept your code, but allowing the use of an undeclared name is deprecated)
|subprojects/simdutf/simdutf.cpp:20559:7: error: there are no arguments to 'ppc64_convert_utf16_to_1_2_3_bytes_of_utf8' that depend on a template parameter, so a declaration of 'ppc64_convert_utf16_to_1_2_3_bytes_of_utf8' must be available [-Wtemplate-body]
|20559 |       ppc64_convert_utf16_to_1_2_3_bytes_of_utf8(
|      |       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|subprojects/simdutf/simdutf.cpp:20533:33: error: 'write_v_u16_11bits_to_utf8' was not declared in this scope
|20533 |       write_v_u16_11bits_to_utf8(
|      |       ~~~~~~~~~~~~~~~~~~~~~~~~~~^
|20534 |           in, utf8_output, as_vector_u8(one_byte_bytemask), one_byte_bitmask);
|      |           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
...

The source file subprojects/simdutf/simdutf.cpp is generated by python3
script singleheader/amalgamate.py and the definition of write_v_u16_11bits_to_utf8
for ppc64 requires option --with-utf16 and --with-latin1

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../0001-fix-compile-failed-on-ppc64.patch    | 50 +++++++++++++++++++
 meta/recipes-support/vte/vte_0.82.1.bb        |  3 ++
 2 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-support/vte/vte/0001-fix-compile-failed-on-ppc64.patch

diff --git a/meta/recipes-support/vte/vte/0001-fix-compile-failed-on-ppc64.patch b/meta/recipes-support/vte/vte/0001-fix-compile-failed-on-ppc64.patch
new file mode 100644
index 0000000000..24568f9b8c
--- /dev/null
+++ b/meta/recipes-support/vte/vte/0001-fix-compile-failed-on-ppc64.patch
@@ -0,0 +1,50 @@
+From de8a97d73613378fd86467c1323eac7aaaa3154d Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Tue, 23 Dec 2025 16:18:52 +0800
+Subject: [PATCH] fix compile failed on ppc64
+
+...
+|subprojects/simdutf/simdutf.cpp:20533:7: error: there are no arguments to 'write_v_u16_11bits_to_utf8' that depend on a template parameter, so a declaration of 'write_v_u16_11bits_to_utf8' must be available [-Wtemplate-body]
+|20533 |       write_v_u16_11bits_to_utf8(
+|      |       ^~~~~~~~~~~~~~~~~~~~~~~~~~
+|subprojects/simdutf/simdutf.cpp:20533:7: note: (if you use '-fpermissive', G++ will accept your code, but allowing the use of an undeclared name is deprecated)
+|subprojects/simdutf/simdutf.cpp:20559:7: error: there are no arguments to 'ppc64_convert_utf16_to_1_2_3_bytes_of_utf8' that depend on a template parameter, so a declaration of 'ppc64_convert_utf16_to_1_2_3_bytes_of_utf8' must be available [-Wtemplate-body]
+|20559 |       ppc64_convert_utf16_to_1_2_3_bytes_of_utf8(
+|      |       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+|subprojects/simdutf/simdutf.cpp:20533:33: error: 'write_v_u16_11bits_to_utf8' was not declared in this scope
+|20533 |       write_v_u16_11bits_to_utf8(
+|      |       ~~~~~~~~~~~~~~~~~~~~~~~~~~^
+|20534 |           in, utf8_output, as_vector_u8(one_byte_bytemask), one_byte_bitmask);
+|      |           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+...
+
+Build failed on ppc64, the definition of write_v_u16_11bits_to_utf8 requires
+--with-utf16 and --with-latin1
+
+Upstream-Status: Inappropriate [Yocto specific for ppc64]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ meson.build | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 330ee89..a6c64ca 100644
+--- a/meson.build
++++ b/meson.build
+@@ -41,10 +41,11 @@ simdutf_amalgamate = [
+   '--no-zip',
+   '--no-readme',
+   '--with-utf8',
+-  # '--with-utf16',
++  '--with-utf16',
+   '--with-utf32',
+   # '--with-base64',
+   # '--with-detect-enc',
++  '--with-latin1',
+   '--with-ascii',
+ ]
+ 
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/vte/vte_0.82.1.bb b/meta/recipes-support/vte/vte_0.82.1.bb
index b5d6f2fb62..3179393bd4 100644
--- a/meta/recipes-support/vte/vte_0.82.1.bb
+++ b/meta/recipes-support/vte/vte_0.82.1.bb
@@ -20,6 +20,9 @@ inherit gnomebase gi-docgen features_check upstream-version-is-even gobject-intr
 SRC_URI += "file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch \
             file://0001-support-reproducibility-for-debug-sources.patch;patchdir=./subprojects/simdutf \
 "
+SRC_URI:append:class-target:powerpc64le = " \
+            file://0001-fix-compile-failed-on-ppc64.patch;patchdir=./subprojects/simdutf \
+"
 
 SRC_URI[archive.sha256sum] = "79376d70402d271e2d38424418e1aea72357934d272e321e3906b71706a78e3a"
 
-- 
2.34.1


