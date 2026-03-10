Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9669EB1052
	for <webhook@archiver.kernel.org>; Tue, 10 Mar 2026 11:45:37 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.71])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37980.1773143133038483355
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Mar 2026 04:45:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=ngXFvBz7;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=ngXFvBz7;
 spf=pass (domain: arm.com, ip: 52.101.84.71, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=asDJrQEcjk7OLNJWTiUIbi4xY4CMw6GTsylNzHxXhDeqa4li9ECSeS6HOnZwugknmTc3Llb5gjBeJRWZbSORlQgUS/b1c/+mqVnS0HcDTgoHc3mMjpnKk1llFN3apvAkq5YUXEDds4kNoH0O/VBUXquykvGp97GB5Vje6t2EdxYV+//0ORJkcPaeYGN850PzyNEdMayTPRM2jwd2lsXNsrpx2DE0DTaB+G+gZy3vLOrnB6iuZ5FsxGRPZy9r8c90i9DWzbjJvsBwm5gJeQ7ahvsKjCNHdIu3D5gjPL040OyL7RB42jfa8oyoeDhOslSRY8DkPdCLUdkksMKN12cXZQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bQsa99ettuqyjrdi2jDqPMbBCXS8VAaBGen2ruKxRhc=;
 b=eBzIB/vprHQklZ4jc4MnAWMQW/X6gCe+kaozbHfS6RfIAWFeFzvvD7h5g3/CBwm1qM3P5BFdEakMmq88oBiP7h+gj1Kox8MDS+oijZvf6rpJAulAXLbEiEzu0uJbm4/wBFZf/BpxUfHnUmdZWyl9pKfK+fcE1xtVxNBsZLKYZZSw5jm/nFDyWSFQu73zSPcSW4szGs0bIB/DNNbexp4vqICx/32G51lNYXZcCUj4BN8v3uHRdqpUg7UGwLcuSlQ71Yt4wP+OEQj8NNtNadu4L70sFHIfKujKWCIUx3yt6SdaJvguOkfwx268kYI5VKb3rSc9aWCUhYRXI5OYWG06NQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=windriver.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bQsa99ettuqyjrdi2jDqPMbBCXS8VAaBGen2ruKxRhc=;
 b=ngXFvBz7TEwe5F/Ggcy6oeEXevhxwiA0AT//2U3N0YdaBlq0WHqZumaP1KwdFFSqKCmH6nlAQrX/XiaB92swRqhwp9o4LM1tFbtrteMQJINOwFIHTOp8LeFYgX25/yqy/r2INJufNg46+EB+P64TlaOQk02UE+v7erYU/1B5uWc=
Received: from DU2PR04CA0244.eurprd04.prod.outlook.com (2603:10a6:10:28e::9)
 by DU2PR08MB9962.eurprd08.prod.outlook.com (2603:10a6:10:498::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Tue, 10 Mar
 2026 11:45:27 +0000
Received: from DU2PEPF0001E9C2.eurprd03.prod.outlook.com
 (2603:10a6:10:28e:cafe::8e) by DU2PR04CA0244.outlook.office365.com
 (2603:10a6:10:28e::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.25 via Frontend Transport; Tue,
 10 Mar 2026 11:45:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF0001E9C2.mail.protection.outlook.com (10.167.8.71) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.16 via
 Frontend Transport; Tue, 10 Mar 2026 11:45:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yqtu+Ra1FRUFcJQoSKC+0G6z57gjSwMy5pdxs4qz8mrjVPT4ho1f+Of3eKk+szKMl1HpJeILOWbsrSgnMj7RPzKZPd1JWbVAdD8KEG5sSZ3e0CabXMrbDr70qXVVL00O6K13FstFGno2jCt1e+QJr3oRHJ4zjnTJefWeYz4ujeGYfO0P5aJyHhcFfNrpayldebEQM9H0iRooaBatRofyOR/osLcauZbva2rQlp3psymq4Mz0UvswXdac1Te1g4DL+m3OSXZ4EY8i4A0vCqCMz7xyI/hlaPOnnvrfPPViuHvgEjMb/0Iisavke/KndsLd/rt40HiloNMzVSz9k/PM/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bQsa99ettuqyjrdi2jDqPMbBCXS8VAaBGen2ruKxRhc=;
 b=MW/9Rz/ai/gAMtz0iVEHc9qcd/387btHANF7Ei2jWuYuhTDPZwvIQZxyfJgJaNCcc2mGDRRNENBs+B/6MbLFYAj+z6Gtkg3N52gAe7nV0cWXMWwxPv2G06+H9GBvRHtZENxpgSyucp21NMlX+ypvvvT//rnC2NnC4azsxTnZytbmBeQkY29ztxOKUSdlRIywvCYzgmpEgHmrAqbFnpqO/pS68L3FxLSn4fHvhYM3d7gLGVttEMVGXTdzhu+DZMqhFimhwCPuvOyWAM+YIOAZoDg4JqIXpZbPNwFViJuy3wZl0b2pESsc3X1HzCq7a7skzrCBhyYLYvCVtzW4QS2KwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bQsa99ettuqyjrdi2jDqPMbBCXS8VAaBGen2ruKxRhc=;
 b=ngXFvBz7TEwe5F/Ggcy6oeEXevhxwiA0AT//2U3N0YdaBlq0WHqZumaP1KwdFFSqKCmH6nlAQrX/XiaB92swRqhwp9o4LM1tFbtrteMQJINOwFIHTOp8LeFYgX25/yqy/r2INJufNg46+EB+P64TlaOQk02UE+v7erYU/1B5uWc=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAWPR08MB10044.eurprd08.prod.outlook.com (2603:10a6:102:362::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Tue, 10 Mar
 2026 11:44:19 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%6]) with mapi id 15.20.9678.024; Tue, 10 Mar 2026
 11:44:19 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "changqing.li@windriver.com" <changqing.li@windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH V2] appstream: upgrade from 1.0.6 to 1.1.2
Thread-Topic: [OE-core] [PATCH V2] appstream: upgrade from 1.0.6 to 1.1.2
Thread-Index: AQHcpgiGyWCELi5j80mgTdYmOq3+g7WnulcA
Date: Tue, 10 Mar 2026 11:44:18 +0000
Message-ID: <C0CE5EB9-AB4B-40D5-B625-3C34119E3099@arm.com>
References: 
 <DB5PR02MB102138725558AB810833F8DFCEF74A@DB5PR02MB10213.eurprd02.prod.outlook.com>
 <20260225034013.1510432-1-changqing.li@windriver.com>
In-Reply-To: <20260225034013.1510432-1-changqing.li@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.4)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAWPR08MB10044:EE_|DU2PEPF0001E9C2:EE_|DU2PR08MB9962:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e22b88f-7de7-4ede-a83b-08de7e9a85e4
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 8+d4Qr+yoRIKEM2voSoZd3dbKLiL4jSlpARlFTuupxyxHp02Hbvj+orBcpiDEsICtTY51N7lfllTU0EVoZwSEcHGRLePlt3GYS7c5mjxWIF+YJ3E3X+6q2ZKzZBxXggDYxVX4RgbZ2BhERtODdarledto7zL6JI7ujKnfczKZhRkqINBmHEQBcA/jqTci5n1Sc6NUtV4y4r1eFF+cdekiY1W6bhofNWcA6boshIR/AqDqZwM2mJuJP07VlxJ1yJPeXVnknMQdImGRGpC4RMag9L7ns2etrs6GpqBWny0ZV789vSzr353eSHeKQiemXySJYFrrxsod725x6oaGXb7DDOi3krY5SOGPMS6LPLIJKY2HK64OOFNwFQq9utdtRZkgq5tjTrvAF9BjgcRWWY/2VRm1ievYtzOSP3a6gnXpznWvQMSzrsWoWccALGaKuQYlNyVDXJQt0JnhOeO5ThJHbzZz0MbJhHSIgOL7JjgsLHD2h1gSQmakcU3D/UfZzPg4PCj0BocZUxeGLMlkn1RevjcEbmg0OzgczUZoSY0EOqa0cmtbh9bykk3JS2YBYcUmr661vfiA8pnoGycPJE2tGKdRTIvDCes1DhBS56/EdmH4+QyKZ3XAtnOysqh5MfnIZpeYKlx+HEjbY4ozOUPW+QsC1vUQ2GJaWuvOQCkzOjh/a5bjvjKoDWXmwLxmd0+ZHSHtuQj2EOj0K0B9u2wZnIbPfjh/172aexOy404jziWw3YlaAR1GczdsMihYGL3320MgtTTbHKTHYGG+ElaQqMhrf2v/bbpgSxPMWhH4mA=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <890F0AEC50E1C446A36AA8671F290225@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 bDOBzyHw0BPEigBeK2B4zYf61pitcxHs4JDGVVkpGPIEuD/GHnsbzBjX4bfGp1QZWv8PxI927bEyP6PWtenVFcRZ7IybxhM+gekdrq0xOkUJIRBQpUi3K/nOjEFCSFcxmamr04yDMSwU0cvdEL4klCL0UE/WQcaxrzkYrD5j1p+FcONtrtmVxsi7Pi/HlSjU7r4kmgSLioERggBuKM4kI3PeeFIb98fygu88bXRjdH+CbHjzS9IV3EqO0QA4J7CM1pBg/tGazpG3Lq1m+vTss3PUfNrSmJ7xBnleg0+DUdSbAuqUZXyageH0T/+yGi14g3HBbntH+5XRkAehS3MTtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10044
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU2PEPF0001E9C2.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	5b59d6be-ebdf-4de8-3d0b-08de7e9a5d56
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|35042699022|14060799003|36860700016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	YYgnCc+ZFigY8jaEEpvuDSqNmFsPtpGC5i/uLwHEEi4h6uBzeBou/RdihtM0AVVU1U10E7RPX9+/80j3AJpL4BBqi7Wstq6jHV8cLD5XggXrt3oZ8wpyQgJwpAxl39nhJ8Hdgo7PJm2712lt956UfCKnD6u9ZQVGCzEiWlYM4Q/y9O7nunoviolZg/X427BlWl7+m7SQDS33iZcWHYs4jDF9yAHhC0GYGK/iJY5DJZZIoki9CxrRLQSPQxNnWcJs5mCAUlto9RcQCMtnYd4mVKFSFbBdPFB3S8eRPCvtZwzC5BILx7TUtWd0Netx4F3zdu7KrEJYzkEtk0OtuOxgXJSlLNgb/1P3jwDVx+B4FqM2dVd3YpQe5MsItINFM7hqb230XKxWjRlAVbQK7ZhmtUtiZa+ysmLAVGwWGCmpQImlC7KjDdYlezhr0sPbGLoUhDQv/Lr+VUrpLP/U0eYpkJ6hGdE2IMCdE+b+INVFQaijEzI7n8OWcLtoceKeO4yt3Z5fFgLv+qRNZTqouk3YJb3Lc5ryj3ycTMdvZlg6MSowyWQprM3iJ8cfmFe20qbOxUqCfOc0UO/CMvZvUXZkbMEXAWU1YwQhxTcJn6fVQPC6aBCknaTQ6mBTxmOwKVFuXGlTduvJqXL8LtqJrNRkqBWqt7gOX7keN7GDqW02jeFX1CBqvndrKva9Ww1b+V15MBwSvvv9omOXX5WezWE6/YybQ6Hu5t+sZDCto5+1lVRf59hQ1oLYXeSc7V7rXRF7zSgfiMRlwC/hDwNRftJh6A==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(35042699022)(14060799003)(36860700016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	CYegtNmy/5B+nYVWieN8a8ep9bPeMvrY/MQ0Lmxw/ehGYUhMQWaFDjD5140M8bT2cxX8eecyS8K1ALtJ0DTLQe3vULz8RGYgt+YmA230Epejno8+3pxEIeie1MhDOJ/VynBgUgEp/6xKekugumGT3LjMjgZDHGAW/BGQTNladGd0x2s1dQKcmJQWU9lUMIZq5s+67hxsHNhT/dVsbNu+tpNA1AjbGLvEHpRCJdsXG9iVwsp6cr3yf5ztir/CDsulrYsQwaGmYuDNJkR/OoSPcwjIUiBRv2yvkYCu4nsuvWynmi+EOzQEKrtuZzsvFV9yCqaVHDlUb5M4jJrMxE/RuYv/Gri1xrPSeD9w2iO9b9Mi+k/6PyyaerOqYqgYmbTp/9RP3IFflU84MNVE3wewTnEekWv1GdVRL4nrulrDqpI1ekTZp6VwvYriCGNYtNJf
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 11:45:26.9159
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e22b88f-7de7-4ede-a83b-08de7e9a85e4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF0001E9C2.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB9962
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 11:45:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232772

T24gMjUgRmViIDIwMjYsIGF0IDAzOjQwLCBDaGFuZ3FpbmcgTGkgdmlhIGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcgPGNoYW5ncWluZy5saT13aW5kcml2ZXIuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmc+IHdyb3RlOg0KPiBQQUNLQUdFQ09ORklHID89ICIke0BiYi51dGlscy5maWx0ZXIoJ0RJU1RS
T19GRUFUVVJFUycsICdzeXN0ZW1kJywgZCl9Ig0KPiArUEFDS0FHRUNPTkZJRzphcHBlbmQ6Y2xh
c3MtdGFyZ2V0ID0gIiBiYXNoLWNvbXBsZXRpb24iDQo+IA0KPiBQQUNLQUdFQ09ORklHW3N5c3Rl
bWRdID0gIi1Ec3lzdGVtZD10cnVlLC1Ec3lzdGVtZD1mYWxzZSxzeXN0ZW1kIg0KPiBQQUNLQUdF
Q09ORklHW3N0ZW1taW5nXSA9ICItRHN0ZW1taW5nPXRydWUsLURzdGVtbWluZz1mYWxzZSxsaWJz
dGVtbWVyIg0KPiBQQUNLQUdFQ09ORklHW3F0Nl0gPSAiLURxdD10cnVlLC1EcXQ9ZmFsc2UscXRi
YXNlIg0KPiArUEFDS0FHRUNPTkZJR1tiYXNoLWNvbXBsZXRpb25dID0gIi1EYmFzaC1jb21wbGV0
aW9uPXRydWUsLURiYXNoLWNvbXBsZXRpb249ZmFsc2XigJ0NCg0KSSBjYW7igJl0IHNlZSBhbnkg
b3RoZXIgcmVjaXBlcyB0aGF0IGhhdmUgYSBQQUNLQUdFQ09ORklHIGZvciBiYXNoIGNvbXBsZXRp
b24uICBQZXJzb25hbGx5IEnigJlkIGp1c3QgaW5oZXJpdCB0aGUgY2xhc3MgYW5kIEVYVFJBX09F
TUVTT046YXBwZW5kOmNsYXNzLW5hdGl2ZSA9IOKAnCAtRGJhc2gtY29tcGxldGlvbj1mYWxzZeKA
nSBhcyB0aGUgc3BlY2lhbCBjYXNlIGlzIG5hdGl2ZS4NCg0KUm9zcw==

