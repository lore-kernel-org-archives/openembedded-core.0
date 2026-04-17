Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AB56F436AA
	for <webhook@archiver.kernel.org>; Fri, 17 Apr 2026 14:01:23 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.45783.1776434479167659285
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Apr 2026 07:01:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=L9d/6LSD;
 spf=pass (domain: gmail.com, ip: 209.85.128.176, mailfrom: jpewhacker@gmail.com)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-79ab5fd969aso7655967b3.0
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Apr 2026 07:01:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776434478; cv=none;
        d=google.com; s=arc-20240605;
        b=YGpAVvf4/mxqrkHIFkwKX7hzXu0CPLCyyCKJrzoLb0S0Vixyw9LgOt7umQXcZHujh7
         zeO8TAh5iyiOS1D0NJ3GGVZzoh2XNDe7I98PUec1NYZmR5hg7b996GvZ9rKXWy+MG8oC
         z+exSs1nNAXI8koYLvx8OpZ6kUpAoJ/0/UdrdXfgrUyas6TM3UjOAjjPi+MAbIICOSVC
         ZguWVoUbKzInV9vOxiDLt0gWWFzqSLH+WvnKp/32gagOCAgIdnIEayNnUBw6tIbfmu/J
         QezMXOHwAnbY5B664jwaJC4pPm+n64OwIxI9MRRTtLuKm9xdqE6R0nYCTYJJnn6mkh2G
         AiFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gzSSUXc53q/8wETcNA6OxJ+h4KXr8E13S6H+VC4VrGY=;
        fh=X+pZdVDqeBgMuVwKchnx4Kv3mbbDGuI88rDBxy9H54A=;
        b=YARfi34IUE8nbY9Pp843a5o/HA5CpkwrL8AX6/xqmzEVDaK0x5KpTRjMFv315LfkGk
         /i63LvObcCDmO1XYiA8tHr9xLruW2umw8pTb0jQtAJZci78u/Ldnuj0k+hgsCkB7vtX+
         fivo9bMuC5cI3LFNTlT2M+j1us7KTZOmOdn2JcVvSUSbJy8n8XaxwWaHd5yUjHsBMhdU
         SLWHyQPwY4PaGixKbw8CRhlQlMIcAdy6ukjTJiz2LSWcMnHPSGuqaXHptgPI+zDzqCvz
         Kc4wXBbNSb849ZEgzy47I7aRz6/A2zmAgvG0kQJFenG4S8M07rdaCmxMoo/wrBbndnG0
         bsiw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776434478; x=1777039278; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gzSSUXc53q/8wETcNA6OxJ+h4KXr8E13S6H+VC4VrGY=;
        b=L9d/6LSD6tprUo9H/reKbGjqZCmLuztCnpcn2E5SWAJ1lefv9JlJkD2pUn0fkwB+jt
         8wPnJ3au8Pb0wat5N1UOyvVS+v+0aVxupPEEaAp9taWmjQ49p2+EtHZpFiwE82uP57i8
         2wnRk1SXO8CW1SMMziWbSRkCmpwZ6GFwl2go+OtfA9SPdSjcTv+T5BGjZ5kfC6spEMcu
         G0ppNZY8jMtCNbYpCr8A3aknM/rA1nVPP90vumks/tmkjJn+tDeJpL3dfg5dkfu7cstL
         RTC7M/js/2+hnAu5Mv+QDDTj0NgOUtP1ECt8kRiEYcCBLqamCvYXNvpCTcW51MusH3Ap
         eTvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776434478; x=1777039278;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gzSSUXc53q/8wETcNA6OxJ+h4KXr8E13S6H+VC4VrGY=;
        b=JSXREcROiBtfM/jNAiZLfunFWd5X6n83PGRZG3FfA1WBdR2Y1IwsqJfijrcf1zTjqa
         pXN+2oKHunfER8TnU5qBl3pIc3eyWhdRkVIugxjX2ubrEcKsqNaqSmXCmHifxHHSpEe4
         HZfcju6tor15aEVHWOvh8QEsAEGKIjs3QYHw5LTr0G/x9diw85XSjPkk0dUlcQ+UpU+1
         Am5LHFNOTSFJsNjiNv7gHtjllGOA3K7jn3MCsw488zpT/XCJJUHMHtQ1Pcf8MJUaW18R
         n9RxQG2wJgsKxUQ1i4uPqOl2ANeC3JA4iyBgB+2EEb/ujpIt5OGEjObmEUmIegTPU7QW
         FOLg==
X-Forwarded-Encrypted: i=1; AFNElJ+m/Mfa+n4w5oFEghSWUJp8DyHc48A9zlHjBVYfnDQRYvqlCBWqYJS84eq/w8RH3p5STu1uj8CqEYMP/xxVSLcpmA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yxjp3mraIFtGCAsdWA0b/D2aaR3a8HDZV1titqk4EbkfExhKSnc
	8kis3N6XdtHahENgpy1OQWXavfvwIf/k3HCMIG4bvyB7Ocv9A5Hhe9uqC8GGLxnrcxPPvU2FmBP
	VyqzUsRdgiHO3P7ncoONglS03v6LKdUE=
X-Gm-Gg: AeBDievIJ9kvGjOT4zfLskZkcCaYH5xtQg8HHNzubHYXj56hvwTGukKacqDYEuhvQ1G
	t76PpsKSiasTktQbabjGgUabDNGnp0BHOnWLAA5vdSv6Oe4316IF7VCVgw2QAFkay/KkblReFO7
	AKVyCmPjFhd6ewLuP+M2ISWPTAW622WNYDUZ1ginowS02jHkD9uSTQDW3FQJ7ki1tT38rkFDWWG
	kAmhs8flCknxkXjWyZw3E/J6vpp8g/CT8Z5hsq9TutW/3W70PflzVDTg261eFBWF4RibvoEYDIf
	vG0TdbOprGF2b1FB51jau4lXvSff5lcC
X-Received: by 2002:a05:690c:7283:b0:7b2:bf20:cdc3 with SMTP id
 00721157ae682-7b9eccee0a5mr32269887b3.0.1776434470438; Fri, 17 Apr 2026
 07:01:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260417083025.95554-1-peter.marko@siemens.com> <3b0b8c914e99882168b9415dba9d001a4381e150.camel@linuxfoundation.org>
In-Reply-To: <3b0b8c914e99882168b9415dba9d001a4381e150.camel@linuxfoundation.org>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Fri, 17 Apr 2026 08:00:58 -0600
X-Gm-Features: AQROBzDc__tNHhJhlJg7PD1bKPyDdDc-a9P3uL772G3T2fcbgYWAWtCpb6DIsfs
Message-ID: <CAJdd5GYRTgTiwX=pFpe71t1hS3zZiNfSvtbG3tgKuWjSkSuZYg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] create-spdx-3.0: rerun do_create_recipe_spdx on
 patch changes
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: peter.marko@siemens.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Apr 2026 14:01:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235503

On Fri, Apr 17, 2026 at 6:03=E2=80=AFAM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Fri, 2026-04-17 at 10:30 +0200, Peter Marko via lists.openembedded.org=
 wrote:
> > From: Peter Marko <peter.marko@siemens.com>
> >
> > Valkyrie patchmetrics from 2026-04-17 is showing two CVEs where patches
> > were merged the day before (2026-04-16) - inetutils/CVE-2026-32746 and
> > re2c/CVE-2026-2903.
> > Root-cause is that the CVE patches are evaluated in task
> > do_create_recipe_spdx which does not have any dependency on SRC_URI nor
> > content of the patches, so it is taken from sstate-cache which contains
> > old (stale) data.
> >
> > Note that this will mean that running sbom-cve-check will run do_fetch
> > task for all evaluated recipes, however that is necessary to catch also
> > changes within patch content (e.g. adding additional CVE: tags) in
> > addition to re-running when adding new patches if we would only add
> > dependency on SRC_URI variable.
> >
> > Signed-off-by: Peter Marko <peter.marko@siemens.com>
> > ---
> >  meta/classes/create-spdx-3.0.bbclass | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create=
-spdx-3.0.bbclass
> > index 432adb14cd..db1ccc0c81 100644
> > --- a/meta/classes/create-spdx-3.0.bbclass
> > +++ b/meta/classes/create-spdx-3.0.bbclass
> > @@ -192,7 +192,7 @@ python do_create_recipe_spdx() {
> >      import oe.spdx30_tasks
> >      oe.spdx30_tasks.create_recipe_spdx(d)
> >  }
> > -addtask do_create_recipe_spdx
> > +addtask do_create_recipe_spdx after do_fetch
> >
> >  SSTATETASKS +=3D "do_create_recipe_spdx"
> >  do_create_recipe_spdx[sstate-inputdirs] =3D "${SPDXRECIPEDEPLOY}"
>
> What data does do_create_recipe_spdx actually need?
>
> Does it just need SRC_URI, or does it need to re-run if any of the
> contents of items in SRC_URI changes? Or does it actually need the
> patch contents?
>
> If it needs to depend on more than the contents of SRC_URI, it should
> have a dependency but I think Joshua was trying to avoid that. The
> dependency would be on unpack or patch, not fetch as it shouldn't be
> poking into DL_DIR.

Correct, we do not want a dependency on do_fetch as that would make
the "fast" CVE check very slow. I'm curious if this is a problem with
the old cve_check.bbclass also, or if not how it solved the problem

>
> FWIW, the way do_fetch runs only if it needs to is:
>
> do_fetch[file-checksums] =3D "${@bb.fetch.get_checksum_file_list(d)}"
> do_fetch[file-checksums] +=3D " ${@get_lic_checksum_file_list(d)}"
>
> Cheers,
>
> Richard
>
>

