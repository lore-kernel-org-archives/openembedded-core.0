Return-Path: <rasmus.villemoes@prevas.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB29DC433EF
	for <webhook@archiver.kernel.org>; Thu,  9 Jun 2022 10:06:41 +0000 (UTC)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (EUR03-AM5-obe.outbound.protection.outlook.com [40.107.3.106])
 by mx.groups.io with SMTP id smtpd.web08.9450.1654769194576908461
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jun 2022 03:06:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@prevas.dk header.s=selector1 header.b=XyweH049;
 spf=pass (domain: prevas.dk, ip: 40.107.3.106,
 mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JJe+g2Ay5oG9idCeGmVOtkAt9xs/Y3CdgNcEVOLStDnJW/KkLBNUVHKSfDnxLeqLcrLFbWmu0EpsWyafmMckVUZg8B3IzyyqWI7nI8rSOEQZvAnbyPR94DlKe37yZMZXR5sOG1iwUMQisnCN+DMp44TEkwl2hMd4AwU4LopkgoSfECAPgGrRmijYR/sG0crj9G08YOGP0kxH7gRUHlVigZmS8/XyOvd2aAzFxCxLJ/8QK/mwp4mwQTzwK/FfjHgMIH3n+qOmOA6jLtgCo3qhseF0XTBOfHRQDzY09zZRPSZriDPX3288mk690gncoq3IdMgKBNkiGhiBL8C+pzJ+uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E8od/EbsTTusuhP/S2CgU02zHG6W4bQMKeBIqPrnNB0=;
 b=Px7Da3qFx8uTm9J62Zw9CNwdG+M4UQduODtKmdIhzybFm8Eor9wo+gTXGy5OkeR/PLlKuXKDsst5M2aQ0D/lk0WRF6SFwuyk8rePOW6bsoPargeRLS7tJYIBnNNbLY6eST/s4m2Kd1FUyJlAEkey+ZW90uI+Mm983sRAAku9s6rBVVkEPz++ybmgwobsdCzH11qkETLxSKaf0m8/8n6YH6KLwP1V1BvNhaMUZkaL/NEwsD8xPTCFIh9FvNj8KC/f+tvK+5E8FfSAF84uAXBhDMcyWzOZkzoveIUNgdn2FzZAAP4Uc4zR9goDSUJ9nqSl8iMuRWmQuEPzjrRoLBVCkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E8od/EbsTTusuhP/S2CgU02zHG6W4bQMKeBIqPrnNB0=;
 b=XyweH049h6fpdt8hHDeolND8H2n/X9pqqkawkUb9kuIvlH3t/trYDz/ROQbWFrK2mWX5pLVBaLVgbFi69uQHBeNY6dBYhZlaKjhn1PeeDbw0m7zBGXdcXUY2ccEJHlLzs5CJ/unuk5k9QBfrX2cDJUrOazxzTtB0xDx+P4iPS8o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:34a::22)
 by VE1PR10MB3087.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:803:10d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.17; Thu, 9 Jun
 2022 10:06:31 +0000
Received: from DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::edf8:6e1a:8d97:57ee]) by DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::edf8:6e1a:8d97:57ee%6]) with mapi id 15.20.5314.019; Thu, 9 Jun 2022
 10:06:31 +0000
Message-ID: <8e5d4024-2ec9-315e-d716-9a11118a6e28@prevas.dk>
Date: Thu, 9 Jun 2022 12:06:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [OE-core] [PATCH] e2fsprogs: add alternatives handling of lsattr
 as well
Content-Language: en-US
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: openembedded-core@lists.openembedded.org,
 Ross Burton <ross.burton@arm.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20220608131205.2218528-1-rasmus.villemoes@prevas.dk>
 <20220609092004.5315043c@booty>
From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
In-Reply-To: <20220609092004.5315043c@booty>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GV3P280CA0111.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:8::28) To DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:34a::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 046bb515-b6ed-4951-9e22-08da49ffb9ae
X-MS-TrafficTypeDiagnostic: VE1PR10MB3087:EE_
X-Microsoft-Antispam-PRVS: 
	<VE1PR10MB30870F8BE91F28CA8508737D93A79@VE1PR10MB3087.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	UiFD7WHeycEIGbaGmYdgtwdWcRMnwzZcs5ETLr/2dbX2j/ppZ77uIK5EbWDuZrfwyXH2ZhqUYAcskILYpfVgvM45Q5kgNfYa9lTOmtZ+J7cyCMwkmfMzsU41EzxyzWZI9UrMNebqHPZMbUmozJQA4lXdHgZxVb0+8+j4JdQC285uTbDeuufxptVFrX2Kf38zZnzOsOk1w8lGD3k9+rHqI42ER4fjKH305yV8QYMidAMePRso3N63+nx9klzFlydxJFDopn3hdjzSJLlg/3gWHxQ+yQgE0/2wjUMDHZHfVBnifTDXRllGsHbcE6D/9+Z5oBK6FHRkWycg07jCjZiqM+XJ4f0IznQMSIOovusfHwD3GansLyLsZYoXI/ce3SevN1rCh0Y6KJY8uWigPnv5iTppNFiPhOSeSMCBcUkO3mTy9f9Vjd2muH7ivAxD5fpz31Sk/knU5n/2NFRjAqCBX44CKchepCC94NxKH/PPdOZhVEizCyieClris9Lr+EcXeqhTK7SMgFTn909CIp8LedyHkB4E3Z2lIo7eCzKa/9c1FL00TXT9gEWQkjBK/PItFh7x62+r/fgyASO1r7GkT9R7kyHfjk450gp0AFBwidbgOc6a4nPQ6N+PeajQhZcW/El+VYIxXj1rLJW1FlUzgieOtXhZuyT8oxIL/dqB0Mt3Pf+xDQc5zHxXQJ0eAX2WHsfpaMbDPgMCnlaF2d5eM8T2URJl2un6Ei0hEStvBYn/a9IORHaQIZwkWiDl0k5pr8BlKRHl2dd118KIhGg5XQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230001)(366004)(6486002)(508600001)(6666004)(2906002)(52116002)(6506007)(6512007)(31686004)(26005)(186003)(2616005)(8936002)(8976002)(36756003)(54906003)(6916009)(316002)(66946007)(4326008)(66476007)(86362001)(66556008)(8676002)(4744005)(44832011)(31696002)(38100700002)(5660300002)(38350700002)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dDRTdUNuQ096T3RUVkIzZjN0YWU2MWcvdEl0Y1A4emREMUlySlBTQnNvbjBR?=
 =?utf-8?B?M2hHaEEvalhvTXU4bGNTYXJsWWkyQnFpbzdyT2tjSEFxVUhweHB4TGFTRjQx?=
 =?utf-8?B?cExNS3FncDFpSmJRUTFBcHhIOTA3NVJrbjNnQmxWUStVQnZ4Vm41QXp1QWIx?=
 =?utf-8?B?S3NoUjNLdVZlOUd0RGpXUWY1TCsrMjdkNUhTSDhna0pncjJPYTEyWUV6QWhU?=
 =?utf-8?B?ckNVNlFINTF0V2tUU2ZNRm5iaFJRaXlvdjBiTHRMZm4vNmwwYnpEYjFDZ0JH?=
 =?utf-8?B?NDduVGcrbjlOdnNZejdmTjhHOWFGWFkrZnk3NjZoMVBBU2JSUFdwUEV2ZWpI?=
 =?utf-8?B?QW92K0g0TzV2eFJTbjFyTXZBdVlIaUhaRWdQY0Q0S3BmSW1YM3MvTFVpd1Zj?=
 =?utf-8?B?aWQrZXU0ZVpRNTVIb1dzeFpabklxbllHTVBhVEUrUitXelAraDJpakdJNm5Z?=
 =?utf-8?B?YmhRUEYxNTMwemNTOWdqdGRjSGRsTzJTUm8xZFFOL0dTazlEN1k0MUVMMDds?=
 =?utf-8?B?Z09ZK3QySGJhQy9MbXhTQnE2RGExVWRPUmZCcXB5SXQ2ZVJzRnZpWVhQOGx4?=
 =?utf-8?B?UTVVVjF6NUpFTml2WC9Sb0kxOVg0VTRHWjM0b21BNWJFTkk3eCtla1JYYzF3?=
 =?utf-8?B?WmNidzU4TkQrOFppbEI3VXV2Mm94ektBRi9KTERycUxqTnBydG9vdEd5UFky?=
 =?utf-8?B?VzJZNEZhc1lPb0pTY3AyVTVpTytqUGZkRnFKUU4zRFVkcFhMdWdJZTBVNVRy?=
 =?utf-8?B?cXBuM3k4cDBVcWtYUXh0U3UvdVl5VkxuT1JieEhDVFlWWVk3SlJQVmFVM3dn?=
 =?utf-8?B?YkJMdGtyZTc1VFVUdUVWd2N2MWJrQlRPK1I1aGFEQ0VWMVZ6WTlRdXRoTEts?=
 =?utf-8?B?enhua0xuZTl1akRxWDhINXhBWXZiNEI2VXVNdUZMdmZTczdHR25FODQzQTFo?=
 =?utf-8?B?d3YwQ2hBZi9zMzZtRE9KR1A4VVVPSGFXTWFJY0liNFN6aVV3NEZ4ZlhkZHRu?=
 =?utf-8?B?OVRma2tka0xyMkRKazFTQTcxWS9EdWNWOUdOQjY0aVMyTFBvWWQ5TlBicFFK?=
 =?utf-8?B?WGFUbEl2UGJxaWdQbjZhMFBqQ3FXZ2JyNnZId042K0YzbzFxTmNJY1dHbjQy?=
 =?utf-8?B?dXZPNlZkODlrc0d1RUhERkp6YnIrYkxRelNKUzZ3UjFCbXpPdy9taGxNYUpz?=
 =?utf-8?B?aXBRRGdDUkhnSjVyMU5xaHVIbk9vTUJWcHhETVJZVzJxQXFYZkJUOXNMNlkz?=
 =?utf-8?B?bkVBRWhKN3BaYy9oUktDTjBvaS9Uc2x1eWVnVDYzeVFxL01CYkc1ZC9kVTRv?=
 =?utf-8?B?S0Rack1rWWVjUnpWS3ZtRUpmQjJtcGc2UW8rMG5jd2RFVmNkOUlxQTQ5OGVF?=
 =?utf-8?B?NTNMN3ZqTXBnekZabzJKandkcmVJZm5WOGpKV2hKak1vRk5Gb1llbzBKUlRN?=
 =?utf-8?B?VG9JLzhmcTNQVUhtT0FYbStMSmo2YUtHaW5mSVc0bzFNdVFtbUVqdTdzd0w5?=
 =?utf-8?B?Z0xucHdZSURTOVVMQzhzYXRNVDZBNXNIV1ptcUhOWk5VTUlWNVNwZy8vSCs2?=
 =?utf-8?B?UFF2WWVvUGFkNFE1UXJKOElQaVBmd0pUdDZHMFdySWlHNzZ0L0JMYU10R255?=
 =?utf-8?B?dENKd0k2UFBFUktZYlNwTE1CNHpEeVc4OStVcXc0eEtSQXRDQno3VXB5ZWJR?=
 =?utf-8?B?cEJQSDdCR1M4OThvWi9QOW9tOGVVT2Vsa2V6Tm5SWWNYUFNSVmRMamNLeWEr?=
 =?utf-8?B?eHZxTjAwUHVNVFN4NVJKMUNRbjdsZ0ZESGdxNm5PVDlXTkhYNjE4bnphbmNa?=
 =?utf-8?B?THhXcXNzUkdFcXdsdGJrTkhTS1ZmZVp4SkdOUkpNSDh3YjM4WGl1aFQ5Zjdo?=
 =?utf-8?B?S3FJUnk1V3h3RFRRYkM1YlZhb2YzdlFPMzhVNU9FLzdobm0zWU9FOGpkUXR1?=
 =?utf-8?B?RjVIR2plZXpyMkFOamZIcHFFR1Q5YnpRci9hSVlBWU1BNUJNdUZGdDZWdm1K?=
 =?utf-8?B?SlZLVnplVzAxOEQrQzJjREtySW42SWxPMzk5T3JrL3RjUzFVKzdUalYyUmNu?=
 =?utf-8?B?ZFdQT24wVnhNdTI5Y3ErRDFsWFcweHQ3ZklLc3lHWVhRejF4TngxMkJlUEtv?=
 =?utf-8?B?bWZSODdTSW1JT29STEZCaVB6Vm1OV3l1RTZERFVtN3h5dlRGbUNBS00wRDRM?=
 =?utf-8?B?a1VCb3N0QUphYmkzYnppTHNRL25UQzl5a3poZnlJeUlpNW9NckdiTHhua3BC?=
 =?utf-8?B?NFkzR3kwRmVTM3JUKzZjcE1xc3JFeHB6RnhuRWpER0U0TDhBam0yRDZxZVdS?=
 =?utf-8?B?ZzNsZ1hhVFJPdHFTVVJNTmh4SkV3bzFkMHpnQzdGeTdQMi9pYVc5RHZCd2xB?=
 =?utf-8?Q?TNiZfFr0arKxUPug=3D?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 046bb515-b6ed-4951-9e22-08da49ffb9ae
X-MS-Exchange-CrossTenant-AuthSource: DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2022 10:06:30.9406
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 muVZ1AFkxw5QdCnDqGdzcuTkCoRa5YnxWKBnMrfdwfDqf9fdbHP9uJ6L4duZVjPPzwkrXsMFLTE9EMeLFWlgtTKv+CAXp65+10ovFLESBbs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR10MB3087
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Jun 2022 10:06:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166769

On 09/06/2022 09.20, Luca Ceresoli wrote:
> Hi Rasmus,
> 
> On Wed,  8 Jun 2022 15:12:05 +0200
> "Rasmus Villemoes via lists.openembedded.org"
> <rasmus.villemoes=prevas.dk@lists.openembedded.org> wrote:
>                  ^^^^^^^^^^^
> 
> As you can see above, your sender address is getting mangled. This is
> not your fault, but it makes applying your patches annoying.
> 
> Can you please try to work around that by setting the sendemail.from
> parameter in your git config?

Sorry about that, didn't know it.

It's not completely clear if I should put just the email address or the
full "Name <email>" in that configuration item, i.e. whether it's

[sendemail]
        from = rasmus.villemoes@prevas.dk

or

[sendemail]
        from = Rasmus Villemoes <rasmus.villemoes@prevas.dk>

For now I've gone with the latter, please let me know if that's correct.
In any case we'll see if it works the next time I submit a patch.

Rasmus

