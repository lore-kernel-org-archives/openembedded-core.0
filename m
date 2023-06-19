Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E8C4EB64D9
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 16:16:55 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.55])
 by mx.groups.io with SMTP id smtpd.web10.11677.1687191413628090103
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Jun 2023 09:16:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=knJD5K2m;
 spf=pass (domain: arm.com, ip: 40.107.247.55, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SKASUpwkd7lzL0yH2w4ljmDYIqOviqaj3kL1KMQHTzM=;
 b=knJD5K2mVipUJSviKizX4f/LBkRai6AmYKznL0WvsU0+4Zx0ilMPnr7jE/Gx7RencGRul+NxcqeLVcFF9ww8mpKlBo64pZXjSiQAzevhYlrBGDdm0MMJgp5wF9J2A/AyLUJWX3h/Cimw7qu7c8id2pVMmSolct+0FC/kZafS0/w=
Received: from DU2PR04CA0237.eurprd04.prod.outlook.com (2603:10a6:10:2b1::32)
 by AM8PR08MB6337.eurprd08.prod.outlook.com (2603:10a6:20b:355::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.36; Mon, 19 Jun
 2023 16:16:50 +0000
Received: from DBAEUR03FT032.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b1:cafe::63) by DU2PR04CA0237.outlook.office365.com
 (2603:10a6:10:2b1::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37 via Frontend
 Transport; Mon, 19 Jun 2023 16:16:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT032.mail.protection.outlook.com (100.127.142.185) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6521.20 via Frontend Transport; Mon, 19 Jun 2023 16:16:49 +0000
Received: ("Tessian outbound 945aec65ec65:v136"); Mon, 19 Jun 2023 16:16:49 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: b73ef34676ff81c1
X-CR-MTA-TID: 64aa7808
Received: from 9b813637d02c.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id A2E151B0-B4CF-4272-828F-84CAEF4A02C8.1;
	Mon, 19 Jun 2023 16:16:43 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9b813637d02c.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 19 Jun 2023 16:16:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dpEdKGY7XRy02itfitAh+QI951pxtc6B/2KM9a8XIgW7060iCEj1G2RmAjFYg3uI/YloR+BPUu+rqdKo/xaPB8BxIGJ9KFU5hqAEqbHGZMscHWhv1aZHWdsBPl91ZMWHJa9DOFMZpO2v3dQDJvVlasN2/9IDnquJH2Y3bKNS2A6THr+4yR+IolvVG/8NP9jyLufXtQ3zPWVyFN39ksMhD2wuu4cBSzwcaHHbxCBo7DHr80aLw2uSH8nMN7tfNldw5EpgGPK3j4BckB8LDgEIO5E1zsUcFotzSSfpNVz/61ddQ1azsxu/4o/2WjRUH348HIdb0FPHKd8hBle6yssqgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SKASUpwkd7lzL0yH2w4ljmDYIqOviqaj3kL1KMQHTzM=;
 b=TcX7IFY/m+plkUbqNWNpI45v6RdzZMdLzmdixrz05lgaFNRnqdEviGv3XadyWbB77hSn5NkMWLDNIG6Gnf86MqxksARTAT0bQgGhETopF/fF0MDlHuGV9d7z755qBnKIV4CkBlz/lh+jYZ0bJfCkbAMZdw0zs4esp99fFedl3nNOKKwuJG/Xr2XrsvtakPfN+2vSXChfAiDeK3ytifw0y9+QimKyn4m+LkWNHDYjs2bn76ARqzZi+CyttMLOrXvJPFVjv8vwk41kt/eSortgHCc41tYOtPBdyOQ4W9U92U47S5/H/SGEWE9SMYtXXiPE6FQ8oLqtIrPDDWrIVy7/Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SKASUpwkd7lzL0yH2w4ljmDYIqOviqaj3kL1KMQHTzM=;
 b=knJD5K2mVipUJSviKizX4f/LBkRai6AmYKznL0WvsU0+4Zx0ilMPnr7jE/Gx7RencGRul+NxcqeLVcFF9ww8mpKlBo64pZXjSiQAzevhYlrBGDdm0MMJgp5wF9J2A/AyLUJWX3h/Cimw7qu7c8id2pVMmSolct+0FC/kZafS0/w=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PA4PR08MB7547.eurprd08.prod.outlook.com (2603:10a6:102:26d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.35; Mon, 19 Jun
 2023 16:16:39 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::30b4:3110:b02d:7f21]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::30b4:3110:b02d:7f21%6]) with mapi id 15.20.6500.036; Mon, 19 Jun 2023
 16:16:39 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 2/2] insane: Improve patch-status layer
 filtering
Thread-Topic: [OE-core] [PATCH 2/2] insane: Improve patch-status layer
 filtering
Thread-Index: AQHZordB9Z31jePcEkSqWyhkM09+AK+STWCA
Date: Mon, 19 Jun 2023 16:16:39 +0000
Message-ID: <18F0C5D8-E685-442D-9FEB-CE76A8344419@arm.com>
References: <20230619140602.2669368-1-richard.purdie@linuxfoundation.org>
 <20230619140602.2669368-2-richard.purdie@linuxfoundation.org>
In-Reply-To: <20230619140602.2669368-2-richard.purdie@linuxfoundation.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PA4PR08MB7547:EE_|DBAEUR03FT032:EE_|AM8PR08MB6337:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e4cc948-e607-47f1-93d8-08db70e0964f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 PSrHarzSeSJ7lxhftpzDLCEnlWCeWg3gdTzuPmI+qhI6JRE6AjvGNjPY3IZvRYAEylkbRiHp93P1QVE9sjbXeaRBXhZNlPGWYz9nTlRR3/soBWsD/8bevbizNnaagEzJp8b4+l+06s67/nQio8UEZKNSXPJPWCU1UfdrC7emEWBIwY29p19QQfy33CnU5pzwnX3y1jejZijHmQdpHc4q9JCS1SbHNsGacn83SHUff3X4c81ADWzZic0Gyo7zlhGsoRNUQZ08yKXCd3IwnJgL+9LLc2uNS73NNrAD7aGSlDU8cGIujc2JfwIN5zN77JX5OR21b1LEwpkF/MvCF0U7RYxSYoaWeP+KK4rnA03kDsvs/wMv/RJXgC2Rt6unRu9Sf0h2HE3u5Mkd9i/D4L2PXMiIPfGDmR+ZOiM2SfHscxHr6hTAAwJWUj0DsWdXJOExkfRI0Ta2099d3BVa3nzFVsPiqw/cTzXTiAYAY6toXeQVKcvkbuoBGF06AKK0aDXdB3mQh9nCemhNGxoTtVJZqnpZ2BI555T1wSRZdLWr2ofHSNdeLoBDL9l0UwGqCFky/lbSG6omtX06nd/1iluQ37xK8cguZhy2RsKgSLYmexfPjuypECxlLbUazKoFMKEa
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(396003)(366004)(346002)(136003)(451199021)(5660300002)(8936002)(36756003)(6486002)(71200400001)(2906002)(8676002)(41300700001)(66899021)(316002)(64756008)(4326008)(6916009)(66446008)(76116006)(66556008)(66946007)(66476007)(91956017)(33656002)(478600001)(966005)(38070700005)(38100700002)(86362001)(186003)(122000001)(2616005)(83380400001)(53546011)(6512007)(6506007)(26005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <A5A71971A13544479462CA52CBDF77C3@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB7547
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	08815dea-7cc8-4aeb-69d1-08db70e09002
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	nwmb4hK92/jtGrc0Bep5NOq+E7Uopez4Pu1OoDyD+nfGHn26EKdb70SuvIIz0SEWUh6E5jBLFO4v1MJ8uooRGx2JmDZn5TRN5JnEimiribRsVoGq/KPVgl7S+tmOrbkX1sXlzKNjaMZbeJ13H4B1Qaff+06F+BXcdCJkf30Z/ST0275z946J6PJZxDnmXwX13aO6C4cdniOHGYb6q0T4lOL3pRpB+I+XSMfx0Nor+PySZZOf1BI5fbIZ+o6uSJ19yu2F4d06CqDliIyMD588X35c7VqZXLwm4BOtIgf3OYwtlcGFQehl6ypR6XYeWhGxA1Jz+HBHws0lwl3Zdh0N1kbsQUKaOTzhgxx35Cviu9XckeKCzGreE2VHIr8M4MIfJyay7qrkSiDWEzciclWxiziSe04TMkTLULp6spCMcSINdHrwJkm8k1iJ+wCCmdJWTcN/NpjSBJUqUE/GUh+qW5PaviVT28UszNF9fdp3WBQ+exWX97lIEzf5FMhZL5SlHzFXpO6F9yFGkuYa8FLMOsqmEciTZZaVWYSK5a8FuJLDko/Y1XSfGG1BVzLBFP2tMK4SNxBTTvDEJOWiRUWhlmC0ypibSXq8RcmzRjvGB7yYbw6/8OK/BntQHjT6eVpYX9PHichalygUD44/T+hFEqmoy10joD/5gX7QSit7TGmaRb1RAoONfBOrRIvz0ZiJCmRasjG6ZUo2rw1gxbdpLbFsq2n1+N1GoI+fLdY5af0=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(396003)(346002)(136003)(451199021)(36840700001)(40470700004)(46966006)(4326008)(478600001)(6506007)(40460700003)(6512007)(26005)(966005)(6486002)(186003)(40480700001)(36756003)(2906002)(8676002)(41300700001)(8936002)(70206006)(70586007)(316002)(5660300002)(6862004)(66899021)(82310400005)(83380400001)(47076005)(33656002)(86362001)(336012)(81166007)(356005)(2616005)(36860700001)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2023 16:16:49.9839
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e4cc948-e607-47f1-93d8-08db70e0964f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6337
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Jun 2023 16:16:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183120

8J+YgA0KDQo+IE9uIDE5IEp1biAyMDIzLCBhdCAxNTowNiwgUmljaGFyZCBQdXJkaWUgdmlhIGxp
c3RzLm9wZW5lbWJlZGRlZC5vcmcgPHJpY2hhcmQucHVyZGllPWxpbnV4Zm91bmRhdGlvbi5vcmdA
bGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+IA0KPiBOb3cgdGhhdCB3ZSBoYXZlIGxh
eWVyIG92ZXJyaWRlcywgd2UgY2FuIGVhc2lseSBlbmFibGUgcGF0Y2gtc3RhdHVzIGluDQo+IEVS
Uk9SX1FBIHdpdGhvdXQgdGhlIGhhcmRjb2RlZCBjb2RlIG1ha2luZyBpdCBlYXNpZXIgZm9yIG90
aGVyIGxheWVycw0KPiB0byBvcHQgaW50byB0aGUgY2hlY2tzLg0KPiANCj4gU2lnbmVkLW9mZi1i
eTogUmljaGFyZCBQdXJkaWUgPHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+DQo+
IC0tLQ0KPiBtZXRhL2NsYXNzZXMtZ2xvYmFsL2luc2FuZS5iYmNsYXNzIHwgMTYgKysrLS0tLS0t
LS0tLS0tLQ0KPiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxMyBkZWxldGlvbnMo
LSkNCj4gDQo+IGRpZmYgLS1naXQgYS9tZXRhL2NsYXNzZXMtZ2xvYmFsL2luc2FuZS5iYmNsYXNz
IGIvbWV0YS9jbGFzc2VzLWdsb2JhbC9pbnNhbmUuYmJjbGFzcw0KPiBpbmRleCBmMzkxZmE4MDUz
OC4uMTE0NzgxYzc4MDMgMTAwNjQ0DQo+IC0tLSBhL21ldGEvY2xhc3Nlcy1nbG9iYWwvaW5zYW5l
LmJiY2xhc3MNCj4gKysrIGIvbWV0YS9jbGFzc2VzLWdsb2JhbC9pbnNhbmUuYmJjbGFzcw0KPiBA
QCAtNDUsMTAgKzQ1LDExIEBAIEVSUk9SX1FBID89ICJkZXYtc28gZGVidWctZGVwcyBkZXYtZGVw
cyBkZWJ1Zy1maWxlcyBhcmNoIHBrZ2NvbmZpZyBsYSBcDQo+ICAgICAgICAgICAgIGFscmVhZHkt
c3RyaXBwZWQgaW5zdGFsbGVkLXZzLXNoaXBwZWQgbGRmbGFncyBjb21waWxlLWhvc3QtcGF0aCBc
DQo+ICAgICAgICAgICAgIGluc3RhbGwtaG9zdC1wYXRoIHBuLW92ZXJyaWRlcyB1bmtub3duLWNv
bmZpZ3VyZS1vcHRpb24gXA0KPiAgICAgICAgICAgICB1c2VsZXNzLXJwYXRocyBycGF0aHMgc3Rh
dGljZGV2IGVtcHR5LWRpcnMgXA0KPiAtICAgICAgICAgICAgcGF0Y2gtZnV6eiBwYXRjaC1zdGF0
dXMtY29yZVwNCj4gKyAgICAgICAgICAgIHBhdGNoLWZ1enogXA0KPiAgICAgICAgICAgICAiDQo+
ICMgQWRkIHVzcm1lcmdlIFFBIGNoZWNrIGJhc2VkIG9uIGRpc3RybyBmZWF0dXJlDQo+IEVSUk9S
X1FBOmFwcGVuZCA9ICIke0BiYi51dGlscy5jb250YWlucygnRElTVFJPX0ZFQVRVUkVTJywgJ3Vz
cm1lcmdlJywgJyB1c3JtZXJnZScsICcnLCBkKX0iDQo+ICtFUlJPUl9RQTphcHBlbmQ6bGF5ZXIt
Y29yZSA9ICIgcGF0Y2gtc3RhdHVzIg0KPiANCj4gRkFLRVJPT1RfUUEgPSAiaG9zdC11c2VyLWNv
bnRhbWluYXRlZCINCj4gRkFLRVJPT1RfUUFbZG9jXSA9ICJRQSB0ZXN0cyB3aGljaCBuZWVkIHRv
IHJ1biB1bmRlciBmYWtlcm9vdC4gSWYgYW55IFwNCj4gQEAgLTEzNDAsMjQgKzEzNDEsMTMgQEAg
cHl0aG9uIGRvX3FhX3BhdGNoKCkgew0KPiAgICAgaW1wb3J0IHJlDQo+ICAgICBmcm9tIG9lIGlt
cG9ydCBwYXRjaA0KPiANCj4gLSAgICBhbGxwYXRjaGVzID0gRmFsc2UNCj4gLSAgICBpZiBiYi51
dGlscy5maWx0ZXIoJ0VSUk9SX1FBJywgJ3BhdGNoLXN0YXR1cy1ub25jb3JlJywgZCkgb3IgYmIu
dXRpbHMuZmlsdGVyKCdXQVJOX1FBJywgJ3BhdGNoLXN0YXR1cy1ub25jb3JlJywgZCk6DQo+IC0g
ICAgICAgIGFsbHBhdGNoZXMgPSBUcnVlDQo+IC0NCj4gICAgIGNvcmVtZXRhX3BhdGggPSBvcy5w
YXRoLmpvaW4oZC5nZXRWYXIoJ0NPUkVCQVNFJyksICdtZXRhJywgJycpDQo+ICAgICBmb3IgdXJs
IGluIHBhdGNoLnNyY19wYXRjaGVzKGQpOg0KPiAgICAgICAgIChfLCBfLCBmdWxscGF0aCwgXywg
XywgXykgPSBiYi5mZXRjaC5kZWNvZGV1cmwodXJsKQ0KPiANCj4gLSAgICAgICAgIyBza2lwIHBh
dGNoZXMgbm90IGluIG9lLWNvcmUNCj4gLSAgICAgICAgcGF0Y2h0eXBlID0gInBhdGNoLXN0YXR1
cy1jb3JlIg0KPiAtICAgICAgICBpZiBub3Qgb3MucGF0aC5hYnNwYXRoKGZ1bGxwYXRoKS5zdGFy
dHN3aXRoKGNvcmVtZXRhX3BhdGgpOg0KPiAtICAgICAgICAgICAgcGF0Y2h0eXBlID0gInBhdGNo
LXN0YXR1cy1ub25jb3JlIg0KPiAtICAgICAgICAgICAgaWYgbm90IGFsbHBhdGNoZXM6DQo+IC0g
ICAgICAgICAgICAgICAgY29udGludWUNCj4gLQ0KPiAgICAgICAgIG1zZyA9IG9lLnFhLmNoZWNr
X3Vwc3RyZWFtX3N0YXR1cyhmdWxscGF0aCkNCj4gICAgICAgICBpZiBtc2c6DQo+IC0gICAgICAg
ICAgICBvZS5xYS5oYW5kbGVfZXJyb3IocGF0Y2h0eXBlLCBtc2csIGQpDQo+ICsgICAgICAgICAg
ICBvZS5xYS5oYW5kbGVfZXJyb3IoInBhdGNoLXN0YXR1cyIsIG1zZywgZCkNCj4gDQo+ICAgICBv
ZS5xYS5leGl0X2lmX2Vycm9ycyhkKQ0KPiB9DQo+IC0tIA0KPiAyLjM5LjINCj4gDQo+IA0KPiAt
PS09LT0tPS09LT0tPS09LT0tPS09LQ0KPiBMaW5rczogWW91IHJlY2VpdmUgYWxsIG1lc3NhZ2Vz
IHNlbnQgdG8gdGhpcyBncm91cC4NCj4gVmlldy9SZXBseSBPbmxpbmUgKCMxODMxMTUpOiBodHRw
czovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29yZS9tZXNzYWdlLzE4
MzExNQ0KPiBNdXRlIFRoaXMgVG9waWM6IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9t
dC85OTYyMzg1NS82ODc1ODg4DQo+IEdyb3VwIE93bmVyOiBvcGVuZW1iZWRkZWQtY29yZStvd25l
ckBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFVuc3Vic2NyaWJlOiBodHRwczovL2xpc3RzLm9w
ZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29yZS91bnN1YiBbcm9zcy5idXJ0b25AYXJt
LmNvbV0NCj4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4gDQoNCg==

