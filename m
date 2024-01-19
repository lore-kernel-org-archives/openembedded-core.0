Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 024ABC47DAF
	for <webhook@archiver.kernel.org>; Fri, 19 Jan 2024 11:34:07 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.19966.1705664038947193421
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jan 2024 03:33:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=d5GXeSRE;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1748114a0b=mingli.yu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40J9wrZA012464
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Jan 2024 11:33:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PPS06212021; bh=3YSOaqu5a3wWR/DmHQL2zklJN69hpr70djbOkoW99xU=; b=
	d5GXeSREMnmgHczFUsfcATwHpa3sl7cJrNXSI6a19hrK28XI2jaVrR37dtSFP2T5
	nmy5CYBFoU/ZpXmSqlOobTn2mWnNabNV0mVteuT5IrjtwvJiRL4u2bgpVx8JpXRP
	6172aSBDYos3X6uLGPwElE9mD32njTu0fYV7A2McJ4fJz1BGDprE+Dnsb1D6Ii9W
	Yb2kfqqZekuNSEz6uOIOa/U4QoO4he7KTrWy3iiG5AGAAOypSOVgyesgYQaeEyoG
	c+tnE3/MYWEhne7lvHGLdGtcplpW9rYyy4LDc+LbV1OzcP07S9bnNClnSqFN1L31
	4H0OtH+MnZgtyL1w9v8Opw==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vkfqxf01k-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Jan 2024 11:33:58 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 19 Jan 2024 03:34:08 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Fri, 19 Jan 2024 03:34:07 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 2/3] gnupg: Make the version consistent
Date: Fri, 19 Jan 2024 19:33:53 +0800
Message-ID: <20240119113354.3000697-2-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240119113354.3000697-1-mingli.yu@windriver.com>
References: <20240119113354.3000697-1-mingli.yu@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: rxf2f5AfgpHh5igd3-lXSTsVxpDbNTvF
X-Proofpoint-ORIG-GUID: rxf2f5AfgpHh5igd3-lXSTsVxpDbNTvF
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
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jan 2024 11:34:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194030

From: Mingli Yu <mingli.yu@windriver.com>

The commit [b67e4e523 Improve the beta number generation.] [1]
extends the version to make it work well for no release version,
but it introduces the version inconsistency.

Considering we mainly use a release version in oe, so remove the
added suffix to keep consistent.

Before the patch:
 # rpm -qa | grep gnupg
 gnupg-gpg-2.4.3-r0.core2_64
 gnupg-2.4.3-r0.core2_64
 # gpgv --version
 gpgv (GnuPG) 2.4.3-unknown
 [snip]

After the patch:
 # rpm -qa | grep gnupg
 gnupg-gpg-2.4.3-r0.core2_64
 gnupg-2.4.3-r0.core2_64
 # gpgv --version
 gpgv (GnuPG) 2.4.3
 [snip]

[1] https://git.gnupg.org/cgi-bin/gitweb.cgi?p=gnupg.git;a=blobdiff;f=autogen.sh;h=2b0a5dc51a7386ef90ff6c8358d26b9cc65c0c72;hp=471193c2af6a298fdde466950061dd890feb230e;hb=b67e4e523e6d19d384e23c5bb03010caebd150e7;hpb=518d835380a2ae01d6a9cc19de92684baade96a4

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...autogen.sh-Remove-the-unknown-suffix.patch | 43 +++++++++++++++++++
 meta/recipes-support/gnupg/gnupg_2.4.3.bb     |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-support/gnupg/gnupg/0001-autogen.sh-Remove-the-unknown-suffix.patch

diff --git a/meta/recipes-support/gnupg/gnupg/0001-autogen.sh-Remove-the-unknown-suffix.patch b/meta/recipes-support/gnupg/gnupg/0001-autogen.sh-Remove-the-unknown-suffix.patch
new file mode 100644
index 0000000000..05614954e0
--- /dev/null
+++ b/meta/recipes-support/gnupg/gnupg/0001-autogen.sh-Remove-the-unknown-suffix.patch
@@ -0,0 +1,43 @@
+From 7bdc05ad7c2e196344565988dfc0225eeb86ec0a Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Fri, 19 Jan 2024 16:29:06 +0800
+Subject: [PATCH] autogen.sh: Remove the unknown suffix
+
+The commit [b67e4e523 Improve the beta number generation.] [1]
+extends the version to make it work well for no release version
+and introduce the below version inconsistency as below:
+ # rpm -qa | grep gnupg
+ gnupg-gpg-2.4.3-r0.core2_64
+ gnupg-2.4.3-r0.core2_64
+ # gpgv --version
+ gpgv (GnuPG) 2.4.3-unknown
+ [snip]
+
+Considering we mainly use a release version in oe, so remove the added
+suffix to keep consistent.
+
+[1] https://git.gnupg.org/cgi-bin/gitweb.cgi?p=gnupg.git;a=blobdiff;f=autogen.sh;h=2b0a5dc51a7386ef90ff6c8358d26b9cc65c0c72;hp=471193c2af6a298fdde466950061dd890feb230e;hb=b67e4e523e6d19d384e23c5bb03010caebd150e7;hpb=518d835380a2ae01d6a9cc19de92684baade96a4
+
+Upstream-Status: Inappropriate [OE-Specific as we use a release version in oe]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ autogen.sh | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/autogen.sh b/autogen.sh
+index 78753b5..fdaa0ad 100755
+--- a/autogen.sh
++++ b/autogen.sh
+@@ -237,7 +237,7 @@ if [ "$myhost" = "find-version" ]; then
+       rvd=$((0x$(echo ${rev} | dd bs=1 count=4 2>/dev/null)))
+     else
+       ingit=no
+-      tmp="-unknown"
++      tmp=""
+       rev="0000000"
+       rvd="0"
+     fi
+-- 
+2.25.1
+
diff --git a/meta/recipes-support/gnupg/gnupg_2.4.3.bb b/meta/recipes-support/gnupg/gnupg_2.4.3.bb
index e91ef34b7d..f50bb7c391 100644
--- a/meta/recipes-support/gnupg/gnupg_2.4.3.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.4.3.bb
@@ -19,6 +19,7 @@ SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0004-autogen.sh-fix-find-version-for-beta-checking.patch \
            file://0001-Woverride-init-is-not-needed-with-gcc-9.patch \
            file://fix-ldap.patch \
+           file://0001-autogen.sh-Remove-the-unknown-suffix.patch \
            "
 SRC_URI:append:class-native = " file://0001-configure.ac-use-a-custom-value-for-the-location-of-.patch \
                                 file://relocate.patch"
-- 
2.25.1


