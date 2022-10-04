Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4815C433FE
	for <webhook@archiver.kernel.org>; Tue,  4 Oct 2022 13:45:47 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.44])
 by mx.groups.io with SMTP id smtpd.web09.10900.1664891144724745179
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Oct 2022 06:45:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=vSx3wJtE;
 spf=pass (domain: arm.com, ip: 40.107.21.44, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=QdwjwqKsnKKophQaUuzY0Q5xMoKrLTUC60P6RNAszina223JP0XppzQ6Hj+UWppaV+H99rJ2eQuw41/awf8zHOZXp/XPlv3yvXvkp8iOhYdB+gu1p+4TF+gC/GAA4CkJv0+HiDoD0/Nl2O+KVyXKQvqYPv+mBdBuvXvxeNf0VFWz0p7zt3rbIMa7wM42XDiLK2EVDPCcIiK5Su1M7VttiDYrEhyBgdsCzrElJ+o/4nCJnAX7VFyFZtMJR2axvnY3MlrwGTP2DyEJC9LkElTBvJt7cbkGj6F/qb+0X8UXHweZ1ZwzDjBzQCYJ5/lf6GkGV4jUWlQyT+x3nTj9N2ITdQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HQvLZmxM5AXjskMy0Ws30meG8L/nAPrwdKPr4I3kfHU=;
 b=AMpjuLkUyH6cIyE4+WtmfDDtG99PZBJM9V9vEBO+oapSNzK78nT3DNQJptF2Lwa9LNYL2D77namhDeuswAK5kXZzjkpAXBdSSLYyTmxQLckdNqPBjr9FyuRc57wfh0p8Gi5LTRgfAaogOUN6m5/GVZVuI//TMLEX5fiEHEC9X9vaUK0Vb9IVlJk0iQejZS2ODQSgqBFfIuqe9Z4zR0+nqxvhNkAu/o1wcqUMle6P9yHCnjO9UU+S/s/eW/E6SWH7OWzI9QyZ9a0pDEY5VnQlGeVOcgt3Gpm0udEvFk8wBv8nYr95k618ZpnXHXLbu8CTLJTdiOp2rShhMPHH65tByg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HQvLZmxM5AXjskMy0Ws30meG8L/nAPrwdKPr4I3kfHU=;
 b=vSx3wJtEJzBXvWXTVRyL0GGi5ueORzWQXebpPaF7IIp2q6RA5VZso3sp2PyBpEgqjxleLX/jkaRvWF+7h/RRj0oWbqLtUTBePQkGJLr2ICS3tQfuQo1wjXJmmXZEsKQEGkuSDTq6DKqzkUX720u434cWdu1aoIXIjdbCrPlKtWI=
Received: from AM6P195CA0032.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:81::45)
 by AS8PR08MB8297.eurprd08.prod.outlook.com (2603:10a6:20b:537::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23; Tue, 4 Oct
 2022 13:45:40 +0000
Received: from VE1EUR03FT045.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:81:cafe::24) by AM6P195CA0032.outlook.office365.com
 (2603:10a6:209:81::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.31 via Frontend
 Transport; Tue, 4 Oct 2022 13:45:40 +0000
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
 15.20.5676.17 via Frontend Transport; Tue, 4 Oct 2022 13:45:39 +0000
Received: ("Tessian outbound 99ee3885c6d5:v128");
 Tue, 04 Oct 2022 13:45:39 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 916a7baeee39424f
X-CR-MTA-TID: 64aa7808
Received: from 8cfbd3c23666.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 77989AAA-FCA4-48AF-9CA8-1E16B78954F5.1;
	Tue, 04 Oct 2022 13:45:32 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 8cfbd3c23666.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 04 Oct 2022 13:45:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mi6qRy+NkTGMoUP/8/6knFyBS4Zt9By2YDX61EcpTS+vPvynvvkcHwwyf4Uz+O3UtL1vyFUo+m2fAXbQ+67mIWYpzS1h/4+fngcxzGSY8WdzIgshTn1TI+MXbSw78PM8rDFRcM7OM07cXh3fC+3T+YFWU9sAd7UTVWCJhekkz9Y2Y08UIfGAXajYphZ2vzpS9XANOdEUS8QdmbGZANaYfn4/m6Q1S8ggV+Uf8sj22z7Az+/mfF7sFjl9+FzIjmLmDjbH+cowcJFu9PP9+4xKM1YPvHOk+6krHjS0KtygqWr2slFGRgz7bCXS978of3j83JUK1yg8PLXw4NVFmP7bvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HQvLZmxM5AXjskMy0Ws30meG8L/nAPrwdKPr4I3kfHU=;
 b=UQyphgkzMiVHV4bU2FyhoBAwbOVCoWLN5Bq0Dxr8zqUJvOtcETw80WHU9scHFFna5Urjzg/+PN6J5fMDul/ulItVR+zoGo2LtaoxzelTQ8PvmQpS1QWDZtq36UrUA+sMEa2plNt6/nsUOPvCEBvOXesND5DByE5HWiRl7PukJh3nvHmARZflYHv4IDqJPy/Owj9bT3Cl+1lUhq1UP3Mu9WmdmcEdqACpmJuxrmkKFyFk4KbjfHzjqrOUVvVjTWSqtLJ0EXgO8AOICqpi/xFJLUEq8qZ+nkFNYryNYnMLkYwXAN9r8AEPBFF9zoOQtXaEmV0PQw05Z/UUqW8colIUjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HQvLZmxM5AXjskMy0Ws30meG8L/nAPrwdKPr4I3kfHU=;
 b=vSx3wJtEJzBXvWXTVRyL0GGi5ueORzWQXebpPaF7IIp2q6RA5VZso3sp2PyBpEgqjxleLX/jkaRvWF+7h/RRj0oWbqLtUTBePQkGJLr2ICS3tQfuQo1wjXJmmXZEsKQEGkuSDTq6DKqzkUX720u434cWdu1aoIXIjdbCrPlKtWI=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU0PR08MB8304.eurprd08.prod.outlook.com (2603:10a6:10:40c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23; Tue, 4 Oct
 2022 13:45:28 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7d2b:2570:9a99:a3d2]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7d2b:2570:9a99:a3d2%5]) with mapi id 15.20.5676.028; Tue, 4 Oct 2022
 13:45:28 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "mikko.rapeli@linaro.org" <mikko.rapeli@linaro.org>
CC: Richard Purdie <richard.purdie@linuxfoundation.org>, OE-core
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [docs] [PATCH 1/4] openssl-native.bbclass: add bbclass
Thread-Topic: [OE-core] [docs] [PATCH 1/4] openssl-native.bbclass: add bbclass
Thread-Index: 
 AQHY1+HOhHplFlbuS0mgYC8GA2qXKa3+G+wAgAALeICAAAnKgIAABDOAgAAGbYCAAAOOAA==
Date: Tue, 4 Oct 2022 13:45:28 +0000
Message-ID: <06BD1A20-33CE-4201-B484-39BACABDBED3@arm.com>
References: <20221004101038.2736600-1-mikko.rapeli@linaro.org>
 <99339c298138b6f300146d81beec455815b11771.camel@linuxfoundation.org>
 <YzwbPsiFw9YDMAWe@nuoska>
 <01b508d0ebd4b4bac844367910d8045ca4c54ef7.camel@linuxfoundation.org>
 <YzwtE5kjPWFOzYxU@nuoska>
 <9f0b315f790901f89449bd983f60c9092a14e0e6.camel@linuxfoundation.org>
 <Yzw1/WhHjPQTCS8W@nuoska>
In-Reply-To: <Yzw1/WhHjPQTCS8W@nuoska>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU0PR08MB8304:EE_|VE1EUR03FT045:EE_|AS8PR08MB8297:EE_
X-MS-Office365-Filtering-Correlation-Id: c34c6244-7d0b-4209-9a2c-08daa60eb989
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 pxYMYX4H5j/e5neW3ipLRHjm0p/rXVr2w1mHscCrLcDwEFO0U9FDs1BEfDdRTA2Ek3fnFn3HKNiU+5yA+hHK5rbBxpCYPQSKcBO3i8uVQb/FUvG6dLClSR/xsj8/UHbUcklOz1iyEdUxnxBkklekvEnOQvU5r/RV8+DqWY31LO9tD9AtyXrJ4v+EKG5040HDh2gLMfTEPpmtyDLU7KHxahfs3BcUrXOuZhJc1rd8orEM64dLP+OlStIQIowdSBGYXreawjHY6RTFT0s7uIe8EioIqMn68QDrqFxCal4ZScfAzX9zNjb5O5QRLt0BNAUEWeJSPf2ynP4yaxqFpbKsUMPkM5WHE4iIN6RzIxc0emCugMuwFqYbd8ec7baXiHg9Jpnb7ueysSMyG6hszPkJtuJ9PN7A7cTZECu6rx7P/Vx/Bu5XA4G22kHvNZtP4TroB+z59Fhk6hi7Mh1tMpRIjg9XmNdyOGue4pZwQzjV3kl+L8stjRg4AODXSp6zZgw5qx/li2ghHVrVEh5Sc84xPg0ShSsmxMWRK5Pq0M9xmREQwKB2Bxr9GBCeyIT4Qef9DoxgMnCTYDn/s7sNtwwO9IKuLzU9gXwr+TUCWrBft/NA8CC+klHBv5TjOUzJ4ZeS5w0gjh96O9lRpOKH/jxb2k5I1RuxEk7r6saszayyPPQGC3n1nOyW0YRo/eCGvi6hTpYu6TcL1CTScw4C2tmkn3EJKRd/BYgdZXqJFIAiFz7QpXMjBb+WYoEsV4QdP8gE7Ae0Cg38mboQnU86yneK+itrEw9v2oarLP7NurIvXIc=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(366004)(136003)(376002)(396003)(451199015)(36756003)(54906003)(6916009)(33656002)(86362001)(76116006)(122000001)(4744005)(38100700002)(186003)(38070700005)(2616005)(53546011)(6512007)(66556008)(66946007)(71200400001)(26005)(83380400001)(6506007)(64756008)(8676002)(4326008)(316002)(91956017)(5660300002)(66446008)(6486002)(66476007)(8936002)(2906002)(41300700001)(478600001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <DA0029B56B993C4F8178E55C2B8F2C5B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8304
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	583973b6-b67a-476e-6b52-08daa60eb2c7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	0DQ5b+/53gtqaNNy2xqcurlLYS7gN00vCXGp/MVYF6YihFGa267lhpj3KDWFQM1veG60C4rlMtueTy644GUL4fTZaHrG+m0EdAXHWcewU81+ls+u1GOwwjWNHMJh9+KIba+qAAKR7AooXeAFioQ95TfNVQybgCyn9V+MKLxi2apDYDtpMuC1QeAM0SbJpRr0xwVd1XDnu3TKoAgWKF5mXY5MrV0QKYVUWxwyvvikjIsu2tx/kOHCbNQbrOd+uREVIDA2LUzO9WZfo0SvwAPd6gr7GK7SlOt3oavph9jSGjnrV7QUsQpqaWEn6KCUxGyI1fyd2Yq7F8mVopD2gFqYllRoomSf4Juaxm0/T65n6e3Cn4lUiACrUMtr/9SxttshQki4NICVcK3mkbj9t7ovgxQKcS4yCcEo7dOmY34N55oKFmS3SP5H4EjvMhaN+sCUH2e8egtDVpJKWsUe2/olA2d3w1x3RpqPTy5GUXDnk+d/P4h1iBzHn6IKUpxq4yLGKk8Fm2JAkj1bNFdisHvsihwpN1aeA/RY9M18+SG+oH/wCF5HjthgGc8GfuXt7DfchkOZ7xSSawbKbrK+bjiv/RuhS8dXbX8UPd+9e+U6U/BNPoeDJXRA8MTPfB8zigQv8qB8hiq/Jl5f6OmUJGfFcRjgca2qUPWYxnPoWDMZ0NWrZjXmzGQDTR1zHs60caBgFOpQCGmwynxkGUJRGlZe7QZVXOVp7Msv3e80O7RN6kQ/pLjOQDgpj8fZdo9Us6AC5gbH7ajXOCYF+q7Z57PrYg==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(346002)(376002)(136003)(451199015)(46966006)(36840700001)(40470700004)(86362001)(8936002)(41300700001)(4744005)(5660300002)(2906002)(6862004)(316002)(82310400005)(54906003)(6486002)(82740400003)(36860700001)(36756003)(478600001)(70206006)(70586007)(4326008)(8676002)(356005)(336012)(40480700001)(47076005)(33656002)(83380400001)(186003)(6512007)(26005)(6506007)(81166007)(40460700003)(53546011)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2022 13:45:39.7808
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c34c6244-7d0b-4209-9a2c-08daa60eb989
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8297
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Oct 2022 13:45:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171396

T24gNCBPY3QgMjAyMiwgYXQgMTQ6MzIsIE1pa2tvIFJhcGVsaSB2aWEgbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZyA8bWlra28ucmFwZWxpPWxpbmFyby5vcmdAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4g
d3JvdGU6DQo+IA0KPj4gDQo+PiBTb21ld2hlcmUgSSdtIGd1ZXNzaW5nIG9wZW5zc2wgaGFzIHNv
bWUgY29tbW9uIGluaXQgZnVuY3Rpb24/DQo+IA0KPiBTYWRseSwgdGhlcmUgaXNuJ3QuIE5vdCBl
dmVuIGEgY29tbW9uIGhlYWRlciBmaWxlLiBPciBhdCBsZWFzdA0KPiBJIGRpZCBub3QgZmluZCBh
bnkuIFRoZSBlbmdpbmVzLCBtb2R1bGVzLCBjb25maWcgZmlsZXMgYW5kIGNlcnRzDQo+IGFyZSBx
dWl0ZSBkaWZmZXJlbnQgdGhpbmdzIGNvbXBhcmVkIHRvIHRoZSBwbGFpbiBzaGFyZWQgbGlicmFy
aWVzDQo+IHdoaWNoIGFyZSBhbHJlYWR5IGZvdW5kIGZyb20gTERfTElCUkFSWV9QQVRILg0KDQpU
byBiZSBob25lc3QsIEnigJltIGxlYW5pbmcgdG93YXJkcyBzYXlpbmcgdGhhdCB0aGVzZSBwYXRj
aGVzIHNob3VsZCBiZSBhcHBsaWVkIGZvciBuYXRpdmUvbmF0aXZlc2RrIGJ1aWxkcyAobm90IG5h
dGl2ZSkuDQoNClRoZSBwYXRjaGVzIGFyZSBfZmFpcmx5XyBpc29sYXRlZCwgYmVpbmcgYWJsZSB0
byBzYXkgd2XigJlyZSB1c2luZyB0aGVtIGlzIGdvb2QsIGFuZCBtdWNoIGJldHRlciB0aGFuIGVu
dmlyb25tZW50IHZhcmlhYmxlcyBuZWVkaW5nIHRvIGJlIHNldCBldmVyeXdoZXJlLg0KDQpSb3Nz

