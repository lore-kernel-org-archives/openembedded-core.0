Return-Path: <lukas.funke-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65F85C46CA3
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 13:52:56 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.59])
 by mx.groups.io with SMTP id smtpd.web10.32904.1701179563652080413
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Nov 2023 05:52:48 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@weidmueller.onmicrosoft.com header.s=selector1-weidmueller-onmicrosoft-com header.b=ujJopc2Z;
 spf=pass (domain: weidmueller.com, ip: 40.107.13.59, mailfrom: lukas.funke-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eHdSadx6Abek7RgKsrh2OLjXB5Pp1Sd4MPOIuj1d8VO6wMM6lhK0uUwu68E/SwyOTOlFA6z8viPHfT2b7ivD+5Un/LW8gqXCnCXqn6PNyrNT2guO0q2pewWHx7Tbw7ClxSgWMFZ27ONtZcVpwiWuFfAulG8uy/IHU8eHbv2r9q6k29WtgjM+mEbJAWxUa6hUxBcwx2VIEQSxI4MZMoc68rTDswq1BybvseqUQxBJjBA+Watb+vbqMEm5HPCkgvz7sBQOMW07j3GHaVWsyV1Iws3JQGuaVivKBw+YNiOAMMK/VAGdK3hbiZgsRsvqc2SZETKB4LCsSUHgDqmCGW0cbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fG5uByH2SyeZ+4VF1nalw3faKOutILdWUVrJSEN/JPU=;
 b=KxJDA5TvPEHmX2LDOg8A0NApQHRBp3TdfhyWmFfEeGkEcGeFA1oDnVCDAH39GabIP28QhBimW4RaVZ+0IuCTnJzEo3cH4G3uDvCtitiM3eCGOZXkJmbEIMBhsDbgXBgALOKBH+33p6OAIO7HLOMuB7aadd+SOgtUFrpkJLHnub8uBS/WEzzaPolE95RPdtNTEeOluZoGbXZ4Q5gaV5qWqXBZglU1JHALtDqFajiFdZq4f3Kyfli0p8pbY0H/FG3nrp+IHP3qnZYJBQI64JdGESsIs3oFDQZfQIg5VOKzH9F9NJzAQlukfYqGEHV0VMs4SKMww1XJIUPkh1uczePEHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fG5uByH2SyeZ+4VF1nalw3faKOutILdWUVrJSEN/JPU=;
 b=ujJopc2Zn6s+I3IzZuyKycStJ0/B1aHghOpOhMELIEvoFikygzhl60puhwVn2uAvQHz1BVDtkHN/sMIeiJV6fI29Hhvik1Viv/HQ66K6CxF4Q5/tJUqhgGcenv/OoMOlCpdeDlOlNfb10M0eZC7Q9HLXzfBV1VW94C7f8bBQz44=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from AS2PR08MB8431.eurprd08.prod.outlook.com (2603:10a6:20b:55a::18)
 by PA4PR08MB5968.eurprd08.prod.outlook.com (2603:10a6:102:e9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27; Tue, 28 Nov
 2023 13:52:39 +0000
Received: from AS2PR08MB8431.eurprd08.prod.outlook.com
 ([fe80::b914:d9b5:6462:13b6]) by AS2PR08MB8431.eurprd08.prod.outlook.com
 ([fe80::b914:d9b5:6462:13b6%5]) with mapi id 15.20.7025.022; Tue, 28 Nov 2023
 13:52:39 +0000
From: Lukas Funke <lukas.funke-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Lukas Funke <lukas.funke@weidmueller.com>
Subject: [PATCH v3 0/2] wic: extend empty plugin with options to write zeros to partiton
Date: Tue, 28 Nov 2023 14:52:30 +0100
Message-ID: <cover.1701176186.git.lukas.funke@weidmueller.com>
X-Mailer: git-send-email 2.30.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0261.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::15) To AS2PR08MB8431.eurprd08.prod.outlook.com
 (2603:10a6:20b:55a::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR08MB8431:EE_|PA4PR08MB5968:EE_
X-MS-Office365-Filtering-Correlation-Id: e5011815-5211-4ff9-20d9-08dbf019490c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/Q8LSsAkpTsK89bdyk9bOVvbcy/KMOL3rOy7xPkoOC1W9sd80oh0bOUlfG9h40nt16yF5JnoJpEybXOuHBH+jH6QWTU++J88li/UC9wrFbsfmyOadRtwPfSNDyKqcrf1gHwQIYypsGVo8R2L1l5j93+T7N7+WqzoDNfPT62jgo9wKEaUh/0iovaUuY1uoe9Q9+7u+xrTTP4MFnB8vFiB5SDKQsXlo4uRGTDJrwRUlJajuhtHCv/VA94XHrnYmMlJUT5aAgukCFTRp4BHLCL8HizrxoCEzDOJW3LUrpDzNA5khZZzhNlBieDrNrWZEWi5Oh6NqtXuaV9E2KjLQysjTSJMOZB53q5x56JxSCrmnygc6DfOyhjTdue2ZP6Ip6TCsn1T0XtBeNAx6D78vxFezWLTymUxPurznuD8SUkYlKcHnuv+7Wm9uR+qEI9ruYUx0owhNs1ZRDEAlgGTs0Zp+wV5AYVt2eUR3grIBaLUvTFNiAQkSbmXTh16IR/xMDNRiJ5auYgUIOGfyLJOpMQqEmjyTvdEiTnmqcQTBJE3m+idJgp2ABQBP1uB64DaeOiKOjqloowwd1/5JJAeURDSJKAvKeOA/Qbi3oq2eufRGr2CJTqgdHVltz6bwpLo1tDO
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR08MB8431.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(39860400002)(376002)(346002)(396003)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(52116002)(107886003)(6512007)(6506007)(478600001)(6486002)(2616005)(6666004)(83380400001)(2906002)(5660300002)(41300700001)(66946007)(4326008)(316002)(6916009)(66476007)(8936002)(8676002)(66556008)(54906003)(38100700002)(38350700005)(86362001)(36756003)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?HM8V2CPszLOoRdlg4b48tqh2h1axpTh6eshimC5sDa7fONWK8A9HBOU46m7K?=
 =?us-ascii?Q?82ScHcBUkywStnftZ/XVoCBQud9ch3xBRPv01K9gcTyjkbi4FiwCFWWOuGRg?=
 =?us-ascii?Q?zcs2Cuw4zydbOskn5YrrUScK3m21oKP5Sr4uYwckRb6RBXkGDDbafcxQH2G3?=
 =?us-ascii?Q?+Df9oUtVf/puPipYWMBWk2bst8dDm5GUNpSG3JrVYXDG7G8/HM+tjMuszRi9?=
 =?us-ascii?Q?NRHIiySO/iVEp8UWFW6xT5gEFLGOJqvolsh9y7Zt4nnf35U4esRwXbZw/CDR?=
 =?us-ascii?Q?/RSUYg4iRDJEkzF6tZ7eloS8TYH1F7mmNVNEBCV7Ym14WHcOYVCMbOpFDxJU?=
 =?us-ascii?Q?j84+zPf2h22i5Flp6KK79HD2WR1u0MkFaPugcapdlaheaZIDockpWrsB3x0T?=
 =?us-ascii?Q?qMVaumfK0BFDPSVwytru8Desld5GZfe7tOU529YfpQApfbfQt/Q08ycNQG6r?=
 =?us-ascii?Q?MumLXim8FVgRjuYJ2LlCZbRE57XFNxFHPEX642JJ0KSPaNgtWrYC9BuZEGQV?=
 =?us-ascii?Q?bru1ky72QtgC+s9dZpKFf39lop40q2LkpjnevEi13xRnTQr9Xpkyggs4x1r1?=
 =?us-ascii?Q?4558jztPmtSNZSMAU9iti/9B42SSZatwmPT4gI3pyTkC35CbuJoj/6fMWS4n?=
 =?us-ascii?Q?bYv5U/Z0bOtW+1e1bNe19+MgXctDqq5rsZXpHBkTWoqp7LHvEotGvre6No3s?=
 =?us-ascii?Q?RBw+P0ZHRzljInkbynfoqfGzcxnE42tcIVbHWlwVAIuCZN7bbV8lgdaCFBoB?=
 =?us-ascii?Q?xh24/FqaZYCxvsNanOz1EbU653GawOXENdJMv+B39AhF8feXLS4T5sNwifRI?=
 =?us-ascii?Q?kU8XLsvn6RDvnvomgi5FAYEaw85mUGDulnR4h1nJVTNhAH8I2zeb80zNUlRf?=
 =?us-ascii?Q?8ynW/P59hEAiaR/rLqy1iM3VthOC0vFFP9PJpr3xYY7+RqRvI/Wtf0WvBNic?=
 =?us-ascii?Q?KJvxEpoq8CmXZQn53RatFB2x9TpANnmxaIqSx+5ZpvMq+DqmCjVpBiTpHvLe?=
 =?us-ascii?Q?7riww3ajVmKyS4ogl+WprzD5OGtsRZbSX19Gf3KqL9PYQ/hVF67I5Nh9QlJ8?=
 =?us-ascii?Q?5buFs4/XT8SMHm5tDuQgaKBbLrhstOs9ZSzZvh5Hs9Hh+5GQUqz6oGalYrhm?=
 =?us-ascii?Q?jsThnt22Is3Bsl1KLV+Gu+El0PYO69r4gEhrVLPP+HMFMMviKt2hBD+HLZsn?=
 =?us-ascii?Q?TgFA7ojgLyM2wEPbKlo6Wznobay2RH1y4JgxpcMdgBlrJOxrTd96EgCoA+RJ?=
 =?us-ascii?Q?4CBMP5Gz06oWfUnmLtWNX9VyGTQv9cBMr0gWtT8LBRpRHVB/VpxLS2lpXEvD?=
 =?us-ascii?Q?c8bZxu/jwggVm4y3yaWtY4dH0z98g7ajoWO8v8xRt0/dT0uZAWfkx2dnj4Ju?=
 =?us-ascii?Q?gtcM9hZpJNeY+n13WjxMsWeuk8DV4U6M3ellNLUSOUKI2B/cS0j8kQPTuHxP?=
 =?us-ascii?Q?e4FTSWuEA7xmSvAcE74ZsJqlWPyNcTIAkhWRpc8R49andivn+GviWBOu6NzP?=
 =?us-ascii?Q?7NEJmu1afplsvKR3hQ9+KIS0z1Qg23JYZTJ2gJySDgQJtCa1k7CzelIrVGPb?=
 =?us-ascii?Q?GLCw1WTcdJH7h49ZwDz2UeS6cciRsyEDN6dwJ6xxkJW9rNAuOtrPnDk9si7L?=
 =?us-ascii?Q?uA=3D=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5011815-5211-4ff9-20d9-08dbf019490c
X-MS-Exchange-CrossTenant-AuthSource: AS2PR08MB8431.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2023 13:52:39.5010
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aQabWfujXhGyn9FFiX+YF6bBUh1cW3giIHglZMeFFxnlK5WqHFmpqCpu2pl1LK//dpuwoJFt3SScou2+rGa18g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5968
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 13:52:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191372

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

Changes in v3:
 - Add testcase=20
 - Fix interpretation of --fixed-size parameter

Changed in v2:
 - Added SoB

---

Lukas Funke (1):
  selftest: wic: add test for zerorize option of empty plugin

Malte Schmidt (1):
  wic: extend empty plugin with options to write zeros to partiton

 meta/lib/oeqa/selftest/cases/wic.py     | 36 ++++++++++++++++
 scripts/lib/wic/plugins/source/empty.py | 57 ++++++++++++++++++++++++-
 2 files changed, 92 insertions(+), 1 deletion(-)

--=20
2.30.2


