Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AA25C433FE
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 17:22:36 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.80])
 by mx.groups.io with SMTP id smtpd.web09.9138.1667409746071996564
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Nov 2022 10:22:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=qez9nFNx;
 spf=pass (domain: arm.com, ip: 40.107.15.80, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=X9oShSTpQH6hZQp/eFcPZaOYQYdbQoDlZ598trtfJ1NO7GE+PMxKX/X9q0n1sMCNfiv2cICe2acnZg8C6O6+Bicnz5l1ZDYMsaWbTPvDMYr8KcGVmVCAwDaf3YDUwMsbtSAL2WXfEKo1BZQgLOwAA2MP7OrFcW2rxp+LaQG3JmQrIBSWAwZvJ6By3xTJWOEvww/wzzeHG3LEJQ/VWOcviKVOwfB0EQ5UAK7rAjPZPTdbRQTh7ovBe71mbII+kksemoAWe+WY2Tdbic7aFjd84Esv1315a2r9AbQu1yLWcP+aDn4wPfkcXGnPl5Qr2rynsf515ZjZp1syqhoIOF9OHQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gEtvqNKAX4zV9vR0jrAmtigjN7GNiFf4ADFAQdytA1Y=;
 b=D/nU6Xx3dYYwoKwvxit9R48A8baY2JO3WHbV26bXQJ1JdBi2PCLYlMN8/J6EENIzyoqHw4+/UU65d9SLyUTxcfBoYZCCGMjk0hz1rFeO1/tYL5Jy54SPnxwP0dBGoOMwdz0JVtt8g0HL7a5UIaaWTRvK4vrDjvw9rPK0uBY/raQbFRSEl2BUDdg4Ir+I0GaFqyLstpQa6fEXCRFRKrGh6rvjIQMwxc0vvlw1yBBnZNxOskK/V0UcbouAUgb8YXOzwyEZ8Fx+lsOVCieKArPB0sBrYxdEAbWPRMxL5Yl5hC4938hLIskqPYtZEGXKaO5DzK6VFFulFvWh8PoPSUEUUA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gEtvqNKAX4zV9vR0jrAmtigjN7GNiFf4ADFAQdytA1Y=;
 b=qez9nFNxE1PiHm+TnE/N3gua/E+shIbucrTb4DfLVco017HPhUCH2HjkDObaSj9JVl0VUQ2AXdJIpoBICvPCYREh4D7+Yz7uvjvPMri2rPE2IJPG7LbDIODH7v/2G1uJ/v22ZBq6B5fpS/5hLkExOXQgw+vKEwcI50hVleRiVpM=
Received: from AS9PR06CA0709.eurprd06.prod.outlook.com (2603:10a6:20b:49f::32)
 by DBBPR08MB6089.eurprd08.prod.outlook.com (2603:10a6:10:206::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.19; Wed, 2 Nov
 2022 17:22:21 +0000
Received: from AM7EUR03FT043.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:49f:cafe::ad) by AS9PR06CA0709.outlook.office365.com
 (2603:10a6:20b:49f::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.20 via Frontend
 Transport; Wed, 2 Nov 2022 17:22:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT043.mail.protection.outlook.com (100.127.140.160) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.20 via Frontend Transport; Wed, 2 Nov 2022 17:22:21 +0000
Received: ("Tessian outbound 2ff13c8f2c05:v130"); Wed, 02 Nov 2022 17:22:21 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: d68b3b8f138b9a75
X-CR-MTA-TID: 64aa7808
Received: from da4ae97632bc.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id AC4729DE-B866-4C00-AD81-079900760D99.1;
	Wed, 02 Nov 2022 17:22:14 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id da4ae97632bc.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 02 Nov 2022 17:22:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nDk5UloM8MHLOEtd06H68G78mqTFI9t1chg1IGRGBPi5/pCgmrcLpwokCoKR1Dlvg0NRRzDbnallMLgZtSuNl6uPwVyXPaO/5TObhP1+1nVD/R13SOKWrtTsMhqa+gOZkU+++Dc8y8PNOWMvBFxUUSHDKvewa72Ux4djE+nw5SdBBSo3L0CD8uOr8MUl2aqsRxnp4ybsfyHxYykPnl5UwGfcYPFLmLgW13wWMvINafqezR2xxJoDsvh4cIvR4uPrakNpVVqyzQdr7BtcwjyvFsCJ2SaiCHBnhp/8wNVIFWgFmAr9+xFDxO1DKCKaZcntmYAbxgp5mQMlfyQon0uTYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gEtvqNKAX4zV9vR0jrAmtigjN7GNiFf4ADFAQdytA1Y=;
 b=FB8Kp9q9SgTTmcqt3pJYIriZQXhtxBHsf4tmDrHHRAg+ui8wze5uA/UWt0IDvZxeOzvClSL70onWUbjVDIbag7C7vuI4/b4+ZrTC1neidGCTLkbV8BEPhPe+RDq9QianxHMnAfHUHN52I5U7MtlfvVGW8JT1gp6JDMXNL1jLX/kQbrcsHLLUIkeM2dRtFoTzx6XSX+aYruuOuL4CsZz2aq926REiL7nz7jQQus0QJ9y5HjeBKE+Hn5zpxtEmpB9BsElL8pyD/XsP4omcObeMPvwKYNz8wdli7Bq0TWCL6m4Vp+DN+nelXWS0KeA4RyawCvl6ClmdzpeUAJTMoVZVvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gEtvqNKAX4zV9vR0jrAmtigjN7GNiFf4ADFAQdytA1Y=;
 b=qez9nFNxE1PiHm+TnE/N3gua/E+shIbucrTb4DfLVco017HPhUCH2HjkDObaSj9JVl0VUQ2AXdJIpoBICvPCYREh4D7+Yz7uvjvPMri2rPE2IJPG7LbDIODH7v/2G1uJ/v22ZBq6B5fpS/5hLkExOXQgw+vKEwcI50hVleRiVpM=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU0PR08MB9749.eurprd08.prod.outlook.com (2603:10a6:10:447::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15; Wed, 2 Nov
 2022 17:22:12 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::52da:ac9d:e42d:8cc]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::52da:ac9d:e42d:8cc%5]) with mapi id 15.20.5769.019; Wed, 2 Nov 2022
 17:22:12 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 2/2] lttng-modules: upgrade 2.13.5 -> 2.13.7
Thread-Topic: [OE-core] [PATCH 2/2] lttng-modules: upgrade 2.13.5 -> 2.13.7
Thread-Index: AQHY7p1HEuA0dyCocEGO+LNpXbOtga4r4gwA
Date: Wed, 2 Nov 2022 17:22:12 +0000
Message-ID: <BAE2A2E4-E46D-4C88-9F67-609E8FAE9175@arm.com>
References: <20221102092649.631136-1-richard.purdie@linuxfoundation.org>
 <20221102092649.631136-2-richard.purdie@linuxfoundation.org>
In-Reply-To: <20221102092649.631136-2-richard.purdie@linuxfoundation.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.200.110.1.12)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU0PR08MB9749:EE_|AM7EUR03FT043:EE_|DBBPR08MB6089:EE_
X-MS-Office365-Filtering-Correlation-Id: 7dc1ff9f-9b97-4150-01c1-08dabcf6ccfd
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 zAX9X19OBVvq7/uaoUhtlSSUNs+3pOZJuQ7GQsENTh0db5G4FPeM/02ww9HCJ6Fph+9lDDnra+g0FHrdrUCMaHYLmpUu4QV2rVCjza2agAOeVEDziRA8kdszRJD/29Civzkxv6EQzZGUJ5hRTyB1wRX1uYT4r6jbkJ5xjCGUDGSocgfYNpRvdecbq0+FZuZXxm9m8JM/LWSSQPpXDMY4sLl5onK1IIfO4pQ3O2DoUGa2ywuH2uXWMkQl7TsCZsW1yhMVYYF5QJSXNDcJqnYqOXV6WN3XJw7UxWR8WftQEYac5J3IM9/vz9tqWwYbX888ZysTs+hWgmmRObLSHl70ItXgSIaKmjl+86yGQnM6S515v+AXv8JtiEtpTTy9PtCwo0xf6XG2ei9DXc0qu7n2/3lFhvhhVNrwNSKDwg/y/ZW66MlgdRxI5eyuqja4wF91LIW9puAqgO4bxVncuyxWH6y72oD/E2Qv2hH34OuQdMx59LHhhoZLD01ZSKGAEXrIPYzFK1hcvrSppoMQRbuoh96WX8LJHXlWM/DiVo8zO8Y/NyYpdqOct4hzAN82tBusSI7Nl+e8P+r2B/BNw6I0zCP8lCySbKhx0zGNeQKJozy5kERZQQ47mlaX0CisBAYpdvWoSyPDJA/81EbtJVjWTnVu+/6YMwyir9s4SaMEw3UQrxfhyG7TwuweK/t7ll3X/QptwdRpTz12nmtkw1tEMduPQsGZsac8VAzoQ3qlrgiK9hBTx2H2nk0UuDIm3Jr/pGs7ited1qM628qoPJlf0jz2rUFkDOrmHaMzxD7qoKuxG1MU5sQlmnpei/EKYahGs92cHK/0Wwn8ZdEFrBk3n6HrjD+Zbhfgv3L2V0vJv8ViNk30vX9R35K0ursvKL1W
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(346002)(396003)(366004)(39860400002)(451199015)(86362001)(66899015)(66946007)(478600001)(71200400001)(53546011)(66446008)(64756008)(6916009)(4326008)(6486002)(966005)(66476007)(6506007)(91956017)(8676002)(66556008)(76116006)(316002)(38100700002)(6512007)(26005)(8936002)(5660300002)(36756003)(33656002)(83380400001)(122000001)(2906002)(2616005)(41300700001)(38070700005)(186003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <A5501415EFA9B14F8258B4581DA92C70@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9749
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	91ec332b-dab5-41c7-d427-08dabcf6c7cb
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	xQkXeEEKh+BYBknYbMMOS8hruOkmh2/ttdwGsqjdnKpwM2YQOwihXME0BHZ/RstYGo7/RujBfJAoNhgjdjk6XG3VtjERIhAnmi360X9GM7gK1dFAbWNsR52ZcnE5BN0mSyZkfcwFCh9HG+haA04YC19ePLEWsl1I5RhJN6nDvGmzQSjiBT6JMBmKI2OoeK8WHk48yR+YJdft40XI99ci4vkhvINKjLl5hVZLJTyfTKYOmynEIho3ds+sXn5+/6BBDmmv4a+JxmvzCnlH1pmFmVJKprf8Q/JNbASVls7AA0+YosgYXdkOTGujMYgw5IcZ2hfaoDoynqqXAobqKxVwUi9pwaK8QuiAWUCwEuNbSNZB4uBPYpvMugwG1zCxDqG+1GA7iBDDKEBFjB7Ivg0yiM1dKPBGIDx627Q5ROqz4tgQcRbevQ/5ZgFQZ+hhpBbbb/XP1X7LqbmWZCUx0ySaViMGN/BotMTAbc9Q7qpoL8LKn9Ko4NTL7DA+nq1W7pTcxiiVpswQ2OQMdKqI3mKchLRzPXoWfKGHuAmIOMabtIsoz2yfwz8pss2dnk6KUwhxR7edjkGh0BvE7T+Es3TfqYZ5DTSBlSWwL1DODtZTkRPBbevSEs2gmOM41GJ/vJ2vFOVIauDzeE7BxVB//JM2ihZwKtnNkaPal1kvGe5kFBF0eXH3C4kK7wtMRe2fLA1BjzOoz3/0gBcZsd+F0oscVBsnWXcyCBXkyrnZTP1cZI5CFP1QuQmgQsUUT8EuTvUR6PT00+qmKVmvv20HYGaD1aVq1RscBidQzlv+hFfPFJj/E4HCqEPyVNJ1WHRJ4p2N
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(396003)(39860400002)(136003)(451199015)(40470700004)(46966006)(36840700001)(66899015)(83380400001)(336012)(47076005)(33656002)(2906002)(966005)(36756003)(6486002)(70206006)(86362001)(81166007)(356005)(40480700001)(82740400003)(82310400005)(316002)(26005)(6512007)(2616005)(6506007)(8676002)(186003)(70586007)(36860700001)(5660300002)(4326008)(40460700003)(8936002)(41300700001)(6862004)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2022 17:22:21.2831
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dc1ff9f-9b97-4150-01c1-08dabcf6ccfd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6089
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 17:22:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172596

Bruce has sent this already, and also drops a merged patch,

https://lore.kernel.org/openembedded-core/e3f510eaa6b7fab9c080881d43db6b556=
b46d9cf.1664904217.git.bruce.ashfield@gmail.com/

Ross

> On 2 Nov 2022, at 09:26, Richard Purdie via lists.openembedded.org <richa=
rd.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wrote:
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> .../lttng/{lttng-modules_2.13.5.bb =3D> lttng-modules_2.13.7.bb}  | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
> rename meta/recipes-kernel/lttng/{lttng-modules_2.13.5.bb =3D> lttng-modu=
les_2.13.7.bb} (94%)
>=20
> diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.13.5.bb b/meta/rec=
ipes-kernel/lttng/lttng-modules_2.13.7.bb
> similarity index 94%
> rename from meta/recipes-kernel/lttng/lttng-modules_2.13.5.bb
> rename to meta/recipes-kernel/lttng/lttng-modules_2.13.7.bb
> index 00095d6ab7b..49c584dff4d 100644
> --- a/meta/recipes-kernel/lttng/lttng-modules_2.13.5.bb
> +++ b/meta/recipes-kernel/lttng/lttng-modules_2.13.7.bb
> @@ -16,7 +16,7 @@ SRC_URI =3D "https://lttng.org/files/${BPN}/${BPN}-${PV=
}.tar.bz2 \
> # Use :append here so that the patch is applied also when using devupstre=
am
> SRC_URI:append =3D " file://0001-src-Kbuild-change-missing-CONFIG_TRACEPO=
INTS-to-warn.patch"
>=20
> -SRC_URI[sha256sum] =3D "eceb3428d80e85a9f008425beb9526195c9f7f02b302f28a=
dd56df53aef3e708"
> +SRC_URI[sha256sum] =3D "5a99679df7903160cbde3918fee5af90ffafc90fc96ccdef=
aa57cf230492b234"
>=20
> export INSTALL_MOD_DIR=3D"kernel/lttng-modules"
>=20
> --=20
> 2.34.1
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#172578): https://lists.openembedded.org/g/openembedde=
d-core/message/172578
> Mute This Topic: https://lists.openembedded.org/mt/94730262/6875888
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ro=
ss.burton@arm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


