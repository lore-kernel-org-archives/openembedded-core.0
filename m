Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1633C4332F
	for <webhook@archiver.kernel.org>; Wed, 25 May 2022 11:27:05 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.59])
 by mx.groups.io with SMTP id smtpd.web08.5580.1653478020754646271
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 04:27:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=KoqSW5vZ;
 spf=pass (domain: arm.com, ip: 40.107.21.59, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=cGGSBLDUUhCDQHgXYQioq2PmPByqD8ceH5bU5b2e35/Zts7Po95hQqNsucGZGpkbS6t4/atczcz2ocQNWkpjf9TZfgc7ZvO80J2E6zkQl4aWEEUQVblnlcT3FBP8SYgoYsrf20DBb0sv3C61/bvYSpw9JvOSZCg77Mrz3wAueiuenDZJBlrIASLdE6R0uciAwBiU4ZS082t6pJJw1Vbpa//Eefd9l1t9bEvRlzQUfZlTA3VhbA+O4zqBILpJFlvY0h68NT59XddttyBexJiMRTcOAVqYDUNza3g35poouGf9dkS3ufdkFpP2WrSZrwCPq+V4L+r6u5bu0pKYaYuMeg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AbeMTGuNURVRIZffQ8zgAY3xLRpE9CYX3BHG2eIdpnk=;
 b=dZU0ydRMJX73wXFpY5XqD36wghCqmPdaViSfVcIFfGUlnVUeu83shkNySTho1buwpRM/gx3lPmf6kMgHN7uSYaaAVH+b3EKL2HcmB0fgxxQ4n2kEr7BsyUQMS3F/bZwRQwyYupTQa8YqCxEidfbUUl+X2BPVrhLgXo45/toFwPvjiyE3k+efJLGXlf+7hXxJrj/dFMYoeXOz/YRgemQk/M4Jxewr/0EEtdLylnyHjpqQ+PfPWqXCC0SLWAPhKi255+E/Y/NHGCuHQadAp0xS0Dua6SIl+iDGER4A2X8VGA6Uj9LPXlnHf7A9HDKdwk/csiN9SaxoP9+9IF8NjLb6Ug==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AbeMTGuNURVRIZffQ8zgAY3xLRpE9CYX3BHG2eIdpnk=;
 b=KoqSW5vZdoRw3YMSEnvk5wMBKHDCPc2ddaX98rMk8uebofDS2yxqE1rPzPsp3izrD3tYPnxB9jXUs6uda/HAcF3CxD1S3WQfBeegNswdMto47awXlrgYbQeFRKGQfdr5WASfADsRaYUCNIkkAK3MX+l6PblF3ZdNG3BqinheEi8=
Received: from DB6P192CA0011.EURP192.PROD.OUTLOOK.COM (2603:10a6:4:b8::21) by
 GV1PR08MB8108.eurprd08.prod.outlook.com (2603:10a6:150:93::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5293.13; Wed, 25 May 2022 11:26:56 +0000
Received: from DBAEUR03FT024.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:b8:cafe::5a) by DB6P192CA0011.outlook.office365.com
 (2603:10a6:4:b8::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14 via Frontend
 Transport; Wed, 25 May 2022 11:26:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT024.mail.protection.outlook.com (100.127.142.163) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5293.13 via Frontend Transport; Wed, 25 May 2022 11:26:54 +0000
Received: ("Tessian outbound 9a0893f586e2:v119");
 Wed, 25 May 2022 11:26:54 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e32a8e9b7bda33b7
X-CR-MTA-TID: 64aa7808
Received: from a2aa81caa56a.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 211FFF4E-81F4-4AB3-B5F0-9F94DA353306.1;
	Wed, 25 May 2022 11:26:47 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 a2aa81caa56a.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 25 May 2022 11:26:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WenVOHwqMZU/kYI9IK+k8F9caBKoGQBDJmwCfvO5tPdHrUc4r25kwXIuzPbB5FbkTkPZDNe+gSss1vOiWyzlN5Bc8pLj7zYcaw1qiIodpi9yNYUG5CyTE9oTrSUXKZ9plxXyGzA7895bHEktlVvPLdAvI5X9Hc5n6pFye+i6IHe9JFi1La9orkMV/lmAHpoVguUcXTDV60GvUdOx28AuGNKc4IspVkMdGSvsoft/3Oj+zWrSvRlkliBwWbBaAxqI1hvVaan8btjnjT8Tlo0FDqykYZ5iiJW+d6LvhHy6clM/JUog2g+LPAvGwrmGNUcZlCNNsbeU+wC2bU7CcQfhIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AbeMTGuNURVRIZffQ8zgAY3xLRpE9CYX3BHG2eIdpnk=;
 b=KjAJiKqOJiUpJdeWfeetF7nTx8TwWaqskBAy1VaMqtb+96IEALIeK5er30Fp9rNG+WaXb+qcMDdTADlilq/kcwFJsOQXBVNtkYciACOiDKpmUa1B9p9lF3zWFWaP6yw/SkTzdqTH51dQfheB+DwIEgdfjLkDO/01BCuXG1vhBvKLsReIaYf1Hay6GfsZU+aCVJatACnPLGc5J0sVVZ5mf/t6C6PMwTvjfl+B3FAcenwE8VT3KgvCWvO3acAXL7JJWwERVRD2zd0+KBf1Stu8UoVgml5JNrgO0BZShvUMLjVcestUNkrq8+xjpP1yaq1RHTTJmz7SMmW7ykVaYxaN6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AbeMTGuNURVRIZffQ8zgAY3xLRpE9CYX3BHG2eIdpnk=;
 b=KoqSW5vZdoRw3YMSEnvk5wMBKHDCPc2ddaX98rMk8uebofDS2yxqE1rPzPsp3izrD3tYPnxB9jXUs6uda/HAcF3CxD1S3WQfBeegNswdMto47awXlrgYbQeFRKGQfdr5WASfADsRaYUCNIkkAK3MX+l6PblF3ZdNG3BqinheEi8=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB7PR08MB3465.eurprd08.prod.outlook.com (2603:10a6:10:50::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.19; Wed, 25 May
 2022 11:26:46 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::6c2b:5021:db9a:bf6d]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::6c2b:5021:db9a:bf6d%9]) with mapi id 15.20.5293.013; Wed, 25 May 2022
 11:26:46 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, nd <nd@arm.com>,
	"bruce.ashfield@gmail.com" <bruce.ashfield@gmail.com>
Subject: Re: [OE-core] [PATCH 9/9] lzo: remove recipe from oe-core
Thread-Topic: [OE-core] [PATCH 9/9] lzo: remove recipe from oe-core
Thread-Index: AQHYb4KLpILPDwKE6EK2QCs21NHGFK0vPMgAgAA41IA=
Date: Wed, 25 May 2022 11:26:46 +0000
Message-ID: <9BB79F38-1612-4383-BAE2-DD4FD065476B@arm.com>
References: <20220524152401.1663317-1-ross.burton@arm.com>
 <20220524152401.1663317-9-ross.burton@arm.com>
 <20220525100322.1a50d726@melee>
In-Reply-To: <20220525100322.1a50d726@melee>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 81e9312a-aeb2-44db-4464-08da3e4178a1
x-ms-traffictypediagnostic: 
	DB7PR08MB3465:EE_|DBAEUR03FT024:EE_|GV1PR08MB8108:EE_
X-Microsoft-Antispam-PRVS: 
	<GV1PR08MB8108BC77E7FD9D73AC2AB791E8D69@GV1PR08MB8108.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 HV00k6rRgRL+yzIHqJFl8h2aHVHEVGWdOAhrZzpUqebdqGOmoFGXWwIJJEDlus123Jhnzt7Yn+xbwLrtWEyltcXVAP1YmzzRQMEPvB44C5tkPZbkcP62VJ7+fjAz+uKRrctWmwJXwTirHCCESPLUmJ9NA5wxGGUR1g/VGhrsKHaEgjLJHmxPvCao81ty+ar/pVFo+9wqJ0FkQib5juXKp3Z3xg4ZzqTHBxnb8q5+00jSnJP9JWxPDy+l5G/l4JVliWeIGSXPhCotSVSe995VHqO2nVb6/1RLUUvEEogUjaS/4vjJA7V96k1EhRxu6vtNXJ+ugLBPscFN659AiZVLBFexDXwvy/LJ0FWakjgy+UFKy8qDFXiuSgjtONanXv6C2HNCed8qSsSWe8ry/52f2XlyNyX3eRgjuytVSKaksN+a+vBGBXO2dmIaWMOKz9i5LOALh6TGp1Ki4qQv0A54ABvU34dVvaF+7iuvIjNTQadsItda7Vhb2/C1i30m2ny8mFVfctpISRDFAdDBPksdeIdtDC0mCsTxv0MncXRt/Diabb6e2GiTU6ct67VUngQAnu+C2goa8GHIx4XWJt7nTC9+Pbgo/30+VG+e04RgSbdhTsfdVTySt7/YAo4wRSihMVmnuZmgkjsJ/2Ee1U0UsVAjV3Aiy7JMZQP/RjR1ibcC8K0R0Lg5yazHc58Gc6P0TGC2qAHG8UfWNWt8aexWHuU3JT1EYS94U8XLSKn8GYUrTGD8Hvg5o7tgZWK88wf1
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(508600001)(6512007)(6486002)(71200400001)(83380400001)(6916009)(186003)(2616005)(316002)(8936002)(53546011)(36756003)(26005)(6506007)(54906003)(33656002)(122000001)(38100700002)(4326008)(8676002)(5660300002)(66556008)(66446008)(38070700005)(66476007)(86362001)(64756008)(4744005)(91956017)(76116006)(66946007)(2906002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <C29F950CBBA18E47A3053545AF32E77B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3465
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	0d5898e2-8f13-43b1-4df9-08da3e4173b0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	CmNNCMu936ZBf9ZFDuvYTTBngHrvn1+BFNdBliBmRCmr8F7tAwpxskEfJi97r229ORF5oqioTYDJfeRr6l2LW200FssDdIyqJ2YYaVPZA/xzyBSClu4j0zBHyToHjEdKkmFQ8Ncvsux108mLv7yHBPmT4PGZIlnkNdkMSni7bjWJ7K9TJx3gqrndWYVTBoAZv57UeOKREBJwr0CcMKME895D2+zqB+ml/pJBNZb4IfOvAqxR1LmDn+0teKZxzoQz6o1OAUYjfhNoXX172lJLB0rumkE8t9zJsUgUpK/gDl6U2lXYEdvDoXKadPITY9AjQs5kzy9R04n8OdBNBFZkwMEWFupCCPWMY6rH7ZPY46sNiiNZ2aRbXAkFUtLTCD8bo0kX57YTvSJ/z07Q1cB6OjnvGArJGWLklmcuWKcg3xFk38bZUT6+l8kUJNTyK+ntkM6jq1Z1QIidHUXbJdBzhQJ3CNIQBzbt+wZIJliSrXDJ8JHg2Ja0QM4VwNyDhF0ZToQ/BGeYeD53mygZM9h1WyQtfzDF4OC1WQrnHh2hInAYI4a6gHRoODxOkYeKoYfeMpB48eouqqfzyIla3uirvb3Pc+xjaNhIzkatiIaaQDd5mFjT/Di010rPBWr9OHtEIVjFUKqN5kxP90rReO7jMKMk0okIwZBYRILa3kq60V94llofZu99FrxetThaY8BF
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(82310400005)(86362001)(40460700003)(26005)(36860700001)(6512007)(36756003)(186003)(107886003)(6486002)(8936002)(2616005)(316002)(53546011)(6506007)(2906002)(508600001)(54906003)(47076005)(356005)(336012)(4744005)(4326008)(8676002)(81166007)(6862004)(5660300002)(33656002)(70206006)(70586007)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2022 11:26:54.3821
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 81e9312a-aeb2-44db-4464-08da3e4178a1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8108
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 May 2022 11:27:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166117

T24gMjUgTWF5IDIwMjIsIGF0IDA5OjAzLCBMdWNhIENlcmVzb2xpIDxsdWNhLmNlcmVzb2xpQGJv
b3RsaW4uY29tPiB3cm90ZToNCj4gDQo+IEhpIFJvc3MsIEJydWNlLA0KPiANCj4gSWwgZ2lvcm5v
IFR1ZSwgMjQgTWF5IDIwMjIgMTY6MjQ6MDEgKzAxMDANCj4gIlJvc3MgQnVydG9uIiA8cm9zcy5i
dXJ0b25AYXJtLmNvbT4gaGEgc2NyaXR0bzoNCj4gDQo+PiBMWk8gaXMgYSBmYWlybHkgYXJjaGFp
YyBjb21wcmVzc2lvbiBmb3JtYXQgdGhhdCBoYXNuJ3QgYmVlbiB1cGRhdGVkDQo+PiBzaW5jZSAy
MDE3LiAgSXQncyBub3cgdW51c2VkIGJ5IGFueXRoaW5nIGVsc2UgaW4gb2UtY29yZSwgc28gcmVt
b3ZlDQo+PiB0aGUgcmVjaXBlcy4NCj4+IA0KPj4gU2lnbmVkLW9mZi1ieTogUm9zcyBCdXJ0b24g
PHJvc3MuYnVydG9uQGFybS5jb20+DQo+IA0KPiBJIGxvdmUgcmVtb3ZhbHMgb2YgYXJjaGFpYyBm
ZWF0dXJlcy4uLg0KPiANCj4gLi4uYW5kIGhvdyB0aGV5IG1ha2UgdGhpbmdzIGV4cGxvZGUgOi0p
DQo+IA0KPiBzdGRpbzogRVJST1I6IE5vdGhpbmcgUFJPVklERVMgJ2x6bycgKGJ1dA0KPiAvaG9t
ZS9wb2t5YnVpbGQveW9jdG8td29ya2VyL21ldGEtdmlydC9idWlsZC9tZXRhLXZpcnR1YWxpemF0
aW9uL3JlY2lwZXMtZXh0ZW5kZWQveGVuL3hlbl80LjE2LmJiLA0KPiAvaG9tZS9wb2t5YnVpbGQv
eW9jdG8td29ya2VyL21ldGEtdmlydC9idWlsZC9tZXRhLXZpcnR1YWxpemF0aW9uL3JlY2lwZXMt
ZXh0ZW5kZWQveGVuL3hlbi10b29sc180LjE2LmJiDQo+IERFUEVORFMgb24gb3Igb3RoZXJ3aXNl
IHJlcXVpcmVzIGl0KQ0KDQpJ4oCZdmUgYWxzbyBqdXN0IHNlbnQgYSBSRkMgcGF0Y2ggZm9yIHhl
biB0byBkaXNhYmxlIExaTyBlbnRpcmVseSwgYnV0IEnigJlsbCBsZWF2ZSB0aGF0IHVwIHRvIEJy
dWNlIHRvIGRlY2lkZS4gIElmIGx6byBpcyByZW1vdmVkIGZyb20gY29yZSBpdCB3aWxsIGJlIGFk
ZGVkIHRvIG1ldGEtb2UsIHNvIHhlbiB3aWxsIGNvbnRpbnVlIHRvIGJ1aWxkIGVpdGhlciB3YXku
DQoNClJvc3M=

