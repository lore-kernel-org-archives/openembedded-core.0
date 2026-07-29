Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E83DC53219
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 15:23:54 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.36])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12634.1785335264290135980
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jul 2026 07:27:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=LT/DvdM7;
 spf=pass (domain: est.tech, ip: 52.101.65.36, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D/H5Z6ySFBDavfx3KJ66xHsdaSV1b7Hke4n83MDYGC4sAwff4HihLLu/4C1d0Gqyn5rwh/MwfDVoxhdLEyBm+jqzCHnHBMNY4nc/P0Hnr18Fv25vrO4YaOfy3DJg4Xu8vOkHUocey5WZ/3PI5v6eZeYLy8cGcmbiuiUaMAuFq/GgGUd1+xzwXknZxAO4tX8xxnSkEd83IdCJNkur15CfX5wAj2rfDe7Iigf3LI8Oq+boEGdlGcP6qI6V2yiT8pztZ1/YAepo+KfGxsGIOVKM226BFmVUTwasjQX/BgCK3vCmBOOt/jSfhLYJ0gbXJfr0vOB6uFmrnjnEbQtz86RJ9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W9x/F9ZlQPrWXQXHBTKtli9HVq5XPYClyhIUbwGT2uY=;
 b=yhDQynVi66csjmbN87kY2fOQFGlhrcH2M8qlfzZw4acZZ0alYfZXBpKJZ597SInXdJlUTwTF++qpx9xi0Oz7kn2HTj5qEMURHHYrSUxIl5M6yYR/z7KBPq4phPkGCNnGgol5zpzmzFBWAzgCUsLVwryAegO/yyWpGWADdtg8XJsMim8MXKxfv7DCT9EcmSowp70KD+mWkG6w70SSG6jtgtCY19QEXnTULnCbSP4JPXT4p3hodcZ6/1JYeZRynIZT4XDq45DTSaoqBfsyYedCdpyvlwM8reWQPP8QcgEA1usGY1aksRFp2maFpZ5kmSTZGI+xanWj1SRmWbIYkymUEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W9x/F9ZlQPrWXQXHBTKtli9HVq5XPYClyhIUbwGT2uY=;
 b=LT/DvdM7Vqy+mo+ugyStyGmOAy9X0n14F0wemAXvdfkFpMimp1FFkhgFAuCIibxdMx3mGy47b9GYwsfWYdUp8XCLAUNeVg4BYHwySkUbDa3mZqYkOGqKc6mWZITCn2ZaMdzb4E/61Kjx+I3FHQjpHW6qcLb1CaCvapvl8V171lHDIweiGYCsjLSImMwDejaNh/7u7F0xVt0Hgl/2ty+QOEjx0iyDE0iY+KLYrCJUWKUzUTjReQGiOSxUBUoehVGwM6LuxGqseUvQOnQdS5FMBmbhEoT1L4Fujg571JRqGrP401hbHB2YW8fiOIOQcukvJd+WtOpX2nsZF4Mp56pfTw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:396::9)
 by GV1P189MB2786.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:1f2::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 14:27:37 +0000
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff]) by AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff%4]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 14:27:37 +0000
From: "Adarsh Jagadish Kamini" <adarsh.jagadish.kamini@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH] gnutls: fix CVE-2026-33845
Date: Wed, 29 Jul 2026 16:27:34 +0200
Message-ID: <20260729142734.468627-1-adarsh.jagadish.kamini@est.tech>
X-Mailer: git-send-email 2.43.0
X-ClientProxiedBy: DUZPR01CA0005.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c3::9) To AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:396::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1672:EE_|GV1P189MB2786:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e3d7f69-875e-4aa6-4a55-08deed7d89c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|12006099003|18002099003|56012099006|11063799006|13003099007|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info: 
	6saulSpfTOmC0HBZ7i8YYBRrFT2eOrtGyNS/Dj+IYZXCKgLoKB1AEdbgi0zcrwTSlUsHmR46bx1NZX4hAE/NZpAS66/IWXFlTamYHOEecmq+X84hbz2jnYaDs4Yh576RkeZSscC4QXn2UFBgvsDpwKP6+EutvlqOOTfFSy+d68TCQqVmm3xs2nuog6Hplf/IPJVo2DRkp/cKiFKF9JhPLbXF4LvbhU1/hDgmr1RzHfk8rZ5gEU0GDKpuKJzGyT1ss4babuxNNhxpoLjihII6IuYSdJjHTLdCmacxaouaVlOrPQlA1G29jNPdRY8pzFk8lz2zoApjAZZhm8WUEoadS1y/ywO8xrhz20P0PkeVXs4/elRAXCiq/yXApHKwQZtSaTuS0lf+Uj/myKcvAfkLMm1Z+7bzwnbftnKTkr7it/UhFbKy9bB/ZzeVKec/1NQQqtzRByDyMephw+zf5K8O2Z7mJLx/4RlM9OXX6Lmu+x7P7SKViSZBugiNW+bzmIDOLz7Nk4fFgiL/hoBr2aI57qzLBn7XT/UG+VtQWaHr3iRSEQBK+IjCro2G/+AqHGhE+Uo52jReA/1F5zUmylXdDw1Aj9mJtWeQnDR07RZuIEn/WelB0sDlkmPuDjzcd8/oBLQC+M7SedQzVX+VpyXGqiklznq4Ohg7h2pGLnNft/c=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1672.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(12006099003)(18002099003)(56012099006)(11063799006)(13003099007)(6133799003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?X8m0SfHyaRwoy26807yeK5nWx6DH8JfBGT1zPNliGsxA1p5ch6ATGQbjhvMd?=
 =?us-ascii?Q?qGAxy73Vn2nWjqN2UMYYePf201T0FGe3B6kVnydvkmsBkJ6jmIWZdCm0Xopc?=
 =?us-ascii?Q?GUe3fEj1/3Fhg6rQu0bdAahmyBlHkMvJLYidcNRXrYTwmnuqrVDgB0vXcHiz?=
 =?us-ascii?Q?UJDa4M8VUh5+YJi0wfpZxD+RPoUS8/hIKDeoWJHJIKOTXOJCVTfgUiD/asaR?=
 =?us-ascii?Q?CGzxAB7S1D9WcsZV0I8QAbiPSztt5GDNXTm4XRqKrIW9cLShaU5BLNBCgECL?=
 =?us-ascii?Q?SlhloCXSAuSES1b9bUJqQhMJJfXc6mo7nOdKZGD0KJkfjOHYGAD1/urCOzvn?=
 =?us-ascii?Q?HII4nvBwAkrqUjeQdH1xlZYDzeg0Ic8+FHcmjb8nXM1AFwoU5XB9Lxssr0j5?=
 =?us-ascii?Q?F4r9QtnBSXQJ8Mz+FvV1DYqSrZkyai/gPcyLwlsasSSH90FnESP7VG7SBKUe?=
 =?us-ascii?Q?CT432Mrv5NLbqxGNkIYDET55cf4Xu8CVDNtXadoY522XYIibI/srT0Zb+m53?=
 =?us-ascii?Q?hQVy5Pgs/9wxLocbBVEh/CoyoIvNtRF+5FgONz7tycTMNpQLoZeEFMMgkHhE?=
 =?us-ascii?Q?4eUPg5THNuR40SS+sNLg7x3YUIY5bJFz4/7vX1pG39+ZBCabzz1/+QDMlDza?=
 =?us-ascii?Q?TeYdtzZACaTQM8pAvo429t5FRKmoIMwpfjhzRmIN1KjxZFd3mnye2DXNaBLy?=
 =?us-ascii?Q?rMDvJ/GW+N2OGvBE5cprukM9LaeuIPmYP3X8S8D7jrGgCzNC9h9A2nt5t/4r?=
 =?us-ascii?Q?/92l2g1PA224T/g6mpP5De7e4XCZ82NL4jXI7sa3y81/F15V3DxhLHqZ57Cb?=
 =?us-ascii?Q?M/wIWZTitrGOk0hYj5WQZvk79JPxubcqQklweQZtcwsMzWxx7ysEHzQfGC/E?=
 =?us-ascii?Q?cdIGpcRuFCh0Y1HJ+c/LuuC0GKcNxccXxFSLGFsQF9uOJAU9n7en+sgsE0vO?=
 =?us-ascii?Q?RQ/tSEnDxBJ9TyGqu5dVB5UKgz0dyZLqGEwPRnF1T68u8X+5L6/SdrlqjxYD?=
 =?us-ascii?Q?tQwBLurF3kkwCEJJw63zWtFqEGv2Ujz0Dt9LHtvMuUzeFt24ZuWAoQs/+eLC?=
 =?us-ascii?Q?cwEC08t9Gkh+5mK+eUaUJYSzTlOHc47pS9KMBohiUb7cMg8nnqexC1vbTUg8?=
 =?us-ascii?Q?MT5AKEeMUP9y+9OQlAjIvd+Ov6Er+mcTz8WQbKyFOZg9HK7+zDBIFJpB5IQZ?=
 =?us-ascii?Q?Wx6XZMI/xp3lhVuOY75rmUj56XwmsWSaG4rXfZlfeaOeVlQ6AcxRIOenMz2G?=
 =?us-ascii?Q?NtdvRtpJBsvPoEougoCefFsKuyvVbkcLQGDYEdKqVPwo5l515NRA/iDcyVlB?=
 =?us-ascii?Q?jk79vkCpBFFSLaTi4FWH8nPrJQRUh3pCXe0djJOmESUxcBTII7qhj6JBlmH4?=
 =?us-ascii?Q?r8X0JWVcCaljUvkpnxt4GMePhK7i/t7GBcge0minSofUYa8aXKMZ5Bp2mSOO?=
 =?us-ascii?Q?5a6deKIBdmBfhGOyWilanNSEG8p2/WELqYI8gD05Uo7Jy3tezppUF0J2uFT/?=
 =?us-ascii?Q?duYoCqLL4gqjMX1j7CWJJZd0YN78faSHveRqW9OTeMunsML6ZkHkXxlUrIU6?=
 =?us-ascii?Q?bMDQDuM6aRuN/W3ZVCo0TZU6jUFxk+lmSszQ8m6mpNQ36jfe1ljtyPU5TLDG?=
 =?us-ascii?Q?d2wfHfEvrIF8hzI1hEDjSyA4z0379ULgVq7mVFyHQ5gVDa/u41e4MulPbt1G?=
 =?us-ascii?Q?TP2ZWKLmrHaPYq6uSCBLIujQEM1/CeBzH0zdQJ9V+5P+vAzD4xDzaceflpQy?=
 =?us-ascii?Q?pkQdtaMvx0hBXp7g3DXQROwBBhIpQew=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e3d7f69-875e-4aa6-4a55-08deed7d89c0
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 14:27:37.2701
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2yVjIpDaCI9ecZcnSV468GOmHIeWcst0wCWhPt/820ouzlo5worgJ1UgkXxMnsoNpAfSkY8FNoNuxCmFDAuL0IFt7camWuDGyYnwGGyJf9Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P189MB2786
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2026 15:23:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242273

Backport patch to fix CVE-2026-33845.

References:
  https://nvd.nist.gov/vuln/detail/CVE-2026-33845

Upstream fix:
  https://gitlab.com/gnutls/gnutls/-/commit/e5b72c53c7d789d19d1d1cd10b275e8=
7d0415413

Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
---
 .../gnutls/gnutls/CVE-2026-33845.patch        | 190 ++++++++++++++++++
 meta/recipes-support/gnutls/gnutls_3.8.4.bb   |   1 +
 2 files changed, 191 insertions(+)
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-33845.patch

diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2026-33845.patch b/meta=
/recipes-support/gnutls/gnutls/CVE-2026-33845.patch
new file mode 100644
index 0000000000..13d1d9bf82
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/CVE-2026-33845.patch
@@ -0,0 +1,190 @@
+From d217d233d3eb5566a911dad11b639552d63acfac Mon Sep 17 00:00:00 2001
+From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
+Date: Wed, 29 Jul 2026 08:54:58 +0000
+Subject: [PATCH] buffers: switch from end_offset over to frag_length
+
+Instead of maintaining an inclusive [start_offset, end_offset] range
+when reassembling DTLS handshake,
+track start_offset and a relative frag_length instead.
+
+You'd think it'd be a no-op, but it fixes:
+
+* 0-length fragments triggering completion if message was 1 byte long
+* a remotely triggerable underflow and an ensuing heap overrun
+
+Reported-by: Joshua Rogers of AISLE Research Team <joshua@joshua.hu>
+Fixes: #1811
+Fixes: CVE-2026-33845
+Fixes: GNUTLS-SA-2026-04-29-3
+CVSS: 7.5 High CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H
+Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
+
+CVE: CVE-2026-33845
+Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/e5b72=
c53c7d789d19d1d1cd10b275e87d0415413]
+
+Backport notes: adapted to the stable branch, no logic changes.
+- lib/buffers.c: the local fragment-size variable is named frag_size here,
+  not frag_length as upstream; renamed accordingly.
+- lib/buffers.c: merge_handshake_packet() has no recv_buf alias in this
+  branch, so recv_buf[pos] was expanded to
+  session->internals.handshake_recv_buffer[pos], which changes line wrappi=
ng.
+- lib/gnutls_int.h: applies cleanly
+
+Assisted-by: kiro:claude-sonnet-4.6
+Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
+---
+ lib/buffers.c    | 59 ++++++++++++++++++++++++++----------------------
+ lib/gnutls_int.h |  4 ++--
+ 2 files changed, 34 insertions(+), 29 deletions(-)
+
+diff --git a/lib/buffers.c b/lib/buffers.c
+index 672380b05..ad59e4f14 100644
+--- a/lib/buffers.c
++++ b/lib/buffers.c
+@@ -923,10 +923,7 @@ static int parse_handshake_header(gnutls_session_t se=
ssion, mbuffer_st *bufel,
+ 	}
+ 	data_size =3D _mbuffer_get_udata_size(bufel) - handshake_header_size;
+=20
+-	if (frag_size > 0)
+-		hsk->end_offset =3D hsk->start_offset + frag_size - 1;
+-	else
+-		hsk->end_offset =3D 0;
++	hsk->frag_length =3D frag_size;
+=20
+ 	_gnutls_handshake_log(
+ 		"HSK[%p]: %s (%u) was received. Length %d[%d], frag offset %d, frag len=
gth: %d, sequence: %d\n",
+@@ -940,9 +937,11 @@ static int parse_handshake_header(gnutls_session_t se=
ssion, mbuffer_st *bufel,
+=20
+ 	if (hsk->length > 0 &&
+ 	    (frag_size > data_size ||
+-	     (frag_size > 0 && hsk->end_offset >=3D hsk->length))) {
++	     (frag_size > 0 &&
++	      hsk->start_offset + frag_size > hsk->length))) {
+ 		return gnutls_assert_val(GNUTLS_E_UNEXPECTED_PACKET_LENGTH);
+-	} else if (hsk->length =3D=3D 0 && hsk->end_offset !=3D 0 &&
++	} else if (hsk->length =3D=3D 0 &&
++		   hsk->start_offset + frag_size !=3D hsk->start_offset &&
+ 		   hsk->start_offset !=3D 0)
+ 		return gnutls_assert_val(GNUTLS_E_UNEXPECTED_PACKET_LENGTH);
+=20
+@@ -991,11 +990,10 @@ static int merge_handshake_packet(gnutls_session_t s=
ession,
+ 			hsk->data.length =3D hsk->length;
+ 		}
+=20
+-		if (hsk->length > 0 && hsk->end_offset > 0 &&
+-		    hsk->end_offset - hsk->start_offset + 1 !=3D hsk->length) {
++		if (hsk->length > 0 && hsk->frag_length > 0 &&
++		    hsk->frag_length !=3D hsk->length) {
+ 			memmove(&hsk->data.data[hsk->start_offset],
+-				hsk->data.data,
+-				hsk->end_offset - hsk->start_offset + 1);
++				hsk->data.data, hsk->frag_length);
+ 		}
+=20
+ 		session->internals.handshake_recv_buffer_size++;
+@@ -1012,7 +1010,7 @@ static int merge_handshake_packet(gnutls_session_t s=
ession,
+ 		if (hsk->start_offset <
+ 			    session->internals.handshake_recv_buffer[pos]
+ 				    .start_offset &&
+-		    hsk->end_offset + 1 >=3D
++		    hsk->start_offset + hsk->frag_length >=3D
+ 			    session->internals.handshake_recv_buffer[pos]
+ 				    .start_offset) {
+ 			memcpy(&session->internals.handshake_recv_buffer[pos]
+@@ -1021,28 +1019,36 @@ static int merge_handshake_packet(gnutls_session_t=
 session,
+ 			session->internals.handshake_recv_buffer[pos]
+ 				.start_offset =3D hsk->start_offset;
+ 			session->internals.handshake_recv_buffer[pos]
+-				.end_offset =3D MIN(
+-				hsk->end_offset,
++				.frag_length =3D MIN(
++				hsk->frag_length,
+ 				session->internals.handshake_recv_buffer[pos]
+-					.end_offset);
+-		} else if (hsk->end_offset >
++					.frag_length);
++		} else if (hsk->start_offset + hsk->frag_length >
+ 				   session->internals.handshake_recv_buffer[pos]
+-					   .end_offset &&
++					   .start_offset +
++					   session->internals
++						   .handshake_recv_buffer[pos]
++						   .frag_length &&
+ 			   hsk->start_offset <=3D
+ 				   session->internals.handshake_recv_buffer[pos]
+-						   .end_offset +
+-					   1) {
++						   .start_offset +
++					   session->internals
++						   .handshake_recv_buffer[pos]
++						   .frag_length) {
+ 			memcpy(&session->internals.handshake_recv_buffer[pos]
+ 					.data.data[hsk->start_offset],
+ 			       hsk->data.data, hsk->data.length);
+=20
+-			session->internals.handshake_recv_buffer[pos]
+-				.end_offset =3D hsk->end_offset;
+ 			session->internals.handshake_recv_buffer[pos]
+ 				.start_offset =3D MIN(
+ 				hsk->start_offset,
+ 				session->internals.handshake_recv_buffer[pos]
+ 					.start_offset);
++			session->internals.handshake_recv_buffer[pos]
++				.frag_length =3D
++				hsk->start_offset + hsk->frag_length -
++				session->internals.handshake_recv_buffer[pos]
++					.start_offset;
+ 		}
+ 		_gnutls_handshake_buffer_clear(hsk);
+ 	}
+@@ -1102,8 +1108,8 @@ static int get_last_packet(gnutls_session_t session,
+ 		}
+=20
+ 		else if ((recv_buf[LAST_ELEMENT].start_offset =3D=3D 0 &&
+-			  recv_buf[LAST_ELEMENT].end_offset =3D=3D
+-				  recv_buf[LAST_ELEMENT].length - 1) ||
++			  recv_buf[LAST_ELEMENT].frag_length =3D=3D
++				  recv_buf[LAST_ELEMENT].length) ||
+ 			 recv_buf[LAST_ELEMENT].length =3D=3D 0) {
+ 			session->internals.dtls.hsk_read_seq++;
+ 			_gnutls_handshake_buffer_move(hsk,
+@@ -1114,8 +1120,9 @@ static int get_last_packet(gnutls_session_t session,
+ 			/* if we don't have a complete handshake message, but we
+ 			 * have queued data waiting, try again to reconstruct the
+ 			 * handshake packet, using the queued */
+-			if (recv_buf[LAST_ELEMENT].end_offset !=3D
+-				    recv_buf[LAST_ELEMENT].length - 1 &&
++			if ((recv_buf[LAST_ELEMENT].start_offset +
++			     recv_buf[LAST_ELEMENT].frag_length) !=3D
++				    recv_buf[LAST_ELEMENT].length &&
+ 			    record_check_unprocessed(session) > 0)
+ 				return gnutls_assert_val(
+ 					GNUTLS_E_INT_CHECK_AGAIN);
+@@ -1302,9 +1309,7 @@ int _gnutls_parse_record_buffered_msgs(gnutls_sessio=
n_t session)
+ 					&session->internals.record_buffer,
+ 					bufel, ret);
+=20
+-				data_size =3D MIN(tmp.length,
+-						tmp.end_offset -
+-							tmp.start_offset + 1);
++				data_size =3D MIN(tmp.length, tmp.frag_length);
+=20
+ 				ret =3D _gnutls_buffer_append_data(
+ 					&tmp.data,
+diff --git a/lib/gnutls_int.h b/lib/gnutls_int.h
+index 8cf9a8715..689dcdc41 100644
+--- a/lib/gnutls_int.h
++++ b/lib/gnutls_int.h
+@@ -479,10 +479,10 @@ typedef struct {
+ 	uint16_t sequence;
+=20
+ 	/* indicate whether that message is complete.
+-	 * complete means start_offset =3D=3D 0 and end_offset =3D=3D length
++	 * complete means start_offset =3D=3D 0 and frag_length =3D=3D length
+ 	 */
+ 	uint32_t start_offset;
+-	uint32_t end_offset;
++	uint32_t frag_length; /* used exclusively in DTLS reassembly */
+=20
+ 	uint8_t header[MAX_HANDSHAKE_HEADER_SIZE];
+ 	int header_size;
diff --git a/meta/recipes-support/gnutls/gnutls_3.8.4.bb b/meta/recipes-sup=
port/gnutls/gnutls_3.8.4.bb
index ccb6a2b4b2..12e658e300 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.4.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.4.bb
@@ -43,6 +43,7 @@ SRC_URI =3D "https://www.gnupg.org/ftp/gcrypt/gnutls/v${S=
HRT_VER}/gnutls-${PV}.tar
            file://CVE-2025-14831-7.patch \
            file://CVE-2025-14831-8.patch \
            file://CVE-2025-14831-9.patch \
+           file://CVE-2026-33845.patch \
            "
=20
 SRC_URI[sha256sum] =3D "2bea4e154794f3f00180fa2a5c51fe8b005ac7a31cd58bd44c=
dfa7f36ebc3a9b"

