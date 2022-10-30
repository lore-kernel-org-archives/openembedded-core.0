Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A986C38A02
	for <webhook@archiver.kernel.org>; Sun, 30 Oct 2022 18:12:15 +0000 (UTC)
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
 by mx.groups.io with SMTP id smtpd.web12.614.1667153527889484048
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Oct 2022 11:12:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TnQVoMql;
 spf=pass (domain: gmail.com, ip: 209.85.166.172, mailfrom: alex.kiernan@gmail.com)
Received: by mail-il1-f172.google.com with SMTP id o13so5308277ilc.7
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Oct 2022 11:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nFpDiletELX8ABBCp9sOb2ihGGpf3pzwV7C/YJu1rjY=;
        b=TnQVoMqljbLRYIc3Y+E/nnsSlDbHJo3eQ5gLqb+jFm1jWNyZvjCxewXFRNXRaKJxxN
         ewToN4rDWXMP8Ox7c/uJLmTXQic7GaCB3/iO5rRy1uoBzyzyrAcSEePYm7dZsXwHFNe+
         Y3SKUSglrRasqKyrxpWN0L8bCHzif/4ohc5DryIpy4y4/jYMIKe89Mu0+B2LYxQk22wx
         156shYgxDz7jt6jd6lZk7uD2SpdSGz3CjRSUnQBwwQS5usxpqL22W1fL5EToPjrUgWWz
         eOF78dl+7EcsVD9MTNyVmChx5JNjZNLeBq+Rzua99/bT5WT9PcWRdCH70okVh8IJocqo
         72Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nFpDiletELX8ABBCp9sOb2ihGGpf3pzwV7C/YJu1rjY=;
        b=RnWgjA9PYARvWyBZF25r6rtkYN8/bPHNYOsV1cUQpJ7wQL3yMxkQ578bv1+yXsw8kJ
         UET2rxKjrD5JnZ6qufnAIyC6Pn7gFw4bqncpvDhYVYCCfjbglLLEdTx/RkbNVOjmNFR9
         2UJo5EQTIsAaQ11n9GyBWL0T1DsZ0UBfggzfqHxj7RePlIfOiyr8jUgtotS5eYp7uBZZ
         hOgFZ5DbsloEvWwI+jbIbDbl9RkHyezO0qdwwwJWqnbsqpGff+XToa/uft06wypzWYlB
         UN9SMq02VBCJoxbflLFE6cqMAYDMQG8pplTGrYftFbzXS6SJtG5mCCP73p3xy5J4lURo
         6aWQ==
X-Gm-Message-State: ACrzQf0WFquD6b30R1Dgomt95yzX5BM+kQeM+ivkAXC+Qfx7Fhm9YAiu
	wx04cdq29bilUGSv92U1CPXW0uLEirqWR2aWvz4=
X-Google-Smtp-Source: AMsMyM6fYTp8jjpXu6+fEOrJ1CAtKEvNGv4cM9vyu7s+CDIkS0o2Y8YoOkycwrmD7z2XN7U9xU8KHzAPLSJwLguoVYc=
X-Received: by 2002:a92:504:0:b0:2fb:43d:2271 with SMTP id q4-20020a920504000000b002fb043d2271mr4887858ile.256.1667153527118;
 Sun, 30 Oct 2022 11:12:07 -0700 (PDT)
MIME-Version: 1.0
References: <20221030173815.10212-1-alex.kiernan@gmail.com>
 <20221030173815.10212-2-alex.kiernan@gmail.com> <CANNYZj_VyT8xSFF=un1cF_4PugEOhuP-hkN3K66XOc_MvbAV6g@mail.gmail.com>
In-Reply-To: <CANNYZj_VyT8xSFF=un1cF_4PugEOhuP-hkN3K66XOc_MvbAV6g@mail.gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Sun, 30 Oct 2022 18:11:56 +0000
Message-ID: <CAO5Uq5TkQtPoGV4NETup9NSVf+ybewXhi=YzoSQ4t2GTpDhecA@mail.gmail.com>
Subject: Re: [OE-Core][PATCH 2/2] cargo_common.bbclass: Support local github repos
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Oct 2022 18:12:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172286

I was wondering about how to do that - my test case was
https://github.com/akiernan/uuid-test, but that's clearly not
adequate; the recipe there comes from `cargo bitbake` as `bitbake -c
update_crates` doesn't deal with git dependencies, or dig down into
transitive deps, which also needs solving.

I'm not clear if something like this could be added as part of the
stuff that's in master-next for rust tests? Or if we need to build out
something new.

On Sun, Oct 30, 2022 at 5:58 PM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> There doesn=E2=80=99t seem to be a test case or an example for this. How =
can we ensure the code is correct?
>
> Alex
>
> On Sun 30. Oct 2022 at 18.38, Alex Kiernan <alex.kiernan@gmail.com> wrote=
:
>>
>> Since disable network was added cargo configurations which reference git
>> repos fail as they attempt to fetch across the network as part of
>> do_compile, even if EXTRA_OECARGO_PATHS to add them as part of `paths`
>> is used, as this is documented as only working for packages which exist
>> in crates.io.
>>
>> Add parsing of the SRC_URIs for git repos and include `[patch]` sections
>> to redirect to the checked out source repos which the bitbake fetcher
>> has already populated.
>>
>> There are still cases which don't work - if you have multiple copies of
>> the same repo with different revisions, there's currently no way to
>> represent that and anything using a repo which has a virtual manifest
>> will fail to build (see https://github.com/rust-lang/cargo/issues/4934).
>>
>> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
>> ---
>>  meta/classes-recipe/cargo_common.bbclass | 30 ++++++++++++++++++++++++
>>  1 file changed, 30 insertions(+)
>>
>> diff --git a/meta/classes-recipe/cargo_common.bbclass b/meta/classes-rec=
ipe/cargo_common.bbclass
>> index f503a001dd8e..63b13829084b 100644
>> --- a/meta/classes-recipe/cargo_common.bbclass
>> +++ b/meta/classes-recipe/cargo_common.bbclass
>> @@ -116,6 +116,36 @@ cargo_common_do_configure () {
>>         EOF
>>  }
>>
>> +python cargo_common_do_patch_paths() {
>> +    cargo_config =3D os.path.join(d.getVar("CARGO_HOME"), "config")
>> +    if not os.path.exists(cargo_config):
>> +        return
>> +
>> +    src_uri =3D (d.getVar('SRC_URI') or "").split()
>> +    if len(src_uri) =3D=3D 0:
>> +        return
>> +
>> +    patches =3D dict()
>> +    workdir =3D d.getVar('WORKDIR')
>> +    fetcher =3D bb.fetch2.Fetch(src_uri, d)
>> +    for url in fetcher.urls:
>> +        ud =3D fetcher.ud[url]
>> +        if ud.type =3D=3D 'git':
>> +            name =3D ud.parm.get('name')
>> +            destsuffix =3D ud.parm.get('destsuffix')
>> +            if name is not None and destsuffix is not None:
>> +                repo =3D '%s://%s%s' % (ud.proto, ud.host, ud.path)
>> +                path =3D '%s =3D { path =3D "%s" }' % (name, os.path.jo=
in(workdir, destsuffix))
>> +                patches.setdefault(repo, []).append(path)
>> +
>> +    with open(cargo_config, "a+") as config:
>> +        for k, v in patches.items():
>> +            print('\n[patch."%s"]' % k, file=3Dconfig)
>> +            for name in v:
>> +                print(name, file=3Dconfig)
>> +}
>> +do_configure[postfuncs] +=3D "cargo_common_do_patch_paths"
>> +
>>  oe_cargo_fix_env () {
>>         export CC=3D"${RUST_TARGET_CC}"
>>         export CXX=3D"${RUST_TARGET_CXX}"
>> --
>> 2.35.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#172284): https://lists.openembedded.org/g/openembedd=
ed-core/message/172284
>> Mute This Topic: https://lists.openembedded.org/mt/94668827/1686489
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [a=
lex.kanavin@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>


--=20
Alex Kiernan

