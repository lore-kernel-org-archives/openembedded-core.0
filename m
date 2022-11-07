Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CB87C4332F
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 11:51:31 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.42])
 by mx.groups.io with SMTP id smtpd.web09.2466.1667821887379892950
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Nov 2022 03:51:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theobroma-systems.com header.s=selector1 header.b=ZzysyJs9;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.8.42, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aDNAXAio4uRM2pvcSo44vCf5AWZVg5wdBlxEv2s52vSiKDrmlBUJ6I4B9ltjmHorj/aM9Kxb6IJHpff2Ji/qxl7ygfx6vCs6W2xAOb77GWv4r2RkmzOZhBrpWIqXgz9xdiGdEjxSzoi2RyefqcAmtUVNmCttvbqxWCtRlf74cwWzbPctST6DJhTue7zXzZJ0+lcR6v1nbfvFlvHDOo05pPml7/pxU1n7GR2BmroR7j/xUkW0eKmoaX+MSSxG2d8zvjrqIu5QsdsciS+L7vW/CBhGXVrt/9En9BrjByAhgbUpJTCsiWZK193DcOX96gPxto4R7Jhi2y8knekmXI2/dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nDthUbf6cyXKNZBGP68S8gkSR50XkfieNNPxWTQFWGE=;
 b=ZQVhIZnhpBTVV9KMrzXvnu2A9MnOMSxrQ1fKHwz8LyX0ZyFhCGkLzQs0AuiqqFSP4S8Xhuuyb0oyI5ukMJbfb7dIKEvPiSI0Xbg0xp5D6ivRFWSjrB3uafdNSvb4TdQeS8R6nfQoBBKfHKzgfsiAH25aEo3bd/8YiUepA9Axjz+a0hpVKR/ydbXnXEIvfP2JDRmFPB7Jd6C66Xg8o8bxDXKVVa9pxISLTiHvc5prRWwRJQySUplsnhT/0j86QmpwwTbkIsU5B3GEL8u7tsjQ6avLh4dumg1b2wWAKUL/BzAkAcBQDSAYmOMjg4fs/K4Lseku394i+iUA/UOg2jcFYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nDthUbf6cyXKNZBGP68S8gkSR50XkfieNNPxWTQFWGE=;
 b=ZzysyJs9DCSc7Q4zZIdIQvmFVtd6WSrAqTjDeu98Sc3dvFayv3vOmxabWF57RaTZkv2KrqMWzbOqUA/UyJzmrp8OdZnGFXRoo947ddcv4x2cyEtGKCSxRH29m1xUfrcCjknSXNBNaSPNrppRHtBKO702SpuPoOLmm+4sufVPk8CQ6rv+2/1VZC6XkJ3F3zZdVceQtGlAhIlIX2egdI0Jq7Z6vAQpklgG/EJnc+1gDNYPk+PFCPThk/ZSwCIEo8SqC387iJ1VDO4r7MXoFLkzqGj8pkVKAfjZZVpwoiVRO4sxFKPo8zuDsYh1Ts65p73xJcIYy3L4ll3QWYBz6zetbA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by DB9PR04MB8463.eurprd04.prod.outlook.com (2603:10a6:10:2c0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Mon, 7 Nov
 2022 11:51:23 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::5e5e:1989:e5ec:c833]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::5e5e:1989:e5ec:c833%3]) with mapi id 15.20.5791.026; Mon, 7 Nov 2022
 11:51:23 +0000
Message-ID: <ee84650b-05e8-e101-1253-215ce6c9cbd8@theobroma-systems.com>
Date: Mon, 7 Nov 2022 12:51:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [OE-core] [master][PATCH v2] image_types: Add 7-Zip support in
 conversion types and commands
Content-Language: en-US
To: Livius <egyszeregy@freemail.hu>, openembedded-core@lists.openembedded.org
References: <00d37819-e04d-6368-47cc-10e0aa51c421@theobroma-systems.com>
 <5045.1667820828098527074@lists.openembedded.org>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <5045.1667820828098527074@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0132.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::14) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|DB9PR04MB8463:EE_
X-MS-Office365-Filtering-Correlation-Id: b5f361a5-9d7c-4663-38fc-08dac0b664d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KDKi7bmOHvHwhl6mzup64xsCUsi3mj9m/LtFL2XzTdqEgF/SXuxUmRtYqU+7txmdRi8cKIJyVZ4xAoZ1NgNm0e6aODc656XApQxHoVjtYlpg3DVoCtQH9ZnOg1OJowt3yoZ+4RgFssFJe9xI21D5LfnjcG1Cbv32G+t0DNK9oo/pNoYayDjK69DhMMo3O8OwzUGLmHB8+6qKZ+la0kHKA2ltiCo/7KmBxtgoxIXtT/kL5OJp42cpp3jlt0QiJeKYGe9Kb5zE1aQnIzxsJlRx3trpH3VSZdbu2e26ZcGnC/HBDcrLUWPzatinYAVXIMpOlg2nScP5dzdM60aQ/lAHv95Do6kRQXBCeodJJjPpxw/Rg2lyEYhUhPlvo74v7U4Fi5TjNI8qwqAGqj5in61EmFNP+tXNWwpEKEbcmuLkCS4r76qj/fjFa3M1M1HtlgoO7wSuRA6UrMAa47+6DI7Ko/vbxhU4+//KcZV1aENHHcr2t+r4bWE4vC1KYpYMFUX2cPt5LNemJEmGZLRquHueiuRRlBH5AvI7gJ6eCwwnVZ0JzM5aUQ4MXx8ghL1XwPazkRZTrPuLEMpVghh5LglAF2sVJCD066iZlI4/UsgI8QV1yjFKoJINaUaewh4r2lRzoYCXOlC6i+iBHwqQKjMYgOxITIFIpGW8GJaN2WP54vvxkyMjkkLmrcvrBCXuqoscLqbFxGeTygpGWJiFAPDhuXsC4TXmh8w7Ps6kzFVtaiFcUJud8/rMv6XjIJERcacLKyxGH/kXL9aOI3U9T8d1CCfPoQT73Znzzv0NC8PJTyw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(366004)(39850400004)(136003)(376002)(346002)(451199015)(53546011)(26005)(6506007)(2616005)(186003)(6512007)(38100700002)(83380400001)(4744005)(44832011)(5660300002)(2906002)(6486002)(316002)(478600001)(41300700001)(8936002)(8676002)(66556008)(66476007)(66946007)(36756003)(31696002)(86362001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Z3lNSmwvZk5qQ3JOYnBBb2RZR2o2WEs4NkRtZ3psYWp4TVVSUVZNbjZZdkNh?=
 =?utf-8?B?Q3FLekkwWHZaMWticGxsRjRiV3lKaVYrSjRHYm4vOUN1bW1jdytzMDdiYjdW?=
 =?utf-8?B?ZEw0bzRlK2d2aXFMbmlia3hyd1Rya3JndU43R2o0WVR4a1owR0N2RjFTeXRY?=
 =?utf-8?B?U0JwVjJ3aWV1TVY0VDBWQWVzOElUWk1qM1JEYmNacTdYNkV4aFVKNzdVczdJ?=
 =?utf-8?B?Q01iaHJCWlJwRFBRZjduTmZXSGJ2Q1NRVDhnSmxZZnJtK25seGV4RDRyemR2?=
 =?utf-8?B?ZTdVZmt5MlpoL2tKS1B2N3ZhRmdoK3ZtdUlFalJIVFhFa3h5aVdCbi9MZmNG?=
 =?utf-8?B?dUtYU1VrUlVOU3JiL1h1M2lvYXJOdjRFUmE2WTR0eXRjT2ZZSmROZ2oxaExI?=
 =?utf-8?B?OXkvNjc5aHVMWmsxbk9HZFNHL29VWFROWnY1dlArVXVRekVCWFAyQmV1d0VQ?=
 =?utf-8?B?ZXhaOHc3WjlUZXpWRVdTaEJKMzVkRHBNbThPblZPeEtvUU54aS9lV3dZTGd3?=
 =?utf-8?B?NWVkYVJjaFhmV2J4dWF2L3NjOHRTSnNBZi9PY0R6cENvRnphMUJzVTh3QStw?=
 =?utf-8?B?b04zR2VsWVdTY1E1QytHT2JhRG54V0s5eUU1d3lVUVVRZmFWSTJNZWgvYTVL?=
 =?utf-8?B?eVBtdWNFMEVNVDcxUUhSQ0FZSk1DT2JyakhmRlFXRG4xeTQ2UEROVjlJNlgw?=
 =?utf-8?B?aGtlSEQ5VFJFZEFWOE1CUlFidWZyUkVsaEx4OWlDU05taGxMTlBlNU9RZ0pa?=
 =?utf-8?B?Z2Fka0orUEczS1JkUGY3NUs1MVN0RTNTbHpwUWhLaUIwWEFrKzdad1UyY2c4?=
 =?utf-8?B?ZUUzY2xobU5xS21YbjVpcTRBSnZYYnhGbFVMYmNpWEw0ZUtEU1IrdjZsYThM?=
 =?utf-8?B?NHNSWlh6cU4ybUZWNVpWWWhjOWhEdkhDbThzMzZpRWQ4V2hQTWlkSmpZY3RV?=
 =?utf-8?B?M2Q1ejQ2cWVLa1FzRjBxWEZRNkdmRGNoRngrMVNxY0FPejROSXVlc043b3lh?=
 =?utf-8?B?NUphcXQ5RUVrSm83emprcE40UjVSSjdlOUFoM2g4ZTJybjYyTUdOdnhRSzRS?=
 =?utf-8?B?ZmlOV3JJQ2p5T3RtUzloelV1NklkQUVXZU5FdEN5cWpPUUFtU3ptQ3VMRFFX?=
 =?utf-8?B?a0pkNFZsUkF4K2NFYnpLMWs4VXBnZFROdHhoMUh4MTc3S0t3czlOQTFsUkpk?=
 =?utf-8?B?b0hqSkI2Y3ZyUmJ5RDJLaDdoeWhKWmZsWWw5R1Y1OGg5WGRGWG55TVNZNmNJ?=
 =?utf-8?B?MHpYYjVpUlh2YW1zOGdBVzFFcmwzdytCN3pKU2tHYlpqZFFBRDFRVFdzUDFB?=
 =?utf-8?B?Mi95dFR5RHBvdCtqTk5Kb2ZlQm8wcEVJeitmY1hFSXhwMmFrT3dQUDU2aU1j?=
 =?utf-8?B?NjlpRklsY3VMc2ltNnBiL2FCeU5xeTZmUCtQYUlnM2YrUm90VlJKQTBvL1V0?=
 =?utf-8?B?d252MzVoY0tyRk5yYXFyTVUwMERuT3h3ODNUaEtMNGRXeDc2WTRPYWExejFm?=
 =?utf-8?B?d0krSkczY2FRMmRDeXdiWUo1cFVtTTNNdnU1T2QxZDFFSy9ISU9MZ0dsNlRm?=
 =?utf-8?B?NXdnN05GblJWWWdoK2pkL3MrQk5FeDNLdzduNW1ZYUJ3UEExM0lHTjNodStl?=
 =?utf-8?B?SlpJTlNJR1UrbFVxS1NOTDZUTEc2SzE5WFlVVHRLVjhISnFpNnVxUndLYkoy?=
 =?utf-8?B?amRaOG9za1RHWnRobXNPdmdUNnI3M0Q3d2Y3dzhNaFJ1dlJCeDVvOGlHS3hF?=
 =?utf-8?B?aTZGckFqZkUrdmRFWnk3RVF2ZzhuYktYYjRKWHp1Y1RLdjBGcUNhaHhINm16?=
 =?utf-8?B?Q0labTJvanR2b2JMZE5aZWJxVGZ3Y1I4V0lYZ3NzWTEwQ0U1aWtFMFk5YkpE?=
 =?utf-8?B?NzBHTDA0VFRYdkJtNE13aTFOak01STVGMnR6Zk5HWnhZNDM5TXMwTWxZOExK?=
 =?utf-8?B?TENTanBoWUcxMjlDN3lRMFRLalZoeFpKUFg1Z0k4YmhsNzRvUVhtZVRqWUpD?=
 =?utf-8?B?YTRGTnArOVJoWThsNUduUmFEYWtYMWxkRDgvdGV3SGtPVUJiN3QzZDh5MGpt?=
 =?utf-8?B?a1U3eGV1TUJmOEVOd1ROL0NtVGhuYmFIZG95d2RUSldMU1VRSE90bFd5TDk1?=
 =?utf-8?B?ZzdvWk5WdjR5T2h6a3YvZk1oWkdRTEQ0VnNMUUNQTHk5Zk55V1hFRFNGdDNW?=
 =?utf-8?Q?300TbekW/M1noypD6soZSkg=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5f361a5-9d7c-4663-38fc-08dac0b664d3
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2022 11:51:23.6678
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DhszHKzjfYI3yTYD3TG7dsypl4XKsDWov9vp6XpIn5ltmiAwSCsmhV1c8RbXAIFxs8amMeVidlggObRwuC7UaUoxKKG4KdabUUIgECcT9oyeQgHyF47aUCt+H7i4kumQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8463
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 11:51:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172836

Hi Benjamin,

On 11/7/22 12:33, Livius wrote:
> Good point for this zip extension conflict, you are right. If somebody is a overzealous developer can use IMAGE_TYPES = "wic.zip wic.7zip" then sure there will be an extension conflict after the compression in deploy time. This escaped my notice this because this use case is not so realistic (normaly enough only one zip pack for wic image) but can be a real issue. 100% sure 7ZIP_EXTENSION ?= 7z can be better for default value, then it can be overridable to .zip extension in users's local.conf if needed (for example for me it .zip will be better).
> 
> Do i need to resend again the patch in a new thread/topic if i like to solve the missing signed-off issue?
> 

Yes, please make it a v2 also (git format-patch -v 2 when creating the 
patch before sending it with git-send-email).

Cheers,
Quentin

