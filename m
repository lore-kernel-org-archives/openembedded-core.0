Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AA35C02192
	for <webhook@archiver.kernel.org>; Wed,  5 Feb 2025 21:36:10 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web11.24870.1738791365236879381
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Feb 2025 13:36:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PrghuGqv;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6e41e17645dso2406276d6.2
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Feb 2025 13:36:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738791364; x=1739396164; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zbjWz1uB+cdsCAegSt0OG7+Js8afJAvAZkq93KTSFgE=;
        b=PrghuGqv9a+742/Nf5d3HCCYcCPeTBvEM6TMbOpE2vPgkgSjhUh1sSGk/JayxLlirv
         k7BpHpvK+OmuA92GbDOr+Yd94Il7UiP322YCffAgGbMXqYdG8eUYme3X+VC9c4onmcFi
         V6YWkETFwAxf6MnG/zJkP03tyPPhXIPXIF2OjCNyKuONQGExVxfHEpr3AMtrBs5+V30f
         uQma2t0OlfscWXnpAKKzhGIIqSOdyp7EIi+iVsXoM3UCFcEacl+Yo668FpaC3X24CAUg
         A2mEZrXViMaXKrKsB/RvfiNfxZYN7e1j8b2wu3ZbqFTUH8h+iBG/1v3ANrDBbs1TsCEb
         aMww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738791364; x=1739396164;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zbjWz1uB+cdsCAegSt0OG7+Js8afJAvAZkq93KTSFgE=;
        b=dtqvT5yaTsA5mjVKiZmn1Fsp5hLMORwUNu/ylaMGWEhVFEO8OTsL9BIBZ6JL+yGjE4
         n+WxYMg4MkCJi0Zt54ApPdY+pTuUmONaLR6s4SYsMAOLPqip0p5U4K1t2fZlYwUT9gjb
         O1T9YnAPc/jQi6HwWjmOSy8yW+pztTEVNyorXfZsu1vhsWuVSHxSGT4L/FJM2DqwWRVv
         kTWudNC3N1EgDxE8WHWVd3FEEx8/zc3i+MPfg034XWOFP9GvIqEE4+KFgR23cFP1Q12V
         XzLMK55geDWjWCb37SD5BoaQ31jQYiAfbzxcIQ1p3SEXdPqG/Cx+2ETU3AijhdlursYw
         p0zg==
X-Gm-Message-State: AOJu0YwG1PETRCIcs4gH9KeMOaOIIIsrepsQn8Lg1k599GiTXlqt8eBq
	83TCPGbWaribiVx3Z8UGHS9QIDKuOvxwr5+GiSvsXeK5plpNGcwneSUWgCPr1daagHppkwV6aw3
	giqlfPqDfJrexxtzdwMNEybCesbU=
X-Gm-Gg: ASbGnctoRs0BAMYESK9ZEGz6Mgix9ndg6wnNa8nPR4L09iu9VcQZgSeqIiUgwJOZMJg
	rROmPYs67+jR79c0+52eB1rWjVVxf+Wcq2m2AdCrt51ut3C8GdYDKLBVhzThp/LqSzOdcwlekMW
	QoZ/tgxZzauUnRgqdYdt3iTUOqpRY=
X-Google-Smtp-Source: AGHT+IHztVq4e7OO80fEtp0mJNvhH0nEzQxrwSCeJZnyzB1+Vhw8Ksk/Ih9QLURYZ2vaa4hBhm7bN+qZ6RQqTkcnJqo=
X-Received: by 2002:a05:6214:1d2a:b0:6d8:9e16:d07e with SMTP id
 6a1803df08f44-6e42fb04898mr72586296d6.4.1738791364229; Wed, 05 Feb 2025
 13:36:04 -0800 (PST)
MIME-Version: 1.0
References: <20250205212427.2044310-1-JPEWhacker@gmail.com>
In-Reply-To: <20250205212427.2044310-1-JPEWhacker@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 5 Feb 2025 22:35:53 +0100
X-Gm-Features: AWEUYZnGa9BfMaoDNrANyLTFE9rLZk2qa1i7AI5pcAPRqnMKBNLvkiXWDhNWJVk
Message-ID: <CANNYZj9Ca6cQcFcb_moABSKX5=HtdRAzvL_ayyCg2cnkuEKcqw@mail.gmail.com>
Subject: Re: [OE-core][PATCH] bitbake.conf: Include fragments before local.conf
To: Joshua Watt <jpewhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000009a80df062d6be92d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Feb 2025 21:36:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210876

--0000000000009a80df062d6be92d
Content-Type: text/plain; charset="UTF-8"

We have discussed this before. With this change, users will no longer be
able to set fragments from local.conf, as addfragments would be processed
before that file. You need to use ?= in fragments instead for things that
are meant to be overridden.

Alex

On Wed 5. Feb 2025 at 22.24, Joshua Watt <jpewhacker@gmail.com> wrote:

> Per some usability assessment and offline discussion, one of the useful
> use cases of config fragments is that they allow the "default"
> configuration for some device to be committed to source control and
> easily selected and used by the end users. However, when doing this,
> there is still the desire that the user can "override" the provided
> fragments for their local builds in local.conf
>
> As a practical example, the configuration for a product can be capture
> as a config fragment, and an empty local.conf will reproduce the
> standard build for the product. If the user wants to make "tweaks" to
> the standard build, they can do so in local.conf
>
> As such, move the config fragments to be loaded before local.conf
>
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  meta/conf/bitbake.conf | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 8b607088c6e..d0154044f5a 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -826,12 +826,13 @@ FILESOVERRIDES =
> "${TRANSLATED_TARGET_ARCH}:${MACHINEOVERRIDES}:${DISTROOVERRIDE
>  require conf/abi_version.conf
>  include conf/site.conf
>  include conf/auto.conf
> -include conf/local.conf
>
>  OE_FRAGMENTS_PREFIX ?= "conf/fragments"
>  OE_FRAGMENTS_METADATA_VARS ?= "BB_CONF_FRAGMENT_SUMMARY
> BB_CONF_FRAGMENT_DESCRIPTION"
>  addfragments ${OE_FRAGMENTS_PREFIX} OE_FRAGMENTS
> OE_FRAGMENTS_METADATA_VARS
>
> +include conf/local.conf
> +
>  require ${@"conf/multiconfig/${BB_CURRENT_MC}.conf" if "${BB_CURRENT_MC}"
> != "" else ""}
>  include conf/machine/${MACHINE}.conf
>  include conf/machine-sdk/${SDKMACHINE}.conf
> --
> 2.47.1
>
>

--0000000000009a80df062d6be92d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">We have discussed this before. With this change, users wi=
ll no longer be able to set fragments from local.conf, as addfragments woul=
d be processed before that file. You need to use ?=3D in fragments instead =
for things that are meant to be overridden.</div><div dir=3D"auto"><br></di=
v><div dir=3D"auto">Alex</div><div><br><div class=3D"gmail_quote gmail_quot=
e_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed 5. Feb 2025 at 22=
.24, Joshua Watt &lt;<a href=3D"mailto:jpewhacker@gmail.com">jpewhacker@gma=
il.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;paddi=
ng-left:1ex;border-left-color:rgb(204,204,204)">Per some usability assessme=
nt and offline discussion, one of the useful<br>
use cases of config fragments is that they allow the &quot;default&quot;<br=
>
configuration for some device to be committed to source control and<br>
easily selected and used by the end users. However, when doing this,<br>
there is still the desire that the user can &quot;override&quot; the provid=
ed<br>
fragments for their local builds in local.conf<br>
<br>
As a practical example, the configuration for a product can be capture<br>
as a config fragment, and an empty local.conf will reproduce the<br>
standard build for the product. If the user wants to make &quot;tweaks&quot=
; to<br>
the standard build, they can do so in local.conf<br>
<br>
As such, move the config fragments to be loaded before local.conf<br>
<br>
Signed-off-by: Joshua Watt &lt;<a href=3D"mailto:JPEWhacker@gmail.com" targ=
et=3D"_blank">JPEWhacker@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/conf/bitbake.conf | 3 ++-<br>
=C2=A01 file changed, 2 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf<br>
index 8b607088c6e..d0154044f5a 100644<br>
--- a/meta/conf/bitbake.conf<br>
+++ b/meta/conf/bitbake.conf<br>
@@ -826,12 +826,13 @@ FILESOVERRIDES =3D &quot;${TRANSLATED_TARGET_ARCH}:${=
MACHINEOVERRIDES}:${DISTROOVERRIDE<br>
=C2=A0require conf/abi_version.conf<br>
=C2=A0include conf/site.conf<br>
=C2=A0include conf/auto.conf<br>
-include conf/local.conf<br>
<br>
=C2=A0OE_FRAGMENTS_PREFIX ?=3D &quot;conf/fragments&quot;<br>
=C2=A0OE_FRAGMENTS_METADATA_VARS ?=3D &quot;BB_CONF_FRAGMENT_SUMMARY BB_CON=
F_FRAGMENT_DESCRIPTION&quot;<br>
=C2=A0addfragments ${OE_FRAGMENTS_PREFIX} OE_FRAGMENTS OE_FRAGMENTS_METADAT=
A_VARS<br>
<br>
+include conf/local.conf<br>
+<br>
=C2=A0require ${@&quot;conf/multiconfig/${BB_CURRENT_MC}.conf&quot; if &quo=
t;${BB_CURRENT_MC}&quot; !=3D &quot;&quot; else &quot;&quot;}<br>
=C2=A0include conf/machine/${MACHINE}.conf<br>
=C2=A0include conf/machine-sdk/${SDKMACHINE}.conf<br>
-- <br>
2.47.1<br>
<br>
</blockquote></div></div>

--0000000000009a80df062d6be92d--

