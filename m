Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C99C6C43334
	for <webhook@archiver.kernel.org>; Fri, 22 Jul 2022 14:30:56 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.44])
 by mx.groups.io with SMTP id smtpd.web10.8533.1658500253288671381
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Jul 2022 07:30:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=dUmxZsvg;
 spf=pass (domain: arm.com, ip: 40.107.20.44, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=J/B0Ny2Y9sWR2/+yK/jFiddRXnIrdPqNnnTs+b09mZmISUVGGIx8AwZ90LEwYRllhm9pRByxtmFOBBDIz//WSFMdVtXlB9DLPZ6/p0Zbzuf7nbgxB7IUeGdXpHtF49s7cXEiIu0sRROTARmwNGeF309k2p1+W7j889SEWfBogV41nLOjUPrxYbgE02N5f4N8IFsUJzBTiGcuNp9wQlYXAwMF66gHo7veDfreZWmotQVwlPAX9eE/5PtPQVAqtgK256Z4ddkGOYrA27q//BxIUOzAEmgq4mOBJXVOds998wlwReZd/68bJk0HTAJX8J4Qdau1ZbKVzhLtlXwRJ+mLmQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TtAG8lVv1fByyIS/N30wADLEGV84PJmwVxJzE2LmRJM=;
 b=nPLmFDXkDVp3+25Li8LSQpMxUPWy2Rr8JKkmacVICauT6tVwiMKqJXAIoKTCbgEbLLRwLZhP4kvQyEOVHoKS5a5T79hVIZQRvjkMh1SpILEhGDPwOpFE7GrkfOTdL2WUTbL1fig9CrEIRhffOvfxUhNGIWnm6ZhMfYN9fsZOmhVUNuky7L6vecC55C1Wrifqkejv1gAPtAO2eCAqOD/BJ/DpqkF/nNBOjzTHliN04nMNiji9fmOnJe4cSGAPXZt5q2zk+0LjAePwHMKQn81Qk3iefo36P89PNNq1ylu0xUeR2/vzkhdkcxT28dWG14SIkXEgOzB5LLfWEagiVEvXUQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TtAG8lVv1fByyIS/N30wADLEGV84PJmwVxJzE2LmRJM=;
 b=dUmxZsvgpUJGYTRbPXuBHrdJ1d+rpPIftI3yLrjz2BEfMiRA1KIeIKXHoFlzJUMiM1o0a4javDbyUFdylbUOkelIhXfAnuZK5WD+QF/XHXptgPXY/rxJN3PBJFFh7qWfwnE9egJmK9hJKBnbxGnWxIp3rZuqHB6G1JROpxRw9P0=
Received: from AM6P195CA0086.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:86::27)
 by DU0PR08MB8018.eurprd08.prod.outlook.com (2603:10a6:10:3e5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Fri, 22 Jul
 2022 14:30:43 +0000
Received: from AM5EUR03FT031.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:86:cafe::de) by AM6P195CA0086.outlook.office365.com
 (2603:10a6:209:86::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19 via Frontend
 Transport; Fri, 22 Jul 2022 14:30:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT031.mail.protection.outlook.com (10.152.16.111) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5458.17 via Frontend Transport; Fri, 22 Jul 2022 14:30:42 +0000
Received: ("Tessian outbound fa99bf31ee7d:v123");
 Fri, 22 Jul 2022 14:30:42 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: aa32236778cc6396
X-CR-MTA-TID: 64aa7808
Received: from d43d71085e8a.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 51EBECFD-8A68-4442-9F0D-BF105A57DF11.1;
	Fri, 22 Jul 2022 14:30:31 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 d43d71085e8a.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 22 Jul 2022 14:30:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ewK6HTtpbhhne9oo6GoRT9dOl+9uH4TwXEAGnXBxEONyQ2EUbQdHDHhQz45OfvemrFmAKJPT8vcWOigCxnwojUv/wCHQi25nSwZSEC1ZR8J36vRtJi7V/I6c5xE6dA7ETngoT6FHCUoN0s102QaVPjtZg94DTSTRd+OEIW/bl9ZQTzOLQo3RusZhlTytVo1RN06IQRc5KjuzlKMl4ZrpXux2gVu43t49bN4yFlMKm8aoQ4TAsibWbKAluoXR+oC0h7uy0988DSZ5F+9X5FuBUbHYwHVWOOuR5wKvJiziZdWjm7o9yL4Sj7aQhRZpk9yPcOCkD96KhHUkZN02b7UdvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TtAG8lVv1fByyIS/N30wADLEGV84PJmwVxJzE2LmRJM=;
 b=nxzBkZYzjS5xrImJO3lc8UoCjs8tz9UMSr2NtZJ3eWFYqUDrQjyGJy9Oe1wCYsAOLa+hHmtc9RRkR8goGGXp23J8Ccw8wukso3hrE4EZnRdQDAHGwTcBbxeggVrME1vuocPHEJwxw30VPojZZVupze36Jst3PRlYYMpmryPBxHLGcHGRKZC1gmFkv7RxnfCV12LJn5DeSB+co0FHnng3GkbgrXwctBk57IrnhP6OsKKA/m6R2T1Ull0DwLTTJqezc1p7olrve/wH5COca9qiIVRimQKfKz42liyzxpS+cbVbrKv+VhUNMj+XduL8G9KCEytsNrilf2gkkXELU5S5vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TtAG8lVv1fByyIS/N30wADLEGV84PJmwVxJzE2LmRJM=;
 b=dUmxZsvgpUJGYTRbPXuBHrdJ1d+rpPIftI3yLrjz2BEfMiRA1KIeIKXHoFlzJUMiM1o0a4javDbyUFdylbUOkelIhXfAnuZK5WD+QF/XHXptgPXY/rxJN3PBJFFh7qWfwnE9egJmK9hJKBnbxGnWxIp3rZuqHB6G1JROpxRw9P0=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by VI1PR08MB4431.eurprd08.prod.outlook.com (2603:10a6:803:fe::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Fri, 22 Jul
 2022 14:30:27 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::fc06:20ca:a7cd:4d72]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::fc06:20ca:a7cd:4d72%9]) with mapi id 15.20.5458.019; Fri, 22 Jul 2022
 14:30:27 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>
CC: Bartosz Golaszewski <brgl@bgdev.pl>,
	=?utf-8?B?RWlsw61zIE7DrSBGaGxhbm5hZ8OhaW4=?= <elizabeth.flanagan@huawei.com>,
	Jon Mason <jdmason@kudzu.us>, Jon Mason <Jon.Mason@arm.com>, Naveen Saini
	<naveen.kumar.saini@intel.com>, Patches and discussions about the oe-core
 layer <openembedded-core@lists.openembedded.org>, openembedded-devel
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-zephyr] build broken with current oe-core master
Thread-Topic: [oe] [meta-zephyr] build broken with current oe-core master
Thread-Index: AQHYnddguaP6Mj0tV0WA6zyWIX4e0q2Kc3wA
Date: Fri, 22 Jul 2022 14:30:27 +0000
Message-ID: <CB11164A-DF98-44E2-B0BF-265797DB930A@arm.com>
References: 
 <CAMRc=McXfAzcUrdTLWsHHEo8DyUwU1gUuFTBALwXpJCuA0CoEA@mail.gmail.com>
 <YtWrKcR6y1jWSFtC@kudzu.us>
 <CAMKF1sqZh=fPoYHqh-uuJL6oftkmGoDHHcZkTgivoKapFFerAQ@mail.gmail.com>
 <CAPoiz9zRWPGLSUNaeTQDO=E60cGD4zRVmnZmHFkSdVLrkx_WmA@mail.gmail.com>
 <CAMRc=MecfyMPB2B5ukhYzMdQDWL4fY=8nbfUe0LR_8hUPhNP9w@mail.gmail.com>
 <CAMKF1srBz3xL0VTZedyyf4oFgiXxn7ai4afH37yBrT63djTr3Q@mail.gmail.com>
 <CAMRc=MdFDGv=a04jn23r2v0ZoYYTACW2-KNNi2dVboU2knoDoQ@mail.gmail.com>
 <CAMKF1sr5cQeqoQum3HAdHVrv-3EbrCkMfmMzoppQUCiisLiEYA@mail.gmail.com>
 <CAMRc=Mcaaufj-2+WnUZAgwznbkxroOVDEMmX_o4aZXFxmqwF0Q@mail.gmail.com>
 <CAMKF1sr3C=MYuX4NXigMT+NdTxdMB65VhMvSK3gqBSbGi+7YXw@mail.gmail.com>
 <CAMRc=Mdz9VMMKamV+TGkABX9v1k4i5051xQvyfTVVd_FEMSEuA@mail.gmail.com>
 <CAMKF1sq4ZT91i881_tVXddV1axi+-NCJBkKizxpBUPLMuEVt8w@mail.gmail.com>
 <CAMRc=McFVfxjG6U7ectAfHaWEBe9wyb4erd+Khjug1YyWXKLyw@mail.gmail.com>
 <CAMKF1srvQZDtjtQnQPTaT2PNYZCaChCY9S9pBNVQV5ybqAjVkw@mail.gmail.com>
In-Reply-To: 
 <CAMKF1srvQZDtjtQnQPTaT2PNYZCaChCY9S9pBNVQV5ybqAjVkw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 798dc294-b500-4ace-df43-08da6beec21a
x-ms-traffictypediagnostic: 
	VI1PR08MB4431:EE_|AM5EUR03FT031:EE_|DU0PR08MB8018:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 6aSnsa8Y9Tm2tfSmsrdtxrB/eX/MhBLowZvtcZ2kunDgMB94axMtv9CiSWabEWasHxlS1U/fDoUaiFof6PCnzFoIcKpYI85ybSmf9fZ20LDz6YzB0xoPpRCa/CZLIEBfHZ/UakfNS99O/ME2Jrg2B1AdvQLMI26vhN2AGvymuTTva3sgmHHi2mINMfAW9yw6+fujiJ40q8qcbfz6kkwExPqcFuzuWe/yoET9tpudGd4myJaACPX/Frkbw+F0haPGZpLVrNVU2WKCGKOdJ3vOdEqDU0PHV2U1eqz76huzcK/cHzXtuVPnhcRfbIxxZiVmAaPgkY7Z7OsRxzxOuhYdp4AUIwj7L7hwYb3sKMlVdB3rM1bYsliSsrjnDqUSesLJzJY8JVC7pikIQkBEZwxIYZqaU6u+vNWHOOQyZ/ZQuM4NnqMiAI+CXpls4Rfykro6UDkMANSx1MJTngzyiQXYNcMFtmzxUW8LN+2W0ZNVcunw+5ZBnHYTqo3p7VdaOPbj3FRcEysRFEkOPCeepMJB6B+hew3IZ6LU8ior03R3qfInvCuoh1y1CbkDhwOQJ2G5Cqo2a0VUkJh29GnMcKbNAWwnEuvym3ON0D8c7qDtGQVj+1I5uOnS26q/HqPNqIejzzH/Tv77tl7XlHJ4E2biS/s4LXZnwhRzLa4V/BEJ68HYbRgjwK7c9MR0arVIwJDNPmzWRXh6/VQhWoX/6RBTqLcmNqwwQ+BfMTwPTi6jUG4obIwMVXPe0F/wiiaM+D6pFRx394th3nflpdMo1GlWbqAxxYGYGVYDdHtu8UFDLX4a4XkxYi9YPZCYLPSkaL0uPH6FGGJns+CxIACpbyx49zjVVleMuWXKIZF2Irk5320=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(346002)(39860400002)(376002)(396003)(136003)(6486002)(966005)(38070700005)(478600001)(71200400001)(41300700001)(33656002)(316002)(26005)(53546011)(6506007)(6512007)(2616005)(54906003)(6916009)(186003)(86362001)(2906002)(5660300002)(66946007)(64756008)(8936002)(66476007)(91956017)(66446008)(66556008)(4326008)(8676002)(76116006)(4744005)(122000001)(38100700002)(36756003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <132DED8885C4B8439F4854CACFBD7B44@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4431
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	e2b5c2a7-ab89-4fde-5d73-08da6beeb8b4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	TzCjPc8cNI42eTqNG5n0c4vkcQz3UnNtXtqokgG6gHjRsV9GWKVVTjopUkNKpdU7YMmKVVhmhc6iAAb1U6QrsdmHo7fCGzl2n/JJoZekncmEq5TC6QF8msItpd5g/q/MslqKrC+cROSo4M+Y6lnRyyiQVi4qfTcBUHtydEvT89QNyMs8piRqQ/yHKmw/b7QmXLjv3aYDTVRpYVmcAWo31+D2wSxb8ZY7ZEv+5nPa0jvcVjhIsenxXJPhJ+LrLp/bv1/LDzjxJ5hJgSjFTz6H9QDBqFUuEH8msU+qKcYaklZc2S9Nj0kM1L+OpyQY015SkIIKFFcupuKxT+jErqh2WygCZGFlhK2HfhxSePNr6O65R0FCcHf4HJRsVL5fuDYPy3buhEtbnGBBCy34M5dAMIqHg/OEW/4b1FrH4+rBK9vlJq2QNO6GHV8Ld2Iu3MDBkd0EGCjRdOzePQ6APwL97ZAirWohY1pqac9vfBmYBacZPC6ure8QK59FlLON8iF5Ct6Z5GGgMcNwj2lyFYwTbl8y8O10jReB7h9Sb7g7ky7Ww+trT/AtMP05WT02mLwtJt/c4r32OSpx+ME3boMQiy0gSfnXqJhREtoC5q+XR1jAdHBDpIilOa7+l02KN1dXFreu0yk7cR1Y7iAssn0dXB0hTFIfr6ui2JokMz7j9wLBXKU+unNUB+P2vJlxn7cQuV5tbACljKUDVkXgk3ja3A8mM/BLRcco2qNHnxajnLSiM3xT4rSVEfbslEdO5NjsZ0O3O5BjWMil7cebZEX5FzIc/+m8DT3BMKs6sG7Vt7e5QYwi2ONuxIMSCOlAZLRFTfPKEjmz3m3DxZmUgxiXyQ==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(346002)(396003)(376002)(136003)(46966006)(36840700001)(40470700004)(5660300002)(36756003)(478600001)(316002)(54906003)(36860700001)(70586007)(6486002)(4326008)(6862004)(8676002)(966005)(82310400005)(8936002)(86362001)(26005)(2616005)(2906002)(336012)(41300700001)(47076005)(53546011)(186003)(356005)(82740400003)(450100002)(81166007)(6512007)(40480700001)(40460700003)(6506007)(70206006)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2022 14:30:42.8494
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 798dc294-b500-4ace-df43-08da6beec21a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8018
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Jul 2022 14:30:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168410

T24gMjIgSnVsIDIwMjIsIGF0IDE1OjI4LCBLaGVtIFJhaiB2aWEgbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZyA8cmFqLmtoZW09Z21haWwuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdyb3RlOg0K
PiANCj4gT24gRnJpLCBKdWwgMjIsIDIwMjIgYXQgNjozNiBBTSBCYXJ0b3N6IEdvbGFzemV3c2tp
IDxicmdsQGJnZGV2LnBsPiB3cm90ZToNCj4+IA0KPj4gT24gVGh1LCBKdWwgMjEsIDIwMjIgYXQg
Mzo1MiBQTSBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPiB3cm90ZToNCj4+PiANCj4+PiBJ
IGRvbuKAmXQgc2VlIGNvbmZpZy5sb2cgZm9yIExpYnN0ZGMrKyBmb2xkZXIgaW4gdGhlcmUNCj4+
PiBDYW4geW91IHNlZSB3aHkgdGhhdOKAmXMgbWlzc2luZyA/DQo+Pj4gDQo+PiANCj4+IEkgd2Fz
IG1pc3NpbmcgYmVjYXVzZSBJIG1pc3VuZGVyc3Rvb2QgeW91IC0geW91IHdlcmUgcHJvYmFibHkg
YXNraW5nDQo+PiBmb3IgdGhlIGNvbmZpZy5sb2cgKndpdGgqIEpvbidzIHBhdGNoIGFwcGxpZWQu
DQo+PiANCj4+IEhlcmUncyB0aGUgbG9nOiBodHRwczovL2NvbnRyb2xjLmNvbS80NTQ0ZWRkOA0K
PiANCj4gcmlnaHQsIHNvIEkgY2FuIHNlZSB0aGF0IGl0cyBjaGVja2luZyBmb3IgZmNudCBmdW5j
dGlvbiBvbiBzeXN0ZW0NCj4gd2hlcmUgaXQgc2hvdWxkIG5vdCwgeW91ciB0b29sY2hhaW4NCj4g
aXMgdXNpbmcgbmV3bGliIGFuZCBJIGFtIG5vdCBzdXJlIHdoYXQgSm9uJ3MgYnVpbGQgaXMgdXNp
bmcgZm9yDQo+IHplcGh5ciwgSSBndWVzcyBpdCBjb3VsZCBiZSBwdXJlIGJhcmVtZXRhbA0KPiBp
ZiBzbywgdGhlbiBwZXJoYXBzIHdlIGhhdmUgYSBwbGFjZSB0byBsb29rIGludG8uDQo+IA0KPiBK
b24sIHdoYXRzIFRDTElCQyBzZXQgdG8gaW4gemVwaHlyJ3MgY2FzZS4NCg0KT3VyIENJIGhhcyB0
aGUgZm9sbG93aW5nIHdvcmthcm91bmQgZm9yIGEgcHJvYmxlbSB0aGF0IHdl4oCZdmUgbm90IG1h
bmFnZWQgdG8gcm9vdC1jYXVzZSBzbyBmYXI6DQoNCiAgICBFWFRSQV9PRUNPTkY6YXBwZW5kOnBu
LWdjYy1ydW50aW1lID0gIiBhY19jdl9mdW5jX2ZjbnRsPW5vICBhY19jdl9mdW5jX2dldGV4ZWNu
YW1lPW5v4oCdDQoNClJvc3MNCg0K

