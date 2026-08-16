Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0494EC5DF6D
	for <webhook@archiver.kernel.org>; Sun, 16 Aug 2026 16:15:07 +0000 (UTC)
Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12366.1786896899940942730
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Aug 2026 09:15:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=WtDWqUK/;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=Z1VUxV78;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.147, mailfrom: paul@pbarker.dev)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id CB900EC0014;
	Sun, 16 Aug 2026 12:14:58 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Sun, 16 Aug 2026 12:14:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1786896898;
	 x=1786983298; bh=cKpcX1i9HhcAdf4v4HxNRXFjbS7efLV+wX3Bd5JnJFo=; b=
	WtDWqUK/C4agLBIOwlFbnrJGPpls64zgQ0Pot5EdJBKxMwP47FTh5mUjpEBpYaG2
	7IK4FPlDRwSc3lAyZtpCcDEF2vB1n/kxxh7585JQTNwl+qGsFXU24uVYaNYv63l+
	kH1gVxaqrZJwijwS0zvgYNikp4hKCYW2z1aERyadyuTpjrfg20yPOUDi2c4nweW9
	s1wpuSvaKQi73bOZOXUg4ldT1t/oNmEUIpV8zP2q6k6b5LYo+MWpIyraZy2tKvGM
	m8TPS/9cMglAWV46R+Ua/5+bhItQBLWdmT4qhqhrp410YgJtIMf+nYsB+0B3834r
	g6nPe3tD0ePhbEi1gThgEQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1786896898; x=1786983298; bh=c
	KpcX1i9HhcAdf4v4HxNRXFjbS7efLV+wX3Bd5JnJFo=; b=Z1VUxV78QGqI2F5VH
	IsYMeuRNghMVUAP91UJWDoNyrszf9fkMFvrn6TMoWz0NKP/WRqPa6A1/JcNrDh92
	W8RwNonSZ3fLUjakn8/rLaXNLyG29K6qJdBLx97SOBonwaIlQaoicnb0Bm44qJmu
	fD81Pk2XvPr9wIWW0VgRhUgeB2tsX8bymXSDMmcy5PsQtz+gsm6G4Fjeqco2Dwwv
	4/LOYxytszplsxqOlAJr7+rhihmbM91dkpY/IpoROfBxEQX6gtkXyqElIAvN1xTb
	z502oYF123dcFo0NBboeczrUNhoH8vMNun+KoATvF1ZDm1iIspNpHN1EVkB++tll
	tEzWA==
X-ME-Sender: <xms:AuKBaqSNsaCpJrapcnHHA6LlDqOPANjp13an8vLgedi6-3Dn9KnWrg>
    <xme:AuKBalxGnpRXCFd8OhNahItYUGyux2uxUTevYg1_psAjvhA1DlqwUKTJ629G2Xx09
    _U4h2Z0fS9fwymwnjjdc7Xc9USADHZdc1VF_NT26A6-pnylYe0V08dQ>
X-ME-Received: <xmr:AuKBaleTs1OwCg3jsQOuDjRA_SFkQAQFmPwoiXxZSpATBZTfhv0XfuYNaCgXoUNXxre5AR4qe812syg9CzzvqGMhfqk1dr7rzhahR8bemoxa>
X-ME-Proxy-Cause: dmFkZTEJpFCEnd21A/wFynvobxxDR+2Ha/e1AJPJVIsfniVwUZ6GiUokJF4c8ucrubVeQA
    0ftgnRrxxmCUsyQIl0JgUaHbCjP4EkV/NNy0VrYhPd8t5NNjds9Y0/OCQIYrGqAoarqgXr
    +oQCyA+BkPef7LRhPO+ZPLBO8opARdUuiUoQ4/a1PJ0UmrCqfdcNICK7q35Tqe9gaLZy9m
    s7O8wtCLPoLV/3tPb+1ORtY71hLZtfVgt44c7qNCuXTp4h74HfygQ7rZWOngnpCkWN8srC
    IhivtYVpXtz1OggVqxdBZnvmG5new+lrYTu/EGvkXd0yP4e+xxz4Sf06/BXM6WENlbj/VD
    rKsAUPuYFDBLj9Lnb+AVzuvbjdUnwFHqYVq2xZQU3ArlCFK9pCJ+D/2EOjEqn7RL47WZ1p
    5N4WxLAcWXSVHdEKtv7knxm7gFPN26HmdYLAQ2ZGFifj0h/y/SSOO1IGHDywbpesw+JMOT
    Wdl8ASSXAf1Md9jp8GPEaw1xD9XpQ2wqFBFJHGNOgUR2KRrz495+Ed2xLwnRgauUaUFo4k
    CGKbgEt0FISCm6POpSzuY/+qtxruHjZqnOAaCLBBQwg4MbL9pkZjSfMHkcjmLe56IAzmXD
    xTLd0jteY5MNnigej9wI+nyHV4kLPHYHi2f3Sl1Y1tAPgALevFTVb0b3O7XA
X-ME-Proxy: <xmx:AuKBahIv5GdU7MoppEGHOqF8LbVYcICfxnpOxVS5EMmJB6wFuYCSVw>
    <xmx:AuKBamG00CggXYlCtu8Ckqt5zhzslhx7vWL6EGhsGpjO4E4H4aceeQ>
    <xmx:AuKBarre7-ebkrZDG0RJUigGgozv0p90HGQ9sdGI7jql-s5HYjYBWQ>
    <xmx:AuKBavSjSb6Hrhe5AePdCrH4KDs3ly7o14kvtTjS9_aIN16BR2GMSw>
    <xmx:AuKBai3BJYjb3XtIkcPVG9X8heZPcc7PiSWvO1HZuYGWwjFLJ3JTnQ0T>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Aug 2026 12:14:58 -0400 (EDT)
Message-ID: <dbfa3de3eea4d27cc3bbca18fb183f88c83145f0.camel@pbarker.dev>
Subject: Re: [OE-core][PATCH v3 9/9] cve-exclusions: set status for
 CVE-2023-6240
From: Paul Barker <paul@pbarker.dev>
To: Junjie Cao <junjie.cao@linux.dev>, 
	openembedded-core@lists.openembedded.org
Date: Sun, 16 Aug 2026 17:14:57 +0100
In-Reply-To: <20260812072842.1176341-10-junjie.cao@linux.dev>
References: <20260812072842.1176341-1-junjie.cao@linux.dev>
	 <20260812072842.1176341-10-junjie.cao@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Aug 2026 16:15:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243534

On Wed, 2026-08-12 at 02:28 -0500, Junjie Cao wrote:
> "Marvin" is Hubert Kario's Bleichenbacher-style timing oracle research:
>=20
>   https://people.redhat.com/~hkario/marvin/
>=20
> The affected code is the generic software RSA PKCS#1 v1.5 unpadding in
> crypto/rsa-pkcs1pad.c. pkcs1pad_decrypt_complete() has three
> secret-dependent early exits (leading zero byte, block type, minimum
> padding length) and a loop whose trip count depends on the position of
> the separator, so the time taken reveals padding validity. There is no
> constant-time unpadding or implicit-rejection fallback in the tree.
>=20
> Red Hat classifies it CWE-203 and has shipped fixes only in RHEL errata
> (RHSA-2024:2758, RHSA-2024:3618 and others); the bugzilla is still NEW.
> Ubuntu records it unfixed upstream as of 2024-08-24 and Debian lists
> src:linux vulnerable in all suites:
>=20
>   https://access.redhat.com/security/cve/CVE-2023-6240
>   https://ubuntu.com/security/CVE-2023-6240
>   https://security-tracker.debian.org/tracker/CVE-2023-6240
>=20
> Practical exposure is narrow: kernel PKCS#1 v1.5 use is dominated by
> signature verification rather than decryption, and an attacker needs a
> service driving KEYCTL_PKEY_DECRYPT with a long-lived key. The leaky
> primitive is nevertheless reachable.

I'd drop this paragraph. Validating its claims would be time consuming.

>=20
> CC: Paul Barker <paul@pbarker.dev>
> AI-Generated: Uses Claude (claude-opus-5)
> Signed-off-by: Junjie Cao <junjie.cao@linux.dev>
> ---
> v3:
> - drop the Marvell/s390 aside and the unrelated e8829ef1f73f paragraph
>   flagged in review as LLM confusion artifacts
>=20
> v2: https://lore.kernel.org/openembedded-core/20260803084827.1348810-1-ju=
njie.cao@linux.dev/
>=20
>  meta/recipes-kernel/linux/cve-exclusion.inc | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/meta/recipes-kernel/linux/cve-exclusion.inc b/meta/recipes-k=
ernel/linux/cve-exclusion.inc
> index 35e0a66..637f8b6 100644
> --- a/meta/recipes-kernel/linux/cve-exclusion.inc
> +++ b/meta/recipes-kernel/linux/cve-exclusion.inc
> @@ -252,3 +252,10 @@ affected fs/jfs txEnd()/lmLogClose() unmount race is=
 unchanged"
>  # https://lore.kernel.org/linux-nvme/20231016060519.231880-1-joshi.k@sam=
sung.com/
>  CVE_STATUS[CVE-2023-6238] =3D "unpatched: the proposed fix was applied t=
o \
>  nvme-6.6 and then reverted, no upstream fix has landed since"
> +
> +# "Marvin": the PKCS#1 v1.5 unpadding in crypto/rsa-pkcs1pad.c branches =
on
> +# secret-derived data, leaking padding validity by timing. Still present=
 in
> +# mainline; fixed only in RHEL errata.
> +# https://people.redhat.com/~hkario/marvin/
> +CVE_STATUS[CVE-2023-6240] =3D "unpatched: Bleichenbacher-style timing or=
acle in \
> +crypto/rsa-pkcs1pad.c is still present in mainline, fixed only downstrea=
m in RHEL"

Recommended wording, links and include triage date:

    # Triaged August 2026 - "Marvin" attack, Red Hat reports this fixed but=
 the
    # exact patch is unidentified (see RHSA-2024:2758, RHSA-2024:3618 & oth=
ers).
    # Unfixed in Debian, "Needs evaluation" in Ubuntu.
    # https://people.redhat.com/~hkario/marvin/
    # https://access.redhat.com/security/cve/cve-2023-6240
    # https://security-tracker.debian.org/tracker/CVE-2023-6240
    # https://ubuntu.com/security/CVE-2023-6240
    CVE_STATUS[CVE-2023-6240] =3D "unpatched: Fixed in RHEL but patch not i=
dentified \
    publicly"

Best regards,

--=20
Paul Barker


