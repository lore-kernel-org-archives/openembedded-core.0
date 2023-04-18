Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DA80C77B78
	for <webhook@archiver.kernel.org>; Tue, 18 Apr 2023 20:25:55 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.web10.20849.1681849554550823096
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Apr 2023 13:25:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=gbw2SQyQ;
 spf=pass (domain: gmail.com, ip: 209.85.128.179, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-54fbb713301so231694827b3.11
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Apr 2023 13:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681849554; x=1684441554;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AgMhQzpOA1q37IoYNR4pMtPoMpqTilRr2ytSM/+gmWg=;
        b=gbw2SQyQ0TgkO9rcE/NFopjU1xb5iUbfp8FTLuuqwzXL1QgS8l60bsYeogtc5JDRYa
         20on2yZp+ZsPSIogXA/GEhu7BCKbQ1ott3scXqStM9YG1Q1Y72BGE/Dwi65fiWxTAhN8
         KJFrzAH3vW7aUjRFEo3w6CZMSzNXliU/VCK6deROnHIXm05hVA868OZFLTHOpjfGdo7+
         iZK0lDKpn0sxOQdggWKWfjKIZrof1rPFGkyEZL8DJrV574Nf8zK+PAdF7+NS1jgkn9tN
         /0QFbgoLO3slbCSZXlZXG8wneF0fVuAaL4Y/wyCS+HVZWfL5Xar+S6d1Rw7MbMv8FrL4
         ejog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681849554; x=1684441554;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AgMhQzpOA1q37IoYNR4pMtPoMpqTilRr2ytSM/+gmWg=;
        b=CUbTPcl4WBbl8bMAfPryYtLOfPstw8gcBxH6sKWn9a2P6CHicN2looNY+mhEKjq8x2
         Q+AEjxsKpcw5wqBJpW8Ms20/wO+T6j8Xngs1nzi4lLVt4gnnxGIe+KAybpIwziTRJo1B
         5yvMjihkOZCe43s1Lt4DFtiXXPHLLYGZr4WrL2XkpcC+JlVcAmOfO5IGTAx8Sm1FkHnt
         CfzAbSQni6EXO7X2NOFDB4GFzzO2c5FA2IWvTcZfyRHuKNJOdVX9Mt4A9wC2OGry5wL4
         2/ouxYDSKBa71t2MCvw20nc1i0sWJCndfN7uz/SDmx7DGmUZtrI5TDR+Q++tIfmvdHKO
         uKaA==
X-Gm-Message-State: AAQBX9clym0xF1VGwy4n11VJCrwimXFemo+M4ahRYIhgGJ/SQXuP/0Ud
	sXS88TwUm0lVE+IGUFqEQV+MuvLJkKdlk7NXmeE=
X-Google-Smtp-Source: AKy350ZqtrqbcCp9+KhQeFSWY+zrsmh0w3Rf/S/91GvGFiZpaC71lBgQZJwHtooaWnwhyLcC8JNVG280dnWU+jMPiQU=
X-Received: by 2002:a81:6788:0:b0:541:6d79:9291 with SMTP id
 b130-20020a816788000000b005416d799291mr1055528ywc.43.1681849553655; Tue, 18
 Apr 2023 13:25:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230416103052.28268-1-christoph.lauer@email.de>
 <27b6976546dae12e92dd3af28f657c02eca4afe8.camel@linuxfoundation.org> <CANPvuRnSPULJzxC0qt=sQLWS5jyx4OkJ2cQobDzHs0LmmBG6MQ@mail.gmail.com>
In-Reply-To: <CANPvuRnSPULJzxC0qt=sQLWS5jyx4OkJ2cQobDzHs0LmmBG6MQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 18 Apr 2023 16:25:42 -0400
Message-ID: <CADkTA4N9Sypxccr0OU6KQxPK5rbsL_mNFGaJ2Zn_jYHL1tNSEg@mail.gmail.com>
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
 <openembedded-core@lists.openembedded.org>; Tue, 18 Apr 2023 20:25:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180200

On Mon, Apr 17, 2023 at 6:31=E2=80=AFPM Jose Quaresma <quaresma.jose@gmail.=
com> wrote:
>
>
>
> Richard Purdie <richard.purdie@linuxfoundation.org> escreveu no dia segun=
da, 17/04/2023 =C3=A0(s) 20:51:
>>
>> On Sun, 2023-04-16 at 12:30 +0200, Christoph Lauer wrote:
>> > From: Christoph Lauer <christoph.lauer@xtronic.de>
>> >
>> > With rm_work active, external module signing throws an error:
>> > scripts/sign-file: error while loading shared libraries: libcrypto.so.=
3: cannot open shared object file: No such file or directory
>> > Preserve libraries that sign-file script needs during runtime.
>> >
>> > Signed-off-by: Christoph Lauer <christoph.lauer@xtronic.de>
>> > ---
>> >  meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb | 3 +++
>> >  1 file changed, 3 insertions(+)
>> >
>> > diff --git a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0=
.bb b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
>> > index 28e0807d1d..0e24efc597 100644
>> > --- a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
>> > +++ b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
>> > @@ -32,3 +32,6 @@ do_configure() {
>> >               -C ${STAGING_KERNEL_DIR} O=3D${STAGING_KERNEL_BUILDDIR} =
$t
>> >       done
>> >  }
>> > +
>> > +# keep native libraries required for module signing
>> > +RM_WORK_EXCLUDE_ITEMS +=3D "recipe-sysroot-native"
>>
>> I'm really reluctant to take this change as it isn't the way
>> dependencies are meant to work.
>>
>> It sounds like something in a shared workdir is depending on something
>> in a recipe workdir and we simply don't support that. Everything needed
>> should be in the shared workdir. At best this is a bandaid and there
>> will be other ways to make this fail such as cleaning make-mod-scripts.
>
>
> The problem is because for signing the kernel modules the sign-file.c [1]=
 is linked dynamically with openssl-native.
> This works when building the in tree kernel modules but will fail when we=
 try to sing any out of tree kernel module.
> To sign the out of tree kernel we will use the binaries from the shared w=
orkdir but the native libcrypto.so.3 is removed by
> the rm_work bbclass. We need to link the sign-file statically otherwise i=
t will not work with the rm_work bbclass.
>
> [1] https://github.com/torvalds/linux/blob/master/scripts/sign-file.c
>
> Another solution for this problem can be changing the make-mod-scripts to=
 be a native tool and in this way
> they will be installed and the dependencies will be handled correctly.

There would very likely be different issues if the scripts were
generated and then packaged as a native tool / package. Since they are
so tightly coupled to the kernel. We'd just trade one set of issues
for another (out of sync artifacts, etc).

I'm going to hack on this a bit.

That being said, I've never done any module signing .. since I don't
need it in my development workflow.

Is there a canonical guide to getting it setup so I can test my static
link and relocated artifacts fixes ? is it with meta-integrity and the
kernel-modsign bbclass ?

Bruce


Bruce

>
>>
>> I'm even less keen to take it when I think it's going to be backported
>> "everywhere" as if is the correct solution too.
>>
>> I don't know what the right fix is unfortunately. I'm sure people would
>> like me to think about it and come up with one but there are simply too
>> many different things people would like me to do that with and even for
>> me, it does take a while to work these things out. I'm just out of
>> bandwidth, sorry :(
>
>
> It is true that it is not the correct solution but it is the most suitabl=
e in my opinion.
> I totally understand what you say and I'm a little sorry that I could sti=
ll help in this same fix.
>
> This problem is something I would also like to fix because I am using the=
 RM_WORK_EXCLUDE
> for quite some time to fix this issue on my distro.
> I would like to convert the make-mod-scripts to be a native tool but I ha=
ven't had time for that either.
>
> Sorry and thank you for all your dedication and help.
>
> Jose
>
>>
>> Cheers,
>>
>> Richard
>>
>>
>>
>>
>>
>
>
> --
> Best regards,
>
> Jos=C3=A9 Quaresma
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#180169): https://lists.openembedded.org/g/openembedde=
d-core/message/180169
> Mute This Topic: https://lists.openembedded.org/mt/98296212/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [br=
uce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

