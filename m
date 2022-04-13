Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3353FC4708A
	for <webhook@archiver.kernel.org>; Wed, 13 Apr 2022 15:48:07 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.49])
 by mx.groups.io with SMTP id smtpd.web11.3820.1649838112493500770
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Apr 2022 01:21:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=RQ0uDw8e;
 spf=pass (domain: weidmueller.com, ip: 40.107.7.49,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y17HHNPocH9NMO0PGkJS9KL9nzTzQnlmfeRBphfhglvLXQuG6GLuZhBoq9PjyW1W/SZpAIxA4AEtqIADY4TKfVuBuWQ0W21wb3KaVBwA5D+Te0JkheI8PoL0Bjtmnsxf35vj5P9nvEHELkFVZ1sAy51qPJ5q2Kk0T6g6dA5RutyUF275PtMCz203QkEzWVqa3g38ypUZdR8mQ8ATpijPly2f9wXEOKCpzKOWMrf/aU3rDQtPiOKeFTb7oN4TNYTMTVXX1ppRPLn+fajMuoOhUPwwDsuRFhPCnG7wu5Fc1Y5CZ0PZK7jqHrD8DXOG0EVuWTN1v39sHugYgweVCR7z8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Tg5aTMRndHcc8vv6KSfZxYfSiPH/rXxFK0WXQ3pIwc=;
 b=N7YgL0/tz/V7Ib4y2XdGopawEtj+OTp9PwNrDRmuH2YiCXohIzTmsMmRvgxllf3nIacCZSIXoGAqwZcXdkgmm+586Tp/R774Ay3Ffbg9HKOUFzaLE3Mxi0BVe6OxJSY9/Wo18V4H0HPWVKyW23yohCFKtXWzO8nNkupz+5h2hPvQYBDY6z50NYOA4HLgk9CGP1//USAut68juWq9rtJY1q2IZ3d7keuslxQZLgDohz2B4RQO81vVq+x8RMQPi+4xeSHapmjdybsL16PVYSmQUu1oOoDHnK8FvuB4m+DPF0yQhj8aGn5G+TZHFflROY6qu0UxhgdAKk7k4IN9LNx8pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Tg5aTMRndHcc8vv6KSfZxYfSiPH/rXxFK0WXQ3pIwc=;
 b=RQ0uDw8evKvsrIIgUQ0N6WJv3q1OztdjsBt32e5V2SGpICErO+AVhnKfGV35PpW7rOqCeXZUJ7+7uaaXtwTx/P4hSpvH2cDRy6CjLo2fK7FUoxnsqmfMdaPWiTItpw4/nXa82RRYV/DfF65ub01aOXDtkUSVgJD+M5mR/0oSElY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by VI1PR0801MB1869.eurprd08.prod.outlook.com (2603:10a6:800:88::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Wed, 13 Apr
 2022 08:21:48 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::454:7133:dd03:d8e]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::454:7133:dd03:d8e%4]) with mapi id 15.20.5144.030; Wed, 13 Apr 2022
 08:21:48 +0000
Message-ID: <7a6794ed-2ddf-b64d-ea33-cb11eb3759d2@weidmueller.com>
Date: Wed, 13 Apr 2022 10:21:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [OE-core] [PATCH] bluez5: install /var/lib/bluetooth directory
Content-Language: en-US
To: f_l_k@t-online.de, Yi Zhao <yi.zhao@windriver.com>
References: <20220408081533.1705128-1-yi.zhao@windriver.com>
 <348e8577-31f3-3ed6-393a-ebe511cb2186@weidmueller.com>
 <111d0c91-aaff-966f-6425-f4da193c29e2@windriver.com>
 <8c740cc8-8c84-9e34-ff12-8c1d5721d302@weidmueller.com>
 <bf017503-5365-98c2-3546-96b4cc4313c4@windriver.com>
 <0e14a9c4-2692-4f2e-b707-b9532706bab1@t-online.de>
 <16E4C65A42F3BFA4.4406@lists.openembedded.org>
Cc: openembedded-core@lists.openembedded.org
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
In-Reply-To: <16E4C65A42F3BFA4.4406@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P192CA0046.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:82::23) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 24e61429-371e-40c5-0a5e-08da1d26a7a4
X-MS-TrafficTypeDiagnostic: VI1PR0801MB1869:EE_
X-Microsoft-Antispam-PRVS: 
	<VI1PR0801MB18698A1A69872901EFE06C98D7EC9@VI1PR0801MB1869.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	8rIHLnkolAag2eCb02dvcoswiNI0pmRMxjFOqxH4WAcHRzO844bUZN8Ff/gyLbs+VI07IrVghmVw6JJ879GpaW2zCed94B992Z5t+K8nmqdjtSHkP90zTqVVKpqbb6OSq3lG826I4ioJ29MYs+hZ88w+WkUO29Yd/17zRTVGlfkflG74i/A3gNc2cflfAI96j4gHlk0SzaSc8mcz3RPh5j56PM9RprTmJhf8eE/uAx9tg47/3I31yIh9TEqLlUxuJpubQRRI/TShN7fleY+4TbnChiLsc9b2YOv5uNmnR+5Y8KNbklDNNQ9Vz+nbRIZqrcWdJ5ieY28I07b5L7mPHCEQDyK+oIEF9BS6g1qb2nXP4+FVCPphfqkS3aLHaaAlCXkGLXV8omUeeX+zAafc0kfpw4Wy3rGj0iDvwP6C8WgxGXbmxTkMgR95eco8KPFw8j9LkVKAoq239h61cZwxlvf+JabuxnfV6dzpi5OzVq3oC6/CXU5qSq8TZLlGeOhzdoW4XkZ9UssW9J7a8i04fUCRkgIo5jSDvk1A5cTxZtDbezLMmGwLEvDusXPf0IHtXFLeF2LrqXDbBesWlhrXvE/bW5/76Pk9UyHfVhw+P+kKcMGYSwl+h6NFNnkoiIYhVox8vkeaRzdaEoT9K92dRjeWcckc6q7z8Xhactt96KbC41/jJNZabkr8cCjg1hq/p4NlrqjdvWNyI/9WooDaOxgrcFaS5iHobwhq1tB2EJbTui9Qqtc9WcyDi1ySgVF1PZ6Ixz+Qk1CTIWoxoogi87VTGnOEY/7ubnDj8thDHGkZ61fN1zuOFlJ4NYK8pI/4TjXSFBTbTtzGvvSAwo/W4A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(26005)(38100700002)(31696002)(5660300002)(31686004)(52116002)(186003)(66946007)(36756003)(508600001)(38350700002)(2616005)(66476007)(66556008)(8676002)(6506007)(6916009)(86362001)(4744005)(316002)(4326008)(8936002)(6486002)(966005)(2906002)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UVhZcG9DeGw0dGZGSU9peFo1b2F4UjI5Ui9adm10R3NNbU1FRzI4WURkUTdo?=
 =?utf-8?B?TmxEdHFFNmxUaTJNQ1J0dW9Nbm95dk5tL3kwK2xIQ3ArTm10ZDRpUXVZcWNq?=
 =?utf-8?B?SkpYNTRjZzE2ODBKUzltQ0pUV2JQOWpZNFc4QkpSY3crZXpCMVhNWU1hK2dy?=
 =?utf-8?B?WUJmVS8rVlZqZjlidktoWXc2eHhMamJzNU1BaXdBNWROb0hEdHEvc1U2dWNs?=
 =?utf-8?B?bmN0OE1hNVJCSFd2dko0dm1QaHF0eVg0Z2REbmRsamkwTi8zVWZ1NlE2RWdQ?=
 =?utf-8?B?VW14Z2JBbm9pZ1JmbldudmhGRFBOTndiQ09ER29kRFhSWmw1K3RmQW1yY21w?=
 =?utf-8?B?MVBXMkdEeU9EZnRwdCs4a1RnWWF4OG9iZzkzbVRFY2hSWmlLaHBBNnBQTTE4?=
 =?utf-8?B?Z3Fyb2h1RTJqWUh3aTBuV2Vhc29QVmh6Z3dUQytpSGZZaUc1UGQxR2FaVTdo?=
 =?utf-8?B?MGxYRENqK09yOEdmR3hTQ0hjTXpwc1hJc09hdU12OCtYR3VEb21pSUFVaXRX?=
 =?utf-8?B?NWx1QVJ5L0Mrb1B0Rnp2OEh5YS9UclNIZkxWU09pQ3AxaVVxVmppZ1FzMXVE?=
 =?utf-8?B?SEg0VWpiWE10SE9lTVhmOWNuNFl2b1JWZmpvTHJGaFRNblNNWHZmSXptbkhZ?=
 =?utf-8?B?K1pueGxqTURkd2FMSjIvVTNCNGxLVkxGZGd1bFE5UzdHRHVQSHRjY2ppcHh1?=
 =?utf-8?B?VTJub0p0ZERrSXNvV1FUbDlQSU9xbmJjVmcvVWdjZWZYSDMxV1hPWTdhU1hh?=
 =?utf-8?B?UjQvYnJ0TjdmL0lwVlN2NC90LzhOK0FtK25CTW12b0RveXpPOFIzbFJLdkdm?=
 =?utf-8?B?Zzc0emFud1BEckVJWDBPNllBRmNCcktnY0dKeWNwRWNPbzFZTDJ3M2RSTXVP?=
 =?utf-8?B?Zmw5WlhCZytheFdsd0RKOU51ckVremFtWWdWSW4yaUVLc2dFdGlTN2EzRVZn?=
 =?utf-8?B?c3pHcHlwMGhzZ3phZEJBWWk5ZFhiOTRmVlZlVTlHdXhhdi9nOWlRTStJSTF0?=
 =?utf-8?B?Y3FpNWdWTUhwRHYydVJRN0hCZ1FsUVdQcjdqbXNrYXpKUldqNklnd0tjYkw3?=
 =?utf-8?B?bWhHZzdGV1oyUGFvNmVpajZDWEZ0UzRNNWRpZHJTZ3R6MUJwN0xibktRcXFO?=
 =?utf-8?B?ZEM2aktpOWRjekRDMm5oczl1TjVRVVd1TEZyWksxNjBWRnkvMkxERmRYTDY0?=
 =?utf-8?B?YzEyVS8rYXdxTW5RZlkrWUJRSU1QaXNyRGRZWUtrNVdpcVJRS21lcXZBNmp4?=
 =?utf-8?B?ZUZqcHFKZWl1NDhldXRpYStteVZCQzJ6enpob0RkWFlEZVVvQnpSM0dnM1BC?=
 =?utf-8?B?MDBpZFZQTmhSRTY1cEtYOTQ4Q2hzRXdDY1duRGwzOTB0andKWXlZb0xrWkFv?=
 =?utf-8?B?S2ovaUlKcFRYQW1tbHZkYmVNeE0zUlRGUlA0eXNybld6NXB0WU0zaXM0eUtT?=
 =?utf-8?B?ZDJMMEVyVW5ZdVhORTFPVXYzRVFCTzBPNEhZTGlRQ1hucUJYeHRBRXRVRUNH?=
 =?utf-8?B?NGIzM3Z2SEpaci83OHhWdDlwdDhIMHcwcHdqeXdYZkdTV1c4ZGpsZEJoMW1V?=
 =?utf-8?B?M085WTRQYlRvajFoL3JFbVJ5MjlHbEVmcmY3aVVBSnpsdUthTFVjSjYydlpk?=
 =?utf-8?B?a0RWRWprLzhnTFl1ZmpYcmordjQyT1AvSk43Q2hhS3pNQU54QkJINm5qMHRn?=
 =?utf-8?B?SEFkemZtN2c2ZkxWN1NyV1d5VnBDbTR5Q1U5M2NSbk9RRkJ5dGtNUmFuemVw?=
 =?utf-8?B?ZWFRMG05OTJmSlBqN0ZXejM5UGFMVVdMUXd2bEtYZGh5RkFydVBvZXByWXFa?=
 =?utf-8?B?S29WdlgxTm5BWXp6UC9DbUNRelphVWx0Zi9pMHQ2dVRqSlJXNUs3SEVHSHpD?=
 =?utf-8?B?Rk1IRUREc09IZTZKQ2JTb01DZnZkemtUU1pKSWdNSHkydjhzTzZuSXVBc3JC?=
 =?utf-8?B?MnNzOVhUSUIvK1RMclIvTzVSRHlPQ041WGxtRTdtZHRTa1N3Uy9SR2pCaUxV?=
 =?utf-8?B?OURVZksvM25sUC85QjRacXkzc0lGaG9mVzlGMG14M000VDBqTGVKSmdZRmNF?=
 =?utf-8?B?NGp6NDZnWWJrYmJXKythdkxQRS8yY1EvbEdWNFBKTDI1M3ZZOERTZi96RVB4?=
 =?utf-8?B?U09nWm8yZTdZU0Z0MWRlMmNyUGNYaWo2bVZBVkpZOENGN1ZMejJsR0V6Vms3?=
 =?utf-8?B?RHdiZy9XdCtYMkpRM0t0Wk1wZXFlaGd0UUxZeUtsZEVEZXp2VlFNNW5RUlRK?=
 =?utf-8?B?RjhkZDU3US9nUTdRU2ErdUlVRWlPZDF3S084aWJua0lYUEk1cUMyZCtSN0VF?=
 =?utf-8?B?WVNmelBlWWJxckwrS1V3RDI3ektRZzlwZXFEQWxBaHZNVkcraXZxb0lBNmJJ?=
 =?utf-8?Q?dNL/b+cm5qC3TsHA=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 24e61429-371e-40c5-0a5e-08da1d26a7a4
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2022 08:21:48.6416
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 7HuAomqTejwfk7gMAW8FuiYe3XH4N5fFgsirrgyPglVB+ijFXBkyBsSls60C0alzrlVDU98ZK87a9Wg+g0xE7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1869
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Apr 2022 15:48:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164308

Hi,

Am 11.04.2022 um 09:17 schrieb Stefan Herbrechtsmeier via 
lists.openembedded.org:
> Am 08.04.2022 um 22:03 schrieb Markus Volk via lists.openembedded.org:
>> also had this issue and found out, that the bluetooth service did come 
>> up, once bluetooth was enabled
>>
>> My fix was to edit like this
>>
>> ReadWritePaths=:/var/lib/bluetooth
>>
>> The colon ensures that the service won't fail if the directory doesn't 
>> exist
> 
> Regarding the documentation the ReadOnlyPaths and ReadWritePaths makes 
> not sense because ProtectSystem=full mounts /usr, boot loader and /etc 
> directories read-only.
> 
> Have somebody report the problem to the bluez project?

I have open an issue:
https://github.com/bluez/bluez/issues/329

I will post a patch when we come to a solution.

Regards
   Stefan

