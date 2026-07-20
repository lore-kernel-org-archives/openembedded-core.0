Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02B9FC44515
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 13:24:10 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.62])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8921.1784553845522323427
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 06:24:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=gNSA07M8;
 spf=pass (domain: cherry.de, ip: 52.101.66.62, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jVEacKgoYwJlPmQWMMDj1w5u4UpxXbairfntdlE8Xj5YGBBYQa9AFVCuobGoFzIDY32DimOy6zpdx1hE1QgAXKj7HBtwN+QNQfUu+rv+ta/DjxD6VFyKrB3cVHvLXvece+frh77U4Ny5o+5HKMVYu63OYlQPtu4drPWa0Q+T0cwDMsvM8qGWiZIXVV2Wn4hk1cle7ekRJTaJVpR0u1u/pQ6SMWxX3pkZrM53Lsod90dHdekUpQJpehKI33EW6lDj6Q7hvTdsPzjQeuiWoHzktaTSXLT+p/bICCpdKo0qccnDsVAcKryIM+qOcBF7jPy4b/eu7JAqokYgJ+vJfeVQEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EoCY7Rndq/PopPN8xhvHrRnZSGDwJ9dRmH2cYBBpQLo=;
 b=QTq/X/fV/JR718o4x4tNd5567T0vwXtkNcp3o6SGX+vYqkf/NKQxE+iYsBrvGBUOCEtXznKGBstPw7OhbOZ3YWvqz0rCyyFc/rF9MRfuilaqKkyaKbm8+adMvlYEL3jSFvb6TjK+TMY5gkjraRGhpM0YtBB5XGC2lUtzl2/CGV2mvvO/x0I8KAho8UXLfAjEQmSnKSHNkY6oEBrSZeGvlDchiBCbmCYZKxSNF6y+HsYBLmUnF326W0d8tKfAGlh6dSRh1tyekIjz7giMwMleitd/QpE/d0WlVsizjFKE3W0T346iayO4JoYeRZyW6ZjyTYw/i1JsVfrvSjADb+D4RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EoCY7Rndq/PopPN8xhvHrRnZSGDwJ9dRmH2cYBBpQLo=;
 b=gNSA07M85yA7Is4V/hYjkSvHWrjLkvK+T8J+nEUNnE/+gdQrNvfz6dfuzMqK8+7KLDUl/ihTZTukgv7hfYBMVCicKJdefKI1Cw30f3QcptKFU+LGfQST+gdj2TluqCCC/V1fdycp9cNZ8q5xeoNGQK/6DHjI/fDA8wsT89scXp8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by DU0PR04MB9585.eurprd04.prod.outlook.com (2603:10a6:10:316::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 13:23:58 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%5]) with mapi id 15.21.0223.012; Mon, 20 Jul 2026
 13:23:58 +0000
Message-ID: <de4fb3d7-0eed-448e-ad98-7b3d5b75f87a@cherry.de>
Date: Mon, 20 Jul 2026 15:23:56 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] setting KERNEL_IMAGE_STRIP_EXTRA_SECTIONS blows up
 building linux-yocto
To: rpjday@crashcourse.ca,
 OE Core mailing list <openembedded-core@lists.openembedded.org>
References: <319bb00c-9712-4aa7-38b0-e1ad2bab840b@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <319bb00c-9712-4aa7-38b0-e1ad2bab840b@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA3PEPF00000517.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::66f) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|DU0PR04MB9585:EE_
X-MS-Office365-Filtering-Correlation-Id: 14e15892-2e36-413c-48f1-08dee6622798
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|3023799007|11063799006|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	uZJj6Ltcf+kbUFri7Qfcn8lfm0ongLeR2L3qM58DRAk7w4HRY89+R7eUPy+kUW7VZt3dI1Z+NBqsqMKDhlrjy9RU1nX0Zdw+On9foGW3DrHos0qp4WtTjmcs7KDvA4QJwvRCda61q+fW+MOUvi+UQ3zY5h5h+dL2x9Tp+FO1Sxm5/3QRSCv5DGiocAlUJ96T/ol5ApJ5IyL2gbckc/Hj4klMrBKbFewDI14/kUJFfk4MJibuNICTvf3kYpzvJ+l8ZBpO/1TwKs+v7qUcQacp5kzmgYJFOZDEjBe4HG6aeZnzEXmvsOlZReGSGZQvPpv5ocHU75bagrm2Tage+B4f7mGJ/sS6F7VgzrmaFM6ONepjghhvR4X0bbfcG8xsCiToeciXYLHRTR9dHwZHmnvfPUfT85j+25gnvh6ddVksodD6yHMlPv9+gqgTo52crd+x4bril38P1WGUGLqqU++gq/RP8pJx1qGf65vXsjzCZBHl5YpaBFKlktHLcVmA1eOUtFQiIqS4RA3KLNaU+uAACSV0PDg0xazZuKc1Z41uJgodMnBwFxm8qB0izuaS148pSxQlw+5TdPBsatXLzeOjOMUvl2Q5gPvMumv6nbuGFQziCBit8W77W4CF+n78eSpVWbCp3Sy46eB7lp6LZyOpRbrLWvW9mkExEUFRP9Jizi4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7737.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(3023799007)(11063799006)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TWJLZlR4ZzlOZ0tuNG5FN2VGcklHbUpLV3JyQytOeElYeWJHMjlrWHU2U2lk?=
 =?utf-8?B?blA3TTBYMHBLZGh4YVBHU1RHbXVvWnR2ZnZXV3VVSW05ZjV1VlNrZU5mOXlw?=
 =?utf-8?B?TTJYMWluc1ZSVXBjc0JadDg4SUcvZXBTKzdVZGNKaEluMG9MY2xnc2N5eEpi?=
 =?utf-8?B?Qi91aGRQblhDejRuMmoxdENCNmlvT0d1dDlZZE03ZGpxNXg4bXVlRGV4d3JO?=
 =?utf-8?B?MlhPTVdteC8xQ0VyY1pWdVd6bHdUc2M0WVFjR0tYQWRVRnhjU0d4dExuYnBr?=
 =?utf-8?B?d2xTQ0dPMUhsdjVnVXUrL0tWdlRjR1FWVm94VDk0a3dHZHVkT2dORkZxcXRy?=
 =?utf-8?B?allQM01WUFh0WFRmTm9jejdHUDFBY0EvNkZjVXVVN3kvQ2dkeDg0ZHhvNHZ2?=
 =?utf-8?B?ODBrUHoraDdhSzhzQXA1VlJuUmhNTCtlWlRkd2FMV0lSdDU5Nmg4MmgzS2Nm?=
 =?utf-8?B?RFFSZVh6Q1FVL2xySmtpalFXeUY3YlhUTEszN1B5WGZtNmh3bHpkZzFTNWZp?=
 =?utf-8?B?WHZ3Q2NuTk9vRkViSnNTN29IcWRpOUU0WG9BSzNsRjJVdDBMUTJFVEs3aFZ3?=
 =?utf-8?B?cTlPVlZLSlNjaER4dEV6aVJGR0dhRWZPN1ZhM0tSOFgxT1ljYXVyVFZrdDkv?=
 =?utf-8?B?cEl3YXhtdGU3MmloajFRbFI4RzhMMHpUcEhtdGpBY21zaTJRdTRndFhLNDUw?=
 =?utf-8?B?MVdueUZPTWJqd1Z6UUxkL1hYOWt1YkxjdnM1bHcxMEJIT3VlSXIzR2Y0dW9i?=
 =?utf-8?B?L1NTV2FYbGlDWjR0WGtnTkRHcXZHWkpWa0QxVWdyZEJwQTJUbmNNd1BRRXZW?=
 =?utf-8?B?Qnl5MFhjUVg0bzJIZStBc2tlZHZkeEJxc3g0bGhCdVRBSGMrdWtZZklNdXJn?=
 =?utf-8?B?TzlTWjZkMnd5MzBxTE91bG9GZHlvdjFBbmpURXlKZUVtWFRnVjA5VU9ESWpJ?=
 =?utf-8?B?VFZBeWYrd1VxNWFrV3RPL3JzaHNvM1pPWnNzaGF1VkN3Z3V5N25qbENXcDBF?=
 =?utf-8?B?a1Q1RFZFZVRmYWpLMUNkLzdjbXVEcG9mUUc4T2s3V3k1Z1pqTlVaeS9tZXdm?=
 =?utf-8?B?VFh3L2FkakZCTHpIT09LTVh4V1htMDE1dXFRUzM3OGpTWWdIV0V0eXlJTlY3?=
 =?utf-8?B?MHhVQjBoZjE4U3dnODJmZFZsczE1MjdHU2J1aDlTYlBFa1loMTgrQkRxTzhZ?=
 =?utf-8?B?bStXbWxGMjFYaU8rcStwUEFXS0lTMXJubDFqakp4UHVXaXljdVFZdGFKZWNr?=
 =?utf-8?B?Q2JjSFlicStHTHJmaWZkdnZ2b1B4VDFxbmtoYklTb1BkL2pyUWhBVGpoLzZJ?=
 =?utf-8?B?Yi8va3RZaTBJYnl1S21ZTGNkdnYwQ29WdTJWKzEvTUtMM0l2dHlxVlQxNk9s?=
 =?utf-8?B?b0xOaVNPMUE5Z3c0bnB3bWpvcG1qSDZjNC9TWFhjRVdjeWxNQU1lSnlyRlVW?=
 =?utf-8?B?SzNyNVFsY2IxQ1htNXFoNlV3L0plOFZDUmRLMitLYXc0QmpBVXNCTzdwTG9m?=
 =?utf-8?B?VGhkR2s1R2hKQWlFUmZ2MXlTYmM2TEp4cll4WFM4SWxlYTVWMEZUYkdMMm5t?=
 =?utf-8?B?Ri9lVlVJNlFjZ01MZ1hraVJ0WWhFV3BwWDJyOHo1alUxV1B0TzNYZ2hVTmtM?=
 =?utf-8?B?ZFhhZDBFQ2M0aDdMdVVEbEVlZldCbzYwWDg1RE91NFI5SmtPTlJoSnNWVkdk?=
 =?utf-8?B?UEZCVzBJV2hPa1BLRVBGRmRKTWtDUlZvYWxjMXh6YklURVFPYU11U2hFRjdH?=
 =?utf-8?B?dW5MNi9aYXc2WUZacUtZQU4wRE9BanU0M2ZSMW1JM1dWdUtVdGRyUUhleXdV?=
 =?utf-8?B?RnJ5Y3pJOFljMnMxdW5sc05ycU1pSDdIL1dFUlJSVXFRREdwYWlmK0JBVTI4?=
 =?utf-8?B?WllPdWsraFc2WkRXT293Zkc2VHFwL0I2N0JPWTZHeVo4MG5FcmJZVXlzc1BL?=
 =?utf-8?B?bmlveTVUM0lUT3h5VEF0QzhsT290TDZHRTVjaWpZMTRFM0dXS0xrUFBVSzRV?=
 =?utf-8?B?ZDlRYjBjR2ZrSFdOc3g0RHUzcWxJcVcxUGZHZ3lwTFFxUStnZHFtWWVXcXEz?=
 =?utf-8?B?aFJuZ0VhUmNqTzhFbnViOVFjOFg3dXFiVUpyTG1JUmpJU1hUNkR6WXJkakh5?=
 =?utf-8?B?d1FtRXo5MWUwdTYvM091SlNuYjJhWWcvZ2dFbDFIb3NodGZ6Y3RvLzNhQVRW?=
 =?utf-8?B?T3EwNFF1QXJPeFYyWEJXSFpwT0RYcjR1VCtMQVhEYStXK2l4SXhrUXd1T2hU?=
 =?utf-8?B?T3plYWlWcExtQklhNEtkbnpTNDFqOVVydk1RU3k0SWtENkNWbWdjemVPeDQy?=
 =?utf-8?B?dWFiVmI2aDZsRStackNTUlpyVXk0TW9vWTd1RmVzMWZBRkYwYVVLUT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 14e15892-2e36-413c-48f1-08dee6622798
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 13:23:58.0291
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lb1WSjN1ZY2iQZzhEn5O8GHySrdKAKvJcML1RmhyQnhXQCRnQXfA09dYmbKBoq3tiag7xcEe87enw+jkPliPgo0+29EGXl6ZHOxvT3wp1/k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9585
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 13:24:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241398

Hi Robert,

On 7/11/26 12:50 PM, Robert P. J. Day via lists.openembedded.org wrote:
> 
>    testing my recent docs submission documenting
> KERNEL_IMAGE_STRIP_EXTRA_SECTIONS, and it did not go well. i'm
> iterating through all of the tasks for building linux-yocto for a
> rockchip-based orangepi-5-plus, and everything worked fine up to and
> including the do_transform_kernel() task.
> 
>    for fun, i added to my local.conf:
> 
>      KERNEL_IMAGE_STRIP_EXTRA_SECTIONS = ".comment"
> 
> and manually ran the do_strip() task:
> 
>      $ bitbake -c strip linux-yocto
> 
> to get:
> 
> ERROR: linux-yocto-6.18.35+git-r0 do_strip: Error executing a python
> function in exec_func_python() autogenerated:
> 
> The stack trace of python calls that resulted in this
> exception/failure was:
> File: 'exec_func_python() autogenerated', lineno: 2, function:
> <module>
>       0001:
>   *** 0002:do_strip(d)
>       0003:
> File:
> '/home/rpjday/oe/layers/openembedded-core/meta/classes-recipe/kernel.bbclass',
> lineno: 753, function: do_strip
>       0749:
>       0750:    if (extra_sections and
> kernel_image.find(d.getVar('KERNEL_IMAGEDEST') + '/vmlinux') != -1):
>       0751:        kernel_image_stripped = kernel_image + ".stripped"
>       0752:        shutil.copy2(kernel_image, kernel_image_stripped)
>   *** 0753:        oe.package.runstrip((kernel_image_stripped, 8,
> strip, extra_sections))
>       0754:        bb.debug(1, "KERNEL_IMAGE_STRIP_EXTRA_SECTIONS is
> set, stripping sections: " + \
>       0755:            extra_sections)
>       0756:}
>       0757:do_strip[dirs] = "${B}"
> Exception: TypeError: runstrip() missing 2 required positional
> arguments: 'elftype' and 'strip'
> 
> ERROR: Logfile of failure stored in:
> /home/rpjday/oe/builds/orangepi-5-plus/build/tmp/work/orangepi_5_plus-oe-linux/linux-yocto/6.18.35+git/temp/log.do_strip.2408627
> ERROR: Task
> (/home/rpjday/oe/layers/openembedded-core/meta/recipes-kernel/linux/linux-yocto_6.18.bb:do_strip)
> failed with exit code '1'
> 
> 
>    all i did was add that line to my local.conf, is there something
> else i'm missing in order to use that feature?
> 

Congrats, you found a bug. I sent a patch that should fix it though I 
haven't tested it, see 
https://lore.kernel.org/openembedded-core/20260720-runstrip-not-tuple-arg-v1-1-e07764fe3f41@cherry.de/.

Cheers,
Quentin

