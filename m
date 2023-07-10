Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06AEDEB64DA
	for <webhook@archiver.kernel.org>; Mon, 10 Jul 2023 11:43:50 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.45])
 by mx.groups.io with SMTP id smtpd.web11.37293.1688989426606738236
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jul 2023 04:43:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=i6Y0fxr7;
 spf=pass (domain: arm.com, ip: 40.107.249.45, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wDvNRJ4MJvNAsVpEjvuz5ndo89Gw7fYp6Im0EBrukts=;
 b=i6Y0fxr7TJWpK9S0EvfB2wVT/6L3CgRZTQpc9K7LiFq1WREyDRyAhWX+N9aHW9WK8IIcxNKnkVNm7yGiBTSigpzpn7pxGgF0UdfuUEWaQV8cosTeKduD1vYWqDNwzk9+M8Pg0XQgaAyy/CDc6Z6DIpH/BjrJTNKUpw1QSamRAic=
Received: from DB7PR05CA0028.eurprd05.prod.outlook.com (2603:10a6:10:36::41)
 by AS8PR08MB5879.eurprd08.prod.outlook.com (2603:10a6:20b:293::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Mon, 10 Jul
 2023 11:43:41 +0000
Received: from DBAEUR03FT047.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:36:cafe::3b) by DB7PR05CA0028.outlook.office365.com
 (2603:10a6:10:36::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30 via Frontend
 Transport; Mon, 10 Jul 2023 11:43:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT047.mail.protection.outlook.com (100.127.143.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6588.19 via Frontend Transport; Mon, 10 Jul 2023 11:43:41 +0000
Received: ("Tessian outbound 95df046a2e2c:v145"); Mon, 10 Jul 2023 11:43:41 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4b07a1cc11fa8897
X-CR-MTA-TID: 64aa7808
Received: from 90a16ccee97c.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 3B9E081A-5659-4EDC-8C25-88830D9274E9.1;
	Mon, 10 Jul 2023 11:43:35 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 90a16ccee97c.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 10 Jul 2023 11:43:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gx7JuAedSSs80casEvcnTP7ufP3kAPE+ZepldV/WbN9v7BA9CS0dsVP2isfwQ5QG10M0sGJtVL6GvD99mUpXgLAEQ1uemKFmZNkfTB0GELTcWQP7n6FWBxV2xs2krfBp96vqjNF8tP5r+MbzWnI+stVQfFdnyvMT0qXug19DTGnE2ofddPYBnz2P2PvWPeX3qeL+l1IpMvGM67bs4ZSlYDKo6YNhN7tUFTjs6BJfZc37Fj/2S6yqzlTPp4BhrMioRFLni/ONdpA6yxxDz9jf3bxF1v3tbW2JFzC8ZYdGn1vrIDxDpq5Ubw2cR0+yrIA7H5G0199dilRMavF6/Ii+FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wDvNRJ4MJvNAsVpEjvuz5ndo89Gw7fYp6Im0EBrukts=;
 b=IuKNL2y+B6m+VNlN4ZxzHflnv8vDazI1IpSKqzgTRKGEOsAXc98UdqiBwYa/DHDBirv9Pq19Xtql2ewV+Ysrni9w8PVfQOlJb6sKtSDQjNpl5X8eSLpchQ3fQBxMo8u6m5n/kjcFus2VUqek1u0mHVZ+H1ozkuMQZfDva2tKifZg0vErgz6HRd2QWuSgxONMIww6XsbMU0kooXvvSd/JBexnmQczLyTOoI1vYe5g/BLUaSwwLSEfAZsldIky8KFCfRbOybLrgR+jjHdhELbGX0J3p9Q/odfYyoLAxiJX3qEgutfQlZ6KViVWzT7m5Xk1BnfA0JdYU/NICmW1yq7QCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wDvNRJ4MJvNAsVpEjvuz5ndo89Gw7fYp6Im0EBrukts=;
 b=i6Y0fxr7TJWpK9S0EvfB2wVT/6L3CgRZTQpc9K7LiFq1WREyDRyAhWX+N9aHW9WK8IIcxNKnkVNm7yGiBTSigpzpn7pxGgF0UdfuUEWaQV8cosTeKduD1vYWqDNwzk9+M8Pg0XQgaAyy/CDc6Z6DIpH/BjrJTNKUpw1QSamRAic=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB4PR08MB9192.eurprd08.prod.outlook.com (2603:10a6:10:3fb::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Mon, 10 Jul
 2023 11:43:32 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::30b4:3110:b02d:7f21]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::30b4:3110:b02d:7f21%7]) with mapi id 15.20.6565.028; Mon, 10 Jul 2023
 11:43:32 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "yang.xu@mediatek.com" <yang.xu@mediatek.com>
CC: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v3] sstatesig: Fix pn and taskname derivation in
 find_siginfo
Thread-Topic: [OE-core] [PATCH v3] sstatesig: Fix pn and taskname derivation
 in find_siginfo
Thread-Index: AQHZsJ+rwy6mPlplFU2K8kKstbpDN6+uPhWAgANFoQCAAWJ+gA==
Date: Mon, 10 Jul 2023 11:43:32 +0000
Message-ID: <D08FE08E-E09D-4A68-B0CE-AD3EA83C8326@arm.com>
References: <202307071236355ddab32a@mail.local>
 <6806.1688913274077356918@lists.openembedded.org>
In-Reply-To: <6806.1688913274077356918@lists.openembedded.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB4PR08MB9192:EE_|DBAEUR03FT047:EE_|AS8PR08MB5879:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e58c1a2-2e81-4290-07ac-08db813ae8ab
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 eLwk4UiCUaB728K3Rbd+zw8kcBh+pJ6HqITim2XoVNbSo7di7Bk2vmDC+fxGlMPGh9XkcjMz9dsQN+tjxjcEwrO567XBD9pGwKF/vfdLAORF/NpVF8uXcSxryGii41aAm1vBYwrfhplUn7rVAvdePnVEge5wxnFPTJBZ01qs7FVTF1AN/tM0C4XrIklADqJyAkhuyesEnLbnn4+GkxZlep9geIyWZfhLkvE8zxWo3z1sujKqsSiP759Z/yuSFoOfgs0xhJ329Mg+ut+SFIT1VZMNEAiIA09IBMJPpFN2pS8eAZ5H3AR8l5u6jqeG5m3NT5NdYPhhedDUw3iRC0jxnClhLwTCqIY2FchjL/PE2g9Xnkz9Y114yZcUigQmRBBZO5za8MpPTuNOtUVm3sR/zPq/XjxO8xGNQ3XQE8TesVjOMKT1bHycA01S95HItMdLY9c4nLnCxnzBYPplosPrE9PSAowETU5GGqP/tcnsZYsGDZG6f97MFOVXEbCrokRbrgsMGhl8N900BtOd+5b+x/K6aJFJprKHQQT3gD/5cYpUd8rKsa1wO9ovc/5HgdEskjqLDWf+GhrMOaxpzlLtNlUT5mrfA78GZlSrw1vF4fIHSgExOmKwiWawQDvUXw5C8pOH2yE8G9XJxWpIjMHIcbUPP/eLfWsv8TVNkC2a8qo=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(39850400004)(136003)(366004)(376002)(451199021)(6486002)(478600001)(76116006)(91956017)(71200400001)(6506007)(26005)(53546011)(186003)(6512007)(966005)(66946007)(4744005)(2906002)(66476007)(41300700001)(6916009)(4326008)(66446008)(316002)(5660300002)(66556008)(8936002)(8676002)(64756008)(38100700002)(122000001)(2616005)(86362001)(33656002)(36756003)(38070700005)(83380400001)(66899021)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2361D90F6B5A1747A76387E6155DBDE1@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB9192
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT047.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	9be5f5cb-537b-41bc-3c87-08db813ae355
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	fVCrzCAIVSrqf+Ks6YN7kH5VP3DUKPcWc8u2sL9jv43L58CnnTLsDxULSDh1LRSApD74tc4ScWKuCT2nj95mE4g6OnhCZpg/bjKDoBIKund03fhBSab6Ox6hyuO2KeZwjgb4bwyuGZs56PbU0eY6Jb0UcB9ps7SImSB58Dv3PpDCbCrfN+7usG5G0l1yeTkzZOjMcZfUU7wBRSWEnshIWkgIpRPFeG5D7S4C4a0Fi4l9Q8XBnYJ05zvSZ+HZeDea1AGQTa5OYb9ejht2cPWKTQUc3mxySS2enuMi1dAfndUQ+cddQ0+qhqroKV8K3zx0XKGRQpdqipi/JO/W1P4Y8bnIM+ZZetIhZjFGXhdZb5aDWpgQdVvVM7BaGxl9Ryr4J6slFEz5jhnaeHAeFDrZ+LpRcFboZvcKczssrYz/gjKp1jINWFZYjZKtvOvUFp4rjxr9rknETubHeDmLA569Pfh436/c8j2vH6R0V1gr6HzF52gRC/DWREj/5ZqPKvnZxTFXXMeX+bD7b6PQj7asWSivpgQhSxu0AsIuzmY65u1K8WeMczMnZeiyOZC1Z+WnjmA9XwbriUrC3x0MJ4zp2ZEzkZbhGt+Bztcs7zkyP8rwWvu3NyDxmsrqzgSFwTfu8H7GbL/K8sa+5jOSNSKVg3tn21o3eKOldzc9pdHNf2MEoYxf+XyvhfmCkrMLbaGSYgtH2veooO2a0ZG0E7Sa8pUnY8zoUzQTAl1Ie0HjaR6T9/743gfFVphC8fnSgftKR1lraiYnNx+mQ7HfJP8Jtw==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(136003)(346002)(396003)(451199021)(46966006)(36840700001)(40470700004)(40460700003)(186003)(6506007)(53546011)(2616005)(966005)(6512007)(36860700001)(26005)(336012)(83380400001)(47076005)(41300700001)(4744005)(4326008)(2906002)(316002)(5660300002)(8936002)(6862004)(8676002)(478600001)(6486002)(70206006)(70586007)(40480700001)(36756003)(33656002)(81166007)(356005)(82740400003)(82310400005)(86362001)(66899021);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2023 11:43:41.4509
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e58c1a2-2e81-4290-07ac-08db813ae8ab
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT047.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5879
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jul 2023 11:43:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184073

No need, but please do add it in future patches.

Ross

> On 9 Jul 2023, at 15:34, Yang Xu via lists.openembedded.org <yang.xu=3Dme=
diatek.com@lists.openembedded.org> wrote:
>=20
> Dear Alexandre,
>=20
> Thank you for your reminder.=20
>=20
> v1: correct handling for pn and taskname for native target in find_siginf=
o
> v2: add handling for multilib target in find_siginfo
> v3: add testcase for compare_sigfiles and find_siginfo work together.
>=20
> Do I need submit a patch v4 to add these changlog information?
>=20
> Thank you
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#184039): https://lists.openembedded.org/g/openembedde=
d-core/message/184039
> Mute This Topic: https://lists.openembedded.org/mt/100001305/6875888
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ro=
ss.burton@arm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


