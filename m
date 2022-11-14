Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01932C433FE
	for <webhook@archiver.kernel.org>; Mon, 14 Nov 2022 13:18:10 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.44])
 by mx.groups.io with SMTP id smtpd.web09.5332.1668431887630957998
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Nov 2022 05:18:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theobroma-systems.com header.s=selector1 header.b=W2hzF253;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.20.44, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TCW4BMHmJ5IIIrpWHqwiWifjoOf93Fy+9chwjShnWzBATjsH68HBRHV5+ZvxVw5jHLNXOudmyPRr7XEb4wTLvGc+j/+E5R/TbXJhcb1shP93pjoEvAWMRgHF/OFCnydrH0oYXhNJMuidloFU1P8Q9jXlOuIUfwTVDDdej6c9+1aez/nFPRYb2UMsozndmV1E4DN5quPLQKCWmvXybHQmpnmLt3HkcJb+1gdO9QuCVX793CWtvvicCWA16Rr+1pTQw1L66PJUpM4HRj75oTgaRQtx4vYxPc6CWxrzSkdPROFSZV0d4Askll0OVnwbKhgdkdC8FBCcJxgT4Cecprd50Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fcXQ2EON89cUxQbfR4z/G0xKSrSS5vw2B5CbEbKrIq4=;
 b=leNpB5L/8bi7R1GK8kroZQy7izYHf5nJ7mw1z5lryhPeXtkroel1K6MhgFlJAA74/zwdyr9kAA/IVGmoC5SmiYhB1pOLcqWfDH3PX5vo0WNZZSI1uKCrbK5UEUsokrRXaNGAMuxF5SC4rbBnFT4sAMx1Hd2ByoWqrREe5JOYplpnN/MZfH3x1IuAwIwcg5uqG8VssOaKmDA1v+zxsjILyX5Ee81F0tK5aL3/tKsBlgRLXQclKYng4n6HxUOAi1kfj8vggvKAku5GoqUjk9K9LAgI46hxsFQJw2S4sl+t97cbl6siPDvnoq88xfcPibu/kTN/KCbS17/8qxLjiwf9wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fcXQ2EON89cUxQbfR4z/G0xKSrSS5vw2B5CbEbKrIq4=;
 b=W2hzF2537TV7dAth4NDx09lNw5RwXL+93wXdYLvbR4PEfxH161ZLl3dudOzkfRmXuWn8s7JPI6jdy7h+c6bkhW2o++ZoSin1huqG1BHiQpIQCQIH+sfjxCzLKA7QdXDjoAxtwMNyFGxjCVMqReCCrTIuM4fwtoxJwe013UMO9GMt39RLp3227zysssdQc2qp0H3zTjAkPVB73hsYatfErtP2VM41179h1FTuuzudj7moLlpXjDMe0QasrvH7AqAovCrbAfwC9IdOX4bxR836OcAzW1S5yBbgfQPw92DItX1jzEkKdaGcHWTb5rAJd/6jZfRGuKzVALVRFMuCO+CQmQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by AS8PR04MB8387.eurprd04.prod.outlook.com (2603:10a6:20b:3f7::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Mon, 14 Nov
 2022 13:18:01 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::9584:94ee:73c6:bed4]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::9584:94ee:73c6:bed4%5]) with mapi id 15.20.5813.017; Mon, 14 Nov 2022
 13:18:01 +0000
Message-ID: <ae0c7dc5-bbd6-5c6a-8783-3cbb38c52cd0@theobroma-systems.com>
Date: Mon, 14 Nov 2022 14:17:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [OE-core] [PATCH] qemurunner.py: support setting slirp host ip
 address
Content-Language: en-US
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: openembedded-core@lists.openembedded.org
References: <20221114101907.626251-1-mikko.rapeli@linaro.org>
 <89da82a5-06f3-312f-cbe0-733974fbe908@theobroma-systems.com>
 <Y3IfkUB9tw2Vni+x@nuoska>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <Y3IfkUB9tw2Vni+x@nuoska>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0057.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::14) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|AS8PR04MB8387:EE_
X-MS-Office365-Filtering-Correlation-Id: 87a22158-ed44-430e-f8b7-08dac642a6ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	eTzEuo9snyi1h36ZRPZRCcdMZRqhSD8eKmtmK51m/RihoTg7xtJDdGcAHgd6vpe/+JJVKbV5M42E7cl1ehJISbrT2Gx0N27xgQQ5UXvbk3OnZW6w/niUHVIitw9tyxz5pFpMBtrULpj/BvtOWEenf8rp7ybQgprDN8KHhmBQaAZd6BOx1r1vIEYokdIzdRPSlTJ2L7jn9izpXP0osABktfqW0PCr/OLog5fg51PsiUZXBisxpwh2jqhqCFec8/kee53K6J41urs11zjD5jA8veXLdk1hGqfy0ktmFvfiaG1KOE0c5gHj6pHevBo5NhWfyTVLlwpcm6cqI7tKIffd+MupMJLWWQUZ0kk+/J0iKiNQra1SKDwoNUSYA3MY3kxC97LxMlqsBdipmLNQ0bqqyl3yUrzjPh3pn7foVluEckAIeL+yMhikVfj+B25Et60dnYJM/+TrNC+1HI/d8n5cPo9eLu+jqj5NnC0uUPyGg4kLALvNZ3AngBHXabtyVmQxTumYnXpwAjZldBefYFCaD2YDEeBsUWiNq+j0iDB6fgQuhrknetPvong/QN0MPd5J53rojZyewVZwLK3t56EGa5vC4ssUQl3oZvaVsQFjeYV7TzlWFCndqLywK+FnE1dJ0HKQKv0TFCtw3dMtFvYxq1ZKzGHhMC+fEsQNRiHYnLsyIfIicMAdXzYFU2sGQjIAuM4kRR1gwI03YnKyNWzCL9qLLBIM2NhMHMkmCzrd62u47EwJQN+X4s5LV8eH8xM/cA1A4UitJCjAwdSH5b4KO9FZuHFe76w0mQYv91TARec=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39850400004)(376002)(396003)(346002)(136003)(366004)(451199015)(38100700002)(2616005)(86362001)(31696002)(6506007)(53546011)(186003)(6666004)(26005)(6512007)(66476007)(66556008)(316002)(6916009)(6486002)(8676002)(478600001)(4326008)(44832011)(41300700001)(2906002)(5660300002)(83380400001)(36756003)(66946007)(8936002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZGx1MHFHaTBqZjU2QTdvLzUyUlZOY2F5eUtsYmpkM1poRndXZDlnNlpsWk9E?=
 =?utf-8?B?R1lRdlhtZVFLNUNPejVmZHM2TW8rWXpWVUZHNnNHSFM2T0ZyR3A3MEhJU3lo?=
 =?utf-8?B?T242blErUmpYSDhIVGFSaHFUNlgzWndQUVFZdTFjL1REenFpRFVOQ3g1YjJJ?=
 =?utf-8?B?ZjhGSmlNSUlFSmpiYkxPdmFNTWFWUWplTEIvdkxGWWhnbGQxcWhaSENKMThx?=
 =?utf-8?B?LzQ0dlp5U3lsdHhQOTNSS0Z2RUhrK2JibTlGdkxDTUQyMlRybE12TjltUGF0?=
 =?utf-8?B?UFBja0IyaWNpMStlOUtSZlVCS094TW1wS3RiRHEvYno5WDYxTzNkTnRqMk45?=
 =?utf-8?B?Y1doOC82dWRjbXllUTgwT3l5d1JsTGtYYkFwYXc5MktmL3ZUdEhLYUVFNlFa?=
 =?utf-8?B?N2d6WWlqTUVyUWF0NzU4V1h6alVFazNIQTRUOUs4N1hvcWk4VUVjdGE4OVA1?=
 =?utf-8?B?amdFV0hSQzRvSEo3UW1TMVlZOEo2bG9BU2ZxcTd5bDJUMWt2UFdtL245NXY4?=
 =?utf-8?B?NVFUU2VJNWs3dDNXaFRIalh4YlFYbVdJRG1lc2tJaTMrbFdFOUQ0WWlzM05T?=
 =?utf-8?B?M2QwY3JyMWRES1hXaEZGaTFLSm50VllFYXp6QTJQd1hCY3FVcWhBWUI0V0Jj?=
 =?utf-8?B?a0RlSzdUUUxGUjNDQkNqMW4rYzdvVGRJaVRIZDhVeFlRWlpWZzNrTWVpOExh?=
 =?utf-8?B?UUFDVmtyY1l6MytabGlBZWJmZlVrTXJxODhDZERGLzAySGhvc2tCRitxWEQ3?=
 =?utf-8?B?aDBzNWxnU2N4ZjNUOC9UT3MyNy8zOTJVTDlOMGJMMlhiQndpN2pEUGFPRWJk?=
 =?utf-8?B?a09EbWhDT0lLMysxeHY1QW1LSlJTU0UxZHNXV2hwblhYNTVCdWg4ZFFVTGNU?=
 =?utf-8?B?ZGllbEJpL3NqWjR2NnVuK2grQ3lOZThwTkVIZUhqTU9ZUTdKbjIrZGFNSHRk?=
 =?utf-8?B?M3RUeU1aSGVHWXI5UjFRdHlWdndXeWdURmN5UC80NnJqTFpaZ2g1WFRvcm8y?=
 =?utf-8?B?SXJMbTRQVWRxTXJFKzFwSkgvYm9QbUljR3lsMkpXODlGdmJIcTBHK3R5ZW9u?=
 =?utf-8?B?bzQ5d3YxVWhFRVVZYlloQ1FqbkIvaW1VTmlHNXNkOEZjNnRSUzhqTzVGRGtj?=
 =?utf-8?B?TWZiak1jN0FVbGlnR0hqM2hjNSt3SEpvY1VvNFpzbzBPdGplU3h1bVZQbjc2?=
 =?utf-8?B?NEEwR1lJZFU2LytmRTkxVUhoa0VlRmIvNERJaTJxMG1ES0tBVWVYUXd4bnBi?=
 =?utf-8?B?Nit0SUFURVBqeEg0VHZDd1RkV2lQTGlvVjBsT1ZENjZTMHA4Z09WZ0RXOEY3?=
 =?utf-8?B?TEUyL0FCckpZK293VFF0VG9LaXFtaVFLOFRnTFc0ci9SN25kVC9YTlJTR3k4?=
 =?utf-8?B?MlhiOHdmUUcvVXRjOUdPV1dlMHNnZ3hnZmVOQmpKZGNHc2xoSk94QkI0Tnl2?=
 =?utf-8?B?bFhFeWp0Z2VnTEtMYTIvdVBZZzVYMEltbHRDRGpMNksxcEdadGJtd0J3QnNo?=
 =?utf-8?B?eTlDOXVzK3ZHaG14RzY0cFVkOFVacGlibVVNMjFGbzBsOFU4VStza1hjSllS?=
 =?utf-8?B?UWROT0Q3V21pUGsrVUs0NUdUcjdWYjNBUXRiUGROQ3hNczViWVRGTHMvMmJn?=
 =?utf-8?B?Nk40eGMzUGdsSGNqaWNmYy9RTFIzU2ttaVJxQkNlZU1NVkZvcmpUU2lQNmtF?=
 =?utf-8?B?LzRVTlYrd1hLbVhNcDBQb0ZHd0NVczBaejRjSFZWVlZDK1pWNkpITWZNVXlX?=
 =?utf-8?B?RTlOeFhMM2JGNTJjTmczc0tmdW5CTDBRRjFUNmJobmVZa3pwbmZaaGZrUVNZ?=
 =?utf-8?B?V3c5Z0pzRXdzU2tIWXBudXNzRzhxUWJpWW5pamkzcFN4QzlaSDJOR25MYWZQ?=
 =?utf-8?B?SHBXSzFqMDhHOTUwNG5HUXJpMmpuNFNJb0UwQ2Q5eGptRUlneEhLWmZDb0s3?=
 =?utf-8?B?aXArc2orRmdpQlBSY1VKQUJZeGlZdklvalhPU1lRVzJiejFHUENKOW9hS2dD?=
 =?utf-8?B?dE81U3JBMU1KVHIzNGtJMjU5QVcrQmJsRjFYYlJYT1NaMEhQaHRNa0d6djMw?=
 =?utf-8?B?c1lJNzZ1Zy9LbXBDanBpZXphMlA4QTlzV0VuWEpjYzMxR3Y1U3lNbkxRNG9s?=
 =?utf-8?B?ZkhLSlU3WWowT05qa0M0OGZFNjQ0TVVSSmZ0SEhxdVU3NEFtZXp0RDNwQUho?=
 =?utf-8?Q?7rFPwyEmSv8XV8SbWcPAsRI=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87a22158-ed44-430e-f8b7-08dac642a6ff
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2022 13:18:01.5323
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pUBzXdd0r1yU13a3rjfD65S/VdCuyf+jMZFoH43SDV7AImt+1dUvULzjtAqULXxdOEsI5YWyFyypQCFb8lj4k7NO+WuW1ywNf/n9oSYMrE96b3a+H04c+GWuhPAqbpOK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8387
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Nov 2022 13:18:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173239

Hi Mikko,

On 11/14/22 11:59, Mikko Rapeli wrote:
> Hi,
> 
> On Mon, Nov 14, 2022 at 11:31:11AM +0100, Quentin Schulz wrote:
>> Hi Mikko,
>>
>> On 11/14/22 11:19, Mikko Rapeli wrote:
>>> By default host side IP address is not set and qemu listens
>>> on all IP addresses on the host machine which is not a good
>>> idea when images have root login enabled without password.
>>> It make sense to listen only on localhost IP address 127.0.0.1 using
>>> config:
>>>
>>> QB_SLIRP_OPT = "-netdev user,id=net0,hostfwd=tcp:127.0.0.1:2222-:22"
>>>
>>> Support detecting port number from this too.
>>>
>>> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
>>> ---
>>>    meta/lib/oeqa/utils/qemurunner.py | 3 ++-
>>>    1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
>>> index e602399232..f175f8a1de 100644
>>> --- a/meta/lib/oeqa/utils/qemurunner.py
>>> +++ b/meta/lib/oeqa/utils/qemurunner.py
>>> @@ -401,7 +401,8 @@ class QemuRunner:
>>>                    cmdline = re_control_char.sub(' ', cmdline)
>>>                try:
>>>                    if self.use_slirp:
>>> -                    tcp_ports = cmdline.split("hostfwd=tcp::")[1]
>>> +                    tcp_ports = cmdline.split("hostfwd=tcp:")[1]
>>> +                    tcp_ports = tcp_ports.split(":")[1]
>>>                        host_port = tcp_ports[:tcp_ports.find('-')]
>>>                        self.ip = "localhost:%s" % host_port
>>
>> But localhost is enforced here?
> 
> Is it really? Where?
> 

I clearly misunderstood the code only glancing at it. QB_SLIRP_OPT will 
be passed to QEMU before that, and then we read the kernel cli from QEMU 
PID to print something nice.

Therefore, the printed message will always mention localhost:<host_port> 
as being the "Target IP" (see a few lines below in the code), which, if 
I'm not mistaken, might be incorrect depending on what you pick in the 
hostaddr field, but that's another topic.

> With default "-netdev user,id=net0,hostfwd=tcp::2222-:22" I am able
> to login using all local IP addresses:
> 
> $ nc 192.168.1.103 2222
> SSH-2.0-OpenSSH_8.9
> ^C
> 
> $ nc -v -v -v 127.0.0.1 2222
> Connection to 127.0.0.1 2222 port [tcp/*] succeeded!
> SSH-2.0-OpenSSH_8.9
> ^C
> 
> The open port 2222 show on the build machine with:
> 
> $ lsof -i|grep qemu | grep 2222
> qemu-syst  170445 builder   12u  IPv4 45057952      0t0  TCP *:2222 (LISTEN)
> 
> By using "hostfwd=tcp:127.0.0.1:2222-:22" this reduces to the more safe:
> 
> $ lsof -i|grep qemu
> qemu-syst  127592 builder   12u  IPv4 44993375      0t0  TCP localhost:2222 (LISTEN)
> 
> I don't dare to make that the new default so just enabling
> runqemu to work when user configures the host IP address like this.
> 

Maybe we could make it the default if it's more secure but that would be 
a different commit anyways :)

>> This patch basically allows to pass
>> hostfwd=tcp:127.0.0.1:2222-:22
>> instead of
>> hostfwd=tcp::2222-:22
>> but with the exact same result (which is, localhost:2222 will be used?)
> 
> Nope, now the other non-local IP addresses are not open for the port
> 2222 on the machine running qemu. The localhost:2222 works in both
> cases.
> 
>> Also, this could be migrated to using re instead of doing manual lookups.
> 
> Yes, but re is more resource consuming.
> 
>> I'm not sure the commit log matches what the commit is actually doing?
> 
> How could I improve that? If I manually start the qemu machine with
> hostfwd=tcp:127.0.0.1:2222-:22 the machine works but with runqemu it
> fails due to a confusing error about detecting IP address. I could add that
> if it helps. With this patch runqemu doesn't care how the IP address
> is configured when looking for the port number, and also doesn't fail
> when it's set.
> 

Yes that was exactly what was missing for me to understand this patch. I 
thought the code section I was looking at was the one handling your 
parameters, and there you can see that the hostaddr isn't actually being 
read, directly assumed to be localhost, hence my confusion.

The issue is not that it's not possible, since QEMU actually supports 
that, like you rightfully mentioned. It's that our code parsing this 
QEMU kernel cli argument fails.

I think the important part here is something like:
"""
hostfwd QEMU option in QB_SLIRP_OPT currently only supports *not* 
passing any hostaddr, otherwise failing to parse the option and thus 
fails runqemu.

While the default is to not pass any hostaddr, binding all interfaces on 
the host, it is not secure so it should be allowed to pass a hostaddr in 
hostfwd via QB_SLIRP_OPT QEMU option. e.g. QB_SLIRP_OPT = "-netdev 
user,id=net0,hostfwd=tcp:127.0.0.1:2222-:22" to bind to the loopback 
interface only.
"""

but this is just how *I* would have written it and I guess there will 
always be someone for whom a git commit log won't make much sense on 
first read.

I realize this is because I didn't take the time to understand the code 
properly, sorry to have voiced my doubts on this without properly 
checking first.

That being said, it does what it says it does, so:
Reviewed-by: Quentin Schulz <foss+yocto@0leil.net>

Thanks,
Quentin

