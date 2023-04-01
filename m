Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C2DBC76196
	for <webhook@archiver.kernel.org>; Sat,  1 Apr 2023 15:21:39 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web10.23666.1680362492869531582
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Apr 2023 08:21:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JThZEUJU;
 spf=pass (domain: gmail.com, ip: 209.85.208.181, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id h9so26042279ljq.2
        for <openembedded-core@lists.openembedded.org>; Sat, 01 Apr 2023 08:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680362491;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BIzAevL7+C2b/75CsPHu3nM71xZAr65lxHjR3BmBGSA=;
        b=JThZEUJUByHtYBknQgJy9nR4//rt9q/owdPPBjb0behaNVDnmmo3QBshR3j6tKLu8I
         NOYVyOeqOJyUe+aI+Zk0Xn23HjVRgI8yZl2t+i67yM/xQ7gVMwnTxkU5kB4EnMt91lzg
         9Sk+403z8O/fwNoWpaK0Db7Q5RueXwflmg7fDFmhRFuz5TDGLPrnYFBAHWpZglLQm8k0
         AQLIlNazsv8CuStlIbUWbj0wY2iMnsGdUSF2otMIgi1zkGAjphtRrD9isBtJKCGkEMjm
         g927owO2+G7gi6tNTo4lpCrKIVYi9VFdwunFDjV1EbsOtz7NTEBPeMpCuqaEJhMyvExG
         NHNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680362491;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BIzAevL7+C2b/75CsPHu3nM71xZAr65lxHjR3BmBGSA=;
        b=EitdBGCxwwI5riDIaWPMuXr3KoLd7a9nH34/CGzgmjdnnaJWGuW0YQlEaMYPtyiZL+
         jgkV4bBCrX7qfPqKhfL4RIxvXuQ2E+cR0ezPs9mNHEVZVn2WQN4hjLK4AzlG9sncJCKW
         zj6GLryBSWwjHLmYGwclzRAorBGQdp+QBojoslpbnOF1TQCbTdPDf1HmPvqvSfu6NvJl
         1WZRzqN6nwUdrROMVf20m8/U093taKABRXqxWWwwI9z/NWfmYi/KbYCYHXgZHwtPIEzZ
         wZTElDtMHqZIAHu4zy7lXfEOD6TMMlwng+lXOwuTKBH04Pzcc0XDxOLv0v0VpWRU6AwH
         dohQ==
X-Gm-Message-State: AAQBX9fnZgT6Mvji1qhHPhUIeR/jrhUxWgpawZ2aNQL5P4kJyL2GV2zm
	9QBzgC/D1CjWVf7qKPttUXi+QQT0J2Wo/z9he/w=
X-Google-Smtp-Source: AKy350YVePePEFS5uTwq5SshaXg5kK+eNYv2lBfGVb/pxWSv+rd8D7Pvn1S+Eev3Dgr2bnZNywJAyuLe/ha+Q2TPmGs=
X-Received: by 2002:a2e:be1c:0:b0:2a2:35dd:4b30 with SMTP id
 z28-20020a2ebe1c000000b002a235dd4b30mr6486524ljq.3.1680362490522; Sat, 01 Apr
 2023 08:21:30 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1680190966.git.frederic.martinsons@gmail.com>
 <6279ccad3163dca527872a9144d63fb8f07c6f0e.1680190966.git.frederic.martinsons@gmail.com>
 <CAO5Uq5Sgt7EwB2DN_r2bB9nt7XQ_qi3SNrhbrVvB6Bru-XsjXw@mail.gmail.com>
 <CA+chaQc24hyg7mTKA+BkeTSPBT3bnuc8K0NcUHVZFS8obXrYew@mail.gmail.com>
 <CA+cAkerB9D=iztBn_VQDPQyDZUp5rMtfj=CwuU4aeFL=RDERbQ@mail.gmail.com>
 <CA+cAkeobeK=g_oGJvOsLEMDtcuBVwrFKuyU6gR-z1GmB+Sv2Qg@mail.gmail.com>
 <17514C0A502D4FD8.27612@lists.openembedded.org> <CA+chaQc5OdQ3esOkDA=JkvuRGp9fZNjfscZFcvoqbimdak1BfQ@mail.gmail.com>
 <17516A1097F71BFB.12651@lists.openembedded.org>
In-Reply-To: <17516A1097F71BFB.12651@lists.openembedded.org>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Sat, 1 Apr 2023 17:21:17 +0200
Message-ID: <CA+cAkeonKef=fqSLAMh_0+KhbAH96CYUHPh1=AJY6c3J6UhZ0Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH V5 6/6] cargo-update-recipe-crates: don't walk
 on the whole dir
To: frederic.martinsons@gmail.com
Cc: Martin Jansa <martin.jansa@gmail.com>, Alex Kiernan <alex.kiernan@gmail.com>, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000057703a05f847e1a4"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Apr 2023 15:21:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179468

--00000000000057703a05f847e1a4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello, I just submitted a patch inside the bitbake fetcher to display all
the missing
checksum at once instead of only one.

For the moment, I have no better solution, let's see what bitbake folks
tell us about that.

On Fri, 31 Mar 2023 at 07:32, Frederic Martinsons via lists.openembedded.or=
g
<frederic.martinsons=3Dgmail.com@lists.openembedded.org> wrote:

> Hello,
>
> The multiple Cargo.lock seems totally valid, a project can have multiple
> binaries provided (which is the case for Solana cli suite) so I'll submit=
 a
> new v6 of my series to reflect that, I just have to ignored specify dirs
> like .git (no use to walk inside it) or .pc (can contains a patched
> Cargo.lock that would be redundant and syntaxically invalid )
>
> I'll also override the crate names with their version for all the crates
> found.
>
> For the chicken and eggs issue, I need to think more of it (maybe make
> bitbake print the list of all missing checksum  would be enough) and, in
> order to not delay this series, I'll submit a separate bitbake patch if I
> manage to find something suitable.
>
> Many thanks for the comments Martin.
>
> Le jeu. 30 mars 2023, 23:15, Martin Jansa <martin.jansa@gmail.com> a
> =C3=A9crit :
>
>> I've added the updated .inc files to meta-webosose fork if it's easier t=
o
>> see there:
>>
>> https://github.com/shr-project/meta-webosose/commits/master-2023-03-30
>> (top 2 commits)
>>
>> this checksum mismatch is also the reason for that ugly exception as
>> explained in top commit, it's race-condition between sugar.do_unpack and
>> solana-cli.do_fetch where sugar has right arrayvec 0.7.2 with right
>> checksum in do_unpack, while solana-cli renames it to _bad-checksum_
>> suffix, because solana-cli looks for checksum of arrayvec 0.7.1.
>>
>> I've tried to manually add name=3D param to verify this, but there are t=
oo
>> many :), so I'll update the bbclass to always add name with version even=
 if
>> it doesn't see duplicated crates (and then this can be improved if multi=
ple
>> Cargo.lock files really need to be supported).
>>
>> I honestly don't know, I've was only working on these solana recipes for
>> short time and wanted to offer them more as strange example.
>>
>> Cheers,
>>
>> On Thu, Mar 30, 2023 at 10:22=E2=80=AFPM Martin Jansa via lists.openembe=
dded.org
>> <Martin.Jansa=3Dgmail.com@lists.openembedded.org> wrote:
>>
>>> On Thu, Mar 30, 2023 at 10:07=E2=80=AFPM Fr=C3=A9d=C3=A9ric Martinsons =
<
>>> frederic.martinsons@gmail.com> wrote:
>>>
>>>> By the way, about this "chickens and eggs" problem, isn't it the same
>>>> for a regular recipe you just upgraded?
>>>>
>>>
>>> I don't know, I haven't upgraded a recipe with crates yet :)
>>>
>>> It's just this time I was aware that the .inc file will need to be
>>> refreshed and it wasn't obvious at first that easiest way to avoid do_f=
etch
>>> issue blocking .inc refresh is to remove all crates first by emptying .=
inc
>>> file.
>>>
>>> Personnaly, when I update a recipe, I let bitbake tell me what is the
>>>> new checksum expected and put it the recipe (as the error message says=
).
>>>>
>>>
>>> For regular recipes with a few checksum I do the same. But it doesn't
>>> scale here as you mention bellow.
>>> as it reported only the first wrong checksum from MANY.
>>>
>>> But I'm aware this is not exactly the same, since a cargo based recipe
>>>> could contain a ton of crate:// uri and if you apply this method, you =
have
>>>> to copy the new checksum one by one, bitbake error after another...
>>>>
>>>> Don't know how to make this better and I plead guilty for not
>>>> mentioning that in a dedicated commit message.
>>>>
>>>
>>> Better late than never, you can include it in v6 of this patch (I have
>>> read the git log of the .bbclass before going to refresh the .inc files=
, so
>>> others might notice it there as well).
>>>
>>> Of course, if someone come up with a smoothier way of doing this, I'll
>>>> make a new patch.
>>>>
>>>
>>> I think I found what the other issue with arrayvec create was:
>>>
>>> meta-webos/recipes-upstreamable/solana/solana-crates.inc:    crate://
>>> crates.io/arrayvec/0.7.2 \
>>> meta-webos/recipes-upstreamable/solana/solana-crates.inc:SRC_URI[arrayv=
ec.sha256sum]
>>> =3D "8da52d66c7071e2e3fa2a1e5c6d088fec47b593032b254f5e980de8ea54454d6"
>>> meta-webos/recipes-upstreamable/solana/solana-crates.inc:    crate://
>>> crates.io/arrayvec/0.7.1 \
>>> meta-webos/recipes-upstreamable/solana/solana-crates.inc:SRC_URI[arrayv=
ec.sha256sum]
>>> =3D "be4dc07131ffa69b8072d35f5007352af944213cde02545e2103680baed38fcd"
>>> meta-webos/recipes-upstreamable/sugar/sugar-crates.inc:    crate://
>>> crates.io/arrayvec/0.7.2 \
>>> meta-webos/recipes-upstreamable/sugar/sugar-crates.inc:SRC_URI[arrayvec=
.sha256sum]
>>> =3D "8da52d66c7071e2e3fa2a1e5c6d088fec47b593032b254f5e980de8ea54454d6"
>>>
>>> So different Cargo.lock files included in the same ${S} have different
>>> version, but in this case it didn't set different name parameter, proba=
bly
>>> because different Cargo.lock files are processed separately?
>>>
>>> Thanks
>>>
>>> Le jeu. 30 mars 2023, 21:50, Fr=C3=A9d=C3=A9ric Martinsons <
>>>> frederic.martinsons@gmail.com> a =C3=A9crit :
>>>>
>>>>> Well I see what you mean, I'll take a look at your example to try to
>>>>> find out if multiple Cargo.lock could be expected.
>>>>>
>>>>> And for your second remark, yes, there is a chicken and eggs issue fo=
r
>>>>> updating crates checksum from scratch.
>>>>> You didn't miss anything, I came across this when updating crates
>>>>> checksum that was "pristine"
>>>>>  and I only manage to execute update_crates by locally patching
>>>>> bitbake/lib/bb/fetch2/crate.py for
>>>>> recommends_checksum method to return False .
>>>>> I'm aware that is not ideal but I don't know how to make this better
>>>>> (maybe make do_update_crates
>>>>> after do_fetch instead of after do_patch ? )
>>>>>
>>>>>
>>>>> Le jeu. 30 mars 2023, 21:23, Martin Jansa <martin.jansa@gmail.com> a
>>>>> =C3=A9crit :
>>>>>
>>>>>> I don't remember the exact details now, but when I was working on
>>>>>> updating solana recipes to use this
>>>>>>
>>>>>> https://github.com/webosose/meta-webosose/commit/9bdfae7988077d0211e=
eee79cc339d0770cd86b4
>>>>>>
>>>>>> the S was pointing to just some subdirectory and multiple Cargo.lock=
s
>>>>>> files were parsed in other directories as well, that's why I was add=
ing
>>>>>>
>>>>>> https://git.openembedded.org/openembedded-core/commit/meta/classes-r=
ecipe/cargo-update-recipe-crates.bbclass?id=3D7636a2b8080521ed2ad54b0edce47=
a8742a12d58
>>>>>>
>>>>>> in the end I've changed to use the root directory in S and just
>>>>>> set CARGO_SRC_DIR to right subdirectory to build.
>>>>>>
>>>>>> I don't have much experience with crates other than these solana
>>>>>> recipes, but isn't there some valid use-case for multiple Cargo.lock=
s?
>>>>>> I assume Alex in original implementation didn't use the os.walk just
>>>>>> to make it more complicated :).
>>>>>>
>>>>>> And FWIW when trying to regenerate these .inc files with current
>>>>>> master and with:
>>>>>> $ bitbake -c update_crates solana-keygen
>>>>>> it fails with:
>>>>>> ERROR: solana-keygen-1.14.5-r0 do_fetch: No checksum specified for
>>>>>> '/OE/lge/build/webos/mickledore/downloads/Inflector-0.11.4.crate', p=
lease
>>>>>> add at least one to the recipe:
>>>>>> SRC_URI[Inflector.sha256sum] =3D
>>>>>> "fe438c63458706e03479442743baae6c88256498e6431708f6dfc520a26515d3"
>>>>>> ERROR: solana-keygen-1.14.5-r0 do_fetch: Bitbake Fetcher Error:
>>>>>> NoChecksumError('Missing SRC_URI checksum', '
>>>>>> https://crates.io/api/v1/crates/Inflector/0.11.4/download')
>>>>>>
>>>>>> Isn't it an chicken&egg issue now when do_fetch enforces checksums t=
o
>>>>>> be used? Or am I just missing some of the pending changes or just us=
ing it
>>>>>> incorrectly?
>>>>>>
>>>>>>
>>>>>> On Thu, Mar 30, 2023 at 6:34=E2=80=AFPM Alex Kiernan <alex.kiernan@g=
mail.com>
>>>>>> wrote:
>>>>>>
>>>>>>> On Thu, Mar 30, 2023 at 4:45=E2=80=AFPM <frederic.martinsons@gmail.=
com>
>>>>>>> wrote:
>>>>>>> >
>>>>>>> > From: Frederic Martinsons <frederic.martinsons@gmail.com>
>>>>>>> >
>>>>>>> > There is no need to do such things, Cargo.lock file
>>>>>>> > has to be at the root of CARGO_LOCK_SRC_DIR.
>>>>>>> > This avoid finding other possible Cargo.lock that
>>>>>>> > would be in subdir (for example if a patch is applied
>>>>>>> > on the recipe, we can have .pc subdir in S and a Cargo.lock
>>>>>>> > can be there)
>>>>>>> >
>>>>>>> > Signed-off-by: Frederic Martinsons <frederic.martinsons@gmail.com=
>
>>>>>>> > ---
>>>>>>> >  .../cargo-update-recipe-crates.bbclass               | 12
>>>>>>> ++++++++----
>>>>>>> >  1 file changed, 8 insertions(+), 4 deletions(-)
>>>>>>> >
>>>>>>> > diff --git
>>>>>>> a/meta/classes-recipe/cargo-update-recipe-crates.bbclass
>>>>>>> b/meta/classes-recipe/cargo-update-recipe-crates.bbclass
>>>>>>> > index daa363b0dd..549cfe627e 100644
>>>>>>> > --- a/meta/classes-recipe/cargo-update-recipe-crates.bbclass
>>>>>>> > +++ b/meta/classes-recipe/cargo-update-recipe-crates.bbclass
>>>>>>> > @@ -68,10 +68,14 @@ def get_crates(f):
>>>>>>> >  import os
>>>>>>> >  crates =3D "# Autogenerated with 'bitbake -c update_crates
>>>>>>> ${PN}'\n\n"
>>>>>>> >  found =3D False
>>>>>>> > -for root, dirs, files in os.walk('${CARGO_LOCK_SRC_DIR}'):
>>>>>>> > -    for file in files:
>>>>>>> > -        if file =3D=3D 'Cargo.lock':
>>>>>>> > -            crates +=3D get_crates(os.path.join(root, file))
>>>>>>> > +for file in os.listdir('${CARGO_LOCK_SRC_DIR}'):
>>>>>>> > +    if file =3D=3D 'Cargo.lock':
>>>>>>> > +        try:
>>>>>>> > +            cargo_lock_path =3D
>>>>>>> os.path.join('${CARGO_LOCK_SRC_DIR}', file)
>>>>>>> > +            crates +=3D get_crates(cargo_lock_path)
>>>>>>> > +        except Exception as e:
>>>>>>> > +            raise ValueError("Cannot parse '%s'" %
>>>>>>> cargo_lock_path) from e
>>>>>>> > +        else:
>>>>>>> >              found =3D True
>>>>>>> >  if not found:
>>>>>>> >      raise ValueError("Unable to find Cargo.lock in
>>>>>>> ${CARGO_LOCK_SRC_DIR}")
>>>>>>>
>>>>>>> Isn't this just a long-winded version of something like this
>>>>>>> (completely untested):
>>>>>>>
>>>>>>> diff --git a/meta/classes-recipe/cargo-update-recipe-crates.bbclass
>>>>>>> b/meta/classes-recipe/cargo-update-recipe-crates.bbclass
>>>>>>> index daa363b0dd65..22ddcfa5c1e3 100644
>>>>>>> --- a/meta/classes-recipe/cargo-update-recipe-crates.bbclass
>>>>>>> +++ b/meta/classes-recipe/cargo-update-recipe-crates.bbclass
>>>>>>> @@ -67,14 +67,7 @@ def get_crates(f):
>>>>>>>
>>>>>>>  import os
>>>>>>>  crates =3D "# Autogenerated with 'bitbake -c update_crates ${PN}'\=
n\n"
>>>>>>> -found =3D False
>>>>>>> -for root, dirs, files in os.walk('${CARGO_LOCK_SRC_DIR}'):
>>>>>>> -    for file in files:
>>>>>>> -        if file =3D=3D 'Cargo.lock':
>>>>>>> -            crates +=3D get_crates(os.path.join(root, file))
>>>>>>> -            found =3D True
>>>>>>> -if not found:
>>>>>>> -    raise ValueError("Unable to find Cargo.lock in
>>>>>>> ${CARGO_LOCK_SRC_DIR}")
>>>>>>> +crates +=3D get_crates(os.path.join("${CARGO_LOCK_SRC_DIR}",
>>>>>>> "Cargo.lock"))
>>>>>>>  open("${TARGET_FILE}", 'w').write(crates)
>>>>>>>  EOF
>>>>>>>
>>>>>>> --
>>>>>>> Alex Kiernan
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>>
>>>
>>>
>>>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#179391):
> https://lists.openembedded.org/g/openembedded-core/message/179391
> Mute This Topic: https://lists.openembedded.org/mt/97953740/6213388
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> frederic.martinsons@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000057703a05f847e1a4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello, I just submitted a patch inside the bitbake fetcher=
 to display all the missing<div>checksum at once instead of only one.</div>=
<div><br></div><div>For the moment, I have no better solution, let&#39;s se=
e what bitbake folks tell us about that.</div></div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, 31 Mar 2023 at 07:32,=
 Frederic Martinsons via <a href=3D"http://lists.openembedded.org">lists.op=
enembedded.org</a> &lt;frederic.martinsons=3D<a href=3D"mailto:gmail.com@li=
sts.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"auto">Hel=
lo,<div dir=3D"auto"><br></div><div dir=3D"auto">The multiple Cargo.lock se=
ems totally valid, a project can have multiple binaries provided (which is =
the case for Solana cli suite) so I&#39;ll submit a new v6 of my series to =
reflect that, I just have to ignored specify dirs like .git (no use to walk=
 inside it) or .pc (can contains a patched Cargo.lock that would be redunda=
nt and syntaxically invalid )</div><div dir=3D"auto"><br></div><div dir=3D"=
auto">I&#39;ll also override the crate names with their version for all the=
 crates found.</div><div dir=3D"auto"><br></div><div dir=3D"auto">For the c=
hicken and eggs issue, I need to think more of it (maybe make bitbake print=
 the list of all missing checksum=C2=A0 would be enough) and, in order to n=
ot delay this series, I&#39;ll submit a separate bitbake patch if I manage =
to find something suitable.</div><div dir=3D"auto"><br></div><div dir=3D"au=
to">Many thanks for the comments Martin.=C2=A0</div></div><br><div class=3D=
"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Le jeu. 30 mars 2023, 2=
3:15, Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com" target=3D"=
_blank">martin.jansa@gmail.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div>I&#39;ve a=
dded the updated .inc files to meta-webosose fork if it&#39;s easier to see=
 there:</div><div><br></div><a href=3D"https://github.com/shr-project/meta-=
webosose/commits/master-2023-03-30" rel=3D"noreferrer" target=3D"_blank">ht=
tps://github.com/shr-project/meta-webosose/commits/master-2023-03-30</a> (t=
op 2 commits)<br><div><br></div><div>this checksum mismatch is also the rea=
son for that ugly exception as explained in top commit, it&#39;s race-condi=
tion between sugar.do_unpack and solana-cli.do_fetch where sugar has right =
arrayvec 0.7.2 with right checksum in do_unpack, while solana-cli renames i=
t to _bad-checksum_ suffix, because solana-cli looks for checksum of arrayv=
ec 0.7.1.</div><div><br></div><div>I&#39;ve tried to manually add name=3D p=
aram to verify this, but there are too many :), so I&#39;ll update the bbcl=
ass to always add name with version even if it doesn&#39;t see duplicated c=
rates (and then this can be improved if multiple Cargo.lock files really ne=
ed to be supported).</div><div><br></div><div>I honestly don&#39;t know, I&=
#39;ve was only working on these solana recipes for short time and wanted t=
o offer them more as strange example.</div><div><br></div><div>Cheers,</div=
></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr"=
>On Thu, Mar 30, 2023 at 10:22=E2=80=AFPM Martin Jansa via <a href=3D"http:=
//lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openem=
bedded.org</a> &lt;Martin.Jansa=3D<a href=3D"mailto:gmail.com@lists.openemb=
edded.org" rel=3D"noreferrer" target=3D"_blank">gmail.com@lists.openembedde=
d.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex"><div dir=3D"ltr"><div dir=3D"ltr">On Thu, Mar 30, 2023 at 10:07=E2=80=
=AFPM Fr=C3=A9d=C3=A9ric Martinsons &lt;<a href=3D"mailto:frederic.martinso=
ns@gmail.com" rel=3D"noreferrer" target=3D"_blank">frederic.martinsons@gmai=
l.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div dir=3D"auto">By the way, about this &=
quot;chickens and eggs&quot; problem, isn&#39;t it the same for a regular r=
ecipe you just upgraded?=C2=A0</div></blockquote><div><br></div><div>I don&=
#39;t know, I haven&#39;t upgraded a recipe with crates yet :)</div><div><b=
r></div><div>It&#39;s just this time I was aware that the .inc file will ne=
ed to be refreshed and it wasn&#39;t obvious at first that easiest way to a=
void do_fetch issue blocking .inc refresh is to remove all crates first by =
emptying .inc file.</div><div><br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex"><div dir=3D"auto"><div dir=3D"auto">Personnaly, when I updat=
e a recipe, I let bitbake tell me what is the new checksum expected and put=
 it the recipe (as the error message says).</div></div></blockquote><div><b=
r></div><div>For regular recipes with a few checksum I do the same. But it =
doesn&#39;t scale here as you mention bellow.</div><div>as it reported only=
 the first wrong checksum from MANY.</div><div><br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div dir=3D"auto"><div dir=3D"auto">But I&=
#39;m aware this is not exactly the same, since a cargo based recipe could =
contain a ton of crate:// uri and if you apply this method, you have to cop=
y the new checksum one by one, bitbake error after another...=C2=A0</div><d=
iv dir=3D"auto"><br></div><div dir=3D"auto">Don&#39;t know how to make this=
 better and I plead guilty for not mentioning that in a dedicated commit me=
ssage.</div></div></blockquote><div><br></div><div>Better late than never, =
you can include it in v6 of this patch (I have read the git log of the .bbc=
lass before going to refresh the .inc files, so others might notice it ther=
e as well).</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex"><div dir=3D"auto"><div dir=3D"auto">Of course, if someone come up wi=
th a smoothier way of doing this, I&#39;ll make a new patch.=C2=A0</div></d=
iv></blockquote><div><br></div><div>I think I found what the other issue wi=
th arrayvec create was:</div><div><br></div><div>meta-webos/recipes-upstrea=
mable/solana/solana-crates.inc: =C2=A0 =C2=A0crate://<a href=3D"http://crat=
es.io/arrayvec/0.7.2" rel=3D"noreferrer" target=3D"_blank">crates.io/arrayv=
ec/0.7.2</a> \<br>meta-webos/recipes-upstreamable/solana/solana-crates.inc:=
SRC_URI[arrayvec.sha256sum] =3D &quot;8da52d66c7071e2e3fa2a1e5c6d088fec47b5=
93032b254f5e980de8ea54454d6&quot;<br>meta-webos/recipes-upstreamable/solana=
/solana-crates.inc: =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/arrayv=
ec/0.7.1" rel=3D"noreferrer" target=3D"_blank">crates.io/arrayvec/0.7.1</a>=
 \<br>meta-webos/recipes-upstreamable/solana/solana-crates.inc:SRC_URI[arra=
yvec.sha256sum] =3D &quot;be4dc07131ffa69b8072d35f5007352af944213cde02545e2=
103680baed38fcd&quot;<br>meta-webos/recipes-upstreamable/sugar/sugar-crates=
.inc: =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/arrayvec/0.7.2" rel=
=3D"noreferrer" target=3D"_blank">crates.io/arrayvec/0.7.2</a> \<br>meta-we=
bos/recipes-upstreamable/sugar/sugar-crates.inc:SRC_URI[arrayvec.sha256sum]=
 =3D &quot;8da52d66c7071e2e3fa2a1e5c6d088fec47b593032b254f5e980de8ea54454d6=
&quot;</div><div><br></div><div>So different Cargo.lock files included in t=
he same ${S} have different version, but in this case it didn&#39;t set dif=
ferent name parameter, probably because different Cargo.lock files are proc=
essed separately?</div><div><br></div><div>Thanks</div><div><br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex"><div class=3D"gmail_quote"><di=
v dir=3D"ltr" class=3D"gmail_attr">Le jeu. 30 mars 2023, 21:50, Fr=C3=A9d=
=C3=A9ric Martinsons &lt;<a href=3D"mailto:frederic.martinsons@gmail.com" r=
el=3D"noreferrer" target=3D"_blank">frederic.martinsons@gmail.com</a>&gt; a=
 =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x"><div dir=3D"ltr"><div dir=3D"auto"><div>Well I see what you mean, I&#39;=
ll take a look at your example to try to find out if multiple Cargo.lock co=
uld be expected.<div dir=3D"auto"><br></div><div dir=3D"auto">And for your =
second remark, yes, there is a chicken and eggs issue for updating crates c=
hecksum from scratch.</div><div dir=3D"auto">You didn&#39;t miss anything, =
I came across this when updating crates checksum that was &quot;pristine&qu=
ot;</div><div dir=3D"auto">=C2=A0and I only manage to execute update_crates=
 by locally patching bitbake/lib/bb/fetch2/crate.py for</div><div dir=3D"au=
to">recommends_checksum method to return False .<br></div><div>I&#39;m awar=
e that is not ideal but I don&#39;t know how to make this better (maybe mak=
e do_update_crates</div><div>after do_fetch instead of after do_patch ? )</=
div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr=
">Le jeu. 30 mars 2023, 21:23, Martin Jansa &lt;<a href=3D"mailto:martin.ja=
nsa@gmail.com" rel=3D"noreferrer noreferrer" target=3D"_blank">martin.jansa=
@gmail.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex"><div dir=3D"ltr">I don&#39;t remember the exact deta=
ils now, but when I was working on updating solana recipes to use this<div>=
<a href=3D"https://github.com/webosose/meta-webosose/commit/9bdfae7988077d0=
211eeee79cc339d0770cd86b4" rel=3D"noreferrer noreferrer noreferrer" target=
=3D"_blank">https://github.com/webosose/meta-webosose/commit/9bdfae7988077d=
0211eeee79cc339d0770cd86b4</a></div><div><br></div><div>the S was pointing =
to just some subdirectory and multiple Cargo.locks files were parsed in oth=
er directories as well, that&#39;s why I was adding=C2=A0<br><div><a href=
=3D"https://git.openembedded.org/openembedded-core/commit/meta/classes-reci=
pe/cargo-update-recipe-crates.bbclass?id=3D7636a2b8080521ed2ad54b0edce47a87=
42a12d58" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">https:=
//git.openembedded.org/openembedded-core/commit/meta/classes-recipe/cargo-u=
pdate-recipe-crates.bbclass?id=3D7636a2b8080521ed2ad54b0edce47a8742a12d58</=
a><br></div><div><br></div><div>in the end I&#39;ve changed to use the root=
 directory in S and just set=C2=A0CARGO_SRC_DIR to right subdirectory to bu=
ild.</div><div><br></div><div>I don&#39;t have much experience with crates =
other than these solana recipes, but isn&#39;t there some valid use-case fo=
r multiple Cargo.locks?</div><div>I assume Alex in original implementation =
didn&#39;t use the os.walk just to make it more complicated :).</div><div><=
br></div><div>And FWIW when trying to regenerate these .inc files with curr=
ent master and with:</div><div>$ bitbake -c update_crates solana-keygen<br>=
</div><div>it fails with:</div><div>ERROR: solana-keygen-1.14.5-r0 do_fetch=
: No checksum specified for &#39;/OE/lge/build/webos/mickledore/downloads/I=
nflector-0.11.4.crate&#39;, please add at least one to the recipe:<br>SRC_U=
RI[Inflector.sha256sum] =3D &quot;fe438c63458706e03479442743baae6c88256498e=
6431708f6dfc520a26515d3&quot;<br>ERROR: solana-keygen-1.14.5-r0 do_fetch: B=
itbake Fetcher Error: NoChecksumError(&#39;Missing SRC_URI checksum&#39;, &=
#39;<a href=3D"https://crates.io/api/v1/crates/Inflector/0.11.4/download" r=
el=3D"noreferrer noreferrer noreferrer" target=3D"_blank">https://crates.io=
/api/v1/crates/Inflector/0.11.4/download</a>&#39;)<br></div><div><br></div>=
<div>Isn&#39;t it an chicken&amp;egg issue now when do_fetch enforces check=
sums to be used? Or am I just missing some of the pending changes or just u=
sing it incorrectly?</div><div>=C2=A0</div></div></div><br><div class=3D"gm=
ail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Mar 30, 2023 at 6:=
34=E2=80=AFPM Alex Kiernan &lt;<a href=3D"mailto:alex.kiernan@gmail.com" re=
l=3D"noreferrer noreferrer noreferrer" target=3D"_blank">alex.kiernan@gmail=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">On Thu, Mar 30, 2023 at 4:45=E2=80=AFPM &lt;<a href=3D"mailto:frederic.=
martinsons@gmail.com" rel=3D"noreferrer noreferrer noreferrer" target=3D"_b=
lank">frederic.martinsons@gmail.com</a>&gt; wrote:<br>
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
<br>
<br>
</blockquote></div>
</blockquote></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#179391): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/179391" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/179391</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/97953740/6213=
388" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/97953740/6213388</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:frederic.martinsons@gmail.=
com" target=3D"_blank">frederic.martinsons@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--00000000000057703a05f847e1a4--

