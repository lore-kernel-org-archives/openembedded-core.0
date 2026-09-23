Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AE4BC98302
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 14:08:10 +0000 (UTC)
Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7835.1790172485747129983
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2026 07:08:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=S8XfLVCP;
 spf=pass (domain: linuxfoundation.org, ip: 74.125.228.76, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a60590a85cso2029540a12.0
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 07:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1790172484; x=1790777284; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=zhWNpRMPqV6Vyb3yn1+UTxmVpfcQ5/rzi+Sl4BJpwlg=;
        b=S8XfLVCP6Mxf++Rn5rjjqjsvPjMTR0Y0dieMENWscDBJo2itePWAtcTAYZpvfnpHh9
         QRTrEQAWzGVd0r6qUlKMcx4eEOYIyN6I1Mu9lW97BeZSszHzleVWr9Hk7CQShrMG+m7f
         Zn8nY6EaGJCGjtSwXK5W3YTlmZXYErbQTZYhY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790172484; x=1790777284;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zhWNpRMPqV6Vyb3yn1+UTxmVpfcQ5/rzi+Sl4BJpwlg=;
        b=aTvGPF7jNazD405qSWRU8zRIqayTPr9tokhay10XGn/gtJW/XzTJSkHHAuIKyQs0x7
         poJ+RXXg2reqTCrgoFqGkZF//s88WTVtNyov8X291jNo3zA3/5yc4Qph5diPN3NlgTtZ
         WUzAYK0UDrwBC1Yyt4mahjXwj9xv6YipSYYfiDtYetFAPGfR2Bh1yl3WnReaMUQmUuWz
         2rmqWevw3APaZp+mriATXSv+VNBaZR2lu0nOchYq3v5pbILPODfqaNidm3NC0OTdxraB
         Ew8sn8cCxkX0J/eESFv+zCJlVOw2x3bS9d87QZQUGPlR43VM8wBQt4THOGipPLSk8y+Y
         Ho4Q==
X-Forwarded-Encrypted: i=1; AKwUvBzUhZUP1j8d3wuigpbxmzulROeUt2P27nDobyMLmgOt5yCgf0kEFt3pks/2ez32TsVBPooSelsLbdWvQOUiVKyqqA==@lists.openembedded.org
X-Gm-Message-State: AFuF++lU3zCYrREkWUeffDUA9OCZil9lJpg486VN1WFMOOv6rQI9tSCD
	d5x0sxxjoXZ/mqRjSQPqrq9v2UBz/ejSPCieW7SrRvQTJIepfJZjcVwXGosbagLo020=
X-Gm-Gg: AYBFou05i9QwDrSaaX0EncxcIf3RpR+Hbuls94uFQ7t/34jkJVM0iVF+RTtE4jTf5ma
	iSHXXvEYdDY+nKAPKKZm1qNZR+XUb8ZKwhaqMO9f/RMx+c7f5aJLPUfMCbsgGNRHSoB7c2B6Wsq
	stnWHSNZNRic+W2iHHW5J4xqrL2j98uuTnFxYMWp4a39OLYpk4xM5fgtYyirUMqbrHpc4ge2aew
	OoqsqPj8ymIA/ERtYHL9AFkMtFPMjeLlSWsOFoQmsSe25YsVx99s7v3zv8hWkoiEPfcpOGNaGTN
	cyrjikdiRrTYhA0Z3jBb1S6N8ve3QdLEjtXYixB+KScTzd8aklCwkF6TwxNDicNKRg3zDt5JMbB
	FPm2aaG6lXmAWALpi4y+dUvdraxBFC9+FJ734gQ15LWf0CVRV0n3JTXpU8LkBKQQmO8+LCHBbwY
	MACOjcTJwOCJKiWQTud31yezEQrDnlgdkvN9kpSfOisPikmsE5JhBZ3f4fVJKLEqaeXMUICMl+H
	4gVHIl6L/bw3MBdEkqTVn8xalKnUxTYeQ9hga6MQ3bT9DCYlPbt7KOnkSvxc55w5V52mMyvjA==
X-Received: by 2002:a05:6402:23c7:b0:6a9:f874:6df9 with SMTP id 4fb4d7f45d1cf-6aab3b06033mr2375731a12.7.1790172483840;
        Wed, 23 Sep 2026 07:08:03 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:36fd:f492:2703:247a? ([2001:8b0:aba:5f3c:36fd:f492:2703:247a])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aab388244csm1744514a12.11.2026.09.23.07.08.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 07:08:03 -0700 (PDT)
Message-ID: <8e963943c0883e50063000148a5303edb57582f1.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] externalsrc: fix PKGV for devtool build
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: paddy.chiu@oss.qualcomm.com, openembedded-core@lists.openembedded.org
Cc: jose.quaresma@oss.qualcomm.com
Date: Wed, 23 Sep 2026 15:08:02 +0100
In-Reply-To: <20260922092015.2428562-1-paddy.chiu@oss.qualcomm.com>
References: <20260922092015.2428562-1-paddy.chiu@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 14:08:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246522

On Tue, 2026-09-22 at 02:20 -0700, Paddy Chiu via lists.openembedded.org wr=
ote:
> Without this fix, PKGV will be the same as PV when using devtool build.
> Since SRC_URI is set to local_srcuri in externalsrc.bbclass and consequen=
tly cause missing git commit hash in PKGV.
> This fix can prevent buildhistory package-version QA failures in devtool =
build.
> ---
> =C2=A0meta/classes-global/package.bbclass | 12 ++++++++++--
> =C2=A0meta/classes/externalsrc.bbclass=C2=A0=C2=A0=C2=A0 |=C2=A0 4 ++++
> =C2=A02 files changed, 14 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/classes-global/package.bbclass b/meta/classes-global/pa=
ckage.bbclass
> index 67148fc1ac..c5f8b2136f 100644
> --- a/meta/classes-global/package.bbclass
> +++ b/meta/classes-global/package.bbclass
> @@ -242,6 +242,14 @@ python () {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d.appendVarFlag('do_pack=
age', 'deptask', " do_packagedata")
> =C2=A0}
> =C2=A0
> +def package_get_srcdata(d):
> +=C2=A0=C2=A0=C2=A0 srcuri =3D d.getVar("EXTERNALSRC_ORIG_SRC_URI")
> +=C2=A0=C2=A0=C2=A0 if not srcuri:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return d
> +
> +=C2=A0=C2=A0=C2=A0 srcdata =3D d.createCopy()
> +=C2=A0=C2=A0=C2=A0 srcdata.setVar("SRC_URI", srcuri)
> +=C2=A0=C2=A0=C2=A0 return srcdata
> =C2=A0
> =C2=A0PRSERV_ACTIVE =3D "${@bool(d.getVar("PRSERV_HOST"))}"
> =C2=A0PRSERV_ACTIVE[vardepvalue] =3D "${PRSERV_ACTIVE}"
> @@ -299,7 +307,7 @@ python package_get_auto_pr() {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 pr =3D d.getVar('PR')
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 # Strip PR to make AUTOINC can increase when SRCRE=
V is changed
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 base_ver =3D "AUTOINC-%s" % version[:-len(pr)]
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 srcpv =3D bb.fetch2.get_srcrev(d)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 srcpv =3D bb.fetch2.get_srcrev(package_get_srcdata(d))
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 value =3D conn.getPR(base_ver, pkgarch, srcpv)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 d.setVar("PRSERV_PV_AUTOINC", str(value))
> =C2=A0
> @@ -319,7 +327,7 @@ python package_get_auto_pr() {
> =C2=A0python package_setup_pkgv() {
> =C2=A0=C2=A0=C2=A0=C2=A0 pkgv =3D d.getVar("PKGV")
> =C2=A0=C2=A0=C2=A0=C2=A0 # Expand SRCPV into PKGV if not present
> -=C2=A0=C2=A0=C2=A0 srcpv =3D bb.fetch.get_pkgv_string(d)
> +=C2=A0=C2=A0=C2=A0 srcpv =3D bb.fetch.get_pkgv_string(package_get_srcdat=
a(d))
> =C2=A0=C2=A0=C2=A0=C2=A0 if srcpv and "+" in pkgv:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d.appendVar("PKGV", srcp=
v)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pkgv =3D d.getVar("PKGV"=
)
> diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.=
bbclass
> index 902ff2604f..a1bb92a418 100644
> --- a/meta/classes/externalsrc.bbclass
> +++ b/meta/classes/externalsrc.bbclass
> @@ -78,6 +78,10 @@ python () {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
d.setVar('B', '${WORKDIR}/${BPN}-${PV}')
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bb.fetch.get_hashvalue(d=
)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Keep the original URI avail=
able for packaging. SCM URLs are removed
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # below so externalsrc does n=
ot fetch or unpack the external source,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # but package_setup_pkgv() st=
ill needs them to derive PKGV.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d.setVar('EXTERNALSRC_ORIG_SR=
C_URI', d.getVar('SRC_URI'))
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 local_srcuri =3D []
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fetch =3D bb.fetch2.Fetc=
h((d.getVar('SRC_URI') or '').split(), d)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for url in fetch.urls:


We really need to find a different way to fix this. I don't doubt there
is an issue here but change the datastore and it's variables around mid
function like that is really a hacky workaround, not a proper fix.

If we did this each time we found a bug, the code would become
unmaintainable.

Cheers,

Richard

