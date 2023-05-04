Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02E80C77B78
	for <webhook@archiver.kernel.org>; Thu,  4 May 2023 17:14:19 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web10.664.1683220449115948854
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 May 2023 10:14:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=HL/Znog9;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-4efeea05936so882978e87.2
        for <openembedded-core@lists.openembedded.org>; Thu, 04 May 2023 10:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683220447; x=1685812447;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=r+ZNtOILUmatHlHIPbGRqlNwoRq2poHNxA2r/CU0F9E=;
        b=HL/Znog9tJq1A5cApcvAYA8GGLpd8L+UgV6ygcgBZTlemlNskuZmgGwy9GeI8lJq0n
         Wyxy36/GncN++8WkY9VQxkxUGmBgGIxU74ohWEo97NZGkc0OXM3/TyzugFPaOK227gtE
         2vwwGDxZkREOauz/PC70Wby0Uu9oSpX56nhBiJI+OW9iDRfKamFzYnz24hPbCYsTkjAA
         36vvTu20/eWf4G1OK9htL7hhPxP2sKxJOl2hGPis8l68pGOLkr7gdwP5Q0QfD/GZhoSl
         NX5VpkPrD1xSGgBLFoEpKyWd+WKc0YEsfxiAHO0YK16AfGHqqDXfGDJrTwrp8Pr5K+Ef
         ulDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683220447; x=1685812447;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r+ZNtOILUmatHlHIPbGRqlNwoRq2poHNxA2r/CU0F9E=;
        b=lw4K323o9bGX6pmjQ4lnhUItjrh8ithRbxIyWc2XB7C8LeKnzJwE2j2glsFrwoo5MY
         SSqH1lwk+0+wxnPi+RbKkd7sy2G1CpumgnKIDM/ZC/RnqWlrXeXyjcg3c2YsfuVIV1OG
         ZD6Q7biOwtzMy+b3fEkLfDb5FEcw/wHxL9eDzlG1W0GWpU6K1tkepYZvyfQ8ct5s0Fcj
         Y3B4RdayMWcXdGFzfjDc+d8XmyCy8vue/76//EtnUVlG96oyF2Pn8V3MtNR1Jdeb08HE
         4KQz+Ky3f8TCwTz3ABxPCzuHW4k0WkzSNLKN1epOVf/m92mUD7WVH9ReiDxXKvxqIKFo
         3feQ==
X-Gm-Message-State: AC+VfDwKdI2yfPSYynJQu9jO4Z3S5IpJhRTY91GL2VZq5SA1TLm4lB2e
	WdlXvfIaUhXGuaBOK9GLvcMqUeK2UmN77SQiCI8=
X-Google-Smtp-Source: ACHHUZ7RPjB/aT3VBeyLdaU1BfhckXmfCTu0LxlwkCTG3M9WuAcVSTff0zdNFxdOo2mKXsUlxCyeVdolDOkzXoqsjjs=
X-Received: by 2002:a19:551a:0:b0:4eb:c85:60ee with SMTP id
 n26-20020a19551a000000b004eb0c8560eemr1706210lfe.34.1683220446520; Thu, 04
 May 2023 10:14:06 -0700 (PDT)
MIME-Version: 1.0
References: <CANx9H-B4seY487YwfvgW2ze_n6MWr73kJsOTc8spdou32qubKg@mail.gmail.com>
 <57f1224b-14c5-2ba4-c752-98dba8f57a21@berginkonsult.se> <CANNYZj-uE2WUvfZpjq67wHyeFqQaN1L7HYp54Fm99J5UzS8cdw@mail.gmail.com>
 <CA+cAkeoxG-eF=PKs8en6TcjQ4yDJgit8JfrXjKdtVJSVkjj2aA@mail.gmail.com>
 <CA+cAkepRm8-TYJEJRLPPtr05+D_CsnYJDwPYsECEZ96cqpggOA@mail.gmail.com> <a0178343-4386-14af-82d0-cecd0074866e@berginkonsult.se>
In-Reply-To: <a0178343-4386-14af-82d0-cecd0074866e@berginkonsult.se>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Thu, 4 May 2023 19:13:54 +0200
Message-ID: <CA+cAkeo5v+t4H8mOTjVvYwYPFd0SBMkSHBdhwACVAVc9wDYW4Q@mail.gmail.com>
Subject: Re: [OE-core] [RFC] python3-cryptogaphy upgrade to 40.0.2 issues
To: Peter Bergin <peter@berginkonsult.se>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, Tim Orling <ticotimo@gmail.com>, 
	openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000cb2c4b05fae14c9a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 May 2023 17:14:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180885

--000000000000cb2c4b05fae14c9a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeu. 4 mai 2023, 13:42, Peter Bergin <peter@berginkonsult.se> a =C3=A9cr=
it :

>
> On 2023-05-04 12:03, Frederic Martinsons wrote:
>
>
>
> Le jeu. 4 mai 2023, 11:31, Fr=C3=A9d=C3=A9ric Martinsons <
> frederic.martinsons@gmail.com> a =C3=A9crit :
>
>>
>>
>> On Thu, 4 May 2023 at 11:00, Alexander Kanavin <alex.kanavin@gmail.com>
>> wrote:
>>
>>> On Thu, 4 May 2023 at 10:41, Peter Bergin <peter@berginkonsult.se>
>>> wrote:
>>>
>>> > At
>>> >
>>> https://github.com/pyca/cryptography/blob/f816b457494e010b655cd7fdcd30e=
3446f86a703/src/rust/build.rs#L46
>>> > the path to python includes is defined by calling 'python3 -c "import
>>> > sysconfig; print(sysconfig.get_path('include'))"' (but from inside
>>> > rust). With print-debugging this seems to return the bad string
>>> > '/usr/include/python3.11' which is then passed to cc::Build
>>> >
>>> > I executed this in recipe context:
>>> >
>>> > do_compile:prepend() {
>>> >      which python3
>>> >      python3 -c "import sysconfig;
>>> print(sysconfig.get_path('include'))"
>>> > }
>>> >
>>> > and then I got the correct return value:
>>> >
>>> > |
>>> >
>>> /work/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-cryptograph=
y/40.0.2-r0/recipe-sysroot-native/usr/bin/python3-native/python3
>>> > |
>>> >
>>> /work/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-cryptograph=
y/40.0.2-r0/recipe-sysroot-native/usr/include/python3.11
>>>
>>> This is pointing to the native sysroot in a target build, so it is
>>> most likely not actually correct. I believe 'inherit
>>> python3targetconfig' may help, as it substitutes most places where
>>> native python gets queried by components with target-specific values.
>>>
>>> Alex
>>>
>>
>> Unless I'm mistaken , in the error message we can see that the compiler
>> specified the sysroot correctly (recipe-sysroot and recipe-sysroot-nativ=
e)
>>
>
> recipe-sysroot and NOT recipe-sysroot-native
>
> '--sysroot' is specified correct but that is not automatically add search
> paths to '-I' directive, if I'm not misreading this:
> https://gcc.gnu.org/onlinedocs/gcc/Directory-Options.html . When you use
> --sysroot with gcc you have to add =3D or $SYSROOT to your -I directive i=
n
> order to add it to search path for headers. With that information I guess
> '-I =3D/usr/lib/python3.11' or '-I \$SYSROOT/usr/lib/python3.11' can work=
 but
> '-I /usr/lib/python3.11' will point to your host.
>
> /Peter
>
I'm confused by the gcc docs, from the same links you gave:

--sysroot=3Ddir
       Use dir as the logical root directory for headers and libraries. For
example, if the compiler normally searches for headers in /usr/include and
libraries in /usr/lib, it instead searches dir/usr/include and dir/usr/lib.

So I don't know what to think (I never see -I used with '=3D' or $SYSROOT).
I'll try to know more about that for my curiosity

>

--000000000000cb2c4b05fae14c9a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"auto"><div><br><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Le jeu. 4 mai 2023, 13:42, Peter Berg=
in &lt;<a href=3D"mailto:peter@berginkonsult.se" target=3D"_blank">peter@be=
rginkonsult.se</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex">
 =20
   =20
 =20
  <div>
    <p><br>
    </p>
    <div>On 2023-05-04 12:03, Frederic
      Martinsons wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <div dir=3D"auto">
        <div><br>
          <br>
          <div class=3D"gmail_quote">
            <div dir=3D"ltr" class=3D"gmail_attr">Le jeu. 4 mai 2023, 11:31=
,
              Fr=C3=A9d=C3=A9ric Martinsons &lt;<a href=3D"mailto:frederic.=
martinsons@gmail.com" rel=3D"noreferrer" target=3D"_blank">frederic.martins=
ons@gmail.com</a>&gt;
              a =C3=A9crit=C2=A0:<br>
            </div>
            <blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">
              <div dir=3D"ltr">
                <div dir=3D"ltr"><br>
                </div>
                <br>
                <div class=3D"gmail_quote">
                  <div dir=3D"ltr" class=3D"gmail_attr">On Thu, 4 May 2023
                    at 11:00, Alexander Kanavin &lt;<a href=3D"mailto:alex.=
kanavin@gmail.com" rel=3D"noreferrer noreferrer" target=3D"_blank">alex.kan=
avin@gmail.com</a>&gt;
                    wrote:<br>
                  </div>
                  <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Thu,=
 4 May
                    2023 at 10:41, Peter Bergin &lt;<a href=3D"mailto:peter=
@berginkonsult.se" rel=3D"noreferrer noreferrer" target=3D"_blank">peter@be=
rginkonsult.se</a>&gt;
                    wrote:<br>
                    <br>
                    &gt; At<br>
                    &gt; <a href=3D"https://github.com/pyca/cryptography/bl=
ob/f816b457494e010b655cd7fdcd30e3446f86a703/src/rust/build.rs#L46" rel=3D"n=
oreferrer noreferrer noreferrer" target=3D"_blank">https://github.com/pyca/=
cryptography/blob/f816b457494e010b655cd7fdcd30e3446f86a703/src/rust/build.r=
s#L46</a><br>
                    &gt; the path to python includes is defined by
                    calling &#39;python3 -c &quot;import<br>
                    &gt; sysconfig;
                    print(sysconfig.get_path(&#39;include&#39;))&quot;&#39;=
 (but from
                    inside<br>
                    &gt; rust). With print-debugging this seems to
                    return the bad string<br>
                    &gt; &#39;/usr/include/python3.11&#39; which is then pa=
ssed
                    to cc::Build<br>
                    &gt;<br>
                    &gt; I executed this in recipe context:<br>
                    &gt;<br>
                    &gt; do_compile:prepend() {<br>
                    &gt;=C2=A0 =C2=A0 =C2=A0 which python3<br>
                    &gt;=C2=A0 =C2=A0 =C2=A0 python3 -c &quot;import syscon=
fig;
                    print(sysconfig.get_path(&#39;include&#39;))&quot;<br>
                    &gt; }<br>
                    &gt;<br>
                    &gt; and then I got the correct return value:<br>
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
                    This is pointing to the native sysroot in a target
                    build, so it is<br>
                    most likely not actually correct. I believe &#39;inheri=
t<br>
                    python3targetconfig&#39; may help, as it substitutes
                    most places where<br>
                    native python gets queried by components with
                    target-specific values.<br>
                    <br>
                    Alex<br>
                  </blockquote>
                  <div><br>
                  </div>
                  <div>Unless I&#39;m mistaken , in the error message we ca=
n
                    see that the compiler specified the sysroot
                    correctly (recipe-sysroot and recipe-sysroot-native)</d=
iv>
                </div>
              </div>
            </blockquote>
          </div>
        </div>
        <div dir=3D"auto"><br>
        </div>
        <div dir=3D"auto">recipe-sysroot and NOT recipe-sysroot-native <br>
        </div>
      </div>
    </blockquote>
    <p>&#39;--sysroot&#39; is specified correct but that is not automatical=
ly
      add search paths to &#39;-I&#39; directive, if I&#39;m not misreading=
 this:
      <a href=3D"https://gcc.gnu.org/onlinedocs/gcc/Directory-Options.html"=
 rel=3D"noreferrer" target=3D"_blank">https://gcc.gnu.org/onlinedocs/gcc/Di=
rectory-Options.html</a> . When
      you use --sysroot with gcc you have to add =3D or $SYSROOT to your
      -I directive in order to add it to search path for headers. With
      that information I guess &#39;-I =3D/usr/lib/python3.11&#39; or &#39;=
-I
      \$SYSROOT/usr/lib/python3.11&#39; can work but &#39;-I
      /usr/lib/python3.11&#39; will point to your host.</p>
    <p>/Peter</p></div></blockquote></div></div><div dir=3D"auto">I&#39;m c=
onfused by the gcc docs, from the same links you gave:</div><div dir=3D"aut=
o"><br></div><div dir=3D"auto">--sysroot=3Ddir<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0Use dir as the logical root directory for headers and libraries. For exa=
mple, if the compiler normally searches for headers in /usr/include and lib=
raries in /usr/lib, it instead searches dir/usr/include and dir/usr/lib.<br=
></div><div dir=3D"auto"><br></div><div>So I don&#39;t know what to think (=
I never see -I used with &#39;=3D&#39; or $SYSROOT). I&#39;ll try to know m=
ore about that for my curiosity</div><div dir=3D"auto"><div class=3D"gmail_=
quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex"><div>
  </div>

</blockquote></div></div></div>
</div>

--000000000000cb2c4b05fae14c9a--

