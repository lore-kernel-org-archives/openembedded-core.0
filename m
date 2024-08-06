Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55541C49EA1
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 05:16:35 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.545.1722921385936747532
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Aug 2024 22:16:26 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8948f01518=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4764KhTE016410
	for <openembedded-core@lists.openembedded.org>; Tue, 6 Aug 2024 05:16:25 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40sbh62cje-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 06 Aug 2024 05:16:24 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 5 Aug 2024 22:16:23 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Mon, 5 Aug 2024 22:16:23 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [scarthgap][PATCH] curl: correct the PACKAGECONFIG for native/nativesdk
Date: Tue, 6 Aug 2024 13:16:22 +0800
Message-ID: <20240806051622.1175382-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: OBnhlUGQAqOa9__wedwlFjjT-HKKzEXp
X-Proofpoint-GUID: OBnhlUGQAqOa9__wedwlFjjT-HKKzEXp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-06_03,2024-08-02_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 adultscore=0 malwarescore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2408060036
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Aug 2024 05:16:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203011

From: Changqing Li <changqing.li@windriver.com>

Since commit 148de08220 [ curl: Update from 8.2.1 to 8.3.0 ],
--enable-crypto-auth option was removed and split into separate options
for basic-auth, bearer-auth, digest-auth, kerberos-auth negotiate-auth,
and aws. In this commit, --enable-crypto-auth is removed from
EXTRA_OECONF, and the separate options is added into PACKAGECONFIG for
target. But not added into PACKAGECONFIG for native/nativesdk, this make
curl/git in buildtools not works well to connect basic auth https
server.

Failed commands:
git ls-remote https://xxx(input username/passwd)
curl -u name:passwd https://xxx

Error:
Authentication failed xxx
HTTP/1.1 401 Unauthorized

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-support/curl/curl_8.7.1.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-support/curl/curl_8.7.1.bb
index 3fdad6a4cf..a083f35951 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -27,8 +27,8 @@ inherit autotools pkgconfig binconfig multilib_header ptest
 RANDOM ?= "/dev/urandom"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} aws basic-auth bearer-auth digest-auth negotiate-auth libidn openssl proxy random threaded-resolver verbose zlib"
-PACKAGECONFIG:class-native = "ipv6 openssl proxy random threaded-resolver verbose zlib"
-PACKAGECONFIG:class-nativesdk = "ipv6 openssl proxy random threaded-resolver verbose zlib"
+PACKAGECONFIG:class-native = "ipv6 openssl proxy random threaded-resolver verbose zlib aws basic-auth bearer-auth digest-auth negotiate-auth"
+PACKAGECONFIG:class-nativesdk = "ipv6 openssl proxy random threaded-resolver verbose zlib aws basic-auth bearer-auth digest-auth negotiate-auth"
 
 # 'ares' and 'threaded-resolver' are mutually exclusive
 PACKAGECONFIG[ares] = "--enable-ares,--disable-ares,c-ares,,,threaded-resolver"
-- 
2.25.1


