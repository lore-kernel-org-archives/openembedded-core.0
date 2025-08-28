Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98880CA0EED
	for <webhook@archiver.kernel.org>; Thu, 28 Aug 2025 14:02:25 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.21708.1756389744392800337
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Aug 2025 07:02:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=BLtxZScG;
 spf=pass (domain: smile.fr, ip: 209.85.221.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3ce4ed7a73fso352735f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Aug 2025 07:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1756389743; x=1756994543; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qgwEW2eluLECna48kP7osdbyjTgRaz227IiEQl/U+xE=;
        b=BLtxZScG1fkFYXfwZEi4T/7c9n8QeEGRU8yjQWdzon+GJLt+VaZiKi//o7yQYGpfv4
         gZNQehDF6svwS7NqlSTY/AKFOZsGHknTN8vCfKIsU5+mM4cKpIBE5iMLgsnAb2wZOUMv
         D876Dp/xIxNt3qzO17ra7Y3XRWa3uob2AquK4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756389743; x=1756994543;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qgwEW2eluLECna48kP7osdbyjTgRaz227IiEQl/U+xE=;
        b=rJtMHn4cDk4987kPehZb97KlfCJPXeav4wi2ArIRQzHH0CPzhCUdhGS4L8IrLWFtgS
         kg6mvjMR3JzH6Rg+B4lTLoIbog+xyZmXkkVdj6TwPTG7nJ7a08O5AqpVXou0HdA1ciMu
         QT3bflT8Isn4vf7fIiKW19Qr6kiTPxvRoYTSC2EaoE0IWC0pi4G2YMrWlk9y8KiLz/Zh
         Y8bAlToXIL2Z7LOKszo4gLW+GnYwihDlnHD68gWqBgFGj6pbqf2vfbw8ZG4KQnZI2FSf
         g8S5hu/vB/Lt9pZt7P5jSsZbe6UMV9fmtPYcB+0U41OF457Ang/y0LquH2DNb9EsOn4d
         Md7g==
X-Gm-Message-State: AOJu0YzDqTFhUdgcTvKeYOZ/Uq6woo0N1GZgnRpVoGS7gzn6ipwFzuzZ
	XiDHgICxEPQGREFdTDIFYJxCZyyleyIIUj9zkJt01FU9oIQcAw6bzum8DjN/ccXdsZnBaZkD0Zi
	XgU91t17lYkR0AF9L6vWjcvDLD403Tr6mdTfruVZn0Q==
X-Gm-Gg: ASbGncsuZhYtwGFUgjHexE8z1lLv18B0geJ3BPbOaM7q3HPQGJDAHD+rQfy8RgnF3p2
	VjZuQgfNXsLHtcTHwFz2HXEfn66mEZrmw8jcqmsLlrVQAj4cXJSqJ49a10Y3nCCw/9mNWtga5a5
	EJXAB3Rp5BsHA3PIgOsXXyJJWCwkBubTEIqPn7IWEeI6JoYyOLO82ORnL7FV8UWF51tuDwq0Tv1
	Yzr8xs0RQZD0plTY2wlQiNtUjxa+o4=
X-Google-Smtp-Source: AGHT+IFkl7R/98gT1PMkXj7Uf1LdrA8fLqmEtNKjQsoZEMoAr7mT7bR26pVdE0VbwuDCf5B4ihmlIv/TztjjFGcfR4w=
X-Received: by 2002:a5d:5d81:0:b0:3c4:f63a:787c with SMTP id
 ffacd0b85a97d-3c5dc73124cmr17100506f8f.40.1756389741963; Thu, 28 Aug 2025
 07:02:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250828120544.2982231-1-yoann.congal@smile.fr> <e3cafe69-7bf2-4084-9dbd-5255b538267d@gmail.com>
In-Reply-To: <e3cafe69-7bf2-4084-9dbd-5255b538267d@gmail.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Thu, 28 Aug 2025 16:01:55 +0200
X-Gm-Features: Ac12FXz_l357x3v43ehtD7aAAsEODahYwqzjExNug4_zyybxUAdn21q_9LrtBH0
Message-ID: <CAMSfU+6kLVVf5jNxCJJ8YtAK6T0Xry23kHs7iV0zevooe=TsYQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] ptest-cargo: move run-ptest rc variable initialisation
To: Gyorgy Sarvari <skandigraun@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000a86d4b063d6d5aab"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Aug 2025 14:02:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222576

--000000000000a86d4b063d6d5aab
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeu. 28 ao=C3=BBt 2025 =C3=A0 14:45, Gyorgy Sarvari <skandigraun@gmail.c=
om> a
=C3=A9crit :

> On 8/28/25 14:05, Yoann Congal wrote:
> > From: Yoann Congal <yoann.congal@smile.fr>
> >
> > ptest-cargo run-ptest can be generated in two fashions: generated from
> > scratch or appended to an exiting run-ptest file. The rc variable used
> > to track tests failure was only initialized in "generated from scratch"
> > case. Which lead to errors in the "appended" case.
> >
> > Move the rc variable initialisation to the common code of both case to
> > fix this problem.
> >
> > Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> > Cc: Gyorgy Sarvari <skandigraun@gmail.com>
> > ---
> >  meta/classes-recipe/ptest-cargo.bbclass | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/classes-recipe/ptest-cargo.bbclass
> b/meta/classes-recipe/ptest-cargo.bbclass
> > index ece25ff1eb..e35de1042e 100644
> > --- a/meta/classes-recipe/ptest-cargo.bbclass
> > +++ b/meta/classes-recipe/ptest-cargo.bbclass
> > @@ -103,10 +103,10 @@ python do_install_ptest_cargo() {
> >      with open(ptest_script, "a") as f:
> >          if not script_exists:
> >              f.write("#!/bin/sh\n")
> > -            f.write("rc=3D0\n")
> >          else:
> >              f.write(f"\necho \"\"\n")
> >              f.write(f"echo \"## starting to run rust tests ##\"\n")
>
> > +        f.write("rc=3D0\n")
> >          for test_path in test_paths:
> >              script =3D textwrap.dedent(f"""\
> >                  if ! {test_path} {rust_test_args}
>
> I'm not sure if this is correct. This value is what's returned at the
> end[1], but here it is set to 0 unconditionally, even though it might
> have a previous value.
>
> As an example, I have almost sent an updated librsvg ptest patch[2] -
> while writing v2, I noticed that it has not only C, but also Rust tests,
> so I started to add them too. The resulting run-ptest script first
> starts with the C test that I execute, and partial result is stored in
> the same variable. And then at the end ptest-cargo appends its own
> tests, and continues to use the same rc variable.
>

You're right!

How about we initialize rc to 0 in ptest-cargo ONLY IF it is not already
defined at that point?
That would allow custom run-ptest scripts to setup their rc variable but it
would also allow scripts that don't want to bother with it (like
rpm-sequoia) to completely ignore it.


> One thing I gotta admit is that this rc variable is kinda hidden in this
> class.
>
> [1]:
>
> https://git.yoctoproject.org/poky/tree/meta/classes-recipe/ptest-cargo.bb=
class#n122
> [2]: when I get around it again, I still believe that it will happen...
>


--=20
Yoann Congal
Smile ECS

--000000000000a86d4b063d6d5aab
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0jeu. 28=
 ao=C3=BBt 2025 =C3=A0=C2=A014:45, Gyorgy Sarvari &lt;<a href=3D"mailto:ska=
ndigraun@gmail.com">skandigraun@gmail.com</a>&gt; a =C3=A9crit=C2=A0:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">On 8/28/25 14:05, Yoa=
nn Congal wrote:<br>
&gt; From: Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.fr" target=
=3D"_blank">yoann.congal@smile.fr</a>&gt;<br>
&gt;<br>
&gt; ptest-cargo run-ptest can be generated in two fashions: generated from=
<br>
&gt; scratch or appended to an exiting run-ptest file. The rc variable used=
<br>
&gt; to track tests failure was only initialized in &quot;generated from sc=
ratch&quot;<br>
&gt; case. Which lead to errors in the &quot;appended&quot; case.<br>
&gt;<br>
&gt; Move the rc variable initialisation to the common code of both case to=
<br>
&gt; fix this problem.<br>
&gt;<br>
&gt; Signed-off-by: Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.f=
r" target=3D"_blank">yoann.congal@smile.fr</a>&gt;<br>
&gt; Cc: Gyorgy Sarvari &lt;<a href=3D"mailto:skandigraun@gmail.com" target=
=3D"_blank">skandigraun@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/classes-recipe/ptest-cargo.bbclass | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/meta/classes-recipe/ptest-cargo.bbclass b/meta/classes-re=
cipe/ptest-cargo.bbclass<br>
&gt; index ece25ff1eb..e35de1042e 100644<br>
&gt; --- a/meta/classes-recipe/ptest-cargo.bbclass<br>
&gt; +++ b/meta/classes-recipe/ptest-cargo.bbclass<br>
&gt; @@ -103,10 +103,10 @@ python do_install_ptest_cargo() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 with open(ptest_script, &quot;a&quot;) as f:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not script_exists:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(&quot;#!/bin/s=
h\n&quot;)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(&quot;rc=3D0\n&quot=
;)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(f&quot;\necho =
\&quot;\&quot;\n&quot;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(f&quot;echo \&=
quot;## starting to run rust tests ##\&quot;\n&quot;)=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(&quot;rc=3D0\n&quot;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for test_path in test_paths:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 script =3D textwrap.de=
dent(f&quot;&quot;&quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ! {te=
st_path} {rust_test_args}<br>
<br>
I&#39;m not sure if this is correct. This value is what&#39;s returned at t=
he<br>
end[1], but here it is set to 0 unconditionally, even though it might<br>
have a previous value.<br>
<br>
As an example, I have almost sent an updated librsvg ptest patch[2] -<br>
while writing v2, I noticed that it has not only C, but also Rust tests,<br=
>
so I started to add them too. The resulting run-ptest script first<br>
starts with the C test that I execute, and partial result is stored in<br>
the same variable. And then at the end ptest-cargo appends its own<br>
tests, and continues to use the same rc variable.<br></blockquote><div><br>=
</div><div>You&#39;re right!</div><div><br></div><div>How about we initiali=
ze rc to 0 in ptest-cargo ONLY IF it is not already defined at that point?<=
/div><div>That would allow custom run-ptest scripts to setup=C2=A0their rc =
variable but it would also=C2=A0allow scripts that don&#39;t want to bother=
 with it (like rpm-sequoia) to completely ignore it.</div><div>=C2=A0</div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
One thing I gotta admit is that this rc variable is kinda hidden in this<br=
>
class.<br>
<br>
[1]:<br>
<a href=3D"https://git.yoctoproject.org/poky/tree/meta/classes-recipe/ptest=
-cargo.bbclass#n122" rel=3D"noreferrer" target=3D"_blank">https://git.yocto=
project.org/poky/tree/meta/classes-recipe/ptest-cargo.bbclass#n122</a><br>
[2]: when I get around it again, I still believe that it will happen...<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>

--000000000000a86d4b063d6d5aab--

