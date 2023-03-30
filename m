Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAE37C6FD1D
	for <webhook@archiver.kernel.org>; Thu, 30 Mar 2023 20:20:53 +0000 (UTC)
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
 by mx.groups.io with SMTP id smtpd.web11.37672.1680207649219444105
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Mar 2023 13:20:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eXSwD3Jo;
 spf=pass (domain: gmail.com, ip: 209.85.166.43, mailfrom: alex.kiernan@gmail.com)
Received: by mail-io1-f43.google.com with SMTP id bl9so8818963iob.8
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 13:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680207648;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f9uyyuhnON04PGvic5k1+e4Xl+ndTKVH74pjzU1qvVE=;
        b=eXSwD3JogiL4AfRwDsPvDVgBYj7O9FabB19NZVr/CtRkls7WYcqX1pVmVpwkuZiwz3
         UF+vnlZDT83CcZ9lQJCLUmQKA8ioYGYlDjwlUBdIwlchik2+vyncCNFABA8tAI1OEdZE
         r0r9Useuq7Of0eAwoolr+YeCAvsxBvyKMlHTlpn/ciJ9KzpXysrio3j+rZ99lfKJhE1j
         Da1N8X2CZsvcsx6l3UNEqv48s2hy6z7KktAAY2rUnb2W9V5C9GQL26XSs6IUE0w9sUdH
         T7Ud6yhGyjRiwzm98TU+DYLLDI4x9K3Zg8ajiTL+sWusMO7uzpQ1SXeLtwtivIVHQ0Wd
         Rurg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680207648;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f9uyyuhnON04PGvic5k1+e4Xl+ndTKVH74pjzU1qvVE=;
        b=DagXpTEYbNwtGNdI8TC1cIu896LBSGyFCKnI+KYDwXuTqmH1GYmtwpA2yRZ8up86S7
         Kcgj/FwyJSvCCK+YhP9Mb4zxXX3x4hTRf8MUx3rH1JWW+pH0Q0kdQI3puNPOZoYwOKjb
         P2KL/e0T903Bb62pOyngUBYN/nxIs/l9z2LBHR0SbNh+N5tG5YJRpJb92010Q011Bf4e
         cuX/zHsAa85eiUwRrPVvzrgtM2WLbeZqlqEGTmvmC4o0zMebwbUBDmUwcqB8OPfP+3mw
         tMKzolI6YvT0MjKbYIx6f6lRr6DFfcfFUCFWQR08ADegqfUza5WBDIihR72yzDO35eLX
         0qhw==
X-Gm-Message-State: AO0yUKVUntO9g0QRwN8SeuLPtBBGO1t2TdEJkpx/XESANpHFkY9L1/Z1
	ZtKQko7Duxz+3vKJvivnrkDuKkLLRX04Djc/L7Q=
X-Google-Smtp-Source: AK7set8+gwPSkKHi/ZaXnIaRuQ7qb0qoN3rQAErCL7L/uvWc/TThu2SOFGFh+Dz+hjtsyz6IjxuYRaBlS+xBoZLnz/s=
X-Received: by 2002:a02:b103:0:b0:406:35e8:51e6 with SMTP id
 r3-20020a02b103000000b0040635e851e6mr9718936jah.1.1680207648057; Thu, 30 Mar
 2023 13:20:48 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1680190966.git.frederic.martinsons@gmail.com>
 <6279ccad3163dca527872a9144d63fb8f07c6f0e.1680190966.git.frederic.martinsons@gmail.com>
 <CAO5Uq5Sgt7EwB2DN_r2bB9nt7XQ_qi3SNrhbrVvB6Bru-XsjXw@mail.gmail.com> <CA+chaQc24hyg7mTKA+BkeTSPBT3bnuc8K0NcUHVZFS8obXrYew@mail.gmail.com>
In-Reply-To: <CA+chaQc24hyg7mTKA+BkeTSPBT3bnuc8K0NcUHVZFS8obXrYew@mail.gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Thu, 30 Mar 2023 21:20:36 +0100
Message-ID: <CAO5Uq5SKpW1Xh6Md1W01MdgwJG4n63P=eJKTM3G3t2_SxdMcKw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH V5 6/6] cargo-update-recipe-crates: don't walk
 on the whole dir
To: Martin Jansa <martin.jansa@gmail.com>
Cc: frederic.martinsons@gmail.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 20:20:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179357

Oh my word... I wonder if we need to introspect what cargo does (a la
cargo bitbake) to get this kind of thing right?

On Thu, Mar 30, 2023 at 8:23=E2=80=AFPM Martin Jansa <martin.jansa@gmail.co=
m> wrote:
>
> I don't remember the exact details now, but when I was working on updatin=
g solana recipes to use this
> https://github.com/webosose/meta-webosose/commit/9bdfae7988077d0211eeee79=
cc339d0770cd86b4
>
> the S was pointing to just some subdirectory and multiple Cargo.locks fil=
es were parsed in other directories as well, that's why I was adding
> https://git.openembedded.org/openembedded-core/commit/meta/classes-recipe=
/cargo-update-recipe-crates.bbclass?id=3D7636a2b8080521ed2ad54b0edce47a8742=
a12d58
>
> in the end I've changed to use the root directory in S and just set CARGO=
_SRC_DIR to right subdirectory to build.
>
> I don't have much experience with crates other than these solana recipes,=
 but isn't there some valid use-case for multiple Cargo.locks?
> I assume Alex in original implementation didn't use the os.walk just to m=
ake it more complicated :).
>
> And FWIW when trying to regenerate these .inc files with current master a=
nd with:
> $ bitbake -c update_crates solana-keygen
> it fails with:
> ERROR: solana-keygen-1.14.5-r0 do_fetch: No checksum specified for '/OE/l=
ge/build/webos/mickledore/downloads/Inflector-0.11.4.crate', please add at =
least one to the recipe:
> SRC_URI[Inflector.sha256sum] =3D "fe438c63458706e03479442743baae6c8825649=
8e6431708f6dfc520a26515d3"
> ERROR: solana-keygen-1.14.5-r0 do_fetch: Bitbake Fetcher Error: NoChecksu=
mError('Missing SRC_URI checksum', 'https://crates.io/api/v1/crates/Inflect=
or/0.11.4/download')
>
> Isn't it an chicken&egg issue now when do_fetch enforces checksums to be =
used? Or am I just missing some of the pending changes or just using it inc=
orrectly?
>
>
> On Thu, Mar 30, 2023 at 6:34=E2=80=AFPM Alex Kiernan <alex.kiernan@gmail.=
com> wrote:
>>
>> On Thu, Mar 30, 2023 at 4:45=E2=80=AFPM <frederic.martinsons@gmail.com> =
wrote:
>> >
>> > From: Frederic Martinsons <frederic.martinsons@gmail.com>
>> >
>> > There is no need to do such things, Cargo.lock file
>> > has to be at the root of CARGO_LOCK_SRC_DIR.
>> > This avoid finding other possible Cargo.lock that
>> > would be in subdir (for example if a patch is applied
>> > on the recipe, we can have .pc subdir in S and a Cargo.lock
>> > can be there)
>> >
>> > Signed-off-by: Frederic Martinsons <frederic.martinsons@gmail.com>
>> > ---
>> >  .../cargo-update-recipe-crates.bbclass               | 12 ++++++++---=
-
>> >  1 file changed, 8 insertions(+), 4 deletions(-)
>> >
>> > diff --git a/meta/classes-recipe/cargo-update-recipe-crates.bbclass b/=
meta/classes-recipe/cargo-update-recipe-crates.bbclass
>> > index daa363b0dd..549cfe627e 100644
>> > --- a/meta/classes-recipe/cargo-update-recipe-crates.bbclass
>> > +++ b/meta/classes-recipe/cargo-update-recipe-crates.bbclass
>> > @@ -68,10 +68,14 @@ def get_crates(f):
>> >  import os
>> >  crates =3D "# Autogenerated with 'bitbake -c update_crates ${PN}'\n\n=
"
>> >  found =3D False
>> > -for root, dirs, files in os.walk('${CARGO_LOCK_SRC_DIR}'):
>> > -    for file in files:
>> > -        if file =3D=3D 'Cargo.lock':
>> > -            crates +=3D get_crates(os.path.join(root, file))
>> > +for file in os.listdir('${CARGO_LOCK_SRC_DIR}'):
>> > +    if file =3D=3D 'Cargo.lock':
>> > +        try:
>> > +            cargo_lock_path =3D os.path.join('${CARGO_LOCK_SRC_DIR}',=
 file)
>> > +            crates +=3D get_crates(cargo_lock_path)
>> > +        except Exception as e:
>> > +            raise ValueError("Cannot parse '%s'" % cargo_lock_path) f=
rom e
>> > +        else:
>> >              found =3D True
>> >  if not found:
>> >      raise ValueError("Unable to find Cargo.lock in ${CARGO_LOCK_SRC_D=
IR}")
>>
>> Isn't this just a long-winded version of something like this
>> (completely untested):
>>
>> diff --git a/meta/classes-recipe/cargo-update-recipe-crates.bbclass
>> b/meta/classes-recipe/cargo-update-recipe-crates.bbclass
>> index daa363b0dd65..22ddcfa5c1e3 100644
>> --- a/meta/classes-recipe/cargo-update-recipe-crates.bbclass
>> +++ b/meta/classes-recipe/cargo-update-recipe-crates.bbclass
>> @@ -67,14 +67,7 @@ def get_crates(f):
>>
>>  import os
>>  crates =3D "# Autogenerated with 'bitbake -c update_crates ${PN}'\n\n"
>> -found =3D False
>> -for root, dirs, files in os.walk('${CARGO_LOCK_SRC_DIR}'):
>> -    for file in files:
>> -        if file =3D=3D 'Cargo.lock':
>> -            crates +=3D get_crates(os.path.join(root, file))
>> -            found =3D True
>> -if not found:
>> -    raise ValueError("Unable to find Cargo.lock in ${CARGO_LOCK_SRC_DIR=
}")
>> +crates +=3D get_crates(os.path.join("${CARGO_LOCK_SRC_DIR}", "Cargo.loc=
k"))
>>  open("${TARGET_FILE}", 'w').write(crates)
>>  EOF
>>
>> --
>> Alex Kiernan
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#179344): https://lists.openembedded.org/g/openembedd=
ed-core/message/179344
>> Mute This Topic: https://lists.openembedded.org/mt/97953740/3617156
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [M=
artin.Jansa@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>


--=20
Alex Kiernan

