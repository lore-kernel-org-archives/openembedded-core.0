Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9788AC369BD
	for <webhook@archiver.kernel.org>; Thu, 17 Apr 2025 02:21:58 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.36964.1744856511350608323
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Apr 2025 19:21:51 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=620297dce7=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53H2JHPK020868
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Apr 2025 19:21:51 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45ykf3nj3v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Apr 2025 19:21:50 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 16 Apr 2025 19:21:50 -0700
Received: from pek-lpg-core6.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Wed, 16 Apr 2025 19:21:49 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [scarthgap][PATCH 2/3] buildtools-tarball: add envvars into BB_ENV_PASSTHROUGH_ADDITIONS
Date: Thu, 17 Apr 2025 10:21:47 +0800
Message-ID: <20250417022147.2776717-2-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250417022147.2776717-1-changqing.li@windriver.com>
References: <20250417022147.2776717-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: YXUYadPZJTeaSuBZeLwA6P4p8BVPZvJV
X-Authority-Analysis: v=2.4 cv=Wd0Ma1hX c=1 sm=1 tr=0 ts=680065be cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=XR8D0OoHHMoA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=IyByODMcM6hwZvvgUqAA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: YXUYadPZJTeaSuBZeLwA6P4p8BVPZvJV
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_01,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0 phishscore=0
 mlxlogscore=999 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504170016
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 02:21:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215023

From: Changqing Li <changqing.li@windriver.com>

Here is one testcase:
For recipe tensorflow-lite-host-tools_2.18.0.bb, refer [1],
do_configure[network] = "1"
and it will git clone some repos in CMakeLists.txt

When buildtools is used and nativesdk-git is installed into sdk,
do_configure failed with error:
[1/9] Performing download step (git clone) for 'protobuf-populate'
Cloning into 'protobuf'...
fatal: unable to access 'https://github.com/protocolbuffers/protobuf/': error setting certificate file: /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-wrlinuxsdk-linux/etc/ssl/certs/ca-certificates.crt

Fix by adding GIT_SSL_CAINFO in BB_ENV_PASSTHROUGH_ADDITIONS, so that
user can export GIT_SSL_CAINFO=${GIT_SSL_CAINFO} in their
do_configure:prepend() to fix above do_configure failure

CURL_CA_BUNDLE and REQUESTS_CA_BUNDLE is similar envvars, so all add
into BB_ENV_PASSTHROUGH_ADDITIONS

[1] https://github.com/nxp-imx/meta-imx/blob/styhead-6.12.3-1.0.0/meta-imx-ml/recipes-libraries/tensorflow-lite/tensorflow-lite-host-tools_2.18.0.bb

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-devtools/git/git/environment.d-git.sh               | 1 +
 .../python/python3-requests/environment.d-python3-requests.sh    | 1 +
 meta/recipes-support/curl/curl/environment.d-curl.sh             | 1 +
 3 files changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/git/git/environment.d-git.sh b/meta/recipes-devtools/git/git/environment.d-git.sh
index 18104f0528..f8e3221510 100644
--- a/meta/recipes-devtools/git/git/environment.d-git.sh
+++ b/meta/recipes-devtools/git/git/environment.d-git.sh
@@ -1,3 +1,4 @@
 if [ -e "${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt" ];then
     export GIT_SSL_CAINFO="${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt"
+    export BB_ENV_PASSTHROUGH_ADDITIONS="${BB_ENV_PASSTHROUGH_ADDITIONS:-} GIT_SSL_CAINFO"
 fi
diff --git a/meta/recipes-devtools/python/python3-requests/environment.d-python3-requests.sh b/meta/recipes-devtools/python/python3-requests/environment.d-python3-requests.sh
index f2eee203ca..c7faec127d 100644
--- a/meta/recipes-devtools/python/python3-requests/environment.d-python3-requests.sh
+++ b/meta/recipes-devtools/python/python3-requests/environment.d-python3-requests.sh
@@ -1,3 +1,4 @@
 if [ -e "${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt" ];then
     export REQUESTS_CA_BUNDLE="${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt"
+    export BB_ENV_PASSTHROUGH_ADDITIONS="${BB_ENV_PASSTHROUGH_ADDITIONS:-} REQUESTS_CA_BUNDLE"
 fi
diff --git a/meta/recipes-support/curl/curl/environment.d-curl.sh b/meta/recipes-support/curl/curl/environment.d-curl.sh
index 0d53aabb8e..0ab83a267d 100644
--- a/meta/recipes-support/curl/curl/environment.d-curl.sh
+++ b/meta/recipes-support/curl/curl/environment.d-curl.sh
@@ -1,3 +1,4 @@
 if [ -e "${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt" ];then
     export CURL_CA_BUNDLE="${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt"
+    export BB_ENV_PASSTHROUGH_ADDITIONS="${BB_ENV_PASSTHROUGH_ADDITIONS:-} CURL_CA_BUNDLE"
 fi
-- 
2.44.1


