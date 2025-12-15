Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB0AED5B853
	for <webhook@archiver.kernel.org>; Mon, 15 Dec 2025 16:33:26 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.53280.1765816402066968085
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Dec 2025 08:33:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OHK8HYPP;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-29f30233d8aso34540805ad.0
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Dec 2025 08:33:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765816401; x=1766421201; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J4cDRcD0gg6s8+VI/yvCt2WKYwjJad1C1evM9J7N5VI=;
        b=OHK8HYPPCNB1AWXjyUwgLuj9ReilkvK8hqUhFgOXRLvo8y7R5WPM6mEQzO+l3zagzy
         90867+4C5SkMYa58sM+IkGv0//7Qiy045OQ55rwT3q6tLNlQtuy4jluiAfcurXegvSAR
         I22ncnruduaiQbrvph3UaT0sSG+K+Sx/GVqQ9IVBs4but+gM1pjaD/yUHPp4SMKjK3CJ
         jgdmxiAM/ffrex5OSla8zQtPXVrnsuzeJgVkA0o2pHRoo+T/dpGeIb50Tg5H/6RPQKb0
         z4Ope4MjdzwMIBks3r+uHktgvjSfsmpluyY5nCMDMuGOQPqGyxZLDkW4B9DGneMCLbUA
         KMZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765816401; x=1766421201;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=J4cDRcD0gg6s8+VI/yvCt2WKYwjJad1C1evM9J7N5VI=;
        b=m7iFp4yUvB85pn9XNJKP1pZotskBGHXpCPqTTVbSDIgtMg/0RUOQHjqPnMiA2vt8VN
         0gBplWnrvl5ewXE8j4dotw3ifxROwZE3YbcsGlUinrL1Vqvk3AKttHMsB6vIo0kHh5vQ
         l18NEiRH23DtVfVgP+bCBbCpDOyw0mrHnEIZBSCeLs2lfMRmOMnEeEWEYroBUbjKFbT3
         rcS5+ZN2Z3qmrDRhjCPN2MNygyKqAwetaPHDZAMzMDquGpprCm2UvzQj9cuCq99aKeYt
         xcGYz/RtPaPV4UJSrg5IFS2E8x06qPN42MyWCFwP69uVTd9zxensXBVMApd6IV0/OGKr
         K+mw==
X-Gm-Message-State: AOJu0YwEtdcuTRZ1js1Mh/j+Q2fUA0SxEJfvJ26Ku2vFBZ8H0rxfplzp
	v8cG1tDbu1+KUS02oBzj3Xyj05k9UPejfin8lSpK2osI5vuIlq90BlX5EVIwjKpYB9OIbHj4/ag
	6ndRO76L4GZ6kb/zCFmRCS1wNd/e478Y=
X-Gm-Gg: AY/fxX65i0kiWXwyv1smO+94pEI9BUbUIxKTAUeBxMg7o0s5Ctj1BWAbcEbCh/3gTYJ
	2x9ZrI3wlAJ3ukGSIflOC9HJ7LBH8ctIziAaNlH7j2Yox2ZdFKijhaz8rb2cxb3UUBUIiExbASB
	RneHGf1E/Uv1yfQJfYC93LXhTgHMjDR4SCdEfH3zJikQ5H6DlDr8CwOg5EDc/Z3M9nL9TfI2Xh2
	x6wz/2kjU98nwacjXOwvUKDsFWH6Vk59ndQpvlDCbTcO6qJNzOUEBs2Tg0OBes12Y1/VQ==
X-Google-Smtp-Source: AGHT+IF6EMhslAk3Dtu63hHbILfi0efK3V0ZzAKvLGR6SiSNFDKGbM+hGUQrXnjNRE/4Xnxaqf17JU3EDtlulVBonW4=
X-Received: by 2002:a17:903:3808:b0:29e:fb50:5bd2 with SMTP id
 d9443c01a7336-29f23d29df9mr101229995ad.58.1765816401273; Mon, 15 Dec 2025
 08:33:21 -0800 (PST)
MIME-Version: 1.0
References: <20251215155424.237662-1-kamel.bouhara@bootlin.com>
In-Reply-To: <20251215155424.237662-1-kamel.bouhara@bootlin.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 15 Dec 2025 11:33:09 -0500
X-Gm-Features: AQt7F2qvM81L87gG6CdYouXqOiMH6x_fZLCvB2Dv3WCSj8FuI5UQJRC77p987wM
Message-ID: <CADkTA4PhJZz1WcH5v3uLpCNxfhuR8_GkNM0kPPu+_TLmqfBXXQ@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap 0/3] Backport SPDX kernel config and
 PACKAGECONFIG metadata export
To: kamel.bouhara@bootlin.com
Cc: openembedded-core@lists.openembedded.org, JPEWhacker@gmail.com, 
	thomas.petazzoni@bootlin.com, Miquel Raynal <miquel.raynal@bootlin.com>, 
	mathieu.dubois-briand@bootlin.com, antonin.godard@bootlin.com, 
	Pascal Eberhard <pascal.eberhard@se.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Dec 2025 16:33:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227748

On Mon, Dec 15, 2025 at 10:54=E2=80=AFAM Kamel Bouhara via
lists.openembedded.org
<kamel.bouhara=3Dbootlin.com@lists.openembedded.org> wrote:
>
> Hello,
>
> This series backports upstream commits that add support for exporting ker=
nel
> configuration and PACKAGECONFIG features to SPDX 3.0 documents.
>

regardless of this being opt-in functionality, we should have extra
justification for
adding features to old releases (LTS or not).

Apologies if I missed a discussion where this was already justified
and approved,
I just can't remember it.

This is something that could actually sit in a layer, and not in core, for =
older
releases.

Bruce

> Upstream commits:
> - 228a968e7c47 ("kernel.bbclass: Add task to export kernel configuration =
to SPDX")
> - 7ec61ac40345 ("spdx30_tasks: Add support for exporting PACKAGECONFIG to=
 SPDX")
> - 2f0ab110d752 ("oeqa/selftest: oe-selftest: Add SPDX tests for kernel co=
nfig and PACKAGECONFIG")
>
> Kamel Bouhara (Schneider Electric) (3):
>   kernel.bbclass: Add task to export kernel configuration to SPDX
>   spdx30_tasks: Add support for exporting PACKAGECONFIG to SPDX
>   oeqa/selftest: oe-selftest: Add SPDX tests for kernel config and
>     PACKAGECONFIG
>
>  meta/classes-recipe/kernel.bbclass   | 64 ++++++++++++++++++++++++++++
>  meta/classes/create-spdx-3.0.bbclass | 11 +++++
>  meta/lib/oe/spdx30_tasks.py          | 20 +++++++++
>  meta/lib/oeqa/selftest/cases/spdx.py | 57 +++++++++++++++++++++++++
>  4 files changed, 152 insertions(+)
>
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#227743): https://lists.openembedded.org/g/openembedde=
d-core/message/227743
> Mute This Topic: https://lists.openembedded.org/mt/116794215/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [br=
uce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

