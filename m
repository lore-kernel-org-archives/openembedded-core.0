Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.77])
 by mx.groups.io with SMTP id smtpd.web09.7263.1605781444723003384
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Nov 2020 02:24:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=bnosuPMc;
 spf=pass (domain: windriver.com, ip: 40.107.237.77, mailfrom: li.wang@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nyvMI6Dtszcv/82oeeafIAJ2k6VZpN6ktDZMX0Smb/bDYEWqpQMDY/qSFZu/+tn2Anrz0Yivz6wqJG3dChPS5vB0NAK0okPRN8xGr/GwNRDrEuu6XDQ6fnXEvswJUpyAOq/opQ2UzuMyakXkHZ3p2Q6iSwWZAbJhYJkYFRkTXjZHEcyLQ8MNg+w0dlX1gMX/EYnO2eHKZ+2rCP/7jvKgwDI39jEpf3zDgi+DcH2B/RMgN2UvGJTAP5XVOmAtSC8cghR9PM+qCzgkVJtEFsMosiKfEqF+3jtZjVOLncbGqMRvTz/VP9NAjem19H+YICRc0jofVBTd30QLAH641pb5MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u944LeZ8/pyyWMx+f6VNVuOYa/dlw5C8fz5IB6KE+gI=;
 b=LOC/sVvWdb4Z/PjXbCTtaWEX9EvL+n4Upoc+NVbWfjw9u1R5T9IurHJD8OjZv8Q3JpGkGnBlc6bDDEdSFBCiyHuaGTqFTLq7MjCPpgOVAUt5w1dESQGjR3t+UNSvI7mwUiWGSyW8uN/UH4EGYdOUgKOW9Okp5vVli74oei7b4LcgRYATYAzY5B7Ojo0+kJXMsm/bUPmRrMo4l3BDoUXxfAdkeS++XTduKCOjk55hO0yVTOr48yrCCDlW0HEPgkIT+3V5Hhx+nPrg2KD+kb37VFr10a2hnhvjAH6e/rGxVLX4AY6ygPBR/4Cyd14vAZeXtU6eaS+ZggLF56Q2cKDyvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u944LeZ8/pyyWMx+f6VNVuOYa/dlw5C8fz5IB6KE+gI=;
 b=bnosuPMcsL7dJXEKim5IDcGMZ5JBwLQ38P1J+VYj3B91ql/Unxgh1YZgdzecxh3Bx4S02/O0+eXsR0RhMZMujgamOQK8d+Dms/R+KTKPT5XLzobTq0TISZHBQbBP7iGBW2enUf/XMzJT0YaY66Uz+nP4t3FIfdhgtEcTGcsOU1I=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB3595.namprd11.prod.outlook.com (2603:10b6:5:142::16)
 by DM6PR11MB4642.namprd11.prod.outlook.com (2603:10b6:5:2a2::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Thu, 19 Nov
 2020 10:24:02 +0000
Received: from DM6PR11MB3595.namprd11.prod.outlook.com
 ([fe80::54c6:c8e4:c594:eada]) by DM6PR11MB3595.namprd11.prod.outlook.com
 ([fe80::54c6:c8e4:c594:eada%6]) with mapi id 15.20.3564.026; Thu, 19 Nov 2020
 10:24:02 +0000
From: "Li Wang" <li.wang@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][zeus][PATCH] sqlite3: CVE-2020-13632
Date: Thu, 19 Nov 2020 10:20:40 +0000
Message-Id: <20201119102040.624-1-li.wang@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR0401CA0014.apcprd04.prod.outlook.com
 (2603:1096:202:2::24) To DM6PR11MB3595.namprd11.prod.outlook.com
 (2603:10b6:5:142::16)
Return-Path: li.wang@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from bfbf5eb70dd2.wrs.com (60.247.85.82) by HK2PR0401CA0014.apcprd04.prod.outlook.com (2603:1096:202:2::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend Transport; Thu, 19 Nov 2020 10:24:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1d013551-06dc-4bf5-819a-08d88c753c21
X-MS-TrafficTypeDiagnostic: DM6PR11MB4642:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB46429D819FAE4233FE174F55EFE00@DM6PR11MB4642.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:102;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	E9t9cSzIIfrVlXxBwTwhDIee+8n/bz1wQrFh32asYRSB4RwGjCbNJe9U6TC7pz6asL289i8Yc++8yl/+I8B+J6zk4c/tdOMz0//UlQz2eRrB9nyuZaHJSPt4XJYbpsgxUx4TuiE4nQIppioQAiSOrQsuVMDImZQ62YsyjLq5ZS0QDMEY+6qdGI+/FVDf+qeV2v07bQp06cnSCheP72wFXxSAf8CkEBuMvvbF1518RjvjWjxtLNcWI6cnD5mwccpA6WXIg2Pc4bUxVJXwZLpN2BOST89kXNV4GgX0pphNVvul7UwEtbmRnYmt4lUdbDZ1evoKfAp6meb/AJFprF6jV1OgSUeptSGIiVE0htIxF78iS2SEbnyH4X7oguZq6cLVabPu2zNi/gfR8/SX0a8WmQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3595.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(366004)(396003)(39850400004)(376002)(2616005)(44832011)(8936002)(52116002)(8676002)(83380400001)(956004)(26005)(66476007)(16526019)(66946007)(316002)(186003)(66556008)(966005)(478600001)(36756003)(6506007)(6916009)(5660300002)(6486002)(2906002)(86362001)(6512007)(6666004)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	RUCxWpP7rCBuFma6AzSF9A3FKGjpVhjtVHyc5p9P9no1kpjs4U4VgjFDmjuv15/OfnslrV+F+EG2RVfV/NTtnLGNXlsFDs283nvJXzQiJo15EkMj6vc/esEzFAWS65Dnkaup/T4mMHlRBVhd/OFi4D2H+vnAQTKSOs1VdSPFWInib57Wj7kLeGZ/JbqvQODoOsGvS7ytosxJs9kLjx0k/cp6PT8ZbyaQYrpkOuAKtZmlO0via6w234MVch61AgVdeBKs9KQX21DOPxLWcNZFAxROnzHGEqMe9si+hVlKXd57L67CjbOuzrLfEFqP+ufF6xOijRux0ui9p005oFxGR9nScT5eNnoxYlfqnTinRyFoeEBH6kUpyCsikaXifOPAoXNop7HHzCz9IMrIv9CyKWBdSKKkvssqZjxMGN7ziym0DrGFd9Rl938SIY+uCEkYHt0181gbZRJV3j82hNf8uXoitjxcW+xaRyeI7occa2QecBTsfXZqUWg2Cm9wsgbUdJ/4UaNGuH1RLV8xMf+tRe5eg4LLQfb9ATkJ55qDVCa6FqQtqcCFf2V8xLbb23/aKhssdE3J/+ZGtUCBfLSocPWWIhC+Bz0voffBk4QBsikKoA9/3UC8t5xFp9+MVnbj1G8ITz2NnDbI08df5fKPxg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d013551-06dc-4bf5-819a-08d88c753c21
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3595.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2020 10:24:02.3005
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IpgSMD7uovYnqtVuwQFFULDPaDIAW9Eb88/uJhiMd2PviSA3aoAMmaOD4FmpnbAtknqW0V1DbXKr/TcKK+foWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4642
Content-Type: text/plain

backport patch from:
https://github.com/sqlite/sqlite/commit/219b8e7e7587df8669d96ce867cdd61ca1c05730

Signed-off-by: Li Wang <li.wang@windriver.com>
---
 .../sqlite/sqlite3/CVE-2020-13632.patch       | 32 +++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.29.0.bb |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2020-13632.patch

diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2020-13632.patch b/meta/recipes-support/sqlite/sqlite3/CVE-2020-13632.patch
new file mode 100644
index 0000000000..7af5e91c4c
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3/CVE-2020-13632.patch
@@ -0,0 +1,32 @@
+From 219b8e7e7587df8669d96ce867cdd61ca1c05730 Mon Sep 17 00:00:00 2001
+From: drh <drh@noemail.net>
+Date: Thu, 14 May 2020 23:59:24 +0000
+Subject: [PATCH] Fix a null pointer deference that can occur on a strange
+ matchinfo() query.
+
+FossilOrigin-Name: a4dd148928ea65bd4e1654dfacc3d8057d1f85b8c9939416991d50722e5a720e
+
+Upstream-Status: Backport
+CVE: CVE-2020-13632
+[https://github.com/sqlite/sqlite/commit/219b8e7e7587df8669d96ce867cdd61ca1c05730]
+Signed-off-by: Li Wang <li.wang@windriver.com>
+---
+ sqlite3.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/sqlite3.c b/sqlite3.c
+index fd28360..ee455e5 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -177622,7 +177622,7 @@ static int fts3ExprLHits(
+     iStart = pExpr->iPhrase * ((p->nCol + 31) / 32);
+   }
+ 
+-  while( 1 ){
++  if( pIter ) while( 1 ){
+     int nHit = fts3ColumnlistCount(&pIter);
+     if( (pPhrase->iColumn>=pTab->nColumn || pPhrase->iColumn==iCol) ){
+       if( p->flag==FTS3_MATCHINFO_LHITS ){
+-- 
+2.17.1
+
diff --git a/meta/recipes-support/sqlite/sqlite3_3.29.0.bb b/meta/recipes-support/sqlite/sqlite3_3.29.0.bb
index 95e1174b07..425612bf12 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.29.0.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.29.0.bb
@@ -13,6 +13,7 @@ SRC_URI = "http://www.sqlite.org/2019/sqlite-autoconf-${SQLITE_PV}.tar.gz \
            file://CVE-2019-19959.patch \
            file://CVE-2019-20218.patch \
            file://CVE-2020-11655.patch \
+           file://CVE-2020-13632.patch \
 "
 SRC_URI[md5sum] = "8f3dfe83387e62ecb91c7c5c09c688dc"
 SRC_URI[sha256sum] = "8e7c1e2950b5b04c5944a981cb31fffbf9d2ddda939d536838ebc854481afd5b"
-- 
2.17.1

