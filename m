Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83F61FA3742
	for <webhook@archiver.kernel.org>; Mon, 31 Oct 2022 09:59:40 +0000 (UTC)
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
 by mx.groups.io with SMTP id smtpd.web09.7384.1667210370103765757
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Oct 2022 02:59:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=W0eEJfEi;
 spf=pass (domain: gmail.com, ip: 209.85.166.182, mailfrom: alex.kiernan@gmail.com)
Received: by mail-il1-f182.google.com with SMTP id r1so5955385ilg.6
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Oct 2022 02:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dJx0IZEh7sCJJpTKWsYm4sjycFWIgS7BbXpTRWRjXE4=;
        b=W0eEJfEiRp0vXD5juo2gWASDwz8QkBS0mRhS3E2KTWa+VIB8qxclOuwt5iWIltnB9e
         6oJym4BKBzAsFF5KIH8Gp1LMnDK59v9ue3v+sHz2gyipKcssDEjXltHyYSdyyHvjpBpC
         VOnGZ5Muo4vosq6eMgDgMBF7Ypa+runZVI3uBa7D74EvP9QKCi4GMngY9JrO/bSCQp+y
         oi6lYHsboZcXziDhDLVGzBIecdxk6wU2cqcuFWEfJZG+sEgrIT1EUp0/xjKmLbccR1AV
         taKjIPPr3qKA2ZZTjBnFtT94durUqVWfSr75VWfx4gXiD425OEhCZ/ibymKnBTFW7z1T
         dWJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dJx0IZEh7sCJJpTKWsYm4sjycFWIgS7BbXpTRWRjXE4=;
        b=su+RXjOnrh7M4g9eomO62mFLMDqUsZcSJSJxRgLT7C65N1bcKENdJm3RjZ1ToEUwXv
         zBq40yQUNv+meScwbT/R9dYU2o3PPQkHIs7Y8HNSk9Y32pRSf6Cu9Sx6BD8T7AUyD2Z+
         3q8hz2SmfFu+8/EMQ2YkRQs6/aavK+1+F/EZpqiw4CsfLDh+bmaB6eft2V/B14PH97Hw
         vfmHeBu9RbfN1yEX83lNBXSWIeiY9EhTf1oYMrwa/fNBI+ydNDKPS0+cVATTg7Y0dp4c
         DYc164uL15xCJ5dFBfrj5GddxymjpTfKSp1GEGwX/BJe+MojkwmU4cCJhzx8C/sai9jw
         AIPg==
X-Gm-Message-State: ACrzQf2Pv0aXwHSN8bycoXICAQCd7c1UiUpz7Febyg5dlHJn7mW8S3sw
	ptmHrWf2A3CV1oPKek67C66V3SC/F3kwZvlmkP6BhmeS
X-Google-Smtp-Source: AMsMyM7Einl8vNH3LS5zQBLLIoj0Zzw9jIaQCjxKdyRflE//cjMOmwzazG3CZFR3c72Zm2XrG0LUH5NDf5s1CUC2rIE=
X-Received: by 2002:a92:d482:0:b0:300:79a0:ab67 with SMTP id
 p2-20020a92d482000000b0030079a0ab67mr6140551ilg.241.1667210369462; Mon, 31
 Oct 2022 02:59:29 -0700 (PDT)
MIME-Version: 1.0
References: <20221030173815.10212-1-alex.kiernan@gmail.com>
 <20221030173815.10212-2-alex.kiernan@gmail.com> <CANNYZj_VyT8xSFF=un1cF_4PugEOhuP-hkN3K66XOc_MvbAV6g@mail.gmail.com>
 <CAO5Uq5TkQtPoGV4NETup9NSVf+ybewXhi=YzoSQ4t2GTpDhecA@mail.gmail.com> <CANNYZj_e632YO2XqXccYq65HQi_1_Musu=X7ybFqLYv+a7gEvQ@mail.gmail.com>
In-Reply-To: <CANNYZj_e632YO2XqXccYq65HQi_1_Musu=X7ybFqLYv+a7gEvQ@mail.gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Mon, 31 Oct 2022 09:59:18 +0000
Message-ID: <CAO5Uq5R6-C+5mrhioQOmbGx4eAt40jMO0D_NpUnFCTQx3HdR5Q@mail.gmail.com>
Subject: Re: [OE-Core][PATCH 2/2] cargo_common.bbclass: Support local github repos
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Oct 2022 09:59:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172302

On Sun, Oct 30, 2022 at 6:35 PM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> It would also help if there=E2=80=99s an actual recipe and component some=
where where the problem exists now. The uuid-test does look like a made up =
example.
>

That's fair... basically it was demonstrating the problem I have with
a bunch of private repos, which I expect will crop up a lot in the
embedded rust world - if you're doing public dev, everything exists as
crates, in the private world you're consuming crates + internal stuff.
Not sure where to try and find a real world example as I'd expect
pretty much everyone will push to crates.io if their code is open -
searching around for a bit, I've failed to find any (though a couple
which have some dev only dependencies which come through git).

> Let=E2=80=99s merge the crate updater to core first, then we can think of=
 handling other ways to specify dependencies. =E2=80=98cargo bitbake=E2=80=
=99 is pretty broken and dead.
>

The crate updater feels like it's going to be directionally better -
testing it locally, it works for things which only consume things from
crates.io, but that's only one out of thirty or so components I have
to deal with.


> Alex
>
> On Sun 30. Oct 2022 at 19.12, Alex Kiernan <alex.kiernan@gmail.com> wrote=
:
>>
>> I was wondering about how to do that - my test case was
>> https://github.com/akiernan/uuid-test, but that's clearly not
>> adequate; the recipe there comes from `cargo bitbake` as `bitbake -c
>> update_crates` doesn't deal with git dependencies, or dig down into
>> transitive deps, which also needs solving.
>>
>> I'm not clear if something like this could be added as part of the
>> stuff that's in master-next for rust tests? Or if we need to build out
>> something new.
>>
>> On Sun, Oct 30, 2022 at 5:58 PM Alexander Kanavin
>> <alex.kanavin@gmail.com> wrote:
>> >
>> > There doesn=E2=80=99t seem to be a test case or an example for this. H=
ow can we ensure the code is correct?
>> >
>> > Alex
>> >
>> > On Sun 30. Oct 2022 at 18.38, Alex Kiernan <alex.kiernan@gmail.com> wr=
ote:
>> >>
>> >> Since disable network was added cargo configurations which reference =
git
>> >> repos fail as they attempt to fetch across the network as part of
>> >> do_compile, even if EXTRA_OECARGO_PATHS to add them as part of `paths=
`
>> >> is used, as this is documented as only working for packages which exi=
st
>> >> in crates.io.
>> >>
>> >> Add parsing of the SRC_URIs for git repos and include `[patch]` secti=
ons
>> >> to redirect to the checked out source repos which the bitbake fetcher
>> >> has already populated.
>> >>
>> >> There are still cases which don't work - if you have multiple copies =
of
>> >> the same repo with different revisions, there's currently no way to
>> >> represent that and anything using a repo which has a virtual manifest
>> >> will fail to build (see https://github.com/rust-lang/cargo/issues/493=
4).
>> >>
>> >> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
>> >> ---
>> >>  meta/classes-recipe/cargo_common.bbclass | 30 ++++++++++++++++++++++=
++
>> >>  1 file changed, 30 insertions(+)
>> >>
>> >> diff --git a/meta/classes-recipe/cargo_common.bbclass b/meta/classes-=
recipe/cargo_common.bbclass
>> >> index f503a001dd8e..63b13829084b 100644
>> >> --- a/meta/classes-recipe/cargo_common.bbclass
>> >> +++ b/meta/classes-recipe/cargo_common.bbclass
>> >> @@ -116,6 +116,36 @@ cargo_common_do_configure () {
>> >>         EOF
>> >>  }
>> >>
>> >> +python cargo_common_do_patch_paths() {
>> >> +    cargo_config =3D os.path.join(d.getVar("CARGO_HOME"), "config")
>> >> +    if not os.path.exists(cargo_config):
>> >> +        return
>> >> +
>> >> +    src_uri =3D (d.getVar('SRC_URI') or "").split()
>> >> +    if len(src_uri) =3D=3D 0:
>> >> +        return
>> >> +
>> >> +    patches =3D dict()
>> >> +    workdir =3D d.getVar('WORKDIR')
>> >> +    fetcher =3D bb.fetch2.Fetch(src_uri, d)
>> >> +    for url in fetcher.urls:
>> >> +        ud =3D fetcher.ud[url]
>> >> +        if ud.type =3D=3D 'git':
>> >> +            name =3D ud.parm.get('name')
>> >> +            destsuffix =3D ud.parm.get('destsuffix')
>> >> +            if name is not None and destsuffix is not None:
>> >> +                repo =3D '%s://%s%s' % (ud.proto, ud.host, ud.path)
>> >> +                path =3D '%s =3D { path =3D "%s" }' % (name, os.path=
.join(workdir, destsuffix))
>> >> +                patches.setdefault(repo, []).append(path)
>> >> +
>> >> +    with open(cargo_config, "a+") as config:
>> >> +        for k, v in patches.items():
>> >> +            print('\n[patch."%s"]' % k, file=3Dconfig)
>> >> +            for name in v:
>> >> +                print(name, file=3Dconfig)
>> >> +}
>> >> +do_configure[postfuncs] +=3D "cargo_common_do_patch_paths"
>> >> +
>> >>  oe_cargo_fix_env () {
>> >>         export CC=3D"${RUST_TARGET_CC}"
>> >>         export CXX=3D"${RUST_TARGET_CXX}"
>> >> --
>> >> 2.35.1
>> >>
>> >>
>> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> >> Links: You receive all messages sent to this group.
>> >> View/Reply Online (#172284): https://lists.openembedded.org/g/openemb=
edded-core/message/172284
>> >> Mute This Topic: https://lists.openembedded.org/mt/94668827/1686489
>> >> Group Owner: openembedded-core+owner@lists.openembedded.org
>> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub=
 [alex.kanavin@gmail.com]
>> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> >>
>>
>>
>> --
>> Alex Kiernan



--
Alex Kiernan

