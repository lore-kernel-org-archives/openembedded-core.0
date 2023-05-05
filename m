Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4ED9C77B75
	for <webhook@archiver.kernel.org>; Fri,  5 May 2023 04:00:21 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web10.19559.1683259214675444330
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 May 2023 21:00:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=PRxxjozP;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-4ec9c7c6986so1483516e87.0
        for <openembedded-core@lists.openembedded.org>; Thu, 04 May 2023 21:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683259213; x=1685851213;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BFRMl//LTTCRl5l52VW0AEj9eNSV0h1jNsFC3TkrMqI=;
        b=PRxxjozP9p4hNpclpqcyefl01aeweJOBZR/gSPCkYmCnUqMy23iNLMbVWf7S+RKBVy
         06kBjk8cdlejk6HxKljRd503+W3PRa7eAauvzOzr4wxohavOPpdke5FzmE5lOMvc6p6i
         z+oiTeTNWJ17dc/ILzevL1I+psaS431ed/mduZfjcWVh38g1mkGIieN0jsFgBcxrBQ7D
         BY5CGV+RzOuGYIO967hNNNiwcoiB5hk+TegRUEgyv/5Ql7Enmj/eReTl2vsdxyBCVaFp
         xDEb7pUSCs6EoheA9qydIUk9FxJuxR6E30F9pQK5IkuENt9I7cjBGCasquyDdq4oTe09
         O3ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683259213; x=1685851213;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BFRMl//LTTCRl5l52VW0AEj9eNSV0h1jNsFC3TkrMqI=;
        b=EQP5IxkclunYwDhjy1rT4ldZOah6yjPoglCyWXaOtPgIs8jzmqpj88xmONb7NJXVPo
         t5T19Wf6l9YrEIyCoiQl0eUGyx9R7uW8x1CJOJHh+ZXgeuFgjXu9Q6H35ddej2rEExSV
         c39u66xWMilYtQhr3wcQOl4A4JZ6V3mTk/JFmtPW624PFabt5jAEPpf4yD/G/96p9uLb
         lQFsm5Vm2VmpgV//FMfWYJR7wjPV+LG6uuhDYxhjo/qhTEvNx8BPA5v0r1QVmN3wykhB
         S5FWmD5DocmK3CS0ZRvmYoqNcEkOUcLaqgKtxkAzgnTumJMnVwy/+5LtCLMPA63x7UQm
         grvg==
X-Gm-Message-State: AC+VfDzzkv+DyhEEOu+sFkct+vhhVOrKcJTO7pA7g4ggMVC0SpsGAlFr
	e0ejk7PAzKibNQKcjUSniudVw1gVFCqUnFAgKKE=
X-Google-Smtp-Source: ACHHUZ6EarqjtcZ4qDre7LbDIuiCwW40DMnmWQH0AHQYotUwuDrI2NgzJSbOR/Pg7VCoFZyLLUYLRKMRbcezpYAJbCM=
X-Received: by 2002:a2e:9b84:0:b0:2ac:7e64:efd with SMTP id
 z4-20020a2e9b84000000b002ac7e640efdmr1315096lji.5.1683259212297; Thu, 04 May
 2023 21:00:12 -0700 (PDT)
MIME-Version: 1.0
References: <CANx9H-B4seY487YwfvgW2ze_n6MWr73kJsOTc8spdou32qubKg@mail.gmail.com>
 <57f1224b-14c5-2ba4-c752-98dba8f57a21@berginkonsult.se> <CANNYZj-uE2WUvfZpjq67wHyeFqQaN1L7HYp54Fm99J5UzS8cdw@mail.gmail.com>
 <CA+cAkeoxG-eF=PKs8en6TcjQ4yDJgit8JfrXjKdtVJSVkjj2aA@mail.gmail.com>
 <CA+cAkepRm8-TYJEJRLPPtr05+D_CsnYJDwPYsECEZ96cqpggOA@mail.gmail.com>
 <a0178343-4386-14af-82d0-cecd0074866e@berginkonsult.se> <CA+cAkeo5v+t4H8mOTjVvYwYPFd0SBMkSHBdhwACVAVc9wDYW4Q@mail.gmail.com>
 <23773eb0-0780-21f6-7ce7-708ec7f54b70@berginkonsult.se>
In-Reply-To: <23773eb0-0780-21f6-7ce7-708ec7f54b70@berginkonsult.se>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Fri, 5 May 2023 06:00:00 +0200
Message-ID: <CA+cAkeoXv29ryvxhge8ByQeq7q3ayWR=wUZp0qbwc5VxvdrceQ@mail.gmail.com>
Subject: Re: [OE-core] [RFC] python3-cryptogaphy upgrade to 40.0.2 issues
To: Peter Bergin <peter@berginkonsult.se>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000069f8b005faea5379"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 04:00:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180899

--00000000000069f8b005faea5379
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeu. 4 mai 2023, 21:44, Peter Bergin <peter@berginkonsult.se> a =C3=A9cr=
it :

>
> On 2023-05-04 19:13, Frederic Martinsons wrote:
>
>
>
> Le jeu. 4 mai 2023, 13:42, Peter Bergin <peter@berginkonsult.se> a =C3=A9=
crit :
>
>>
>> On 2023-05-04 12:03, Frederic Martinsons wrote:
>>
>>
>>
>> Le jeu. 4 mai 2023, 11:31, Fr=C3=A9d=C3=A9ric Martinsons <
>> frederic.martinsons@gmail.com> a =C3=A9crit :
>>
>>>
>>>
>>> On Thu, 4 May 2023 at 11:00, Alexander Kanavin <alex.kanavin@gmail.com>
>>> wrote:
>>>
>>>> On Thu, 4 May 2023 at 10:41, Peter Bergin <peter@berginkonsult.se>
>>>> wrote:
>>>>
>>>> > At
>>>> >
>>>> https://github.com/pyca/cryptography/blob/f816b457494e010b655cd7fdcd30=
e3446f86a703/src/rust/build.rs#L46
>>>> > the path to python includes is defined by calling 'python3 -c "impor=
t
>>>> > sysconfig; print(sysconfig.get_path('include'))"' (but from inside
>>>> > rust). With print-debugging this seems to return the bad string
>>>> > '/usr/include/python3.11' which is then passed to cc::Build
>>>> >
>>>> > I executed this in recipe context:
>>>> >
>>>> > do_compile:prepend() {
>>>> >      which python3
>>>> >      python3 -c "import sysconfig;
>>>> print(sysconfig.get_path('include'))"
>>>> > }
>>>> >
>>>> > and then I got the correct return value:
>>>> >
>>>> > |
>>>> >
>>>> /work/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-cryptograp=
hy/40.0.2-r0/recipe-sysroot-native/usr/bin/python3-native/python3
>>>> > |
>>>> >
>>>> /work/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-cryptograp=
hy/40.0.2-r0/recipe-sysroot-native/usr/include/python3.11
>>>>
>>>> This is pointing to the native sysroot in a target build, so it is
>>>> most likely not actually correct. I believe 'inherit
>>>> python3targetconfig' may help, as it substitutes most places where
>>>> native python gets queried by components with target-specific values.
>>>>
>>>> Alex
>>>>
>>>
>>> Unless I'm mistaken , in the error message we can see that the compiler
>>> specified the sysroot correctly (recipe-sysroot and recipe-sysroot-nati=
ve)
>>>
>>
>> recipe-sysroot and NOT recipe-sysroot-native
>>
>> '--sysroot' is specified correct but that is not automatically add searc=
h
>> paths to '-I' directive, if I'm not misreading this:
>> https://gcc.gnu.org/onlinedocs/gcc/Directory-Options.html . When you use
>> --sysroot with gcc you have to add =3D or $SYSROOT to your -I directive =
in
>> order to add it to search path for headers. With that information I gues=
s
>> '-I =3D/usr/lib/python3.11' or '-I \$SYSROOT/usr/lib/python3.11' can wor=
k but
>> '-I /usr/lib/python3.11' will point to your host.
>>
>> /Peter
>>
> I'm confused by the gcc docs, from the same links you gave:
>
> --sysroot=3Ddir
>        Use dir as the logical root directory for headers and libraries.
> For example, if the compiler normally searches for headers in /usr/includ=
e
> and libraries in /usr/lib, it instead searches dir/usr/include and
> dir/usr/lib.
>
> So I don't know what to think (I never see -I used with '=3D' or $SYSROOT=
).
> I'll try to know more about that for my curiosity
>
> An example to illustrate:
>
>   $ cat main.c
>   #include "my-include.h"
>
>   int main(void) {
>       return 0;
>   }
>   $ tree dir1
>   dir1
>   =E2=94=94=E2=94=80=E2=94=80 dir2
>       =E2=94=94=E2=94=80=E2=94=80 my-include.h
>
>   1 directory, 1 file
>   $ gcc main.c
>   main.c:1:10: fatal error: my-include.h: No such file or directory
>       1 | #include "my-include.h"
>         |          ^~~~~~~~~~~~~~
>   compilation terminated.
>   $ gcc -I dir1/dir2 main.c
>   $ gcc --sysroot=3D$PWD/dir1 -I dir2 main.c
>   main.c:1:10: fatal error: my-include.h: No such file or directory
>       1 | #include "my-include.h"
>         |          ^~~~~~~~~~~~~~
>   compilation terminated.
>   $ gcc --sysroot=3D$PWD/dir1 -I =3D/dir2 main.c
>   $ gcc --sysroot=3D$PWD/dir1 -I \$SYSROOT/dir2 main.c
>
> /Peter
>
Thanks Peter, that was exactly what I wanted to try.

--00000000000069f8b005faea5379
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Le jeu. 4 mai 2023, 21:44, Peter Bergin &lt;<a href=3D=
"mailto:peter@berginkonsult.se">peter@berginkonsult.se</a>&gt; a =C3=A9crit=
=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">
 =20
   =20
 =20
  <div>
    <p><br>
    </p>
    <div>On 2023-05-04 19:13, Frederic
      Martinsons wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <div dir=3D"ltr">
        <div dir=3D"auto">
          <div><br>
            <br>
            <div class=3D"gmail_quote">
              <div dir=3D"ltr" class=3D"gmail_attr">Le jeu. 4 mai 2023,
                13:42, Peter Bergin &lt;<a href=3D"mailto:peter@berginkonsu=
lt.se" target=3D"_blank" rel=3D"noreferrer">peter@berginkonsult.se</a>&gt;
                a =C3=A9crit=C2=A0:<br>
              </div>
              <blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex">
                <div>
                  <p><br>
                  </p>
                  <div>On 2023-05-04 12:03, Frederic Martinsons wrote:<br>
                  </div>
                  <blockquote type=3D"cite">
                    <div dir=3D"auto">
                      <div><br>
                        <br>
                        <div class=3D"gmail_quote">
                          <div dir=3D"ltr" class=3D"gmail_attr">Le jeu. 4
                            mai 2023, 11:31, Fr=C3=A9d=C3=A9ric Martinsons =
&lt;<a href=3D"mailto:frederic.martinsons@gmail.com" rel=3D"noreferrer nore=
ferrer" target=3D"_blank">frederic.martinsons@gmail.com</a>&gt;
                            a =C3=A9crit=C2=A0:<br>
                          </div>
                          <blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
                            <div dir=3D"ltr">
                              <div dir=3D"ltr"><br>
                              </div>
                              <br>
                              <div class=3D"gmail_quote">
                                <div dir=3D"ltr" class=3D"gmail_attr">On
                                  Thu, 4 May 2023 at 11:00, Alexander
                                  Kanavin &lt;<a href=3D"mailto:alex.kanavi=
n@gmail.com" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">ale=
x.kanavin@gmail.com</a>&gt;
                                  wrote:<br>
                                </div>
                                <blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">On
                                  Thu, 4 May 2023 at 10:41, Peter Bergin
                                  &lt;<a href=3D"mailto:peter@berginkonsult=
.se" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">peter@bergi=
nkonsult.se</a>&gt;
                                  wrote:<br>
                                  <br>
                                  &gt; At<br>
                                  &gt; <a href=3D"https://github.com/pyca/c=
ryptography/blob/f816b457494e010b655cd7fdcd30e3446f86a703/src/rust/build.rs=
#L46" rel=3D"noreferrer noreferrer
                                    noreferrer noreferrer" target=3D"_blank=
">https://github.com/pyca/cryptography/blob/f816b457494e010b655cd7fdcd30e34=
46f86a703/src/rust/build.rs#L46</a><br>
                                  &gt; the path to python includes is
                                  defined by calling &#39;python3 -c &quot;=
import<br>
                                  &gt; sysconfig;
                                  print(sysconfig.get_path(&#39;include&#39=
;))&quot;&#39;
                                  (but from inside<br>
                                  &gt; rust). With print-debugging this
                                  seems to return the bad string<br>
                                  &gt; &#39;/usr/include/python3.11&#39; wh=
ich
                                  is then passed to cc::Build<br>
                                  &gt;<br>
                                  &gt; I executed this in recipe
                                  context:<br>
                                  &gt;<br>
                                  &gt; do_compile:prepend() {<br>
                                  &gt;=C2=A0 =C2=A0 =C2=A0 which python3<br=
>
                                  &gt;=C2=A0 =C2=A0 =C2=A0 python3 -c &quot=
;import
                                  sysconfig;
                                  print(sysconfig.get_path(&#39;include&#39=
;))&quot;<br>
                                  &gt; }<br>
                                  &gt;<br>
                                  &gt; and then I got the correct return
                                  value:<br>
                                  &gt;<br>
                                  &gt; |<br>
                                  &gt;
/work/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-cryptography/40=
.0.2-r0/recipe-sysroot-native/usr/bin/python3-native/python3<br>
                                  &gt; |<br>
                                  &gt;
/work/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-cryptography/40=
.0.2-r0/recipe-sysroot-native/usr/include/python3.11<br>
                                  <br>
                                  This is pointing to the native sysroot
                                  in a target build, so it is<br>
                                  most likely not actually correct. I
                                  believe &#39;inherit<br>
                                  python3targetconfig&#39; may help, as it
                                  substitutes most places where<br>
                                  native python gets queried by
                                  components with target-specific
                                  values.<br>
                                  <br>
                                  Alex<br>
                                </blockquote>
                                <div><br>
                                </div>
                                <div>Unless I&#39;m mistaken , in the error
                                  message we can see that the compiler
                                  specified the sysroot correctly
                                  (recipe-sysroot and
                                  recipe-sysroot-native)</div>
                              </div>
                            </div>
                          </blockquote>
                        </div>
                      </div>
                      <div dir=3D"auto"><br>
                      </div>
                      <div dir=3D"auto">recipe-sysroot and NOT
                        recipe-sysroot-native <br>
                      </div>
                    </div>
                  </blockquote>
                  <p>&#39;--sysroot&#39; is specified correct but that is n=
ot
                    automatically add search paths to &#39;-I&#39; directiv=
e, if
                    I&#39;m not misreading this: <a href=3D"https://gcc.gnu=
.org/onlinedocs/gcc/Directory-Options.html" rel=3D"noreferrer noreferrer" t=
arget=3D"_blank">https://gcc.gnu.org/onlinedocs/gcc/Directory-Options.html<=
/a>
                    . When you use --sysroot with gcc you have to add =3D
                    or $SYSROOT to your -I directive in order to add it
                    to search path for headers. With that information I
                    guess &#39;-I =3D/usr/lib/python3.11&#39; or &#39;-I
                    \$SYSROOT/usr/lib/python3.11&#39; can work but &#39;-I
                    /usr/lib/python3.11&#39; will point to your host.</p>
                  <p>/Peter</p>
                </div>
              </blockquote>
            </div>
          </div>
          <div dir=3D"auto">I&#39;m confused by the gcc docs, from the same
            links you gave:</div>
          <div dir=3D"auto"><br>
          </div>
          <div dir=3D"auto">--sysroot=3Ddir<br>
            =C2=A0 =C2=A0 =C2=A0 =C2=A0Use dir as the logical root director=
y for headers and
            libraries. For example, if the compiler normally searches
            for headers in /usr/include and libraries in /usr/lib, it
            instead searches dir/usr/include and dir/usr/lib.<br>
          </div>
          <div dir=3D"auto"><br>
          </div>
          <div>So I don&#39;t know what to think (I never see -I used with
            &#39;=3D&#39; or $SYSROOT). I&#39;ll try to know more about tha=
t for my
            curiosity</div>
        </div>
      </div>
    </blockquote>
    <p>An example to illustrate:</p>
    <p>=C2=A0 $ cat main.c <br>
      =C2=A0 #include &quot;my-include.h&quot;<br>
      <br>
      =C2=A0 int main(void) {<br>
      =C2=A0 =C2=A0 =C2=A0 return 0;<br>
      =C2=A0 }<br>
      =C2=A0 $ tree dir1<br>
      =C2=A0 dir1<br>
      =C2=A0 =E2=94=94=E2=94=80=E2=94=80 dir2<br>
      =C2=A0 =C2=A0 =C2=A0 =E2=94=94=E2=94=80=E2=94=80 my-include.h<br>
      <br>
      =C2=A0 1 directory, 1 file<br>
      =C2=A0 $ gcc main.c<br>
      =C2=A0 main.c:1:10: fatal error: my-include.h: No such file or
      directory<br>
      =C2=A0 =C2=A0 =C2=A0 1 | #include &quot;my-include.h&quot;<br>
      =C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~~~~~<br>
      =C2=A0 compilation terminated.<br>
      =C2=A0 $ gcc -I dir1/dir2 main.c<br>
      =C2=A0 $ gcc --sysroot=3D$PWD/dir1 -I dir2 main.c<br>
      =C2=A0 main.c:1:10: fatal error: my-include.h: No such file or
      directory<br>
      =C2=A0 =C2=A0 =C2=A0 1 | #include &quot;my-include.h&quot;<br>
      =C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~~~~~<br>
      =C2=A0 compilation terminated.<br>
      =C2=A0 $ gcc --sysroot=3D$PWD/dir1 -I =3D/dir2 main.c<br>
      =C2=A0 $ gcc --sysroot=3D$PWD/dir1 -I \$SYSROOT/dir2 main.c<br>
      <br>
    </p>
    <p>/Peter</p></div></blockquote></div></div><div dir=3D"auto">Thanks Pe=
ter, that was exactly what I wanted to try.</div><div dir=3D"auto"></div></=
div>

--00000000000069f8b005faea5379--

