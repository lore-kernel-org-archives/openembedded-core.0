Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9FE3C3DA41
	for <webhook@archiver.kernel.org>; Wed, 10 Jul 2024 20:03:09 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web10.4548.1720641782854968880
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jul 2024 13:03:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QHXVEOde;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2eeb1ba0468so1400391fa.0
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 13:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720641781; x=1721246581; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=id4r/TMKDfZDlkJCrZfd9RfPHfmjFwFvmsq3XMP7cDw=;
        b=QHXVEOdekEO8ZDU0nYlEfMETEcgOqWyQ7n89bD4DX7yLtLEWnUkM3n7G+PRPcfUuOO
         ELpNolSDuIPiOjiQjEJlQAdhJPI3JNyFJM8VrJzqE4AO+gfKDyb0A6LxQ+jgDzsRhG6I
         XHFtTeR+210kSPTEkLLvcvxovs+E2LdYsgHr32b6DnLL8IlDcOVgScwLa4kXa4Ur+0yc
         f4OgCTnDAS0jjS1fPry7Jg5nKTnPC7Vmc0qJErgGOH/xjOk0pvTEl1cCUKBJ/m5dcjyW
         5a9JUMwA9FQkefOUgqorsTUvN0dODnPwZg6AWpoWxmHwSMsO9gGoRNUG9eHPFxAx4vRD
         tgFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720641781; x=1721246581;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=id4r/TMKDfZDlkJCrZfd9RfPHfmjFwFvmsq3XMP7cDw=;
        b=cqkC+0HyCAJB/Tgnel2UyhM404Jw3DUPmKJ/FRQ2t5dG2PQuCcPgRb11LW298fxc+p
         rWS8wTVSh+S5+iqfXdCDFhp1HlXkqySeyu/hs7fdbVqIar1tJnXJr3/+jLSymNVrO56e
         TqoGRymYtXDz4VJYvZ8Og4bSpKOetYy3/PuRNbYaJyYMiTRjJ3WeoFCSdbJkdo2VgAwv
         TpdQ1zUL7DhdO4P4LsMBV7ekhwYvSlEVAylPsBg8ENrbGUaD/MHSRVtTnG5bQNz/FXGG
         QPQtmPiglNlM6D9THnoW0V6JkgUohrL0l55JuRVvgDuiF//qekZ7lMdEaBF87CWO09Bm
         ig8g==
X-Forwarded-Encrypted: i=1; AJvYcCXBBFhmwEJQ14JH1glOnF7ZCKBwJF5jG0JaaRkrHFGAUWMKv6ElBgSVZsHTDnhjZhalnz22ZiNiRcBbDyfsAm2IkhmTWSe2ahNfMDZxOI43nPfr9/orduyT
X-Gm-Message-State: AOJu0YyxzGtAdb+w3e04bpyNk0qBQBqMziC+TDx7TgqpkV1OApmyvi2p
	JVQ1HTuPZxHqJ7GeZh3OT2yCvLk/33NYzdAuICrYZGxsE8Pr6G70FC1xupcY0B/Adbp1wYWb/JE
	eYs5KyGvTe/ur5k/gTXVKkEJsnk0=
X-Google-Smtp-Source: AGHT+IEV2Gi5GCzZbKTqZWZFQnNxWriUs2D9Cx5Xt8LGakW6CJ21iL/XrJB85fIjFZifiic1huFLoke2+4W2k6s+Y98=
X-Received: by 2002:a2e:954e:0:b0:2ec:54f3:7b65 with SMTP id
 38308e7fff4ca-2eeb3189e3amr43267541fa.36.1720641780507; Wed, 10 Jul 2024
 13:03:00 -0700 (PDT)
MIME-Version: 1.0
References: <20240710193743.3686800-1-jeremi.graveline@gmail.com>
In-Reply-To: <20240710193743.3686800-1-jeremi.graveline@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 10 Jul 2024 22:02:49 +0200
Message-ID: <CANNYZj8BmMQPjfVTh_x80ssbYaaxLzsw-ZpxVJFuZT_9WiJ9EA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] cargo-update-recipe-crates: Use override style
 append so generated code passes oelint-adv.
To: jeremigraveline@gmail.com
Cc: jermigra <jeremi.graveline@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000001cef08061cea22b7"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 20:03:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201742

--0000000000001cef08061cea22b7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

But does this fix any actual issue? It=E2=80=99s not enough to justify the =
change
with a =E2=80=98linter is complaining=E2=80=99. Reading the link, it=E2=80=
=99s about supporting a
hypothetical weak assignment to SRC_URI, which basically never happens in
real recipes.

Alex

On Wed 10. Jul 2024 at 21.47, jermigra via lists.openembedded.org
<jeremigraveline=3Dgmail.com@lists.openembedded.org> wrote:

> The oelint-adv linter checks fails when linting the recipe generated when
> inheriting cargo-update-recipe-crates class.
> It fails with the the oelint.bars.srcuriappend error. See
> https://github.com/priv-kweihmann/oelint-adv/blob/master/docs/wiki/oelint=
.vars.srcuriappend.md#oelintvarssrcuriappend
> Fixed by using override style append instead of the +=3D syntax.
>
> Signed-off-by: jermigra <jeremi.graveline@gmail.com>
> ---
>  meta/classes-recipe/cargo-update-recipe-crates.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes-recipe/cargo-update-recipe-crates.bbclass
> b/meta/classes-recipe/cargo-update-recipe-crates.bbclass
> index a19ce16b46..88a5b0e4dd 100644
> --- a/meta/classes-recipe/cargo-update-recipe-crates.bbclass
> +++ b/meta/classes-recipe/cargo-update-recipe-crates.bbclass
> @@ -31,7 +31,7 @@ do_update_crates() {
>  def get_crates(f):
>      import tomllib
>      c_list =3D '# from %s' % os.path.relpath(f, '${CARGO_LOCK_SRC_DIR}')
> -    c_list +=3D '\nSRC_URI +=3D " \\\'
> +    c_list +=3D '\nSRC_URI:append =3D " \\\'
>      crates =3D tomllib.load(open(f, 'rb'))
>
>      # Build a list with crates info that have crates.io in the source
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#201740):
> https://lists.openembedded.org/g/openembedded-core/message/201740
> Mute This Topic: https://lists.openembedded.org/mt/107149938/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000001cef08061cea22b7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">But does this fix any actual issue? It=E2=80=99s not=
 enough to justify the change with a =E2=80=98linter is complaining=E2=80=
=99. Reading the link, it=E2=80=99s about supporting a hypothetical weak as=
signment to SRC_URI, which basically never happens in real recipes.</div><d=
iv dir=3D"auto"><br></div><div dir=3D"auto">Alex</div></div><div><div><br><=
div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed 10. =
Jul 2024 at 21.47, jermigra via <a href=3D"http://lists.openembedded.org" t=
arget=3D"_blank">lists.openembedded.org</a> &lt;jeremigraveline=3D<a href=
=3D"mailto:gmail.com@lists.openembedded.org" target=3D"_blank">gmail.com@li=
sts.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-sty=
le:solid;padding-left:1ex;border-left-color:rgb(204,204,204)">The oelint-ad=
v linter checks fails when linting the recipe generated when inheriting car=
go-update-recipe-crates class.<br>
It fails with the the oelint.bars.srcuriappend error. See <a href=3D"https:=
//github.com/priv-kweihmann/oelint-adv/blob/master/docs/wiki/oelint.vars.sr=
curiappend.md#oelintvarssrcuriappend" rel=3D"noreferrer" target=3D"_blank">=
https://github.com/priv-kweihmann/oelint-adv/blob/master/docs/wiki/oelint.v=
ars.srcuriappend.md#oelintvarssrcuriappend</a><br>
Fixed by using override style append instead of the +=3D syntax.<br>
<br>
Signed-off-by: jermigra &lt;<a href=3D"mailto:jeremi.graveline@gmail.com" t=
arget=3D"_blank">jeremi.graveline@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/classes-recipe/cargo-update-recipe-crates.bbclass | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/classes-recipe/cargo-update-recipe-crates.bbclass b/meta/=
classes-recipe/cargo-update-recipe-crates.bbclass<br>
index a19ce16b46..88a5b0e4dd 100644<br>
--- a/meta/classes-recipe/cargo-update-recipe-crates.bbclass<br>
+++ b/meta/classes-recipe/cargo-update-recipe-crates.bbclass<br>
@@ -31,7 +31,7 @@ do_update_crates() {<br>
=C2=A0def get_crates(f):<br>
=C2=A0 =C2=A0 =C2=A0import tomllib<br>
=C2=A0 =C2=A0 =C2=A0c_list =3D &#39;# from %s&#39; % os.path.relpath(f, &#3=
9;${CARGO_LOCK_SRC_DIR}&#39;)<br>
-=C2=A0 =C2=A0 c_list +=3D &#39;\nSRC_URI +=3D &quot; \\\&#39;<br>
+=C2=A0 =C2=A0 c_list +=3D &#39;\nSRC_URI:append =3D &quot; \\\&#39;<br>
=C2=A0 =C2=A0 =C2=A0crates =3D tomllib.load(open(f, &#39;rb&#39;))<br>
<br>
=C2=A0 =C2=A0 =C2=A0# Build a list with crates info that have <a href=3D"ht=
tp://crates.io" rel=3D"noreferrer" target=3D"_blank">crates.io</a> in the s=
ource<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#201740): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/201740" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/201740</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/107149938/168=
6489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/107149938/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>
</div>

--0000000000001cef08061cea22b7--

