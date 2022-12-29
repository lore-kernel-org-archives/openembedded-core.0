Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0B89C3DA7A
	for <webhook@archiver.kernel.org>; Thu, 29 Dec 2022 02:34:48 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.197756.1672281284956313345
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Dec 2022 18:34:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=hR7t1rHh;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0362acaf19=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BT2MST4031355
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Dec 2022 02:34:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PPS06212021;
 bh=tsJjUziTD7fHx0vKNfi1Bp2kUCrNkfQ6fXOhWGSv3+Y=;
 b=hR7t1rHhUHTdjOcbgJB8tetW7glo4SQGuy1lFqLhQW/7pZXp2oNo8sJOUUztIXPMsttu
 NrOw2gWJ+jdQK7n4iXfbyNuWTUE0rC4cQAV37TLKZyKciXCKWJfpPnqkZ9ILBGC/lP7e
 A1nsQgW9TMgotRh/La3uVw2w6QK2bgc+LDxS44hH8uimawIPRhnsIEE6HPynkApao6yu
 imdI0/oC0r+uwlpJggwWFhSE0smiR+cQDNTXTwERcktGqfB3e3WhC5dORDLG6ccAnZ7X
 jRPG3PvDIlFup5E3rzOn7aCv9DQgL7etbVYF2hfvsh7XUj0hbivJdLrkQ7LQ7VoSRSGD 7w== 
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mnpn32snp-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Dec 2022 02:34:44 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 28 Dec 2022 18:34:41 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Wed, 28 Dec 2022 18:34:41 -0800
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 2/2] curl: enable nghttp2 for support HTTP2
Date: Thu, 29 Dec 2022 10:34:42 +0800
Message-ID: <20221229023442.2520067-2-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221229023442.2520067-1-changqing.li@windriver.com>
References: <20221229023442.2520067-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: hat7Nxai0QoaOn3Euiiwbc-5Bxp98cN2
X-Proofpoint-GUID: hat7Nxai0QoaOn3Euiiwbc-5Bxp98cN2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-29_01,2022-12-28_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0 mlxscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 mlxlogscore=999 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2212290017
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Dec 2022 02:34:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175090

From: Changqing Li <changqing.li@windriver.com>

After commit `ostree: replace libsoup-2.4 by curl`, ostree depends on
libcurl, but it needs http2 support, otherwise it will fail with
error:
OSTree:ERROR:../git/src/libostree/ostree-fetcher-curl.c:886:initiate_next_curl_request: assertion failed (rc == CURLM_OK): (1 == 0)
| Bail out! OSTree:ERROR:../git/src/libostree/ostree-fetcher-curl.c:886:initiate_next_curl_request: assertion failed (rc == CURLM_OK): (1 == 0)

Enable nghttp2 to fix above error.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-support/curl/curl_7.86.0.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/curl/curl_7.86.0.bb b/meta/recipes-support/curl/curl_7.86.0.bb
index f5e3e7235d..6cee548f35 100644
--- a/meta/recipes-support/curl/curl_7.86.0.bb
+++ b/meta/recipes-support/curl/curl_7.86.0.bb
@@ -24,9 +24,9 @@ inherit autotools pkgconfig binconfig multilib_header ptest
 # Entropy source for random PACKAGECONFIG option
 RANDOM ?= "/dev/urandom"
 
-PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} libidn openssl proxy random threaded-resolver verbose zlib"
-PACKAGECONFIG:class-native = "ipv6 openssl proxy random threaded-resolver verbose zlib"
-PACKAGECONFIG:class-nativesdk = "ipv6 openssl proxy random threaded-resolver verbose zlib"
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} libidn openssl proxy random threaded-resolver verbose zlib nghttp2"
+PACKAGECONFIG:class-native = "ipv6 openssl proxy random threaded-resolver verbose zlib nghttp2"
+PACKAGECONFIG:class-nativesdk = "ipv6 openssl proxy random threaded-resolver verbose zlib nghttp2"
 
 # 'ares' and 'threaded-resolver' are mutually exclusive
 PACKAGECONFIG[ares] = "--enable-ares,--disable-ares,c-ares,,,threaded-resolver"
-- 
2.25.1


