Return-Path: <andrej.valek@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62266C6FD19
	for <webhook@archiver.kernel.org>; Fri, 10 Mar 2023 09:54:48 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.69])
 by mx.groups.io with SMTP id smtpd.web11.15610.1678442077967748453
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Mar 2023 01:54:39 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@siemens.com header.s=selector2 header.b=IgGc2BuL;
 spf=pass (domain: siemens.com, ip: 40.107.20.69, mailfrom: andrej.valek@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W3yaqemc4p/RxY3WUwoZxLZdhC+uFFCm4BajlpRS0hbfx9nSkyiJhsj1EXpzeHsHEXdvfraioN7yM60QnnhamUasBdu6eoA/nYo5EgT94vDe9t1p0UOsOPt/ljzjnpoL6nDrC6d/X1msvEtOdB4+3LkaSi8kaiT1N0S5UXJDkRcHbqxdkZMtrF8KMszm3JPX0wW7SsdVDOJ+/eTgUughH4nhOiENceNLMRPHvuOziZckyU4FdM1QZGADBlVsC3hQi4oG3/9aSFT+T1QKY/TqGTin85rEYAtZnuxXUW9UlPzS73AbyF2881TlhsBjNP6Mb/ax/LWVux9dfEAr+//D8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bXz9WmuD0PyMYbUIrJToN9IslcYiDRYpFSGfztdS3To=;
 b=U5wsdIbseyKuPQQZojmdcwsk4Upuuuye28Mj55h1OsUTcOReZPjjFLWgBBrfn6GLL6h4zRpgiP0jH9KUO3VjjPEGGNvRQhMaA6Q/2R3M9yUck5epX3BnQ2ogOeuqaAl1PKI48rsi6hdDF3H19jHVnhnr1r4Hr51dEMX9lusJNam2g2cnfTry4pid2Ek+eSXdP8LsC9ci4hjWUPv802uaQ4gp5Rnr9HPlzlqriDWxetEwSzoXHT1K8LcuTCJatwRwY34ckrIsjwzz5w9z2tVsywWf4ZNYC3pWt+eeCCNcIWNFFQc+klv1KpbfA6WzmXNWhGQF/4lJar+lW/8RZt0Q0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.74) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=siemens.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=siemens.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bXz9WmuD0PyMYbUIrJToN9IslcYiDRYpFSGfztdS3To=;
 b=IgGc2BuLUXErr78hjJvKBtDsZnGWSbMZGwY7XInYsbOjt1xi7spYQncaQzo1P5cfxHMhE2nzRZb5FTrz89Gk2Tx5emcoW5GAdTSmOEEu7VmCFaq2xjXTZ9znIYlk3BP3gt33ffO13NeWsqnMWeUwkB9A8+A2W4vEDzJ2WE6g2hPhiwR2jFsHk0F6NJH7KDfmBsfmm2efMN6BN24Px9g5zZlnUqoTXend0Rghnx8rvAmRMkjAI79WcdM5F3hdvghFJXnArtfnMxoQmndbQ1IfMf6NRbi1Ibts+AN7HqFawvaNSSRR6hcnerJvV+jMhKJWWbIpLNIT80n03iDR9rECug==
Received: from AM6PR10CA0051.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:80::28)
 by AS8PR10MB7586.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:564::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19; Fri, 10 Mar
 2023 09:54:35 +0000
Received: from VE1EUR01FT106.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:209:80:cafe::61) by AM6PR10CA0051.outlook.office365.com
 (2603:10a6:209:80::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19 via Frontend
 Transport; Fri, 10 Mar 2023 09:54:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.74)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.74; helo=hybrid.siemens.com; pr=C
Received: from hybrid.siemens.com (194.138.21.74) by
 VE1EUR01FT106.mail.protection.outlook.com (10.152.2.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.19 via Frontend Transport; Fri, 10 Mar 2023 09:54:35 +0000
Received: from DEMCHDC8WBA.ad011.siemens.net (139.25.226.105) by
 DEMCHDC8VQA.ad011.siemens.net (194.138.21.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Fri, 10 Mar 2023 10:54:34 +0100
Received: from md3hr6tc.ad001.siemens.net (139.21.16.91) by
 DEMCHDC8WBA.ad011.siemens.net (139.25.226.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.21; Fri, 10 Mar 2023 10:54:34 +0100
From: Andrej Valek <andrej.valek@siemens.com>
To: <openembedded-core@lists.openembedded.org>
CC: Andrej Valek <andrej.valek@siemens.com>
Subject: [OE-core][dunfell][PATCH 1/2] curl: Fix CVE CVE-2022-43552
Date: Fri, 10 Mar 2023 10:54:01 +0100
Message-ID: <20230310095402.85948-1-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <CAOSpxdZm91QVn9tEjKeoXC79rxNNwkeDz2qWzgPTakJ4k6Jo2w@mail.gmail.com>
References: <CAOSpxdZm91QVn9tEjKeoXC79rxNNwkeDz2qWzgPTakJ4k6Jo2w@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [139.21.16.91]
X-ClientProxiedBy: DEMCHDC8WBA.ad011.siemens.net (139.25.226.105) To
 DEMCHDC8WBA.ad011.siemens.net (139.25.226.105)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1EUR01FT106:EE_|AS8PR10MB7586:EE_
X-MS-Office365-Filtering-Correlation-Id: 908aa150-3ae1-4e96-6c5e-08db214d746b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Dbsp7v7ieHo59H+ulp+/NyIxiJyBaUKs0uC16JC5HecErzxjtIctOSdWWPwRB6y5oogBWK3KuB4DIbS2jny1MuvYMHJvmAI4SF2f3k4BM7STPqyspzgpF944KKk2vE9IOc3fVLbstlGTmwx7it6ER0BBCTCaE0rh374rWnQPb4kEYjA2oYA83Cmpm5Nxgk+yZoSL7CfDaxQ3/bGcoGKbNfkd2ERc5b+8IbZspRK+SvaqnRxMTnbkM15tK0ekXEywSU/UgP8g8wnKCaMPNAXurKIoYZ8QF4SU3zpHC8K2ofKY77aY0JVgYWVCnNbyMWUbKNjA7kw/YL02XRFzx5t+LvY0VhqhI6klWn4pJNIJa86hXHB6t9NweF3lfXIQKLJfxEkiyRnEdfRlqcgh9nxd7CAXPgTcnvzAd3Q/JowSNCRo4i49fo0zs+SUfqTPbGEBsuDNYL7qb8umWcLa70QBarmOcfy/b7NTxtjDgRapoNZLY8VOw4vCY3kofq24h23Bvi67Yi7pCde0Btb3Yk0pSa0WVPlpIEXQWktb81E51Ngr5HWU5sG2dxqPkN7KXH6yer4bAjGgXM5l25BC2ojAJ0E7WIFTfl2Jw6BhigwTjOGx7vaV/Zfip4Wz8TMj08wMWeP6h6BrGi3uLeHjhH8r2ZCLuv5gS8EVNKi0cdoNjW/KyNkj+B/W/k9qqGRriG6v5SxwJkXmabdq5Ww350KFMaemxDbEZcLyCw4k+n2SgvE=
X-Forefront-Antispam-Report: 
	CIP:194.138.21.74;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:hybrid.siemens.com;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(376002)(136003)(346002)(396003)(451199018)(46966006)(40470700004)(36840700001)(8676002)(316002)(4326008)(6916009)(6666004)(107886003)(70206006)(70586007)(82310400005)(40460700003)(336012)(966005)(478600001)(83380400001)(47076005)(40480700001)(36756003)(44832011)(356005)(5660300002)(16526019)(26005)(186003)(82960400001)(82740400003)(7596003)(7636003)(2616005)(84970400001)(2906002)(41300700001)(956004)(1076003)(8936002)(36860700001)(34020700004)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2023 09:54:35.1359
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 908aa150-3ae1-4e96-6c5e-08db214d746b
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.74];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR01FT106.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB7586
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Mar 2023 09:54:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178320

https://curl.se/docs/CVE-2022-43552.html

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
---
 .../curl/curl/CVE-2022-43552.patch            | 79 +++++++++++++++++++
 meta/recipes-support/curl/curl_7.69.1.bb      |  1 +
 2 files changed, 80 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-43552.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2022-43552.patch b/meta/rec=
ipes-support/curl/curl/CVE-2022-43552.patch
new file mode 100644
index 0000000000..7dc7dfa5ae
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2022-43552.patch
@@ -0,0 +1,79 @@
+From 4f20188ac644afe174be6005ef4f6ffba232b8b2 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Mon, 19 Dec 2022 08:38:37 +0100
+Subject: [PATCH] smb/telnet: do not free the protocol struct in *_done()
+
+It is managed by the generic layer.
+
+Reported-by: Trail of Bits
+
+Closes #10112
+
+CVE: CVE-2022-43552
+Upstream-Status: Backport [https://github.com/curl/curl/commit/4f20188ac64=
4afe174be6005ef4f6ffba232b8b2]
+Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
+Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
+
+---
+ lib/smb.c    | 14 ++------------
+ lib/telnet.c |  3 ---
+ 2 files changed, 2 insertions(+), 15 deletions(-)
+
+diff --git a/lib/smb.c b/lib/smb.c
+index 2cfe041dff072..48d5a2fe006d5 100644
+--- a/lib/smb.c
++++ b/lib/smb.c
+@@ -61,8 +61,6 @@ static CURLcode smb_connect(struct conne
+ static CURLcode smb_connection_state(struct connectdata *conn, bool *done=
);
+ static CURLcode smb_do(struct connectdata *conn, bool *done);
+ static CURLcode smb_request_state(struct connectdata *conn, bool *done);
+-static CURLcode smb_done(struct connectdata *conn, CURLcode status,
+-                         bool premature);
+ static CURLcode smb_disconnect(struct connectdata *conn, bool dead);
+ static int smb_getsock(struct connectdata *conn, curl_socket_t *socks);
+ static CURLcode smb_parse_url_path(struct connectdata *conn);
+@@ -74,7 +72,7 @@ const struct Curl_handler Curl_handler_s
+   "SMB",                                /* scheme */
+   smb_setup_connection,                 /* setup_connection */
+   smb_do,                               /* do_it */
+-  smb_done,                             /* done */
++  ZERO_NULL,                            /* done */
+   ZERO_NULL,                            /* do_more */
+   smb_connect,                          /* connect_it */
+   smb_connection_state,                 /* connecting */
+@@ -99,7 +97,7 @@ const struct Curl_handler Curl_handler_s
+   "SMBS",                               /* scheme */
+   smb_setup_connection,                 /* setup_connection */
+   smb_do,                               /* do_it */
+-  smb_done,                             /* done */
++  ZERO_NULL,                            /* done */
+   ZERO_NULL,                            /* do_more */
+   smb_connect,                          /* connect_it */
+   smb_connection_state,                 /* connecting */
+@@ -919,14 +917,6 @@ static CURLcode smb_request_state(struct
+   return CURLE_OK;
+ }
+=20
+-static CURLcode smb_done(struct connectdata *conn, CURLcode status,
+-                         bool premature)
+-{
+-  (void) premature;
+-  Curl_safefree(conn->data->req.protop);
+-  return status;
+-}
+-
+ static CURLcode smb_disconnect(struct connectdata *conn, bool dead)
+ {
+   struct smb_conn *smbc =3D &conn->proto.smbc;
+diff -Naurp curl-7.69.1.orig/lib/telnet.c curl-7.69.1/lib/telnet.c
+--- curl-7.69.1.orig/lib/telnet.c	2020-03-09 16:31:01.000000000 +0100
++++ curl-7.69.1/lib/telnet.c	2023-03-10 10:35:27.978378949 +0100
+@@ -1290,8 +1290,6 @@ static CURLcode telnet_done(struct conne
+   curl_slist_free_all(tn->telnet_vars);
+   tn->telnet_vars =3D NULL;
+=20
+-  Curl_safefree(conn->data->req.protop);
+-
+   return CURLE_OK;
+ }
+=20
\ No newline at end of file
diff --git a/meta/recipes-support/curl/curl_7.69.1.bb b/meta/recipes-suppor=
t/curl/curl_7.69.1.bb
index 63faae6296..899daf8eac 100644
--- a/meta/recipes-support/curl/curl_7.69.1.bb
+++ b/meta/recipes-support/curl/curl_7.69.1.bb
@@ -41,6 +41,7 @@ SRC_URI =3D "https://curl.haxx.se/download/curl-${PV}.tar=
.bz2 \
            file://CVE-2022-35252.patch \
            file://CVE-2022-32221.patch \
            file://CVE-2022-35260.patch \
+           file://CVE-2022-43552.patch \
 "
=20
 SRC_URI[md5sum] =3D "ec5fc263f898a3dfef08e805f1ecca42"
--=20
2.39.2


