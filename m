Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83C02EB64DA
	for <webhook@archiver.kernel.org>; Tue,  4 Jul 2023 11:11:48 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.60])
 by mx.groups.io with SMTP id smtpd.web10.56224.1688469106085219816
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jul 2023 04:11:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=h7v4tD3M;
 spf=pass (domain: arm.com, ip: 40.107.247.60, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Epg2DmTNYLsKDyXNlUJyAIrWfl5ZwWcJX7vd4mdcvpU=;
 b=h7v4tD3MsEyWMGzlsaV4jb9oEDFC2tZ+8hqkKKImnLcQ/gDVKkr0J1SJ68Ibc3qIXBOlBHE5ZOs6x9qznyfS9Z1wNnP84dOtXwbCS1kQUWRn0XvPR3pEqayslG9qJMAAl/Wvmb1/1uu8QfzYp6UVpCDf20U8mPjn+pfiD6US0zE=
Received: from DB7PR05CA0004.eurprd05.prod.outlook.com (2603:10a6:10:36::17)
 by DBBPR08MB6011.eurprd08.prod.outlook.com (2603:10a6:10:209::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Tue, 4 Jul
 2023 11:11:41 +0000
Received: from DBAEUR03FT040.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:36:cafe::9b) by DB7PR05CA0004.outlook.office365.com
 (2603:10a6:10:36::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.30 via Frontend
 Transport; Tue, 4 Jul 2023 11:11:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT040.mail.protection.outlook.com (100.127.142.157) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6565.18 via Frontend Transport; Tue, 4 Jul 2023 11:11:41 +0000
Received: ("Tessian outbound c08fa2e31830:v142"); Tue, 04 Jul 2023 11:11:41 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c07a2a133ebf9957
X-CR-MTA-TID: 64aa7808
Received: from e30735fc5fb6.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id A0F4A538-4C18-42CF-95AA-29D350A003BD.1;
	Tue, 04 Jul 2023 11:11:34 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e30735fc5fb6.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 04 Jul 2023 11:11:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kbO1Ac+biHGvoSbSjc/wsPAqSE7Qo/umHWy252eYRx5GAB+ACjw08G+TwZGpF+P8FO6v20L7H0Xw4YHx+jEIzTmxfWQaCDsG4Aq7Y9OTsVmtqxgSRFcl+W5gDn+3LxBPdB8Bqc+zBuxrMc8wx7wlDU22u5MTAk0ha8s9ILk9+qiHpx7PpPfkXjNMC+N46ED7HQU5BNHFWsyElQQ8NfHL202aaMGf6P+8jD6PcDWIpDRCgAN4NEuy88Rb5v8yC6W5rA8j7RDwZNo6QT/rK+pqHxV3ufUPycD77hk1WSDy5thbrBp+uSmMG1/Q4MgyXWgQhQzLsy6fryH2Smp1VNB2fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Epg2DmTNYLsKDyXNlUJyAIrWfl5ZwWcJX7vd4mdcvpU=;
 b=jTgcuUgXg2MN4Xp7nGABqek43cIn6p8WQVQtVhHJ0LyDjIIZXyNBrQMnVgEFUvmJ0VhxlziEuENj9Yrx4SEHr9GmJ9fPVv2uU5J4X3cdeQ642o6S8loQukpD3VJ9LzpnBYmoQnxODTuGliv3UIyQhib0rSiYCtzIGHzy26qDAJWf9Ou1CQJJQuDLLsvhlUO++/Kk2Vdq+VhWAQXXrskr/m6f7oKx/igg31J4TBpfZfcwX23C/H02zoj7M9TSifJM+P4LiSbcZTLkvhoRtuffAdd1sCcfbyV6/Byi2UJVjmZ+upj3DOwTLba/WgmvgLDfcYXZ13z6g4ro6a7MrWnVaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Epg2DmTNYLsKDyXNlUJyAIrWfl5ZwWcJX7vd4mdcvpU=;
 b=h7v4tD3MsEyWMGzlsaV4jb9oEDFC2tZ+8hqkKKImnLcQ/gDVKkr0J1SJ68Ibc3qIXBOlBHE5ZOs6x9qznyfS9Z1wNnP84dOtXwbCS1kQUWRn0XvPR3pEqayslG9qJMAAl/Wvmb1/1uu8QfzYp6UVpCDf20U8mPjn+pfiD6US0zE=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS1PR08MB7609.eurprd08.prod.outlook.com (2603:10a6:20b:474::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Tue, 4 Jul
 2023 11:11:33 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::30b4:3110:b02d:7f21]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::30b4:3110:b02d:7f21%7]) with mapi id 15.20.6544.024; Tue, 4 Jul 2023
 11:11:33 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: Changqing Li <changqing.li@eng.windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [master][PATCH 2/2] rootfs-postcommands.bbclass: add
 post func remove_unused_dnf_log_lock
Thread-Topic: [OE-core] [master][PATCH 2/2] rootfs-postcommands.bbclass: add
 post func remove_unused_dnf_log_lock
Thread-Index: AQHZqzNe2fLIZ20L+kWUp8SSYJ7hQa+jcuSAgAYHPAA=
Date: Tue, 4 Jul 2023 11:11:33 +0000
Message-ID: <328B87A9-2B41-4B96-ACBE-C84E3575E1FC@arm.com>
References: <20230630091451.3331563-1-changqing.li@windriver.com>
 <20230630091451.3331563-2-changqing.li@windriver.com>
 <CANNYZj-6GkQ-udC+Nd0zyQbwKtkfrr0hNKZ-AaMEUzgnTCNT1A@mail.gmail.com>
In-Reply-To: 
 <CANNYZj-6GkQ-udC+Nd0zyQbwKtkfrr0hNKZ-AaMEUzgnTCNT1A@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS1PR08MB7609:EE_|DBAEUR03FT040:EE_|DBBPR08MB6011:EE_
X-MS-Office365-Filtering-Correlation-Id: 741f6177-a23e-4189-c5ad-08db7c7f71a1
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 /NBsH+wAn+8TEGKQlF9nr1pkkTm+1bIUhdl3St9kCIys8gVl0ls49PmGXgQJDD5g0QDowZ2y+7GmR8tYlMHhJAInYmX+kQVXjrXpO5lkQaVxJzDL0Y0ua7eGqOqbftnmZRzCotib6FMBEYGvnlxxh7w8G7KsSsldD/ubtmvBewU0mbZhFJlCrbjj3JvzJ4OCkJy46eN/GQUMP/G4wp6XAnKDA43o1Xp4oZha5YkSJ7xq8Wsuw0Cl3LGM9uhkDq4OLO/8OBZp51VFMV9raDO6n4eXJmv9JMUYraPLvYLJugTCi7KfgoY7NBEhKyMF83j2ouhsENzkZIvJP1oZVdbLjf8nwRl+IMIYuP1zhhz/Ezlhczd/NgAOCAJqzWqmQcvUbrGAlMp2aJm5ackUvphZ9OResT4OWt1zO8FpB8KYtNqG+Lp6HRDCmkjDWkkrOjNoabeIejmNsFIUiZsTs7lfbE+gcdkVP4cVQEZ0CPRB5VvLF5VvXMzNO0c9pfUH8LntZB+/fdBgEl/DIjLk7UFWalPNVi7YJubLY+s/PFiHLW9S90U7Xw/ZdrbveL1ncGkYAOW0PYLMaLc/eA/gxcXkntXg9z+uMCApDOnOo2mJokkm42vxuVzXes3NzGSu/TvPW/iUkOGtgb2CzkYZIkQgAQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(366004)(346002)(376002)(136003)(451199021)(38070700005)(2906002)(41300700001)(5660300002)(8676002)(8936002)(33656002)(36756003)(86362001)(186003)(2616005)(478600001)(26005)(6512007)(6506007)(71200400001)(76116006)(6486002)(91956017)(122000001)(316002)(6916009)(66446008)(4326008)(66476007)(64756008)(66946007)(66556008)(53546011)(54906003)(38100700002)(83380400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <45239364CE2AE24287F04DBA8303A076@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR08MB7609
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	738423fd-4303-4fdd-cb29-08db7c7f6cc9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	IONesJaky3E6bs2MFbYigSoiHbYWp1j+dzKY4swow2EHViClgHtjO/RuFk0N4mSSiWkIZpz5VOd0WaZK9FHMaW4kdu7oLg5O8dL4FZ6d3sdVjzEfjxyIRX+OR4BWA7W6wri0QEH0zRH9PFj4zUgSe3GL9lzt7J428MloGBes0JMpjc49GJ56rlqXyFEGxEMnTqQx9xTsnzGDf9/VNn3e04d9fnb0BKQmN1qblaHyFm6otCg3gSTNVKE0J626MvItWP+CTv+SjVydrc0CVsqaSGUPAmu3pgNtPA+27OS/Tofaj1tuY7v6SReCXiG0vx417CEJ+wFb54iUjqZ8wl/Q2ml8cUAuXEgPN0lormq7mohDHz3n9ZbLdPHoilJy8wpO0ielxAoi3qB04Fv3jc+yoASHcF0Ol1Cbhw7tFR4wmL9Jq1Vmouxbg7QaluY3Mh0pHm/dyKrHfAq/K6WwvR7KmoprSBwZxAGlQVtuG3OITAPLFnCABEbqw6UVHokNptc8w6PshWKBcCfvFnGInKJYvdG6j8cWkrGHhmT+8DVIIHuiHPYdZtHSL1GZtsS5RR9pamCkgKaTQfz8r8jiVPRFklRIHSGETxGyJbC7c8Ntmbz/VJVw9huQif1h+e1Q8DP/qydzFMt3NFjqK7evwGZUje1BIZi2iRCRPldEkmKg9Ibxq6zGA6QeJJY/l0DRCxABfMPRGudqRQZDCHFUnageY2xBC4XFqM9FngINY0+wlAzMwisbvs9UR187nyv5ZIwD
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(346002)(376002)(136003)(451199021)(46966006)(40470700004)(36840700001)(40460700003)(2906002)(41300700001)(6862004)(5660300002)(8676002)(8936002)(82310400005)(33656002)(36756003)(40480700001)(86362001)(186003)(2616005)(478600001)(26005)(6512007)(6506007)(82740400003)(6486002)(70206006)(47076005)(316002)(70586007)(4326008)(36860700001)(53546011)(81166007)(54906003)(336012)(83380400001)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2023 11:11:41.2019
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 741f6177-a23e-4189-c5ad-08db7c7f71a1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6011
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Jul 2023 11:11:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183827

T24gMzAgSnVuIDIwMjMsIGF0IDE2OjA3LCBBbGV4YW5kZXIgS2FuYXZpbiB2aWEgbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZyA8YWxleC5rYW5hdmluPWdtYWlsLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnPiB3cm90ZToNCj4gDQo+IE9uIEZyaSwgMzAgSnVuIDIwMjMgYXQgMTE6MTQsIENoYW5ncWlu
ZyBMaQ0KPiA8Y2hhbmdxaW5nLmxpQGVuZy53aW5kcml2ZXIuY29tPiB3cm90ZToNCj4+IFJlbW92
ZSBsb2dfbG9jay5waWQgd2hpY2ggbWF5YmUgY3JlYXRlZCBkdXJpbmcgZG9fcm9vdGZzLiBJbiBj
b21taXQNCj4+IFtkbmY6IG9ubHkgd3JpdGUgdGhlIGxvZyBsb2NrIHRvIHJvb3QgZm9yIG5hdGl2
ZSBkbmZdLA0KPj4gbmF0aXZlIGRuZiBjaGFuZ2VkIHRvIHdyaXRlIGxvZyBsb2NrIHRvIHJvb3Qs
IGFuZCB0YXJnZXQgZG5mIHN0aWxsDQo+PiB1c2UgL3Zhci9sb2csIHNvIGxvZ19sb2NrLnBpZCBu
ZWVkIHRvIGJlIHJlbW92ZWQgcG9zdCBkb19yb290ZnMuDQo+IA0KPiBUaGlzIGlzIG5vdCBtYWtp
bmcgY2xlYXIgd2h5IHRoZSBmaWxlIG5lZWRzIHRvIGJlIHJlbW92ZWQuIFdoYXQNCj4gcHJvYmxl
bXMgb2NjdXIgaWYgaXQgaXMgbGVmdCBpbiBwbGFjZT8gSXMgaXQgc3VwcG9zZWQgdG8gYmUgYWRk
ZWQsDQo+IHRoZW4gcmVtb3ZlZCBieSBkbmYgZHVyaW5nIGRvX3Jvb3RmcywgYW5kIGlmIHRoaXMg
ZG9lc24ndCBoYXBwZW4sIGlzDQo+IHRoYXQgYSBwcm9ibGVtIHdpdGggZG5mIHRoYXQgbmVlZHMg
dG8gYmUgZml4ZWQsIHJhdGhlciB0aGFuIHJlbW92aW5nDQo+IHRoZSBmaWxlIG1hbnVhbGx5IGFm
dGVyIHRoZSBmYWN0Pw0KDQpBYnNvbHV0ZWx5LiAgSWYgdGhlIGRuZiBpbWFnZSBjcmVhdGlvbiBp
cyBsZWF2aW5nIGxvY2sgZmlsZXMgdGhlbiB3ZSBmaXggdGhlIGRuZiBpbWFnZSBjcmVhdGlvbi4g
IERvZXMgZG5mIGxlYXZlIGEgZGFlbW9uIGhhbmdpbmcgYXJvdW5kPyBEb2VzIGl0IGxlYXZlIGxv
Y2sgZmlsZXMgd2hlbiBpdCBzaG91bGRu4oCZdD8gIEVpdGhlciB3YXksIHRoaXMgc2hvdWxkIGJl
IGluIGRuZiBvciB0aGUgaW1hZ2UgY3JlYXRpb24gY29kZSBpdHNlbGYsIG5vdCBhIGdlbmVyaWMg
cm9vdGZzIHBvc3Rjb21tYW5kLg0KDQpSb3Nz

