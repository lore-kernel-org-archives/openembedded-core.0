Return-Path: <lukas.funke-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF436C4167D
	for <webhook@archiver.kernel.org>; Tue, 14 Nov 2023 08:13:49 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.60])
 by mx.groups.io with SMTP id smtpd.web10.8452.1699949621774483481
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Nov 2023 00:13:43 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@weidmueller.onmicrosoft.com header.s=selector1-weidmueller-onmicrosoft-com header.b=nRdJ4MSM;
 spf=pass (domain: weidmueller.com, ip: 40.107.105.60, mailfrom: lukas.funke-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zz+jXpVsHhcG4iY5JJMDVf9EHDWgtr0tVhMhqsFOZtrIkpZu1OJNAe2Hyd9LE/BKIij4ePp4jv+/Le+nISNlakx6cNDGKFjh3RoAd5cEKCExsPyLdvAcO8XCsSyHtJjXR2TXye1k2zXjwwXJO3XiMvQTs938EyLDnxNG7/qwk5l2kR3ICp0lu3FYs+MTJ5bdfgwGrfntax6G/S83bN+vcsC7H/itv7DXeDFYaDpDQYBY4TqDWm7j5ekiYuehG9dTAePODRGCv+oJIn7hpDwUU7ttmP4lwf1QmQn+4rkRViEuV7K6kSCMc+4esC0P8can8tRwTfa2D7AxyULKsSY5yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ajjGKUkfB9ScLHXt9+WbrdszkyyFjAGYsDqM5gnDaAM=;
 b=WG54GXYnGQ0SbyyoPrVb2zIt/SPo5+Mq6xY4LGhv22k0hq2kFHm88pTwX/AOBmwnTETdx7kieESY9flap/PkLGwToijDZo8M6jFMah++dtxBETZP08pqndBNBwnjqv/Cdjj8fZpizdv1qZuiojgC+aedhJ80Bq8HM8rte5PjgELAx3HrMtb99hHbTQpwNTbhJmCilB6uKkY87wNnfbgWntHr4KwblfubmSj39x87v5LP7gxbgac8uzsK9KqeWdB48jTFcnkO2L3BECYaDExzT5vTAet5jvNz2ZGJnRneMz5WGkxpC8YTBg7jsrmnOTuJeiwoCHyrCaDsZFfcSaq6pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ajjGKUkfB9ScLHXt9+WbrdszkyyFjAGYsDqM5gnDaAM=;
 b=nRdJ4MSMI5/tiyamtbD3bEVQhwJYQGSUKQFiYlCJUpa3LGFRm8w91U40mjAKdXVkWowP9VogkawtwCrSye49I9l30k6e4Um8TQuXHkIQpjNKULAjykqhH/khgzSdm2SnfBw66nxP7fROa0Lzpt/okZVme5f8I/kUAETkw+rThCQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from AS2PR08MB8431.eurprd08.prod.outlook.com (2603:10a6:20b:55a::18)
 by PAVPR08MB9458.eurprd08.prod.outlook.com (2603:10a6:102:318::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Tue, 14 Nov
 2023 08:13:38 +0000
Received: from AS2PR08MB8431.eurprd08.prod.outlook.com
 ([fe80::b914:d9b5:6462:13b6]) by AS2PR08MB8431.eurprd08.prod.outlook.com
 ([fe80::b914:d9b5:6462:13b6%5]) with mapi id 15.20.6977.029; Tue, 14 Nov 2023
 08:13:38 +0000
From: lukas.funke-oss@weidmueller.com
To: openembedded-core@lists.openembedded.org
CC: Lukas Funke <lukas.funke@weidmueller.com>
Subject: [OE-Core][PATCH 0/1] wic: extend empty plugin with options to write zeros to partiton
Date: Tue, 14 Nov 2023 09:13:31 +0100
Message-ID: <cover.1699885520.git.lukas.funke@weidmueller.com>
X-Mailer: git-send-email 2.30.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0334.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ea::10) To AS2PR08MB8431.eurprd08.prod.outlook.com
 (2603:10a6:20b:55a::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR08MB8431:EE_|PAVPR08MB9458:EE_
X-MS-Office365-Filtering-Correlation-Id: 7483d1b2-d12a-4fa3-1040-08dbe4e99af8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	48Pg/1GJ4CDL1V67FcZLFttxZGZz65EmMKa7xbIGpw/YXY3EkJv2Jg6IB+uYglGbiqjOdbgeab6PGAFKKoQHC+lZ2kGQsv76sXh2zf+cX+kzegxcAOoOXGsdqfB6XRmc67sjAPo508hwKQBpLnapbk75f8dHHRvbwfgLPLmMmNygyeO7BoUJidOLx/q0sYiFNudvj27DEQ6DaJ2lSb7cjnPNgSlNQ2v8JW6aQFywQVfo8BYw6jXiSNCFhdZgRcdc/vfYlAEnNsuSyzl/Pgh9K1HSx8dlkX1f4PetsPWLpOrmlsv4+nYeHbFDmssAQ9VnxTbXoyKmsI+i0VR6ar7WlvCByC5+661Z2YdYNAyS6kAjS0D19NqUQ1WoWDr2BgkuDw7nIDiNjYwd6HScSXLkSSNT4A2iwZpy1vWYmpUJq916lXY/sc7cVRI9S9jpaXA75MwMiX4rXSg8NWO1mm+Z6BNskS5ugRzvRmhRBnt67Yd+uuHei5juzPOspmhpXBq5L0Shk5ZeUeMelRXvg0IsuIrjZzCcIi7MSVPqXqzg/3Y5/oE38hNduWu33YOZO+9ytg3AgZmndSoF0Y0RXjh+klUIZshi+cDfLDHNJP9NYGSVEnOlhqrzxnXsrcB0x9n8
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR08MB8431.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(396003)(376002)(39860400002)(136003)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(38350700005)(66946007)(66556008)(66476007)(6916009)(38100700002)(36756003)(86362001)(9686003)(6512007)(83380400001)(26005)(107886003)(2616005)(6506007)(6666004)(52116002)(4744005)(2906002)(478600001)(316002)(6486002)(4326008)(5660300002)(41300700001)(8936002)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?AxycUsgeJgPLNFIDsgZleYV0foCheCZ0hdZfchpuL8jupW/AmlPAuuBSvcuG?=
 =?us-ascii?Q?rNYhYrgsOuKC64wQBIXW9RW976GmhAq5hl+mXxHJwPG2/nW5J9ktM5ZJdCIw?=
 =?us-ascii?Q?za6tR//5uzKP3dUPnMOLb1Z81uLAvE6GC4cEdqmSRqhLMBDySo7TMDAqidh6?=
 =?us-ascii?Q?OU7b8iOn3MkmZla9XM8oUtRAzAFZi0kllZueQecBrTaRHH4Gp12KRdb6qQEI?=
 =?us-ascii?Q?OYBd2e304z54plRmZI6RxrtaY8k7E3ovBqmc2bFZJXLL9vK/RGE1OnucfpRK?=
 =?us-ascii?Q?b5IknyF3ZHab38Q4kwxikhk9tgFbweJsjpGXvpM39Mz1K+8ktwFk+C/aXzNM?=
 =?us-ascii?Q?1AW7sBjiDZl1ApvhrsG49sffOLHpPRvoiI0YaaO68AhwnuyUgSUFeBu4wiBw?=
 =?us-ascii?Q?Gckh+TpJeu/sbL5FXY6fg2a86X0lbi2uAjBfZE+GMCp/6QWvlEQqopBF/iJ7?=
 =?us-ascii?Q?Jnt3P+ZGCy3xCO0OXjmRCkgkx6OslGk05c4zhQPnESqK8THvFz5IPibNgpy4?=
 =?us-ascii?Q?VcrMDlEvBK7obmbJufxqtpRHJrDXFV1sRok74BtMkJwvbW6D5NvnCE5Hb3qS?=
 =?us-ascii?Q?WZJYU3JwZ/d5icytdc0PZbaL1tzPVeDIWDI75qHfWAv5nH/z/qaL5S0HhCO+?=
 =?us-ascii?Q?ajI8QeM8r/bQ7OGbA5La1gZtxLHwaLC5iHG+pD7Jlq16/CSmTC4ifHmNdW3U?=
 =?us-ascii?Q?lYfs2jPSy/GWRTvCMi9jRAT4CWWf64DY3evjAytJaCpuYbqOGygKXx6qvBgV?=
 =?us-ascii?Q?MvFdgIbklzXUyOVBTxkTob8Dm1YMGzyJIWlOYNCYqrVhM1A4QyMNnlUUCXh2?=
 =?us-ascii?Q?HE1P+2WOtsRiIwTpSzO5k8n8Hf+glbFN9he7bUSkquz09L65Lmzd5UJjV1Yr?=
 =?us-ascii?Q?2CSkCxvCDJk5TWs0I9MoQp96dUz34uYcsOoFoZTWEoFYk2Jr3FiLfHiQZTWo?=
 =?us-ascii?Q?WHiit9ibc0A5BrhcVeMuQFP7na110TaBPgF6eIhifkTUb1+FJTXvIPypE6AQ?=
 =?us-ascii?Q?0h3bkXiUz1VE2miJMGCtuyq7Q3UcG6mfUD39iyZqriiG8ChNyfqcLHZyFuu7?=
 =?us-ascii?Q?2pYueGJUMDHaIEf6SBjaRa9Ikqh2Yk0Wj91SXG3oefFa1pyL/c3kjN0N0Xt0?=
 =?us-ascii?Q?dlrXRIrivWoO/jgszhthOillMKhG1BcC68eFsbctxF5ksrbLowpyHgmFdRcd?=
 =?us-ascii?Q?TPYxghG98hgAL1EumlAxrWD+6GLRemDkJLyspLU35PjrsvL/Pwr5fFS5pUCx?=
 =?us-ascii?Q?zRKJCNJAUeJ0XYS2HUqdM6ETL5lUx9E/ccytfCN9tORnMo02xy4Laapl15I0?=
 =?us-ascii?Q?+UBLegFjHU/ENJikAjJqhiIGqAjrixS/Ex3GVU+xkkaPd64qhTyyzxcWzDGU?=
 =?us-ascii?Q?iWo2usuzMU628vpyrMT0t9s0EMgObxjs/0Y1hU77LvWe1go8o/MiyyEUCkrr?=
 =?us-ascii?Q?3Hb/4qAWNB1JkLzrJ4RDh5G79kgeZwf5zZH+H7J9F5pXBaCqkSfHwtzzcoeU?=
 =?us-ascii?Q?ajv+r5qv8nYDat/nvonvx7NWHmd4M6SPRh6XjPrTVXmiEhVHVs7CLtXe3EbN?=
 =?us-ascii?Q?e00ku94GK6jGrg7vmcogZoAv0Afyxan1894Fd+KYHL/6uA0WOyM7Yb7YlnlZ?=
 =?us-ascii?Q?Fw=3D=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7483d1b2-d12a-4fa3-1040-08dbe4e99af8
X-MS-Exchange-CrossTenant-AuthSource: AS2PR08MB8431.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 08:13:38.2572
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nlewZLkkhvdJj8bz7X9RFBvv1BCpi7aR8/N/2xqVon1RW8rorT9QLEOpLn7zvsMb/bFIChgvlsrZCUuYZS/BPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9458
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Nov 2023 08:13:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190488

From: Lukas Funke <lukas.funke@weidmueller.com>

Adds features to explicitly write zeros to the start of the
partition. This is useful to overwrite old content like
filesystem signatures which may be re-recognized otherwise.

The new features can be enabled with
'--soucreparams=3D"[fill|size=3D<N>[S|s|K|k|M|G]][,][bs=3D<N>[S|s|K|k|M|G]]=
"'
Conflicting or missing options throw errors.

The features are:
- fill
  Fill the entire partition with zeros. Requires '--fixed-size' option
  to be set.
- size=3D<N>[S|s|K|k|M|G]
  Set the first N bytes of the partition to zero. Default unit is 'K'.
- bs=3D<N>[S|s|K|k|M|G]
  Write at most N bytes at a time during source file creation.
  Defaults to '1M'. Default unit is 'K'.

Malte Schmidt (1):
  wic: extend empty plugin with options to write zeros to partiton

 scripts/lib/wic/plugins/source/empty.py | 57 ++++++++++++++++++++++++-
 1 file changed, 56 insertions(+), 1 deletion(-)

--=20
2.30.2


