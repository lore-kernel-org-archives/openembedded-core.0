Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8057FE65294
	for <webhook@archiver.kernel.org>; Sun,  1 Feb 2026 15:12:41 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31201.1769958754912441757
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Feb 2026 07:12:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=C0CR6lk2;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-47ee2715254so19171655e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Feb 2026 07:12:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1769958753; x=1770563553; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2uVJxJxuPLa4sqikBwMQJ62B/y1c+L7TJOTwtTril+s=;
        b=C0CR6lk2nd7nmxHWQxm3JL/4Gq8n+Sf7SgjRgmfDyQYZHl1haNNuilwzSF4ieUZ5E5
         c7kBG3qCECEKnvtDWp12wd8pxzpQLtA6LQtTt2ztSE+il3SzZZGgE8xz/soydEev6g8P
         F0sBbjmZD6fW6z8pciuUagzdCNdfOkdsOaWsY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769958753; x=1770563553;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2uVJxJxuPLa4sqikBwMQJ62B/y1c+L7TJOTwtTril+s=;
        b=ec/j5bPKTfAPX7T7x3pBITlKVY5VYpDkwkv5M7RT+81ZwSvfz2wsCOftNyVPKVW7x7
         UpdYtUVbYsec8yxkwOEcCyRDVDSBTwMi7BLgCTyGM2hElH9QmGTK2XyhEFsNZ9HI2PiF
         t8YjtXg4fFm6OKO6PrJItyappNL0nt6bl0oi9Xr4f17kbNLiijtsUrVo2+dZw8Ymp1PR
         hkpu+BxEzmXoywrd5ot+GH36lQa1Ml7p7oIPyuxBJbTcz3D6dTfhjl03DuloRgJYNG1X
         TCwLFpyZyp69PtbxIMexYQPfPc1pGASo6ytmw6mDXw82s9DoxftfTCpCzCpZvNuvrwbv
         HM/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWd0cejR5V1OMtwiT41gz7AU2buAtRFuU4rXPGr42jCsZcSp+wTMquhkZmiHVjDA38Y8kaWxzsmIOMIICgiTu6IYA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwFidboc7V8zL+p5JX/SwbrV8QRwJMtNIiCS++jerexeqsIbmf4
	JkbREz9q0iT69GfdWCkmwowaD7Ja1dMSveUaJvnxruhhv5X2TmbaiE1m0VJ0QKAqrSU=
X-Gm-Gg: AZuq6aJX0AHFrMERE2Pm0GGqCvsbaY8nkbYLIdRORkQdiitwlkMl0PqixccrHeWl1Cf
	MQF9gJTsbFLfbTjr2s8qlQJO+JfWrbEPXBFAbBGCKHlMa09u1p0pGACUJljhljrPejhdVU+Ws8s
	ryMZSCcqwLLpXdtVJvDwzHXARvlQGAiluOr865fBPDhAn2Sme9+Ua8K+DKdjWxJUtjbd7Fyvcgl
	epYIrKgTQlz3mvoIuvBxbR3Py17rn9H6IAUpEbG8JMiBBxGRw6ylMNBOgnxo3bfFAITnmX+Zlb2
	IxCDaNo73hjqGnWG+1eO9lAo5BB3SclWDUGRQyHQO1WVfRwhw6kSyTlAI8jjfhttn1qCf38rqls
	19YUJ5g5OUabW73NTA/++s1uIAiu8OcqRkYJRIbYZuOOP7AIGEA7QP5jeAj39T2zQIP9a4h1hB9
	wBgZtgGdUMD/+sAfDHNR/DAxvMlStkaK6d+hSUU1XdU32OuP9eGseUdkKhfHp8gSGef48ddAv1T
	zk=
X-Received: by 2002:a05:600c:4ed3:b0:477:a246:8398 with SMTP id 5b1f17b1804b1-482db45929emr126125435e9.2.1769958753226;
        Sun, 01 Feb 2026 07:12:33 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:d5b0:6cca:83b2:cbd0? ([2001:8b0:aba:5f3c:d5b0:6cca:83b2:cbd0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066c40e04sm404295205e9.13.2026.02.01.07.12.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Feb 2026 07:12:31 -0800 (PST)
Message-ID: <49de779cc2db0ef5c2bade9c8b07e076dedc340f.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v6 2/4] cvelistv5: add a new recipe
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: valentin.boudevin@gmail.com, openembedded-core@lists.openembedded.org
Cc: daniel.turull@ericsson.com, jerome.oufella@savoirfairelinux.com
Date: Sun, 01 Feb 2026 15:12:30 +0000
In-Reply-To: <20260129211012.623827-3-valentin.boudevin@gmail.com>
References: <188AFCD98EA3E578.3200434@lists.openembedded.org>
	 <20260129211012.623827-1-valentin.boudevin@gmail.com>
	 <20260129211012.623827-3-valentin.boudevin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1ubuntu0.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Feb 2026 15:12:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230336

On Thu, 2026-01-29 at 16:10 -0500, vboudevin via lists.openembedded.org wro=
te:
> This recipe is in charge of cloning and setting the cvelistv5
> repository: https://github.com/CVEProject/cvelistV5
>=20
> The variable CVELISTV5_USE_AUTOREV can be used to use AUTOREV to use the
> latest available commit on the remote repository and stay
> up-to-date with the latest CVE information available.
>=20
> AUTOREV would make the build non-deterministic, turned off by default.
>=20
> Signed-off-by: ValentinBoudevin <valentin.boudevin@gmail.com>
> ---
> =C2=A0.../cvelistv5-native/cvelistv5-native_git.bb=C2=A0 | 24 +++++++++++=
++++++++
> =C2=A01 file changed, 24 insertions(+)
> =C2=A0create mode 100644 meta/recipes-kernel/cvelistv5-native/cvelistv5-n=
ative_git.bb
>=20
> diff --git a/meta/recipes-kernel/cvelistv5-native/cvelistv5-native_git.bb=
 b/meta/recipes-kernel/cvelistv5-native/cvelistv5-native_git.bb
> new file mode 100644
> index 0000000000..f25dda9f3d
> --- /dev/null
> +++ b/meta/recipes-kernel/cvelistv5-native/cvelistv5-native_git.bb
> @@ -0,0 +1,24 @@
> +SUMMARY =3D "CVE List V5"
> +DESCRIPTION =3D "Official CVE List. It is a catalog of all CVE Records i=
dentified by, or reported to, the CVE Program. \
> +The cvelistV5 repository hosts downloadable files of CVE Records in the =
CVE Record Format."
> +HOMEPAGE =3D "https://github.com/CVEProject/cvelistV5"
> +LICENSE =3D "cve-tou"
> +LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/cve-tou;md5=3D4f7e96b=
3094e80e66b53359a8342c7f8"
> +
> +inherit native allarch
> +
> +SRC_URI =3D "git://github.com/CVEProject/cvelistV5.git;branch=3Dmain;pro=
tocol=3Dhttps"
> +CVELISTV5_USE_AUTOREV ?=3D "0"
> +CVELISTV5_DEFAULT_SRCREV ?=3D "644ce1758db1773336ebebb6a0da90e132da0eb7"
> +
> +python __anonymous () {
> +=C2=A0=C2=A0=C2=A0 if d.getVar("CVELISTV5_USE_AUTOREV") =3D=3D "1":
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d.setVar("SRCREV", d.getVar("=
AUTOREV"))
> +=C2=A0=C2=A0=C2=A0 else:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d.setVar("SRCREV", d.getVar("=
CVELISTV5_DEFAULT_SRCREV"))
> +}
> +
> +do_install(){
> +	install -d ${D}${datadir}/cvelistv5-native
> +	cp -r ${UNPACKDIR}/cvelistv5-git/* ${D}${datadir}/cvelistv5-native/
> +}

Why add a CVELISTV5_DEFAULT_SRCREV variable when this is a standard usage o=
f autorev?

SRCREV =3D "644ce1758db1773336ebebb6a0da90e132da0eb7"

and then users can set:

SRCREV:pn-cvelistv5-native =3D "${AUTROREV}"

if they want it, just the same as any other recipe?

Cheers,

Richard


