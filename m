Return-Path: <thomas.de_schampheleire@nokia.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74E0AC6FD1D
	for <webhook@archiver.kernel.org>; Tue,  4 Apr 2023 18:32:53 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.101])
 by mx.groups.io with SMTP id smtpd.web11.110254.1680633166750658674
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Apr 2023 11:32:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nokia.com header.s=selector2 header.b=J5sPfj0E;
 spf=pass (domain: nokia.com, ip: 40.107.22.101, mailfrom: thomas.de_schampheleire@nokia.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=esm/iVZN5sHIeYDNV4N5bFHvVNvhzVFLtuutljysfia1qlPY1HQT0ph5ODOXyyjqjWa+KUqEbRTwbAZzBti7JRKoS/z14AljQh45HaaWkPM1lPskmzusvgo1oCS2cXiaYcQySQd2xg7Ka4nbASlwH/6xaiGEfGFtiqGh9axA+TZctn5pUPd1b0G178ImyKxvZwwWz7feFHzpvDvFVTqiABELV6RVdyUNaTOK1FDgEKj/7oGXwb+Cn+tPRV9xJQDW21UXDM6VXzDMfhPwt9gDOVWych/CkTVcOs+q1Yknf4A01UQ92vSYQ1uge2waDaQsIhsRIGI3LpzdmnPDKf+I+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=riIZXw1hK7FC/yVqXu8xPiMtTW31YfgyeQNggjUvZHM=;
 b=d3At+niVxZ/dCk4EDBoZTXMqZy+sEoB7JYmwwmua2eSPvWJT7FirOszG3qoz/ohe0bGRHBIe+0MYkL5QxpGMuDbU+/0YRedMjyvLEy4pxtuYMizEOgtfvoO4UWuBeTdWbphCjihyP/AoRPolFTA3K67VJrcIFNfmqNVE0I5kFa3MoXAZ0mShEiKbIKHli9uN/8sT6yFZJ0nZ0SnAFdiAMYYYxgG0kQT3oPz4ekdrBFy+pyGbwHIo9CfQRPirrwirBZqYo6LGNggzhc8iVSLQK3yR64wMAU+bWzAqXZJHoVC9C9VNhK53uE4NE3KDMFY2YaZ4Mf7kT9gzk96YB1IgrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=riIZXw1hK7FC/yVqXu8xPiMtTW31YfgyeQNggjUvZHM=;
 b=J5sPfj0EB33WPmysE1qlxGLAMgDldqqfSvwh0/tv6j/9JNwsCcXVbSNEfluXnWqk8x/Su8dSa3JZdEZ1BA5onEJAuWam3Yap2m23cEjSvcKOdJoqikHfDnirQwVPc0RK6AXDA+qZ7GXRVTZJPPgzb2HQS6TEVmN+EW66kEoJncAlNUk2/WCtM45jDsojGqgC504HkABjfDF7sOlzbJWdtV9lv6SDdRfKrLN2XOpB3XrPslUDCCIPl5FeX+I93CaUTd29HymtlfbH/aVYkucPOGFfiSW3u45zN0m17MEllwmAjy5njYcuZe1Q9ygySa/ADLhaHhnkM6744DYAnMjFGA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia.com;
Received: from AM0PR0702MB3700.eurprd07.prod.outlook.com
 (2603:10a6:208:23::27) by PAWPR07MB9511.eurprd07.prod.outlook.com
 (2603:10a6:102:35d::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Tue, 4 Apr
 2023 18:32:44 +0000
Received: from AM0PR0702MB3700.eurprd07.prod.outlook.com
 ([fe80::447d:928b:ac32:587e]) by AM0PR0702MB3700.eurprd07.prod.outlook.com
 ([fe80::447d:928b:ac32:587e%5]) with mapi id 15.20.6254.035; Tue, 4 Apr 2023
 18:32:43 +0000
Date: Tue, 4 Apr 2023 20:32:39 +0200
From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 1/2] qemu: retain default trace backend if
 'ust' is not enabled
Message-ID: <ZCxtR+zVY7A4aGyP@antipodes>
References: <20230403143730.26123-1-thomas.de_schampheleire@nokia.com>
 <988002ed9a0e281efeea1d4a4098d486127030e6.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <988002ed9a0e281efeea1d4a4098d486127030e6.camel@linuxfoundation.org>
X-ClientProxiedBy: HE1PR0902CA0044.eurprd09.prod.outlook.com
 (2603:10a6:7:15::33) To AM0PR0702MB3700.eurprd07.prod.outlook.com
 (2603:10a6:208:23::27)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR0702MB3700:EE_|PAWPR07MB9511:EE_
X-MS-Office365-Filtering-Correlation-Id: d876282b-3650-44ee-1b63-08db353aface
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	sxvVOia3sXm2aEr4u43co0JJh3c8M9Dum1tsjCX1MyM0qrA1vXKFShaAGfQzuJFOTmpLbdbECksPluYDJBPDjxUFLhzN+SDFr9iEW7i1XrWYo8p7rqBCNLk+WyQvmdl9D5goWwscEME+rxxhaJd8fVAIkROFNJ2VLw1mQrISpfOLXWtmH9Azx/EuWQ7CGepzxI0UYrA1ibnmYUnvpoHlV7uQcyGPOtdMq3O2AwBm0XiEiksULUBV+f7o1dwjzMsbZzKM99JauwfEW9CeFPkhsvag/ZnEvCNK9uvroTBLMKe2MQZFvILYXdKyXuR8iRiAFiAHfmQecNqge+No2soJnRr0bRGdMQbCYpZPq6S+lwQZFEMg+SDg1gwmrrqmmKwWmTgp2VQCDcFGH7wts+RWkp5HQKl6Tnl3JTatWiBAr6tLTwAYm8HEsMce9y3J9yUbJUS1VGG60q+JG7Ar0SYrPTqr2pFnX308rB8XydTbayCH2bKpYqXq1N0FrWQmf/EY7vTaOfX6YDBcUnJP2jEe3e+tE/xER363fjiMOF3muKAZRFAAC3ilX45d0DEa56aURQ7d9qJbFn6HuYdq4vZ/GGvSUH1yT01T+d1wRWke0UM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0702MB3700.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(7916004)(396003)(346002)(366004)(136003)(376002)(39860400002)(451199021)(86362001)(38100700002)(6486002)(966005)(4326008)(6506007)(6512007)(9686003)(186003)(6916009)(6666004)(8676002)(4744005)(5660300002)(66476007)(66946007)(8936002)(2906002)(478600001)(316002)(41300700001)(66556008)(82960400001)(33716001)(83380400001)(67856001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cXpBZHVLZDVMU04xdGZRZHBod0pzeCt0azRUUkpUR1NtWlVJQ25hdWwxNnlx?=
 =?utf-8?B?LzBxejNxazQwSXJDRktKREwrVXhpbE1FanM0eGNtMWh4d2lVcldaMXkwZHc0?=
 =?utf-8?B?dko0Q3F3SGNwTlY1b1lEVk8wRVVXNUs4cjIyOE1DenB6dFpYSnNzSnVYZStt?=
 =?utf-8?B?T2NpQXdKK1JKRFh6NVlJaU55ZU9MQzdLeWFoVFJ6amVjWmVraHNISHJvbGo4?=
 =?utf-8?B?UUE1bW1CU1o0MCtUWS9TSVplVzRJaGtBM2FQTjhmU3RvblZMcHpsMFdGSzFJ?=
 =?utf-8?B?cncyVFVmMm11cnBId3E3dHI1ajlZaUZneUI1em1mU2RqbHFsdUVXR1RUeVpM?=
 =?utf-8?B?WVNlcHRMWmpQZ29YclRzVTJHdmxoUUtxS3BUUENNTGNlNWp2bHRxTEt3UVRK?=
 =?utf-8?B?TG1JRG8wME9qOS9pMWVZaWlGWFN1NXI2TksyT3IxMTZwMEUvczNKcWtOYmlN?=
 =?utf-8?B?ZDlHSUIrT296WktnOHBEeWpXeFdjSXV1VXZFMWlGQXVZUXFpeTJNaXhyMDFM?=
 =?utf-8?B?QUdTWGd5NHNlaThKaTNOdXlkSkI5andFYjJYbTB5TkcxVTc5ZzdCMTJvRkh1?=
 =?utf-8?B?enVZSUZiZzNodVZvWUJ3SFlMTkE4cnJZRzdIRklldytJY3lwV2U0aklZUDFn?=
 =?utf-8?B?ejBNOEUzcit1N2xWSnRqMktpY1J0VFJVbEI0QW9Jb2FjczhQZEJ5VWpYTkRq?=
 =?utf-8?B?bkdaZHpNV2RzMWpITmRGUmxKcDYwQ1U2RElmVFpXYkFvb0ZoMDZ1QWpVM2hN?=
 =?utf-8?B?REFCQjdEcVdCQllORjhQUi8wV09CT3g4bmFXM1lmRFlhS01ueWx0STZNeVlF?=
 =?utf-8?B?Zy9VVjRpdHZvYlBnS1RPOGZYZkRhTndIZXNHQmZ0SVY5K1hadU5UakdaR1ZQ?=
 =?utf-8?B?UW1OMWVBOUJZdEd3Zk5XNlpibkVieE5STGpKTDZDeTBDR0FFZnBXSmpJTmxP?=
 =?utf-8?B?QTEwZFBhSmVuUjNpekNwMTR0SlN5V2JpZWtrUEpONDJLVHBtKzhjUWRTMmRJ?=
 =?utf-8?B?L21YbFhVdnJ1MC8wd2ExTXRtOEczYkdGS2hvc0lMSytxeE1aelE3MU83dzR6?=
 =?utf-8?B?WUNWWU1rZnBPVmZIbkIraThpcnkzSVBSZ25LaXdJQXUybXpUK0N0eGlzREFF?=
 =?utf-8?B?eEZrS0g3dW9Qc0VPSXYzckV5K2pBNjlBYWV4c25GWEh0b09ySW9Lc3BNQThS?=
 =?utf-8?B?WG1KL0lhRjlPR2xjZkNGaHR1dDhjbitqS2w1QThtUGJQSmRTUmM3Q1FYREow?=
 =?utf-8?B?QVRnNHhiVjRRYlUvTng3bXN6ZWdQUjFtdzdXdk1hYjR1RlhVNFEreThZaHl0?=
 =?utf-8?B?eTQ3b0dqWEh4U1BhVVNpRGdTT0cvREppaGQ5VWY0M3VldTAzdlRjbExIZHFp?=
 =?utf-8?B?NDJ2clNTTkZkM2VMMkIvOXg0c2h0Q2dvekNVc1R5UWRsUm9RNzdzcDUzMGdV?=
 =?utf-8?B?akx4MDY1N2MxUDNERmpyeWNsV3Q2UUVTaXZLS0tlR09pUEgvSnFVU2tuREIx?=
 =?utf-8?B?dWZhNThoRU8yY0Nqa1l6U0s1MitsOWR1LytaTi91MTd3RHpWUWR3RUlhb0dS?=
 =?utf-8?B?U05nTWlTcnVnM1BXcW1qeitSbGR0L1Q0eWVSSVpHM1ZGSy82eFlzby9RckRH?=
 =?utf-8?B?a1N4QysvK2FrVjB1S0YwNnZuUkxQOERpQ1lwRFRRVklweW9vUTRKczlXS2ww?=
 =?utf-8?B?Yi9GMUp0N21yWkFPTkNPc2NwUnhkZ25TK1JDQW9QTEJIM2Joc3NZVVF5Zkpq?=
 =?utf-8?B?SnlsWFBtQUV4KzZtUGxaRnR5SmhEcjZzUTgrMWgwVUVkT0NEUlIwOW41aDZv?=
 =?utf-8?B?eFVkVUt0SXZwWmJHSngydXlZbkl3YVdEZmw5NVg3ZUZhMG1TaXBPMTV3VU5p?=
 =?utf-8?B?ejJhWDA5c3loS01zeGdwZjduQ1lnWWY2SHg5VEFhYVZid2lYR1E3QXZxeTBj?=
 =?utf-8?B?cUc2ckY0QUZaenJKaFRaTGhuWDc1SittN1JmNXpsQ21jSG5TRHFSSjhEdjhh?=
 =?utf-8?B?SGdmRzdyRnBickYxSHdvWElMUkpzTk1IRm9JU3BtKzNMeDljRjF5RmhDSGIr?=
 =?utf-8?B?YTJMM1p5dWU3bkZrOUpEbGU2UDdEK2RNRXMwU0RaOXR0QTRyK1Q1US9qajVI?=
 =?utf-8?B?a29FaGNRbE9GTUVOTWI0eEZoZHhLVWlkUlI2VW85SzZNRWU5anFheUdGc3l4?=
 =?utf-8?B?bDNaVkNlYUFWN1dFYlhYYmtFTGNoSjE4alV1WE5zbDNTemhSbkMvL2s3Rm01?=
 =?utf-8?Q?UZSb6oy0Of/26YzVEPWNliiRaBfv7j3wTG6ImPEKJo=3D?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d876282b-3650-44ee-1b63-08db353aface
X-MS-Exchange-CrossTenant-AuthSource: AM0PR0702MB3700.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 18:32:43.6537
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EqR4HSjQB24CcnNSUgBD7Ffzn0E/m2Z3BCq/6mDiRKeXqVjNYKC9d/awqC+OV6GgSrhAvfLim1p1rlidoG07aGjN+2h8DTHiz24i4+PL8dNcRnFE8+0KqXenlcTCaMvf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR07MB9511
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Apr 2023 18:32:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179704

On Tue, Apr 04, 2023 at 11:05:05AM +0100, Richard Purdie wrote:
> This triggered reproducible build test failures:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/2659/steps/12/logs/stdio
> 
> which leads to:
> 
> http://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20230403-itxd_s50/packages/diff-html/
> 
> i.e. the paths to files is being encoded the target source package
> files.
> 
> We'll need to resolve that issue before we can turn the default tracing
> on.

Thanks for reviewing/testing, v2 coming up where that should be fixed.

/Thomas

