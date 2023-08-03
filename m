Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8605AC001DF
	for <webhook@archiver.kernel.org>; Thu,  3 Aug 2023 18:33:12 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.40])
 by mx.groups.io with SMTP id smtpd.web10.1929.1691087581697144790
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Aug 2023 11:33:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=4CwAbv0i;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=4CwAbv0i;
 spf=pass (domain: arm.com, ip: 40.107.13.40, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O0MqRYPqvAIIDcuUjWR5LLaCCfWWwrNeUFKP0QBTWLo=;
 b=4CwAbv0iDb07qUAwYhJPj9YXuaUSFwCdvaUtTOUEg9opS/UgEoi9zK3385bG8rhcj3ZgJFfFhC+fuVrjDQMcLz4pcwETBJ/BCIUXhcyFukGhZkm4Tf828uAmqRjNzzf55IDZB87dYRPDmOVR+j1zzyjuHlwnz+TwA/6kT+iJP4E=
Received: from AS9PR05CA0013.eurprd05.prod.outlook.com (2603:10a6:20b:488::6)
 by DB9PR08MB10378.eurprd08.prod.outlook.com (2603:10a6:10:3da::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.20; Thu, 3 Aug
 2023 18:32:57 +0000
Received: from AM7EUR03FT056.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:488:cafe::3e) by AS9PR05CA0013.outlook.office365.com
 (2603:10a6:20b:488::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.20 via Frontend
 Transport; Thu, 3 Aug 2023 18:32:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT056.mail.protection.outlook.com (100.127.140.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6631.47 via Frontend Transport; Thu, 3 Aug 2023 18:32:56 +0000
Received: ("Tessian outbound 997ae1cc9f47:v145"); Thu, 03 Aug 2023 18:32:56 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1b83154794782b02
X-CR-MTA-TID: 64aa7808
Received: from 8e005ef1fa37.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 66BA7DAF-A4BC-433B-9095-F340EE67AD0E.1;
	Thu, 03 Aug 2023 18:32:50 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8e005ef1fa37.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 03 Aug 2023 18:32:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kAsXwwdwFmS0yAJuYwug0NB/bQFfuaUDKrN6MH3hiTJGh+jdemH1JovnhlWG6u59Ob+1ldvRYhbj6QhkDnGpZkmrtUbPaL2jJcckLepZks8YqnP8Zviiil0WgMfNsFSXqBDQnWiS/myQ/Jm5SvHD4L4Be79gNtv+YtD/lKYZgfQdQuW3W/Vtm20X8tMCkqOx6HxELW9zq+whzmFtlWO8bcUQEPDE0u93p7uft7ZjyFkFEEBG0rZ6GJJQfzklOazEnjuRlAS/8gZj2rUPq2xVP6eYomVe1FFaybXJiBfSeeEpX/syH5/u6oRfSAnatEza7VTvV0LKhwP/BYeQduTdKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O0MqRYPqvAIIDcuUjWR5LLaCCfWWwrNeUFKP0QBTWLo=;
 b=mCBO7Wl1hxtGdYnLPqMsg6hhmULSi/xxLaEN4lfcsofKD1LYmXm1jEDl2JziNl44IN5Xryu3aCXO3CjOwfsQJjwg1JBwcBb3VNuYp5BdYuMeok1OwFx50Q8Ie/MOijsF32/CKRs6CGaxxApmKxVfIjiUG4uwCkTFX/6DsMzKI+F78U8S7mS9Zfa3GMMV8bECIrW/wys33dPWDsTHfFoWDn2Q+VpXpeaprJ4PfT9UKJhLWEmdzPAEkiNC5Cy1yWa8btZ2skS7Ih9eColNJnQhOzUlzfa4o5Ht1MeZufkCYFVYUyRHo/dP8p2N0QhU/wWr04HzVAnrM2uzI2cXmqDH1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O0MqRYPqvAIIDcuUjWR5LLaCCfWWwrNeUFKP0QBTWLo=;
 b=4CwAbv0iDb07qUAwYhJPj9YXuaUSFwCdvaUtTOUEg9opS/UgEoi9zK3385bG8rhcj3ZgJFfFhC+fuVrjDQMcLz4pcwETBJ/BCIUXhcyFukGhZkm4Tf828uAmqRjNzzf55IDZB87dYRPDmOVR+j1zzyjuHlwnz+TwA/6kT+iJP4E=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM8PR08MB6388.eurprd08.prod.outlook.com (2603:10a6:20b:36b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Thu, 3 Aug
 2023 18:32:48 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::4b8a:7518:c642:5727]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::4b8a:7518:c642:5727%7]) with mapi id 15.20.6631.046; Thu, 3 Aug 2023
 18:32:48 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "charlie.johnston@ni.com" <charlie.johnston@ni.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-core][PATCH 5/6] packagefeed.bbclass: Add new bbclass for
 building feeds.
Thread-Topic: [oe-core][PATCH 5/6] packagefeed.bbclass: Add new bbclass for
 building feeds.
Thread-Index: AQHZxYofMwG+aHJUT0ODbRrl9SqGAK/Y5qyA
Date: Thu, 3 Aug 2023 18:32:48 +0000
Message-ID: <FC248CF6-314A-4991-819A-FC95837BB82C@arm.com>
References: <20230802214019.1068795-1-charlie.johnston@ni.com>
 <20230802214019.1068795-6-charlie.johnston@ni.com>
In-Reply-To: <20230802214019.1068795-6-charlie.johnston@ni.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AM8PR08MB6388:EE_|AM7EUR03FT056:EE_|DB9PR08MB10378:EE_
X-MS-Office365-Filtering-Correlation-Id: 21b7b691-6fb6-41d3-5e36-08db94500e97
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 wRO1mhZtZUf6MuS7UTg8Y2So+Rk+LOb+MJ/u0K0lpfgJXzh3rwm+5uiAMXjTy1VTEAVrifwghEX2PxSU/RKEeDOsdIbQweLsD0s1t+PGf+Tsdu4J0CDApanP+v+tYKnADgYt8loIA85uxKzSDY4cuLTuwUUnBq48UvJOZBCcfp+YfLa+qZgPd7eOLWddxWiLZ+ECVTiNfRFfQ3REz5t3sST/6cjAsAs/tAIQXVyS+Ob7vwZlMv8275/cjOwNrm0H3CCrBKWPKfIuIye6sxgzOYdNnI1/XxoW2xoJIbZ0G1+l6mFzv5JbB0GZLlTnDsnMnj8Jbn01EaBeRRGEeYZxxiybT8FP4vVVpkB5MTegKisOgmOJXrT+PYvjUCJuMfZZ9D0mKqAz64pdZa6HPOsa6Z/yuE2JIbsbAZWQIQ1DvsLhLkPxrOShRa04wZqFSBUAtchNqaC3dEajCkmlHuENl2mejw4vyYYU6O/DnYE61pKtCdyUqH7dMIBBnBwOqJsVA6MzMNJha3xckr9nodZvDR3c5C9FGnpea4zW5vvDNdCrGrfUMgb9D/yUv6wFprqWhohxeLtcOdXXk6rsxNxOMlwzVkJJhOMnFaLFf4wwTWzQ0wb/NzSFQ1QHQyoY2u9rqeWnTDEJ6GF9RohLy2vPpA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(136003)(396003)(346002)(39860400002)(451199021)(2616005)(53546011)(6506007)(41300700001)(26005)(186003)(8676002)(8936002)(4744005)(66556008)(2906002)(91956017)(4326008)(76116006)(64756008)(66946007)(5660300002)(6916009)(316002)(66446008)(66476007)(6486002)(71200400001)(6512007)(478600001)(38100700002)(122000001)(33656002)(86362001)(36756003)(38070700005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <3D1B252CF8ACCE40A67A199D8E110CDF@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6388
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	d686faed-4df3-4224-b516-08db94500996
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	wkD34ieKJWkg5vH0ooeaDqMC7VSuM+bpBN2m/8BS+hn2YB3oonBj/ZM7D/vLB9OIKxibjTcq0SCjAKE9IJQUY4BFhIdeZl2BcGSgHIfehCtbNNX5zTTjjluoKBhjHukaZXzPreonLDHkFR8NWr3oW2AYhv0W3ldqsKJ14SshAo+zPYkipNbdVXghaB1m5lfGT4qYDeN5SdUNThwyMbpewmi4m9vIak9qxDBkhgQfjbAbZp4moMvbrTlWlXx24GVXGc/8riGZEnqNjMbZ4br7G5rrI4t5YqepZD45mdH1w1RZtoIG/MsOE5G4UwwaxPhb+MfLTCIjJ3CUsZih7rfvucIy8ib2IuRQm6iimWdfOvkDf1rOQTmwbXSWnu4vOtyfNZJDDJqCjCmSsKLVYP66CXbH9PfGY6pu5rUBPKJHwX4nNRTrQfPQ37weopgCPTQlTFAc7/rIS0bi9q3YDoD5HufcfwPxYmecnju3w6KVD5w2xp2chZhrX6PuNIOP+/nQRYdMwMJfh8KMJfHePUvAAKO8NoTIP4YXOCGwy1Z/STQAm7n3qsQTteXoSD6qYZf4cdz9Asi2JEiNTXKKZH6+baip9v0Cn6jXsgAYvavGFSzLHALcC0VVHauXerwdJiviy9mmS/A1Rh8E0oOM38mjL7lqEb2PE1NwHgZ6z0jpTmrSvd2N6qVmL7Kr8gtsZk4ITtafSq5gBPySYQ0vZxw3ZuoIZlr4wXQtA92O0iGtH5Pm5UmABFOeV83xo5ZkrfUQ
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(346002)(396003)(376002)(451199021)(82310400008)(40470700004)(46966006)(36840700001)(40460700003)(2616005)(53546011)(6506007)(336012)(186003)(26005)(47076005)(8676002)(4744005)(316002)(36860700001)(2906002)(4326008)(70206006)(70586007)(5660300002)(41300700001)(6862004)(8936002)(6486002)(6512007)(478600001)(40480700001)(356005)(81166007)(33656002)(86362001)(36756003)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2023 18:32:56.5684
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 21b7b691-6fb6-41d3-5e36-08db94500e97
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB10378
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Aug 2023 18:33:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185494

T24gMiBBdWcgMjAyMywgYXQgMjI6MzUsIENoYXJsaWUgSm9obnN0b24gdmlhIGxpc3RzLm9wZW5l
bWJlZGRlZC5vcmcgPGNoYXJsaWUuam9obnN0b249bmkuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmc+IHdyb3RlOg0KPiArKysgYi9tZXRhL2NsYXNzZXMtcmVjaXBlL3BhY2thZ2VmZWVkLmJiY2xh
c3MNCg0KU28gdGhpcyBpcyBhIHJlY2lwZS1zY29wZSBjbGFzcyB3aGljaCBhZGRzIGEgdGFzayB0
byBnZW5lcmF0ZSBhIHBhY2thZ2UgZmVlZCBiZWZvcmUgZG9fYnVpbGQgZmluaXNoZXMuICBJIGlt
YWdpbmUgdGhlIHVzZWNhc2Ugd291bGQgYmUgdGhhdCB5b3UgYWRkIHRoZSBpbmhlcml0IHRvIGEg
cGFja2FnZWdyb3VwIG9yIGltYWdlIHRoYXQgZGVmaW5lcyB0aGUgc2NvcGUgb2YgdGhlIGZlZWQ/
DQoNClBlcnNvbmFsbHkgSeKAmXZlIG9mdGVuIGRvaW5nIGBiaXRiYWtlIHBhY2thZ2UtaW5kZXhg
IHRvIHVzZSB0aGUgbG9jYWwgZmVlZCBvbiBteSB0YXJnZXQsIGJ1dCB0aGlzIGNsYXNzIHdvdWxk
buKAmXQgYmUgdXNlZnVsIGJlY2F1c2UgSeKAmW0gbm90IGp1c3QgYnVpbGRpbmcgYSBzaW5nbGUg
aW1hZ2UgYW5kIGlmIEkgd2FudCB0byB1c2UgdGhlIGZlZWQgaXTigJlzIG9mdGVuIGJlY2F1c2Ug
SSB3YW50IHRvIGFkZCBhIG5ldyBwYWNrYWdlIHRoYXQgd2FzbuKAmXQgaW4gdGhlIGltYWdlIGJl
Zm9yZS4gICBBbGwgSSB3YW50IGlzIGEgd2F5IHRvIGVuc3VyZSB0aGF0IHRoZSBkZXBsb3kgZGly
ZWN0b3J5IGhhcyBhbiB1cCB0byBkYXRlIGZlZWQgaW4sIGFtIEkgcmlnaHQgaW4gdGhpbmtpbmcg
dGhpcyBjbGFzcyBkb2VzbuKAmXQgc29sdmUgbXkgdXNlY2FzZT8NCg0KQ2hlZXJzLA0KUm9zcw==

