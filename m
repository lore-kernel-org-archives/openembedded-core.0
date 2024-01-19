Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26325C4725D
	for <webhook@archiver.kernel.org>; Fri, 19 Jan 2024 17:41:52 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.71])
 by mx.groups.io with SMTP id smtpd.web11.993.1705686109558527087
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jan 2024 09:41:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=gRDasy1g;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=gRDasy1g;
 spf=pass (domain: arm.com, ip: 40.107.6.71, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=j1MgOfr27552nS8Za9MtNTltNAdV5enwrI5q3IRpTDO5vReTXgNbwy7mNdH12bi8UIlx+DIVPe3aMFUl728mBrLNPSlAaoCB8oAnkRZ14fGDREgjlF91jPAIX4J6JPDqg2UpTfNfgRax3JfQKfWrDXrr2TS5DQaR8AqgJW8QLd7Ld9hXNDxRgoz/wozxfQkUt8WFWwgAz6NWKJ6a5XA4JYzlmoukL4DbDgGV9sSorYmXCgrEHI4oV28tTp8jLVcOx8zdVUAOA8DS+i4JeYlglNXgD7vLcckVx0Wv4/pIhXKO8+thyclwD9GLK8oJy8csTgo+llEK3i7gWp86N+a9hw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+EZhVzG2chLn2gtnCzyhnNprx2IZCM6/K3C7qoNGTWA=;
 b=WORIVl64QZrFF0j/ugl2iIfXdRWXcxjjjVGoT8YmGunLJWmYDSsPxBaeR0WOyF+qjD21nGoPcYEKoaNOYqr/K45CwGfSejRAEWxkEr2JvxhoOXVl9MHhwxDDuQYTyV8zIRPe6gwvSSxMqapFWW1+tuh5+wAIIEx3W1RASPxn/FvESoP2lxEee7CqymrdDpJklaG8y2lHoQJRfafUX/rwFxwqNlq5VE1TpxGykOFPKDnpFuJ1CVIpJzRq+8DVk4SfKl2ceOSjiSrg05npHC48BO1amxLSC8N8Qa7hUctUzbQsWwa4KzA1lM/N2qFNkNFoiP8A4XCPXtgY/MiOklz0Eg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+EZhVzG2chLn2gtnCzyhnNprx2IZCM6/K3C7qoNGTWA=;
 b=gRDasy1glpyGOl+nQJhJOgXnFyt1F6COdhnau/GvzWTYcodbYY28lnGEE1rfQLwa2Dlz6UVSz6Qp5JW636dzY5GzwkhlXf8646TNWSsq6h0HMQ/XZE7iTxVSBbcyodYWwjgZ1Wveb4R9dc8wjQqqbPrjLKFZHFr7d44jThfNqJw=
Received: from DU2PR04CA0312.eurprd04.prod.outlook.com (2603:10a6:10:2b5::17)
 by AS8PR08MB8875.eurprd08.prod.outlook.com (2603:10a6:20b:5b7::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.24; Fri, 19 Jan
 2024 17:41:45 +0000
Received: from DU6PEPF0000B61B.eurprd02.prod.outlook.com
 (2603:10a6:10:2b5:cafe::c) by DU2PR04CA0312.outlook.office365.com
 (2603:10a6:10:2b5::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.24 via Frontend
 Transport; Fri, 19 Jan 2024 17:41:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF0000B61B.mail.protection.outlook.com (10.167.8.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7202.16 via Frontend Transport; Fri, 19 Jan 2024 17:41:45 +0000
Received: ("Tessian outbound 1076c872ecc6:v228"); Fri, 19 Jan 2024 17:41:45 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 30eeb7ef7c7b8dd6
X-CR-MTA-TID: 64aa7808
Received: from 792b91d7b831.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 3545EB5B-D3A5-414C-884C-943F0EFF2536.1;
	Fri, 19 Jan 2024 17:41:38 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 792b91d7b831.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 19 Jan 2024 17:41:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Al1FlCpOVQNt8xTiU9sYP4go086FlMH95zHXgywfQKc5G5/OaST0PaR3BS6skOVfVrEsgmPSSw3rJr56pRrQLLy2bLOZhETbge51qERkA6KI0R/x0Pnm2EJKZ7jFF/V2YFuS1ZV23CtykNhvMERPOdEg8apbWN7xQlQDM3IeJVc6cryPao0otTyFeyWztA+oY8IGEpYSylAvXG26lwV2woggi08NgDcZ/LCPpHpcGnt80aD+qZae1a32aASIacIdNFDw0XSgDmEQGDWTzO6Ry9IjI44eLYcs9Yh+BrKe4ZFIGXUi7q7Bkj98qCqNJewVzkNXNehQnMynBvvMbGDyuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+EZhVzG2chLn2gtnCzyhnNprx2IZCM6/K3C7qoNGTWA=;
 b=apRfBkeT09UJwZ9fnd5MAG8ssQGwcdmk+ZSimahSLs+OchTXw9zVoOUJhTb/oInlMwJWDeNRBpdl+CujhAjPnartzgPfA1yNAQGMImFkPl5snVAI/gfEwfpkjXg+n2CGaLHwffuWVPc4m4sRs5/nrTtcdXfgibJgiN5W3YoqXDI+zzEmW+TeZzwi3BWPJz3Fr4/AVUYRFWPbdL2jn0wzs8QQnbPyH2YO3v1oUtS91xjX2GS7liCF9FRYKUXPjpusn6JF+5CUegrICVcQdYM17564r+CfA8BoXXIpcUkw+7+zf/ed+jWXVeoVBQVVMfdAdnAWsT3W6gBua7eo+4xcfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+EZhVzG2chLn2gtnCzyhnNprx2IZCM6/K3C7qoNGTWA=;
 b=gRDasy1glpyGOl+nQJhJOgXnFyt1F6COdhnau/GvzWTYcodbYY28lnGEE1rfQLwa2Dlz6UVSz6Qp5JW636dzY5GzwkhlXf8646TNWSsq6h0HMQ/XZE7iTxVSBbcyodYWwjgZ1Wveb4R9dc8wjQqqbPrjLKFZHFr7d44jThfNqJw=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB5PR08MB10095.eurprd08.prod.outlook.com (2603:10a6:10:4a1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.24; Fri, 19 Jan
 2024 17:41:37 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9f34:f165:4c51:be06]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9f34:f165:4c51:be06%3]) with mapi id 15.20.7202.020; Fri, 19 Jan 2024
 17:41:37 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "mingli.yu@eng.windriver.com" <mingli.yu@eng.windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 2/3] gnupg: Make the version consistent
Thread-Topic: [OE-core] [PATCH 2/3] gnupg: Make the version consistent
Thread-Index: AQHaSstxMgA6wG9nzEmY5wACwWvmD7DhZ9wA
Date: Fri, 19 Jan 2024 17:41:36 +0000
Message-ID: <72AFBC4A-9C2A-4181-8A8D-548855D2C870@arm.com>
References: <20240119113354.3000697-1-mingli.yu@windriver.com>
 <20240119113354.3000697-2-mingli.yu@windriver.com>
In-Reply-To: <20240119113354.3000697-2-mingli.yu@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.300.61.1.2)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB5PR08MB10095:EE_|DU6PEPF0000B61B:EE_|AS8PR08MB8875:EE_
X-MS-Office365-Filtering-Correlation-Id: a8b305e3-bce9-4a1b-5fad-08dc1915e7e9
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 +Y/wXFNMcmIV39mI0xTKP/d4SREDHIpUhU9to0AWJ2pRgabwka4gqkXdXgla9bkQgenFKkGVnSv3wNEkQEY2fdT2AUqtCPVnmJKHKJTkXpzvnDX3pqpsSfzcN85ZmDZk1xJJqkpRpI6liVFVHUZ+dFlhlHL9qQIDn+s7qgR6skTr6FJTdVUN6lmNDq5z6pEeql3+/rVrj7VGpYI+3igJDWosUbGCuef3ep1R54F2iXvBOiIhL7+FD+EIZ2sOtky0Fln0wSV8adoqPLZkS0yiJNnyisQkp0PMLiZ2qf8Rz/pxVeYMy8V3weAIEHT/v5IYt0cRxFK2o4dFazM9IuoonBqGOzodbufOKkVFG4P+9sB5sE/P4X8zD3J0xwcFRwjJ/pG/gAEtFBBWJP85EhX2Lr/r/ndIc3QSFibnsfWzhNd/okyk47Va/U5+fO1SMbqWpNiJsCqeYeIhE5oD+KhF5hGlawpl3fquLmJGncyDkdAiVQXgymlAdE0/nZhKqUyLbCCmG336oLjUAwS5gwyzRLbVtDIgqNgEJB5iy68Gu2Xcy3MERMo1rezNXT0IlbySTn+IIuwm18llxpmwfKbiq80gGvUbWg1sk6kat4R3HHF70RY6MfaP7sV7eLKDXNaCJQei8OAKBEhXY+gRFQsCFQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(366004)(136003)(396003)(39860400002)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(6512007)(2616005)(26005)(6506007)(76116006)(122000001)(38100700002)(5660300002)(4326008)(8676002)(91956017)(8936002)(66476007)(4744005)(53546011)(71200400001)(478600001)(2906002)(66446008)(6486002)(64756008)(66946007)(66556008)(6916009)(316002)(38070700009)(36756003)(86362001)(33656002)(41300700001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <233CAB391822A94BABCBC2AB84C75A7E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR08MB10095
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU6PEPF0000B61B.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	bd4e0ba3-8af3-4e64-1318-08dc1915e2cf
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	xyNKKj316c0I9XUusNt2ltpnVIuuvUx+Ajt883f/bi+CGBy974AKHuhpk1OEzVcALqNao/eIvHfMzf3ebLFQSYpUSFz2ZdqBUZaqajhHyqjtPXm5d5IMWD/H4B4LZnwTHCIzFWiltgsTwUDVwJDkMMCPGO+l72kkRRufVoQPaE0I8V9wgGJdfKZXIUdgE09J8jBO5kFYBLi6GpR+OZK+JIpeceoMARDs5Cg41vVfnNrYFYZkptPboXcYs6fuJ5FgWQ4eho+1BEJ8ytm8LFFPGydP8C9zVtYCcJ8AAGWVhga0kuX7FKiVmtPFEjVJQneW+QapaPV8sxEkY/cREtLPmz936OMPxlM56Pk5OebQE8A3FbwK5xy22RK9CtVq2uWqTTsm42smHJ+Dj+gsDB4lVJDxNls92rD4SRc9Y+HtKyB1z6Lj5aoitF1FGhiePPosi50V+Qi8C3dRuC7GAtbHgzpCGMLkIVNHR/JzThP6vDvIdbmLve9OCq5hvly+oCgByQToqkHNaMsm8kRxAOXy3zumRv7q3ML+sa7z7FDqhhcUrxO68ysXmVTonH4MNpVxSOWJcyaqtkle43EoTM0gfSVvqJJApuVloCyiUI1K7L9419JuPCtOqVHcEF2WjiF9Lf1AM07SMMLoVECuNQoFEkrgcyxMcQjticLZynXtYu6WcNw8mf0wNoE7GC+opOdNPfgnbtD5XJC+05sBCqDlcb2gRGGeuATQRPPavuGuyDE=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(136003)(39860400002)(396003)(346002)(230922051799003)(64100799003)(1800799012)(82310400011)(451199024)(186009)(46966006)(36840700001)(40470700004)(6512007)(6506007)(53546011)(336012)(26005)(6862004)(2616005)(8676002)(4326008)(36756003)(8936002)(86362001)(316002)(33656002)(2906002)(4744005)(5660300002)(70206006)(70586007)(6486002)(41300700001)(478600001)(47076005)(356005)(36860700001)(82740400003)(81166007)(40480700001)(40460700003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2024 17:41:45.5450
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a8b305e3-bce9-4a1b-5fad-08dc1915e7e9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000B61B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8875
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jan 2024 17:41:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194060



> On 19 Jan 2024, at 11:33, Yu, Mingli via lists.openembedded.org <mingli.y=
u=3Deng.windriver.com@lists.openembedded.org> wrote:
>            file://0004-autogen.sh-fix-find-version-for-beta-checking.patc=
h \
>            file://0001-Woverride-init-is-not-needed-with-gcc-9.patch \
>            file://fix-ldap.patch \
> +           file://0001-autogen.sh-Remove-the-unknown-suffix.patch \

0004-autogen.sh-fix-find-version-for-beta-checking.patch already does somet=
hing similar, so the patches should be merged instead of having a series of=
 incremental fixes.

Also, as RP said, engaging with upstream here would be good.

Ross=

