Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.84])
 by mx.groups.io with SMTP id smtpd.web09.80775.1629439941176682423
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Aug 2021 23:12:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@synaptics.onmicrosoft.com header.s=selector2-synaptics-onmicrosoft-com header.b=mHaQkmjP;
 spf=pass (domain: synaptics.com, ip: 40.107.92.84, mailfrom: randy.li@synaptics.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=awMrqy6kG7ciahH8Ozm1Qq82re592fJC8toM/NyI6yTOo1yVx5Q3oYC4H53TsK8eBW0BIRwtixAigdHHTa7+tYuO5TSBcqYlDO05pCgXsefff6sF3Sm5KR6u3n4jHjpI/gc31LyttCe7KzU6NQDEeHm2QAzj5hOlzqfghlbCch6aQEQ7DWPvoeuu1YibkulCTrjpj8ZM8aT9M5ksNtj8+5fH4Q+2Pd2CagL9vFbTPxgkcZd2hohH+TEfiEBcyK6lesl8GpuMYdiROxlrCCFFNXHMG9ZOrzQP7nI7IqumrC8o3k4mUNmf5QTP7kP1PawmATA3wwEiv9cqxhClCwCoyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HyzXiSKq/EWSDCYAZw9AtA0+N7EmLYwAYneZ9oSAIno=;
 b=E9chKtUnfW8NjA7fd6WAWtv89nq6RPJ8MytZEjdnAjOOjRyKo5bHg+lNvTwwwIY38/3HgclrzK7mGHnSGz3M3iBDdYAxJ8dIR8v7u1oHLbORrFEK4l3IUuPjoHKRQpQXjizNXiOCMVp7hhwBidZ26Vp5ucST5DaCrcnHTXd9HgL8of6/qE9nEfdVZAVwJL7iv6mwj60+NCN+ly3SEMFuCDFjUajPZzTmwQvJ6Kxk6CC/d35bA9PtoZp7EGT6PS8S1m8udn5/b7e9sO5HnXZsyGlnbiBwEcG1WnRuh4VGqJURi1EqhxDTlxIHIBkysR6dwlaB3+gAfoVej2nBPueGpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HyzXiSKq/EWSDCYAZw9AtA0+N7EmLYwAYneZ9oSAIno=;
 b=mHaQkmjPjk0pawIFIv3tQfEUODEyyi8HoAcTsBooNlVjruj1J8+jVupYu9h89WnhwWpvljm66YT0z39wvlVEsh+Nig5uVQ5qdAQnx8mDmuEHbvyugpvct/f1HPgFSwGCJ3nHLCPn9haLfJFpX12IWmh+q6BKxv212HBbMnt7G5g=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=synaptics.com;
Received: from DM6PR03MB5196.namprd03.prod.outlook.com (2603:10b6:5:24a::19)
 by DM6PR03MB3468.namprd03.prod.outlook.com (2603:10b6:5:a9::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.19; Fri, 20 Aug
 2021 06:12:18 +0000
Received: from DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::f093:dd49:947a:f1f7]) by DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::f093:dd49:947a:f1f7%3]) with mapi id 15.20.4436.019; Fri, 20 Aug 2021
 06:12:18 +0000
From: "Hsia-Jun Li" <randy.li@synaptics.com>
To: openembedded-core@lists.openembedded.org
CC: Hsia-Jun Li <randy.li@synaptics.com>
Subject: [PATCH 1/2] cross-canadian: skip it for Android bionic
Date: Fri, 20 Aug 2021 14:11:49 +0800
Message-ID: <20210820061150.146518-2-randy.li@synaptics.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210820061150.146518-1-randy.li@synaptics.com>
References: <20210820061150.146518-1-randy.li@synaptics.com>
X-ClientProxiedBy: SJ0PR05CA0048.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::23) To DM6PR03MB5196.namprd03.prod.outlook.com
 (2603:10b6:5:24a::19)
Return-Path: randy.li@synaptics.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from randy-t14s.synaptics.com (192.147.44.15) by SJ0PR05CA0048.namprd05.prod.outlook.com (2603:10b6:a03:33f::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.6 via Frontend Transport; Fri, 20 Aug 2021 06:12:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e3b5feaa-0623-41f4-d15f-08d963a176d7
X-MS-TrafficTypeDiagnostic: DM6PR03MB3468:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DM6PR03MB3468A10F9C932B41519C774986C19@DM6PR03MB3468.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1265;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	B/VbPvbfcJys0IlKzqoNPTpQ4zy3FCczPbB10J6T+Glr/Tk9jm4FM0uunxBA2ouDoC4ywUrrunF6O4uxngx9wmW6r3bJww/FE2Kz1dovCoAH3xDlgRxfPoOJ1gEo/sg32qPiD3TqC38ia3bCgB4sw0tJ62vRplKMzkGaxBeJpXiFTm3RObdxNXKHjBAugi1GkTF8oh29I4cCLA7yewmqF7Bg6yeEn26Yah/p1mIUKUtyxMI3VoGCOJwXZsFKkuVnGJgHuiBqr7Rwgmte/KJb0q/IsD84nU24NMLxeEw63BYzlXY597+KEfmpBqvG62bp7p0TCh8IWTtbQvEw63OVaM7XxV4mSzUfNa16TUeOMOVNkLOy/xNT6690ERXclteeD+jvVt2tj/IgKlI9AV+YA25xhZEdfrz63JaqCxja+s2ALBfaxOxfqEHgr6ZCOjLgWdYcwvTT4EwGt6oq4uC1FY3ydFpdFHfzFh253JyUrpvN8tCld+Lp09omXWAyLqN0XvpaGN+xtjLJS/x8jTH/+tI7fzkXJFG54rdzxxsPD2r+WUQULakq3U4i2ClinOUfHfrpy6G0LkSLHpLfaPLtSL5Kyx+D5S9iprC0LGf7GJFXpTXAy+PbikIoY1WYmgU/XCRwZVizEzZEt+OJvWD/Rf/5HOORdyVtiEcjgeYAvSPdrP7XYoOnaDn7ERm4AxHkl2xZJ6HeOViUq6KPTzMo7g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5196.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(39850400004)(346002)(136003)(396003)(366004)(8676002)(6916009)(956004)(316002)(26005)(2616005)(36756003)(2906002)(6486002)(38100700002)(83380400001)(1076003)(66556008)(66476007)(66946007)(4326008)(38350700002)(478600001)(6666004)(107886003)(52116002)(7696005)(8936002)(186003)(4744005)(5660300002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?gEMBUhiq6RW+gb9JPpTNL7YZNsODMG1UrXfeUy+RXJg9dxOQkAi1hT+QnrEC?=
 =?us-ascii?Q?vYMLNPJIrjt7SnYztaFYfobCBZfsy/UbrtTOmkGYSUcJoLyIJy4mNJQX7nWM?=
 =?us-ascii?Q?23E2kkzShgaZXFZHRNVnNxpNy2X/UMgKqPJ4Pt4izlZNah3hAWINzLqJY6lS?=
 =?us-ascii?Q?caqjJOOeMZVE3l/kAAPowloe8V9YqjaIEhNXIsN2gphUATdD3lqiQkVfFKqH?=
 =?us-ascii?Q?xMl6ZQfYFEy8imkukj4TK6Wf8HjfySMDb87xvEbJgCSwR2kCI8y3NE5oNfgs?=
 =?us-ascii?Q?mA6KlTd8O945s+ma4RAKGhrOu9Zx6xazAaGoX2SdegN81NE5OySMBzUq4BUu?=
 =?us-ascii?Q?JY8zFUPtJZPNj6bjeyYXTZekzsiE+VOzQSkv3r1C/PLWDc9fqQRu1yZCtKj4?=
 =?us-ascii?Q?m6nTeLtd4Ll+3A9NcYyfHXNKVx0Gkq3a+MZVbzr5mlNGSwdlQcoo2X2IMxuB?=
 =?us-ascii?Q?6tp6XtB0iyo8m0vAcGS7lECA+giYR0C7MzYTe3HlutPwu/NVtewdclFM3PRu?=
 =?us-ascii?Q?2t9ryrsTlY5KNeIm1skZWHLsDXGwJfk8kLRj6S/2E5DQl8ci1lMEfJY6SPWu?=
 =?us-ascii?Q?fj8qyzBwi3cX6OkIDBvwEH9NjMClcn0FS2uYparA9UvSteCz1i+wks4nttkZ?=
 =?us-ascii?Q?v4C7jn3hD/X3icF8IaKl2Z2B8+zHrphP5gUQYuCklTsufsh6wX5dMp6efiMk?=
 =?us-ascii?Q?eXanXp+LlHSv7rLYVwB1+qOH9+JHYQDQf1f2pUp5ubA5++vdu3/fKgKjWani?=
 =?us-ascii?Q?ptxeFsGION6pst1FPB864PxloLy6r6Gm7s8KeRZ+dfIMhliubLh/k2gZFQ0Z?=
 =?us-ascii?Q?UtBFZ64zg/8OoqGt05Sl9RYo4eYUqTCug8j6LWghDVrC+Om6uGvjkkz4/avC?=
 =?us-ascii?Q?eAnZm9IALSD54ongOSbK09+qZugggZWmGH40/WQvtRd19dm24WyAtawMm8tG?=
 =?us-ascii?Q?+xChzMCmcMFaW6ci6zw1wc10U3X9QjZCn2y8HMSQL1c+XN7pHb1eK3I2fiA/?=
 =?us-ascii?Q?ZRBvs5s7Ih79pTw0E9ofe1YgkRP7To1167AcCH1kbaP2ld8+zSNzRw37y8uz?=
 =?us-ascii?Q?RRjoE+8po3BM58QBFMcPK1lR5BkfeJRudMaEZum9wkwyyYW2a3UW1QWWEla5?=
 =?us-ascii?Q?dZUp3QnYCXuexKlKdGT5r9kR1PvFcyvi4D3NVtkR2H6imDDQyEaNwMUwtKMZ?=
 =?us-ascii?Q?YeRp1Qvf70WVhUxgGqXU0YOlUI6J5F4leOey7avfKrTOoUyH6PNeSv1Xh+ho?=
 =?us-ascii?Q?o5XZDWxuo/fu7dtn8Mk1k8bZO7+G2YSgvPz4VooC2WX5d0zKgHkM4SgVC9Hd?=
 =?us-ascii?Q?aNLAqx1L6////VFYVDFyAYo/?=
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3b5feaa-0623-41f4-d15f-08d963a176d7
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5196.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2021 06:12:18.7442
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5FoX8a3TIWZMNbGK0sJowDSmzd062LPAuS+ATjKFWd3G/dW78lwzvnckFwA/zjIEMJ8nPD9myu21sM/WyQ8wFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3468
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Signed-off-by: Hsia-Jun Li <randy.li@synaptics.com>
---
 meta/classes/cross-canadian.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/cross-canadian.bbclass b/meta/classes/cross-canad=
ian.bbclass
index 447a2bb..ce8751e 100644
--- a/meta/classes/cross-canadian.bbclass
+++ b/meta/classes/cross-canadian.bbclass
@@ -32,7 +32,7 @@ python () {
     if d.getVar("MODIFYTOS") !=3D "1":
         return
=20
-    if d.getVar("TCLIBC") in [ 'baremetal', 'newlib' ]:
+    if d.getVar("TCLIBC") in [ 'baremetal', 'newlib', 'bionic' ]:
         return
=20
     tos =3D d.getVar("TARGET_OS")
--=20
2.7.4

