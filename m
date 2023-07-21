Return-Path: <coreycothrum@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3B29EB64DD
	for <webhook@archiver.kernel.org>; Fri, 21 Jul 2023 11:13:19 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web10.4848.1689937993562941415
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Jul 2023 04:13:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=qx1n+ewd;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: coreycothrum@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-51de9c2bc77so2456071a12.3
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Jul 2023 04:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689937991; x=1690542791;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=623P6ReNfFfplZvYptR+xZaQ9nQUthDnRxByGgV1J+U=;
        b=qx1n+ewd6WPeu657R3JVvifBkiviECTbjxzIu9Qfbaw9dr1bwc2Vnhnj37fT9XF7mR
         lEZML+OePGm7/oNaTHhd6fmOwyc4dgkk3x/yEaRJMAiLuE7xFElVJSunObfEliW6cnMF
         fOzwlWZp92nQ0Wwvlv2ZtbeoGb1meixmoUoui/R7fOgpM+9vrzrGYjt5hhcLKtNo/SEu
         QlNCuybZwXvctqyk+kdZaNzr4plgNWB9u45ci/38pjvfLmTBoAO+kuCZ1rnMZEpcmHUy
         1ojAvTyRmCuk3iloF20BRCk5siHKFtEbvFjJyfQFN0z9sBcK8p4KkAFN2f4vKv+GNlHL
         Vv8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689937991; x=1690542791;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=623P6ReNfFfplZvYptR+xZaQ9nQUthDnRxByGgV1J+U=;
        b=TfJTVA4alfmPiXD3tnqb52p9CrtFg+hdKdo2gp1e8Pr1y5463rmYUf8JGs7KFDorn6
         rxKRJyNsH28bFd66yCEIQXqK0cyz+2xIxN5yC/VSkoHhL5DW/4rUQ/zNTNpN1rjjbRu5
         lv0/ULsBN/J240tnuXy++XM6108Y4Mp80mmqCfJrQvz808xVybXgk7QRoAWMgzV60Pld
         JxustgenLn/qJkDUj4dhsny+DY/JfdgcKbsDW7iEpKD2qLnHfXCeHqw/8Sa8Rd+x8Rm0
         zZmxQvwGCg1gTzZWXyoqUHzII6MIfKVWX+1le2O46zFUzhhpHCbQrKtbNXfv3gvMvcF5
         ClbA==
X-Gm-Message-State: ABy/qLYAVAZMZvAuVoJ9j3BMmxua9EuMG3KOol9UvyAFXxi8SKlvp6sj
	Xq++bvqzykMZa+Fsu1i5Z3CW3XJy8p0u3xZl0woimw9U
X-Google-Smtp-Source: APBJJlHKcYC42jEebK0VjeCxhqVP7xsDSuJNIMeWpP9zcwuFy2BlVw5jn63RVXK33GfuX6uCQtyoEAaExNZFwvMU5Ac=
X-Received: by 2002:aa7:df8d:0:b0:521:d275:c5ac with SMTP id
 b13-20020aa7df8d000000b00521d275c5acmr1267139edy.12.1689937991202; Fri, 21
 Jul 2023 04:13:11 -0700 (PDT)
MIME-Version: 1.0
References: <CAC3TgA+XEUtkpJ4U98Nn=CeRt9+CWWPj1XuZ8A0x+UVti4fv7g@mail.gmail.com>
 <DBA5C54E-41F9-4F40-A2DA-9A5037429B0D@arm.com> <CALNokD5bzta0i9fy19hjAYi+1yNYm9wMn=w_Ngx4cgL5L5hZMw@mail.gmail.com>
In-Reply-To: <CALNokD5bzta0i9fy19hjAYi+1yNYm9wMn=w_Ngx4cgL5L5hZMw@mail.gmail.com>
From: Corey Cothrum <coreycothrum@gmail.com>
Date: Fri, 21 Jul 2023 06:12:35 -0500
Message-ID: <CALNokD4zX1L=kFD50oczFn5QL-ucHUjVxOGx5+7iXBiKgN8PPw@mail.gmail.com>
Subject: Fwd: [OE-core] [yocto][bitbake] variable expansion in files
To: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000a87aeb0600fd5982"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jul 2023 11:13:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184684

--000000000000a87aeb0600fd5982
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Can confirm that no attempt or submission was made to merge
meta-bitbake-variable-substitution into mainline/core. I'm happy if people
are finding it useful, but it was written very much for my use case(s). I
didn't spend much time designing it or thinking through how other people
may prefer it to work. Not to disparage it; I just mean to say there is
likely room for improvement.

Ross is also correct that automatic expansion shouldn't be the only mode of
operation. That's why meta-bitbake-variable-substitution has the option to
specify search and replace file paths:

${@bitbake_variables_search_and_sub("${PATH_OR_FILE_TO_PROCESS}",
r"${BITBAKE_VAR_SUB_DELIM}", d)}


I found cases where it was attempting variable substitution where I didn't
want it (e.g. when appending a recipe), and needed a method to be a bit
more surgical.

thanks,
Corey

On Fri, Jul 21, 2023 at 4:39=E2=80=AFAM Ross Burton <Ross.Burton@arm.com> w=
rote:

> On 21 Jul 2023, at 10:24, Yann CARDAILLAC via lists.openembedded.org
> <ycnakajsph=3Dgmail.com@lists.openembedded.org> wrote:
> > There's something that has always been missing in my experience of
> Yocto, it's the ability to simply configure files with yocto variables.
> >
> > Basically the idea is to have a class that will automatically sed all
> variables from yocto inside a file using a delimiter, or to reuse the way
> it is done with .wks.in with the ${var} syntax, even if I can already see
> some limitations with shell scripts.
> >
> > What I intend to do is to provide some variables to a recipe and then t=
o
> use them to complete a template.
> >
> > For instance I'd like to put some stuff inside my machine.conf and want
> those variables to be filled inside my templated script.
> >
> > Is there any official way to do this?
> >
> > As far as I can see there's not, the only examples I've found are using
> hand made seds. But I might not be looking in the right place.
> >
> > If I'm right, I'm wondering why this is not generalized inside a poky
> class. I've found this meta :
> https://github.com/coreycothrum/meta-bitbake-variable-substitution doing
> exactly what I needed, but since it's not mainline I assume that as alway=
s
> there's a good reason why it's not something you want to have in mainline=
.
> >
> > If that's only because there wasn't any submission and If you're up for
> it going mainline, I can work (with coreycothrum if he wants to?) it
> through the patch submission process.
>
> There=E2=80=99s also a class that I hacked up a while ago that I never fi=
nished
> because I wanted to automatically handle variable dependencies, otherwise
> it=E2=80=99s no good:
>
> https://github.com/rossburton/meta-ross/blob/master/classes/bbin.bbclass
>
> I=E2=80=99d like to see something in core, but the scope should be relati=
vely
> tight.  I don=E2=80=99t like the automatic expansion that
> meta-bitbake-variable-substitution does, I=E2=80=99m thinking of a pathol=
ogical
> case where piglit wanted to use @@bindir@@ in a wrapper script: it would
> also attempt to process many gigabytes of installed files.
>
> The bbin class _only_ works on files in SRC_URI, so foo.sh.bbin would be
> processed at do_unpack and end up in WORKDIR/foo.sh.  The scope is more
> limited but you know exactly what it=E2=80=99s doing.
>
> Ross

--000000000000a87aeb0600fd5982
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr">Can confirm th=
at no attempt or submission was made to merge meta-bitbake-variable-substit=
ution into mainline/core. I&#39;m happy if people are finding it useful, bu=
t it was written very much for my use case(s). I didn&#39;t spend much time=
 designing it or thinking through how other people may prefer it to work. N=
ot to disparage=C2=A0it; I just mean to say there is likely room for improv=
ement.<div><br></div><div>Ross is also correct that automatic expansion=C2=
=A0shouldn&#39;t be the only mode of operation. That&#39;s why meta-bitbake=
-variable-substitution has the option to specify search and replace file pa=
ths:</div><blockquote style=3D"margin:0 0 0 40px;border:none;padding:0px"><=
div><div style=3D"box-sizing:border-box;color:rgb(230,237,243);font-family:=
-apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,&quot;Noto Sans&quot;=
,Helvetica,Arial,sans-serif,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Em=
oji&quot;;font-size:16px;background-color:rgb(13,17,23);overflow:auto"><pre=
 style=3D"box-sizing:border-box;font-family:ui-monospace,SFMono-Regular,&qu=
ot;SF Mono&quot;,Menlo,Consolas,&quot;Liberation Mono&quot;,monospace;font-=
size:13.6px;margin-top:0px;margin-bottom:16px;padding:16px;overflow:auto;li=
ne-height:1.45;border-radius:6px"><code style=3D"box-sizing:border-box;font=
-family:ui-monospace,SFMono-Regular,&quot;SF Mono&quot;,Menlo,Consolas,&quo=
t;Liberation Mono&quot;,monospace;padding:0px;margin:0px;background:transpa=
rent;border-radius:6px;word-break:normal;border:0px;display:inline;overflow=
:visible;line-height:inherit">${@bitbake_variables_search_and_sub(&quot;${P=
ATH_OR_FILE_TO_PROCESS}&quot;, r&quot;${BITBAKE_VAR_SUB_DELIM}&quot;, d)}</=
code></pre></div></div></blockquote><div><div><br></div>I found cases where=
 it was attempting variable substitution=C2=A0where I didn&#39;t want it (e=
.g. when appending a recipe), and needed a method to be a bit more surgical=
.</div><div><br></div><div>thanks,</div><div>Corey</div></div><br><div clas=
s=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jul 21, 202=
3 at 4:39=E2=80=AFAM Ross Burton &lt;<a href=3D"mailto:Ross.Burton@arm.com"=
 target=3D"_blank">Ross.Burton@arm.com</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">On 21 Jul 2023, at 10:24, Yann CARDAI=
LLAC via <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" targe=
t=3D"_blank">lists.openembedded.org</a> &lt;ycnakajsph=3D<a href=3D"mailto:=
gmail.com@lists.openembedded.org" target=3D"_blank">gmail.com@lists.openemb=
edded.org</a>&gt; wrote:<br>
&gt; There&#39;s something that has always been missing in my experience of=
 Yocto, it&#39;s the ability to simply configure files with yocto variables=
.<br>
&gt; <br>
&gt; Basically the idea is to have a class that will automatically sed all =
variables from yocto inside a file using a delimiter, or to reuse the way i=
t is done with .<a href=3D"http://wks.in" rel=3D"noreferrer" target=3D"_bla=
nk">wks.in</a> with the ${var} syntax, even if I can already see some limit=
ations with shell scripts.<br>
&gt; <br>
&gt; What I intend to do is to provide some variables to a recipe and then =
to use them to complete a template. <br>
&gt; <br>
&gt; For instance I&#39;d like to put some stuff inside my machine.conf and=
 want those variables to be filled inside my templated script.<br>
&gt; <br>
&gt; Is there any official way to do this?<br>
&gt; <br>
&gt; As far as I can see there&#39;s not, the only examples I&#39;ve found =
are using hand made seds. But I might not be looking in the right place.<br=
>
&gt; <br>
&gt; If I&#39;m right, I&#39;m wondering why this is not generalized inside=
 a poky class. I&#39;ve found this meta : <a href=3D"https://github.com/cor=
eycothrum/meta-bitbake-variable-substitution" rel=3D"noreferrer" target=3D"=
_blank">https://github.com/coreycothrum/meta-bitbake-variable-substitution<=
/a> doing exactly what I needed, but since it&#39;s not mainline I assume t=
hat as always there&#39;s a good reason why it&#39;s not something you want=
 to have in mainline.<br>
&gt; <br>
&gt; If that&#39;s only because there wasn&#39;t any submission and If you&=
#39;re up for it going mainline, I can work (with coreycothrum if he wants =
to?) it through the patch submission process.<br>
<br>
There=E2=80=99s also a class that I hacked up a while ago that I never fini=
shed because I wanted to automatically handle variable dependencies, otherw=
ise it=E2=80=99s no good:<br>
<br>
<a href=3D"https://github.com/rossburton/meta-ross/blob/master/classes/bbin=
.bbclass" rel=3D"noreferrer" target=3D"_blank">https://github.com/rossburto=
n/meta-ross/blob/master/classes/bbin.bbclass</a><br>
<br>
I=E2=80=99d like to see something in core, but the scope should be relative=
ly tight.=C2=A0 I don=E2=80=99t like the automatic expansion that meta-bitb=
ake-variable-substitution does, I=E2=80=99m thinking of a pathological case=
 where piglit wanted to use @@bindir@@ in a wrapper script: it would also a=
ttempt to process many gigabytes of installed files.<br>
<br>
The bbin class _only_ works on files in SRC_URI, so foo.sh.bbin would be pr=
ocessed at do_unpack and end up in WORKDIR/foo.sh.=C2=A0 The scope is more =
limited but you know exactly what it=E2=80=99s doing.<br>
<br>
Ross</blockquote></div>
</div></div>

--000000000000a87aeb0600fd5982--

