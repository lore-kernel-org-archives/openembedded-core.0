Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EDDFC433EF
	for <webhook@archiver.kernel.org>; Wed,  8 Dec 2021 08:27:23 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (EUR02-AM5-obe.outbound.protection.outlook.com [40.107.0.69])
 by mx.groups.io with SMTP id smtpd.web08.9532.1638952039654847162
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 00:27:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=AuoQEyjV;
 spf=pass (domain: weidmueller.com, ip: 40.107.0.69,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AU/MjztxyN99J+ucZQPhYR+q0TU5p2cJUKHa1DJ0fgrFpDfpT2/+4nmm5vPCysbVxnL5kxqnZ9IvyQRiwQNEpqr0NhnBMuEuvzED1p+Zz4AY38uzL85DPDYUHpsGy87Y3GhNYdOZXqz0Z7voU6qpZT322fmCficskk5a2uLQKST63j3Gy2/rSVCvDGxGd3QW/vKRHAPHz+eU7TghW9UVRTAHaxFTEdTVg4H94NqrMm+ugDsIEVim+wxDZenT4U7C936hFLw3yUfEVYCGMEyLzF5Q3oAJMcrxefFx12/0vPsXKfOlhsE7rbBhmuGUwpsWHWQxyh9mWxFQs5nNbcA2PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5kLvATtiXwpD3bEybPYzssPzgJR+PdRkB5nkeeYI1Bo=;
 b=bxRic6R3fN9lVbYDUf5CteWm3rloTgjwd6L53GqXIYUyOf6nJie/Z+l5ycQHJSfqpKESjqw/vIzo6j+YUt5wKf89dFfGBfv9fxji+h50EsJML22KxFLLIGnYIa8p8NZ4Tn6RjEua22ZgCQAv04O0+LzGj9FVUuSEHKBhO6onRkqpqP1JDwZiq8COgav52vbsJq77JSjI5M3AtA1+A6hwUKpCezAb1shmzGpsIf5CkQvv/SYAOq7oNnW30C1n+cGx3/DSCu5BKLkl74x0MKJBNBvRvgOCASRXILQDaptslffiogj8tap8u65THGTJK+wTfUvJpi7wwmE5oud6E4ttww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5kLvATtiXwpD3bEybPYzssPzgJR+PdRkB5nkeeYI1Bo=;
 b=AuoQEyjV2dVjRs3IZiDgjr9vzltvJZXCm/THIp9+t5MlPn4vN7Gd4jS6/9UtXiyT/GUY5cJ0SyZ7UXo97HCCPO4SlZqPQA7e2IPz9RQuQFqL7YMJTXxvUcHMyaZVAZ+rEs2g4gM1PhiI/fktbDywkHzUQV1J3Fa84QMoT4zGS2k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by PAXPR08MB6413.eurprd08.prod.outlook.com (2603:10a6:102:de::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.22; Wed, 8 Dec
 2021 08:27:16 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::f:41c4:eb10:5010]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::f:41c4:eb10:5010%8]) with mapi id 15.20.4734.024; Wed, 8 Dec 2021
 08:27:16 +0000
Message-ID: <e7ee85f4-b1de-9d49-bc04-2a213f0e6f36@weidmueller.com>
Date: Wed, 8 Dec 2021 09:27:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [OE-core] [PATCH 1/4] recipetool: Set master branch only as
 fallback
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
 OE-core <openembedded-core@lists.openembedded.org>,
 Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
References: <20211206080406.3249-1-stefan.herbrechtsmeier-oss@weidmueller.com>
 <9dd70fe87463e8d9cfa9cb0c612ecbc7bd150b7d.camel@linuxfoundation.org>
 <3cda9bd5-1c75-7269-921c-97c1ac6c4fb5@weidmueller.com>
 <CANNYZj9W613_D++e=OH63rE1=rRAciziOKM439Yw4nxLai7ymA@mail.gmail.com>
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
In-Reply-To: 
 <CANNYZj9W613_D++e=OH63rE1=rRAciziOKM439Yw4nxLai7ymA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM7PR04CA0024.eurprd04.prod.outlook.com
 (2603:10a6:20b:110::34) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
Received: from [192.168.178.36] (94.134.181.94) by
 AM7PR04CA0024.eurprd04.prod.outlook.com (2603:10a6:20b:110::34) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.19 via Frontend
 Transport; Wed, 8 Dec 2021 08:27:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1cadd057-0915-4926-b17f-08d9ba248b04
X-MS-TrafficTypeDiagnostic: PAXPR08MB6413:EE_
X-Microsoft-Antispam-PRVS: 
	<PAXPR08MB6413832A3BB43BF08583C11ED76F9@PAXPR08MB6413.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	s87JqqUjwK2d+spwSe+ycW/l4WM9OAr92bSDjs+U54egNF7U6FFISN45zQMT8iAhRkAt1Ly6mTYcmbbhbTpSRqL27zTKN/r52PqOsrmXhcECiZmx3QDCNcvId36ZQFZVbQvwHiNKRjb2RcRGZZGqNM0uCCB7rvZgyw8MCbMDJqd02tq6L9Wass9PpJUgUmW7JISZpMxmebtfAi5ns/oqsKfYpON+zgPavHQxtCaKl7kySbtEixA50cRodrfrVIxbPJletTIxiYcwrAVK0YntPbCLWMxW/dwSLTjneI+HvBmfdllG9ZdGBR9pKZ/vlbik4FyJpoqiocvmvUSAOnqgeyQIo54DnH5KWPT7yztV9AT58pELhSVMgXzncouUSOqToFdA7kMteZ4a6Bp/kJ2M9t6i72KlwlRuAYWUbvf3+suazcx1SF1W29vwH8En1HM+V5TKXVsAmh4OcVxDsWFPaShJkvlJjPWKzTJ0k56iZweF79cXkT1tXChN5mPLr20014M5/spiXetkqq1UE+MTWfagFndfcqEbdWF1H1zj+AX7zgCpXzGNbHI6Zx5nqRJMZbimNpPhz3sArWBV6l/wNydzi1xpJnk5K2zV4KLAgpI5HAdKkJFkPV3ovZirhDlUpUd9m6J7Y69wJafGvNVn60swINf7znZ30Q8lovV5GTq2tHFcCU/G+sez9BJkz7IkqBvzjHx0GdX3YgMPK7zgqxV7psz+RKJegJzMAYmylKvYJQTzAtLqQMSHMuzyB1hO4jUE1Z2eybYpus/gCLxbxA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(956004)(83380400001)(2616005)(26005)(52116002)(31686004)(186003)(2906002)(86362001)(16576012)(66946007)(6486002)(8936002)(66476007)(66556008)(316002)(5660300002)(6916009)(8676002)(508600001)(107886003)(38350700002)(31696002)(38100700002)(54906003)(36756003)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?elVZOC9KK2kzNEg4VzJtejJERzh1bEhLcmxFbmJGUzQ1b2gvck1ucXZ6clJ2?=
 =?utf-8?B?WWtZdmw2OU1MNkdnZFIvclBFL0c4Q2tkbG56K1BOUU81amIrUmxUNE16VzFj?=
 =?utf-8?B?T2szeVliOVU4R3k4QzB4SUIyR2d4TXFVVkdjT25GZVNIVGJkRWdMNGZpVEtY?=
 =?utf-8?B?RThzditWVkFuL2lIVGNZRkxpczVOSTJZQ3BCM2lHTlQzTXJsU1FlUDZpeGRK?=
 =?utf-8?B?UkFZbGxOSnVoSHB0eEZqbjZMRS82ak5ScWEybVRZSkRSNmpGRHdiWUNvMnFP?=
 =?utf-8?B?aW92cWtrSkdrTm0wMTBSVnI0OTBaNzVQc1gzQkpXcUNHYytmbFJ5TEtCbkRE?=
 =?utf-8?B?QldiT0FZdVZjRHQ1aFlOZnZMNm9VTVF5cVh6MnRNQkNvTm1KSFU2S3NmWXo5?=
 =?utf-8?B?UWFTV21PZlB1bFJlQVFHYjVOL0MwN3dnZUN4R0FDWjY1MzRraVZvZ0xLcFlI?=
 =?utf-8?B?UmMycUl1Q2h1YVRkaDlMN1NvSVZYTjBZWTJ2Wm9JL0pXNk92UmVneGpnOCtu?=
 =?utf-8?B?N0RLaVZxUVhHMS9LM0xxUlFLSnJaUkdvTlN6aEs0SXdUUkt4S3llbHVSRzFI?=
 =?utf-8?B?UUxwNXVWOHl4dHpPZTEzN0U3bnBVR0dHajJIRVVHaEl3M0IzRVNZRUYrbDhC?=
 =?utf-8?B?VFZ2MXFPRWIzS2ZQa3BJWUZDR1pGSXFZbVVkU3NWMzJHTVg1RWs3NlRDbkNX?=
 =?utf-8?B?TWVlQ3djQVBiS2NTOTArMDkzR3JldXp5NHVveTNJcFBHZXlMais2OTZKNVhw?=
 =?utf-8?B?NUpvT0t3Tkp6MHV0am5vRmZtejhzMy9vN24zQjc4VzBtWDdQN3F3L09tYWZh?=
 =?utf-8?B?UDlZTk8zZENwSmVVMGRzc3FtSmxOUisyRVNtamVQN2E0SU52VUpReGNLSU53?=
 =?utf-8?B?WWtOTWNxclM1L3Fuc3pLTk8xcDBsWnpMbGxCMytvYUREWU5EbEZiSDkvK0ZY?=
 =?utf-8?B?bUtxNi9qMkxiMXpRTnMzL1VwRTVBbE5wNnJvZi9xbmNqVXY1dXR5cy9VbUh1?=
 =?utf-8?B?Nml4bSttbDZ2MHhoaFdndHZnMUFrT0RWSm1MSFpNaXZlcnpCbVF2RzV5akJF?=
 =?utf-8?B?K2dybitzOGtDMXhCWTB1MTVJSDRzUk9pNlNINlFDRytjMzFHRFl0bzhHRkw1?=
 =?utf-8?B?UGs5dUVpL0lvSGVrbmNWNmFIM3o5eG9RM3BvdkIvU0ViTEFhaTZmVy9UcEFP?=
 =?utf-8?B?SkVsZjhxamRMZml0Ymdqc0VBeERwUG9LeHhEV0lBYlQ3bGdCdzhxWElGRVpI?=
 =?utf-8?B?SFlvK0tGdDR1RUJaZ0h2akc1OUp6VmM5UDlJVVJXKzRudDFud1RxejFqelRM?=
 =?utf-8?B?bk50aXVKOUowRnVmMzNUc3ZPZk9RSW1lVEtQcjhtS3VxZGFnd2psRTlzQkFy?=
 =?utf-8?B?WHNGbWw0WFRqUUtHSW5NOWczS2gzYVdOeFM4UnUxZXFpVTJabnRIZVdxVEpC?=
 =?utf-8?B?RlpXSHhWUFpGVTZHalhyQmFlY01zM0pJaTdPSFp0QWdhZXJzSmVBQy9uZy9N?=
 =?utf-8?B?L2ptWmdBbElDQ2JJa3FkYUNEcWJPSUtPQVdYNEdSY0pxWFU4Nm5rYWNhWVhm?=
 =?utf-8?B?cmlhYlZscUJmcTFBRGhTU0Z0TTBDTk4xM3B3OERjb0JxVjk2TThPMHIzS2Iy?=
 =?utf-8?B?clZNZzJNa2NOUllZVm9MSnlJSTY3YkFadDh5cGpwK3N5WG9zUkdIQkpCMlE3?=
 =?utf-8?B?T2NqM2xwa0YwZFUwd243cnYxc3pYSSs2b3c5bS9zaTFIbGRPMS9aOWRySERP?=
 =?utf-8?B?QWtLa1NrMHRhR0hGa0hzYmJqTWdNWjhacnIxdlc3RW5VWlM5OCtXTis1bVB0?=
 =?utf-8?B?OTZOMld2anZ4cG5nWXJ4U0pOd1hpY2dCSlNpVzFCaXpJbzg0T3pPcC9ReEth?=
 =?utf-8?B?ZG9yc1dWSXp1emh5dzZMNjNnc1g5YlMzekJRb0tBZnVaY1JnVS9mVVEvTVZs?=
 =?utf-8?B?UlZrMnkweFFMTWJ0QUd2WTVDSEQ5WVFWNnZJUTBWRzl2OExYNHkzN3pBQU9u?=
 =?utf-8?B?KzZhWjVpZ2EyNVFmQ0pRNjlkbmo4K0lCNHpMbkxSbTlXS3FZVUFsZTBYcnlw?=
 =?utf-8?B?VStVTUhUWXFyODdCRUUzV09mVUlrZzMzSnh3VFhoWWl3YkxHNXF6YkV0dGhk?=
 =?utf-8?B?MGhFdzJLN21Cb2hoUUdrSXk1cTdjQXpRMTQxbHZtOTB3NFhrT0xaaE0waEZ6?=
 =?utf-8?Q?wHFX8kFwRwnMkQBqwkJ6Amo=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1cadd057-0915-4926-b17f-08d9ba248b04
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2021 08:27:16.4670
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 ex8w98WPM/cZrnZYsyojir251OO8PIlKNkMt1Tpn6vRiFO/vGYFKfvWmVRoErsHlL9Z9AYoE5+anrY3deZbR6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6413
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Dec 2021 08:27:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159344

Am 08.12.2021 um 09:10 schrieb Alexander Kanavin:
> On Wed, 8 Dec 2021 at 08:45, Stefan Herbrechtsmeier 
> <stefan.herbrechtsmeier-oss@weidmueller.com 
> <mailto:stefan.herbrechtsmeier-oss@weidmueller.com>> wrote:
> 
>     I will update my patch series but need some time to test it locally.
>     The
>     devtool test build a lot of recipe on every run because it use a
>     private
>     sstate cache. How does the autobuilder overcome this problem?
> 
> 
> If you don't rebase the branch used for testing, and set the cache to a 
> directory outside of build directory (e.g. /home/stefan/sstate ) it will 
> reuse that cache between selftest invocations.

The devtool test use its own PRIVATE sstate cache:

def setUpClass(cls):
...
cls.original_sstate = bb_vars['SSTATE_DIR']
cls.devtool_sstate = os.path.join(bb_vars['TOPDIR'], 'sstate_devtool')
cls.sstate_conf  = 'SSTATE_DIR = "%s"\n' % cls.devtool_sstate
cls.sstate_conf += ('SSTATE_MIRRORS += "file://.* file:///%s/PATH"\n'
                     % cls.original_sstate)

And remove it after the test run:

def tearDownClass(cls):
...
runCmd('rm -rf %s' % cls.devtool_sstate)

Even a keep builddir doesn't help to keep the private sstate cache.

> The autobuilder uses a single writeable cache for all builds and 
> builders, mounted as read-write NFS partition.

This doesn't help in this case. The devtool test clean parts of the 
sstate cache and therefore use its private sstate cache and the original 
sstate cache as mirror. This is a problem if a test triggers a build of 
dependencies.

Regards
   Stefan

