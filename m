Return-Path: <rasmus.villemoes@prevas.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20801C4332F
	for <webhook@archiver.kernel.org>; Mon,  6 Nov 2023 14:22:41 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.109])
 by mx.groups.io with SMTP id smtpd.web11.54999.1699280554719156254
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Nov 2023 06:22:36 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@prevas.dk header.s=selector1 header.b=XUuVYZI/;
 spf=pass (domain: prevas.dk, ip: 40.107.14.109, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HtT54TKuAg1L5G60XJt9+ZSVAUm14o7z/WHCaeIVbRbFaLGV66PDdlsTdFqzBezmlrRaIdqYIQODqVI+9H0dxg9zs2NCBFRa+ABBzBdTyrttatbugdFGAMmfsK+9RUWozZn/Rb1tjTEjoFljN1w7kXJ5+JgGTsLFJMa3BZhogOm2dL7+NWaqNhOk15JC7/IdZh2DUDJlwHYbh9qcRWilbjodURMUNhZ4WqqbvE4JoP6jgByYjuVk+lyi1rsCTGrmLhJ0rol7NkX+mccRhtqtmwMKOoBtFkZ1phknMDWrWOb9VaqtCDjCjiPClipyUIu5heFfqkX08gDppJiBYpI1tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Trgmdxrzia6AQBjoqwUKTvofi3dLL1UH5YSKb/Cc/Fc=;
 b=ff0N/acY5IiW6TLJ4HyHuczFsp4zu08Rra+kHbFmlHcxjiV6MwqXSmQCSebhai4VCwpoZD+Kfb/sg6zowan9DLLhNJInICPxZPC7mAZ30r8csgtDIeilbKtDSoyQL+ujwG1hH5fLhpTwIEpChuubDFYLhH8qbV6rJg39Wdh48BGM1XlZguIlzqSxfnNw7KqjEw0VwtEvL7fnKiDEsVskAn292IgaaWKalSneSU73VGmTpAHWaAkNge3DBaoBwFYy5T7B9A2XnxraqI7EHN1q3d5/LazO03GfzrFY/ha0/bSeL65RgaMyhKm4cwT0pYPXsLjmIZz5TB579JIRgxDnBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Trgmdxrzia6AQBjoqwUKTvofi3dLL1UH5YSKb/Cc/Fc=;
 b=XUuVYZI/AvhP6Md9YP97ErSwj0gLCiHOo2EIRKZpgD6fZzIVETRMsSttJc4sDCJMZMF+RnLzmmNIrnTHY3pzgg2+DfCveHehY0FXqOzPq6ffd4MQ+LXwqiNMlYyG6qwA/4AVxB6HZsJkYoHN9wr1i6Ljz6JHyPpwLm6g8shBI5U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:45a::14)
 by AM7PR10MB3907.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:178::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Mon, 6 Nov
 2023 14:22:30 +0000
Received: from DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3d76:c11a:5c3f:3245]) by DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3d76:c11a:5c3f:3245%5]) with mapi id 15.20.6954.027; Mon, 6 Nov 2023
 14:22:30 +0000
From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
To: openembedded-core@lists.openembedded.org
CC: Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	Max Krummenacher <max.krummenacher@toradex.com>,
	Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Subject: [PATCH] perf: add jevents PACKAGECONFIG item
Date: Mon,  6 Nov 2023 15:22:17 +0100
Message-ID: <20231106142217.3837516-1-rasmus.villemoes@prevas.dk>
X-Mailer: git-send-email 2.40.1.1.g1c60b9335d
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AM0PR03CA0056.eurprd03.prod.outlook.com (2603:10a6:208::33)
 To DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:45a::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR10MB7100:EE_|AM7PR10MB3907:EE_
X-MS-Office365-Filtering-Correlation-Id: c9dc3d6f-4684-43f1-72e6-08dbded3cf56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/pKMO87nY65ilgNupCSSgcWMCpHUb1dYiR+IMaNTtgyoxVUey+HAzMi3KN9s/wDnPzlp8NwgEE7FFRHRg2KZJvvZqzPUOU5V8EKipwCqdFNop27nyRB4YQTms9jGWC+bfWsRVh8VwFIs7H4MpLr/KsNUUtufiwnT1MB4xu4XAUcNhDAvDbFu0nSp1aq0fufPB363VhTjyxSJ7oopxifrnhdpbn30Wmb0pZhMcoKYePXcsv/egHtL3RwdCelGljJWKTfy+9SSrdHb8uyKYGK7QnW50SUXDNe0k0vALD+ng6QevyoTi/Yjs0+Ax+kf8bwqzDZ3yQud5WlzBZmnxDKPobLMBIXtF7Ompc6LJBSd7h6GOfFfYkRmdYWTtFrdMTDty1trZ4kXPn0Q7EVvmtkCXfYjR9+aKelLOr9gAeloZhr9dLK42wCmET0nV7eeP3qkGH16Pk3qYE+e9RaNoppWON6LqMnoFiHgzWB3l0pdaL7YCYLrI+5iJLnXSZI2jGTyeKee8ySemFhYvqVDTmUPPC24Ww1oCpdM9WUUpkU/0diZROJnwgICMtJkp1DBWCTVdH7pjPKAkYwd5iL2Y7p7Rp1G+PtZoXlBbSt8gWc73qcMo0hN3cAJ4695W2hEFenM
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(39850400004)(346002)(376002)(136003)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(478600001)(41300700001)(6512007)(44832011)(6506007)(52116002)(2616005)(6486002)(6666004)(8676002)(8976002)(8936002)(2906002)(5660300002)(1076003)(66946007)(26005)(316002)(6916009)(66476007)(54906003)(66556008)(38100700002)(4326008)(107886003)(86362001)(36756003)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?b0elJ7+x7IyVRiPJMgKXdBJD0h25g/msICuU9qEox86iTbr5/mlt4lPJ9LaG?=
 =?us-ascii?Q?ZRELV3KkkiO4P03UjltTYGB6qY1g1BswRErAGa67oT4qXOF23VCpefIPBPAP?=
 =?us-ascii?Q?H+1WO2O1+WLPLtedBAmK7QW+H4let/4hz16rwC6OZmTkE1BDH3rGhDttVYm2?=
 =?us-ascii?Q?wbEIo370pUy1H4Y94+NAEreSnqJwl7mNpOLLKUYNb1pae/n6wrxQu+fhvPzG?=
 =?us-ascii?Q?tEXMEe7PbVfq4tjeAxNYwcZDwguai2nBZISiGUQvo+vw8mMioNM24xCrkcmX?=
 =?us-ascii?Q?DkbdVY+tXUr6RPluHecVo97IGRv6+G8cq6Vt0NVc90Z5m/TE967yKNC6g9F8?=
 =?us-ascii?Q?YIYRyFB9n7Ktk+atPWo4prfaoxyxZIbaDYKij3P8ud0vXStsF2ojvPboHa30?=
 =?us-ascii?Q?X7e6pebNZ6DPj+xN+FxMD8FrSMxRlcNcslmMVdoz0XZOOqMnq/JafDneONkI?=
 =?us-ascii?Q?f6amSOeOkn5L5yl7bRg6WK4qa4i8leLfv0bv5U51rBVold1Rd0RM/EJd1p+s?=
 =?us-ascii?Q?dW2u67EbLPdH+lwa1DhxVIp5lBnruZERa8OXnr4HtMKttrWjLifDBkF3ffYj?=
 =?us-ascii?Q?XwKtmYdhlc2klfEoQtS6mahtAbZc39/PXjRsNdcD3FEpvpGzAYR3tqhxCbIZ?=
 =?us-ascii?Q?+sCoD/PX73Xgp2d8gRjAcdqS+ueof2OC+UhsiI9RrGS5nunnTREp0Aa3B49V?=
 =?us-ascii?Q?wwHPsdLwbnuh64Vw8KBrmwVvY5JPt8ikXSg0THFOLGjwFmyCm9XOK3soUiPb?=
 =?us-ascii?Q?9wQaayzKaJnbHqg7thoDd5hTkgWfxikmFVeAHGq7CtJoCPP27jOQ6QhoXzZW?=
 =?us-ascii?Q?22etZ6nkpBgwD7gzVhoQHIavH7hJruKYpun55cdbLR7PeCMVGfRWgiyjmbkF?=
 =?us-ascii?Q?SIcf0BZlOR8CdmuTNGJ+myFSbYUuLBw5woKDuyuAb0oXqaDtfvG/K+fC3ovZ?=
 =?us-ascii?Q?diEHJbwru+sqvBGj+jMaDJ/yMt93WOOmD3zYbGSyxj4Lg8TrMUTyTPK49jb4?=
 =?us-ascii?Q?8iHfCjeEX8vKPNIE7bG8EJUSdiBpGNctS8hUV0S7oHOjG3REOVsAI7DkAm1S?=
 =?us-ascii?Q?w8sW7+cb6iugZ9JYJORmApXdWPuDWFEzby3wrE2/XdQfEvSk6fD5RUWyKtRc?=
 =?us-ascii?Q?UPLq22TEOoA1o8qhgg5NpBYdTVzDv+F6rqUX3w1i2dnHuh2fIiuXFA3SwmPR?=
 =?us-ascii?Q?fNbBHl2+cT0vISUSZ82JB3fuRlzU0WBz0Fz97+XE+cWno8g4TXfctkfzRrBT?=
 =?us-ascii?Q?YD1y88ZTgyh7mY0zzMduzJWZmNM7tBmNqfpG0rDOQiQ6bif+HRBbQU6QPIPS?=
 =?us-ascii?Q?SDH4tT3k3jM1Ptrz+OY0uiDhMRRAUzKQX7AXdizTIO49m3f1xv3MGQu/Kn5y?=
 =?us-ascii?Q?lV7ZgM/8pCHE33QewVJoMh5T4U13SNf3ube59Sz449OIg1ae0QhwzcTnKsF+?=
 =?us-ascii?Q?kbJ/05bZ30J11VFa8ETK+vmChCbqLWwCEzTIL2CjCgbewHi5Y9xiH+iUwdJk?=
 =?us-ascii?Q?g8McKcDquH6QBZquCfeUUAE2mafcMRXl2HcZZPgknBsql50H8NPs9l1EIv93?=
 =?us-ascii?Q?ook83oFux0SwKV7MHRo4gdKGfYqvXo55oVlcDIGk2taXbUfixm6d31uEk9AT?=
 =?us-ascii?Q?FQ=3D=3D?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: c9dc3d6f-4684-43f1-72e6-08dbded3cf56
X-MS-Exchange-CrossTenant-AuthSource: DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2023 14:22:30.2677
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1jmiSeKMl8rPFUK/KS/6lSh0atGtXF4CQOXz8b8KbJGKnCW2RkPVUKjwLUBxVcYwja4PZ1KA7pFfM2VeWI3JhNbzuNVDMyMA/wcviuMxkis=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3907
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Nov 2023 14:22:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190219

From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>

Building for an arm64 target, e.g. qemuarm64 or a raspberrypi3,
without "python" in PACKAGECONFIG, results in

| Makefile.config:892: *** ERROR: No python interpreter needed for jevents =
generation. Install python or build with NO_JEVENTS=3D1..  Stop.

Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
---
 meta/recipes-kernel/perf/perf.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/pe=
rf.bb
index a392166e73..37b53ee7df 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -28,6 +28,7 @@ PACKAGECONFIG[audit] =3D ",NO_LIBAUDIT=3D1,audit"
 PACKAGECONFIG[manpages] =3D ",,xmlto-native asciidoc-native"
 PACKAGECONFIG[cap] =3D ",,libcap"
 PACKAGECONFIG[libtraceevent] =3D ",NO_LIBTRACEEVENT=3D1,libtraceevent"
+PACKAGECONFIG[jevents] =3D ",NO_JEVENTS=3D1,python3-native"
 # Arm CoreSight
 PACKAGECONFIG[coresight] =3D "CORESIGHT=3D1,,opencsd"
 PACKAGECONFIG[pfm4] =3D ",NO_LIBPFM4=3D1,libpfm4"
--=20
2.40.1.1.g1c60b9335d


