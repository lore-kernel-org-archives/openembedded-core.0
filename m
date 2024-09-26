Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BBF6CCFA18
	for <webhook@archiver.kernel.org>; Thu, 26 Sep 2024 11:39:36 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.69])
 by mx.groups.io with SMTP id smtpd.web10.40342.1727350766338053367
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Sep 2024 04:39:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=m4vBHsCf;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=m4vBHsCf;
 spf=pass (domain: arm.com, ip: 40.107.22.69, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=s3X8KRjqadmeQljB74Ot96jQJQtdfmwCnkxAhvpo4w8QGw84pgzQj5WqSRc51r6TXOgLt4cU/WkdLyuKxoSQ5mB9YcPdgnRYHO4zq4nMTGVaVZVGfcmC1UBKVRBbufxSxGvmRa4ic0ZbT+FjIdvS08GwzyMYW6jACCEOqGyUesOVjBAhdTvMMc0KtojfaLfSq2/V9aLw9nv6wnUG2kRqjXT+X90ukkhwm9ZZBFXhbEPsJ2HLCm9z0eqCspd/qk1Ueyng0P+qkaM/TZD6KzIHoYXvHT8geef3P+KpI92x/AfvuAt6nxImEL0o5vjh/at+GVTD1OfBqZhqFU1g22vSqA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jw1oVO+GX5b4pilPpI57xITwEmfs4S6fwvn1b6Y+1p0=;
 b=IwqXgwGFpfJtjj6582kNs54pP1MDJEBAqCcIbZCjoik2Eeaf6AIdblQ2HiHDDo5iYQn4o0TMw5+uxMYfmX1idw+dzKwqVOtAFWiS2knimZF7TqKpq8a5VdeLuOE/t8r+g96DSdw7Zz2EF5Kb5CeLfy7geUMzCR4Bg+ZEK6b7ZCzDSzvO8Yk4PuHEiYR7mvN6YbHabv1651ARhLcP52g46ghvh+geoz0VSkSFjIIZaN0+TrJEbuD8fTk2kxIiPD4VfflIt74g1iOludiHPSHvljzk9ldXaAY+4BAsC1Q9zgeYe7Q+QsT30xMuDGzLmGo/bs1GRR3hawclUSdt43roQw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jw1oVO+GX5b4pilPpI57xITwEmfs4S6fwvn1b6Y+1p0=;
 b=m4vBHsCfjHWZHSlHRkT5f+44IZ/HQxO63lCzvSwVrAXib2WrMQG4lJ8A5sZJh1oItklzVMwbSNVeBVuG2RWB++hmDQOfrtwxY8gIzY5uRwkHqCTj4J0TvvJzMs+LPI7li5MhzCHCEdZUeYqDe00BAhUZS6WpZRiOwoMjC71Qhys=
Received: from AM0PR01CA0080.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:10e::21) by AS2PR08MB10034.eurprd08.prod.outlook.com
 (2603:10a6:20b:64b::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.13; Thu, 26 Sep
 2024 11:39:17 +0000
Received: from AMS0EPF000001A6.eurprd05.prod.outlook.com
 (2603:10a6:208:10e:cafe::69) by AM0PR01CA0080.outlook.office365.com
 (2603:10a6:208:10e::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.17 via Frontend
 Transport; Thu, 26 Sep 2024 11:39:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001A6.mail.protection.outlook.com (10.167.16.233) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7918.13
 via Frontend Transport; Thu, 26 Sep 2024 11:39:17 +0000
Received: ("Tessian outbound 245dacdadcd4:v465"); Thu, 26 Sep 2024 11:39:17 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8e89e5974508ea21
X-TessianGatewayMetadata: VQeAvV2LkyA1S//0l+fo4ug1udJXyGEB/iXNECP9XJ3Ys2TKkY6MuUgVTBuzDLAFYtUoYu8aDhbNl6rLQ3qWEZw/NCkjrgZi3mDjODGY1zjKosZQP3fEf+0J73pCc6AdSgFrFRS81ulvo5gb9U/ksEQuXDpd/aOIch8TlyOrG58=
X-CR-MTA-TID: 64aa7808
Received: from Lbfe8ffbf29a8.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 5F76DAE8-F998-400C-A54D-F0F745F67D85.1;
	Thu, 26 Sep 2024 11:39:10 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Lbfe8ffbf29a8.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 26 Sep 2024 11:39:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q5JQVvqLEFgXxyTCMpxqlJfvVkXvvC3jmXncP3B4cMAeGdizaFO9CVFI2Y53rFtYzsFAvDQ/CvH+Ch0hJrqGXhe/xPzhlkkSUgqoQAWL5tlnmGKR9QO9GpIvq7omjRjN1Z4cg9Ze2aSQVRH6YiNyPabl4IZHugrlhjvHaVl2ZH91rI66xbn5C+UBRSJDN1dcmCn6AaPBK1PDDMyFvROOTHPqstd6lFd5tjQFpnE+WeUhDG2iWh0XHi9lFptVR6lu9dRH3+Dfxp9AAFxLob7rPSO2ACCFdner8QLqxYtuUL8NIKplpJ4oEkZ126gAeQQDyx1A4qITwg2w1qBfG1m7tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jw1oVO+GX5b4pilPpI57xITwEmfs4S6fwvn1b6Y+1p0=;
 b=h6iauXjPTvYXIXUwTMxHVAc0XGNhczAakyY1tRlNlz7G3sqhRoQFtvve145pKQSXdEwyUaVUlm2259O+ALXaH5B71ywho8kBiM2VHJHCzqNL4mZMfEdC1C/NDTtLQrqBumaXNP7DHmBujINLLx7KUysX1MwQL62siXw4QxvEDEW17JDoXGLDn3UiG09CZdq45tFSPe2s9ON9Z8wcaHr6fQfG52br+n0CgBzgx0Fsavgf0H5PY6uzjhcMtvdIPrC7DmgNtAgX7hVlC1SeAz4EKcPFJmTiB01v/dZZa7WEVztyVFk3ii+CIzeJcLLJ3ygHBBghgln811klBI41x5towA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jw1oVO+GX5b4pilPpI57xITwEmfs4S6fwvn1b6Y+1p0=;
 b=m4vBHsCfjHWZHSlHRkT5f+44IZ/HQxO63lCzvSwVrAXib2WrMQG4lJ8A5sZJh1oItklzVMwbSNVeBVuG2RWB++hmDQOfrtwxY8gIzY5uRwkHqCTj4J0TvvJzMs+LPI7li5MhzCHCEdZUeYqDe00BAhUZS6WpZRiOwoMjC71Qhys=
Received: from AS4PR08MB7429.eurprd08.prod.outlook.com (2603:10a6:20b:4e1::9)
 by DBBPR08MB6041.eurprd08.prod.outlook.com (2603:10a6:10:206::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.28; Thu, 26 Sep
 2024 11:39:07 +0000
Received: from AS4PR08MB7429.eurprd08.prod.outlook.com
 ([fe80::8db5:7772:a426:2afe]) by AS4PR08MB7429.eurprd08.prod.outlook.com
 ([fe80::8db5:7772:a426:2afe%2]) with mapi id 15.20.8005.010; Thu, 26 Sep 2024
 11:39:07 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "wangmy@fujitsu.com" <wangmy@fujitsu.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 14/47] libarchive: upgrade 3.7.4 -> 3.7.5
Thread-Topic: [OE-core] [PATCH 14/47] libarchive: upgrade 3.7.4 -> 3.7.5
Thread-Index: AQHbDxdqsBd2EwhBFE+Qouc2jC+OarJp8ymA
Date: Thu, 26 Sep 2024 11:39:07 +0000
Message-ID: <8C41CD57-850C-4D45-AC8B-2C2DDD0687B2@arm.com>
References: <1727246960-20665-1-git-send-email-wangmy@fujitsu.com>
 <1727246960-20665-14-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1727246960-20665-14-git-send-email-wangmy@fujitsu.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3776.700.51)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AS4PR08MB7429:EE_|DBBPR08MB6041:EE_|AMS0EPF000001A6:EE_|AS2PR08MB10034:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e43c3b3-a4c2-44f0-eb0d-08dcde1fdacc
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?uzVyKEpdNkt3GZXdNMaS3k5x/lHS0D1508OvIjZzKrdZg74tUD7FoCoWl6lO?=
 =?us-ascii?Q?KIKVgKuK74OAkdK1/2sH4bRn+J7XqNDyOJYq1Go4r9+Cfn9wDb/P/X1nnPQX?=
 =?us-ascii?Q?W0Rsi7z8nJNt3wlaloBZvNN3cGrATRprPIynCv1GKIOVgfG9AultjWtaW5Vz?=
 =?us-ascii?Q?oigorZoL/pfuLwW57Q0miM5GW7kfVcHzBW0mMs/LK8/nBOggaJ+izxNmey/h?=
 =?us-ascii?Q?C5Fw8obe50s9xI3m/8/uGvXDj1DlDankmJZp/5UOVJMaX5o+abis6B3L7bUX?=
 =?us-ascii?Q?aQpcfaPjZrckcrrcAIT5/8cnETSGqhDrvHhm3OAU1T+g2nwgaKsWCD2rsg8J?=
 =?us-ascii?Q?9VceqD2tETG76++j1/rBJJ+qfRj6BtYBTYEFLvw3O3UKwwmViCHPvkAdSIGC?=
 =?us-ascii?Q?oEPEEyTpXsC2Hv6rYqSYmPaNQxrhG8gnY/9BSrP3cHbLJscupo92xUfDS+KO?=
 =?us-ascii?Q?K/Ad01tHZ7INf45rq2zr8hwKSU98NKntul8TWL2sVeH1oqSb1uPjF6wXr1zd?=
 =?us-ascii?Q?JQ4EnVhPTZwmGgXvUqRMNvwlQ7nYHesPbOE3A//XMkEbjMXqxksd4aC1Fdw1?=
 =?us-ascii?Q?5n8EpnvWR8QIU4gYr/MtGobBZRZ7FNbjKNnjcp6QEHEdJKJNocPxEyDa5X+X?=
 =?us-ascii?Q?geVYAZHnHM36jV0k6EGbfy6b8Ufjav4zMewRFK9guDSkgmsFt6D+3ap3X2vR?=
 =?us-ascii?Q?1mVkNdDQgSOOaWD8kJoK9VvaIINHoErsAqfUFji/WhPJlVjwl+n0elBRce2V?=
 =?us-ascii?Q?g4KEwZ/kEyHtoDHvatL8sMQVQ60IcDjbQs8dSsBhotlmd/HBVMwuLcp2ZFGk?=
 =?us-ascii?Q?oPSbu1dnrjeaJZJMII2ZIJ19KYOivw/M7UUctTxDsVP9azYiI4uKStlQSmck?=
 =?us-ascii?Q?aigbbDwOt26U9McYL6nSkpav26gKwUDbTXbD9xa1mHLVhOESXN0Wkx0bQG9t?=
 =?us-ascii?Q?XLjdoCji3r1mxUWM2FHSTT5SKetJprRSGIzZS6qRzKM2WiL7DrzrhZaSypu0?=
 =?us-ascii?Q?EuwFX1LL+QU8NcKqDuelU5kOQBk7L1KtZjXboAI/EEOLF0WbSaFRFhjoEsk6?=
 =?us-ascii?Q?jhMH2BqokYU5KfPlzzIc+RDafZ0n+z0VEnBrq31x0gJjLmndJ2JW+l0Ck07u?=
 =?us-ascii?Q?Jl2OMjyOzEqqiGmIoJRvB6+vols0gzqm+Rs7zqfv/BMDeHHN3B8BycYA74JF?=
 =?us-ascii?Q?deY6es8EiXN+1anWIXQ/KB1LUDz0/LaUYt794UeaFyrDvHVmUs+M3qeTG9WR?=
 =?us-ascii?Q?vUKj/L5VQqm2CzpcRQRcmzfgXk/s10RwdU+epZXImLI30kiRhONUUrGCFrx5?=
 =?us-ascii?Q?SR35ojoNt/mpaXsm4ehzfblgG4YhvGlP362HZWGbLBip8jiwex9PkVn8QSBx?=
 =?us-ascii?Q?6JfkQYPd9CyOFbMrKfRdKzuOt/P1olEZqf0qUO69jP8pQwW3lg=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR08MB7429.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <AD274A51D9763D46B198AE8454ECD87A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6041
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:20b:4e1::9];domain=AS4PR08MB7429.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF000001A6.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	2c49f630-a40b-494c-3720-08dcde1fd4e6
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|376014|35042699022|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?t3AZNHlYWk7BDxUuKwzHIitjr/uLR3Wxf9XB7v22sjFrSZIcvmTJZBfNTNvr?=
 =?us-ascii?Q?5+CF3PfK1LqZaKf5jHzJX/ho2Np2wRnaqvC9vQZNMs9XfOJYwujuTzQa4LwF?=
 =?us-ascii?Q?gNCxxtS34QewFZd6j6RfdvnDCMeL2uizhyjIX3Ho2bH3bxzoS0TYnNv2OqLT?=
 =?us-ascii?Q?hhrbopB7GxIPqTzaKhJFOyA+MRNHB/lnOdG1e5JWCI7XrCjUkhXxDtsEKKjb?=
 =?us-ascii?Q?I/EPxLykdnqKN3kWG4IVv3zF8fJzJXVpQ+sIHKC5fjnWY8LWnUvf+z6WDQte?=
 =?us-ascii?Q?KhqT4jyrxMxfBw98k8wxX7Fakr9J7fve5SL3f/Sg7Sy1S/cLBeo7/hfRuYtm?=
 =?us-ascii?Q?vRjNVF6kGuAPuLjrjn6AXLtMBeAuNFWFgjtB4gkDzLZMKW0Z+02Nuzm+UbrX?=
 =?us-ascii?Q?xBRtFFH2xnIAodlCLVAM9UYSvsDwKYN7hfRKtotVAPsGc361gsD9LbSiX06g?=
 =?us-ascii?Q?Ejlg3zTUg9Tf14fDFZQac5ptcOXgOfcD7VHsaxMd0vyfyZeb0xZH/WUgnAqw?=
 =?us-ascii?Q?m5UXksQNEiNX/jjNJGkqo1KKCR2PQCQt4Y4+Mwp9RWg6k82vQuorv1jlj6Uz?=
 =?us-ascii?Q?SSeL2Vh+vOmcLQ+1lAvaXP0e7EwPuSWisznB2CtN5hBM1ZY/IkDfsCibuQ1q?=
 =?us-ascii?Q?lmj2aHOybFDkz5tB4f75WwzH3E44dJX/Bd59jBFI/rX8o2NpHA3LLfeQFdzP?=
 =?us-ascii?Q?LuJhw6GcwtabkHDXn8WLbt7TeUea8m7PEELaAGiMh5LUV4y+58PQ5q+uVIaC?=
 =?us-ascii?Q?rqVJjSd9GrwCavxB3pR+qVcr3s8/9wLlafqQEuOaicK5KkRBumUmOezBMwPW?=
 =?us-ascii?Q?vRo9Bd6OBCPlUGkaDUBn4nGLhVzg9wr74Hrm4fGSGFVYET76+5TEuLE4kCvh?=
 =?us-ascii?Q?ityWTT3mk7AHijy4jUauSnuMrReBpD7beAiGFUlpLnxPs2L8TkDhaEORCn3z?=
 =?us-ascii?Q?BqOiqk+Upisf0XyjprgvbapuF3tg6yiowkUPBmjgAG4AQekROcStcju29OIz?=
 =?us-ascii?Q?+LkjpW9deUjey6H0aW4Jkppo8RG51lD8iEMm8EzrRKp39jv3liZaeZETbY+T?=
 =?us-ascii?Q?nIjpWoPuuiiZUVxqYU7Un6ZZNKMtdvvdqDMkV89YZecoJL7Ycut+mSuTgaZL?=
 =?us-ascii?Q?H7CISzXmk9d3IwM6I7/OBNftJJuh3ppS+ZcjMEhgePmlV52uQbZEsLY7Opu9?=
 =?us-ascii?Q?hLOZ4PQu+MEmWqt8FvVZsRXZkB9m2LA+yyaS9dcI2ZMf/ouTUMUlnPPgTJ/K?=
 =?us-ascii?Q?/xktC+JImWhHWpyB839UOXw4CB0geNhvdp1P8OsDlkSw5ZBnCDtFgKB6LWKz?=
 =?us-ascii?Q?PalpZ6WpuAN+XekmI3B0tVInBs5cI0tpeiRk9GwaZCiGrtf7qjmcEkTXGA2w?=
 =?us-ascii?Q?BwoW8BW9h1uLamcrkYMJDZd/wOnq?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(35042699022)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2024 11:39:17.5514
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e43c3b3-a4c2-44f0-eb0d-08dcde1fdacc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001A6.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10034
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Sep 2024 11:39:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204975



> On 25 Sep 2024, at 07:48, wangmy via lists.openembedded.org <wangmy=3Dfuj=
itsu.com@lists.openembedded.org> wrote:
>=20
> configurehack.patch
> refreshed for 3.7.5
>=20
> Changelog:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> - fix multiple vulnerabilities identified by SAST
> - cpio: ignore out-of-range gid/uid/size/ino and harden AFIO parsing
> - lzop: prevent integer overflow
> - rar4: protect copy_from_lzss_window_to_unp()
> - rar4: fix CVE-2024-26256
> - rar4: fix OOB in delta and audio filter
> - rar4: fix out of boundary access with large files
> - rar4: add boundary checks to rgb filter
> - rar4: fix OOB access with unicode filenames
> - rar5: clear 'data ready' cache on window buffer reallocs
> - rpm: calculate huge header sizes correctly
> - unzip: unify EOF handling
> - util: fix out of boundary access in mktemp functions
> - uu: stop processing if lines are too long
> - 7zip: fix issue when skipping first file in 7zip archive that is a mult=
iple of 65536 bytes
> - ar: fix archive entries having no type
> - lha: do not allow negative file sizes
> - lha: fix integer truncation on 32-bit systems
> - shar: check strdup return value
> - rar5: don't try to read rediculously long names
> - xar: fix another infinite loop and expat error handling
> - many Windows fixes, cleanups and improvements

This causes python-libarchive-c to fail ptests:

{'python3-libarchive-c': ['tests/test_entry.py:test_check_archiveentry_usin=
g_python_testtar']}

Ross=

