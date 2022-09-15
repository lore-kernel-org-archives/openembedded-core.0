Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9842ECAAA1
	for <webhook@archiver.kernel.org>; Thu, 15 Sep 2022 11:18:01 +0000 (UTC)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (EUR02-VE1-obe.outbound.protection.outlook.com [40.107.2.46])
 by mx.groups.io with SMTP id smtpd.web10.8701.1663240679936446099
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Sep 2022 04:18:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=WhFR69Gy;
 spf=pass (domain: arm.com, ip: 40.107.2.46, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=VMNsIv593uQ4BY1nAqNKyhG76/NGDk68BCpnksxBfqVLK3rBm/FZ8UJLi1uKWk1INXlcWUq+xN6PCSaF7P9Dsny2oXk36yORz2OuLIPBhdwu5xKWkOdpriph/xmQX+EaHAHclFVnSVQ0y+PwcEvAPAa6YW0Jfcpggo/djdXn5CAgQd7XNowH67hpsUg1omwMwVm6havdtXvm1JB3t5uhpMs1NUb/S+cH8SS9ewGhUMR7SOjWg27u/obdLYsE1Yp7CkvjrCXckgs4HuQz0zyuO8MB01rdI9vBPkgYarEZpZxiY4nfM4JAeUHp+9t76OACMsY8ajkC6lOG5cCze34IVA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Xwrdfh4WxdbrDJsxXbNZom7K/sdAZk5OcKT9ToKKW0=;
 b=dN1KciIxyF7+DBuBgLXx2hXUBV9q5YVyI+G+P1wWk5aTlPYcQGE7qjZ39fPRHSaRYiXjp9WaPtu1jwlBzPU/yDZyh6ispMsX1LCnahc4SNE4mdyihN3weDMSJrFlQPUMPIgVknRim5y19z7BrYLLeZlvdj1x+ID9TOEwId14HTu+Vfde/r0pggHPPOSPc023mVXFBN0Wb3Yd3JS6q3KzZOqQutbwM9Nm3AIlGK2pBH32EEVO7GEzWj9s0OIxhajSPyxJt/f5i71lQ7QxSlqIa6EnPp4Kp8IBHNwURGJnUzMIQDOjqkdF0HIAR6zn6NWv/KRvVKL9PVkUQs1kD13ESw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Xwrdfh4WxdbrDJsxXbNZom7K/sdAZk5OcKT9ToKKW0=;
 b=WhFR69GyDH7QOpNupfXgAIsYX6vAYdyZNOrObYXv1C2fChh5jOtxxQocSy5LZx7BbjV/WvTs6vCWb4zY8SqM0gqzcy+k1HGezDkT2YDjVsXa8hqAayOfDAQH9KD4JSPOULdjSrferv5AprtMjE4vk+72e0rgzi4rgloUUdc+Qss=
Received: from DB3PR08CA0016.eurprd08.prod.outlook.com (2603:10a6:8::29) by
 AS8PR08MB7837.eurprd08.prod.outlook.com (2603:10a6:20b:528::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Thu, 15 Sep
 2022 11:17:56 +0000
Received: from DBAEUR03FT061.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:8:0:cafe::92) by DB3PR08CA0016.outlook.office365.com
 (2603:10a6:8::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.15 via Frontend
 Transport; Thu, 15 Sep 2022 11:17:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT061.mail.protection.outlook.com (100.127.143.28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5632.12 via Frontend Transport; Thu, 15 Sep 2022 11:17:56 +0000
Received: ("Tessian outbound fc2405f9ecaf:v124");
 Thu, 15 Sep 2022 11:17:56 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 999bdaefed8a9f5d
X-CR-MTA-TID: 64aa7808
Received: from 643a5c900831.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B4023888-0E87-4352-AF6B-87FDB8A73FF1.1;
	Thu, 15 Sep 2022 11:17:49 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 643a5c900831.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 15 Sep 2022 11:17:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J+4Ud5loSyZKtJhZWljILMkOEC1N0+BbFPqOuVg9CF7g+3cRQfa9+ntu9A5WBekZ79/Qubbn3PTiBdgCZpYK+06T/c8a+k1hT/fqm9taBBFrfNTC/lqLOc8AL3zw7T/FNwKCXQRUEovAdJeEiMivBODHkllvsFP1S1DPuZxHAFETr8SDDzia+zmEjsDDJ+uBcUMRTI7i9mfv31zKddyHE8LQJXmhBWHeH2IGArkhIT/WhVshL8wH9/7Td1kYoqL1EQn66vvWtwU6LgCyZxoDnpnTAn2CBC9ghqnuL3F2FWkdfwGVtNEBpDNpVShXLvgxhsaj9GqI8KniQFub/RtyQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Xwrdfh4WxdbrDJsxXbNZom7K/sdAZk5OcKT9ToKKW0=;
 b=ZISoFeCTKPqLpeHYYQlFLjGnRjjsNXkb864dfGLE6kZef0NCbORpQ7rKonlzopgudl054vS88tMBid2P9nAsQl0IDTD9NnA/ROpcmj6tZ5ZO80bHz+KNnzhniyFmMCordaDsfyr02vljsO3lUE3kvd3EEtvj70jbSOvcBdBFBkCJkMTxv0oA44eo63JVJqQyUKZaZnYZwN+BLVQvjB08ufjqUtjBTqcctgvra5uIdKqkF6toCi9lVhTOSFTIY8QLi+FAnERNmUv7wBFUtOluHrhWUU2Tsn9cvlihhwEQ0UFdpkaEpsUz/BOtY8nXXDLMuEg1C8gPeNyIfA61QDn/gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Xwrdfh4WxdbrDJsxXbNZom7K/sdAZk5OcKT9ToKKW0=;
 b=WhFR69GyDH7QOpNupfXgAIsYX6vAYdyZNOrObYXv1C2fChh5jOtxxQocSy5LZx7BbjV/WvTs6vCWb4zY8SqM0gqzcy+k1HGezDkT2YDjVsXa8hqAayOfDAQH9KD4JSPOULdjSrferv5AprtMjE4vk+72e0rgzi4rgloUUdc+Qss=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PR3PR08MB5801.eurprd08.prod.outlook.com (2603:10a6:102:81::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.15; Thu, 15 Sep
 2022 11:17:44 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::a108:b98f:c57a:1d1b]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::a108:b98f:c57a:1d1b%3]) with mapi id 15.20.5612.022; Thu, 15 Sep 2022
 11:17:44 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "mikko.rapeli@linaro.org" <mikko.rapeli@linaro.org>
CC: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] python3-cryptography: workaround broken native
 functionality
Thread-Topic: [OE-core] [PATCH] python3-cryptography: workaround broken native
 functionality
Thread-Index: 
 AQHYx1Ql5ijburQ/LE+f5BWff+uWF63dIQsAgAAHlICAAAGZAIAACvMAgAATwoCAAUsHAIABxvCA
Date: Thu, 15 Sep 2022 11:17:44 +0000
Message-ID: <41221D4F-B1B5-4FFF-9F98-E8B4B8A035CB@arm.com>
References: <20220913093452.47839-1-mikko.rapeli@linaro.org>
 <0d0f3e3d53f675a0edff4e1582b33998288c95e6.camel@linuxfoundation.org>
 <CAJFpGrO=Kd5qTgUQRbzcX3kYuCZKJNayxA6puVXAc_W=ATN6Pg@mail.gmail.com>
 <7a1aa96b6b8883d47234c198992963c25b3ff6cd.camel@linuxfoundation.org>
 <CAJFpGrMqa3hk=QL56zFgZBHiJn173Wocz7a5AH=2a9=Eny1tog@mail.gmail.com>
 <41df899720a40675568c55a571308c9624ef5d2e.camel@linuxfoundation.org>
 <CAJFpGrNM3sqj0o0L3CtNOtiLsq=++sbxun5eGXZHPN+A-oT3Zg@mail.gmail.com>
In-Reply-To: 
 <CAJFpGrNM3sqj0o0L3CtNOtiLsq=++sbxun5eGXZHPN+A-oT3Zg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PR3PR08MB5801:EE_|DBAEUR03FT061:EE_|AS8PR08MB7837:EE_
X-MS-Office365-Filtering-Correlation-Id: 39393ac5-d228-4d9f-d711-08da970bf09b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 T8/gAs8Fjnsn2I2e/UEDLZk9cKBqjWqrBD9TWd02iQsR7apN8d63wYcFGPZDSsqjdnBmJnhKyN2KsF/HrjT/yUAaKff27wCHJQyNX7bU3BstOTVgvjpYe/SqgeZtVdyhvZlRrePyGnx4x7T5tmrepFN8DjB0Q56LVn0YMLlRKgsg/gXSK0FFdnbgeR50rOw8XEeiZHM4yUlLenk9JEwJ18AnNfzfmRPtfhebGwY86gUXWCyoBy1Ty5u5Nqqpm3VSQvr57TjIfaClmF2JS03cBIDfiCvuBcrBwf11L5jbqpZOVSXh55jdR+SR0N3eMqyoR8hQDlkTvqJ6/dMbdiulxghpdhET/IK5F/xmeDn8ZF9HpqeaCNc3lTMfMBFieFSnKELTVtqw4VADyVdWtUdMico42g6QjwDJqvwz1NsqaoIeNYh+jkF8btSyQGfh4eUCombeY+7DmoCvvwYNWEgLaOaoF8YPNLlxS8cyRbyEMhPFXmSeNUjiNO+AxCW0J0sloVhKEFvDcchXYVLwFLf/zPS38bEISm7/sulevl5bCNZ7DzH25cs7ccxtoVy18EwM+l4BVLAuEoX5pg8n/E314OOHiejTOtN4GthdV/dfcVssDPoe58d60jsnntiUq+H0eTqdRzkwA9FKle5c/8u9zxE9j6DRSNg3X1e84wy6molZzyYH3cQwWqWnPvvfOJhK9fs8e8tLWHFmCJaSWPdpMnCIKw/KA7w5YQntgQWa6GRYLy1pjHcYdP9Bs59kmQ28RAPD2+s2XTCxJ2OKKDTSPRMzNPHZFyz0AT9644FDTrs=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(346002)(366004)(396003)(376002)(451199015)(83380400001)(6916009)(186003)(316002)(6512007)(26005)(38070700005)(36756003)(6486002)(2616005)(33656002)(66556008)(71200400001)(64756008)(478600001)(8676002)(4326008)(91956017)(66446008)(66476007)(38100700002)(66946007)(41300700001)(76116006)(122000001)(5660300002)(86362001)(54906003)(2906002)(6506007)(8936002)(53546011)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <EB034C17346A8D4CA5FF031094879CC2@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5801
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	accdc00c-a86d-494d-4ff1-08da970be97d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	muJiQe7HD487SoEfRTqU4cglGWDlKw4MpMgGCht8YYbUwUaDW9MX0Xz/Kbnfl6Ltfq44S8oWC8zaYu13LuVPtPeZyEWMgm0j9rYuu17sOApe0s/npvO4KuAaxah44lhupqhp2jznWJ78UkyCM3xLTm7GsfD9h4MP5Tprzc5z6wCo23G8qCtGnS3T1rIzx79RRNRJtsWtcRuu7zI57aU40M2t1a6fZ0R4UIqWG0gg3n/SkjDcCEKCljZRL59PkiGd8DWHe3NvEzmVOiwp3pVigfkudHJ+gi8YxboZ1ifX8NcyszJvdRDXCblVmIL21dX5fplmDfAfYXHrTZ3xkkVeLmnbdzj6wzQ62X3JEYVJiy6xVqf54O6ud1Rmide7+922vgtSnoeMkkTY5GNQrLz8d1im2PyysLk3ketzOA81YvVkJ9880S8qPqd/c8lUuqbytWEWBl78rSuwZ5b1A6Ba+XoLr/EYnOmbPctEF9L91k0DxUH6jgq5+WgFoA4zWhHxId9dnVPrLfyQcKFq1MM7wlPqzCELXrRNvgd4XshziBOVObPFdZtXBVzaYiBlkGJEJ21oYEez49bqWoOE/wsH2RY+9lpJRVZ6zKnFPYunE3xYdMc4O2APZh2CpRHMdDU4A2Rzau1FdY1RLEReCtEvbqAYHv4dkRFLoovYpXFAaK8bD/qOjhV/SL2rgly0Ev6Qwy9Gf32v1xVrQE8WpRFPBydT/im7VY4sCdfhif8yvSC7Q1AfrW7umxcZv1+njyx1jMol/1ZWvrz5ciUqwJofGg==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(346002)(39860400002)(136003)(376002)(451199015)(40470700004)(46966006)(36840700001)(356005)(2616005)(478600001)(40480700001)(6506007)(82310400005)(186003)(70586007)(47076005)(5660300002)(4326008)(8676002)(86362001)(36756003)(41300700001)(82740400003)(40460700003)(81166007)(8936002)(6512007)(336012)(26005)(33656002)(83380400001)(36860700001)(6862004)(54906003)(6486002)(316002)(53546011)(70206006)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2022 11:17:56.3525
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 39393ac5-d228-4d9f-d711-08da970bf09b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7837
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Sep 2022 11:18:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170688

T24gMTQgU2VwIDIwMjIsIGF0IDA5OjA5LCBNaWtrbyBSYXBlbGkgdmlhIGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcgPG1pa2tvLnJhcGVsaT1saW5hcm8ub3JnQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+
IHdyb3RlOg0KPiBGb3VuZCB0aGUgcm9vdCBjYXVzZS4gQXMgc3VnZ2VzdGVkIG9uICNweWNvIHRv
byBtYXliZSBuYXRpdmUgb3BlbnNzbA0KPiB3YXMgbWlzaW5nIGxlZ2FjeSBzdXBwb3J0Lg0KPiBJ
dCB3YXNuJ3QgYnV0IGxvYWRpbmcgdGhlIG9uIHB1cnBvc2UgaGlkZGVuIG9wZW5zc2wgbGVnYWN5
LnNvIHdhcw0KPiBmYWlsaW5nLiBJdCBpcyBsb2NhdGVkIGluDQo+IHJlY2lwZS1zeXNyb290LW5h
dGl2ZS91c3IvbGliL29zc2wtbW9kdWxlcy9sZWdhY3kuc28gYW5kIG9ubHkgZm91bmQNCj4gdmlh
IE9QRU5TU0xfTU9EVUxFUw0KPiB2YXJpYWJsZSB3aGljaCB3YXNuJ3Qgc2V0IGZvciBweXRob24z
LW5hdGl2ZSB1c2Vycy4gVGhlc2UgY3VzdG9tDQo+IHZhcmlhYmxlcyBhcmUgc2V0IGluIHRoZSBu
YXRpdmUgb3BlbnNzbA0KPiB3cmFwcGVyIHNjcmlwdCBhbmQgdGhpcyBhbHNvIGZpeGVzIHRoZSBu
b3QgZm91bmQgb3BlbnNzbC5jbmYuIE5vdyBJDQo+IGNvdWxkIHNlbmQgYSBwYXRjaCB3aGljaCBz
ZXRzDQo+IHRoZSBPUEVOU1NMX0NPTkYsIE9QRU5TU0xfRU5HSU5FUyBhbmQgT1BFTlNTTF9NT0RV
TEVTIHBhdGhzIGZvciBweXRob24zDQo+IHVzZXJzIHZpYSBweXRob24zbmF0aXZlLmJiY2xhc3M6
DQoNCknigJltIGdsYWQgdGhpcyB3YXMgcm9vdC1jYXVzZWQgYmVmb3JlIGl0IHdhcyBtZXJnZWQs
IGJlY2F1c2UgeWVzLCB0aGlzIGlzIHRoZSDigJhjb3JyZWN04oCZIChiZXN0IGtub3duKSBmaXgg
cmlnaHQgbm93Og0KDQp+L1lvY3RvL21ldGEtYXJtICUgZ2l0IGdyZXAgImV4cG9ydCBPUEVOU1NM
X01PRFVMRVMiDQptZXRhLWFybS9yZWNpcGVzLWJzcC90cnVzdGVkLWZpcm13YXJlLW0vdHJ1c3Rl
ZC1maXJtd2FyZS1tXzEuNi4wLmJiOmV4cG9ydCBPUEVOU1NMX01PRFVMRVM9IiR7U1RBR0lOR19M
SUJESVJfTkFUSVZFfS9vc3NsLW1vZHVsZXMiDQptZXRhLWFybS9yZWNpcGVzLXNlY3VyaXR5L29w
dGVlLWZ0cG0vb3B0ZWUtZnRwbV9naXQuYmI6ZXhwb3J0IE9QRU5TU0xfTU9EVUxFUz0iJHtTVEFH
SU5HX0xJQkRJUl9OQVRJVkV9L29zc2wtbW9kdWxlcyINCm1ldGEtYXJtL3JlY2lwZXMtc2VjdXJp
dHkvb3B0ZWUvb3B0ZWUuaW5jOmV4cG9ydCBPUEVOU1NMX01PRFVMRVM9IiR7U1RBR0lOR19MSUJE
SVJfTkFUSVZFfS9vc3NsLW1vZHVsZXPigJ0NCg0KQSBiZXR0ZXIgc29sdXRpb24gaXMgbmVlZGVk
IGZvciBzdXJlLiAgQXQgbGVhc3Qgd2hlbiB0aGUgY2VydGlmaWNhdGVzIGNhbuKAmXQgYmUgZm91
bmQgeW91IGdldCBzb21ld2hhdCB1bmRlcnN0YW5kYWJsZSBlcnJvcnMsIHRoZSBweXRob24zLWNy
eXB0byBlcnJvciBpcyBvcGFxdWUgYXQgYmVzdC4NCg0KT3BlblNTTCBzdXBwb3J0aW5nIHJ1bnRp
bWUtcmVsb2NhdGlvbiB3aXRoIGEgc2luZ2xlIHZhcmlhYmxlIHdvdWxkIGJlIG5pY2UsIGJ1dCBp
aXJjIGZyb20gZ2xhbmNpbmcgYXQgdGhlIHNvdXJjZSBjb2RlIHByZXZpb3VzbHkgbm90IGEgdHJp
dmlhbCBjaGFuZ2UuICBUaGF0IHNhaWQgaXQgZG9lcyBjYXVzZSBzdWZmaWNpZW50IHBhaW4gdGhh
dCBtYXliZSB3ZSBqdXN0IGhhdmUgdG8gY2FycnkgdGhlIHBhdGNoLg0KDQpBbHRlcm5hdGl2ZWx5
LCB3ZSBleHRlbmQgdGhlIG1hZ2ljIHJlbG9jYXRpb24gdG8gbmF0aXZlIHJlY2lwZXMuICBFdmVu
IGxlc3MgdHJpdmlhbOKApg0KDQpSb3Nz

