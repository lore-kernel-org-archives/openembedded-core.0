Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79748C433F5
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 17:01:06 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (EUR02-AM5-obe.outbound.protection.outlook.com [40.92.67.38])
 by mx.groups.io with SMTP id smtpd.web10.15459.1645549264889030724
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 09:01:05 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com
 header.s=selector1 header.b=Gj6BvX+8;
 spf=pass (domain: outlook.com, ip: 40.92.67.38,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=epaUJeaeBV032lSFQ/TJBPJPyKjxQRrhB2DfbSlFA/GPHf36bgtHKNVfmTXBpZt1uXUW5RAZawA9VodYfjDfUWdPtEUF46cVk7Z+q/QLtQkFrbKcv1utxopJcfvtLaksobAkTIIdx7Sb2iCqRQQj8npfV7441CPqPdIhwUcoI+rKhCOYssjf3N3HJpMyiSaWkZI554TCAM4G0IxGpKUaGfKg6toboYW23RFA3pMAv81PDZDFTxGONVo9xSy2/VVYKiM4RJ1ujBrWA6xhF9J9M6tfqeNCJQ9wCOChvd8mZh4df1O+7iqBJZGygH3dWV7X2EoBky5l01oCClZcaokWOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wWEudVVi3CVlO+c37Mq9eGIhJiQvITuy5nlly5ONbHo=;
 b=Txx4alQdbFSLfU+nwydPlUvFcpk5MAcqYjlNFuHcKfBPrdKlPR6A2IaOZuOvo/hBymkcmED+Czh4yKQUlITSz7EC5TIFQoBYJo9hrzLaRi21p6Bh80cJv7ska1RPL1XMD+ueoYuxpaxHhnxhqCL8nsggSKjQdas2kunqtfkgNmeM9QCFvaiAc0l8ChugMhteErdVtNwWhFxxyvugyS/eIqMhEc3mQ8drVJwkjbnIz1XTbCjWATnEcNkxKtczVJvjojERuqmo57kmUs1Rwlw6vmF5E939GYUTeBM/KluXquGJFK9BPs6DIrP7f4BnP1A/Z3U1Z0ZPfLfT1SIsQeKBpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wWEudVVi3CVlO+c37Mq9eGIhJiQvITuy5nlly5ONbHo=;
 b=Gj6BvX+8U37Dj3FLBLfLJGmbOSiMmWYtqu+1Nzsf7JVsUHV3C0mLLL/qmgag2aR4jerB96EcL5EWoUk0SjkJY5i0yCi/3Bp0CMR1ivVxEvHI39HQ+97voBhgrYcECbxw4IfUlaMaQnP7Tfu3PWcBJPBASPp++/pSXRKzB11xT/zmLC/fgkIalYzkXjUnnyeJw5/sMAsBQg1QTUtInX4VXbsZFI2ab5f1jwhurSITV0a7M4e+/O9zHzmPOBARbNBWvK2t4ZC27qRYwRR4TjQpRLLe4Ov6oEjaYw4x+KkfYidzlUCbm34dZDj98SqOdwAfetBLmL89VCNE2qHfO/iKfg==
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
 by AS8PR09MB5356.eurprd09.prod.outlook.com (2603:10a6:20b:37b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.15; Tue, 22 Feb
 2022 17:01:02 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::e8ae:b245:b019:195b]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::e8ae:b245:b019:195b%6]) with mapi id 15.20.5017.021; Tue, 22 Feb 2022
 17:01:02 +0000
Message-ID: 
 <AM9PR09MB46422A261797175C38175112A83B9@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Tue, 22 Feb 2022 18:01:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [OE-core] [PATCH][RFC] cve-check: add lockfile to task
Content-Language: en-US
To: Ralph Siemsen <ralph.siemsen@linaro.org>
CC: openembedded-core@lists.openembedded.org
References: <16C7F41596656732.11018@lists.openembedded.org>
 <AM9PR09MB464246FE3202004DD91EB054A84D9@AM9PR09MB4642.eurprd09.prod.outlook.com>
 <CANp-EDbCpBLQ6t8SKwu9k50imsBM9oeOBBfuRXHdnKg3P=7SZQ@mail.gmail.com>
From: Konrad Weihmann <kweihmann@outlook.com>
In-Reply-To: 
 <CANp-EDbCpBLQ6t8SKwu9k50imsBM9oeOBBfuRXHdnKg3P=7SZQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TMN: [WsglTmYIpMqzOInVzEqmj2YuA0H2FfYuPoDCEbRrmG0HrPxo7vwrdWd6/mpTaHwl]
X-ClientProxiedBy: AS9PR0301CA0038.eurprd03.prod.outlook.com
 (2603:10a6:20b:469::9) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
X-Microsoft-Original-Message-ID: 
 <2015da8b-5a01-6002-3e07-c4d2dba6263c@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 424a91af-01ce-4ff1-1acd-08d9f624e7b6
X-MS-TrafficTypeDiagnostic: AS8PR09MB5356:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	BZo7Xt2faugI+kT1HA8DMEPmTGUeyKu2LSTyEoATvtWKJ1aLclQ9X74Djw6DHldDUXwwg+Uv27/mHGBQHaK3apyTTK7fVTBQEC/J+SNPGsopVYNkAUgktyrIaFs6dvwLiUW//BL4zI4mClLgS/zmWXOCoj5czagQCqGDYSBnTKjtulWAvZhkKuImYUF5jdIMhplqmFnhGEXQhVgradWV+DGsWGl0BB3MwblgAs5zuJrgtk/rOLA1pU22tvt4meI7hsCFKOwNU/tv2dHKmNB3N6uTw6Fr3D4kfVncI73NQ/qdztXGDG5yM78PWt31VLgHduLfNPr/NvXANctbz73L+nB2areo4QzLoORbT2SxhrbnRSfudE7aWT1F5uJ3cg9faB34iiTP7wHYim3Q33q/wqzqTo/V+SdodBUsczXQTbyQB0+4TdjDukURLaXJjyDeHLurHFosyytpy8Zl9OUcg9hz9VT0e5An6WVXIWcmYsGxOt5m7rKu6yYxp0XN+WCG0z13QB13hBXcmuIavQJpIXA08EIaVtOjahn1wtCwWrjErE61JGd86P5vAK0lKxlhWs+ypEWhDdecSpjLQu6+2pDeCP2oRXX6OyKn2lX4rB1Lsa36nFze5KnMkWeOHQ6FPiLbhBENwV4H6HhvPsfCrv1N1L3LRn7V+Jwdvz8xr+c=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?0IaHVLdarxayqhHWyLqpXyksb29Ed6SlHd19YEBgfJQF6vUTcVGuwGOVyuzA?=
 =?us-ascii?Q?ykP7gBHby8e90I1uzN+aGoGzqGAl2wD1QZC/VvbV71YI1IcOs1xxopQyGhao?=
 =?us-ascii?Q?wjkKRSXewo9ZsVyCItVtWuLj3gfQTFfGYM0CcSb2SzRpFblQb9Xz19X4eZmm?=
 =?us-ascii?Q?ZHOakujMNgVNeIkexCJ4nC2w6Gd7fdmX1FcHPQQ7THTBOpBraZOcG1bBdc3A?=
 =?us-ascii?Q?hrzo+I6gPCujPAeLHJEoF8ZFHxbBAvy4tgdvlL6ARCbNa6Rm1tkkEsc4mbTk?=
 =?us-ascii?Q?Fhuhsf3kFxnlLoxL2zRtSarreJTTrftUZS3RkxIYQht7FSAzs752hgrPcsd1?=
 =?us-ascii?Q?oI5R9ZWMZkZSy31Pkkz4IhnAlbpVY8VI/sbtOxTcqQtVfDm3QjctD2BQdHDB?=
 =?us-ascii?Q?VxQfDlfza6mva6+6mBrwVPdz0Dwe1ygwsPwA7uDjvCAVIoX84ObdexltnWHK?=
 =?us-ascii?Q?KPv75S1Nq+8VWJbvzCh4MhU3WQOb2OTR+8PeOfdkCcQDeMEis54+fNEeQLZG?=
 =?us-ascii?Q?6b14zFQuxMClu2RISrNfhuVlKsC4jxe2WzrWyWT6OQNcz3VMJDmMRgnm15t5?=
 =?us-ascii?Q?vw5BCwBFi+ocGpnXPE5NSWTOlRzW+sktjjcESA6uav3VNJ4zSrVcP+4pY2yR?=
 =?us-ascii?Q?maar4xDnjDlj5QXdW57iOCOyj5qJMa1Zzf6ZjyjpJy9oRLPcVUv59NEPwZpF?=
 =?us-ascii?Q?QF2t092m7AsCHgsMANr+HZIBi9A46PlxllJaemh3pgL16eeBIXH8kC8bCPMB?=
 =?us-ascii?Q?hL3QbP+etBNBE90AAMEpbmXS8f359ZKxcrI/D58Y/i5fxvM48xAH1t7Tc8AL?=
 =?us-ascii?Q?4EMjqx4P3Sqnn3UfP1CqxQM59AFZctj2Xe/68oSkcS+704MuxnOPZraOjpZq?=
 =?us-ascii?Q?H0EWDp6XguVEZnd2CUeytMSXROUG99A6+WYDCzzO1yevY4MCR5SjppxzesiP?=
 =?us-ascii?Q?EQAHYY384hIh8mnYGsxJiloFIoXlIH9Bx7W0EtVgj2Q6a3S3U82TGUdY3Gxi?=
 =?us-ascii?Q?4lML0TPd8YJJED+qjLjuBGfuGQ=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 424a91af-01ce-4ff1-1acd-08d9f624e7b6
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4642.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2022 17:01:02.0268
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR09MB5356
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Feb 2022 17:01:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162179



On 22.02.22 16:50, Ralph Siemsen wrote:
> Hi Konrad,
>=20
> On Fri, Jan 7, 2022 at 4:59 AM Konrad Weihmann <kweihmann@outlook.com=20
> <mailto:kweihmann@outlook.com>> wrote:
>=20
>     On 07.01.22 10:48, Konrad Weihmann wrote:
>      > this should prevent running into the very rare error
>      > sqlite3.OperationalError: attempt to write a readonly database
>=20
>     It's also possible that check_same_thread (that defaults to True ) in
>     the sqlite3.connect causes this (see
>     https://docs.python.org/3/library/sqlite3.html#sqlite3.connect
>     <https://docs.python.org/3/library/sqlite3.html#sqlite3.connect>) -
>     I have
>     too little experience with sqlite to provide any further input.
>=20
>     I'd be happy to get some feedback from users that do have that
>     experience with sqlite in a highly multithreaded/multiprocess
>     environment. Or by people that use cvecheck class in larger setups th=
an
>     just core.
>=20
>=20
> Afraid I am not well versed in the internals of sqlite, so I cannot=20
> comment on that part.
>=20
> However, I do run cve-check on a larger setup than core, and after this=20
> commit recently landed in dunfell branch, I noticed that do_cve_check=20
> step is taking considerably longer than it used to. I have not=20
> benchmarked it carefully, but visually from watching the console during=20
> the build, it seems to be somewhere from 2 to 5 times slower. This is=20
> running a native build on an ext4 filesystem (not using containers etc).

This is somehow expected from my side tbh - as the lock file disables=20
any kind of parallelism - so just one instance of cve-check-task can run=20
at a time.
One thing that came to my mind is to move the created CVE_CHECK-sqlite=20
db into the recipe-sysroot before running the task (currently it resides=20
in DL_DIR), so each task would run on its own copy of the db - that=20
would avoid having multiple access call to the same file while enabling=20
us to remove the arbitrary task lock.

>=20
> Are others seeing similar behaviour?
>=20
> While I am writing, I should also mention that the CVE JSON feeds are=20
> apparently going to be changing (again).
> https://www.cve.org/Media/News/item/news/2022/01/11/Changes-Coming-to-CVE=
-Record=20
> <https://www.cve.org/Media/News/item/news/2022/01/11/Changes-Coming-to-CV=
E-Record>
> I wonder if we should perhaps move instead to using the git repo:
> https://github.com/CVEProject/cvelist=20
> <https://github.com/CVEProject/cvelist>=C2=A0 (existing v4 format)
> https://github.com/CVEProject/cvelistV5=20
> <https://github.com/CVEProject/cvelistV5> (preview of upcoming v5 format)
> This would not solve the sqlite locking issue, though perhaps we could=20
> sidestep it and just search the json directly?
> I guess I should really start a separate thread about this ;-)
>=20
> Regards,
> Ralph

