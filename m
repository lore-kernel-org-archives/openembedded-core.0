Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43785C77B73
	for <webhook@archiver.kernel.org>; Wed, 19 Apr 2023 13:59:30 +0000 (UTC)
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
 by mx.groups.io with SMTP id smtpd.web10.38453.1681912766827619520
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Apr 2023 06:59:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=c0hgzTuU;
 spf=pass (domain: gmail.com, ip: 209.85.166.54, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-7606ce9b213so1203539f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Apr 2023 06:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681912766; x=1684504766;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xImQSytMnzQnuOqS1bxiuuAj8pnH1Zj2+JIHtpRJ2Tw=;
        b=c0hgzTuUpWK/fLaXocmbCWyHpwYTwiS5dH4wEECzvttHIk1qvkI++oD8NuAUBhdDLk
         2Ehw2PyFG1+Pv1NbjCV+yjZkVizMsAr/HiEo7NG5xQ+MM8CO9geOtoJgnvewWpCVOe8J
         A9wnatuE6Ulz2OqZ4p5lVfXm7qlAvcJQf/GWFgUJVVgAdbM0VedAd7Y+pRywcgpkDdat
         JLuA674g09M1nHjrsOFOYYVE219Yvc0gg6zMlnwVWVDRPnlZGrLAeebmYTeoFl4JO10x
         oFjIhJObi7MaiX55def8Xo5GVSqsro7GesJVLcOfPP5fN8fEvo30kAwmY7a12v3zqfFg
         gPtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681912766; x=1684504766;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xImQSytMnzQnuOqS1bxiuuAj8pnH1Zj2+JIHtpRJ2Tw=;
        b=IqsKN1y/0tx+oBgo0UEiIRuBuRzXgWZGr8T1hFPoPRarT2OEtEVUxWPnus+MbuDNE3
         YSNbzIaXxLCjD5xoGGJdPg42BU9fLJt9eIv+DOgVhcvDqWjM0g/emQWzcLt3vNWX9EsU
         Z57nA/Gk99yAT08vik0Vc436ZIkG4uDjmoIZxg4kvMJRFI7rVMrvMmG8EHApBRrJaL/L
         UzT4a36mKFKXNnCCpR+JaFI2iT7mytjvWJLtnZT5T+9Dqq8yxTwhRaU6LhJdJ5fqwq00
         F265jsT71jCduSbScd/felJW1oJwxKpk9hmxFpuAbscbjV7nUKKqFXzwyAJWgTmiFvH3
         fTkw==
X-Gm-Message-State: AAQBX9fuNNM8TyokWJjNCdT/Wlrjmw4k1cVRVA8uD3R3Z0lN0/KyzpZb
	xaIoIcXmxtMkJ4HQCRYYkNuyq6ITLHoDAOBYQE8=
X-Google-Smtp-Source: AKy350ZQLPOOaFlQqGYDP+yRG/b/98hC92YA2DU7YJJUEx5NQ61iJc1eyWeLduseTx5YnA2s2Y23ORh6a409Y8Bx6CE=
X-Received: by 2002:a92:cf41:0:b0:329:3c3b:93f4 with SMTP id
 c1-20020a92cf41000000b003293c3b93f4mr17579858ilr.19.1681912765966; Wed, 19
 Apr 2023 06:59:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230416103052.28268-1-christoph.lauer@email.de>
 <27b6976546dae12e92dd3af28f657c02eca4afe8.camel@linuxfoundation.org>
 <CANPvuRnSPULJzxC0qt=sQLWS5jyx4OkJ2cQobDzHs0LmmBG6MQ@mail.gmail.com>
 <CADkTA4N9Sypxccr0OU6KQxPK5rbsL_mNFGaJ2Zn_jYHL1tNSEg@mail.gmail.com>
 <652908a6640ffc911d46613cb99159086131416f.camel@linuxfoundation.org>
 <CADkTA4MBh46pqJoQjW4dhOc3Sw-4+rr-u4d48OPSs9eC1VPx8A@mail.gmail.com> <CANPvuR=M0-ndA609d2i43rgVVSPrHzEeo5o7orRjmeR9BA5_QQ@mail.gmail.com>
In-Reply-To: <CANPvuR=M0-ndA609d2i43rgVVSPrHzEeo5o7orRjmeR9BA5_QQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 19 Apr 2023 09:59:19 -0400
Message-ID: <CADkTA4MMj6qUNHyjNV6QxE0iZAwA8=Ur6Ks4_7ETJtmrv6TrNA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] make-mod-scripts: preserve libraries when
 rm_work is used
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Christoph Lauer <christoph.lauer@email.de>, openembedded-core@lists.openembedded.org, 
	Christoph Lauer <christoph.lauer@xtronic.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Apr 2023 13:59:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180224

On Wed, Apr 19, 2023 at 9:52=E2=80=AFAM Jose Quaresma <quaresma.jose@gmail.=
com> wrote:
>
>
>
> Bruce Ashfield <bruce.ashfield@gmail.com> escreveu no dia ter=C3=A7a, 18/=
04/2023 =C3=A0(s) 22:12:
>>
>> On Tue, Apr 18, 2023 at 5:04=E2=80=AFPM Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>> >
>> > On Tue, 2023-04-18 at 16:25 -0400, Bruce Ashfield wrote:
>> > > On Mon, Apr 17, 2023 at 6:31=E2=80=AFPM Jose Quaresma <quaresma.jose=
@gmail.com> wrote:
>> > > >
>> > > >
>> > > >
>> > > > Richard Purdie <richard.purdie@linuxfoundation.org> escreveu no di=
a segunda, 17/04/2023 =C3=A0(s) 20:51:
>> > > > >
>> > > > > On Sun, 2023-04-16 at 12:30 +0200, Christoph Lauer wrote:
>> > > > > > From: Christoph Lauer <christoph.lauer@xtronic.de>
>> > > > > >
>> > > > > > With rm_work active, external module signing throws an error:
>> > > > > > scripts/sign-file: error while loading shared libraries: libcr=
ypto.so.3: cannot open shared object file: No such file or directory
>> > > > > > Preserve libraries that sign-file script needs during runtime.
>> > > > > >
>> > > > > > Signed-off-by: Christoph Lauer <christoph.lauer@xtronic.de>
>> > > > > > ---
>> > > > > >  meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb =
| 3 +++
>> > > > > >  1 file changed, 3 insertions(+)
>> > > > > >
>> > > > > > diff --git a/meta/recipes-kernel/make-mod-scripts/make-mod-scr=
ipts_1.0.bb b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
>> > > > > > index 28e0807d1d..0e24efc597 100644
>> > > > > > --- a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.=
0.bb
>> > > > > > +++ b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.=
0.bb
>> > > > > > @@ -32,3 +32,6 @@ do_configure() {
>> > > > > >               -C ${STAGING_KERNEL_DIR} O=3D${STAGING_KERNEL_BU=
ILDDIR} $t
>> > > > > >       done
>> > > > > >  }
>> > > > > > +
>> > > > > > +# keep native libraries required for module signing
>> > > > > > +RM_WORK_EXCLUDE_ITEMS +=3D "recipe-sysroot-native"
>> > > > >
>> > > > > I'm really reluctant to take this change as it isn't the way
>> > > > > dependencies are meant to work.
>> > > > >
>> > > > > It sounds like something in a shared workdir is depending on som=
ething
>> > > > > in a recipe workdir and we simply don't support that. Everything=
 needed
>> > > > > should be in the shared workdir. At best this is a bandaid and t=
here
>> > > > > will be other ways to make this fail such as cleaning make-mod-s=
cripts.
>> > > >
>> > > >
>> > > > The problem is because for signing the kernel modules the sign-fil=
e.c [1] is linked dynamically with openssl-native.
>> > > > This works when building the in tree kernel modules but will fail =
when we try to sing any out of tree kernel module.
>> > > > To sign the out of tree kernel we will use the binaries from the s=
hared workdir but the native libcrypto.so.3 is removed by
>> > > > the rm_work bbclass. We need to link the sign-file statically othe=
rwise it will not work with the rm_work bbclass.
>> > > >
>> > > > [1] https://github.com/torvalds/linux/blob/master/scripts/sign-fil=
e.c
>> > > >
>> > > > Another solution for this problem can be changing the make-mod-scr=
ipts to be a native tool and in this way
>> > > > they will be installed and the dependencies will be handled correc=
tly.
>> > >
>> > > There would very likely be different issues if the scripts were
>> > > generated and then packaged as a native tool / package. Since they a=
re
>> > > so tightly coupled to the kernel. We'd just trade one set of issues
>> > > for another (out of sync artifacts, etc).
>
>
> Maybe some new issues will come with this change but this will be more al=
igned with
> majority of the other tools. This is something I will keep in my TODO lis=
t.
>
>>
>> > >
>> > > I'm going to hack on this a bit.
>> > >
>> > > That being said, I've never done any module signing .. since I don't
>> > > need it in my development workflow.
>> > >
>> > > Is there a canonical guide to getting it setup so I can test my stat=
ic
>> > > link and relocated artifacts fixes ? is it with meta-integrity and t=
he
>> > > kernel-modsign bbclass ?
>
>
> Yes, I am using the kernel-modsign bbclass of meta-security.
> The step to needed is add modsign in DISTRO_FUTURES and
> provide the required keys setting the MODSIGN_* variable in the bbclass
>
>> >
>> > I did think about this a bit more. It does likely depend on the versio=
n
>> > of libcrypto from the host system as to whether it reproduces or not.
>> > The possible solution ideas I came up with are:
>> >
>> > a) statically link sign-file so we don't need libcrypto
>> > b) copy the libcrypto.so into a known location in the shared workdir
>> > (probably some new path) and then adding an RPATH/RUNPATH using chrpat=
h
>> > to the binary.
>>
>> Agreed. I have sign-file statically building here, and it works, but
>> objtool is blowing up under static linking.
>
>
> Building the sign-file statically looks like a good solution but I have n=
o idea of the side effects.

There's no side effects to the tool itself (outside of the normal "the
binary is a bit larger", etc, it is some of the other utilities that
are causing issues.

>
>>
>>
>> If I can't break the tools into separate bits, or fix that static link
>> .. My other idea is the same as yours, if we copy out the .so and make
>> sure it is in a recognized location in the artifacts dir, we are good
>> to go.
>
>
> But I believe that for copying it will require copying the full native sy=
sroot dependency chain and
> not only libcrypto.so.

The only thing missing is libcrypto (from my checking), so it doesn't
look like we'd need any more than that. But yes, it would be expected
we'd have to bring in all the requirements (but many of the common
ones are already provided by the default native environment).

Bruce

>
> Jose
>
>>
>>
>> Bruce
>>
>> >
>> > Cheers,
>> >
>> > Richard
>> >
>> >
>>
>>
>> --
>> - Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end
>> - "Use the force Harry" - Gandalf, Star Trek II
>
>
>
> --
> Best regards,
>
> Jos=C3=A9 Quaresma



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

