Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86FC5ECAAA1
	for <webhook@archiver.kernel.org>; Fri, 28 Oct 2022 12:23:26 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.51])
 by mx.groups.io with SMTP id smtpd.web12.5566.1666959804990964337
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Oct 2022 05:23:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=2qXrCKNw;
 spf=pass (domain: arm.com, ip: 40.107.20.51, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=PjL4hZl4dcwXmPDaBOLJrnxe0CGpmMm3EWyYNVbkRCnv9n8lM/lnvP49s/MIVuQz7x86j3k0BwCGLMLZuejvvdXKC0G0Yh/6HEjoCRJkyjhQ2/xI7hvh5x3KxSFwDG/KatDmI50KYh3JgdcxqYUe9OA0SvR5dbFXIvbghWRNbpiTTLYekf6cPr9MepDz1lAOn905qrkf1ddevgBOni45AvJdNPsQ8Snb0EBaiJKLf9Bcv2cBtftdUzKUTDDUkuzXr2CIR1IHOLmfqPvKqjr5isdOYb5dVQWZXuLetO48EeTU68kEj6RGfV0Mly3yKr6QPtuqsDDfRP503z+TLbX6hg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=igt0t6lSt95dh0CcVSQR6LLOsOZnWv9vrbCFbgzyTSc=;
 b=LMh+lFAsbOCxnCPfPJ4/3vO5NJS/YDl8jWiU/n3tMW3QFsvnIZUa5I79yo0FTnp4ePnBMKUepGpjbgYSExz0yfb768Yq6yQjsiy59kz47FMSktrBDpK+9uL6QUI416fIEA+q+mc+OOCZtL9Y/bmz9ncMV8vnyyJx1OxtlECNIMT8o6ofkKsIGQDYNcEqrml+sVdItYoL5YVZenJqUhcrxHv/3rPHauzBSGSpF26HmYknc2kqa672Xspi++Qkbgy0vvP6F4gO+6Q1OnkA4N4DFwIPymvRGTWYeLo0rX0OF+wDWqc9k/HPcHcjVxXvmGRxJYq2Q7/SHZ/lywohHJv6UA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=igt0t6lSt95dh0CcVSQR6LLOsOZnWv9vrbCFbgzyTSc=;
 b=2qXrCKNwjR9gtRJFxcc/JOG+j4dqOAg68eyQtYW3h0QQ55OnxJknBJtoPb8tIb5Qc6JuyTx90MuwyoBh4/+KNEbIp7zy/nUA3GkllmIwL1Xv737xy4EIfcRKoTHe7L9EKVS40KGRqzTUrNAbvePkBnvK3LA4eTdsWNEHkh/sd9o=
Received: from AS9PR06CA0128.eurprd06.prod.outlook.com (2603:10a6:20b:467::23)
 by PA4PR08MB5981.eurprd08.prod.outlook.com (2603:10a6:102:e2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15; Fri, 28 Oct
 2022 12:23:16 +0000
Received: from AM7EUR03FT016.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:467:cafe::35) by AS9PR06CA0128.outlook.office365.com
 (2603:10a6:20b:467::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15 via Frontend
 Transport; Fri, 28 Oct 2022 12:23:16 +0000
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
 15.20.5769.14 via Frontend Transport; Fri, 28 Oct 2022 12:23:15 +0000
Received: ("Tessian outbound 0800d254cb3b:v130"); Fri, 28 Oct 2022 12:23:15 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7d7f542138591f6d
X-CR-MTA-TID: 64aa7808
Received: from 2bc0e8d60a58.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 4E39A0C2-3C67-4016-9A5E-BA1D02C3311E.1;
	Fri, 28 Oct 2022 12:23:09 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2bc0e8d60a58.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 28 Oct 2022 12:23:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WJ7l8V71tpgvsTT4CfNJ8ZD3EP6erSEKy08NOtm+NaK5BSrL6gc2kwuuHCDfmUNN1/QlNGUCYdvJabjRWAGe4eGfqz2qbY5241RQ07jqS4M+HJB5zo6vlPliq6lvmD6eGCuRS59SuZk3D3QiEyxBMftynwWrCa3WISRqJPqqkV+HL0I6Dkp2RMjVfplWBCwMxkO/5c9NILCl1k2pXUh31qxu/xhr8p/LMh3kZWAcaTQPQb5OQEWjVEYRWrG+3irt8piCdunmHH9Wc6SqkbJPDelYvfMO5r0fNZDrpC5X6e7TPlD1jUbAo7inRrIePpdhsOvrab7YU0Safn5ixl/MtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=igt0t6lSt95dh0CcVSQR6LLOsOZnWv9vrbCFbgzyTSc=;
 b=gQx2GUtLvYgDZfVJiv6YJAxwN8gZbmVztXDa19at+2x1yuWjCNbahauXmPY/7DDn/2ifRKoYVrIFeSx26GM4qeZN1zwUgKX+AgOt66FQ2+fhT9eabawAr7HuGuG3Blql3MZ2EcTv7JDSQrpilS6LyxZKRDcPURcuzQSJKO7GvsWJlWpHVI3W0Tw+KBHc4sjdw68AqhKb5nZzn73emR3mJbXD2Q4opGDDUiWqaaQ7ODhzMy9LdYp/cvcH9CWBshGnqlW6ZaCb2HxdN8ujCIa2eVJrSMRpBLjPAIFgoWXfipSL/s/W3heL7oLGEVztD01L9DnMIpiqIQFKjIYObkE1tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=igt0t6lSt95dh0CcVSQR6LLOsOZnWv9vrbCFbgzyTSc=;
 b=2qXrCKNwjR9gtRJFxcc/JOG+j4dqOAg68eyQtYW3h0QQ55OnxJknBJtoPb8tIb5Qc6JuyTx90MuwyoBh4/+KNEbIp7zy/nUA3GkllmIwL1Xv737xy4EIfcRKoTHe7L9EKVS40KGRqzTUrNAbvePkBnvK3LA4eTdsWNEHkh/sd9o=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS2PR08MB9870.eurprd08.prod.outlook.com (2603:10a6:20b:595::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15; Fri, 28 Oct
 2022 12:23:04 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::52da:ac9d:e42d:8cc]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::52da:ac9d:e42d:8cc%5]) with mapi id 15.20.5769.014; Fri, 28 Oct 2022
 12:23:04 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "yanxk.fnst@fujitsu.com" <yanxk.fnst@fujitsu.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "fnstml-fujitsuten@fujitsu.com"
	<fnstml-fujitsuten@fujitsu.com>
Subject: Re: [OE-core] [meta-oe][PATCH V2] bc: add ptest
Thread-Topic: [OE-core] [meta-oe][PATCH V2] bc: add ptest
Thread-Index: AQHY6Etzyk+o361WtUG1ojsZjlNJd64jv3aA
Date: Fri, 28 Oct 2022 12:23:04 +0000
Message-ID: <64F4B73C-DE35-4325-83C1-3E8F5BBDEAB9@arm.com>
References: <1666686311-4123-1-git-send-email-yanxk.fnst@fujitsu.com>
In-Reply-To: <1666686311-4123-1-git-send-email-yanxk.fnst@fujitsu.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS2PR08MB9870:EE_|AM7EUR03FT016:EE_|PA4PR08MB5981:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d088632-90f3-4ae4-0511-08dab8df309b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 mfpYrM/ZwPsxVHVBH+Q7iD8SfAEuZh3TkiTSB7/A39JYhmMwk6cCarzGMFchpf/2iRI/j2KeVR+pq6BarojB0X+IAWvjjNH5i1s2Xt4VkU5+s+foblzEp5eaDfREdl6kY8n4Isq6fzfIlMOCI3MLLy3F434gty5SkXt06qACd1dIrXoppMEVm5he9P4hnfKGP2aSkPXuNukAeaJ+Sx1XVj9GRlkaV4Y+EyKYxFIt4UelKQDwZ0mLMbeaThoa1ycCBLkpK8NW1DUK02WwhbCeV3I1sSqvGwHHJize8OIlx7/mJWuEOrkRLWfV/779Y/xsdwwlLSbEiWALXH5uDx3/ytREc/fIHpc32W6qDhIZtMciUuWHluK++eU58KrLt1BB7Qk10b+OpV+EueAyzcQSoVOc/crcIjlr7Csd+cg2EqRPsBkj6mGLMj4RYWlDxjYsMQOZlta/n2RtI1QG/dCVinBJKyO1qeB3KAjB7zP63n0HDLLlejlGh1mmxxNU5O62L4Zv68LJqesxjHac2lDF27ucc5XlpXJtDv1zFRfmzKTXB3MPLPEyShPSwudPF4O+UaqvZSoUxstO38M6ombaxKUhAi9rkWzl4KFyp2skEtGD7mTJYc1c4wvNoxl9P8SRrGujZvRUDpUM5Awetd4w0fcCRDDaulDJOh3eh60pqc7x4ooU1w/Uxb8hnfOx4hWZTeFMLJ1czgmWgdswSgXP/HMserDQtTP/S6BUDCDt+HZTrutcwVHgN72tfcY6aEKh5healxW9CO/dsM530Fg5yFZW2W2ZkaTWP81fBBjif0o=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(346002)(376002)(366004)(396003)(451199015)(41300700001)(5660300002)(8936002)(53546011)(6506007)(2906002)(54906003)(76116006)(91956017)(64756008)(66446008)(8676002)(66556008)(66476007)(66946007)(36756003)(33656002)(38100700002)(122000001)(4326008)(316002)(6916009)(86362001)(38070700005)(478600001)(6512007)(2616005)(26005)(186003)(6486002)(71200400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <2ADBC98603231D4393384517D8DD9DD0@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9870
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	2aa8ab97-eeae-48f0-afb1-08dab8df29da
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tRA2UJGgXBzNrisBhXh2A0jA8clY+Wo2x/V3jwKjBtI/ezbi7aUBJs4QSsCdyUxzo1Msdo0e5MBmsX1NAio95RswOLOu6oVMWAqEamCU2gzXsKi8k0W+LmYG55W/WDWBg883kjWutGqGfpaKlG4nn1AeyyU+TMD0eJ8sinhFQNB480dvTz4eqQdoIZ1/tuJ+P2zBnGojHjfbreTBNRg52HBzoxtnAkT/pGjI5vJ2z1yeMN6xXVg+/vEPcG07YaOhqQQdxwhI1R8JK9V/E6iYZdRDsljYYGF9BWbGKcs+6c6e6BtS3hZ+K6DF6GZypRIKPZInq3DCsbTOCWl8GjkUbZkSZK8HtYYqu/KTG8XMzurnim62ulQUsALw9QGGtlRFv4tR0Y4QjOGsMINyRX5UyiOZr0GgX4840G/iH/jgO9Zprk3UsZzV/VsI1FIEPrttiWbsKxihejQ3N8/0AjHBqAYzn3EcT8nOtf24REmZDd6/oFMlSdhkkrlz61KEKGTXAHe+ugjYF+OLKhExMpGflm/PegZEvVY7DmHYD+3e46/A2RpxkQ+x12WjXBc6cn49DK29HF65jfzVj5I5/PfHmiwhkLkDCRtjCJkmYranyPs+SKOVyjGOLXWFF/m68Z15fqUon0pfnU3khC3G93wUV+AGJ0or0ahneL9ixv/9U26wY9zOYg2oS1S1iSspzDmJMTJRFwDBYa1DV+OmmbPEnsB6+iyY44uiqtFc6UNeyx9NTfpNHkg5u5gcDOzvNJshGWmipuMjntDezAIbLRpNAQ==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(376002)(346002)(136003)(451199015)(36840700001)(46966006)(40470700004)(356005)(81166007)(40480700001)(82740400003)(86362001)(33656002)(36756003)(40460700003)(2906002)(6486002)(107886003)(478600001)(70206006)(4326008)(8676002)(6862004)(8936002)(70586007)(41300700001)(5660300002)(54906003)(82310400005)(2616005)(36860700001)(316002)(53546011)(186003)(26005)(6512007)(336012)(6506007)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2022 12:23:15.8561
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d088632-90f3-4ae4-0511-08dab8df309b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5981
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Oct 2022 12:23:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172252

T24gMjUgT2N0IDIwMjIsIGF0IDA5OjI1LCBZYW4gWGluIEt1YW4gdmlhIGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcgPHlhbnhrLmZuc3Q9ZnVqaXRzdS5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4g
d3JvdGU6DQo+IEBAIC0xMDAsNiArMTAwLDcgQEAgUFRFU1RTX1NMT1cgPSAiXA0KPiAgICAgdGNs
LXB0ZXN0IFwNCj4gICAgIHV0aWwtbGludXgtcHRlc3QgXA0KPiAgICAgdmFsZ3JpbmQtcHRlc3Qg
XA0KPiArICAgIGJjLXB0ZXN0IFwNCj4gIg0KDQpJcyB0aGlzIHJlYWxseSBhIHNsb3cgdGVzdD8N
Cg0KPiArKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvYmMvYmMvMDAwMS1wdGVzdC1vbmx5LXVz
ZS1iYy1pbi10aGUtc3lzdGVtLnBhdGNoDQo+IEBAIC0wLDAgKzEsMzQgQEANCj4gK0Zyb20gYTdh
MTliYWYwN2NkZTNlYWY4ZjBjMDA3ZmVhNDdmMmM0NTQ3NTg3NCBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDENCj4gK0Zyb206IFlhbiBYaW5rdWFuIDx5YW54ay5mbnN0QGZ1aml0c3UuY29tPg0KPiAr
RGF0ZTogTW9uLCAyNCBPY3QgMjAyMiAxNjowODozNyArMDgwMA0KPiArU3ViamVjdDogW1BBVENI
XSBwdGVzdDogb25seSB1c2UgYmMgaW4gdGhlIHN5c3RlbQ0KPiArDQo+ICt1c2UgYmMgaW4gdGhl
IHN5c3RlbSB0byBkbyBwdGVzdC4NCj4gKw0KPiArVXBzdHJlYW0tU3RhdHVzOiBQZW5kaW5nDQoN
ClRoaXMgaXMgdmVyeSBJbmFwcHJvcHJpYXRlLCBhcyB3ZSBkb27igJl0IHdhbnQgdG8gc2VuZCBp
dCB1cHN0cmVhbS4NCg0KPiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2JjL2Jj
L3J1bi1wdGVzdCBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9iYy9iYy9ydW4tcHRlc3QNCj4gbmV3
IGZpbGUgbW9kZSAxMDA2NDQNCj4gaW5kZXggMDAwMDAwMDAwMC4uN2UzN2U5ZWYwMQ0KPiAtLS0g
L2Rldi9udWxsDQo+ICsrKyBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9iYy9iYy9ydW4tcHRlc3QN
Cj4gQEAgLTAsMCArMSw4IEBADQo+ICsjIS9iaW4vYmFzaA0KPiArY2QgLi9iY190ZXN0DQo+ICtp
ZiAuL3RpbWV0ZXN0OyB0aGVuDQo+ICsJZWNobyAiUEFTUzogYmMvdGltZXRlc3QiDQo+ICtlbHNl
DQo+ICsJZWNobyAiRkFJTDogYmMvdGltZXRlc3QiDQo+ICtmaQ0KDQpUaGlzIHdvbuKAmXQgZG8g
d2hhdCB5b3UgdGhpbmsuICB0aW1ldGVzdC5zaCBqdXN0IHJ1bnMgYmMsIGRvZXNu4oCZdCBsb29r
IGF0ICQ/LCBhbmQgZG9lc27igJl0IHVzZSBzZXQgLWUuIFRoaXMgbWVhbnMgaXQgd2lsbCAqYWx3
YXlzKiByZXR1cm4gMC4gIEV2ZW4gaWYgYmMgY3Jhc2hlZCBvbiBzdGFydHVwLCB0aGlzIHRlc3Qg
Y2FzZSB3b3VsZCDigJxwYXNz4oCdLg0KDQp0aW1ldGVzdC5zaCBpcyBhIHRvb2wgdGhhdCBydW5z
IOKAmGJjIC1s4oCZIG9uIHNvbWUgYmMgc2NyaXB0cywgd2l0aCB0aGUgYnVsayBvZiB0aGUgbG9n
aWMgYXJvdW5kIHRpbWluZyB0aG9zZSBvcGVyYXRpb25zICh3ZSBkb27igJl0IGNhcmUgYWJvdXQg
dGhhdCkgYW5kIHJ1bm5pbmcgYWdhaW5zdCBtdWx0aXBsZSBiYyBpbXBsZW1lbnRhdGlvbnMgKHdl
IGFsc28gZG9u4oCZdCBjYXJlIGFib3V0IHRoYXQpLiAgVGhpcyB0ZWxscyBtZSB0aGF0IHRpbWV0
ZXN0LnNoIGlzIHJlZHVuZGFudCBhbmQgd2UgY2FuIGlnbm9yZSBpdC4gIA0KDQpNeSBzdWdnZXN0
aW9uIGlzIHRvIGluc3RhbGwgdGhlIFRlc3QvKi5iIGZpbGVzIGludG8gUFRFU1RfUEFUSCBkaXJl
Y3RseSwgYW5kIHRoZW4gYSBydW4tcHRlc3QgY2FuIGRvIHNvbWV0aGluZyBsaWtlOg0KDQojISAv
YmluL3NoDQoNCmZvciBURVNUIGluICouYjsgZG8NCglpZiBiYyAtbCAkVEVTVCA8L2Rldi9udWxs
OyB0aGVuDQoJCWVjaG8g4oCcUEFTUzogYmMvJFRFU1TigJ0NCiAgICAgICAgZWxzZQ0KCQllY2hv
IOKAnEZBSUw6IGJjLyRURVNU4oCdDQogICAgICAgIGZpDQpkb25lDQoNCih5b3UgbmVlZCB0byBj
b25uZWN0IC9kZXYvbnVsbCB0byBzdGRpbiBvdGhlcndpc2UgYmMgd2lsbCB3YWl0IGZvciBpbnRl
cmFjdGl2ZSBpbnB1dCkNCg0KTm90ZSB0aGF0IHNvbWUgb2YgdGhlIHRlc3RzIGFjdHVhbGx5IGFu
bm91bmNlIHRoYXQgdGhleeKAmXJlIGZhaWxpbmcsIGJ1dCBkb27igJl0IGV4aXQgd2l0aCBhbiBl
cnJvciBjb2RlLg0KDQo+IFBBQ0tBR0VDT05GSUcgPz89ICJyZWFkbGluZSINCj4gUEFDS0FHRUNP
TkZJR1tyZWFkbGluZV0gPSAiLS13aXRoLXJlYWRsaW5lLC0td2l0aG91dC1yZWFkbGluZSxyZWFk
bGluZSINCj4gQEAgLTI5LDYgKzMxLDIzIEBAIGRvX2NvbXBpbGU6cHJlcGVuZCgpIHsNCj4gICAg
IGNwIC1mICR7V09SS0RJUn0vbGlibWF0aC5oICR7Qn0vYmMvbGlibWF0aC5oDQo+IH0NCj4gDQo+
ICtSREVQRU5EUzoke1BOfS1wdGVzdCArPSAiYmFzaCINCg0KRG9u4oCZdCB1c2UgYmFzaCB1bmxl
c3MgeW91IG5lZWQgdG8uICBUaGVyZeKAmXMgbm8gbmVlZCB0byB1c2UgYmFzaCBoZXJlLg0KDQo+
ICtkb19pbnN0YWxsX3B0ZXN0KCkgew0KPiArICAgICAgICBpbnN0YWxsIC1kICR7RH0ke1BURVNU
X1BBVEh9L2JjX3Rlc3QvDQo+ICsgICAgICAgIGluc3RhbGwgJHtTfS9UZXN0L2F0YW4uYiAke0R9
JHtQVEVTVF9QQVRIfS9iY190ZXN0Lw0KPiArICAgICAgICBpbnN0YWxsICR7U30vVGVzdC9kaXYu
YiAke0R9JHtQVEVTVF9QQVRIfS9iY190ZXN0Lw0KPiArICAgICAgICBpbnN0YWxsICR7U30vVGVz
dC9leHAuYiAke0R9JHtQVEVTVF9QQVRIfS9iY190ZXN0Lw0KPiArICAgICAgICBpbnN0YWxsICR7
U30vVGVzdC9mYWN0LmIgJHtEfSR7UFRFU1RfUEFUSH0vYmNfdGVzdC8NCj4gKyAgICAgICAgaW5z
dGFsbCAke1N9L1Rlc3Qvam4uYiAke0R9JHtQVEVTVF9QQVRIfS9iY190ZXN0Lw0KPiArICAgICAg
ICBpbnN0YWxsICR7U30vVGVzdC9sbi5iICR7RH0ke1BURVNUX1BBVEh9L2JjX3Rlc3QvDQo+ICsg
ICAgICAgIGluc3RhbGwgJHtTfS9UZXN0L211bC5iICR7RH0ke1BURVNUX1BBVEh9L2JjX3Rlc3Qv
DQo+ICsgICAgICAgIGluc3RhbGwgJHtTfS9UZXN0L3JhaXNlLmIgJHtEfSR7UFRFU1RfUEFUSH0v
YmNfdGVzdC8NCj4gKyAgICAgICAgaW5zdGFsbCAke1N9L1Rlc3Qvc2luZS5iICR7RH0ke1BURVNU
X1BBVEh9L2JjX3Rlc3QvDQo+ICsgICAgICAgIGluc3RhbGwgJHtTfS9UZXN0L3NxcnQuYiAke0R9
JHtQVEVTVF9QQVRIfS9iY190ZXN0Lw0KDQpVc2UgYSBnbG9iIGluc3RlYWQgb2YgaW5zdGFsbGlu
ZyB0aGVtIG9uZS1ieS1vbmUuDQoNClJvc3MNCg0K

