Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36FBCC6FD1C
	for <webhook@archiver.kernel.org>; Thu, 23 Mar 2023 12:46:50 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.85])
 by mx.groups.io with SMTP id smtpd.web10.71501.1679575605763662970
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Mar 2023 05:46:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=13HOFfJo;
 spf=pass (domain: arm.com, ip: 40.107.8.85, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d6MwrfUXdgUj4ehA4KZ70mF+4iICSCctIXxkbnrzRb0=;
 b=13HOFfJoaw2eC+Y0ruvUarEWn0Qd2co9Ukc/UXmc7s09rlwidMMNDMomS4SJ+JELf87NPdPvDjs0RlcKobGAdWWRW0WnTZkWJLrLBh5JrAw+ha9Qpd4J44SG5z7Rhqv5E5EQK21f5V1OIanyx80C2v12GivED6HrynBsYoE+4fA=
Received: from DUZPR01CA0067.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c2::6) by PAVPR08MB9233.eurprd08.prod.outlook.com
 (2603:10a6:102:30a::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Thu, 23 Mar
 2023 12:46:41 +0000
Received: from DBAEUR03FT042.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:3c2:cafe::aa) by DUZPR01CA0067.outlook.office365.com
 (2603:10a6:10:3c2::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38 via Frontend
 Transport; Thu, 23 Mar 2023 12:46:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT042.mail.protection.outlook.com (100.127.142.143) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6222.17 via Frontend Transport; Thu, 23 Mar 2023 12:46:41 +0000
Received: ("Tessian outbound f2a8d6d66d12:v135"); Thu, 23 Mar 2023 12:46:41 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 30228d77f7235d20
X-CR-MTA-TID: 64aa7808
Received: from a2cdd9a80eb0.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 3DA584D9-24B3-4664-B83F-2069DFD5C73E.1;
	Thu, 23 Mar 2023 12:46:33 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a2cdd9a80eb0.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 23 Mar 2023 12:46:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KKlHs2wsVz84UuvBdS73SY6jGGXq/wgMwTeuAEmToszQJys0Vp3WjBy7AsV0SAGYeLlWXm5UTq2Ey/v29LZg1GhfRgM2q94bn7pmHcOrXnCwitnt4vHHxAg+gAdQqwrr0nB7hwskR6tl80F1DQMAvuEEP0VceZ4+6xfwprP+KLLCsK7JU9abOeQcpdKwr5rC5hbWgXRt/uyIRi6dsUBT8fZerHmsCEiks7L+a9h/BfdDo4eLQfyiZwBFh5YZ2XT+aAvbSeTp4i5d+XneVpVZYsr8OUWI1fQjKRSjGTkPRie0Qqg/SWRrk4+kVjCJogGl3s6VaDmRuSjwodcZrY3cew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d6MwrfUXdgUj4ehA4KZ70mF+4iICSCctIXxkbnrzRb0=;
 b=PuoFR8E6aNUmi/AhJVWxN+RHaChIOXiKHSVwXVwbScfKxvFgGRpa9cUJPNGIQD4md3fzrXaskykBiNJKmsjb2DUJ6sjO5M9wlbZiuFO2zHizgWTPw5WKchUCYoea64l+qjBLGW6GmhkbhsdGtxrALGVCXJAfvph4Po6AF1NnbYNXwbb0O88UlbJj/DIJ82a5u3OEcxSN7E+b2Cwzhb5Ay+BXhYNTYjnIH3hYSiJunx1x8Sd42Mf81KR6GX37nB/UDgrwYJ5+/r2Mc8YRKk68P8jWeoEQH1Pu6G+y5vgzURbH0GvZsmkxFkJBcxyDRaEtrgidRnYGAxXwzMPbUlrSNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d6MwrfUXdgUj4ehA4KZ70mF+4iICSCctIXxkbnrzRb0=;
 b=13HOFfJoaw2eC+Y0ruvUarEWn0Qd2co9Ukc/UXmc7s09rlwidMMNDMomS4SJ+JELf87NPdPvDjs0RlcKobGAdWWRW0WnTZkWJLrLBh5JrAw+ha9Qpd4J44SG5z7Rhqv5E5EQK21f5V1OIanyx80C2v12GivED6HrynBsYoE+4fA=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS2PR08MB8807.eurprd08.prod.outlook.com (2603:10a6:20b:5f3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Thu, 23 Mar
 2023 12:46:31 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::e305:742e:e10b:1093]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::e305:742e:e10b:1093%2]) with mapi id 15.20.6178.024; Thu, 23 Mar 2023
 12:46:30 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Khem Raj <raj.khem@gmail.com>
CC: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] scripts: add buildstats-summary
Thread-Topic: [OE-core] [PATCH] scripts: add buildstats-summary
Thread-Index: AQHZXBwowbCMMUxmbkiEEdciQDARsq8FhHaAgALOPgA=
Date: Thu, 23 Mar 2023 12:46:29 +0000
Message-ID: <19CCC1F0-794D-4EB6-B0F2-3E18262FDD2A@arm.com>
References: <20230321173943.1257786-1-ross.burton@arm.com>
 <CAMKF1srMabJdohEH9=GUAQ34iDe4-f+UDN88bXLaqPayb+-vLA@mail.gmail.com>
In-Reply-To: 
 <CAMKF1srMabJdohEH9=GUAQ34iDe4-f+UDN88bXLaqPayb+-vLA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS2PR08MB8807:EE_|DBAEUR03FT042:EE_|PAVPR08MB9233:EE_
X-MS-Office365-Filtering-Correlation-Id: ee4cd39c-1634-4c4f-0881-08db2b9ca682
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 MheX3+ksYVFXNIMJ/YC8k3/DSBgdJRAO+dGpJtco9hpQl9czx3Dc29qT4G5ERbn5wjCw1jPbnUtRAa3gTVNOrJqn48g/LxTOUCsYO/CGBRepmFZ4La/pzvLsJtIhonnaQeaJdL2WOkpzTQbs+g9BLPH+W7ds+xSb2LLzMEg3JLFP0qPQ3ppw0FCpM+W+iA5KswPGgQ1sBCTNmqosiZTFzD8bUP+sHMwK8y6DjtiXZDtCMEClyEXEJU2C0qHENklV3iQVb1Aqp90LkYPGxHThI768HvEHGMgG7ZO3+IWAKstbb+sVse6yIPGai+QFpTT1g3thl+EcVSm2pM9Sr8bJB+SYcBbIBrQKb+sxxxLS5apRqDeutXObJ9h4g0d5Jgs0k9NRjK0bcpibkHPEDkf6XK9wVLzUaIyfs3iqA1Es0oEbpu5l3ro2218NpxKesPW+z4xuXS7ijwEvJ/VAn0PUngu1j/LplZmcw7Kvw4LlhlXbLwtttnV9VyaHyXeut5a/Ijd82WEeSirttMnt0BMUTl7X9Taamf0Zt4g/ota7huC+6T2mIkThj8jMgYsYYaWYzdyEPRr01yRmfBRWhIykzJk8QpB9r9bB1YfDRD2S9+irpyr4Dc10E64L0j2bFrT3To9hbjBIMhTCon6FN27grAHDalYoj2LWTYQD9HdzLjeGMEyj/ffwmAzBu8gM2WYOIK0FUxzFwGB77kOvWOZ6I4fmaF0uikR7iygNQPqNmRg=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(136003)(346002)(376002)(366004)(39860400002)(451199018)(41300700001)(66556008)(66446008)(5660300002)(64756008)(6916009)(4326008)(66476007)(2906002)(38070700005)(33656002)(86362001)(36756003)(8676002)(38100700002)(122000001)(71200400001)(6486002)(26005)(91956017)(478600001)(76116006)(316002)(8936002)(66946007)(6512007)(6506007)(2616005)(186003)(53546011)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <D86F9D80B28B2342AD832B4A362553DB@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8807
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	4c4bec66-675b-4c3b-34ac-08db2b9c9fd2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	iW6uEwmV1GzaLoaGJczXLQzJWw7R8P59q8EpVwSwg8X1Gip6YMN9Hvu6Mi9Bl7Up5ncCiUp884PuvEpSbLIf6g9MgIjoqDXF3AAFaLbi9YsQT8g5rpr1m/se9IekLqp+wfgMJTOv2T/UNV088axzez2n9X1PqYSGD8FYkzkSn3uW1/09ubzpc9girqfyeuro3auOdV0kf3TfSMqcYh/JiRP34m5vlvLLzK5xh7tGTDt73poO6NWvx0CJA77XHWAfRKlzR2Z/bYHX4uKfiKHBJdovhKpvQJVkm0NSAgjnllHdhS2YVdW/i3p/4sqQTtJri6DR9u4ggB/8omq9NoCopKPJTobtm0bLzXsTJLea0GApRD+jsnASr6/8iLqALwU5vnFBVmlY/si4F3oE27ScMDsuwzCWh4xjNaPMJBb8dbmDP8X70z3UaSxE0WW3abt47v6sz+RdoKTCjTBXiZ3qvXJeV4HIOcvBsD+uW5tAc+UaDY4PE1AoGxJFtZvFlU/8SHBtmfvQ2RBS+O4hYwiGoW9Qjf+GYracS9yInwU/p9pb1Cfo2iQjmRZuywahj4B8F6An13elegUky94WXWogp2tT/tpNl/8YjTPE0B7CnKO87KCxGEueq1+vOKwUQB0mIZ+w7Sn3EZpPvoMmh2lJmKl32K8ZMafaN4xAb8I0mPaiL8UuPCMCxr2qmLRbVPUXObc2aIwWCcbAoBx6AO0elg==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(376002)(39860400002)(136003)(396003)(346002)(451199018)(40470700004)(46966006)(36840700001)(82310400005)(47076005)(6486002)(2616005)(86362001)(26005)(53546011)(6512007)(6506007)(356005)(336012)(186003)(41300700001)(478600001)(316002)(33656002)(8676002)(4326008)(40460700003)(70586007)(70206006)(40480700001)(36860700001)(81166007)(5660300002)(36756003)(2906002)(8936002)(82740400003)(6862004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2023 12:46:41.1333
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ee4cd39c-1634-4c4f-0881-08db2b9ca682
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9233
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Mar 2023 12:46:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178984

T24gMjEgTWFyIDIwMjMsIGF0IDE3OjU1LCBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPiB3
cm90ZToNCj4gDQo+IFRoaXMgbG9va3MgdXNlZnVsLCBJIHRyaWVkIGl0IG91dCBhbmQgaXQgd29y
a2VkIGluIG9uZSBjYXNlIGJ1dCBmYWlsZWQgaW4NCj4gZmV3IG90aGVycyB3aXRoDQo+IA0KPiAl
IGJ1aWxkc3RhdHMtc3VtbWFyeSBidWlsZC90bXAvYnVpbGRzdGF0cy8yMDIzMDMxOTAyMTQwNg0K
PiBUcmFjZWJhY2sgKG1vc3QgcmVjZW50IGNhbGwgbGFzdCk6DQo+ICBGaWxlICIvbW50L2IveW9l
L21hc3Rlci9zb3VyY2VzL3Bva3kvc2NyaXB0cy9idWlsZHN0YXRzLXN1bW1hcnkiLA0KPiBsaW5l
IDEyNiwgaW4gPG1vZHVsZT4NCj4gICAgc3lzLmV4aXQobWFpbigpKQ0KPiAgRmlsZSAiL21udC9i
L3lvZS9tYXN0ZXIvc291cmNlcy9wb2t5L3NjcmlwdHMvYnVpbGRzdGF0cy1zdW1tYXJ5IiwNCj4g
bGluZSAxMTksIGluIG1haW4NCj4gICAgYnMgPSByZWFkX2J1aWxkc3RhdHMoYXJncy5idWlsZHN0
YXRzKQ0KPiAgRmlsZSAiL21udC9iL3lvZS9tYXN0ZXIvc291cmNlcy9wb2t5L3NjcmlwdHMvYnVp
bGRzdGF0cy1zdW1tYXJ5IiwNCj4gbGluZSA1NCwgaW4gcmVhZF9idWlsZHN0YXRzDQo+ICAgIHJl
dHVybiBidWlsZHN0YXRzLkJ1aWxkU3RhdHMuZnJvbV9kaXIocGF0aCkNCj4gIEZpbGUgIi9tbnQv
Yi95b2UvbWFzdGVyL3NvdXJjZXMvcG9reS9zY3JpcHRzL2xpYi9idWlsZHN0YXRzLnB5IiwNCj4g
bGluZSAyNTYsIGluIGZyb21fZGlyDQo+ICAgIGJ1aWxkX3N0YXJ0ZWQsIGJ1aWxkX2VsYXBzZWQg
PSBidWlsZHN0YXRzLnBhcnNlX3RvcF9idWlsZF9zdGF0cyh0b3Bfc3RhdHMpDQo+ICBGaWxlICIv
bW50L2IveW9lL21hc3Rlci9zb3VyY2VzL3Bva3kvc2NyaXB0cy9saWIvYnVpbGRzdGF0cy5weSIs
DQo+IGxpbmUgMjQ1LCBpbiBwYXJzZV90b3BfYnVpbGRfc3RhdHMNCj4gICAgcmV0dXJuIHN0YXJ0
LCBlbGFwc2VkDQo+IFVuYm91bmRMb2NhbEVycm9yOiBsb2NhbCB2YXJpYWJsZSAnZWxhcHNlZCcg
cmVmZXJlbmNlZCBiZWZvcmUgYXNzaWdubWVudA0KDQpMb29rcyBsaWtlIHRoYXQgYnVpbGQgd2Fz
IGVpdGhlciBpbiBwcm9ncmVzcyBvciBiaXRiYWtlIHdhcyBraWxsZWQgYW5kIGl0IGRpZG7igJl0
IGZpbmlzaCB3cml0aW5nIHRoZSBmaWxlcy4NCg0KSeKAmWxsIG1ha2UgaXQgZGVmYXVsdCB0aGUg
ZWxhcHNlZCB0aW1lIHRvIDAgdG8gaGFuZGxlIHRoaXMgY2FzZS4NCg0KUm9zcw==

