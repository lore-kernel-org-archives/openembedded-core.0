Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEBE3C433FE
	for <webhook@archiver.kernel.org>; Thu, 29 Sep 2022 11:18:45 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.76])
 by mx.groups.io with SMTP id smtpd.web10.8875.1664450320105338577
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Sep 2022 04:18:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=6y7vnkv6;
 spf=pass (domain: arm.com, ip: 40.107.21.76, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=YLIP+arTsWEfNdDrsuExPtQ1Gq1pIEoOB8wa6YqM2FVrH2EfaFLg8/KESRmao3GOl5kcdEprCO+m9mODyOGyDu/O4GYzH/3Fz28HNQ9nCnTrGExQEZ1qJokYSvtus2sm+h/5JjF1NM8/3wqs64NPgjeYO0QwScLVVJ/FvxTlato8vLwUyQyTytpFblkI8uGX4pmPKfvct30aeosmIA78CSu6xxga90PWg1W7IcrSavii79McIM0UZ73bKlF/X91PfpIMzDCW+/uni7pJ8xMgkaVx0hE2dXz4g9zG4Qh2fk3AxB3/GHGMzSP6tJRWuEfSxIGLxqQ5AisfJYjz5+m5vw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EXpRcdvB4b2qOJZtYAIINv0oqqdBFrmYDvx4wIMSHuU=;
 b=GN19n/BsjZbcBzaD2EO5mlAfiwweULa2yEktiesLCCXiTAxj4Ja8dctUHhjMfVmjvVqluvs5Oi6b6YvKiw6EdY4erhsxL9pg46NaRqt3LwC5Pn/NxdOOZ1NVz3yAuocoq32oReOQVwREqWaYitfUBndU17qbegE5t5s59jUds6d8TV0LYlCllHIkzyYnIeoicVqm8knnzWjNVo9rNoGAyBxPvxUAMkbayj2IBHwNUC/Uv8p1SIMCJbpZPcjTil3qvWNIy8DvqGx5oDb6nAT2XT2juV5XJj78YISvk0qHV3/41mR2G9Uf+jZKpre9eXnFnWCQpw3EiLkd3vFoq/1KMw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EXpRcdvB4b2qOJZtYAIINv0oqqdBFrmYDvx4wIMSHuU=;
 b=6y7vnkv6dFEEJfqz8RDuzcTNEZvCq4I4SKnomqfHckhyD1hite/CAnbZV4rpajDO4xhz1XoUSJXsX0X2IHQQxbixPrWrgks0HHmtVgNW0P08ZIcy8VRyXXkA7qABVG6INfgItKxBTU40iBQpFhs4NC92Uo1MyizktOayrMkIJNw=
Received: from AS9PR01CA0019.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:540::21) by PR3PR08MB5627.eurprd08.prod.outlook.com
 (2603:10a6:102:83::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.19; Thu, 29 Sep
 2022 11:18:34 +0000
Received: from AM7EUR03FT009.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:540:cafe::e4) by AS9PR01CA0019.outlook.office365.com
 (2603:10a6:20b:540::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.20 via Frontend
 Transport; Thu, 29 Sep 2022 11:18:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT009.mail.protection.outlook.com (100.127.140.130) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5676.17 via Frontend Transport; Thu, 29 Sep 2022 11:18:34 +0000
Received: ("Tessian outbound 99ee3885c6d5:v128");
 Thu, 29 Sep 2022 11:18:34 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1441e527fba59353
X-CR-MTA-TID: 64aa7808
Received: from 8c92ef4b8775.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 BBB06AF9-91BC-4EBE-BE4D-2F84716813E2.1;
	Thu, 29 Sep 2022 11:18:27 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 8c92ef4b8775.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 29 Sep 2022 11:18:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pnk9k05si5BpayOPMtPQNSfStSCLEUFH4IraFxtuP6zBZoR/SfNm55RFdwuIiHs8gJdVvWySucsuSgh7S3Tv7pflrRuCzE6if8A20TUKwvQdjD830LbqS7RM7gY1RljKn36ngMzyDHYNDEe9Tq8CuF0hB+4dvWgZxeL9SgLTUzZ6sWs4KKJ0Pm0JpliqI+bR5w318uvPZgnMv2QEUlnT+18nNqUCYCk2CiGxpQEtFYVZT2fRDHayiUCr0XST6FaOiQU8jzIngOuBB1cebVhR3avovbPUXDHpyZln2d0oaaiYFbURUE92sXLLbyN4pRcFe+d/1Tqe8XFuKDcyCvf2SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EXpRcdvB4b2qOJZtYAIINv0oqqdBFrmYDvx4wIMSHuU=;
 b=QoSFKYfmJ96lfEt8N6mhVFvVVhVizMhmBk23EFsFNkdwUI7jdROtdKKK1OxB79iMgN1okIOW7AN9cp37FFuzwCLkEDE2u6hnunkV/J/nmF119Kro15MYgrkRQQ78j49qND+2fOvN0C46j7Da1pE4sA083C7PmwkuspP/GIhNQgDs1N2Cx9+EeR9ph7XxSGmNNiUuc9zanFHF99LDFZUOMT34zG7TGwIdj2vbiA68O3gTPcgAioxPh8hmjs4moBpihquHBGCX8I8/py8zDvmQZgiL2wUzGSI8F7VOJMl4dA2f+6PUNllroVIHj9sas8Ol0QYsyOri7h0Ov0kqLPl/8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EXpRcdvB4b2qOJZtYAIINv0oqqdBFrmYDvx4wIMSHuU=;
 b=6y7vnkv6dFEEJfqz8RDuzcTNEZvCq4I4SKnomqfHckhyD1hite/CAnbZV4rpajDO4xhz1XoUSJXsX0X2IHQQxbixPrWrgks0HHmtVgNW0P08ZIcy8VRyXXkA7qABVG6INfgItKxBTU40iBQpFhs4NC92Uo1MyizktOayrMkIJNw=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB9PR08MB6538.eurprd08.prod.outlook.com (2603:10a6:10:23d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17; Thu, 29 Sep
 2022 11:18:25 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7d2b:2570:9a99:a3d2]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7d2b:2570:9a99:a3d2%5]) with mapi id 15.20.5676.017; Thu, 29 Sep 2022
 11:18:25 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
CC: Xiangyu Chen <xiangyu.chen@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-Core][PATCH] babeltrace: Handle negative time and offset from
 Epoch
Thread-Topic: [OE-Core][PATCH] babeltrace: Handle negative time and offset
 from Epoch
Thread-Index: AQHY0g5p7hbNuA+pqUegpPmxbaplZq31/v+AgABHRAA=
Date: Thu, 29 Sep 2022 11:18:25 +0000
Message-ID: <EE2E3768-2430-45DD-ADEE-C04C789AF015@arm.com>
References: <20220927011315.20729-1-xiangyu.chen@windriver.com>
 <e5fea18f18d766bf9690c876bc169d7425407b0e.camel@linuxfoundation.org>
In-Reply-To: 
 <e5fea18f18d766bf9690c876bc169d7425407b0e.camel@linuxfoundation.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB9PR08MB6538:EE_|AM7EUR03FT009:EE_|PR3PR08MB5627:EE_
X-MS-Office365-Filtering-Correlation-Id: 25fa4582-43c1-4ad6-73ea-08daa20c590d
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 JWxg6UvlB4SCgbQqQsPUXHrAP/LlNIUtqZRSfIDelaEuLYb54p5nXqN1lb8SYXg7ZzkfxZfAumChCmlomBZ4mfO+Vz5SvhFtRHxCYOyYQvqzxxE9coxBV5uYGlUM0Qfk+y+FkT+wWvfPZ/AK7iksVMYVSJHI0FOC97XW/m/PJ7Djwf/qFzV6rOykEi9jwJ4V9bHp8ZWImf35F2MFL+zIH44mNBVUGUlqo6lnihav6p1EFGvyJKbUeo+lFNHJMa2kv+NHBpmkkvg3vRQ9hn1GuTK1nehbIBgxGWu8VTf28tYRahVFEDK5mBWHbj6zegD0Jq7ZpJlE8zqRAzoQrstIBayFhJi1SPNs3R2PbWrFpwGgJsbm606W2YatO7nxn440sAL+LEVs9t5itIciiIF+vayQTt9c3PauPJKifJ3xTbwOtXSfuAT0r4rUgoM0NOSssr36v9FJAYDV/Brezq1Ag+YiOWz+ci9OIzeLdBb+FyrlB8y9SJtxtJ1TnWtHyfT3EeGhXEZRWWaR9E/CfpO4yMeo/uJsN8K5cQD/yx8uB5GJ70syjKrlLjxRf8WqLK4qTYazfDoATeoSdSyy+j9141D22k4HBdxStnOdDWYd922yUQBDP0iAk824JGWQwDhaCciYvjRlPriftSrl5YN3H5/OZHW8RX/WVvQo9VmVoqjBiF7AfNNd3+LdLDSiX1wxUBPRSuGdUg7g4xvuP7QJiDCzTr8CKixYVYJ1hP7pq0LNthy1C4LLaa+8B9XJXifedsv+Ue3AhyLouhaZZGVlOhLR5y24XDWhpqfbqx8UK4c=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(376002)(396003)(39860400002)(366004)(451199015)(53546011)(83380400001)(6486002)(71200400001)(33656002)(2906002)(316002)(6506007)(54906003)(66446008)(478600001)(36756003)(38100700002)(38070700005)(66946007)(66556008)(4326008)(8676002)(64756008)(41300700001)(91956017)(4744005)(86362001)(8936002)(6916009)(5660300002)(122000001)(76116006)(2616005)(186003)(66476007)(6512007)(26005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <B734D2E468666645B51CDE13CCF27689@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6538
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	e2893500-a529-4e01-6d92-08daa20c53c8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qyn/8gci8jr0Bh1yNFn5v6bUe3m+Bf9TJfn1kAAFBuurpXprgnJUIe07oS5pfKB6EMNNnfiEV9vKdtuMvGK2yNv6r+9wp7pwsf0i+zGKc+9oPxo2dNGB4thlPOPg2HggYsmhnxqv8gEHOdpiMbiS2nr3BcRnw00AiGovto/Xytaouj7SrDlBnJvJ0HzzyWocrPQfUNgbLz9zDSW2jj2BE/+fvMYGJj3koVvY7+WrOUo7XxvyPLc4oHcAMTTO4AaOnBYn/y6sangZQhbpsM8eUk2D2Ho4eod8NGTXYSaaHCgXJpYRwgOpZW8eKAOLbwzTBoJx+v99875Jbk1Mzdpb/PlIPdcOvtaIbT8mWR1hX4l6XFaZzm/01ePXCTm4AF5iwcBiAEWLF9GtqtjaI4VhHpu418PLMSIoX4MROQFd/MkEgfVJtGCHH/3ocitU9gto8sAvZc+ZQgJeDU7rULSN7bpDjKP0nH/VStjYhFcp74alUkVeg284uM4I7wKiztXzdqNwlwkc3pkijxIkHHtWuaGmWCL4qtKWX8fHFCJA5fT2H7wouSTHL1CUvTpORih25OhMbt1J9oLB5b34E31DYceO6EN0crC9ohZMXWVIu6yYy5MR5Fpgg52Whj15dR2F1152RCdqdY8ulVrq4uB5cuaDwvtafDs1956fxCH/AlaXWffyUNWqH4ixgFHep9UraXAW6o0pywyKPyGSlM7eB4E3O73RmXyJXIG3ht9AZdnZhdvtHNbPha103JtsmAom3vUWx+neXG0YBzjkZZBc0A==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(396003)(376002)(136003)(451199015)(40470700004)(46966006)(36840700001)(83380400001)(70206006)(8936002)(70586007)(4326008)(8676002)(6862004)(40480700001)(26005)(40460700003)(2616005)(6512007)(81166007)(478600001)(41300700001)(82740400003)(2906002)(86362001)(336012)(4744005)(36756003)(316002)(33656002)(6486002)(54906003)(82310400005)(186003)(5660300002)(47076005)(356005)(36860700001)(6506007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2022 11:18:34.3082
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 25fa4582-43c1-4ad6-73ea-08daa20c590d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5627
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Sep 2022 11:18:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171182


> On 29 Sep 2022, at 08:03, Richard Purdie via lists.openembedded.org <rich=
ard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wrote:
>=20
> I'm reluctant to carry a patch which has feedback like that upstream
> and stands no chance of being merged.

Agreed.

They also say:

> Unless there is very compelling reasons why you are sticking with babeltr=
ace 1.5.8, please upgrade to babeltrace2.

Which is a good point. Why do we have babeltrace and babeltracel2?

Ross=

