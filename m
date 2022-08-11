Return-Path: <simone.weiss@elektrobit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80BE5C19F2A
	for <webhook@archiver.kernel.org>; Thu, 11 Aug 2022 20:08:31 +0000 (UTC)
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (NAM04-MW2-obe.outbound.protection.outlook.com [40.107.101.85])
 by mx.groups.io with SMTP id smtpd.web12.2574.1660248510476937708
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Aug 2022 13:08:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@elektrobit.onmicrosoft.com
 header.s=selector2-elektrobit-onmicrosoft-com header.b=Kzo/37tj;
 spf=pass (domain: elektrobit.com, ip: 40.107.101.85,
 mailfrom: simone.weiss@elektrobit.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Fp7Ig7aD3ezKE/V5g/wVFSI9RHMjS+zM9q5XppvA2vR6UGID5buCQVcmhczIxlXhoUKlCNnOCw8T3IHVZQE5Xp8B9Yz0MtkL5zThegRdKP5qMXfO+6lP9kGKPB/SZasGiaAKnUD1gqv5s0jE3r7h7eIqEjK22oW64zSmzJVfdy7VoI0hyfskQw0TwbBeyi0ieSa/bGC74OmNiuTgx1mC72uikOfc+5QCQgZJF2ETmtSj40AN/CDGqPhvF0TEPW0mxcOGb4WD8VTMeVs9BTH02cn/zsDeMvO/d/fvHWnvCUwmRtp6qcJPMF4cqy7lZMBYiEzTvpYmt9vHtKESPpokIw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GP2UHrqIX0N89PuMEMR3kMRwLMoa88HJbs8jWlB55OM=;
 b=IeRykUD3LeCR4hJ/2AfLplR+waBTlgvgzGRKk/lXV5ZbSU+XGmIlAc8FU1/YIxmbYnCX+a+z4KmuyPheLMaXcA6kblpy4GBlTaiOTmouGIjAG5vtdl5UdUnM9GCIKQHaIQco1+gscdtPPt9PvWImLuRr9Po3QF7WPSRCj6EwlYwfWWCvH8MZC9mODfBiTNDVshgQWpbZ0tcIC48R+1hqnbCfV3NGJjQm+CMSGEXxcxVcyQWi845kLstjBvVAaJyUZH73E+hjzcHsJUc15mlIofFjjFlcxNjiXvClZJyA1/tgGu0gsYDFrJYdRKHd0f0cZX4m8Dgn38WjYN4HDwzCtg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=softfail (sender ip
 is 4.79.107.243) smtp.rcpttodomain=gmail.com smtp.mailfrom=elektrobit.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=elektrobit.com;
 dkim=pass (signature was verified) header.d=elektrobit.onmicrosoft.com;
 arc=pass (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=elektrobit.com]
 dkim=[1,1,header.d=elektrobit.com] dmarc=[1,1,header.from=elektrobit.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=elektrobit.onmicrosoft.com; s=selector2-elektrobit-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GP2UHrqIX0N89PuMEMR3kMRwLMoa88HJbs8jWlB55OM=;
 b=Kzo/37tjl1kBVdZw1dMGWgmY6TK9oH0nlDXv1VHjNAKdHOta1bPtfhA47Cp59fsxUcFp9xQuW2Vj16HetfL7SyKVSnWvHHr1pPDvK0Tisi61VH2/IaA+JoxYAM+eA+Bz1GPtCEUDVotkoymd2bz6UNd5Qa5MVxvWXl2Wwg3hy+w=
Received: from BN9PR03CA0400.namprd03.prod.outlook.com (2603:10b6:408:111::15)
 by BN8PR08MB6241.namprd08.prod.outlook.com (2603:10b6:408:7e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Thu, 11 Aug
 2022 20:08:28 +0000
Received: from BN8NAM12FT063.eop-nam12.prod.protection.outlook.com
 (2603:10b6:408:111:cafe::76) by BN9PR03CA0400.outlook.office365.com
 (2603:10b6:408:111::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.19 via Frontend
 Transport; Thu, 11 Aug 2022 20:08:28 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 4.79.107.243)
 smtp.mailfrom=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.onmicrosoft.com;dmarc=fail action=none
 header.from=elektrobit.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 elektrobit.com discourages use of 4.79.107.243 as permitted sender)
Received: from usbth1es003.ebgroup.elektrobit.com (4.79.107.243) by
 BN8NAM12FT063.mail.protection.outlook.com (10.13.182.194) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5546.7 via Frontend Transport; Thu, 11 Aug 2022 20:08:27 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2176.outbound.protection.outlook.com [104.47.17.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by usbth1es003.ebgroup.elektrobit.com (Postfix) with ESMTPS;
	Thu, 11 Aug 2022 13:08:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cAJWdUSyYUWLCWEzIS882pLGzIBLWb3B1O5ZoZs/lrCXHtfKU6s/iGLebEUG+m4Pj7ERYifWlnPPiSFGyQ1N2R7SZFEdZSvnZWh4/RJ1ID+tGeTngiUOpcBm6WkCEGGTZXEuUNMsK0H0oqzV543QNmdXIa9EkMgfdwhRpVW+7ISMGJ4AJvePOwp3+y5ba3ewuc/DZiJQEk6uHeJG7+OAF72axBoz3u56toxx+UbvbxyA9huHe8oETZ0GGqj5e+qwLX3DxthO70On5PqKtlNE/FyxzIGWnTpliofEZlLUGawA/2NUCsf1FWgA7R9b5wIBCrVqgkpkgK2iuL/4isAPsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GP2UHrqIX0N89PuMEMR3kMRwLMoa88HJbs8jWlB55OM=;
 b=hW3g+dXWPlAX4F/+GZpXy7Sq4jR/SR/10T4smLNH0tktY4Gjnm+jhRORYRIsHbADxi32bOCUDTSdYKoa9I0/6mnGHbAkF+/Bo/1R78nqneGy9GYRmYXFW9HJG+ZP1o26T1YxR/4nwBi/pSYWYiVvFd3+b00r+QTTAq6ecP5VV+RVI80IxmtRrfPIK3OZkHAnkMSUuqHUfLGDA9kuFqBlBopUXQjcdDzRV4vyQaiDXADiBMrzn5rF2q3n6mW5E5Fg7g3hIqXmbcLSIHq3u6+pmdyIZFnmcUGKngGHrgxuJvsb4Kaumsv4p0no8ojMQ/1zx9qA/wiCO8J7AIN7GGLHtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=elektrobit.com; dmarc=pass action=none
 header.from=elektrobit.com; dkim=pass header.d=elektrobit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=elektrobit.onmicrosoft.com; s=selector2-elektrobit-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GP2UHrqIX0N89PuMEMR3kMRwLMoa88HJbs8jWlB55OM=;
 b=Kzo/37tjl1kBVdZw1dMGWgmY6TK9oH0nlDXv1VHjNAKdHOta1bPtfhA47Cp59fsxUcFp9xQuW2Vj16HetfL7SyKVSnWvHHr1pPDvK0Tisi61VH2/IaA+JoxYAM+eA+Bz1GPtCEUDVotkoymd2bz6UNd5Qa5MVxvWXl2Wwg3hy+w=
Received: from PAXP195MB1231.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:1a3::10)
 by PR3P195MB1053.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:ac::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Thu, 11 Aug
 2022 20:08:13 +0000
Received: from PAXP195MB1231.EURP195.PROD.OUTLOOK.COM
 ([fe80::39a6:d143:582e:fa67]) by PAXP195MB1231.EURP195.PROD.OUTLOOK.COM
 ([fe80::39a6:d143:582e:fa67%7]) with mapi id 15.20.5525.010; Thu, 11 Aug 2022
 20:08:12 +0000
From: =?utf-8?B?V2Vpw58sIFNpbW9uZQ==?= <Simone.Weiss@elektrobit.com>
To: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "Tomerius, Kai"
	<Kai.Tomerius@elektrobit.com>
Subject: Re: [OE-core] [PATCH v2] json-c: Add ptest for json-c
Thread-Topic: [OE-core] [PATCH v2] json-c: Add ptest for json-c
Thread-Index: AQHYrVuhbV8NFSd1AkqAfg6UlyyjC62p0p6AgAAERwCAAEqNgA==
Date: Thu, 11 Aug 2022 20:08:12 +0000
Message-ID: <a69b955ee768d4abaa4bc46020e17fced7fa3992.camel@elektrobit.com>
References: 
 <5c34f311-8120-42a8-bfe7-18c90a5fabd6@denue6es010.ebgroup.elektrobit.com>
	 <CANNYZj_6O9M+VC+1Z3YLFwqppQR3Ns8d9P523JuAjiM-mh33RA@mail.gmail.com>
	 <2465e917a63704c5acf072d6c9183f9a8e1d25b3.camel@elektrobit.com>
	 <CANNYZj8yGefw7sniQeTfaU4XnHOtD_wJF0Q7Gv+NTcrmiVAyKw@mail.gmail.com>
In-Reply-To: 
 <CANNYZj8yGefw7sniQeTfaU4XnHOtD_wJF0Q7Gv+NTcrmiVAyKw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=elektrobit.com;
X-MS-Office365-Filtering-Correlation-Id: 4270c678-ddc1-4cc5-6c6f-08da7bd54131
x-ms-traffictypediagnostic: 
	PR3P195MB1053:EE_|BN8NAM12FT063:EE_|BN8PR08MB6241:EE_
X-SM-outgoing: yes
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 0GijaBhoHyG2nQNhYNnIG1Rjn62QXmXVlIps44b9j7+yfMogCYG282dWeV7K7gzb8EgMOjPMyo/2LVxOTdEyqQ2yTVvmGicn7W/EF78KHm4hr7JgiUlrJ/vrNOl9TNgvZfZ5kGDSolq+/rWAoDEVG9rGMn06vTTgMx9aOQLIDial8Fliv/yIl6kJaKB9aDzqFnOztxgONEEWoGM5y+4lSO5hUUpLiwGP3Ew5MbV18tmzJtnS/JDnXiKaKLemYpfg9IvTcrg/vO/EsDIwo67l8dVv1+4VnQ7sviSedyFsifVgIWyNVAE1V8wWlzUJPgT00WKlz+Rl56xx898ZcUu3khFjyHOLtqCuTuJAsdvcKasszoR04R5393rNgOKSZ0vAqFoy1HbHiLHuZdGV8GqLNiN5lwcex3El9XUlYylW85taEjTwDC/BQ5bCRmu1lsClKFd9EfzZGx7/vum2jrpukAGWdpZ332Fcu6P7RSSA3mB7g0lc0Fmlov/88yKVyarcsopIgZvkvfFBcCKKCi9v4oWGjNbuud+CQS77FzyizxVqtPf01o+pSXELS0NWAs2VexfgGGrYLEP9Nd+2rRLN9rr4nWMH7rL1m9DDPj+Qc94hO5IbHkhyKKcuj5E/+xGK5h4bZTupJpbiOFMGNoQDK8l0F4cNvazCNSOixKmbd1CTq9QOCWkNORgjjmBtRVD81ip9pUsrXiQ5xdfIJYQCM2nvSt7eKIXbbf6fKUKUAiCqHEGEakK66YPeiTISSgVLlnEdEyGy8c/uXd9OaPP4/747Y8i5Gjt+Qxa6T+fzBzjKOhVKXjBp15TX+FhiUX0znUmPHdjCfXAAx0tZ6A5RSg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXP195MB1231.EURP195.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(136003)(346002)(39850400004)(396003)(366004)(41300700001)(6506007)(966005)(2906002)(71200400001)(86362001)(66476007)(478600001)(8676002)(66446008)(4326008)(64756008)(5660300002)(66556008)(6486002)(38070700005)(66946007)(8936002)(91956017)(6916009)(54906003)(76116006)(36756003)(2616005)(107886003)(38100700002)(186003)(83380400001)(85182001)(45080400002)(122000001)(6512007)(316002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <2383C0A90F602940B875AC882A4D8A8E@EURP195.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P195MB1053
X-SM-smarthost: [elektrobit-com.mail.protection.outlook.com]
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 BN8NAM12FT063.eop-nam12.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	f4f2be04-162f-4d15-78f9-08da7bd53834
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ZJsnXeN+kwtBKhWDwbcuG/0Tou4W4IW5YYIOKbzNCkaAaBwJugVEsm0HxWrz7BKFxIhu47flF3zgZngFPJkOg03HOgMT5fYEbpekNWm2ITyPxnHkl0kvvfPB4mKCFc+YUiZbzrpOZi02W6PT71JYb2VNK7NJb50NGz3VlROAziz1INtiR1FK3qe9l8c3E+0jUzPIgVk2Q3MDT+zrtnJi9BG/sbwRMERxzlCRbWIoQya58oHCMWFUoQvCrRc45lUhBWIM3T9orDkkV7z1p/ensWhkPpqtxkMP6UDvA/a/riTXvPk2t+rW8ozUGbUvTBTDIPZWUQ0VVJF1sF6e4rpC4SeV26vf1Hc7KmFrl5q50kni0kMrOwZb0Z/LwrtprgqvVW8KFdaRkrbbVMWknwNmq8ieNdyW0FSM1oaayeP9N3IEjdTB4BM8gFX3ljgOVxaDfDLwvGnKn0ldIfc/knZvUMX0pq4xvhRDa0YrgB4RUkgpN3ZwfuHumMAYPv2li1poXhTxhQkJ7CCidvaUZWBgwmDr1nYnc5qQ/D/67WFuFpDyPbPRuYFOCqjSudPbEFYx7J5N2+xBSDOdlh4svCvVvrKueiC5fh1f6gVbnPQyi5H2tjo/hXx0hhxYEpduzSD197JBVzdY0PtoiOiol+91+uJM6sV2HHjN7zd0Ojdpm5xSlYqKMJipIWNsaCMwiX0fHUHjr/BlmyrEs8CKwYH4DXm0uQCVAWkikyE8MrEL+wJfoRbVhNsksAgVwt6lWyGs+z8j1Kv5MEowiESdM8MGPRIEUQi+DEzhQzwGAffa7jFG2CsaX74ZrzP8RETdkaBZujHIJ0WjqnqTMkRmJ34ER2j2Gp6cGY+ZqNBMxn09lLI=
X-Forefront-Antispam-Report: 
	CIP:4.79.107.243;CTRY:CA;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:usbth1es003.ebgroup.elektrobit.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(396003)(376002)(136003)(39850400004)(346002)(46966006)(36840700001)(40470700004)(41300700001)(86362001)(186003)(26005)(966005)(6506007)(6512007)(36756003)(107886003)(82740400003)(356005)(47076005)(83380400001)(40460700003)(336012)(8936002)(81166007)(36860700001)(5660300002)(40480700001)(8676002)(2906002)(85182001)(70206006)(2616005)(4326008)(316002)(45080400002)(70586007)(54906003)(6486002)(82310400005)(6916009)(478600001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: elektrobit.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2022 20:08:27.4136
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4270c678-ddc1-4cc5-6c6f-08da7bd54131
X-MS-Exchange-CrossTenant-Id: e764c36b-012e-4216-910d-8fd16283182d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=e764c36b-012e-4216-910d-8fd16283182d;Ip=[4.79.107.243];Helo=[usbth1es003.ebgroup.elektrobit.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN8NAM12FT063.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR08MB6241
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Aug 2022 20:08:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169270

SGksDQoNCnRoYW5rcyBmb3IgYXNraW5nIHRoaXMsIEkgc3RhcnRlZCBxZW11IGJ5IHVzaW5nIHJ1
bnFlbXUgZGlyZWN0bHkgYW5kDQp3aXRob3V0IGFueSBmdXJ0aGVyIGFyZ3VtZW50cy4gV2l0aCBr
dm0gdGhlIHRlc3QgdG9vayBhcm91bmQgMjANCnNlY29uZHMuIEknbGwgc2VuZCBhIG5ldyBwYXRj
aCB3aXRoIGFkZGluZyBqc29uLWMtcHRlc3QgdG8gUFRFU1RfU0xPVy4NCg0KU2ltb25lDQpPbiBU
aHUsIDIwMjItMDgtMTEgYXQgMTc6NDEgKzAyMDAsIEFsZXhhbmRlciBLYW5hdmluIHdyb3RlOg0K
PiBDQVVUSU9OOiBUaGlzIGVtYWlsIG9yaWdpbmF0ZWQgZnJvbSBvdXRzaWRlIG9mIHRoZSBFbGVr
dHJvYml0DQo+IG9yZ2FuaXphdGlvbi4gRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNo
bWVudHMgdW5sZXNzIHlvdQ0KPiByZWNvZ25pemUgdGhlIHNlbmRlciBhbmQga25vdyB0aGUgY29u
dGVudCBpcyBzYWZlLg0KPiANCj4gDQo+IEp1c3QgdG8gYmUgc3VyZSwgZGlkIHlvdSB1c2UgcWVt
dSB3aXRoIGt2bSBvcHRpb24/IEkgZmluZCBpdCBvZGQgdGhhdA0KPiBqc29uIGxpYnJhcnkgdGVz
dHMgd291bGQgdGFrZSB0aGlzIGxvbmcuIENhbiB5b3UgZG91YmxlIGNoZWNrIHdoYXQNCj4gdGhl
eSBkbz8gV2UgY2FuJ3QgYWZmb3JkIHRvIGV4dGVuZCBwdGVzdCBydW4gdGltZSBpbmRlZmluaXRl
bHksIGl0J3MNCj4gYWxyZWFkeSBjbG9zZSB0byA0IGhvdXJzLg0KPiANCj4gQWxleA0KPiANCj4g
T24gVGh1LCAxMSBBdWcgMjAyMiBhdCAxNzoyNiwgV2Vpw58sIFNpbW9uZSA8DQo+IFNpbW9uZS5X
ZWlzc0BlbGVrdHJvYml0LmNvbT4gd3JvdGU6DQo+ID4gSGksDQo+ID4gDQo+ID4gRm9yIG1lIGl0
IHRvb2sgYXJvdW5kIH41MDAgc2Vjb25kcy4gSSBjb25zaWRlcmVkIGl0IGFzIHNsb3csIGFzDQo+
ID4gYFBURVNUU19GQVNUYCBzaG91bGQgdGFrZSBhcm91bmQgfjMwIHNlY29uZHMgYWNjb3JkaW5n
IHRvIHRoZQ0KPiA+IGNvbW1lbnQNCj4gPiBvbiBwdGVzdC1wYWNrYWdlbGlzdHMuaW5jLg0KPiA+
IA0KPiA+IFNpbW9uZQ0KPiA+IE9uIFRodSwgMjAyMi0wOC0xMSBhdCAxMDoyMyArMDIwMCwgQWxl
eGFuZGVyIEthbmF2aW4gdmlhDQo+ID4gbGlzdHMub3BlbmVtYmVkZGVkLm9yZyB3cm90ZToNCj4g
PiA+IENBVVRJT046IFRoaXMgZW1haWwgb3JpZ2luYXRlZCBmcm9tIG91dHNpZGUgb2YgdGhlIEVs
ZWt0cm9iaXQNCj4gPiA+IG9yZ2FuaXphdGlvbi4gRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4g
YXR0YWNobWVudHMgdW5sZXNzIHlvdQ0KPiA+ID4gcmVjb2duaXplIHRoZSBzZW5kZXIgYW5kIGtu
b3cgdGhlIGNvbnRlbnQgaXMgc2FmZS4NCj4gPiA+IA0KPiA+ID4gDQo+ID4gPiBPbiBXZWQsIDEw
IEF1ZyAyMDIyIGF0IDIxOjQwLCBTaW1vbmUgV2Vpc3MgPA0KPiA+ID4gc2ltb25lLndlaXNzQGVs
ZWt0cm9iaXQuY29tPiB3cm90ZToNCj4gPiA+ID4gLS0tIGEvbWV0YS9jb25mL2Rpc3Ryby9pbmNs
dWRlL3B0ZXN0LXBhY2thZ2VsaXN0cy5pbmMNCj4gPiA+ID4gKysrIGIvbWV0YS9jb25mL2Rpc3Ry
by9pbmNsdWRlL3B0ZXN0LXBhY2thZ2VsaXN0cy5pbmMNCj4gPiA+ID4gQEAgLTg3LDYgKzg3LDcg
QEAgUFRFU1RTX1NMT1cgPSAiXA0KPiA+ID4gPiAgICAgIGZpbmR1dGlscy1wdGVzdCBcDQo+ID4g
PiA+ICAgICAgZ2xpYi0yLjAtcHRlc3QgXA0KPiA+ID4gPiAgICAgIGdzdHJlYW1lcjEuMC1wdGVz
dCBcDQo+ID4gPiA+ICsgICAganNvbi1jLXB0ZXN0IFwNCj4gPiA+ID4gICAgICBsaWJldmVudC1w
dGVzdCBcDQo+ID4gPiA+ICAgICAgbGliZ2NyeXB0LXB0ZXN0IFwNCj4gPiA+ID4gICAgICBsdHRu
Zy10b29scy1wdGVzdCBcDQo+ID4gPiANCj4gPiA+IEhvdyBsb25nIGRvIHRoZSB0ZXN0cyB0YWtl
IHRvIGV4ZWN1dGU/IERvIHRoZXkgaGF2ZSB0byBiZSBhZGRlZA0KPiA+ID4gdG8NCj4gPiA+IHRo
ZQ0KPiA+ID4gc2xvdyBsaXN0Pw0KPiA+ID4gDQo+ID4gPiBBbGV4DQo+ID4gPiAtPS09LT0tPS09
LT0tPS09LT0tPS09LQ0KPiA+ID4gTGlua3M6IFlvdSByZWNlaXZlIGFsbCBtZXNzYWdlcyBzZW50
IHRvIHRoaXMgZ3JvdXAuDQo+ID4gPiBWaWV3L1JlcGx5IE9ubGluZSAoIzE2OTIzNik6DQo+ID4g
PiBodHRwczovL25hbTEyLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0
cHMlM0ElMkYlMkZsaXN0cy5vcGVuZW1iZWRkZWQub3JnJTJGZyUyRm9wZW5lbWJlZGRlZC1jb3Jl
JTJGbWVzc2FnZSUyRjE2OTIzNiZhbXA7ZGF0YT0wNSU3QzAxJTdDJTdDNzRiMWVkYWRmZGQxNDRm
MjEzMDYwOGRhN2JhZmZiNjglN0NlNzY0YzM2YjAxMmU0MjE2OTEwZDhmZDE2MjgzMTgyZCU3QzAl
N0MwJTdDNjM3OTU4MjkzMDI4OTIxNjExJTdDVW5rbm93biU3Q1RXRnBiR1pzYjNkOGV5SldJam9p
TUM0d0xqQXdNREFpTENKUUlqb2lWMmx1TXpJaUxDSkJUaUk2SWsxaGFXd2lMQ0pYVkNJNk1uMCUz
RCU3QzMwMDAlN0MlN0MlN0MmYW1wO3NkYXRhPTRjNVU2QU5WZ28lMkIzM2wxQlp2aFZ3b0NqaEhL
aXlaWjRZS3piY0xmdWlkWSUzRCZhbXA7cmVzZXJ2ZWQ9MA0KPiA+ID4gTXV0ZSBUaGlzIFRvcGlj
OiANCj4gPiA+IGh0dHBzOi8vbmFtMTIuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20v
P3VybD1odHRwcyUzQSUyRiUyRmxpc3RzLm9wZW5lbWJlZGRlZC5vcmclMkZtdCUyRjkyOTQ0MjIz
JTJGNjYzOTI3OSZhbXA7ZGF0YT0wNSU3QzAxJTdDJTdDNzRiMWVkYWRmZGQxNDRmMjEzMDYwOGRh
N2JhZmZiNjglN0NlNzY0YzM2YjAxMmU0MjE2OTEwZDhmZDE2MjgzMTgyZCU3QzAlN0MwJTdDNjM3
OTU4MjkzMDI4OTIxNjExJTdDVW5rbm93biU3Q1RXRnBiR1pzYjNkOGV5SldJam9pTUM0d0xqQXdN
REFpTENKUUlqb2lWMmx1TXpJaUxDSkJUaUk2SWsxaGFXd2lMQ0pYVkNJNk1uMCUzRCU3QzMwMDAl
N0MlN0MlN0MmYW1wO3NkYXRhPTZTdEVITnlUSzBwdGVSSmNVQVdsNVMwQ3FvVDhCR29HWmMzVyUy
RkxFaWZ5YyUzRCZhbXA7cmVzZXJ2ZWQ9MA0KPiA+ID4gR3JvdXAgT3duZXI6IG9wZW5lbWJlZGRl
ZC1jb3JlK293bmVyQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPiA+IFVuc3Vic2NyaWJlOiAN
Cj4gPiA+IGh0dHBzOi8vbmFtMTIuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3Vy
bD1odHRwcyUzQSUyRiUyRmxpc3RzLm9wZW5lbWJlZGRlZC5vcmclMkZnJTJGb3BlbmVtYmVkZGVk
LWNvcmUlMkZ1bnN1YiZhbXA7ZGF0YT0wNSU3QzAxJTdDJTdDNzRiMWVkYWRmZGQxNDRmMjEzMDYw
OGRhN2JhZmZiNjglN0NlNzY0YzM2YjAxMmU0MjE2OTEwZDhmZDE2MjgzMTgyZCU3QzAlN0MwJTdD
NjM3OTU4MjkzMDI4OTIxNjExJTdDVW5rbm93biU3Q1RXRnBiR1pzYjNkOGV5SldJam9pTUM0d0xq
QXdNREFpTENKUUlqb2lWMmx1TXpJaUxDSkJUaUk2SWsxaGFXd2lMQ0pYVkNJNk1uMCUzRCU3QzMw
MDAlN0MlN0MlN0MmYW1wO3NkYXRhPWRwZUk5MEVteUw1eUVRMVglMkJxaWxwVGl0N3hpUUlLV2Ru
aWtLNzhocDhiOCUzRCZhbXA7cmVzZXJ2ZWQ9MA0KPiA+ID4gIFtzaW1vbmUud2Vpc3NAZWxla3Ry
b2JpdC5jb21dDQo+ID4gPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPiA+ID4gDQo=

