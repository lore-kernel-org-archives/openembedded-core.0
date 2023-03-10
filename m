Return-Path: <andrej.valek@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30CF9C64EC4
	for <webhook@archiver.kernel.org>; Fri, 10 Mar 2023 12:46:29 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.79])
 by mx.groups.io with SMTP id smtpd.web10.18095.1678452385095473640
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Mar 2023 04:46:25 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@siemens.com header.s=selector2 header.b=RFj4vTYx;
 spf=pass (domain: siemens.com, ip: 40.107.20.79, mailfrom: andrej.valek@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JBEQgZoTd+OTFB3kXq/rJmK1CaWsgnyzdOVls23wM1W+D6ozmYWc9O/Rmo08+U0CflwYQAXA474Iuk+lKB8e9XA3m8vDZDQqCrfpttvhCogxFs3pN44CtF1PyyuVBFjhsbiYet0iwRWwsetZy8f8ExlnZz7qcQ23pyu0EjItOr+EYMcdBJ5Kn0WMjdLO9gwKSFWm74r5sv/Zzg1qVd5cQ6GDuC+3YRLk/xRyqAdnk2ZQrCTvzPJ2V9KEHOMLaKgD0YDkyW/3xt69Ps5j39bNNTDWDa+oCfv7ps4SyXAik4UywgCqlV56qelczPBiP/wrw89YojToqxXnCOE+iMT3WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ap8zbW/tobDXFCp7S+9B34TB35XML0kKPV6WgwfE3e0=;
 b=Aay8j+VwENsAGNu1+I9Uc/gyBRtKvlopEsf9qAiYlFvAe377hCbdOJY24R/Z4HRGHZQv3hHEXx2Shpyz1CBYAnhS7L6o13qylzP3YAGWts/ngatppoxYo6coLd5s1n2Q51TRaztHo07X1P4Av0rAUpQeZYoBcBEJrh59RSyUK25DmB9ypkiuSl8l+mE5bjkf8TW4lSgvl/BGqQ8abH11KZmZn2OACWw0MaRiORtQC8t7Cv3+t+9hPoo79Gs7pCGh/oDgRPPw4pF6EnB5r2in7ksujTlcTbsTTqIFIlGEBedQqJRMAQY/Zjbz0Ma/6IigFomBTDIF3BsvHin1smR5vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.75) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=siemens.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=siemens.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ap8zbW/tobDXFCp7S+9B34TB35XML0kKPV6WgwfE3e0=;
 b=RFj4vTYxFxY5ysgYymNYPKEAR7vFLCk+qr9eK7i/5MAz3ULLwqI4pzNz6FGpzhleZLfKREFV8EDV913ksuL2pQmfBbTG7SCVTqUFpNWqCEqMdMlvK1oy0XfW9IrDBraSDp97xj6x32HDiRnLIi+tOBe+T1zeTrUnvn83sRg6K4hYcQurK4yv/ChP7GK5BK0Or3rM5fQMBiEzHt8AKjC4YzKYkHoj6HskkGehqPBi1FRgm2HeHVsssuM+/Xf2QU/sUAU5oCBdslXg+AilY+tp/1mhAqLOooPg1OzB/dYKM3IwETQTr7gYpdgiaWhW3BDqnvcRm1Oru8kHjTkRudZ4zA==
Received: from OS6P279CA0166.NORP279.PROD.OUTLOOK.COM (2603:10a6:e10:38::6) by
 AM0PR10MB3330.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:17e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19; Fri, 10 Mar
 2023 12:46:22 +0000
Received: from HE1EUR01FT102.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:e10:38:cafe::69) by OS6P279CA0166.outlook.office365.com
 (2603:10a6:e10:38::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19 via Frontend
 Transport; Fri, 10 Mar 2023 12:46:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.75)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.75 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.75; helo=hybrid.siemens.com; pr=C
Received: from hybrid.siemens.com (194.138.21.75) by
 HE1EUR01FT102.mail.protection.outlook.com (10.152.1.64) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.20 via Frontend Transport; Fri, 10 Mar 2023 12:46:21 +0000
Received: from DEMCHDC8WBA.ad011.siemens.net (139.25.226.105) by
 DEMCHDC8VRA.ad011.siemens.net (194.138.21.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Fri, 10 Mar 2023 13:46:21 +0100
Received: from md3hr6tc.ad001.siemens.net (139.21.16.91) by
 DEMCHDC8WBA.ad011.siemens.net (139.25.226.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.21; Fri, 10 Mar 2023 13:46:20 +0100
From: Andrej Valek <andrej.valek@siemens.com>
To: <openembedded-core@lists.openembedded.org>
CC: Andrej Valek <andrej.valek@siemens.com>
Subject: [OE-core][dunfell][PATCH] curl: Fix CVE CVE-2021-22897
Date: Fri, 10 Mar 2023 13:45:49 +0100
Message-ID: <20230310124549.119027-1-andrej.valek@siemens.com>
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
X-MS-TrafficTypeDiagnostic: HE1EUR01FT102:EE_|AM0PR10MB3330:EE_
X-MS-Office365-Filtering-Correlation-Id: 95083f89-0b3c-440d-94d8-08db216573e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	HEBOJpm7mR5v2t1Ql+KqdgLWCesNKgPlFcUPHryJk2jOgE8RD2Rzf4p4z7zk1zr5GWaLnTwWQeohRlnUNRx0lcX7PklNWrvUJN0+WLPU7U7RhtUNgChxHyoBdeCZxFgurudCLmnjZ2Mndz9WHWYIr2Qh1Y34OlhAcexwD0Z1iUinCJymgLr4tcfyql97KBMTQJqSA8FqR587Q/a6AIArxqEIXXHOIcygm65ch80i7cDFMwYF0BwlRKXLvZT7ESZ+aXuZqE/st6azZHGHpZX9pk+GgG/cQfvPZ/CEdsshSkZXcdVrYaWUJ9je0q2T6iW+gLCnr46KwIcECcNhOR/wIE7Zu7RK6Lmd7B8bDmXFLkHDdHKEkz4SPQByNAb1wExY5hJV+hWBrQCavkmSenXPvI8Hz/py+6ARvioPvRnlRkKxIq3AthxBTnLFxMgtpR0Qj8stisFLtm/ed4yuX+0lmeYCWqJCPfT2oBbjjpAs416h88++/o4Cmek5xlhG74lBnSkbtcIYO70k25NuhHK1H+LmybbNdaHLJ4DO1nMBqI/8gf/JyZ/gtan9PRiouMRO1kistLj2ZFDhLowJxpm02VAEiLlAyotZiXGQv8AeQO13z9AmdNveUDMcTii7w/AIOHjN6O+oNsK0a71fM+GKw+rdN2qxpWel8O5SjaC/cB3hybRQanQn27RvzNaMi660ebtUX3R3it4DS2Rthw6nC68IBQNzJvYPGDp404VmgK/6p0W33EsFovRK2mhvcmnU
X-Forefront-Antispam-Report: 
	CIP:194.138.21.75;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(376002)(396003)(346002)(39860400002)(136003)(451199018)(36840700001)(46966006)(40470700004)(36756003)(40460700003)(70586007)(478600001)(5660300002)(316002)(107886003)(966005)(8936002)(8676002)(2906002)(44832011)(70206006)(6916009)(4326008)(41300700001)(82740400003)(16526019)(1076003)(36860700001)(6666004)(82960400001)(81166007)(40480700001)(86362001)(356005)(2616005)(186003)(34020700004)(956004)(26005)(83380400001)(82310400005)(47076005)(336012)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2023 12:46:21.9131
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 95083f89-0b3c-440d-94d8-08db216573e0
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.75];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	HE1EUR01FT102.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3330
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Mar 2023 12:46:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178331

https://curl.se/docs/CVE-2021-22897.html

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
---
 .../curl/curl/CVE-2021-22897.patch            | 73 +++++++++++++++++++
 meta/recipes-support/curl/curl_7.69.1.bb      |  1 +
 2 files changed, 74 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2021-22897.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2021-22897.patch b/meta/rec=
ipes-support/curl/curl/CVE-2021-22897.patch
new file mode 100644
index 0000000000..cbd6c067ce
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2021-22897.patch
@@ -0,0 +1,73 @@
+From bbb71507b7bab52002f9b1e0880bed6a32834511 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Fri, 23 Apr 2021 10:54:10 +0200
+Subject: [PATCH] schannel: don't use static to store selected ciphers
+
+CVE-2021-22897
+
+Bug: https://curl.se/docs/CVE-2021-22897.html
+
+Upstream-Status: Backport
+[https://github.com/curl/curl/commit/bbb71507b7bab52002f9b1e0880bed6a32834=
511]
+
+CVE: CVE-2021-22897
+
+Signed-off-by: Daniel Stenberg <daniel@haxx.se>
+Signed-off-by: Khairul Rohaizzat Jamaluddin <khairul.rohaizzat.jamaluddin@=
intel.com>
+Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
+---
+ lib/vtls/schannel.c | 9 +++++----
+ lib/vtls/schannel.h | 3 +++
+ 2 files changed, 8 insertions(+), 4 deletions(-)
+
+diff --git a/lib/vtls/schannel.c b/lib/vtls/schannel.c
+index 8c25ac5dd5a5..dba7072273a9 100644
+--- a/lib/vtls/schannel.c
++++ b/lib/vtls/schannel.c
+@@ -322,12 +322,12 @@ get_alg_id_by_name(char *name)
+ }
+=20
+ static CURLcode
+-set_ssl_ciphers(SCHANNEL_CRED *schannel_cred, char *ciphers)
++set_ssl_ciphers(SCHANNEL_CRED *schannel_cred, char *ciphers,
++                int *algIds)
+ {
+   char *startCur =3D ciphers;
+   int algCount =3D 0;
+-  static ALG_ID algIds[45]; /*There are 45 listed in the MS headers*/
+-  while(startCur && (0 !=3D *startCur) && (algCount < 45)) {
++  while(startCur && (0 !=3D *startCur) && (algCount < NUMOF_CIPHERS)) {
+     long alg =3D strtol(startCur, 0, 0);
+     if(!alg)
+       alg =3D get_alg_id_by_name(startCur);
+@@ -566,7 +566,8 @@ schannel_connect_step1(struct connectdat
+     }
+=20
+     if(SSL_CONN_CONFIG(cipher_list)) {
+-      result =3D set_ssl_ciphers(&schannel_cred, SSL_CONN_CONFIG(cipher_l=
ist));
++      result =3D set_ssl_ciphers(&schannel_cred, SSL_CONN_CONFIG(cipher_l=
ist),
++                               BACKEND->algIds);
+       if(CURLE_OK !=3D result) {
+         failf(data, "Unable to set ciphers to passed via SSL_CONN_CONFIG"=
);
+         return result;
+diff --git a/lib/vtls/schannel.h b/lib/vtls/schannel.h
+index 2952caa1a5a1..77853aa30f96 100644
+--- a/lib/vtls/schannel.h
++++ b/lib/vtls/schannel.h
+@@ -70,6 +70,8 @@ CURLcode Curl_verify_certificate(struct
+ #endif
+ #endif
+=20
++#define NUMOF_CIPHERS 45 /* There are 45 listed in the MS headers */
++
+ struct curl_schannel_cred {
+   CredHandle cred_handle;
+   TimeStamp time_stamp;
+@@ -101,6 +103,7 @@ struct ssl_backend_data {
+ #ifdef HAS_MANUAL_VERIFY_API
+   bool use_manual_cred_validation; /* true if manual cred validation is u=
sed */
+ #endif
++  ALG_ID algIds[NUMOF_CIPHERS];
+ };
+ #endif /* EXPOSE_SCHANNEL_INTERNAL_STRUCTS */
+=20
diff --git a/meta/recipes-support/curl/curl_7.69.1.bb b/meta/recipes-suppor=
t/curl/curl_7.69.1.bb
index ea36c0bd3d..384719dd15 100644
--- a/meta/recipes-support/curl/curl_7.69.1.bb
+++ b/meta/recipes-support/curl/curl_7.69.1.bb
@@ -19,6 +19,7 @@ SRC_URI =3D "https://curl.haxx.se/download/curl-${PV}.tar=
.bz2 \
            file://CVE-2020-8286.patch \
            file://CVE-2021-22876.patch \
            file://CVE-2021-22890.patch \
+           file://CVE-2021-22897.patch \
            file://CVE-2021-22898.patch \
            file://CVE-2021-22924.patch \
            file://CVE-2021-22925.patch \
--=20
2.39.2


