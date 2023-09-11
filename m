Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3920EEE57DF
	for <webhook@archiver.kernel.org>; Mon, 11 Sep 2023 08:07:38 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.75])
 by mx.groups.io with SMTP id smtpd.web11.53814.1694419648689778480
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Sep 2023 01:07:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=YmWUyXKh;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=YmWUyXKh;
 spf=pass (domain: arm.com, ip: 40.107.6.75, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lIi1uG8E0k9AqBYU/treRJBCDrnRmTCv4tDufzC4N50=;
 b=YmWUyXKhfxj/v9wSb5sTrldiP/6KF1nGuJpouswCE/Ll2jo3KlcQcnSt/gnexVhgOw6GA2J0CdXRJE6lDqK/TML/PWpcoV1d6S5Lw8tgwltkGZuP+WGJDCyOKPqEOinQd85jqo2SDI8zsvXoD1hPiGXX/oUYmtQdNxCtChlOL44=
Received: from AS8PR05CA0024.eurprd05.prod.outlook.com (2603:10a6:20b:311::29)
 by VE1PR08MB5840.eurprd08.prod.outlook.com (2603:10a6:800:1b2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.34; Mon, 11 Sep
 2023 08:07:23 +0000
Received: from AM7EUR03FT054.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:311:cafe::ce) by AS8PR05CA0024.outlook.office365.com
 (2603:10a6:20b:311::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.31 via Frontend
 Transport; Mon, 11 Sep 2023 08:07:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT054.mail.protection.outlook.com (100.127.140.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6792.16 via Frontend Transport; Mon, 11 Sep 2023 08:07:22 +0000
Received: ("Tessian outbound 0b7d6027328f:v175"); Mon, 11 Sep 2023 08:07:22 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 28c56f0f36518700
X-CR-MTA-TID: 64aa7808
Received: from 761c713983de.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 54CFB949-9A9B-4ACC-AE7C-C8C8934C6137.1;
	Mon, 11 Sep 2023 08:07:15 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 761c713983de.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 11 Sep 2023 08:07:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DcfJBQLWbfc/UIotuTX7HwyuAabCmBfnk1NmBbUaGS8XSoMXAI7whDOntw/8HQdWRev/JHO9xQbglAmr35SZvo+kFFV6o/Iir5ZdHfsdPKiutRCsQvHyZXv6xD2XRMEt8FDQL/GvbHUAYTaxgJMVlt+/zjf0gwyfD2TTqEmhJ4MW4LHN/LX/XxTsAJoQw09Lwm3ypWptFTCDmrkFsgbTtYW8PlGAE5M/JcjffazQpzGdi6lxrJtBJGIO4CfQVmC9E6YrdXHtYOINvBkBK17l18uBZj+UWYk9b2DnUZHxck1o3fq996NpQtBfatLdm+cmK7+DXCK9hLKjYyKHf+LCMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lIi1uG8E0k9AqBYU/treRJBCDrnRmTCv4tDufzC4N50=;
 b=bFkUR189OevUJIFW01veCkPvuB0rJfU/nZLKgTNps9k9dP7tWkkuHmPebFVIQE3t+y741Gyv1V62YW6Mktw0fMg+g+dL5/GsVjR/Y+qZvya2euyEPshH/HRVUapiA1fLGjbzxYowGWJHxuCg74aKr47iljUOZfwgrAtusyyPVy3ukazmIc23m83IQyKSsB3Xrobh4ZW0IWDa/oi053zidnYedO8sb5M7kIxvNLEMVjjTj47o7dAtygov0avkh9njAevAOOPT4t1h7CjIpXLtX8izc7cpNurdyn+Hr9A/9yoy2rPY72d7T2BC63kiztwjC2s1TSckBaD5fJG6FynDbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lIi1uG8E0k9AqBYU/treRJBCDrnRmTCv4tDufzC4N50=;
 b=YmWUyXKhfxj/v9wSb5sTrldiP/6KF1nGuJpouswCE/Ll2jo3KlcQcnSt/gnexVhgOw6GA2J0CdXRJE6lDqK/TML/PWpcoV1d6S5Lw8tgwltkGZuP+WGJDCyOKPqEOinQd85jqo2SDI8zsvXoD1hPiGXX/oUYmtQdNxCtChlOL44=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM0PR08MB5378.eurprd08.prod.outlook.com (2603:10a6:208:18a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35; Mon, 11 Sep
 2023 08:07:13 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::4b8a:7518:c642:5727]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::4b8a:7518:c642:5727%7]) with mapi id 15.20.6768.029; Mon, 11 Sep 2023
 08:07:13 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "rybczynska@gmail.com" <rybczynska@gmail.com>
CC: Khem Raj <raj.khem@gmail.com>, Steve Sakoman <steve@sakoman.com>, OE-core
	<openembedded-core@lists.openembedded.org>,
	"yocto-security@lists.yoctoproject.org"
	<yocto-security@lists.yoctoproject.org>
Subject: Re: [yocto-security] [OE-core] OE-core CVE metrics for master on Sun
 10 Sep 2023 01:00:01 AM HST
Thread-Topic: [yocto-security] [OE-core] OE-core CVE metrics for master on Sun
 10 Sep 2023 01:00:01 AM HST
Thread-Index: AQHZ4/mPdz7dQGSGZkWofOdnOsfmILAUNi4AgAEPw4A=
Date: Mon, 11 Sep 2023 08:07:13 +0000
Message-ID: <A584C8E9-98EB-4C21-8724-FED2405A9C23@arm.com>
References: <20230910111820.F2D05106AA0@builder.sakoman.com>
 <CAMKF1sp14CrQ=0CntN6wJ6Va+rCBtVY8Je0AQAx8cxQwS1Yg7w@mail.gmail.com>
 <CAApg2=TLfbpr_kdms0ONi5Ji8BGm+2hS4xXx=C-5eUbqJxryCw@mail.gmail.com>
In-Reply-To: 
 <CAApg2=TLfbpr_kdms0ONi5Ji8BGm+2hS4xXx=C-5eUbqJxryCw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AM0PR08MB5378:EE_|AM7EUR03FT054:EE_|VE1PR08MB5840:EE_
X-MS-Office365-Filtering-Correlation-Id: e25465a8-2ae4-4e25-05f8-08dbb29e20c4
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 GjyxkwygxZrbGRW31s9vMyKjQD4fy751m+y24Yp0u4cSjOzU8i7jNUdbCEXsdTOA5X2eOcECzEgi5KvaCQSdarcoxNtfK/GR67PGiUEFc77zeoWebsgL/yQO9BeAyU6yVSKVAclVw3FDAMIIX6gMZDbYt668LqssI8O8FQkYhnlCNe+YPd4M6Jh1o70ly44O1peWtm6PSHJ5I1lukCMP2GwtK3dMdcY+syEEnkl777v09HeC+WL6pdiAd3b4vTwwCNxueOrI5rzSI7JLpkbLsuTFCy768f6Wl4VUs9nEj367txUMAYEi3ctqhbkLDqfsxzQktCVRGoDils2RgqHSIGKEWHBB5BrXbc9BdI/WN0CiraTtOupvTVG+7+Zob6us0BEBdItoiHd3Qug9Gf7t0i2WI+tDbAC0kJUZF32G8y8TsqJJU/pOwxs1Jxor1QjufIU/OuApyyXZ9LdboP8hotdubdrLzw93eXN4tBz0AVsRqq8Q/egkP8FkHpFjDGAym+mXT7JVm5XmxViurJDYg9FX/unmth1yQ/o9xNoxY7C4XSguAT3iPyoX3sFi2ji0GKRN55TX52Axx2FjX+uIqIuxaQYZ8U53TDc3VM5/20fUTwt3+OjnATly1YVRVcmn4p9ZDnHe7spMUWJMsQOWsQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(366004)(376002)(346002)(136003)(1800799009)(186009)(451199024)(41300700001)(6486002)(6506007)(53546011)(71200400001)(6512007)(966005)(478600001)(83380400001)(26005)(2616005)(2906002)(4744005)(15650500001)(66446008)(54906003)(64756008)(66476007)(66556008)(66946007)(6916009)(316002)(76116006)(91956017)(5660300002)(4326008)(8936002)(8676002)(36756003)(86362001)(33656002)(38070700005)(38100700002)(122000001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <B9DA874256CDE941AC11ED27D5A136F6@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5378
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	8d97b839-47eb-4021-228f-08dbb29e1b60
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4QFUS/vCQeTU8zwhxtMd5f4ujbEEP+9MZxrYHuemjOYUp3yWcp4PJtFvppQgS7RECBrdSCozo57cyiy3I6jfGmiuZKZe4MSpPFxlYxL2iQsu61Yf6ZS3helx6amPS0J5WNaM957EMshESXIh701ArKcgA5IJpf6r6T63OZoRoyNw8Lf5C1ExpvMWfJPjKmT9ijLEVuSYhQny/6uWTMw9nvRwwJrnzN+tMq9CWAPOqZGQlg2oa3dbZBbeXNOazLgNTTrnsh/rwMXsMZhRFi6lkMNnXU0F/xF/25MPzE1iDC3jQvZX74pgFY+9armkKRaiJnvnDlTUkf+ij1d8v8X6N30G4UxkDRSqdmxsJIZGTeRO9wIdqksCJ+pbWrVHd+TP76NRMzBYxhhua9GgjBAC5Y6ZZX6/q/RyGkSRvGX0Al1onfBMQjuARbS5HFqJdtaSLFaRO7h3ItNxxDFcIbyrfeO1h8V9NGZ94fqVmYJQxAR8q+bnRX8uMt1xnKIs3R/NmePNNv+F98DCwETpmckpzwIK8A2E19n/AnDQi5Oxhumt3GfkYE2QPRUu6Rh/WKMRPwTM3CYiECgjOdl1uzXcNLdzB77+m6GAFSdpLji6mlJq9zF4Id6lhnU67DoW27EeqBubVRR4YXsGwd+ZhZXbj9678iBIUW74HWuJPdxuEWDGl7Dmc6m3IfZBztWk0JW3
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(396003)(39850400004)(346002)(376002)(186009)(1800799009)(82310400011)(451199024)(36840700001)(46966006)(41300700001)(6486002)(6506007)(53546011)(6512007)(966005)(478600001)(83380400001)(107886003)(2616005)(2906002)(336012)(4744005)(15650500001)(26005)(54906003)(70206006)(70586007)(316002)(5660300002)(4326008)(6862004)(8676002)(8936002)(81166007)(40480700001)(47076005)(36860700001)(86362001)(36756003)(33656002)(82740400003)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 08:07:22.6726
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e25465a8-2ae4-4e25-05f8-08dbb29e20c4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5840
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Sep 2023 08:07:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187483

T24gMTAgU2VwIDIwMjMsIGF0IDE2OjU0LCBNYXJ0YSBSeWJjenluc2thIHZpYSBsaXN0cy55b2N0
b3Byb2plY3Qub3JnIDxyeWJjenluc2thPWdtYWlsLmNvbUBsaXN0cy55b2N0b3Byb2plY3Qub3Jn
PiB3cm90ZToNCj4gT24gU3VuLCAxMCBTZXB0IDIwMjMsIDE3OjE0IEtoZW0gUmFqLCA8cmFqLmto
ZW1AZ21haWwuY29tPiB3cm90ZToNCj4gT24gU3VuLCBTZXAgMTAsIDIwMjMgYXQgNDoxOOKAr0FN
IFN0ZXZlIFNha29tYW4gPHN0ZXZlQHNha29tYW4uY29tPiB3cm90ZToNCj4gPg0KPiA+IEJyYW5j
aDogbWFzdGVyDQo+ID4NCj4gPiBOZXcgdGhpcyB3ZWVrOiAxMCBDVkVzDQo+ID4gQ1ZFLTIwMjIt
MzU2MyAoQ1ZTUzM6IDUuNyBNRURJVU0pOiBibHVlejUgaHR0cHM6Ly93ZWIubnZkLm5pc3QuZ292
L3ZpZXcvdnVsbi9kZXRhaWw/dnVsbklkPUNWRS0yMDIyLTM1NjMgKg0KPiA+IENWRS0yMDIyLTM2
MzcgKENWU1MzOiA1LjUgTUVESVVNKTogYmx1ZXo1IGh0dHBzOi8vd2ViLm52ZC5uaXN0Lmdvdi92
aWV3L3Z1bG4vZGV0YWlsP3Z1bG5JZD1DVkUtMjAyMi0zNjM3ICoNCj4gDQo+IFRoZXNlIHR3byBh
cmUgYWRkcmVzc2VkIGluIHRoZSA1LjY5IHJlbGVhc2Ugd2hpY2ggaXMgYWxyZWFkeSBpbg0KPiBt
YXN0ZXIuIFNvIEkgd29uZGVyIGhvdyB0aGUgQ1ZFIHNjYW5uZXIgbWlzc2VkIGl0Lg0KPiANCj4g
VGhlIE5WRCBlbnRyeSBkb2VzIG5vdCBpbmNsdWRlIGFueSB2ZXJzaW9uIG51bWJlcnMsIHNvIGFs
bCBibHVleiB2ZXJzaW9ucyBhcmUgbWF0Y2hlZCBhcyB2dWxuZXJhYmxlLiBIYXZlIHlvdSBtYWls
ZWQgdGhlbT8gQ2FuIGRvIGl0IGlmIHlvdSBoYXZlbid0Lg0KDQpJIG1haWxlZCB0aGVtIGxhc3Qg
d2VlayB3aGVuIEkgbm90aWNlZCB0aGlzLg0KDQpJcm9uaWNhbGx5IHRoaXMgd2FzIG15IGZhdWx0
OiB0aGVzZSB3ZXJlIGxpc3RlZCBhcyBrZXJuZWwgaXNzdWVzIHNvIGdvdCB0aGUgQ1BFIGNoYW5n
ZWQgdG8gcmVmZXIgdG8gYmx1ZXogaW5zdGVhZCBvZiB0aGUga2VybmVsLiA6KQ0KDQpSb3NzDQoN
Cg==

