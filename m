Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66FF1C27C79
	for <webhook@archiver.kernel.org>; Mon, 17 Jun 2024 10:23:04 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.61])
 by mx.groups.io with SMTP id smtpd.web11.53024.1718619774705172137
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jun 2024 03:22:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=TDRSviRi;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=TDRSviRi;
 spf=pass (domain: arm.com, ip: 40.107.8.61, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=KTLBWerMowMRN50ps9wHhmB9uWQOM6judlxK3mF4Hy3Tw9Yd2BzaZk7IlXL/sn/rD24Q3QvhBwpft9sJiIVT5R5j5hSYx3MLAH+iHdKlHvAXSfpJIQ2ROCFuW+1aNAJQQ/c6tLE7ZjsCRQiqFotbVWJGdTLDW9PSZdJrDS3ViWEVbpeSUO64Fiwe9HHFozy5x+r1hgi3n0ygMe+N5Ch9No7Z/VWg7OOfT/WhGlioIdwxkgF5KQXdw1Gr56/NwkJlSYuQWBAovY01PEs+je+5j3UMNB/FMhiNKVi6rgw1oRfLRSSS8GNV13G0OWB+BCXENlWYyKMb2jlfIoAO3nKtKw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D4AUmyeaOzEKh0vA2JDDuNL/PZMNm/sLn2HrmRSgeyo=;
 b=TiScSOh8OZet+HO49JECFJH84MWbjBIUINKQ9TIPHgnvwSLGR+bZPKicPrBvDwRCSjgk5ikxSDbbSiTeQItbxiNDq4iMs1NTO+AUntTIUkfu0lUN2974dFI5+5J6GD839OP8BBzy/p7aMn9Q87d08FgIo/TYMPiA4AjFYiqIoO2TN4TcdbHLYH+2ZbAzF+rjxixVfM8352GOrabFZZ8Q+7CkWEeWlxDkiwVcXiV+503e9NvrZQhWB5Qa5r8DNFLgFsmiRhr9VISnbZKpWALmKgrZTG+p3cNg5Fbuy7J6yjFzWUniKmWr6e1y5xJvz4mxpFhkO3FqQsqUCvLF72+Mcg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D4AUmyeaOzEKh0vA2JDDuNL/PZMNm/sLn2HrmRSgeyo=;
 b=TDRSviRiK6YbU4aubYoJLxz5nR1oztx9uZ5fvNPNSh0RvhKLD+L7t/rBgtwU3xpszNMgZBsWzEuwd50w60GOipxR6+oFBdLOED2THOLiLwmv2nGvajbirHZIVUfypuXfnokByoHwk8FC6Dwo1s22Bc33QtKgPBcCvYvOiMhGM4Y=
Received: from AS9PR06CA0594.eurprd06.prod.outlook.com (2603:10a6:20b:486::30)
 by AM0PR08MB5460.eurprd08.prod.outlook.com (2603:10a6:208:187::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Mon, 17 Jun
 2024 10:22:51 +0000
Received: from AMS0EPF000001B2.eurprd05.prod.outlook.com
 (2603:10a6:20b:486:cafe::56) by AS9PR06CA0594.outlook.office365.com
 (2603:10a6:20b:486::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30 via Frontend
 Transport; Mon, 17 Jun 2024 10:22:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001B2.mail.protection.outlook.com (10.167.16.166) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7677.15
 via Frontend Transport; Mon, 17 Jun 2024 10:22:49 +0000
Received: ("Tessian outbound 221fbec6f361:v332"); Mon, 17 Jun 2024 10:22:49 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1886b34399f041d4
X-CR-MTA-TID: 64aa7808
Received: from ac36612d5845.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 5E1CFA63-50D3-4037-BFF4-2DC086DAD40A.1;
	Mon, 17 Jun 2024 10:22:43 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ac36612d5845.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 17 Jun 2024 10:22:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JwIdxfA41iJrMFIbExf9T5J9R3PwTQ4XegfrtzZ9lmOZ/kfFY+8yF15jtKTD7fcwmMJ7bbXsktVQCR58zavOrAoJU7uElWOvPVvHmk5CjEvIkX55zdAKhpcc4HsMdXgNxOTLCT3zvnhtyHdFisnk5UAPZ+sKRdc7kx4jYftqHQbMJLaV+fzMKIgo0qkrKK1ZybT5YUCPlX6xkxooB4czHjbzaZuvxeV/J6N58cjvo4+NNQHQ/sG7KTGDaZyzNJIgWTqbzCl2p10NqGUIUtVKMNifi8orxzT0dOfPACMqCLzVKr07xNZpPaaSp03yFSnSDHqC/gMNBxYimKkiwKYczg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D4AUmyeaOzEKh0vA2JDDuNL/PZMNm/sLn2HrmRSgeyo=;
 b=c0zheOulCBcZSVqBPLpRL9DvzV8LLTlOW5vB26rtg40HqPcTWYYIbyaYsS4I6CiQ/pfx7MEfBnaMo8LD8kBpp3lsvyUVRZ/ScFo09TzHRoU+O9k5MT2P26Mki6H0Ds4cCriTFq3fIFvPJorCABWkTUf1XEMPIy5DShTzyuxZwJQ3RbAPnJ0b47u5MCO23FsFGWo42o16ES9ucK6noqRL+jT8HSmJmGV6z+vLgeozkgUlcm9d6NeFqW5ARgPzp7OwpqfKkNI9Go/M2dLHolCgI9WkG+77xkGfxrk1lcSlH7ds7QpfkU46GNBKXqXBr8U7VJxV7cL3/WS1LJeuFtZ9jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D4AUmyeaOzEKh0vA2JDDuNL/PZMNm/sLn2HrmRSgeyo=;
 b=TDRSviRiK6YbU4aubYoJLxz5nR1oztx9uZ5fvNPNSh0RvhKLD+L7t/rBgtwU3xpszNMgZBsWzEuwd50w60GOipxR6+oFBdLOED2THOLiLwmv2nGvajbirHZIVUfypuXfnokByoHwk8FC6Dwo1s22Bc33QtKgPBcCvYvOiMhGM4Y=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB9PR08MB9777.eurprd08.prod.outlook.com (2603:10a6:10:462::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Mon, 17 Jun
 2024 10:22:40 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%4]) with mapi id 15.20.7677.030; Mon, 17 Jun 2024
 10:22:39 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "rasmus.villemoes@prevas.dk" <rasmus.villemoes@prevas.dk>
CC: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] findutils: split into packages
Thread-Topic: [OE-core] [PATCH] findutils: split into packages
Thread-Index: AQHawJ0xHmDLwHG0mkKxGIscyzbg/rHLv0iA
Date: Mon, 17 Jun 2024 10:22:39 +0000
Message-ID: <D4F6D0D8-F070-43A7-81A2-EF8F2C4520B1@arm.com>
References: <20240617095954.10982-1-rasmus.villemoes@prevas.dk>
In-Reply-To: <20240617095954.10982-1-rasmus.villemoes@prevas.dk>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.600.62)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB9PR08MB9777:EE_|AMS0EPF000001B2:EE_|AM0PR08MB5460:EE_
X-MS-Office365-Filtering-Correlation-Id: f22dc8c7-ed2f-4df1-2428-08dc8eb77095
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230037|376011|1800799021|366013|38070700015;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?0xYasulKg/KJ7X+Wv9wrnadOKT64CkSfbJqPXze5XdzQyNons9XFqcEGuW5H?=
 =?us-ascii?Q?Y+J17QsDS8P9LOJ+Nbi7FWUgqaoN7k1K4goi6JuyKLmTlK3s7bNRM/46p53t?=
 =?us-ascii?Q?vHEM06sQj0rzSsuEmrdbatsNGHQ7MnEZ16t4g/T0x2OCAbcTyOG28F60zjTr?=
 =?us-ascii?Q?HNX7rltUl/pC4+wHZJInt+Vh+i8t08BBShYQy1sAg/vrBPVjZ5lik/nBdVGS?=
 =?us-ascii?Q?SVXquR1vGevIgDXk4DusO9Gh9RTEpnrrCk1/xTwUkITlUkvGYvKQ8y/xtZ0a?=
 =?us-ascii?Q?tJmotkcW7tiLFAmgFiHygmcvQ/aFWzP+oo6B8NMBlG3j2/pkVoog3IbRZAkT?=
 =?us-ascii?Q?JfdMh4oRlrCZTDeGlelpZImpciy1tfBFDApm6HOZp/gSzP090rW5PKv1LdZI?=
 =?us-ascii?Q?yH+zR5rBzPdo8Q4l/25RVeXlWH8Y8d43WNZjgtd3nLTmRIsfH1N3NyHR48EZ?=
 =?us-ascii?Q?VG8ejQ7lyqaIw45E2In0FEAAXY7X9d2dpmRyp8DYKo5/X+CXir1xdRa0RSo/?=
 =?us-ascii?Q?0ETpua6dLDuuFQFEQwBA7WNy74+JeGjPueTeqI2QyU1ie+/ddTvbTLeo6woW?=
 =?us-ascii?Q?ZqliQEl3TW9xALmdKxiJULfHL3J1fKT/LEpuip4btsxSlnLuIrN42q412Zz0?=
 =?us-ascii?Q?1T7m8rYNtkMKj+CbcBCm4K5Ln8t8YsSH2R3qktWJMIdwPvCfo+v2GtbtLkPE?=
 =?us-ascii?Q?J5A2Qs6B+6dn5dbc+XerL+92YBebd2mgtziJA3I6Dye+ryPWerwzecf8/yvr?=
 =?us-ascii?Q?SZSv4SS86NgimRWYejNitaVU4lmbUrTBQMFau2EBPu62aHZFDgaXkTbgMVJp?=
 =?us-ascii?Q?itAL5/SXgRYGmBSR79gpABXs5g4mGzbreTRVb95vvq6De8Ixqadfc3SXl4zG?=
 =?us-ascii?Q?d3pLJMQp3S/JEDl6wKfevRxvMINTQ4aBp3OCCcX+FhDy4wJZTWkffKiVV5Fs?=
 =?us-ascii?Q?7zdbkXXhjczhqH+CJ86tCUeO6K9TiWzo3FoHRhrM4htJ0QDaKPvC+jV7FRyb?=
 =?us-ascii?Q?zDVQuMk1tHAmDUYs6hZxiZaZxUw1nTAdZvhwRX22HUhNRHt00EkAj7H7yD+/?=
 =?us-ascii?Q?fUfdXvGRva4qdq5KTk5k8TyZ5oCXaMxfx2pkoRQfrEuQABcetAtuPRxkdG41?=
 =?us-ascii?Q?05dYjcI8+vJk8ZjZRnttTcVXyBrTWx6cNa10WcP833dTBpcDLKUnpJOkUMMu?=
 =?us-ascii?Q?NazFQJTUOvqaIEl95b6A+pHd9AI9TMzOFrV7PeTYfSoSz1vqnv6AklWWw5BI?=
 =?us-ascii?Q?BLnUELcPMTz2ahYFb3EvHhJA3iuOptm75hYfLtHwfXTHi2aNXMg1E2CGt7Ky?=
 =?us-ascii?Q?Z/VRBwGwjgxb/3VjKj5KjzusyuqVJaZMtY+4vS0kNMfhrlXrCSTmETRdTj24?=
 =?us-ascii?Q?yPLgbg4=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(376011)(1800799021)(366013)(38070700015);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2ECBEDF6A00F504B8A63710F51BCF171@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9777
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF000001B2.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	4ba24e41-23bf-4338-2364-08dc8eb76aad
X-Microsoft-Antispam: 
	BCL:0;ARA:13230037|36860700010|376011|82310400023|1800799021|34020700013|35042699019;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ZaPXT2CdUkl9nbJ7GqZw01X5rAIyt11CvKqOLwciyG6s6i6tahuqaeGd6Hzj?=
 =?us-ascii?Q?Dnd2yFwBk06c7BVsCgcce7VDUT8CkzoxYuKgzlvJch/1XPezzkPEGuFt8Q5m?=
 =?us-ascii?Q?KiDZx8Rj7YfkqOICP5ivWCuC8KSyjiPNmVjy67J+PUtRjc6x6Vw7V/LfBTl/?=
 =?us-ascii?Q?u4L2E00dNWs+pwfjUjZvIIURwHjJUQRCmgjtOMwOjp2+/DBLf8VHd/qZzBrY?=
 =?us-ascii?Q?byNSrHExmp+3+aHQ0ND4JCsjIfdqf4emQPFWD0+0yP4HPQp5gWA3bHW5iSKg?=
 =?us-ascii?Q?/NAFfre+M18PaKKhNUqXkR4Ka0NRooGn6pxddsQGVS8euNMlgYvp87w2gZlA?=
 =?us-ascii?Q?lwFagBUAo+K0xw9kCURc1TixrvboALIk1G5HqzajB1Lb2LPmQ50Zo5l6GyOz?=
 =?us-ascii?Q?3gu6TmZLfaVbL1rXpnzhoRSbHkuEzPT4yK047UAWseSOhP0tClc+gecdHz/M?=
 =?us-ascii?Q?g0rcfm0Ses9+lezzNdC6y4wk8FFVbGvW2dJKhiTFIxHgUrHabbAb1yyA6JLm?=
 =?us-ascii?Q?XTbjAZyZrNNS+Wb+hNafZxgMndxpcz8s2WUqVDrixLnYStl/Rq3KFXuAm+iA?=
 =?us-ascii?Q?yxPsl+I+5gjieYqYBp9JVv+y9q3BxhcV71riUvMPjT1k6S3W08ss2oIHLoQw?=
 =?us-ascii?Q?gEDGc/7CLoZLoeNsKEIN2ts5I8qXmO/KKvakjb4brKPy98QXtMyeiohUjq4L?=
 =?us-ascii?Q?xMDy+hWto2PuVwqTKTncCio1AECc+bdS/6kimbSAXCjxk6SipxPLQkAeXxwW?=
 =?us-ascii?Q?v2XjHNHx4J9ou79YFmvQ1VNiEOYF2BILMO1M4igF7WC+mrH6cj87FHzf8w7S?=
 =?us-ascii?Q?mBzNMG/FbVP/M639PPy10PfW9GQSuuZQC3Pbjadj/5zFi4sHGA7EASRyzMfE?=
 =?us-ascii?Q?u1rzD5JtdxyK/VFgMT0XQco8el24/SjzZ3AHju5ho9pizZJGej0vhM85xHpy?=
 =?us-ascii?Q?47HGb3MWoHakTj2bt8pTiZDhIBmjx0HDzOAEMMFxBlnz/m0i5nMffAQJPBJl?=
 =?us-ascii?Q?ajHMGpvzuEJk86VP2dLtkQ7V3joa3bjdmmTz1z0kYhm/XK65HS4L/Pu9WYkR?=
 =?us-ascii?Q?7ajF45DY0Wx4NVhEzeINPTmXKhGHO75fWePWwUGRc0FUJp4DprA8opXeE5hl?=
 =?us-ascii?Q?NRWj42j2NXTkvZJaJO9AxBgN6g3Ovu5KzS1HLZHcIDayXEWjR781TfAYtaFr?=
 =?us-ascii?Q?ppvgRn/dpTENHOfz4eRIjkMjJqyWy0kth4CVz7SQkVL1R/sS1fEuJCbTfhOS?=
 =?us-ascii?Q?lV3zbnU/u95SL+KVkPcTporrEyWm33YohCzI2xroBRRNEEvfM5VHHICdf6O4?=
 =?us-ascii?Q?senxI+XxPEAUA8WcC754IEZs2+lF3SDlyeqlJURAaJUMIRekYJhusRccAkPn?=
 =?us-ascii?Q?Y3FSkdkZoxSyhyTJ50Bn/MGs6KCfJglOSbnxBIqOZwm1OHtB8A=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230037)(36860700010)(376011)(82310400023)(1800799021)(34020700013)(35042699019);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2024 10:22:49.8280
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f22dc8c7-ed2f-4df1-2428-08dc8eb77095
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001B2.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5460
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jun 2024 10:23:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200805

On 17 Jun 2024, at 10:59, Rasmus Villemoes via lists.openembedded.org <rasm=
us.villemoes=3Dprevas.dk@lists.openembedded.org> wrote:
>=20
> From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
>=20
> It can be useful to have find and/or xargs by themselves without
> pulling in locate and its associated binaries updatedb and frcode. In
> my case, I just need xargs in an initramfs, which is a 42K binary; the
> other binaries add over 300K of dead weight.

busybox has both find and xargs, why is that not satisfactory for a initram=
fs?

Ross=

