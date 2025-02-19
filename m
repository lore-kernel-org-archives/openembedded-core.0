Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50604C021AB
	for <webhook@archiver.kernel.org>; Wed, 19 Feb 2025 08:33:12 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.17703.1739953982196437211
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Feb 2025 00:33:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=xH2e5KVo;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4398c8c8b2cso28028165e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Feb 2025 00:33:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1739953980; x=1740558780; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lzpux0UTycyXoMJwPz0SEdMJNcql9BDcpKx5Wkzig9Y=;
        b=xH2e5KVoG7b641lIfwerCkWEMrmHGll0jakix2Kii2cZyzqL1kkcr1vqmGtyNmtZPW
         rxnG2Phi4NKrou29Icv2/+N4CwK2QvCaScZV//2N7lp/yx+zQ95OJL8vc0H+BHzgvHjP
         o+wobEk1wqSZNe9Iq0WFaj+ezvZa7k06J8LKc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739953980; x=1740558780;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lzpux0UTycyXoMJwPz0SEdMJNcql9BDcpKx5Wkzig9Y=;
        b=O8WOToFaMqCFBjCT7l2v0MqZHCFKPB0Gd6ZLvPzcVEie1tccBBKCjiskbegLs+8mrg
         s0y50ZFYCXVbddmrp8KCocz6WbQjfWPbJ997/tYW/DQWnsMIcUhD/D01s16ap7yoernY
         kz2HUtC0y7uDaCA1L4I71WubAq04YBGlC3ApHpnVongm/xUKxpSkz6ojQm6DAUVl41Qu
         5Ej224t7/SwEuu7YIPaHALY+pTlZnOBLds8snWCX3ZcgCaxIhXwwptqBmKNoNlehjo91
         AW4E48ZApjl+UD5GCaVR2yAjUV9iU5ORtAye4lVXieGrv2Kv+Gq0vmBsWIG2ivmqg9YI
         rr2g==
X-Gm-Message-State: AOJu0Yw99fiuUQJvu1KC63JAl4JyGYnzujdXGRrTpTI+Faq7aQCPicOa
	63XLXuC0ClOuqtY0BTju5zW/GNkP1he2hYho+vLF3WERxVX1nJE3sLtyEKGJwPS6rMBpNA7FwYQ
	tYi2w2r40ZV6yoP7hh8/CNRHYB3igA5qGT5oxdg==
X-Gm-Gg: ASbGnct/mNwlF27fLverXuoN7Kp31dW/Jh4IQcRl8C8V6zqNAKM2kys5Dui2OicVqWy
	Xk6sMyZhXEEju+Ink2lmbgzqjuSPsFfGSjWYB8aWzS9IoZtoBb1qr8gzTBZyOwg61OI/p64nhIA
	0=
X-Google-Smtp-Source: AGHT+IHzGFcMOQmeYupZIejOme/xcQ48ub4cr97wW7PQ5lKs/WDgYKkNZeFQrZt09QAmiKG6Gi0j3syOiLSFABOpALU=
X-Received: by 2002:a05:6000:1849:b0:385:ee3f:5cbf with SMTP id
 ffacd0b85a97d-38f33f2f3c2mr14714089f8f.20.1739953980127; Wed, 19 Feb 2025
 00:33:00 -0800 (PST)
MIME-Version: 1.0
References: <cover.1739913090.git.steve@sakoman.com> <a1b322d5dde27461a6b972b051a120ef3c96d204.1739913090.git.steve@sakoman.com>
In-Reply-To: <a1b322d5dde27461a6b972b051a120ef3c96d204.1739913090.git.steve@sakoman.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Wed, 19 Feb 2025 09:32:34 +0100
X-Gm-Features: AWEUYZnmI4j03i1awCZwpgSTDU07XEanziWDdDjpU-_Q29JFriUFvfzIZQhYBoY
Message-ID: <CAMSfU+7yPYaFN_uoJd0wkeehnbnnF1RZVxbviW6p7wwj+ukEdg@mail.gmail.com>
Subject: Re: [OE-core][scarthgap 1/7] subversion: ignore CVE-2024-45720
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org, 
	Sofiane HAMAM <sofiane.hamam@smile.fr>
Content-Type: multipart/alternative; boundary="000000000000e957f6062e7a9a8e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Feb 2025 08:33:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211688

--000000000000e957f6062e7a9a8e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mar. 18 f=C3=A9vr. 2025 =C3=A0 22:15, Steve Sakoman via lists.openembedd=
ed.org
<steve=3Dsakoman.com@lists.openembedded.org> a =C3=A9crit :

> From: Peter Marko <peter.marko@siemens.com>
>
> Reference: https://nvd.nist.gov/vuln/detail/CVE-2024-45720
>
> This CVE is relevant only for subversion running on Windows.
>
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
>

Hi Steve,

Sorry to bother you with this but Sofiane Hamam gave its Reviewed-by here:
https://lists.openembedded.org/g/openembedded-core/topic/111147177#msg21137=
8

He worked on fixing the CVE but Peter was faster so he gave its
reviewed-by. It would be nice if that ended up in the repository.

Thanks!


> ---
>  meta/recipes-devtools/subversion/subversion_1.14.3.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-devtools/subversion/subversion_1.14.3.bb
> b/meta/recipes-devtools/subversion/subversion_1.14.3.bb
> index 1ef3d498a5..679228cbb8 100644
> --- a/meta/recipes-devtools/subversion/subversion_1.14.3.bb
> +++ b/meta/recipes-devtools/subversion/subversion_1.14.3.bb
> @@ -19,6 +19,8 @@ inherit autotools pkgconfig gettext python3native
>
>  CVE_PRODUCT =3D "apache:subversion"
>
> +CVE_STATUS[CVE-2024-45720] =3D "not-applicable-platform: Issue only appl=
ies
> on Windows"
> +
>  PACKAGECONFIG ?=3D ""
>
>  PACKAGECONFIG[boost] =3D
> "--with-boost=3D${RECIPE_SYSROOT}${exec_prefix},--without-boost,boost"
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#211653):
> https://lists.openembedded.org/g/openembedded-core/message/211653
> Mute This Topic: https://lists.openembedded.org/mt/111258880/4316185
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> yoann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Yoann Congal
Smile ECS - Tech expert

--000000000000e957f6062e7a9a8e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mar. 18=
 f=C3=A9vr. 2025 =C3=A0=C2=A022:15, Steve Sakoman via <a href=3D"http://lis=
ts.openembedded.org">lists.openembedded.org</a> &lt;steve=3D<a href=3D"mail=
to:sakoman.com@lists.openembedded.org">sakoman.com@lists.openembedded.org</=
a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">From: Peter Marko &lt;<a href=3D"mailto:peter.marko@siemens.com"=
 target=3D"_blank">peter.marko@siemens.com</a>&gt;<br>
<br>
Reference: <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2024-45720" rel=
=3D"noreferrer" target=3D"_blank">https://nvd.nist.gov/vuln/detail/CVE-2024=
-45720</a><br>
<br>
This CVE is relevant only for subversion running on Windows.<br>
<br>
Signed-off-by: Peter Marko &lt;<a href=3D"mailto:peter.marko@siemens.com" t=
arget=3D"_blank">peter.marko@siemens.com</a>&gt;<br>
Signed-off-by: Steve Sakoman &lt;<a href=3D"mailto:steve@sakoman.com" targe=
t=3D"_blank">steve@sakoman.com</a>&gt;<br></blockquote><div><br></div><div>=
Hi Steve,</div><div><br></div><div>Sorry to bother you with this but Sofian=
e Hamam gave its Reviewed-by here:</div><div><a href=3D"https://lists.opene=
mbedded.org/g/openembedded-core/topic/111147177#msg211378">https://lists.op=
enembedded.org/g/openembedded-core/topic/111147177#msg211378</a></div></div=
><div class=3D"gmail_quote gmail_quote_container"><br></div><div class=3D"g=
mail_quote gmail_quote_container">He worked on fixing the CVE but Peter was=
 faster so he gave its reviewed-by. It would be nice if that ended up in th=
e repository.</div><div class=3D"gmail_quote gmail_quote_container"><br></d=
iv><div class=3D"gmail_quote gmail_quote_container">Thanks!<div>=C2=A0</div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0meta/recipes-devtools/subversion/<a href=3D"http://subversion_1.14.3.=
bb" rel=3D"noreferrer" target=3D"_blank">subversion_1.14.3.bb</a> | 2 ++<br=
>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/meta/recipes-devtools/subversion/<a href=3D"http://subversion_=
1.14.3.bb" rel=3D"noreferrer" target=3D"_blank">subversion_1.14.3.bb</a> b/=
meta/recipes-devtools/subversion/<a href=3D"http://subversion_1.14.3.bb" re=
l=3D"noreferrer" target=3D"_blank">subversion_1.14.3.bb</a><br>
index 1ef3d498a5..679228cbb8 100644<br>
--- a/meta/recipes-devtools/subversion/<a href=3D"http://subversion_1.14.3.=
bb" rel=3D"noreferrer" target=3D"_blank">subversion_1.14.3.bb</a><br>
+++ b/meta/recipes-devtools/subversion/<a href=3D"http://subversion_1.14.3.=
bb" rel=3D"noreferrer" target=3D"_blank">subversion_1.14.3.bb</a><br>
@@ -19,6 +19,8 @@ inherit autotools pkgconfig gettext python3native<br>
<br>
=C2=A0CVE_PRODUCT =3D &quot;apache:subversion&quot;<br>
<br>
+CVE_STATUS[CVE-2024-45720] =3D &quot;not-applicable-platform: Issue only a=
pplies on Windows&quot;<br>
+<br>
=C2=A0PACKAGECONFIG ?=3D &quot;&quot;<br>
<br>
=C2=A0PACKAGECONFIG[boost] =3D &quot;--with-boost=3D${RECIPE_SYSROOT}${exec=
_prefix},--without-boost,boost&quot;<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#211653): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/211653" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/211653</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/111258880/431=
6185" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/111258880/4316185</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:yoann.congal@smile.fr" tar=
get=3D"_blank">yoann.congal@smile.fr</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS - Tech expert<br></font></div></div><=
/div></div>

--000000000000e957f6062e7a9a8e--

