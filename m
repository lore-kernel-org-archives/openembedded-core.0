Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68903C433EF
	for <webhook@archiver.kernel.org>; Wed, 20 Jul 2022 11:41:26 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.70])
 by mx.groups.io with SMTP id smtpd.web09.52648.1658317280841926108
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 04:41:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=aq69t68/;
 spf=pass (domain: arm.com, ip: 40.107.8.70, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=PJHazaUgq5wdn9ASCoWDzpvVoiAzO58AoVCPcsjJlfy6AELu1ltGs5VOsrXv1KFlJj7H/6TqMnxklTl4XpfKcKHeb8SEa+cBHZIx8JTFteiVRDlouH1ihKVYY8QV6Jw5bJwXRxBExCrX9+EGXATyMTdalXi1SAZouJWz/uWg01l9/yZjhQyWcOBL5JjSNh240wjTUROPa/WQE902hBgREDN5BnbNah7dpPJ4F3PzVVZROYRS0e2WqhM1uF6tPFA56QwPWB0M22Oa+iCYHtik4N2qVJooHRpafxINcngZfEQgJNfXm8cOvMj9VGXbaiO7/V1Ov5HMJ23iBGpNMH6LpQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2MR7yktqyZINDulgFjN+fasXTF3Uh62Z5UHRERsvmYM=;
 b=KOISIF/iuuMVw51fLSD8y92Yt3gAARCyFvBhYMUTFP2qDCxDrNo2TXpelI7WhIFnJrsZlejysSAGSIASU58u8HoLa0sEpSyGoCZ0PQjOSkICL5N54VlYye1YyR4f++pHBsKW4DK87HbRe/c+HJAyKwtJ598Q0+GuxTIGkyLW1cYCGtYlmLOF4HewbMhmvPuJLo3hlHSCNDNQ7MrNKOhYy76bb0gbKObjz1Myt/elXUqlk6K/Wmec/pLkjodWQHigLfApmyATVH4LXxlDTt7Q5Ha+poKfTBGgzdWytijFuKKRhnFc1/qBzByUR9MJnzQiCAIq4+gkpPhbVCo/ayNxPw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2MR7yktqyZINDulgFjN+fasXTF3Uh62Z5UHRERsvmYM=;
 b=aq69t68/6vRVxf6a8EOTCgASUpQzJvPLVUix09yN+JMSdVz0vsCbPTowd3rySrtR0rX3FB63zCd79V8Rh9paFxSJlDaPHF8QT1VLnx3E9HldDL8Om5XsIk5Xs50ikhIZ1vJBMKvbbxG9z2zK1JrrZp4buMEz6GggYS0ndnJWdag=
Received: from DB7PR02CA0031.eurprd02.prod.outlook.com (2603:10a6:10:52::44)
 by DB9PR08MB7583.eurprd08.prod.outlook.com (2603:10a6:10:307::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23; Wed, 20 Jul
 2022 11:41:16 +0000
Received: from DBAEUR03FT060.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:52:cafe::5) by DB7PR02CA0031.outlook.office365.com
 (2603:10a6:10:52::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.18 via Frontend
 Transport; Wed, 20 Jul 2022 11:41:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT060.mail.protection.outlook.com (100.127.142.238) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5458.17 via Frontend Transport; Wed, 20 Jul 2022 11:41:16 +0000
Received: ("Tessian outbound 63c09d5d38ac:v123");
 Wed, 20 Jul 2022 11:41:16 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ac1bdce520e822cd
X-CR-MTA-TID: 64aa7808
Received: from a0ee09fa94b6.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D80CA18E-1EAF-4660-96F6-63365E9E8AC6.1;
	Wed, 20 Jul 2022 11:41:09 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 a0ee09fa94b6.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 20 Jul 2022 11:41:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jJa79nrfSeKcuCM6Hj5ebq0d4JTYr/SVul37rgozMBuyiYwqMyoaogZQr5CBXcy2Ornv4Vw1YTrUJcoEULjgGANSZEtab04NdZp/RzDc0d23bszk7b0n++OgmIrwpsrqDjE+VK7wLQRezr+1CLc5VahR1qYXX1X5j2PIWIv2xUaiQK0Z83WDIGEy7RqbJlKa9L7MajONRDfmH7tqoWAZ5dfxpgfMcDkjT3+L55W5GZCyh5HY+Ffuap17h3aduOiD0KysQRcdL/afPIdJFyc6IoSDKOxf76MfEtzZ2DbiFjyQzMoW1bUfZCXd8Woo1oOsSsjRCYLE8oE+wJ2sokajJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2MR7yktqyZINDulgFjN+fasXTF3Uh62Z5UHRERsvmYM=;
 b=Sy4Yi1FNuOVmlFRtSB9gdBP6rAZkVP3mvVPeP9A/BY+ZLmEqYGTB4il3i5kOrIKZezujMNczD80/xq7FCeUCFBiEY+kJFyYfgIfQk+Id9s8DDYd0vk0AkSFg43mSx9/cwghNc5BrJSAUIz7bJxx/40Vj4zIw7ciSAnoSVBkDeTs6P/4w1bh+jVgRtQK5HGArPrcw0cdTrXKIXgNo/y+mJb9V6JKrFPK5Xx4AAQrybBfyBmuZsKfnDEeiQfR7kOD84LeJ8NJbXXfZr8ewNO6h8IMVA4eQPCk5J1Z2/MvGF3D34fJkMnUSeTQwkZ60E660vZ18bPrfElq1YaPt248jWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2MR7yktqyZINDulgFjN+fasXTF3Uh62Z5UHRERsvmYM=;
 b=aq69t68/6vRVxf6a8EOTCgASUpQzJvPLVUix09yN+JMSdVz0vsCbPTowd3rySrtR0rX3FB63zCd79V8Rh9paFxSJlDaPHF8QT1VLnx3E9HldDL8Om5XsIk5Xs50ikhIZ1vJBMKvbbxG9z2zK1JrrZp4buMEz6GggYS0ndnJWdag=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by VI1PR08MB3789.eurprd08.prod.outlook.com (2603:10a6:803:bd::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.20; Wed, 20 Jul
 2022 11:41:07 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::fc06:20ca:a7cd:4d72]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::fc06:20ca:a7cd:4d72%9]) with mapi id 15.20.5438.023; Wed, 20 Jul 2022
 11:41:07 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "akash.hadke@kpit.com" <akash.hadke@kpit.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [poky][master][kirkstone][PATCH] cve-check.bbclass: Add
 anonymous function to get patched CVEs from recipe
Thread-Topic: [OE-core] [poky][master][kirkstone][PATCH] cve-check.bbclass:
 Add anonymous function to get patched CVEs from recipe
Thread-Index: AQHYldra0S6go3Kl3E+EgotogGeeBa16kZUAgAAFx4CACa+CgIABFuQAgAHRugA=
Date: Wed, 20 Jul 2022 11:41:07 +0000
Message-ID: <44426023-FCC1-48A2-BCB4-596DE17AE586@arm.com>
References: <AAE95E75-469F-4C53-8922-CE8FD80701CD@arm.com>
 <11682.1658217252298072413@lists.openembedded.org>
In-Reply-To: <11682.1658217252298072413@lists.openembedded.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 19d1aef7-369c-4194-0c59-08da6a44c1c6
x-ms-traffictypediagnostic: 
	VI1PR08MB3789:EE_|DBAEUR03FT060:EE_|DB9PR08MB7583:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 YhT4krscMTb4vOl04BxvBuacuT4AyXObix4ZpADr/k3E8PCAPy2DL2kk10ZI22Lj3cd4EBuXH9eif7kZrpOmtckFn66jurZ0iIkdhu60+WNKN9ZeHmFtF34hSJBi3BIXhMJ+SnzHgrEcnvHDpdg49NSkKzb9fs0V10kznc366VnKo/w17RM2jGMYHmQ87dnUdMciYnBcsaEvYzGh0B0K8y2K8EdBVMudq9YdL7kR2DrUPZxMT4ne+3mRh69oj/ChoVSA/7b2BtdrnHTkCA7C2Jl35qSadKgQjv3JtfzxfjzmmtKi6QL3u79JXOZh48RhjuJn87uIBOHTJ+icR7zPGa+Mx0jIB4hMIwuDDnS+ZOsvrqFj2+wHgGdo8QPWIfpjpdBZT3472o+Tc6y4eyMz0nwYmD2jX6bowzfX6zxMIoCQNHr9bhgz6S/8MrRt53D/P0oecHile+k2Oyg6Wl8xl/AULckXmIx3u8r+M2tXPPpjF0c/qy9NF7hj0AQh1etb+Up762YO9k5IMClaTwEdMdQuUDBA6b0NpletUPNCY4ph7B/IiYhmDrGfGHBEr8Ws4o0bs8Bb/CJdfwOAxvHT0GrOKliePXBr241Iy51I6155j1kaRWR4mIAvwKFAzbD+YLJbccjy+cqPZjSoy4/d6bwMcBpaChtLooRWeQp02Ee0TD/hRfj0EQXWWjeuWGqGY0Jzh/obGzZ25bKrpOGv6lBbWVk2xt+dABNb6ab7oGhxwnTmg9UzjJZtFa0Lgqa0CaJal8mRBhNYP2sEedORMc9KzYQ1OiPKJA8rZspV3orsHx91YR3sR7t6HizTUWV6IlxlqurMmv9/yKdPY45YvQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(136003)(346002)(39860400002)(396003)(366004)(316002)(6486002)(41300700001)(71200400001)(86362001)(6506007)(478600001)(38070700005)(26005)(186003)(6916009)(53546011)(122000001)(6512007)(66446008)(5660300002)(4744005)(76116006)(8676002)(66946007)(4326008)(91956017)(64756008)(38100700002)(33656002)(66476007)(36756003)(2906002)(2616005)(8936002)(66556008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <BF6E40CDE062A440A4BDCCF38AF6EDA3@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3789
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	82f61e68-c430-4079-d91a-08da6a44bc48
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	uT9dqJ0OcCHPFiSB0tpklrq5PLzt0lrRbHhADIaZWtQ2EFFMBL+dw5FOpnBheArfqjk07g+ywl27YMd1p0eiC+nWekvI4jRjBkUF1Q6FEPJdCurJxPGADu+Mf2U6NNXMenCEK4loTDl96eqWHAS0ZE+ut1Ax9QzzRGOhu5c0d2o6L2MnbzFBKAwKhJMbmAeMaVWkdvq9BVarNfv9H0hOB/Rhe5KNFNTsyK5nlfMPBgK0RBjS3T4ZeKXm2wmNjCCSSv+RqGf7Qe8AsJ/4MSPeA9ENsbQRca1hGJWA3lu+nj0fW+6/Y2BAr4liL2URU4AY/7e/p4TXBsQ3CQ/9z+mtXotRC0DF8aDFiJWLrgiTZA00sfhr73ctOtTSv917k27hDNCAFt8J4+HYHbMC0txwyT76YbUNQm6qGPS15erOY3n3z8MgH7zShhqx8Up0q2BzKC8JuqDhj2DdSGF3svuWj5IdL6qWiIy7vdGpu4OYbb+VjID761yoh+9NBgxDcHn8HKm2iDuTyzSTk0rKd4/rcGHRUaOS7TmVg8wsqCVEc4A69Vv5eN3csphxSaqbpMwIGscTkQ0aA7E8KUHsT2Y1ZS+jve0Ke9BINJtAZ9pTwXnI6kUPXamEvXy5GY/LCNHZ2xQPbtPKvXm04Mn1Uy4fKtIiLpv0HWmb9Yllu7jHowNww4UeZGa1F2DJLJsMRc804XildoE1VtFaBxmXPLRvDW1ySSDrvHMteG4rHZFyyjZycrnUhORS8WZC8Oob+4fP91EYVNB2GWnM+WY5PgPQLc8kw6IzU5mMI0I3MfcYowElJu+wF+Jf9xO5CWjlL9aY
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(396003)(39860400002)(376002)(346002)(40470700004)(46966006)(36840700001)(186003)(41300700001)(6486002)(336012)(2616005)(6506007)(6512007)(478600001)(26005)(36860700001)(53546011)(47076005)(356005)(82740400003)(81166007)(2906002)(4744005)(6862004)(5660300002)(8936002)(33656002)(82310400005)(36756003)(316002)(86362001)(40480700001)(4326008)(40460700003)(8676002)(70586007)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2022 11:41:16.7648
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 19d1aef7-369c-4194-0c59-08da6a44c1c6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7583
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Jul 2022 11:41:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168360

DQo+IE9uIDE5IEp1bCAyMDIyLCBhdCAwODo1NCwgYWthc2ggaGFka2UgdmlhIGxpc3RzLm9wZW5l
bWJlZGRlZC5vcmcgPGFrYXNoLmhhZGtlPWtwaXQuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+
IHdyb3RlOg0KPiANCj4gQWN0dWFsbHksIEkgd2FudGVkIHRvIGdldCBhbGwgcGF0Y2hlZCBDVkUg
bnVtYmVycyBmcm9tIGEgcmVjaXBlIGluIG9uZSB2YXJpYWJsZSwgYW5kIHRoZSB2YWx1ZSBvZiB0
aGF0IHZhcmlhYmxlIHdpbGwgYmUgdXNlZCBpbiBvdGhlciB0YXNrcy4gQW5kIGZvciB0aGlzIHB1
cnBvc2UsIEkgdXNlZCB0aGUgYW5vbnltb3VzIGZ1bmN0aW9uIGJlY2F1c2Ugd2l0aG91dCBpdCBJ
IHdpbGwgbm90IGJlIGFibGUgdG8gZ2V0IHRoZSB2YWx1ZSBvZiBDVkVfUEFUQ0hFRCBpbiBvdGhl
ciB0YXNrcy4gDQoNCknigJlsbCBiZSBibHVudDogd2XigJlyZSBub3QgYWRkaW5nIGEgc2NhbiBv
ZiBldmVyeSBmaWxlIHRvIGV2ZXJ5IHJlY2lwZSBpbiBldmVyeSBidWlsZCB0byB0aGlzIGNsYXNz
Lg0KDQpXaHkgbm90IGdlbmVyYXRlIHRoaXMgZGF0YSBvbi1kZW1hbmQgaW4gdGhlIHRhc2sgeW91
4oCZcmUgd3JpdGluZyB0byB1c2UgaXQ/DQoNClJvc3M=

