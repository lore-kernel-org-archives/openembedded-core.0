Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7A33C001DB
	for <webhook@archiver.kernel.org>; Fri,  4 Aug 2023 08:45:17 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.47])
 by mx.groups.io with SMTP id smtpd.web11.7188.1691138712218312327
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Aug 2023 01:45:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: no key for signature: lookup selector2._domainkey.welotec.com on 127.0.0.1:53: no such host" header.i=@welotec.com header.s=selector2 header.b=PBM8Uyba;
 spf=pass (domain: welotec.com, ip: 40.107.8.47, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nBWNm8BOZ62YZe+VCtC9dEUmZgf6AEiqxgA3jFcwtb8glGfaiUQ6cfk7SlxWto98xFJReNf+9dp98gJH7p9XYUfRTtwHoo3dKu9uq5HrH7WbQK2dfBvQYo7yu5GfxiaMmtEF8XzWPTXcwiFEkJMsK1fk6UxKPh7wabFkKZXHUH2hj1YTCgwL9QThw25jiA9HnA8ijHULF8cT+e7g4BB9Jw1XNFVK8Ogo/01P1myXoaSklAY5eJV0NgoayBL/23DP4jMjFw2PbhwJqIq6Zwu7X1f3sinLnGpqvH09RxK43XpuEpg+p1q+aEu+WLFxSlnLBl3jfS/r2aOacIR6LrrrNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MuWB4OW2oWzTbmhUw0YctqfzuX4mSo7O7DWPr+ZYWHU=;
 b=PK/gCf61AbeNlnvGJdjhf7Sa1FfUsJnjeTe/ZLEnfnoqKzyV96c+IS7F0w+8R3YKeGsGUc/oLW5L9pYrcZVjR712bNGJOokDvVoiDHawv7G6tjtzxqtvqUHHA2KAKwZuqpDGnaOBCKUjEqLwRGyTXlrZ0r8ZM0ch5HhvYraA5FW124kF7lM88XYH1mO0aq80DlyV3zemcVlWM/4xTrJhUwfBrD2I4FWUyBsJqKGX4/TabG5jXrv6oKULkrQakOn/pPFlNTjCDkLa3EHp0uE9K6d0/dSKseoAlWTOgWGCcG7zobk1oVzJWe6xHYdbBvYsuzmpINNDpKcpj2NRWYxOtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MuWB4OW2oWzTbmhUw0YctqfzuX4mSo7O7DWPr+ZYWHU=;
 b=PBM8Uyba4G6aLFeB+raH8Klb2Z/KIGuJsEC2OtJqFu9uqEhQdQWf0NgKDpg4W0eHc88elAHAqtOEPSi5j8qpyKQr6ym+pnWsLYSuhS00PK06nd8NHuRrEEdW2HE+0IwPwoGKbjAppgVAHz8q7rdN5LCPmvYGBzq9d1q/ESaxBqk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by PA4PR04MB7743.eurprd04.prod.outlook.com (2603:10a6:102:b8::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Fri, 4 Aug
 2023 08:45:09 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::b693:eb1b:b0e6:9a06]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::b693:eb1b:b0e6:9a06%4]) with mapi id 15.20.6631.046; Fri, 4 Aug 2023
 08:45:09 +0000
From: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
To: openembedded-core@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH v12 4/7] sstate.bbclass: add support for ACLs and xattr
Date: Fri,  4 Aug 2023 10:43:12 +0200
Message-ID: <20230804084315.55768-4-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230804084315.55768-1-p.lobacz@welotec.com>
References: <20230804084315.55768-1-p.lobacz@welotec.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0093.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:79::17) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|PA4PR04MB7743:EE_
X-MS-Office365-Filtering-Correlation-Id: 10dd7dc6-9777-453b-6780-08db94c71c13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ESpqH1D9b/dyxN+kHqemfXuEtjheqsavJfr6opF+pGJk27eq5Zryp4v1MwuY/F9gkzqwtHaIwlhJ1zkLntrxcmumgI9LZ78VlI0KeccOVe53bdtfZG/EWhHGD5KYn70OLpffJRbDSCQasNETrZLQrqtPK02P3l4DG1zahp3jtgWK4mL9BMK4111BXis2pvst5TGmrXoEyVdDo3/cQUqATXsweqba9nj+v0HvbGymfVoz0H5Gon0OBAShN4gLJH00wXBDr79dRbc2p+beTrcIRdAKMnwGCBglOd7+ZkhVDmczyWvYPdCuRho7jCT1JS2pXK41cHCEeXFsUQwG0VyDSSMOGCbIROMgjYTp/DTPnqnw9/ctK9UCWm4mtBImyOD3jFBY515lI4KZBANMIOh1FMCHpSw7y7VcNt8Rb+E3c6sIpkL2eC4CyhhZxNL6BVZCUVkjlJF/Z5uyG3+uTMXEEVJATZCnWmvgcmIVvVtYUg2065yt+TkdI7JTXkpJlbY9HMuqtysQRHbTox3wtj01q0/F32jXw/ido8Ftca8b05Y1yAhXqMP6hcxwXzRfrcgoj3LnWijVxL/wDhY00sINyXKBucaUExTm24MxMc1GnLLcbWHl0Ud5eQWdmGtvWndX
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(346002)(136003)(39840400004)(396003)(451199021)(1800799003)(186006)(38100700002)(8936002)(478600001)(38350700002)(52116002)(6486002)(6666004)(8676002)(5660300002)(66556008)(316002)(41300700001)(4326008)(6916009)(66946007)(83380400001)(107886003)(6512007)(6506007)(66476007)(2616005)(66574015)(26005)(1076003)(2906002)(36756003)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?W50ipXaEb2VCVykXvweVwfc3ZeCRvvw5+WyYb6jeT02Rh6DdnD39iTkQWjBs?=
 =?us-ascii?Q?uIt6P3Gd4EiqK/6adEix8e3twaGRKJHq2Hqe2S8CMcsw3xG5QPNnTdeRycYp?=
 =?us-ascii?Q?zYC5bkvenLwtZeMM8WGMdxqIx9RXsILawLuP07KDqxulHqsmGajtOL4b/1Cs?=
 =?us-ascii?Q?BOnoRdMottp4bNjA6kxeR83JbEOQsIvOxAR6sVBN0o6iijq1jE5x0N3JHbQf?=
 =?us-ascii?Q?VkHIWpQpQmgPVtfM/teZAFaeCbbb8sLVEbTd08T+Dw0L+qSyPuG8CBKyF/JK?=
 =?us-ascii?Q?bsjWIZoA/rsdBFy6jjRzhsCj0mounbKI6cwMjQ7QpfpUVHeGWdlnXCgU8N3B?=
 =?us-ascii?Q?p/etfGVZ4YnoTTD3/p4BkHXWhbyTsKGetuPxL2E6pSriKKJHyDTmswPTBj6E?=
 =?us-ascii?Q?3G+neUXdYguOPNNHiPjOc4ZltUyzRa0oSQ9Ezp+TmgosjvdmRTMSUdyHJ2ui?=
 =?us-ascii?Q?02GNUYaJkU6QLlD1VIJIhLktxVRSQDRy5apHvHZvSnk2CU07oTKZCWO7/1kE?=
 =?us-ascii?Q?/GIMK2b5LLrkqHz7wRx9CTH/4NQhYEPfTEPVFiNagQjdTx5aqLgk4/EKd5RP?=
 =?us-ascii?Q?7EqoHMIlJvqkvyM7AGbOACcNsCwqD9OHUJlkRF35KJt1DYWxJIFBja1U1EXA?=
 =?us-ascii?Q?p/zFVs8MciS5MszKl8cJv9dAop+BvWzQLYjN84Y98cMnt+01NA25D1gQdEOA?=
 =?us-ascii?Q?dF2omZqv5NQI89WZtYzeqXcu0q35xNFDGO+TeB3B0U5sbVzXtjvbaXXlLotg?=
 =?us-ascii?Q?vRzoX3kxxTYbvtbT1A2HXFBcaLVv7ttG7LJdbP808Ou06ESUTmDuf2LL8pSv?=
 =?us-ascii?Q?q61ejXydlupSRn5m4e+2vX2/ziulZqJ7XIzIXS7qGAymZsimEWiyWrYBE70d?=
 =?us-ascii?Q?7mUbgdPp0zDnarNPvmynGO96448HBCHoSIcb/Zih+KnDhpwDt91LeMpGm5Ix?=
 =?us-ascii?Q?7gMl6wHnV8ed/HXK+Za8x7fW2uJiadLQwettfu+v+3TLVbP8twnjB2s4zyuj?=
 =?us-ascii?Q?s5WP25eJkrW73kZ7WjwFfumrcWz+EvS0WvJ8QNqzZeGjaeyvFS48CIFwY4l/?=
 =?us-ascii?Q?t3rnuiiWHH4BREVIC6YJsl8vPbi8pyvM4at5Arob0hdtWxcmMlAOxiwTf9Th?=
 =?us-ascii?Q?azmkSdPz6E1Jg0yyFNYPBeoUbZiT+9a9ds9t4kBhqrVtkTFwq/QCuCNGuewk?=
 =?us-ascii?Q?irtzTlHbWIuUqpLAsbnQ8CGw6mlawlDoGXhixTq8qBKNn6pFH2lUplJA2Gsi?=
 =?us-ascii?Q?nFTR92MHqP1F+ib2AgjMWz6FFKeS1DXgUNNAUn4sdw0ZriZ2jaNjXrk4dwHd?=
 =?us-ascii?Q?fiIK47+ZrYZIOnK/6gBPbcbpNjqWNj18QL0viDm+Ff2GYGAhacnsJEhgEF3r?=
 =?us-ascii?Q?7ZuTFoYT9TYcGq5FVjbH9MvMaInK0jG0osaxdMEm3of7PVXBDRSQH2PSkdMn?=
 =?us-ascii?Q?clpIJ/6/XU0bPZbwg5ejcl/pV2M0RcIOvMz61oJXspBPmyeQ7MoYex4uVVq7?=
 =?us-ascii?Q?c63BMy+47fQp0KGqIISfK1+dv0e5dDWX3wEHRNnx3PkTnwhFsbQmleN4mJ0d?=
 =?us-ascii?Q?rUWdMg/G+jkxcv2YnbvkYl9VNkAtEGmG3/k4LIZa?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10dd7dc6-9777-453b-6780-08db94c71c13
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2023 08:45:09.4988
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yAwOaD/i3nchQu+hbzcntrN1+2pLbOZLmXHnCpKDQUDhRqzkMJAjtZnoukSqUWZ2h+ltM/t/amNeqs6Wc0ofcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7743
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Aug 2023 08:45:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185514

Extend `tar` command, with additional parameters, depending
on choosen package class and target distro features, in order
to support ACLs and xattr.

Additionaly set archive posix format, in order to preserve
milliseconds in timestamps for reproducibility tests.

Currently only `package_ipk` supports fully ACLs and xattr.

Signed-off-by: Piotr =C5=81obacz <p.lobacz@welotec.com>
---
 meta/classes-global/sstate.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sstat=
e.bbclass
index 95373fd60a..ac890fc98e 100644
--- a/meta/classes-global/sstate.bbclass
+++ b/meta/classes-global/sstate.bbclass
@@ -848,7 +848,7 @@ sstate_create_package () {
 	mkdir --mode=3D0775 -p `dirname ${SSTATE_PKG}`
 	TFILE=3D`mktemp ${SSTATE_PKG}.XXXXXXXX`
=20
-	OPT=3D"-cS"
+	OPT=3D"--format=3Dposix ${@bb.utils.contains('DISTRO_FEATURES', 'acl', '-=
-acls', '', d)} ${@bb.utils.contains('DISTRO_FEATURES', 'xattr', '--xattrs'=
, '', d)} --numeric-owner -cS"
 	ZSTD=3D"zstd -${SSTATE_ZSTD_CLEVEL} -T${ZSTD_THREADS}"
 	# Use pzstd if available
 	if [ -x "$(command -v pzstd)" ]; then
@@ -914,7 +914,7 @@ sstate_unpack_package () {
 		ZSTD=3D"pzstd -p ${ZSTD_THREADS}"
 	fi
=20
-	tar -I "$ZSTD" -xvpf ${SSTATE_PKG}
+	tar -I "$ZSTD" --format=3Dposix ${@bb.utils.contains('DISTRO_FEATURES', '=
acl', '--acls', '', d)} ${@bb.utils.contains('DISTRO_FEATURES', 'xattr', '-=
-xattrs', '', d)} -xvpf ${SSTATE_PKG}
 	# update .siginfo atime on local/NFS mirror if it is a symbolic link
 	[ ! -h ${SSTATE_PKG}.siginfo ] || [ ! -e ${SSTATE_PKG}.siginfo ] || touch=
 -a ${SSTATE_PKG}.siginfo 2>/dev/null || true
 	# update each symbolic link instead of any referenced file
--=20
2.34.1


