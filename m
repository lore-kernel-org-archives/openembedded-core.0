Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCE39C433FE
	for <webhook@archiver.kernel.org>; Thu,  6 Oct 2022 13:14:08 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.58])
 by mx.groups.io with SMTP id smtpd.web12.5581.1665062026830574720
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Oct 2022 06:13:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=az5G33E9;
 spf=pass (domain: arm.com, ip: 40.107.7.58, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=BTtxHM644WSlcmQhQpL4Sd1eBVYpxpgJNCOTkBnCIHIbJp5BhOTPZcIjVz4BAh5r+hT71kAFusdubYhehEedYfeeRZG7KFtUdz2DVCO8OhOV+FZErloVR4pnd2cMU0r0G7CmCK8QdDVMPXJ1xOOu4qd1fbP9OCQeUWq3ezidJSIsJGzwDqxKGVdElawgfE4JcT5qWtLoD4bxTXCwSiXMX6mtWs2Q65us6RzpeGwCmnD42xGWzivO1QKsLl3WQ5k+WWXb6B4H2ghIeFaiucyoHxXftgg7xQp9OudfiEH3N60XLMvjywuPnWxQ3pw2iEStFqsI2TqLWVKFhPca3EyxqA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7/WGTZLMYfNM5D8nYqNjUbfV/S8P6iPE9yey3NVUi9U=;
 b=ZKFa8NxTdCZo5Od/COtE8sC0hONOdDKgfUjLUwrcyRtqOUd++9C/5Q9o1CBWOjrYh2xVSvPlqwwv9ChL0rCUma9IVhn25JI+GOEKe3kYjIsGeU7Pg/+lorMu92YlNbWhmYxSN9+jrJAe0vvxtTFvyT7fV9cJeBdfF4O+0r6XJBlqxFT29YtebJTY+Getyb5Co3IMt5Vn0iymM2Bnw+pUwZGmqpHlaqqEkMK00pmQ9JalHzhDAEh93WJpvC0PrP0ESuqYR2OOqoun/icDnlwl1Zf2rTjTwYBUqeDYaNPbI05VMBnlND1hrCPKAOVTbOd0/eEGv+80aRKoEzZXrQohXA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7/WGTZLMYfNM5D8nYqNjUbfV/S8P6iPE9yey3NVUi9U=;
 b=az5G33E9pCQ2hADRN2+0Is3gfjZ7e1bq9mDgJFS0EMiEk8qUNfYhnoBfJW6KDw+gRce/6YZulJeTju1n8EXoBI4NqMufT4fotPw9ObRXQHfR97mWRKe2EZqTHRZZaJGsDWfwqD/FEC8VNU8r4Jcbgk3Rp3SB93DOURmFrHlzIIs=
Received: from DB6PR0201CA0040.eurprd02.prod.outlook.com (2603:10a6:4:3f::50)
 by DU0PR08MB8137.eurprd08.prod.outlook.com (2603:10a6:10:3ec::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.34; Thu, 6 Oct
 2022 13:13:42 +0000
Received: from DBAEUR03FT043.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:3f:cafe::81) by DB6PR0201CA0040.outlook.office365.com
 (2603:10a6:4:3f::50) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.36 via Frontend
 Transport; Thu, 6 Oct 2022 13:13:42 +0000
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
 15.20.5709.10 via Frontend Transport; Thu, 6 Oct 2022 13:13:42 +0000
Received: ("Tessian outbound ce981123c49d:v128");
 Thu, 06 Oct 2022 13:13:42 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 688f5ffcccfce164
X-CR-MTA-TID: 64aa7808
Received: from 4672dcf66220.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F8502008-3FF2-40E7-BB12-03C767108A80.1;
	Thu, 06 Oct 2022 13:13:35 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 4672dcf66220.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 06 Oct 2022 13:13:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aB/QD2oNRHQDtySsYd8T2NTZffTqfRdIH70IDJFKdWWen9bY7fF9+1Fk7JPcvJaeRlsQQoZ4HCZtiGwYmi6Potx9ye6FrHCi0eO89PLhKWPdSoV/7Sh8Hy1fTscXixdkcI2Czw2U6gK6OkGJ217VnOgzRQqoW051d+cMdA0jNHJct6uLV6nTAwJA6B3XMzHiaEqxFcggklZLeDSxarcHZhNyTWzIFC9PuGZrJBwM333FCulqi5Fxe6gplOc0TaYgABVW6wWZwZrPE5A8C5IKYMa7/AjURkJMGLDHSq1OhOSczQM9cEr2hPcMulj/cHLyhrtTzzIci9idd5aZmaZrbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7/WGTZLMYfNM5D8nYqNjUbfV/S8P6iPE9yey3NVUi9U=;
 b=dvsLVsztmsaMVUc3dchs23qCbrTLZWSPTktMSNpcItHywib1uSTNWs1yXa6PepjVslknE7E1jDgWlY0lKEAlCVusHm8DM5tLSym4KpG0jCOuNr8MCPTBOSZnpeGLBcFVm+WowSLDqHvaUwPxMOKKX8CyhLyLG5scZN0HxHsUQ2Juq1/qSdoqzh+JAJCrqrg8Sf18h4TyZ0ZokK4ApotrBS7sfvd4/0fOXBd1Rzl6iejk797dQnPw9nRlqgP/NEtIJqzv8D80XiVgE0+IxL7TT6LFJdEOb7FAMVU3WasUbC6PPiYNzZcQEFMqZLXbiqlGzUuAYD0CTNAJSe5VNtXUXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7/WGTZLMYfNM5D8nYqNjUbfV/S8P6iPE9yey3NVUi9U=;
 b=az5G33E9pCQ2hADRN2+0Is3gfjZ7e1bq9mDgJFS0EMiEk8qUNfYhnoBfJW6KDw+gRce/6YZulJeTju1n8EXoBI4NqMufT4fotPw9ObRXQHfR97mWRKe2EZqTHRZZaJGsDWfwqD/FEC8VNU8r4Jcbgk3Rp3SB93DOURmFrHlzIIs=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PA4PR08MB5968.eurprd08.prod.outlook.com (2603:10a6:102:e9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.24; Thu, 6 Oct
 2022 13:13:30 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7d2b:2570:9a99:a3d2]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7d2b:2570:9a99:a3d2%5]) with mapi id 15.20.5676.028; Thu, 6 Oct 2022
 13:13:30 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 2/3] perf: make scripting depend on setuptools3
Thread-Topic: [OE-core] [PATCH 2/3] perf: make scripting depend on setuptools3
Thread-Index: AQHY2Ba76E7uCV3y9kqHlmZC1skQl64BPXeAgAAThwCAAAmvAA==
Date: Thu, 6 Oct 2022 13:13:30 +0000
Message-ID: <401F2D51-AB9E-4D52-84D4-E15C18D6A88A@arm.com>
References: <cover.1664904217.git.bruce.ashfield@gmail.com>
 <ce66ad3692d01831e5f41f27702c01744a8708c5.1664904217.git.bruce.ashfield@gmail.com>
 <8757104C-1103-45EA-8CEF-43EEE0CF18F8@arm.com>
 <CADkTA4OKoeVa0VgJjEKbsoATtmQ03L28p1QVUdn0ibJ=jcoEwA@mail.gmail.com>
In-Reply-To: 
 <CADkTA4OKoeVa0VgJjEKbsoATtmQ03L28p1QVUdn0ibJ=jcoEwA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PA4PR08MB5968:EE_|DBAEUR03FT043:EE_|DU0PR08MB8137:EE_
X-MS-Office365-Filtering-Correlation-Id: fcd9b571-e983-493d-b60a-08daa79c9742
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 GDQeyI8kq6hF4/PoLQnqHTBIOVXJFj/TknXZIjuD5iPcoKbSuFSEADuaSfCHdfcwGrlt2DZHFONu1H0lZvE6nTi3XuO2ZPR98WFmzosF9UeO94Uo82U7bfXHOc/iTUZy4PS/fzeAEvTGJ2wohJSZitRPuTRhUTMxEcdp2tjHdraIqf+c2F4z0VV2V52F5WQVjfHZxBmSfxjJaFzD+rkqxxAkt2XNRqBQuDsRUWl69Y+qzeGIQJz3+6rauV4LfQpdL9nzC4AOEgzWgK9dwV7EYc0+iz/+SuKJmcRusr5vTQ3G1AlWcE31F/Fm7wcDz5xuEez+8DVGkDOZ6n0Z+3YLXJsMl7gG7xfSJ5dS4wGVsyMFMH209U77zsPssIOx0kRbvq5hVA8GLLAJPyGwpX3Dd+tiMotQBIhW03OBuYpsfMs7bVTb+2hQJpUCnK7rrHfKrfCW1shyREPOn6RY0DjQ3xYmeWYUlnF6xhWrupfCMY6PDx1sbIhLMLYZwS0vZtiB3MuRR87i9ibk9YbQjYKQgbrSgnw88SalS41eMGNkcz7C3s4GgsWVJ/ybK6l+LmPl0v1wRc4o7EAlPTWi/Fx0DSTSbDiirDMbFJhFjZDTo4Ucuvec9R9uLsNKCeBxsWsyca3U+tv54ss4881SD8XBe1YJISOJEaN6b1mlOrbc885lkzgcBXm0xaB/PcThabDxzFsdgwjWuyrKwVUjo0NsSDoMe515OSKd7Ai0ZH+liIzZoWyQVYCSJl9VZTOMdSreEqnRqaliZztyMnsJOq4D9yWs0h3P8VXNroI3Pvj/K/g=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(346002)(366004)(39860400002)(136003)(451199015)(2906002)(8936002)(5660300002)(66476007)(71200400001)(76116006)(91956017)(36756003)(66946007)(6916009)(54906003)(86362001)(38070700005)(6486002)(64756008)(6506007)(478600001)(66446008)(8676002)(53546011)(316002)(66556008)(33656002)(4326008)(41300700001)(6512007)(122000001)(26005)(38100700002)(186003)(2616005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <80D3F36DD7C54A499D73AC59A80D0204@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5968
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	1b81263e-15aa-4c15-5d79-08daa79c906c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	eA8SkCm0E7of0ZXKT1wjNsL6DEkgV0ecAUzKDpHs/hf7n8c1Vw6P1AbE46pIrIVEA0FbwGuXVkd8kw6akDf7v1BZKXuEzz0oQrSnrONvwtzx8Ygel8sCw2e2/E6ttNcUX3/Skl+9Yu2udmCAwU/UHHzt6DnhmgzkaX979Ioe/ZllxpfmqDnRQp/oFgDskVKEt4+PFtXtj7clDPwc91Ob+c510QGFgb/ODtJXgI/pMuhMUIE856zsCU+fbNfO+p/6VMgwYkHwt3ZelSTnYVKnGA1HKzFX1wjFcDE6LOh6rz90svCtf5aU3EGAj+KBe1HnZEGRXLD+ShBaUwRzVYQAh0U3IDJBQWUjSDmwROZSh0AG4Wbhas+ITN954crsKluh7cyppYkbsDtmTbco4XgYC8FlZxEyLXzJo2LhhMTFZgHfFYD+iYbXYbyFkPt7/nAmt3+wKG023sHW13EfvyCfzL27EPpb+DSLsGwa42pMiO7PX2dvwB23c4qDKG26Z7Rhg0mMRQciCDbtjGBygaZgY1GAmCwetAwykW8ZHPkeMt71EXCnQkhTdIXF+nKhbTzEryCL2ngiVUJUAckLUe2XZtxNwtxY+BOsESNzAm6lQGasVs16IhfVhZ/LC0JpsA/QcUtsotP4+F7jPMxfeuXsny5cgVbaCm5tpQ4t1oNr8UazpxlueAygRps0c50e5SZfXExg3K2CxevfXoicCYMj8tfVr58Wb6glN1i8eNgmm6zeEkE0haQoOLt3C/qSJIEDMTj8QgFgzGIW0yxiLlATHA==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(39860400002)(376002)(136003)(396003)(451199015)(36840700001)(46966006)(40470700004)(82310400005)(478600001)(86362001)(6486002)(6862004)(36756003)(41300700001)(8936002)(5660300002)(316002)(70206006)(4326008)(54906003)(33656002)(8676002)(70586007)(36860700001)(356005)(82740400003)(40480700001)(81166007)(40460700003)(6506007)(2616005)(6512007)(53546011)(26005)(186003)(47076005)(336012)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2022 13:13:42.0658
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 fcd9b571-e983-493d-b60a-08daa79c9742
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8137
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Oct 2022 13:14:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171499

T24gNiBPY3QgMjAyMiwgYXQgMTM6MzgsIEJydWNlIEFzaGZpZWxkIDxicnVjZS5hc2hmaWVsZEBn
bWFpbC5jb20+IHdyb3RlOg0KPiANCj4gT24gVGh1LCBPY3QgNiwgMjAyMiBhdCA3OjI5IEFNIFJv
c3MgQnVydG9uIDxSb3NzLkJ1cnRvbkBhcm0uY29tPiB3cm90ZToNCj4+IA0KPj4gT24gNCBPY3Qg
MjAyMiwgYXQgMTg6MjcsIEJydWNlIEFzaGZpZWxkIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3Jn
IDxicnVjZS5hc2hmaWVsZD1nbWFpbC5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6
DQo+Pj4gLWluaGVyaXQgJHtAYmIudXRpbHMuY29udGFpbnMoJ1BBQ0tBR0VDT05GSUcnLCAnc2Ny
aXB0aW5nJywgJ3B5dGhvbjN0YXJnZXRjb25maWcnLCAnJywgZCl9DQo+Pj4gK2luaGVyaXQgJHtA
YmIudXRpbHMuY29udGFpbnMoJ1BBQ0tBR0VDT05GSUcnLCAnc2NyaXB0aW5nJywgJ3B5dGhvbjN0
YXJnZXRjb25maWcgc2V0dXB0b29sczMnLCAnJywgZCl9DQo+PiANCj4+IEZvciByZWFzb25zLCBz
ZXR1cHRvb2xzMy1iYXNlIGRvZXMgdGhpczoNCj4+IA0KPj4gUkRFUEVORFM6JHtQTn06YXBwZW5k
OmNsYXNzLXRhcmdldCA9ICIgJHtQWVRIT05fUE59LWNvcmXigJ0NCj4+IA0KPj4gU28gYnVpbGRo
aXN0b3J5LWRpZmYgc2F5czoNCj4+IA0KPj4gcGFja2FnZXMvcWVtdWFybTY0LXBva3ktbGludXgv
cGVyZi9wZXJmOiBSREVQRU5EUzogYWRkZWQgInB5dGhvbjMtY29yZeKAnQ0KPj4gDQo+PiBJ4oCZ
bSBndWVzc2luZyB0aGF0IGlzbuKAmXQgd2hhdCB5b3UgbWVhbnQuDQo+PiANCj4gDQo+IFdlIGRv
IG5lZWQgdGhlIHB5dGhvbiBzdXBwb3J0IG9uIHRoZSB0YXJnZXQgd2hlbiBwZXJmIGlzIGluc3Rh
bGxlZC4NCj4gSXNuJ3QgdGhhdCB3aGF0IHB5dGhvbi1jb3JlIHByb3ZpZGVzID8NCj4gDQo+IFdo
aWxlIGl0IG1heWJlIHdhc24ndCBhIFJERVBFTkRTIGJlZm9yZSwgaXQgcmVhbGx5IHNob3VsZCBo
YXZlIGJlZW4NCj4gKGlmIHB5dGhvbi1jb3JlIGRvZXMgcHJvdmlkZSB0aGUgcnVudGltZSBiaXRz
IGZvciB0YXJnZXQgZXhlY3V0aW9uKS4NCg0KU3VyZSwgYnV0IHRoZXJl4oCZcyBhIHBlcmYtcHl0
aG9uIHBhY2thZ2UgdGhhdCBjb250YWlucyBhbGwgb2YgdGhlIHB5dGhvbiBzdHVmZiwgcmlnaHQ/
IFNvIHRoZSBSREVQRU5EUyBzaG91bGQgYmUgdGhlcmUgKGFuZCBpcyBhbHJlYWR5KS4NCg0KUm9z
cw0KDQoNCg==

