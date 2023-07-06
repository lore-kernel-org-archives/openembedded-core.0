Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2F27EB64D9
	for <webhook@archiver.kernel.org>; Thu,  6 Jul 2023 10:38:09 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.47])
 by mx.groups.io with SMTP id smtpd.web10.18937.1688639885040539536
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jul 2023 03:38:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=XbnNhL7k;
 spf=pass (domain: arm.com, ip: 40.107.105.47, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SusxxVR9eJsdYoUQzaYt36qkCSY1ygvr/zW4A8MZjvA=;
 b=XbnNhL7kIJgMZC02q5zrzZH3NuG1ZbhPLGHde4BI3ABPipvKcxQ1uxEvqhw8Kx5daV7Sk75bzpMlDGzLYhvc8dFvrx0OlwLcJ89q/3mphJ+BQHr27EF40tnO1YESXT0vlBeiDTyxKi+u35RNLA7LEwcd8NtGmdOMPHjpmZPEbHc=
Received: from AM6PR04CA0013.eurprd04.prod.outlook.com (2603:10a6:20b:92::26)
 by AM8PR08MB6513.eurprd08.prod.outlook.com (2603:10a6:20b:366::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Thu, 6 Jul
 2023 10:38:01 +0000
Received: from AM7EUR03FT042.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:92:cafe::ab) by AM6PR04CA0013.outlook.office365.com
 (2603:10a6:20b:92::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.18 via Frontend
 Transport; Thu, 6 Jul 2023 10:38:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT042.mail.protection.outlook.com (100.127.140.209) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6565.24 via Frontend Transport; Thu, 6 Jul 2023 10:38:00 +0000
Received: ("Tessian outbound c08fa2e31830:v142"); Thu, 06 Jul 2023 10:38:00 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 10501081dabfcaae
X-CR-MTA-TID: 64aa7808
Received: from 9575ab2cc690.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id B55947AD-29CA-46B0-B8DE-0AB80D762D19.1;
	Thu, 06 Jul 2023 10:37:53 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9575ab2cc690.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 06 Jul 2023 10:37:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C1zAycZiFWlV86o+HnRxaBp9p2Yp6geqkzGo+x+Iv1lsX06mEA2zoZcQpZ9D7/4wL9vCPefsfOqN9nQNJ3mdRw9uIS3P23U5OrYRQ7y2E6Qp6WZqXBcOj1JqbznXFB6hF+9qIkOozuxbGzPbLlxZAcgYJvcniP8H+YWKdfQsxaX37OfMUt3DA+4+T3aTDvnp7z1D6aFqLMLE8q2PV+puPiLhSykz/ZgQN1FD073Nmy2r+q39iF2vXMroyANMfzLv+8fd7iwQvCSj+zAs+uo+XQkmZSME25M1J7ggo4jPKWWHxWYEGbFzdoOVSx2yHNcL4e9VDu8op8zq98JJ5ikoCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SusxxVR9eJsdYoUQzaYt36qkCSY1ygvr/zW4A8MZjvA=;
 b=jtCDlOLsV7RoMOwt4Tb++sJZvgepUBmy8sUUVAngnGKqOgPAlDu4LEC51q7NWTqGr+Wa2RicG6ij3O7jCfPA8jlz1K+9auJTJKQKEmGZ+R4uVybGsp1AEFXTxj3pd95BekQ0R4wTR6dJOVPiMDts2GaTdpWpCvx/rsRzudhQrmTH21JX/bIWmNyH1mzA+fhbfRwhgOUan0UM1kYLcImpWtLxeKCx4dnqCDqgbQ1DYvp8mm+VrxMA3j/QumCIEA0h6WGo7GiLlrKx2Ehw7ceI14Uc249wndNUAnMTUspWmAzJqhEcHHDIxMjY0gjzTM1ywRQ2sEYhLnUFQZb2fb4uPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SusxxVR9eJsdYoUQzaYt36qkCSY1ygvr/zW4A8MZjvA=;
 b=XbnNhL7kIJgMZC02q5zrzZH3NuG1ZbhPLGHde4BI3ABPipvKcxQ1uxEvqhw8Kx5daV7Sk75bzpMlDGzLYhvc8dFvrx0OlwLcJ89q/3mphJ+BQHr27EF40tnO1YESXT0vlBeiDTyxKi+u35RNLA7LEwcd8NtGmdOMPHjpmZPEbHc=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAVPR08MB9212.eurprd08.prod.outlook.com (2603:10a6:102:307::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Thu, 6 Jul
 2023 10:37:51 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::30b4:3110:b02d:7f21]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::30b4:3110:b02d:7f21%7]) with mapi id 15.20.6565.016; Thu, 6 Jul 2023
 10:37:50 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Jose Quaresma <quaresma.jose@gmail.com>
CC: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH v2 2/2] openssl: fix the PERLEXTERNAL path
Thread-Topic: [OE-core][PATCH v2 2/2] openssl: fix the PERLEXTERNAL path
Thread-Index: AQHZr3FsdHqnPJmZGUqub4gqmXWsQK+sjOMA
Date: Thu, 6 Jul 2023 10:37:50 +0000
Message-ID: <87A4E629-0501-4F73-B327-3B20BC734FD5@arm.com>
References: <20230705184847.587503-1-jose.quaresma@foundries.io>
 <20230705184847.587503-2-jose.quaresma@foundries.io>
In-Reply-To: <20230705184847.587503-2-jose.quaresma@foundries.io>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAVPR08MB9212:EE_|AM7EUR03FT042:EE_|AM8PR08MB6513:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a304c70-0e4c-40e2-70db-08db7e0d1220
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 MxDRR9+1XXSZ9mOwbyjM4+bZYIuFNSmOFCVKJNDkDlHHMeI00NJEVzk2eFlVSd+POjuVhWkUQnF97NOBAK8wQKjm5GkChxeji5nyOms/JTlSOnAXNFwWah+cBuASIPaMgMqoDlKREJ8kZcsYijHqJb4cOidne1XhvLMpNukOpaWAm3fHhHBsa0dAqTQKZITYKTt3Pe3Md+bX5kSVqj5eL9hmxV1qZydiiDN2x2CCTdINHSRE0O+GLw4/hu+u5YAea9ne/0QAcXWMXhZjrM+q9/lqEfDwST10hlAIy5L+dawMqmC0Y+/a4pamOmyPlcqD3h31jE82D2i8j/sDOeUVs91b/vtiuyiJmXmNZX+I0o0zm5M1QvEs8PZGSOUDh54anK74sESpwFB3moGzpLGxOOOB0xL2Q3jzMJajCAvW4bbPe7Ncs3RDOAF2NVONFO41UzL8FQ4fx0m5R3tqvWHSZk4zN7O4RtbRJyreqJN/jfTOf0t9pUtOkS4hfuIW+YrpdHusqm2lv0Nb5hc7SssZ/FvY0nYRPUWHLhbIy4XkPjBB4NOYcYTujaNj0uvJ92uQJbtrnjcBKSKpXhQL/+D/m+NiMUNui9wM2BMXNnngamzN7Ypkm6OEue6loDf+ZhA+oHFB4ZpnufqraEahIzxd0A==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(396003)(366004)(346002)(39860400002)(451199021)(66446008)(33656002)(66556008)(6916009)(91956017)(66946007)(66476007)(76116006)(478600001)(64756008)(36756003)(8676002)(8936002)(4326008)(5660300002)(2906002)(316002)(26005)(41300700001)(6512007)(38070700005)(86362001)(38100700002)(53546011)(6506007)(186003)(71200400001)(83380400001)(2616005)(6486002)(122000001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <07401774745429468C06A167BEF81238@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9212
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	1d9be771-bf0b-4a77-66aa-08db7e0d0c46
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	1p93cyzLBcC3z+O4lhp4plqNZk9SqcIr6oLrDRVu0y0EorGJeu9MxF1ECclQVgZFVAcmnAdsoqV772Rfp64ysk9xotGByRoltO2pnMRthv0xH0yKPU0P3PLZYuZgRho1IqK7sL1sDd6NXrrd3GHNMfuoSpwShQDiuJB8hO5RA/A1o49l8IJr+LQv94JVHTWpxS+9blexr8p2UJF8tpSzhmg7S/3nSNyBEYH8FjDh6jZE0pasD3vMcKVheYHQhgMfaDhoQfh4wDYoTrgqVVJjMEHQ6MSTquyC1bgzBz2hiTnfdJie/pIOMXTdQY3NYXlwZV5mQxgmsq2iLOUTNeMF72LAziTkq76/wcUai0D3fWXBpDpJShFWe5/2IEo2TPCFx5LxZYhDsc6d4ZPJBvkVMyDJgUFpGx8F01caVg5xNksu8yjx7Ke9yTMF4YJ3apRXcofB/hFXMXI+6OvnD5JR2hLcOxi/VGZh6BDkESMynB0UsZItZHTCcPoVAM7OpvQrh05Q/7+vOsjU2hmi7u3pgIJlKLYWHZnWgVfw4zgLDyFXa1/CfRay/2rEQCyevg0mRbLsq45MxaqtHuMY/nu6SoYZyUGH8ZY0KNv5u4ZGh5304l9hN17DkhZVXRZx+fRPEKMTdBDgQ5jkhtXY5q9F/eZPa+Ig/A8INDPbAIej5gwIeL6VuMneCnwWTJQsdk0zkxRKVbTJFwqstM99mVw7P11zsPcIBlx7CPi+Hk78D3ZS+lNt393R6OsEAHFSAoEt
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(396003)(39860400002)(136003)(451199021)(40470700004)(36840700001)(46966006)(81166007)(356005)(6486002)(82740400003)(40460700003)(478600001)(6862004)(5660300002)(8936002)(36756003)(2906002)(8676002)(86362001)(33656002)(82310400005)(40480700001)(4326008)(70586007)(70206006)(316002)(41300700001)(53546011)(6506007)(26005)(36860700001)(336012)(83380400001)(47076005)(186003)(2616005)(6512007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2023 10:38:00.6222
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a304c70-0e4c-40e2-70db-08db7e0d1220
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6513
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 10:38:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183924

T24gNSBKdWwgMjAyMywgYXQgMTk6NDgsIEpvc2UgUXVhcmVzbWEgdmlhIGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcgPHF1YXJlc21hLmpvc2U9Z21haWwuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+
IHdyb3RlOg0KPiANCj4gVGhlIFRleHQtVGVtcGxhdGUgd2FzIHVwZGF0ZWQgZnJvbSAxLjQ2IHRv
IDEuNTYNCj4gDQo+IHwgRVJST1I6IG9wZW5zc2wtbmF0aXZlLTMuMS4xLXIwIGRvX2NvbmZpZ3Vy
ZTogUEVSTEVYVEVSTkFMICcvYnVpbGQvdG1wL3dvcmsveDg2XzY0LWxpbnV4L29wZW5zc2wtbmF0
aXZlLzMuMS4xLXIwL29wZW5zc2wtMy4xLjEvZXh0ZXJuYWwvcGVybC9UZXh0LVRlbXBsYXRlLTEu
NDYvbGliJyBub3QgZm91bmQhDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBKb3NlIFF1YXJlc21hIDxq
b3NlLnF1YXJlc21hQGZvdW5kcmllcy5pbz4NCj4gLS0tDQo+IG1ldGEvcmVjaXBlcy1jb25uZWN0
aXZpdHkvb3BlbnNzbC9vcGVuc3NsXzMuMS4xLmJiIHwgMiArLQ0KPiAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2wvb3BlbnNzbF8zLjEuMS5iYiBiL21ldGEvcmVjaXBl
cy1jb25uZWN0aXZpdHkvb3BlbnNzbC9vcGVuc3NsXzMuMS4xLmJiDQo+IGluZGV4IGI4NDlmOWNh
NzkuLjVmMzBhMzdjOGEgMTAwNjQ0DQo+IC0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkv
b3BlbnNzbC9vcGVuc3NsXzMuMS4xLmJiDQo+ICsrKyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZp
dHkvb3BlbnNzbC9vcGVuc3NsXzMuMS4xLmJiDQo+IEBAIC0xMzcsNyArMTM3LDcgQEAgZG9fY29u
ZmlndXJlICgpIHsNCj4gZmkNCj4gIyBXQVJOSU5HOiBkbyBub3Qgc2V0IGNvbXBpbGVyL2xpbmtl
ciBmbGFncyAoLUkvLUQgZXRjLikgaW4gRVhUUkFfT0VDT05GLCBhcyB0aGV5IHdpbGwgZnVsbHkg
cmVwbGFjZSB0aGUNCj4gIyBlbnZpcm9ubWVudCB2YXJpYWJsZXMgc2V0IGJ5IGJpdGJha2UuIEFk
anVzdCB0aGUgZW52aXJvbm1lbnQgdmFyaWFibGVzIGluc3RlYWQuDQo+IC0gUEVSTEVYVEVSTkFM
PSIke1N9L2V4dGVybmFsL3BlcmwvVGV4dC1UZW1wbGF0ZS0xLjQ2L2xpYiINCj4gKyBQRVJMRVhU
RVJOQUw9IiR7U30vZXh0ZXJuYWwvcGVybC9UZXh0LVRlbXBsYXRlLTEuNTYvbGliIg0KDQpBcyB5
b3XigJl2ZSBkZW1vbnN0cmF0ZWQgdGhhdCBpcyB2ZXJ5IGZyYWdpbGUsIGNhbuKAmXQgd2UganVz
dCB1c2UgYSBnbG9iIHRvIGdldCB0aGUgcmlnaHQgcGF0aD8NCg0KUm9zcw0KDQo=

