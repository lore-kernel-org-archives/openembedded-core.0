Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.62])
 by mx.groups.io with SMTP id smtpd.web08.15372.1630320435127719372
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Aug 2021 03:47:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@synaptics.onmicrosoft.com header.s=selector2-synaptics-onmicrosoft-com header.b=CtUyMv2S;
 spf=pass (domain: synaptics.com, ip: 40.107.223.62, mailfrom: randy.li@synaptics.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZAGCnc6p7j8VQXlY78jE4JYOv217jAtXbl3X2LeSCts0pnVqoWXbLoLyKB1XVVEJ/1gyxAjbBNeBaAQQXZWYyZvks5Hc0p2YXuVyYFADi5Tedaxo0oD63EUcmsepu92SCCzTuDVfFPytaauDscal9W2z9zwirE3GpAkjFSka/xNIBIiVmE1sqb2qKaEjVSUQwS3YwQM2CjBLeZ1Bvpi8rvyzCZCo7llIp3UwSDFsAC7+65zbf1et/vcE0UjrEHJWNnv3bXYmgY30XMBMyuv6ciqVoY6IOoSZ8pT8XDkSSSVHZ4SApqIrZGHYIOkkZLSeKcKIuWLIAv4stXvuALC/sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NqPT7pdiibZbRMBN5sh4WDu9A/7G6X0sSooPNOu0oVQ=;
 b=WY03YY1WrB5AYwLnwVeAZ/7Xv0GduhhznqrB4Sz7ZfgmVYuDpk90W0B5zJ61yMmdKHW5PLQNEsAuxTI7Ws1P0XJ2HhxEdxeMdIV8SvCYqSPzlaYHzi/jM2B4csKqfv4mMdEwUNP6rTn0M5szep5omQSJKHQoNMOKTcox8/fnl1dhMh1hjkXN2qYFIFK315HjeNzPJmIB73oDDHxIuawphSCpBy0BLbAMlEl6dYHEqRHBf32DTblPdfjJFYMiSGMMqi4nBhbzDRCDLYV3/rAaubW7dZRwlIiGgvnplCxXeTPqQbCc8iIsGaCcqK08EYQPiqPIZrx1Tl+gCFSxfPvRTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NqPT7pdiibZbRMBN5sh4WDu9A/7G6X0sSooPNOu0oVQ=;
 b=CtUyMv2SLm4o3HSViGmvnXWHfyj9WoNYFPFGu3OcYv6s/5ASkAj0NczZcGsmbuWgYPKWXfq/aQ/70NoMa5A1v173iyGuRuZsobjIp5EdplS+r6eA4us3RIwR8B8MyN0KGMQ/zVI8FEKRa9QA7cegCk2KTKNK/1FPSdjFgyU37vs=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=synaptics.com;
Received: from DM6PR03MB5196.namprd03.prod.outlook.com (2603:10b6:5:24a::19)
 by DM6PR03MB4347.namprd03.prod.outlook.com (2603:10b6:5:110::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20; Mon, 30 Aug
 2021 10:47:14 +0000
Received: from DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::1aa:48b3:79d5:7e11]) by DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::1aa:48b3:79d5:7e11%7]) with mapi id 15.20.4457.023; Mon, 30 Aug 2021
 10:47:14 +0000
From: "Hsia-Jun Li" <randy.li@synaptics.com>
To: openembedded-core@lists.openembedded.org
CC: "Hsia-Jun(Randy) Li" <randy.li@synaptics.com>
Subject: [PATCH 1/2] curl: fix the dependency to zstd
Date: Mon, 30 Aug 2021 18:46:43 +0800
Message-ID: <20210830104644.422663-2-randy.li@synaptics.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210830104644.422663-1-randy.li@synaptics.com>
References: <20210830104644.422663-1-randy.li@synaptics.com>
X-ClientProxiedBy: HKAPR04CA0015.apcprd04.prod.outlook.com
 (2603:1096:203:d0::25) To DM6PR03MB5196.namprd03.prod.outlook.com
 (2603:10b6:5:24a::19)
Return-Path: randy.li@synaptics.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from randy-t14s.synaptics.com (124.74.246.114) by HKAPR04CA0015.apcprd04.prod.outlook.com (2603:1096:203:d0::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17 via Frontend Transport; Mon, 30 Aug 2021 10:47:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ab3a89e4-8d4e-45a3-5e1e-08d96ba386fe
X-MS-TrafficTypeDiagnostic: DM6PR03MB4347:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DM6PR03MB4347516B002CEC89017C76F486CB9@DM6PR03MB4347.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1824;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Y7Lxul2hu0pu8BjlnNtSn02hc/EY0P2EYclhJhWtSY+GjpXmvGYR2oXhGgKgZe1EMCDotNsdFg+HpLrseUSrzzbvo6KLrzqTmpHQVy7hwmJMK45YpGcuEcn9/fhKAovYzAtCdZgUR0UiGqwdqFYXAGpHbBFLfFJu0eayjeAT4bncYl4DvrSo8EZbWEoHV/nRED+Oke4DHo8UHaIrSvLZXwOxdFG53Q4/QlyCUB4aBvUuPShcTuKwOpk4/0rORw1LLOpGmPKqzM+92j27o7zFqUR3kKVD3RWeAvNvzkNM83mM+J2+Ea4f6rpOcUyCnQnFRPI+AWbN/28IouMKtuZzU/tJlu8zaHlOvEKpILAmwAyND1yw0n8+SW8t4Uy2l79Sn/AOp4CF2a1wND0FS+DntiiwTklc+VPjwB4xLHBpGRqLpePUJ0jdt1sElI/fXJU5kYA53Tu/RhMiZ7wMDkn78FcB/QXrhsln3cm94wx0TAeAjHoeT64t/cGWR4AAZYAl1mpGQV5ExZsXJBSI1babjAww+fDgCQHdiqjTYNriF3KMBoVKCxy7qcu41wuu10RGpx/gx9vFf0AJTkzL0NeJmo+yF5bipQfgRaSEU+ORf7mBFxwUAnYT0naq5yQIJjpWNdPLh1CEhXa62ZI9aCpeyZqI5GHiJ9LOZoLUm1TRNnt/k5ntpNTI1+eMJXwjavhHAILSp+usuS4P2ce/A8Xg+w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5196.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(38350700002)(186003)(26005)(2616005)(2906002)(38100700002)(6666004)(956004)(6486002)(4744005)(7696005)(1076003)(4326008)(36756003)(52116002)(316002)(107886003)(66476007)(8936002)(8676002)(508600001)(86362001)(66946007)(66556008)(6916009)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?bTZdO/5WUdGcED+7Rwdlbk9rlEaCPCPRk70QWjyw6GBpAPWPSEs2pVvwLXhd?=
 =?us-ascii?Q?H/iY0nmEYFY+H+tKLUSsTvSyv6BzYkNoD65PEXmDmXTrPRsKAyu6bYYKAQGA?=
 =?us-ascii?Q?NlsAsPOlf3aB+FafljKL+HRTHvRUou7kn4do0uQ42PkcthB6iffM2TkGOn9l?=
 =?us-ascii?Q?eDm+ShMKBHF9HucIcm4XG8rGORt5pXWI+6P1UTvBbflCJcjNdEV9ZExykJ64?=
 =?us-ascii?Q?V9FsLIrpvvdIFbr2/vGp27DfCSk9zdzVQZTtKFemPjpKYx8BxXmDloZ+z3ra?=
 =?us-ascii?Q?fIJh5GFX7tmPtEeIA4wIEEV4OZvJTVOkgdYLqsU85OgT4mez0cYyE+K2Py4A?=
 =?us-ascii?Q?svdY+6EbswLZXPZmD/Qmx2CMJsiCWrKs9rf/RHduob971Zzac/alonTJ8aB0?=
 =?us-ascii?Q?ALw7KeYVXL3K+rTfhDRyh42zthDDixC5bbUW9UyFxLXgh2vNUmWb8kfnq1DJ?=
 =?us-ascii?Q?PnxpdD236p7rkPcD6jp3/cAJWNxqYT/P0WjpvK6GDvf/nOrLJkbtCHSBcDn7?=
 =?us-ascii?Q?ycMUSFOcK92hxJPsL3CFWQYjmfTlT+XmMnEFqlqj9GrNGvES22KjEJBp5SJr?=
 =?us-ascii?Q?wIPIChcMB5F39na8CTz5AlSvOGoexKtTBS45Hn3qKMMtz/sZGkGUY6LGaY4q?=
 =?us-ascii?Q?rtpPc/43XZDJZEEBlPM39iyeGi59Us5kuugGx/5NgJse+tnReUOJiqGA2wrH?=
 =?us-ascii?Q?CJ/UwCFMwByOH1GS2RxGvxK/vP19KQZiJHtqey4ajmoxB0B0GCKp6T8153fW?=
 =?us-ascii?Q?scy12INXs9Iag4+1nVpzoGgj5h/1IaKE8L/n2n+mgIrfTaqi26gQFYyo3UCT?=
 =?us-ascii?Q?3GSDicL0slb4dbkl25+Cxixqk0sGIMzGPDozYDjUVrvIUwd03htVMcV5Fy9E?=
 =?us-ascii?Q?L6bqShBNQIuwCEqtzXClZhZzTmq0YTVWvXdC1p49iLzBB5QJqpuP9iScWTQ0?=
 =?us-ascii?Q?blYYUgyoQDDwDiHR12642lotkhfRlgGRcT210C8qOz/glqFGIanJmAp5GFIM?=
 =?us-ascii?Q?nAK8HueDdwdIXYz5fgoX/sssdkNneMgxTDP43YGhw8nVA6NuT8DhxZGHt9Oz?=
 =?us-ascii?Q?E5n2RHSI+rAG4DJtzQegdkvRaFRJRz+RQ++WFnZI0ocuiVi9Qj47VXwF0OLc?=
 =?us-ascii?Q?y5hmGKFdHHtzGKBgf8iRzZpd/ZVqFhHe1TZpwJ9MwAKg+DKsvWBpToqGWzRG?=
 =?us-ascii?Q?5K0HlZwsjoDyM6hnCWddzOrgF1HCfjfTZX8e8TVMhBvGd+oGYJWSNjcAmQJy?=
 =?us-ascii?Q?VLaWcMC26mZBFsQW8QdMo73R2KuUsI2b7IMQ9WMn2mao3GguK5BWS6JEXToR?=
 =?us-ascii?Q?vdZV5XA/38r7sM984Y7oNsO2?=
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab3a89e4-8d4e-45a3-5e1e-08d96ba386fe
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5196.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2021 10:47:14.1350
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0ZpLvuqFKsk66LO5R1DH0CY02A9plIRfs3ZUBHPiJ9fI1/WNlev0QWBzQVbeYALWyHQeMwiTthl9Ynns59T4Qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4347
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

From: "Hsia-Jun(Randy) Li" <randy.li@synaptics.com>

It would be enabled by default but I am not sure whether
we need it.

Signed-off-by: Hsia-Jun(Randy) Li <randy.li@synaptics.com>
---
 meta/recipes-support/curl/curl_7.78.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/curl/curl_7.78.0.bb b/meta/recipes-suppor=
t/curl/curl_7.78.0.bb
index dece0ba..c779d8f 100644
--- a/meta/recipes-support/curl/curl_7.78.0.bb
+++ b/meta/recipes-support/curl/curl_7.78.0.bb
@@ -55,6 +55,7 @@ PACKAGECONFIG[tftp] =3D "--enable-tftp,--disable-tftp,"
 PACKAGECONFIG[threaded-resolver] =3D "--enable-threaded-resolver,--disable=
-threaded-resolver,,,,ares"
 PACKAGECONFIG[verbose] =3D "--enable-verbose,--disable-verbose"
 PACKAGECONFIG[zlib] =3D "--with-zlib=3D${STAGING_LIBDIR}/../,--without-zli=
b,zlib"
+PACKAGECONFIG[zstd] =3D ",--without-zstd,zstd"
=20
 EXTRA_OECONF =3D " \
     --disable-libcurl-option \
--=20
2.7.4

