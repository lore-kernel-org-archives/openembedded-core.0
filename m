Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAC7CEB64DA
	for <webhook@archiver.kernel.org>; Fri, 14 Jul 2023 13:24:13 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.41])
 by mx.groups.io with SMTP id smtpd.web10.19090.1689341048738471740
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jul 2023 06:24:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=gbLmUujp;
 spf=pass (domain: arm.com, ip: 40.107.7.41, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vNpZ82E2W+fX8KUitVhOaapqkXATe/2W76yldeQR8zc=;
 b=gbLmUujp/9bWqVo+e78e/8xAdE3+fX5eOa2FAbdZd5dWwTFAKaEcL58Gu/KMfN4TP6OS/7UfZobceoocalX42BOcMCwSRWOB1tv+UfQKjJjN5OtBX2oHPGiOsEK2zEc0qODWDyMELA+cByYIybk3jEMTEwbElQUp0s0iRh/RnUo=
Received: from AS4PR09CA0019.eurprd09.prod.outlook.com (2603:10a6:20b:5d4::10)
 by AS8PR08MB6085.eurprd08.prod.outlook.com (2603:10a6:20b:294::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.27; Fri, 14 Jul
 2023 13:24:05 +0000
Received: from AM7EUR03FT016.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:5d4:cafe::5e) by AS4PR09CA0019.outlook.office365.com
 (2603:10a6:20b:5d4::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.26 via Frontend
 Transport; Fri, 14 Jul 2023 13:24:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT016.mail.protection.outlook.com (100.127.140.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6588.24 via Frontend Transport; Fri, 14 Jul 2023 13:24:04 +0000
Received: ("Tessian outbound ba2f3d95109c:v145"); Fri, 14 Jul 2023 13:24:03 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 481228da29a628f6
X-CR-MTA-TID: 64aa7808
Received: from 1b68cec1acfc.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 89CC651D-278D-4CD4-A3B3-CF15F4B28A07.1;
	Fri, 14 Jul 2023 13:23:57 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1b68cec1acfc.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 14 Jul 2023 13:23:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nVuPZQbP33PEK4BbwDdoqI/P0aBTDuqU6t1JDePWQzYV0cFFq3McTCAHOwYJ38kOHvzOEF4X1FQEGjyJuLi/DXCysJLW5QiquBRgPpmI7sJTsExmK+aXzqU2ixo4AfE3zEsv7HWm5sCTSepfQZoTv55GV5LlOnU7fRqssZrpuq1WCYrBUtjtSa6mXt+pAzZVXeOXcMWc6XCcXchEx8VvXbuxjWFIHBK3kzYcHxN/P23amTomSy2rstQekPaCg4C9w8BUTOeGeYhn02xfYKoLK1d6CsTwsgtOJHczk7+MBdwNJaNr2PF5ELNYaxu+6F/LOPhgqYe95wbKV+mfBkiaTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vNpZ82E2W+fX8KUitVhOaapqkXATe/2W76yldeQR8zc=;
 b=hq/68mEzCHLQrSzoK+bEjmauVBEvMa+SJoRyN3xG8M5gpXymfh7oT2WE5Y0Mxwvv+nismgoIKEzQq6pkSixXP7iX7CfSK5VnurhcylLsZ/AfwWbYgo74K4s6mi/CwM9jcsm+yeyZfxO0L00DISqrU7eUA0UkXznn5wXPQhEMSGmWRyodej3AZlvwFOridAimmmKeuXC6HIzTnpv2aHq6t5Lpqboubooqc5xAaPKZj1vnQPxgNsxxv3kFPLUoFRJRvqAU4ImKYsb2+pwtzeolJm9j6eg1c8COJX8JQo65MY+Gmf1RYi0TiY1AyjH/ua7g92aQ84sZSETHHZLc0fUf5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vNpZ82E2W+fX8KUitVhOaapqkXATe/2W76yldeQR8zc=;
 b=gbLmUujp/9bWqVo+e78e/8xAdE3+fX5eOa2FAbdZd5dWwTFAKaEcL58Gu/KMfN4TP6OS/7UfZobceoocalX42BOcMCwSRWOB1tv+UfQKjJjN5OtBX2oHPGiOsEK2zEc0qODWDyMELA+cByYIybk3jEMTEwbElQUp0s0iRh/RnUo=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PA4PR08MB6032.eurprd08.prod.outlook.com (2603:10a6:102:e4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.27; Fri, 14 Jul
 2023 13:23:56 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::30b4:3110:b02d:7f21]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::30b4:3110:b02d:7f21%7]) with mapi id 15.20.6588.027; Fri, 14 Jul 2023
 13:23:56 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: =?utf-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
CC: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] rpmbuild doesn't work on the target system out of the
 box with standard macros in the specfile
Thread-Topic: [OE-core] rpmbuild doesn't work on the target system out of the
 box with standard macros in the specfile
Thread-Index: AQHZtlJJ9ixOyvzoqk+IVOFL1szdAK+5QDEA
Date: Fri, 14 Jul 2023 13:23:56 +0000
Message-ID: <98E1AB5A-E531-457D-97B5-CFFD1C4A1103@arm.com>
References: <d8337e11-0727-a5cb-d3db-1cd6b5ad9190@gmail.com>
In-Reply-To: <d8337e11-0727-a5cb-d3db-1cd6b5ad9190@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PA4PR08MB6032:EE_|AM7EUR03FT016:EE_|AS8PR08MB6085:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b3da3f0-b5c3-4c3c-2f34-08db846d9844
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 VBlTF09C8HxSZdLDKJuq9xg4pHJBHRL3nWCOScukeXJvft4ZBarGXjwclJxy7YjzEDrrWTR3rfj8i2M9PG7B5awiIoygHpJnS7fUe9VP39qmLfAUj0w7ccVax+nDYgU5+eswRCn5Y0euqg8DDYLUTQwWAA3VtL9UFIxq5KV1dHMcxcLZZ71JOJoDkcFcIcEmJCc71wyL/l0LEIxNKCF5OTxIZXQ3S/8FrWtqQ6VG3dohjbAU6EkAGZ2LXcrW3nB79vET2/1xeClfLShFBrKg+KjD2YnZu1/11e1szD/RLr+e8IDbyqN5eM5/D9qRpI/EpRp5LaJnep34DSzptty43qMO394AsRtw0E9SN3psuRghJXNOOIgDljdoCMaQcOk2PwwAgs0a2Sg4ClSQpMKowgAw2x5GpC+22+lKi1IRFWrq/lVlPlEopiA+ORaRv8tX6Jj48+1IuvFNHCyYeBKcPR+BBIGPnzsH2WB+ED97jM+28EbCk7GeipaVytx3SLwtHYSQU/hI1YL43zmnWTjpPOHaII4YiFFte83gaV0M7AcCj3+jWGrfwWMhiiTideYxiPyu9U7WDoTggEGGl9cIxgWOUWu8EyiudTad4DGDxlyxyhm+Ws6tlj3Y2yfYwt6HxaoCClfq8BKcpqZA8C3lLA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(376002)(396003)(366004)(136003)(451199021)(6512007)(6486002)(71200400001)(33656002)(186003)(2616005)(36756003)(122000001)(38100700002)(38070700005)(86362001)(53546011)(26005)(6506007)(66946007)(66446008)(64756008)(66476007)(76116006)(66556008)(6916009)(4326008)(91956017)(41300700001)(5660300002)(8936002)(316002)(8676002)(2906002)(478600001)(4744005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <E1834753FD564D48900D14B1CE016EAC@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6032
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	3930b4b5-218b-4c61-2d0c-08db846d938b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	OD5TZOxUwLA6aQaTnInuk7SMf9Q0adv8INem9ywtXAnnkRosnhxXBHkrq4l3N3QnVaVWW+oUPXewaPn6ZHXkNs3GNjfKGHYHc9xxN+6UJb6BL3w8Uh2NB1JFA8dPan/gQV8j8gom0vU6SGWpJGVeEcvclL8Zb2M2QvdZwlHA9I7+GqENza4WQ1diKkRNZcKC4ZHg/BHnHxY75bplbxMg3YU4u+ES7fo82XEh5IlmHUdNtbn7P6MLvn9rxq0KWtWXt3w6lTNfypbZgncACCPYiP6WRfk5464+D7nd6gVnpsUbU4V21fRyjHL0Fy/J9nfBhtsv4/AtbBV2/UsLWz7j2wYoqh6X40qoke4ij+OZyPLiF2u3ZOd+d6gTd/3OUqVhqv1oAE1Y5VnSYlwOEeGDvxylhFo/FNfYqYO1hPNMIoW9JCwBujDjcCFbEo7Y0ZVxOw371dzYsLYytcaVN2zJHM5eZbg6cV+uPrbMlrebR/HoJx2SuI3dTzTd++Vxqru0GqkPDHvy7Ii2dFBf97Wm17DLp4xqyEhIQKXZwm2nR1qJg6ckCuAAv60Fn473RBKJsvCr5hKi4vbewEW6J9AhOOZ7bxcF1UW21Ivh+P8HuS/op5aP77PPWVmPwnrCI8Z9fc+CVsmeG1ykOS3ZwJIsTFRs57FbbZ1yunb+U1pXQlbml6T8yQ/6fhpScvh5N//DVTB0MtfwVPdwXHX05o5zemRzS6bpaDxvKlulphZUf48=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(346002)(39860400002)(136003)(451199021)(46966006)(40470700004)(36840700001)(86362001)(4744005)(33656002)(82310400005)(36756003)(2906002)(40460700003)(40480700001)(47076005)(6512007)(36860700001)(186003)(6506007)(336012)(26005)(53546011)(82740400003)(356005)(6486002)(81166007)(70586007)(70206006)(4326008)(316002)(2616005)(6862004)(41300700001)(8676002)(478600001)(5660300002)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2023 13:24:04.3339
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b3da3f0-b5c3-4c3c-2f34-08db846d9844
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6085
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Jul 2023 13:24:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184262

T24gMTQgSnVsIDIwMjMsIGF0IDEzOjUzLCBab2x0YW4gQm9zem9ybWVueWkgdmlhIGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmcgPHpib3N6b3I9Z21haWwuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+
IHdyb3RlOg0KPiBJdCB3b3VsZCBiZSBuaWNlIGlmIFlvY3RvJ3MgcnBtIHJlY2lwZSBhZGRlZCB0
aGUgcG9zc2libGUNCj4gYnVpbGRhcmNodHJhbnNsYXRlIGxpbmVzIGZvciBCU1AgdGFyZ2V0IGFy
Y2hzIGF1dG9tYXRpY2FsbHkuDQoNCkFzIHlvdeKAmXJlIGluIHRoZSBwZXJmZWN0IHBvc2l0aW9u
IHRvIHRlc3QgdGhpcywgd291bGQgeW91IGJlIHdpbGxpbmcgdG8gY29tZSB1cCB3aXRoIGEgcGF0
Y2g/DQoNCkl0IG1pZ2h0IGJlIGFzIHNpbXBsZSBhcyBvbmx5IGNoYW5naW5nIHRoZSBtYWNybyBm
aWxlcyBpbiBuYXRpdmUgYnVpbGRzLCBzbyB0aGUgdGFyZ2V0IHJwbSBoYXMgY29udmVudGlvbmFs
IG1hY3Jvcy4gIFRoZW4gYWdhaW4gSSBkb27igJl0IGtub3cgbXVjaCBhYm91dCBSUE0gc28gbWF5
IGJlIHdyb25nIQ0KDQpBIHRlc3QgY2FzZSB0aGF0IGRvZXMgYSBzaW1wbGUgYnVpbGQgdXNpbmcg
cnBtIHdvdWxkIGJlIGEgZ29vZCBzdGVwIHRvby4NCg0KQ2hlZXJzLA0KUm9zcw==

