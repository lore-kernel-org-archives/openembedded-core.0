Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0632C44515
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 14:44:51 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.65])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10633.1784558688298261706
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 07:44:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=SxbjIc2i;
 spf=pass (domain: cherry.de, ip: 52.101.65.65, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AQc7ii4hOplkuf7R5ueumL9KgIIFqeDhDP1N+/24syNzsV6Zmmnu+0xLHsMo53skDx9ncTXV/6jwPuj79An0/7tD3X9xmyEPjzOkKkYk8c5FqmHKWwvUwlpzMlFJyPM+LRpHgPE3u6UlvKRYnoX1JnWMsoTJOFpEtn3joHCJsrKadQaFPnYvb79JziGOVWcWRsMmseTqU1JktxjaH7Na0CGal6K6IlWu11OXXK79WCU1HoYHu5eTpntZxopNibiR4c/6dbTifTBMTW6M2O+sBvJNH4Qbqq7483SwG6y3zo24LsoIQaJRXLmlJGK4z2LLQPnNEfRmvoKqBzxVZhKzvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wjS170Rir+VYVLAc33G4rUunczhkprBCl3N12iagsQU=;
 b=p8Bm1YQSOLQuUZPHdQgY7gsfRYdnl0PF+ir+XmditVNEVHtOTFXDRRqoT9rcDPR+b4QsBsRehXvlBzUls8erYwkOtY6nO9X7g9t/XtPTjKnPzcoINQcWvSQF8jfAZmKHI2yR1gGRexZhEZB1Prmzut742vubntn/wFXh0H1ZfGqSqAEIBl5aRpp5aFmBAmJlZzOuyhO/OmWoYq5+6DxuccYha79R0e4QnFkiO5XbGW21f2cbketpBTE/TzxW+RtwhxpmBd/z1OHKDLho09La/KkaWMyRdn1g5EE+oNvkQNdZYHYMtZ2jcEW2R0jtfrXasSq528ptGgMHqaWaAA4xpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wjS170Rir+VYVLAc33G4rUunczhkprBCl3N12iagsQU=;
 b=SxbjIc2iy4aZKRxNp7Cdc8HrXkp5i7pp9ZvNOqBsdGPmxIRVD1jCMCL0wC2sqfnhhRukFJwvTrhDoZBc951ors9hBcyMlmAarg/XnYdLB0Xo5YKdaZtxTpIZSweJXr9AEGVuyivgB4ktHAPvhZJMc0SSbRXstZNfFZDam+7XK5A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by AM7PR04MB6920.eurprd04.prod.outlook.com (2603:10a6:20b:101::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 14:44:43 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%5]) with mapi id 15.21.0223.012; Mon, 20 Jul 2026
 14:44:43 +0000
Message-ID: <2ea2c118-22a7-45df-859e-df0d38dbbc82@cherry.de>
Date: Mon, 20 Jul 2026 16:44:42 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] setting KERNEL_IMAGE_STRIP_EXTRA_SECTIONS blows up
 building linux-yocto
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
References: <319bb00c-9712-4aa7-38b0-e1ad2bab840b@crashcourse.ca>
 <de4fb3d7-0eed-448e-ad98-7b3d5b75f87a@cherry.de>
 <b605f80c-34ad-4c3d-407d-8130a004cb0e@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <b605f80c-34ad-4c3d-407d-8130a004cb0e@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: VIVP296CA0023.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:354::12) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|AM7PR04MB6920:EE_
X-MS-Office365-Filtering-Correlation-Id: d9bda932-2706-4cb5-e65f-08dee66d6f9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|3023799007|4133799003|10067099003|56012099006|4143699003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	ly1DeQY0ur/brenGaMP7TmLIo3vu4yC9LYq9EViuaWnVqJEIZjfYuFMUXSoshQqbLE/kQ2eKjUwxdX/ncH901ilvOA9AWxF6a7ec2NOLIefxXZN2O/Jr3zTyt7IbzUzuUi/VFehqCv+sRLRxOjd3HXlw91/1U1vvVoCwkYiRbmy6in3czcBvAYgimrHCxR1IC+5av3bnr0qdBPnoh6rp4Skbkpfi/S9UJ8bEtj2ug5l2q+pT3aXXSO7DAFWtvOdGYuV0GgL0l56foLXbL4os5/D0kZIh8tyJ7ENGoMrg7hBeqck0ABR4bR/mFS3zuq0UkQAY6X0qq5QgH0eHKZwTcTuh7QDQDMqTFtEapZkeFWI/ojeiUuZr93Lho0bsNW93TMQKCd6ILut+hJ1Av6qu+KNChO6hagfzWLisKL4Ze9yAeVujsHeYAI1B+qqHtUrEeqwBVx8v5qd6XJlbQAYWTbxtYLFr3U5wwQpYCLoEUWqxw3AMYmFrgWHsSqWVneQgmTMv5xygjFCKJzsQiMU2H4PnLrm9BPfosUtaFnG0yqDWGFzPtr5FpK0FnaZBYdyr23akpESDcZ0S6bpAKF4fYShjLiB2ooQiFzXECp5AQW29AsKQDr2JQmYtpRx7I5RuvDHAotTIREyuaFJBz05Y9EABjEx99NKoZs8dc2CWADI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7737.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(3023799007)(4133799003)(10067099003)(56012099006)(4143699003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SExYelJiSjNRc1ZEdnhGZ3IxNjU5ZFhhNjh3VExYcG03ak5pV2FJVG44bjN5?=
 =?utf-8?B?WUFGL284UG9EbHBlRm5aMGRlc2h1NjU1SmJyUy9EdFF5eTdENDVCM3NCT2xp?=
 =?utf-8?B?SGQ0ZkFucGI1RnFwdUZZbHlxZDgwZ2ZSbExMMFk4YUtySi9RNHl4TXFEWHZx?=
 =?utf-8?B?YmJqS2c4MHJzeE9wT0lTU1RWZUxDRG5ZbXA4U1N3RXpaZVVBaHU0SGxQcjlK?=
 =?utf-8?B?NkR6dHluazhtbVFvTUZ3RGZOZGt1a01iYmpJQ3N1TThKR1F0ZFpSRDRGYzBn?=
 =?utf-8?B?VkJ3ODZvZUJrNlNYb1hKZ1ZvT1NSditJNXZBRFBBRjJxU2hnRXBNVUl6WU1Y?=
 =?utf-8?B?NGlRN2pJNC9sdW9iZktZaVh0bkZOcWhKbFNkWG5NVGdRdnZhWm1PZmNjWTNQ?=
 =?utf-8?B?UXlFVmNrWnNPVkwrcUdmL1FJd0VtcWdsQXRxK0xsZ08xRTNyQzVrNEFraXRo?=
 =?utf-8?B?WVBaQjRBeU53Rm9NNWZ0NldPRXo3N2xjM015S2xtSDI2OUtQT0ZwWEVaR09U?=
 =?utf-8?B?c25Ub0RhZG5RZmtnL3grV2ZPZW91OVFlVWp0eFhzcU9NM3RtajNybDNISkNY?=
 =?utf-8?B?WGxUZHVwdVQ4S0tJdUIzYkI2blRTU3VBdXJwRlB1TGNEelFjYVZtQTRmSVZa?=
 =?utf-8?B?Z3NxeEJzS0dvbG14bjA5OGprRzJJa0lJRHRWQThrTFptaUVSSHcxL0JrWEI4?=
 =?utf-8?B?U0ZwWlVFb3lHclVCalY2NkRXc3R3VllGK0tZQURDSUkvWVgraXlQd25yTUlj?=
 =?utf-8?B?eUF2Q1pjT3piNkxkL2ZEb0w0WlRFcnBPc3hGTnJzTHNxWHhVenF2UzJlK3Fs?=
 =?utf-8?B?eGlMdzljVTZKSklabVk2d1VTM2xhV1dUSHFEN2MrS0l2Ky94RHF3Wnk3ZG9K?=
 =?utf-8?B?ajFoVUJ3RURqaGMyeU84NUpaaU1KM1E2TTFWdmpKVkloWDNRRGo2RElBb0dX?=
 =?utf-8?B?K29yZkJsejNEWU5oWE9YS2JnL3dqN3hSeUhMSzQrTUdGWUNhVjBycmF6Kzh2?=
 =?utf-8?B?TEVjWHJOMkJVcFBJVjJnRHU4aG9sMXJSTEc4NXdGSFpoWDhjR1psdmJGVEZx?=
 =?utf-8?B?S2FPSy84dTR5LzJhZ3lQT21FcnJoK3NrNXNpMVJFdmY4TThoUmR3RkF4aDFw?=
 =?utf-8?B?SFZBcituNG01SzFNWk5ySWxHMnYxb0JHekk5eWhYV3hrbW9PdUM5VUJ4ZDdx?=
 =?utf-8?B?MmsyTXhVZlBzL1NpWUVPOERnV1h5N2g1SG9icThSaUlzZHUyUkpyOXhOUnA3?=
 =?utf-8?B?SVE4dy9kbU1XdHNiazdSdmc4SHM4MkgwN3pNOFFqL2sra0p1QWZ5WWhVQzJo?=
 =?utf-8?B?UXBxRkpNcGZSc2JFMDNqQ2V0M3daQmF5SS9PaDhrc1VkUWpWWGEwcFhjWEZL?=
 =?utf-8?B?VXBEQVloQXlBLzFldmFvbHVkL1NIVjU1cHA2aFZLSjRrenZjQmlCajhGaW5R?=
 =?utf-8?B?dGlTSk5xdGRxL3dZR2oyTG5mNkp1ZWQ3VjZMNEtFeWxmRU9EbXF3Ymdsc3pP?=
 =?utf-8?B?V00wd2VMUFZNa2pGVDlGbGNrWStCb1lqNzRaQVFPY0R1c3hKTnNtUTJuQ1Ba?=
 =?utf-8?B?b3gxMGR4b05hYmw1OXk0UkQ5VG5LY1dCd3dBOFMrTEFpWjl1VG9qSFVpTTYw?=
 =?utf-8?B?SFlGb09YLy9pZTlLZ0V4QUk1SFA3UGFnUllrbGh3d2FPZ0U0WHlTTVRaWEow?=
 =?utf-8?B?ZHlINFozaVJpMFFjcDc1Y2VBWk5iQmt5cTVFODhHTzRUSjlZdjF6U24xK1FF?=
 =?utf-8?B?UzV2K0JvM1hrZEJsbW11bWpaVUVFMjF2SGJlZ0E4aHNiQ0ZuNE1qQmYrc282?=
 =?utf-8?B?MTY4WXZnT2FDSTBhYmU0OGpJbzJpNG9OUlRGdjE5bWNVV05oWXp1TVNQMSsw?=
 =?utf-8?B?MXh5TTcxRWRlVHJxWkRUdEtUZUtJZU9jb2EzWWxKalkvdEVDZXg1M3hHcjBJ?=
 =?utf-8?B?eWRLT0dYc3BqL2ZpL29GMTRMakJzZldObjErV0t2bXdTTDloSi8zQVQwSkNG?=
 =?utf-8?B?S0VrY0g0aVozMlFGSnRLeWJxOUd1NStvaGlxaUVncVdEZ2Qwa2pPTEtQT0Zj?=
 =?utf-8?B?M2grRFFTbXVFOXl0b3RVMzJHN1lmUW1YSEZTblJMZlJkYlNNNVltNkhOdkJM?=
 =?utf-8?B?TElXZm1ZL3V0UjAvb2xUWWlZQW84VEp5TVIvblFMMWhUbmg2NzdLeGdOckQ0?=
 =?utf-8?B?cUNwLzByVFFuaVpQWk85eGJibnEzM2Q2dlN6b2lkSyttNGxhL0g1d1RHTmxm?=
 =?utf-8?B?T01zUUFCRm1zK3NWRHZlYU0wdkhMNFdaZkpYY1E2MS94aTB5VXlRSVJxVUJY?=
 =?utf-8?B?Vk1xZk9kNDR2OWZtZmsyZjVod2FhOGNzVG5yWVIycXBYb0VnZUQzdz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: d9bda932-2706-4cb5-e65f-08dee66d6f9e
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 14:44:43.2910
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OaqZ0THff1+fkVSSZAUVob6zn29OKosOp2BGlle/etggZQO3CglxocZVlgVGTNNaRXuwvx0tBr3zIS/vvtrn711ePTkEfVVlXvUJRWO98Oc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6920
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 14:44:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241407

Hi Robert,

On 7/20/26 3:54 PM, Robert P. J. Day wrote:
> On Mon, 20 Jul 2026, Quentin Schulz wrote:
> 
>> Hi Robert,
>>
>> On 7/11/26 12:50 PM, Robert P. J. Day via lists.openembedded.org wrote:
>>>
>>>     testing my recent docs submission documenting
>>> KERNEL_IMAGE_STRIP_EXTRA_SECTIONS, and it did not go well. i'm
>>> iterating through all of the tasks for building linux-yocto for a
>>> rockchip-based orangepi-5-plus, and everything worked fine up to and
>>> including the do_transform_kernel() task.
>>>
>>>     for fun, i added to my local.conf:
>>>
>>>       KERNEL_IMAGE_STRIP_EXTRA_SECTIONS = ".comment"
>>>
>>> and manually ran the do_strip() task:
>>>
>>>       $ bitbake -c strip linux-yocto
>>>
>>> to get:
>>>
>>> ERROR: linux-yocto-6.18.35+git-r0 do_strip: Error executing a python
>>> function in exec_func_python() autogenerated:
>>>
>>> The stack trace of python calls that resulted in this
>>> exception/failure was:
>>> File: 'exec_func_python() autogenerated', lineno: 2, function:
>>> <module>
>>>        0001:
>>>    *** 0002:do_strip(d)
>>>        0003:
>>> File:
>>> '/home/rpjday/oe/layers/openembedded-core/meta/classes-recipe/kernel.bbclass',
>>> lineno: 753, function: do_strip
>>>        0749:
>>>        0750:    if (extra_sections and
>>> kernel_image.find(d.getVar('KERNEL_IMAGEDEST') + '/vmlinux') != -1):
>>>        0751:        kernel_image_stripped = kernel_image + ".stripped"
>>>        0752:        shutil.copy2(kernel_image, kernel_image_stripped)
>>>    *** 0753:        oe.package.runstrip((kernel_image_stripped, 8,
>>> strip, extra_sections))
>>>        0754:        bb.debug(1, "KERNEL_IMAGE_STRIP_EXTRA_SECTIONS is
>>> set, stripping sections: " + \
>>>        0755:            extra_sections)
>>>        0756:}
>>>        0757:do_strip[dirs] = "${B}"
>>> Exception: TypeError: runstrip() missing 2 required positional
>>> arguments: 'elftype' and 'strip'
>>>
>>> ERROR: Logfile of failure stored in:
>>> /home/rpjday/oe/builds/orangepi-5-plus/build/tmp/work/orangepi_5_plus-oe-linux/linux-yocto/6.18.35+git/temp/log.do_strip.2408627
>>> ERROR: Task
>>> (/home/rpjday/oe/layers/openembedded-core/meta/recipes-kernel/linux/linux-yocto_6.18.bb:do_strip)
>>> failed with exit code '1'
>>>
>>>
>>>     all i did was add that line to my local.conf, is there something
>>> else i'm missing in order to use that feature?
>>>
>>
>> Congrats, you found a bug. I sent a patch that should fix it though I haven't
>> tested it, see
>> https://lore.kernel.org/openembedded-core/20260720-runstrip-not-tuple-arg-v1-1-e07764fe3f41@cherry.de/.
> 
>    i can report that your fix to kernel.bbclass allowed my command:
> 
>    $ bitbake -c strip linux-yocto
> 
> to complete without error. thank you kindly.
> 

Can you please answer on the OE-Core patch with

Tested-by: Robert P. J. Day <rpjday@crashcourse.ca>

:) ?

Thanks for testing and the quick feedback!
Quentin

