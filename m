Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D78C5C35274
	for <webhook@archiver.kernel.org>; Mon, 18 Dec 2023 14:25:45 +0000 (UTC)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
 by mx.groups.io with SMTP id smtpd.web10.44596.1702909542224763213
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Dec 2023 06:25:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KyWjwfg7;
 spf=pass (domain: gmail.com, ip: 209.85.219.180, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-dbcdfad714aso2199236276.3
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 06:25:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702909541; x=1703514341; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w1726jYY4HGtSrCHto0nCQVH0b4tX/EYpenexdNa+2w=;
        b=KyWjwfg7u8M0S6Cv41SBvtqXQQuYC4UJ5Wgw3LpKXLD0QV5WrM48aCHUmlS8iwnK1e
         as/tGuAN49eKPWWuGDZHTUMaRCdn7QdvOkPsFLVdJOonBxL9mfm6VTIKxSehyHiuWoUO
         nHr34eCiL2heuSgQU8DiYvkzDpmjrqqURHO5YWCx2gBAnca1TgE2IIOEFwTF1GTDSYzK
         6u+/t7gBPhH+QHPv1PIwebrlyA9l1KsfVady9kqucuL0c8mIhZEObo73TiGihZrXubip
         vb1cMbKJ0Jfg6Fx1xwsuBwafMOxzeSZ2Z1GJ01X+jcNHVI0Aa9bwfOjuABJpyXCKTgdb
         SqFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702909541; x=1703514341;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w1726jYY4HGtSrCHto0nCQVH0b4tX/EYpenexdNa+2w=;
        b=Aiyf/b+TZVRNa1nNjj6zcmHFtdzxZzMSVqypQc9pMe3LI1s6yE1yN2vQ4Ta4LPhJn6
         9WImb+Aoe0RItLXkOj+GsadYaGivmlwUKFmKVXhkA99zyP/YZXtfUFSpM4E3AdzaiaO8
         CQ1QTeBy4VB0QNUg1HUZaDWaKLTJD0fXqTbLRS2PBT+HeAHgLEUvA2D7jyXLpow3I6G/
         Xz7t+vo9W5bfJrrWyg6U5zTpN2WtD4oIWvGy9g/RWZPfS9n7S8QDHRfAht8XEvHHxews
         +6Zjvbepb4iuue9F85gSxTRxmnIAmDY4m12T1DmVIOSZ8dpmd/7YbTfOdMFe8/C9R+dP
         wJXA==
X-Gm-Message-State: AOJu0YxQYu3ow2G3wiMcT9He+HA0WlGTpeEKbWVWuf0ERq1fIlq04OQh
	MmPyhAHkoOGze4xgJsd8RjXRYGZVHaRPf3TdEnE=
X-Google-Smtp-Source: AGHT+IGa8C2UfpzOdk6hrIii6ML68r4chc9I1HZq0GQl1W2DEuEzuRWbqxygd4piswLAVAqb8/j6f02ZZyDkpMytrsg=
X-Received: by 2002:a25:3410:0:b0:dbc:e343:129d with SMTP id
 b16-20020a253410000000b00dbce343129dmr3801881yba.26.1702909541040; Mon, 18
 Dec 2023 06:25:41 -0800 (PST)
MIME-Version: 1.0
References: <20231216135306.188070-1-ecordonnier@snap.com> <34bee488217f82e9575f52dff15447474bf63d00.camel@linuxfoundation.org>
 <CAHUKmYY_NE=OEkTQ6qXVxWTs7UuHRK=+2_8FGW4AtJgv77RA9w@mail.gmail.com>
In-Reply-To: <CAHUKmYY_NE=OEkTQ6qXVxWTs7UuHRK=+2_8FGW4AtJgv77RA9w@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 18 Dec 2023 09:25:29 -0500
Message-ID: <CADkTA4Mtai26k4bnGq=P-Hf9bt7XCzH2PFUqtd3K2WpAHZJCmQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] kernel.bbclass: make do_symlink_kernelsrc reentrant
To: ecordonnier@snap.com
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 14:25:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192644

On Mon, Dec 18, 2023 at 6:45=E2=80=AFAM Etienne Cordonnier via
lists.openembedded.org <ecordonnier=3Dsnap.com@lists.openembedded.org>
wrote:
>
> My thinking was that in my local build I was updating from a build withou=
t https://github.com/yoctoproject/poky/commit/3b8d0acca30c806fb69fc3096d415=
93cc76ed22c to a build containing this commit, so the behavior of do_symlin=
k_kernsrc got modified, but my incremental build is not executing the new v=
ersion of the code since it detects that the symlink already exists and the=
n the rest of the function gets skipped, so I thought this justified a warn=
ing.
>
> I'll lower the warning to info, but then this assumes that we will never =
modify do_symlink_kernsrc in a way which is not backwards-compatible.
>
> @Richard: the reason I didn't go for the copy to "orig" is that I don't s=
ee a way to add this without breaking incremental builds (where s is a syml=
ink to kernsrc which is potentially modified already by do_patch etc.). How=
ever I think it would be a cleaner solution than simply skipping the code l=
ike I did:

If the only way to trigger the issue is through really rare pre-<some
commit> to post
that commit that happens to modify the detection/manipulation/other of S an=
d the
symlink, then it is rare enough to just drop an info message breadcrumb and=
 keep
moving.

But if it really is a rare situation like you ran into, or some sort
of forced execution
of the task, I don't think that a copy would be an unexpected thing to happ=
en.

Bruce

>
> -        if d.getVar("EXTERNALSRC"):
> +        if d.getVar("EXTERNALSRC") and not os.path.islink(s):
>              # With EXTERNALSRC S will not be wiped so we can symlink to =
it
>              os.symlink(s, kernsrc)
>          else:
>              import shutil
> +            s_copy =3D s + ".orig"
> +            if not os.path.isdir(s_copy):
> +                shutil.copytree(s, s_copy)
> +            bb.utils.remove(s, recurse=3DTrue)
> +            shutil.copytree(s_copy, s)
>
> Etienne
>
>
> On Sun, Dec 17, 2023 at 8:52=E2=80=AFPM Richard Purdie <richard.purdie@li=
nuxfoundation.org> wrote:
>>
>> On Sat, 2023-12-16 at 14:53 +0100, Etienne Cordonnier via
>> lists.openembedded.org wrote:
>> > From: Etienne Cordonnier <ecordonnier@snap.com>
>> >
>> > The function do_symlink_kernsrc is not reentrant in the case where S i=
s defined
>> > to a non-default value. This causes build-failures e.g. when building =
linux-yocto, then updating
>> > poky to a commit which modifies kernel.bbclass, and then building linu=
x-yocto again.
>> >
>> > Bugzilla: https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__bugzi=
lla.yoctoproject.org_show-5Fbug.cgi-3Fid-3D15325&d=3DDwIFaQ&c=3DncDTmphkJTv=
jIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa6=
6m67E&m=3DqcRut2Wm9dH26YP_YovPl6QVczLOYUxs1xfzA75ZJBiHj4dWwxbAS-2JjGPlyiyS&=
s=3D_WTBsDroHfmiIIyCOXRV2CAId9PmKZ4sN3bRO3EOcyU&e=3D
>> >
>> > Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
>> > ---
>> >  meta/classes-recipe/kernel.bbclass | 5 +++++
>> >  1 file changed, 5 insertions(+)
>> >
>> > diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/=
kernel.bbclass
>> > index 9ff37f5c38..130bedd901 100644
>> > --- a/meta/classes-recipe/kernel.bbclass
>> > +++ b/meta/classes-recipe/kernel.bbclass
>> > @@ -194,6 +194,11 @@ python do_symlink_kernsrc () {
>> >              os.symlink(s, kernsrc)
>> >          else:
>> >              import shutil
>> > +            if os.path.islink(s):
>> > +                # this happens for instance when a poky update forces=
 symlink_kernsrc to run again
>> > +                # after s was already moved to kernsrc
>> > +                bb.warn("%s is already a symlink! Not symlinking kern=
el sources" % s)
>> > +                return 0
>> >              shutil.move(s, kernsrc)
>> >              os.symlink(kernsrc, s)
>> >  }
>>
>> Usually what we recommend is that the first pass does something if "if
>> not exists X.org; cp X X.orig; fi", then you can always copy from
>> X.orig.
>>
>> As Bruce says, it definitely shouldn't be a warning, this can happen
>> quite normally.
>>
>> Cheers,
>>
>> Richard
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#192635): https://lists.openembedded.org/g/openembedde=
d-core/message/192635
> Mute This Topic: https://lists.openembedded.org/mt/103208527/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [br=
uce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

