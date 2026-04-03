Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06B85E85363
	for <webhook@archiver.kernel.org>; Fri,  3 Apr 2026 12:56:22 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10878.1775220975960452506
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Apr 2026 05:56:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=M1bw23JV;
 spf=pass (domain: cherry.de, ip: 52.101.65.47, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e1RSkktWJ+IutzrYlrXhvQ6/9Dj+ZD3HN1fK0iL/7kLkcDGUW8pC7mjfMeQSueJ/2ni76oc2DeSUxGZI9W0kM+RlyBi2oiSP1gbAoh9rZicdy0jg7vkhr1e9RUK2VSCS0cRVJqjXanwivzckkaCYnilD0wUas6LO7hXo2EXUJZqV0WL7QqY7aFYQSPdTJus4YSCz0GmORLiVWF1r7fflosM2f70D4WdhAN78nNDlMz3MRZ+XjQ63lfVEsyF3/UYCN1neqnux8r3w+Vdoe8TiXZa83MIGUfDFBtkoMStB/wrAAbI0pprM3cyNvrLVcBFVYgdMQb/HAsjMNt19/yOhLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cVlNzbcWkpmoSIpLzSDwM105bORvkW9XC2SIwJv44/I=;
 b=oHjZF+w3DQH50oX3rEr/J4uQ5qsrH4EbVACFpC4asdl39pvgBFDGq8mg3rpGFkIe23HgMCG8zyujH3gixJ9UhqTHRXuq6Vln1I/T+Rj+QX2JiK6SpOJE2nTTLNRZd4n54F4ig4k2wkc5RMLFi3HCqspRn2ZYZ5nZlCfCPyl8YWUOp5JN+EVgxlbYFuS5V5jM+6gJLMMzm/XsLgPBF7buZ4TLkyeHKvfx0a5sZRXurK8HkfDMSxe6/hrh5wCXfhOg5EjMoJ+VjCxlSxiZsr4lc57GhLLz4Eo4y5tkGqYDogiKfJ3yAWTxDCKigNVhiIwRVdG6MNyiXCREGtwmTR9Bdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cVlNzbcWkpmoSIpLzSDwM105bORvkW9XC2SIwJv44/I=;
 b=M1bw23JVSX/wGgpbbPvxH1wcM6RGgUGcEUOmNpypwQUcgmOZqbIdbmQjVZFMX96gxrtmaq7bNZF9u/3cIicHhoqyUqda88uFG3pRmykwUMUrZlsZJdzmwsCtuDSPDuHtouWlem2FIBR9KrhszLdvy5GIzF9f4e1NoJVSVVcZAyI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by GV1PR04MB10306.eurprd04.prod.outlook.com (2603:10a6:150:1c9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.21; Fri, 3 Apr
 2026 12:56:10 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%4]) with mapi id 15.20.9769.016; Fri, 3 Apr 2026
 12:56:10 +0000
Message-ID: <06f4e91b-faa2-403c-bb54-3215931aa9d3@cherry.de>
Date: Fri, 3 Apr 2026 14:56:08 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] sanity: Require tar 1.35 or later on
 rhel9-alike distros
To: Paul Barker <paul@pbarker.dev>, openembedded-core@lists.openembedded.org
References: <20260403-rhel9-tar-v1-1-b9c7fb64bbd9@pbarker.dev>
 <aebb87e9-8bb8-4e89-ad2c-6dc447cd8ece@cherry.de>
 <9c10e55cf57909e1cdbbf9d1a1dae2e01ebf808c.camel@pbarker.dev>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <9c10e55cf57909e1cdbbf9d1a1dae2e01ebf808c.camel@pbarker.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIYP296CA0004.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:29d::15) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|GV1PR04MB10306:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bd6ae3f-7602-4099-7bff-08de918060d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|10070799003|366016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	XEWH4B6jwf8B0dZXg9s74JuvM8XVZM3p9py6NcHYfibbpc7nT7YyTRJ8zVPeK8oSbgeibcEP+zwNRazREk9KFFW5MYl7POBSGOYdyXAiRy3WHzDBsXL7pGUPawfn2mRepFh6uGgYiGF0yMP04VnxRzcnWejYKBpO7YpecrnyJuOWuuRmr+jSeH6JUeS1v//kAc83o8C7nqtbaCD6DO+YFVeS/NgHsTzaqh4BMXZvpzCS9ix9wsXNzggEUQV4/bk/UyhSNbPw6BV7CxFX18xtbhSfiLT46ELMc9YtQR/XW85H3IyUnWuUPcM03tPuboRJvN4Y5IFHiFuOOSk7Qvu3kScKx3JO5ZJSktwgtAzGPzGUlowL6wbnRcgGeVbDABcQOLXswtJ6KknxzbAwDJXYAK/c4+oUPh3FxgiqnyiCNPWZQdtagUoiwUBCs9aZbPNxcYldXNskvd6+pRk6XcaxmvXrT84nGna8Zc3xNHzsWNyIF9Guq6SbujqrzahndqBlDt4Cg+u34aTRJ8hOwxK57T/UAhZFFiWdGhPIouceW+3MFhufU22eTe+9+zLBc9a8zrJ9Y5H9ifVchVCkug54uWsTevCLjwf8RkVDwmiMV+t08UdL/AYHfkS26uoOevwhCiKbmmZ0KaVxhO/g5CAV0yGzSWtOqrvtZQjh2zGsjdm5sLL5N7fiUWKnhppWc2LYUX2y35rqbLZ3ADU8DEIIMprMgqmyLvm46sod2y6hak4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7737.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(366016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RC9FemJJZUg0K3g4RUVWSkxPdmVoWjZRMFBQUEdoeXFnL2RJS05wTnYvL2du?=
 =?utf-8?B?NjB2Rk9laE50SHBvanhHRk5WYmZhSTJpSDdubklMalgwRmtDN1luMkFqUVJs?=
 =?utf-8?B?WXZaOWhiSEZDWmdmdjVDclF2a0t0S1drWlVxaitISlZUbmNZbVlSME84dlhZ?=
 =?utf-8?B?K1ZTcjhydGR3Qm4xdHlyUkl0ZzRBRVNzMFVrYmlvb0NKSnQ2L2NCdFR5OFQx?=
 =?utf-8?B?VnpHenNzbDZtL3NwaExmTHlaN0FGemFkK0VLSWNJa0w5Y1kxWklYRGkzY3Uy?=
 =?utf-8?B?emFWSlFMZVI3QzN4NFBPc0g4dlhtTSs3cWRnL2Q4a3VlUmJtTTd6a0J4UFpM?=
 =?utf-8?B?NWdEVjJCUWJYVlQ3aWFzTjRuNVdFaHVKMGMrakhUUGp6UStVczBXcENkdVhY?=
 =?utf-8?B?cHhIVXU1VW1OSWpWK0Q4dHd6eVN2N3lpanlRNkRTSGNqcmpJYWp1eDJGcDZW?=
 =?utf-8?B?WnBNVmJhREU0UXV1My8zQ3NCQ2k5cmpTNWJibG05QjZscVpubkR5ajR4YlND?=
 =?utf-8?B?Rmp6TFFaa1N2SFNHQXpzU1FsZEtmeW9jeWVUMXpLTEorbmVqVkIwdnRucFQ2?=
 =?utf-8?B?V1RSR3VVY01oaktYaWlMenNOWElscE1PSXk2N3JHRS8wK2lrQzVKbkFJcDVz?=
 =?utf-8?B?S2RwZzlpM1N6MHRFaG8xeURXRDNFSTk0ZThDUTl6ZFEvZ2x6V1VlckFqU24y?=
 =?utf-8?B?YkNkQzFQWG5UbXUvUWFrVmJzWDdkUnJXZjRmVUR3TjlMU1VQRnV0Ymt0cDJh?=
 =?utf-8?B?Vkp2dVk4eVhVZG9qUkQ0TTdZT2RVZHJuTGlKbzhCZm5PZmtVa1k1dmY3UCt0?=
 =?utf-8?B?Sm1rcy9JMjFuRnYrK05WZHgwRkQvU3FyYkVXbll0TGpSQ29uakt3T21iNy9z?=
 =?utf-8?B?OWtVTjJ4Y20xOVdtZjBaVUFMU2xUZ2xvNVVveTFwSkloN3JWUWR3QlV5b2M1?=
 =?utf-8?B?VVZ1aWt2OStqTVB6VXZzL28zRkhKYmRiSk42V2JWMnJ3cllYL0UrMnVNaDc4?=
 =?utf-8?B?RHNEZHVpbmJ5Q3ppZTU4aHFvSVp5Q1FNdzh1U2RpZ25odzdrTnc3Vm53M0o3?=
 =?utf-8?B?ckxpbzRFblVvK1FEWFlZVytSNENCRi9Pd3ZpY3JFY25hbndvN1JpVmRVcXgr?=
 =?utf-8?B?QzMvZ0EyUkNRbXVqczRIVkRtR3RDSnk0aEFzeHJQOGlEdENRS3B4S1U1c3RE?=
 =?utf-8?B?anhrRVh0c3hJK1RYbGRMeEJFKzc0aExiR2R2Y1RvTnplVW5MOWpVUHplekFZ?=
 =?utf-8?B?Nm5GS3lqQUkyaE9nN3NsS3BqSUU0WENIZmFGSzJrWkM0VHBWQ3ZhRzVtSG5Z?=
 =?utf-8?B?K2NRdFo0VkYxL3VLajE4QjI5NzhUbktJa0JtSHFYVnV5alJkUWJvUGYrendI?=
 =?utf-8?B?bVI2SXVObGFibUQ3aUUvekpZTnVNZnhVYnBNNmRqU3ovM1lqSndLMjFXZmlo?=
 =?utf-8?B?QkQ0andDSHJ4c2U5RGNpa3JmUWNhOHRuekM5Z2YvTnYrU0NnUXpHZGhoUGQ0?=
 =?utf-8?B?ZmlSVFlWSVZhbXNBWDJCT1JYVGk5b2NzZVNHQ1BtNi9RVCt4VVFsVzA2b3V6?=
 =?utf-8?B?VHJTTCtHWmZrTU9Ld3J1MkRwc0MxTHNNeTlSbGNkN2lRRHgyZ0xqdTJHbEdW?=
 =?utf-8?B?UldyRUc0Y3pNdkRCLzlVU3JOYll1MGQ3UDFpdXNCL1FHci93Wk5YSW9uT3JP?=
 =?utf-8?B?UHREZkJXdlpFRi9zdU14NXdtRkJCYlpSYWVtbDFYakJPSE9WZkpseW9ic28z?=
 =?utf-8?B?d21KRUNqY0VkZE9XczJwelBoRlNISkdzL1M4aWwxbkROWFVjTXFYd0dnR3JW?=
 =?utf-8?B?L1I4MVplejMxUjcrb1RFaWw1blh6SFd3aFZCT1kyZHVlM2QxOFdReFFIYzl1?=
 =?utf-8?B?SFlMZTRKenFYUTdjSjg0RmI5RDRwU21ZUmJodnc5RjJXdHBneUo3dEl6b251?=
 =?utf-8?B?ZWVKNHArY1dUbjgzUjNRR3pIUVNsWXRrcHVVVW1hNkJQVHF0YVZQSzRkY0pk?=
 =?utf-8?B?TlRudmhhRnVXaGYrMDZsT0Z6c3pXeThlaWtMRzhXWUFFazVPQ1MrZjR0VUd4?=
 =?utf-8?B?WmRTYmxHOHcrVzlIUk5xc09RbVBIcmxhd3I0Zm52cW5zTnhHV2RPNFdrbFNs?=
 =?utf-8?B?WGVlTk1WOUtLMHd4aDIyMU4wbXViZ2lkT1huK3dGOG9UNHV0RzJ4REpXSmpu?=
 =?utf-8?B?UHVQZnB5dkw3dktEdllxUEFNVExkNzBqbjFzWC9BcWpuZ1VvQnphbmJnRVov?=
 =?utf-8?B?Q2pYYUo3SVd0NGZNZ20xb0RVcjl0Rmx2dExzNGRGOHlNM1d3RjFEL3BoUGM5?=
 =?utf-8?B?bU50S0FyL1JSOWxRbjVYYjZJZENDOS80RmNxRElUMEh2QTNCUjczdERGajR2?=
 =?utf-8?Q?zqrskaQNdoh/bPtvOnEmU0pQqzykk7NzUSqH6?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bd6ae3f-7602-4099-7bff-08de918060d0
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2026 12:56:10.0337
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bAlmhe45rTJbTyE6IhL8XiCRBwApsUxFd5cg5++/GuiM/W8LFW5YuATf06jvKaCd+l564rUiHWZ+m6+O5eJxn/TQYY0WiFhXBA6Xgnh/19U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10306
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Apr 2026 12:56:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234585

Hi Paul,

On 4/3/26 2:30 PM, Paul Barker wrote:
> On Fri, 2026-04-03 at 14:06 +0200, Quentin Schulz via
> lists.openembedded.org wrote:
>> Hi Paul,
>>
>> On 4/3/26 1:54 PM, Paul Barker via lists.openembedded.org wrote:
>>> tar 1.34 (and possibly earlier versions) is unable to extract tarballs
>>> containing read-only files with xattrs. This was fixed upstream, but
>>> it's unlikely at this point that the fix will be backported to RHEL9
>>> related distros (CentOS Stream 9, AlmaLinux 9, Rocky Linux 9). The issue
>>> affects these distros specifically because they have selinux enabled by
>>> default and this uses xattrs.
>>>
>>> The specific failure we've seen is with the /usr/lib/udev/hwdb.bin file
>>> installed by the systemd recipe - this file is chmod 0444. This leads to
>>> the following error, typically during do_image_wic (shortened and split
>>> to make it readable):
>>>
>>>       subprocess.CalledProcessError: Command
>>>       'tar --xattrs --xattrs-include='*' -cf - -S -C .../tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0/rootfs -p . |
>>>       tar --xattrs --xattrs-include='*' -xf - -C .../tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0/tmp-wic/rootfs2'
>>>       returned non-zero exit status 2.
>>>
>>> That error message is likely to confuse users, and the fix is not
>>> obvious. So, error out if tar 1.34 or earlier is present on affected
>>> distros and recommend upgrading or using the buildtools tarball.
>>>
>>> Signed-off-by: Paul Barker <paul@pbarker.dev>
>>> ---
>>>    meta/classes-global/sanity.bbclass | 15 +++++++++++++++
>>>    1 file changed, 15 insertions(+)
>>>
>>> diff --git a/meta/classes-global/sanity.bbclass b/meta/classes-global/sanity.bbclass
>>> index b5d905399b73..2e486966a93b 100644
>>> --- a/meta/classes-global/sanity.bbclass
>>> +++ b/meta/classes-global/sanity.bbclass
>>> @@ -551,6 +551,21 @@ def check_tar_version(sanity_data):
>>>        except subprocess.CalledProcessError as e:
>>>            return "Unable to execute tar --help, exit code %d\n%s\n" % (e.returncode, e.output)
>>>    
>>> +    try:
>>> +        distro = oe.lsb.distro_identifier()
>>> +    except Exception:
>>> +        distro = None
>>> +
>>> +    if distro:
>>> +        rhel9_alike_prefixes = ("rhel-9", "centos-9", "rocky-9", "almalinux-9")
>>> +        rhel9_tar_minimum_version = "1.35"
>>> +        for prefix in rhel9_alike_prefixes:
>>
>> The commit log doesn't explain why that is specific to centos 9 and
>> derivatives.
>>
>> Did CentOS break tar only for themselves, or is it the only distro with
>> that specific broken tar version or is it the only distro with that old
>> of a version of tar?
>>
>> I'm asking because I am not sure we need to filter on the distro AND we
>> also probably should update the min version of tar listed in
>> documentation/poky.yaml.in in yocto-docs.
> 
> Hi Quentin, thanks for the feedback!
> 
> The issue exists in upstream tar, I'm unsure when it was introduced. It
> was fixed for 1.35 [1].
> 

This is **weird**, because we do have other distros with tar 1.34 and 
they don't seem to be failing (from what I could tell from our bugzilla 
ticket). Debian 12 (bookworm) has it for example according to pkgs.org. 
So either CentOS has a patch for 1.34 that others don't and it breaks 
stuff, or other distros have a patch that CentOS doesn't? I couldn't see 
anything obvious between CentOS-9/Debian-Bookworm so don't know :/

Can you please add this info to the commit log? That we do have other 
distros with 1.34 and they work fine, just the CentOS-9 and its 
derivatives that are failing, hence why we require this only for those 
distros?

Cheers,
Quentin

