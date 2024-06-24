Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21CE1C2BD09
	for <webhook@archiver.kernel.org>; Mon, 24 Jun 2024 13:10:52 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.57])
 by mx.groups.io with SMTP id smtpd.web10.140218.1719234646856194770
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jun 2024 06:10:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=BBgnjsza;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=BBgnjsza;
 spf=pass (domain: arm.com, ip: 40.107.247.57, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=H9Fesis7ZdGnMWynhFp8S//0Ezdk936hTpv0Zv2HPZE5LmM+YmcfELid2/9CGx3owLc4rAW4+k4IWr9UKmLhYw3nhnPsrpU8nTGWuAuoZuDbnb8RlPL8frqm7Nkt5aZooBWeUyaKE06tdpiYas9Fe/NY+zxVpTDq5/4JJx8bEQv4LrCDS4e8IOtoYyAOuU48ypXo5vDz4//oCKNu7ph40lh2YaqOojrItKOvI9P9QGvY1M4Wqq23Ra+CGZTEbdR6QppDhIiqpdCxzObpTmJbDcdt1lz28o/sV9q7Nhe8x7ugsMHUv/4lezzrmS+6q5dInQQKoTYPdejTIrvLxrUUaw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QVzYWiBn3CfXRbSEp19/QEVESqMf2hiZJZieSQ05oyw=;
 b=ml01XfoZ5ssgO2EwL/D6Uc63fwLLQVIDMK07X6tj6HsIGdaLML0snb5OER37zHddZwx9xfeizYQxjRjBqFHYBRGE/tJ4KP8+RFtkEsjTCaBDMaxvtJLN19c/PiAxxp4LLvz/RuWFj84oB6H3TMG2uyzaG//RlpScJV0st1N+lwwgh2Ktbuur5hMGNpLEV/EiZTj6ps/iA+jHyHoURp9DW57r+qCoYbUDJdZs+4TI3l2MSPQpU5JOJMTy7C2C9dz7MApmHDlB9nSfbGUZ8QjPAb8CEwF0LaZ+YzKmjgQCPOEQq3zhdEwJFLy4tReqnRaPxCItEUE3wN2DsnA9O51AhQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QVzYWiBn3CfXRbSEp19/QEVESqMf2hiZJZieSQ05oyw=;
 b=BBgnjsza0VW1q3brpPPnw7HmNiNC2rRD9WxylDqxZSoAYnXDTL1TNZuXUFMBitTHt7smpjV8Msu6T6xyA4/Pmi7gc9PuZiXENvdra1iGCZQKERK+B90aWVjycewJfC6zmw/p3tgcLyJV8PP1oVSgRM60oX6JTkDDdVIGyc62RiY=
Received: from AS9PR01CA0036.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:542::9) by AM8PR08MB6529.eurprd08.prod.outlook.com
 (2603:10a6:20b:354::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.29; Mon, 24 Jun
 2024 13:10:43 +0000
Received: from AMS1EPF0000004A.eurprd04.prod.outlook.com
 (2603:10a6:20b:542:cafe::9) by AS9PR01CA0036.outlook.office365.com
 (2603:10a6:20b:542::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.38 via Frontend
 Transport; Mon, 24 Jun 2024 13:10:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS1EPF0000004A.mail.protection.outlook.com (10.167.16.134) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7677.15
 via Frontend Transport; Mon, 24 Jun 2024 13:10:42 +0000
Received: ("Tessian outbound 78edc30d41dc:v347"); Mon, 24 Jun 2024 13:10:42 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0b579e672fbea256
X-CR-MTA-TID: 64aa7808
Received: from 27a11230494e.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 85EA11CE-04F6-457C-BEE0-CAFCC1B2A9AB.1;
	Mon, 24 Jun 2024 13:10:35 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 27a11230494e.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 24 Jun 2024 13:10:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QoZ+Klx9owFe3e0aQHFfEykwzSlnCyY3w1Erl0O7UQA8jyC+Ewmt02cWe+ol2gF4kYDYSf4H8kaEAjodnf7kC6G5pWywIRUBMPJUOtb69BgNC2pHws1xH22jLUeaoDIHmO05A8KYroBhBjN8Rt5qVbIQUvGH9V9NrjLr95oEdeCGb33YvAdJD9NnFAo+LKwvPBk3EUNx/KinqNNbUHInEySMJATHci8YMmJejMX482U8XYczCiY5En8zOhky6ePgT4OauAGagufxKZgjKh/uDAsCuAnC8GOOhwPmCanJvMDh1e56ERRWR3F8n3ORABg69Z/qKdoniN1MJPJ/0eVybg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QVzYWiBn3CfXRbSEp19/QEVESqMf2hiZJZieSQ05oyw=;
 b=RCu1+hcQQfD88loYHa0R+P2IF4/gOHg1MQ5cAHOHgprdchyuwwDO9ZXo2Fc83gAxkVCmfGi3hKhY+F5Uh3om+vVZ2pzRr7QdgFvX2S3onnDl7Pdg5R/dzcbJHxCEh1M+yeXszAU9ukepS4GoqBEKfzYlMkpkqa5C7Omom7rYGN3aoiUcEozf0hHLGG+ELbPxsMtLKQGn9Ph0yW37Vmq/jaznrLFnf1BcKarmxovvpaSfO68Oea2zH0BIJx53fCVprLRr/eOwIJCafM8GpBaU0QMUUSZjiLhkOPeD40DSP9git0vEh6ahsp45bA5J00swdquS/LQiRK4IQPbSLJPYYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QVzYWiBn3CfXRbSEp19/QEVESqMf2hiZJZieSQ05oyw=;
 b=BBgnjsza0VW1q3brpPPnw7HmNiNC2rRD9WxylDqxZSoAYnXDTL1TNZuXUFMBitTHt7smpjV8Msu6T6xyA4/Pmi7gc9PuZiXENvdra1iGCZQKERK+B90aWVjycewJfC6zmw/p3tgcLyJV8PP1oVSgRM60oX6JTkDDdVIGyc62RiY=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU0PR08MB9108.eurprd08.prod.outlook.com (2603:10a6:10:47a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.28; Mon, 24 Jun
 2024 13:10:32 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%4]) with mapi id 15.20.7698.025; Mon, 24 Jun 2024
 13:10:32 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Alejandro Hernandez Samaniego <alejandro@enedino.org>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v4] tclibc-picolibc: Adds a new TCLIBC variant
 to build with picolibc as C library
Thread-Topic: [OE-core] [PATCH v4] tclibc-picolibc: Adds a new TCLIBC variant
 to build with picolibc as C library
Thread-Index: AQHawaqpLc7aIiu/bEOyG9mkh/YHurHW7GcA
Date: Mon, 24 Jun 2024 13:10:32 +0000
Message-ID: <135BDB39-94D4-4F1B-9F25-73BB610DEF7B@arm.com>
References: <20240618181226.2693197-1-alejandro@enedino.org>
In-Reply-To: <20240618181226.2693197-1-alejandro@enedino.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.600.62)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU0PR08MB9108:EE_|AMS1EPF0000004A:EE_|AM8PR08MB6529:EE_
X-MS-Office365-Filtering-Correlation-Id: e372377b-a32b-4bb0-8152-08dc944f0d57
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230037|4022899006|376011|1800799021|366013|38070700015;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?f2V92xvJVf/vs+rceunKzmxOv+ngn92h26mGHsMwTZza+omc4QqkXl3+ZATC?=
 =?us-ascii?Q?LDuYRp1MVUuA2amJz7Q/PHsSZUDfYPUC1Tkr911JxrPwvM93/Hut8DfpcBmL?=
 =?us-ascii?Q?+0L9bQiHXGmPrB21f/M3EQBv87zXss8U7RVbuHOySeN6g9VPmbw7QgOo9A8i?=
 =?us-ascii?Q?bVqgcFQ3GKv9nWXGFzm0aHHambmxCR4jg+wTwXRfGAaK2Ri2V/sn97ywy+KV?=
 =?us-ascii?Q?W15lmMjs/IpvNjN8GvYexmeMyL2u1hJ7Ih9lvh+qMWya9l1BXTGyuFBacY8Q?=
 =?us-ascii?Q?SkvXJxTIrOWxQYl3EuDTOJGVe8VPGJOUnsY4VNTTvdyT4k8Fgf5/U+FeOyn7?=
 =?us-ascii?Q?k3/qxcni8F3cDy47i1zd8WSRY1sl28EFOettf0djxFnkWmj9N+Xa615b/yGN?=
 =?us-ascii?Q?c5Z7ydQrx9ZwAkuWkMTSrzO0U3ibuBmDk3ZWTF+QPYPSNtyrDNViEbXGNAoX?=
 =?us-ascii?Q?ni6fFewSP0vl5P7wPitHpyzfTTLpTlLcVOUbMtsDPGpsbdF633bnZpudPe7q?=
 =?us-ascii?Q?KVhkZXvX3jjBGdoYFP7JydjoyBoT+HlIi5I+bPjnMRdF/4j9aMbr5hZvkhCU?=
 =?us-ascii?Q?9al5OIyoaPkWugKYYkwP27t7SVq3SZt7KTQuHkDYV2TenoAN8upzSpAhc6Db?=
 =?us-ascii?Q?3bHPSyNs/riE5GZkVnETI+BTSblFZlBKZ0Y7354xEw5YrtUXDvLB/bgmV4jZ?=
 =?us-ascii?Q?j//8MBgaRM6pN9NzlC0f3ZmNVANLdE7hSAXxVyB0Br9CKg5QzFMxoTqBTJtL?=
 =?us-ascii?Q?pkGh94GRt6Ub9OJsGkwHlcdSV10JLL4shXemjYAvXhnheA+DeWhgXNLyVvan?=
 =?us-ascii?Q?zTpqh6Naqu33J8i7CUb8oddv0ezjuQfVAhUM9AeIy3A6wvmhU2g8nGhHfZBI?=
 =?us-ascii?Q?cHDELkaSrxnw/UZNCk08IVN0EbZU8B64Lh/ACxUcvHo2h7Xc8UVops+bB8Sh?=
 =?us-ascii?Q?zx/Z+uhjeywCtGnzIgT95CPzkcaaqD5DtXFBUODIVumuPzcz53FyTMAG5oOJ?=
 =?us-ascii?Q?t5+nAGNPFQsXKVMVMeiysCh+9dhs7ExTP5aLApeiD7JEYF+vDo+JHQIx5zdA?=
 =?us-ascii?Q?+ZmmuSMcTimrQ1f7JI5WoKHGTtpnBhr/bfeLLeGEHUJyBkbOWOH4+2nnuV5n?=
 =?us-ascii?Q?uUlwbvjfY67u3mvmiuHb/6VBYbqEdGj3hsPBdXbXH4mfSw7ymYXvm529aX4j?=
 =?us-ascii?Q?oFKLU9+PqsNdWhsNLyUFFCPY5U8NNXul5PgwWM9PUIaaE/vCymErxtpWfUhH?=
 =?us-ascii?Q?trJ9pgQPOc6ggZLFiVlNlvTDpKsk1craUZK5lw5cINIEsMvycWGt0WK8BroA?=
 =?us-ascii?Q?lcmI1XYtlLIR3rfuC2SF+soz?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(4022899006)(376011)(1800799021)(366013)(38070700015);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3E1D73ABBA901548B6A71D480E3CC976@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9108
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS1EPF0000004A.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	5d6df4f5-5874-4d0c-56b7-08dc944f0744
X-Microsoft-Antispam: 
	BCL:0;ARA:13230037|376011|82310400023|36860700010|35042699019|4022899006|1800799021;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?VlDruLmedEnQbkn2HKaXjDp78umNIffdZ6XSvU3wtLluwJjNvHtJRgOLpunC?=
 =?us-ascii?Q?dRNy6qba6LJOfbho0byigLnuON6cu5+sBtUXhmc5YxB3nrtua8cWbyn1sPC/?=
 =?us-ascii?Q?tFGxE4tv+ub6u0PU0FjXQ/Yu+CYN8Z5UuMqOVu/RqNLn4pR5K207apj2eJIR?=
 =?us-ascii?Q?XqB4AzBV0aEVYDlLOV7xejT3pvnzmlMIxaDjxVPE4VrUbU+nVxy0tKkXzneZ?=
 =?us-ascii?Q?EUdeogn0ZTZOYulgBdaUPrQWYdHJt3Na7nOZPSZp8zU/YbfzOfiChrlNOJp5?=
 =?us-ascii?Q?qfMQc2rHh0ILObYOstX5C0E3Jj+C35rfcbPZqZW7horSK/mPLlCqIMU0MpY4?=
 =?us-ascii?Q?x2CMP4zjPpq/yhinGnfZpPjZ/YTR1Aj+WklYqQ6rKZanAtAmKA5JmKoZMxUY?=
 =?us-ascii?Q?WWIWML8LPGm+f8AyIJint2Q7+tGQPEea1o6/DCaThpvHlA8CddIXLGPzwi2l?=
 =?us-ascii?Q?mv7+vY99CeEZHjmdS/fUrgozUpqCiRaHKHq+mwdrAtK5JjPmvQG/aUNhXlAv?=
 =?us-ascii?Q?xWH8u0f0UQ9FwdZYl9SawEykAPncND+gazAk+LtvVOkyD2DTbOYsUnfzuPhU?=
 =?us-ascii?Q?2zgYtVyzcReOXlqaEXZ2RySMw45HlN6sX5y++6/KnWGM4sJt17CyBFC0ZCmF?=
 =?us-ascii?Q?G5AscvM0LDm80XeEy9HKQZbcF9VUgs//O9KT8khNTJ4i/cwtxpwlTFKN2Qhr?=
 =?us-ascii?Q?U+NICRN+8Qk2ucYRYMz4LyiOm8ZZ7H8Gn4An+9o7tfZBMFZoGGJsPjsacKoN?=
 =?us-ascii?Q?BZa7ryeaSS5H1TdJ2e5xGmhEC6YhQbABlE4YawnmyInbpXnn/rZJx3s3MgoF?=
 =?us-ascii?Q?RNVTSwzp9K3zxER4rBJoAcLPGeYRadFxjA9F7h7WW+gWwBOVoQ533g+5jAHw?=
 =?us-ascii?Q?eGfZ0efmmGv0ZG2iUIuaNQ51XPqoPFgQoLOtNUCd8WRL7JdZg56iGtBChah8?=
 =?us-ascii?Q?nlWTeaQlrNKNSxz+ziPJFmPNfaaAvuENc84IYmr52+lQS+JqSdErEoBGIV+V?=
 =?us-ascii?Q?rrbYc7LF4RfQAMtj7Eow+gNbtPCzNF3eTqBuil5+MYA2vxE8AhI0+v6RWKIK?=
 =?us-ascii?Q?PoATqrg8V8PEIAkW5ccamBmAw+pYMhA/Q8L5J+pYpvjsaJ0fmFmDZBQCgPUK?=
 =?us-ascii?Q?IAYCZkpEEVqF2spFutSJtsD20YxQO3S/fQE99LDDibq4zoOIy2FCzDxnCT8I?=
 =?us-ascii?Q?+UzMQ+fhvZF51NRKkgMgt0ApDVVZGo3moCcOsEgY8qiM3FQXv1FS4ocaSVLA?=
 =?us-ascii?Q?lzmmqUPgF3e5kMV65mQhU1piymCRnvkhNp/2RPl+9bZ65VtN820FkkWNqFeq?=
 =?us-ascii?Q?ftV9UDAeeL/13mTkqsTGjWApOLOaSnjSjDY+xGBEaCxzIhkEkPb7lYv2gX8f?=
 =?us-ascii?Q?LX9bL1o=3D?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230037)(376011)(82310400023)(36860700010)(35042699019)(4022899006)(1800799021);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2024 13:10:42.6308
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e372377b-a32b-4bb0-8152-08dc944f0d57
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF0000004A.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6529
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Jun 2024 13:10:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201085

Can you also add a test case to oe-selftest?

Ross

> On 18 Jun 2024, at 19:12, Alejandro Hernandez Samaniego via lists.openemb=
edded.org <alejandro=3Denedino.org@lists.openembedded.org> wrote:
>=20
> Enables usage of TCLIBC=3Dpicolibc extending OE functionality to build an=
d use
> picolibc based toolchains to build baremetal applications.
>=20
> Picolibc is a set of standard C libraries, both libc and libm, designed f=
or
> smaller embedded systems with limited ROM and RAM. Picolibc includes code
> from Newlib and AVR Libc, but adresses some of newlibs concerns, it retai=
ns
> newlibs directory structure, math, string and locale implementations, but
> removed the GPL bits used to build the library, swiches old C style code =
for
> C18 and replaces autotools with meson.
>=20
> This patch adds a picolibc recipe for the C library, a picolibc-helloworl=
d
> recipe that contains an example application and a testcase that builds it=
.
>=20
> Picolibc can be built for ARM and RISCV architectures, its been tested bo=
th
> for 32 and 64 bits, the provided example recipe produces the following ou=
tput:
>=20
> hello, world
>=20
> Runqemu does not automatically show any output since it hides QEMU stderr=
 which
> is where the QEMU monitors output is directed to when using semihosting, =
but,
> manually running the same QEMU command does work properly.
>=20
> Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.o=
rg>
> ---
> meta/classes-recipe/baremetal-image.bbclass   |   4 +-
> meta/classes-recipe/cross-canadian.bbclass    |   2 +-
> meta/conf/distro/include/maintainers.inc      |   2 +
> meta/conf/distro/include/tclibc-picolibc.inc  |  40 ++++++
> meta/conf/documentation.conf                  |   2 +-
> .../conf/machine/include/riscv/arch-riscv.inc |   1 +
> meta/lib/oeqa/selftest/cases/distrodata.py    |   2 +-
> meta/lib/oeqa/selftest/cases/picolibc.py      |  18 +++
> .../picolibc/picolibc-helloworld_git.bb       |  40 ++++++
> meta/recipes-core/picolibc/picolibc.inc       |  21 ++++
> .../avoid_polluting_cross_directories.patch   | 119 ++++++++++++++++++
> .../picolibc/no-early-compiler-checks.cross   |   6 +
> meta/recipes-core/picolibc/picolibc_git.bb    |  35 ++++++
> meta/recipes-devtools/gcc/gcc-cross.inc       |   1 +
> meta/recipes-devtools/gcc/gcc-runtime.inc     |   3 +
> meta/recipes-devtools/gcc/libgcc-common.inc   |   5 +
> 16 files changed, 296 insertions(+), 5 deletions(-)
> create mode 100644 meta/conf/distro/include/tclibc-picolibc.inc
> create mode 100644 meta/lib/oeqa/selftest/cases/picolibc.py
> create mode 100644 meta/recipes-core/picolibc/picolibc-helloworld_git.bb
> create mode 100644 meta/recipes-core/picolibc/picolibc.inc
> create mode 100644 meta/recipes-core/picolibc/picolibc/avoid_polluting_cr=
oss_directories.patch
> create mode 100644 meta/recipes-core/picolibc/picolibc/no-early-compiler-=
checks.cross
> create mode 100644 meta/recipes-core/picolibc/picolibc_git.bb
>=20
> diff --git a/meta/classes-recipe/baremetal-image.bbclass b/meta/classes-r=
ecipe/baremetal-image.bbclass
> index 4e7d413626..27f2d2d10a 100644
> --- a/meta/classes-recipe/baremetal-image.bbclass
> +++ b/meta/classes-recipe/baremetal-image.bbclass
> @@ -16,8 +16,8 @@
> # See meta-skeleton for a working example.
>=20
>=20
> -# Toolchain should be baremetal or newlib based.
> -# TCLIBC=3D"baremetal" or TCLIBC=3D"newlib"
> +# Toolchain should be baremetal or newlib/picolibc based.
> +# TCLIBC=3D"baremetal" or TCLIBC=3D"newlib" or TCLIBC=3D"picolibc"
> COMPATIBLE_HOST:libc-musl:class-target =3D "null"
> COMPATIBLE_HOST:libc-glibc:class-target =3D "null"
>=20
> diff --git a/meta/classes-recipe/cross-canadian.bbclass b/meta/classes-re=
cipe/cross-canadian.bbclass
> index 1670217d69..059d9aa95f 100644
> --- a/meta/classes-recipe/cross-canadian.bbclass
> +++ b/meta/classes-recipe/cross-canadian.bbclass
> @@ -36,7 +36,7 @@ python () {
>     if d.getVar("MODIFYTOS") !=3D "1":
>         return
>=20
> -    if d.getVar("TCLIBC") in [ 'baremetal', 'newlib' ]:
> +    if d.getVar("TCLIBC") in [ 'baremetal', 'newlib', 'picolibc' ]:
>         return
>=20
>     tos =3D d.getVar("TARGET_OS")
> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
> index 42599267c1..ff24597723 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -578,6 +578,8 @@ RECIPE_MAINTAINER:pn-pcmanfm =3D "Alexander Kanavin <=
alex.kanavin@gmail.com>"
> RECIPE_MAINTAINER:pn-perf =3D "Bruce Ashfield <bruce.ashfield@gmail.com>"
> RECIPE_MAINTAINER:pn-perl =3D "Alexander Kanavin <alex.kanavin@gmail.com>=
"
> RECIPE_MAINTAINER:pn-perlcross =3D "Alexander Kanavin <alex.kanavin@gmail=
.com>"
> +RECIPE_MAINTAINER:pn-picolibc =3D "Alejandro Hernandez <alejandro@enedin=
o.org>"
> +RECIPE_MAINTAINER:pn-picolibc-helloworld =3D "Alejandro Hernandez <aleja=
ndro@enedino.org>"
> RECIPE_MAINTAINER:pn-piglit =3D "Ross Burton <ross.burton@arm.com>"
> RECIPE_MAINTAINER:pn-pigz =3D "Hongxu Jia <hongxu.jia@windriver.com>"
> RECIPE_MAINTAINER:pn-pinentry =3D "Unassigned <unassigned@yoctoproject.or=
g>"
> diff --git a/meta/conf/distro/include/tclibc-picolibc.inc b/meta/conf/dis=
tro/include/tclibc-picolibc.inc
> new file mode 100644
> index 0000000000..203765dfcb
> --- /dev/null
> +++ b/meta/conf/distro/include/tclibc-picolibc.inc
> @@ -0,0 +1,40 @@
> +#
> +# Picolibc configuration
> +#
> +
> +LIBCEXTENSION =3D "-picolibc"
> +LIBCOVERRIDE =3D ":libc-picolibc"
> +
> +PREFERRED_PROVIDER_virtual/libc ?=3D "picolibc"
> +PREFERRED_PROVIDER_virtual/libiconv ?=3D "picolibc"
> +PREFERRED_PROVIDER_virtual/libintl ?=3D "picolibc"
> +PREFERRED_PROVIDER_virtual/nativesdk-libintl ?=3D "nativesdk-glibc"
> +PREFERRED_PROVIDER_virtual/nativesdk-libiconv ?=3D "nativesdk-glibc"
> +
> +DISTRO_FEATURES_BACKFILL_CONSIDERED +=3D "ldconfig"
> +
> +IMAGE_LINGUAS =3D ""
> +
> +LIBC_DEPENDENCIES =3D " \
> +    picolibc-dbg \
> +    picolibc-dev \
> +    libgcc-dev \
> +    libgcc-dbg \
> +    libstdc++-dev  \
> +    libstdc++-staticdev \
> +"
> +
> +ASSUME_PROVIDED +=3D "virtual/crypt"
> +
> +TARGET_OS =3D "elf"
> +TARGET_OS:arm =3D "eabi"
> +
> +TOOLCHAIN_HOST_TASK ?=3D "packagegroup-cross-canadian-${MACHINE} natives=
dk-qemu nativesdk-sdk-provides-dummy"
> +TOOLCHAIN_TARGET_TASK ?=3D "${LIBC_DEPENDENCIES}"
> +TOOLCHAIN_NEED_CONFIGSITE_CACHE:remove =3D "zlib ncurses"
> +
> +# RISCV linker doesnt support PIE
> +SECURITY_CFLAGS:libc-picolibc:qemuriscv32 =3D "${SECURITY_NOPIE_CFLAGS}"
> +SECURITY_CFLAGS:libc-picolibc:qemuriscv64 =3D "${SECURITY_NOPIE_CFLAGS}"
> +
> +
> diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
> index b0591881ba..ad89142934 100644
> --- a/meta/conf/documentation.conf
> +++ b/meta/conf/documentation.conf
> @@ -421,7 +421,7 @@ TARGET_FPU[doc] =3D "Specifies the method for handlin=
g FPU code. For FPU-less targ
> TARGET_OS[doc] =3D "Specifies the target's operating system."
> TARGET_PREFIX[doc] =3D "The prefix for the cross-compile toolchain (e.g. =
arm-linux-)."
> TARGET_SYS[doc] =3D "The target system is comprised of TARGET_ARCH,TARGET=
_VENDOR and TARGET_OS."
> -TCLIBC[doc] =3D "Specifies C library (libc) variant to use during the bu=
ild process. You can select 'baremetal', 'glibc', 'musl' or 'newlib'."
> +TCLIBC[doc] =3D "Specifies C library (libc) variant to use during the bu=
ild process. You can select 'baremetal', 'glibc', 'musl', 'newlib', or 'pic=
olibc'."
> TCMODE[doc] =3D "Enables an external toolchain (where provided by an addi=
tional layer) if set to a value other than 'default'."
> TESTIMAGE_AUTO[doc] =3D "Enables test booting of virtual machine images u=
nder the QEMU emulator after any root filesystems are created and runs test=
s against those images each time an image is built."
> TEST_QEMUBOOT_TIMEOUT[doc] =3D "The time in seconds allowed for an image =
to boot before automated runtime tests begin to run against an image."
> diff --git a/meta/conf/machine/include/riscv/arch-riscv.inc b/meta/conf/m=
achine/include/riscv/arch-riscv.inc
> index 230a266563..b34064e78f 100644
> --- a/meta/conf/machine/include/riscv/arch-riscv.inc
> +++ b/meta/conf/machine/include/riscv/arch-riscv.inc
> @@ -11,5 +11,6 @@ TUNE_CCARGS:append =3D "${@bb.utils.contains('TUNE_FEAT=
URES', 'riscv64nc', ' -marc
>=20
> # Fix: ld: unrecognized option '--hash-style=3Dsysv'
> LINKER_HASH_STYLE:libc-newlib =3D ""
> +LINKER_HASH_STYLE:libc-picolibc =3D ""
> # Fix: ld: unrecognized option '--hash-style=3Dgnu'
> LINKER_HASH_STYLE:libc-baremetal =3D ""
> diff --git a/meta/lib/oeqa/selftest/cases/distrodata.py b/meta/lib/oeqa/s=
elftest/cases/distrodata.py
> index ad952c004b..043953757f 100644
> --- a/meta/lib/oeqa/selftest/cases/distrodata.py
> +++ b/meta/lib/oeqa/selftest/cases/distrodata.py
> @@ -55,7 +55,7 @@ but their recipes claim otherwise by setting UPSTREAM_V=
ERSION_UNKNOWN. Please re
>             return False
>=20
>         def is_maintainer_exception(entry):
> -            exceptions =3D ["musl", "newlib", "linux-yocto", "linux-dumm=
y", "mesa-gl", "libgfortran", "libx11-compose-data",
> +            exceptions =3D ["musl", "newlib", "picolibc", "linux-yocto",=
 "linux-dummy", "mesa-gl", "libgfortran", "libx11-compose-data",
>                           "cve-update-nvd2-native",]
>             for i in exceptions:
>                  if i in entry:
> diff --git a/meta/lib/oeqa/selftest/cases/picolibc.py b/meta/lib/oeqa/sel=
ftest/cases/picolibc.py
> new file mode 100644
> index 0000000000..e40b4fc3d3
> --- /dev/null
> +++ b/meta/lib/oeqa/selftest/cases/picolibc.py
> @@ -0,0 +1,18 @@
> +#
> +# Copyright OpenEmbedded Contributors
> +#
> +# SPDX-License-Identifier: MIT
> +#
> +
> +from oeqa.selftest.case import OESelftestTestCase
> +from oeqa.utils.commands import bitbake, get_bb_var
> +
> +class PicolibcTest(OESelftestTestCase):
> +
> +    def test_picolibc(self):
> +        compatible_machines =3D ['qemuarm', 'qemuarm64', 'qemuriscv32', =
'qemuriscv64']
> +        machine =3D get_bb_var('MACHINE')
> +        if machine not in compatible_machines:
> +            self.skipTest('This test only works with machines : %s' % ' =
'.join(compatible_machines))
> +        self.write_config('TCLIBC =3D "picolibc"')
> +        bitbake("picolibc-helloworld")
> diff --git a/meta/recipes-core/picolibc/picolibc-helloworld_git.bb b/meta=
/recipes-core/picolibc/picolibc-helloworld_git.bb
> new file mode 100644
> index 0000000000..573a571c24
> --- /dev/null
> +++ b/meta/recipes-core/picolibc/picolibc-helloworld_git.bb
> @@ -0,0 +1,40 @@
> +require picolibc.inc
> +
> +# baremetal-image overrides
> +BAREMETAL_BINNAME ?=3D "hello_picolibc_${MACHINE}"
> +IMAGE_LINK_NAME ?=3D "baremetal-picolibc-image-${MACHINE}"
> +IMAGE_NAME_SUFFIX ?=3D ""
> +QB_DEFAULT_KERNEL ?=3D "${IMAGE_LINK_NAME}.elf"
> +
> +inherit baremetal-image
> +
> +COMPATIBLE_MACHINE =3D "qemuarm|qemuarm64|qemuriscv32|qemuriscv64"
> +
> +# Use semihosting to test via QEMU
> +QB_OPT_APPEND:append =3D " -semihosting-config enable=3Don"
> +
> +# picolibc comes with a set of linker scripts, set the file
> +# according to the architecture being built.
> +PICOLIBC_LINKERSCRIPT:qemuarm64 =3D "aarch64.ld"
> +PICOLIBC_LINKERSCRIPT:qemuarm =3D "arm.ld"
> +PICOLIBC_LINKERSCRIPT:qemuriscv32 =3D "riscv.ld"
> +PICOLIBC_LINKERSCRIPT:qemuriscv64 =3D "riscv.ld"
> +
> +# Simple compile function that manually exemplifies usage; as noted,
> +# use a custom linker script, the GCC specs provided by picolibc
> +# and semihost to be able to test via QEMU's monitor
> +do_compile(){
> +    ${CC} ${CFLAGS} ${LDFLAGS} --verbose -T${S}/hello-world/${PICOLIBC_L=
INKERSCRIPT} -specs=3Dpicolibc.specs --oslib=3Dsemihost -o ${BAREMETAL_BINN=
AME}.elf ${S}/hello-world/hello-world.c
> +    ${OBJCOPY} -O binary ${BAREMETAL_BINNAME}.elf ${BAREMETAL_BINNAME}.b=
in
> +}
> +
> +do_install(){
> +    install -d ${D}/${base_libdir}/firmware
> +    install -m 755 ${B}/${BAREMETAL_BINNAME}.elf ${D}/${base_libdir}/fir=
mware/${BAREMETAL_BINNAME}.elf
> +    install -m 755 ${B}/${BAREMETAL_BINNAME}.bin ${D}/${base_libdir}/fir=
mware/${BAREMETAL_BINNAME}.bin
> +}
> +
> +FILES:${PN} +=3D " \
> +    ${base_libdir}/firmware/${BAREMETAL_BINNAME}.elf \
> +    ${base_libdir}/firmware/${BAREMETAL_BINNAME}.bin \
> +"
> diff --git a/meta/recipes-core/picolibc/picolibc.inc b/meta/recipes-core/=
picolibc/picolibc.inc
> new file mode 100644
> index 0000000000..3b380fe7af
> --- /dev/null
> +++ b/meta/recipes-core/picolibc/picolibc.inc
> @@ -0,0 +1,21 @@
> +SUMMARY =3D "C Libraries for Smaller Embedded Systems"
> +HOMEPAGE =3D "https://keithp.com/picolibc"
> +DESCRIPTION =3D "Picolibc is a set of standard C libraries, both libc an=
d libm, designed for smaller embedded systems with limited ROM and RAM. Pic=
olibc includes code from Newlib and AVR Libc."
> +SECTION =3D "libs"
> +
> +# Newlib based code but GPL related bits removed, test/printf-tests.c an=
d test/testcases.c
> +# are GPLv2 and GeneratePicolibcCrossFile.sh is AGPL3 but not part of th=
e artifacts.
> +LICENSE =3D "BSD-2-Clause & BSD-3-Clause"
> +LIC_FILES_CHKSUM =3D " \
> + file://COPYING.GPL2;md5=3D59530bdf33659b29e73d4adb9f9f6552 \
> + file://COPYING.NEWLIB;md5=3D08ae03456feb75b81cfdb359e0f1ef85 \
> + file://COPYING.picolibc;md5=3De50fa9458a40929689861ed472d46bc7 \
> + "
> +
> +BASEVER =3D "1.8.6"
> +PV =3D "${BASEVER}+git"
> +SRC_URI =3D "git://github.com/picolibc/picolibc.git;protocol=3Dhttps;bra=
nch=3Dmain"
> +SRCREV=3D"764ef4e401a8f4c6a86ab723533841f072885a5b"
> +
> +S =3D "${WORKDIR}/git"
> +B =3D "${WORKDIR}/build"
> diff --git a/meta/recipes-core/picolibc/picolibc/avoid_polluting_cross_di=
rectories.patch b/meta/recipes-core/picolibc/picolibc/avoid_polluting_cross=
_directories.patch
> new file mode 100644
> index 0000000000..da6460c95c
> --- /dev/null
> +++ b/meta/recipes-core/picolibc/picolibc/avoid_polluting_cross_directori=
es.patch
> @@ -0,0 +1,119 @@
> +Upstream-Status: Pending
> +
> +Picolibc uses its own specs file: picolibc.specs to facilitate compilati=
on, this
> +needs to be passed down to GCC via the -specs argument.
> +
> +Using this specs file overrides some of the default options our toolchai=
n was
> +built with, in this case, they modify the include_dir and lib_dir paths =
used for
> +compilation, their intention was to add support for -picolibc-prefix and
> +-picolibc-buildtype arguments via the C preprocessor.
> +
> +-isystem %{-picolibc-prefix=3D*:%*/include/; -picolibc-buildtype=3D*:/us=
r/include/%*; :/usr/include} %(picolibc_cpp)
> +
> +This had the unwanted effect of defaulting to /usr/include for include_d=
ir if
> +those arguments are not being passed, this works fine for their flow but=
 for us
> +it pollutes the include directories with paths from the host. The same e=
ffect is
> +applicable for lib_dir and for the c runtime file.
> +
> +Our toolchain relies on --sysroot to avoid using any paths from the host=
, here we
> +manually add support for a third possible argument: -sysroot , if this i=
s passed
> +then the paths used by the compiler will be relative to the path passed =
by the
> +--sysroot=3D cmdline argument, setting back the behavior that we intende=
d in the
> +first place.
> +
> +
> +Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.=
org>
> +
> +Index: git/meson.build
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- git.orig/meson.build
> ++++ git/meson.build
> +@@ -622,12 +622,13 @@ else
> + #
> + picolibc_prefix_format =3D '-picolibc-prefix=3D*:@0@'
> + picolibc_buildtype_format =3D '-picolibc-buildtype=3D*:@0@'
> ++sysroot_format =3D '-sysroot=3D*:@0@'
> + gen_format =3D '@0@'
> +=20
> + #
> + # How to glue the three options together
> + #
> +-specs_option_format =3D '%{@0@; @1@; :@2@}'
> ++specs_option_format =3D '%{@0@; @1@; @2@; :@3@}'
> +=20
> + #
> + # Build the -isystem value
> +@@ -639,10 +640,13 @@ isystem_prefix =3D picolibc_prefix_format.
> + buildtype_include_dir =3D specs_prefix_format.format(get_option('includ=
edir') / '%*')
> + isystem_buildtype =3D picolibc_buildtype_format.format(buildtype_includ=
e_dir)
> +=20
> ++sysroot_include_dir =3D '%*'
> ++isystem_sysroot =3D sysroot_format.format(sysroot_include_dir)
> ++
> + gen_include_dir =3D specs_prefix_format.format(get_option('includedir')=
)
> + isystem_gen =3D gen_format.format(gen_include_dir)
> +=20
> +-specs_isystem =3D '-isystem ' + specs_option_format.format(isystem_pref=
ix, isystem_buildtype, isystem_gen)
> ++specs_isystem =3D '-isystem ' + specs_option_format.format(isystem_pref=
ix, isystem_buildtype, isystem_sysroot, isystem_gen)
> +=20
> + #
> + # Build the non-multilib -L value
> +@@ -654,10 +658,13 @@ lib_prefix =3D picolibc_prefix_format.form
> + buildtype_lib_dir =3D specs_prefix_format.format(get_option('libdir') /=
 '%*')
> + lib_buildtype =3D picolibc_buildtype_format.format(buildtype_lib_dir)
> +=20
> ++sysroot_lib_dir =3D '%*'
> ++lib_sysroot =3D sysroot_format.format(sysroot_lib_dir)
> ++
> + gen_lib_dir =3D specs_prefix_format.format(get_option('libdir'))
> + lib_gen =3D gen_format.format(gen_lib_dir)
> +=20
> +-specs_libpath =3D '-L' + specs_option_format.format(lib_prefix, lib_bui=
ldtype, lib_gen)
> ++specs_libpath =3D '-L' + specs_option_format.format(lib_prefix, lib_bui=
ldtype, lib_sysroot, lib_gen)
> +=20
> + #
> + # Build the non-multilib *startfile options
> +@@ -669,6 +676,9 @@ crt0_prefix =3D picolibc_prefix_format.for
> + buildtype_crt0_path =3D specs_prefix_format.format(get_option('libdir')=
 / '%*' / crt0_expr)
> + crt0_buildtype =3D picolibc_buildtype_format.format(buildtype_crt0_path=
)
> +=20
> ++sysroot_crt0_path =3D '%*' + '/' + get_option('libdir') + '/' + '%*' + =
'/' + crt0_expr
> ++crt0_sysroot =3D picolibc_buildtype_format.format(sysroot_crt0_path)
> ++
> + gen_crt0_path =3D specs_prefix_format.format(get_option('libdir') / crt=
0_expr)
> + crt0_gen =3D gen_format.format(gen_crt0_path)
> +=20
> +@@ -686,10 +696,13 @@ if enable_multilib
> +   buildtype_multilib_dir =3D specs_prefix_format.format(get_option('lib=
dir') / '%*/%M')
> +   multilib_buildtype =3D picolibc_buildtype_format.format(buildtype_mul=
tilib_dir)
> +=20
> ++  sysroot_multilib_dir =3D '%*' + '/' + get_option('libdir') + '/' + '%=
*/%M'
> ++  multilib_sysroot =3D sysroot_format.format(sysroot_multilib_dir)
> ++ =20
> +   gen_multilib_dir =3D specs_prefix_format.format(get_option('libdir') =
/ '%M')
> +   multilib_gen =3D gen_format.format(gen_multilib_dir)
> +=20
> +-  specs_multilibpath =3D '-L' + specs_option_format.format(multilib_pre=
fix, multilib_buildtype, multilib_gen)
> ++  specs_multilibpath =3D '-L' + specs_option_format.format(multilib_pre=
fix, multilib_buildtype, multilib_sysroot, multilib_gen)
> +=20
> +   #
> +   # Prepend the multilib -L option to the non-multilib option
> +@@ -705,6 +718,9 @@ if enable_multilib
> +   buildtype_multilib_crt0_path =3D specs_prefix_format.format(get_optio=
n('libdir') / '%*/%M' / crt0_expr)
> +   crt0_buildtype =3D picolibc_buildtype_format.format(buildtype_multili=
b_crt0_path)
> +=20
> ++  sysroot_multilib_crt0_path =3D '%*' + prefix + '/' + get_option('libd=
ir') + '/' + '/%M' + '/' + crt0_expr
> ++  crt0_sysroot =3D sysroot_format.format(sysroot_multilib_crt0_path)
> ++ =20
> +   gen_multilib_crt0_path =3D specs_prefix_format.format(get_option('lib=
dir') / '%M' / crt0_expr)
> +   crt0_gen =3D gen_format.format(gen_multilib_crt0_path)
> + endif
> +@@ -714,7 +730,7 @@ endif
> + # above. As there's only one value, it's either the
> + # multilib path or the non-multilib path
> + #
> +-specs_startfile =3D specs_option_format.format(crt0_prefix, crt0_buildt=
ype, crt0_gen)
> ++specs_startfile =3D specs_option_format.format(crt0_prefix, crt0_buildt=
ype, crt0_sysroot, crt0_gen)
> + endif
> +=20
> + specs_data =3D configuration_data()
> diff --git a/meta/recipes-core/picolibc/picolibc/no-early-compiler-checks=
.cross b/meta/recipes-core/picolibc/picolibc/no-early-compiler-checks.cross
> new file mode 100644
> index 0000000000..87bfbad3c5
> --- /dev/null
> +++ b/meta/recipes-core/picolibc/picolibc/no-early-compiler-checks.cross
> @@ -0,0 +1,6 @@
> +# We need to explicitly bypass mesons sanity check to avoid early compil=
er errors
> +# otherwise meson will try to compile AND run test applications:
> +# ../git/meson.build:35:0: ERROR: Executables created by c compiler are =
not runnable...
> +
> +[properties]
> +skip_sanity_check=3Dtrue
> \ No newline at end of file
> diff --git a/meta/recipes-core/picolibc/picolibc_git.bb b/meta/recipes-co=
re/picolibc/picolibc_git.bb
> new file mode 100644
> index 0000000000..fdb159328f
> --- /dev/null
> +++ b/meta/recipes-core/picolibc/picolibc_git.bb
> @@ -0,0 +1,35 @@
> +require picolibc.inc
> +
> +INHIBIT_DEFAULT_DEPS =3D "1"
> +DEPENDS =3D "virtual/${TARGET_PREFIX}gcc"
> +
> +PROVIDES +=3D "virtual/libc virtual/libiconv virtual/libintl"
> +
> +COMPATIBLE_HOST:libc-musl:class-target =3D "null"
> +COMPATIBLE_HOST:libc-glibc:class-target =3D "null"
> +COMPATIBLE_MACHINE =3D "qemuarm|qemuarm64|qemuriscv32|qemuriscv64"
> +
> +SRC_URI:append =3D " file://avoid_polluting_cross_directories.patch"
> +SRC_URI:append =3D " file://no-early-compiler-checks.cross"
> +
> +# This is being added by picolibc meson files as well to avoid
> +# early compiler tests from failing, cant remember why I added it
> +# to the newlib recipe but I would assume it was for the same reason
> +TARGET_CC_ARCH:append =3D " -nostdlib"
> +
> +# When using RISCV64 use medany for both C library and application recip=
es
> +TARGET_CFLAGS:append:qemuriscv64 =3D " -mcmodel=3Dmedany"
> +
> +inherit meson
> +
> +MESON_CROSS_FILE:append =3D " --cross-file=3D${UNPACKDIR}/no-early-compi=
ler-checks.cross"
> +
> +PACKAGECONFIG ??=3D " specsdir"
> +# Install GCC specs on libdir
> +PACKAGECONFIG[specsdir] =3D "-Dspecsdir=3D${libdir},-Dspecsdir=3Dnone"
> +
> +
> +FILES:${PN}-dev:append =3D " ${libdir}/*.specs ${libdir}/*.ld"
> +
> +# No rpm package is actually created but -dev depends on it, avoid dnf e=
rror
> +DEV_PKG_DEPENDENCY:libc-picolibc =3D ""
> diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc b/meta/recipes-devto=
ols/gcc/gcc-cross.inc
> index 5b0ca15d47..c04177df5a 100644
> --- a/meta/recipes-devtools/gcc/gcc-cross.inc
> +++ b/meta/recipes-devtools/gcc/gcc-cross.inc
> @@ -34,6 +34,7 @@ EXTRA_OECONF +=3D "\
> EXTRA_OECONF:append:libc-baremetal =3D " --without-headers"
> EXTRA_OECONF:remove:libc-baremetal =3D "--enable-threads=3Dposix"
> EXTRA_OECONF:remove:libc-newlib =3D "--enable-threads=3Dposix"
> +EXTRA_OECONF:remove:libc-picolibc =3D "--enable-threads=3Dposix"
>=20
> EXTRA_OECONF_PATHS =3D "\
>     --with-gxx-include-dir=3D/not/exist${target_includedir}/c++/${BINV} \
> diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-dev=
tools/gcc/gcc-runtime.inc
> index 89b0bebcfb..1fca00f5f0 100644
> --- a/meta/recipes-devtools/gcc/gcc-runtime.inc
> +++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
> @@ -17,6 +17,7 @@ EXTRA_OECONF_PATHS =3D "\
> EXTRA_OECONF:append:linuxstdbase =3D " --enable-clocale=3Dgnu"
> EXTRA_OECONF:append =3D " --cache-file=3D${B}/config.cache"
> EXTRA_OECONF:append:libc-newlib =3D " --with-newlib --with-target-subdir"
> +EXTRA_OECONF:append:libc-picolibc =3D " --with-newlib --with-target-subd=
ir"
> EXTRA_OECONF:append:libc-baremetal =3D " --with-target-subdir"
>=20
> # Disable ifuncs for libatomic on arm conflicts -march/-mcpu
> @@ -27,6 +28,7 @@ DISABLE_STATIC:class-nativesdk ?=3D ""
>=20
> # Newlib does not support symbol versioning on libsdtcc++
> SYMVERS_CONF:libc-newlib =3D ""
> +SYMVERS_CONF:libc-picolibc =3D ""
>=20
> # Building with thumb enabled on armv6t fails
> ARM_INSTRUCTION_SET:armv6 =3D "arm"
> @@ -47,6 +49,7 @@ RUNTIMETARGET =3D "${RUNTIMELIBSSP} libstdc++-v3 libgom=
p libatomic ${RUNTIMELIBITM
> "
> # Only build libstdc++ for newlib
> RUNTIMETARGET:libc-newlib =3D "libstdc++-v3"
> +RUNTIMETARGET:libc-picolibc =3D "libstdc++-v3"
>=20
> # libiberty
> # libgfortran needs separate recipe due to libquadmath dependency
> diff --git a/meta/recipes-devtools/gcc/libgcc-common.inc b/meta/recipes-d=
evtools/gcc/libgcc-common.inc
> index d9084af51a..e3db17d700 100644
> --- a/meta/recipes-devtools/gcc/libgcc-common.inc
> +++ b/meta/recipes-devtools/gcc/libgcc-common.inc
> @@ -53,6 +53,11 @@ do_install:append:libc-newlib () {
> rmdir ${D}${base_libdir}
> fi
> }
> +do_install:append:libc-picolibc () {
> + if [ "${base_libdir}" !=3D "${libdir}" ]; then
> + rmdir ${D}${base_libdir}
> + fi
> +}
>=20
> # No rpm package is actually created but -dev depends on it, avoid dnf er=
ror
> DEV_PKG_DEPENDENCY:libc-baremetal =3D ""
> --=20
> 2.45.2
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#200882): https://lists.openembedded.org/g/openembedde=
d-core/message/200882
> Mute This Topic: https://lists.openembedded.org/mt/106746173/6875888
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ro=
ss.burton@arm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


