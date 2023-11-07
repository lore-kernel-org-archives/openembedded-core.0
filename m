Return-Path: <lukas.funke-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E66EDC4332F
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 12:47:53 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.41])
 by mx.groups.io with SMTP id smtpd.web10.9709.1699361267335865710
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Nov 2023 04:47:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@weidmueller.onmicrosoft.com header.s=selector1-weidmueller-onmicrosoft-com header.b=fWckZ5lT;
 spf=pass (domain: weidmueller.com, ip: 40.107.15.41, mailfrom: lukas.funke-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kV5kujh+pWblERylsbTwKxstpHiV7T2UHFJR0C6NJ6FkOF3sgLWDbXfMPMZGAvVkouC4It6w/owuQ0b23oihkVbsOks6CU0zyWjuu6UcTzxhizgnBqc5OXt8y6yM3Wb2WvlTO1eFZhfyleENPZ4eTkuLjpns2fb9+bnamNbEhgVSpPpOnNaKmTQpiHoOQDgG3RwsR0TMQIYjNmoGagPhfL/EgQotClj/TABwnQvO65+qi5DhseGcS8oh2gTikhU1JXZ5KsTD+Uh74NAO1Ct8yvMFLTeFTCkIAmPh2hC6VHdJL/5X4HP5q66m/iuPiE2vcL0V+YEfqST3eaQDvm+Ctg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZTY8mUzc3F3YXEd12C2hsdR+F0xnbS0kco9quGRRJKI=;
 b=FP8DH35cNYeM4iuSdMHpoqUYkbcEMCd+Wx4XtTGF526O9dNdNJcszijeJE61GsYt7o3CM1aabV0z5qG1Q772s+yPIkNw2JsHb9CEiebMtpOmIE3NVDd+c7phhTmGVrlwlvfDv9BrQVJmCIvoJNWpcxkXuPi4gwBwCDgm/U+atakes4SRKw/Y9N/h9S8zZy3U89KDtvqIM5zcs6GTFfJmYEp8B6NZ4hk3cn/N6g8SL42TNBP7xnrBGs+kZw7n9hS147rx60IMKijdfInPBIastlYRRF8ypN78emy2Sjr70Lsty9L2m9MLPRYUaLfoC+mqqyuOJdXDvZxfnNfCnQRWxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZTY8mUzc3F3YXEd12C2hsdR+F0xnbS0kco9quGRRJKI=;
 b=fWckZ5lTIECVM6g3ykFMx9Yb9iONNw1UBR/3mTC6hzUSyQ7up83hnKdpOP/3yvjF70lxAs6iJjXhljGyNgB5Sn7HIkSS/VskgvQxviMkkD4otqO3reTUjzVNy2g+WcwWZfhPBWOAv1BnJtss+oqMQuxKHuoZ/fuQfg1c0o0oUZ8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from AS2PR08MB8431.eurprd08.prod.outlook.com (2603:10a6:20b:55a::18)
 by DU0PR08MB8977.eurprd08.prod.outlook.com (2603:10a6:10:465::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.27; Tue, 7 Nov
 2023 12:47:42 +0000
Received: from AS2PR08MB8431.eurprd08.prod.outlook.com
 ([fe80::b914:d9b5:6462:13b6]) by AS2PR08MB8431.eurprd08.prod.outlook.com
 ([fe80::b914:d9b5:6462:13b6%4]) with mapi id 15.20.6954.028; Tue, 7 Nov 2023
 12:47:42 +0000
Message-ID: <cbc07983-df4f-47c5-9483-e867c47c6c5e@weidmueller.com>
Date: Tue, 7 Nov 2023 13:47:41 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-Core][PATCH] udev-extraconf: mount.sh: check if filesystem is
 supported before mounting
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20231107120017.515892-1-lukas.funke-oss@weidmueller.com>
 <88e139f8a5d37305c4d0b2156d4964df34cbb830.camel@linuxfoundation.org>
From: Lukas Funke <lukas.funke-oss@weidmueller.com>
In-Reply-To: <88e139f8a5d37305c4d0b2156d4964df34cbb830.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR5P281CA0032.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f3::6) To AS2PR08MB8431.eurprd08.prod.outlook.com
 (2603:10a6:20b:55a::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR08MB8431:EE_|DU0PR08MB8977:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ed4fc8e-ac49-4aeb-36f7-08dbdf8fbba6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	dRQL3vRr7NRAuCT2mXyFUQ/JKio6uWoowpF1WdaSAffNfv/T8NneGxZhcx7kfCBWCVrqYTCQos9fwW6h7E1v+gNZZtzMpGigmelQESEqDcZ8MQ+ZUI3MvwqZO6IOFX3IBqSzBslwOjnPhL45NsDWfu1O9U/UWyHv3lx7RFAyg492pctnqSIdFLi8uTfyP+gPll7ap7xKPwK0xJyfIno7oBr2UI6Dyn2dpuusImHACBrsRXIWmZ607fU13iS9b/Kma1btQpBK81H9gAQix6iAdaSmjGKtFbHl40d0YORWAf3wCW92FXNfpMGvqNZLnJ2yH66/y6LfEPqLrCpx51uvnaNBGz2Vl58sgLHkkkcPn58YqYCLkKiPTwxJreNBU4RZ08wsLK4bYxduQlpMJBn7Ko5ZeMOJ50Ow0B/Cziknszq+t5lrIStVEICvbSayZgIN3nNeNXlutnfmcseG007sEB7cx54dubyOkgQCaYcz0HfSD8MQ6mPMTCrguNz1xBccgHI9F/kl7JOwFeI9f9w3bqJ2V9FjSJRHqJFp3Kr5+o/z1zz09ClDtP19ocOCs/CgkPR8xZcMkEqR49J+YWLPsAXiM0BZbou97xgpDe2hk6DfLXwwen+JXgPfmJjzo+jH3O9rXIYOHodod1mNbk0jfw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR08MB8431.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(396003)(346002)(136003)(39860400002)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(66476007)(38100700002)(53546011)(6506007)(316002)(66556008)(36756003)(5660300002)(31696002)(41300700001)(66946007)(6512007)(8936002)(8676002)(26005)(6486002)(2616005)(31686004)(2906002)(86362001)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UUZkMEtEdk5aNGVPRE9kN3U4eWZ3QjNRK3oyV3YzTkNMWlJlQ1NsTzJIL012?=
 =?utf-8?B?N0R1dEtqYXcrVkVUVHg0MHV3RDhIYVlCeFI3djRIbGdFL2YwdU1yUi8vZndU?=
 =?utf-8?B?WDFjMTRvREN6SDNtYTBXVlVKcFJDNVFQK3NXSWNsMWFyRms5Q2NsYndqa1Iv?=
 =?utf-8?B?OTRIY2x4aFROZzNuZzhrQ3V4VXFtbVJteU5ac2VGdzRydXozYmZwRnJNRHRo?=
 =?utf-8?B?cjN3NDF2QTl3T1Y4N2RhcnY4dXlTTmw4NUJVQ3RrdWZJenlLVndMNGVrcHhB?=
 =?utf-8?B?Q2JJbU1TNjFHUisvYUxVWjd1SDJCSmkyMjJDQWFBY05VRy9KUVBCTGJRUkxY?=
 =?utf-8?B?WFFpOXd5N2szV3RvSWdMWlh3djFyYjA4N3ZEaHo2RU1Ua1VqcWJza3hsNklo?=
 =?utf-8?B?MFNOcUlkSjNsNUdGN2pmZUhOenRjMkRoampSSC94enFyU1RucWxlUG1RZkg2?=
 =?utf-8?B?U2xyVlBlc3BReGFxTFVWV1JJelhCdEowQ1BxTDFWUEFyL3hWZTI5dmhPQ1NZ?=
 =?utf-8?B?K0JVekVwakpSbG9MT1l5aGs2VXJEbFdNV0JSL3h0S2VZQVNvUUpwMWlRNXFI?=
 =?utf-8?B?RFB6ZHFYQjlZcWNqck9Fd1doZW02UjU2RmkreXViOXZmazBGQmJ3ZUJ2TGdQ?=
 =?utf-8?B?clZFRlA5aGY1N2llYUQydWNtdDA3anE3UDc5VGtkTFlKQ3EzZXpCeGZSbGVD?=
 =?utf-8?B?MTRZSkczQ29lNWgrM1BKWVdKZy9sU0NyNzRTR2gwL0hVc3F4MDNnVXY1OFgr?=
 =?utf-8?B?bGtqdFFtUC95cGswcGtPWHc3TTROTEY3dllWVEU5dWdPcXZwd0JoVWNLcEls?=
 =?utf-8?B?aXo4N3RuTnl1WWFuYW81NjVHODFLVDFzRmFRdlpnV0djMGNBNlN5ZU1tL09I?=
 =?utf-8?B?T2ZYNGFhMnk2ZGVMeVJoaVFnUmZoNWVncGVVV1p4VmhEd240SFdkZS9EeW5m?=
 =?utf-8?B?b095RkdxVUhkQ1dLL1p1U1Y5YTJYOTVZc0NsM1NtMHdzZ3lBZGpFaTBxaVk2?=
 =?utf-8?B?WTlUOWNWcm14ZTdQZHMwQlZ3SVZNQ1h1dS92T1dqVytQaHBJOFVHYkhuTU9F?=
 =?utf-8?B?VDVjWFJNcVZRd1d4b2YxeFZzTzd2RldubVZrZTkxQ3ZNSUtOMXhGbTFmL0E5?=
 =?utf-8?B?SUFZUEYwNXJnSjV3elFlZy83U2lLRUJtUk1HV0hXWUlOV2J3VEtKbkdoN3Zj?=
 =?utf-8?B?OTJZL0JrTlhBeTE0dVdESU5PMlNOWVRkSjZlYTVSR1UrUkdKUjlHblEwVHBk?=
 =?utf-8?B?WXgwRmlJbjVkaUNGSnVadHV1aXVGUjFxR0lORWU3WHo3MTJlaGVER2c1dFRY?=
 =?utf-8?B?ODV5M1VPN2hTcHV5QWxwMGpyYnZXdjg5bGdONVZwTXBKR1pLVjhlV0M1ZGhD?=
 =?utf-8?B?SFBDdmtRb3M3MDJZaE9UeXdPZmhlaVdJT0JSVjRHNGxGTkdoNkRRMGI1MHVi?=
 =?utf-8?B?dGNSVTRLdXRBOCtHdnRWU01XRnE2QVMyd2RQbDI5TFQ5UEFWRWhsWFpxS1dG?=
 =?utf-8?B?QjZPYjUxd2Z4M2JSZ2RBcnlaQkx3WWFuZnBhbmRsQURQLyt5bTlQVmdrdVNo?=
 =?utf-8?B?Tm9hV21xNG9OV1BOMmlBTlFYeFkxdW1QNUpVK3N1MldQMW1GbWZuUElPNHA1?=
 =?utf-8?B?cTQ3QjV0K2diY3JkNjY3cDY1aExpYkNTSUdZWlV4VklWMzdZaTI0R2I4ZHpJ?=
 =?utf-8?B?ZDNXdVlNYnNUYmd3SEppZGpoWi82L005cEdxaXVtVXU5aFdQdUNLUFNISUtW?=
 =?utf-8?B?dlFjTjNSWW1pVklZM0FQL09lNnFCMUE0MkZvOURKeWtNOXdBd3cyK2xHQkl2?=
 =?utf-8?B?N2dNUXgzRlBhcTZFSXdkK3NmVDlqWUZ2WVQ4R1JSdjNDdTl1VStKWmI2cm5B?=
 =?utf-8?B?ZXhRWkV4TWZzUXBpbGhVcHJzZU13VUltMGdkRUNKbjRtYlJpOUt2eGNNMGJ1?=
 =?utf-8?B?Z2ZCRVZkT3BEV3FObmNrbVBzTVpLVEVicFJIbFRDZjVEb0ZpNHNQS0p0R0sw?=
 =?utf-8?B?R3Z5YjFndUJPZDRmZ1VpTXlqNTM4TDRpbU1SSlVzNElMUUsxRnVYS1hJWDBl?=
 =?utf-8?B?QklFZXRQWm5aR3gzaDA5akdFQjQyQVZzZjVkazc3aXc1K3piV1VFV1NTN2J6?=
 =?utf-8?B?NGRkeTVmYUU0YkRkaDFPR0tqMWt2UFFEV0hNQTJFa1hHUll2Nm54U05RT2cx?=
 =?utf-8?B?ZUE9PQ==?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ed4fc8e-ac49-4aeb-36f7-08dbdf8fbba6
X-MS-Exchange-CrossTenant-AuthSource: AS2PR08MB8431.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2023 12:47:42.5502
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VFJdVQ8/l1kEQgchEYFpNtPPYDHhALU3qmtzBq5aMMcc0jk/N87KPZMKglz/jhq0NGA//K1OEWvxshCURZzW6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8977
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Nov 2023 12:47:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190280

Hi Richard,

On 07.11.2023 13:15, Richard Purdie wrote:
> On Tue, 2023-11-07 at 13:00 +0100, Lukas Funke wrote:
>> From: Lukas Funke <lukas.funke@weidmueller.com>
>>
>> Check if the filesystem is supported by the kernel before trying to
>> mount it. Systemd-mount will mount the directories asynchronously
>> resulting in stale directories if the devices filesystem is not
>> supported.
>>
>> Signed-off-by: Lukas Funke <lukas.funke@weidmueller.com>
>> ---
>>   meta/recipes-core/udev/udev-extraconf/mount.sh | 16 ++++++++++++++++
>>   1 file changed, 16 insertions(+)
>>
>> diff --git a/meta/recipes-core/udev/udev-extraconf/mount.sh b/meta/recipes-core/udev/udev-extraconf/mount.sh
>> index 989fabc194..59563b7511 100644
>> --- a/meta/recipes-core/udev/udev-extraconf/mount.sh
>> +++ b/meta/recipes-core/udev/udev-extraconf/mount.sh
>> @@ -36,6 +36,17 @@ do
>>   	fi
>>   done
>>   
>> +is_filesystem_supported() {
>> +    list_fs=$(cat /proc/filesystems | cut -f 2 | tr '\n' ' ')
>> +    for fs in ${list_fs}; do
>> +        if [ "$fs" == "$ID_FS_TYPE" ]
>> +        then
>> +            return 0
>> +        fi
>> +    done
>> +    return 1
>> +}
>> +
> 
> We once went through the init scripts and carefully minimised all the
> fork() calls in them, since all that process execution overhead does
> mount up and delay boot times.
> 
> I really don't know what to do, whether I should continue to care or
> not. It is easy to say systems have plenty of memory/cpu and therefore,
> "who cares?". Equally, systems working efficiently is nice to have...

Not sure if correctly interpreted, but it seems that there are some 
"frustration" vibes in your reply :)

I was not aware of the discussion but understand what you are trying to 
achieve. We can replace the 'cat' with a 'read', which should avoid the 
fork() since it's a shell-builtin (correct me if I'm wrong).

Best regards
Lukas

> 
> Cheers,
> 
> Richard
> 
> 


