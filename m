Return-Path: <martin@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74F88CD4F5E
	for <webhook@archiver.kernel.org>; Wed, 20 May 2026 06:49:58 +0000 (UTC)
Received: from mail-244119.protonmail.ch (mail-244119.protonmail.ch [109.224.244.119])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6244.1779259789812635851
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2026 23:49:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=protonmail3 header.b=NM5MUFgT;
 spf=pass (domain: geanix.com, ip: 109.224.244.119, mailfrom: martin@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail3; t=1779259787; x=1779518987;
	bh=R+cv2NoxgQOUcPlP4fsNGJnM3WXIC+CbPmYbAJ8XTco=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=NM5MUFgT3y2F+WOyaXq3sWXtL9gzg5Ync2wRv8BrdYDCahgocK2uqWDU43ANAmo47
	 PVsKdnSB3Zr9ew2XxwmiRUysgenuTgyXc63RejvgQ+0z8/Xb8KzRtvCeyBNxXXe0An
	 vmqEAQAf5vARkU3/f1W3c66lR0gVrQVpAxH3E+almsGZrewfU1YSRtnmxT4CCqDVp2
	 PmgK6of2E7LjNlm4i+i2CdbxxcjIx+qsohsLsN3nxt2M90NQvvXFtK11eHQiq2mbku
	 0Xw6MCQWk1AUJDiGwx2THNiH+mm13Tlwh52q/KGMK73vhlqklbRnq92Rk3BpOcjxt2
	 i5dxGM2dwOU/g==
Date: Wed, 20 May 2026 06:49:44 +0000
To: saisneha196@gmail.com, openembedded-core@lists.openembedded.org
From: =?utf-8?Q?Martin_Hundeb=C3=B8ll?= <martin@geanix.com>
Cc: yoann.congal@smile.fr, corentin.guillevic@smile.fr
Subject: Re: [OE-core] [PATCH v2 1/3] base.bbclass: warn when SRCREV is missing for SCM URIs at parse time
Message-ID: <f20494c00d7948b9d1f59390afaee73449f71d83.camel@geanix.com>
In-Reply-To: <20260519100904.235971-2-saisneha196@gmail.com>
References: <20260519100904.235971-1-saisneha196@gmail.com> <20260519100904.235971-2-saisneha196@gmail.com>
Feedback-ID: 134068524:user:proton
X-Pm-Message-ID: e4d2631189b814df5f3d544b7c86f0605ac84a39
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 06:49:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237385

Hi Sai,

On Tue, 2026-05-19 at 15:39 +0530, Sai Sneha via lists.openembedded.org
wrote:

<snip>

> +def check_srcrev_set(d):
> +=C2=A0=C2=A0=C2=A0 import bb.fetch2
> +=C2=A0=C2=A0=C2=A0 src_uri =3D (d.getVar('SRC_URI', False) or '').split(=
)
> +=C2=A0=C2=A0=C2=A0 pn =3D d.getVar('PN')
> +=C2=A0=C2=A0=C2=A0 found_issue =3D False
> +=C2=A0=C2=A0=C2=A0 for uri in src_uri:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 try:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (sche=
me, _, _, _, _, params) =3D bb.fetch2.decodeurl(uri)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 except Exception:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 conti=
nue
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if scheme not in ('git', 'git=
sm', 'hg', 'svn'):
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 conti=
nue
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if params.get('rev', ''):
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 conti=
nue
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 name =3D params.get('name', '=
') or 'default'

Use
    name =3D params.get('name', 'default')

> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 candidates =3D [
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'SRCR=
EV_%s:pn-%s' % (name, pn),
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'SRCR=
EV_%s' % name,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'SRCR=
EV:pn-%s' % pn,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'SRCR=
EV',
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ]

Consider using f-strings here:

    candidates =3D [
        f'SRCREV_{name}:pn-{pn}',
        f'SRCREV_{name}'
        f'SRCREV:pn-{pn}'
        'SRCREV'
    ]

Maybe also reverse the list, so plain 'SRCREV' is tested first, as that
is the most common variable used for SCM revision.

> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 raw =3D None

Why is this variable named 'raw'? Should it be 'rev'?

> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for candidate in candidates:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 raw =
=3D d.getVar(candidate, False)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ra=
w:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 break

I would use a `for-else` block:

    for candidate in candidates:
        rev =3D d.getVar(candidate, False)
        if rev and rev =3D=3D 'INVALID':
            break
    else:
       # report and return error

    return False
       =20

> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if not raw or raw =3D=3D 'INV=
ALID':
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 found=
_issue =3D True
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if bb=
.utils.contains('ERROR_QA', 'missing-srcrev', True,
> False, d):
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 bb.error("%s: %s not set for %s" % (pn, candidates[-
> 1], uri))
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 elif =
bb.utils.contains('WARN_QA', 'missing-srcrev',
> True, False, d):
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 bb.warn("%s: %s not set for %s" % (pn, candidates[-
> 1], uri))
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 elif '${AUTOREV}' in raw:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 retur=
n True
> +=C2=A0=C2=A0=C2=A0 return not found_issue

I'm confused about the return value of this function. Add a short doc-
string explaining what is indicated by True and False.

Also, drop the use of the `found_issue` variable, and reorder the code
to return 'True' or 'False' directly from the right places.

// Martin


