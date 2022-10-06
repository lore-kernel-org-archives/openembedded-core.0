Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E161DC433F5
	for <webhook@archiver.kernel.org>; Thu,  6 Oct 2022 10:46:27 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.79])
 by mx.groups.io with SMTP id smtpd.web11.4272.1665053180826127002
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Oct 2022 03:46:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=ed59QRa2;
 spf=pass (domain: arm.com, ip: 40.107.105.79, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=ZTJ74NdMhaA/bfJeRdUCROZq6I77KD/5ZB8pEMxHlvqVWa3hspU2sS03p4ZLZZ26/X9dOaOOEpk4CakwQM3MOZo/ed+VlAd8Ou66XYu4dNNUj4HrMh0K3HQdroK44hic36PyfVsTj+rOBQWzSNrrOxhI/xVp8cx/nkBUMJrQkluxPQrjwN3kA8IN88xmucODEulljxflXgrQh+6D5NtlBrjrjOSe1KndTrtuE/3sNsy+G+Sc8SB4oTwYrNep4XMo4qdEy2EIKpkkboLbOtQW+C0xOt3uqqvC895G250KZr+FLUr92TUoJM4jkf63d0yCDQxdJwxCdRFpAlUpxJdf/Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DyTFBU436uOlgxay8mLjYpnwXJrEhW3qLoubO1XPSOk=;
 b=Tf1WGYUuOzsm1qWBmDl/dMOj8whY28U6It7zdmTCqMrxbJkyO80qkyImQaPnkhOmUXxooT0kK90fh1BCKSqQdfhC43TM9FPF5ulotiajsgKlcn6/dBfSnyYtHXXd+yTvIjKYFrSBHt/YXenfhpZuIfra+EyrjEOgVvwsnbfzcpEWBlraHtBizcAQK2BpV2lBPFq1OW2g1guxtf8+p5ClWUMwrtynP+cTOj7k0U89clUvS3TU/4hHEKvAZhSODsn1KsbhG3MkySY9bGNQUK6Da4lIC7HGFeodUrFRq/vvquUwTGdsqhy7eN29HH+b4r3IxjhoVQ+AfCmQPQlPuVULiA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DyTFBU436uOlgxay8mLjYpnwXJrEhW3qLoubO1XPSOk=;
 b=ed59QRa23NyRWV/c+fDt9wZO/Euf4H0QgSgtDDuSqcHZEpMRIzbpmIHBe4OmgnSHeCnRWaUtK3WgZa+d6DqWiIEENSVQ875xFi/DqdOVzuSTj4ThkaHksLB1mROMTzP+91ENNJATZtyvNjEfR4tDZnj9Ar1hcHbBujF92ZsMKPE=
Received: from FR3P281CA0053.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4a::6) by
 DBAPR08MB5767.eurprd08.prod.outlook.com (2603:10a6:10:1a7::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5676.28; Thu, 6 Oct 2022 10:46:16 +0000
Received: from VE1EUR03FT045.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:4a:cafe::64) by FR3P281CA0053.outlook.office365.com
 (2603:10a6:d10:4a::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.36 via Frontend
 Transport; Thu, 6 Oct 2022 10:46:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT045.mail.protection.outlook.com (10.152.19.51) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5709.10 via Frontend Transport; Thu, 6 Oct 2022 10:46:15 +0000
Received: ("Tessian outbound 7761be2ecf00:v128");
 Thu, 06 Oct 2022 10:46:15 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: dd0f879822f3ef53
X-CR-MTA-TID: 64aa7808
Received: from 4d89c3ff60f1.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6C7C1F65-0077-4D2F-9E46-5BA8E36268A2.1;
	Thu, 06 Oct 2022 10:46:08 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 4d89c3ff60f1.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 06 Oct 2022 10:46:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Je3CcSSmCM+hy3z/nWcNVUxdOMqh2UWgnxDAyqppeiswpMJ7xcGmt7oE5AWgjpbz5Bm4LtbYnuJfU17BZxSB/1oTaGIwJY02d3ud3DbPchxL/KuM/uqykwRvA+2DsXj8PYmNK2rOlrFpAgZRyUyjzKQ+Iw23+WB38fJk5gHdyh0aV1+tFq+L5YmOHXvAjcDe9b4iY2zn2eLbMNtQ0gDWoPSVnAElVuNaWZSj94WaErztc/ncSsZfOU16NCMRSGGYRMxMYXRYm/Rn/axcOX3eeF0m1rHEMigGi1RgfFvcq0HoRzCvJK4lq1F2Z8b4ef/Vfg6nuNGCqRB0ShJVn4vzjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DyTFBU436uOlgxay8mLjYpnwXJrEhW3qLoubO1XPSOk=;
 b=fi4GdLijNKgqRfpLXeleIQdw8+8fWbQctw6X9++gNb1v38dUB60ZbGfwS6+b+zqkC6GBukM0FSK/DhqBTXX/uNB2Hja0dyzXw3WGFORVNZkPi55SalRGlRWIEggcJu4yqN1zdO9im7Qnq20lLsJj808adkP0TSqErlBbsXacLniXtVgBEPaIhKRhL4VBXppdZDNl8CjDYoXMlg7Bb6zPEyU32CsZyqbhlIUv6w+BprOsnRQ/XRZ1mTUCwJqPNDbltZ4BRG8e1E6Wp6ETJmdm0QNfhac53mTEMnCmiJhdSUH0mhHi0tquFToXl8nkqZjrRDJSzJLG1GZDVTJzdMlaFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DyTFBU436uOlgxay8mLjYpnwXJrEhW3qLoubO1XPSOk=;
 b=ed59QRa23NyRWV/c+fDt9wZO/Euf4H0QgSgtDDuSqcHZEpMRIzbpmIHBe4OmgnSHeCnRWaUtK3WgZa+d6DqWiIEENSVQ875xFi/DqdOVzuSTj4ThkaHksLB1mROMTzP+91ENNJATZtyvNjEfR4tDZnj9Ar1hcHbBujF92ZsMKPE=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS1PR08MB7538.eurprd08.prod.outlook.com (2603:10a6:20b:482::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.32; Thu, 6 Oct
 2022 10:46:07 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7d2b:2570:9a99:a3d2]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7d2b:2570:9a99:a3d2%5]) with mapi id 15.20.5676.028; Thu, 6 Oct 2022
 10:46:07 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "fede@evolware.org" <fede@evolware.org>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH 1/1] chrony: add pkgconfig class as pkg-config is
 explicitly searched for
Thread-Topic: [OE-core][PATCH 1/1] chrony: add pkgconfig class as pkg-config
 is explicitly searched for
Thread-Index: AQHY2TijQzizUEkdaEKBfYJ7HMmWEq4BLzsA
Date: Thu, 6 Oct 2022 10:46:07 +0000
Message-ID: <A10C493F-F178-431E-B4B1-4F726DEB4ACE@arm.com>
References: <20221006040244.96372-1-fede@evolware.org>
In-Reply-To: <20221006040244.96372-1-fede@evolware.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS1PR08MB7538:EE_|VE1EUR03FT045:EE_|DBAPR08MB5767:EE_
X-MS-Office365-Filtering-Correlation-Id: 88041ac4-b0ef-4809-11d1-08daa787fe80
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 d2DIfl0r0DTe8YoGuPwQ1n1WtxtsAH8clrHRqM+RFJR6YFVoJsCA7vg6UVocVfmSt8OW85XUgJJwn46WdsNT0whWq6q72Qk5B9TLACiU7CloaE/Ci2m7Gm4SrnE6UzfjNXg6opBf75bKjsr4kdyL6TEPnms9vf5JQIXhfsm8qzwwl6R0MSLplTfFX5pXCU5GVl6c9rDg92CSgKCeHlTD9G26rgDLBweJ82n77AKe4RhtfflLe7/rrHzPpnCEM7Hzyh2DtYvx2yZQY2rqrkdBNxIA5i6gVZQWZ2374b3OHTaODX2A/iPXQsKgO8CQuhUojZE1Jck0bPv61Jq8HJw/xL2w+gY/7crLPW24dr5rVaai5s1W+KhhouRR5/on2+dS3nmavEtof2hc5LOhm6APydeH/73J55TB1XzA06k4zhKLghmnYpxLlVOF3TSwT63sFxBK0fllkLJ9nU7wFcBiVYPYEyNR5/JxMFh/PjO3E0EaK7EMOlanI4Kxl2Vzl9VXsIc7Ru7b10WXV/xuVsFO1GDlXQsX6RFTbVX2iu42xMpIT3w/qM7jLCURhvRMNUmHsj7Z/FoyaulSHaHfp5BDh8k0BjpZxqMa/yX5NvLROFRKZwG/dCpiAG6cF43AH9bHfyeWMyb4VxHZtaSp8dp3NU5MEjO9/ANn0vQYJmMgUwnfNA9aXiBFlMmQR/YTdAygowMTlpIoKIfgC0883+oxVzRWaylm2+MkjBq4igzbVZepWk1Yx+Qrxp6YqlmQgHdu0ZffRf3puhYGHGMSRPJXclguPMVAtrNEVkzkC80E1rHM0thm3uSuAlacKDv66n4QFJzYe32ynEMav7smRJoW4Q==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(366004)(376002)(136003)(39860400002)(346002)(451199015)(966005)(71200400001)(6486002)(66899015)(478600001)(91956017)(2616005)(6506007)(76116006)(186003)(6916009)(8936002)(2906002)(122000001)(5660300002)(4326008)(38070700005)(8676002)(83380400001)(64756008)(66476007)(66556008)(26005)(53546011)(6512007)(316002)(36756003)(66946007)(66446008)(41300700001)(33656002)(86362001)(38100700002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <A5D1C0AE8330F94992BBC47F645FB12C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR08MB7538
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	7839f211-90c8-47e5-0971-08daa787f979
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	VmPD+PCy2Mxr53mvUGURs+TtuQNsMtaZrehnrJGh3Nb3lKN2p3WdO0/KZD2XC/ldsyg87WURjR++c6e5zheoFud+gFqjIPp9jfttyp+TwiSudPivMOZnxeZHcfb9JJJxx+b6QsDeidrlWNpEIDV8kPBBIu1e/ABgnj1tF7417QgQYaA8MnE2pV1IHRZyMgiFaDbc2Y0jv319ArsQbiM+ydIGV2G8QtnnOABVxbmo6zQhj59FRabanRcGl17ng14dwB6c1iI9NrDlLj6UD8E0VBDulkfPQybfkcE1BTa5gDpO2FHPyZKzQeeo6LEOsTUsRJzIWkuV6Zhk2O0FVcn07w7cTmqPM9LMH2j9U5RzgreDs4HYCQ/HymvSw4P6AzCsvfNL2je9+KxrXH+2taiBu0x0FxsWFFnfI3wT7JoKp4HKqdw6/7mt0dHYmwMY7WtYLMELsRGsGT6wftn0wIB+Zj39x3er/9z/F8FXD10kNukfXyEbniysg6NCVdaUEhX6H5EGQWnjhjGxrdtsy2zVp19KGjWEDCQ70s9KtH6I6pWPM8y++azxd7cmqzUksNYti0UHrazHgGLaLHWT7tfuz8xttsC2WW0DsZaDL00TkT7A0lTrZ/0Vf7c3xspnaOdKMkrxXJ7/wxNw35F0cVV6wWHWteTHOQAoxRA1p6ITbmjdCxDfnRVPmWgAOsZ1oaHd7Dqc33cF10vATdZ4ApI/H/W+VywwDwohV8vUBxtUIkD65Sv3MDOaNoqpuBbuLgdHoSXmXWuo02v0X04PJ58hAY2nts/GGw9kMn0hNcLZA5g=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(136003)(396003)(39850400004)(451199015)(36840700001)(40470700004)(46966006)(66899015)(82310400005)(36756003)(2906002)(5660300002)(41300700001)(186003)(70586007)(47076005)(336012)(83380400001)(2616005)(70206006)(81166007)(4326008)(33656002)(8676002)(86362001)(8936002)(6862004)(40480700001)(966005)(82740400003)(356005)(40460700003)(53546011)(6506007)(6486002)(26005)(316002)(36860700001)(6512007)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2022 10:46:15.7482
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 88041ac4-b0ef-4809-11d1-08daa787fe80
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5767
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Oct 2022 10:46:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171490

VGhpcyBzaG91bGQgZ28gdG8gb3BlbmVtYmVkZGVkLWRldmVsQCwgbm90IC1jb3JlQC4NCg0KQWxz
bywgdGhlcmXigJlzIG5vIG5lZWQgZm9yIGEgY29tbWVudCBpbiB0aGUgcmVjaXBlIGV4cGxhaW5p
bmcgd2hhdCB0aGUgcGtnY29uZmlnIGluaGVyaXQgaXMgZm9yLCBqdXN0IHB1dCBpdCBvbiB0aGUg
c2FtZSBsaW5lIGFzIHRoZSBvdGhlciBpbmhlcml0cy4NCg0KUm9zcw0KDQo+IE9uIDYgT2N0IDIw
MjIsIGF0IDA1OjAyLCBGZWRlcmljbyBQZWxsZWdyaW4gdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmcgPGZlZGU9ZXZvbHdhcmUub3JnQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdyb3RlOg0KPiAN
Cj4gVGhlIGNvbmZpZ3VyZSBzY3JpcHQgcHJlc2VudCBpbiBjaHJvbnkgd2lsbCBleHBsaWNpdGx5
IGxvb2sgZm9yDQo+IHBrZy1jb25maWcgYW5kIHdpdGhvdXQgdGhlIHBrZ2NvbmZpZyBjbGFzcyBp
dCB3aWxsIGZhaWw6DQo+IA0KPiBDaGVja2luZyBmb3IgcGtnLWNvbmZpZyA6IE5vDQo+IA0KPiBU
aGlzIHRoZW4gYWZmZWN0cyB0aGUgcG9zc2liaWxpdHkgKHZpYSBpbWFnZSBmZWF0dXJlcyBvciBi
YmFwcGVuZCkNCj4gdG8gdXNlIGZlYXR1cmVzIGJhc2VkIG9uIG5ldHRsZS9nbnV0bHMvbnNzIHdo
aWNoIHN0cmljdGx5IHJlcXVpcmUNCj4gcGtnY29uZmlnIHRvIGJlIHByZXNlbnQgYW5kIHdvcmtp
bmcuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBGZWRlcmljbyBQZWxsZWdyaW4gPGZlZGVAZXZvbHdh
cmUub3JnPg0KPiAtLS0NCj4gbWV0YS1uZXR3b3JraW5nL3JlY2lwZXMtc3VwcG9ydC9jaHJvbnkv
Y2hyb255XzQuMy5iYiB8IDMgKysrDQo+IDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykN
Cj4gDQo+IGRpZmYgLS1naXQgYS9tZXRhLW5ldHdvcmtpbmcvcmVjaXBlcy1zdXBwb3J0L2Nocm9u
eS9jaHJvbnlfNC4zLmJiIGIvbWV0YS1uZXR3b3JraW5nL3JlY2lwZXMtc3VwcG9ydC9jaHJvbnkv
Y2hyb255XzQuMy5iYg0KPiBpbmRleCAwODNkMmNiYzAuLmRmZGI3ODY0YSAxMDA2NDQNCj4gLS0t
IGEvbWV0YS1uZXR3b3JraW5nL3JlY2lwZXMtc3VwcG9ydC9jaHJvbnkvY2hyb255XzQuMy5iYg0K
PiArKysgYi9tZXRhLW5ldHdvcmtpbmcvcmVjaXBlcy1zdXBwb3J0L2Nocm9ueS9jaHJvbnlfNC4z
LmJiDQo+IEBAIC00Nyw2ICs0Nyw5IEBAIERFUEVORFMgPSAicHBzLXRvb2xzIg0KPiAjICAgICAg
IGNocm9ueSBkb2VzIG5vdCB1c2UgR05VIEF1dG90b29scy4NCj4gaW5oZXJpdCB1cGRhdGUtcmMu
ZCBzeXN0ZW1kDQo+IA0KPiArIyBUaGUgY29uZmlndXJlIHNjcmlwdHMgZXhwbGljaXRseSBjaGVj
ayBmb3IgcGtnY29uZmlnIGFuZCBuZWVkcyBpdCBmb3IgZ251dGxzL25lZXRsZS9uc3MNCj4gK2lu
aGVyaXQgcGtnY29uZmlnDQo+ICsNCj4gIyBBZGQgY2hyb255ZCB1c2VyIGlmIHByaXZkcm9wIHBh
Y2thZ2Vjb25maWcgaXMgc2VsZWN0ZWQNCj4gaW5oZXJpdCAke0BiYi51dGlscy5jb250YWlucygn
UEFDS0FHRUNPTkZJRycsICdwcml2ZHJvcCcsICd1c2VyYWRkJywgJycsIGQpfQ0KPiBVU0VSQURE
X1BBQ0tBR0VTID0gIiR7QGJiLnV0aWxzLmNvbnRhaW5zKCdQQUNLQUdFQ09ORklHJywgJ3ByaXZk
cm9wJywgJyR7UE59JywgJycsIGQpfSINCj4gLS0gDQo+IDIuMzcuMw0KPiANCj4gDQo+IC09LT0t
PS09LT0tPS09LT0tPS09LT0tDQo+IExpbmtzOiBZb3UgcmVjZWl2ZSBhbGwgbWVzc2FnZXMgc2Vu
dCB0byB0aGlzIGdyb3VwLg0KPiBWaWV3L1JlcGx5IE9ubGluZSAoIzE3MTQ3OSk6IGh0dHBzOi8v
bGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1jb3JlL21lc3NhZ2UvMTcxNDc5
DQo+IE11dGUgVGhpcyBUb3BpYzogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL210Lzk0
MTUxNTA0LzY4NzU4ODgNCj4gR3JvdXAgT3duZXI6IG9wZW5lbWJlZGRlZC1jb3JlK293bmVyQGxp
c3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gVW5zdWJzY3JpYmU6IGh0dHBzOi8vbGlzdHMub3BlbmVt
YmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1jb3JlL3Vuc3ViIFtyb3NzLmJ1cnRvbkBhcm0uY29t
XQ0KPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPiANCg0K

