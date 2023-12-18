Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D4E0C35274
	for <webhook@archiver.kernel.org>; Mon, 18 Dec 2023 18:22:47 +0000 (UTC)
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
 by mx.groups.io with SMTP id smtpd.web10.701.1702923766905321844
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Dec 2023 10:22:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KMFNhxY/;
 spf=pass (domain: gmail.com, ip: 209.85.166.43, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-7b783ee485eso181564339f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 10:22:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702923766; x=1703528566; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EYPOzEBj698mfnDSWTJB81urajP9i0yfEMuRxknAAbk=;
        b=KMFNhxY/BJzV6EWN0nD+buR1WhM2iSnp4qbIk0LHOZewO8PbZTn0w/+LsIcme9eYcg
         GKSyOAccIaUHALszmnA3HnkSTvnvDtC28fsasynG4v91SAvThS0yots6FNLC19lfAADu
         xrTsYlROYXmNm6vUJ4PRlwhsi9tYJgFS/PQka3ahszs6X5pc1EPualNvvLXbLdl8043q
         6RBIs7E+HyCUqySvUKLrF4RLaVQolhXdgZ9hz6q368Arf1gaGLGJ/Q9tD05CdWH0NnlP
         +XKcn5s3+F3qfVzQDBOXQpZXOUlyqbdwzX+4DvCDUcmkeDH0IhdaagV33wydJOQr29MP
         NT4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702923766; x=1703528566;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EYPOzEBj698mfnDSWTJB81urajP9i0yfEMuRxknAAbk=;
        b=XjrUuNRwj9fqjeTFagFHowe+IwBq30ao1wIhPM75hT5moRE+Gb32rQJ1ayv5f3jQW3
         JN1WXsrfLowO/egTwJSPpv6Db1dFgVd9pATjf3aa7rfXI2XZ5OeICeLIBFqEYQis2t7D
         SGuV//p1mBv0lcG+Mo8BcSwtkN2/gGb+ZKr22Nx+i4PlB1EGBGYzD7jzZ24MEh1HRL6J
         xFxV2LlLQv3mlHX73y0jBZEuVzpudFY7Pr5XIYMIsMzEw9tpJ0XqttccvENoQGjOKiqI
         wcrtZvEWH8V8AvKz2SGpKyppkcKIYT5df6pnrVAwzVuwRcX6OEHbJXq6oMUaPdu8/os6
         /RzA==
X-Gm-Message-State: AOJu0Yx5oO/LHhjjqf18fHCVGmM0cY4cVc/t1JelWDAKxKN9ob2xklvy
	YRzQX6D+P5ok80jtr8WbSBi1xD4iEP6Oy/WWN0H5ZggxFdciIg==
X-Google-Smtp-Source: AGHT+IEog/0erXlJ+jc2QwFbt8ddzWhvizz8S3pfL5s8nvJCRXEnCY1qVKHmzUC16M2FC7EvbX5YXFEr0Ah6UwI/lVI=
X-Received: by 2002:a5d:8ad2:0:b0:7b7:aab7:1406 with SMTP id
 e18-20020a5d8ad2000000b007b7aab71406mr4665489iot.40.1702923766052; Mon, 18
 Dec 2023 10:22:46 -0800 (PST)
MIME-Version: 1.0
References: <20231216135306.188070-1-ecordonnier@snap.com> <34bee488217f82e9575f52dff15447474bf63d00.camel@linuxfoundation.org>
 <CAHUKmYY_NE=OEkTQ6qXVxWTs7UuHRK=+2_8FGW4AtJgv77RA9w@mail.gmail.com>
 <CADkTA4Mtai26k4bnGq=P-Hf9bt7XCzH2PFUqtd3K2WpAHZJCmQ@mail.gmail.com> <CAHUKmYbPGRSiyB0VCyvwhqtQH9maCEtpHCjne-GY_PD+MOENiQ@mail.gmail.com>
In-Reply-To: <CAHUKmYbPGRSiyB0VCyvwhqtQH9maCEtpHCjne-GY_PD+MOENiQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 18 Dec 2023 13:22:34 -0500
Message-ID: <CADkTA4MK9_zRLtQAw96Pjq4CNJmLHEL=+4y2GPgH76VnWB8idg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] kernel.bbclass: make do_symlink_kernelsrc reentrant
To: Etienne Cordonnier <ecordonnier@snap.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 18:22:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192676

On Mon, Dec 18, 2023 at 12:39=E2=80=AFPM Etienne Cordonnier
<ecordonnier@snap.com> wrote:
>
> Hi Bruce,
> can you please clarify? Are you saying that you prefer the version of the=
 patch which I pasted with shutil.copytree?
>
> The condition to trigger the issue is not that rare, e.g. anybody updatin=
g from kirkstone 4.0.12 to 4.0.13 and doing an incremental build will get a=
 build failure if S doesn't have the default value (in my case the BSP laye=
r overrides S). In the same way, if we merge the version with shutil.copytr=
ee, people will need to perform a manual clean, or they may get build failu=
res.

For my rarity comment, I meant that it isn't within a typical flow
of bitbaking an image, forcing a task, and bitbaking again. If someone is
doing a meta-layer update, and re-using their build (I have quite literally
7 year old directories like this) then they will run into some issues from =
time
to time (and folks doing this, normally know how to get themselves out
of trouble).

Taking that into consideration, I just mean that I'd be ok with a copy of t=
he
files, as it is really an update to  "the latest structure" and if you are =
doing
it on an existing build, that's one of the consequences.

Bruce

>
> Etienne
>
> On Mon, Dec 18, 2023 at 3:25=E2=80=AFPM Bruce Ashfield <bruce.ashfield@gm=
ail.com> wrote:
>>
>> On Mon, Dec 18, 2023 at 6:45=E2=80=AFAM Etienne Cordonnier via
>> lists.openembedded.org <ecordonnier=3Dsnap.com@lists.openembedded.org>
>> wrote:
>> >
>> > My thinking was that in my local build I was updating from a build wit=
hout https://github.com/yoctoproject/poky/commit/3b8d0acca30c806fb69fc3096d=
41593cc76ed22c to a build containing this commit, so the behavior of do_sym=
link_kernsrc got modified, but my incremental build is not executing the ne=
w version of the code since it detects that the symlink already exists and =
then the rest of the function gets skipped, so I thought this justified a w=
arning.
>> >
>> > I'll lower the warning to info, but then this assumes that we will nev=
er modify do_symlink_kernsrc in a way which is not backwards-compatible.
>> >
>> > @Richard: the reason I didn't go for the copy to "orig" is that I don'=
t see a way to add this without breaking incremental builds (where s is a s=
ymlink to kernsrc which is potentially modified already by do_patch etc.). =
However I think it would be a cleaner solution than simply skipping the cod=
e like I did:
>>
>> If the only way to trigger the issue is through really rare pre-<some
>> commit> to post
>> that commit that happens to modify the detection/manipulation/other of S=
 and the
>> symlink, then it is rare enough to just drop an info message breadcrumb =
and keep
>> moving.
>>
>> But if it really is a rare situation like you ran into, or some sort
>> of forced execution
>> of the task, I don't think that a copy would be an unexpected thing to h=
appen.
>>
>> Bruce
>>
>> >
>> > -        if d.getVar("EXTERNALSRC"):
>> > +        if d.getVar("EXTERNALSRC") and not os.path.islink(s):
>> >              # With EXTERNALSRC S will not be wiped so we can symlink =
to it
>> >              os.symlink(s, kernsrc)
>> >          else:
>> >              import shutil
>> > +            s_copy =3D s + ".orig"
>> > +            if not os.path.isdir(s_copy):
>> > +                shutil.copytree(s, s_copy)
>> > +            bb.utils.remove(s, recurse=3DTrue)
>> > +            shutil.copytree(s_copy, s)
>> >
>> > Etienne
>> >
>> >
>> > On Sun, Dec 17, 2023 at 8:52=E2=80=AFPM Richard Purdie <richard.purdie=
@linuxfoundation.org> wrote:
>> >>
>> >> On Sat, 2023-12-16 at 14:53 +0100, Etienne Cordonnier via
>> >> lists.openembedded.org wrote:
>> >> > From: Etienne Cordonnier <ecordonnier@snap.com>
>> >> >
>> >> > The function do_symlink_kernsrc is not reentrant in the case where =
S is defined
>> >> > to a non-default value. This causes build-failures e.g. when buildi=
ng linux-yocto, then updating
>> >> > poky to a commit which modifies kernel.bbclass, and then building l=
inux-yocto again.
>> >> >
>> >> > Bugzilla: https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__bu=
gzilla.yoctoproject.org_show-5Fbug.cgi-3Fid-3D15325&d=3DDwIFaQ&c=3DncDTmphk=
JTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkS=
Ga66m67E&m=3DqcRut2Wm9dH26YP_YovPl6QVczLOYUxs1xfzA75ZJBiHj4dWwxbAS-2JjGPlyi=
yS&s=3D_WTBsDroHfmiIIyCOXRV2CAId9PmKZ4sN3bRO3EOcyU&e=3D
>> >> >
>> >> > Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
>> >> > ---
>> >> >  meta/classes-recipe/kernel.bbclass | 5 +++++
>> >> >  1 file changed, 5 insertions(+)
>> >> >
>> >> > diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-reci=
pe/kernel.bbclass
>> >> > index 9ff37f5c38..130bedd901 100644
>> >> > --- a/meta/classes-recipe/kernel.bbclass
>> >> > +++ b/meta/classes-recipe/kernel.bbclass
>> >> > @@ -194,6 +194,11 @@ python do_symlink_kernsrc () {
>> >> >              os.symlink(s, kernsrc)
>> >> >          else:
>> >> >              import shutil
>> >> > +            if os.path.islink(s):
>> >> > +                # this happens for instance when a poky update for=
ces symlink_kernsrc to run again
>> >> > +                # after s was already moved to kernsrc
>> >> > +                bb.warn("%s is already a symlink! Not symlinking k=
ernel sources" % s)
>> >> > +                return 0
>> >> >              shutil.move(s, kernsrc)
>> >> >              os.symlink(kernsrc, s)
>> >> >  }
>> >>
>> >> Usually what we recommend is that the first pass does something if "i=
f
>> >> not exists X.org; cp X X.orig; fi", then you can always copy from
>> >> X.orig.
>> >>
>> >> As Bruce says, it definitely shouldn't be a warning, this can happen
>> >> quite normally.
>> >>
>> >> Cheers,
>> >>
>> >> Richard
>> >
>> >
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> > Links: You receive all messages sent to this group.
>> > View/Reply Online (#192635): https://urldefense.proofpoint.com/v2/url?=
u=3Dhttps-3A__lists.openembedded.org_g_openembedded-2Dcore_message_192635&d=
=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGR=
fPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3D82QaxN_7mSeykh83DV-qNXJc9JezHaPCHv4jG2rr=
q55pywmZCA6Nz75KaUoSuFn8&s=3DxGE3OScznEMBXLhPR_DdKU6FPE6dbxsHXhKnfksbT8U&e=
=3D
>> > Mute This Topic: https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A=
__lists.openembedded.org_mt_103208527_1050810&d=3DDwIFaQ&c=3DncDTmphkJTvjID=
Ph0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m6=
7E&m=3D82QaxN_7mSeykh83DV-qNXJc9JezHaPCHv4jG2rrq55pywmZCA6Nz75KaUoSuFn8&s=
=3DGX9x-WmhPnkZRNBnirDhR76l6Laww76WDH7ZwKCFSKQ&e=3D
>> > Group Owner: openembedded-core+owner@lists.openembedded.org
>> > Unsubscribe: https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__li=
sts.openembedded.org_g_openembedded-2Dcore_unsub&d=3DDwIFaQ&c=3DncDTmphkJTv=
jIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa6=
6m67E&m=3D82QaxN_7mSeykh83DV-qNXJc9JezHaPCHv4jG2rrq55pywmZCA6Nz75KaUoSuFn8&=
s=3DroqLGNR0ewaxjmAl_ZE8nSZf_6sCh3yj7LXuITei5EA&e=3D  [bruce.ashfield@gmail=
.com]
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> >
>>
>>
>> --
>> - Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end
>> - "Use the force Harry" - Gandalf, Star Trek II



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

