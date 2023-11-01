Return-Path: <william.lyu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D43FBC4332F
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 13:38:10 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.7342.1698845886315310722
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Nov 2023 06:38:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Ait8RHD6;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=96692b3a59=william.lyu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3A1AggEo017311
	for <openembedded-core@lists.openembedded.org>; Wed, 1 Nov 2023 06:38:06 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=pZplbRLjsopah3OaZ+
	EkrjDm2R9lhC5ZOX4Z4ocJtWA=; b=Ait8RHD6biEPaw4Ng+awGzWV82ORr9aq7m
	oZ+/a+5nryZRKyuQAaHJH04/Q/WcgbncMqa5ISkwdIzE1qKOGQH+4WK3Ki8z0Cdn
	aOe3q3f0HU7Lso+lVU9CUMG0X2ypzz9JsA+YnH0aIX7xsByqNfTekGdApMHPUjmK
	D8Q9yZSoBJzq+Bf6bKAXHnxG1S7YvJZfFM21L56E3abhOXEdJRbiECx2gE3ZFqwD
	r3LxFFyt6MUDYAMBF8FNAJlRYJ3xKpRAdEFSLatCXC3VIS956JsLfC81PqthjnRn
	mAD9iDPRt6MCCFL9iT+2RPDS1y/o7dLF/bGgGi/36U5D/1wzPa/Q==
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2101.outbound.protection.outlook.com [104.47.55.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3u0wk0mrbu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 06:38:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nWiOpdQL9eiXYsP05NFOieb1D6AjdLmR/5nvS7F0cgnSgmidnoPstYuPP5HleUP9bIUtcIGYnVn/qqpobqqOdgG3udUwrZMwi1wI5Z6871MheKY2UgDAi7eje9y55j6dz/GjGbXB2BM0bSIAvk+i2XBR0tPKb/DzFGTPT6I3QpSawHX2LVD4QCKHN8stMLOPqHeNxdhVRey/mh/q0fklqJQQH5hxh57FVZRyD5PcbBAaDwFQLA7+6MR8MlZsO6ETKn3Ue6kcqYomTW0RxutZnBPCZOAiIDFoifmaeKnyeFDAiocGmzHAwfocKhItecij/fTEsBvVG9mIrsZQ7ynurw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pZplbRLjsopah3OaZ+EkrjDm2R9lhC5ZOX4Z4ocJtWA=;
 b=b66bOWrp1LAXQ9cyIXneOOXXaJzYH3RHiaAi3SgPZsvUrdTDtPqpXBsT1GpiB0AEpjmjJEJITURZJVEQjICrR+Z/lF/lAr9dLdw9l+A0XZusAvFvzZXJvf3JJqs759zT3X7u1Mgu2m7WmEQeELapJBU7anEvRY/6l3kakXQTIFfRmUU01kMym21Xnt/5FqA6zvQ1oaa3/0+dEhuBNeVhVLbwp/RG+EnBxh7ViCNr+SyW5YTVzFG86J4OTPtF3+inOf3HtwcNcaiwJ2YK0Bqpn7FnG33xjrPXGuIRtf/6ASGlAiKqia5e/ADYMnznBcpc5moD/e0nxzv5mAPh3Es3AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CY5PR11MB6342.namprd11.prod.outlook.com (2603:10b6:930:3d::20)
 by MN6PR11MB8241.namprd11.prod.outlook.com (2603:10b6:208:473::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.27; Wed, 1 Nov
 2023 13:38:02 +0000
Received: from CY5PR11MB6342.namprd11.prod.outlook.com
 ([fe80::c26b:3dee:6412:a695]) by CY5PR11MB6342.namprd11.prod.outlook.com
 ([fe80::c26b:3dee:6412:a695%6]) with mapi id 15.20.6933.025; Wed, 1 Nov 2023
 13:38:02 +0000
From: William.Lyu@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] openssl: improve handshake test error reporting
Date: Wed,  1 Nov 2023 09:37:41 -0400
Message-Id: <20231101133741.3916345-1-William.Lyu@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0150.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::35) To CY5PR11MB6342.namprd11.prod.outlook.com
 (2603:10b6:930:3d::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6342:EE_|MN6PR11MB8241:EE_
X-MS-Office365-Filtering-Correlation-Id: f31f1de2-fdcf-4054-ab3a-08dbdadfc543
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	yX+F365NCRSNnXAoOMTBIe5jz/M7OBldQUobZJTS8kAL0RYl8bVCDCZRfzdEygKOuTmqFUzxRq4krJShvaUo9lMU219dtH2AZOHZR4mpmce1FKzn2RTpHlbdX+EWuDMbYbgvc/oJZjMczTW8Ya9GIHVfvxyHezbxjCIhb3KpLpu5jxSCwTsWBgKCfWr7s4XQG3nQicq7rOjbzmp+lM5pUQ9PKzdI1d+3WuKdO2dqzWfD9dpUIvRFHG6HO0AbJM2e940Tk0tx9TZarSET/Yd4jZx6r1BwX6pMWJL66vNuAHsthzJOUO2q/yVmGxGwjcwi2f5tLrz0gueeoUn6n/2Xe9OyMqp67qhUR5KrroVCvK8inZwpIytixoaBGTpduwhhtjHEovhHLRbm4ZSfwct7x5lq/NueyBMfu3dVQAgAaNQE03moAdqffH9Pbi9d5Nkc11Sws/CHJFXDGPOVfsfVrw+bbpSIxicVYdsIv3bu38SIe6YiGcTjvPtizkoI20MF60reeBNWg70J2Rb2cKFVo7x6PFnoZi6rCE/ecustARx8fu6d5PmRqA8Nk9nFEGojgTrghkPnSgcZYg677GK0RfddHgkikZxGMmI63SpAxsg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6342.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(396003)(346002)(376002)(136003)(366004)(230922051799003)(451199024)(186009)(64100799003)(1800799009)(2906002)(26005)(6916009)(66946007)(83380400001)(66556008)(38100700002)(9686003)(6506007)(52116002)(6512007)(6486002)(478600001)(6666004)(2616005)(66476007)(1076003)(41300700001)(30864003)(8676002)(36756003)(86362001)(5660300002)(8936002)(316002)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?4CrJriILqLMnbjFaGSkSodh3Cf7SVw/YOKMBfp6I3Y849hzPBZsN5P44marA?=
 =?us-ascii?Q?vovo0D4dDlILSfqy3bezosgHdtAi86mb9JQpjFK9MyM2ZEMeUGFlVpwItoFK?=
 =?us-ascii?Q?J5HzOObcURywwO57pSwSdMw1epql1m8MGY7YXTfSfZYpF0jlR/XHFSF1Un2S?=
 =?us-ascii?Q?oEkoAMLzjvzT7PRNkcJwBV6LG+p6gcvtqvbjbkRTzSS1Lx+vDlsI6uLmwcNX?=
 =?us-ascii?Q?a7XMN1X/EXGkHB2nhKAm2cBHjTy06+IsMYDh1YB1P3dA6ZVNNeQ4v7UefNxs?=
 =?us-ascii?Q?43Y5vlYvIb4OUkMqiHGI79VL2aXQljERgXOS7vNiN/byIsIdrFiLTkPxa92N?=
 =?us-ascii?Q?P8L8EbyQq81fLy84YChGEkbxskE+7Et0kJlRmvyZlCMGrFB+ESM3Sq9fBw6D?=
 =?us-ascii?Q?uydLWPmRSXMbMwztJAGND/MgMHp9phiLmR+mOwuqq+s+laH4ghpGdU/CAj8L?=
 =?us-ascii?Q?p7Q+pHOsG06P0BJu/c6JxVfGHDU5/v98ZfYX73cy5b90nnakif4wbMcMpcOZ?=
 =?us-ascii?Q?Nj9Be76WV0jqpANOnMxJJmjFdRCSE5EKxgfql1Dgpen1vLzNlrDYTokoCHeJ?=
 =?us-ascii?Q?FcEHNjaRd7GtuY2IRm/X1XfScVKo9H1GMTzRtfEPT1RuD8POMfQcYBfe9nIC?=
 =?us-ascii?Q?pxyA4yPvJImKaM5Bqp7phcehKoP8Isvm7LYgLzedcGtJRWgw0In07k+6QHqE?=
 =?us-ascii?Q?Tl89YkTbm3WUnl2ZkewBO1Jg4Egl6YobjfJ/CKcdOaJEBTIzExP4qfcXKBYL?=
 =?us-ascii?Q?smmqomQZ7iN/IzYEL2c9NOUpSKvMa+J5wm0989ATg0KpeeJKRD8dizGso+jE?=
 =?us-ascii?Q?w6z501CE15L/BCWDP7Yj/kDZgJKMnVkeazubYrIROnAD0CRAVOfs9ezDMfPD?=
 =?us-ascii?Q?f/lAKE2prPA+dvWnu6Yi5EIYMJMaKLRp+grqcP2DwFErxp5sQuaSIAAjPuqK?=
 =?us-ascii?Q?JQiKkytJE1pjjIBM+rlq0WHG0HzOyP7++6gU4XxHDzd7CgEcHf/Raj2i9Bfy?=
 =?us-ascii?Q?h9sHDvE2ZSvzJC92MUyViBxq58bRAWPGkfO/ctSOttqRsZG8doGKR/V3VNBO?=
 =?us-ascii?Q?CiZvgVghnos45OvjYlART7J9jT2ltQ2tqL30gL6atQzv3KTfP3GrguRIsIeJ?=
 =?us-ascii?Q?22AOZn2GyTqHwrjAp7Dd3GdDTFL/Mdz5ZQQm1nAjqYU+jFWFXYtSLD3mP7Lj?=
 =?us-ascii?Q?zco/3yGY0U2FnwSQWs41iaecmqXr+I63P9/ESVUMnTZ+lFxU3fE7CujyiTmG?=
 =?us-ascii?Q?5ARO2Vww7mrRzsD0toX01ZPPqzOdUBO4UYaalH7FUnp8obsURWh2DFENjdGl?=
 =?us-ascii?Q?FN+WLodmLxHZSl4XLDr9+36Aa5bhMjBxAuZyHhDtp1CGgIOFk9JAuGntwLrR?=
 =?us-ascii?Q?2laRE6WcDnGwoyidnjQ81UwMAizZkaOuOzA3LKo6yRbeAyvSOjgdvbS6dLjc?=
 =?us-ascii?Q?kZ7ywDcp6wAW9vbDzMbJ35k9sCNiV5rNLiv1CusIF88INm2+ZR6VozJMYyxB?=
 =?us-ascii?Q?p/Zk6JIVq6G9LmfcIfg7zeavjkNGbaZYRMevZ3qYZ4VN7Z8avT5cfFTP0eIl?=
 =?us-ascii?Q?pDOc5yUbUIY3Xi10Ud9FId7Ws2qYWtCx54Be2sTo1/GiTWXE4fO2ANDBIPkM?=
 =?us-ascii?Q?UA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f31f1de2-fdcf-4054-ab3a-08dbdadfc543
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6342.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2023 13:38:02.6897
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qLaQ3ngSrLnoskoTwGJxlfZsf/fy2aWjTok2QjLPYCar6af/cFSZhirO+Jdmeq7224G5kygtX4vH1y5czk9qCc+9kPUV3Kp92NH96uaon58=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8241
X-Proofpoint-ORIG-GUID: 570nKL9qV-iYpLowfTf8Kkn5ELtI4An6
X-Proofpoint-GUID: 570nKL9qV-iYpLowfTf8Kkn5ELtI4An6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-01_12,2023-11-01_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=999 spamscore=0 phishscore=0 adultscore=0 clxscore=1011
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2310240000 definitions=main-2311010114
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 13:38:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189912

From: William Lyu <William.Lyu@windriver.com>

Fixes [YOCTO #15225]

Yocto Bug #15255 is not reproducible. To obtain more useful information
for debugging, the OpenSSL test code is improved so that more detailed
state information in the handshake loop is printed when an error occurs.

Signed-off-by: William Lyu <William.Lyu@windriver.com>
---
 ...ke-history-reporting-when-test-fails.patch | 374 ++++++++++++++++++
 .../openssl/openssl_3.1.4.bb                  |   1 +
 2 files changed, 375 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/0001-Added-handshake-history-reporting-when-test-fails.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/0001-Added-handshake-history-reporting-when-test-fails.patch b/meta/recipes-connectivity/openssl/openssl/0001-Added-handshake-history-reporting-when-test-fails.patch
new file mode 100644
index 0000000000..aa2e5bb800
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/0001-Added-handshake-history-reporting-when-test-fails.patch
@@ -0,0 +1,374 @@
+From 5ba65051fea0513db0d997f0ab7cafb9826ed74a Mon Sep 17 00:00:00 2001
+From: William Lyu <William.Lyu@windriver.com>
+Date: Fri, 20 Oct 2023 16:22:37 -0400
+Subject: [PATCH] Added handshake history reporting when test fails
+
+Upstream-Status: Submitted [https://github.com/openssl/openssl/pull/22481]
+
+Signed-off-by: William Lyu <William.Lyu@windriver.com>
+---
+ test/helpers/handshake.c | 139 +++++++++++++++++++++++++++++----------
+ test/helpers/handshake.h |  70 +++++++++++++++++++-
+ test/ssl_test.c          |  44 +++++++++++++
+ 3 files changed, 218 insertions(+), 35 deletions(-)
+
+diff --git a/test/helpers/handshake.c b/test/helpers/handshake.c
+index e0422469e4..ae2ad59dd4 100644
+--- a/test/helpers/handshake.c
++++ b/test/helpers/handshake.c
+@@ -1,5 +1,5 @@
+ /*
+- * Copyright 2016-2022 The OpenSSL Project Authors. All Rights Reserved.
++ * Copyright 2016-2023 The OpenSSL Project Authors. All Rights Reserved.
+  *
+  * Licensed under the Apache License 2.0 (the "License").  You may not use
+  * this file except in compliance with the License.  You can obtain a copy
+@@ -24,6 +24,102 @@
+ #include <netinet/sctp.h>
+ #endif
+
++/* Shamelessly copied from test/helpers/ssl_test_ctx.c */
++/* Maps string names to various enumeration type */
++typedef struct {
++    const char *name;
++    int value;
++} enum_name_map;
++
++static const enum_name_map connect_phase_names[] = {
++    {"Handshake", HANDSHAKE},
++    {"RenegAppData", RENEG_APPLICATION_DATA},
++    {"RenegSetup", RENEG_SETUP},
++    {"RenegHandshake", RENEG_HANDSHAKE},
++    {"AppData", APPLICATION_DATA},
++    {"Shutdown", SHUTDOWN},
++    {"ConnectionDone", CONNECTION_DONE}
++};
++
++static const enum_name_map peer_status_names[] = {
++    {"PeerSuccess", PEER_SUCCESS},
++    {"PeerRetry", PEER_RETRY},
++    {"PeerError", PEER_ERROR},
++    {"PeerWaiting", PEER_WAITING},
++    {"PeerTestFail", PEER_TEST_FAILURE}
++};
++
++static const enum_name_map handshake_status_names[] = {
++    {"HandshakeSuccess", HANDSHAKE_SUCCESS},
++    {"ClientError", CLIENT_ERROR},
++    {"ServerError", SERVER_ERROR},
++    {"InternalError", INTERNAL_ERROR},
++    {"HandshakeRetry", HANDSHAKE_RETRY}
++};
++
++/* Shamelessly copied from test/helpers/ssl_test_ctx.c */
++static const char *enum_name(const enum_name_map *enums, size_t num_enums,
++                             int value)
++{
++    size_t i;
++    for (i = 0; i < num_enums; i++) {
++        if (enums[i].value == value) {
++            return enums[i].name;
++        }
++    }
++    return "InvalidValue";
++}
++
++const char *handshake_connect_phase_name(connect_phase_t phase)
++{
++    return enum_name(connect_phase_names, OSSL_NELEM(connect_phase_names),
++                     (int)phase);
++}
++
++const char *handshake_status_name(handshake_status_t handshake_status)
++{
++    return enum_name(handshake_status_names, OSSL_NELEM(handshake_status_names),
++                     (int)handshake_status);
++}
++
++const char *handshake_peer_status_name(peer_status_t peer_status)
++{
++    return enum_name(peer_status_names, OSSL_NELEM(peer_status_names),
++                     (int)peer_status);
++}
++
++static void save_loop_history(HANDSHAKE_HISTORY *history,
++                              connect_phase_t phase,
++                              handshake_status_t handshake_status,
++                              peer_status_t server_status,
++                              peer_status_t client_status,
++                              int client_turn_count,
++                              int is_client_turn)
++{
++    HANDSHAKE_HISTORY_ENTRY *new_entry = NULL;
++
++    /*
++     * Create a new history entry for a handshake loop with statuses given in
++     * the arguments. Potentially evicting the oldest entry when the
++     * ring buffer is full.
++     */
++    ++(history->last_idx);
++    history->last_idx &= MAX_HANDSHAKE_HISTORY_ENTRY_IDX_MASK;
++
++    new_entry = &((history->entries)[history->last_idx]);
++    new_entry->phase = phase;
++    new_entry->handshake_status = handshake_status;
++    new_entry->server_status = server_status;
++    new_entry->client_status = client_status;
++    new_entry->client_turn_count = client_turn_count;
++    new_entry->is_client_turn = is_client_turn;
++
++    /* Evict the oldest handshake loop entry when the ring buffer is full. */
++    if (history->entry_count < MAX_HANDSHAKE_HISTORY_ENTRY) {
++        ++(history->entry_count);
++    }
++}
++
+ HANDSHAKE_RESULT *HANDSHAKE_RESULT_new(void)
+ {
+     HANDSHAKE_RESULT *ret;
+@@ -719,15 +815,6 @@ static void configure_handshake_ssl(SSL *server, SSL *client,
+         SSL_set_post_handshake_auth(client, 1);
+ }
+
+-/* The status for each connection phase. */
+-typedef enum {
+-    PEER_SUCCESS,
+-    PEER_RETRY,
+-    PEER_ERROR,
+-    PEER_WAITING,
+-    PEER_TEST_FAILURE
+-} peer_status_t;
+-
+ /* An SSL object and associated read-write buffers. */
+ typedef struct peer_st {
+     SSL *ssl;
+@@ -1074,17 +1161,6 @@ static void do_shutdown_step(PEER *peer)
+     }
+ }
+
+-typedef enum {
+-    HANDSHAKE,
+-    RENEG_APPLICATION_DATA,
+-    RENEG_SETUP,
+-    RENEG_HANDSHAKE,
+-    APPLICATION_DATA,
+-    SHUTDOWN,
+-    CONNECTION_DONE
+-} connect_phase_t;
+-
+-
+ static int renegotiate_op(const SSL_TEST_CTX *test_ctx)
+ {
+     switch (test_ctx->handshake_mode) {
+@@ -1162,19 +1238,6 @@ static void do_connect_step(const SSL_TEST_CTX *test_ctx, PEER *peer,
+     }
+ }
+
+-typedef enum {
+-    /* Both parties succeeded. */
+-    HANDSHAKE_SUCCESS,
+-    /* Client errored. */
+-    CLIENT_ERROR,
+-    /* Server errored. */
+-    SERVER_ERROR,
+-    /* Peers are in inconsistent state. */
+-    INTERNAL_ERROR,
+-    /* One or both peers not done. */
+-    HANDSHAKE_RETRY
+-} handshake_status_t;
+-
+ /*
+  * Determine the handshake outcome.
+  * last_status: the status of the peer to have acted last.
+@@ -1539,6 +1602,10 @@ static HANDSHAKE_RESULT *do_handshake_internal(
+
+     start = time(NULL);
+
++    save_loop_history(&(ret->history),
++                      phase, status, server.status, client.status,
++                      client_turn_count, client_turn);
++
+     /*
+      * Half-duplex handshake loop.
+      * Client and server speak to each other synchronously in the same process.
+@@ -1560,6 +1627,10 @@ static HANDSHAKE_RESULT *do_handshake_internal(
+                                       0 /* server went last */);
+         }
+
++        save_loop_history(&(ret->history),
++                          phase, status, server.status, client.status,
++                          client_turn_count, client_turn);
++
+         switch (status) {
+         case HANDSHAKE_SUCCESS:
+             client_turn_count = 0;
+diff --git a/test/helpers/handshake.h b/test/helpers/handshake.h
+index 78b03f9f4b..b9967c2623 100644
+--- a/test/helpers/handshake.h
++++ b/test/helpers/handshake.h
+@@ -1,5 +1,5 @@
+ /*
+- * Copyright 2016-2021 The OpenSSL Project Authors. All Rights Reserved.
++ * Copyright 2016-2023 The OpenSSL Project Authors. All Rights Reserved.
+  *
+  * Licensed under the Apache License 2.0 (the "License").  You may not use
+  * this file except in compliance with the License.  You can obtain a copy
+@@ -12,6 +12,11 @@
+
+ #include "ssl_test_ctx.h"
+
++#define MAX_HANDSHAKE_HISTORY_ENTRY_BIT 4
++#define MAX_HANDSHAKE_HISTORY_ENTRY (1 << MAX_HANDSHAKE_HISTORY_ENTRY_BIT)
++#define MAX_HANDSHAKE_HISTORY_ENTRY_IDX_MASK \
++    ((1 << MAX_HANDSHAKE_HISTORY_ENTRY_BIT) - 1)
++
+ typedef struct ctx_data_st {
+     unsigned char *npn_protocols;
+     size_t npn_protocols_len;
+@@ -22,6 +27,63 @@ typedef struct ctx_data_st {
+     char *session_ticket_app_data;
+ } CTX_DATA;
+
++typedef enum {
++    HANDSHAKE,
++    RENEG_APPLICATION_DATA,
++    RENEG_SETUP,
++    RENEG_HANDSHAKE,
++    APPLICATION_DATA,
++    SHUTDOWN,
++    CONNECTION_DONE
++} connect_phase_t;
++
++/* The status for each connection phase. */
++typedef enum {
++    PEER_SUCCESS,
++    PEER_RETRY,
++    PEER_ERROR,
++    PEER_WAITING,
++    PEER_TEST_FAILURE
++} peer_status_t;
++
++typedef enum {
++    /* Both parties succeeded. */
++    HANDSHAKE_SUCCESS,
++    /* Client errored. */
++    CLIENT_ERROR,
++    /* Server errored. */
++    SERVER_ERROR,
++    /* Peers are in inconsistent state. */
++    INTERNAL_ERROR,
++    /* One or both peers not done. */
++    HANDSHAKE_RETRY
++} handshake_status_t;
++
++/* Stores the various status information in a handshake loop. */
++typedef struct handshake_history_entry_st {
++    connect_phase_t phase;
++    handshake_status_t handshake_status;
++    peer_status_t server_status;
++    peer_status_t client_status;
++    int client_turn_count;
++    int is_client_turn;
++} HANDSHAKE_HISTORY_ENTRY;
++
++typedef struct handshake_history_st {
++    /* Implemented using ring buffer. */
++    /*
++     * The valid entries are |entries[last_idx]|, |entries[last_idx-1]|,
++     * ..., etc., going up to |entry_count| number of entries. Note that when
++     * the index into the array |entries| becomes < 0, we wrap around to
++     * the end of |entries|.
++     */
++    HANDSHAKE_HISTORY_ENTRY entries[MAX_HANDSHAKE_HISTORY_ENTRY];
++    /* The number of valid entries in |entries| array. */
++    size_t entry_count;
++    /* The index of the last valid entry in the |entries| array. */
++    size_t last_idx;
++} HANDSHAKE_HISTORY;
++
+ typedef struct handshake_result {
+     ssl_test_result_t result;
+     /* These alerts are in the 2-byte format returned by the info_callback. */
+@@ -77,6 +139,8 @@ typedef struct handshake_result {
+     char *cipher;
+     /* session ticket application data */
+     char *result_session_ticket_app_data;
++    /* handshake loop history */
++    HANDSHAKE_HISTORY history;
+ } HANDSHAKE_RESULT;
+
+ HANDSHAKE_RESULT *HANDSHAKE_RESULT_new(void);
+@@ -95,4 +159,8 @@ int configure_handshake_ctx_for_srp(SSL_CTX *server_ctx, SSL_CTX *server2_ctx,
+                                     CTX_DATA *server2_ctx_data,
+                                     CTX_DATA *client_ctx_data);
+
++const char *handshake_connect_phase_name(connect_phase_t phase);
++const char *handshake_status_name(handshake_status_t handshake_status);
++const char *handshake_peer_status_name(peer_status_t peer_status);
++
+ #endif  /* OSSL_TEST_HANDSHAKE_HELPER_H */
+diff --git a/test/ssl_test.c b/test/ssl_test.c
+index ea608518f9..9d6b093c81 100644
+--- a/test/ssl_test.c
++++ b/test/ssl_test.c
+@@ -26,6 +26,44 @@ static OSSL_LIB_CTX *libctx = NULL;
+ /* Currently the section names are of the form test-<number>, e.g. test-15. */
+ #define MAX_TESTCASE_NAME_LENGTH 100
+
++static void print_handshake_history(const HANDSHAKE_HISTORY *history)
++{
++    size_t first_idx;
++    size_t i;
++    size_t cur_idx;
++    const HANDSHAKE_HISTORY_ENTRY *cur_entry;
++    const char header_template[] = "|%14s|%16s|%16s|%16s|%17s|%14s|";
++    const char body_template[]   = "|%14s|%16s|%16s|%16s|%17d|%14s|";
++
++    TEST_info("The following is the server/client state "
++              "in the most recent %d handshake loops.",
++              MAX_HANDSHAKE_HISTORY_ENTRY);
++
++    TEST_note("=================================================="
++              "==================================================");
++    TEST_note(header_template,
++              "phase", "handshake status", "server status",
++              "client status", "client turn count", "is client turn");
++    TEST_note("+--------------+----------------+----------------"
++              "+----------------+-----------------+--------------+");
++
++    first_idx = (history->last_idx - history->entry_count + 1) &
++                MAX_HANDSHAKE_HISTORY_ENTRY_IDX_MASK;
++    for (i = 0; i < history->entry_count; ++i) {
++        cur_idx = (first_idx + i) & MAX_HANDSHAKE_HISTORY_ENTRY_IDX_MASK;
++        cur_entry = &(history->entries)[cur_idx];
++        TEST_note(body_template,
++                  handshake_connect_phase_name(cur_entry->phase),
++                  handshake_status_name(cur_entry->handshake_status),
++                  handshake_peer_status_name(cur_entry->server_status),
++                  handshake_peer_status_name(cur_entry->client_status),
++                  cur_entry->client_turn_count,
++                  cur_entry->is_client_turn ? "true" : "false");
++    }
++    TEST_note("=================================================="
++              "==================================================");
++}
++
+ static const char *print_alert(int alert)
+ {
+     return alert ? SSL_alert_desc_string_long(alert) : "no alert";
+@@ -388,6 +426,12 @@ static int check_test(HANDSHAKE_RESULT *result, SSL_TEST_CTX *test_ctx)
+         ret &= check_client_sign_type(result, test_ctx);
+         ret &= check_client_ca_names(result, test_ctx);
+     }
++
++    /* Print handshake loop history if any check fails. */
++    if (!ret) {
++        print_handshake_history(&(result->history));
++    }
++
+     return ret;
+ }
+
+--
+2.25.1
+
diff --git a/meta/recipes-connectivity/openssl/openssl_3.1.4.bb b/meta/recipes-connectivity/openssl/openssl_3.1.4.bb
index e4b20e4a40..c6c70a1213 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.1.4.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.1.4.bb
@@ -13,6 +13,7 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://0001-Configure-do-not-tweak-mips-cflags.patch \
            file://fix_random_labels.patch \
            file://0001-Link-libatomic-on-riscv32.patch \
+           file://0001-Added-handshake-history-reporting-when-test-fails.patch \
            "
 
 SRC_URI:append:class-nativesdk = " \
-- 
2.25.1


