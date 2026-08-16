Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E03F5C5B572
	for <webhook@archiver.kernel.org>; Sun, 16 Aug 2026 15:53:36 +0000 (UTC)
Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12213.1786895609993780274
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Aug 2026 08:53:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=WR+OxrOv;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=XQe425at;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.157, mailfrom: paul@pbarker.dev)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 5DE13140002D;
	Sun, 16 Aug 2026 11:53:29 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Sun, 16 Aug 2026 11:53:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1786895609;
	 x=1786982009; bh=kMpLCRK3exlta59f7qL2wTy6xJNLf+1GBZbUulsufN8=; b=
	WR+OxrOvu1N/rxqOV3ZEBjo15p5KmM2EEj54nW98e6k72KMm7ZMiEEOw8Adfhmrh
	nyXTKCBZKmiZjCQxn9i8PX/oNGpZ7rIWPm63Bb/e+tH3b8d67kV8W2SwQEhmpYqi
	xvdLbwOB6/SdPUXyC6+UGg+52lEn0JII/Si6L4UPqtCtzPPX5lh6t56Iy4mlKL6p
	B7uR1AyAIRKQFnOSnpeShYe8FyabXaNmyt0lFSLCph8twMe6YbwsNm6Q4umgUWAG
	c2vdLcN1wkhDZavllMsiM0PeIhRK8Ug1W8qrfgy6PSO3JzF/ryrHMrjdnGq+la/9
	PDNXbKiKW7MzQmMHVlCuQg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1786895609; x=1786982009; bh=k
	MpLCRK3exlta59f7qL2wTy6xJNLf+1GBZbUulsufN8=; b=XQe425atp+thzq73q
	XVwFEEsMRT8c6t4hbryVY/eZCACTYI4yjBFicYOAJPWgNs6mpgrOB9QyE6ki7U9n
	fcqhuA94p6nhM/SLdnRMqH+zz8+rILEB4BSxUtbWcpnRJBf0hAeml/FRkbndpJqj
	yH350Ff8rb2R4I1hCzrZAxmOV7furFuHM1mU/fnuZ+UgC4w3prIGPri4HmhKrfL/
	DOYmCSVHgjerELgIw/6y9OBQvXLuWHD+1yxFp3IKWkjHPm6Dbxb5tkmp/F06m7Rj
	ANUZFL0mFtrXztSqEHNf81klRebxOotDLJVw0By3/N/b/qXPIcScEQYkUbv4KJKF
	s/9MQ==
X-ME-Sender: <xms:-dyBateEWko39Bo8-zDNMAMipdG7HDJF2zdQyqQWaFUw3MyqeyiDlg>
    <xme:-dyBahNZq7xrlwFosw6tCa0N3sLJrmmYkYV63PmojpMlQaENLXc-edKw0NkUQb6vD
    Cz5_dqTegCggUUlQQPIAtzbaZFlDIUBTe12yjFVTQ90bfVvu4JWxC0>
X-ME-Received: <xmr:-dyBakL1yBKK6tG25GeewHwfqASvq7jZnLh-82qnPOl0emCdViKe10mZ3ICK5X6c6u2kdrt7xTxYP6w0o4fVq_EYXP0NewQU7qTwZltQhx8u>
X-ME-Proxy-Cause: dmFkZTGyPctKd7A0fMAKNWJuLRdXkMAtdpQH9SR6RgG+kNNducsvnyEbhYFLdXpyE/tXkG
    MthtjOZoAkNq1etryEuQsJ89tC/bRr6Drf4xwb9Th6ZUU08FbXK03n5IveD1SUPgooiLxb
    KKBulhq4sySbxGTSzxRdSTAZGOUimoOzHhb9WGGS8rD+tQoSZXH3qvrSFn8oPiIc5D+CEC
    zwOFzxXTVEDTyRAFNeXxEtPGl6hJlUoeNDx5N+vFOyq9RNhTJI7cr6xsdnZHvGsBpsFbFD
    wogINs5MdkEa8nuWqkzFjrsZYY50+qRIUiPh2Ddx8nsr5QrDmIJF/wyQmTTyO0S62OpSbE
    k9Ur4TLgR4icOm9vQiTCN1u3y+bmpxo2WrzrhdBiaBr6D/uL2kozN0b4SGMU9EbCaQki9Y
    tGbe7cgZ0DlTitgPf6jfwXDkeSYDe/6MMzEogd3xcTJmEJMyQQsUMY7HEX5wWZ8vaTXeYt
    Scz9JFS+J6Cb+v47c+XjsDzOYsETKlYe/OU0NgFIwyeIb8d/ZwRAcxLDkTNbXUsE3LcdiW
    cbjTfXvKk4eAmcWM5x9Gp7RvwYCZ5c6v0vvXIstoJAtUDysZfIXMMRPVowuPVt4bnG2XNJ
    oGT3FU/NeXtppeu/WwI182uoBLXJlhTj5u31uNHDa6T1mCSeWu8aE7cvMRwA
X-ME-Proxy: <xmx:-dyBaiECnAgYmnn63ANHjvBSdViwUxX3-viykcteiUqSqQHsMwUZ0A>
    <xmx:-dyBasQLiVJZKeTYk4C-ESvV_BiRVylHOSYIDxm5ej8UiRb1JLzz9A>
    <xmx:-dyBauEFNLMQyAx3dt04sWPam191EJfurGUG8wEXqSyj890unfx5kg>
    <xmx:-dyBao9Zb29hkOmtfdoUejj7GP6ZPfHZEKX5-y1YKIER5ucR2z_E6Q>
    <xmx:-dyBahCGhPm6-51uskHwpQLY8m22ZuremH-uxoLB81caLJLqUSKhTfz7>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Aug 2026 11:53:28 -0400 (EDT)
Message-ID: <79c7d5ad090b78b3d867ac3637cd6da41b518c2c.camel@pbarker.dev>
Subject: Re: [OE-core][PATCH v3 2/9] cve-exclusions: set status for
 CVE-2021-3714
From: Paul Barker <paul@pbarker.dev>
To: Junjie Cao <junjie.cao@linux.dev>, 
	openembedded-core@lists.openembedded.org
Date: Sun, 16 Aug 2026 16:53:27 +0100
In-Reply-To: <20260812072842.1176341-3-junjie.cao@linux.dev>
References: <20260812072842.1176341-1-junjie.cao@linux.dev>
	 <20260812072842.1176341-3-junjie.cao@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Aug 2026 15:53:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243529

On Wed, 2026-08-12 at 02:28 -0500, Junjie Cao wrote:
> KSM merges identical anonymous pages across processes. An attacker who
> can place chosen page-sized content in a victim's memory can detect the
> merge through the timing of the resulting copy-on-write fault, and so
> leak memory contents.
>=20
> There is no upstream fix; removing the side channel means removing
> deduplication. Distribution trackers describe it the same way - Debian
> marks src:linux unfixed with "Inherent design limitation, can be avoided
> by not using KSM", Red Hat closed its bug WONTFIX, and Ubuntu records no
> upstream fix as of 2024-06-17:
>=20
>   https://security-tracker.debian.org/tracker/CVE-2021-3714
>   https://bugzilla.redhat.com/show_bug.cgi?id=3D1931327
>   https://ubuntu.com/security/CVE-2021-3714
>=20
> Exposure requires two runtime opt-ins: ksmd must be started by the
> administrator (ksm_run defaults to KSM_RUN_STOP in mm/ksm.c) and memory
> is only eligible when a process asks with madvise(MADV_MERGEABLE) or
> prctl(PR_SET_MEMORY_MERGE). CONFIG_KSM=3Dy is set in yocto-kernel-cache
> (bsp/intel-x86 and the paravirt_kvm fragments), so this is not a
> configuration exclusion.

We should drop this third paragraph - it's time consuming to validate.

>=20
> CC: Paul Barker <paul@pbarker.dev>
> AI-Generated: Uses Claude (claude-opus-5)
> Signed-off-by: Junjie Cao <junjie.cao@linux.dev>
> ---
> v3:
> - use "unpatched" instead of "upstream-wontfix": the WONTFIX is a
>   distribution position, not an upstream one
>=20
> v2: https://lore.kernel.org/openembedded-core/20260803084827.1348810-1-ju=
njie.cao@linux.dev/
>=20
>  meta/recipes-kernel/linux/cve-exclusion.inc | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/meta/recipes-kernel/linux/cve-exclusion.inc b/meta/recipes-k=
ernel/linux/cve-exclusion.inc
> index 5ed4a00..af3576d 100644
> --- a/meta/recipes-kernel/linux/cve-exclusion.inc
> +++ b/meta/recipes-kernel/linux/cve-exclusion.inc
> @@ -199,3 +199,10 @@ CVE_STATUS[CVE-2025-71145] =3D "cpe-stable-backport:=
 Fixed from v6.18.3"
>  # https://ubuntu.com/security/CVE-2019-14899
>  CVE_STATUS[CVE-2019-14899] =3D "unpatched: consequence of the default we=
ak \
>  host model, no upstream kernel fix, mitigated by firewall configuration"
> +
> +# Timing side channel inherent to KSM page deduplication. Reachable only
> +# when ksmd is started (/sys/kernel/mm/ksm/run defaults to 0) and the
> +# workload opts in via MADV_MERGEABLE or prctl(PR_SET_MEMORY_MERGE).
> +# https://security-tracker.debian.org/tracker/CVE-2021-3714
> +CVE_STATUS[CVE-2021-3714] =3D "unpatched: timing side channel inherent t=
o \
> +KSM page deduplication, only reachable when KSM is enabled and opted int=
o"

I recommend we change the wording, add more links and include the triage
date:

    # Triaged August 2026 - no upstream fix, Debian says "Inherent design
    # limitation, can be avoided by not using KSM", Red Hat closed their bu=
g as
    # WONTFIX.
    # https://security-tracker.debian.org/tracker/CVE-2021-3714
    # https://bugzilla.redhat.com/show_bug.cgi?id=3D1931327
    # https://ubuntu.com/security/CVE-2021-3714
    CVE_STATUS[CVE-2021-3714] =3D "unpatched: Timing side channel inherent =
to Kernel \
    Same-page Merging (KSM) page deduplication"

Best regards,

--=20
Paul Barker


