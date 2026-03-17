Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FE44F3382F
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 09:53:16 +0000 (UTC)
Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.72444.1773741178371936849
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Mar 2026 02:52:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=hGBlUjVv;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=IRy+DA3V;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.147, mailfrom: paul@pbarker.dev)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id 8B490EC00A2;
	Tue, 17 Mar 2026 05:52:57 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Tue, 17 Mar 2026 05:52:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1773741177; x=1773827577; bh=rY/qYchjlY
	xDiG4G+QPRgroeDbkEoda3wxlSiNWEnKo=; b=hGBlUjVvtWvN0oVXwF2b2F9xAP
	5LnYvKSoIQR+GomEuYAfSvjO36trfKBfDWwbR/zPT2gHK27XkHNoQ4BUVHX57K98
	OU9QQFhM44qpdUj2c43uCR9V3r0jl7wPUXLJecSNQ0EEk9NdVw4Zyx86XckH5A9q
	QDpTQeaGB8Ig1tvDS1wujWC6w1SVqS1uyFoE115vsjrsSAHaBbSfTR0XuCqxx4Dx
	OydYz2nr1zcGWV1v099C01c8nPcLqRADXsjWqLa66bGT6OkSIYiFi3Md0HWLjGfG
	nrySfB575R286UdNO6fruTqPsWSW7Ig+rWcODTmWje9hGteUzEAAeY9C4VOA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1773741177; x=1773827577; bh=rY/qYchjlYxDiG4G+QPRgroeDbkEoda3wxl
	SiNWEnKo=; b=IRy+DA3VVEz9lXTpPWcLcmBR45ZXQCnA7Kpwz5UIvPanuruHvlp
	e3oi9qHp2xnA1J8hUKICoY9uSwPCNwK1FcLbyhnXOsImLKS+5Dmoq18y7OeIg08d
	Lnzfp7sToGzl2qWM9zz/SA+2IZTKKIwUeYyxLpRQJPTMdCgvpasXixiX+1ecpbdx
	qYd1L4o49rPW32do1EETFAKqGKYjNdm3n0fle+//zydrFxzG5Kh/vVrjoWzl8GHo
	2AZ4aakHCB9cnj2BHYvpH6eHE8iCf+cN7ukmju43LpMFcw/VmqVzloWFiOtlxMRa
	4aiYP0/tQTG3jIc3xYGxUXGz3FXGcY3Kw1w==
X-ME-Sender: <xms:eSS5aX0RAw3QqVRpLhhNoillRL68E189OFpDdLAcCjoEXgjq7tWlAA>
    <xme:eSS5adi3EoN5pbs_kbbeBfJP33nD-LMEwk2NkBu87t16yjtFToUMCqpshewVZBIjA
    qraPBMMcjjOc87eYH6Ofk3-UXTdh-afJxlxf-LqsaiT-YBFe49y_ao>
X-ME-Received: <xmr:eSS5aVRfwp8s2vlU85JloNfRDp4LB88X0MuPav-uOnWoIglXY1FWPFMJ8WGy_508cmop-QFHDAmHsLtE-SMQ5XUITQLXDGhvSzL5jxi4FVuw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeftddtleegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepkffuhffvveffjghftggfggesghdtreertderjeenucfhrhhomheprfgruhhluceu
    rghrkhgvrhcuoehprghulhesphgsrghrkhgvrhdruggvvheqnecuggftrfgrthhtvghrnh
    epjeeiveffleegffeihfefkeeljeeftdduueelvddvgedutdfhhfefteevueekffevnecu
    ffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdrohhrghdpghhithhhuhgsrdgtohhmne
    cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgruhhl
    sehpsggrrhhkvghrrdguvghvpdhnsggprhgtphhtthhopeefpdhmohguvgepshhmthhpoh
    huthdprhgtphhtthhopehhphhrrghjrghprghtihesmhhvihhsthgrrdgtohhmpdhrtghp
    thhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsg
    gvugguvggurdhorhhgpdhrtghpthhtohephihorghnnhdrtghonhhgrghlsehsmhhilhgv
    rdhfrh
X-ME-Proxy: <xmx:eSS5aWiSoknnXgQ0COyZ7-LG8kAY2q0uZ82plFI8vHkn27ETn8Z_gQ>
    <xmx:eSS5ad5BA_wusMufAecfzZcpoab3ZuPUx_sZCxTLg9fMnQ3p8G7PWQ>
    <xmx:eSS5abAAyoFdt2cLzNEr95dxDUw3VOcoZoy_eO3e8q2tHQ3BaRT7qQ>
    <xmx:eSS5acZ0s29V2IiVAOMdNDePXiRaGip-o9eqXDdr99hSopwYp8gzHQ>
    <xmx:eSS5aUzLVbu8aRcEMkzX7aEsdBBLJ_WSe-8HWv1MA1GZqICU43_0mtpq>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 17 Mar 2026 05:52:56 -0400 (EDT)
Message-ID: <50ec8cfbd9e7c20b4d9b323e048046174af25b1d.camel@pbarker.dev>
Subject: Re: [OE-core] [scarthgap][PATCH 1/2] vim: upgrade 9.1.1683 ->
 9.1.2128
From: Paul Barker <paul@pbarker.dev>
To: hprajapati@mvista.com, openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Date: Tue, 17 Mar 2026 09:52:50 +0000
In-Reply-To: <20260317053341.42864-1-hprajapati@mvista.com>
References: <20260317053341.42864-1-hprajapati@mvista.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-Q63iaJ16p7EGpxTzusUu"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 09:53:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233309


--=-Q63iaJ16p7EGpxTzusUu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2026-03-17 at 11:03 +0530, Hitendra Prajapati via
lists.openembedded.org wrote:
> Removes CVE-2025-66476 from CVE metrics.
> It's fixed in 9.1.1947, but only affects Vim for Windows.
>=20
> Rebased patches and resolved conflicts.
>=20
> Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> ---
>  .../vim/files/0001-src-Makefile-improve-reproducibility.patch | 4 ++--
>  meta/recipes-support/vim/files/disable_acl_header_check.patch | 4 ++--
>  meta/recipes-support/vim/files/no-path-adjust.patch           | 2 +-
>  meta/recipes-support/vim/vim.inc                              | 4 ++--
>  meta/recipes-support/vim/vim_9.1.bb                           | 2 --
>  5 files changed, 7 insertions(+), 9 deletions(-)
>=20
> diff --git a/meta/recipes-support/vim/files/0001-src-Makefile-improve-rep=
roducibility.patch b/meta/recipes-support/vim/files/0001-src-Makefile-impro=
ve-reproducibility.patch
> index 0741745adc..ae78059296 100644
> --- a/meta/recipes-support/vim/files/0001-src-Makefile-improve-reproducib=
ility.patch
> +++ b/meta/recipes-support/vim/files/0001-src-Makefile-improve-reproducib=
ility.patch
> @@ -20,7 +20,7 @@ diff --git a/src/Makefile b/src/Makefile
>  index 32c0d97d1..97c754673 100644
>  --- a/src/Makefile
>  +++ b/src/Makefile
> -@@ -3138,16 +3138,10 @@ auto/pathdef.c: Makefile auto/config.mk
> +@@ -3143,16 +3143,10 @@ auto/pathdef.c: Makefile auto/config.mk
>   	-@echo '#include "vim.h"' >> $@
>   	-@echo 'char_u *default_vim_dir =3D (char_u *)"$(VIMRCLOC)";' | $(QUOT=
ESED) >> $@
>   	-@echo 'char_u *default_vimruntime_dir =3D (char_u *)"$(VIMRUNTIMEDIR)=
";' | $(QUOTESED) >> $@
> @@ -29,7 +29,7 @@ index 32c0d97d1..97c754673 100644
>  -	-@echo 'char_u *compiled_user =3D (char_u *)"' | tr -d $(NL) >> $@
>  -	-@if test -n "$(COMPILEDBY)"; then \
>  -		echo "$(COMPILEDBY)" | tr -d $(NL) >> $@; \
> --		else ((logname) 2>/dev/null || whoami) | tr -d $(NL) >> $@; fi
> +-		else (logname 2>/dev/null || whoami) | tr -d $(NL) >> $@; fi
>  -	-@echo '";' >> $@
>  -	-@echo 'char_u *compiled_sys =3D (char_u *)"' | tr -d $(NL) >> $@
>  -	-@if test -z "$(COMPILEDBY)"; then hostname | tr -d $(NL) >> $@; fi
> diff --git a/meta/recipes-support/vim/files/disable_acl_header_check.patc=
h b/meta/recipes-support/vim/files/disable_acl_header_check.patch
> index 2a5487e685..b34f91c9b6 100644
> --- a/meta/recipes-support/vim/files/disable_acl_header_check.patch
> +++ b/meta/recipes-support/vim/files/disable_acl_header_check.patch
> @@ -17,7 +17,7 @@ diff --git a/src/configure.ac b/src/configure.ac
>  index cdb818519..dafb7d6ce 100644
>  --- a/src/configure.ac
>  +++ b/src/configure.ac
> -@@ -3400,7 +3400,7 @@ AC_CHECK_HEADERS(stdint.h stdlib.h string.h \
> +@@ -3440,7 +3440,7 @@ AC_CHECK_HEADERS(stdint.h stdlib.h string.h \
>   	sys/systeminfo.h locale.h sys/stream.h termios.h \
>   	libc.h sys/statfs.h poll.h sys/poll.h pwd.h \
>   	utime.h sys/param.h sys/ptms.h libintl.h libgen.h \
> @@ -26,7 +26,7 @@ index cdb818519..dafb7d6ce 100644
>   	sys/access.h sys/sysinfo.h wchar.h wctype.h)
>  =20
>   dnl sys/ptem.h depends on sys/stream.h on Solaris
> -@@ -4137,6 +4137,7 @@ AC_ARG_ENABLE(acl,
> +@@ -4182,6 +4182,7 @@ AC_ARG_ENABLE(acl,
>   	, [enable_acl=3D"yes"])
>   if test "$enable_acl" =3D "yes"; then
>     AC_MSG_RESULT(no)
> diff --git a/meta/recipes-support/vim/files/no-path-adjust.patch b/meta/r=
ecipes-support/vim/files/no-path-adjust.patch
> index 1b380393d8..a4efce491e 100644
> --- a/meta/recipes-support/vim/files/no-path-adjust.patch
> +++ b/meta/recipes-support/vim/files/no-path-adjust.patch
> @@ -18,7 +18,7 @@ diff --git a/src/Makefile b/src/Makefile
>  index c9513a632..7a7cbdc43 100644
>  --- a/src/Makefile
>  +++ b/src/Makefile
> -@@ -2552,11 +2552,7 @@ installtools: $(TOOLS) $(DESTDIR)$(exec_prefix) $=
(DEST_BIN) \
> +@@ -2531,11 +2531,7 @@ installtools: $(TOOLS) $(DESTDIR)$(exec_prefix) $=
(DEST_BIN) \
>   		 rm -rf $$cvs; \
>   	      fi
>   	-chmod $(FILEMOD) $(DEST_TOOLS)/*
> diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/=
vim.inc
> index 289f31be70..0ce6aa71a4 100644
> --- a/meta/recipes-support/vim/vim.inc
> +++ b/meta/recipes-support/vim/vim.inc
> @@ -18,8 +18,8 @@ SRC_URI =3D "git://github.com/vim/vim.git;branch=3Dmast=
er;protocol=3Dhttps \
>             file://no-path-adjust.patch \
>             "
> =20
> -PV .=3D ".1683"
> -SRCREV =3D "b922b30cfe4c044c83bac3cc908084ed20a83598"
> +PV .=3D ".2128"
> +SRCREV =3D "392b428d1239e963020b73682cd03f17ffb538b3"
> =20
>  # Do not consider .z in x.y.z, as that is updated with every commit
>  UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>\d+\.\d+)\.0"
> diff --git a/meta/recipes-support/vim/vim_9.1.bb b/meta/recipes-support/v=
im/vim_9.1.bb
> index c492342ffb..fee9f055e9 100644
> --- a/meta/recipes-support/vim/vim_9.1.bb
> +++ b/meta/recipes-support/vim/vim_9.1.bb
> @@ -21,5 +21,3 @@ ALTERNATIVE_LINK_NAME[xxd] =3D "${bindir}/xxd"
>  # in many places for _FORTIFY_SOURCE=3D2.  Security flags become part of=
 CC.
>  #
>  lcl_maybe_fortify =3D "${@oe.utils.conditional('DEBUG_BUILD','1','','-D_=
FORTIFY_SOURCE=3D1',d)}"
> -
> -CVE_STATUS[CVE-2025-66476] =3D "not-applicable-platform: Issue only appl=
ies on Windows"

The CVE_STATUS assignment you're removing here should already cause this
issue to be marked as resolved in CVE metrics. Where are you seeing this
CVE as unresolved?

Best regards,

--=20
Paul Barker


--=-Q63iaJ16p7EGpxTzusUu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCabkkchEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bkHoAP9AqujOrkRONmr+LJSxmmjDCFmYQUbh2iW8
6cTE8m2aEwD8C/cTFinUBNE49CwlpF+J2gWyvTPjku+1o9/8iBTbDgo=
=EnK+
-----END PGP SIGNATURE-----

--=-Q63iaJ16p7EGpxTzusUu--

