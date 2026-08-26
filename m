Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D54CCC61DBD
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 07:13:09 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7177.1787728381354131934
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 00:13:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JOpseP/H;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4996f1ee4a4so3652255e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 00:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1787728379; x=1788333179; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yOnfZ/9ebYmHHmIvt0upixR9f90RuOqyMXOF15Y5avU=;
        b=JOpseP/HXQbxicsOnbmVCn/Z1/a7O7oUf0KuahBNTFW4iXu+7mzCkp08NJwOKjVuwM
         9nUd4RhsDV2LuBVAyWwQzGjXGyzJOGsoJ7vuimZK9LtDsMS1W7EniRHyAAo/Zkg43hZ5
         ScmTZkUbCKGGE2nVRGh1LTZx43oeNCuJ6qrN8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787728379; x=1788333179;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yOnfZ/9ebYmHHmIvt0upixR9f90RuOqyMXOF15Y5avU=;
        b=qP14zzijGDAXq/e8+rkVPcaERbn2RjbN94lVp/GDBfTUI3TEXGg5XhdqAorWh/Fdeo
         vIwuSuwLk/ycJZi1FmnMiyb8Rtc+xmwCzPwRF03R856v0yxOiBnbhCF3SyEqBYk4uFaP
         3WD/cUD4avx0APa4Sx4dgzde4uSaOkLLggX7TwBuNS+4K4mlvCzHzrdZ2/rFG4+aC1aq
         hsDIBNjA6Ea2GtWPLjXCYEYTRkgxOC342x8mRQT92T85Wv32YCLT90Vdx3u4j4+mo3fM
         Tu5pqaQ9k43sNJXQtmwOMxAnSDkXJu1zwBqA3qUR6axwyKmZucGnqK8fTh8jCP9MQray
         iZkg==
X-Forwarded-Encrypted: i=1; AHgh+RpEBPcwtFSmAZyee8dwv5lltmSSPv9rNzhaYxVTkuGz1LGteBJrqhebiJva1/pzXf0iU/ha/mMeB3BFRFaEP7qdZQ==@lists.openembedded.org
X-Gm-Message-State: AFuF++n3/b4FEXM4hVPTNbl2ColpNuec/hQPu4lev3rska1Dgp7DFq83
	EWB0K2XLalSn6chURGQRI2VBV6w/zq4dCMuZOQmL8FtpFu779dBP7OwMZLWKP8MIpm3xWrfpXEA
	J+pIcI38=
X-Gm-Gg: AR+sD12b9a99lkZgJo4JN8ivCZidwAbBxlRRzEfUxhGCRUpj21i71D6zHf12ETJltwh
	8e9uJFpL4PsDQk2/s1Bq/LSKPVedVErwuPbxNx8e8GxoyzgQ/y7E5hmoxORWHRtyqz/2RdGWBR3
	7I9hmrmrJ/q4W5ewv1hpA03Ua4kUOFa9lNNh/PQ1QomKsFcnYPMT73tqILBFwFsnFgyyy4oxdiB
	j8b+ZIEWKujdqIWoClRFAcJW3jB3pvSGIScO3Mi8g01Vy7EngWdLQLj6h3Yp+ImQIBTKYfwdy/F
	A7lPNbLmLqcqdGKzqgNmi7mWcYMjW3q+B/fqPbEwEl6c8gzF+WO4OzHVt66Uho+ncsx+/+rq9Pe
	FeDdk4GJOGX43HcuY2zUl37JeQhUPSO2LG5T8ZvEjmrwrbPTIRl1HfSazO5izSMlc6Jo2lciPUP
	sdznC6xCGd5lHRb4zReMPytACVg5ooCQ28DSpnkeRw3jsFcTk2NHAyST/lImlGG8tR+X6q4tRFG
	LsWWYVN6F5SsnRjGSnd4gkhDZ3v46tHBUrlBDGzs+viKaPeS/npmQKIvbqNg9zU
X-Received: by 2002:a05:600c:4e41:b0:499:7a4f:d13d with SMTP id 5b1f17b1804b1-499dc6edad5mr39294555e9.4.1787728379166;
        Wed, 26 Aug 2026 00:12:59 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:e581:1e52:aeaa:4925? ([2001:8b0:aba:5f3c:e581:1e52:aeaa:4925])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dcada8absm16416115e9.13.2026.08.26.00.12.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 00:12:58 -0700 (PDT)
Message-ID: <9ea350e294feb146ab93cf2e19321a779a010052.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] archiver.bbclass: Add
 ARCHIVER_MIRROR_INCLUDE
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: peter.kjellerstedt@axis.com, openembedded-core@lists.openembedded.org
Date: Wed, 26 Aug 2026 08:12:54 +0100
In-Reply-To: <20260825190741.3011162-2-pkj@axis.com>
References: <20260825190741.3011162-1-pkj@axis.com>
	 <20260825190741.3011162-2-pkj@axis.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 07:13:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244315

On Tue, 2026-08-25 at 21:07 +0200, Peter Kjellerstedt via lists.openembedde=
d.org wrote:
> When using the archiver's mirror mode, ARCHIVER_MIRROR_INCLUDE contains
> a list of URI prefixes to always include in the mirror. This may be
> useful if recipes that are included in the mirror (due to their
> licenses) depend on some recipe that otherwise would not be included in
> the mirror, and that recipe uses files that are normally only available
> on a private server.
>=20
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
> =C2=A0meta/classes/archiver.bbclass=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 35 ++++++++++++++++++++++--
> =C2=A0meta/lib/oeqa/selftest/cases/archiver.py | 24 ++++++++++++++++
> =C2=A02 files changed, 57 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclas=
s
> index f38409774d..db8b60916a 100644
> --- a/meta/classes/archiver.bbclass
> +++ b/meta/classes/archiver.bbclass
> @@ -33,6 +33,12 @@
> =C2=A0#=C2=A0=C2=A0=C2=A0 ARCHIVER_MODE[mirror] =3D "combined": All sourc=
es are placed into a single
> =C2=A0#=C2=A0=C2=A0=C2=A0 directory suitable for direct use as a mirror. =
Duplicate sources are
> =C2=A0#=C2=A0=C2=A0=C2=A0 ignored.
> +#=C2=A0 - Source mirror inclusions:
> +#=C2=A0=C2=A0=C2=A0 ARCHIVER_MIRROR_INCLUDE is a list of URI prefixes to=
 always include in
> +#=C2=A0=C2=A0=C2=A0 the mirror. This may be useful if recipes that are i=
ncluded in the mirror
> +#=C2=A0=C2=A0=C2=A0 (due to their licenses) depend on some recipe that o=
therwise would not be
> +#=C2=A0=C2=A0=C2=A0 included in the mirror, and that recipe uses files t=
hat are normally only
> +#=C2=A0=C2=A0=C2=A0 available on a private server.

This wording is a rather ambiguous to me :/.

It reads like things would normally be included but this is a list of
extra special things to include.=C2=A0That isn't how it works.

The "depend on some recipe" suggests it somehow also follows
dependencies into other recipes, which as far as I know, it doesn't. I
don't see where a private server fits into things.

> =C2=A0#=C2=A0 - Source mirror exclusions:
> =C2=A0#=C2=A0=C2=A0=C2=A0 ARCHIVER_MIRROR_EXCLUDE is a list of prefixes t=
o exclude from the mirror.
> =C2=A0#=C2=A0=C2=A0=C2=A0 This may be used for sources which you are alre=
ady publishing yourself
> @@ -72,8 +78,9 @@ do_ar_original[dirs] =3D "${ARCHIVER_OUTDIR} ${ARCHIVER=
_WORKDIR}"
> =C2=A0# This is a convenience for the shell script to use it
> =C2=A0
> =C2=A0def include_package(d, pn):
> -
> -=C2=A0=C2=A0=C2=A0 included, reason =3D copyleft_should_include(d)
> +=C2=A0=C2=A0=C2=A0 included, reason =3D archiver_should_include(d)
> +=C2=A0=C2=A0=C2=A0 if not included:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 included, reason =3D copyleft=
_should_include(d)

It overrides copyleft includes? That should probably be documented.
It's relationship with exclude is also not documented. Which wins? I
suspect exclude does, but should it?

> =C2=A0=C2=A0=C2=A0=C2=A0 if not included:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bb.debug(1, 'archiver: %=
s is excluded: %s' % (pn, reason))
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return False
> @@ -94,6 +101,29 @@ def include_package(d, pn):
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 return True
> =C2=A0
> +def archiver_should_include(d):
> +=C2=A0=C2=A0=C2=A0 ar_src =3D d.getVarFlag('ARCHIVER_MODE', 'src')
> +=C2=A0=C2=A0=C2=A0 if ar_src =3D=3D "mirror":
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 src_uri =3D (d.getVar('SRC_UR=
I') or '').split()
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if len(src_uri) =3D=3D 0:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 retur=
n False, None
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mirror_inclusions =3D (d.getV=
ar('ARCHIVER_MIRROR_INCLUDE') or '').split()
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 def is_included(url):
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for p=
refix in mirror_inclusions:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 if url.startswith(prefix):
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return True
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 retur=
n False
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fetcher =3D bb.fetch2.Fetch(s=
rc_uri, d)
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for ud in fetcher.expanded_ur=
ldata():
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if is=
_included(ud.url):
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 return True, "URL matches ARCHIVER_MIRROR_INCLUDE"
> +
> +=C2=A0=C2=A0=C2=A0 return False, None
> +
> =C2=A0python () {
> =C2=A0=C2=A0=C2=A0=C2=A0 pn =3D d.getVar('PN')
> =C2=A0=C2=A0=C2=A0=C2=A0 assume_provided =3D (d.getVar("ASSUME_PROVIDED")=
 or "").split()
> @@ -154,6 +184,7 @@ python () {
> =C2=A0do_ar_prepare[vardeps] +=3D " \
> =C2=A0=C2=A0=C2=A0=C2=A0 ARCHIVER_MODE \
> =C2=A0=C2=A0=C2=A0=C2=A0 ARCHIVER_MIRROR_EXCLUDE \
> +=C2=A0=C2=A0=C2=A0 ARCHIVER_MIRROR_INCLUDE \
> =C2=A0=C2=A0=C2=A0=C2=A0 COPYLEFT_LICENSE_EXCLUDE \
> =C2=A0=C2=A0=C2=A0=C2=A0 COPYLEFT_LICENSE_INCLUDE \
> =C2=A0=C2=A0=C2=A0=C2=A0 COPYLEFT_PN_EXCLUDE \

I get the feeling this was discussed before and one of the concerns was
that the include and exclude code are in two different places, working
in two quite different ways? That isn't going to help maintainability
of this code, which already has a poor reputation amongst developers.

Cheers,

Richard

