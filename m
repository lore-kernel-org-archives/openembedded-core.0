Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6E52C433EF
	for <webhook@archiver.kernel.org>; Wed,  6 Oct 2021 11:27:32 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web09.10484.1633519652071643689
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Oct 2021 04:27:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eSzAanFs;
 spf=pass (domain: gmail.com, ip: 209.85.208.51,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id f9so8667695edx.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Oct 2021 04:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=sBrcIAOJqHQQv0UsLk+JK1YCdGGJY1N8lUFyy03vWXI=;
        b=eSzAanFsDscaTgWNcZBcyzFkTIIWlxN39Br1TPRh8wWJGgVm96sUx7clwIHZaFo/jm
         CIKVnibJjxaJBz03gvzVTYtBL16DwQLtUt4CMs0qEfUvWNMdXhnDK+a3eM24vz4cGvat
         qQZTPB7rRny87sks3ayjX1lXk6RcMwp0eYcQUThkkRfGJCj2tptKOPAAYdK1eEEsyTRd
         gevOVjHpAqLoh66hK8Ig8l/5xnUk+eHOFkPtqIFV4XlTqgWwy8h34Irnii0tKxqqm/D5
         QNCcPgSvjui2CEz9Gnq2fIctGeL0mp4DDfAECCxxaTKTm18wQLH5wfp9YXEWf+TUYlRW
         Knvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=sBrcIAOJqHQQv0UsLk+JK1YCdGGJY1N8lUFyy03vWXI=;
        b=Js4OEjy2m2blOjHbSOrL6olI6Nsf/YMo8sjKfB0WdLGODlI4aaRt1YU+0CfiiVs0OM
         KGBCSbbc0heayyQ7R8IvtPbUTNSZR2TT3qnzbgoaH8nC9UK9wHmBmiRh83vxkVduy3QG
         GbTrYRcdS0RQWqX50MEP6CuzyXqO/iAi1R82wlIYFiwO4hargaJEWmsIrKuPv135IdVh
         sWeCPMhQNtsZdycq2qGNB+wUSpUf4+PrbL50VQLBIAl7u0s4zmpA6e5Q8FmL1QfK6o/B
         kiK8TESwqW1s03dMIm6H1mime2nSQ7y8ySGeU61ruB8cJBVgPA9N4nhQL7teijUHhog8
         mElQ==
X-Gm-Message-State: AOAM531ccwFio3KuSBPTBEC8IPAwt11egbv9aBBnhp7nJMjrMwPCpADF
	hPAGzcOnfMca0vVP/GmndLtx4JOHFKP7gHevdeU=
X-Google-Smtp-Source: 
 ABdhPJyjNCkwMuly0urATf/zPpbkdHo0iKa0zHdqLBInKR8KYOgXz0/AaTpnGQcuP5saFdfY415+0EoUuWoFQKlIS58=
X-Received: by 2002:aa7:d3ce:: with SMTP id
 o14mr33091512edr.354.1633519650406;
 Wed, 06 Oct 2021 04:27:30 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1633478971.git.bruce.ashfield@gmail.com>
 <6bf351545a8bf21fff5c00ff1ed8978b475f05d4.1633478971.git.bruce.ashfield@gmail.com>
 <CANPvuRnBLLeOOhurA9r5ihC_epZuESynEauXRe7PoUePa6dfWQ@mail.gmail.com>
 <16AB6CC148A54F2E.4493@lists.openembedded.org>
In-Reply-To: <16AB6CC148A54F2E.4493@lists.openembedded.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 6 Oct 2021 08:27:19 -0300
Message-ID: 
 <CADkTA4ObhsCn+2S9oHKq5jK4HcOoyABueNK4qbeKd1Y7kS0vDw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 7/7] kernel-yocto: don't apply config metadata
 patches twice
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Jose Quaresma <quaresma.jose@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Oct 2021 11:27:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156692

On Wed, Oct 6, 2021 at 8:14 AM Bruce Ashfield via
lists.openembedded.org
<bruce.ashfield=3Dgmail.com@lists.openembedded.org> wrote:
>
> On Wed, Oct 6, 2021 at 5:46 AM Jose Quaresma <quaresma.jose@gmail.com> wr=
ote:
> >
> > Hi Bruce,
> >
> > Bruce Ashfield <bruce.ashfield@gmail.com> escreveu no dia quarta, 6/10/=
2021 =C3=A0(s) 01:12:
> >>
> >> From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >>
> >> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> >> ---
> >>  meta/classes/kernel-yocto.bbclass | 5 ++++-
> >>  1 file changed, 4 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-y=
octo.bbclass
> >> index 549dfd97a4..1d5a8cdf29 100644
> >> --- a/meta/classes/kernel-yocto.bbclass
> >> +++ b/meta/classes/kernel-yocto.bbclass
> >> @@ -36,7 +36,10 @@ def find_patches(d,subdir):
> >>              if subdir =3D=3D patchdir:
> >>                  patch_list.append(local)
> >>          else:
> >> -            patch_list.append(local)
> >> +            # skip the patch if a patchdir was supplied, it won't be =
handled
> >> +            # properly
> >> +            if not patchdir:
> >> +                patch_list.append(local)
> >
> >
> > I think that will be useful to have a warning there when the patchdir w=
as supplied
>
> Sure, but no one has ever hit this before in the wild, so there are
> none known to be in existence, since if they did exist you'd get an
> error.
>

Actually, as it turns out. I can't warn here (at least not in a user
visible way), since it is only being skipped for a particular run of
my find_sccs/patches python functions. There are other calls to those
same routines that pickup patchdir/subdir patches. So when running the
default collection, we can't warn, otherwise that warning is
incorrect. A log might work via, since that isn't easily visible to
the user and shouldn't alarm anyone.

But again, I'll just carry it locally for a while longer instead.

Cheers,

Bruce

> I'll probably just drop the patch and carry it locally.
>
> Bruce
>
> >
> > Jose
> >
> >>
> >>      return patch_list
> >>
> >> --
> >> 2.19.1
> >>
> >>
> >>
> >>
> >
> >
> > --
> > Best regards,
> >
> > Jos=C3=A9 Quaresma
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#156689): https://lists.openembedded.org/g/openembedde=
d-core/message/156689
> Mute This Topic: https://lists.openembedded.org/mt/86108495/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [br=
uce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

