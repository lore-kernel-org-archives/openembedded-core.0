Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E39E5C43217
	for <webhook@archiver.kernel.org>; Fri,  8 Oct 2021 07:43:07 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.52])
 by mx.groups.io with SMTP id smtpd.web08.5885.1633678986590087679
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Oct 2021 00:43:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=bWCSWxZ2;
 spf=pass (domain: weidmueller.com, ip: 40.107.22.52,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OLbwS4usKw3m/WNYMQ9m92p4Md94JSB5CylbhovkQ5wVu17DuLec87xfMXfYgZaJK3Rp/n4Zo7+rvREavSSLJGj7/RbNs2thaXhHvmYrumSjZiAbfvWKdSG37rimKqYZkaEDGw1/kclT0uZnO/9CGbzj+0k8WV51OllhYsd0LpZ2CHOMq3b+hsmifW2lYA1QlJtM1E3xpLQsX/hYP2uffp9ao9kjOjgKZtiP+nZ3ARl3b7J0sr/T0UZGi+OurgRP7aguleL0g6aSQZG3HxEuC2WuF2a5BwAdK4QsNxHZQB8BKskHPDAy1VVj7qmzWKRdvsKs6iloooq48UkoOnvRCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GqBZrYq/9bo+MVgggxZ2/ZPrs36coWOC11R2hsytbNQ=;
 b=Cfc7dBqsmtdtRwVyZmm+wgdtpdsjapJqA4QDy/ZtbsFiU3YqCvy5eUgk5i/bpfO3eUk3OaxqFGLPLekeJZsDxu911YbLPXM/YfGb5zfUxw19qOpx197p3U8ADVwXtX85yk0/DKt+ROQOExX/s6bR/HsNAWx54kNAZ92H+3jLLH1ytZ1V+jnUt3RloYuot2Wxupf70plGt7k3TRYG45Z5GEQULpFNoYVW8cvi20/5ynztnq+hlVGaj/IIYW3UO+/uK3W/pL/iVSi08W3RUkqHXSAcXTY44CYqtmcgRlu0VSIwcTGT5caCsdr4BSHmLXFkeJ2fasVx1KIPXNe4GQ2/xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GqBZrYq/9bo+MVgggxZ2/ZPrs36coWOC11R2hsytbNQ=;
 b=bWCSWxZ2NS9wDiGXpt2uj/1m8YfwIT3XLbSAIS4Y0I9DSuUUTxcgcOHe2Zo2dTfDOMSkkOC8LT05QPyG0pwd+nZ8Z6ULJ/3uK8v+egtwdLNkmC3W96+xRIyKG561fZFis8KgvMlOJ7HoZR/yq3K6BblmmrWAcmy1irBP4CYnJfg=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by PR3PR08MB5772.eurprd08.prod.outlook.com (2603:10a6:102:8f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Fri, 8 Oct
 2021 07:43:00 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::8034:af5f:f101:d1f0]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::8034:af5f:f101:d1f0%3]) with mapi id 15.20.4587.022; Fri, 8 Oct 2021
 07:42:59 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [PATCH 07/12] recipetool: Add support for linenumbers to licenses.csv
Date: Fri,  8 Oct 2021 09:42:23 +0200
Message-ID: <20211008074228.8635-7-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: 
 <20211008074228.8635-1-stefan.herbrechtsmeier-oss@weidmueller.com>
References: <20211008074228.8635-1-stefan.herbrechtsmeier-oss@weidmueller.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AM6PR08CA0023.eurprd08.prod.outlook.com
 (2603:10a6:20b:b2::35) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
Received: from DE10512.weidmueller.com (94.134.181.155) by
 AM6PR08CA0023.eurprd08.prod.outlook.com (2603:10a6:20b:b2::35) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18 via Frontend
 Transport; Fri, 8 Oct 2021 07:42:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5646f50e-65ea-41a4-19d2-08d98a2f405c
X-MS-TrafficTypeDiagnostic: PR3PR08MB5772:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<PR3PR08MB57726EBF7110263C85774C04D7B29@PR3PR08MB5772.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	5UqVaV4XJP6/dLm0izS2QqD0Vh6O4H0IeDJjQn9Yv9xrBKOj45GqCJVKCoK9MVPn0ThaI/9RvGYaSlIEFKfN1YlCm1O0vAHT5XMENzRoebj6QIw9tfHXvYz67liFeRRf0IgGLmiSAktYKvj2lKBY79YdnDhp7FZU7X1WhpGzSkBQuHhZMJEEmHq/FOtaSS5hg6vMlu9FS1APT8738tKuFcJ+Kp6Vda40C4XO28pEImJr6Q8dHvNC2bsCmod9V0hI8Bc0YZrflixW6y1wc0a29LsiahisNaDhhzyC9Mur6EZLiAR1zRShJf4lKtrXN+j61xQR8LO53clg907MpzFBwtaZEaaywsJIs4hbJBWXPPjUSbrzR6+DBoiwGSt0ap4UNyhxYV+ksz/x+r/8mWRByKUvCjwOt91x36lw8U/HAgDZvWNmlaSC1qxC8FX46S5ndt4FwixnQBk66I4qCDOkXh8Cs+MroCwJtuAehTTqNMsop2zqvLw0vE43J+6/kR4C3ICzFANb/U4OAAHBzDZh5R2kkqoE70kdnwD7lSEXhrydcrhoe8KcmdTyllYASxa2KthLftFjBIVIP9JVbpKU5//w6jf/V3xVOWmB7nqTxyomYMFUvW9vh7xS0EV/HK3Z1B7Gt1seZPTbBIXrTzv0BhgUR43RbFvopoddPIhyimgC/VXf53W79xMzn+1SJBl0EVwhgFph0fr1axzgi9VOIw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38350700002)(36756003)(316002)(26005)(83380400001)(6916009)(38100700002)(86362001)(4326008)(6486002)(508600001)(66946007)(2616005)(2906002)(186003)(5660300002)(1076003)(956004)(8676002)(107886003)(8936002)(6666004)(66476007)(66556008)(7696005)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?OKQcSlWMHCEJZFaFAoGBXTxggoDPRA22WDzXhJoFKnADd4//zw4NBh6CSYnR?=
 =?us-ascii?Q?BP9rERhwR7fAQLVEYPfuhZjnzbB41Ce6Np+IwbTQ+ovsBNfyq5jSY3SC3bpH?=
 =?us-ascii?Q?FVVQXXbixdlOSROl5Rc99dc2zH0fBi7zl95xUZlz1rLjxqiIAyNapV0RxOmO?=
 =?us-ascii?Q?o8cMgzIr1/6ceS/2kGMxnty9lBLRGWJUbIaVgpSN3RFIyAtTVsOV2j1SGA7H?=
 =?us-ascii?Q?vsCuAPHBqUfxHbfdPMhJ6437/33+MNXHKzXQ1fmGbW624TXcnABUc/Lusqqx?=
 =?us-ascii?Q?pgjQ/2z24DDOiGxrOkONzgnHMr6nKPOTB83OYqXp6Qm+56gWq3xy40FKxZKM?=
 =?us-ascii?Q?8Xj5/1/rowPIhXQ+Y/AE5k/ezmoHrRuyEQQyJ5YNRMu/K/NEXqjgis96zcsv?=
 =?us-ascii?Q?gK74mLuUPFb1CYuWjE4l1/N4xmvSm18VQL0bWl8ib0LlHlp69yqGB9+oSFwN?=
 =?us-ascii?Q?dk1qUPpBol4MDYWLCF4XNJPNNh+JrkjsTUYSwiQ4abvbXiApjVA5cJunidds?=
 =?us-ascii?Q?AiI4Fd+Zq5QKEekoFCWJ1x3ljyt5bEO8b6y/fV0YLRwicmQF+5KDUAI1B31b?=
 =?us-ascii?Q?8HdZWhXRUAUhUnmgHL5UVoBeytVA1hjFheIEr6yZeoxH65fGiaVhDrpUZjAw?=
 =?us-ascii?Q?u1hMOSZyjV+U1bY0EFJkplLB0TBQRNVrofJej7ktNGhT8MKnJQZQgTLBgA3+?=
 =?us-ascii?Q?xipioVwkBRuTmT3D9AF5R+vXDedvS4CNAC0ZPQFnJBaMWzV4r6VntqhZN6CU?=
 =?us-ascii?Q?HHOkCOlcp2A6XNHM3RJ6yLjFja8eD3AumxaBycIqRPrzzPSiOMxmewWjtAfU?=
 =?us-ascii?Q?Wgv5X3JaVphk4wvc84GWGPHrfbyIU50cfYBIHQhxkQiG9zelW2dxCMkSty67?=
 =?us-ascii?Q?u+qX1BRnIWSpY5IomzTGI67jRp0y3uiIo7DO4N1NUjuawE/MQtGg3yQPBpb2?=
 =?us-ascii?Q?d8W9SKQr2oGo/DeT2Dk5V5c7puFTnRqJgqALQFVtCgq2P82XVui+TOfFlk4M?=
 =?us-ascii?Q?8Kp4CsfJ5+H8NhGCyIzbjL4UV7VmJaSU2I2ecM0TSvfMBfh1EAjouHp6B04I?=
 =?us-ascii?Q?3hsXAI6InvB6PhdJZ0/0M107yKm2AeMSNFnZTyheIMpnVJ8+2WlHlsAgFZiH?=
 =?us-ascii?Q?fnDeXsvCFb4dR0fgN5u3Li7kVctzFxK6NJTH19qNewrAGaabxeh/V+eEZvzS?=
 =?us-ascii?Q?hToqyjfSfYs+bp/77ePEBygkX68ImNlxDd1wI/cAZfB2aGid9ZrjIDfu0OJ/?=
 =?us-ascii?Q?zSP87AnwXOHtefBFta28G0HmvgTqvl1Z2x4Knav/kJoTuteCp/bCXfD7WTyQ?=
 =?us-ascii?Q?ffpYKRYAjIjvsueXaOWu1IjF?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 5646f50e-65ea-41a4-19d2-08d98a2f405c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2021 07:42:59.8425
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 xC3vNex7smO+JjwllYH5P7DLZNH+xYThT80npNEA725/Z5nBAsjXNbIGYeIZeqHoN1JpwE32vxA79agpkZSfnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5772
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Oct 2021 07:43:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156752

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Add support for linenumbers (begin and end lines) to licenses.csv. Add
an optional linenumbers parameter to get_license_md5sums to support
different use cases.

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>
---

(no changes since v1)

 scripts/lib/recipetool/create.py | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/crea=
te.py
index a8c4cdef4a..277266be4e 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -1002,11 +1002,11 @@ def handle_license_vars(srctree, lines_before, hand=
led, extravalues, d):
     handled.append(('license', licvalues))
     return licvalues
=20
-def get_license_md5sums(d, static_only=3DFalse):
+def get_license_md5sums(d, static_only=3DFalse, linenumbers=3DFalse):
     import bb.utils
     import csv
     md5sums =3D {}
-    if not static_only:
+    if not static_only and not linenumbers:
         # Gather md5sums of license files in common license dir
         commonlicdir =3D d.getVar('COMMON_LICENSE_DIR')
         for fn in os.listdir(commonlicdir):
@@ -1024,10 +1024,14 @@ def get_license_md5sums(d, static_only=3DFalse):
         csv_path =3D os.path.join(path, 'lib', 'recipetool', 'licenses.csv=
')
         if os.path.isfile(csv_path):
             with open(csv_path, newline=3D'') as csv_file:
-                fieldnames =3D ['md5sum', 'license']
+                fieldnames =3D ['md5sum', 'license', 'beginline', 'endline=
', 'md5']
                 reader =3D csv.DictReader(csv_file, delimiter=3D',', field=
names=3Dfieldnames)
                 for row in reader:
-                    md5sums[row['md5sum']] =3D row['license']
+                    if linenumbers:
+                        md5sums[row['md5sum']] =3D (
+                            row['license'], row['beginline'], row['endline=
'], row['md5'])
+                    else:
+                        md5sums[row['md5sum']] =3D row['license']
=20
     return md5sums
=20
--=20
2.20.1


