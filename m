Return-Path: <amaury.couderc@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2755ED49C9A
	for <webhook@archiver.kernel.org>; Fri, 30 Jan 2026 10:17:19 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.1])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7411.1769768235785454599
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Jan 2026 02:17:16 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=v6rzgCOB;
 spf=pass (domain: est.tech, ip: 52.101.66.1, mailfrom: amaury.couderc@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MC3L4fPd/bqs1bCrZ0+V6xzMYpF9sTq4LuT4ud62J5zYPmfTE5i17re4jPeXvCznH9nhnYTGtYOj6TfZsFsZvka3t9GUWClkoNXx9gh+F9c/Ejrsg3QK8wHer48uRLRQleDSwDXRub05h8XYSoYi3lKLEMjUh8KPwacTr3Us9DOo2zcYR+tUuvi2KLi/N7cvDmOoDBKcIZI8HVMf3G9ak6uJ1urk4y/LNw/pyAMgtUv+FIWIoHJv/KmciZ5/xQcjWkFeBjAqBXrty3IQVp8GHB5r1x/P8nyo/EKaawterGHp3rGwM6B58fT5QZgz9z0DrNjM71CODODiZruKK2+BfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E17zEKKGaSmnm5p1oeSblnQBjly5WglZIm8qBR4/dYo=;
 b=aR8/spFPCw5prm/+UDw/oSFcDpeaYHnQaO5GM+ewz2CUkgF+yAyXmHRmgcmqah9kVZ4z+SMpZEOmgm/P6bdojUg2bPEFXOo80K3f2faN0OEVPfvM6ZtStJdDdJH3bFTo24v6BBDcn/OiBGJpKXLAvj7UyGOdZ/oLgzveBUWds+5etCj7UNZ8MMC5i/57i4cWZaD/UU91fGGTPYd0XxKK4k7y3BOuDJMZwVoruK96IHq+MLBx/1Y8IoAHeZuAEneWP5qTddAIsHm+PYo4WbZn6ntcBLe/sLeNKCSypguB9RwBmEB+BnA1bQBTXjEpzPAlzj4tUB7FKplIUEDdtFLteA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E17zEKKGaSmnm5p1oeSblnQBjly5WglZIm8qBR4/dYo=;
 b=v6rzgCOBNCkqFM5F/T5DhOX51VgDukCjF4HQFNHIDKmkewvw0MGQyzjCdPbEJPA5frw1WONhmN8pitYK+98kFxjMkcEekb2kjuuX/jOtSeDpUzpXn7Z2oiSZyNDbOIvADZ9O/tZp3bElBwEdU4ZkhlKzag7NyI8lbqCOBny5qPX8FpUGFgan2Cid6ejNT9vDj25nbuMwqnQ4HWWAWLKZXQvrAoioiIbh/e4P5CeFgdXDB+ZDyDgNj+1lrxV3sYccvQOxcvcRtggvG3Jou52Pit7qm1tuiYtatIc7XVoywgkWafiGqotNNT7HtqSs3InGZS1NwZEOBzNe21kKnLK08A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AMBP189MB3196.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6ad::11)
 by DB9P189MB2026.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:391::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Fri, 30 Jan
 2026 10:17:12 +0000
Received: from AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 ([fe80::3cc6:ccd5:b124:2a6a]) by AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 ([fe80::3cc6:ccd5:b124:2a6a%7]) with mapi id 15.20.9542.015; Fri, 30 Jan 2026
 10:17:12 +0000
From: amaury.couderc@est.tech
To: openembedded-core@lists.openembedded.org
Subject: [scarthgap][PATCH] curl_sasl:_if_redirected,_require_permission_to_use_bearer
Date: Fri, 30 Jan 2026 11:16:06 +0100
Message-ID: <20260130101650.19830-1-amaury.couderc@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0113.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:8::13) To AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6ad::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBP189MB3196:EE_|DB9P189MB2026:EE_
X-MS-Office365-Filtering-Correlation-Id: 688633ac-4b6a-4eb1-2cee-08de5fe8bbc4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?O3SHld3Ao4pVh1CF/36ljbwvMiZm/Htbd2xJYcgKExsbZFOPOe/RPgGWsQ2O?=
 =?us-ascii?Q?UibiwTnvtPRcyc0X70eBBLA15Jz/eLaGv/6YKfyxXZva4QbUz1cKtlCNWEyd?=
 =?us-ascii?Q?YJKFwNr5q/vzYyKuRNopxtBTlBqE4WIJstouidla3BaB3oLNR0OIFtXVdFG0?=
 =?us-ascii?Q?3W/C3ZvMpASpDGwLIo4yj6MRRA/OxMVJ2QMybCyrhywrsj7cnevMcwJH/NGP?=
 =?us-ascii?Q?+zEKaSlMGNWYYtJsNOtE8ZJlXhSK4lnIYk1PmVdq3MGe8aX3fEzvo84X/C5s?=
 =?us-ascii?Q?fiBnrTNWYiKHjUft9bLpYOJ/1X46UVzTnL0d5/MDH81zGIJnv03ySfDiXvNj?=
 =?us-ascii?Q?eHgUyOGZlp19rd/qL/KmcZ6lUXvB1NP5ILWqGNBu9QoLM1B4uJ8G1+fgaXUD?=
 =?us-ascii?Q?uoTey+gj+vH6So8klghpOtV/tEoXvWpCthi2mRStWB9PoKv8ktAxb3wHDUWo?=
 =?us-ascii?Q?ISwsF8/qTD+S1f+xPa7eNl2hPk3HgdjIyEoxqV6TNIQhFtvZhMTD8hmC4c9W?=
 =?us-ascii?Q?5abpWhD3fwvZYslHt+C6oLNv9HtErcRO3OhDn4JGr+wR8TwV7BxcPFHtmYh5?=
 =?us-ascii?Q?VO3oUF2ahVeTzXdOVtZlOrUlaZOT/9f+/xW1FnsRcV+0nB+7o7qVVBrqeznW?=
 =?us-ascii?Q?vdGpMnKcXQGWevy80ozcYswOtGTPqtXzW5y6azvXpQSRW+6+OnoZQXLhmJdp?=
 =?us-ascii?Q?2FZIL5yO6TCKH6DVrqX/lQz0H1n9ee055jiosxTNesZ9jsDoHVPNkibdaJlP?=
 =?us-ascii?Q?Wj4HL+xun9GLhGZnhS2qoD/Y2mulcn31uIUvf4wVB/bTqVK70bbyAwTgVqMe?=
 =?us-ascii?Q?zS9P1jYeQC5MFGrP701VH0x4DM4ZU6439NdzYlCIadpOtLeIrdeU7xGI2B4D?=
 =?us-ascii?Q?FEdj24+kA62l2aJjp1JPVaarWCIemwqZ/MyKxY6AqzvcLRXZF22AJKJaiCw7?=
 =?us-ascii?Q?Noi3IccmdhN34922vP8mZ0qGk4VN+UpJAApq3L/vpYXstGQMhujOFlnx8/Pm?=
 =?us-ascii?Q?WUZmcWSTKaCY4QjR0nfgZAl5p8yrjQeEs7aqf4e6HGHGM1PXS0ME4Z2iCrMO?=
 =?us-ascii?Q?YeJRcz9v+mvbiNStMiYM9spQir0/KjwN3k1WFVcdKv6EffFeA+LYAuZjrg5/?=
 =?us-ascii?Q?iolHxb3qGiRGCtGyeZ3bcX1U3CCkO3KO5u9mrQxWm8LWSDIiMO4uHFoDVXQN?=
 =?us-ascii?Q?XQ+8/ohhjh97Hh5QCDVH7O5ICYYKQn72K7KdbYxcJCv87js9PDc1QJMCtD0S?=
 =?us-ascii?Q?Yl7kGaiu13iWibKtfWPJoDvRS7cE19Z5sh8bQkeDe7o8BWp8NeSA2XEH3DKn?=
 =?us-ascii?Q?spmrm1Pg65p0uARz+eV7KLoEQe5HzTqbCHO2TnHZ9Q3xzSfPesxZ/PjYMepQ?=
 =?us-ascii?Q?yebiQfHy5rdk6frQfljSkuKKXfFHxpaAn6a1emFAeyU2T1t3FwenPIsqJ9i8?=
 =?us-ascii?Q?Lwl3nf94tNlV5Ib3d+WeKe5Zi+cBMjOWyXQjGqh6f+PS661HsLI2WHBMPDpm?=
 =?us-ascii?Q?duOrC+4gSa02cPKneswSfJmo+fZnHY30u0RaXwlDyareSGLD8Mfo58v9Iruo?=
 =?us-ascii?Q?y5BRhtiKnUnM33Aw4/Y=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBP189MB3196.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?IWCI0vEN+1zWWQJA+iomnZ/w7ZmUV5FuWt0hdVOXDPTPY0VIPZipK7BokRGB?=
 =?us-ascii?Q?TQWiVCKCKlqojNLqXOqu+bqVABbKy9gR9zjKh8L2g6bppK0PSXDu3QYNQzDR?=
 =?us-ascii?Q?VD3int9DXoRoqxI6ulWgCCPiMWZUCRx1F3B3zJ/enm8xdiLNs9ZGC+SsYjhe?=
 =?us-ascii?Q?prcpnt+ZWReVsXEPCbCesq9K5mfbxVPs9reYVG50Uq1jJ2qSBkORrxcWyycu?=
 =?us-ascii?Q?NOZFJFau6LUvsanLMjn9c1r5uxng+nxGoz1j55MWrfHHOW/aO7HSRKRwbdL/?=
 =?us-ascii?Q?Uu0mcAqWXn0tjpsJe91ehfnhF/iRzsHcGd0fgfI6dClxK/TIdFnI3k/7UAwu?=
 =?us-ascii?Q?OmrauZMo8AMWQhz7a7HRtd9Hyj6CwRNEfZy7rWopXeXVyEfF5GOyXgIfVmTF?=
 =?us-ascii?Q?0dVUT8cRULppQTBVW1Zg4xzygYsBfunBZr8sQcoKvAj32gSit/TPbFpN4N7O?=
 =?us-ascii?Q?QHIEp0h2ABxVZwdBDRBc4Y1VCdB/tFo/cGFMXb55fv2cuFSMT9YzuWIE+NWr?=
 =?us-ascii?Q?ckXAMKU1XY0pojQ6m20Ul9o8SHQhX4hn3R+XnRcatp1AYQOALceN986n06Ht?=
 =?us-ascii?Q?XAnRu6QnJddjToAriDhrztGOSZhDwz4CMgFtV8ADoc+K0PHb3VBKYaBDeQuR?=
 =?us-ascii?Q?ctQXGvroKUTOVtSrEn2YaUpWLFHyFclQkKQmfNgrz0Axq9ryIRntIv2KQRJh?=
 =?us-ascii?Q?lz6aJ/SHH4Vm/+xieWqAYg8WRr4Ox65a2sB1msqr0kaRkLYEGoMqwGQNhQyv?=
 =?us-ascii?Q?ZCnp69pHrh8+EIQaJlrGIJeXQxYMVTg4123pWm/eqfIShjbYZyMvpvr+0cmc?=
 =?us-ascii?Q?0WV05R0jrXX63T2QRteky4wDCHV3iM+vOxMcIDmAgorpyXd1G7mBMsdrJ6vf?=
 =?us-ascii?Q?ARAxmx6x1Acx0FvLHNVNRoGrcxAqvTykFChoqRBeVYjiA026ytgrO4lF30Zg?=
 =?us-ascii?Q?cB6Bc1wS4fU1s3hIGD+ipITRfWpRVC9dDj9vb+Ah7HcmZxXjnq+83MYj2Sx+?=
 =?us-ascii?Q?dTPPuMf+EHl1mpQyBIH+NOuoQ6y5UtWcDHD8dT6KdsgjKBcTGf2yDJuVDb9R?=
 =?us-ascii?Q?Nt6tzBu+geZHHvJmVCQd6ngFW14RKD/HhcgudfKzqCXyMBdLfUuIY619NFAa?=
 =?us-ascii?Q?chz7Xrt6mU5aeLiZLYRDLHTkbT5qMDr6hP4moWem8vfMpVUDO4DERQG21IqA?=
 =?us-ascii?Q?tXPW3Q5fymFo6VQoivAvaFwujfQH62LoqHz9whRbnjRBQKwmbxIOruvwNIhj?=
 =?us-ascii?Q?KT1M64RCk8YYQWLI6n46/ga53Z3kAkkoLdlGG+MtEaZCEz8KvcTYuIdO1bgq?=
 =?us-ascii?Q?h84V3nPaLQ7itDpRURhueLmzlSavl5hu+JkIBkag1H7NLBahgQFsbkSQKULG?=
 =?us-ascii?Q?gS9aWPLg+CQcnPcwZ2pOPj6N8JTk0kb2yumgroKMD8uf90uSPr9BlYReaig1?=
 =?us-ascii?Q?Hp69QHUyfEKici+R08LdeN9i687FWFEntcVyaKCZWg2fFcUTAG4VQWUzDbaz?=
 =?us-ascii?Q?9iSarQj3DZItJCFQEHjCp80Ak2vOKHccD9gjeqvbubF5CtM/FWdZ+ubwAeMt?=
 =?us-ascii?Q?wp8ZvfNWw//5Rf+UR3dQBQILdbV7sYO4u4LBTWmNWy+YDpywo+YejaLoPudR?=
 =?us-ascii?Q?SBw7/S4k2sedRCWXuvcBFdIxNMmLZb+pHAs4SBx0p+CB2hV6nri6STCtV4yY?=
 =?us-ascii?Q?ma2j8yXJk/UQZC0I9EKbGZepH2QRB+6t9RIgeX4IFFSQmw0HIXO9b97shzJ8?=
 =?us-ascii?Q?k7aX5OsP2g=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 688633ac-4b6a-4eb1-2cee-08de5fe8bbc4
X-MS-Exchange-CrossTenant-AuthSource: AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 10:17:12.1112
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W213Jgk90QW4tICj11IUkUOGNTThpX+XjRSSMznh5ndKVjyFBfVYCHw2hBiogrZsMpyA2QAlijUJz6OVFdrjag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P189MB2026
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Jan 2026 10:17:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230190

From: Amaury Couderc <amaury.couderc@est.tech>

Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
---
 .../curl/curl/CVE-2025-14524.patch            | 45 +++++++++++++++++++
 meta/recipes-support/curl/curl_8.7.1.bb       |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2025-14524.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2025-14524.patch b/meta/rec=
ipes-support/curl/curl/CVE-2025-14524.patch
new file mode 100644
index 0000000000..bd0dd86acb
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2025-14524.patch
@@ -0,0 +1,45 @@
+From 0bccd8d29c89d70120444088d3893af59f3772bf Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Wed, 10 Dec 2025 11:40:47 +0100
+Subject: [PATCH] curl_sasl: if redirected, require permission to use beare=
r
+
+Closes #19933
+
+CVE: CVE-2025-14524
+Upstream-Status: Backport
+[https://github.com/curl/curl/commit/1a822275d333dc6da6043497160fd04c8fa48=
640]
+
+Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
+---
+ lib/curl_sasl.c | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/lib/curl_sasl.c b/lib/curl_sasl.c
+index 66639cbacc..fe646548a8 100644
+--- a/lib/curl_sasl.c
++++ b/lib/curl_sasl.c
+@@ -357,7 +357,9 @@ CURLcode Curl_sasl_start(struct SASL *sasl, struct Cur=
l_easy *data,
+     data->set.str[STRING_SERVICE_NAME] :
+     sasl->params->service;
+ #endif
+-  const char *oauth_bearer =3D data->set.str[STRING_BEARER];
++  const char *oauth_bearer =3D
++    (!data->state.this_is_a_follow || data->set.allow_auth_to_other_hosts=
) ?
++    data->set.str[STRING_BEARER] : NULL;
+   struct bufref nullmsg;
+=20
+   Curl_conn_get_host(data, FIRSTSOCKET, &hostname, &disp_hostname, &port)=
;
+@@ -544,7 +546,9 @@ CURLcode Curl_sasl_continue(struct SASL *sasl, struct =
Curl_easy *data,
+     data->set.str[STRING_SERVICE_NAME] :
+     sasl->params->service;
+ #endif
+-  const char *oauth_bearer =3D data->set.str[STRING_BEARER];
++  const char *oauth_bearer =3D
++    (!data->state.this_is_a_follow || data->set.allow_auth_to_other_hosts=
) ?
++    data->set.str[STRING_BEARER] : NULL;
+   struct bufref serverdata;
+=20
+   Curl_conn_get_host(data, FIRSTSOCKET, &hostname, &disp_hostname, &port)=
;
+--=20
+2.43.0
+
diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-support=
/curl/curl_8.7.1.bb
index 0af6a41399..33bf6b1163 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -25,6 +25,7 @@ SRC_URI =3D " \
     file://CVE-2024-11053-0003.patch \
     file://CVE-2025-0167.patch \
     file://CVE-2025-9086.patch \
+    file://CVE-2025-14524.patch \
 "
=20
 SRC_URI:append:class-nativesdk =3D " \
--=20
2.52.0


