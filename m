Return-Path: <hayama@lineo.co.jp>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C094C0015E
	for <webhook@archiver.kernel.org>; Thu, 27 Jul 2023 08:22:48 +0000 (UTC)
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (JPN01-TYC-obe.outbound.protection.outlook.com [40.107.114.138])
 by mx.groups.io with SMTP id smtpd.web10.2828.1690446157874783196
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jul 2023 01:22:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@lineouser.onmicrosoft.com header.s=selector1-lineouser-onmicrosoft-com header.b=ZnfTs3Kf;
 spf=pass (domain: lineo.co.jp, ip: 40.107.114.138, mailfrom: hayama@lineo.co.jp)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gs+DXjDAzNaEGEdprEKSeTWRG6o6WJPn5mqwxE0zvS5O7LsfBbKcJJVnPCpfK3tErfx2N2daChRJPe0vHP13RD3G83SYRwasslHplFBXP/ncbi6PkIMJLu+wL81qGz1+0wFNMcPp84AWyusJsE8HV3qd3yOmRO8I1zGKXRV79W5Diuj6ladMp7Yl3a6LwS/EI3DhyHgwfuugss276TgzZIYVDiIbN7J0ypwCPZSgT/1e7zfv/f6R0hiyVMntw/Xpp5I6BG+vlQsjsvbseDs3rvhWhqr89ShaO6eNc9/cwvEb34QB9uJh82zlbwKshE+hoLo12ldtOaLs/Ewcf32BFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9fFWCCetC4iHYkNl/RFqi5CO6vQiC5xNUEHeFfFT83o=;
 b=LvMjDEpUxFG7LYb4gz2PfHciZsOnUXrN1GqD2zSOXJyeLZjjOx9cRKFz0l/JtcER4E5XcIa9moJZOlpOD0oYFOZiLXV6Bi4piQSbEcgVQyfiCl77ZWbhTJLrvR0Ej8Nji2G47Y7ENxgVl62iQALjJAMWKGbKl3UekmMEzFdedkBveIFIweHx0IkbaLO68hFEAmETW6xdrxAYMU4YeFNCAWqRTBu7uZIrRQZA84aCElJjCuAUsw1thubEfKOpYauI2zppD+nD4+N6lN3cCM/SOsqGv9+UopRp3NwhM2K+GMGIB0TAJaACZcOs5S9BdqbcmWs+Nt5p5z29jUvz2kQxaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lineo.co.jp; dmarc=pass action=none header.from=lineo.co.jp;
 dkim=pass header.d=lineo.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lineouser.onmicrosoft.com; s=selector1-lineouser-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9fFWCCetC4iHYkNl/RFqi5CO6vQiC5xNUEHeFfFT83o=;
 b=ZnfTs3Kfc2J5EOf3NA/sOC/E2pfpDTXS0oQ3mdUw5VMNdHv5f78e7fCCwl3+dBB85IH6z1ich6yMKpAIOZ/zRcr91r/YWCHXsWw321frT6SD0uxgBLEXnFRxNEMChZbn7koR7iwEGHK72Hi92RspVhHhMjd6rhXbAwIf+d9nBnI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=lineo.co.jp;
Received: from TY2PR01MB3769.jpnprd01.prod.outlook.com (2603:1096:404:dd::23)
 by OS3PR01MB9673.jpnprd01.prod.outlook.com (2603:1096:604:1f1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Thu, 27 Jul
 2023 08:22:33 +0000
Received: from TY2PR01MB3769.jpnprd01.prod.outlook.com
 ([fe80::8834:3ac3:f0fb:e0a1]) by TY2PR01MB3769.jpnprd01.prod.outlook.com
 ([fe80::8834:3ac3:f0fb:e0a1%5]) with mapi id 15.20.6631.026; Thu, 27 Jul 2023
 08:22:33 +0000
Message-ID: <512858f6-70f2-1e0a-5b7b-2ba667dbf3b1@lineo.co.jp>
Date: Thu, 27 Jul 2023 17:22:31 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [OE-core] [mickledore][kirkstone][dunfell][PATCH]
 systemd-systemctl: fix errors in instance name expansion
Content-Language: en-US
To: steve@sakoman.com
References: <1775ABAC58286773.27447@lists.openembedded.org>
From: Yuta Hayama <hayama@lineo.co.jp>
Cc: Yuta Hayama <hayama@lineo.co.jp>, openembedded-core@lists.openembedded.org
In-Reply-To: <1775ABAC58286773.27447@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: OS7PR01CA0258.jpnprd01.prod.outlook.com
 (2603:1096:604:255::17) To TY2PR01MB3769.jpnprd01.prod.outlook.com
 (2603:1096:404:dd::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PR01MB3769:EE_|OS3PR01MB9673:EE_
X-MS-Office365-Filtering-Correlation-Id: 719bf4aa-3509-4fba-8079-08db8e7aa0c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ZKInoAk8EJB/8/3EiEQcXDDQr/Ridc5Q2BkWPy9qzbv1pa41k3v0Fa5yJcqz8FbTO737wyvU8iu607bX1mANFFzlebNj7vN3JKXWKxReyL1zaQZL0X240lloV0E9k+Hh551AkK2EtFpwMS4z1lSs+hGEasWkaLT089MZ0n+AasamLUvH6tyqMLKaEZjX2i2Em1WRumfyqfgSbK/+YaJCT7vX3J2LTWlnA07LdixBvDnVaV6EeloZni+lcqV0qIUsfZZQsgKCAVRgzOK/AivUjD1fsnbwmXstSFxB10ByjS0Ikf8I6WvEPGKWU6U95TszUZ5kXIX7RnYKuQUVaR62h+TFjKvrFzP+Axg11V6IH84vLv06qkFy/4e/FktfVtoKbBnGiMZtC/18d+Y/veK7/kqrEhg5ELF8GMxT7wI8jQi0tcR85VQQvISOv9GeWnJCxsZD9qj6EISn1EhP1Y1N/+wlUoLomZ/oii7Jm8zJj3tf3kfcsvJsbGs/4qodV4AR9di7ThLkMeQV8TIb6HHsukWWlxVpmc9ASO27NI//4t35u343s7B5aB9TFcEduulv9G65xaQfr27fbjyJe1ZADNJj7Y0Do+PAPTxEfrTqMIjHIz3DfFd5D/uedKT2abeMBnRa3q3QCsxouibNY3CDcg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3769.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39840400004)(396003)(136003)(346002)(366004)(376002)(451199021)(6512007)(38100700002)(6486002)(966005)(478600001)(41300700001)(5660300002)(2616005)(8676002)(4326008)(66556008)(66946007)(66476007)(8936002)(6916009)(316002)(186003)(83380400001)(53546011)(26005)(6506007)(31696002)(86362001)(2906002)(36756003)(66899021)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SklESlorT2NWVUc0Qm84TnovR2FlTjhYc2dzN1dET2xnLy9zOHJZeFBEVGlP?=
 =?utf-8?B?NXl6R2JEVTA1SmtvNFVlaW1TN3YzT3BEVGM4cmtRS2ZRNGVRcEVvSFpmWVgz?=
 =?utf-8?B?M1hWMUdyaCtiRWVTYUFIYVlCZGx1WmZsNkVtdUhtalZ0YTZaQkZDRTZJU0Q4?=
 =?utf-8?B?UTU2am85MHNKakx5UXV2dVJUMWZnaFdMdEpaZzJQMWpqWUlscHBwZ3EzVnRN?=
 =?utf-8?B?enBWbkZCbmJLS1JPeGkzOEIwN2VUYUZ3OTVpN1ZmR3VJZGVxTEZHZC8xT2t2?=
 =?utf-8?B?b2dlMTRkdmVRMWtyT042b1Z2TXRxRCtrNnl0eXFwVlVLUVdZQ1g4bzhGM0dv?=
 =?utf-8?B?ejVRRitzeGtMc1FnWDN6YUJoVi9lQjBwb21HeWRhMXZPUjNSYnpqNU1HUlNu?=
 =?utf-8?B?ZXE3MkcvSUg2eW5xN2Y1Z0NLWUpqQzNVbk01dmZ2NjRRRFdRVE1NWEtnVUdm?=
 =?utf-8?B?b3NPK3VhYVFwQVBpd0s0L29YOHdwWWxKa0ZZSjBVWUR6bTJteTZRYzcvakYx?=
 =?utf-8?B?VzJzZ2lSWWpiVytEQ0NDanlhTExRUFkyT1dCNWV4dTBzYkIvblROTWRHVmRl?=
 =?utf-8?B?OHJRODhOdkhSSzBQbXovSm10N3NuZUhLVnlFcHBDR09ROVhtVElXcFlzZHh1?=
 =?utf-8?B?L2RhS3F3SWl6cUsyT1ptRHhnSjZLR0diTGVLSDNlMUJzempKb3MyRk5kYmxa?=
 =?utf-8?B?VFVMWm9wQXhzQVZkb296T3YxNmFYYUlQQjV2Z3dxakZUYS9CRkdVNUtqRWtV?=
 =?utf-8?B?ckkrVVdqVnhvUWsyZDNDVVZ5RjhtaS84OEpGb25ackJSdVprMmFYdzdoNVg0?=
 =?utf-8?B?R1ovOXkzSVlPUmRERTNtcmQ0WEF0SzZIazhXcGxVRDFSUDFpVWxEaUp6WUR6?=
 =?utf-8?B?TGd5L1JJTHVackpOMjdWOEpCcWxPVnRKV1VMZFdraXpaU1FqTFA1SHY4SmtY?=
 =?utf-8?B?QjF2ZkJpOVBleHNRQndvR1hrTDR6SW5KYUdWWEgrUFd2VFZ0QXRobHJNazBa?=
 =?utf-8?B?QUxkcy96SEZTeFdsTDA0V2NYWVkvZnZwUi9GVFhmeDY2VVNZejZnNFR1UWts?=
 =?utf-8?B?NmNkSzUzMkZWL2tDc1d0THkrZTdBREFBeE9UdFJ2S0g5NitzclptU2hOSjgv?=
 =?utf-8?B?bEhOQVFpYTdiU2dSbU1FN2s3YldablNLNnBsbFpYSkVwYWJEeTBPbitidFZM?=
 =?utf-8?B?cDZuOGJyd3ZMNGxYT21vOTZmRDhDTThEb0pUUDJReFdBbzMzeTgwYzdVQm1n?=
 =?utf-8?B?anpNdEJkVXAxWmM4RzBBc2M5ekcxalhYM3BIUnRMcE5iUzRwWDUxaVlVV3Bu?=
 =?utf-8?B?NFpVc3ZCT2hIVkxyN3k4SE8wYTlsOVJxRmQwOFVubDdRcUxicUtEeG4vc1ov?=
 =?utf-8?B?S2Q4c3JyS25jbkxjWXNHSEc2RlY3NDU3NEhXeWJoczBaZjB4MjlMY0tIWGsz?=
 =?utf-8?B?bWJuWnk1ZVkwSnNwVUk5TFk5Y2pqUnU1aXdORmkyV1dZOVRkRWU2aWU4T25X?=
 =?utf-8?B?TWtVOVo3TG5URGtWeWwyR2dEaVBmWlBBeC91ZThVTFhTOWUrRC9MSW0rakR1?=
 =?utf-8?B?QzlFemhqcjVobmtLVXJ0QkVTMll5aG9uNEI3ZHNjMW1OaFNCaStPcjluRUVh?=
 =?utf-8?B?ai9YTDVybUw5WlVGOTVHMlI5TlRVMWlCR2M3YmNjOFVuR1R2bUhiQlQ2bjk4?=
 =?utf-8?B?c0VPTlFseXgvcVNFQkhpQ2RyUVYxTVZOK3BlK04rakJzTGtKZVUvZWJlWkJj?=
 =?utf-8?B?bDNjeWNKMzVWTGVkSXVqNVNuZVRQa3FKL0hYNVpOZjAzUFQrL3dUYUFwSTRN?=
 =?utf-8?B?aXhYWWpTYkVDWW95djBZb2JZVVZLeFdqQXQyK2dkazRPMmpDeGc5bkRBeTYy?=
 =?utf-8?B?RmNKa3I1YVZaZ3c3eW5VeG5COU9iYUIvY0Q1WWhFQWFCcUxpNXlWRStwQTZM?=
 =?utf-8?B?TFBLOCtVNHZnMTJnd0xlVFdZZFhkOGFOVk90T3RmVklzejNLMG1lZjhlWXBj?=
 =?utf-8?B?bkNmVm9QbGFLdVZZUkhyWGI0blFncUd6Vy8wbDBYTUZUdDgxWGF2QnhNZmtz?=
 =?utf-8?B?V05JOGJuamJTMit0d0gyTEpBajRqYzNlVEg1VWdaWld6SmduMGw4T3ZsZGJJ?=
 =?utf-8?Q?96V1VohJLi7tkF6UH/AP7V5lW?=
X-OriginatorOrg: lineo.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 719bf4aa-3509-4fba-8079-08db8e7aa0c0
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3769.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2023 08:22:33.8293
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 850e1ad4-d43d-42a8-82ab-c68675f36887
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OWJJNuiTjcnxXLg5ppx/I8QC267ZutOoXKLZthPYt31ydPWcbwKdzMbzZsINEoPZ8hUUXzYN/Is7ijJzRTFftg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9673
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 08:22:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184919

Hi Steve,

Sorry for rushing you.
If the patch obviously needs to be backported to stable branch, could I post
a backport request email right away? This issue is not listed in bugzilla, so
I was worried that the patch might have been missed.


Regards,

Yuta Hayama

On 2023/07/27 17:19, Yuta Hayama via lists.openembedded.org wrote:
> If the instance name indicated by %i begins with a number, the meaning of the
> replacement string "\\1{}".format(instance) is ambiguous.
> 
> To indicate group number 1 regardless of the instance name, use "\g<1>".
> 
> (From OE-Core rev: d18b939fb08b37380ce95934da38e6522392621c)
> 
> Signed-off-by: Yuta Hayama <hayama@lineo.co.jp>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-core/systemd/systemd-systemctl/systemctl | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-core/systemd/systemd-systemctl/systemctl b/meta/recipes-core/systemd/systemd-systemctl/systemctl
> index 514f747fe6..7fe751b397 100755
> --- a/meta/recipes-core/systemd/systemd-systemctl/systemctl
> +++ b/meta/recipes-core/systemd/systemd-systemctl/systemctl
> @@ -202,7 +202,7 @@ class SystemdUnit():
>          try:
>              for dependent in config.get('Install', prop):
>                  # expand any %i to instance (ignoring escape sequence %%)
> -                dependent = re.sub("([^%](%%)*)%i", "\\1{}".format(instance), dependent)
> +                dependent = re.sub("([^%](%%)*)%i", "\\g<1>{}".format(instance), dependent)
>                  wants = systemdir / "{}.{}".format(dependent, dirstem) / service
>                  add_link(wants, target)
>  
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#184918): https://lists.openembedded.org/g/openembedded-core/message/184918
> Mute This Topic: https://lists.openembedded.org/mt/100386774/7729851
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [hayama@lineo.co.jp]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

