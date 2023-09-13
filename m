Return-Path: <alex.stewart@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C75FCA5538
	for <webhook@archiver.kernel.org>; Wed, 13 Sep 2023 16:00:20 +0000 (UTC)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.101])
 by mx.groups.io with SMTP id smtpd.web11.503.1694620815129339715
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Sep 2023 09:00:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ni.com header.s=selector1 header.b=fjTX+YsI;
 spf=pass (domain: ni.com, ip: 40.107.92.101, mailfrom: alex.stewart@ni.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H0JlO02tYUryWvWag917T4wVcLk8Un/cwMrqwJzWU+5fjgore+rbz+6c4G1zVd21dWUMMku/jdrfQZZ6E6d2NiGRUZlIRkHT4j/Vqx2aQ0bJdlmKNbTZFBaNzAFeeXnYbB+mUBpDM8LRow2/wAKcxn9XagQILTcaMzp9uLS7ut33eMOtduwuLRndrYyRwkS8CUjCisCADFgXx/3yTP3aly7EQbnQpXMkDIbHY7g1TY02YyHqMYVaLBO8n+JfLwSVmvvqyIlEvFIhDgymt0ih6x1tBOJw5WtwXHdZxuwEMfpNHXK8GVNWEZ3ClgXDLPdh5vvZJDfEKI2xUGCyFAaXgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=APDJ7GZeX47ZfZlLBPlqZFJ7vXVdeLG1EtFE31r9RMw=;
 b=Wpz1ZYvcJvUdLUTSfDfVZslHKdxzdXgZnOz7w+XMLP0/MVhcpO16mWIHKL5TxQHh14QE4EOVpmXcBrKnCwuNiTmY6sMyvucd5iAq44TxI2AMwvQhrHJX4NE1dCfZ8zITnHzMizJwWxMI9BYU9TY542HQZyX4Wd4Ce7qJRZDPZhpDPnQizWpgwL4iku8ICUAGf0OL9QvMg9MPfmWBANBPd3P4UzJViA7TI0I7YWEBYGNFagNIzr+7NX3w5o41ElqtSbFiuxcKid308BV62qMUGixqh+vPqO6xrhwW50McFyKiUvLWJFKiuQX61fIGDyncn8wWhi7CngIXQh+Adg1iQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=APDJ7GZeX47ZfZlLBPlqZFJ7vXVdeLG1EtFE31r9RMw=;
 b=fjTX+YsICQ4LFMjRpUs/gGKj8nSh/oinXYibdP6dMnjhZ1PLe38f8L+gesPsDZfftsX3Fhlfoi7mSpdwJZs0kfXIfT3WK01rPqGvaj633X2HOO1o3tmN06S8DqjGsjNKvO0gFuzGQEdgZG9/yLhNG0URS1qGGX2k16jvhrTY6Xk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ni.com;
Received: from SN6PR04MB5151.namprd04.prod.outlook.com (2603:10b6:805:90::25)
 by PH7PR04MB8482.namprd04.prod.outlook.com (2603:10b6:510:2bd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.10; Wed, 13 Sep
 2023 16:00:08 +0000
Received: from SN6PR04MB5151.namprd04.prod.outlook.com
 ([fe80::988f:efe8:8e8c:845a]) by SN6PR04MB5151.namprd04.prod.outlook.com
 ([fe80::988f:efe8:8e8c:845a%2]) with mapi id 15.20.6792.019; Wed, 13 Sep 2023
 16:00:08 +0000
Message-ID: <a7bd9391-7800-4de8-82c7-62ae708a5f0c@ni.com>
Date: Wed, 13 Sep 2023 12:00:01 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [Openembedded-architecture] Security processes: YP needs
Content-Language: en-US
References: <CAApg2=SqAzD9zCnAGB+mtZoTnMCzcnocarpTSCQ0weH15j8KhQ@mail.gmail.com>
From: Alex Stewart <alex.stewart@ni.com>
Organization: National Instruments Corp.
To: rybczynska@gmail.com
Cc: OE-core <openembedded-core@lists.openembedded.org>,
 openembedded-architecture@lists.openembedded.org,
 yocto@lists.yoctoproject.org, yocto-security@lists.yoctoproject.org
In-Reply-To: <CAApg2=SqAzD9zCnAGB+mtZoTnMCzcnocarpTSCQ0weH15j8KhQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1P222CA0098.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:35e::8) To SN6PR04MB5151.namprd04.prod.outlook.com
 (2603:10b6:805:90::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR04MB5151:EE_|PH7PR04MB8482:EE_
X-MS-Office365-Filtering-Correlation-Id: e6ba7267-7537-48a3-35f7-08dbb47280c5
x-ni-monitor: EOP Exclude NI Domains ETR True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	iXUv/WYLeANPwS4JAu+ERulhpJIvETUXI9ssY9f4aocsRzZxoYtkwg7DJDNB5boq3j7fNH3buanrkuFuQRa0eKd67omJQD1fqH7Mqaakm7AYyvBux9to6NDZ262guRz/MFyQIVC5N3GGQv1M4mfIlLIMdssgGz//ZTvgGprYF9C88wAlVtgt/v8FOLCq+Z6XubzXtYXMFxtrvu6yO/kjwLA1Qy4qRlsLmKHWpLCo4GfW2ULrr5NkMIXoGbtSX9mevNAKRyX7vWiDlMxYc7JxLLSzt19iDGzoPCxnqsgjNlWFAzd4GHodpJI++WEzmglrjaBw3YhWNkws8OHv5Cw1xvs0C1CGlZCFuIQYyTN7JAGMPK6W2u0mm9kY+L0BrwBUNDElKauYlIxVdOVcMydgHTn7oBJyTq9MAx5RGdf1ahiOvCIm/pft7kkZpKHiLgQnfPiObovN+CI8zROLoGNRj9H5uGHMr7TPCfeA9VxkPUTlZ3EU+b9rFrjOSZG/Tj4HmXJYuO6HykwnlM7xpSePRg6pJB209WNhoHL9Yf/CBXU6RNRlvEYOf6niH/YyYqH7++Ty053aTUgO2YQxZZ5gzbvgfOonpKB9Gp/LotQOzy3MZZtSWIdFPpYpBIzH6o8UJBTdorS3idmUPZaE8PXgMw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR04MB5151.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(396003)(366004)(39860400002)(136003)(451199024)(186009)(1800799009)(5660300002)(31686004)(66899024)(6506007)(6512007)(6666004)(53546011)(2906002)(6486002)(36916002)(31696002)(36756003)(86362001)(2616005)(38100700002)(15650500001)(66574015)(55236004)(26005)(478600001)(966005)(83380400001)(66476007)(66946007)(44832011)(4326008)(8676002)(8936002)(66556008)(41300700001)(6916009)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SmF1elg0MHdUUFdyREd5cXNqZ1FiRHZ0TFgyeXRsYkJoQUFrRjcvajhTb2F4?=
 =?utf-8?B?NHJqeEdCUGtHZTlOMDR1andZS2ZUK0JNbTZnSHlON3BxUDdReTNsazIzMjhu?=
 =?utf-8?B?TlczYVRyMlhDbTYrd0NHNTFuMmovRUtJdm5NeFZkdUhLb3dlRHJoT1RUQlJz?=
 =?utf-8?B?T25kYkZHcUJLcFV2ekhBblJORXlKMm5CZm5lNmVUUWpVaW91YkdvcUlmd3Uz?=
 =?utf-8?B?aHFWSHU2WDJpNGxOZ0pnc0VsNktoWHV5L0VlWk9vV2UzTTk4MjdDWWNHY0VF?=
 =?utf-8?B?TzJOM25ySEZtcFlNTkpsVmF5ZzhUT2JRbHh6alAxTlQxQlpYOCtRNytDUHJU?=
 =?utf-8?B?WFN1dW5UaVpsbnlyTHgvN1RMcHhBWnVGL1kwNXE2SVcxY1JuR3pveHFQYVhm?=
 =?utf-8?B?UmpmdkxMZ1NlL1lyMVBwa0FvZ09SZWFMRWRUTHlvTkp2MGNXU1daYTZrRmpR?=
 =?utf-8?B?TjArV0NmQ1dCRllQeHZ4R3NaaU1NREhRVElKaE5GaUZrdmFER1B0YXVjclht?=
 =?utf-8?B?ejF3UjV0clFYK2x3aS9EaEttVEFORDdSWkJDYy81TlVsZDBySFhMYnAyRmQw?=
 =?utf-8?B?aTAzOWxPVDBJS3NnSDZ2aWc3dTBIMzFaeWhsekhtVmliVTNCWWcrRTFMdzFu?=
 =?utf-8?B?U1VOWkN0dWppMjV4a01FVXRGd2Q3Q2tnUlAyRENNYkVneDNpR3VMOTFHQlQz?=
 =?utf-8?B?OENHZXFodVlycy8rcVlWRzJqQmJCaDNTc2EyTHBjMU9MMzdiQTJ6eUc2cU5o?=
 =?utf-8?B?SjlCWkluU1dISUxQakg2UVlMVUt4WU44bHpueGlhRzM2bVlVUmhHU0xWR0l4?=
 =?utf-8?B?QU1tanpxaFUzTklNVVNnMG5ROE1sbU9Xdm1qVEJnRjh5VmZsUzFlRm5ob2RE?=
 =?utf-8?B?aVh6YlZhNklRV1ZlK0EwS0lMd25CRE5CalV2SWREak8wa1NxODVsSmVOUTBD?=
 =?utf-8?B?aS95dkdQcVFDYWtzYVZBU0huZjZnOUZVUHhmSWNSZ3hZc1ZYVTJJT0Q1VXFC?=
 =?utf-8?B?QUUvNVVHYkhNN082eE5YRExSbHZ2aVl2QXEzNlJuL2p2UXR6QzNnUXpDd1ZF?=
 =?utf-8?B?WVUrK3paUzEyRmlhVXlNOExGU1czVFZWVmxLZjZOOTNTb05FdmE2QzVocllD?=
 =?utf-8?B?VEhOYmkrWDJzU0VBc3l2MEIvZFhNTitEdkZlK1dMYUtUdFovTTFlSmlFQzJh?=
 =?utf-8?B?QWVNdVVNNitsN2FxbHk3a3Y1RzJ5UHJvVkJQdXNmUU11L2hFWmpXTXVyWElm?=
 =?utf-8?B?NlJTVVBzWEVHU0V0N1k0aXppakNEaTBDZmlPbjNkKzN3ZXpZQVh2SkNyajZY?=
 =?utf-8?B?ZFFZWnB2WExUUGoyMDhRS1VoS1FDYkpKSFRmbmlKOFRJSUlOQWowZ2o5eEhX?=
 =?utf-8?B?SUQxUHdaN3ZGZ0NHQ3Zoc0JobUFVTXl2NEt4OTJURFJxTHFrZGE5RjBad3gy?=
 =?utf-8?B?K2l3Y3Y3UnV6NlZPTnQyNzNKbDNabHU2UkV4UGJyOG5wSkloMTB1bzFZMnVj?=
 =?utf-8?B?SFRpUytHWnNYNWd4ZEZIRmtUNUR1VEdkUlRCQ0svR3VJc3ZBSXc2ODFXbCs4?=
 =?utf-8?B?ZFNsYzBUODlaNitwbUtzWXZFRE9GVHdpS0tQbXZ0VDdUNDNLR200QTJsNGFT?=
 =?utf-8?B?TXRyamtUcEc3ZGM4aDNuZ1lTWExoSCtvSmtFQ3pHV3RkT2ExbTRScVZwc2Fz?=
 =?utf-8?B?L2NtR0E0ZEZlanZSYi9nMC96Q2t3YjU3OERRT0d6Rm1NWXJmUmR2MVhTdDEv?=
 =?utf-8?B?NURSa2MxOE9aeWZnbmthZVhrV1gweDhud3gra3B0Z0VKWThOQVdZN243dDNh?=
 =?utf-8?B?TGo2RGYxLzJBZG5aVnJCZFFzQmpCZmNaU1ZiaTc1S0ZSSDZ1blNpQ3dlcy9q?=
 =?utf-8?B?NE5YY04rNjNaeS81ZjMvbmw2M1dvN1hzY2JpNis1VUVxdlJpZUdGbGtEOEVF?=
 =?utf-8?B?OEx4bDRvQW9LMmU2eHRkNHlNRW5YNmw1TkFyalQ4dGdwS3k2RTlPUzVoNS9o?=
 =?utf-8?B?N2FtU3ZGRURiRTJtdXBmV05CVGU1UnhSWGtmeWtza3BTQlBLOE5qOGZqY3BY?=
 =?utf-8?B?WXRqblBuRlRKOHhLckx3NDVSMmc5OHhTcnJsV09ubGlxaVdYbU9yUU1yaFhv?=
 =?utf-8?Q?tyJyOqlzScasCd/DCgVhPaO/V?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6ba7267-7537-48a3-35f7-08dbb47280c5
X-MS-Exchange-CrossTenant-AuthSource: SN6PR04MB5151.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2023 16:00:08.3741
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3vowH/vjUdtU81q348UfDjbMGamBfl6Gya23jRDgxPeN+DzsDpfw3ejIBOJOx6AOwRLfL2ks1LwKA47WHUtA4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR04MB8482
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 16:00:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187610

Thanks for driving this Marta. Internally and externally, it feels like 
we're just on the cusp of everyone *suddenly caring* about our security 
response strategy. So it's good to see that we're making moves in that 
direction.

In general, this list looks complete to me. I'm primarily interested in 
the response coordination, triage, and tracking usecases. Those are the 
biggest pain points for my team, at the moment. And that is primarily 
driven by a lack of tooling.

More responses inline.

On 9/13/23 07:52, Marta Rybczynska via lists.openembedded.org wrote:
> [You don't often get email from rybczynska=gmail.com@lists.openembedded.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> Hello,
> I've been working recently on collecting what works and what doesn't
> in YP security processes. The goal is to go forward and define an
> actionable strategy!
>
> Today, I'd like to share with you the summary of what I have heard as
> needs from several people (those in Cc:).
>
> I want the community to comment and tell us what you find important
> and what you'd like to see added or changed from this list.
>
> * CVEs: Visibility if YP is vulnerable or not
>
> People want to be able to check/look up a specific CVE; it might be a
> CVE unrelated to YP
> (eg. package not included, Windows issue). The cve-checker result is a
> part of the solution, but people also want to know which CVEs do not
> apply.

I'm not sure I understand this usecase. Is there a reason those people 
can't/won't just lookup the CVE on the NIST site?

> * CVEs: synchronization of the work on fixes
>
> Currently, there is no synchronization; multiple parties might be
> working on the same fix while nobody is working on another. There
> might be duplication of work.
> Ross has https://wiki.yoctoproject.org/wiki/CVE_Status

Has there been any discussion of adopting the OpenVEX document standard 
that the Chainguard guys are putting together? [1] It seems like the VEX 
use-cases align well with our needs around tracking and coordinating CVE 
response between YP member and individual developers.

I've been considering it for my internal use for a while. And also 
considering replacing the existing cve_check output JSON with OpenVEX, 
once it has stabilized.

[1] https://github.com/openvex/spec

> * Triaging of security issues
>
> Related to CVE fixes and includes issues reported directly to the YP.
> Some issues are more likely to be serious for embedded products
> (attack by network), so not all has the same priority.

I'll note here that some of us are sinners and do actually support 
network-attached (and internet-attached) embedded devices. :)

But the greater point of OS vendors being able to triage and assign 
vendor-specific severities to incoming issues is absolutely important to 
my use-cases.

> * Private security communication
>
> A way to send a notification of a non-public security issue. For
> researchers, other projects etc.
> The security alias exists, but only some people know about its existence.
>
> * Visibility of the security work of the YP
>
> There is much work on security in the YP, but it lacks visibility.

Is there a common nexus for this work? eg. do most of the folks who are 
doing security work tend to congregate on the security sublist?

> * Documentation
>
> Related to visibility. We need easy-to-find documentation of subjects
> like submitting a CVE fix,
> reporting a private issue, and how our processes work... This
> documentation should address people who are not regular contributors.

Very important.

> * Additional tooling
>
> We could add additional tooling: a template on how to add cve-check to
> the CI (possibly
> a different one than the autobuilder), analyze the result, and extend
> our tooling to their layers...
> It is also related to the "Architecture" topic below.

Can you expand on what you mean here? Is this usecase about extending 
the existing tooling into the generic CI processes that YP members are 
using, or about expanding the tooling in the YP's indigenous CI?

> * Architecture work
>
> Security if more than CVE fixes. We also have what is happening in
> meta-security: hardening, compiler option,
> secure package configuration, use of code coverage tools, and so on
>
> * SRTool
>
> We might decide to use it again. It allows one to do much but requires
> constant commitment.

I think I passed over the wiki pages and presentations for SRTool once, 
a while ago. But I didn't pay much attention at the time because it 
wasn't clear *what it did*.

After reviewing it again, I think it might be the kind of tooling I've 
been searching for to help my team coordinate our CVE response work. 
I'll test it out and see if it is something I can use/contribute towards.

> * Presence on pre-notification lists and receiving information before
> the vulnerability gets public
>
> YP currently depends on public data. Principal distributions receive
> the information before
> a vulnerability becomes public. It requires (in short) private
> reporting, a security team, and a track
> of excellent security record.
>
> * Becoming a CNA (be able to assign CVEs)
>
> Needed if we want to assign CVEs to the software of the YP, like
> autobuilder, Toaster etc.

I'm also interested in this, as the maintainer of our opkg fork. So far, 
I haven't had to respond to a CVE against the project, but that won't 
last forever.

>
> Kind regards,
> Marta
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#1747): https://lists.openembedded.org/g/openembedded-architecture/message/1747
> Mute This Topic: https://lists.openembedded.org/mt/101334933/3616788
> Group Owner: openembedded-architecture+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-architecture/unsub [alex.stewart@ni.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

-- 
Alex Stewart
Software Engineer - NI Real-Time OS
NI (National Instruments)

alex.stewart@ni.com


