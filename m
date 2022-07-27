Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B88BC04A68
	for <webhook@archiver.kernel.org>; Wed, 27 Jul 2022 15:45:11 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.44])
 by mx.groups.io with SMTP id smtpd.web12.21260.1658936700824038779
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Jul 2022 08:45:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=5TqOtRot;
 spf=pass (domain: arm.com, ip: 40.107.6.44, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=LIbkdRh6f3LiVFGZcZLwdgSOJnswedMuYrVuO77tbDcbWa1KWE77O5rQC5rHWnxhE7IXU3bR85cekcs2brZwzo/rInieluaQuE4gKafLThpq3rJrRIm2ICvewHXI3BWns11chEHPWOkM86xYbok9kA7xFatt9yAJP1gNv5JGVD3k57UZMPCqtYVNNsitnQve9dgTARaHcMT1Afwbnc9sIh47xO5ImJyQHzekm2wZVQFyf37a5ZTv4YkC1bt/sV2b2HooYxIItPiqFA9kMc9cQzg4g4+g/SUDRHy8wTJCjmGEihT+gpp11RNO7lAApZuNdZohKjUpcZLdSfhfJvGZZw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mUgef9T9eOVMtxACKJ7wWKQJ2mNxjgz4hbm7v0rIypg=;
 b=IIhSmBnWq+vnrYHhsKysEFBQQ7eXr8XG9Z0ExhvMdH+cdAGFctY0VxdEoMw/FRcywlVQxjTUnjG1cD8J7Zqej9TFQRizu32GtdNbsMXFA56R1YQV+Tv4rZczsjUOw7PcvplUa4ktLoSLonzGab/tDsgW2edxoSMEXrxtzDhXFE7BMNkJcvV2IGfB4G8MwvVtefgZ5M7hajJqu7XIeZT+BRhsFxMFvIsCIuEa5xgHxh5BlST1HNPlR/tfstTqykU+80cSXqdljSJ6FeVCGbOfeiKOG+oe4qvi8PkI8IEOuYCFKfywHw8yHsHjyl14rd5pl+cJuBi8v8c7sJXjX+K6AA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mUgef9T9eOVMtxACKJ7wWKQJ2mNxjgz4hbm7v0rIypg=;
 b=5TqOtRot6L2w9E4k9+YLR+57y3a7tkj9uee4k3ZBPfL1B2hGCETU8kuatSAN6lUD6I8bWv7MUsfFJw825LgSMOzUizqJ/5o7iQVnU1SRTAIHQXZd0+2GTLoC9meIdZr4MSMJp+dIkJlurMBko92gaE7kB722TMlpmR3i7JLBSFQ=
Received: from FR3P281CA0084.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1f::20)
 by AM9PR08MB7086.eurprd08.prod.outlook.com (2603:10a6:20b:418::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Wed, 27 Jul
 2022 15:44:57 +0000
Received: from VE1EUR03FT049.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:1f:cafe::9b) by FR3P281CA0084.outlook.office365.com
 (2603:10a6:d10:1f::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.1 via Frontend
 Transport; Wed, 27 Jul 2022 15:44:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT049.mail.protection.outlook.com (10.152.19.216) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5458.17 via Frontend Transport; Wed, 27 Jul 2022 15:44:57 +0000
Received: ("Tessian outbound fccf984e7173:v123");
 Wed, 27 Jul 2022 15:44:56 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 93e1a66bc2772d79
X-CR-MTA-TID: 64aa7808
Received: from 44b922a999c3.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2ACCFACA-DC7E-4A45-843F-C5667255AA67.1;
	Wed, 27 Jul 2022 15:44:49 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 44b922a999c3.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 27 Jul 2022 15:44:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jVOH1OJ6B+bKEz3+T3OQACbklALHvzsy00RYTVcUXzpxabPH4yf6je6FTPlqsW2qgjWnktxSj1bhvPMnWZ00GuNq97mmKZeHmkN/7F3k2TV1sFIHazfMY0AlbD9y/4EVGNe2aYlf6vDQ5t1ufE6+JjPoLjCLUWkoBMQwUVscgPV+kSy37ZnIqVHuRlp2NSrC3uU4TN2aIi7UD3G3pQD13Hi4w43EDQU2cAEX2P9ouExlSBQ5+defwI7Z1Bin5+KvEO3K3roa2aoMVIZk/SVoEWC4q5d2kuqMx/Ur8J+NiwmxSPeIL+T3WQupCJTpgCCNN537v2rMQjSTS8O7NzZ6Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mUgef9T9eOVMtxACKJ7wWKQJ2mNxjgz4hbm7v0rIypg=;
 b=V9JC04RE+QG1Wkj0mrZpHlAU8sCLNl6GwlBp10qy1Mm2xyNe4kimNWmnwIyux7bSrbLEjOCfmhH+YTOe7mLitmm5TW7p8khf9hru9xmmmqrA5+awy7Dxcgv0VDZ0XBIRZnN1WE+CXV9RvHnZOR1tCRSp4om8JVnkiQs/bIkDujtGOLNFmzhgc6tlxrVXOI18y0tc7dKLiCH5qPshN6jaJAwe/RWieKgpDr5plW4Z0aU9DBQ2b4yCTlCo/FtHnF0o2MCTYG/gPyH3iDfYB/dWC9Gddfn817zFIg8+6OuD1ptFprg141XaVabnaQFcvwe0Z+kw6nlOxx9icAeMBgYyXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mUgef9T9eOVMtxACKJ7wWKQJ2mNxjgz4hbm7v0rIypg=;
 b=5TqOtRot6L2w9E4k9+YLR+57y3a7tkj9uee4k3ZBPfL1B2hGCETU8kuatSAN6lUD6I8bWv7MUsfFJw825LgSMOzUizqJ/5o7iQVnU1SRTAIHQXZd0+2GTLoC9meIdZr4MSMJp+dIkJlurMBko92gaE7kB722TMlpmR3i7JLBSFQ=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB8PR08MB5212.eurprd08.prod.outlook.com (2603:10a6:10:bf::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Wed, 27 Jul
 2022 15:44:48 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::e147:1bb6:acd3:5110]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::e147:1bb6:acd3:5110%7]) with mapi id 15.20.5482.006; Wed, 27 Jul 2022
 15:44:48 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "f_l_k@t-online.de" <f_l_k@t-online.de>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [meta-oe][PATCH] wic/direct.py: ignore root mountpoint
 in fstab updater
Thread-Topic: [OE-core] [meta-oe][PATCH] wic/direct.py: ignore root mountpoint
 in fstab updater
Thread-Index: AQHYob8pnjmTY5oF5kK8rMRdiEoG9a2SXBqA
Date: Wed, 27 Jul 2022 15:44:48 +0000
Message-ID: <A08B6BB6-EFD1-425D-AC02-457EF8A40229@arm.com>
References: <20220727134512.4033-1-f_l_k@t-online.de>
In-Reply-To: <20220727134512.4033-1-f_l_k@t-online.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 2455f709-3bd5-48f3-a180-08da6fe6f527
x-ms-traffictypediagnostic: 
	DB8PR08MB5212:EE_|VE1EUR03FT049:EE_|AM9PR08MB7086:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 bsCpViYmbpG6QsTMcVmaWjVHpYDQQvL8ozyOTn70uPpAwFv5CWvvvAYwz+rzaQTE+NZarWA0OjbTp3qNSNyxrPvxm4xqcdhVvBtixESPjWdKB8hvSkYoZpigKVBg2h9oq4Nnm9CXbkt08PGzcNyp7jCuRp2adCmizM6aMborL/qxnNmJ5vqc6WgM5Zj9+8zIGFIRJrgIue7RgaGYAVVNEgn2WYC6Gh2OisEaUEO/lu4JxKvILOzUw0By+cd6XD/+LPVUIT080EFwnyDqi+T+0uKVMdB7COgYKkHSFd8nXdSw+d36U14f25zwamSFngXyuPztG82u1PiAk9PufyqWWIDTATTG2S/pGkLLz07s8UrTYmaKZFO6kfigmyJATAw2jE1k90Emu+YFUThwVn81F5yQBmy+LfLmh9fdh4alrfuHETRkEmBVUCgMG3E8gyOCOKqezaAnjw7ES4bWNuxEqKjx2o+w9cikx9L7kBWr3lqjMNtul7lAokbG1X7BtD8siMacp5CaDTthxM2H/Q8T+xOyd+rDSRLkXK139A+U/m+xoIW6aHGLHvPErceKuhmvX1NfA+c+OtUEgMh/eaOUKFb74q+kqeaU6F9x2OlLLcDodocSlqz5pdjp34DOTqlFVwYUvrsOAHPrpKLiTlC4TkTy2m+RDsg4UpC2nDMTmVZ7UcAHvsIEPnB6fmDzUCk+jaf9aNwaoRHPe5J54Sv99VDwK4HS6SqpLIvyOHo/pmgNNnM2QoPeIr7q6i2RKKQjS6/W+pbzsJmECgOo0zNuGlD/t7Nua/1RM8emYPlRaF3Fc5LyWRY93m+IxJ4K121WUqJbpq3CNa7STZFD5Cvi/8Ctbg57mEZStt1Futg7hNs6A1TtWiC8+gOVh8f9admB
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(376002)(346002)(136003)(366004)(396003)(38070700005)(33656002)(2906002)(38100700002)(86362001)(8936002)(71200400001)(5660300002)(122000001)(15650500001)(91956017)(316002)(66446008)(966005)(4326008)(41300700001)(66556008)(36756003)(66476007)(2616005)(6512007)(6506007)(186003)(83380400001)(76116006)(53546011)(64756008)(26005)(66946007)(6916009)(8676002)(478600001)(6486002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1D03F9CEA8E5154CAD80C87032EBB7C0@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5212
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	21e26158-aaff-4dc8-972c-08da6fe6efcb
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qK9G/b0Kj6ZhdSTqAPoXon2WyhV+d0OdulWGj7gtKvFMyiVUbZZhU0yJGNwYsWTmZxGftse/Qwt/jrHmlci1fSFCvI2NyanxD+A4C1WauW1SF/5ctqNv0RznF5cc4qDtIsMwyuk7uFi/TUCRQTBOVCawFxl3v7usNldgoraoTzYMB3fMB2dQc0nyXh98Gr1w52EqbkOMjzBXD/YQfmG3QIbps9VSnkoWzICcuOH6xg66jRKVpsxYbwnXqzXfhea9O1eLmVEbgwfGzcD8YB1A2w+41pr/AVijyQ3AER+3WaP1TNf+pI+13XIwqU2DEsllHpKO2xoiQcWXSxt7Dgi+tDhkmFdSVlOMOmLsnOFpSa3lbwoK9M9dE4saqv+8P81CeOHmFd08bQ8xudpF2E9QaY9RxdKgI7cqoM8N+Ig++wFVc/zMvPjqt71jh18+EVjYRX44KyP2Z0zPClkvDJb7Y+d0y0sprD/vZMFrK8WQ7Prb20F3ozSobXUroK9pqCAp29kmhnYZXcrgzi0MFWbG1WyJHbrs8BkI1GNzsdMhETE2/ZTxKXCQdBpHLXA5cN5Zi8cTE61Ks0W+FrgLDZMKL+5CtraCV4HuNwKwQ0PvKMDeZWPKbnbunr8Lr8LUbKPe4hMqJ+3lvGql2siteEU1XT93+LotSGdQ5YTzK17kErDjIbvzWSPmCJDjCWHu93ABEkUHNiHIENxObe3MOEIG1eR7UxGzPlYa9/ZlIzBkqlqwip0STmPuCp8MzBgdo/TuIVR3+YVMaJNha2Z9XcHpnxviSk2SO8KfVrZ1wUNq+ui7QLl0M29iKQG+48yQxxYrxjQQc1LLNUf77xNuulaMKw==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(346002)(376002)(136003)(39860400002)(40470700004)(36840700001)(46966006)(40460700003)(8676002)(4326008)(40480700001)(356005)(2906002)(83380400001)(82740400003)(86362001)(336012)(6512007)(47076005)(15650500001)(26005)(5660300002)(6862004)(8936002)(36860700001)(53546011)(478600001)(70586007)(41300700001)(70206006)(81166007)(6486002)(82310400005)(6506007)(2616005)(33656002)(186003)(36756003)(316002)(966005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2022 15:44:57.1514
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2455f709-3bd5-48f3-a180-08da6fe6f527
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB7086
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Jul 2022 15:45:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168572

This looks like a fix for https://bugzilla.yoctoproject.org/show_bug.cgi?id=
=3D14865, can you confirm that?

Ross

> On 27 Jul 2022, at 14:45, Markus Volk via lists.openembedded.org <f_l_k=
=3Dt-online.de@lists.openembedded.org> wrote:
>=20
> We already have a root entry in fstab. This commit prevents processing ro=
ot
> mountpoint in fstab_updater and thus avoids duplicate entries for root in=
 fstab.
>=20
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
> scripts/lib/wic/plugins/imager/direct.py | 3 ++-
> 1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/p=
lugins/imager/direct.py
> index c44159b235..75004ab320 100644
> --- a/scripts/lib/wic/plugins/imager/direct.py
> +++ b/scripts/lib/wic/plugins/imager/direct.py
> @@ -117,7 +117,8 @@ class DirectPlugin(ImagerPlugin):
>         updated =3D False
>         for part in self.parts:
>             if not part.realnum or not part.mountpoint \
> -               or not part.mountpoint.startswith('/'):
> +               or not part.mountpoint.startswith('/') \
> +               or part.mountpoint =3D=3D "/":
>                 continue
>=20
>             if part.use_uuid:
> --=20
> 2.34.1
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#168561): https://lists.openembedded.org/g/openembedde=
d-core/message/168561
> Mute This Topic: https://lists.openembedded.org/mt/92649199/6875888
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ro=
ss.burton@arm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


