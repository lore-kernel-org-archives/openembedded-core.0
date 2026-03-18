Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EDC41088E5C
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 23:38:25 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28423.1773877103743604258
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Mar 2026 16:38:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Wg8siOo8;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-485409ab264so2144355e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 16:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1773877102; x=1774481902; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=io1ocrfLc9BlZwzpDvxMp4OM8FxXAfNqOCNfJHtal5E=;
        b=Wg8siOo8iMShVGvcUww92kxPgxRu32yj8U52LAKCFj/froOHh6EwputtNoNcep6pQY
         Nr6vRoS79sw1Dz8Bv5tSW3fx0cKRfZE/HArgywd2s++GFU9sKhEKhogrIkrV3jJHInUl
         h0dTmD0G7UnwPNsC5gaOnxegN1CgWydNG6ONk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773877102; x=1774481902;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=io1ocrfLc9BlZwzpDvxMp4OM8FxXAfNqOCNfJHtal5E=;
        b=Vs3WSz2rF7lCivIpk0SIL2VEMFGthZUVJiGKEDs7/Rg+lAzfHgXz81tLWKxS1Rb06K
         1oA+lKJjwOs3y58Je8h0EMsLnfGMOftpIQ57eoZxlncDh8JRc+HZDJ49o/7BGPTENLuo
         H1vMRY7HCJPiUBuTqeO02TuEeDduMmuGu21VJMJDK5qa44GqThcDkW89u6vxV5OFW76j
         CemPzN1foEUX+5+Klsgbzi0VikOROgy2DtM+NL2hvoLvUKY03PIZeNW9TXdOzJt5VWzN
         MWezJn+jrvFvSvUK5VRziJplybtiX26NF4ZO3LsGeODo4K14Uu8aupimG2X7lG9qg0JL
         d5Tg==
X-Forwarded-Encrypted: i=1; AJvYcCW4JWkhOUi3V6Ka+5fVZidToHdSu6WipfOeHJXok8xPL3hioknwy2reTJCcwV2iTuyN0LpYorMyjdfD+sSvptc2ZA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzlxYWOWBbGRwLor16l99yfEQqmTd0AIj6iNyRAbvZzRfphYCWv
	+o1G+hbylW1JHbKMFhFPylzi/xBCvnbmdkWoz3tqEnTZz9nm6VCaETMZEhsb4JrOspQ=
X-Gm-Gg: ATEYQzxiPVAPdiGdI3xVuKbeo06MehoIkDPRzYSaPZb2QxtXvmYmazFoLOtem96MWrI
	GHIfri87ntY6CyIxQR+bTgc2iRoeheNdlDWxIHLvI+7V1Ikozc9CD+BqtbQnzk5k0gg06eBtY+R
	g7T+kwzN0+rLywTDKtENEDD/ey0LJzs0I3vVgtzO8lYi20vnKw0meKHKU90FBdwO3kLaROYPxdi
	H/g3EwBXiCsV7Pl7c0YYngrcPA7baVzBHaZpaWKdGWTTSwApKVmp8N2k9M9lLSSWcpCOHya9wxs
	FebZTuzBzTN+bgfBGBly1cZsmg154kETJj0SP4RPjx1xmLJxf4SZVmkJpCtYFHHZPcmPhS37kY2
	uixpkJXMnwaRXnYCkuI90m7V+pFWTbE3EgwpVL+yhcD4y2gHbkrAiBBF6zYJvETj4Sw/kLNVbnL
	bmTehSRrhDNJJRwPHa8YU2llrU4chQjnx7VBFP6ZCKfWFwNczT3/l+PUYiuANxXOFX6X5HLLTcK
	47sDeijMZgYU5o=
X-Received: by 2002:a05:600c:8b31:b0:483:6d9e:e4f5 with SMTP id 5b1f17b1804b1-486f8b20188mr22675155e9.5.1773877101880;
        Wed, 18 Mar 2026 16:38:21 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:175c:b5e0:4170:203a? ([2001:8b0:aba:5f3c:175c:b5e0:4170:203a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f8b322d9sm23526085e9.8.2026.03.18.16.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 16:38:21 -0700 (PDT)
Message-ID: <9fe457c2fae233e5c6821cc2ced1758f58ae883c.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] Revert "insane.bbclass: Move test for
 invalid PACKAGECONFIGs to do_recipe_qa"
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: peter.kjellerstedt@axis.com, openembedded-core@lists.openembedded.org
Date: Wed, 18 Mar 2026 23:38:19 +0000
In-Reply-To: <20260318215934.1949404-2-pkj@axis.com>
References: <20260318215934.1949404-1-pkj@axis.com>
	 <20260318215934.1949404-2-pkj@axis.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1ubuntu0.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 23:38:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233453

Hi Peter,

On Wed, 2026-03-18 at 22:59 +0100, Peter Kjellerstedt via lists.openembedde=
d.org wrote:
> This reverts commit d3325c384a7df54c564cae093659cf7b692629f2.
>=20
> Moving the QA test for invalid PACKAGECONFIGs to the recipe_qa task
> turned out to be a bad idea as that task is expected to be architecture
> independent. So move it back to the qa_configure function. The original
> problem (that the configure task is not run for packagegroups) will have
> to be solved in packagegroup.bbclass instead.
>=20
> Signed-off-by: Peter Kjellerstedt <pkj@axis.com>
> ---
> =C2=A0meta/classes-global/insane.bbclass | 20 ++++++++++----------
> =C2=A01 file changed, 10 insertions(+), 10 deletions(-)
>=20
> diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/ins=
ane.bbclass
> index aeffee7983..7b13e932ff 100644
> --- a/meta/classes-global/insane.bbclass
> +++ b/meta/classes-global/insane.bbclass
> @@ -1423,6 +1423,16 @@ Rerun configure task after fixing this."""
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 except subprocess.Called=
ProcessError:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
pass
> =C2=A0
> +=C2=A0=C2=A0=C2=A0 # Check invalid PACKAGECONFIG
> +=C2=A0=C2=A0=C2=A0 pkgconfigs =3D (d.getVar("PACKAGECONFIG") or "").spli=
t()
> +=C2=A0=C2=A0=C2=A0 if pkgconfigs:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pkgconfigflags =3D d.getVarFl=
ags("PACKAGECONFIG") or {}
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 invalid_pkgconfigs =3D set(pk=
gconfigs) - set(pkgconfigflags)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if invalid_pkgconfigs:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pn =
=3D d.getVar('PN')
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 error=
_msg =3D "%s: invalid PACKAGECONFIG(s): %s" % (pn, " ".join(sorted(invalid_=
pkgconfigs)))
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 oe.qa=
.handle_error("invalid-packageconfig", error_msg, d)
> +
> =C2=A0=C2=A0=C2=A0=C2=A0 oe.qa.exit_if_errors(d)
> =C2=A0}
> =C2=A0
> @@ -1484,21 +1494,11 @@ python do_recipe_qa() {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
if re.search(r"git(hu|la)b\.com/.+/.+/archive/.+", url) or "//codeload.gith=
ub.com/" in url:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 oe.qa.handle_error("src-uri-bad", "%s: SRC_URI use=
s unstable GitHub/GitLab archives, convert recipe to use git protocol" % pn=
, d)
> =C2=A0
> -=C2=A0=C2=A0=C2=A0 def test_packageconfig(pn, d):
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pkgconfigs =3D (d.getVar("PAC=
KAGECONFIG") or "").split()
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if pkgconfigs:
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pkgco=
nfigflags =3D d.getVarFlags("PACKAGECONFIG") or {}
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 inval=
id_pkgconfigs =3D set(pkgconfigs) - set(pkgconfigflags)
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if in=
valid_pkgconfigs:
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 error_msg =3D "%s: invalid PACKAGECONFIG(s): %s" % (pn, =
" ".join(sorted(invalid_pkgconfigs)))
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 oe.qa.handle_error("invalid-packageconfig", error_msg, d=
)
> -
> =C2=A0=C2=A0=C2=A0=C2=A0 pn =3D d.getVar('PN')
> =C2=A0=C2=A0=C2=A0=C2=A0 test_naming(pn, d)
> =C2=A0=C2=A0=C2=A0=C2=A0 test_missing_metadata(pn, d)
> =C2=A0=C2=A0=C2=A0=C2=A0 test_missing_maintainer(pn, d)
> =C2=A0=C2=A0=C2=A0=C2=A0 test_srcuri(pn, d)
> -=C2=A0=C2=A0=C2=A0 test_packageconfig(pn, d)
> =C2=A0=C2=A0=C2=A0=C2=A0 oe.qa.exit_if_errors(d)
> =C2=A0}

Thanks for sending this. Atfer a bit of thought, I have a slightly
different idea which might be worth a try, perhaps we can put the
PACKAGECONFIG code into a function in lib/oe/qa.py and then call it
from the configure postfunc but also as a postfunc in one of the
packagegroup tasks?

I'd prefer not to reinstate the configure task if we can help it as
those tasks have "special" meanings and it is safer to remove
everything consistently if we can.

Cheers,

Richard

