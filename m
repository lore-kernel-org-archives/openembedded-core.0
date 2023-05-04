Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EDAEC77B7C
	for <webhook@archiver.kernel.org>; Thu,  4 May 2023 10:03:56 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web10.46059.1683194626604329267
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 May 2023 03:03:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=OOkVxWSq;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-4f13ef4ad91so308797e87.3
        for <openembedded-core@lists.openembedded.org>; Thu, 04 May 2023 03:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683194625; x=1685786625;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nYsWextjGscePSGSzxQWaadydjFg6qmJOtxYTBIdozI=;
        b=OOkVxWSq9vm8aJT9o2i0TV316j8sB3Zi1it9mfJkdEUXRs9b5ZKntCDrgk5OJ0VBcR
         P2CdFMBYrM52d7YY3jyeSesLOt6cuvP0HocrDnRLOyMYFOFvdL0Cy3HXxHQGvAoCHyHp
         +QCqqt3mxBsjRSb6FUO0Xa+rbKwwbSE+S85Ncya7JOQ8EUtLOskIj5AOvKi8Q/TAVwVz
         aVCHOgcwbV+7LehBRxo/nU2YcJzrAiQ7FfbL1vTVNOGGwv1ywl2ZlTspbIHBVhk0YNAt
         A5IvyuPVfz5FCbRpqJhF7hZRaiK7lAqy2ZPCmbKd2lcC51aLeTGTeQKRdd3HfewAIZiW
         2ynA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683194625; x=1685786625;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nYsWextjGscePSGSzxQWaadydjFg6qmJOtxYTBIdozI=;
        b=LnqHjtJJzZuScBEzYepbbPC2rcVVkEcD9TLLg9m1/ixHhxSS30idKtIssxx2s/KwzB
         ccjrbvO6ML2DTABro1qJipEXPPdjv3RaM97QWZuOUr3Q3+hnzdQrLSfH2mBhAqLHvMfk
         oMPeYm98AlZBj55eU1+XvMKShAQX9xucIfTkCZIwyZ3KRfjuJuLCw2gG9YWyFgTVa//8
         9kqu9ZyZIkS4KxM3TvcUbWR3HhW4wmchhUWIsMIYEOESRYgVB9G2OH9Jv0cz4MB744SR
         6+IcSi16qURrBldNkyxMzYG4e8h9HQ3fB/NZdWZT1zSxNSjD+Ci3PlrXqh7/LHx6Aanj
         bZwQ==
X-Gm-Message-State: AC+VfDzWnLn7EJQgBhBYGsw5z2puMIr7/6eA79VbH/eGyH9MebeAIldH
	wwp5hjCCze3pMOKPgDgKEmjNnZFaX0g78Dw127M=
X-Google-Smtp-Source: ACHHUZ74B/2hhNYpqz4wItuKz/fmzV3pOYhQgvIWA9nFENYO0e5oKEsKlbujATvJoS3t0+1JDUMb2AkqRHU9yyHTILU=
X-Received: by 2002:ac2:4209:0:b0:4ec:8cad:3c39 with SMTP id
 y9-20020ac24209000000b004ec8cad3c39mr1410524lfh.61.1683194624513; Thu, 04 May
 2023 03:03:44 -0700 (PDT)
MIME-Version: 1.0
References: <CANx9H-B4seY487YwfvgW2ze_n6MWr73kJsOTc8spdou32qubKg@mail.gmail.com>
 <57f1224b-14c5-2ba4-c752-98dba8f57a21@berginkonsult.se> <CANNYZj-uE2WUvfZpjq67wHyeFqQaN1L7HYp54Fm99J5UzS8cdw@mail.gmail.com>
 <CA+cAkeoxG-eF=PKs8en6TcjQ4yDJgit8JfrXjKdtVJSVkjj2aA@mail.gmail.com>
In-Reply-To: <CA+cAkeoxG-eF=PKs8en6TcjQ4yDJgit8JfrXjKdtVJSVkjj2aA@mail.gmail.com>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Thu, 4 May 2023 12:03:33 +0200
Message-ID: <CA+cAkepRm8-TYJEJRLPPtr05+D_CsnYJDwPYsECEZ96cqpggOA@mail.gmail.com>
Subject: Re: [OE-core] [RFC] python3-cryptogaphy upgrade to 40.0.2 issues
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Peter Bergin <peter@berginkonsult.se>, Tim Orling <ticotimo@gmail.com>, 
	openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000aea01605fadb4954"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 May 2023 10:03:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180860

--000000000000aea01605fadb4954
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeu. 4 mai 2023, 11:31, Fr=C3=A9d=C3=A9ric Martinsons <
frederic.martinsons@gmail.com> a =C3=A9crit :

>
>
> On Thu, 4 May 2023 at 11:00, Alexander Kanavin <alex.kanavin@gmail.com>
> wrote:
>
>> On Thu, 4 May 2023 at 10:41, Peter Bergin <peter@berginkonsult.se> wrote=
:
>>
>> > At
>> >
>> https://github.com/pyca/cryptography/blob/f816b457494e010b655cd7fdcd30e3=
446f86a703/src/rust/build.rs#L46
>> > the path to python includes is defined by calling 'python3 -c "import
>> > sysconfig; print(sysconfig.get_path('include'))"' (but from inside
>> > rust). With print-debugging this seems to return the bad string
>> > '/usr/include/python3.11' which is then passed to cc::Build
>> >
>> > I executed this in recipe context:
>> >
>> > do_compile:prepend() {
>> >      which python3
>> >      python3 -c "import sysconfig; print(sysconfig.get_path('include')=
)"
>> > }
>> >
>> > and then I got the correct return value:
>> >
>> > |
>> >
>> /work/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-cryptography=
/40.0.2-r0/recipe-sysroot-native/usr/bin/python3-native/python3
>> > |
>> >
>> /work/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-cryptography=
/40.0.2-r0/recipe-sysroot-native/usr/include/python3.11
>>
>> This is pointing to the native sysroot in a target build, so it is
>> most likely not actually correct. I believe 'inherit
>> python3targetconfig' may help, as it substitutes most places where
>> native python gets queried by components with target-specific values.
>>
>> Alex
>>
>
> Unless I'm mistaken , in the error message we can see that the compiler
> specified the sysroot correctly (recipe-sysroot and recipe-sysroot-native=
)
>

recipe-sysroot and NOT recipe-sysroot-native

and so the path /usr/include/python3.11 is correct under this sysroot
> (Python.h lies there).
>
> I would like to have a verbose output which show the compiler command arg=
s
> for python3-cryptography 39.0.2 to compare
> the compiler arguments but I didn't manage to do it for now (tried to put
> a config.toml in src/rust/.cargo with term.verbose=3Dtrue).
>

--000000000000aea01605fadb4954
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Le jeu. 4 mai 2023, 11:31, Fr=C3=A9d=C3=A9ric Martinso=
ns &lt;<a href=3D"mailto:frederic.martinsons@gmail.com">frederic.martinsons=
@gmail.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, 4 May 2023 at 11:00, Alex=
ander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blan=
k" rel=3D"noreferrer">alex.kanavin@gmail.com</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">On Thu, 4 May 2023 at 10:41, Pe=
ter Bergin &lt;<a href=3D"mailto:peter@berginkonsult.se" target=3D"_blank" =
rel=3D"noreferrer">peter@berginkonsult.se</a>&gt; wrote:<br>
<br>
&gt; At<br>
&gt; <a href=3D"https://github.com/pyca/cryptography/blob/f816b457494e010b6=
55cd7fdcd30e3446f86a703/src/rust/build.rs#L46" rel=3D"noreferrer noreferrer=
" target=3D"_blank">https://github.com/pyca/cryptography/blob/f816b457494e0=
10b655cd7fdcd30e3446f86a703/src/rust/build.rs#L46</a><br>
&gt; the path to python includes is defined by calling &#39;python3 -c &quo=
t;import<br>
&gt; sysconfig; print(sysconfig.get_path(&#39;include&#39;))&quot;&#39; (bu=
t from inside<br>
&gt; rust). With print-debugging this seems to return the bad string<br>
&gt; &#39;/usr/include/python3.11&#39; which is then passed to cc::Build<br=
>
&gt;<br>
&gt; I executed this in recipe context:<br>
&gt;<br>
&gt; do_compile:prepend() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 which python3<br>
&gt;=C2=A0 =C2=A0 =C2=A0 python3 -c &quot;import sysconfig; print(sysconfig=
.get_path(&#39;include&#39;))&quot;<br>
&gt; }<br>
&gt;<br>
&gt; and then I got the correct return value:<br>
&gt;<br>
&gt; |<br>
&gt; /work/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-cryptograp=
hy/40.0.2-r0/recipe-sysroot-native/usr/bin/python3-native/python3<br>
&gt; |<br>
&gt; /work/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-cryptograp=
hy/40.0.2-r0/recipe-sysroot-native/usr/include/python3.11<br>
<br>
This is pointing to the native sysroot in a target build, so it is<br>
most likely not actually correct. I believe &#39;inherit<br>
python3targetconfig&#39; may help, as it substitutes most places where<br>
native python gets queried by components with target-specific values.<br>
<br>
Alex<br></blockquote><div><br></div><div>Unless I&#39;m mistaken , in the e=
rror message we can see that the compiler specified the sysroot correctly (=
recipe-sysroot and recipe-sysroot-native)</div></div></div></blockquote></d=
iv></div><div dir=3D"auto"><br></div><div dir=3D"auto">recipe-sysroot and N=
OT recipe-sysroot-native=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D=
"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=
=3D"ltr"><div class=3D"gmail_quote"><div>and so the path /usr/include/pytho=
n3.11 is correct under this sysroot (Python.h lies there).</div><div><br></=
div><div>I would like to have a verbose output which show the compiler comm=
and args for python3-cryptography 39.0.2 to compare</div><div>the compiler =
arguments but I didn&#39;t manage to do it for now (tried to put a config.t=
oml in src/rust/.cargo with term.verbose=3Dtrue).</div></div></div>
</blockquote></div></div></div>

--000000000000aea01605fadb4954--

