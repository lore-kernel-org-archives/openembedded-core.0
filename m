Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.133])
 by mx.groups.io with SMTP id smtpd.web10.2857.1625086365947497824
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Jun 2021 13:52:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@prevas.dk header.s=selector1 header.b=C/RsUTuC;
 spf=pass (domain: prevas.dk, ip: 40.107.22.133, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RX6Wlf87jghYMHxqagPCDZiu9JSQn6Si+FA2aGwFFebT7rdr+lfwdfqO0SwYcABKHwI2yyvpDoS9/xJn9nfZ4Bkpbc/ALpnd+8251zzDW+1vArp1KhB+xK5GTvQsoZzwWMTpoXoRWtX/3MHHlCXN7hmwxIMfjDaGWooqTMi+dTL8DpXZzBpmrbZ8En/b+jH7XwT1X5463eS/WurgozohhA1A/6p3OpXFj4h4+56jH2FzY1txLIplMKRZPByIkwrqT2wLMvXXWrqG7PygenA6sdkS31PPr7+/VqarYsqPJbJJwDxUGhPWl1VyqMQct7ZD8e1aAJ/n7BxeaLFmPlJ3Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e99UhCTnICSxLHGF8+SoWJGVA3IcKGkkrksFmktf8R4=;
 b=JMsHWekJE9KlSFIYC05RG2f01waHEhUWbm4NolmKuu3BEJD58ZID4c5VvoT6y4KmC6s6kNoJ+7e5c6qASAJo2YuUXf31VafvS0lMwpkQ58m0QDyX1t43K/RmDM5yTW35SsCFLt5ro9uzk977zfeHucRf23Jgte7YjgBn5/SYe8H5laYTYOR10Av13xh3aiwg3ZxJRJAHKn8fM8vYGx85753+pOhbv8OJJeKaAgtsXc+LswUpt0K1VuhQxiYi7Ew4Zv2zqV+zOHSSJP6FAz4MiHSSw/9V4miL2EiXCt3kF4pNJWCiALla7Q4dj9AdHn+d6TK9IiuINdvlshsGJWz5JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e99UhCTnICSxLHGF8+SoWJGVA3IcKGkkrksFmktf8R4=;
 b=C/RsUTuCr3TaR0fWavSGxeoP28ttLEkhLU57veO6lbKKSCo9TgYPZ2hDHVQJZbNiB6uaTPHCLi2BVUDgUatcu+w854JnWdp2QpSjie+/j7ddY829XjmMOwv/tj7xRTlPXj9Q+73o/kAYGTnj1s61iX4p6iLviH2SQsZRMV4+X7g=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=prevas.dk;
Received: from AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:3f::10)
 by AM0PR10MB2114.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:42::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.21; Wed, 30 Jun
 2021 20:52:42 +0000
Received: from AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::fc83:36a5:db02:3dbb]) by AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::fc83:36a5:db02:3dbb%7]) with mapi id 15.20.4264.028; Wed, 30 Jun 2021
 20:52:42 +0000
From: "Rasmus Villemoes" <rasmus.villemoes@prevas.dk>
To: openembedded-core@lists.openembedded.org
CC: Bruce Ashfield <bruce.ashfield@gmail.com>,
	Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Subject: [PATCH] recipes-kernel: vdsotest: new recipe
Date: Wed, 30 Jun 2021 22:52:33 +0200
Message-ID: <20210630205233.23046-1-rasmus.villemoes@prevas.dk>
X-Mailer: git-send-email 2.31.1
X-Originating-IP: [80.208.64.110]
X-ClientProxiedBy: AM5PR0601CA0055.eurprd06.prod.outlook.com
 (2603:10a6:206::20) To AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:3f::10)
Return-Path: rasmus.villemoes@prevas.dk
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from prevas-ravi.prevas.se (80.208.64.110) by AM5PR0601CA0055.eurprd06.prod.outlook.com (2603:10a6:206::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.21 via Frontend Transport; Wed, 30 Jun 2021 20:52:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dfdd0db0-b681-4ce3-04d9-08d93c09015c
X-MS-TrafficTypeDiagnostic: AM0PR10MB2114:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM0PR10MB21142D00F1B4C16AA295E78193019@AM0PR10MB2114.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	S9ox1jJ6x4cT/sh+MSvFGq7UiYyCHvgr6f82zbuAxHwg2JXMvekLn9wiJMLb3pI+7Gr6h6JXuqNWrEq7g7eUIGijt9A4O1tcbxZztPgiezmRoYLS45KFskDCMqG1eC66Wr0w+EtxasKoD209OnPXdbKRPhB5/L1OB9u0HPPoMpuvdBJfa5wda+JaAOnGMdxSiztV+DjT+gzkIThN6nxB73hh2oELRQF6I4ZZmv10yss3Vfp9pE/45rkgnI95c2+j//vCTUvaBynmO5gCq394rosPX2pxYYut8nWaMzH01RNqtgJq1TWyC/QLe9jVtZyR3mWxzK8orxdbjBEkibEQVBTiFxzSlxkYpuerGHNirMAvWN2QAM+D4XKjKBxCL6UqoAV/CeuaBohS/XIybHAnQIQA3zeQuWLktLGS14v+5kRGVIrvVMa0ZqxZTu2hLmZajqfAowNMJHVAdZZmi2SDqkJtiRRpzvpCLUZk9mlK87o5qTEB5D4xnx3DMmlqWAVMp+Hrov2/w/91LEAEGfNlnrOTS10/+xZeqTnKHqpckEYr5vg0u1OBNudTGrS8Z77bwxEi1ClgEdvlr8VCPi3/9oYKleK+8gdP6DmcvsQHJ6xm8GCF+91IbG6ENN4nYjNu+RvQIUF1Zd6/mo567V0mTBuBWPZz8RrC6qQpImNVP7hvDVT8nDFtIDJAcQPMUO7KKWAwmmkQRkqnFQ3eONIhhUvPvUdUbnm7bPiS22fH6Ky3eGsJamYKtc0ED+6r2owggFC4Xq8oiWSuc3QtaZeoIy3bivQtzYlRkINDFIhtvvaX7U3yCLtOrvDyqUNsBtK0YFL+YKsPCOtZfImHSBY9Dw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(376002)(136003)(396003)(366004)(346002)(39840400004)(16526019)(316002)(52116002)(1076003)(186003)(66946007)(6666004)(86362001)(6512007)(8676002)(54906003)(4326008)(5660300002)(44832011)(66476007)(956004)(6916009)(38100700002)(8936002)(38350700002)(2616005)(107886003)(8976002)(478600001)(66556008)(83380400001)(6506007)(2906002)(6486002)(36756003)(26005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?chrIgXvq+XfRtIg4zwRFWcZE+k8eVGGjZ+/0WH4BmX6ldqpO+gW86HErLzbe?=
 =?us-ascii?Q?TJ+k/7Msm5n6dAN9wZ0n30G8j3sOI3Fta2Vu88ticA0P1XGYoWQUFu3pi7DM?=
 =?us-ascii?Q?j0p5WCxrO+lm1OYL2eaWc4ePAb3pYlbu6/ZpZrlzl3aMmN7Eo2HJuYCY76mL?=
 =?us-ascii?Q?j+acwQRprr2GSxDH6W8SsPYbDGJ0Mi5Jr6zEkeHCKu9Mm9t8rVCqWpdCF+po?=
 =?us-ascii?Q?uGu9KzFcKK8cAWhZXELWYJTRn+qvsW3l1AHZVL55Uvbj9A4zC9LaX0oejEZo?=
 =?us-ascii?Q?smVdmRgVjo3m9KnYeux2t9Vt/EPUB3kthEEusdSWtSzdjOb7ta84j+KznvQ4?=
 =?us-ascii?Q?3TAe2HuQ0xTa3VwhhKOVtmO31MZFi0AxdYlVh+pfak8hX/mQo2YR8zsZCam8?=
 =?us-ascii?Q?NLteHU0cjqoZ9REPUZzDLXMju4384BTKezVbWanOMtza+fQBAtzGZ5aLFXxx?=
 =?us-ascii?Q?uADPrj2q4LoTthEVICQmVPgu5kqEZx4KUtV1AJskjKTWSpHzDBatKll5rw6J?=
 =?us-ascii?Q?6OQynegSmZVwn+y00wq4wPNrxKo5QkRkRHb+BLvVXuJOKqRAJIE2MC8Xo5Ar?=
 =?us-ascii?Q?yyjliMwc7DBnm2mLRsTURT8rYteYQ9bssPBdK4NkWUu5e+w1WSZ4l8GTo78+?=
 =?us-ascii?Q?EVmjhmb5USfGKwZgoN8ZvrnQg16ZZ3ULN4M5Ujsm28pDaHmuNboBJIm76d8w?=
 =?us-ascii?Q?fckL8fQHG/yva7EBV+rzSYHQwykBVN1g97aMh/E2+fP/5kZm3HftvNIg1Via?=
 =?us-ascii?Q?mgFqKk0KWDnS87cUgNxwHAYLQLxTkhssWALaA/HAbk+jUMxidYL9DtGhpSz0?=
 =?us-ascii?Q?Mo/ZxO68zu5fEEO1tqwM9w3He5JHJrTocsXVNhABr8BlhOk5T45wcn8MtV4V?=
 =?us-ascii?Q?telyRXU/mB9wxoxBCjSZxy+fPUd8IfdvJief81oFhtQyHm5LeAvBX0aSko2c?=
 =?us-ascii?Q?7a7kfY/n/mcXdB3wPf2XY6B/MJq5+UZN04ZWUsdQHiZn/tCCzDwYZ7CgKrd/?=
 =?us-ascii?Q?H8Guia0odHTqFTOti7YXXnvDFcG8xnvrph2De3Wp30lV3t9UceFPOuu+Otc6?=
 =?us-ascii?Q?6o1lwRawVKreoGOlhluY9dMZZ0bAkL0zhCE9RkUy1Sv3F5lm5IuWlnPOSStG?=
 =?us-ascii?Q?ig+2cqTHm+j6yrz8Y83P8ccdBS/eZPYCccWc4xO7ZBeztBcd5ltYIdGM+DWl?=
 =?us-ascii?Q?dIJXs+P79PkDVWkdvo5SkW23DTKWg9efHg90VnZ6U6qcaLP4K3SRTl+A2rce?=
 =?us-ascii?Q?O2js0/C5ATURbWqZiwFPGIjlWf1DIFKw40Jtc26GGmPMQuzZ3HO7Bk2TLkuN?=
 =?us-ascii?Q?2AupDUGg5mo/Mxj+UHjpCerw?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: dfdd0db0-b681-4ce3-04d9-08d93c09015c
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2021 20:52:42.6304
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kwAbHhsAoPVhqms88DzYADockWJNhmeEG2QONBz2hwtPnJ/tQnhQIr7fhgGG+a3zDEhrhJqAAIcYZqVvfxwgb9KFELmAB62LhG74zntHdck=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB2114
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

vdsotest is a handy tool for testing and benchmarking the vDSO,
e.g. to measure the overhead of clock_gettime() done via the vDSO
compared to an actual system call.

Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
---
Resending because the list rejected the first attempt, sent from a
wrong email address. Apologies to anyone receiving this again.

 meta/recipes-kernel/vdsotest/vdsotest_0.3.bb | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta/recipes-kernel/vdsotest/vdsotest_0.3.bb

diff --git a/meta/recipes-kernel/vdsotest/vdsotest_0.3.bb b/meta/recipes-ke=
rnel/vdsotest/vdsotest_0.3.bb
new file mode 100644
index 0000000000..5f94909102
--- /dev/null
+++ b/meta/recipes-kernel/vdsotest/vdsotest_0.3.bb
@@ -0,0 +1,11 @@
+SUMMARY =3D "vdsotest is a utility for testing and benchmarking a Linux VD=
SO"
+HOMEPAGE =3D "https://github.com/nlynch-mentor/vdsotest"
+LICENSE =3D "GPL-2.0"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a426=
3"
+
+SRC_URI =3D "git://github.com/nlynch-mentor/vdsotest.git"
+SRCREV =3D "4ad733fb25364e4afaf4060e57c2429a93b686c5"
+
+S =3D "${WORKDIR}/git"
+
+inherit autotools
--=20
2.31.1

