Return-Path: <alexandre.truong@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DB9FC4345F
	for <webhook@archiver.kernel.org>; Fri, 26 Apr 2024 09:23:44 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web11.9698.1714123417356162787
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Apr 2024 02:23:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=V29qGJ3e;
 spf=pass (domain: smile.fr, ip: 209.85.218.49, mailfrom: alexandre.truong@smile.fr)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a51a7d4466bso229655166b.2
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Apr 2024 02:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1714123415; x=1714728215; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7kGBidnuHKaFymh4JGzg29eqehKIGAGOTzwnVieXGZo=;
        b=V29qGJ3e+T+Ari3qe2APOOfAnwmPlFn+m40tIDQ/on5ftPlWibEo2+3yJ4DYf4NW7j
         sI6qeia2tcthcelbSl57adnI+niMx2SRQeVgyZNhCLcIu2y2QUWQ43/H/k6T1AM7uC2y
         FG9u3QMzznJZqbdQxirllc9IJJB6N1m9+2KDwyWXIaJibi02JMwmbLBoa0sagdLYyD3R
         GdJFN9J9TZPA+e+xQiJAErqo1WT0yb4v353oCN+VNJzVNFBrdHI0Z+gzh4b530bvbsxG
         AaKKWc/vHcuf0uXwwrQ4m9C8o2oAyOzk8ye1u+/gsBsPFRaQpqVWAIEMAsHqXTOY/vcC
         f7Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714123415; x=1714728215;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7kGBidnuHKaFymh4JGzg29eqehKIGAGOTzwnVieXGZo=;
        b=WIJHp1SLuQQkrBGuYWUhm4JgAteTZzlVsevEU2Qs7F8XQdKusu3TK0ppdLIR9PZ7em
         hR/TfMCJbwnjI5rQortIExAZ0TEWhykzcHga/XWxui2FWq1FkiVXrM1nQWigxtbYUvh5
         b93SST4xjLlrjXfxX+odbNrhctynm+wXjJkKNZDb+Au3nVIgysTnR8YwqaV00pMKwTX8
         eaBYO/4ceaPxFVFYf+/sSrhYFdHgUXhUue61NcaFTd7qtOREsofujmnzRtFFZR8fGXva
         jXbd+6jFQS1khwR4gk6A55q2KWLTCmk6iyluK1WTys9jyrrTmd7RC6/7u4HkwhDp7V6r
         DB1Q==
X-Gm-Message-State: AOJu0YyVs4PSf+mi6nsSf5/JK7cocOyCh5o+KseMk62gZAWQZq6+KMY3
	a9ACY1TUvSsxkPalZ73V5A9m9b0vOvUQUNgu0RRRzDg0rBtsGGNP/Cd31O5tbfIctzOau1tjhkv
	bm9TyIJ15PNxlFgQwKpj966yKXYoubN9Ybh2eZA==
X-Google-Smtp-Source: AGHT+IHNUspoB1j+a+AxC8RdWKuHgXDMlinQZZbB4OwhMBGoFYMMcoRwPlxesq/pzI5OENbt63yvazulRIGO+Qe9SJ8=
X-Received: by 2002:a17:907:31ca:b0:a58:c551:4ea2 with SMTP id
 xf10-20020a17090731ca00b00a58c5514ea2mr1724873ejb.58.1714123415516; Fri, 26
 Apr 2024 02:23:35 -0700 (PDT)
MIME-Version: 1.0
References: <20240426083038.8555-1-alexandre.truong@smile.fr> <CANNYZj-hFdie-BZsFTYRBFuQrvkw2B8+vU5pHdEx_517puUAkg@mail.gmail.com>
In-Reply-To: <CANNYZj-hFdie-BZsFTYRBFuQrvkw2B8+vU5pHdEx_517puUAkg@mail.gmail.com>
From: Alexandre TRUONG <alexandre.truong@smile.fr>
Date: Fri, 26 Apr 2024 11:23:24 +0200
Message-ID: <CAN21hX6e6a_ue5zraxzFvG3okXRXwPt2=oJfpXnsJ7iunip2+w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] Revert "oeqa/selftest/devtool: fix test_devtool_add_git_style2"
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Yoann Congal <yoann.congal@smile.fr>
Content-Type: multipart/alternative; boundary="000000000000488ddd0616fc75f2"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Apr 2024 09:23:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198718

--000000000000488ddd0616fc75f2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yes, you are absolutelty right. In a V2, I will add an explanation for the
revert.

Alexandre Truong

Le ven. 26 avr. 2024 =C3=A0 10:36, Alexander Kanavin <alex.kanavin@gmail.co=
m> a
=C3=A9crit :

> When you revert something, you need to explain why.
>
> Alex
>
> On Fri, 26 Apr 2024 at 10:31, Alexandre Truong via
> lists.openembedded.org
> <alexandre.truong=3Dsmile.fr@lists.openembedded.org> wrote:
> >
> > This reverts commit ab6d3e3d645ffc343f434bf731339fa237df027a
> > from poky repository.
> >
> > Signed-off-by: Alexandre Truong <alexandre.truong@smile.fr>
> > Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
> > ---
> >  meta/lib/oeqa/selftest/cases/devtool.py | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/lib/oeqa/selftest/cases/devtool.py
> b/meta/lib/oeqa/selftest/cases/devtool.py
> > index 51949e3c93..1f8781a28b 100644
> > --- a/meta/lib/oeqa/selftest/cases/devtool.py
> > +++ b/meta/lib/oeqa/selftest/cases/devtool.py
> > @@ -482,7 +482,7 @@ class DevtoolAddTests(DevtoolBase):
> >          pn =3D 'mbedtls'
> >          # this will trigger reformat_git_uri with branch parameter in
> url
> >          git_url =3D "'git://
> git@github.com/ARMmbed/mbedtls.git;protocol=3Dhttps'"
> > -        resulting_src_uri =3D "gitsm://
> git@github.com/ARMmbed/mbedtls.git;protocol=3Dhttps;branch=3Dmaster"
> > +        resulting_src_uri =3D "git://
> git@github.com/ARMmbed/mbedtls.git;protocol=3Dhttps;branch=3Dmaster"
> >          self._test_devtool_add_git_url(git_url, version, pn,
> resulting_src_uri)
> >
> >      def test_devtool_add_library(self):
> > --
> > 2.34.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#198715):
> https://lists.openembedded.org/g/openembedded-core/message/198715
> > Mute This Topic: https://lists.openembedded.org/mt/105746807/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--000000000000488ddd0616fc75f2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Yes, you are absolutelty right. In a V2, I will add an exp=
lanation for the revert.<div><br></div><div>Alexandre Truong</div></div><br=
><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0v=
en. 26 avr. 2024 =C3=A0=C2=A010:36, Alexander Kanavin &lt;<a href=3D"mailto=
:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; a =C3=A9crit=C2=A0:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">When you revert=
 something, you need to explain why.<br>
<br>
Alex<br>
<br>
On Fri, 26 Apr 2024 at 10:31, Alexandre Truong via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a><br>
&lt;alexandre.truong=3D<a href=3D"mailto:smile.fr@lists.openembedded.org" t=
arget=3D"_blank">smile.fr@lists.openembedded.org</a>&gt; wrote:<br>
&gt;<br>
&gt; This reverts commit ab6d3e3d645ffc343f434bf731339fa237df027a<br>
&gt; from poky repository.<br>
&gt;<br>
&gt; Signed-off-by: Alexandre Truong &lt;<a href=3D"mailto:alexandre.truong=
@smile.fr" target=3D"_blank">alexandre.truong@smile.fr</a>&gt;<br>
&gt; Reviewed-by: Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.fr"=
 target=3D"_blank">yoann.congal@smile.fr</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/lib/oeqa/selftest/cases/devtool.py | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/s=
elftest/cases/devtool.py<br>
&gt; index 51949e3c93..1f8781a28b 100644<br>
&gt; --- a/meta/lib/oeqa/selftest/cases/devtool.py<br>
&gt; +++ b/meta/lib/oeqa/selftest/cases/devtool.py<br>
&gt; @@ -482,7 +482,7 @@ class DevtoolAddTests(DevtoolBase):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pn =3D &#39;mbedtls&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # this will trigger reformat_git_uri=
 with branch parameter in url<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 git_url =3D &quot;&#39;git://<a href=
=3D"http://git@github.com/ARMmbed/mbedtls.git;protocol=3Dhttps" rel=3D"nore=
ferrer" target=3D"_blank">git@github.com/ARMmbed/mbedtls.git;protocol=3Dhtt=
ps</a>&#39;&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 resulting_src_uri =3D &quot;gitsm://<a hr=
ef=3D"http://git@github.com/ARMmbed/mbedtls.git;protocol=3Dhttps;branch=3Dm=
aster" rel=3D"noreferrer" target=3D"_blank">git@github.com/ARMmbed/mbedtls.=
git;protocol=3Dhttps;branch=3Dmaster</a>&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 resulting_src_uri =3D &quot;git://<a href=
=3D"http://git@github.com/ARMmbed/mbedtls.git;protocol=3Dhttps;branch=3Dmas=
ter" rel=3D"noreferrer" target=3D"_blank">git@github.com/ARMmbed/mbedtls.gi=
t;protocol=3Dhttps;branch=3Dmaster</a>&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._test_devtool_add_git_url(git_u=
rl, version, pn, resulting_src_uri)<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 def test_devtool_add_library(self):<br>
&gt; --<br>
&gt; 2.34.1<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#198715): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/198715" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/198715</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10574680=
7/1686489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/105746807/1686489</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.co=
m" target=3D"_blank">alex.kanavin@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div>

--000000000000488ddd0616fc75f2--

