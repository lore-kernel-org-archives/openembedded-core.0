Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20250E674AF
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 13:10:22 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.79661.1766409020619186718
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 05:10:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QDe5G4AL;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-34c277ea011so3905175a91.1
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 05:10:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766409020; x=1767013820; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gs1iDbAJfQLNyb1r6vpJvKDvigt17h0UgMX0cBV6JBo=;
        b=QDe5G4ALu01OeaTPmnMrdC4oACZ5Z2ThUqKDd/i3nx5PJ+l3Pk62pGn/HSlB/V6Lyp
         HsbvIXqcZg/sBHIXtZH8VGzfzBJagUDTH/ENM3DeqMMS2j4Ht4G2HSWLFmyFP1outv33
         93jU+mAEjUYISYx9O5LFdeZyRqecZDi2INUbNOAWLN7agh2FcLSGgy8ayiiX9iHmZPK6
         ndEpq31zHZeBVyEnL8YQxxvYs0Sx5TYIC70+k1tiCGPLvl52IPGcZovkmzT664iRq/pX
         5S1/6LNcLshqvTC3u8RP0w8WM1IHwhYgCBwCRqTR4KgoSPkAmSEMgfB1TS2zEC0KzUjW
         i0hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766409020; x=1767013820;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Gs1iDbAJfQLNyb1r6vpJvKDvigt17h0UgMX0cBV6JBo=;
        b=vJYuzzPCwT3H6P2j7CRPpvGGBWBw7/72HWWptPfvxF/Zj0HiX/tb7DCPu4HtZNuqrf
         hZFA9V8Hfxw1rwL+egrX2ndFBbnp5tJRpNwXH9QD7seyejF851CT89Hm0tR8Thc0j8hD
         4wX1CxcD/8pWkmX2gNSfAYZl18f7e8bwGdjdH1HK2hiqN2v4b6gwrJg4947MNA49ZJ2S
         jUNHq9IfHW1fIH4pEP4pwUiM1HMr2YetoDrZJK/RsZNiJynAtF8dTWGJxb/6QIBttauy
         +2UwVBZSuHE7AzFSNr+SBSmEeO3jn9eRQE5wXyi0QD5FqBOw/cPmnMP9Lh6PPzjhtxkM
         Cs1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXZrKa0cNdd7I3p2uyZqv5Y+ygHHjyQwBfpzkJGbcBBzP3oW9qSKrZqSZqij3M+ZVY0cTkCtRTnYfR2UwUiT1eJmw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw7A8KpoZA4ZC4hLoR/dV2R8x5WGji9xHcqkgpjCzssjG3IWAGu
	rE3a2sae4py/bNDAPvUljnJWTTO7ZMAhfC2IJA+fNhuO7w8MFanQI83whjzah2+U+j9OjrQqGSA
	Xr0FOCsj0d8Ac7jSoI+7wSNKc837nGJE=
X-Gm-Gg: AY/fxX4OoZ3MVJn3CmR7PpkGRzb9DsIh4euobwJu6FnLnxJ0A5jc2x3RTPk/pvY9rh7
	849GeokKTozZgXIOUF2aFG4NbrhibkBzTI/Yr9m5iwEWfq1618ushljo2Co3XETDuQFCn/CK7g7
	mMjpf9Qloz+UDZrGoRtgmDREwMjU3q58+JdA5NAB4+iWzMT9s4S4NkMFBy2HrcGTSxjkykqGwLL
	K9EweENuzS1zTu7B1yK4MV9ZFj3fwWNJiiCKFWwdINEcx7SUVuilxTLhOYH63D6ErJu8rCv
X-Google-Smtp-Source: AGHT+IERJCj9T2gKQJnrtaqkf8mFJOwsJOAdkfdP/j/ySDPcMOpkFe67WIvmyw5C9dcq++nvDLkcM9d4ZBNMi9apMU8=
X-Received: by 2002:a17:90b:5703:b0:329:ca48:7090 with SMTP id
 98e67ed59e1d1-34e921f8ad9mr9618097a91.37.1766409019803; Mon, 22 Dec 2025
 05:10:19 -0800 (PST)
MIME-Version: 1.0
References: <188268ECAC642171.1614991@lists.openembedded.org>
 <CADkTA4MZ6rrU1RxW8zmsAWCMC-zBgdvhWnWBpaXVSpst7njSCg@mail.gmail.com> <DF4LRLF3UQLQ.1OMN0OZ0WE0YH@bootlin.com>
In-Reply-To: <DF4LRLF3UQLQ.1OMN0OZ0WE0YH@bootlin.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 22 Dec 2025 08:10:08 -0500
X-Gm-Features: AQt7F2rAAxU2URHuaEzzpQz0k1sln2FavlN0YoLe_yfCi1z_dWY2ySTlKv85zzw
Message-ID: <CADkTA4Ps3B_whC-7YyD5bfD_Oqn22YHFrDb80ivURh4zpuRHNg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/21] linux-yocto: combined and consolidated
 pull request
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: richard.purdie@linuxfoundation.org, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 13:10:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228301

On Mon, Dec 22, 2025 at 3:29=E2=80=AFAM Mathieu Dubois-Briand
<mathieu.dubois-briand@bootlin.com> wrote:
>
> On Thu Dec 18, 2025 at 9:56 PM CET, Bruce Ashfield via lists.openembedded=
.org wrote:
> > On Thu, Dec 18, 2025 at 3:22=E2=80=AFPM Bruce Ashfield via
> > lists.openembedded.org
> > <bruce.ashfield=3Dgmail.com@lists.openembedded.org> wrote:
> >>
> >> From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >>
> >> Hi all,
> >>
> >> As discussed in the weekly engineering call, I'm sending this as
> >> single series even though it crossed boundaries of the repositories.
> >>
> >> I don't have access to meta-yocto-contrib yet, so I haven't pushed
> >> the component parts to contrib branches yet, but will do that for
> >> future pull requests.
> >>
> >> I'm using this as a first run through some things I've cooked up
> >> to coordinate the patches across the repos. The formatting is my
> >> own, so apologies if it isn't clear .. and we'll see if it all
> >>
> >> Now to the series for OE-core:
> >>
> >>  - We have stable updates to 6.12
> >>  - A kern-tools fix
> >>  - Updates to 6.17
> >>  - Removal of 6.17
> >>  - Introduction of 6.18
> >>  - Bump to libc-headers to 6.18
> >>
> >> I've built and booted what I can locally, and I know that the
> >> major architectures work, and are functional with respect to
> >> core features.
> >>
> >> I have more libc-headers testing running against meta-oe and
> >> muslc, so there may be some breakage there and I'll help deal
> >> with that if it happens.
> >>
> >> The update and then removal of 6.17 is on purpose. In case any
> >> one was using it, they should get the latest tested before it
> >> starts to be removed.
> >>
> >> For meta-yocto:
> >>
> >>   - removal of any remaining 6.17 references
> >>   - introduction of 6.18
> >>
> >> The meta-yocto default changes are obviously REALLY RFC/RFT
> >> there will be issues, but I've provided them anyway to make it
> >> clear that we are going to 6.18 as the new default for all the
> >> variants.
> >>
> >> Once we get 6.18 fully green and the h/w references udpated,
> >> I'll remove 6.12 and 6.16 from master. That isn't in this series
> >> by design.
> >
> >
> > FYI: my extended testing shows a warning in the virtualization
> > fragments. It isn't serious, but will be fixed in incremental patches
> > on the end of this queue.
> >
> > Bruce
> >
>
> Hi Bruce,
>
> Sorry, I was a bit late in testing this.
>
> On my side I also get some issues in building strace, are you aware of
> this?
>
> ERROR: strace-6.17-r0 do_compile: Execution of '/srv/pokybuild/yocto-work=
er/genericx86-64/build/build/tmp/work/core2-64-poky-linux/strace/6.17/temp/=
run.do_compile.3198325' failed with exit code 1
> ...
> | ../../sources/strace-6.17/src/listmount.c: In function 'print_mnt_id_re=
q':
> | ../../sources/strace-6.17/src/listmount.c:39:16: error: 'struct mnt_id_=
req' has no member named 'spare'
> |    39 |         if (req.spare) {
> |       |                ^
> | In file included from ../../sources/strace-6.17/src/listmount.c:9:
> | ../../sources/strace-6.17/src/print_fields.h:384:37: error: 'struct mnt=
_id_req' has no member named 'spare'
> |   384 |                 PRINT_VAL_X((where_).field_);                  =
         \
> |       |                                     ^
> | ../../sources/strace-6.17/src/defs.h:1910:17: note: in definition of ma=
cro 'zero_extend_signed_to_ull'
> |  1910 |         (sizeof(v) =3D=3D sizeof(char) ? (unsigned long long) (=
unsigned char) (v) : \
> |       |                 ^
> | ../../sources/strace-6.17/src/print_fields.h:384:17: note: in expansion=
 of macro 'PRINT_VAL_X'
> |   384 |                 PRINT_VAL_X((where_).field_);                  =
         \
> |       |                 ^~~~~~~~~~~
> | ../../sources/strace-6.17/src/listmount.c:41:17: note: in expansion of =
macro 'PRINT_FIELD_X'
> |    41 |                 PRINT_FIELD_X(req, spare);
> |       |                 ^~~~~~~~~~~~~
> | ../../sources/strace-6.17/src/print_fields.h:384:37: error: 'struct mnt=
_id_req' has no member named 'spare'
> |   384 |                 PRINT_VAL_X((where_).field_);                  =
         \
> |       |                                     ^
> ...

I didn't see that, but our strace in OEcore must be just a bit out of date.

I'm off for the next week, but if I have time during the evenings, I'll fix
this up. Otherwise, it will be top of my list when I return.

Bruce

>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/4/builds/2904
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/19/builds/2895
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/22/builds/2922
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/60/builds/2891
>
> Thanks,
> Mathieu
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

