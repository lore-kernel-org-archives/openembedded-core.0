Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01063C433F5
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 14:48:15 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.88])
 by mx.groups.io with SMTP id smtpd.web08.6874.1637765286114657847
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 06:48:14 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=srkrzCjt;
 spf=pass (domain: weidmueller.com, ip: 40.107.7.88,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d0MLV8vTd12B0KfPRSIzI+rX7dNr0ONiZtuMUMWEz17B8jZhSV1WdzBUsouoXzDQ4wz6DYOEgOttCNnvyJZNG3whkD6Zcg8AMGMO7I1NBQLb6jzqb9joiwfinuMfj2qEkSCwaTWfPuzOwcZil+qKbtoRgMlGMgFDrg+8fwuCHSFX0UJOWLuKSHpip4yGS9dKM8WVlTCZsZIBJKcL2cCbfO1hdj26y0mVh+lY8sfJXWHTISfTVdfizQjCRXJy19Yq+9OCF6PkimDO46LfTZGqnQlbWxMQsv844p8lGTw3G0IlBBD1CUmaeTpHAMyE8w/eAYcvCzIB6yP+XgnLXqs60g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oqt6BjPhtmSkcOMMoUlOmPnWwXi1L9ecKccpeqLq5jU=;
 b=ljnKQfW4trzbgxZQCmkOrVjpGOrShA/hJFIzBJP0twIL7aWqTcqKC8kMf5XRaAzxibK8ZXSkv3hX6MxnqoN3AMsfwLlLQskpaqP5AdzNCgFWDDFZMlmSln4HOMNds6qVfdwMtniaan3/7a+525Qdv6zTuLY9kU6fcPSamTcerMLFgscEPscVJVfTUvsO2y90fSV4uPbw7m24S7sXj1+I8ro8xV5Fl5ZplfmGsddj9a4zlo3HlShviLWEQBVERNgz9uJMzI3NUuxZJxqycdQaLpwjYWnG31mR8VelvMwQcRY11Jl+sBFFWWSJd3/KsvmT0nmmJdjSXsDLlvSx2E3EQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oqt6BjPhtmSkcOMMoUlOmPnWwXi1L9ecKccpeqLq5jU=;
 b=srkrzCjtFc7C0qr9aGoi9oxLZGz6tyhpRTTycVfKAhPXAqqiN0KiUjstfxsmX+iRqcyISnneq1WuUT4yCzsEWmKFiVaBxGxtD1d6xYQTbs1gnEozIHUuvRiceW9+eY+wtnq/cG9wx6aMKPzFCGK9r1v8fp7vVBWoQCY10QYtcQI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by PAXPR08MB6447.eurprd08.prod.outlook.com (2603:10a6:102:de::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.24; Wed, 24 Nov
 2021 14:48:05 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::f:41c4:eb10:5010]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::f:41c4:eb10:5010%7]) with mapi id 15.20.4713.026; Wed, 24 Nov 2021
 14:48:05 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Jasper Orschulko <Jasper.Orschulko@iris-sensing.com>,
	Konrad Weihmann <kweihmann@outlook.com>,
	Martin Koppehel <martin@mko.dev>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [RFC PATCH 04/15] bitbake: fetch2: Add striplevel support to unpack
Date: Wed, 24 Nov 2021 15:47:28 +0100
Message-ID: <20211124144739.2250-5-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: 
 <20211124144739.2250-1-stefan.herbrechtsmeier-oss@weidmueller.com>
References: <20211124144739.2250-1-stefan.herbrechtsmeier-oss@weidmueller.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AM5PR0701CA0015.eurprd07.prod.outlook.com
 (2603:10a6:203:51::25) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
Received: from DE10512.weidmueller.com (94.134.181.208) by
 AM5PR0701CA0015.eurprd07.prod.outlook.com (2603:10a6:203:51::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.21 via Frontend
 Transport; Wed, 24 Nov 2021 14:48:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f28df9c7-fae8-490e-a7ce-08d9af596c68
X-MS-TrafficTypeDiagnostic: PAXPR08MB6447:
X-Microsoft-Antispam-PRVS: 
	<PAXPR08MB64478942E98441907FBFE996D7619@PAXPR08MB6447.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:127;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	BIYNw6mblLX/BItwNBKcEFCGvU2q0iOCdHti8IsWFYVtgVxGFrG3Oedc0K8Yab5MI4WIR+O22Q4fTahqmsKxOQUb+HmT2UmsGp7TPmHRrnOI368q1yI39pXQ3q0HLSUcUsSX47uaSytSwYlQ/mKPmIeSH/QgnImsfrsND5BclRFNdHRk5tg/rY8aJtueCfTk7z/Pi/WssJ4bFoY+GJ1lh2KxJXmFHachqCR2dEecYqtoRtCxEoLDuc8Yp+r800RYbhyPKFdJHJAjEUeGooB28bUlhBrtxQFa6M59oVIy6CDf1YeROrrTXpgn0I6W+ukoJ8VfKy17YC9ac3DEvTEC73gHeEU3FuuUnzNVNuhQ4AgufMt9lRCEENvxC5ZUuHjYqDn/JmjdASXdNRm09ggQ5IxILRTUsW223drj/obfHOQL2IvnCK/Ub7P0K/Df0ATTtA90fCMwxx7DhVB7EdvrCEnrzy+jK4k1ZUyijridqmp24ik6ryn5mGS+3H2wT6sOkNnhAw8YWqKiw2vaiFTgz1JrLhlYba0cdPTc/minDPXdvxoSvV2z7W9YvMpcWQIdLeDRoXBj2aC8T2Cvab/WPjEM1M9Y1ewRSpLTNTb2bC2LiBUfEF5UZZm7p+p/r/6bL0qHPM59XSWDqxqfMbBAjwtXeViqn2HYGhDKSj14aYlECLLy4efnUStJaf9jSigw
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(508600001)(7696005)(38100700002)(38350700002)(52116002)(110136005)(2616005)(956004)(66476007)(66556008)(4326008)(66946007)(36756003)(186003)(26005)(316002)(8676002)(8936002)(86362001)(5660300002)(107886003)(2906002)(6486002)(1076003)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?28lvw4V4Von5cSlPm8RWVm5s2eYJDePxa7RnBcmosXWA4qSPOffYzxU1uDWm?=
 =?us-ascii?Q?dpay4ilKyJ0MWrDGlj8bwMrs6MmhlPcB2ie1WiexV0mUZvGszHABWIq+7HB+?=
 =?us-ascii?Q?HJTU51Z/UIaab2Vp8DVDEP5Vh2ziOkSpQbPYtQo+BdGCBZNTFRfZSjEhvcvV?=
 =?us-ascii?Q?x6vp+93XSRcNqLJK7RzRtTNk3vcr/xH2lJ2MNdMpwMZ4O6Db5hcYYD7cKBWz?=
 =?us-ascii?Q?gG4ErptiO3mInZlBQPFrQpxhQRx5jOD5r8i26iWZw00w3bFrVlpolEUhY3qa?=
 =?us-ascii?Q?nWAy/k9mQawaS4xlF6sfj3L5Y5VRlIdlUncSsWQChFukk7CBgCmQd9AnYVsn?=
 =?us-ascii?Q?7IEgzO/zdlwHDhmvW9vrp8Hhnr99C1MyMFyS6rM5mhu+t0Nh5tuDPM6sW+Ge?=
 =?us-ascii?Q?La5Fxs4ftBS+48IkdmLA+MpgUVlvBrjIH8nMG95amwtByGtDWkfeVysdBWti?=
 =?us-ascii?Q?5qllwOSZMG2+mMbXLyee5omB2kug549liNrv387DikuzbWxuPNF1X6UqgHhT?=
 =?us-ascii?Q?ww6Yi6eDG+8Tbn4w8sspkwCXmoZ920R+qjH55xN9fUT/o7dgPYjU8uKLUgME?=
 =?us-ascii?Q?pVS+rWx69sccWHTjW5OwC3tN+gh46gB4zeJtnKmqwUOgyHghE9NK6MhrgTSb?=
 =?us-ascii?Q?mZ+7/fWO81cLpoCMmuHqtR/Tbil+O2NBJf/URPLMmaYwdlBXj8bzZ5hCXvCu?=
 =?us-ascii?Q?pWVFsKvzUixdhqrPW9SR5ie/QJzhDTwdK/sSShXq4awHncpj84KwANaRlMlT?=
 =?us-ascii?Q?uxadoZefgG2WOVnoHbICEmN25AoVLKS1V3mBoDy6waHERXFvrxB90lEivVtC?=
 =?us-ascii?Q?xS/eLxqWHbskYaR8EKFPpF05skApwudQY/XOeDSj/SjTtThRf1O0A0PFt8VW?=
 =?us-ascii?Q?FX7ZF6c3Rh22NJrdyLLBWAEmP96/65RgIKpM9SvagOyQgun/p2mKL5zUAPSy?=
 =?us-ascii?Q?n+JRmfu3nOisbA1lTp5rANNF6fCO2Kt2ogDPHUCrZnqhcPjuAD6oajTAlXQv?=
 =?us-ascii?Q?ZRbbOk0UPfnXrmVHEYqVjqE2H07ys6o4tJGlCw4qdktxMkNhLGNWjrycHUEQ?=
 =?us-ascii?Q?mIFjzEN1u+rISNLHby2w01CTopR1FSeuEWswhZ9KBobtCJ0nJqSuudJdVLHg?=
 =?us-ascii?Q?gSHYLukcIDQ4GgavG4bTl1o0BQ3hGCtAbX5jKHJOt5AxHDFtfKr1MxEZ/X1S?=
 =?us-ascii?Q?HIQVi8RZnKElWcM+VQ00Vm2miHykXceRm1U9hAvwjzS4ikPGva97nRX7IBt2?=
 =?us-ascii?Q?/oMmDbvKtyHz6e4pCND/woq3bS4GerQ2Y3wRD5U/BibPjNpVeNCCrfshhV7I?=
 =?us-ascii?Q?75B9yjhq+U+XNQx6UI7Rgb7qnaTZbR3ONJMalG+1vpv/TVrA2TpuMFD5j7q3?=
 =?us-ascii?Q?D1cZR5Q6204/bxmmiEiXkiqm+ljXIqRxT7ZYq6NEl62e0XQ3tPgDms8yiA9Y?=
 =?us-ascii?Q?n3oWy87XWAASqsmty5U1c/Ihli4n/Kd48FWMcgmdtojE1Hzf6L9Nyd2cqufK?=
 =?us-ascii?Q?DVo+X7FdqB8H8TqE3GAgsK6zMlKuPAvKX1KfcXMZCejmQM7+27uIQSGnFxCl?=
 =?us-ascii?Q?kQO0PdP54x7Ac+9XAdrrc458HhwUk9tkcWsIamcF90wHeUuG8BVmCjTYPI0+?=
 =?us-ascii?Q?6mP8auayznefyCTGLJGU5Ig=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f28df9c7-fae8-490e-a7ce-08d9af596c68
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2021 14:48:05.7176
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 cAb1qnE8DnbINWOhhuAKDL8Ec1mvl2TtZvPvaUDY+apU1OLxnar+Mf+45R5mEq0ojyOVWbxO/m9Sa7q+YV+HZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6447
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Nov 2021 14:48:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158703

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Add striplevel support to unpack tar archives into specified sub
directories. The node package manager (npm) need this feature to unpack
packages into its node_modules directory.

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>
---

 bitbake/lib/bb/fetch2/__init__.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/bitbake/lib/bb/fetch2/__init__.py b/bitbake/lib/bb/fetch2/__in=
it__.py
index ded3106173..05b2d2e924 100644
--- a/bitbake/lib/bb/fetch2/__init__.py
+++ b/bitbake/lib/bb/fetch2/__init__.py
@@ -1462,6 +1462,9 @@ class FetchMethod(object):
                 cmd =3D 'tar x --no-same-owner -f %s' % file
             elif file.endswith('.tgz') or file.endswith('.tar.gz') or file=
.endswith('.tar.Z'):
                 cmd =3D 'tar xz --no-same-owner -f %s' % file
+                striplevel =3D urldata.parm.get('striplevel')
+                if striplevel:
+                    cmd +=3D ' --strip-components=3D%s' % striplevel
             elif file.endswith('.tbz') or file.endswith('.tbz2') or file.e=
ndswith('.tar.bz2'):
                 cmd =3D 'bzip2 -dc %s | tar x --no-same-owner -f -' % file
             elif file.endswith('.gz') or file.endswith('.Z') or file.endsw=
ith('.z'):
--=20
2.20.1


