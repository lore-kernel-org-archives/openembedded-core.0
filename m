Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BB09CCF2DB
	for <webhook@archiver.kernel.org>; Mon, 19 Oct 2026 09:05:05 +0000 (UTC)
Received: from fhigh-b4-smtp.messagingengine.com (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30269.1792400699502435394
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2026 02:04:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=Jkf8Zu7u;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=OyzV32wO;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.155, mailfrom: paul@pbarker.dev)
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfhigh.stl.internal (Postfix) with ESMTP id B75667A00FF
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 05:04:58 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Mon, 19 Oct 2026 05:04:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1792400698;
	 x=1792487098; bh=Kz+T4tm/fcGC49yhbuRn+MLCZXQTmWAVZ1odEDMe7XU=; b=
	Jkf8Zu7uJm4I9E1IaPuaCh+UYtZ+aurk3WG5VXZbil+mrokBMJg4h7fiPUlHim+5
	1xDQcyQrUo4hLQcw6eQO3A+XQBZlagHYI5yeWcJXoxyZCOT/IPG/2yXVY46s1Hp/
	d0O3WRfEqX+Rjm7qNml6FkkUhDQ5xHhgftR6vghi8jkhGeJokOLkMlOauh40Gzr/
	eRU5kJOSk6nZ32cwoTm98O0qc3oGhGr36R0SN9iEsNg4+nqjW9nKx9uaIyhRf+i3
	NVI3sJnm/QuBkyTW06kD5Q+fhi4C2VBBTIum9dLwAAwSt1y/tiXnsOEFohjFXZOF
	N/JjEUrA6uyRu+WCQ6iIhA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1792400698; x=
	1792487098; bh=Kz+T4tm/fcGC49yhbuRn+MLCZXQTmWAVZ1odEDMe7XU=; b=O
	yzV32wOufUfx8tIlS9JAh2KQibN5HTseLIqVAu0ImU0MfsEDRiwJkKDUQ48Zku3t
	vZmkg+/1/igpIS8wDh/LUlwmn5ckyCCbfZh+JX4RkVIz7iAJ53Nrn5V7u3uQLpog
	meHLl+HEETtQqgIOSnSoWnnpy2gnkHL6nRB4PEkPY9zBUqaE8x0Mp6K87ByG2Zhh
	JkwCR2Vug1pvs6SbUuXAIpmSdpwI7OhXgbK+1FtcaEPzPTVO8b2mJ1GMDrcSQFFE
	LInTZm6aYkahmhcwIGcpH6mHlPGR8v/kZ0pcb1aqZwuhhCFKso77YEIXWsd6Fgfc
	RlhO7ZjluY6JxdR5iIMUA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=sign d=pbarker.dev a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792400698; d=pbarker.dev;
	mf=PHBhdWxAcGJhcmtlci5kZXY+;
	rt=PG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+;
	s=fm1:rsa-sha256:BbwLiIsjDqlGKVOnc+8rJQljAfIMy7uqrqCYV+xqNIhFQ6M
	g9R4XL8b01wDLS0HdOcbLSPARmwM+3ymXMSZg4DWO7JNyYouKJh+qv7fGz2lJm0m
	vIstkn9r1JyLfNp57rwyuOtHKQgi9fdABG90yDYWN8ZgOPaPciw42T9hK3079DlE
	IZPMRWXK8n7JEzXXhjnmZGEfQZi2EfXr7nYmH720NHvEO81rP5YwjMp7bFMX0d22
	ZjZMze5VlEaff+pslPZrAG9XtoJyqExGwtFEwOhpWrGmZxaFYcUVMQiYixp7Bt9M
	0IKVLmzE86a6Z2vQ8jgZ7FHsrkLmWTcW1zJpROw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=mi-m=1; hc=13;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to,
	user-agent;
Message-Instance: m=1; h=sha256:HGcdMjNsisHub6xHlqwHydxQfqJVN618p7XlNzeqY+U=:Q/gyFxs7V9izzat4CdAD6uMBreMfe6IkRvK/zOAtyvE=;
X-ME-Sender: <xms:Ot3Vanab9xS270HtLXpXE1xqWmPLsKAjHkfnHx2fyiFKEcjbb3Icdg>
    <xme:Ot3Vami2chLLzsYGJWV2Q6iW66DN6eLItQ0iaHd2PsWqI7y-uI8B15YgzfH_9cthd
    _abvLAdai4-pzHB_RTRNFJGxsOnTAN4eH0P47kl6KlEUSLSC2LHbuL1>
X-ME-Received: <xmr:Ot3Vah4kbLDz877_DaTAm1aOmyO2XXVr3NoII3T6pIi11FDliuAmMt6QT9-RcmY5QgwI6JoUePZJ6T3ZEcwySHA1IixvVEevNo-T>
X-ME-Proxy-Cause: dmFkZTGFGvGwYpRvmJUOBKUfwW0JXdJVA+8ydceIdNoZCv7vVc6n0+MKpK1nw9D1+F0z5u
    R3wum5ndN8ywCaYVByhtkpWGNutBeVTUh8RLHqWl9GnliiCzoCxcpOhG23uZws5R8E91/X
    7ArTJRoVqbCVJqLgmDInTJrfrhcD+244LhNCiXVoZh67H8k38yQy01Lbz7oSckn5fFPgB7
    +OmOE6YQnd8iz2SwfIq+8E/4Sf9Qk7NcC30FKiceZzYYeionjVZlu1uaSrFdyg7OSfKsHO
    hQtc8Dx0gTC+JWhhDOAERr0pxR/hfm6zXnliVJRnYJBOLK8w6z3ik1zEYd+A0F6EVw81lN
    sI7cgGByBWmlUzR5jSXjckuEAVVko9OxefXIjHxsRnSiVkIxA/IDLziboTeR//ZEsjgTgF
    +auC7VKUNUuyLhp5xpkjjgyA+D4V9SWMs+zRPK9qaA8+kkB+U596kkAygHCcsrZ5kQznSS
    gi44jKm4am3bvM5UUyYJyX+Doa0nRaDIh0IPr/R+VSbNDAaMGjztJ/MzdK2ZtcJtuUzbtq
    6hHeV1PYREjg93CA+dqItVBJXDwu+VAsZEsBLkNi+vgawJU0P5DkXJ9ba1Jiu3TPPFXivH
    0OPl1TugZN1PVQ/H9DlpzW5ZgoJXIWJpkWHqknK0BndTD8TYHuiH94FbpjLA
X-ME-Proxy: <xmx:Ot3Val4VVflH2kCVEsKRNG_IMGf6pEZ6uogkxFODJaqO9cE90PmZaw>
    <xmx:Ot3Vatea_j5H5KnH33Zqlj_1a6cHjbCGxgxzF4gXTGlc1tZ8VQ0g5A>
    <xmx:Ot3VapAl2Zo10ZvBTOaSo64u75izhvFtzM6IMzeDjRMGPr90IXzhRg>
    <xmx:Ot3Vag-UNTQprT8Gusum1dKZgrMl9iP-IK3rhNhLnu1hFTZWaQPk-A>
    <xmx:Ot3VahMLGTrqZnCcKzzlmQCQfUUa-y1MJwrOZeUdh6M5JecQv3taICsB>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 19 Oct 2026 05:04:57 -0400 (EDT)
Message-ID: <9d881ab052f16c456def4f644c6783dcaa276512.camel@pbarker.dev>
Subject: Re: [PATCH 3/3] checklayer: Reuse signatures of an identical
 successful world dump
From: Paul Barker <paul@pbarker.dev>
To: Otavio Salvador <otavio@ossystems.com.br>, 
	openembedded-core@lists.openembedded.org
Cc: Luciano Dittgen <luciano.dittgen@ossystems.com.br>
Date: Mon, 19 Oct 2026 10:04:56 +0100
In-Reply-To: <20261017225656.680168-4-otavio@ossystems.com.br>
References: <20261017225656.680168-1-otavio@ossystems.com.br>
	 <20261017225656.680168-4-otavio@ossystems.com.br>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 09:05:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248151

On Sat, 2026-10-17 at 19:56 -0300, Otavio Salvador wrote:
> test_signatures and test_world dump the same world signatures, with and
> without -k, and so do test_machine_signatures and test_machine_world for
> each machine; when the dump succeeds, the second only repeats a world
> parse. Keep the signatures of each successful dump, keyed by the layers i=
n
> bblayers.conf, MACHINE and extra variables, and return them when the
> same dump is asked for again. A failed dump is not kept, so the world
> tests still run it and report the failure.
>=20
> Tested on meta-freescale with two machines: 5 world dumps instead of 8,
> same results; a recipe breaking world on one machine still fails
> test_machine_world for that machine only.
>=20
> Suggested-by: Luciano Dittgen <luciano.dittgen@ossystems.com.br>
> AI-Generated: Uses Claude Code (Claude Opus 5.5)
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  scripts/lib/checklayer/__init__.py | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
>=20
> diff --git a/scripts/lib/checklayer/__init__.py b/scripts/lib/checklayer/=
__init__.py
> index aa19a8e2ae..8838a7df48 100644
> --- a/scripts/lib/checklayer/__init__.py
> +++ b/scripts/lib/checklayer/__init__.py
> @@ -287,9 +287,18 @@ def check_command(error_msg, cmd, cwd=3DNone):
>          raise RuntimeError(msg)
>      return output
> =20
> +# The world signatures of each dump that succeeded: the tests ask for th=
e
> +# same dump with and without -k, which only differ when it fails
> +signatures_cache =3D {}
> +
>  def get_signatures(builddir, failsafe=3DFalse, machine=3DNone, extravars=
=3DNone):
>      import re
> =20
> +    with open(os.path.join(builddir, 'conf', 'bblayers.conf')) as f:
> +        key =3D (f.read(), machine, extravars)
> +    if key in signatures_cache:
> +        return signatures_cache[key]
> +
>      # some recipes needs to be excluded like meta-world-pkgdata
>      # because a layer can add recipes to a world build so signature
>      # will be change
> @@ -320,7 +329,7 @@ def get_signatures(builddir, failsafe=3DFalse, machin=
e=3DNone, extravars=3DNone):
>              # in a world build lack some dependencies. There is a
>              # separate test_machine_world_build which exposes the
>              # failure.
> -            pass
> +            key =3D None
>          else:
>              raise
> =20
> @@ -362,6 +371,8 @@ def get_signatures(builddir, failsafe=3DFalse, machin=
e=3DNone, extravars=3DNone):
>      if not sigs:
>          raise RuntimeError('Can\'t load signatures from %s' % sigs_file)
> =20
> +    if key:
> +        signatures_cache[key] =3D (sigs, tune2tasks)
>      return (sigs, tune2tasks)
> =20
>  def get_depgraph(targets=3D['world'], failsafe=3DFalse):

I can see this caching causing issues in the future if we change the
test cases but forget to update the way we determine `key` above.

I would prefer to modify the tests to call get_signatures() once,
possibly in a setUp() function for the CommonCheckLayer class, storing
the result so it can be used in multiple test cases. That may need a
change to get_signatures() so it always runs bitbake with `-k` and
returns the success/fail state to the caller. Then test_world() would
check the stored success/fail state and test_signatures() would ignore
it.

Best regards,

--=20
Paul Barker


