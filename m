Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23CF4EB64D9
	for <webhook@archiver.kernel.org>; Thu, 15 Jun 2023 15:25:12 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.83])
 by mx.groups.io with SMTP id smtpd.web11.21425.1686842705930069658
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jun 2023 08:25:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=4aWK5pDw;
 spf=pass (domain: arm.com, ip: 40.107.21.83, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eypijwgxHK4Hzcm9Zmc7Ias3W7BsfYX4SV5G26VcJy0=;
 b=4aWK5pDwP3U44mXZIT9dhOcqDO9GEqYRAnbAjXIYFzVqr1USHoZen1lNzD3QXMYZs65H1qE+qYwbExKocot8RCo7p/+RLewweoL+wi1HJi+VMRvP7hh23aPfjatShPGpca6gj6/vzIim9qs/JrTSoY9VbHI+3VUP9Pl9B0UI8RQ=
Received: from AS9PR01CA0020.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:540::25) by VI1PR08MB10006.eurprd08.prod.outlook.com
 (2603:10a6:800:1cd::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Thu, 15 Jun
 2023 15:25:00 +0000
Received: from AM7EUR03FT037.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:540:cafe::d3) by AS9PR01CA0020.outlook.office365.com
 (2603:10a6:20b:540::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.25 via Frontend
 Transport; Thu, 15 Jun 2023 15:25:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT037.mail.protection.outlook.com (100.127.140.225) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6500.25 via Frontend Transport; Thu, 15 Jun 2023 15:25:00 +0000
Received: ("Tessian outbound 3a01b65b5aad:v136"); Thu, 15 Jun 2023 15:24:59 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3615050ec2ad889a
X-CR-MTA-TID: 64aa7808
Received: from 71fbc2345874.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id CBCC897F-7FD9-4993-8181-65C1CD421E8D.1;
	Thu, 15 Jun 2023 15:24:52 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 71fbc2345874.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 15 Jun 2023 15:24:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J+ua86r3gXBt91Ds/PM+j5aukJ5lnT2K0JG7msCVMg8lvp/lz6D1QVGsbX1fQlZNa6XauXfqOXY8DDZcLdN7MduVkIGIvLKIYaiDQ++1FPP1T7qqAnB9yCdeT0nlAdmL6FHYAZlUbYvwVqxh3HNQHgeNzR37msXg6QGM5prPB+UYj4SvTfXzydHbmlDSe8DBAY7+fAMto2Aic++RkV/vZiSRWAqytARBWWfZwb9760EcKAMHhWRbfeTL1QSo8LjRMSvRr9yLqN6SJHm5WmVltRNpdHu7Xu+ayWDcCMU+DXszDybWanxt1hLFegC7C8fB1cg4U0ZsKTmxGT7MvCDZOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eypijwgxHK4Hzcm9Zmc7Ias3W7BsfYX4SV5G26VcJy0=;
 b=Ds2ZJomKrxyE/d2jAFWr7bjxSaGYGTRLU8lPlCQMdqRoia+svB6NBH05sP7Oh6Vjo9psZeNa1RDv2kzbeXdzPIjpbcm09YenoemDP0UOpCNltHBda+tflTMItms+GniO7KSnZwFnqO6sD61SI4Rz7mskj0k7OLl5/cjx1me8eAg7Bgo4DjKizQJhWSa+MpNkXUMA6zSWuWuQq+omlbxA7kwOBDYqoEkkGb6kZwL5ParJmk+tr8v2N9A5CruY+2TaJUXh+Jix9SkSRLX5yOLWqb8JVN+t84jwIBg89NFzhb2DzEIfJYbZFcM+WLjLWxSyBRvunMFBfzxVLr5Xnvm/dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eypijwgxHK4Hzcm9Zmc7Ias3W7BsfYX4SV5G26VcJy0=;
 b=4aWK5pDwP3U44mXZIT9dhOcqDO9GEqYRAnbAjXIYFzVqr1USHoZen1lNzD3QXMYZs65H1qE+qYwbExKocot8RCo7p/+RLewweoL+wi1HJi+VMRvP7hh23aPfjatShPGpca6gj6/vzIim9qs/JrTSoY9VbHI+3VUP9Pl9B0UI8RQ=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GV1PR08MB7332.eurprd08.prod.outlook.com (2603:10a6:150:1f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.37; Thu, 15 Jun
 2023 15:24:46 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e%7]) with mapi id 15.20.6455.045; Thu, 15 Jun 2023
 15:24:46 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Ross Burton <Ross.Burton@arm.com>
CC: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>, OE-core
	<openembedded-core@lists.openembedded.org>, Alexander Kanavin
	<alex@linutronix.de>
Subject: Re: [OE-core] [PATCH 06/55] sysfsutils: update 2.1.0 -> 2.1.1
Thread-Topic: [OE-core] [PATCH 06/55] sysfsutils: update 2.1.0 -> 2.1.1
Thread-Index: AQHZnqLbSEeqPyIth0ydjQoV1QhOfq+L+cEAgAAD9QA=
Date: Thu, 15 Jun 2023 15:24:46 +0000
Message-ID: <E0C698D2-5E0C-4FC7-B44A-98617EEFD06C@arm.com>
References: <20230614092918.4065570-1-alex@linutronix.de>
 <20230614092918.4065570-6-alex@linutronix.de>
 <9BD4E811-53FB-4468-99FF-FC6E50FE54C6@arm.com>
In-Reply-To: <9BD4E811-53FB-4468-99FF-FC6E50FE54C6@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GV1PR08MB7332:EE_|AM7EUR03FT037:EE_|VI1PR08MB10006:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cc3b7ad-5dd7-49b6-e0f3-08db6db4af07
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 AlyWjPaDGr1XW/0bqGOJB/DiyAFnjOSEVYkGlwAknle/+7abZaG1klvE57Ewr2fRvvj43w27TzH28bXIfdZDwKgNtxmyF3tZVDb75onWDF5bIw0rmkUfgD7mYOiP9lDaMHNl9i5h9Tx+X+opKFPhxg7ij9ms5n3oW9jcdmSRZoZDkXBBS7Kz71FEnBzVHx4tvSpXDomdvtk1f1BvBfJ7AN8TVYpIS/Mb2qitcADwbOVDbi5aepfD5vDziqsSSc9v4pYpvLS9H5dATrbu/jaTw69aM5o6uYDsBMmvbjOFuz9A+LvpSZNKvUi4Zt2mnj0dRdLebP4ee9g7r0F+U4aSHQucA0PHA1SzH2a2AiEBghx2g9lOqivqmBg0xxpmJwPhm++0uZ6EPgpD5jklpIdeBOKMcqbwM+FVr78ykDB/MiI3uBHNnOpZq6tV65C9m2PssWqjdmjYjvTS9MG4dDHN+NvP3qsnISLwTnotFwJ+j/YqOiBJFTh2fAbKPMleE4lKF5bVUKewBmy6LWDaeAt+4pCIj+AAmEVdWeLo94M8/kniV3imnRmESEkgYNCDrbDUX6J/uip/PeXdbXpL89wYv3sxlyNH368ncawO3rH/fLIPzphPp7V9MpO/KyXFDF835lTW7jFORdjKrLJpde2D1g==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(366004)(396003)(136003)(376002)(451199021)(6862004)(5660300002)(37006003)(54906003)(71200400001)(41300700001)(8676002)(66446008)(64756008)(6486002)(66556008)(66476007)(316002)(8936002)(2906002)(186003)(4744005)(15650500001)(478600001)(4326008)(76116006)(91956017)(66946007)(83380400001)(6200100001)(38100700002)(122000001)(86362001)(38070700005)(33656002)(36756003)(6512007)(53546011)(6506007)(2616005)(26005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <F70905EE2923724CB5135EE79A52F432@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7332
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	f6d4a364-5ccc-4459-bbae-08db6db4a6fd
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	t+ZSfVRxKVY7ZqCffvGWePPznqWjOCCpJPx3V0EXDjnKlKbXaWqxAi7nzDMZFxybpjk69Lj9VwZ5gEbpIUe1913eXT79oxgIhySGxGGaLKA0H9zVe6N2kyyOLJeDmhP3TQMrgPcx4DH/XB82Q2qKPYlj/Qr/dRcTCgSlmqvAJMwO778+apMzGS01H2q6VWXM+WBrL6aTddnL3Wp0DVVmDlLhnsjAZSjqn1+wrntc/0wfSC4w+bdxsBZLJOVtgstLI7sgoSkppxbHpi1SicY9oqsJPJ/JImMa6hN2OIcc+VIygvgoC9Q3XMNYKxoaEsPd7abqhADsGAezouelntvORi/RUsmmctY86nZ5Gex7WlV21MglLuH/z1QxTpvrpqaN7qxilrYDT28hHww8WoP5ux0OvM8Bb/rJ2TbAa1zE4Df3Yba9TNSYWlSF7vL9SRc3zDBZFxL0+CYYbPC1AZilkncoOaJSLK3cvOXJt2gxTdGOHuNmdjIJ29VgHuBXyW0iVbAR1mjHe3mI+DJvjF7dgKW6hs3XO44YmIx/r9Bijbwy6Ny8P7rajuWgyXerDtYLjwQEd6eAigQrUbiWkOK/vVgPlWflc4RmnhK0Qn3yilGlKW6rctg9G8dxdpsy+WoZUlxG2N1QcJHBk6AdrWOXdNBIBNx0UA4mMk//xo+NcKLbEb75JMJ+GVFBsB4H+HeKtnQvpBxLUdNv1YtuVASgyDOVlTY7sZNHbmiwdIcohW2H7Bp/PGUtEs+fCMbK8FUJ
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(136003)(346002)(39860400002)(451199021)(36840700001)(40470700004)(46966006)(41300700001)(6200100001)(316002)(478600001)(15650500001)(6862004)(70206006)(33656002)(81166007)(8936002)(356005)(40480700001)(86362001)(82740400003)(4744005)(5660300002)(40460700003)(2906002)(70586007)(54906003)(36756003)(4326008)(47076005)(2616005)(37006003)(53546011)(36860700001)(6486002)(8676002)(336012)(82310400005)(107886003)(6506007)(186003)(6512007)(26005)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2023 15:25:00.0502
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cc3b7ad-5dd7-49b6-e0f3-08db6db4af07
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB10006
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Jun 2023 15:25:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182865

T24gMTUgSnVuIDIwMjMsIGF0IDE2OjEwLCBSb3NzIEJ1cnRvbiB2aWEgbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZyA8cm9zcy5idXJ0b249YXJtLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90
ZToNCj4gDQo+IE9uIDE0IEp1biAyMDIzLCBhdCAxMDoyOCwgQWxleGFuZGVyIEthbmF2aW4gdmlh
IGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgPGFsZXgua2FuYXZpbj1nbWFpbC5jb21AbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+PiANCj4+IERyb3AgYWxsIHBhdGNoZXMsIGFzIGlzc3Vl
cyBhcmUgYWxsIGZpeGVkIHVwc3RyZWFtLg0KPj4gDQo+PiBMaWNlbnNlLVVwZGF0ZTogY2xhcmlm
aWNhdGlvbiB0aGF0IEdQTCBhcHBsaWVzIHRvIGFsbCBleGVjdXRhYmxlcw0KPj4gKG5vdCBqdXN0
IHRlc3QpLCBmb3JtYXR0aW5nLg0KPiANCj4gVGhpcyBkcm9wcyB0aGUgcGtnY29uZmlnIGZpbGUg
aW50byAvbGliL3BrZ2NvbmZpZywgd2hpY2ggZG9lc27igJl0IGxvb2sgcmlnaHQuDQoNClRoaXMg
aXMgYmVjYXVzZSB0aGUgcmVjaXBlIHNldHMgbGliZGlyPSRiYXNlX2xpYmRpciwgZm9yIGhpc3Rv
cmljYWwgcmVhc29ucyB0aGF0IHdlIGNhbiBpZ25vcmVbMV0uICBEZWxldGUgdGhhdCBsaW5lLg0K
DQpbMV0gcGNtY2lhdXRpbHMgYWxzbyBwdXRzIHN0dWZmIGludG8gL2JpbiBvciAvbGliIGFuZCB3
YXMgbGlua2luZyB0byBzeXNmc3V0aWxzLiAgcGNtY2lhdXRpbHMgaXMgbm93IG91dHNpZGUgb2Yg
Y29yZSBhbmQgbGV0cyBiZSBob25lc3QsIGRlYWQsIHNvIHRoaXMgaXMgbW9vdC4=

