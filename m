Return-Path: <lukas.funke-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30720C4332F
	for <webhook@archiver.kernel.org>; Thu,  2 Nov 2023 15:53:29 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.59])
 by mx.groups.io with SMTP id smtpd.web10.34981.1698940405841993678
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Nov 2023 08:53:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@weidmueller.onmicrosoft.com header.s=selector1-weidmueller-onmicrosoft-com header.b=xn4bx9py;
 spf=pass (domain: weidmueller.com, ip: 40.107.22.59, mailfrom: lukas.funke-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WfNhhQcAdlrXvxzY2oZH2bpnRPmrj2i0qGAfPP8yUw4m/UUXyBT6lAwu+T6JMaTZRxVONGMJqhGB8uTzZd7czXKy5fsyesLDVyLGmqZPauguMJhMpEftRG5ZQUvBvsQmUzl5mGElL7myCJVyEduwvMAxC5JzoGDREh7JkuKHEumB1Yx/VxdL+3ZYifdURfKaRMFfN32v1gemuRBBsvVT3kU7X+ktMmdkQEEnlkro+o5GYOqKI7an191V04JJycOLDcEv1yGoE05TMJommVU2ob2c8FaUyCq1U4GLKxqICE7EOTnaSQkG1qlpwjtFfM9emMlbHTH3brySvpLPkaGACA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t7LTMVL3y5KvcqM1eit0/rcSMWgre56MO2DD0PPlSPY=;
 b=LUAVOLYDxHNN3b+A3xSyb7DkRDOpsx7P6vO8w3Qz0tszOrJVXXlE0JNF68X7F1yzdMnmANAQk9c966ycjIdzeCC8+iCBOBJFPcOeLoacPYKyS0PAIXDSAhCuSOEWK+Sapn7gGLmHo0i1kLMCmp0unaBnvhXNEiFhoR2nbU5YXo7gLhvxvSvqUkfJyZ4aAsIHz68HPgZxhBnBpg0jcYYSM+B/CcyBZGyZEb+DQOv4rlCmJG7nIrTZnp2dxuKXhhyPEVyYlotLBc4l0jnitP0+Iyaep52FXSXY/cU+kCgLsUXcEgZKc27NGzcolfHNcfS3/uBYJ2tqGLuzzKCyX2i+sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t7LTMVL3y5KvcqM1eit0/rcSMWgre56MO2DD0PPlSPY=;
 b=xn4bx9py/DZEKxm1H/LKceQ5KcqvOIHOJP5f3dPSUorq6EOajKzKlhyE1CmgngdP+FRSCuVXxnrmEvCrq9iirbnPq5OmAYVw6OlpPTSVQQLyu1Ek8cvY/VrKv4G2MWhcY17+OKVSr5DC4aeEibCSyTFlqIIE5DVvByvHBfWzkVI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from AS2PR08MB8431.eurprd08.prod.outlook.com (2603:10a6:20b:55a::18)
 by PAWPR08MB10059.eurprd08.prod.outlook.com (2603:10a6:102:35d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.21; Thu, 2 Nov
 2023 15:53:22 +0000
Received: from AS2PR08MB8431.eurprd08.prod.outlook.com
 ([fe80::c337:aad3:ff97:b20c]) by AS2PR08MB8431.eurprd08.prod.outlook.com
 ([fe80::c337:aad3:ff97:b20c%7]) with mapi id 15.20.6954.019; Thu, 2 Nov 2023
 15:53:22 +0000
From: lukas.funke-oss@weidmueller.com
To: openembedded-core@lists.openembedded.org
CC: Bruce Ashfield <bruce.ashfield@gmail.com>,
	Vyacheslav Yurkov <uvv.mail@gmail.com>,
	Martin Jansa <martin.jansa@gmail.com>,
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	u.oelmann@pengutronix.de,
	Lukas Funke <lukas.funke@weidmueller.com>
Subject: [OE-Core][PATCH v3 3/4] recipetool: Ignore *.go files while scanning for licenses
Date: Thu,  2 Nov 2023 16:53:12 +0100
Message-ID: <20231102155313.309534-4-lukas.funke-oss@weidmueller.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231102155313.309534-1-lukas.funke-oss@weidmueller.com>
References: <20231102155313.309534-1-lukas.funke-oss@weidmueller.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0189.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::20) To AS2PR08MB8431.eurprd08.prod.outlook.com
 (2603:10a6:20b:55a::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR08MB8431:EE_|PAWPR08MB10059:EE_
X-MS-Office365-Filtering-Correlation-Id: ad45e700-f353-4915-338a-08dbdbbbd793
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	8RlO/rOiH3yNHWKojqra6xHrf9z5YStUuZubgtRZ6HMS38CWa6U/2XSjq7hRhktykjQs9pDnDWgJiyY2C/FYbiWyaH0oxEzpU514Vo+pQBtV+TsITf1a6zScJqUSviLgC7dNDLEza8kjfNzTjfRZ+fpjYHCcx7yaytEyKZ4D1R6FkS5JS+SrlVybgQHh8yu0AxO2McAFCouebkof352vJvEdXNLY87vVdd/spydR32ODKzPeDAB3lrzBe338RlPf9yBIVEqPD1aUoU+qC35yhrgUVcU7TtfIqpo6U4vQhHH20Zn3uieMScw++aZVtCqdKjS9IfM0i2I5a3wxYzYvEareOh1S33L9XlzxgN0Jh9rtFbpYTSsdbk6M6B4IfvlF+K0ML2GzVlAnI3B83eZDPEF9IO0sNjgum5c082pVbyE6mJDIwgWRiuhc1zgUsesTcaOLRvH1UKdURGXFSWkquq7mqfS3XGBHept/O0KLGRFvany4f//Qfxo0QgtUBmkPYCbOrtOhTTRVjOfTYuKmGS5fHNdopSPMBO24Q+onZb/T/yAEfiLQsVDF00Zo0vnHAWSlJ1xMThYIXIMLVbNBqqkcJwEX6RuGR3uojYCMc1vsLcwU4tglxrovgXS+Dt8S
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR08MB8431.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(39860400002)(366004)(396003)(376002)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(478600001)(6506007)(52116002)(83380400001)(38100700002)(1076003)(107886003)(2616005)(6512007)(9686003)(41300700001)(2906002)(86362001)(4744005)(36756003)(5660300002)(4326008)(8936002)(8676002)(6666004)(38350700005)(66556008)(66476007)(66946007)(6916009)(54906003)(316002)(26005)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?MKat/Y8NqYBdqtFUWNkD0d47iFprpgOcLMmZufVl7+B03DYSPrmbFha30hzX?=
 =?us-ascii?Q?Oy0ZElbMZ+hO/dlnhOHeKMFKxceDHZ3vrUahxLsdwsoavgDvLhO7slPCCVpA?=
 =?us-ascii?Q?kN+0II93xqAluscmwDe6wBzV9Q0F28FQ9GpnQZIi3gsfFqRX/kyyUpUw3MW7?=
 =?us-ascii?Q?y6lTm5cDsqRQrNrWXEMleVc4Z8038+ehC7981OeKkDz0mzUl28kDbKzJvdTT?=
 =?us-ascii?Q?R39dHf+H8AiKytjxc+BKKAGqMiYcLc7Ak6/M7IWafieELv3XcV5QtFM+hTr1?=
 =?us-ascii?Q?1qOSGQhS1Ybu6g3BCh+G9LAeqZuffMXZtCqcwxLgJ9k9s/7T3ayXxETEJSYF?=
 =?us-ascii?Q?8u71gjx5+YTxTnMGeMAugvQMvUpfyEvM9vFKGhRWSy3tj03tLncG1iBqXQbk?=
 =?us-ascii?Q?Ve4gifrKiB4UuwqXawswUKteDi4A/K+nnv6hPZUVbBk4RnwWAjxTdncedkx4?=
 =?us-ascii?Q?KlKFaA1rG8rzGjwR2LL+NFezYdqq3FWSkKbZQVsJoop3ztzsHDyaG12nxNfx?=
 =?us-ascii?Q?ssjR0c5sJXZaIxftjKPdZPPlf+UegQxAtf3+ikWc3FekTX54Xwl3JKy94ub6?=
 =?us-ascii?Q?6psx79buJs+ZrbGkyGASH92DcdAkY5Gw/EmYcQrb1pYrn/7Uo3QxSfv4jrdA?=
 =?us-ascii?Q?/tKJDZB4d5+0hL6vAtVnubeTiaMUxAbwBUdw8C1otRBA+/5zihBzQquRXr+/?=
 =?us-ascii?Q?jxOPgbhASN9uakaYLzEt0BHzZtnQ7LUvs/7VMpa9l0h7lEp2KPOeh6Mte0Nn?=
 =?us-ascii?Q?6LvjDq6jcQYKUyOH/GqGIvJTRJ8ZkotzVVXKiPhLqTV4qlb6OmmmbqMQ8NJc?=
 =?us-ascii?Q?9Nk2u67jn6FT2T1uI05dW+DfOEqf0uR01ztER7vVMnXZeMKkM80xRav9p3Nf?=
 =?us-ascii?Q?5KejGg2g3Wiewt8N1qdpwpWEPD/hIcekIcbwm+bi8dTc+bKj+jL4PT8gjKHe?=
 =?us-ascii?Q?h9bEJF6rQEQt7cXZCZuorfoAJTSn9MK5+0zOmDvNYEinMMRobf+t2cR89sz6?=
 =?us-ascii?Q?Hg6s6ZKk0JkOSCKJ3Bd4E6EIrH8XS76d1iowB6ji7LOIxwbrXXfU+Ov9i+FP?=
 =?us-ascii?Q?Btlwwc9zODtAj7XoOl7kWDMNlftLQdW7q7+YiHEXcJqqFyQ1uo6qidby+Hdi?=
 =?us-ascii?Q?pcmpZfibQmeqjEjCtFdTvEYOaPGaxxRjN0SUxu3Q9djFPFh1IPtimu26fsOR?=
 =?us-ascii?Q?c8g5agmAQxBUNtiwniDaboxlRFjK/n+DQPEUnfCcuNNEacRuR/3Kpfn940T0?=
 =?us-ascii?Q?dH/iyWJH/GSVJzs4oXabvCdj7oJrpPNevPuyF/Z+Zo6pk6t/BewVLG60+a3K?=
 =?us-ascii?Q?hHvjkS51RwKuYjwU7BvBQeHXxEYLD4fscrlhQCIMwvUlWJFTHOTBfcTAMkLY?=
 =?us-ascii?Q?e0s1Hk4lavLt/tByNPhyP07QZJ7a7ttFIXmj72wdXQdKNpKhk7MFUs1FuL8j?=
 =?us-ascii?Q?IjCkRTqxVT+T9Nk3wlwwUNQA/lJTiQMKtPp+A7pu8CkcO+IvQU3JsANA5ccE?=
 =?us-ascii?Q?cZOVpjCe5VAbPLg1amDlJtJHscukPdgYFLNNEugElXuyGeroxwd/qACDSVU/?=
 =?us-ascii?Q?Jj0HeMWbKQcXg85c7AEB3Dmcfi3RXMEksfpRC/IhVra1Iu+Yv1IN9xhZDsCo?=
 =?us-ascii?Q?Rg=3D=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad45e700-f353-4915-338a-08dbdbbbd793
X-MS-Exchange-CrossTenant-AuthSource: AS2PR08MB8431.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2023 15:53:22.6293
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4gtdYf/CqhaWLgYgkKtk5N/eNjg83hrjdJ10gVfC3qhC0/bj37sMfD9WCW2za+q9LHKGdg4SkD4e02s7dD/BLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10059
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Nov 2023 15:53:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190083

From: Lukas Funke <lukas.funke@weidmueller.com>

Signed-off-by: Lukas Funke <lukas.funke@weidmueller.com>
---
 scripts/lib/recipetool/create.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/crea=
te.py
index 143bc63e9d..293198d1c8 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -1212,7 +1212,7 @@ def guess_license(srctree, d):
=20
     licenses =3D []
     licspecs =3D ['*LICEN[CS]E*', 'COPYING*', '*[Ll]icense*', 'LEGAL*', '[=
Ll]egal*', '*GPL*', 'README.lic*', 'COPYRIGHT*', '[Cc]opyright*', 'e[dp]l-v=
10']
-    skip_extensions =3D (".html", ".js", ".json", ".svg", ".ts")
+    skip_extensions =3D (".html", ".js", ".json", ".svg", ".ts", ".go")
     licfiles =3D []
     for root, dirs, files in os.walk(srctree):
         for fn in files:
--=20
2.30.2


