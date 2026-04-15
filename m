Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C27C2F428C9
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 20:10:31 +0000 (UTC)
Received: from CY3PR05CU001.outbound.protection.outlook.com (CY3PR05CU001.outbound.protection.outlook.com [40.93.201.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4328.1776283821927494371
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 13:10:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=mXY3phHq;
 spf=pass (domain: ti.com, ip: 40.93.201.47, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mlCxhB+QzTCGMaVzwT4/8MJjYFMfe9yvg0ZxiWg4GtamI98DsTV9mwxVN0P2qIQVAU5Sjj0NJio/ONqnW4hCPXmZr426WvQaNMwyllZSMa5TqcG63iQqTu/K1n8FZCDeMfz/WJ0pKeyrTzDldxCY5gQj0SeKc8rT1KNMTXIMXBDC+TZkclcwrH8NBvvjk8JeThJPAOH4aMnSKTrVYeN3zt0WOaSNybyh39Jsz300DSGaqwj+gqC9CU6F1bt28x5C/hdSi9lZMCZRImD1FbSO/9pi6RD+v90nE/leVo8Fr+0q0JYqALZ6m5+Yaoh3kW1wcw5fXv9oVQz2oQKGWzlFjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vHaSjfCkKpwiy3WzTvmVdfaB+p18rO2BjGLowhJsWnI=;
 b=I97jIZnkZrmyymgW4u9QQOuWkTOhSy/PB8aouIi+ONpuKabUauk2A6r6lq7NtmNObc6D73uyw/Sk+7DP1vkvOJCR2Aculr1e2ztQ3dMjswwsrOl5blEEYzroQL8/o4CRwg2zzfgmPq6a9CagmkZkCeqLD04D5TGnDs2dp2++/jLI34EASfLgpEwjj5kGeX8Us4qsoku5x2/kxwAQgf0EoS9MPYjQcPSliXbkl262SDx8iVNh0gOV++vFFDa5rpWKMSYQEyZnOzqpFX0iVAE6L3h1nts6e1H0715b5oVKvWSXMLZyUwKEQOzpFB5PcwWN+OqQw6xV//FpzoCd0qTDng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=navimatix.de smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vHaSjfCkKpwiy3WzTvmVdfaB+p18rO2BjGLowhJsWnI=;
 b=mXY3phHqqPxOA5aaE+t59DI9v00qKroBk6E5KJVDyh4UE7HW51fjdk9c9RVWMkSigf7nvNb9aLQnx6k17uiZEDq0/JpZWBDodvfmQ2acS6NedSG04i/5PLkFQJcILTMOHlqeh6L8HbQrVp1blK4ILXk7ycoxCI6aGSO2c0r9WMg=
Received: from DM6PR02CA0038.namprd02.prod.outlook.com (2603:10b6:5:177::15)
 by PH0PR10MB7061.namprd10.prod.outlook.com (2603:10b6:510:284::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Wed, 15 Apr
 2026 20:10:17 +0000
Received: from DS2PEPF000061C2.namprd02.prod.outlook.com
 (2603:10b6:5:177:cafe::cf) by DM6PR02CA0038.outlook.office365.com
 (2603:10b6:5:177::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.49 via Frontend Transport; Wed,
 15 Apr 2026 20:10:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 DS2PEPF000061C2.mail.protection.outlook.com (10.167.23.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Wed, 15 Apr 2026 20:10:17 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 15 Apr
 2026 15:10:16 -0500
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 15 Apr
 2026 15:10:15 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 15 Apr 2026 15:10:15 -0500
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.39])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63FKAFDW2643917;
	Wed, 15 Apr 2026 15:10:15 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 15 Apr 2026 15:10:15 -0500
Message-ID: <DHU027T75H2T.18DGN3OKVDM6V@ti.com>
CC: <richard.purdie@linuxfoundation.org>, <ross.burton@arm.com>,
	<mathieu.dubois-briand@bootlin.com>,
	<openembedded-core@lists.openembedded.org>, <peter.kjellerstedt@axis.com>,
	<joerg.sommer@navimatix.de>
Subject: Re: [oe-core][PATCH] systemd: fix edit functionality with vi
From: Randolph Sapp <rs@ti.com>
To: <rs@ti.com>, Adam Duskett <adam.duskett@amarulasolutions.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260414190245.2182865-2-rs@ti.com>
 <CAHDQB6NWqbxXfRE0Qdxi2RTbKATJUXy3cbErA+eyaOTUN8V8HA@mail.gmail.com>
 <18A69F836DD2AD37.1523159@lists.openembedded.org>
In-Reply-To: <18A69F836DD2AD37.1523159@lists.openembedded.org>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C2:EE_|PH0PR10MB7061:EE_
X-MS-Office365-Filtering-Correlation-Id: b0b788c3-389c-477d-5c1b-08de9b2b0329
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024|13003099007|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	SFS1EdgGPTrzC2JW9frt+mvCOZ1arBBwUBOuNbHGjXajUP3+mzpb3fcK7EYmB+GfuGP4H/lKSxgjjp4cawBHqFe8duAE2MXBUoCS0t8pdmqvlZZO/QCPCOdS/f8yzj1cmnrrX0sfsWw7xQkgvwmGZPhjLdWYqTbCXFj+FehWJMEsCSQHqjOfQgiYs+ynWpWXvldU92le9/yJjsJoFrgAlvsT80MIymFvbm/lUPrAHgnYjIjsCI/eoBu7ujyqHd9N0qYYI7F0YjunCiJ+Xn37WBtPqUqZXdb77b0E3FioumwEFXiruOLGvoE8s0t0cD5jX2z6/p7QGuWjl7yMlYN5Y4Mwb3NXFHBvRUQvoQKiXrCGttxGvCC0dX4QA4WOyGBh0/7Q1YYhC/n1qVhPhdXufcl8+X/2jzmS0FgFzt+SCT8XwVrvdM/BiPF55sZ0e6b9k1y5jWyqB/9LGPlfezDmn6xYVNEI18s9unKUiBs15y0ny5nDkL4iemvQxjjkeZraFkwWFMoA8sGA5bqHhv1d16jLkHxIJYupZgZxaxktIewu6yhLQS3aqxkJJaoUjtrWLi87LoM+px8r5Spdwyw2CPQcqZKEDMUdQ4FmilHxYgSw1jHkHlqr+1MYnZLjjLptpOop+IEMBtKs3J+41d375SaCaaLCBP38Q4lpaIsUyMTvu/x/7AyaC8kdjhqOqduIASoFSdnQhauAX2CvCWnp/XP5SjfiM1nFxGl439UmwRi3hmIbQ4qcP9kET6GOFwX0SzNa8iLSZ5KA1500MKGPMA==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(13003099007)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	QXkHJH2JWuhjdOpRFR/Dq70Wo5iLD3vQPMl5OVvGldpqXGjnLcQTgeWvrzjohMpPNSzhnAAQb5BB8B9OrWXRmSkprITui/dRBMmh/bw26C3Y6bC/jAnExUtQuKF+AC0AfTFf0ZtJ6VfAaNFixlPHBAwTkrGqTNvPVPQuT8EPJ20uLpmxJn0r79gJemEvDcyfHWERDLmhJqI+17qIzrQSHM4yZkZhmjYXRjHF1X1+O2vmamZhalmho3UyNAOCSFab3Bqxf9Jx2+SXKvkwQxQmO4IRp2tIiq6HGtMG5BXIbjdq5AorkNMHnx8SbEGfKFeV4EdFrEjACM7Omh/Y7bnKDJ3zIzJVYHw+E8qlWQKYJUYYSMWVKwSDGvR9dqYNS+qrA1kr2dtTTZhauPJ494w6VbELMJ5SPbw5eJCThTRhs48FBSS5UKhOqqillIUaf/21
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 20:10:17.1067
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b0b788c3-389c-477d-5c1b-08de9b2b0329
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS2PEPF000061C2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB7061
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 20:10:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235326

On Wed Apr 15, 2026 at 2:48 PM CDT, Randolph Sapp via lists.openembedded.or=
g wrote:
> On Wed Apr 15, 2026 at 4:22 AM CDT, Adam Duskett wrote:
>> Hello;
>>
>> And the pull request for systemd to not assume an editor can handle +LIN=
E
>> is here:
>> https://github.com/systemd/systemd/pull/41642
>>
>> Poettering has closed the pull request with the following reasoning:
>> ```
>> Uh, there's a myriad of tools that rely on this, not just "systemctl edi=
t".
>> for example "less" does.
>> Maybe fix your editor if =E2=80=93 in 2026 =E2=80=93 it still doesn't su=
pport this. I am
>> really sure we shouldn't participate
>> in such a race to the bottom for really really really old editors, that
>> don't do what every other editor does.
>> Moreover we have been doing this for a whole decade now, and no one
>> complained, I am pretty sure we
>> shouldn't make things less usable now, a decade later because of some
>> ancient editor once upon a time
>> hasn't been updated to match what everybody else does, including all
>> vi-style editors of more recent date.
>> I might be more impressed if you convinced less to drop support for call=
ing
>> $EDITOR with "+".
>>
>> Or to express this in a more positive way: please prepare a patch to you=
r
>> "vi" flavour of choice to add
>> support for this very established syntax instead.
>> ```
>>
>> A patch to add +LINE support to Busybox's VI was submitted on the 4th of
>> June 2024:
>> https://lists.busybox.net/pipermail/busybox/2024-June/090778.html and ha=
s
>> subsequently
>> been ignored without feedback.
>>
>> Like it or not, Poettering has made it clear that this patch will not be
>> supported upstream,
>> and his reasoning is sound. The correct thing to do (in my opinion) woul=
d
>> be to bother
>> the busybox maintainers to apply the 23 line patch to add support to a
>> feature used in almost
>> every editor out there.
>
> Adding my reply here since it's being mentioned:
>
> 	While I would normally agree with such sentiments, I'd like to reiterate
> 	IEEE Std 1003.1-2024 does not indicate that the two required editor
> 	utilities (vi and ex) need to support this functionality [1]. If you're
> 	going to try and use vi as a fallback, this doesn't make a lot of sense.
>
> 	Additionally, as I pointed out earlier, nano needs the line number to
> 	come before the file name. If you believe this is really not your bug,
> 	shouldn't you at least avoid trying to open the editors you don't
> 	support?

Ignore that comment about nano. Part of my initial argument that there's no=
t
really a standard behavior in the way this is handled between editors right=
 now.

Not entirely relevant if the argument is "I want to do it this way and anyo=
ne
who doesn't support that is wrong."

I still believe falling back to an editor that doesn't support this behavio=
r is
inherently incorrect.

> 	[1] https://pubs.opengroup.org/onlinepubs/9799919799/
>
> Not entirely sure where that's going to go.
>
>> Either way, should we really be pulling in a patch like this that won't
>> ever be accepted upstream?
>>
>> On Tue, Apr 14, 2026 at 9:03=E2=80=AFPM Randolph Sapp via lists.openembe=
dded.org
>> <rs=3Dti.com@lists.openembedded.org> wrote:
>>
>>> From: Randolph Sapp <rs@ti.com>
>>>
>>> Systemd currently expects any $EDITOR to support +LINE functionality fo=
r
>>> jumping to a specified line in a file. This makes busybox vi misbehave =
a
>>> little as it opens a file called +LINE and shows the user this file
>>> first, as it's the last argument passed to it.
>>>
>>> This has been submitted upstream as even IEEE Std 1003.1-2024 doesn't
>>> dictate that the default editors need to support +LINE functionality.
>>>
>>> Signed-off-by: Randolph Sapp <rs@ti.com>
>>> ---
>>>  ...ot-assume-the-editor-can-handle-LINE.patch | 46 +++++++++++++++++++
>>>  meta/recipes-core/systemd/systemd_259.5.bb    |  1 +
>>>  2 files changed, 47 insertions(+)
>>>  create mode 100644
>>> meta/recipes-core/systemd/systemd/0001-edit-util-do-not-assume-the-edit=
or-can-handle-LINE.patch
>>>
>>> diff --git
>>> a/meta/recipes-core/systemd/systemd/0001-edit-util-do-not-assume-the-ed=
itor-can-handle-LINE.patch
>>> b/meta/recipes-core/systemd/systemd/0001-edit-util-do-not-assume-the-ed=
itor-can-handle-LINE.patch
>>> new file mode 100644
>>> index 0000000000..cbcb472201
>>> --- /dev/null
>>> +++
>>> b/meta/recipes-core/systemd/systemd/0001-edit-util-do-not-assume-the-ed=
itor-can-handle-LINE.patch
>>> @@ -0,0 +1,46 @@
>>> +From bc4177de928fa9c80f2cdd70fd79d07a37d7b2e2 Mon Sep 17 00:00:00 2001
>>> +From: Randolph Sapp <rs@ti.com>
>>> +Date: Tue, 14 Apr 2026 13:25:55 -0500
>>> +Subject: [PATCH] edit-util: do not assume the editor can handle +LINE
>>> +
>>> +If we're checking $EDITOR and trying to use an arbitrary list of text
>>> +editors we shouldn't just assume they know how to handle the +LINE
>>> +notation for jumping to a line in the specified file.
>>> +
>>> +Nano and Ed can handle it, but require that the line number is given
>>> +before the file. Vim and Neovim can take it as any positional argument
>>> +and just assume the last file specified was the intended target. Vi
>>> +cannot handle a line number specifier at all.
>>> +
>>> +There's nothing that states the $EDITOR has to take anything other tha=
n
>>> +a list of file names. Even that isn't really written anywhere. The
>>> +latest version of IEEE Std 1003.1-2024 does not indicate that the two
>>> +required utilities (vi and ex) need to support this functionality.
>>> +
>>> +Upstream-Status: Submitted [https://github.com/systemd/systemd/pull/41=
642
>>> ]
>>> +Signed-off-by: Randolph Sapp <rs@ti.com>
>>> +---
>>> + src/shared/edit-util.c | 7 -------
>>> + 1 file changed, 7 deletions(-)
>>> +
>>> +diff --git a/src/shared/edit-util.c b/src/shared/edit-util.c
>>> +index d48c36c1d5..b813c206c9 100644
>>> +--- a/src/shared/edit-util.c
>>> ++++ b/src/shared/edit-util.c
>>> +@@ -260,13 +260,6 @@ static int run_editor_child(const EditFileContext
>>> *context) {
>>> +                 }
>>> +         }
>>> +
>>> +-        if (context->n_files =3D=3D 1 && context->files[0].line > 1) =
{
>>> +-                /* If editing a single file only, use the +LINE synta=
x
>>> to put cursor on the right line */
>>> +-                r =3D strv_extendf(&args, "+%u", context->files[0].li=
ne);
>>> +-                if (r < 0)
>>> +-                        return log_oom();
>>> +-        }
>>> +-
>>> +         FOREACH_ARRAY(i, context->files, context->n_files) {
>>> +                 r =3D strv_extend(&args, i->temp);
>>> +                 if (r < 0)
>>> +--
>>> +2.53.0
>>> +
>>> diff --git a/meta/recipes-core/systemd/systemd_259.5.bb
>>> b/meta/recipes-core/systemd/systemd_259.5.bb
>>> index d84e38d7cd..4f443cc2d0 100644
>>> --- a/meta/recipes-core/systemd/systemd_259.5.bb
>>> +++ b/meta/recipes-core/systemd/systemd_259.5.bb
>>> @@ -35,6 +35,7 @@ SRC_URI +=3D " \
>>>             file://0003-Do-not-create-var-log-README.patch \
>>>             file://0001-meson-use-libfido2_cflags-dependency.patch \
>>>
>>> file://0018-shared-fdset-add-detailed-debug-logging-to-fdset_new.patch =
\
>>> +
>>>  file://0001-edit-util-do-not-assume-the-editor-can-handle-LINE.patch \
>>>             "
>>>
>>>  PAM_PLUGINS =3D " \
>>> --
>>> 2.53.0
>>>
>>>
>>>=20
>>>
>>>


