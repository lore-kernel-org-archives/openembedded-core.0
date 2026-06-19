Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B29F8CD4F26
	for <webhook@archiver.kernel.org>; Fri, 19 Jun 2026 13:29:04 +0000 (UTC)
Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.42362.1781875741272290919
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jun 2026 06:29:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=CzPhPqAq;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=hkRXLmjc;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.145, mailfrom: paul@pbarker.dev)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.stl.internal (Postfix) with ESMTP id E74801D00149;
	Fri, 19 Jun 2026 09:28:59 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Fri, 19 Jun 2026 09:29:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1781875739; x=1781962139; bh=H6WY3ODl7m
	eig48RK/+GHA9rBVtpo/cczgPWBdlZQ0M=; b=CzPhPqAqBXaImThYT0rbO7Lb1g
	smvVWSu0Qmaf1MbKH4d3SzL7Gxj+SZZxdFr/YwHp7K5Xf2pjQiKdkO3M3snbpG6c
	kyGyJPaCdXMan/Kx+fd3R5CD1ESAiW7fMaXP5YRRlMw/GQ6Z+AhYSX3wwG5nsYoR
	S57RvEOrM8RTHPeo47t+MCIwb+pLjmxDjsHHlI+T+Xv1jxYUL75XdvzeltlkGVp0
	AimCFM3snu1ngjSV6pswJWtaFBLEctz94gvsre6uxaW5bRpvRgWLUI53m3kGsQ9h
	uObfW/e7YPMqdGwNYP8+lq+5BeYK1Awc+7/Xv8iaRzvnwxOqJm/2nJXsJHFQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1781875739; x=1781962139; bh=H6WY3ODl7meig48RK/+GHA9rBVtpo/cczgP
	WBdlZQ0M=; b=hkRXLmjcU3nCyOxE5A0aUeeEY6KQxF5gq/BL8e7bnVyWG54S9Bn
	c/MsA1M7pfrub4Uh0js8nWxIaDzbYzUJs13sRloSnmySOHvEa8wSuSKvlyjB7Bgr
	Yn/TBaxM9QzZ9RaGaGlUhGCUYVjBZj5jg8rzJtO/cyMY7DIz66M4A/aNld3u+s9g
	veMexuntxJrXJwokaDi0Doea8RnCENOrEXXxdvXZO+l3OkXAcSQ26GnGL4myhvlw
	Jh8RH4a9qwGPhUKRkOOadShmMbvKUN/wRxKTk+dL8ZhnSz8RZHtxBHefOIMUEOn/
	CkYSezw1DPw3dcMXaeeZT4Xe3UnxgCaBfFw==
X-ME-Sender: <xms:G0Q1avT2LlvPAZ4IjErJcAcBIaI3nH502Ju4xfGBZKuamvzaQWDkJw>
    <xme:G0Q1amz9YR6Zl4zhLaRDcrsSY3ZOyDisvXj_BDMim2ObBG3tPjrVRGv6JGB2QWWbf
    2xvYuvNU6M-RPe126MGMChPPjF8D2clrn4d1wQmRiyo4eiekyb9xypM>
X-ME-Received: <xmr:G0Q1aiflQHWH3ANIobyvZ8IMGNEqOEjjZp4mPAieZPYJ10U6lZjdXorij4w60HSHAfltyPBa55UG8_bsOyAKe1EBJ2vKL81Xki5bbEPvPbJA>
X-ME-Proxy-Cause: dmFkZTECBbyC0Wb6M0ZszSwsfktD7Npwk6gdUWmOtwi3duYkQurUTIG8mWV++xWe020IUs
    GgIfSzTQ39OIHT/qZN8gob4iCBBZdAVnup1SNBJjn5eU1qgQ27ouGaClERgi+AK7sqZPeO
    IkzMOBd+Lw2JRmaLrO+/eoq4eDIwV+ms84wRsT8aEn2P4rlbrSfpHH0BjVi2KUiXjZY7hX
    wP1LbVxwF6k5bqfThHrSA9I7hAw9Anu4KtbfgQoXYQ76e3itM8ulhG2z9z//JyBDayq6nn
    Zadfy1VGnYz6JFtbnnTb23JsQiYB2U4cnDdls28qs3MsozoA2p89I5u2toE/z5CFGUdxaI
    firAfo2nVQ8C9mKtBr7P3v0REod0/JUAX9m86GRBlKofAoGskjzmkB41CowManuuvcCtui
    PaurdMmnIAGXiS6934ZrURvyDMCQG4ROQK5IOO73z0sL3IFA1ruIc+9Z3vQN1ImGdOuofD
    mtRUhpwx4pQGsz4DiuUsQ5AwWXW8jOiOfY7s22GQDMgbGmgStwAljzqbx2dacKd56rbiVY
    /eESL+esCa7Hbd5g7hhp53zyiO7+O8+2Tk7va7EP7bgo1VEAgMGobhO8A9LV6RinBpzvPk
    ycMuz74Yx1efwhbiKDmXSMO3oJl9hL+/bV+ABqi7Yim86joxI+LV2iiBvQqA
X-ME-Proxy: <xmx:G0Q1aqLkUHSVwNueuaqaLLeAoYW6dP1vDwpiL0SFK3CgOrpRxaQYDQ>
    <xmx:G0Q1arFi-V7wwkfjkY1L8nAE6eMiagX1gSWxjwJ8B6CHm4aCkGkw-w>
    <xmx:G0Q1asr2nZVpaAi76SD5jr4ZVEpAt9aXeaCTnNRUl7CyVoB2DFUcvQ>
    <xmx:G0Q1asRCyCklDZSMEqtza8GkPdyUw13En9ozACeVrPlLkNf-gMt4Fg>
    <xmx:G0Q1albu3N52O9Ls9w9isaofJL7bE9B9aJADarLMHMWj-qwIZiLWWtAt>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 19 Jun 2026 09:28:59 -0400 (EDT)
Message-ID: <759c790d3a819de3ba9817e0f368c59b5a439362.camel@pbarker.dev>
Subject: Re: [OE-core][PATCH v2] vim-tiny: bugfix lack of defaults.vim
From: Paul Barker <paul@pbarker.dev>
To: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 19 Jun 2026 14:28:54 +0100
In-Reply-To: <20260605100736.13413-1-zhengrq.fnst@fujitsu.com>
References: <20260605100736.13413-1-zhengrq.fnst@fujitsu.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-qXQSUSI5BQlTXUwARGJb"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2026 13:29:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239170


--=-qXQSUSI5BQlTXUwARGJb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2026-06-05 at 18:07 +0800, Zheng Ruoqin wrote:
> When vim-tiny was used in image, it lacks defaults.vim file which will ca=
use following error
> root@qemux86-64:~# vi
> E1187: Failed to source defaults.vim
> Press ENTER or type command to continue
>=20
> So add a new patch to fix this issue.
>=20
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>

Hi,

After looking at this again and having some discussion, I agree we
should take this simpler patch instead of copying the patch from Debian,
as our version of vim is not always in lock-step with Debian.

I have a couple of comments below...

> ---
>  ...e_defaults-when-Vim-is-invoked-as-vi.patch | 61 +++++++++++++++++++
>  meta/recipes-support/vim/vim.inc              |  3 +
>  2 files changed, 64 insertions(+)
>  create mode 100644 meta/recipes-support/vim/files/0001-skip-source_defau=
lts-when-Vim-is-invoked-as-vi.patch
>=20
> diff --git a/meta/recipes-support/vim/files/0001-skip-source_defaults-whe=
n-Vim-is-invoked-as-vi.patch b/meta/recipes-support/vim/files/0001-skip-sou=
rce_defaults-when-Vim-is-invoked-as-vi.patch
> new file mode 100644
> index 0000000000..7e7bfe0a6d
> --- /dev/null
> +++ b/meta/recipes-support/vim/files/0001-skip-source_defaults-when-Vim-i=
s-invoked-as-vi.patch
> @@ -0,0 +1,61 @@
> +From 7dad45f751d4adbee480005a5546b32a97fdbfb2 Mon Sep 17 00:00:00 2001
> +From: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
> +Date: Fri, 5 Jun 2026 09:34:18 +0000
> +Subject:[PATCH] Skip sourcing defaults.vim when Vim is invoked as
> + vi
> +
> +This is used only in the vim-tiny package to skip "source_defaults" erro=
r
> + E1187: Failed to source defaults.vim
> +Press ENTER or type command to continue
> +
> +Upstream-Status: Inappropriate [oe specific]
> +
> +Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
> +---
> + src/main.c    | 7 +++++++
> + src/structs.h | 4 ++++
> + 2 files changed, 11 insertions(+)
> +
> +diff --git a/src/main.c b/src/main.c
> +index d4019ff51e..685fae2a02 100644
> +--- a/src/main.c
> ++++ b/src/main.c
> +@@ -2059,6 +2059,10 @@ parse_command_name(mparm_T *parmp)
> +     }
> +     else if (STRNICMP(initstr, "vim", 3) =3D=3D 0)
> + 	initstr +=3D 3;
> ++#ifdef TINY_VIMRC
> ++    else if (STRNICMP(initstr, "vi", 2) =3D=3D 0)
> ++       parmp->vi_mode =3D TRUE;
> ++#endif

We should drop the #ifdef guards from the patch as we will only apply it
when building vim-tiny.

> +=20
> +     // Catch "[r][g]vimdiff" and "[r][g]viewdiff".
> +     if (STRICMP(initstr, "diff") =3D=3D 0)
> +@@ -3426,6 +3430,9 @@ source_startup_scripts(mparm_T *parmp)
> + # ifdef USR_EXRC_FILE2
> + 		&& do_source((char_u *)USR_EXRC_FILE2, FALSE,
> + 						       DOSO_NONE, NULL) =3D=3D FAIL
> ++#endif
> ++#if defined(TINY_VIMRC)
> ++                && !parmp->vi_mode
> + # endif
> + 		&& !has_dash_c_arg)
> + 	    {
> +diff --git a/src/structs.h b/src/structs.h
> +index 955b9f1001..09a0f7f7a8 100644
> +--- a/src/structs.h
> ++++ b/src/structs.h
> +@@ -4874,6 +4874,10 @@ typedef struct
> + #ifdef FEAT_DIFF
> +     int		diff_mode;		// start with 'diff' set
> + #endif
> ++#ifdef TINY_VIMRC
> ++    int         vi_mode;                /* started as "vi" */
> ++#endif
> ++
> + } mparm_T;
> +=20
> + /*
> +--=20
> +2.43.0
> +
> diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/=
vim.inc
> index b00b2602ed..1af8a1d6a1 100644
> --- a/meta/recipes-support/vim/vim.inc
> +++ b/meta/recipes-support/vim/vim.inc
> @@ -16,6 +16,7 @@ SRC_URI =3D "git://github.com/vim/vim.git;branch=3Dmast=
er;protocol=3Dhttps;tag=3Dv${PV}
>             file://disable_acl_header_check.patch \
>             file://0001-src-Makefile-improve-reproducibility.patch \
>             file://no-path-adjust.patch \
> +           ${@bb.utils.contains('PACKAGECONFIG', 'tiny', 'file://0001-sk=
ip-source_defaults-when-Vim-is-invoked-as-vi.patch', '', d)} \

Conditional entries in SRC_URI are unfortunate as they make things less
predictable. In this case we have a separate vim-tiny recipe, so we can
add in vim-tiny_9.2.bb:

    SRC_URI +=3D "file://0001-skip-source_defaults-when-Vim-is-invoked-as-v=
i.patch"

>             "
> =20
>  PV .=3D ".0569"
> @@ -32,6 +33,8 @@ inherit autotools-brokensep update-alternatives mime-xd=
g pkgconfig
> =20
>  CLEANBROKEN =3D "1"
> =20
> +CFLAGS:append =3D " ${@bb.utils.contains('PACKAGECONFIG', 'tiny', '-DTIN=
Y_VIMRC', '', d)}"

We can drop this CFLAGS modification with the above changes made.

Best regards,

--=20
Paul Barker


--=-qXQSUSI5BQlTXUwARGJb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCajVEFhEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bnyJAP9Et4TKptcsd2YdCc243Ld+y9j0DZpFjvNV
kbDQAIXWswEAzBAXNGbvCxDzeezzfGgUVexfObFE7xgRwDT3tdpMcQI=
=xRKb
-----END PGP SIGNATURE-----

--=-qXQSUSI5BQlTXUwARGJb--

