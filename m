Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCA2E107BCD5
	for <webhook@archiver.kernel.org>; Fri, 13 Mar 2026 17:18:19 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21280.1773422291354773619
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Mar 2026 10:18:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RNY8FbZN;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-662fc12ac5bso4660339a12.0
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Mar 2026 10:18:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773422290; cv=none;
        d=google.com; s=arc-20240605;
        b=B5cYXlGvCzvVpzorShsANmjlu/AxyzerXjQ5tAhGcdPWv09FwvqF5ftSUVyRmWh/yb
         s6FVdi2lrZthsIai5W2/vJSDG88zdStcS57gWM74MxDfznQaW1NhdBoF8uX2spd1IbI2
         uXe6DqRfybxhjZl8sfLWovUfp+ws3vEkUTSc1E/zc/gH1Ie2C9asubDFp0hk79ejpwnr
         kmIETnMLX03KXqcSgIAE9rSNx6kaltPj8XJpnc0xCOgYmAHO/jZBrMLyJzMIlvFdMDxG
         dThcmMLxfmb4fUPgppIBkosy0N6m799I5fWSzuKXXhsgd4kd/P33pB/9QsRgSFQufyTD
         Fd1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=G3c8YwpiRCQMUh0Vp6G2n9OiStbcOjLfEgaC5Eh97CE=;
        fh=zfkRmSlmkcwPvpvDZeI/A2FdCqvLAQuL8oYwtJfUoRA=;
        b=b17XUho5tYKpjVNueXI++ttyLaMsfaQET2K4OjFVEUWRbkFPOHkeZO6fwW3moTse7Z
         TYCGFl7bE7vSkIhHKL6kPMyBaGcqYI3WLpimS0tQojXJ7qCs0FBqwezrRSMGXjQ90SRf
         274DMWxqxByzT+Lcu7iTP2O22agwmi7Sv5HdfnbG3jb6yXAAh5miV2BFxOfx5KVSvmQ0
         i2qkV/GzebkJxhpMqbWLOk4NGtfpL35b6hVYK+uLUdQx4L7amc7hXCZAyoIFkGuzTtIq
         oMl2m7o/Y0RATPJi+tmgpzlDXXnYtacH13YT/X05fVpw4OgPmhdENcdkVASTlYLydSqu
         ktxA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773422290; x=1774027090; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=G3c8YwpiRCQMUh0Vp6G2n9OiStbcOjLfEgaC5Eh97CE=;
        b=RNY8FbZNwhwaS1A3xMwU+q/nKwCgiETveHRwHOM+wXl5qHzQa5/BirSXkMA8/TqBah
         kbvdsFyFigOzgxAlNdZY9KJFI59KFiLskyeKja/O2up2b5LCZ5ZYVQ0tpuCg3+MV224T
         xwEBhYv/C6GyS5flkoAYY09HNIcbQS8mySCTJiJunqMt6zQPzXi/R5nfUM6wu+swxdGm
         Vja1dm7tl3ebXeDbdqHEyqWRZJlZVk76eulUxTvIjnM16btRPwSkP2GN7ihosm+oXgzJ
         Mpp+uoSFkoh9M9RE5z8QvahqDunSF6nrJY1x5ZF0x2RCQ+hlEyj+hsiAouIzcLWXifBX
         6K2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773422290; x=1774027090;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G3c8YwpiRCQMUh0Vp6G2n9OiStbcOjLfEgaC5Eh97CE=;
        b=QUMgHRi2BblWIQbCGwTahP//4LnNIPG/yVDssG0ABp+fAVErDOc1C+j4QBIOtl90SU
         BKT3snz4j4hrxnt40w/uDxX310HYliVCx4pmb+AKG68tm1KyMUgP3dy5iMtDLSyvIHq9
         4GThFJyX/UgChzugdTqZpcovuazGvJbotVbyxtzN1tW9xVIbUbYUD1b0e3gryI1ht4mu
         /IXWqr30GrI72qZi+ThEaYfBc46kWmeqiFzoMZ+CBkaRGeHbhG/qPFVKIL19wZKGpIW3
         SBPRQrQnyvvwmA0Q1xRHShU0wv8WaXDE4G5Tl54WUiceKO9D9jlv+LE+mEPq3GSgkkPR
         GO0Q==
X-Gm-Message-State: AOJu0YwJbZ9dSZhpk4cKDcwmUHVhUZ8nvIYWRPWShJcUNpO0gisUH5mL
	+iYypR4WhBrt8q1bmmPK58EwhaT6IljowQYVF1BxRIuLJNaJSZ57dtQOR08+W3lH21wcSJq5Zu4
	Zl7tBiNvqYm6SbmgVy9gxcLFyjT1KAyM=
X-Gm-Gg: ATEYQzz9q3Xa6tV7NDL2b1/HOmtcaU1uRLCZ9kASotixqyDj7zJn0oIUY+dZDEX/+SR
	p8Bxw5DphgVglS0jIdCM5Yx2+sRp3P80PLUV/0t2k5a1+vR1HCs5FuuH/aowf5BsCkIy1V0WMmK
	qRuLdyHongP7KLk4q37aap6/zB8aljvY42hNID4SXJkATUUbHadQmO+eDe6OuleVLqs4wgLPfxt
	oVbznm5AsnRvQQY4dvGEfOAQx20AW5uCBAINglTh2gW0FJ/fH5DfG2fSHzaZpgjl4ti6tK95Zgr
	2PubNEivbw==
X-Received: by 2002:a17:906:b74f:b0:b8f:bfc9:ae11 with SMTP id
 a640c23a62f3a-b9764f76b53mr180324166b.8.1773422289351; Fri, 13 Mar 2026
 10:18:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260313115345.4704-2-jose.quaresma@foundries.io> <86735ada0cf017f2d6ea85c36359689515d0b414.camel@linuxfoundation.org>
In-Reply-To: <86735ada0cf017f2d6ea85c36359689515d0b414.camel@linuxfoundation.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Fri, 13 Mar 2026 17:17:57 +0000
X-Gm-Features: AaiRm50WdRmA4v-fU16im6bfohlRHs0YxFhxJO8ihoI2lfKaVdSycEaul5ed7ng
Message-ID: <CANPvuRn=QqYHxZri6wbJ2=nv7s6MEkMSFfCCNVtSPrec1i_YzA@mail.gmail.com>
Subject: Re: [OE-core][PATCH] pacth: add user and email when patchtool is git
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Jose Quaresma <jose.quaresma@foundries.io>, Jose Quaresma <jose.quaresma@oss.qualcomm.com>
Content-Type: multipart/alternative; boundary="00000000000097fbad064ceb0d09"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Mar 2026 17:18:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233068

--00000000000097fbad064ceb0d09
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Best regards,

Jos=C3=A9 Quaresma

A sexta, 13/03/2026, 12:49, Richard Purdie <
richard.purdie@linuxfoundation.org> escreveu:

> On Fri, 2026-03-13 at 11:53 +0000, Jose Quaresma via
> lists.openembedded.org wrote:
> > From: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
> >
> > When the PATCHTOOL=3Dgit, oe-core creates a git repo for the sources wi=
th:
> >
> >  git init
> >  git add .
> >  git commit
> >
> > The git commit fails blindly due to misconfigured user when git don't
> have
> > the email proper configured. Although the commit command does not fail
> > because it returns 0, it is not executed and the tree remains with all
> > files staged so the following git commands can fail and fails in some
> cases.
> >
> > This problem has been particularly observed in some obscure and
> little-used
> > cases in openembedded-core like patching the linux-firmware which only
> works
> > using PATCHTOOL=3Dgit because it deals with binary files.
> >
> > Signed-off-by: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
> > ---
> >  meta/lib/oe/patch.py | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
> > index afc42df8a7..abc822f7fb 100644
> > --- a/meta/lib/oe/patch.py
> > +++ b/meta/lib/oe/patch.py
> > @@ -318,6 +318,8 @@ class GitApplyTree(PatchTree):
> >
> >      def _initRepo(self):
> >          runcmd("git init".split(), self.dir)
> > +        runcmd(("git config user.email %s" % self.commitemail).split()=
,
> self.dir)
> > +        runcmd(("git config user.name %s" % self.commituser).split(),
> self.dir)
>
> If my name is "Richard Purdie", does that split() do the right thing?
>

I've been following trends, I like to hallucinate a bit so I don't feel
disintegrated :p


> You may just have to split it out in advance:
>
> runcmd(["git, "config", "user.name", self.commituser], self.dir)
>

It only works for the default case:
Author: OpenEmbedded <oe.patch@oe>

But as you rightly point out, it doesn't work in general.

Thanks, I will send a v2.

Jose



> Cheers,
>
> Richard
>

--00000000000097fbad064ceb0d09
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"auto"><div><div><br></div><div><br></div><div =
data-smartmail=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>J=
os=C3=A9 Quaresma</div></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">A sexta, 13/03/2026, 12:49, Richard Purdie &l=
t;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">r=
ichard.purdie@linuxfoundation.org</a>&gt; escreveu:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex">On Fri, 2026-03-13 at 11:53 +0000, Jose Quaresma via <a hr=
ef=3D"http://lists.openembedded.org" rel=3D"noreferrer noreferrer" target=
=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt; From: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@oss.qualcomm.c=
om" rel=3D"noreferrer" target=3D"_blank">jose.quaresma@oss.qualcomm.com</a>=
&gt;<br>
&gt; <br>
&gt; When the PATCHTOOL=3Dgit, oe-core creates a git repo for the sources w=
ith:<br>
&gt; <br>
&gt; =C2=A0git init<br>
&gt; =C2=A0git add .<br>
&gt; =C2=A0git commit<br>
&gt; <br>
&gt; The git commit fails blindly due to misconfigured user when git don&#3=
9;t have<br>
&gt; the email proper configured. Although the commit command does not fail=
<br>
&gt; because it returns 0, it is not executed and the tree remains with all=
<br>
&gt; files staged so the following git commands can fail and fails in some =
cases.<br>
&gt; <br>
&gt; This problem has been particularly observed in some obscure and little=
-used<br>
&gt; cases in openembedded-core like patching the linux-firmware which only=
 works<br>
&gt; using PATCHTOOL=3Dgit because it deals with binary files.<br>
&gt; <br>
&gt; Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@oss.q=
ualcomm.com" rel=3D"noreferrer" target=3D"_blank">jose.quaresma@oss.qualcom=
m.com</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0meta/lib/oe/patch.py | 2 ++<br>
&gt; =C2=A01 file changed, 2 insertions(+)<br>
&gt; <br>
&gt; diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py<br>
&gt; index afc42df8a7..abc822f7fb 100644<br>
&gt; --- a/meta/lib/oe/patch.py<br>
&gt; +++ b/meta/lib/oe/patch.py<br>
&gt; @@ -318,6 +318,8 @@ class GitApplyTree(PatchTree):<br>
&gt; =C2=A0<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0 def _initRepo(self):<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 runcmd(&quot;git init=
&quot;.split(), self.dir)<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 runcmd((&quot;git config u=
ser.email %s&quot; % self.commitemail).split(), self.dir)<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 runcmd((&quot;git config <=
a href=3D"http://user.name" rel=3D"noreferrer noreferrer" target=3D"_blank"=
>user.name</a> %s&quot; % self.commituser).split(), self.dir)<br>
<br>
If my name is &quot;Richard Purdie&quot;, does that split() do the right th=
ing?<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"au=
to">I&#39;ve been following trends, I like to hallucinate a bit so I don&#3=
9;t feel disintegrated :p</div><div dir=3D"auto"><br></div><div dir=3D"auto=
"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
You may just have to split it out in advance:<br>
<br>
runcmd([&quot;git, &quot;config&quot;, &quot;<a href=3D"http://user.name" r=
el=3D"noreferrer noreferrer" target=3D"_blank">user.name</a>&quot;, self.co=
mmituser], self.dir)<br></blockquote><div><br>It only works for the default=
 case:</div><div>Author: OpenEmbedded &lt;oe.patch@oe&gt;<br><br>But as you=
 rightly point out, it doesn&#39;t work in general.<br><br>Thanks, I will s=
end a v2.<br><br>Jose<br><br><br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div></div></div>
</div>

--00000000000097fbad064ceb0d09--

