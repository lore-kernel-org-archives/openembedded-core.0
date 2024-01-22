Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9441C47DAF
	for <webhook@archiver.kernel.org>; Mon, 22 Jan 2024 10:24:59 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web10.70447.1705919097630116406
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jan 2024 02:24:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=MKd0m3wd;
 spf=pass (domain: smile.fr, ip: 209.85.218.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a29c4bbb2f4so272276066b.1
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 02:24:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1705919095; x=1706523895; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=l8qF7Ya1wfgRtRrPKWiWqLzc9XoxXiQ5BjjECwqDKt4=;
        b=MKd0m3wdZP4Kl/F73YJ9o7h9nsv2TbZaTAru4Uauf1jCybBsqrJweIxs5XouI/uuAk
         WSjIT5AQ88nZ36Pa259XA/Thv8etFv6R8ftkBTMCao6oF+lXyXjGVUqRuRfUQXIWcLUS
         e2l+EzgbzkCmpYsT407HlyyENnS68h3GbP4Ym1CcMZD2FhiZI6EPih7X6H9DG8y7cHC7
         hMGkhUVetOWye9sdik/MzQGVtarxhw3gyQ8GWk0ZhtMcI2yZnJDNS1XBT+tVUTUQp3ly
         hMiSKKUFICPNae+jpYDwmCq5uHQjxLtyjO2+pwJ+xihWLrI4NENSYnZLr/L4S34qcmGN
         4ctA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705919095; x=1706523895;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l8qF7Ya1wfgRtRrPKWiWqLzc9XoxXiQ5BjjECwqDKt4=;
        b=DUZYXlhkmn41Fq3Km4K7C+Ox1mVX8m5ZxZi/23PKUHPkLitbm1aqxmUXijNnSlfkrS
         FGl1GRRpEysdo0KuWRzLTiInM2jXJj/yp9+bWtwB3542aUAP3DxE55u3JX9jYvAFS4vx
         +QZP/wcQcyBnfpAslAk3CUB96ilOM3AVhfUJuSEBHfX50aUpJ8aLPpUle0l14TN5RMS/
         tEhAFbueiP6/UNQ4/i5Iceg2Q3t93RRMnZ6ruhmY8kkLnv9qvlzjGD2UrUULf/HAecaU
         WwUEpikyYVAIWapkiLXgJbZQTFlZcAPRGcig7mab4t/0ChUCGLuQQ9kBLaTms3phUhBs
         fnEQ==
X-Gm-Message-State: AOJu0YymOFmUzLFsBBuH8m9ErxK8TwuRl0QJpXOjqy/paTe2YB4wXHwC
	+XJUyg76WHGtknQTldQ8RLIzlsur5NrXAocF6FcGJuCh8On81ZfZskd7jbC21/wjdz395zaj1hE
	xbFyazWoQ92nNXuInxwPNZYfvVS1fQWCPUbRVCw==
X-Google-Smtp-Source: AGHT+IFRowwWyitl/qDQIFxoooaMlzvkXhDkxJRPjAEQ9GMG7MHPh8/jM60wouyTha5rfNB22Xh8P6lPZhLa1+zUa18=
X-Received: by 2002:a17:906:f891:b0:a30:8471:572c with SMTP id
 lg17-20020a170906f89100b00a308471572cmr216445ejb.34.1705919095550; Mon, 22
 Jan 2024 02:24:55 -0800 (PST)
MIME-Version: 1.0
References: <20240122085443.637472-2-pavel@zhukoff.net> <20240122085443.637472-4-pavel@zhukoff.net>
 <CANNYZj-YMGJQ_9s=GE=6gFWcqrz=+OJdPZnRrzq54Hp=GO=eYw@mail.gmail.com>
In-Reply-To: <CANNYZj-YMGJQ_9s=GE=6gFWcqrz=+OJdPZnRrzq54Hp=GO=eYw@mail.gmail.com>
From: Yoann CONGAL <yoann.congal@smile.fr>
Date: Mon, 22 Jan 2024 11:24:29 +0100
Message-ID: <CAMSfU+52vg0rr_AFzgX3-VcLdWWOv7arYTryzZzKs9d-mtvrOA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] mdadm: Disable ptest
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Pavel Zhukov <pavel@zhukoff.net>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000b4c77e060f863de7"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 10:24:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194136

--000000000000b4c77e060f863de7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lun. 22 janv. 2024 =C3=A0 11:21, Alexander Kanavin <alex.kanavin@gmail.c=
om> a
=C3=A9crit :

> On Mon, 22 Jan 2024 at 09:55, Pavel Zhukov <pavel@zhukoff.net> wrote:
> > mdadm tests are flaky and cause a lot of failures on autobuilder.
> > Disable them for now. Keeping ptest code in the recipe to fix/enable
> > in the future
> >  SRC_URI =3D "git://
> git.kernel.org/pub/scm/utils/mdadm/mdadm.git;protocol=3Dhttps;branch=3Dma=
ster
> \
> > -           file://run-ptest \
> > +# Disable ptests for now as they're flaky
> > +# but keeping ptest code in case we want to enable them in the future
> > +PTEST_ENABLED=3D"0"
> > +SRC_URI:append =3D "${@bb.utils.contains('PTEST_ENABLED', '1', '
> file://run-ptest', '', d)}"
>
> The correct way to do this is to modify
> conf/distro/include/ptest-packagelists.inc. There's a specific
> exclusion list made for that purpose in there at the end.
>

(Oops I've previously answered to Pavel in private, sorry :( )
I guess you are talking about PTESTS_PROBLEMS =3D>
https://git.openembedded.org/openembedded-core/tree/meta/conf/distro/includ=
e/ptest-packagelists.inc#n142

Regards,

Alex
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#194135):
> https://lists.openembedded.org/g/openembedded-core/message/194135
> Mute This Topic: https://lists.openembedded.org/mt/103882792/4316185
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> yoann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Yoann Congal
Smile ECS - Tech expert

--000000000000b4c77e060f863de7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0lun. 22 janv. 2024 =C3=A0=C2=
=A011:21, Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" t=
arget=3D"_blank">alex.kanavin@gmail.com</a>&gt; a =C3=A9crit=C2=A0:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">On Mon, 22 Jan 2024 at =
09:55, Pavel Zhukov &lt;<a href=3D"mailto:pavel@zhukoff.net" target=3D"_bla=
nk">pavel@zhukoff.net</a>&gt; wrote:<br>
&gt; mdadm tests are flaky and cause a lot of failures on autobuilder.<br>
&gt; Disable them for now. Keeping ptest code in the recipe to fix/enable<b=
r>
&gt; in the future<br>
&gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://git.kernel.org/pub/scm=
/utils/mdadm/mdadm.git;protocol=3Dhttps;branch=3Dmaster" rel=3D"noreferrer"=
 target=3D"_blank">git.kernel.org/pub/scm/utils/mdadm/mdadm.git;protocol=3D=
https;branch=3Dmaster</a> \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://run-ptest \<br>
&gt; +# Disable ptests for now as they&#39;re flaky<br>
&gt; +# but keeping ptest code in case we want to enable them in the future=
<br>
&gt; +PTEST_ENABLED=3D&quot;0&quot;<br>
&gt; +SRC_URI:append =3D &quot;${@bb.utils.contains(&#39;PTEST_ENABLED&#39;=
, &#39;1&#39;, &#39; file://run-ptest&#39;, &#39;&#39;, d)}&quot;<br>
<br>
The correct way to do this is to modify<br>
conf/distro/include/ptest-packagelists.inc. There&#39;s a specific<br>
exclusion list made for that purpose in there at the end.<br></blockquote><=
div><br></div><div>(Oops I&#39;ve previously answered to Pavel in private, =
sorry :( )<br></div><div>I guess you are talking about PTESTS_PROBLEMS =3D&=
gt; <a href=3D"https://git.openembedded.org/openembedded-core/tree/meta/con=
f/distro/include/ptest-packagelists.inc#n142" target=3D"_blank">https://git=
.openembedded.org/openembedded-core/tree/meta/conf/distro/include/ptest-pac=
kagelists.inc#n142</a></div><div><br></div><div>Regards,<br></div><div><br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">

Alex<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#194135): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/194135" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/194135</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/103882792/431=
6185" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/103882792/4316185</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:yoann.congal@smile.fr" tar=
get=3D"_blank">yoann.congal@smile.fr</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><br><span class=3D"gmail_signature_pre=
fix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"l=
tr"><font face=3D"Raleway, regular">Yoann Congal</font><div><font face=3D"R=
aleway, regular">Smile ECS - Tech expert<br></font></div></div></div></div>

--000000000000b4c77e060f863de7--

