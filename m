Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A117BC433EF
	for <webhook@archiver.kernel.org>; Wed, 25 May 2022 10:34:45 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.77])
 by mx.groups.io with SMTP id smtpd.web09.5094.1653474876636202232
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 03:34:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=g5wEpJ9F;
 spf=pass (domain: arm.com, ip: 40.107.7.77, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=i4idQjg0UC4FbvQmgl7NsXvNI4k8ewPCFAhcAIINlogBHNIBqwND0xPp1frB1jw+L82+KjMdxDE0NnULfiYXAnb38tPastZ0+kN9+DWiOjtz1fcWCgFJv2bLnljCJ4Anw7vrfZUgrRJvqx6iMk/cjF+vXdzs2YwykqWG+SFr5WhYD/WOZkYA+li70AZ9IZsMkZllk9kM8nPpyB3HBsPxVIdQ8oGEUmE8NE7J2RZ8JjmNX1bk4E1oEwYbKu5sMj3S/Fgh+fwQSexPgoAl751UfEcVjpb3YiW2Aoe0KgCXoxrgF9IayoD2ot8tQzfqB1TDzbwNT4TRh1+Y/bU0UixR8Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pYnmfjRZ8De+bKFxetDQjeLsfcxGwlbuh9iPVttmTq0=;
 b=Jc3/UspA5PHkHlby75ZcgERrwLnGmP9GTcN1pY3OpQ938aYFLsLXHOpKafeNLUkaZv+Vo4Hev0JLmMjxQhUZKueNrOYWZ7fwwvyPgkxZcP5hGQCYDS+Y0haC+TUiMATs00iuPLEbZgZZaSNLhA5kzcVABfi6n/Mx1bn5cERnj2K+9N9H61tfWPRPA9DOuRWVAeLiUUTqOMWkU9qF1+kFvTcPnvi56Cobwrz2zUT7U3Y0HXVOyFo6Ug2qEdJ/E+czDsuYtXV3I9VZ4DRCmRfdeUNqsBV9C63A5trynl3T8MKkdkVn/EHzlkL6cehrbto7tfhqWeXu7xUdf5N6LfJu+w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pYnmfjRZ8De+bKFxetDQjeLsfcxGwlbuh9iPVttmTq0=;
 b=g5wEpJ9FSwbaHwTKjpc2YAGTWhAYjLBIHI5tFaNUvO279HQB9iCXNf2WT2NZBZzU9HJJLgSc0RY4a96szn2vzdTcqFihuBTYxZbgHL9nMY4kWhkUuMKY0CYkMbNDquj84d2j11QXtKAtw3WReprEryJXw7OYFRyZGOQi6Pt/2C8=
Received: from DB6PR07CA0104.eurprd07.prod.outlook.com (2603:10a6:6:2c::18) by
 AM0PR08MB3812.eurprd08.prod.outlook.com (2603:10a6:208:fd::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5293.13; Wed, 25 May 2022 10:34:31 +0000
Received: from DBAEUR03FT043.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2c:cafe::fe) by DB6PR07CA0104.outlook.office365.com
 (2603:10a6:6:2c::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.5 via Frontend
 Transport; Wed, 25 May 2022 10:34:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT043.mail.protection.outlook.com (100.127.143.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5293.13 via Frontend Transport; Wed, 25 May 2022 10:34:31 +0000
Received: ("Tessian outbound 07c1c99345b0:v119");
 Wed, 25 May 2022 10:34:30 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9e47ed8aac8be6b4
X-CR-MTA-TID: 64aa7808
Received: from c49ef489e9f2.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2A5B3E09-C166-45C4-AD2E-477C4868BA4E.1;
	Wed, 25 May 2022 10:34:24 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 c49ef489e9f2.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 25 May 2022 10:34:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E6k9IYrggQ8MZTaXhzs6GiKDmVoLTV8/kj8nt2sC/Lc+kfkc36uPr2pOS+GqTjSdQiiXV/5UqZ4dh4vX5+gHMtPsZWsLNfRzzVPpiGLs0FtTNFTP8zsOWTVsXWNlOiLM5zgSfGklFtnvPvYLO8t1Qmtx+R5nKnveaG5Cx0/YCoSWMYKiSeyUnC6K7z2TbON1ThOBGbIQXyvgt0kuk7ZIiD85MYDe9GEH4FyxvcPkOZqMfpQnw7h8L3oRO81Z3/8HOy8ufrWOk2OGAca4NabTAo/hHcxnrJqjRhYl4cAM54DULuU8L6zEPPrX9BPiw7A8bLTEjfs2mkRdvCiDV7aXjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pYnmfjRZ8De+bKFxetDQjeLsfcxGwlbuh9iPVttmTq0=;
 b=V/p14OfunjaTzYJx87T7fZygiPwguTWp0J6DUTK++6U/9KsoopuBNW4MXiMHsudEzrPQlzsEkDqy2u6qwWggkZKMEZO17Y9ZuqsxHHmCwAzo/0UkTTE6fYOetkNGx+neSco41yXOg8Auz8yKGFjtAlUWuWrVRXKh/x5DP9DelzUpkQjHGvk+kgRzSXV0Ah0yIahMOoaN51oQIspNGJUcKei1goNtRdxL8FTHJUfab2VtEhP2SfD5aq7rIqp9cXx5qZGskzi2ufVhyXd5rIumtnwHNmF962xwozPiXULiCO3LXP5ucDZcwr6Fbcw92J2a9nhgprr//o1YxDKqhZ3LBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pYnmfjRZ8De+bKFxetDQjeLsfcxGwlbuh9iPVttmTq0=;
 b=g5wEpJ9FSwbaHwTKjpc2YAGTWhAYjLBIHI5tFaNUvO279HQB9iCXNf2WT2NZBZzU9HJJLgSc0RY4a96szn2vzdTcqFihuBTYxZbgHL9nMY4kWhkUuMKY0CYkMbNDquj84d2j11QXtKAtw3WReprEryJXw7OYFRyZGOQi6Pt/2C8=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB9PR08MB6569.eurprd08.prod.outlook.com (2603:10a6:10:261::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Wed, 25 May
 2022 10:34:22 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::6c2b:5021:db9a:bf6d]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::6c2b:5021:db9a:bf6d%9]) with mapi id 15.20.5293.013; Wed, 25 May 2022
 10:34:22 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
CC: openembedded-core <openembedded-core@lists.openembedded.org>, nd
	<nd@arm.com>
Subject: Re: [OE-core] [PATCH 3/9] mtd-utils: disable LZO by default
Thread-Topic: [OE-core] [PATCH 3/9] mtd-utils: disable LZO by default
Thread-Index: AQHYb4JiesxZAbezl0yA0Cx0QtUbP60vVeqAgAARDoA=
Date: Wed, 25 May 2022 10:34:22 +0000
Message-ID: <D6B1AC00-90EC-49C2-B66F-3849A46B010C@arm.com>
References: <20220524152401.1663317-1-ross.burton@arm.com>
 <20220524152401.1663317-3-ross.burton@arm.com>
 <6585ba44a9ef9dd9ef8c0d70ac570f97d8e24bb2.camel@linuxfoundation.org>
In-Reply-To: 
 <6585ba44a9ef9dd9ef8c0d70ac570f97d8e24bb2.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 90be93b1-aa48-43cd-7738-08da3e3a2717
x-ms-traffictypediagnostic: 
	DB9PR08MB6569:EE_|DBAEUR03FT043:EE_|AM0PR08MB3812:EE_
X-Microsoft-Antispam-PRVS: 
	<AM0PR08MB3812BC5763247259732F0A9FE8D69@AM0PR08MB3812.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 /Us07elf/iKcaTFKw2NXJ/0qv4rlkRCjUVbahkfTY3e+ZQUZEHjEothFaB/3jGN0AbT75+pae2NvyRhh+9TyC0O+r7sr76s9On/eiHX3cUlOWVh0w89I/bZABZIhpTg0qaspwHK0h3WkCSr0fNpb6lsJHkpWLsrurlkxbimjv5iH0y2CVzh+JyMjA1GGHLdX3hs36bfGkMx9kIQXjkChdQ3jKtK7qIU2SzLoMf9aiWXiwZoiiut/1PWj8fbj5u2rMhDsK+kDI7mqR41IpOtzz10rj6xquIn+gkAYGmFXHfAnLT1cpYM3lA7MMnklkNwNOewNOCHL3Fy6QHyACdtIa7lwrvVBbS/UYX4nqg4+WHlhrEbcvPaZDrwzzyAujNP8eu6CtVwtJCRbyWocAmT3dKAosUtfb3IRuUZ/iVCUKW3cAYC3/Z/MI2yS3DJ668W9rkB7Q/+XLeVE8K28FAo1DVKhiIhIUYjNg9pEuchRSJBSItChPZCXHsWrC6V73+/CBJRjG/TLV3Pppn1fpCgFGmrH1kP2ydA6IZSP7BB1B5nggv+bbSWz5n3EYF+dT+ZdngD1ovibKDBae7wCfmoxE68Onnsz4sURbXUfSQxWtjGj5sKM1OIjoHYD4BmMdknmiuEoLozFeoP9oRc6RvrZEEcTcV8iD/tR9H5+poDTO3Df/3cJPyWnnno2/LET1K47fYPYMt/P+9f2Fq7FrW0hpWGuyeOStdyAZGGf9yJl2uoEM+3+r1G1dCldiN6zuWPgHBhXvCgXs8hnr6WXCXzjyTHyHgqsp1AQu+m4xHIoucwB85dAUUJy9hiNNzL9Isc2
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(122000001)(91956017)(54906003)(316002)(4326008)(33656002)(66556008)(66446008)(186003)(66476007)(71200400001)(76116006)(8676002)(64756008)(66946007)(6506007)(36756003)(38070700005)(6916009)(38100700002)(6486002)(5660300002)(6512007)(26005)(508600001)(8936002)(2906002)(86362001)(2616005)(966005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <C25F93ABA09BD240BD1B3D5112AF393F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6569
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	53b691d1-4b42-4879-eed5-08da3e3a21d7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	IIw02HPv1yFYwSiA82rlAnAjBHnKDk7azY9FZcd34Tu0Xitf1P0Kz/1YBZHNghHZK++YF0NKdDkykfIa91S8OpdyfmNkkcvq3X3QYjswCAxGrXjG7cH7gzyq2YEoJl3oJijCd6faL+7agEHesLWzmXL1Cxp+aWQ0G4pY1/MMC3K9/wjk9/RwedSoZUgUusHrvHodT9ffMjshjYzIeCY9siAz9GqF/sFmOgKcTL948jd6Yx6QMD7wivTqjyeMTB2rOgPeqfesvETUN/Npxa8xLVhOlwRG8BDXkzOji0PdzHoca7T8ieeU7r8LUiQW5of5/2NHQXRNmiJvMV5h0kOWYPGjrXndso/z+a08TMiM2fGen9evVT4Du5MG/z2PkVg0ZObPkV2wca5lBSyCkg6MsziSfDN6SRbUvTqrYbhG3u8FxLjmEtHLZyTlauw3NIah1lAcks7Q28iWUd13XsE+qZ1IKl1KfIGoplOnqblhKs0OmswZoZfSpBGm9+AXQQwBpOozLqvSvPe3tOa5QD9nmyTkovq2mWPLhYjuSIlEH525W0up3yEYYKi2/Kf5Mi29/YFExe3sbr/4qqNDR74hXOTosKl4zVMwNlGb21nZ1HGR2UWIvisrzKQZsKBlbi0xZ+/8oUrMyC167wOeMZkLwualNNpdgAlcIkUHG11Md4awYRXWxsBfscYehbiFImtY/YTtcQbjNQPw9efJP7/05DWmxEVhuyHvtKbxfzaRwMSXQsZ7hjpyTqq2mrzZMl9vlyfOhRAGCfQqN5FJU8rP2Q==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(36756003)(54906003)(2906002)(82310400005)(86362001)(186003)(2616005)(336012)(26005)(8936002)(6512007)(4326008)(70586007)(40460700003)(70206006)(5660300002)(8676002)(6862004)(47076005)(966005)(6506007)(81166007)(316002)(36860700001)(356005)(6486002)(33656002)(508600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2022 10:34:31.1064
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 90be93b1-aa48-43cd-7738-08da3e3a2717
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3812
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 May 2022 10:34:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166114

PiBUaGlzIGFuZCBrZXJuZWwgY29tcHJlc3Npb24gYXJlIHRoZSB0d28gcGllY2VzIHRoYXQgd29y
cnkgbWUgYSBsaXR0bGUuDQo+IExaTyBpcyBzdGlsbCBwcm9iYWJseSBvbmUgb2YgdGhlIGJlc3Qg
c3BlZWQvc2l6ZSBjb21wcm9taXNlcyBhbmQgd2FzDQo+IHRoZSByZWFzb24gaXQgd2FzIGFkZGVk
IHRvIGpmZnMyLiBJJ20gbm90IHN1cmUgdGhlcmUgYXJlIG1hbnkgZGV2aWNlcw0KPiB0aGF0IHN0
aWxsIHVzZSBmbGFzaCBkaXJlY3RseSB2aWEgamZmczIgYnV0IHRoaXMgcHJvYmFibHkgc3RpbGwg
ZG9lcw0KPiBoYXZlIGEgdXNlIHRoZXJlLiBPYnZpb3VzbHkgaXQgd291bGQgc3RpbGwgYmUgaW4g
bWV0YS1vZSBidXQgSSdtDQo+IHdvcnJpZWQgdGhlICJvZmYgYnkgZGVmYXVsdCIgd2lsbCBjYXRj
aCBvdXQgYSBmZXcgb2xkIEJTUHMgYW5kIGJlIGENCj4gcGFpbiB0byBlbmFibGUuIEF0IGxvdCBv
ZiB0aGlzIGhpc3Rvcnkgd2FzIHBhZ2VkIG91dCBpbiBsb25nIHRlcm0NCj4gc3RvcmFnZSENCg0K
RW5hYmxpbmcgc2hvdWxkIGp1c3QgYmUgYSBtYXR0ZXIgb2YgcHVsbGluZyBpbiBtZXRhLW9lIGFu
ZCBmbGlwcGluZyB0aGUgcGFja2FnZWNvbmZpZ3MsIHNvIEkgZG9u4oCZdCBzZWUgdGhpcyBhcyBh
IGh1Z2UgcHJvYmxlbS4NCg0KTG9va2luZyBpbiB0aGUgdGltZSBtYWNoaW5lIHRoYXQgaXMgbWV0
YS1oYW5kaGVsZCwgSSBzZWUgdGhlIHphdXJ1cyBtYWNoaW5lcyB0dXJuIG9uIExaTyBpbiB0aGUg
SkZGUzIga2VybmVsIG1vZHVsZSwgYnV0IHRoZXkgYWxzbyBidWlsZCBVQklGUyBpbWFnZXMgd2hp
Y2ggZXhwbGljaXRseSB1c2UgemxpYiBpbnN0ZWFkIG9mIGx6by4gIFVCSUZTIGFsc28gc3VwcG9y
dCBac3RkIG5vdywgc28gdGhhdOKAmXMgcHJvYmFibHkgYSBiZXR0ZXIgb3B0aW9uIGFsbCBhcm91
bmQ6IGl0IGNvbXByZXNzZXMgYWxtb3N0IGFzIHdlbGwgYXMgemxpYiBidXQgYWxtb3N0IGFzIGZh
c3QgYXMgbHpvWzFdLg0KDQpSb3NzDQoNClsxXSBmcm9tIGJ0cmZzIGJlbmNobWFya3MgYXQgaHR0
cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbWFzb24vbGludXgt
YnRyZnMuZ2l0L2NvbW1pdC8/aD1uZXh0JmlkPTVjMWFhYjFkZDU0NDVlZDhiZGNkYmI1NzVhYmMx
YjBkN2VlNWIyZTc=

