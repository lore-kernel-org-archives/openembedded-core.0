Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 850C7C4332F
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 17:25:56 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.67])
 by mx.groups.io with SMTP id smtpd.web09.9188.1667409955497446987
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Nov 2022 10:25:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=OXRnzsPx;
 spf=pass (domain: arm.com, ip: 40.107.22.67, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=fZ1AfTatsp7suuCPdqlManvsV5yVg7pnyqWmUMQuTz9zt0fUilXbfpsFIBt1+6TaNrC3ubb/ZKq/iRgZE0OkQ9JuUsA3gvnsAh1VpByyt22caW6EaNeLFuIBqAmYUg+WX/uWfel3Oa3ms7O3JjSb+m2O/4St709eCHRBzy8Z/woOo4PqVVo+d2H2rVCQa/T7jJO736bZjrmv9OsnJQaHXCoqwN8A34uhxYeoIvC8dAed0mK0IXbM11y19ujf0fcbKhUpv26nB4f3ySSjNkwWsdouxyKRyu3osMxOkw36p5uIzj5NkwDip/fjKrgeL9KU5Tg7X3oay9PbW904/jRomQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JrOSQ/xQa97nsLxzL6DmqHD/4Se8eI1FyGnEQDoJoOw=;
 b=S2CqXOUf8di1m6TaFnQ+CHHNy5Ii/vQx2CQRNCVMRMvRBDUMwV8vjGEv1Dv9C/tc+wTBHXQK95toxiJUIP56u1iOIVImPx8mu0RzMb9g1tWSbvOqR7Ji7b2li4DaiRyo+8Vu5JIQEeuigTDtZ8Xaooo9nWlt34HeDrBAjgh/1HK4RcIHngEwGdmOiSQItfcwHhtQI6HxoK/C/gmXl61vrE74BsmUwDOnhiPy6mTrNslUyyyNvJ1OWu8ZyiyBavBPppAqR9a6HyiOVcskbGqAszvl+9yH/sEN+qpDD51a2DxHqRyreVKJVY99t0xzuRDmEhHPj/ns4mlEPuvBkwFGeA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JrOSQ/xQa97nsLxzL6DmqHD/4Se8eI1FyGnEQDoJoOw=;
 b=OXRnzsPx7CdzOpLd1sxorpaV7xPRmi+ylWF1HYhF3wlnWj5Sw/hCpOd9CkyN5IufmPxrgw3o/1KF0yM8hkc8qyE1LXg3LSDdY7BH66c0CysmTU7iD0BxPv5qTyWjrV0DS6PM+3ZChvTeNI2ZgBfnlZGyO8I5ZND3P/hEIepO+KM=
Received: from FR3P281CA0091.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a1::11)
 by PAWPR08MB9662.eurprd08.prod.outlook.com (2603:10a6:102:2e0::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.19; Wed, 2 Nov
 2022 17:25:50 +0000
Received: from VI1EUR03FT044.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:a1:cafe::61) by FR3P281CA0091.outlook.office365.com
 (2603:10a6:d10:a1::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.20 via Frontend
 Transport; Wed, 2 Nov 2022 17:25:50 +0000
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
 15.20.5791.20 via Frontend Transport; Wed, 2 Nov 2022 17:25:49 +0000
Received: ("Tessian outbound 73ab5f36653e:v130"); Wed, 02 Nov 2022 17:25:49 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2d431b4e6b03d7f0
X-CR-MTA-TID: 64aa7808
Received: from 4912973b9855.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 86EE000D-335A-43FD-AB76-DA399AC705C4.1;
	Wed, 02 Nov 2022 17:25:43 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4912973b9855.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 02 Nov 2022 17:25:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kCv+wF6OYnpCMC4JCPcDrSjxGqS/ZaXp1+aZadJd75sqj1cH2uQOgOi7ill9SUjWAHH1LGjaoLiu+tl7PVrvD1pTgSlD6rDg79P2jLg3VCIJk7i1PhpMHaOpXvynn3PCCicd32i3Jub7w8+h/3knYCSd0Q8NmBrFPVqNPUJkpgHsdS/r6Kqq0mAve1czg3sLJbCV/PmnQGTl8vk3TPC3syp8HPFG/eVOQ5REI8r2LLOiJLzxXIkQRrSUducsE6ZPEbE3RtZyesOeanG0fRSZ1bnjVFHJjTQleek1ZKl0JqrCdNTvJudsuPnJNR/4M/qzzFVbyraisIfWoKzsD2bbew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JrOSQ/xQa97nsLxzL6DmqHD/4Se8eI1FyGnEQDoJoOw=;
 b=LFZoYsEp51MCkAEqjHTVcJPDyCmPvA/wglf0IoTxh5Gat+jxdA0jZTcN7ZNVqapYoW861vesvayDC0cKvM5GK3ey4r2wJKo3enuyRdrh+Q727sFE3yeu0N3zvm4BAoeVc4wmqxt7Fdry6fr+nG2f1KLa37U4TWt1O2Mr4tUth1z7exc1gIho1Kozk2z1VW4sm5JQB7UoD2lEv3o8KrVV4Fkjx4PULTZp5E4xpeQrbjhoTFFl4hFLTK3a46A7EBxIG1skAp0HzSeEQ/7BCSY+x+LA+24S35vmaGC8j9EYhdh2IaK94uMQz/cU/OM7ZbhCChkQ0Cb9C9ZVoWK1XcmCfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JrOSQ/xQa97nsLxzL6DmqHD/4Se8eI1FyGnEQDoJoOw=;
 b=OXRnzsPx7CdzOpLd1sxorpaV7xPRmi+ylWF1HYhF3wlnWj5Sw/hCpOd9CkyN5IufmPxrgw3o/1KF0yM8hkc8qyE1LXg3LSDdY7BH66c0CysmTU7iD0BxPv5qTyWjrV0DS6PM+3ZChvTeNI2ZgBfnlZGyO8I5ZND3P/hEIepO+KM=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS2PR08MB8974.eurprd08.prod.outlook.com (2603:10a6:20b:5fa::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.16; Wed, 2 Nov
 2022 17:25:41 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::52da:ac9d:e42d:8cc]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::52da:ac9d:e42d:8cc%5]) with mapi id 15.20.5769.019; Wed, 2 Nov 2022
 17:25:40 +0000
From: Ross Burton <Ross.Burton@arm.com>
CC: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 2/2] lttng-modules: upgrade 2.13.5 -> 2.13.7
Thread-Topic: [OE-core] [PATCH 2/2] lttng-modules: upgrade 2.13.5 -> 2.13.7
Thread-Index: AQHY7p1HEuA0dyCocEGO+LNpXbOtga4r4gwAgAAA7wA=
Date: Wed, 2 Nov 2022 17:25:40 +0000
Message-ID: <D0A4A60C-6813-4E44-B7EE-D027660DD4A2@arm.com>
References: <20221102092649.631136-1-richard.purdie@linuxfoundation.org>
 <20221102092649.631136-2-richard.purdie@linuxfoundation.org>
 <BAE2A2E4-E46D-4C88-9F67-609E8FAE9175@arm.com>
In-Reply-To: <BAE2A2E4-E46D-4C88-9F67-609E8FAE9175@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.200.110.1.12)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS2PR08MB8974:EE_|VI1EUR03FT044:EE_|PAWPR08MB9662:EE_
X-MS-Office365-Filtering-Correlation-Id: a9c9681a-db68-415c-8cd3-08dabcf74962
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 jk3xkvw9zVX7F6lrFyJ82/ql1lAzcTiEuAPAzO/6NfVkNyPePJVaBcydrhEC6cazGjCtYyQXczBfHAeifFuB8hpfnAC0r8brQ83i2S4Y0GJsR2asEfPwOIInEup+K3HOfpPKQO6zhFBkBCGHKbZJaOjGgLislbbNDiCKYoyc4bjGQDvVf0bVMHnIq5C1xL4x1SNjIWyN63TicFnfYkSWsDgDUi3x5BaFAxpNkj4L8v2TBNTdZZdphHr3MoFJAGCsB3QKG7MsDf839gaorzlB6s0w5WD2OabUKCrXvOYm/6rU2T5Ip74salyNhOfJB+tk2BW4v8sD56EBF//qoBIYJ6RY9Nxj3N4F297RR3bZTS38rpQX+M/T0R7NlXn2PRQYnOR2LrT7l3v/8r8ysoF59tGTFQZhk/t9GXCqH4pyFYQTghRpC+1MRL7sFn+GWQd/DKfVlvKK5bLhK/Ru+NkpS01a1EP6u/KMyfkA7ZFqLGSQG2GJpDn72FPkR76gGFtRzWsdhIF/GIEiSU2SCTHPDu+3JUjmlYQFEWS7zAeiNpvPnBnJ//tFwwehwINjtKIw1ESlB89B4Yyi75YGFZZTEnGtI75tmfBsucEXMpAo3QPLQdDu8Zs/H56jt0jTcn9zJGCGYegXsMowwhV352v4QjKAuZpVpKaBxvt+W5yk1FJ321A9UBPhgie8a826hZAdkwQPn1UCVoSsP+rSHXGI7WwjoVRd4UjK9ECOk6yCMqn5bbLcsA4ZamuMgpEywJYuFrWwiqQRl4pzOC1bLjGnY0BvewsE77cM9APs9lL6pSJQ8b3u4aIQFXTJPrWJzZ6V7AEl9OeIT0TRXLHUaRSPhA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(366004)(39860400002)(376002)(346002)(109986013)(451199015)(71200400001)(38070700005)(66899015)(54906003)(6486002)(966005)(478600001)(122000001)(86362001)(38100700002)(6512007)(186003)(5660300002)(33656002)(66946007)(8676002)(66556008)(64756008)(66446008)(66476007)(83380400001)(8936002)(76116006)(2616005)(36756003)(316002)(4326008)(2906002)(41300700001)(53546011)(91956017)(26005)(6506007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <645B057456BC154BA94C04FA187A7DD3@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8974
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VI1EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	5b80670a-3b93-4ee2-473d-08dabcf743f5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	bd5dyjZhH8Nuj19JqeAKObuDvWBiVu+AV2PXhtpe3bon6mG/U9I+dBD4opKvLuIKmDHotbiLIki2Ty+bSVse4ca4Cqf7/1jAM5+FWwVHkN/BtuCox0ow5kKoScNikPwvDWOwXNjT9dLdViG3cKIqKgZ9LezU127D7TS2olLQhwyenLaBB7J4zdaAYCrx/JcPSnPmiW/eQfJo/vaKk7HMsaFRfB/fJbLyKLbGeiE9BA7dgV+VUHJT6Dz76mQy3zIOx0aIS+hGcFlR4knp5SiTtfRybJ+dh8H20cjKSbGuSf4F3yuMFBQSrfZxMzPePZwKaO7L1eBGjDZ6CY7zlCdbj75jYl/avP/nsxQ6qBaJ7tYIMslFQIsmWp+aoNIWpbyTOAYAZyXTLDzAeIzOdxOquGUU8Q4w5ysrJ57Fsf+CWUURUQsrgT8ZOeOm5q668eFaCoRELDfBdO9stbY+sfVTvKNSpkffVmMqT875FWUaFJCue1QGbFh5nn5R7+nlFbJ0t7zplR5PWuUz6B1AqslxHw8fpucdOTsYZrEe7bWpPUfrN++gGmDVsOx2xOoFGapS4Btlsc+cnXvrj9+hhPWZpSKbrWunu+RyC6Gzy5ya6wsEUZ96t3lPVrgj82uBoYeH/8oi/+fTyFiIge3tKa3xTHRpJ/M/pgBM5FoZEP6LrGfm4KwgMcQSq1gOK4rqmAZfXyq/RwmaK2xIhTibhONWZtrx3H/d+HHJPIjIgAUDOMNvT78GSq8/qnI56NIwgr2PTs1c5ihol3uD3zHL4xCFETOtD+OJK/Y5C55Aab8oc39Zpvscq7rAAmtGE4iP8uTF
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(346002)(396003)(39860400002)(109986013)(451199015)(46966006)(40470700004)(36840700001)(8936002)(66899015)(86362001)(82740400003)(36860700001)(47076005)(2906002)(478600001)(83380400001)(336012)(356005)(186003)(81166007)(82310400005)(316002)(40480700001)(4326008)(70586007)(70206006)(2616005)(6506007)(41300700001)(33656002)(40460700003)(53546011)(966005)(6486002)(36756003)(8676002)(54906003)(6512007)(26005)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2022 17:25:49.9548
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a9c9681a-db68-415c-8cd3-08dabcf74962
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VI1EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9662
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 17:25:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172597

V2hpY2ggZG9lc27igJl0IGFwcGx5IHVubGVzcyB5b3UgaGF2ZSB0aGUgcmViYXNlZCB2ZXJzaW9u
IGluIG15IGJyYW5jaC4gIElnbm9yZSBtZS4gOikNCg0KUm9zcw0KDQo+IE9uIDIgTm92IDIwMjIs
IGF0IDE3OjIyLCBSb3NzIEJ1cnRvbiB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8cm9zcy5i
dXJ0b249YXJtLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90ZToNCj4gDQo+IEJydWNl
IGhhcyBzZW50IHRoaXMgYWxyZWFkeSwgYW5kIGFsc28gZHJvcHMgYSBtZXJnZWQgcGF0Y2gsDQo+
IA0KPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9vcGVuZW1iZWRkZWQtY29yZS9lM2Y1MTBlYWE2
YjdmYWI5YzA4MDg4MWQ0M2RiNmI1NTZiNDZkOWNmLjE2NjQ5MDQyMTcuZ2l0LmJydWNlLmFzaGZp
ZWxkQGdtYWlsLmNvbS8NCj4gDQo+IFJvc3MNCj4gDQo+PiBPbiAyIE5vdiAyMDIyLCBhdCAwOToy
NiwgUmljaGFyZCBQdXJkaWUgdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgPHJpY2hhcmQucHVy
ZGllPWxpbnV4Zm91bmRhdGlvbi5vcmdAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+
PiANCj4+IFNpZ25lZC1vZmYtYnk6IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRpZUBsaW51
eGZvdW5kYXRpb24ub3JnPg0KPj4gLS0tDQo+PiAuLi4vbHR0bmcve2x0dG5nLW1vZHVsZXNfMi4x
My41LmJiID0+IGx0dG5nLW1vZHVsZXNfMi4xMy43LmJifSAgfCAyICstDQo+PiAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4+IHJlbmFtZSBtZXRhL3JlY2lw
ZXMta2VybmVsL2x0dG5nL3tsdHRuZy1tb2R1bGVzXzIuMTMuNS5iYiA9PiBsdHRuZy1tb2R1bGVz
XzIuMTMuNy5iYn0gKDk0JSkNCj4+IA0KPj4gZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1rZXJu
ZWwvbHR0bmcvbHR0bmctbW9kdWxlc18yLjEzLjUuYmIgYi9tZXRhL3JlY2lwZXMta2VybmVsL2x0
dG5nL2x0dG5nLW1vZHVsZXNfMi4xMy43LmJiDQo+PiBzaW1pbGFyaXR5IGluZGV4IDk0JQ0KPj4g
cmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWtlcm5lbC9sdHRuZy9sdHRuZy1tb2R1bGVzXzIuMTMu
NS5iYg0KPj4gcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1rZXJuZWwvbHR0bmcvbHR0bmctbW9kdWxl
c18yLjEzLjcuYmINCj4+IGluZGV4IDAwMDk1ZDZhYjdiLi40OWM1ODRkZmY0ZCAxMDA2NDQNCj4+
IC0tLSBhL21ldGEvcmVjaXBlcy1rZXJuZWwvbHR0bmcvbHR0bmctbW9kdWxlc18yLjEzLjUuYmIN
Cj4+ICsrKyBiL21ldGEvcmVjaXBlcy1rZXJuZWwvbHR0bmcvbHR0bmctbW9kdWxlc18yLjEzLjcu
YmINCj4+IEBAIC0xNiw3ICsxNiw3IEBAIFNSQ19VUkkgPSAiaHR0cHM6Ly9sdHRuZy5vcmcvZmls
ZXMvJHtCUE59LyR7QlBOfS0ke1BWfS50YXIuYnoyIFwNCj4+ICMgVXNlIDphcHBlbmQgaGVyZSBz
byB0aGF0IHRoZSBwYXRjaCBpcyBhcHBsaWVkIGFsc28gd2hlbiB1c2luZyBkZXZ1cHN0cmVhbQ0K
Pj4gU1JDX1VSSTphcHBlbmQgPSAiIGZpbGU6Ly8wMDAxLXNyYy1LYnVpbGQtY2hhbmdlLW1pc3Np
bmctQ09ORklHX1RSQUNFUE9JTlRTLXRvLXdhcm4ucGF0Y2giDQo+PiANCj4+IC1TUkNfVVJJW3No
YTI1NnN1bV0gPSAiZWNlYjM0MjhkODBlODVhOWYwMDg0MjViZWI5NTI2MTk1YzlmN2YwMmIzMDJm
MjhhZGQ1NmRmNTNhZWYzZTcwOCINCj4+ICtTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNWE5OTY3OWRm
NzkwMzE2MGNiZGUzOTE4ZmVlNWFmOTBmZmFmYzkwZmM5NmNjZGVmYWE1N2NmMjMwNDkyYjIzNCIN
Cj4+IA0KPj4gZXhwb3J0IElOU1RBTExfTU9EX0RJUj0ia2VybmVsL2x0dG5nLW1vZHVsZXMiDQo+
PiANCj4+IC0tIA0KPj4gMi4zNC4xDQo+PiANCj4+IA0KPj4gDQo+PiANCj4gDQo+IA0KPiAtPS09
LT0tPS09LT0tPS09LT0tPS09LQ0KPiBMaW5rczogWW91IHJlY2VpdmUgYWxsIG1lc3NhZ2VzIHNl
bnQgdG8gdGhpcyBncm91cC4NCj4gVmlldy9SZXBseSBPbmxpbmUgKCMxNzI1OTYpOiBodHRwczov
L2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29yZS9tZXNzYWdlLzE3MjU5
Ng0KPiBNdXRlIFRoaXMgVG9waWM6IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9tdC85
NDczMDI2Mi82ODc1ODg4DQo+IEdyb3VwIE93bmVyOiBvcGVuZW1iZWRkZWQtY29yZStvd25lckBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFVuc3Vic2NyaWJlOiBodHRwczovL2xpc3RzLm9wZW5l
bWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29yZS91bnN1YiBbcm9zcy5idXJ0b25AYXJtLmNv
bV0NCj4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4gDQoNCg==

