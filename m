Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65C57F428CD
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 19:48:11 +0000 (UTC)
Received: from CY3PR05CU001.outbound.protection.outlook.com (CY3PR05CU001.outbound.protection.outlook.com [40.93.201.40])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3913.1776282489182887661
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 12:48:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=Iabv8fA2;
 spf=pass (domain: ti.com, ip: 40.93.201.40, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZERprwF0pQ/0nOPkhLVLIPwqaOy94WYGizR+G2J5Y5W4W3piVRl2YqGMNHyr47vHGSKpvMLr3wutmRnNftLoDJuO5CYG8AHf/52cujYEhXM/0qzgOHXMAHgi75EhEl7IPC6TqwNuprng58GN1t9ZcNuRuF6AnLRgalcFeiIlEIWokXgV8DKopPRjYWaQX20G6uPGInop98VnmbuIokAnYNKEeX9V1ymundIkdapaTv2fNRD9UXk713Kq+ALp8QAabt2GsweYzGIVPS3xDAU6ePYZb6WkuXiNMZW36/6T53SLVklR5x+ri5P3XAbrwykIGZZHd1aWe4eOulfHY0tfGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/XqBPY1s3I7/xYB29xOXKqjcWQUMVCpL3vgvTEKIlu4=;
 b=G/NkXvBZEy7PjnQ1hznlhQp073idpwvYWk9ML3jvD9/cR9WV6ecje0+4OUBe9cpj0V9dTpZizDxckNYRdB7Ovur65RodmxtwNz9iqXpqHIhbrHeBU6Inj8wHtjA2GCrFk9KpjDk51Gg6QlOuQaQp29zUhWLzUFcCYJCwldwPfHk1YNz3z4mJn+xyTTV0LWq1r19uk/qaPqWTXeRGToTSJgQLcKq5pkbwMAWBUOe7+QBregAbQ4E1JZvv/2YFfBBTyLI7WOPRsxG+vSnxXi2S0aPYUOQM1+VHkI6yJQdZZCnoi2cgIk5i0z9TidU1G/1AKlHfl9hy9wJAwWha8eyASA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=navimatix.de smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/XqBPY1s3I7/xYB29xOXKqjcWQUMVCpL3vgvTEKIlu4=;
 b=Iabv8fA2KKgKZ4xm9GDgypMPNFJOORNJlJ8tSDNA6L+CJhoZdFGY9o0TuqTRFhjNzGcKdn8SvXmvW2iOWni5AEp+Efz7mn0DOGU8AbZih+DfDfrxJ6zSJet7wG0srZtrd2WwwFuxffBODRJDeNw/Rc+D0TUINAKFvQpCphb+GNA=
Received: from BN0PR08CA0030.namprd08.prod.outlook.com (2603:10b6:408:142::9)
 by BN0PR10MB4902.namprd10.prod.outlook.com (2603:10b6:408:12a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Wed, 15 Apr
 2026 19:48:06 +0000
Received: from BL6PEPF0001AB59.namprd02.prod.outlook.com
 (2603:10b6:408:142:cafe::19) by BN0PR08CA0030.outlook.office365.com
 (2603:10b6:408:142::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.48 via Frontend Transport; Wed,
 15 Apr 2026 19:48:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL6PEPF0001AB59.mail.protection.outlook.com (10.167.241.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Wed, 15 Apr 2026 19:48:05 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 15 Apr
 2026 14:48:05 -0500
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 15 Apr
 2026 14:48:04 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 15 Apr 2026 14:48:04 -0500
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.39])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63FJm4ho2846627;
	Wed, 15 Apr 2026 14:48:04 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 15 Apr 2026 14:48:04 -0500
Message-ID: <DHTZL8D5FZPQ.3MIFMGQPGPT4Z@ti.com>
CC: <richard.purdie@linuxfoundation.org>, <ross.burton@arm.com>,
	<mathieu.dubois-briand@bootlin.com>,
	<openembedded-core@lists.openembedded.org>, <peter.kjellerstedt@axis.com>,
	<joerg.sommer@navimatix.de>
Subject: Re: [oe-core][PATCH] systemd: fix edit functionality with vi
From: Randolph Sapp <rs@ti.com>
To: Adam Duskett <adam.duskett@amarulasolutions.com>, <rs@ti.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260414190245.2182865-2-rs@ti.com>
 <CAHDQB6NWqbxXfRE0Qdxi2RTbKATJUXy3cbErA+eyaOTUN8V8HA@mail.gmail.com>
In-Reply-To: <CAHDQB6NWqbxXfRE0Qdxi2RTbKATJUXy3cbErA+eyaOTUN8V8HA@mail.gmail.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB59:EE_|BN0PR10MB4902:EE_
X-MS-Office365-Filtering-Correlation-Id: d44c0e25-9f9b-4eb7-4918-08de9b27e98e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|4022899009|36860700016|82310400026|22082099003|56012099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	lOWNZS58iXZYE8NNT4FlyheP9JPG2MSoaq/pFOPZmFilaech45FrDZTg6VnODNTMf/mUzD+HRv0vtSTSIClC4aYvuKp+8GsZbZwtfRzC4EgntCheK2cwS5ThPSvOeDjlS0Ph2QNTb4/5xbbn1VFprOh8gonO7+/E0dMO05OwwEzLWW46qjCV0puw6rB6FYcXP7CvsPiz0PiAC0c6w1wL3mIx0GCAQILconQPWOsUfKcqGlj4dsfxMUL8mAFTAc3mBqkcyzO3FlALFOl8yxJEQyWwZrUv4thNzAlNeqXM9kxB2bznMYK1xtkZWbOCQCOkROYlUr2KRLZP9Mw7yRVS78jXJNN62a4wdCWiikYe4dkHWAOmxgIyPVaxOUqXmkobcNBpMOyshspkMQDu6ip0Dvmtn6obSvTLW8vsJ78bUeZm6CLxWELk7b1Sb6mh1+gGaO2802ZCxznr+REIREHd83VuaDhYvcUC+J6uP4ACTxamC59CPkCKoIrsneTkGMky3TkCL2X5KzBpZp8hDp0lq+VmoI1dG6OQ0StekRe1Snd4q7qV6jB5dM+FyjeFZ+a7T3UzyWCBQ4rfRvhNpzVRk7uyYSn7j3oM+MGd/iv1Hr3dLl/sUjnoV2+A68IhnNKwjl4ROLzdZZq1ne5bsFBkeCwwQPXeZMR5ewxYRygRqCVn5YeuqNub4/hIcUB2534YvYzhjJc5CVaRHyWfdwLRRxRaKKThpzKOc/5lROsuzDk=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(376014)(4022899009)(36860700016)(82310400026)(22082099003)(56012099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	z/Z9WAb6g1UO0oP+vk7hvYXXGZSX4JsKp6SmYajDYyv7Yu+F6Ar2xr2/N79dx7RnjP97g1JZD6ZKM+g+44QDSEkePnsjKABprQWl3b3wKXTwwadII3o6mO/O/GoiIjrP0PVfLear0ITmGS9B/X8TZSn3QMyn5xPqQFROCU06LGl359bruQqH3cdVgX2mk2LXLKO6RCaFAaC6X0kuz/uuTms5UtqNLo9DrTmWKh9ZFQtFLZfu9Lku9Io9Vd/x9rndfvd/aQigxIY9UjlppvEBrJFJ3A25HcTUJltu7rIz5Lta2kyAfvoIJz0fcmbP7D3ottaAy3RI2PRKi1n/WPDLRUzpHDAgX6D+X5HcTWTTJhQRT6wOepEDnLljotDcKu208aESQjHyj5yeYafLSZENTz+LOXHoBEFHWpayJtB8azKjI+pqJOjjAOT1L1LItP1i
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 19:48:05.6508
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d44c0e25-9f9b-4eb7-4918-08de9b27e98e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF0001AB59.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4902
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 19:48:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235325

On Wed Apr 15, 2026 at 4:22 AM CDT, Adam Duskett wrote:
> Hello;
>
> And the pull request for systemd to not assume an editor can handle +LINE
> is here:
> https://github.com/systemd/systemd/pull/41642
>
> Poettering has closed the pull request with the following reasoning:
> ```
> Uh, there's a myriad of tools that rely on this, not just "systemctl edit=
".
> for example "less" does.
> Maybe fix your editor if =E2=80=93 in 2026 =E2=80=93 it still doesn't sup=
port this. I am
> really sure we shouldn't participate
> in such a race to the bottom for really really really old editors, that
> don't do what every other editor does.
> Moreover we have been doing this for a whole decade now, and no one
> complained, I am pretty sure we
> shouldn't make things less usable now, a decade later because of some
> ancient editor once upon a time
> hasn't been updated to match what everybody else does, including all
> vi-style editors of more recent date.
> I might be more impressed if you convinced less to drop support for calli=
ng
> $EDITOR with "+".
>
> Or to express this in a more positive way: please prepare a patch to your
> "vi" flavour of choice to add
> support for this very established syntax instead.
> ```
>
> A patch to add +LINE support to Busybox's VI was submitted on the 4th of
> June 2024:
> https://lists.busybox.net/pipermail/busybox/2024-June/090778.html and has
> subsequently
> been ignored without feedback.
>
> Like it or not, Poettering has made it clear that this patch will not be
> supported upstream,
> and his reasoning is sound. The correct thing to do (in my opinion) would
> be to bother
> the busybox maintainers to apply the 23 line patch to add support to a
> feature used in almost
> every editor out there.

Adding my reply here since it's being mentioned:

	While I would normally agree with such sentiments, I'd like to reiterate
	IEEE Std 1003.1-2024 does not indicate that the two required editor
	utilities (vi and ex) need to support this functionality [1]. If you're
	going to try and use vi as a fallback, this doesn't make a lot of sense.

	Additionally, as I pointed out earlier, nano needs the line number to
	come before the file name. If you believe this is really not your bug,
	shouldn't you at least avoid trying to open the editors you don't
	support?

	[1] https://pubs.opengroup.org/onlinepubs/9799919799/

Not entirely sure where that's going to go.

> Either way, should we really be pulling in a patch like this that won't
> ever be accepted upstream?
>
> On Tue, Apr 14, 2026 at 9:03=E2=80=AFPM Randolph Sapp via lists.openembed=
ded.org
> <rs=3Dti.com@lists.openembedded.org> wrote:
>
>> From: Randolph Sapp <rs@ti.com>
>>
>> Systemd currently expects any $EDITOR to support +LINE functionality for
>> jumping to a specified line in a file. This makes busybox vi misbehave a
>> little as it opens a file called +LINE and shows the user this file
>> first, as it's the last argument passed to it.
>>
>> This has been submitted upstream as even IEEE Std 1003.1-2024 doesn't
>> dictate that the default editors need to support +LINE functionality.
>>
>> Signed-off-by: Randolph Sapp <rs@ti.com>
>> ---
>>  ...ot-assume-the-editor-can-handle-LINE.patch | 46 +++++++++++++++++++
>>  meta/recipes-core/systemd/systemd_259.5.bb    |  1 +
>>  2 files changed, 47 insertions(+)
>>  create mode 100644
>> meta/recipes-core/systemd/systemd/0001-edit-util-do-not-assume-the-edito=
r-can-handle-LINE.patch
>>
>> diff --git
>> a/meta/recipes-core/systemd/systemd/0001-edit-util-do-not-assume-the-edi=
tor-can-handle-LINE.patch
>> b/meta/recipes-core/systemd/systemd/0001-edit-util-do-not-assume-the-edi=
tor-can-handle-LINE.patch
>> new file mode 100644
>> index 0000000000..cbcb472201
>> --- /dev/null
>> +++
>> b/meta/recipes-core/systemd/systemd/0001-edit-util-do-not-assume-the-edi=
tor-can-handle-LINE.patch
>> @@ -0,0 +1,46 @@
>> +From bc4177de928fa9c80f2cdd70fd79d07a37d7b2e2 Mon Sep 17 00:00:00 2001
>> +From: Randolph Sapp <rs@ti.com>
>> +Date: Tue, 14 Apr 2026 13:25:55 -0500
>> +Subject: [PATCH] edit-util: do not assume the editor can handle +LINE
>> +
>> +If we're checking $EDITOR and trying to use an arbitrary list of text
>> +editors we shouldn't just assume they know how to handle the +LINE
>> +notation for jumping to a line in the specified file.
>> +
>> +Nano and Ed can handle it, but require that the line number is given
>> +before the file. Vim and Neovim can take it as any positional argument
>> +and just assume the last file specified was the intended target. Vi
>> +cannot handle a line number specifier at all.
>> +
>> +There's nothing that states the $EDITOR has to take anything other than
>> +a list of file names. Even that isn't really written anywhere. The
>> +latest version of IEEE Std 1003.1-2024 does not indicate that the two
>> +required utilities (vi and ex) need to support this functionality.
>> +
>> +Upstream-Status: Submitted [https://github.com/systemd/systemd/pull/416=
42
>> ]
>> +Signed-off-by: Randolph Sapp <rs@ti.com>
>> +---
>> + src/shared/edit-util.c | 7 -------
>> + 1 file changed, 7 deletions(-)
>> +
>> +diff --git a/src/shared/edit-util.c b/src/shared/edit-util.c
>> +index d48c36c1d5..b813c206c9 100644
>> +--- a/src/shared/edit-util.c
>> ++++ b/src/shared/edit-util.c
>> +@@ -260,13 +260,6 @@ static int run_editor_child(const EditFileContext
>> *context) {
>> +                 }
>> +         }
>> +
>> +-        if (context->n_files =3D=3D 1 && context->files[0].line > 1) {
>> +-                /* If editing a single file only, use the +LINE syntax
>> to put cursor on the right line */
>> +-                r =3D strv_extendf(&args, "+%u", context->files[0].lin=
e);
>> +-                if (r < 0)
>> +-                        return log_oom();
>> +-        }
>> +-
>> +         FOREACH_ARRAY(i, context->files, context->n_files) {
>> +                 r =3D strv_extend(&args, i->temp);
>> +                 if (r < 0)
>> +--
>> +2.53.0
>> +
>> diff --git a/meta/recipes-core/systemd/systemd_259.5.bb
>> b/meta/recipes-core/systemd/systemd_259.5.bb
>> index d84e38d7cd..4f443cc2d0 100644
>> --- a/meta/recipes-core/systemd/systemd_259.5.bb
>> +++ b/meta/recipes-core/systemd/systemd_259.5.bb
>> @@ -35,6 +35,7 @@ SRC_URI +=3D " \
>>             file://0003-Do-not-create-var-log-README.patch \
>>             file://0001-meson-use-libfido2_cflags-dependency.patch \
>>
>> file://0018-shared-fdset-add-detailed-debug-logging-to-fdset_new.patch \
>> +
>>  file://0001-edit-util-do-not-assume-the-editor-can-handle-LINE.patch \
>>             "
>>
>>  PAM_PLUGINS =3D " \
>> --
>> 2.53.0
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#235172):
>> https://lists.openembedded.org/g/openembedded-core/message/235172
>> Mute This Topic: https://lists.openembedded.org/mt/118828793/10152556
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
>> adam.duskett@amarulasolutions.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>


