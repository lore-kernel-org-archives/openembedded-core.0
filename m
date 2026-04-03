Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29675E8536D
	for <webhook@archiver.kernel.org>; Fri,  3 Apr 2026 13:27:22 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.21])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11695.1775222832399411390
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Apr 2026 06:27:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=m1oGplP4;
 spf=pass (domain: cherry.de, ip: 52.101.83.21, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N2l/rSwDPcRD74ZqfbwgqaCsx/xwYpZWaHj+MxQY1aYrSX0sDr6Th8LtkRR26ODzIjPYXydEJB/IR/78Ovs3uVpFZpmikyNlY4ijKdrONHmtNN1LH4DagnBLXepCSwY5/EYAQmXj81KXCedPP+M5spAkpxOyF8PGYphCOP52TIb9t36XvbrNmNfNmefB8mRzFT1Zv6LkbJ39dsHnJnAAFLX37ycYPr5lEfsRYQzv6vvq7jHzeqVzkxtLgWYZJwQablliG+EkX8Qn59SXowO/YXAY/qcqblBUS4kKBt5Eg5sV8k+Mq6mk42VbiXjZHuToGHM0sGyVrlcGZrIYJz06gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UYY9NIy8r6dh6ffqmHoaX7WcVAzlQpTcUgxN6EO0Qc4=;
 b=gURXdolshapP3gVKsUpnOg4PMKfUSd/8JU+L2jt76bw8fpc5EX9pfGJbsmtxixTYZ+ui1eNaxiifCddALrv7z9IA6As/m0th2Pfxuzte0y46+acjg9nuYR4ahWBOcz8nqn81vMek/39EDWZJZAgFf9/hS89nwzZ56yso3k+3gWPyMuvANVAM7xzngDvaYAtgtWIJtHau4PTO/t7V4VbMcNlk/u/i7oEw91w1HMTnqp9xflxJEgnHf2+GDeL9us+vpZwpRV/I6eqBSxeI/d/Jz7GyqtberHWdA1xSPWqhJBt2eZd0x7tuyeV9vnJPayXP2XW0okTTCgLKdOoTaNFmbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UYY9NIy8r6dh6ffqmHoaX7WcVAzlQpTcUgxN6EO0Qc4=;
 b=m1oGplP4cidoR4Oxi60IPjF61esNwK+DBsMcsXMzyo99ObEkPKLmLSkrGHMjndi7da4bCpjqk7fHw0GOp4djB8iMuh8/tJ+kcNf3RB76HN5V/dxFitAzs3bBlinJaHCebdVZgRkXOwHtUmy2IkruiikUGtq6z/XQfdBDz+sHCyQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by VI1PR04MB6992.eurprd04.prod.outlook.com (2603:10a6:803:139::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Fri, 3 Apr
 2026 13:27:05 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%4]) with mapi id 15.20.9769.016; Fri, 3 Apr 2026
 13:27:05 +0000
Message-ID: <e20e87c4-f42b-4426-aa53-379cdb8cf023@cherry.de>
Date: Fri, 3 Apr 2026 15:27:04 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] sanity: Require tar 1.35 or later on
 rhel9-alike distros
To: Paul Barker <paul@pbarker.dev>, openembedded-core@lists.openembedded.org
References: <20260403-rhel9-tar-v1-1-b9c7fb64bbd9@pbarker.dev>
 <aebb87e9-8bb8-4e89-ad2c-6dc447cd8ece@cherry.de>
 <9c10e55cf57909e1cdbbf9d1a1dae2e01ebf808c.camel@pbarker.dev>
 <06f4e91b-faa2-403c-bb54-3215931aa9d3@cherry.de>
 <752a6178f694a68d3d2ce8793a3a49b09f509e96.camel@pbarker.dev>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <752a6178f694a68d3d2ce8793a3a49b09f509e96.camel@pbarker.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0118.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::10) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|VI1PR04MB6992:EE_
X-MS-Office365-Filtering-Correlation-Id: 7abca4d2-0d79-4a6c-59f6-08de9184b2db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|366016|376014|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	malgcqP4y/ojRmg0SRCc80+XrY4g6Zs2w5ZAbftNWYYYSu/Pn/kRSPC/PjbYM3m9U3sFWmB6iZ2/bZm6sCODl9S0hK+jeu4vAguGdmlWGDmxk2NAVhwBnrJ94ADy0QILVs5656uij2hdTyAonCGWgmFgt51X9HroYsDIKjiEdfYGkr70uahuSx5797/22p3ay3ygIaAV9jtQr4xFonYZ9v6WhFXKO0ko8kYnuVm5OrYgDvfnb+0qHXqFp2/KjodiUUeZWmrbu4qSoiUH4yoTr1NzzG2xDxGXXjmDwWj+9XozHtiPAX0s1ygp8IfvgzEXrFK0ndM5huNx0+s55aXmNQ5oSzWzIwyaFLhS3TkkmUK3ep+sR08G3woVmzhvohXR+kvGY+k2xqCNrBv9mVlFCGLOBaCA7WQNzQ4K0mJba6FhZUrKVE5yfhH4RaHX8yethk8ueD9YYSpYr9jQa3JQDEBfGqAGh5sAFCPNUlPL4Z9wJwooS8xnBGa5O9JOzopT9GjQ1So8R+XxjMBkOr2Mc4SmRoABu8fN77cQA6APD//8D/gzHUkQKuW4o5mGpG99BVN9V0/yTzvaDBQd7X9slCiBgigKdZ5mzHHnYXBL1nNcmXHGgfJhq3jrZhHggFiBoDKlcyoo7oD9tHnDYpsh2naja7Ta5QAciRLeRL3czzY7OlcEjmjUxeiwnTlGsyTy
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7737.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(376014)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ckZrQlltQzFPM3pMa3pNdWcrN2RBRHJiUXkxNzRkNlIzaHE1MzlpQlYvTC9o?=
 =?utf-8?B?VGIyTks1NkxKZ083bnp1OUZmWldRWlJvNE1nTDhBc05NU09LV2MzSjh2eVB4?=
 =?utf-8?B?UFJRekVEdy9UQi9UckdUYlR3eHVOUkVhbWN6VWx2cUt6QzgwL01lY0lZc0ZR?=
 =?utf-8?B?cVFlcFdxaWVwbFNDU1ZnVURYZ2ZwVWdTc3NERlVGSWRNbnZSMjhqbitDQi83?=
 =?utf-8?B?akRDRXE5Mkk3ekNYOUxHNlR1blRUYzNjVTdGUzVsS2ZydWpoa2JKSlhJQit4?=
 =?utf-8?B?MGdOQ0V0eHVPS2tMM2hmWVF5NFFKQTZsT085clAvTkgvTE5sUHczdXlPbjdV?=
 =?utf-8?B?WFFiNzBDRmJQYk9iSTNybjBZS1Erd3RQaWQvVXFZajJnVlgxdUdQMU16ODl6?=
 =?utf-8?B?bFJjMjR3YTFkWlFyVXpFOWVNaFRIN2pLMlFnOUhNQnRGWHR6ek80SHYxdExh?=
 =?utf-8?B?YTBSak5pS0MwMTFCK2xrOEtZSEZYM2Rlb0R1K1A3OUdlTTdsTFI5SWx3WGJM?=
 =?utf-8?B?TDRVbFZYVDR4Sjc1dkxWSVJUaURPUW52WGRDMlZGY0xwTUtJRWh6RHlUcDRk?=
 =?utf-8?B?SFRzWCtQZHRNVjdGSzBrRUZmUFp6S2s1TEJXMGE4ODJmZXlhdXZjTEVkU0la?=
 =?utf-8?B?Yzk0RUlPL2pJMWxSbThHZVRsSFZSa05EVlVNaGtsT2VGeHF1cXZFMXhOQUZu?=
 =?utf-8?B?Si90VEVweTJiSGVIclFKSDBFejVCMWV1blJ4UkZEeWd4anIvSlArNXYweWVQ?=
 =?utf-8?B?WDhJUitjM2h1VzRwRnprcUhqamh0MENrVVlIdVpoam95L1VaQmYySjQ0YmVk?=
 =?utf-8?B?NEsxZDlHbkNNZmFkZGNKY3gvZ1JRWE13ZTNmYlNnMjAzeVZLMCtBbzNTMUV4?=
 =?utf-8?B?bjIyVGEzaDdSWVltci9TalowQnRqK3U1KzZTc2ZFTWFaL20vbUhwUE4vTk9m?=
 =?utf-8?B?MjNvVjMrOWxSakllbEZLWGo5VTl5TXpiSGhsOFI1MlpwTG9lS3NQOHB5bVJ2?=
 =?utf-8?B?d1NHdWlyaE5UeVRVMWZINy81YnRMZEdMOEVzTzBQWVYvZklhMnoxN3lGcUxv?=
 =?utf-8?B?SDhEeXZ1cldxVm1MeFRBVjkwK1VMRWFsY3VsQzF0R3RxdUM1SENwR1RURzR6?=
 =?utf-8?B?STZ4VFF6ODBUdyt4ODFrcG1iS3VOdW5LS0wwNUhUY0NoQVQreXNqK1preW5Y?=
 =?utf-8?B?UFVtN2JUVHNmOHk2eXkrS25XeGpQM2dZREk5ZE1oWmpFZE54N2lhYTZqRjNU?=
 =?utf-8?B?Q0drN1pZcXpTV0pqYjV0Y25uWXdBbnN5ZU8wdmxsRHdNRm9mdmhlZWJxZE9H?=
 =?utf-8?B?N3VvWFpQRVEzclp0ZjhQU1d6SWlTMVNGZWd3MXZsWnl2V3RQUnpTdS9CVE42?=
 =?utf-8?B?T1k0ZnNKb25HWmZZbFFJMzJ4eW1VNEhWT2NWOG50QW93QWRraWQ3OXR6K2Y4?=
 =?utf-8?B?OU4vQjRybHNNajJTejc0WURJSjdwcGRIcDMrOFcxbk03ZHZ6QVhSTnRjOWVn?=
 =?utf-8?B?MnAwcUcwNDFxMG0rVXNGcVpXM0c3SFhMNEZyR1dCelVZNFhEYkxDUkNrTnZQ?=
 =?utf-8?B?NGM2WEdIVktXNDNybjBTbGZ5NnRYSDhjdkVUUXVhcjJmSGxnTDBVTHIyc25z?=
 =?utf-8?B?VXgwTXhwZXZKR3dYSlZRQXdNYzNwL0NtMGFLTlVQWkJ0WWsrOVpCNDlONVNQ?=
 =?utf-8?B?SzFxVVBGN1pYbWwyTXBUMEg0akVwbW5Mb1FaVDVraTE3bFlCb3VGMnhZTWpI?=
 =?utf-8?B?MUxrUjdKTGN0UWsxTEQyb29qOWVrZHRwYnE0QUcxZldYcU1nVXRjNXh4dTV5?=
 =?utf-8?B?WGhXYzR3Vjh1TzAyMTE3V3V6RTZBWE1aejRmNy9YemRFNVBobDZWbmFRU290?=
 =?utf-8?B?NlNLSExnYkpFTVRHQjV6U3BLTHE5ZDNtWGdEcnRWNUk5N2xyY1VFbUh6dFp5?=
 =?utf-8?B?d2kwU3VIMG5CSm4xdE91WFpFdVFZTTB5UitzRDFWdzVFdXA0YXhrSGdyT2tY?=
 =?utf-8?B?UjRadjJoRCtkVlJlaTcvcjF4Y2JUeG4rQVkwQUx2R201Q1BJMFFsR2NQR2h4?=
 =?utf-8?B?WG5NT3J4d3pCN0tlK0pNU1RWeXVjQndseDBaVlFxSzFwN1owRk1UU1lPMUU5?=
 =?utf-8?B?OHkzZldIRVduRVRqbldQYWRrYzBNRnhJVFpvbDVTQTREbmpWemFHOTl4Rnpq?=
 =?utf-8?B?TTAwQmVFZ1BldHJhaDY2YUtVZDV3NUFNWEd1ZW5HTUNwcmY1dUxGMUxYTWJa?=
 =?utf-8?B?SjM5VnBEQ0x4bk5uSWw2YmlnaFptQmpEaDRReFlxVld4LzYxaWRNWU9maDEy?=
 =?utf-8?B?VUxFUGNVOUt6dDB3YUkxWkM0UXRmWUUwVm1YS3B4YVN6UlBGWlY1eWJONnc2?=
 =?utf-8?Q?/RaX3borJ5R/2W2vbI2Z56NLYGp/A0H28F1X8?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 7abca4d2-0d79-4a6c-59f6-08de9184b2db
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2026 13:27:05.6595
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nmxajk/hs/2asVUg+dh7Fg9hz17JEKaITsu+jsnJdAEbPNdn4asSJ+ngQjavlrqTFNrcauApbAGPSym8EW3rvd/D44FcjlU6Xv6kTi992rU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6992
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Apr 2026 13:27:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234587

Hi Paul,

On 4/3/26 3:06 PM, Paul Barker wrote:
> On Fri, 2026-04-03 at 14:56 +0200, Quentin Schulz via
> lists.openembedded.org wrote:
>> Hi Paul,
>>
>> On 4/3/26 2:30 PM, Paul Barker wrote:
>>> On Fri, 2026-04-03 at 14:06 +0200, Quentin Schulz via
>>> lists.openembedded.org wrote:
>>>> Hi Paul,
>>>>
>>>> On 4/3/26 1:54 PM, Paul Barker via lists.openembedded.org wrote:
>>>>> tar 1.34 (and possibly earlier versions) is unable to extract tarballs
>>>>> containing read-only files with xattrs. This was fixed upstream, but
>>>>> it's unlikely at this point that the fix will be backported to RHEL9
>>>>> related distros (CentOS Stream 9, AlmaLinux 9, Rocky Linux 9). The issue
>>>>> affects these distros specifically because they have selinux enabled by
>>>>> default and this uses xattrs.
>>>>>
>>>>> The specific failure we've seen is with the /usr/lib/udev/hwdb.bin file
>>>>> installed by the systemd recipe - this file is chmod 0444. This leads to
>>>>> the following error, typically during do_image_wic (shortened and split
>>>>> to make it readable):
>>>>>
>>>>>        subprocess.CalledProcessError: Command
>>>>>        'tar --xattrs --xattrs-include='*' -cf - -S -C .../tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0/rootfs -p . |
>>>>>        tar --xattrs --xattrs-include='*' -xf - -C .../tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0/tmp-wic/rootfs2'
>>>>>        returned non-zero exit status 2.
>>>>>
>>>>> That error message is likely to confuse users, and the fix is not
>>>>> obvious. So, error out if tar 1.34 or earlier is present on affected
>>>>> distros and recommend upgrading or using the buildtools tarball.
>>>>>
>>>>> Signed-off-by: Paul Barker <paul@pbarker.dev>
>>>>> ---
>>>>>     meta/classes-global/sanity.bbclass | 15 +++++++++++++++
>>>>>     1 file changed, 15 insertions(+)
>>>>>
>>>>> diff --git a/meta/classes-global/sanity.bbclass b/meta/classes-global/sanity.bbclass
>>>>> index b5d905399b73..2e486966a93b 100644
>>>>> --- a/meta/classes-global/sanity.bbclass
>>>>> +++ b/meta/classes-global/sanity.bbclass
>>>>> @@ -551,6 +551,21 @@ def check_tar_version(sanity_data):
>>>>>         except subprocess.CalledProcessError as e:
>>>>>             return "Unable to execute tar --help, exit code %d\n%s\n" % (e.returncode, e.output)
>>>>>     
>>>>> +    try:
>>>>> +        distro = oe.lsb.distro_identifier()
>>>>> +    except Exception:
>>>>> +        distro = None
>>>>> +
>>>>> +    if distro:
>>>>> +        rhel9_alike_prefixes = ("rhel-9", "centos-9", "rocky-9", "almalinux-9")
>>>>> +        rhel9_tar_minimum_version = "1.35"
>>>>> +        for prefix in rhel9_alike_prefixes:
>>>>
>>>> The commit log doesn't explain why that is specific to centos 9 and
>>>> derivatives.
>>>>
>>>> Did CentOS break tar only for themselves, or is it the only distro with
>>>> that specific broken tar version or is it the only distro with that old
>>>> of a version of tar?
>>>>
>>>> I'm asking because I am not sure we need to filter on the distro AND we
>>>> also probably should update the min version of tar listed in
>>>> documentation/poky.yaml.in in yocto-docs.
>>>
>>> Hi Quentin, thanks for the feedback!
>>>
>>> The issue exists in upstream tar, I'm unsure when it was introduced. It
>>> was fixed for 1.35 [1].
>>>
>>
>> This is **weird**, because we do have other distros with tar 1.34 and
>> they don't seem to be failing (from what I could tell from our bugzilla
>> ticket). Debian 12 (bookworm) has it for example according to pkgs.org.
>> So either CentOS has a patch for 1.34 that others don't and it breaks
>> stuff, or other distros have a patch that CentOS doesn't? I couldn't see
>> anything obvious between CentOS-9/Debian-Bookworm so don't know :/
>>
>> Can you please add this info to the commit log? That we do have other
>> distros with 1.34 and they work fine, just the CentOS-9 and its
>> derivatives that are failing, hence why we require this only for those
>> distros?
> 
> Hi Quentin,
> 
> The commit message says:
> 
>      The issue affects these distros specifically because they have
>      selinux enabled by default and this uses xattrs.
> 

Someone didn't pay attention when reading, and it wasn't you, oops.

But now I'm wondering why Fedora isn't failing? My f43 has SELinux in 
enforcing mode according to `getenforce` and I'm pretty sure it's been 
like that for many releases. So I checked the history in 
https://src.fedoraproject.org/rpms/tar (you have to clone it locally, 
their UI is broken for some part of the history). They had 1.35 in f39 
already, see commit d35459608992 ("Rebase to version 1.35"). We only 
support f39 and later, so that's fine on that side!

Sorry for the noise.

Cheers,
Quentin

