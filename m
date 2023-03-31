Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52466C6FD18
	for <webhook@archiver.kernel.org>; Fri, 31 Mar 2023 05:32:36 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web11.48020.1680240754845922231
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Mar 2023 22:32:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cUaUgyTj;
 spf=pass (domain: gmail.com, ip: 209.85.208.176, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id q14so21862171ljm.11
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 22:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680240753;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=l6lqmJeRDpSpCBrWvcAyaXNdwGyY9n3YvT5ZBp0Z6CY=;
        b=cUaUgyTjZZ12V0f5KQ6WdmqNBI33anJiO8MVSOJZgkVxIkBUjU0UB0k8LuZnXE27Fk
         VXzMMOpeYB6SYKSRdjiPeLM2BZuGf+URJ7F63NlHantuhdUilEde7QbI/4FGwkv1eHj2
         m6YR7ldUFPHiLnMi4BVCeLnTVu85sZIr+5IjkS7df0Cdkz1JonwfNKG7A5907nTna7Jb
         Sj03/nie6muCClBZxadkhpQlNNrPXwf7CzoXYVtZkS7xUOELVX2A0cmDhA66IDn6Xml4
         yhEhLgy0mIQWc+QBz12WguF7GviOkv+gEp+u9zrkpsOCKsOod67+IOR42tKmC4iJ3A6T
         TGhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680240753;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l6lqmJeRDpSpCBrWvcAyaXNdwGyY9n3YvT5ZBp0Z6CY=;
        b=qhQyr/HtSuwqEr3AnBYycIsKFhm8rsd+Yw4N8wdtnE0DfPNxp/YY+to3YiEvwHplps
         rix5EfbrlEu12/i3n6YtrlAPljGNN9MV48qw40k6Z1kkrRinEfaWKOLEXIlqSirhuhnL
         vEeh5eyJ0MGBffC8GemA570Q7QCfkOBOAmL72PGyjqvh3CL9koYt0fUwnMg4vrjq4Kd3
         lWnUywyigFKpM23s6+UibtW4hNOjnXyH18tLVbqXPGZ1F4XTYhfL08SeFDsdi/KoqeZ4
         LOcDWsgokDYNix6sCW9HsTkbw7HHRLJ/PoO6uebBLR/3wgnNJHwHCSyctERxROb1xtLa
         V8Fw==
X-Gm-Message-State: AAQBX9eYE8e/gIsRhGMb4vovcRVQXZllOj+9DdCMnCgvrYeKjFJz79yh
	xiTgLKbu4n/Seynppdx85JePvoeIe9av7Ts5X+4=
X-Google-Smtp-Source: AKy350bBT51Qsqwx9a32/Jw/LrdGSCTdXGgnv/EdqiLPq6aAA5QnrzOVRSLbA+0KZk37i2EXrb4g6sr5TfEBJg9S3/s=
X-Received: by 2002:a05:651c:c1:b0:29a:a76a:194b with SMTP id
 1-20020a05651c00c100b0029aa76a194bmr3506875ljr.3.1680240752666; Thu, 30 Mar
 2023 22:32:32 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1680190966.git.frederic.martinsons@gmail.com>
 <6279ccad3163dca527872a9144d63fb8f07c6f0e.1680190966.git.frederic.martinsons@gmail.com>
 <CAO5Uq5Sgt7EwB2DN_r2bB9nt7XQ_qi3SNrhbrVvB6Bru-XsjXw@mail.gmail.com>
 <CA+chaQc24hyg7mTKA+BkeTSPBT3bnuc8K0NcUHVZFS8obXrYew@mail.gmail.com>
 <CA+cAkerB9D=iztBn_VQDPQyDZUp5rMtfj=CwuU4aeFL=RDERbQ@mail.gmail.com>
 <CA+cAkeobeK=g_oGJvOsLEMDtcuBVwrFKuyU6gR-z1GmB+Sv2Qg@mail.gmail.com>
 <17514C0A502D4FD8.27612@lists.openembedded.org> <CA+chaQc5OdQ3esOkDA=JkvuRGp9fZNjfscZFcvoqbimdak1BfQ@mail.gmail.com>
In-Reply-To: <CA+chaQc5OdQ3esOkDA=JkvuRGp9fZNjfscZFcvoqbimdak1BfQ@mail.gmail.com>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Fri, 31 Mar 2023 07:32:21 +0200
Message-ID: <CA+cAkeqV++vbgkj_uz5fbMta5DKe36=7e1RJoJXSTLKjT5wKxQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH V5 6/6] cargo-update-recipe-crates: don't walk
 on the whole dir
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Alex Kiernan <alex.kiernan@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000332c6a05f82b89bc"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Mar 2023 05:32:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179391

--000000000000332c6a05f82b89bc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

The multiple Cargo.lock seems totally valid, a project can have multiple
binaries provided (which is the case for Solana cli suite) so I'll submit a
new v6 of my series to reflect that, I just have to ignored specify dirs
like .git (no use to walk inside it) or .pc (can contains a patched
Cargo.lock that would be redundant and syntaxically invalid )

I'll also override the crate names with their version for all the crates
found.

For the chicken and eggs issue, I need to think more of it (maybe make
bitbake print the list of all missing checksum  would be enough) and, in
order to not delay this series, I'll submit a separate bitbake patch if I
manage to find something suitable.

Many thanks for the comments Martin.

Le jeu. 30 mars 2023, 23:15, Martin Jansa <martin.jansa@gmail.com> a =C3=A9=
crit :

> I've added the updated .inc files to meta-webosose fork if it's easier to
> see there:
>
> https://github.com/shr-project/meta-webosose/commits/master-2023-03-30
> (top 2 commits)
>
> this checksum mismatch is also the reason for that ugly exception as
> explained in top commit, it's race-condition between sugar.do_unpack and
> solana-cli.do_fetch where sugar has right arrayvec 0.7.2 with right
> checksum in do_unpack, while solana-cli renames it to _bad-checksum_
> suffix, because solana-cli looks for checksum of arrayvec 0.7.1.
>
> I've tried to manually add name=3D param to verify this, but there are to=
o
> many :), so I'll update the bbclass to always add name with version even =
if
> it doesn't see duplicated crates (and then this can be improved if multip=
le
> Cargo.lock files really need to be supported).
>
> I honestly don't know, I've was only working on these solana recipes for
> short time and wanted to offer them more as strange example.
>
> Cheers,
>
> On Thu, Mar 30, 2023 at 10:22=E2=80=AFPM Martin Jansa via lists.openembed=
ded.org
> <Martin.Jansa=3Dgmail.com@lists.openembedded.org> wrote:
>
>> On Thu, Mar 30, 2023 at 10:07=E2=80=AFPM Fr=C3=A9d=C3=A9ric Martinsons <
>> frederic.martinsons@gmail.com> wrote:
>>
>>> By the way, about this "chickens and eggs" problem, isn't it the same
>>> for a regular recipe you just upgraded?
>>>
>>
>> I don't know, I haven't upgraded a recipe with crates yet :)
>>
>> It's just this time I was aware that the .inc file will need to be
>> refreshed and it wasn't obvious at first that easiest way to avoid do_fe=
tch
>> issue blocking .inc refresh is to remove all crates first by emptying .i=
nc
>> file.
>>
>> Personnaly, when I update a recipe, I let bitbake tell me what is the ne=
w
>>> checksum expected and put it the recipe (as the error message says).
>>>
>>
>> For regular recipes with a few checksum I do the same. But it doesn't
>> scale here as you mention bellow.
>> as it reported only the first wrong checksum from MANY.
>>
>> But I'm aware this is not exactly the same, since a cargo based recipe
>>> could contain a ton of crate:// uri and if you apply this method, you h=
ave
>>> to copy the new checksum one by one, bitbake error after another...
>>>
>>> Don't know how to make this better and I plead guilty for not mentionin=
g
>>> that in a dedicated commit message.
>>>
>>
>> Better late than never, you can include it in v6 of this patch (I have
>> read the git log of the .bbclass before going to refresh the .inc files,=
 so
>> others might notice it there as well).
>>
>> Of course, if someone come up with a smoothier way of doing this, I'll
>>> make a new patch.
>>>
>>
>> I think I found what the other issue with arrayvec create was:
>>
>> meta-webos/recipes-upstreamable/solana/solana-crates.inc:    crate://
>> crates.io/arrayvec/0.7.2 \
>> meta-webos/recipes-upstreamable/solana/solana-crates.inc:SRC_URI[arrayve=
c.sha256sum]
>> =3D "8da52d66c7071e2e3fa2a1e5c6d088fec47b593032b254f5e980de8ea54454d6"
>> meta-webos/recipes-upstreamable/solana/solana-crates.inc:    crate://
>> crates.io/arrayvec/0.7.1 \
>> meta-webos/recipes-upstreamable/solana/solana-crates.inc:SRC_URI[arrayve=
c.sha256sum]
>> =3D "be4dc07131ffa69b8072d35f5007352af944213cde02545e2103680baed38fcd"
>> meta-webos/recipes-upstreamable/sugar/sugar-crates.inc:    crate://
>> crates.io/arrayvec/0.7.2 \
>> meta-webos/recipes-upstreamable/sugar/sugar-crates.inc:SRC_URI[arrayvec.=
sha256sum]
>> =3D "8da52d66c7071e2e3fa2a1e5c6d088fec47b593032b254f5e980de8ea54454d6"
>>
>> So different Cargo.lock files included in the same ${S} have different
>> version, but in this case it didn't set different name parameter, probab=
ly
>> because different Cargo.lock files are processed separately?
>>
>> Thanks
>>
>> Le jeu. 30 mars 2023, 21:50, Fr=C3=A9d=C3=A9ric Martinsons <
>>> frederic.martinsons@gmail.com> a =C3=A9crit :
>>>
>>>> Well I see what you mean, I'll take a look at your example to try to
>>>> find out if multiple Cargo.lock could be expected.
>>>>
>>>> And for your second remark, yes, there is a chicken and eggs issue for
>>>> updating crates checksum from scratch.
>>>> You didn't miss anything, I came across this when updating crates
>>>> checksum that was "pristine"
>>>>  and I only manage to execute update_crates by locally patching
>>>> bitbake/lib/bb/fetch2/crate.py for
>>>> recommends_checksum method to return False .
>>>> I'm aware that is not ideal but I don't know how to make this better
>>>> (maybe make do_update_crates
>>>> after do_fetch instead of after do_patch ? )
>>>>
>>>>
>>>> Le jeu. 30 mars 2023, 21:23, Martin Jansa <martin.jansa@gmail.com> a
>>>> =C3=A9crit :
>>>>
>>>>> I don't remember the exact details now, but when I was working on
>>>>> updating solana recipes to use this
>>>>>
>>>>> https://github.com/webosose/meta-webosose/commit/9bdfae7988077d0211ee=
ee79cc339d0770cd86b4
>>>>>
>>>>> the S was pointing to just some subdirectory and multiple Cargo.locks
>>>>> files were parsed in other directories as well, that's why I was addi=
ng
>>>>>
>>>>> https://git.openembedded.org/openembedded-core/commit/meta/classes-re=
cipe/cargo-update-recipe-crates.bbclass?id=3D7636a2b8080521ed2ad54b0edce47a=
8742a12d58
>>>>>
>>>>> in the end I've changed to use the root directory in S and just
>>>>> set CARGO_SRC_DIR to right subdirectory to build.
>>>>>
>>>>> I don't have much experience with crates other than these solana
>>>>> recipes, but isn't there some valid use-case for multiple Cargo.locks=
?
>>>>> I assume Alex in original implementation didn't use the os.walk just
>>>>> to make it more complicated :).
>>>>>
>>>>> And FWIW when trying to regenerate these .inc files with current
>>>>> master and with:
>>>>> $ bitbake -c update_crates solana-keygen
>>>>> it fails with:
>>>>> ERROR: solana-keygen-1.14.5-r0 do_fetch: No checksum specified for
>>>>> '/OE/lge/build/webos/mickledore/downloads/Inflector-0.11.4.crate', pl=
ease
>>>>> add at least one to the recipe:
>>>>> SRC_URI[Inflector.sha256sum] =3D
>>>>> "fe438c63458706e03479442743baae6c88256498e6431708f6dfc520a26515d3"
>>>>> ERROR: solana-keygen-1.14.5-r0 do_fetch: Bitbake Fetcher Error:
>>>>> NoChecksumError('Missing SRC_URI checksum', '
>>>>> https://crates.io/api/v1/crates/Inflector/0.11.4/download')
>>>>>
>>>>> Isn't it an chicken&egg issue now when do_fetch enforces checksums to
>>>>> be used? Or am I just missing some of the pending changes or just usi=
ng it
>>>>> incorrectly?
>>>>>
>>>>>
>>>>> On Thu, Mar 30, 2023 at 6:34=E2=80=AFPM Alex Kiernan <alex.kiernan@gm=
ail.com>
>>>>> wrote:
>>>>>
>>>>>> On Thu, Mar 30, 2023 at 4:45=E2=80=AFPM <frederic.martinsons@gmail.c=
om>
>>>>>> wrote:
>>>>>> >
>>>>>> > From: Frederic Martinsons <frederic.martinsons@gmail.com>
>>>>>> >
>>>>>> > There is no need to do such things, Cargo.lock file
>>>>>> > has to be at the root of CARGO_LOCK_SRC_DIR.
>>>>>> > This avoid finding other possible Cargo.lock that
>>>>>> > would be in subdir (for example if a patch is applied
>>>>>> > on the recipe, we can have .pc subdir in S and a Cargo.lock
>>>>>> > can be there)
>>>>>> >
>>>>>> > Signed-off-by: Frederic Martinsons <frederic.martinsons@gmail.com>
>>>>>> > ---
>>>>>> >  .../cargo-update-recipe-crates.bbclass               | 12
>>>>>> ++++++++----
>>>>>> >  1 file changed, 8 insertions(+), 4 deletions(-)
>>>>>> >
>>>>>> > diff --git a/meta/classes-recipe/cargo-update-recipe-crates.bbclas=
s
>>>>>> b/meta/classes-recipe/cargo-update-recipe-crates.bbclass
>>>>>> > index daa363b0dd..549cfe627e 100644
>>>>>> > --- a/meta/classes-recipe/cargo-update-recipe-crates.bbclass
>>>>>> > +++ b/meta/classes-recipe/cargo-update-recipe-crates.bbclass
>>>>>> > @@ -68,10 +68,14 @@ def get_crates(f):
>>>>>> >  import os
>>>>>> >  crates =3D "# Autogenerated with 'bitbake -c update_crates
>>>>>> ${PN}'\n\n"
>>>>>> >  found =3D False
>>>>>> > -for root, dirs, files in os.walk('${CARGO_LOCK_SRC_DIR}'):
>>>>>> > -    for file in files:
>>>>>> > -        if file =3D=3D 'Cargo.lock':
>>>>>> > -            crates +=3D get_crates(os.path.join(root, file))
>>>>>> > +for file in os.listdir('${CARGO_LOCK_SRC_DIR}'):
>>>>>> > +    if file =3D=3D 'Cargo.lock':
>>>>>> > +        try:
>>>>>> > +            cargo_lock_path =3D
>>>>>> os.path.join('${CARGO_LOCK_SRC_DIR}', file)
>>>>>> > +            crates +=3D get_crates(cargo_lock_path)
>>>>>> > +        except Exception as e:
>>>>>> > +            raise ValueError("Cannot parse '%s'" %
>>>>>> cargo_lock_path) from e
>>>>>> > +        else:
>>>>>> >              found =3D True
>>>>>> >  if not found:
>>>>>> >      raise ValueError("Unable to find Cargo.lock in
>>>>>> ${CARGO_LOCK_SRC_DIR}")
>>>>>>
>>>>>> Isn't this just a long-winded version of something like this
>>>>>> (completely untested):
>>>>>>
>>>>>> diff --git a/meta/classes-recipe/cargo-update-recipe-crates.bbclass
>>>>>> b/meta/classes-recipe/cargo-update-recipe-crates.bbclass
>>>>>> index daa363b0dd65..22ddcfa5c1e3 100644
>>>>>> --- a/meta/classes-recipe/cargo-update-recipe-crates.bbclass
>>>>>> +++ b/meta/classes-recipe/cargo-update-recipe-crates.bbclass
>>>>>> @@ -67,14 +67,7 @@ def get_crates(f):
>>>>>>
>>>>>>  import os
>>>>>>  crates =3D "# Autogenerated with 'bitbake -c update_crates ${PN}'\n=
\n"
>>>>>> -found =3D False
>>>>>> -for root, dirs, files in os.walk('${CARGO_LOCK_SRC_DIR}'):
>>>>>> -    for file in files:
>>>>>> -        if file =3D=3D 'Cargo.lock':
>>>>>> -            crates +=3D get_crates(os.path.join(root, file))
>>>>>> -            found =3D True
>>>>>> -if not found:
>>>>>> -    raise ValueError("Unable to find Cargo.lock in
>>>>>> ${CARGO_LOCK_SRC_DIR}")
>>>>>> +crates +=3D get_crates(os.path.join("${CARGO_LOCK_SRC_DIR}",
>>>>>> "Cargo.lock"))
>>>>>>  open("${TARGET_FILE}", 'w').write(crates)
>>>>>>  EOF
>>>>>>
>>>>>> --
>>>>>> Alex Kiernan
>>>>>>
>>>>>>
>>>>>>
>>>>>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#179358):
>> https://lists.openembedded.org/g/openembedded-core/message/179358
>> Mute This Topic: https://lists.openembedded.org/mt/97953740/3617156
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
>> Martin.Jansa@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>

--000000000000332c6a05f82b89bc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hello,<div dir=3D"auto"><br></div><div dir=3D"auto">The m=
ultiple Cargo.lock seems totally valid, a project can have multiple binarie=
s provided (which is the case for Solana cli suite) so I&#39;ll submit a ne=
w v6 of my series to reflect that, I just have to ignored specify dirs like=
 .git (no use to walk inside it) or .pc (can contains a patched Cargo.lock =
that would be redundant and syntaxically invalid )</div><div dir=3D"auto"><=
br></div><div dir=3D"auto">I&#39;ll also override the crate names with thei=
r version for all the crates found.</div><div dir=3D"auto"><br></div><div d=
ir=3D"auto">For the chicken and eggs issue, I need to think more of it (may=
be make bitbake print the list of all missing checksum=C2=A0 would be enoug=
h) and, in order to not delay this series, I&#39;ll submit a separate bitba=
ke patch if I manage to find something suitable.</div><div dir=3D"auto"><br=
></div><div dir=3D"auto">Many thanks for the comments Martin.=C2=A0</div></=
div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Le=
 jeu. 30 mars 2023, 23:15, Martin Jansa &lt;<a href=3D"mailto:martin.jansa@=
gmail.com">martin.jansa@gmail.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #c=
cc solid;padding-left:1ex"><div dir=3D"ltr"><div>I&#39;ve added the updated=
 .inc files to meta-webosose fork if it&#39;s easier to see there:</div><di=
v><br></div><a href=3D"https://github.com/shr-project/meta-webosose/commits=
/master-2023-03-30" target=3D"_blank" rel=3D"noreferrer">https://github.com=
/shr-project/meta-webosose/commits/master-2023-03-30</a> (top 2 commits)<br=
><div><br></div><div>this checksum mismatch is also the reason for that ugl=
y exception as explained in top commit, it&#39;s race-condition between sug=
ar.do_unpack and solana-cli.do_fetch where sugar has right arrayvec 0.7.2 w=
ith right checksum in do_unpack, while solana-cli renames it to _bad-checks=
um_ suffix, because solana-cli looks for checksum of arrayvec 0.7.1.</div><=
div><br></div><div>I&#39;ve tried to manually add name=3D param to verify t=
his, but there are too many :), so I&#39;ll update the bbclass to always ad=
d name with version even if it doesn&#39;t see duplicated crates (and then =
this can be improved if multiple Cargo.lock files really need to be support=
ed).</div><div><br></div><div>I honestly don&#39;t know, I&#39;ve was only =
working on these solana recipes for short time and wanted to offer them mor=
e as strange example.</div><div><br></div><div>Cheers,</div></div><br><div =
class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Mar 30,=
 2023 at 10:22=E2=80=AFPM Martin Jansa via <a href=3D"http://lists.openembe=
dded.org" target=3D"_blank" rel=3D"noreferrer">lists.openembedded.org</a> &=
lt;Martin.Jansa=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" targe=
t=3D"_blank" rel=3D"noreferrer">gmail.com@lists.openembedded.org</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D=
"ltr"><div dir=3D"ltr">On Thu, Mar 30, 2023 at 10:07=E2=80=AFPM Fr=C3=A9d=
=C3=A9ric Martinsons &lt;<a href=3D"mailto:frederic.martinsons@gmail.com" t=
arget=3D"_blank" rel=3D"noreferrer">frederic.martinsons@gmail.com</a>&gt; w=
rote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex"><div dir=3D"auto">By the way, about this &quot;chickens an=
d eggs&quot; problem, isn&#39;t it the same for a regular recipe you just u=
pgraded?=C2=A0</div></blockquote><div><br></div><div>I don&#39;t know, I ha=
ven&#39;t upgraded a recipe with crates yet :)</div><div><br></div><div>It&=
#39;s just this time I was aware that the .inc file will need to be refresh=
ed and it wasn&#39;t obvious at first that easiest way to avoid do_fetch is=
sue blocking .inc refresh is to remove all crates first by emptying .inc fi=
le.</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><=
div dir=3D"auto"><div dir=3D"auto">Personnaly, when I update a recipe, I le=
t bitbake tell me what is the new checksum expected and put it the recipe (=
as the error message says).</div></div></blockquote><div><br></div><div>For=
 regular recipes with a few checksum I do the same. But it doesn&#39;t scal=
e here as you mention bellow.</div><div>as it reported only the first wrong=
 checksum from MANY.</div><div><br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex"><div dir=3D"auto"><div dir=3D"auto">But I&#39;m aware this =
is not exactly the same, since a cargo based recipe could contain a ton of =
crate:// uri and if you apply this method, you have to copy the new checksu=
m one by one, bitbake error after another...=C2=A0</div><div dir=3D"auto"><=
br></div><div dir=3D"auto">Don&#39;t know how to make this better and I ple=
ad guilty for not mentioning that in a dedicated commit message.</div></div=
></blockquote><div><br></div><div>Better late than never, you can include i=
t in v6 of this patch (I have read the git log of the .bbclass before going=
 to refresh the .inc files, so others might notice it there as well).</div>=
<div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=
=3D"auto"><div dir=3D"auto">Of course, if someone come up with a smoothier =
way of doing this, I&#39;ll make a new patch.=C2=A0</div></div></blockquote=
><div><br></div><div>I think I found what the other issue with arrayvec cre=
ate was:</div><div><br></div><div>meta-webos/recipes-upstreamable/solana/so=
lana-crates.inc: =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/arrayvec/=
0.7.2" target=3D"_blank" rel=3D"noreferrer">crates.io/arrayvec/0.7.2</a> \<=
br>meta-webos/recipes-upstreamable/solana/solana-crates.inc:SRC_URI[arrayve=
c.sha256sum] =3D &quot;8da52d66c7071e2e3fa2a1e5c6d088fec47b593032b254f5e980=
de8ea54454d6&quot;<br>meta-webos/recipes-upstreamable/solana/solana-crates.=
inc: =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/arrayvec/0.7.1" targe=
t=3D"_blank" rel=3D"noreferrer">crates.io/arrayvec/0.7.1</a> \<br>meta-webo=
s/recipes-upstreamable/solana/solana-crates.inc:SRC_URI[arrayvec.sha256sum]=
 =3D &quot;be4dc07131ffa69b8072d35f5007352af944213cde02545e2103680baed38fcd=
&quot;<br>meta-webos/recipes-upstreamable/sugar/sugar-crates.inc: =C2=A0 =
=C2=A0crate://<a href=3D"http://crates.io/arrayvec/0.7.2" target=3D"_blank"=
 rel=3D"noreferrer">crates.io/arrayvec/0.7.2</a> \<br>meta-webos/recipes-up=
streamable/sugar/sugar-crates.inc:SRC_URI[arrayvec.sha256sum] =3D &quot;8da=
52d66c7071e2e3fa2a1e5c6d088fec47b593032b254f5e980de8ea54454d6&quot;</div><d=
iv><br></div><div>So different Cargo.lock files included in the same ${S} h=
ave different version, but in this case it didn&#39;t set different name pa=
rameter, probably because different Cargo.lock files are processed separate=
ly?</div><div><br></div><div>Thanks</div><div><br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div class=3D"gmail_quote"><div dir=3D"ltr=
" class=3D"gmail_attr">Le jeu. 30 mars 2023, 21:50, Fr=C3=A9d=C3=A9ric Mart=
insons &lt;<a href=3D"mailto:frederic.martinsons@gmail.com" target=3D"_blan=
k" rel=3D"noreferrer">frederic.martinsons@gmail.com</a>&gt; a =C3=A9crit=C2=
=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D=
"ltr"><div dir=3D"auto"><div>Well I see what you mean, I&#39;ll take a look=
 at your example to try to find out if multiple Cargo.lock could be expecte=
d.<div dir=3D"auto"><br></div><div dir=3D"auto">And for your second remark,=
 yes, there is a chicken and eggs issue for updating crates checksum from s=
cratch.</div><div dir=3D"auto">You didn&#39;t miss anything, I came across =
this when updating crates checksum that was &quot;pristine&quot;</div><div =
dir=3D"auto">=C2=A0and I only manage to execute update_crates by locally pa=
tching bitbake/lib/bb/fetch2/crate.py for</div><div dir=3D"auto">recommends=
_checksum method to return False .<br></div><div>I&#39;m aware that is not =
ideal but I don&#39;t know how to make this better (maybe make do_update_cr=
ates</div><div>after do_fetch instead of after do_patch ? )</div><br><br><d=
iv class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Le jeu. 30 m=
ars 2023, 21:23, Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com"=
 rel=3D"noreferrer noreferrer" target=3D"_blank">martin.jansa@gmail.com</a>=
&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div dir=3D"ltr">I don&#39;t remember the exact details now, but=
 when I was working on updating solana recipes to use this<div><a href=3D"h=
ttps://github.com/webosose/meta-webosose/commit/9bdfae7988077d0211eeee79cc3=
39d0770cd86b4" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">h=
ttps://github.com/webosose/meta-webosose/commit/9bdfae7988077d0211eeee79cc3=
39d0770cd86b4</a></div><div><br></div><div>the S was pointing to just some =
subdirectory and multiple Cargo.locks files were parsed in other directorie=
s as well, that&#39;s why I was adding=C2=A0<br><div><a href=3D"https://git=
.openembedded.org/openembedded-core/commit/meta/classes-recipe/cargo-update=
-recipe-crates.bbclass?id=3D7636a2b8080521ed2ad54b0edce47a8742a12d58" rel=
=3D"noreferrer noreferrer noreferrer" target=3D"_blank">https://git.openemb=
edded.org/openembedded-core/commit/meta/classes-recipe/cargo-update-recipe-=
crates.bbclass?id=3D7636a2b8080521ed2ad54b0edce47a8742a12d58</a><br></div><=
div><br></div><div>in the end I&#39;ve changed to use the root directory in=
 S and just set=C2=A0CARGO_SRC_DIR to right subdirectory to build.</div><di=
v><br></div><div>I don&#39;t have much experience with crates other than th=
ese solana recipes, but isn&#39;t there some valid use-case for multiple Ca=
rgo.locks?</div><div>I assume Alex in original implementation didn&#39;t us=
e the os.walk just to make it more complicated :).</div><div><br></div><div=
>And FWIW when trying to regenerate these .inc files with current master an=
d with:</div><div>$ bitbake -c update_crates solana-keygen<br></div><div>it=
 fails with:</div><div>ERROR: solana-keygen-1.14.5-r0 do_fetch: No checksum=
 specified for &#39;/OE/lge/build/webos/mickledore/downloads/Inflector-0.11=
.4.crate&#39;, please add at least one to the recipe:<br>SRC_URI[Inflector.=
sha256sum] =3D &quot;fe438c63458706e03479442743baae6c88256498e6431708f6dfc5=
20a26515d3&quot;<br>ERROR: solana-keygen-1.14.5-r0 do_fetch: Bitbake Fetche=
r Error: NoChecksumError(&#39;Missing SRC_URI checksum&#39;, &#39;<a href=
=3D"https://crates.io/api/v1/crates/Inflector/0.11.4/download" rel=3D"noref=
errer noreferrer noreferrer" target=3D"_blank">https://crates.io/api/v1/cra=
tes/Inflector/0.11.4/download</a>&#39;)<br></div><div><br></div><div>Isn&#3=
9;t it an chicken&amp;egg issue now when do_fetch enforces checksums to be =
used? Or am I just missing some of the pending changes or just using it inc=
orrectly?</div><div>=C2=A0</div></div></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Mar 30, 2023 at 6:34=E2=80=AF=
PM Alex Kiernan &lt;<a href=3D"mailto:alex.kiernan@gmail.com" rel=3D"norefe=
rrer noreferrer noreferrer" target=3D"_blank">alex.kiernan@gmail.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Thu,=
 Mar 30, 2023 at 4:45=E2=80=AFPM &lt;<a href=3D"mailto:frederic.martinsons@=
gmail.com" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">frede=
ric.martinsons@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; From: Frederic Martinsons &lt;<a href=3D"mailto:frederic.martinsons@gm=
ail.com" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">frederi=
c.martinsons@gmail.com</a>&gt;<br>
&gt;<br>
&gt; There is no need to do such things, Cargo.lock file<br>
&gt; has to be at the root of CARGO_LOCK_SRC_DIR.<br>
&gt; This avoid finding other possible Cargo.lock that<br>
&gt; would be in subdir (for example if a patch is applied<br>
&gt; on the recipe, we can have .pc subdir in S and a Cargo.lock<br>
&gt; can be there)<br>
&gt;<br>
&gt; Signed-off-by: Frederic Martinsons &lt;<a href=3D"mailto:frederic.mart=
insons@gmail.com" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank=
">frederic.martinsons@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../cargo-update-recipe-crates.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 12 ++++++++----<br>
&gt;=C2=A0 1 file changed, 8 insertions(+), 4 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta/classes-recipe/cargo-update-recipe-crates.bbclass b/=
meta/classes-recipe/cargo-update-recipe-crates.bbclass<br>
&gt; index daa363b0dd..549cfe627e 100644<br>
&gt; --- a/meta/classes-recipe/cargo-update-recipe-crates.bbclass<br>
&gt; +++ b/meta/classes-recipe/cargo-update-recipe-crates.bbclass<br>
&gt; @@ -68,10 +68,14 @@ def get_crates(f):<br>
&gt;=C2=A0 import os<br>
&gt;=C2=A0 crates =3D &quot;# Autogenerated with &#39;bitbake -c update_cra=
tes ${PN}&#39;\n\n&quot;<br>
&gt;=C2=A0 found =3D False<br>
&gt; -for root, dirs, files in os.walk(&#39;${CARGO_LOCK_SRC_DIR}&#39;):<br=
>
&gt; -=C2=A0 =C2=A0 for file in files:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if file =3D=3D &#39;Cargo.lock&#39;:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 crates +=3D get_crates(os.p=
ath.join(root, file))<br>
&gt; +for file in os.listdir(&#39;${CARGO_LOCK_SRC_DIR}&#39;):<br>
&gt; +=C2=A0 =C2=A0 if file =3D=3D &#39;Cargo.lock&#39;:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cargo_lock_path =3D os.path=
.join(&#39;${CARGO_LOCK_SRC_DIR}&#39;, file)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 crates +=3D get_crates(carg=
o_lock_path)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 except Exception as e:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise ValueError(&quot;Cann=
ot parse &#39;%s&#39;&quot; % cargo_lock_path) from e<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 found =3D True<br>
&gt;=C2=A0 if not found:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 raise ValueError(&quot;Unable to find Cargo.lock i=
n ${CARGO_LOCK_SRC_DIR}&quot;)<br>
<br>
Isn&#39;t this just a long-winded version of something like this<br>
(completely untested):<br>
<br>
diff --git a/meta/classes-recipe/cargo-update-recipe-crates.bbclass<br>
b/meta/classes-recipe/cargo-update-recipe-crates.bbclass<br>
index daa363b0dd65..22ddcfa5c1e3 100644<br>
--- a/meta/classes-recipe/cargo-update-recipe-crates.bbclass<br>
+++ b/meta/classes-recipe/cargo-update-recipe-crates.bbclass<br>
@@ -67,14 +67,7 @@ def get_crates(f):<br>
<br>
=C2=A0import os<br>
=C2=A0crates =3D &quot;# Autogenerated with &#39;bitbake -c update_crates $=
{PN}&#39;\n\n&quot;<br>
-found =3D False<br>
-for root, dirs, files in os.walk(&#39;${CARGO_LOCK_SRC_DIR}&#39;):<br>
-=C2=A0 =C2=A0 for file in files:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if file =3D=3D &#39;Cargo.lock&#39;:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 crates +=3D get_crates(os.path.j=
oin(root, file))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 found =3D True<br>
-if not found:<br>
-=C2=A0 =C2=A0 raise ValueError(&quot;Unable to find Cargo.lock in ${CARGO_=
LOCK_SRC_DIR}&quot;)<br>
+crates +=3D get_crates(os.path.join(&quot;${CARGO_LOCK_SRC_DIR}&quot;, &qu=
ot;Cargo.lock&quot;))<br>
=C2=A0open(&quot;${TARGET_FILE}&quot;, &#39;w&#39;).write(crates)<br>
=C2=A0EOF<br>
<br>
-- <br>
Alex Kiernan<br>
<br>
<br>
<br>
</blockquote></div>
</blockquote></div></div></div>
</div>
</blockquote></div>
</blockquote></div></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#179358): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/179358" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://lists.openembedded.org/g/openembedded-core/message/179358</a><=
br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/97953740/3617=
156" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openembe=
dded.org/mt/97953740/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank" rel=3D"noreferrer">openembedded-core+owner@lists.op=
enembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openem=
bedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:Martin.Jansa@gm=
ail.com" target=3D"_blank" rel=3D"noreferrer">Martin.Jansa@gmail.com</a>]<b=
r>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>
</blockquote></div>

--000000000000332c6a05f82b89bc--

