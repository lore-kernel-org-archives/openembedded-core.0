Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2AD6C4332F
	for <webhook@archiver.kernel.org>; Wed, 23 Nov 2022 09:59:43 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.68])
 by mx.groups.io with SMTP id smtpd.web11.16729.1669197582898959125
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Nov 2022 01:59:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=kkRPsVH2;
 spf=pass (domain: arm.com, ip: 40.107.20.68, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B91x+6NGW/gToeLnYGWdJGja/jPpjZXQCWOSMESEJqo=;
 b=kkRPsVH2ocrwR57+XGD0DV6tEc2AoYNmrdt6BLYefNH5VxYklAi92b1uw7tHoseCNmJJU6/4lI9Dl3cGvSnGMCCG8VO1Nl9f12C9XbgNnczZXmdsrLbQFeELanf+pK1N8B0QUTLzn8dxHU9XLW7bJFLV6Md6/CuNRvCkZD66XI0=
Received: from ZR0P278CA0140.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:40::19)
 by DU0PR08MB7836.eurprd08.prod.outlook.com (2603:10a6:10:3b3::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.17; Wed, 23 Nov
 2022 09:59:36 +0000
Received: from VI1EUR03FT044.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:910:40:cafe::85) by ZR0P278CA0140.outlook.office365.com
 (2603:10a6:910:40::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15 via Frontend
 Transport; Wed, 23 Nov 2022 09:59:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT044.mail.protection.outlook.com (100.127.144.96) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5834.8 via Frontend Transport; Wed, 23 Nov 2022 09:59:35 +0000
Received: ("Tessian outbound aeae1c7b66fd:v130"); Wed, 23 Nov 2022 09:59:34 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 89470e75c696e951
X-CR-MTA-TID: 64aa7808
Received: from 3f384c449141.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id CF1F9CFE-FB02-4AA3-A1C8-4805A05F2A7E.1;
	Wed, 23 Nov 2022 09:59:28 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3f384c449141.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 23 Nov 2022 09:59:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OXc4KlV6ML6O4SSoPSCWPDUodf3n6ptohqw6sWW77ZGmSzuj6t8c40dTH8yCS1hnceC5NV16nT/g26LpK6ekV8IocqnCqk5+P9rM0GceQ2MeRm8jPDysZglI+LhludJ2lufD/L790kisCohiiwRtb92I4eW9BTvX2EWZ2lBLfsfSHkCZmqa0zsAPrDR281ddpTjJgPMsg/KqGpTfdR2p1kT1trDhepEd1nOERoYMmvoDBjStcO33jpxk2iwHc1yCQ29POn8CUHreXQ/6oc0QvWCjFMiu6EUpxZEySz/wDUnRA5CdB8r/zfsnptAzpo2IK1terRqVoMm+v0fKPI8uPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B91x+6NGW/gToeLnYGWdJGja/jPpjZXQCWOSMESEJqo=;
 b=Wzs5SVCuvIWq1sZRBH6R2qnXyCKHeefaL1c/6fePyrI/euZAGSwPdZhEkwcIYneNvq9kkRkqs8P+LqUIgjzd3yeThDPA0y3Y0s77kDkTDh7mfgmajU/UuNNyyIG3VJdzcOXsGlEpyPyiHgZe8YCiq2FYavuz+ng8JyDw0eMBPmTNAUw0cJbkjEwHBSDfYZydgBzY1dePUQCzvEPQSdsNmmWbk1Vf9H4m8B8QyLvOol+NhIp4pOYQpZmRwK68mIgspNl9MdxCkgEzszpUVWWiV0LHlyaH37lVnvF0qB326qH5XkubnrflHqO1nMz23sCvdMokaUxxWD5Sy7AQT7et8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B91x+6NGW/gToeLnYGWdJGja/jPpjZXQCWOSMESEJqo=;
 b=kkRPsVH2ocrwR57+XGD0DV6tEc2AoYNmrdt6BLYefNH5VxYklAi92b1uw7tHoseCNmJJU6/4lI9Dl3cGvSnGMCCG8VO1Nl9f12C9XbgNnczZXmdsrLbQFeELanf+pK1N8B0QUTLzn8dxHU9XLW7bJFLV6Md6/CuNRvCkZD66XI0=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM8PR08MB6388.eurprd08.prod.outlook.com (2603:10a6:20b:36b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.17; Wed, 23 Nov
 2022 09:59:27 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::1ecf:7fb9:8c0:8119]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::1ecf:7fb9:8c0:8119%7]) with mapi id 15.20.5857.013; Wed, 23 Nov 2022
 09:59:27 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: Khem Raj <raj.khem@gmail.com>, Markus Volk <f_l_k@t-online.de>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-core][PATCH] python3: add ${bindir}/python symlink
Thread-Topic: [oe-core][PATCH] python3: add ${bindir}/python symlink
Thread-Index: 
 AQHY/Qj3NOSdoWEgPkKI+DKTOAmX9q5IcnWAgAAK0oCAAQE0gIAAKmwGgAC2yoCAANl2AIAABl6AgAEK5wA=
Date: Wed, 23 Nov 2022 09:59:27 +0000
Message-ID: <534355DF-2B59-4B88-84F1-18251DF2FCC9@arm.com>
References: <20221120175237.194899-1-f_l_k@t-online.de>
 <CAMKF1spErHg3JX+DFRLcW4EthTGBMm4A24XsyAVOO3RNr6Wgfw@mail.gmail.com>
 <CANNYZj-UTuxW0-Rr7FhgjwE007Gr28Pc5ZCo=cnrDcaNsuZStw@mail.gmail.com>
 <CAMKF1srs_tmRRNqWQAmBKOkJkfysJt=OZjefq_mPd4htPGi6VA@mail.gmail.com>
 <1729A925BA1D06C8.25787@lists.openembedded.org>
 <CANNYZj-mhM6FzQY4Lv2BckodcLtPSUV29GG4TCUb_Tp003SAbw@mail.gmail.com>
 <HRFQLR.NFABK2KMZ9XR2@t-online.de>
 <4BF25A91-3F02-49A2-A546-A9CF7881E0ED@arm.com>
 <CANNYZj9uxKov0vrox7N3kv-HdQJ9VDbLu7Jsn_SuVUTz_Nbrzw@mail.gmail.com>
In-Reply-To: 
 <CANNYZj9uxKov0vrox7N3kv-HdQJ9VDbLu7Jsn_SuVUTz_Nbrzw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.200.110.1.12)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AM8PR08MB6388:EE_|VI1EUR03FT044:EE_|DU0PR08MB7836:EE_
X-MS-Office365-Filtering-Correlation-Id: d80d9031-ae35-4c72-521b-08dacd396d24
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 kvkSuRYR4AgLVmWPRJdJCOZhW7qMsN3fBZjRoC0nRE3XMfAKpsR3twtS5BCEgtoUf4+ptYs4HjTxeZfim7ase1A4Ur4XPKdroCCIaxEIAtn9XllmCa3mnEH9mAv5r+G6Fi2/THUZcrcqmwJMesuDN7OFtiWoTRXwdpdoK/fP2qX3PlQbKh+C3Dl3ho99JolyfbPy/YVRKtRnCcA3cONVp0CAgeJAlParrCetfu8JzFUxFERjlMzbYXIUL7/hOxXjeZyXz58k7k1Lwh0hKjAxLIXo/jmtInnXkgFK91/LeaMb33bF79WMBuB3/98LnSFdqcackjLeDvl7AV5vwTcPKog/LES/RROk0lJ5jJiVdVHuLW7fLgd+LkSmGgJiqgchAmfYHgS1gTPtVVjgwGkdHKCful3W4Vn8ZU9O0ibqG8/Sp9w+MvOEN9CrflsBXRrwiU+1it+0Jq+Csv9danbTvZAQEVpRh8ov9DNcSZlxgWoNN0NbSJapAavXQxDBog4pvCZElXCr9FIJp5zQYoNTWx5CBYeCQMtmw13QF2sRji2pigkMhI5B7vWa0zzlM+U9fdyU+D4rciZny+XnkJ+SqjZ85AzhHshIhcGe+RfCSVu2xZimR4w03hKtM9F4lJ1228ib0XE3XmQd/PvUVJhP36S2jsdTm6uVZ9DJichepqbsn4Jin8ytFZYfkSH8B1r+TkLExbffiOR09L52sCySTWLz4/Dre8UEFfryyeIFuEhtAY0qoL4oEEDz3Kj+ksVt
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(366004)(136003)(346002)(376002)(451199015)(38070700005)(33656002)(36756003)(54906003)(53546011)(316002)(86362001)(6916009)(478600001)(6506007)(6512007)(71200400001)(4744005)(91956017)(4326008)(41300700001)(66476007)(76116006)(66556008)(66946007)(64756008)(122000001)(8676002)(66446008)(38100700002)(2616005)(8936002)(2906002)(5660300002)(186003)(6486002)(228453006)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <2E1937E0ABB42C418A31266B3899232A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6388
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VI1EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	f039736a-3bd3-4840-8887-08dacd396843
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	gE5tY0yXNfaoyqEKuKrp50/kkjB8t+3pDtMibGOgNuTj6vWfNMgjHtT8gDlIzLz95/+j4n0uLfzpxsENhYpTwELIYtg47+mPxznKOOb5351xkKkRWUbz92NZhwWBW6asC+O6z5kL0ZaQyKNM27iD3WxXF0UiU1kt24Zj2K9gF5XbrxcdEHZRf/UiAQgXXTMfCmtt2T3D7zaY9DFGsFH/fyxtZDsI0N1CM/BSA07kzmHVGnz+epug8u3cpT5GniSp4X4zezdKrNo/+aUD/Hm5JAV59KncXSVTx0C3elJKLwFciXhDYQxI/QC35SZsxheWh/uMiseEDkWHOXZ/95BG6oGnqbsrnW4239nb6gUGHkdZRM76jjr1Vzxd6azG7qEgE9fNEtCA5pMxdBcdx1lOnJRrs94YYZitfVLWJK50XW6aXyvcfUKelRcDcFOXGSrqFcSYGu4/b4ObJBhSWIz5oNUChqXu15nW5auPVle0dS+HGX6mYcZ6JB7bNagP9EkJUA8VOo0moyGgd7hCeMN8rhYNnOmPBYPwzXqd4aRdGsMcTEcS95EFtKLgtAjiGfCniYxkr5CmitnjBoF9EHnLbhaK4r0t3xXbbGFHLc1LfwzYTQ76gWdZb/BmxEaCuIsMHF/lX5JqCpQ0Zkb6/K+Ufnjo7sgYL3d8jQdx9oZ3ZUG2Uc2Cky8Jec+xiUIgUndwIqnGRIGcaGPsIDcq5bmAEEKlfG23JIxPrrUrzQs1qfw=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(39860400002)(396003)(136003)(451199015)(40470700004)(46966006)(36840700001)(26005)(2906002)(81166007)(356005)(6486002)(6506007)(82740400003)(478600001)(36756003)(86362001)(53546011)(40460700003)(6512007)(33656002)(36860700001)(336012)(2616005)(47076005)(82310400005)(6862004)(4744005)(186003)(8936002)(8676002)(41300700001)(40480700001)(4326008)(5660300002)(70586007)(70206006)(54906003)(316002)(228453006);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2022 09:59:35.3179
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d80d9031-ae35-4c72-521b-08dacd396d24
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VI1EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7836
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Nov 2022 09:59:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173710

T24gMjIgTm92IDIwMjIsIGF0IDE4OjAzLCBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmlu
QGdtYWlsLmNvbT4gd3JvdGU6DQo+IA0KPiBUaGUgc2VyaW91cyBuZWVkIGlzIHRoYXQgd2UgbmVl
ZCB0byBwYXRjaCBhbGwgdGhlIHNjcmlwdHMgdGhhdCBhc2sgZm9yIHB5dGhvbiB0byBhZGQgYSAz
IHRvIGl0LiBBbmQgdGhlcmUgd2lsbCBiZSBtb3JlIG9mIHRoZXNlIGdvaW5nIGZvcndhcmQsIG5v
dCBsZXNzLiBJ4oCZZCByYXRoZXIganVzdCBhbHdheXMgaGF2ZSBweXRob24gYXZhaWxhYmxlLiBO
b3QgYSBwcm9ibGVtIHdvcnRoIGRlbGliZXJhdGluZyBvdmVyIHRvIGJlIGhvbmVzdC4NCg0KQnV0
IGFzIHBlciBQRVAgMDM4NCwgL3Vzci9iaW4vcHl0aG9uIGNvdWxkIGJlIHB5dGhvbjIsIG9yIG5v
dCB0aGVyZSBhdCBhbGwuICBTb2Z0d2FyZSBzaG91bGQgdXNlIHB5dGhvbjMuDQoNClJvc3MNCg0K

