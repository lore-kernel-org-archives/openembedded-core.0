Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4755CC4451C
	for <webhook@archiver.kernel.org>; Sat, 18 Jul 2026 16:09:32 +0000 (UTC)
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8602.1784390964794391995
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 Jul 2026 09:09:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=lVnfpx5m;
 spf=pass (domain: gmail.com, ip: 74.125.224.53, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-668296d0ff3so3345730d50.0
        for <openembedded-core@lists.openembedded.org>; Sat, 18 Jul 2026 09:09:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784390964; cv=none;
        d=google.com; s=arc-20260327;
        b=jVS4jnM6x2dtqehys3guZ2Be1CJ15MSMAEKJAHzCNC71l/E8mTAlknbZ1Ei03mKnFa
         SjZSE1OQjA8J/42qPA81Pw/6SObY8u8BdInIZ1TKcqq6N7pPbyVSIuVQeWD4hlZz7w4P
         zhSEnIxk0L9OBQs7+FQ1Z2voIs7XWg+vs/8kXVOSFW9T2PhPdPoE06epKnGW76Jx1sg6
         m7d+KduRu0hbUtu4kaT4eThIQbBgCQG9YTyoeShkaNbQ/aTJjglbTmHHHivU1bIF1ler
         RqVSJwaPrIxEGFFy5AUlCd83AAhLOBpKojPII/hJmPyfAWifL8Ghy4QomkrsBFLAgq0k
         i9Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=6SEH2eMKosBwxTy0v6WYYsdh2upHreJ51toJoaJb9II=;
        fh=Ab5QchtAs08eZNSFiBl6MfJNprT6k/vVQ8w3IX57Q1U=;
        b=Y3lXd/ynt6XUfjveYTDtVZbFiyVBSl0IIxCXLlbvuTg2jeqRCCZP2ma8jcODeYColX
         64mQJBTIylMJ+i8XmMw4g3NC7NmMUJAt4DxpMOub3dDu6oWCibyD7eMIIq2iuyREQIQl
         9gir93eJbmmmpf1yA/zz8hJ4tXVS+7y2RrUfHhJDMgO3JDX3Kw5k20FJKFIwCRqdqp2e
         37uirX4nfc/g3ABMi0gXcD0qqknKH5pWXXkY8Loa8+uuTUb8fmwl4qnPAoQeif3csiFJ
         h+tXqpDUIB0Chl7819Rhy6vs9WRC7l8WUoqjcx+L1NDdsKvZpLQba8SKZcWtmI4CR09B
         cDMA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784390964; x=1784995764; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6SEH2eMKosBwxTy0v6WYYsdh2upHreJ51toJoaJb9II=;
        b=lVnfpx5mhoh9ZekTWK6RZSWH/0R1G8bIt4kh6Nk1AJYEZlqL8trr2cyRyPaL4ykeCi
         yotw3Enmz5EPJQoxx2hsKdGC4QktcHqeYgLjgcxQ2x0wm3399+RgKOkwD9T5iapQVcRH
         Mr9ZerVUJ1gFpsBS1/4ZYny0sDq4hS7RN5I4Irbj2L4KvWOxKpkkEWpiVoexG98LwO2x
         wsDLb6qc6l7hMpt9EljdjtPbpb6ibm704DQ4AE4QyOsitGDpnqXZIuSQlSUV2oNTVYOL
         Mdh79iJ/sREDQAYdPW3xkuBd3xki7rM3EcTPrW/AI8Nu+gP4F+EzisQGDqhI62P3w1jq
         JCcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784390964; x=1784995764;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6SEH2eMKosBwxTy0v6WYYsdh2upHreJ51toJoaJb9II=;
        b=o01aao3HcGxRvynSWHw5sHuZqej9qgKZRoZLuv7cn8XqJwcYduOs2qjs9lEKPJ2PSU
         9LrfhuZjho3+7Puj3B5YRCsP4xzn3nQTuMj7BVGoX6fjJct9NxQLpS9bViY1PpxRNuT1
         OK6w0rLGcNVrnVm5ZeyYFfrZFbtE6GJGCs6N/BjqcMP7USyBMvHzW2r1ntiTljIExjqi
         2Zfb4OwvBLelISV+QEoz0445IvIY5TwJ46OiO4q8neEHFslY7S8Wfe71MzKzpO/3J7CN
         OGmWXV4LQJ96G15ZmEV9oWFqrLrkERuH1su/VVqD0ka98VEG58mgEnVH6xlVkT2qoXde
         R2tw==
X-Gm-Message-State: AOJu0Yyf1eZWhlDhKzO606GhofVdMzuznW+Duq5+UI8lNasy8nvHerlt
	4BfF680C2b4GSpiKYJlxCKiXSTTcUlbnfN61Ul51cr8aHYNJ4s77x3rnzQxfG76LE2n/tN7yJlq
	jkTTnwEerFh57EQA5aQqFUqOInak56K1Qig==
X-Gm-Gg: AfdE7ckC+G5gCbpN6hGghuDUAMuvas7jB+V/arVZ4Nc8vWtdFiXLcYEZFmEcy5CWqFF
	ZbsRYCuBbeLYRBFEuFX9Xqi88vBGv3tus0BruDUclMaYP2tnt08qJvVWYvFKJz6izfYA0IsF1DJ
	eLSY7LNxzolrS6dK2K7LqxS7WubKGJVfidT8NdGmSohrWjwCoKq1ESPlHgLdbGJzG+4RXPqs4sf
	MxwYzMp1sJmQvaLZkDUjLi8JarkJDMcCNkxt756DOJeeIaXeh/yGE0a6H3sV9MM9vEDEZlXYBX9
	6JXKss+FvXdwfZMsx2BCItAO8FUMnqH8zkzdm7L0RPRCbQyZC6T9fyGQm9rPQgA4/rRhB6OMXTE
	56cXZ5bql/BdXj3LC10R2+oDQCHm3VbtaTsASp4CxTLIu3GjCPFdhVq8mEsA=
X-Received: by 2002:a05:690c:d06:b0:7d1:c256:b5a8 with SMTP id
 00721157ae682-81ef2611f30mr27009137b3.40.1784390963837; Sat, 18 Jul 2026
 09:09:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260715140507.2329605-1-ross.burton@arm.com> <20260715140507.2329605-3-ross.burton@arm.com>
In-Reply-To: <20260715140507.2329605-3-ross.burton@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 18 Jul 2026 09:08:56 -0700
X-Gm-Features: AUfX_mwXtZMn55oARZgTNPAx6hM4JJy_nAWl3DWZrJ-PdoIBj83tLb3A3FWUawc
Message-ID: <CAMKF1sqTS3TAN7Xmsb=enK45PZeazgrCd8zPr95_GSUzs4LqeA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 03/12] libpsl: use libidn2 instead of ICU
To: ross.burton@arm.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000008a3f250656e4e538"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 18 Jul 2026 16:09:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241265

--0000000000008a3f250656e4e538
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 15, 2026 at 7:05=E2=80=AFAM Ross Burton via lists.openembedded.=
org
<ross.burton=3Darm.com@lists.openembedded.org> wrote:

> The default IDNA library was changed from libidn2 to ICU in 2021[1] with
> no rationale, and upstream has had libidn2 as the default since 2017.
>
>
libidn2 default was switched to build non-GPL3 images conveniently by
switching to use ICU, where ICU is used by  embedded systems more commonly
than libidn2.


> Switch back to libidn2 to respect upstream's opinion, and because ICU is
> a monolithic dependency: this switch causes a minimal image containg
> libpsl to shrink by ~30MB.
>

Which production image are you building ?


>
> [1] oe-core 20fc11919e2 ("libpsl: Add config knobs for runtime/builtin
> conversion choices")
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/recipes-support/libpsl/libpsl_0.22.0.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-support/libpsl/libpsl_0.22.0.bb
> b/meta/recipes-support/libpsl/libpsl_0.22.0.bb
> index 741038ddc52..1e5e9c74b4c 100644
> --- a/meta/recipes-support/libpsl/libpsl_0.22.0.bb
> +++ b/meta/recipes-support/libpsl/libpsl_0.22.0.bb
> @@ -19,7 +19,7 @@ GITHUB_BASE_URI =3D "
> https://github.com/rockdaboot/libpsl/releases"
>
>  inherit autotools gettext gtk-doc manpages pkgconfig lib_package
> github-releases
>
> -PACKAGECONFIG ?=3D "icu"
> +PACKAGECONFIG ?=3D "idn2"
>  PACKAGECONFIG[manpages] =3D "--enable-man,--disable-man,libxslt-native"
>  PACKAGECONFIG[icu] =3D "--enable-runtime=3Dlibicu
> --enable-builtin=3Dlibicu,,icu"
>  PACKAGECONFIG[idn2] =3D "--enable-runtime=3Dlibidn2
> --enable-builtin=3Dlibidn2,,libidn2 libunistring"
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#240962):
> https://lists.openembedded.org/g/openembedded-core/message/240962
> Mute This Topic: https://lists.openembedded.org/mt/120281289/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000008a3f250656e4e538
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 15,=
 2026 at 7:05=E2=80=AFAM Ross Burton via <a href=3D"http://lists.openembedd=
ed.org">lists.openembedded.org</a> &lt;ross.burton=3D<a href=3D"mailto:arm.=
com@lists.openembedded.org">arm.com@lists.openembedded.org</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">The default IDNA =
library was changed from libidn2 to ICU in 2021[1] with<br>
no rationale, and upstream has had libidn2 as the default since 2017.<br>
<br></blockquote><div><br></div><div>libidn2 default was switched to build =
non-GPL3 images conveniently by</div><div>switching to use ICU, where ICU i=
s used by=C2=A0 embedded systems more commonly</div><div>than libidn2.</div=
><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Switch back to libidn2 to respect upstream&#39;s opinion, and because ICU i=
s<br>
a monolithic dependency: this switch causes a minimal image containg<br>
libpsl to shrink by ~30MB.<br></blockquote><div><br></div><div>Which produc=
tion image are you building ?</div><div>=C2=A0</div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">
<br>
[1] oe-core 20fc11919e2 (&quot;libpsl: Add config knobs for runtime/builtin=
 conversion choices&quot;)<br>
<br>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" targe=
t=3D"_blank">ross.burton@arm.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-support/libpsl/<a href=3D"http://libpsl_0.22.0.bb" rel=
=3D"noreferrer" target=3D"_blank">libpsl_0.22.0.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-support/libpsl/<a href=3D"http://libpsl_0.22.0.bb=
" rel=3D"noreferrer" target=3D"_blank">libpsl_0.22.0.bb</a> b/meta/recipes-=
support/libpsl/<a href=3D"http://libpsl_0.22.0.bb" rel=3D"noreferrer" targe=
t=3D"_blank">libpsl_0.22.0.bb</a><br>
index 741038ddc52..1e5e9c74b4c 100644<br>
--- a/meta/recipes-support/libpsl/<a href=3D"http://libpsl_0.22.0.bb" rel=
=3D"noreferrer" target=3D"_blank">libpsl_0.22.0.bb</a><br>
+++ b/meta/recipes-support/libpsl/<a href=3D"http://libpsl_0.22.0.bb" rel=
=3D"noreferrer" target=3D"_blank">libpsl_0.22.0.bb</a><br>
@@ -19,7 +19,7 @@ GITHUB_BASE_URI =3D &quot;<a href=3D"https://github.com/r=
ockdaboot/libpsl/releases" rel=3D"noreferrer" target=3D"_blank">https://git=
hub.com/rockdaboot/libpsl/releases</a>&quot;<br>
<br>
=C2=A0inherit autotools gettext gtk-doc manpages pkgconfig lib_package gith=
ub-releases<br>
<br>
-PACKAGECONFIG ?=3D &quot;icu&quot;<br>
+PACKAGECONFIG ?=3D &quot;idn2&quot;<br>
=C2=A0PACKAGECONFIG[manpages] =3D &quot;--enable-man,--disable-man,libxslt-=
native&quot;<br>
=C2=A0PACKAGECONFIG[icu] =3D &quot;--enable-runtime=3Dlibicu --enable-built=
in=3Dlibicu,,icu&quot;<br>
=C2=A0PACKAGECONFIG[idn2] =3D &quot;--enable-runtime=3Dlibidn2 --enable-bui=
ltin=3Dlibidn2,,libidn2 libunistring&quot;<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#240962): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/240962" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/240962</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/120281289/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/120281289/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000008a3f250656e4e538--

