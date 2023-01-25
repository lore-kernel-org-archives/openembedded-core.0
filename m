Return-Path: <frieder.schrempf@kontron.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58993C54EAA
	for <webhook@archiver.kernel.org>; Wed, 25 Jan 2023 14:50:07 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.137])
 by mx.groups.io with SMTP id smtpd.web11.46896.1674658197659134365
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Jan 2023 06:49:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mysnt.onmicrosoft.com header.s=selector2-mysnt-onmicrosoft-com header.b=JA/Z+NxK;
 spf=pass (domain: kontron.de, ip: 40.107.21.137, mailfrom: frieder.schrempf@kontron.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=djFqalApv3keOIALd/aJF7gSFqrZGozHwRVUZFtqHVXtd1U54fuLlVE1UOUyk/IczCqI77FWlflYIaQeOw8M6Pqou0kOUD/OXcHvpsJHh6iMPkzSrQOUK0SZUavYBrSpicKJDwOLw2JXDHMdZAbV9s1OiRABcQc4gVP3KLIkcZkF4/R6xSW/Q/ZOf7/UOUPbZsqk+23fuAELjznntKoWUJ7LNOudm3N8dBwlKTomJRTWwFKsvKaqMAgO69hUOPBadL+uJgxoTAD6eqCxToBmma0+kqeK6yBGuUxresjdHdhLb/hsM1wSW2/id1OUHmSJCeyGZTEemnBDD0gKdKiqSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YWPjY4j19ef6EQd7PAyDIyxR7v9ni7jbllL4w8gpb9Y=;
 b=QBlPGryDV4pNlQ3dWQvRlDNIs9DNh/c630FpQVXmdSMU2VxTOQGWRjBdhBAaubl12Y0hynyOFEGRlwiZ1h4fxJ/YeeK6BSk6JxFmyY8da+j1bw7v6q4bhpRV+KqkOhsIRMZrJeLCARomZJXgnH5iTI+Segg9qvmvZneJB9FwmD7agBBnMYpMOXNpOK2iD7SbFLliJ4G6pSJbawbuolEB8wXLBQCwNmsiD1KXR/M6mWejOifA3rSxFZitIlb8KNabV5d6cj/v8ehCJ5i0dEOIDo0ne61Y+clavPnms6Avsp3eNhoRHbk5dDCAw3SlLl56D62XxJNMJ8AxIsrfnyw7Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com;
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YWPjY4j19ef6EQd7PAyDIyxR7v9ni7jbllL4w8gpb9Y=;
 b=JA/Z+NxKASS6GAu5fdhLgZ1Ykl0FrfuEZNG/uPLnffnmxC9ALxcqYtiEiBmZi0PLAZIFcC4cEuA5bTLzQpLCMe+vjj+0dZJEavdcJcd/Wb21mb/RXQDifxBwNvEcHPcRuRz5051ubTEbty61tPlHQ7Xjgi+NgCFG0UvbD3VJ/5Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by VI1PR10MB3294.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:803:136::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.27; Wed, 25 Jan
 2023 14:49:54 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::59e9:ea90:b6ea:3863]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::59e9:ea90:b6ea:3863%8]) with mapi id 15.20.6002.026; Wed, 25 Jan 2023
 14:49:54 +0000
Message-ID: <5a4d1a0a-b0ae-efdb-c12e-05d1a98f6f44@kontron.de>
Date: Wed, 25 Jan 2023 15:49:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [OE-core][kirkstone 04/15] devtool: Fix _copy_file() TypeError
Content-Language: en-US
To: steve@sakoman.com, openembedded-core@lists.openembedded.org
References: <cover.1655666951.git.steve@sakoman.com>
 <5e6f4d0d3d314897b8ab2f45b3a78b0da9df99ab.1655666951.git.steve@sakoman.com>
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <5e6f4d0d3d314897b8ab2f45b3a78b0da9df99ab.1655666951.git.steve@sakoman.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0141.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7c::13) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5681:EE_|VI1PR10MB3294:EE_
X-MS-Office365-Filtering-Correlation-Id: e37947b7-e232-4b24-4d46-08dafee36b87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	sxClgB4wDBxEvbN+RWmk10emDPQl97NZEiE8Ih+BnfiGKEN8SnKeM3naskTzibJxxHfWU8lDpvYqVRSHCvqaKVSWXCAzaChHX8RMDWv1gzKxKL6OaGesan1JudiDhtalTYWp5d5Jfg1Gz4MYf0V0bL+ZPDMBxkSxteroKd1Y8MM1P4P3dGlIHL5mh10zZDSHUGZ7r1dstqgmNL5NDYkdA0/okMfJheY/PLyrmdRUCtW8Uo5MYYgNglwx6v6QEBemB505EFs4QMRskyy094+xMLHBl/KhXbxrbbijH7+FolEJ771varlzFItzodj4wLJmCImWBU4ePTCSCAqjQPBEJSumz9OPYHRmay6BRwQXfIHsX0QHROtqW3pRmf32DkE2XXNJMnC8BTBdNH8+96iy0x0yDMoEPx+74X258+k4h4qnImi2yU6ShWofkp69/RaoGW+27lXIFWX75qDzlDGhCz7vOy2TPJ4QMasqlzh9N9BDkxtiRXk26PvDpsB8GHHF5ojeA73NYfvlFBDD6qr4lRI9aXAoDU7RXwj2Q9iK+Tx8ukdJa4mqwobssKYIj1p8pECmSlXF9X/IHsxex2mR/j6y77Q6Qjaa5RPT2Rw+sseTVxtkac9rL54mmGvDssNDGVHidkaptISAxVjXHQZ2rLRYYdwvZSl0GDoenC03e1nwH55mnX8y4MN98m28+zSC9oed/LvN7k3V01rjNZpuvLI3YGkpwNLKJ75zTUAmPhyrs2ZwFc3bbZ8TI/WBDGeFAjq3fL8SjZC5+H1bZIuVrg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(366004)(346002)(39860400002)(396003)(136003)(451199018)(31696002)(36756003)(41300700001)(8936002)(2906002)(44832011)(66476007)(86362001)(5660300002)(66946007)(31686004)(478600001)(186003)(966005)(8676002)(66556008)(316002)(38100700002)(4744005)(2616005)(6506007)(6486002)(53546011)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TnByTTBWRWduZVhEM2pMZ1gzOUtYakZkSHBINFZ6KzFsaWZxUjNzVzNDS3VM?=
 =?utf-8?B?WllKa0tJcE8za0dwUEtNY1JWSGVUemZqV2h0VkU2UzJmR0ZYT2JDTUxsRHY1?=
 =?utf-8?B?ODIxSUNXbXdKYXBYR1Q0ajJhME9uYjY3NE55eEJSMlRaalgwTFBFeXZWR2pN?=
 =?utf-8?B?VHdHcmNxNlNyYk1DNUtseC9HSWlXZGhXRDh0YVV3d2RXWVgzN2VFZjVSdk82?=
 =?utf-8?B?dWxvc00rWmFQNlVSclFHZjdRL0I2K0V4eHNZQ3VZTXRLUVkzVUtwK3lzMm1v?=
 =?utf-8?B?bEIzeEExMEhjMUVZR1BzckFHZnkwYmJSVGk4dlZYcGNWeG5wZGlOaWdLS2kz?=
 =?utf-8?B?aCtLN29EOGp0OVk2NThKYWxXeFlQTk5UeE1LZDF6bThZSmlacHBUV2wwNW1F?=
 =?utf-8?B?ODM1bWw4Q0FuYStVS0h5NWMyQ2dtV3g3eXZxVVFuSVliZk9PYWdhVFdoWEk0?=
 =?utf-8?B?ZVFFWStnZWgxcUU3UFBOSDFkM2pTY3pRTWU5R1lHUWYwb20zWG45T2VLc0I5?=
 =?utf-8?B?NTE1ZHpGc1ZJVFdpQ1Q0SUZ5OVlzamdqaHZ4eVNNMXJkRmFnSFcrelgzamN3?=
 =?utf-8?B?dUxJVmFlcWRlRHFpSGZ2TWdBazlsVDRIeko5SUFzeExHemlyUFlna0JoeWU4?=
 =?utf-8?B?cmpiVC9lc2JuVmVYUExFYlBKdXo4TUQ2Y0N6MmJ1ZW5xaWQ5aFE5Z3dSaVFh?=
 =?utf-8?B?YmF2K3lUSFNROHVjaGxSTWFPd0lSVVRMOGtRSUYxRHB5SVFpSTZuTGlmd2Nk?=
 =?utf-8?B?eDc2S3NZSlBJNzVaZ2hvdHZIejVLZmhJQVlkT25LOHBKVVlORlFRY1NlWldn?=
 =?utf-8?B?RlUzSksxYisrL1o2OGdvTS81bGtOQmZJZTdNRUIyQ1lYWUg4aDY2cUV2Z1Fi?=
 =?utf-8?B?alBXZGZFZU5GZ2xSenNGYzFuNG1YZHVTQTFXSExNekFpRzdzQnBJcFBMVDdE?=
 =?utf-8?B?RERxbVFrRVRvcmhxVFNxSzBrSDJwM2JkYUlzN3hsS0d3ZUo5YVZIWFQxYkF1?=
 =?utf-8?B?Z0FRcU9wb0JRakFuaStRV3ZoODhhOVkrM2s2OWZ6a1FnMFJBbFBHRys3Ky8v?=
 =?utf-8?B?amovSWFWVHBVWE02bzhJMDdHMnJyY014dGI0OVVKNE42T3VVWUtFdUIwRTEr?=
 =?utf-8?B?aUYwT0pmeFcxWTBPTlQ2SGdKNjBBTytWVFh2Q2hoY3pQbTltQjEzZGhENXk4?=
 =?utf-8?B?empUclVSUlg4ZURtWmorR1M0aSt2NnZnOXhxUWdmNW1ObHR4WWkyYUVoMjlW?=
 =?utf-8?B?Tm1aNFJ5K3lxSEFvMVJ1RXp4VjFwdURsTlZlNE1vMnpnb0x1NnNzMTdyMHN3?=
 =?utf-8?B?blhtemlwYW9ERFBwaS9DcWFPbVJQbWZXY3VyRmZIU1BFVmVxVVhhQ1ZPYlpZ?=
 =?utf-8?B?UjZxQmpKMXJVd1RVS3M5OHE5OXhoN0xaTU0wS2JxaENUakovb3c1MDlUcGs4?=
 =?utf-8?B?cmxmWHJjVXF2SU1VbzgvOG5UUkkzVDVxTWNYUWJVWUZMRHROMEk0SHFEa3FH?=
 =?utf-8?B?TmlicDdFWnVtOVZxajlNV0hlbzZKdk9tTjBrbE5ieVgyM0hyNWVQQmZSSmM1?=
 =?utf-8?B?dXlITzNHQ05CclJ0K0I4ZWVsTlB5ZSsyQjZiWXFiUEtkYko2YXd0ZGYxVmlR?=
 =?utf-8?B?R0txdDc5TWNWODY5clhiSkJGSDcyc2paUFc1WlRSQ09GMmltaitYaTRVb2ty?=
 =?utf-8?B?Nk5HeUh1dFkxTU5hNFNSQ0VNMXJVZjE2S3NCNFBPRmlSZzVNR2dMZktrSUJL?=
 =?utf-8?B?b3JsMjFmZXBGZ3VHZmpidjk3Vm9aaXJBb2dFdEZUb2NOOVdMdVFYM3NIWVJH?=
 =?utf-8?B?eTlKMk9SQXA0VkVsL2lZOTlIeFJDWUFwdHE5aTlaa0ZMcHExOWtkY0JwSFNZ?=
 =?utf-8?B?aVRBb3V4VURFVFlCcm9jV01KaCtnTWxlQ3hBS29neTNkTEpiblg4RnFjN0ZT?=
 =?utf-8?B?aVVZOUovL3d2ajMrYVM4N2w0d3dWd1VtdmV2QmFqRmZTWVdyNVJ0d2lqbFF6?=
 =?utf-8?B?bmF1VnFiVkczc20vWDdYUXVPVklibkVRczIrVDFNam8zZVg0di96cktOMXVE?=
 =?utf-8?B?UGUvOFdKK1N4OTI4VHdUSWVsd1BoeThMVXhYTXBzVlczRlVVWjQ0Qm03UlBP?=
 =?utf-8?B?RlVNd09ESUY4NTMxMTRUWUxldTRFTmF4Z2pwdzVZbkVaZGFiUUVXcFJtSjZy?=
 =?utf-8?Q?AhnkYMZsVWza3iRDJmzSnb4KpHNB8WkPX3xO6z0V+bnS?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: e37947b7-e232-4b24-4d46-08dafee36b87
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 14:49:54.3281
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RsF6tnsmQ8LMW5AUZ3mVOhBrlVm51gI/h2NTBKjAuBdSJeAuqJIIdfgAjzHEabR5RaXz4VoL8FidzaS2QDba/4DPBuiCRDLT1AeAzrpz4xA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3294
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Jan 2023 14:50:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176368

Hi Steve,

On 19.06.22 21:30, Steve Sakoman via lists.openembedded.org wrote:
> From: Xiaobing Luo <luoxiaobing0926@gmail.com>
> 
> when devtool finish, the _copy_file() failed.
> --------------------------------------------
> TypeError: _copy_file() got an unexpected keyword argument
> 'base_outdir'
> --------------------------------------------
> 
> Fixes: 05f2d5d2ce00 ("devtool: finish: add dry-run option")
> 
> Signed-off-by: Xiaobing Luo <luoxiaobing0926@gmail.com>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit a45d9dc089fb2719ca69b92870917f8c0925f632)
> Signed-off-by: Steve Sakoman <steve@sakoman.com>

Could you also apply this small fix for dunfell?
Cherry-picking 38f2a7717646 [1] should do.

Thanks
Frieder

[1]
https://git.yoctoproject.org/poky/commit?id=38f2a7717646e68953675757fd7b73c66450c979

