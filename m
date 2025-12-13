Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFAB0D5B15E
	for <webhook@archiver.kernel.org>; Sat, 13 Dec 2025 17:40:01 +0000 (UTC)
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9797.1765647596117077281
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Dec 2025 09:39:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lRnjNV+d;
 spf=pass (domain: gmail.com, ip: 74.125.224.53, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-6446c924f9eso2232304d50.1
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 09:39:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765647595; x=1766252395; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nGQEWWm1Ku0auZZuSGLIFt/mZzRw0djlsF4ENgWIJI4=;
        b=lRnjNV+dNv47ta3xvHUW7UxyNm5Rl+Zvz+fmaPNM7lrmVgkrswV4FaXu2gYvrQ/wvZ
         J9cdgnJrgdtxKe7klqP4xGsHh++QqoPnnJ2g0WKsAFijvi4fhDeykHEjl68kbzX6x9BC
         en9qeedYmpN4f9E2NtwJv8zmducUO9QO9rZ15y6LfnlCLayxhwrnVbsG6lQZHccktuYw
         VPeP3irDgYFJn7QFhxuHZXw29KADkT9EDzG0L1jfR3IAaCjM/PDg0QfX1fOwUM6Q897a
         T2UCIYEwvl9jy1Kx7CwqI6rl2gYQvykF7N7vewKSvCS5VIVF06+hCgQYlUlEkdKetikp
         1kcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765647595; x=1766252395;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nGQEWWm1Ku0auZZuSGLIFt/mZzRw0djlsF4ENgWIJI4=;
        b=M8DqPQBqPXK0GQJFRLpA0nBusnrkVbly9EFTuh1FPJJ5uxllNPLU/IWW0gECSA2Hai
         0pTMNI+CZViqRQYinTudVxBXpQNCzTN8Lps2ap+DHHY+zt2HsvA4S6eFipdTbtKKK9CU
         3R00+fjgKpEq6dm42Je6r/HLqSpq3ShfMVuGRM5pZGwNwo/KM8ePbrP1tiKyvNMViVwu
         J73N+fi1HZ09eXiJfWfLn3FiPU65LZX3FbMskGsiRHX+svkrOuIt413uRDHcUqfvRC4n
         GnN26o/hVyo/nkCAsVorFqn4v7c92x0NYQ4JnCMmSZRm+Yu6rZsO4ls9cagVmGUg2b1t
         pVXg==
X-Gm-Message-State: AOJu0YxFAcqroRgPd4yPuZ+aPpRMIYg5mLR4cYoc245/G6iWWVY91FwY
	RU0eX6ggAF32Vtl8BTBXjhvyyqEBoGhGUCL+8VF4hE1ds/FT+fzOqs6niX41gZUyUjeQDEaclmS
	hf+DW10EuAdj1uwhVE8Hn8f1JmF1odZfmkmhtV3E=
X-Gm-Gg: AY/fxX4F5Kd5DrYBT4WftCL9Xaav+8dZcORLf98x8OURExXL8aRvCUWGTek1+lj7jkE
	/cOjU7lowTnGQJ/+yR5p/4uw7a7t5pIR9104fexNBt/AZIrGs1ZbpNp7WHPwXKzAu2cPTSvM1Uy
	k39BSg5NPeoQgx/at3010XIeg77N6nb8ukxiKodf2Ht8lKTO90NUZLbCuWlMP15JpI60dXtc784
	jO4YxzcAzgiD/TQoUpDdcgloDNUVvhsdcPJcnfy6loTOW8T7PJIS3Dh0HTKUo+pCD8WifoLcMDJ
	fetUCgEHeirKbQ8TB7cOvkWptX3faLPcZ4s4AVjtbaDx+PItacQ9B1yGAn/7dPgQMomQ/HP4ahY
	rU5RgADQaJVmqycuV4F8vFV16epodrT0jxkWXIPrp292GLg==
X-Google-Smtp-Source: AGHT+IFbWhM9tJNchKzzPzGnatYF+hPkolGxLcA3IHFbFwEyIhGNAjx0d7gxKjjufqMnotQwXk/RcKoiivtI8YjAfKc=
X-Received: by 2002:a05:690c:3507:b0:78a:722f:a7f3 with SMTP id
 00721157ae682-78e68445a08mr56121997b3.62.1765647595065; Sat, 13 Dec 2025
 09:39:55 -0800 (PST)
MIME-Version: 1.0
References: <20251213095547.1028402-1-raj.khem@gmail.com> <dedf101cfde93ffee140e1262c79beab5f0e6bef.camel@linuxfoundation.org>
In-Reply-To: <dedf101cfde93ffee140e1262c79beab5f0e6bef.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 13 Dec 2025 09:39:28 -0800
X-Gm-Features: AQt7F2qsFNorR0CcvIMI0Z9n5B8QzuWkHG9siPhlsDubNYJuKBX4WJ84T4R5ms8
Message-ID: <CAMKF1so1F48RMYYTuwuuptWZ7w-Ew6DXooHX8n7p9A_Vj=dKQw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] default-providers.inc: Let libva-native provide libva-dev-native
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000b3d73c0645d8ddeb"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 17:40:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227690

--000000000000b3d73c0645d8ddeb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 13, 2025 at 3:22=E2=80=AFAM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Sat, 2025-12-13 at 01:55 -0800, Khem Raj via lists.openembedded.org
> wrote:
> > This fixes parsing errors e.g.
> > NOTE: Multiple providers are available for runtime libva-dev-native
> (libva-initial-native, libva-native)
> > Consider defining a PREFERRED_RPROVIDER entry to match libva-dev-native
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/conf/distro/include/default-providers.inc | 3 +++
> >  1 file changed, 3 insertions(+)
>
> This isn't the right way to fix this. Why is libva-initial-native
> providing this?
>


bitbake -c fetch universe --dry-run -k

revealed this. I also wondered if we could just do something like below in
libva-initial recipe.
RPROVIDES:${PN}-dev:remove =3D "libva-dev"



>
> Cheers,
>
> Richard
>

--000000000000b3d73c0645d8ddeb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Dec 13,=
 2025 at 3:22=E2=80=AFAM Richard Purdie &lt;<a href=3D"mailto:richard.purdi=
e@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">On Sat, 2025-12-13=
 at 01:55 -0800, Khem Raj via <a href=3D"http://lists.openembedded.org" rel=
=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt; This fixes parsing errors e.g.<br>
&gt; NOTE: Multiple providers are available for runtime libva-dev-native (l=
ibva-initial-native, libva-native)<br>
&gt; Consider defining a PREFERRED_RPROVIDER entry to match libva-dev-nativ=
e<br>
&gt; <br>
&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0meta/conf/distro/include/default-providers.inc | 3 +++<br>
&gt; =C2=A01 file changed, 3 insertions(+)<br>
<br>
This isn&#39;t the right way to fix this. Why is libva-initial-native provi=
ding this?<br></blockquote><div><br></div><div><br></div><div>bitbake -c fe=
tch universe --dry-run -k=C2=A0</div><div><br></div><div>revealed this. I a=
lso wondered if we could just do something like below in libva-initial reci=
pe.</div><div style=3D"color:rgb(59,59,59);font-family:&quot;JetBrainsMonoN=
L Nerd Font Mono&quot;,Menlo,Monaco,&quot;Courier New&quot;,monospace;font-=
size:12px;line-height:17px;white-space:pre"><div><span style=3D"color:rgb(0=
,16,128)">RPROVIDES</span>:<span style=3D"color:rgb(0,0,255)">${</span><spa=
n style=3D"color:rgb(0,16,128)">PN</span><span style=3D"color:rgb(0,0,255)"=
>}</span>-<span style=3D"color:rgb(0,16,128)">dev</span>:<span style=3D"col=
or:rgb(175,0,219)">remove</span> <span style=3D"color:rgb(0,0,0)">=3D</span=
> <span style=3D"color:rgb(163,21,21)">&quot;libva-dev&quot;</span></div><b=
r></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div></div>

--000000000000b3d73c0645d8ddeb--

