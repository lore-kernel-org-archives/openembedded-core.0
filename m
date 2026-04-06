Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2AE6F46C6D
	for <webhook@archiver.kernel.org>; Mon,  6 Apr 2026 18:16:33 +0000 (UTC)
Received: from SJ2PR03CU001.outbound.protection.outlook.com (SJ2PR03CU001.outbound.protection.outlook.com [52.101.43.19])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.61537.1775499385693562788
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Apr 2026 11:16:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=XcvWn+Tg;
 spf=pass (domain: ti.com, ip: 52.101.43.19, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oehW4F4wYbN8fqNvH5MYkpg7sUEHAwi5ZyP/ENw6FDIbPgsu7dlZKwDabAbCO+Lcafn9AveRaMcv78Pmb8Rdo9LvHPb0481NFMgljbsOOAc5WmBlwjmcjv5XBoN3Rkpy3D/P5tV7Etp/sC47JDOqbafMVxsPyRv8b+0hKDJpi51iY2AXtfyhunf62HrePmyJkTL1uScKxcI02gAf45M9FempbH9bKR5b5ZxoEGpzQwwqID/HW6WDXQ7FrSDzJ0UnibX7yqbfZlJ2EnTGE97BBOyg5VumZ2vM3ujrnGYaTl578WaNQk8qcs/4oBPNIne6TIRV/aEHVz8hqMaE6RrZ9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kKbTNBmXG6cuVGexILpO5pdL49c18auqudnYbARehxs=;
 b=HsswDJ8AszSZ3GUdHC4UY2R6KLGoV44TwKAxibRsTW7pCsbWZJ6bPI1g6pGB011jqa5aysE7CG0wjZ3oUrQh1c5MoNJj9NVbHCrJiUCxOfN6DcYU3xFFPkqPO7zSnBy9NpcrLqt7lwQM1iESss3jZp3TqLi+nXVuOowi9LSQ2L7No6SVG8bM4r0nWN6D3EBE8AnjvI8Nx2+D9xp2PPNzsyRk35a2hjF3assbSViRMFJAKz2BErbKQS9c4jRwSFaSlNrvtnGuNF3GJ35f6F1OkbTGjPJXYPbrrId0Si6XhRpZXkZFSM9ZW7kM3Z8J4AqKsuWmxV6z3/996Wdco8KV8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kKbTNBmXG6cuVGexILpO5pdL49c18auqudnYbARehxs=;
 b=XcvWn+TgpxLEqst8e0o0eeayXE5Fg+cEXUwgUV/IRRbXqOXB/SdQiZ8LFq0AGzaHUVczWeTdGHPSK0FW3AGbRMaSzZvk7YNSTVmGyssvcZr28RUFXp13k/OwDl6nVT+TDossjT0ZjuDWSJlVkDIqkfZVyNuty/S/my85Ji7Ty1A=
Received: from SN7PR04CA0035.namprd04.prod.outlook.com (2603:10b6:806:120::10)
 by SJ5PPF5B5767B72.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::7a1) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Mon, 6 Apr
 2026 18:16:22 +0000
Received: from SN1PEPF0002636E.namprd02.prod.outlook.com
 (2603:10b6:806:120:cafe::8e) by SN7PR04CA0035.outlook.office365.com
 (2603:10b6:806:120::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.32 via Frontend Transport; Mon,
 6 Apr 2026 18:16:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SN1PEPF0002636E.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Mon, 6 Apr 2026 18:16:21 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 6 Apr
 2026 13:16:21 -0500
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 6 Apr
 2026 13:16:20 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 6 Apr 2026 13:16:20 -0500
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.39])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 636IGK0N1147515;
	Mon, 6 Apr 2026 13:16:20 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 6 Apr 2026 13:16:20 -0500
Message-ID: <DHMA039JNJHX.324FM54AIQAK5@ti.com>
CC: Randolph Sapp <rs@ti.com>, <raj.khem@gmail.com>,
	<mathieu.dubois-briand@bootlin.com>, <alex@linutronix.de>,
	<otavio@ossystems.com.br>, <kexin.hao@windriver.com>, <paul@pbarker.dev>,
	Ross Burton <ross.burton@arm.com>, <afd@ti.com>, <detheridge@ti.com>,
	<denis@denix.org>, <reatmon@ti.com>,
	<openembedded-core@lists.openembedded.org>, <vijayp@ti.com>
Subject: Re: [oe-core][PATCHv16 0/6] Display manager proposal for x11 and
 wayland
From: Randolph Sapp <rs@ti.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<otavio.salvador@ossystems.com.br>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <18982E1417FE35B6.1454197@lists.openembedded.org>
 <189D6251D8E3EDE7.1508127@lists.openembedded.org>
 <DHCXIN4V1F1Q.1RY9TMY14L13Z@ti.com>
 <ac09456378ad61595fa49feec71180919c7e4384.camel@linuxfoundation.org>
 <CAP9ODKqBUwtmzYLesb1X4s=LyGzzfAXfKOTDShW-XFc0aoDcRw@mail.gmail.com>
 <a1c78194197bd255fb88a01c8d8dca4651240ebd.camel@linuxfoundation.org>
In-Reply-To: <a1c78194197bd255fb88a01c8d8dca4651240ebd.camel@linuxfoundation.org>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636E:EE_|SJ5PPF5B5767B72:EE_
X-MS-Office365-Filtering-Correlation-Id: a9f5994b-d820-4f35-e77f-08de94089b3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|376014|7416014|56012099003|18002099003|22082099003|3613699012;
X-Microsoft-Antispam-Message-Info: 
	LbWImdNUm4FVFCi3pI2DI/CKrQyHnDpI5Zpsoj2IXEuQm9wUe60G9rfZNmaqbN4a0hbsRhiczE8s1+kPIhpfIrl78TYCNmCtmJ4ioyu/1HdUn1Ylsnlfiw+yINcazv9R5EyBx/fm4pjli/3lm65TiXunU6UIK5yxgRLUScg36UszXXN+KWi5m/ulqn7d6mc3o52hdNPK3aCBJXy6Yqd4bsMfVOCfulC0oIxx9T2MFhW8t08EN+jfbwkik3J4FddnogiL4cpyqHppdLt8vrk7aHRivK4RMyDr5ovPmO7w7YMe+bt83jK2N20112M5bLgkG/HfOeHh6WyU9cE8jCI6Mw/g1YGfKKw+QAEX9mv4FOVoEgFaFlGpBI1zkqqpBfHVa3riNQ6FYEUiMJV9wRU+iJYNGitMyJ3i4sjvuWVOkhl1oLV9Tnq0MsTeo3ACN2CflbzbA/28zuR2dLUKPTeATWlY+xBO+R37UCpmu8xQh10/oqCssq6XjXyxI4FDbDJlbveRs7gFpVl8Q17eJ6bRBts7jbj5yv6L9EFbAZa3Jk38jU24ioCxlWiCqZyksL6TalNN0pL4Nb1GNJYYoVubdbn4KqI/dzIQUdNGVc4RpFRWjEdIowAnewptLNOMnRa+tWBCXX6gZdeb9T5hoEGtUTHJsXw+86Qs0JE8uWIh5C2JlUmw78XJa/97V5dkJGf3ipobXhSbOQ4g7F11Eua0syM3WRKdN5zeTZmxRGWsMIwYVd1UJkl8dnnJfcsJeYEWkw3ocx88aAdnwL/K3nRzL46zy4151tW3swxGZ/X+95jQ/EHEHb9l5OlZWv7kyvtYv48jd160bfvMvZsTxi5P5A==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(376014)(7416014)(56012099003)(18002099003)(22082099003)(3613699012);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	0XUd72QZHUq8vP9CYctMJ9KtuN8R3/TysrunXO1lMr0DJFr8oMb2SLbJy77do3qh1XOFK7DKr1ne7zbIKp0z9eWcoBTyKenhxGv4pUtQTlbMrv5h/03zarmqHiNMwUWnFRflT8QqKRkmunz1oWzw71xNZ0AZOJhwU1fTpJA6lfKFjsC0jXhrErzvKmvXHbdUcGEnRb7nYUg1pjBPO3hEvwTu6gSCsFW9cPcq8Gg+vdug8lgtveHIVf9/Ihmw5PYKe0z2ba8nNrJw7qm4aAOSPYe85zbK6ntGrStzDHt5Ds2M61rNrcxQc14CleQASU68C2DULedBVAaQhb+LtdsrocYCF44vyH3HYmRMMuASyDH2i6PIpvPNixiKCmNW2zLBr54tu7xsTvWbOSfEPaeR76dCsWDDU2iDQfMGB0oiNKpRwjkU1RDm20/25XR7GzbA
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2026 18:16:21.7400
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a9f5994b-d820-4f35-e77f-08de94089b3a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF0002636E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF5B5767B72
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Apr 2026 18:16:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234686

On Sun Mar 29, 2026 at 4:06 AM CDT, Richard Purdie wrote:
> Hi Otavio,
>
> On Fri, 2026-03-27 at 19:38 -0300, Otavio Salvador via lists.openembedded=
.org wrote:
>> Em sex., 27 de mar. de 2026 =C3=A0s 14:09, Richard Purdie via
>> lists.openembedded.org
>> <richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> escreveu:
>> >=20
>> > On Thu, 2026-03-26 at 13:35 -0500, Randolph Sapp wrote:
>> > > On Mon Mar 16, 2026 at 12:25 PM CDT, Randolph Sapp via lists.openemb=
edded.org wrote:
>> > > > On Fri Feb 27, 2026 at 12:31 PM CST, Randolph Sapp via lists.opene=
mbedded.org wrote:
>> > > > > From: Randolph Sapp <rs@ti.com>
>> > > > >=20
>> > > > > No functional changes. Just bumping PR to help with automated
>> > > >=20
>> > > > Hey Paul, have you gotten a chance to review this series yet? I've=
 been told you may have some comments.
>> > > >=20
>> > > > Randolph
>> > >=20
>> > > Has anyone gotten a chance to review this yet?
>> >=20
>> > Paul and Ross have some thoughts but we're basically still drowning in
>> > the backlog of patch review. We're all frustrated about that. This one
>> > is more Ross' area of expertise than mine so I'm waiting on that.I'm
>> > replying since I do feel bad we've not got to this yet.
>> >=20
>> > I wish it were different, I'm doing what I can with various patches bu=
t
>> > I'm also behind on review for several.
>> >=20
>> > The challenge with this patchset is it is a fairly invasive change, it
>> > does inject a go dependency into a core part of our graphics stack and
>> > as such, I think we're all quite nervous about it. It has taken a lot
>> > of back and forth to pass the autobuilder's tests and that in itself i=
s
>> > a bit of a worry.
>>=20
>> I understand the concern =E2=80=94 this is an invasive change and cautio=
n is
>> warranted for something that touches such a core part of the graphics
>> stack.
>>=20
>> That said, I think it's worth recognizing that Randolph has been
>> exceptionally persistent and responsive throughout this process. We're
>> at v16 now, and every issue that has come up =E2=80=94 from cgo
>> reproducibility to busybox-init support to autobuilder failures =E2=80=
=94 has
>> been addressed. That level of commitment to getting it right speaks
>> well for the long-term maintainability of this work.
>
> I realise and fully recognise Randoplh has been really patient and
> persistent, yes. I can only apologise for the length of time this is
> taking, I do feel really bad about it.
>
> I've been talking about one of the issues here in meetings recently,
> specifically that patches passing on the autobuilder doesn't mean the
> patches are "right", just that they don't regress our automated tests.
> I think we need to make it clearer that we put patches in for testing
> in parallel with other review on the basis it is easier in some ways
> and can highlight issues. It doesn't negate the other half of the
> process. In this case, the patches had a lot of issues there and it
> took a while so there weren't regressions.
>
> You mention the cgo reproducibility issue, I want to be mention there
> are a number of other complaints in my inbox about the changes made
> there, how there are regressions elsewhere caused by those changes. I
> can't really ask anyone else to try and handle that so that just falls
> to me, but it does reduce my bandwidth elsewhere.
>
> Unfortunately the people who need to review and sign off on this have a
> number of other things in their queues. People only have finite time
> and I can't force them to do things. I'd also note that I did ask many
> times in the weekly calls and other project meetings about what should
> block this release and this patchset was not raised. That isn't to say
> it isn't important but there are other pressing issues competing with
> it.
>
>> Regarding the Go dependency: Go support in OE-Core has a long history
>> at this point and is well-maintained. I don't think introducing it as
>> a dependency in the graphics stack is as risky as it might seem at
>> first glance =E2=80=94 we're not pulling in something experimental.
>>=20
>> The problems this series solves are real. The race conditions with
>> weston-init and DRM device registration, the scripting sprawl around
>> xserver-nodm-init =E2=80=94 these are pain points that affect downstream
>> users. emptty offers a clean, unified solution for both X11 and
>> Wayland sessions.
>
> Whilst it does solve a real world problem, that doesn't mean it should
> go in without the right level of review and wider community buy-in. We
> don't have that yet. There is also significant risk to changing a key
> runtime component like that this close to release. Build components
> aren't so bad as we have better testing, runtime is hard. The rpm 6
> patchset is in a similar position - too risky for the release now.
>
>> In my opinion, this patchset should go in.
>
> Noted, thanks. I appreciate the review of it.
>
> Cheers,
>
> Richard

Please let me know when you all have the time to review this series and I'l=
l
resubmit it accordingly. I figure this is the sort of change that should go=
 into
a major version bump as there are subtle differences downstream layers may =
need
to take into account if they were modifying these session managers or their
startup scripts.

At this point though, these patches no longer cleanly apply.

