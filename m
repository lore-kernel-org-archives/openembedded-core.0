Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE467C433EF
	for <webhook@archiver.kernel.org>; Wed, 20 Jul 2022 09:50:55 +0000 (UTC)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (EUR03-VE1-obe.outbound.protection.outlook.com [40.107.5.56])
 by mx.groups.io with SMTP id smtpd.web10.52079.1658310646732905487
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 02:50:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=T2OffB+i;
 spf=pass (domain: arm.com, ip: 40.107.5.56, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=H7hOsBOkNiPSuSI7C7SQHrFilFitIsIcgZZP6Q41kA6YGD9NkGNaCdlOdKEtnClty+jsYg8fLKEiituHaHX9BCJu1kY4jWHNeBUuCdfrKe4DC/CwGZLgtJ+ufVq2uu9tCMZB21rOOS9Ey3HG+ptMmVUup9qKn6oNnIaVCReXZQnUkuX6s1v7q8epbH8UnAHuZCYo/F8Y0rXLILw9KEauR6uB1YXdRq5H6jsKrJc5iKIs5dZhQD9VbrZ/OQMuv9VJ/N3bDZs+y27Rgka25HRCPGlTft2yq28iSPPrMp/jNOIiGvESWbTl6Za5viDig+DDvw37b2KPh+ugty6cnJvbGQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=891HASuxaEPn26FEj2MsFpLp5YrRX8btvILTqE6rXmA=;
 b=T4lf93utxgyy0FkHOTOHS0MGta6B7SvmlmDRKIc5pG1ac6t6rBP+viGhS4Wgp5efAtoPjm1vQB7HsTSbVJUdJw2gdlMihffFmi1HCuT0AKSHxXhPjJmAuKfXwqalrGK0ft4cbhf9zbR/YeCXA3atGz36jBx2uw5P/T+cTJV/kpYj5tlQRPHiD3202ww+ALcGICDjjiWe81TPVVNeFLKdX/4PoO/DnPxe1b27qH4BKdkRqptZnzkBGF7YzN1TvhTzatRsShPf0peY/Mvo5hrYa1knzDsxXMqfGUyl7K2uirRZOWtRoMxfQamOPzNLM9X97T8f4gfF0Y0v7HOS0yfYmg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=891HASuxaEPn26FEj2MsFpLp5YrRX8btvILTqE6rXmA=;
 b=T2OffB+i9VbnjcSceOwkNMuUjg8DBCYG+2VBW1AlmmII9oVY+0OZ6KbKEhMJ6v/X5enBsKdjUbAvE3qAhOMpdZq6QLoNDVg9lxoWVW6XFtH1wK4KeUvWJLugMGMpc/iHcm6twYLsatJZmh93DN46SegJLnQYwMjk1Ng/R0oP3wI=
Received: from DB8PR06CA0016.eurprd06.prod.outlook.com (2603:10a6:10:100::29)
 by DBAPR08MB5703.eurprd08.prod.outlook.com (2603:10a6:10:1ad::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.12; Wed, 20 Jul
 2022 09:50:41 +0000
Received: from DBAEUR03FT050.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:100:cafe::7) by DB8PR06CA0016.outlook.office365.com
 (2603:10a6:10:100::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.14 via Frontend
 Transport; Wed, 20 Jul 2022 09:50:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT050.mail.protection.outlook.com (100.127.142.250) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5458.17 via Frontend Transport; Wed, 20 Jul 2022 09:50:41 +0000
Received: ("Tessian outbound 2af316122c7a:v123");
 Wed, 20 Jul 2022 09:50:41 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 87293323e9755df2
X-CR-MTA-TID: 64aa7808
Received: from 2bd744caf5d3.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F70138E7-3DD1-46BC-B0E2-7BC9E7419BF0.1;
	Wed, 20 Jul 2022 09:50:33 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 2bd744caf5d3.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 20 Jul 2022 09:50:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q/hU4drYBTScHnNI+RVLAGdE2RA1pPZEA/U2igWxbYSI3yvsHT/DmNyKuaocU+1LOti+bf8nCKZjmCr4SL04vYFGEKpy0Qtcy9yKst3JraGrP8gBSa+cD7QFYo/a9RDQ/sYE1MCjBo8ln3GFmv4MSK+1aZ/iab/cjuB29fFyZqwMWdXp2beAcl5X6cK48BGBrF1EDyhJbYPRJdSFzJWzsO1Ov4TY6PFzumzkcGKQOWOrg0bHiQmNjIGIi6AwzIGC4gbIlvXmt98xgG2BMPa7HBVkXhkuFbBonS1rVQFIZwz12MzmYogx1d3nKKR1puL+6VFyV3AOrs+Rus1snYBUiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=891HASuxaEPn26FEj2MsFpLp5YrRX8btvILTqE6rXmA=;
 b=j3NwBatYPgyHbKPF4yc6oNMLBJf+nobB4tMqdv9SGNxOUpqC/PxAQEVti+y894J5lo+c46WPRLep5PJVnKqi+NsHa+fZJJy8maPc/XTZnEmeBLBW4KgBPkEStg814XFTFtbz6I/DC/kYmL8hJYENZ8RRcbRhTUla7DjBu7+W/8S1sKH9kn6jObN1oWql7/+aKO4+BAPKCJX4Nk0xvys8iht6cLgRmoheZYt6zWpq0S8ouueY9jdRcp5ZEzvgtRp3aQI7n0cHK9IcY5nhxcyiL387eyklrvTnhzQLRlUCffyr8iVLtdPIyCQ8iS6eSUNgYgPs9a6e9zS66qqME8MYEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=891HASuxaEPn26FEj2MsFpLp5YrRX8btvILTqE6rXmA=;
 b=T2OffB+i9VbnjcSceOwkNMuUjg8DBCYG+2VBW1AlmmII9oVY+0OZ6KbKEhMJ6v/X5enBsKdjUbAvE3qAhOMpdZq6QLoNDVg9lxoWVW6XFtH1wK4KeUvWJLugMGMpc/iHcm6twYLsatJZmh93DN46SegJLnQYwMjk1Ng/R0oP3wI=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS4PR08MB7688.eurprd08.prod.outlook.com (2603:10a6:20b:507::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23; Wed, 20 Jul
 2022 09:50:27 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::fc06:20ca:a7cd:4d72]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::fc06:20ca:a7cd:4d72%9]) with mapi id 15.20.5438.023; Wed, 20 Jul 2022
 09:50:27 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: Richard Purdie <richard.purdie@linuxfoundation.org>, OE-core
	<openembedded-core@lists.openembedded.org>, openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>, Yocto-mailing-list
	<yocto@lists.yoctoproject.org>
Subject: Re: [Openembedded-architecture] Let's drop x86-x32 (was Re: [OE-core]
 [PATCH 05/51] rpm: update 4.17.0 -> 4.17.1)
Thread-Topic: [Openembedded-architecture] Let's drop x86-x32 (was Re:
 [OE-core] [PATCH 05/51] rpm: update 4.17.0 -> 4.17.1)
Thread-Index: AQHYnBpl0I5micPIz0uMzIpcBYi5Wq2G/dgAgAAGOoA=
Date: Wed, 20 Jul 2022 09:50:27 +0000
Message-ID: <0A7591F9-3D0D-49E2-A067-67485A8B3B0D@arm.com>
References: <20220720084442.2940187-1-alex@linutronix.de>
 <17037D268C38CE83.21682@lists.openembedded.org>
 <CANNYZj9KKfqK8fH6HB3mLP8Vhi=U-VCMOus1uAq9kUQ7+6D74A@mail.gmail.com>
 <ee397d3552782e6fd969a497e55396ff474fee92.camel@linuxfoundation.org>
 <CANNYZj8EVF79=r4agVTa_5rfqtsU_mdBu2bD8eLv9TbD8U3fHw@mail.gmail.com>
In-Reply-To: 
 <CANNYZj8EVF79=r4agVTa_5rfqtsU_mdBu2bD8eLv9TbD8U3fHw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 4f09440a-87cc-4e84-6f1b-08da6a354ec5
x-ms-traffictypediagnostic: 
	AS4PR08MB7688:EE_|DBAEUR03FT050:EE_|DBAPR08MB5703:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 WCTdKNeXsOmBhOaAJkELhRJFOdktehHRYjbxxoCY1wl4a9L5dE39P0DiJ8ZecTGiOr4BReUfC3ApzO3d8UQv0jFOBBu65qJXusnhPp3pSplKLnWryk+DXH1SNQqpw60vsgniSYMRhO6ROqw4KkvBdI9MexgenfIP8iJck1Fe8UjnsMf23Guo7nmjmJOlKSMVp3dp+llI1KTqdHUwlHzXKs1IUTloPMm7Jza7I+fiRfUA94NTtGdgZQ9flLlZ2DH9ZD62DjDUw0hyg1tdF0pKvwPQgPcF3/M8txvXH/ZzZZZz94J3LSLRqnO9b0iu0KgvNl5l02fhDwy6d3gGqEhEZQ24DD11FRaf2SNFEJ8MR5jRopn05l5FnxL2ZrxTpS7ZIE8JTg8mMwPesFMjA5tpWAPPPzlkFWIs2K/zEpKkLiQYuFzI6n04OSpw39itgW0n7uyLyY0Bfzbw2LUY+ztITNe3koVW/oV/4UwFKLL+r1PGpf+drFFEybPRqnqbntOlBAAchyuzALzTnAzf8CosqW0Um3dj87V/YovsqsJ4SV57aQZ4YXcIaqilLOUCeG5QMo5mSsVfdOkZWpJmKqa0acW6zJceWuuTeUcYlR/8Bhn8KRAx+4dr1bEbZpqZIbD9aNXzC+3mR6YDvHEQL4U372KFBmzAQ2wmks1owgK+AOCkfFQXM0kTP6jfO/UK/RctI/bdUh2bN+0KJ8YCWZoNxeZUyG1a5cI697dj6TDyV2qDdAZOJhoH7eVD3POXAF/2KanAXsYIiN5hRxvuRPse0slvumRzlZZXL6Zxmzf8srCBzc22obf5/jOZFY6X9QCCJKyFjLLfZ/ugvnDbdzvKIg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(396003)(39860400002)(376002)(366004)(26005)(186003)(478600001)(2906002)(41300700001)(2616005)(83380400001)(6512007)(4744005)(33656002)(8936002)(53546011)(6506007)(5660300002)(6486002)(316002)(86362001)(38100700002)(66946007)(91956017)(36756003)(6916009)(122000001)(8676002)(64756008)(4326008)(54906003)(71200400001)(38070700005)(66476007)(76116006)(66446008)(66556008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <5A1AF605B88A434EA5CFDE528E002BB8@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7688
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	5c11b8cb-7e1f-4e3c-1ef1-08da6a354689
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	GZ9lJhv4tpYAtw6jdmc1BlhZZnnebrxQ1EYNWlXmjYc0jw53se5kuCjWdzuHxkAD6fVd4j6pKjgIJIxsmytu6/oOSJKSWf4QAN8w7gfKywz8jj1feoosQZbGArNbB1e3FLl/KM13uSPFk4RJfkkzY+vEh8nKN85/5VnjwxLcO212gW+TFjTVRNTJ60YxK5UPp+HhSUblxpHMHzLMpI95+X+Qd4zrA5kCo1UlCo3JQxNwNRP2HIsHMq5oQWOhIlnzpQkiPKVyOxHpzX2jOCdAlGFJYI2jXG7AjqroecGHuBPr1AhySeTikBUjW50S+4uyQkDeh6+puQC+LU+7IcdJmCA+P6CfTGFJI6SSxX8FVWDx1PzSXZrgfIFd44SGrZp5PTO8EXjjsQNAOghSC1Gev37F1b6aTvnv5bH+leAIsIXHxC9RkrTf8aJoPBSkHD8aM78D5o29Jsp3kGiK2Y3vMzvnsvBHziFjAEkQ3q3f024BQj8HvTB+lcMZ3mGQGPTvaysFbd4woDpRQ/Sr/i5eFHA0iSMhVPyShEZH3P571ku82pQVwQeGetsfThh66GfdcG7pedrEg4LussDjFBeFNT64QNO+/E5ImQynyADo2hYknpPeKkFL2TJ4hIggofWodzRzGW4/6lS7gNICZ3wEBov2Hyyu0F3jS9cIwqvktfQYtQFmlHdQdu6AOPvu/XNagHVEr/SVQiHpKM7mpuIxdW9ckKBHuS103//hDtrp4zKiqFw+7yfsCX1nr844tCUxxyfGLDiuptTVoUgPzPtCmoLvoV+vCjB+14g493gBZdHmI9R3h8F09Ml2vWocP+yS
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(136003)(39860400002)(346002)(376002)(36840700001)(46966006)(40470700004)(2616005)(5660300002)(86362001)(2906002)(6486002)(53546011)(6506007)(70206006)(41300700001)(6512007)(6862004)(107886003)(478600001)(33656002)(82310400005)(8936002)(82740400003)(356005)(70586007)(26005)(450100002)(83380400001)(47076005)(40460700003)(336012)(36860700001)(40480700001)(186003)(4326008)(316002)(8676002)(36756003)(54906003)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2022 09:50:41.3563
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4f09440a-87cc-4e84-6f1b-08da6a354ec5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5703
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Jul 2022 09:50:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168351

T24gMjAgSnVsIDIwMjIsIGF0IDEwOjI4LCBBbGV4YW5kZXIgS2FuYXZpbiB2aWEgbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZyA8YWxleC5rYW5hdmluPWdtYWlsLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnPiB3cm90ZToNCj4gDQo+IE9uIFdlZCwgMjAgSnVsIDIwMjIgYXQgMTE6MjMsIFJpY2hhcmQg
UHVyZGllDQo+IDxyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnPiB3cm90ZToNCj4+
IFRoYXQgYW1vdW50cyB0byBkcm9wcGluZyB4MzIgc3VwcG9ydCBiZWNhdXNlIGFzIHNvb24gYXMg
d2UgcmVtb3ZlIHRoZXNlDQo+PiB0ZXN0cywgaXQgd2lsbCBiaXRyb3QuDQo+PiANCj4+IFRoZXJl
IGlzIHN0aWxsIHNvbWUgdmFsdWUgaW4gdGhlIHByb2plY3QgYmVpbmcgYWJsZSB0byBzdXBwb3J0
DQo+PiBkaWZmZXJlbnQgYXJjaGl0ZWN0dXJlcyBhbmQgZGlmZmVyZW50IHR5cGUgc2l6ZXMgc28g
SSBkbyBzdGlsbCBsZWFuDQo+PiB0b3dhcmRzIGtlZXBpbmcgdGhpcyBhbGl2ZSBhdCBhIG1pbmlt
YWwgbGV2ZWwuDQo+IA0KPiBCdXQgdGhlbiB3aHkgbm90IHJlcGxhY2UgeDMyIHdpdGggcmlzY3Yz
Miwgd2hpY2ggYXMgd2VsbCBoYXMgMzIgYml0DQo+IHBvaW50ZXJzIGJ1dCA2NCBiaXQgaW50ZWdl
cnMgYW5kIHRodXMgdHJpcHMgb3ZlciB0aGUgc2FtZSB0eXBlIHNpemUNCj4gaXNzdWVzPw0KDQpE
b2VzIHRoZSBSSVNDLVYgZWNvc3lzdGVtIGNhcmUgYWJvdXQgcmlzY3YzMj8NCg0KVGhlIHByb2Js
ZW0gd2l0aCBJbnRlbCB4MzIgaXMgdGhhdCB2ZXJ5IGZldyBwZW9wbGUgY2FyZSwgc28gd2UgZW5k
IHVwIGZpeGluZyB1cHN0cmVhbSBzb2Z0d2FyZS4gIElmIFJJU0MtViBjYXJlcyB0aGVuIHdlIHdv
buKAmXQgYmUgYWxvbmUuDQoNCkFsc28sIEludGVsIHNob3VsZCBnZXQgdG8gaGF2ZSBhbiBvcGlu
aW9uIG9uIHRoaXMuICBJZiB0aGV5IGFjdHVhbGx5IGNhcmUgYWJvdXQgeDMyIHRoZW4gdGhleSBj
YW4gaGVscCBmaXggdGhlIGlzc3VlcywgaWYgdGhleSBkb27igJl0IHRoZW4gd2UgY2FuIGVhc2ls
eSBzd2l0Y2ggdG8gYSBwbGF0Zm9ybSB0aGF0IGhhcyBzdXBwb3J0Lg0KDQpSb3Nz

