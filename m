Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63BF9C74A5B
	for <webhook@archiver.kernel.org>; Tue, 21 Mar 2023 17:51:18 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.49])
 by mx.groups.io with SMTP id smtpd.web11.20671.1679421073497614120
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Mar 2023 10:51:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=hbBfXKA4;
 spf=pass (domain: arm.com, ip: 40.107.6.49, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qYFVHuIqALeENRGJgBBbK7nC01d3XA6N3528+sui9GA=;
 b=hbBfXKA4vxUgcnM8/hcT4pYDby12pIycXnIUVnpGPs2ABw/t9ZuBVPmD0XY3EU61TKiHf6uF8fQHsWczhYQDRqny7Qwxtaao8k8G3wpJYXWYp7erGOsPHHU/JxsSFQNstW3FF3pjJRuYeK8yeX+FAyVhd920TJ4j1CzSngTaN7s=
Received: from DB7PR02CA0026.eurprd02.prod.outlook.com (2603:10a6:10:52::39)
 by AS8PR08MB10195.eurprd08.prod.outlook.com (2603:10a6:20b:629::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 17:51:10 +0000
Received: from DBAEUR03FT031.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:52:cafe::39) by DB7PR02CA0026.outlook.office365.com
 (2603:10a6:10:52::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37 via Frontend
 Transport; Tue, 21 Mar 2023 17:51:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT031.mail.protection.outlook.com (100.127.142.173) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6222.16 via Frontend Transport; Tue, 21 Mar 2023 17:51:09 +0000
Received: ("Tessian outbound f2a8d6d66d12:v135"); Tue, 21 Mar 2023 17:51:09 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 653a9af2148f359d
X-CR-MTA-TID: 64aa7808
Received: from bb7afd5409b9.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 10E1875F-01E2-4A34-942A-9DC41A8C3833.1;
	Tue, 21 Mar 2023 17:51:02 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id bb7afd5409b9.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 21 Mar 2023 17:51:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U+cGuYPRs+j+nqqmnEMMoNsn9GbIW8xaAFMry0YtSK80i9e2g2wu8VV2J4TjYlte8wUTOpmwGzo2b3tz3WaRXf0q5HUuaQOlwYNM6kguw7TUtMNQs7ssSAkhivafQscz7HsEaP48tI9AmQQJFvMpJgr4QNE7QUnMm6CZ9+tVasFz9gi7x01ue+2HP/4/wenhlV1PoYrNBHHvQP/JJ9PoVdmHh+XEesbtpdVmvtBiqFZf4S6ueRp5z9y43xBpb+xKvQmp+ch5MkpG0q89mAU+veg4I6pPcCS44nUYv9wUp1C9JukJzrKzJthuPWOA+1UEnd+6xJE11TN+oqlUxWlDtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qYFVHuIqALeENRGJgBBbK7nC01d3XA6N3528+sui9GA=;
 b=JHGJAvPN35LANFB+AcgijK1coHf5Rf4DRaUe5ldNovbV/CfAd/SJEQMUv9F0XJt5SvSEGlsS5gyScrvtHSPhQFtv1UunS2/GZ/3zbHs/wwrzazmAk3AsHAV9JBGfAyRjKQfCIZ73vUjM576Ljeu2NXSLbvgQGyCy7/C7uBZLfbl878gAJzBucKUKNtLd34woxGigQWxZe3Re9kYs7Gq9pWibRFha6WrJuMBut5OWQeNGqj6sxzqmpMuV8H9LxvSsUFRPmjbyxzH52DMGVAwOO/r8YMvig5nw/k6a5x/mz8D9sYhdCMiwzMDyOGTG3TA+Y6Kc9qthSU3wgA/Jb5A2vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qYFVHuIqALeENRGJgBBbK7nC01d3XA6N3528+sui9GA=;
 b=hbBfXKA4vxUgcnM8/hcT4pYDby12pIycXnIUVnpGPs2ABw/t9ZuBVPmD0XY3EU61TKiHf6uF8fQHsWczhYQDRqny7Qwxtaao8k8G3wpJYXWYp7erGOsPHHU/JxsSFQNstW3FF3pjJRuYeK8yeX+FAyVhd920TJ4j1CzSngTaN7s=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU2PR08MB10264.eurprd08.prod.outlook.com (2603:10a6:10:49b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 17:50:56 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::e305:742e:e10b:1093]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::e305:742e:e10b:1093%2]) with mapi id 15.20.6178.024; Tue, 21 Mar 2023
 17:50:56 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "Qi.Chen@windriver.com" <Qi.Chen@windriver.com>
CC: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH 1/2] debugedit: add recipe
Thread-Topic: [OE-core][PATCH 1/2] debugedit: add recipe
Thread-Index: AQHZXAuFfk8lQ0N3skmObNjV4FbqNa8FgzoA
Date: Tue, 21 Mar 2023 17:50:55 +0000
Message-ID: <BEEE1608-0309-4213-ADB0-7FC39A1F61F8@arm.com>
References: <20230321154016.34836-1-Qi.Chen@windriver.com>
In-Reply-To: <20230321154016.34836-1-Qi.Chen@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU2PR08MB10264:EE_|DBAEUR03FT031:EE_|AS8PR08MB10195:EE_
X-MS-Office365-Filtering-Correlation-Id: 7deba5bf-e7fb-4ce3-08e5-08db2a34da9c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 u+ocKCFPMb/uUykwo920Vmo7FG3fEhaWcH68oyY4XmWvBFMleyob+GI/X/+XkPLYxRCMucWBNK4LZruEWr+pGEgPqqo5yc7wR3utNuQ6bisaUgv2+0FgEkWFwHEqQrTQw0kD8Kt66DOpnF/5KlLYLX1HeWLmPD/YuTf6jjPN1ChZLjbVZPwH7Q2KGm7zO2PtFipaqNM6WPAcLJEkQHvasU7KQ7cc9ZseYvy5lTkPSD+B4nYVgeqAFlP8gKvkSh69eOEBEgYPFM0TPNXF91VxQU9uvIqq9XV+0FxDijXUAeU6FIug1CF3uSs8XJbGsNKoJr/3E933ZY8Iyl+hJn5iyF82MdodnJveB/6J4vu7+brKZol0TSX/3eqRwC45llD+es/7GiaezvuFLf7Cosm/jITxtSnDKQG81rvb3mQgDY0WQbr03+DbDRTZVEvugXLjl/C4uY6zj5T9eEbLE+yjFtAlCuIokyGhYbrgZgmsVXJDr7YR5pt1gPS6jXrfD7pqchBUhwTGG6Gjd4SidoaV++n83fA5GZ10FRVaIiyO76CftfxFVvVS53fOVUSHidxl+Z782oD6l85iLKfKsl/T4a5Aa/CBqWToPCheHBPp8zBY2OH3cRDQZgmoF2YT9II0OYfiOrPbh16A0pcBH0bh5s/9ybOBv+Vy6vyk9H7luWODGlLjbq8UOWbb+FXIN1PSu4fIldcaLaUWSTckcmRRWy0Xt/8dzrt/84O8is9WT5U=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(366004)(376002)(346002)(396003)(39860400002)(451199018)(86362001)(36756003)(33656002)(71200400001)(316002)(8676002)(6486002)(4326008)(6916009)(64756008)(4744005)(91956017)(66946007)(478600001)(186003)(66446008)(66476007)(6506007)(6512007)(2616005)(966005)(53546011)(26005)(76116006)(66556008)(38100700002)(38070700005)(8936002)(5660300002)(41300700001)(2906002)(122000001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <E73AF68C83DC614498B4324EAE6C8B16@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB10264
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	f7c3829c-1a9c-4887-1c46-08db2a34d269
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ey0t/oHZzr6P11K0dhvU6IFVt26aAjN8RUJQKZ2GxlmQnQ0gI9NDn6DKdcItWZ30kgBQjUBkm/9JAbU5WQx0Z9H+rPzA5DRlVMwUy8R6eFcNcfunW0o76Mtdx/JVIcOP4Mqwz7yg1CrWkyS8B5XXwWLNk/uRGn3Q8I6uEPghTtxeeq13mxOniOE9L97jZ0zDmvJx6xRR7jCXH5/2OZ8Kot1CS7QkP5rr21Xthq76xztWLlHCDum/Gp5CSGycjkKHkGK9/2ag8DsCcZVzFbLwVDpVXZiKd0TTBElsG0FaD/RvvSe6iYf44lVPEie6XqNkd/KIOrvQY51NlIvavwNxEUIm/1gbQkoi5oDlkSXEODqdJj0HaXOPD2Szwiy//HuorrE0b8/SbOK/Ls8j+veGAm54BSf/71S5j4/++VDnehAF7o/tDRvAWD2qazmYrVOBquqvE1Ey3RcD5UNd3CthkUYlU9XMW6SXMIs8+GaB6CP6CagajBir4i1Gppk/II2ewFSrcH5t6IDY9HgJz2BthNl+/bSS46EvZ/1ymo82fIckPUbjVJS1K/EvQk20LVwkS4TGueNqtYGd186bJ98b4Gd0WnPaEM0xLWEwqBQ7g69+gsTs4CZ09k8gTONKEyjoxwqpx4W7nCLUKTZ9KiWw/+H7b9BCF+qLH8L4v0mHR9BiNsQRxO2e7Fzpd8OIM37o
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(376002)(396003)(346002)(136003)(451199018)(46966006)(40470700004)(36840700001)(41300700001)(40480700001)(336012)(4744005)(8936002)(6862004)(6486002)(966005)(5660300002)(40460700003)(47076005)(36860700001)(356005)(2906002)(82740400003)(186003)(82310400005)(478600001)(81166007)(33656002)(316002)(2616005)(6506007)(6512007)(86362001)(53546011)(4326008)(36756003)(26005)(70206006)(70586007)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 17:51:09.7225
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7deba5bf-e7fb-4ce3-08e5-08db2a34da9c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB10195
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Mar 2023 17:51:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178893

T24gMjEgTWFyIDIwMjMsIGF0IDE1OjQwLCBDaGVuIFFpIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnIDxRaS5DaGVuPXdpbmRyaXZlci5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6
DQo+IA0KPiBUaGlzIHJlY2lwZSBwcm92aWRlcyBmaW5kLWRlYnVnaW5mbyB3aGljaCBpcyB1c2Vk
IGJ5IHJwbSwgbW9yZQ0KPiBzcGVjaWZpY2FsbHkgcnBtYnVpbGQuDQo+IA0KPiBSUE0gdXBzdHJl
YW0gcmVtb3ZlZCBmaW5kLWRlYnVnaW5mbyBhbmQgc3dpdGNoZWQgdG8gdXNlIGRlYnVnZWRpdA0K
PiBpbiB0aGUgZm9sbG93aW5nIGNvbW1pdC4NCj4gDQo+ICBodHRwczovL2dpdGh1Yi5jb20vcnBt
LXNvZnR3YXJlLW1hbmFnZW1lbnQvcnBtL2NvbW1pdC8wNGIwODA1YTc1NmNkZDk0NjZmYjlkYzcx
Nzg0NmY1YmYxNTUxOGNjDQo+IA0KPiBXaXRob3V0IGRlYnVnZWRpdCwgcnBtYnVpbGQgZmFpbHMg
dG8gZ2VuZXJhdGUgZGVidWdpbmZvIHBhY2thZ2Ugd2hlbg0KPiAlZGVidWdfcGFja2FnZSBpcyBh
ZGRlZCB0byBzcGVjIGZpbGUuDQoNCk91ciBzcGVjIGZpbGVzIGRvbuKAmXQgZG8gdGhhdCwgc28g
d2h5IHdvdWxkIHRoaXMgYmUgYSBwcm9ibGVtPw0KDQpBcmUgeW91IGJ1aWxkaW5nIOKAnG5hdGl2
ZeKAnSBzcGVjIGZpbGVzIG9uIHRhcmdldD8NCg0KUm9zcw==

