Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0BA9C77B7A
	for <webhook@archiver.kernel.org>; Fri, 19 May 2023 09:49:27 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.68])
 by mx.groups.io with SMTP id smtpd.web10.21872.1684489762953870748
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 May 2023 02:49:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=vL4r2/AA;
 spf=pass (domain: arm.com, ip: 40.107.105.68, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y5cfQyEkTy1JCxhD7DcgMyPf7oCwSDvk+xxdk0pMHjQ=;
 b=vL4r2/AAxoXGQNrTJipEmLh8CFlE+ldIoSUjX8ZCCJmufE8xM81DiYsSQpUWausHmtIHxwgec+iG5aBemIOf3xAmOs9CMgrryJcHZ2EOPPXCz0A69n+qvtGu45XuYul9HX82X/O4KjEswEwq6uoLOVTUZFkObMrUTz956PNPfak=
Received: from DB6PR07CA0185.eurprd07.prod.outlook.com (2603:10a6:6:42::15) by
 GV1PR08MB7937.eurprd08.prod.outlook.com (2603:10a6:150:8e::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6411.19; Fri, 19 May 2023 09:49:10 +0000
Received: from DBAEUR03FT039.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:42:cafe::1d) by DB6PR07CA0185.outlook.office365.com
 (2603:10a6:6:42::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.6 via Frontend
 Transport; Fri, 19 May 2023 09:49:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT039.mail.protection.outlook.com (100.127.142.225) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.7 via Frontend Transport; Fri, 19 May 2023 09:49:10 +0000
Received: ("Tessian outbound 99a3040377ca:v136"); Fri, 19 May 2023 09:49:10 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3b57460b98f4759f
X-CR-MTA-TID: 64aa7808
Received: from 4e3a9e524995.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 9E97B8B6-9D13-42FF-80FF-0FC04EF2B2D9.1;
	Fri, 19 May 2023 09:49:03 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4e3a9e524995.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 19 May 2023 09:49:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MFuc7RpMmp0RsNv4+GEJmqT3TBIz+5nurBi2JCKzzi5IR3pd0y4q1QvFZLfMoaJDa1ek/aYd4y1EivT8+DnmegpiqAkOdwflVijw5HOWKpGBI4ooegeP9cv5VhEArDBaglkdZBiZqTwp9khVbpnce3Q/vl0plhapSqk2uUDY8O8snwLfrkSCI/x/7fyuV7SxmbklvQdZGTeyO7DEjWtQKNAcIqfjv7imr1P5ulHHXyV2wIWXOo/RQchkuokWLYaloE4x2F13vLlF2FC08U70zg7CdlHATvfYT/tgRB+tChcKjyoPAKlVTV6kma4/UqBQKBCp39KpaB84GMiIZfbpmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y5cfQyEkTy1JCxhD7DcgMyPf7oCwSDvk+xxdk0pMHjQ=;
 b=CTcKWH2IHS1Vqw0k1/p3l0UO0kK7bMNNizOa3MiyQHDvyxh3k63252MhSwirs8IvFJS8t0mAe1xcEP6n7ZIlGkG0Z127xS9g0FWPyj2zf09M2zZ0JmT+YpTCn18rf/oNm6UKhp5x1zmEUWjhZkcxxMHQQ9J8ss7hDn6REf81AyKhYkqGMNE8SLyuuE9PsWm4B3qasyRKNjqj+9pkcGxmwTa2D/8+CvkNwD+DrnG8r3GGus7WTmeH3POzN3asY7oxaFulvUpcJtucd8W79A/03buexXzSwmFgL2/xZVuScG4+FoLJIuu7i1wWodaZ8al8yc6qcJ2i6DsN1hj0whvaVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y5cfQyEkTy1JCxhD7DcgMyPf7oCwSDvk+xxdk0pMHjQ=;
 b=vL4r2/AAxoXGQNrTJipEmLh8CFlE+ldIoSUjX8ZCCJmufE8xM81DiYsSQpUWausHmtIHxwgec+iG5aBemIOf3xAmOs9CMgrryJcHZ2EOPPXCz0A69n+qvtGu45XuYul9HX82X/O4KjEswEwq6uoLOVTUZFkObMrUTz956PNPfak=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB9PR08MB7697.eurprd08.prod.outlook.com (2603:10a6:10:390::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.21; Fri, 19 May
 2023 09:48:59 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e%7]) with mapi id 15.20.6411.021; Fri, 19 May 2023
 09:48:58 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "Mittal, Anuj" <anuj.mittal@intel.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 5/5] glib-networking: upgrade 2.74.0 -> 2.76.0
Thread-Topic: [OE-core] [PATCH 5/5] glib-networking: upgrade 2.74.0 -> 2.76.0
Thread-Index: AQHZiTD0JXYB1I9w8U2rMSfiu/v6fK9f8NcAgADWDACAAJTyAA==
Date: Fri, 19 May 2023 09:48:58 +0000
Message-ID: <FDB1C7E1-8DCC-49D2-A55D-1BBBDD116131@arm.com>
References: <20230518023118.16406-1-anuj.mittal@intel.com>
 <20230518023118.16406-5-anuj.mittal@intel.com>
 <3110A7DF-18F5-45CF-A414-B14F1BC67F34@arm.com>
 <90bcfb7f43f346b2f82bbe7af166b7b4f48f7bfa.camel@intel.com>
In-Reply-To: <90bcfb7f43f346b2f82bbe7af166b7b4f48f7bfa.camel@intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB9PR08MB7697:EE_|DBAEUR03FT039:EE_|GV1PR08MB7937:EE_
X-MS-Office365-Filtering-Correlation-Id: 79ec4182-d57f-4317-7dac-08db584e4ba7
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 WmVY6yEdKh6uM5IGdmjXw7gR0U/xWPer7fnYeUxtvpse7hgzdW4eC4i3AODXJrKQVF/wmXDjkEujkM4zIxwgECN5ZrxO3KdEEGs6SW8VhjGOUiNhy+r4vY1ZxmAXoSIGUmq6o7Dv6CxuBoxP7UUyg8M+dVQQAQ1PM6TRJCw13V8VYKyk429aN16tR0+F0MDvFCaBmwsi655AJFwv7J2ZcqNTZJGqXUQkE3uko9Ku9isR93ZZmV6NERKXamwtWtApSvppXc4YmsNuoQiz2oJJ/j00NT/GZNJPVB/IIiUOXR6nxMwKz5o4+EBYJPu2z0Ub/WbhcABj2MbJO9zUvQZW8M1clUf2GZgV3xdJC48j9Ahw8C/u1wj+3U87C4tTlH5v6Clco/t1QGDBNzQ+eQeNI24uQ1PVLB53HIX3oP0/jGzcfLdb7EExD43I3NfDweoEDJ/AZmQlb+Wuj73SpbO2Tn450BPPfKXiUMONfB1YBUALe/FiVZvrMNTP0BRmEVdAdQ5utX35GIODS+OQmHDUW1ZwZi0yjS1z7zQUER4E/z0wYoXlwdoGdi5bXr3op9sTJq1vcAmdXiGNaddErkrBCF/oF53ZptviDXKdmLSDdP+3CK9TsI4wPmGzMKIS3dKZydAT1fA08YtbEe61grCWiw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(136003)(376002)(346002)(39860400002)(451199021)(966005)(76116006)(6916009)(66946007)(66476007)(66446008)(66556008)(64756008)(478600001)(4326008)(91956017)(316002)(86362001)(38070700005)(33656002)(36756003)(83380400001)(6506007)(26005)(6512007)(186003)(2616005)(53546011)(5660300002)(41300700001)(8676002)(8936002)(4744005)(2906002)(71200400001)(6486002)(122000001)(38100700002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <67F3F8D712F8EF44ACDA03576A883102@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7697
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	4b479ccb-2350-4519-03ea-08db584e44ba
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	r5MnFI61GJBf3s9Q+yRXuBUFCpwKGwh6k4YuMz7qCYBjX+gEvMKpMdDOpI6nv6A+/1ZWYDK4X1zz9zZdx4SpEBX1rEDC1cBisnp+AYGCJSMZxO7ZFgKOvOhtK/YKjN6D98YdijzxCP76lmouRmObj4kbQiuFU43Rst4SmcH6zlov1Z50t5e+a9D83UOi7a4uu5RHo/l0eOyFka5S2up7jeCcyUNuovOxzAs+F+hzsVS6Xr8/yd4McPY1S6zUIFiJDpi4xcMlDZaFXdHm7Nl2yRXD8rLvbrkKoRsNxzideSxvWhmQanwsV5fsP1FgJw55Nssv0E17UUzfy1/gaNrW/DMfyv6tCoyg4OW9weEWyusATPe/4dIMd/SbRESqMe3OYOiFHFbUyiedANuY0GypSFbUArMzDLrFBTGk256SFmRNMxMwyqDktOKX81opARVfuqeBsEpxNr9mo1r9jMR6bw/2p0fbyq15DYx9Pyk+h8s+WSx4d74fH5z8oqE3IwAjZVYTHnbtjcVAy8MHDvv044gcs7UOHBp0DqE2W5aXqCEbYDMhyIINOzACeFWhb03lGOlhWosvLn+OSnWiOBjJKvntwtIQgy16oSglJNT6SMDDOkkr6c+YzWKRyB15Y45F5V+cTdILCpIoiNGt8l1SKPOE4IPWM9360bNE+8lObXgljb4NeoRnI66vrWg8p03EQb5WbBgCISLxpORTJ/mV2LVFoF6SQqWT/ag3wySkaSk=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(39860400002)(136003)(396003)(451199021)(46966006)(36840700001)(40470700004)(86362001)(33656002)(4326008)(36756003)(316002)(478600001)(70206006)(70586007)(966005)(356005)(8936002)(40480700001)(82310400005)(8676002)(6862004)(2906002)(6486002)(82740400003)(5660300002)(81166007)(41300700001)(336012)(36860700001)(53546011)(186003)(6506007)(47076005)(83380400001)(6512007)(26005)(2616005)(40460700003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2023 09:49:10.2862
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 79ec4182-d57f-4317-7dac-08db584e4ba7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7937
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 May 2023 09:49:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181541

T24gMTkgTWF5IDIwMjMsIGF0IDAxOjU1LCBNaXR0YWwsIEFudWogPGFudWoubWl0dGFsQGludGVs
LmNvbT4gd3JvdGU6DQo+IA0KPiBPbiBUaHUsIDIwMjMtMDUtMTggYXQgMTI6MDkgKzAwMDAsIFJv
c3MgQnVydG9uIHdyb3RlOg0KPj4gT24gMTggTWF5IDIwMjMsIGF0IDAzOjMxLCBBbnVqIE1pdHRh
bCB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPj4gPGFudWoubWl0dGFsPWludGVsLmNvbUBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90ZToNCj4+PiByZW5hbWUgbWV0YS9yZWNpcGVzLWNv
cmUvZ2xpYi1uZXR3b3JraW5nL3tnbGliLW5ldHdvcmtpbmdfMi43NC4wLmJiDQo+Pj4gPT4gZ2xp
Yi1uZXR3b3JraW5nXzIuNzYuMC5iYn0gKDk1JSkNCj4+IA0KPj4gcGFja2FnZXMvY29ydGV4YTU3
LXBva3ktbGludXgvZ2xpYi1uZXR3b3JraW5nL2dsaWItbmV0d29ya2luZzoNCj4+IEZJTEVMSVNU
OiByZW1vdmVkICIvdXNyL2xpYi9naW8vbW9kdWxlcy9saWJnaW9lbnZpcm9ubWVudHByb3h5LnNv
4oCdDQo+PiANCj4+IFVwc3RyZWFtIGNoYW5nZWQgdGhlIGZlYXR1cmVzIHF1aXRlIGRyYW1hdGlj
YWxseSwgbHVja2lseSBJIGhhdmUgYQ0KPj4gc2VyaWVzIHRvIGhhbmQgdG8gZml4IHRoaXMgdGhh
dCBJIGNhbiBmaW5pc2ggdG9kYXkuDQo+PiANCj4gDQo+IFRoYW5rcyBhIGxvdCBSb3NzLiBJIGhh
ZCBub3RpY2VkIHRoaXMgaW4gYnVpbGRoaXN0b3J5LWRpZmYgYW5kIHRob3VnaHQNCj4gdGhhdCB5
b3VyIGNoYW5nZXMgaW4gbWFzdGVyLW5leHQgd291bGQgYmUgc3VmZmljaWVudCB0byByZXNvbHZl
IHRoaXMuDQo+IA0KPiBodHRwczovL2dpdC55b2N0b3Byb2plY3Qub3JnL3Bva3ktY29udHJpYi9j
b21taXQvP2g9YWJlbGxvbmkvbWFzdGVyLW5leHQmaWQ9NTM0NTgwYzFiMmZmNTE1NGIxMzk4ZTVh
ODE5ZTEzZTZjYmZlZjdkYw0KPiANCj4gRG8geW91IGhhdmUgb3RoZXIgY2hhbmdlcyBhcyB3ZWxs
Pw0KDQpZZXMsIHRob3NlIGZpeCB0aGUgaXNzdWUgYW55d2F5LCBhcG9sb2dpZXMuICBHb2luZyBw
YXRjaC1ibGluZCA6KQ0KDQpSb3Nz

