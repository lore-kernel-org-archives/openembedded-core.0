Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34E85C64EC4
	for <webhook@archiver.kernel.org>; Wed,  8 Mar 2023 13:35:11 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.59])
 by mx.groups.io with SMTP id smtpd.web11.7148.1678282507759276057
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Mar 2023 05:35:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=Oqk9CxaU;
 spf=pass (domain: arm.com, ip: 40.107.7.59, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XM4h94Uo8xevvmc1oGSrZXnP+nkgcOnkRx3lfAUC2mk=;
 b=Oqk9CxaUXwISOIQk5949wAe5vAamhIAvV4T1sC3u4DPtTtezFbFwR5b6Me3IWbWmurP+cuZJZOCJWDW13++XB424uQyeTbeYzZTJ+JWmtScAlzDaznej3s9SRPrMhqBgjm1rIYAU6SnvX0OID20+NYdH5UBja5bia0cRcd3GVAw=
Received: from AM6P194CA0104.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:8f::45)
 by AM9PR08MB6033.eurprd08.prod.outlook.com (2603:10a6:20b:286::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.17; Wed, 8 Mar
 2023 13:35:04 +0000
Received: from VI1EUR03FT044.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8f:cafe::4e) by AM6P194CA0104.outlook.office365.com
 (2603:10a6:209:8f::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29 via Frontend
 Transport; Wed, 8 Mar 2023 13:35:04 +0000
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
 15.20.6156.29 via Frontend Transport; Wed, 8 Mar 2023 13:35:03 +0000
Received: ("Tessian outbound cfb430c87a1e:v135"); Wed, 08 Mar 2023 13:35:03 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c94173ffa9789d38
X-CR-MTA-TID: 64aa7808
Received: from dfc676b8f16c.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id EC02F763-D5A9-471D-B06E-94A6AB015C70.1;
	Wed, 08 Mar 2023 13:34:56 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id dfc676b8f16c.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 08 Mar 2023 13:34:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Onsz9L/HX7ho8KDFxhwzYGezGKNskvWZnFY+352Npb8lB5+j1VTyWabk26rrYeHek3V34RZ++NReYDma6zZy03Tf3ESAot8hUW+e+c3gqYtwW4uhV8bIOmHLU9RP41fWTWaqMg1Kc+5TefvVoHl2/UClevC9snaktHEqiSpMfz/vzYneNZ/ozxDM5IaPJZKccwe5sw+ROsqjGMk08zEDuKXjNFkvNs7LLFmeUAnfUt2d5oEub0UOIxvY/Lft4i6feTPOnvTFQIYhgnXgDhjtHGmPdqorQg1Tm3JP6aBccBMShED2QvRPwhQxkywl5NLJS64MvLQbm57G3QKIwVaFCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XM4h94Uo8xevvmc1oGSrZXnP+nkgcOnkRx3lfAUC2mk=;
 b=Lq0d/SFdcWGwiFrmDD1pQer0A6cvtW7m7y2AcQY7zL2/STiVfW6Z/SJe1PLFkb4iqaq5Z1Ie1b8XQmpcxV5ujucZcKCwCzFMRHWSMidQaJgZt6z8SrhPpqeyxIG8MUn0I8QonaQUGSilRLPj0tIQ+zXTt0fDTYX6aGEtS+681w/Kyh/UT9j/urG/TIM3Y5wXEkMdIid20Xj1zWitooC45xMH2BnbPR4+r/SuFD+g+lzazz4UFs2Mx3z9y6ZAbmSBWTew4nk1IjPIsh7+5pFL4SErfzqhne3KHEKAIWk4t0QVwO1qw/zLhWa5NFyfsZyMx7fnK0HL8iCaKyeRZHydVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XM4h94Uo8xevvmc1oGSrZXnP+nkgcOnkRx3lfAUC2mk=;
 b=Oqk9CxaUXwISOIQk5949wAe5vAamhIAvV4T1sC3u4DPtTtezFbFwR5b6Me3IWbWmurP+cuZJZOCJWDW13++XB424uQyeTbeYzZTJ+JWmtScAlzDaznej3s9SRPrMhqBgjm1rIYAU6SnvX0OID20+NYdH5UBja5bia0cRcd3GVAw=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAXPR08MB6335.eurprd08.prod.outlook.com (2603:10a6:102:12c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.17; Wed, 8 Mar
 2023 13:34:55 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::e305:742e:e10b:1093]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::e305:742e:e10b:1093%2]) with mapi id 15.20.6156.022; Wed, 8 Mar 2023
 13:34:55 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "sudipm.mukherjee@gmail.com" <sudipm.mukherjee@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] libgit2: update license information
Thread-Topic: [OE-core] [PATCH] libgit2: update license information
Thread-Index: AQHZTVC7zCh5KyzW20iD7NOkhc972q7w6toA
Date: Wed, 8 Mar 2023 13:34:54 +0000
Message-ID: <A0A3131E-FCC9-4C84-A077-715368907A25@arm.com>
References: <20230302214744.1041422-1-sudipm.mukherjee@gmail.com>
In-Reply-To: <20230302214744.1041422-1-sudipm.mukherjee@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAXPR08MB6335:EE_|VI1EUR03FT044:EE_|AM9PR08MB6033:EE_
X-MS-Office365-Filtering-Correlation-Id: 730a5fe6-5fe7-4bbf-d10c-08db1fd9ec95
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 XyH6XYUzai3MrnF/O9gmyBam6UPAMd8QThHtxIG4wOq+pDfFy99gjhpgxtUnIXpM6quWBEBCQgKi2pCoshu1z9Uc7HLth1/6zeJqZLbHj8TfUUYfv+W0v7ZEHgnIY0wGWMyzIG1nswLBCP0SgX+t/F7lkFds3EDEEABf3TFn17KuHbTOk6OsTvsF4sKd2waJnUGf/XViS6NrT26bmPA81mma+QhYdmlY6z7ixey807xN7JTfAk0KItg90VA5JzE9l+jBIbPkLW6KMfxxOrdKYbDeQzbE+9zW7z+qgY09Rmk1zXSD4xOvwaHiHY1jZczzGuIOaANtfU4EUTX/6kfHPK8Sto1ClIVdlKVkmfZ+CpfUJUMyb0R3x3uxKnLrYZAKiIdBxOIYH4tacZ9dbn6JC+Oj8iublZrk/XCKcMCk6G0V2P0RDHSgZ0agIguroWAJkQRH+r/TpXrD8JK3vVqYIYRogitNHre7UK7mrAz4rmUckuJf8zR+Av9slaQl7Nn2G67n383yNPtysGSAgkcpKDAWvgootlNShDYFfWm/MJQu6ldhZMFAYh6JQZr37sMUKBrzocNDfw7Og1lEN0dUcLrOJRCItnkZh5gByWFwTgbZ23edRgymbV5hdG5fBLgmJbgbbWGYzwNOt8yHjVWSYNlOYp0GrUEdwxs66eMzLcAsSkJA/lERfqgq8aNjWbluPKhrFNVRW3hZpovXijvv9Dgy4JZw4J3wUMbtcLXfnDY=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(39860400002)(346002)(376002)(136003)(366004)(451199018)(83380400001)(2906002)(2616005)(71200400001)(66946007)(64756008)(91956017)(66446008)(66556008)(8676002)(6916009)(66476007)(5660300002)(76116006)(186003)(38100700002)(41300700001)(6512007)(122000001)(6506007)(36756003)(26005)(8936002)(478600001)(6486002)(33656002)(4326008)(53546011)(86362001)(316002)(38070700005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <5A54D28ACB881A4C9B8C8689E7B88E32@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6335
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VI1EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	174e4374-dfd2-4a06-bc1c-08db1fd9e725
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	EliDRv/9UgE7dXOpFCfuGSOUTzAiM8lxgJnBiVkhnK0KJxbLqxCjJaH1zXWlgI4s7VPQBOAjwfa2JRzrLdl0XknMN1nOv23k+UgEypHmbw664hzjGmGFU+arEmTu6B5eqTkJVEKQ9vFSTn8OYU8QfuNwlwGisyqmnDj0dNPR/bxLjBbfeJYS9IkBuxhv7Ba1xDaYTzVN4WJ6eWG6TpLDI4lAG4XN0hFqj5Nb3GZm3d1X/li9fkQOlagA/3FKNgYiayJK85rjBsdVhCQIH381M50MCkc+B3QV2y3MduyH4YSQkpBQOr6BKwPzyRgqqyrm7eMyBXjZq4IgUjubWhhtGqfoP/FkUvltRWQvNO8TZ26/2St38Lfb2rTXMqDcQThWjxCqrDrOBW3lNZKOUo0sCfcxKyCJ4HhbIfAaVg2gktoQierHZelrBhsTpa4BPeMYwTdqOHDK+/VQh/8rJL9iIe/NATaM5RSe3dnqkvtk6/0UCUs0/AVSYJxSDmIc7//dT+G3hgsOoi87igLQl6MNroeTbD6bGCwJJvc/RMuz2PPe24Q4vv8CvstHqnuRcyWvmtt/C3y/dbQiuQN6aFNL/uhoTfzyjjtup3PEPY+B30KwmK4KBQXWas9Rsay1pfjvOXbdiL/hDiBh6UNGt1ZJ/NeHvwUKqBtGkPd51E6BRS/sr8IOCu2mfXvOLM2STTR2
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(376002)(346002)(136003)(39860400002)(396003)(451199018)(40470700004)(36840700001)(46966006)(8676002)(41300700001)(70206006)(70586007)(81166007)(4326008)(2906002)(356005)(316002)(8936002)(82740400003)(6862004)(5660300002)(186003)(478600001)(82310400005)(40460700003)(36860700001)(36756003)(6486002)(83380400001)(40480700001)(26005)(6506007)(53546011)(6512007)(33656002)(2616005)(336012)(86362001)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2023 13:35:03.9725
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 730a5fe6-5fe7-4bbf-d10c-08db1fd9ec95
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VI1EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6033
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Mar 2023 13:35:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178173

T24gMiBNYXIgMjAyMywgYXQgMjE6NDcsIFN1ZGlwIE11a2hlcmplZSB2aWEgbGlzdHMub3BlbmVt
YmVkZGVkLm9yZyA8c3VkaXBtLm11a2hlcmplZT1nbWFpbC5jb21AbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZz4gd3JvdGU6DQo+IA0KPiBUaGUgTElDRU5TRSBkaWQgbm90IGhhdmUgY29tcGxldGUgaW5m
b3JtYXRpb24uDQo+IFNvbWUgZXhhbXBsZXMgb2YgbWlzc2luZyBsaWNlbnNlOg0KPiANCj4gWmxp
YjogZGVwcy96bGliLw0KPiBJU0M6IHRlc3RzL2NsYXIvY2xhci5jDQo+IExHUEwtMi4xLW9yLWxh
dGVyOiBzcmMvbGliZ2l0Mi94ZGlmZi94ZGlmZmkuYw0KPiBDQzAtMS4wOiBzcmMvdXRpbC9yYW5k
LmMNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFN1ZGlwIE11a2hlcmplZSA8c3VkaXBtLm11a2hlcmpl
ZUBnbWFpbC5jb20+DQo+IC0tLQ0KPiBtZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJnaXQyL2xpYmdp
dDJfMS41LjEuYmIgfCAyICstDQo+IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmdp
dDIvbGliZ2l0Ml8xLjUuMS5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmdpdDIvbGliZ2l0
Ml8xLjUuMS5iYg0KPiBpbmRleCA1OTg2NmNlMzg1Li5lYjdiNTM4ZWNlIDEwMDY0NA0KPiAtLS0g
YS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJnaXQyL2xpYmdpdDJfMS41LjEuYmINCj4gKysrIGIv
bWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliZ2l0Mi9saWJnaXQyXzEuNS4xLmJiDQo+IEBAIC0xLDYg
KzEsNiBAQA0KPiBTVU1NQVJZID0gInRoZSBHaXQgbGlua2FibGUgbGlicmFyeSINCj4gSE9NRVBB
R0UgPSAiaHR0cDovL2xpYmdpdDIuZ2l0aHViLmNvbS8iDQo+IC1MSUNFTlNFID0gIkdQTC0yLjAt
d2l0aC1HQ0MtZXhjZXB0aW9uICYgTUlUICYgT3BlblNTTCAmIEJTRC0zLUNsYXVzZSINCj4gK0xJ
Q0VOU0UgPSAiR1BMLTIuMC13aXRoLUdDQy1leGNlcHRpb24gJiBNSVQgJiBPcGVuU1NMICYgQlNE
LTMtQ2xhdXNlICYgWmxpYiAmIElTQyAmIExHUEwtMi4xLW9yLWxhdGVyICYgQ0MwLTEuMCINCj4g
TElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9MTEyZTZiYjQyMWRlYTczY2Q0
MWRlMDllNzc3ZjJkMmPigJ0NCg0KQ2FuIHlvdSBhbHNvIGV4cGFuZCBMSUNfRklMRVNfQ0hLU1VN
IHRvIGNvdmVyIHRoZXNlPw0KDQpSb3NzDQoNCg==

