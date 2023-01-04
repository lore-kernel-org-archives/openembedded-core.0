Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C92A1C4708E
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 11:36:32 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.56])
 by mx.groups.io with SMTP id smtpd.web10.9924.1672832181915363105
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 03:36:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theobroma-systems.com header.s=selector1 header.b=g5TrlZmf;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.6.56, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BNc7/tLaoqGAHwJ9Tb0wfAHFJ3EgE+TBshFbNz19raS6wEDJASwqoxLTCWXdOZQrGu3zHx2RipSzt9WaRN26GmxT/5jeV/lSz92II/5MU/zKZZLkhLnaS8cnX4lhmPR1MB74yYn6qfnLV3jZZjxoxsFUkwcJUiHU8gb4TjEqWck1p5XXi7fCmJZ8JFHtcTH9cBAXFnBPLjLg0tNN5X/rXQQVHTLgvUafNhoH+/tCjoIrjKPAgntbqXzbhMt/HIv7Xue9ADSZzoQlqbmx4omA7wwKY0FbMlx4DXD6BSG0qmk8t7B+1tw+lsSwhnOd0oHV2lLhFTAJPV3bs7tb+kJIfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UREtdyL/1oAb3aEhsjdQKvuu80dkPUslG1BwLr+EJyA=;
 b=RKV68AUGU4QgBnumqfdomfrOSyy7YHDWuBPgzEvlboFduAKklU4w4QcBumzvZX3YifKLRp3n0fjEuFQA4NfwDNmWxC8mgn/hgfn8dI7tmnC38ZK/N2jovMvGFh3HYWu67zW1pAvzE8vXAvSYcnOzgbY/oRV4HNqsNDMjQ8shniAhPd5J5+mBmrwQZdIONF5I2a8zzSbNMeRMca5Bs9WLMP8EBT+hoE4vkkMUPbAmbAsds2erCKaksx4QAGYXpNe7/qF1D0Lp8d+v1WGb42lCgUN9E6R46FQyFj2/Ibm1Nyf0vqx45NhhIwCAVov4+7eVLvA1J3lOye2nQ37zLrQZtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UREtdyL/1oAb3aEhsjdQKvuu80dkPUslG1BwLr+EJyA=;
 b=g5TrlZmfz56rFrSibbDsxPCLRKbNbhZx4me2YU95jl7Nh8zmYj9L5as2NCiDXK8jBS0R9eQkTGArXYOac/q263iXQPNJhNGH9a3FN5ufkFfC6RloFxHbrc+A2+79uCI4emyA2CbhnBSjqV8+/PCj5DeuXVOAcXm94Z6YaUUNtC6ePBMh0tzkgP0JDl+wTIBoN49MMj3jFuTUqXhzTD/8pMy5Z21jMadMzKl49nGHyu1JcZX4D6vnvpWUm9gRmEbkBqBq4qfNVlynYM7T6kf3DSIrgfxt7JfvRLDhwJ/edMaP0KiRKcoa7GFuzMBDCgWMHvAr20pT2ndJaXupDSrG/w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by PAXPR04MB9217.eurprd04.prod.outlook.com (2603:10a6:102:232::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Wed, 4 Jan
 2023 11:36:18 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::9ebd:cd48:9396:76f6]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::9ebd:cd48:9396:76f6%6]) with mapi id 15.20.5944.019; Wed, 4 Jan 2023
 11:36:18 +0000
Message-ID: <631753f6-a7f8-e1ee-4853-7f91ee820b46@theobroma-systems.com>
Date: Wed, 4 Jan 2023 12:36:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [OE-Core][PATCH 1/2] kernel-fitimage: Adjust order of dtb/dtbo
 files
Content-Language: en-US
To: sandeep.gundlupet-raju@amd.com, openembedded-core@lists.openembedded.org,
 bruce.ashfield@gmail.com
Cc: mark.hatle@kernel.crashing.org
References: <20230104025330.2648640-1-sandeep.gundlupet-raju@amd.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20230104025330.2648640-1-sandeep.gundlupet-raju@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0102CA0063.eurprd01.prod.exchangelabs.com
 (2603:10a6:803::40) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|PAXPR04MB9217:EE_
X-MS-Office365-Filtering-Correlation-Id: ad5a5850-96d3-47ec-00cc-08daee47e55e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	265adRCz6wpg9FuoZ0JRaZyHjyEGe+NkbAokv/MhwOo82ION3tcDagWafqNJuPjFHr6A52gH8+ni4WcvqfaPEtdgmipXd3VB01kXbC1s0+v7+e+JixiOYclFYT712NLJ6nq7nRUHZKh1KaVrKqiU6CcG4Y7YU5G5EiZlJJ3NwtTk5lhj/B6wYlLY5jZA/A85qRY03D1SwbiuQt04BOuRU/aC+5WDjya+5lVaKZXF75c92aeVYYCWJV5WW7+iFmGCrdQftzjWoIrKF0Th5P8BiNOH8rkZxBGnY3Y+lYIBcc9f7GV2antEwxlAEiTuxCcQVFo7tmg2xxA1y2ONMRc6DS5GyPCriNDKPiQL8bKYcc9SIbYASTZPT7PVQSRzZeb33reaWFgdTxnf4KGFd6mLFQGydtzVc0zNWi5nes4yv0RosaVmkOzjPiGp1Offvu4neg5Gpr3sPH1ph9UmM9JsTUMl4wTeKYLjaQhIlwxYJrBfNXecvHhUP77UABZMYQJIGLOKb4QeNRnSMAKn9m3lhqKLyUT7XrvcCTP7Bbaz+aLO4plCIy0qqOWuozDRrbeZMaqWcXd9ubv8A1sxFLCx3Lo8EU80/HwhNX+z9TlLtxeoR26qn4/yOu1OJBRiSsuPBTIaxfOzXcKkngPECWP27FWFlT5W1rY9M2zMfhgA4zIaMcTzaPIb9S5u5g/PO0o+gA179AE3o5GMElZcxXiltBucNgFfnIqqgrKPJXjzcPA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(396003)(376002)(136003)(346002)(366004)(451199015)(6486002)(6506007)(53546011)(478600001)(36756003)(6666004)(31696002)(38100700002)(6512007)(186003)(83380400001)(86362001)(2616005)(5660300002)(44832011)(31686004)(8676002)(4326008)(8936002)(66476007)(66946007)(66556008)(41300700001)(316002)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZzV2aWpUOG9XTjZEQ0xrQ1ZvQVpDaE9FMFR5WThURDVWb3pTbVVRWFZUZ0Vh?=
 =?utf-8?B?QXdDUmx2S2p5T09rYXhjTnhjTU1IVHdWQVdsM3JYKzhOUFJDS2M2ZUl2Vmkw?=
 =?utf-8?B?bG9jTHFsQTBkQTZBVWRoaFlMN2paK3ZOZ3QyeHd5N1hzd0FmdnBiM2tjbFF5?=
 =?utf-8?B?QzBJTXZaZnJOR2VBUG5Qc0E5WTRxMFZJbUZCRGtyQUh5cDlNQ2I3RkptYUVm?=
 =?utf-8?B?V2orR3d1c2lBTTZvQ1BSdm5kRUF3cmhLSVhWZUZLck03UzkzOGl2SjlnVmhQ?=
 =?utf-8?B?WUtxN0FaY3FLajBNSFJhNlN3TDNCMjIrTFJoOEE1TCtRSlMyOEp0N2FzR1Qz?=
 =?utf-8?B?VUMwNWZtYVg3bDkrai9rdzZtQU5lMW1WbmJKTFRzV1NjdllNdktHZHNnNTRx?=
 =?utf-8?B?dUwrVXNSTGdrK28wVmZiWnVpSzgxTGNRYllSY1JZUFVRMTZ2dzhqZW95S3Bq?=
 =?utf-8?B?QVZkeWxURE5QNzJFVG96U2M4R2dOYm1SQVNQT2YzSDEwRHNTR2JBcHE1c0ZM?=
 =?utf-8?B?OVRQNUdIQVc0VVE2Q2VyTk9WeFdrN1k3SlNFUWY2b1NmS3dvMXY5UTFoSUt5?=
 =?utf-8?B?alQ4am80cVJ4QjZvaFIwcFhmbWVuVmRmZnhEVk1uVmVxeU1TZFhBRXd2WjVu?=
 =?utf-8?B?cTJLS0cxekhQeDhOd3pJdmhkRGpiWElDOE81dU1vb3A3bVllNTlIRTc4MDE3?=
 =?utf-8?B?Q2pPYnRzOWpDZnJnYkx5M2pvVW0zQnRJeEpvbkdvSlVPbFNsZE1PM2YvZnRE?=
 =?utf-8?B?aXZFdjErYVdFbWhBUFhETjM5cWk0OUFvWE5NdHdjUTZ1Yld3L3A4RWI3Y0xj?=
 =?utf-8?B?YVJpT0RhcDVaeEQvVVZIVzFZOWl4Sm1NaWhSNUd4dmhXcWM5aGRTWjBMYkcy?=
 =?utf-8?B?d0FMYmVRakNSZmFmNko3S0NINjg4K0R2aHJjcXJ5WVoyZkIvQXk4MEdwcFNL?=
 =?utf-8?B?emlyWlpxT2poNnFuTHFYcEFLODB3WVFoM3VMZXJ4RTVHYVphRmVJTFZsYXV5?=
 =?utf-8?B?SGdyM0lYQTZ5enFCa0JBTnRkOTJ4MmpoQStmeW1qYjVTc296NzZWR25kcmRP?=
 =?utf-8?B?bXhPR2loOWNML3JWbHlPQ0pmVHRFSmFkNkRQSG9RZyt0OEpzMDJnZ2puWXFh?=
 =?utf-8?B?dFc0N2tNNlh1U2JxUGNTcGtPQ1FXUXh2QkJkZmV2TzdmNVFwRC9Ucm5ZT0xN?=
 =?utf-8?B?VkpuREE4QWFzOXZjUjVmVFEvWnlwSi9ITlZMVEJwSEJ4amM4SEtjcjI3OXZD?=
 =?utf-8?B?OUN0RDZIUXFiaUNZSFluWHhyU2xiRERJUE9ER3I1ZXhJdkVzSHkvM3pvRmho?=
 =?utf-8?B?YU5rTjZOK3RvSmVCbVozcVkvckhJMXlndlYxcElQT0RQY1ROdVp6RGF4bXkr?=
 =?utf-8?B?ckN5M0xwdGxGOTFOUm1jUzhjQkV4RGtpYUQ0Y3pjd05QeldOdFc3UXZ6R0N2?=
 =?utf-8?B?MEdYVzFXYkFHSUI4Unp4bkF4YWJrakFvM0UzY2xvUVY1YTErOE5ObXY5RE5G?=
 =?utf-8?B?V3BqVGRaRkloQWZ6VWZpM3pTeE5aL1RCelhDVU14N2x1bzYyVkdHSmJYN1pt?=
 =?utf-8?B?U3BkdHVJaHVVZTBhckkvM01BWFRUQUtwb250bE4zRjFSUGNOQ0tQMTBUQm9o?=
 =?utf-8?B?amNWaDJlS3FJaVpZWEQ3aVdtV2p1b1pnRUlNVEhRYnBVaDVwK0lZWGVjM29h?=
 =?utf-8?B?eWdxM05qcXducXozbW9ZMkhKdi9hUW1GUU5mTVJpdEs1UW1TdFlrdGxueGJC?=
 =?utf-8?B?cm8vRWpHZzNrOGMvVkxYQmxTT040OFd1NHlKc29jaDZ5SlVLYXNpU3dHMno3?=
 =?utf-8?B?WjZwOHlZQmRtZXFGUm95eXVQeGpKVjFZNHpKT2REV1RtdkF5R0FaVjlMQm4z?=
 =?utf-8?B?eUttaWxENDUzZm51Q3hxTzAzeFI0V0JnY2pRRE1qRE5nMlBjY1NMUlpWRTM4?=
 =?utf-8?B?NENtZXVGTWtYUm8ya2RySC9xYTNNSzhOT0gzbEcrb0dYVTg2cXNDNE5QZDJJ?=
 =?utf-8?B?MklHZnZ1aHprK3F3UXB6Y21OekVUY0c0eHoxN0FFbVQ4Vk1wcmNaazBlSkkr?=
 =?utf-8?B?UUxrQTZaVzhUL2ZIV3RTNGVzWGx6aytiSmNhWDhFbTJqMWpHRm5QUHZTQnBM?=
 =?utf-8?B?K1J5cU54RCtML2VVZUlQK212WUswdlA5a1Y4YUp4ZUxNcC9CaGJLckxNQkJD?=
 =?utf-8?B?R05HVnV1N2diOEJxRUl6THdJSkVsYWtoekZocmRNZm1SKzgwT25BTjdxMmtQ?=
 =?utf-8?B?SWtZWmUzdE03Tno4bmJiYnllM3B3PT0=?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad5a5850-96d3-47ec-00cc-08daee47e55e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2023 11:36:18.6452
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bxCjEJDINwOBshtMZaDCL9JfgCaNWeCUkzGafafEjEsCBxGUF5FpIGR17XfKDQbAcomV3opxV1Df7+IlUA1JMET36EVL52bct0quRLrUW9kbYmnFP6FntYVY0kNwGiwD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9217
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 11:36:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175463

Hi Sandeep,

On 1/4/23 03:53, Sandeep Gundlupet Raju via lists.openembedded.org wrote:
> The dtb files must be before the dtbo files, otherwise the overlays may
> not be applied correctly.
> 
>  From Bruce Ashfield:
> 
>    We can split between dtbs and dtbos, they just need to be sorted
>    for reproducibility reasons. Two loops versus one, would be
>    fine, with not too much duplicated code.
> 
>    Of course, this was only working by luck previously (before the
>    sort), since it has always been gathering dtbs and dtbo's with
>    find, depending on filesystem ordering for the order in the
>    fitimage).
> 
> Signed-off-by: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
> ---
>   meta/classes-recipe/kernel-fitimage.bbclass | 14 +++++++++++++-
>   1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes-recipe/kernel-fitimage.bbclass b/meta/classes-recipe/kernel-fitimage.bbclass
> index 7980910aa8..cb6635a673 100644
> --- a/meta/classes-recipe/kernel-fitimage.bbclass
> +++ b/meta/classes-recipe/kernel-fitimage.bbclass
> @@ -590,7 +590,7 @@ fitimage_assemble() {
>   
>   	if [ -n "${EXTERNAL_KERNEL_DEVICETREE}" ]; then
>   		dtbcount=1
> -		for DTB in $(find "${EXTERNAL_KERNEL_DEVICETREE}" \( -name '*.dtb' -o -name '*.dtbo' \) -printf '%P\n' | sort); do
> +		for DTB in $(find "${EXTERNAL_KERNEL_DEVICETREE}" -name '*.dtb' -printf '%P\n' | sort); do

I believe you could have

for DTB in $(find "${EXTERNAL_KERNEL_DEVICETREE}" -name '*.dtb' -printf 
'%P\n' | sort) $(find "${EXTERNAL_KERNEL_DEVICETREE}" -name '*.dtbo' 
-printf '%P\n' | sort); do

would make sure dtbs appear before dtbos in the fitimage sections but 
still use the same logic within the loop without going for code duplication.

I believe the issue is the content of the DTBS variable, which might 
start with a dtbo file.
When this happens, the default configuration for the fitimage takes the 
dtbo only and I guess this is your bug.

We could also decide to have the original loop but have two variables:
DTBS for dtbs only, matched on file extension
and DTBOS for dtbos only

Then you'd iterate over DTBS for fitimage_emit_section_config first and 
then DTBOS.

I'm also not sure we need to create fit configuration nodes for dtbos 
only? but maybe there's something specific to security here?

Cheers,
Quentin

