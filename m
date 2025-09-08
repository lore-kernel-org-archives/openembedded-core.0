Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D454CA1013
	for <webhook@archiver.kernel.org>; Mon,  8 Sep 2025 03:17:11 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.4128.1757301429876997963
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Sep 2025 20:17:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=KTLDpLKM;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=134629f1ef=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5881H6V82727726
	for <openembedded-core@lists.openembedded.org>; Sun, 7 Sep 2025 20:17:09 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=jANs82KoRU7jTLPBtbDW3DUGO/hc+tMRH5lmXkn6lEQ=; b=KTLDpLKM2Yvp
	bujRMbKCG9X8AxplAQW7idlH9+NWnmk0dCJHYcjm9sDqGFJhFRT2GZRFNYRNER/F
	USugiCT8pUkOV5/GgANVUAZFwfbIveRZ4wcGjfUSssxlno/+7GigeE/zHdvkGzAe
	cfqjHnNkjWx2G9S6fAcbTvbgwwgtWE6FOpToER0rdzoJwhuFJxYyuyvVnAW+6Tl/
	a7nwjNuWdhKS2KxpVD4w+HLM/HYtMG2wDX50+uEierIIRbGGph0mRRCbkoJlZv/V
	oluATT02KYedatjUNj8S+SdqF95ywx2hUBP5xQqpe1MRnbo4AHO1PUB22PUWmf1x
	aEluWtz8TQ==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 490mfg139x-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 07 Sep 2025 20:17:09 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Sun, 7 Sep 2025 20:17:08 -0700
Received: from ala-lpggp7.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Sun, 7 Sep 2025 20:17:08 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [walnascar][PATCH 2/2] rpm: keep leading `/' from sed operation
Date: Sun, 7 Sep 2025 20:17:19 -0700
Message-ID: <20250908031719.3161732-2-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250908031719.3161732-1-hongxu.jia@windriver.com>
References: <20250908031719.3161732-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 5tLVYLcmEGdWeZDdXkTHKXDCwdec6Pi5
X-Authority-Analysis: v=2.4 cv=d+v1yQjE c=1 sm=1 tr=0 ts=68be4ab5 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=yJojWOMRYYMA:10 a=Q4-j1AaZAAAA:8 a=f1hami8VAAAA:8 a=t7CeM3EgAAAA:8
 a=P-IC7800AAAA:8 a=ag1SF4gXAAAA:8 a=oLPVMzCPyDdK_s4BnHoA:9 a=NS3OCI0N-QAA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FMFxGtP9trmfb28vA-lX:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=d3PnA9EDa4IxuAV0gXij:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDAzMCBTYWx0ZWRfX90674qbM/UyC
 MXCunIlREZAhoaXdwrbGWVWJa+txLjgNtmmwyqNwW3PvAi2b0KuhUZJhHjNAfa18+NHCfINk3ab
 CMpff5iTrXnluZOhUAL8pHE2f+0SU+hLxX6LJY9nTeb3sfcTXOsS3mUwqFGS+9+9fEeKrtsidgu
 yxuAOxSJjeR/GZ8tkGFhETXvrnn2plpy5spXJRKW9/MHGI4mbGleHBX//iIYfZeSgzCP31TkygB
 K4Bwh+upoFvfbcSlN420g0WXPbm4S7GrN62R7NeYgWC69Nu6KvA1wrY1fCa471/uv49fM6t5nr+
 9X3hFjeIH9atUiQ2fnXAXNYHoWPiSbFDJUsS9CEHV/tSM8m2GqXZqTCO+B4NX0=
X-Proofpoint-ORIG-GUID: 5tLVYLcmEGdWeZDdXkTHKXDCwdec6Pi5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-07_10,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 impostorscore=0 clxscore=1015 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Sep 2025 03:17:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223058

For /usr/lib/rpm/macros, Yocto explicitly set OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM
= "ONLY" [1][2] to search tools from CMAKE_FIND_ROOT_PATH [5] which locates in
native recipe sysroot or HOSTTOOLS_DIR. If found in native recipe sysroot or
HOSTTOOLS_DIR, the sed operation removed leading `/'

root@qemux86-64:~# vi /usr/lib/rpm/macros
...
%__xz                   usr/bin/xz
%__make                 usr/bin/make
%__zstd                 usr/bin/zstd
%__quilt                usr/bin/quilt
%__patch                usr/bin/patch
...

root@qemux86-64:~# rpm --eval "%{__xz} %{__make} %{__zstd} %{__quilt} %{__patch}"
usr/bin/xz usr/bin/make usr/bin/zstd usr/bin/quilt usr/bin/patch

This commit keeps leading `/' from sed operation, and similar reason for
/usr/lib/cmake/rpm/rpm-targets.cmake

After applying this commit:
root@qemux86-64:~# rpm --eval "%{__xz} %{__make} %{__zstd} %{__quilt} %{__patch}"
/usr/bin/xz /usr/bin/make /usr/bin/zstd /usr/bin/quilt /usr/bin/patch

[1] https://git.openembedded.org/openembedded-core/commit/?id=f4ea12f6635125ee793f4dd801c538c0186f9dc3
[2] https://cmake.org/cmake/help/latest/variable/CMAKE_FIND_ROOT_PATH_MODE_PROGRAM.html

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

(master rev: 0d0773879ab9520c475c4a8c930b2e663de0e032)
Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-devtools/rpm/rpm_4.20.0.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/rpm/rpm_4.20.0.bb b/meta/recipes-devtools/rpm/rpm_4.20.0.bb
index 4ded77e8ce..002a91179d 100644
--- a/meta/recipes-devtools/rpm/rpm_4.20.0.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.20.0.bb
@@ -139,10 +139,10 @@ do_install:append:class-nativesdk() {
 }
 
 do_install:append () {
-	sed -i -e 's:${HOSTTOOLS_DIR}/::g' \
-            -e 's:${STAGING_DIR_NATIVE}/::g' \
+	sed -i -e 's:${HOSTTOOLS_DIR}::g' \
+            -e 's:${STAGING_DIR_NATIVE}::g' \
 	    ${D}/${libdir}/rpm/macros
-	sed -i -e 's:${RECIPE_SYSROOT}/::g' \
+	sed -i -e 's:${RECIPE_SYSROOT}::g' \
 	    ${D}/${libdir}/cmake/rpm/rpm-targets.cmake
 
 }
-- 
2.49.0


