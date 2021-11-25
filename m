Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB051C433F5
	for <webhook@archiver.kernel.org>; Thu, 25 Nov 2021 10:41:03 +0000 (UTC)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (EUR03-AM5-obe.outbound.protection.outlook.com [40.107.3.41])
 by mx.groups.io with SMTP id smtpd.web09.10485.1637836860613493546
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Nov 2021 02:41:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=eu+UpKPo;
 spf=pass (domain: weidmueller.com, ip: 40.107.3.41,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QQxa0aKCBW/jLY9BY7fUbtBNL70RxVHWlLvfggUxfdHqNuK1aoag68WcxaRxDN0k8KDxeu2Z7hC3xaTh6V194+kVghjk0Y+q927Mw3GfwnwhUk+7uMv82gcEsCYhQ9Q+NA6l7N2/t87kmt4Mo2DkGEfZ/KANuJthrHQZNTB0IEFOv/pE0d7zbR/wZ/mtaWGFZaPP3IGW/JVQ2oxs7iJjY8NxW98z86Hlu1NfEI8GnwIU5eWzQdLRaefcNbIiVfBcvPMKNbr1zfPbbWSubZ72zlvaP1ZAtVoxdlWTHVimHPgCSHW+dNf3VJtPpPLRLIpbLVNR+67Isn0lxrDQPHySTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Up9fl55fVmHIdDDO1OmTNbT6gGvCWnSh3NQ+sB3anNs=;
 b=WzxE9WStbtYrIR4iRt7k7eBODpJSMkx4sF0IJhTGU93qC4oF8PxNhxco5fgU2it6ou8731FHgAkr4cimXzaSoscz1ioIAboC+lrYAdANYKHEc9GNzxfHD7nzBO+OGlLbXsWAH2ObbgsDOR1J7I9V8tUbConOcQPdWpDVQVB150zjCabZkiK6RvE1nY4GUiwE9pqnoU3Ir90WgUUoElC9kOHKvgKSjOSxv9RQbUDwQOWJVk12fO0C/1t6t1mOhuITUshYq6I9+2GiIFcy52/Nuptp0YR6HDrrVx/mZ4JJq8IH8X4+cODoqZHnnqooL90ZYU3rFam4yWdwqHIeb9R6Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Up9fl55fVmHIdDDO1OmTNbT6gGvCWnSh3NQ+sB3anNs=;
 b=eu+UpKPooyw+eucjppeiqPfApVBCSlRrnlI4/bndJHNlopjXgoTybxO628BjZZWuDCa/uHI9kZORogl/uPWyVmli/wJIgcTkljaeKy4/GTApz5/bpjSepvBHP/EDRlrgqqZvtwDg9ZGI7P0WI9SAl3iKXzlDURT70LlpGQHZTI8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by PAXPR08MB6669.eurprd08.prod.outlook.com (2603:10a6:102:132::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16; Thu, 25 Nov
 2021 10:40:55 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::f:41c4:eb10:5010]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::f:41c4:eb10:5010%7]) with mapi id 15.20.4713.026; Thu, 25 Nov 2021
 10:40:55 +0000
Message-ID: <ffedd4fc-a860-00dc-a473-8bd39a89c27c@weidmueller.com>
Date: Thu, 25 Nov 2021 11:40:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [RFC PATCH 05/15] bitbake: fetch2: Support archives with missing
 search directory mode
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
 Jasper Orschulko <Jasper.Orschulko@iris-sensing.com>,
 Konrad Weihmann <kweihmann@outlook.com>, Martin Koppehel <martin@mko.dev>,
 Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
References: <20211124144739.2250-1-stefan.herbrechtsmeier-oss@weidmueller.com>
 <20211124144739.2250-6-stefan.herbrechtsmeier-oss@weidmueller.com>
 <CANNYZj9JQqkh3zf9a4zCbsbAWktP4K6YpFmb8fHhrn+47Eqtsw@mail.gmail.com>
 <c71903c8-0a6f-cb07-58fc-cc262bcc527f@weidmueller.com>
 <d0866a4fc26fd15318cb4cda7718178dd73b45a0.camel@linuxfoundation.org>
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
In-Reply-To: 
 <d0866a4fc26fd15318cb4cda7718178dd73b45a0.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P191CA0044.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:7f::21) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
Received: from [192.168.178.36] (94.134.181.29) by
 AM6P191CA0044.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:7f::21) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22 via Frontend
 Transport; Thu, 25 Nov 2021 10:40:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f6390084-154e-42f1-a5c4-08d9b0000ec2
X-MS-TrafficTypeDiagnostic: PAXPR08MB6669:
X-Microsoft-Antispam-PRVS: 
	<PAXPR08MB6669F31374071BAB354B1B8ED7629@PAXPR08MB6669.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	5tVNHL1EVf3B5cqsOC2T/oq6pdDAifJjrCxKinRqMHw2VGXEk4MK3p4Gg0tw7L9RFPpD0wfQ61+ZOyuvUcJJ84iOkkUdspMG6Q96rYq6qZPyfo0D2+j6tVnCSdWHiXFJYxXC0eiztYRkh5Y3w84nbw6jkX8QNTrct6vT38Xmz+OQugH3/k4axs3iRLdXirvH0A6a5b8mbi2dJt7/1Qqjcx8OeQZlimGCLDVwoI9bmrlJSLks4PnW1q3KMP2inWWRK1ToYAFqgwi/H1u/xVWy2WkFDv9nb/HcuupFeqsuAVAA4F232URppvhrRrEQAuc9bhOha3Fbsfgx/6xPMs+fm5ogQnSCA0Q2/qIrjGVxmnXW+zEQdwUzsI/mz6AkE+Y73h+1aXjeHYpvCpjwT+UI4vjQ7NseRCaYPVfO/gWtBEZECJZcXBopvgEeGGSs26rx2cHgc5+KJS7lxbFgnD69eyZmpMLCEYn7CfW5D6Z6nZ1Ij+mivx3hxFyHNgG6o/BgRyjmBY2UyUA62TTgVeye0kOzhTiWhoCSNj+iiYHOsmd8VUKsPCGdGWiZvnEk3+ZyqjvvlYMB/0YZkFXAXYvwizKvlIF0iSpmBiodeUxCWDgyMo/Sdo22CawtriYemV4hK/iODzRJcYYNq6m7ICKCACvIvqEE+s6ZJynrh2zon7DYHimUGMdAWqLBSyGLUkNjX3cVbQvlsHYGXhBzOzCi3bUTABTJbG/ngZHETlGssv83po1YqLgS7bZ+vYhM86Cf7Kw7s/WsC0vmZJmhOKgWfg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(54906003)(26005)(66476007)(4001150100001)(31686004)(66556008)(8676002)(6486002)(107886003)(186003)(4744005)(36756003)(2616005)(508600001)(66946007)(956004)(2906002)(110136005)(5660300002)(38100700002)(16576012)(31696002)(4326008)(8936002)(316002)(86362001)(38350700002)(52116002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bThzN1NlWFVGNlMwTXkvaTh4ZHN0S2dqeHZYeU42VFdOdG1idXIva0podjd4?=
 =?utf-8?B?UGVSd2hVd3lTTWlHYXE4c0tKRFoxQ2lvb2VNNERuTTVidkx1UkJ6eG5BK3BP?=
 =?utf-8?B?RUlsaElCM1A3Nnlvc2kydG55bFoydjhTVzZqbzBhdVVPakc0cFVVa1JDQ3N2?=
 =?utf-8?B?Qnk0QUpDeGdlei9MK0pVMVBGWWtRVXlQU21IckxDUkRpR3dJRXpPNHdyUC9W?=
 =?utf-8?B?WmswMFc1VmJqUzg1TXJrcXdEai91MlJuN0pwYmpIU3UwaXhxRjVLU2lQTkZr?=
 =?utf-8?B?Q0xhSGM3RTdjY0tZWFpxM2R0cWpSbEhzbnJjelB1QVIyVEZyMG43Z3hzN0V4?=
 =?utf-8?B?a3g5Q0VzYVdyTWg3N2NkSHJIRzVVc1BDSVBlSWoxeWVibzY1VHFldTFtQ2N0?=
 =?utf-8?B?MlN0b3lHTDNZdFZHbnF4bXFBWE8rUkpoTkVEUThMOHdsbndNbmxRUDdLanFu?=
 =?utf-8?B?NytMb2JhN1Z5cnlLNFBHd3QrZUxYbnYwMTVkc1VlSEFVUEZ5VGxlOGRLanVw?=
 =?utf-8?B?TEdrZTdxbER2UmNiQThTa1FOY2lQY2RtbkZhK1phbm4ycnFRT3J1RGlnMVJK?=
 =?utf-8?B?VVRzRDVjc0NEbW0reVlkeGVTdVgyVlhickdaamE2L3o1QVRkN3FhL2JNd0Ni?=
 =?utf-8?B?ZEZaUk1PWWhjbVptS1A2b054MVZ1UDhiV1BEUWpSQWR3YUQrMjhnRCtGbjFD?=
 =?utf-8?B?WXdlL3JWTkk1b0lCbW02NzBReFRSd0p5N05ydWRmWWJhN2F3QWczUzlkWVM0?=
 =?utf-8?B?QUNJdFg0ZnpQV2h2R0VxQWZ4YlhXSDQrSlhNNmUrNFpTdVhJZnBBZ2R3L1JZ?=
 =?utf-8?B?UDVLS3l4OUwvUmRCK21kaGhDZlFOdXI5MHpOL1EzNFNIVXBsQUtHQXA3Q3Yy?=
 =?utf-8?B?L0RTTW9BRkxLdlB5R3NkRjF1UDVUSzcwZ2pOZ3FzL2VOeW5UODVZK0VHakhh?=
 =?utf-8?B?MHlJa0tWQXhQRDlJaDl6dFBDYWkyWnhuWDdjSjJvQ2JqUVp4N1hiMkpsblJo?=
 =?utf-8?B?VkNGMk1FcjdxQ3RKeVQ1bGIrWG5nL0FnMkY2YzVlZUttNC82WG1yRnkvVVJR?=
 =?utf-8?B?RjJUSG04ZGI5Tkd6TU1wMk50MERoTGhVMXZqSFVOaUtYWjZIazNqaHpaaUdC?=
 =?utf-8?B?dS9xYVZUYlp1UCtjVGMrZVYwdHExRjVzZXRuMHpKcUNxQ21QcU5HUWxXUVo4?=
 =?utf-8?B?QU03QkNTc043dGUzL1lIcGxXV2ordzFJenozNDgvQ2pRV0tLUWlNZy9RZFQ3?=
 =?utf-8?B?MzBtdFdUWGM1dFY2QjhOSDJnVTBQUTM4clRQblcyejhPeXVuQ3NYRC80ZDF5?=
 =?utf-8?B?aDdjOXRFd1ZaNE1xMzRSSGtxTXFMR0xSakprOWhrVzJyNy84cGp1cWZ2RWlR?=
 =?utf-8?B?SzhwM3lLVW1OYWtZdWRDVjBZRERqNlRQVGpLaGVYY2ZHSzJCOTFwcnlMcnl4?=
 =?utf-8?B?YlZRY1hwWjdZbjMrUnBkT0QybmRzdnUxL3dITXhmdGY1bmRwNzUvRzZvRnFW?=
 =?utf-8?B?NkUxWDZSNmlXNlJ4YjFCSm4wNGNVaWNwOEtYUEtmVFI0bDNXZVhkTjMwOFkz?=
 =?utf-8?B?SmJMMzVjajZ1MDZuUFp3YWtmZUhtZG9YVmxnb1hCQktPRjcrNEpmcFIwczRU?=
 =?utf-8?B?V0drbXJwQkZ4dUNaSnI5YWpXZE9xdXArejlkZWhCN3hOdlc1Vk5aTGNiYjJp?=
 =?utf-8?B?VktNVGtac1d1V0d5WHEza0ZYbzJnbitwSkRrak1wNDI3MmdrVVNzWnRQT3Jv?=
 =?utf-8?B?SzNxWGIydUNFMlZxTHlRaVRyd1pUbjFPbmFGbXJrZHZjUTBJOFBUNjZlcEdO?=
 =?utf-8?B?em9KaDJEMUJ4ZHRqZlU4d09QZklUZURqOUpsZWl5YjkvVm44TUt2N2FvZ3pB?=
 =?utf-8?B?QWNnaDNZanhvSGZxdVZxU1JXZDNYdFNXUVNqY0pLMXF2cllSMHg1cmYvSE5o?=
 =?utf-8?B?cUducENMczdKWk9ISUFOemRPY0xsaFpPYUl6VEs1V3FXaTl6VGdhS1FaSlFP?=
 =?utf-8?B?WkNEWmY0R2pubmtJTXVOc1ROMlArK2NSL3pOczB5ejJlZ2hCNklNUzNpWFFY?=
 =?utf-8?B?WDB3YWt2VzdzMTV4RStMTlA4RWNzNmJRdVIrb2x0VVBId3hEdmU5NTdsY3Rz?=
 =?utf-8?B?MmtoVFdLVVVjQ2pHcFNuSUpNQXp6VzQ4NHFRS1F5eHJuOFhhZUtvK1pLVkQv?=
 =?utf-8?Q?suaU7ZA6lrrRx3g9j119qIc=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f6390084-154e-42f1-a5c4-08d9b0000ec2
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2021 10:40:55.1209
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 9gndVtcINR1QMTdTTT+TFgQHXCKGPL9/KWUtD/6iwUx4HsOZNK0P8DCBv+Dy1MFaRD19evUXpWZOkg8XlU9elA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6669
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Nov 2021 10:41:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158775

Am 24.11.2021 um 18:54 schrieb Richard Purdie:
> On Wed, 2021-11-24 at 18:11 +0100, Stefan Herbrechtsmeier wrote:
>> Am 24.11.2021 um 16:17 schrieb Alexander Kanavin:

[snip]

>> Is such an influencing change acceptable or should I move the change to
>> the npm class?
> 
> We don't want to support that in the general case, that needs to be in the npm
> class.

I have test it but this doesn't work for recipetool. Should I add a fix 
to create_npm.py and the npm.bbclass?

