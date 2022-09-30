Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0124DC43217
	for <webhook@archiver.kernel.org>; Fri, 30 Sep 2022 16:30:09 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.76])
 by mx.groups.io with SMTP id smtpd.web10.1110.1664555404819541468
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Sep 2022 09:30:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=NMtrnBNX;
 spf=pass (domain: arm.com, ip: 40.107.21.76, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=D3huOzhzA7ifHFbXfbg8Ye+BKngfEnyQBQyFRZkY2mg6SBgmbzcdM8lx2VlM0qy12luhrFo/FVODp08MulNWCf4C7qIt9nu4d5i2wxiWiWArmOB0v9bj7NPdkPTI0W/inE90yt8jtWC6F4VlAFNWubrahnB9X8Xv+4Fx5E0Cf2coREnEXNXRzz/2kX9wSyydrjwkcB2v+QuCG3xxzqcT+kED+Z9adtYD3cL4q663H/hQFdIHwtg/h89EscYwkV8ILYf2sAyTrE3f9iA6sBk+qAqCuzPRk6ZBFdy96zYWtdYXoV2BBAbN44XW2/SsqDNo0T6s7XdoHMZcR0Jt9lZ5vg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qGT1kBPqbk+CWzU4gsLvmu/Wi8D+kIPVYhWlBSONPHU=;
 b=hnr16lbBtZszroEqMsV9+WMLPWlBpBRJD6d5Bqq1tPmR2OoMA/6WQ+wFRAikAgNLhgXvt4XUASRaGxrfrKBYADEVQlEKP/0+CfbxzCZciNPhovVgPYo5IPTKYa1kG7KwF3yhGDIfNMOAp76esY3uZ80SABKDuBCnynd06bu8JRYkw47/YSHY55fC0U8guVGbzQfllzdRBWGaAH2Jl2+zPYlHMuUHcRJYgOU6/QTDp4dgCcQ4FXAVZg+MZmC75XbQRVixsApRqKy4iakRS5TrX6P72eAFEAmq92UkOJctWuBDPx8nSnnSDnBjJ4iwhcKN6+nfI52IvgEyxplfNeYyVA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qGT1kBPqbk+CWzU4gsLvmu/Wi8D+kIPVYhWlBSONPHU=;
 b=NMtrnBNX+BrM+1TX8ANftRFdMvmg3u4ceGUMm0+UaeqqtLsgobHiV5rTOwGXI5iESroKuk11Fryjyqr16DqoN70EnqVKmSiAS8y7KAPIX8RBYnaLeUIQA0UYNZ2jcpcVR6DakTfcSCoJtoojPNj5M7Duted3aF6kEMV2plP2/wg=
Received: from DB6PR0202CA0021.eurprd02.prod.outlook.com (2603:10a6:4:29::31)
 by AS2PR08MB8288.eurprd08.prod.outlook.com (2603:10a6:20b:557::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23; Fri, 30 Sep
 2022 16:30:01 +0000
Received: from DBAEUR03FT048.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:29:cafe::4c) by DB6PR0202CA0021.outlook.office365.com
 (2603:10a6:4:29::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23 via Frontend
 Transport; Fri, 30 Sep 2022 16:30:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT048.mail.protection.outlook.com (100.127.142.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5676.17 via Frontend Transport; Fri, 30 Sep 2022 16:30:00 +0000
Received: ("Tessian outbound d354c7aef2bc:v128");
 Fri, 30 Sep 2022 16:30:00 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 878ce8f8aab6e3bf
X-CR-MTA-TID: 64aa7808
Received: from 192747c5a542.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 77165EDE-C9F1-4E8C-83D1-FD1050275EDC.1;
	Fri, 30 Sep 2022 16:29:53 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 192747c5a542.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 30 Sep 2022 16:29:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fB18wAoGWaCZ3fGfUTtjtoKJ64cIAcCX3Y5TTcmOPcEbIp7FDa/zVsv1UbwqKzPcjqNYh4Q3DdX68MbwS2PL//27orELeESwpNyp/turHtWOebx3SxpjVsNoE7NFErP3jT1EedZ/nQ/pRsaHTyUMWA0kUGcM5f2OaxX4dKwL8qJ2CD4a8ETJRxNhBy5NcuS1FicP7PfNzqNf/ckYwUhXX2t1gov8vs24H9ncLjmMoFuBb+P7Nk+P2l+bZ6CLYWB0vDr2fpCjC0n9npHeM6ZYGNuTstblCmVABCzDqozJ+pha0C5tGYaq6FxkAKkOUzxz9SrzRJ4pTKusiZybmd4M0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qGT1kBPqbk+CWzU4gsLvmu/Wi8D+kIPVYhWlBSONPHU=;
 b=BTH85tYSfWD2rcfg6RXS93onRvh1sBS5ScS+YjkHbf7+Tnvdr1mKjWgmr+DJ7JK4F0pKczOAoLxdnmCzrnV8P6Ot4lKrS6eKEVKIqM73TCDBDANwqVX/9XP1XMlUmUnBTnfzU8yfeRwW1hpT0HO8QxBrHRPPE8BBxcP1EBil9QXU5eIsm6qo/uWFp6C0Us23FZOynA3cT94aMRL23LtDtZn4GPPDar2J+e6GPgZVqze5a7X3xhSbSmUDYiQQS5oIzyuA7avSQC8shV41SBzWZGkELF1mkRlCZmkcAGT+Z/iez5Cre44g22iNeHQIHpXPEwfkss74NMPQOPbKiByhxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qGT1kBPqbk+CWzU4gsLvmu/Wi8D+kIPVYhWlBSONPHU=;
 b=NMtrnBNX+BrM+1TX8ANftRFdMvmg3u4ceGUMm0+UaeqqtLsgobHiV5rTOwGXI5iESroKuk11Fryjyqr16DqoN70EnqVKmSiAS8y7KAPIX8RBYnaLeUIQA0UYNZ2jcpcVR6DakTfcSCoJtoojPNj5M7Duted3aF6kEMV2plP2/wg=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB9PR08MB7674.eurprd08.prod.outlook.com (2603:10a6:10:37d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23; Fri, 30 Sep
 2022 16:29:52 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7d2b:2570:9a99:a3d2]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7d2b:2570:9a99:a3d2%5]) with mapi id 15.20.5676.017; Fri, 30 Sep 2022
 16:29:51 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] openssl: Add missing perl module runtime
 dependencies for ptests
Thread-Topic: [OE-core] [PATCH] openssl: Add missing perl module runtime
 dependencies for ptests
Thread-Index: AQHY1INuHCxkyMIu9UeLDtUzW8mrR633wj6AgAAF44CAAFsqgIAAB2cA
Date: Fri, 30 Sep 2022 16:29:51 +0000
Message-ID: <EA0EFA99-9A83-4699-9D0D-AD5279C58B81@arm.com>
References: <20220930041614.2704304-1-raj.khem@gmail.com>
 <C9A0CBAD-5373-4F4C-BB73-0AD10A2DF000@arm.com>
 <042F0314-BF16-49A5-AD68-81DFD17739E6@arm.com>
 <CAMKF1srZEorOx-hPiD1zZx1DMiJdZbHgknub04hfyfRFzEhNcg@mail.gmail.com>
In-Reply-To: 
 <CAMKF1srZEorOx-hPiD1zZx1DMiJdZbHgknub04hfyfRFzEhNcg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB9PR08MB7674:EE_|DBAEUR03FT048:EE_|AS2PR08MB8288:EE_
X-MS-Office365-Filtering-Correlation-Id: 253c990b-c76a-48c0-3117-08daa301053f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 21bMzGaT4oBaPoAIiCG3LG4AMqdXgYtLj3JrcqYjyMdH5ZV4naAX+Ws3uDiknI4EXioUeGbdm44hYq4pxu6Xscd+uiO+XLuRMZmgGqwciZlNLnFXBDmVqH2sxFe7/3J3t+yhuBdQHYbfyH+yD30mJKFKRK0JMl8hswbOhcTFkF8ecs5c2c67Tx/yPTYDmr0MtZOhiwXwrPlu8fBLangqdg82txeaSFATIMTzbpgxQOWDzo9mKMlgLTwF6Tl65EA1iEKfx4cN/2f9j5JWf95fD/chTDY7QGitY9UIRFUhRY822EOnjZmt8F9QgYO8H0EP23F43AZUdpp+1vbC5pZsnUXn2OQed9p9E0DxEqIMamkrlyLJ3anp8vToJ2+pDc7uFwrauPGsZkzG8e/+cbHel6InerjmZI/uHUxuncY4tbcG4bxUmRh5Y9q3MXgaM2beRu4c94kRauz7wvg8c3ypkj4IPKG9fE1BeLmNy0G76VRs9/mWatgyIhJ4e7eUr2uco41jclqT7iCeyVQSjzlmceeWSnLAngS4ulpGcMpinLqzOxZbOcTcpg/KbouVc2cNuavV+d9TXj3ZrLrA2qhut9UgxkbBR+akZ8EZCxzh/wYUkNWkLEwyaCSnkOsxIi+oZhvUok7VxFwQJ2SioULtNFeQGb7ltyItCNYwRIc0zRttdkIyXIxin/GUi8AoZ6NavGbzh2TXS+pejDTNWaQYKrtcuJDGkhb6/7brqy03BfAzs2MSee4BU2PeV8EcXxxMqvVXqA7GXtNLGqPeqzD2lsOyudfLu3Qu/59x7CjEye4=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(39860400002)(396003)(366004)(346002)(451199015)(4744005)(38070700005)(122000001)(76116006)(5660300002)(8936002)(53546011)(86362001)(6916009)(316002)(26005)(6512007)(71200400001)(478600001)(6486002)(6506007)(66556008)(4326008)(66946007)(41300700001)(66476007)(8676002)(36756003)(64756008)(66446008)(33656002)(186003)(91956017)(2616005)(38100700002)(2906002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <1F7A918ABB02AA4793A8ECB81DA7C88A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7674
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	478fb929-09b7-4b7a-0d99-08daa300ffa4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	wiGszcxL4SfDHBgL1FFiVXKnfd3woPTIP45DWY6LBM9BKdsE1bFw8nIuoeH6eE2wCQf//jWX6X2b23paNaKuNfbYErWlX1e7HeStLS72QecXEx7382D12/IBiLAFiyIkpXmHmuGax0ZCEzlmn4KHUZLWDRmtntZ/Q6H1pP6zKXv6XMYvp+UDBqz0v4rkRRhOZW94H0901MU1NniTZDoxLBMZB/2u+Mem3LL6a3vn88z3gG8/s410YsH9sZthB+niN6euJp295r7YcvWVBxv7AqGT/2crZn3fzzTjei9Q8E2hqo1MwywE8uCP/UqZMa/xBE2hCTRvXyqsBqurtnD61RT4leLLFcnVQ74F+dNaua6aDWrsObp/a8S1GSltu3CZaV4NOFBtkkOduwfHO/BFHJ3o4nzneYeNbXnCx/QH/Ehwr5TQKsAysBs6ljTbsUXhFSk3CS8piulztwk3B9VmWkCnXh8jHoIF/rvil/LjTLVnZpVYGvvznhOI3qKka6HKRM9FaZKsYIUO/UrMSFM2GfXtdpv/kn6qXQ008qNoMeBkHBjXy0Ed2aNe+ebQ+eYRv3MQybBKBLsvqBiGr5R9yi3DM2xX1TMiCWM/XFV4/v2iv4+pP9U2QRCUm/4L4evC8LNy+VpZxtw/HesR3oW9sesSHtVtiIeHK+f7cXI00lhEYjk+cTM01k1muYni3Hpw0bMlj+Qv7oxWrSlyhpPWfHRUY47x94QLOa1zB6+2RMvGlAZg0+NucrF4tL49Rw4b2drKV6n386kqUNV509lBWA==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(376002)(346002)(39860400002)(451199015)(36840700001)(46966006)(40470700004)(6486002)(86362001)(478600001)(316002)(33656002)(53546011)(26005)(41300700001)(6512007)(8936002)(36756003)(6862004)(70206006)(70586007)(4326008)(8676002)(5660300002)(336012)(2616005)(4744005)(2906002)(6506007)(186003)(40460700003)(36860700001)(47076005)(40480700001)(81166007)(82740400003)(356005)(82310400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2022 16:30:00.4668
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 253c990b-c76a-48c0-3117-08daa301053f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8288
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Sep 2022 16:30:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171227

DQoNCj4gT24gMzAgU2VwIDIwMjIsIGF0IDE3OjAzLCBLaGVtIFJhaiB2aWEgbGlzdHMub3BlbmVt
YmVkZGVkLm9yZyA8cmFqLmtoZW09Z21haWwuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdy
b3RlOg0KPiANCj4gR29vZCBwb2ludCBJIHdpbGwgY2hlY2sgaW4gdGhpbmsgaXQgd29ya2VkIGZp
bmUgd2l0aCBnbGliYyBidXQgbm90IHdpdGggbXVzbCBiYXNlZCBpbWFnZXMgSSBzZWUgdGhhdCBQ
ZXJsLW1vZHVsZXMgaXMgZnVsbHkgZW1wdHkgaW4gcGFja2FnZXMtc3BsaXQgYXJlYSBzbyBzb01l
dGhpbmcgZG9lcyBub3QgYWRkIHVwIA0KDQpJdCB3aWxsIGJlIGVtcHR5IGFzIGl04oCZcyBhIG1l
dGFwYWNrYWdlLCBidXQgaXQgc2hvdWxkIGhhdmUgbG90cyBvZiBycmVjb21tZW5kcy4NCg0KUm9z
cw==

