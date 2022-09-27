Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 683F9C6FA86
	for <webhook@archiver.kernel.org>; Tue, 27 Sep 2022 10:32:23 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.81])
 by mx.groups.io with SMTP id smtpd.web11.9391.1664274734459268027
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Sep 2022 03:32:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=7IKtFzH9;
 spf=pass (domain: arm.com, ip: 40.107.6.81, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=cPtYn4dZjrxJMbiQ1qdgm27XorwNpSphjk53mqnVjPyqKB/PO2RV7oLviaiWker5blnFj9AqekwPD6BT825wiLMBz8dj8FHrjPr2kfz6IGniiWPjYO2wa3HGZDAGiRtO0nvjLZvjb6jVVVZNXsNxaZLM6B6IxUGCOhLArLqsSIsL0VXkKjI6v94MIRq5dOubMttPoLiA8vDaxifJDb3ZG7h0g5KF6GC839moROG153RAX2tJ+rut7sRjmqS/0Qq5M9UX5077BxdMK9fhlmeFAY1E4qPwdSMaO00LmW6eriW3FN1e4rguBdvEEg97TcUdshsMetZPFbS4bqSn1vjMpg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CT6OUgVf/N+db1QhE25ynK2oh4LRjtm2BsX8ES7HHpE=;
 b=faLDbUEA00hrJmr4uvyzF2zlC3ei8K3q6RlMuI3YPEMykZ7gk+xtMEDuDJ2NykS3E7RJ1Z0JZcwRuLi2P54zJRfO1KklU2zuwfGvgq8Z069NVj7Z3dOpm356NjdKPuXuL/Q3x2MEV0HhDzyITLnJEth+hgtxW0pLQR7F7FgSz6Nbjebpo3PLLTuS9WDljmUkDOZDoTpQaLeivwuypUbChKwhwPTuRBviwbUSWkRGhpmfRnOTdekZ97zHFgO+OTEN3bQa/htrZOQGC3yCjvapSrisYmAgrhcZyLDFM04Wc/9O2z0t1K7tDC8POvDuUxv97kEmqy1nebfNAwP5or1BWQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CT6OUgVf/N+db1QhE25ynK2oh4LRjtm2BsX8ES7HHpE=;
 b=7IKtFzH9Bwe5sSvg/mEohrn1depjeOSHH0dIifF+Te+i27tOIDb5PS1YrzceepaIpXJDPmZXHvoMGLXX10DI/52vLVOd9yhkqL+n4zzlCXAwu45ELwasEWwh35uqlmd4WqRFKAJmytjMkE62qSknF77Vy+Nbqk0Z9pjDth/pcRo=
Received: from AM5PR0502CA0011.eurprd05.prod.outlook.com
 (2603:10a6:203:91::21) by DB4PR08MB9863.eurprd08.prod.outlook.com
 (2603:10a6:10:3f0::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Tue, 27 Sep
 2022 10:32:11 +0000
Received: from VE1EUR03FT050.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:91:cafe::1d) by AM5PR0502CA0011.outlook.office365.com
 (2603:10a6:203:91::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.26 via Frontend
 Transport; Tue, 27 Sep 2022 10:32:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT050.mail.protection.outlook.com (10.152.19.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5654.14 via Frontend Transport; Tue, 27 Sep 2022 10:32:10 +0000
Received: ("Tessian outbound 7761be2ecf00:v128");
 Tue, 27 Sep 2022 10:32:10 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0a01a9786548b509
X-CR-MTA-TID: 64aa7808
Received: from f3988c3309bc.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A0C279C0-1C31-4286-9197-C208463109B6.1;
	Tue, 27 Sep 2022 10:32:03 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 f3988c3309bc.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 27 Sep 2022 10:32:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sbkhoal0E5Skq4hPuj82tf5flCa6268sTkV0ZTB2i7o3jy/7cXuetIe3CXffinpwgIVeJvzDEIq5EEv2sxvbycql+k2+AuZtPgItNr3r6fuTfE8eDJ1eE2VKLj/Mcx1Ve1OInP/PQ8wanMb/G9EnwEzXeVdwhkwUL+hLp0datGbE1MUkoAVg743ssec3+yBy8Pvsr3tg+f/M2k4UmUeXvQSBg+7FLnrIUpNV2U2InwSEL5Jg2Nxg8To6QO+thDzdyc/vG0P82wUM1A8gjKodmBFtdmB7Mofrb1a1g5ev2YweneoJwGCp5jDIAMnOrbKcptA2gDSbZR75n+vB1EyRuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CT6OUgVf/N+db1QhE25ynK2oh4LRjtm2BsX8ES7HHpE=;
 b=lZiB4RqC/yNQnCg0mpramh9n44qbi8vvu/ODAHgnubCHjpy8XAe0fBGcWKvwlw3RQq3DL5HHsvVrlFwIaVnmzqVxJAXTkmqhmcUMkeA2AeeSux8zyRvpGXdSIHDKZThk3W3ULL1KfiSNaCKnwES8+Xm52zGEvaZ923Ls+sDMiscCVE4enu+g2Qjgj0TDrX0/4j2b61hmMfuneXtLSzygdTuEc0IC4XfUU8wxH8dfiGCJhsgQAKxz9Zsb600WyQ0lgn2CWvzYB1e3OQmwiZoesq8mAxB6ergXRAliFO2OtUQssgNl2KkHZZzPbrbDgevijvU2LVDDDJ5yd6HlCGPghQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CT6OUgVf/N+db1QhE25ynK2oh4LRjtm2BsX8ES7HHpE=;
 b=7IKtFzH9Bwe5sSvg/mEohrn1depjeOSHH0dIifF+Te+i27tOIDb5PS1YrzceepaIpXJDPmZXHvoMGLXX10DI/52vLVOd9yhkqL+n4zzlCXAwu45ELwasEWwh35uqlmd4WqRFKAJmytjMkE62qSknF77Vy+Nbqk0Z9pjDth/pcRo=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU0PR08MB9052.eurprd08.prod.outlook.com (2603:10a6:10:474::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.24; Tue, 27 Sep
 2022 10:32:01 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::559c:f19f:f674:b553]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::559c:f19f:f674:b553%4]) with mapi id 15.20.5654.024; Tue, 27 Sep 2022
 10:32:01 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "daniel@qtec.com" <daniel@qtec.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "dagmcr@gmail.com"
	<dagmcr@gmail.com>
Subject: Re: [OE-core][PATCH] dropbear: Add enable-x11-forwarding
 PACKAGECONFIG option
Thread-Topic: [OE-core][PATCH] dropbear: Add enable-x11-forwarding
 PACKAGECONFIG option
Thread-Index: AQHY0lwIiu4t1WQk0USVdS/qRNtlqa3zFAgA
Date: Tue, 27 Sep 2022 10:32:01 +0000
Message-ID: <8AA6EB38-88F4-448C-9C63-5848162DB40F@arm.com>
References: <258A1233-0D8F-4A61-B976-AE5D4A1516C5@arm.com>
 <20220927102904.722281-1-daniel@qtec.com>
In-Reply-To: <20220927102904.722281-1-daniel@qtec.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU0PR08MB9052:EE_|VE1EUR03FT050:EE_|DB4PR08MB9863:EE_
X-MS-Office365-Filtering-Correlation-Id: 83841a4b-b65b-4d22-40c0-08daa07388ef
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 Si1kSSAIpVvepC4Ev1BmVvfLfnxKhiA6mVvATc43LE1ndt0cQwNVpbg5inonWyPLHxcq1unwbcO4Z5CtS8s+8k/Sau+3Uyvwsp586e/X37eUi36r2uVpWztvNstdpFr1IoQ+FCH76jntINStbR1LI0da4LRNpzulKwpwi92TvYrI6To80A2PE9ueV+1fusqFOZE38nq4tSgYfU4tX/VFaujPQn02ewctbuVKmvDzPZdqp6QI9Yxk0fYSO8P27pO2RX2Uz9jB7m+U5gBBgf+6yXc3RcreyBWSEq0iazuWBUG4QYyCjF4bYbrXxyyDyNjfIetASDmN7QOq8WAUn3Yy+mIeySVaXc7ltIcdCSU8J2MpYgRNCrpQv2NayemZrEF1JGPSGdEmYqUpVNrQlOPknmJgrG3sUvoTXZ2a4K7zV2t18dpfqLGfIvDhyxUN4CjgYuzsaQ6nZWEF+Y8skSsPlvH7iH3PJ/kTg00iV7rqSFT7oFN9TQRIxUqp/lTwOw4l/kQ4plhkSpqG9iBox/Ac526b8L9rX2uCDqasLyE5NleCGq2cSxWS3jfAnCJBBInmHTB4GRRJ+VdInfiJ3x+2MXNXCGg6OYzjoag27RQf3RkfGqQceM/lk/VeR6b6W9yw9sGQklnXmOyYmXTzrmVXu66wB+7e9vqv4UwCDd2PSRYuensaDqZ6GGmiK+ft1ywcCovcNP1Lxrk+peKA0wZpk/mIofWOXZDN+vTv6NvcCNS/yvtJs+Fsu3ZU4E+lMu2P8xQUugPnb/nPcNFDOayOuARscTvCxZhXhASHz6LICCg=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(136003)(346002)(376002)(396003)(39860400002)(451199015)(86362001)(66476007)(66446008)(64756008)(83380400001)(316002)(4326008)(8676002)(38070700005)(186003)(8936002)(33656002)(26005)(66556008)(6512007)(6916009)(54906003)(36756003)(38100700002)(91956017)(5660300002)(66946007)(76116006)(2616005)(53546011)(2906002)(6506007)(122000001)(71200400001)(4744005)(6486002)(41300700001)(478600001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <CE2BE2AA954FBC46B007A85748CE23CC@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9052
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	4ac510c7-3d92-4a25-fb73-08daa073839d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	gnjcqWHc1onh8Vf239zmViXKBBS4TuDIMm/937J3QtPRqh1BJ2IjUrZqSpFs0K4nUL9cF0iF6hL9685ilxPI0UI2InrNMY5+n57hOzt55GCgq7xDUQbWOSHPoD5J1dJ254dOIeP1QkM6kx7aRfapI2YoT+GNHHd/CHkypc+nv66eturbEehDxADmgmFnhIEfGbcLjAMXZf0IxGgXL2FXfkmAS2BdX4HjpqJ41Qd2wKFxl/jgk9/FLdlJg2dlEhqyG8Uoz4ixriwjwatzIt2yHqs9FxhTga7rpsy8BEoPSwJ969YWX02XWrXLNISJSe9ma+QwFeJVR4a1Y8jEHxTmI/GnyzFnszVlsrISaGtiak+5hoYdVVE5O+4Yq0qjrbVKKZ6oT7DRzX/tTOJF/JwD9NyNLL6x4qTBEmgJI/n7oqsBUZcKLqdj3j+rKZjjgIz12X7orbV+cf4GYu6osqGlUxDtLfVEemtlKORQvvzBy7ScnZqGiIu5xFNkuO5vfuALTbpano7EkJyEMYu6ml24gUoxhnF4aSN0FG1BYugdVGz7OikVZDvwk9iIQz/YOpZ6i+ydLT332jeTO9xczqLhb9cqaF+piOipv6JF3zBdLME5rzXaBzvEFvNLLwtpBCSTwYxB2F7ITK+maVoyxrim7V//74gpPW6df7yWDy8Z1DswXvPh3ck8JN+aJ5yWBKgh5GwZF+RLJrUT9h6/lj9BlLGXYLjYvxQgEs7A2571SdtZXhircCvUvpBTLrhPzWMRNywAljxxuvnIdhKf/lRx6A==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(396003)(346002)(136003)(451199015)(36840700001)(46966006)(40470700004)(356005)(81166007)(82740400003)(40460700003)(53546011)(6512007)(26005)(47076005)(2616005)(186003)(41300700001)(107886003)(336012)(83380400001)(6506007)(33656002)(8676002)(6486002)(70206006)(36756003)(70586007)(4326008)(316002)(54906003)(4744005)(6862004)(2906002)(82310400005)(36860700001)(478600001)(40480700001)(8936002)(86362001)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2022 10:32:10.4382
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 83841a4b-b65b-4d22-40c0-08daa07388ef
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB9863
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Sep 2022 10:32:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171092

On 27 Sep 2022, at 11:29, Daniel Gomez via lists.openembedded.org <daniel=
=3Dqtec.com@lists.openembedded.org> wrote:
> diff --git a/meta/recipes-core/dropbear/dropbear/0007-Fix-X11-build-failu=
re-use-DROPBEAR_PRIO_LOWDELAY.patch b/meta/recipes-core/dropbear/dropbear/0=
007-Fix-X11-build-failure-use-DROPBEAR_PRIO_LOWDELAY.patch
> new file mode 100644
> index 0000000000..994bbdd42a
> --- /dev/null
> +++ b/meta/recipes-core/dropbear/dropbear/0007-Fix-X11-build-failure-use-=
DROPBEAR_PRIO_LOWDELAY.patch
> @@ -0,0 +1,27 @@
> +From 0292aacdf0aa57d03f2a3ab7e53cf650e6f29389 Mon Sep 17 00:00:00 2001
> +From: Matt Johnston <matt@ucc.asn.au>
> +Date: Sat, 23 Apr 2022 22:33:31 +0800
> +Subject: [PATCH] Fix X11 build failure, use DROPBEAR_PRIO_LOWDELAY
> +
> +Upstream-Status: Backport

This patch also needs your S-o-b.

Thanks,
Ross


