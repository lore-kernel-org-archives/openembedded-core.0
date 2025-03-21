Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECF53C35FF3
	for <webhook@archiver.kernel.org>; Fri, 21 Mar 2025 08:45:18 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web10.16535.1742546711375161349
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Mar 2025 01:45:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kSUdV6W3;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6e8f254b875so15328396d6.1
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Mar 2025 01:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742546710; x=1743151510; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZOD3/rAt9rITdcNSS2Nljl3OFKa6o+n+UNSYoiwGlbQ=;
        b=kSUdV6W3Mf6K+ZFpDzoyTrHyJdram8eP46veenSXP3E8EAbqGd8Bs/bXw/jMA/1cBm
         9D5wh9wp9h0QScqUeAXou/fLSuzc26y0JduqDgVAaJnEhlwDNnpeo2BYs3xU9ZFQLsKh
         OdFi8mVsWNp8NL/8f0Pr2lAXhu5MSCr7bHJGdGUIvHOVG85ou1vYcyU+/F5EHpu618gz
         mkWvwmtRKUC7yH0eTxixVFHxJE3kNCUabEZbyrErxWOQQtqM6NXe80Zb5g5yEflEMZGZ
         cF321aWePPLdIvYI9NjQzvmNInXuALUj4d7cxUEf0Ir5d26/Y1VKlMHsd7iqDyLVcmrw
         /5sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742546710; x=1743151510;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZOD3/rAt9rITdcNSS2Nljl3OFKa6o+n+UNSYoiwGlbQ=;
        b=Tq++ormAMptQEB+CIEzEdvbit8fdmPt/b+TtZ8tjXr1vkhPlYdkOgUFVru726y8tNz
         2FOYMOhtBGtvrY8gOdrVzt+7oKJV5iVfv49iSzHsbX6gcYrPmDwaliFlSB6sWyz/0K6I
         joaJ1dvq2Oq1mNu19uY3VLTjlUa9iVPiGhuZZl/xYF640vWc9QKqpg8t3NbqNSLfv8bw
         ay/hxy5wKBCHo3ENBf7ug1rYKymV3/q5teMBq+TLnIwyxtWD8yZG5WR91nBe61UquiJJ
         izyM+wZ1t/mU7lbahVyCM2dRv5Bt/lKb25UL2Hy7otEb8YrrTHkGa8eZMZ58WPPvuKF9
         LDng==
X-Gm-Message-State: AOJu0YxXWrPS6OeoRhT6CWmyenY7r8pL5PprP8FO/TNgTziIfBajoAlm
	CNlXmaNSFqcSgqai0TFSAhpHHIXnk3t3mBIgAaaMGkGNprdZ05YSxlVQeWUrzTtqV3c76ZrpB33
	ijXnk4sRVQM1spsPcQnEZL4f76OA=
X-Gm-Gg: ASbGncuCasFgsWuGEdgo80unKtx+u8sAT0cOr+iEhOPiw9kusNS1+LcU5kh0dK854le
	dBAdvTt5+cyiTwI7/UbEcr+Xav4VAow9RC0Ojqtnlel+X9h547KSnxg9fysU5OkclA+3vm7IDph
	RYjaFpwxxToDtr8peL9849TTQVXCwBiZW4HyLO9SvPAOzJD+YkdjvqC1qUnQ76
X-Google-Smtp-Source: AGHT+IEOhurS6h3xIT1liptPR/+HfzdxsGgePCbcHunBL34XBd7rSxwYk70CLIfz9mWEXdRlidxgH7qJuPcHix9TXA8=
X-Received: by 2002:a05:6214:27e5:b0:6e6:5f08:e77d with SMTP id
 6a1803df08f44-6eb3f297378mr40071296d6.19.1742546710212; Fri, 21 Mar 2025
 01:45:10 -0700 (PDT)
MIME-Version: 1.0
References: <c6dc4b6aead7933112e653982dccbb8f5db55928.1742467277.git.matthias.schiffer@ew.tq-group.com>
 <48cc62ab319e2fa89a9fcfdeeb84346872f99987.1742467277.git.matthias.schiffer@ew.tq-group.com>
In-Reply-To: <48cc62ab319e2fa89a9fcfdeeb84346872f99987.1742467277.git.matthias.schiffer@ew.tq-group.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 21 Mar 2025 09:44:58 +0100
X-Gm-Features: AQ5f1JreU4Ryb_KLbMfr9CuYUjSeDsk-eg2siU8iN2grUi29lny4din8fURVSIY
Message-ID: <CANNYZj-zOSLCn1nMwUD7oaMyekGKQ16cdEMCL8bv4mxLAXGpgg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 2/2] Revert "git: git-replacement-native:
 depend on ca-certificate"
To: matthias.schiffer@ew.tq-group.com
Cc: openembedded-core@lists.openembedded.org, 
	Max Krummenacher <max.krummenacher@toradex.com>, oss@ew.tq-group.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Mar 2025 08:45:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213439

Thanks, I think this set is now okay.

Alex

On Thu, 20 Mar 2025 at 12:03, Matthias Schiffer via
lists.openembedded.org
<matthias.schiffer=3Dew.tq-group.com@lists.openembedded.org> wrote:
>
> This reverts commit 2e99ffda70fd95b5eab3de47048032349cd66f4b.
>
> git-replacement-native is used only to provide a newer version than may
> be installed on the system; apart from that, it should work more or less
> the same.
>
> In particular, it is using the host system's /etc/gitconfig; it should
> also use the system CA certificates, otherwise it will break HTTPS
> connections in environments that need local certificates, for example
> for a corporate HTTP proxy. The override had been added to deal with
> curl-native relying on the existence of its workdir to access CA
> certificates, which has been fixed in the curl recipe now.
>
> Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
> ---
>
> v2: extended commit message to explain why the patch is not necessary
>     anymore
>
>  meta/recipes-devtools/git/git_2.49.0.bb | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/meta/recipes-devtools/git/git_2.49.0.bb b/meta/recipes-devto=
ols/git/git_2.49.0.bb
> index 66082d0bde..2ca8711f75 100644
> --- a/meta/recipes-devtools/git/git_2.49.0.bb
> +++ b/meta/recipes-devtools/git/git_2.49.0.bb
> @@ -4,7 +4,6 @@ DESCRIPTION =3D "Git is a free and open source distribute=
d version control system
>  SECTION =3D "console/utils"
>  LICENSE =3D "GPL-2.0-only & GPL-2.0-or-later & BSD-3-Clause & MIT & BSL-=
1.0 & LGPL-2.1-or-later"
>  DEPENDS =3D "openssl zlib"
> -DEPENDS:class-native +=3D "ca-certificates"
>
>  PROVIDES:append:class-native =3D " git-replacement-native"
>
> @@ -97,7 +96,6 @@ perl_native_fixup () {
>
>  REL_GIT_EXEC_PATH =3D "${@os.path.relpath(libexecdir, bindir)}/git-core"
>  REL_GIT_TEMPLATE_DIR =3D "${@os.path.relpath(datadir, bindir)}/git-core/=
templates"
> -REL_GIT_SSL_CAINFO =3D "${@os.path.relpath(sysconfdir, bindir)}/ssl/cert=
s/ca-certificates.crt"
>
>  do_install:append:class-target () {
>         perl_native_fixup
> @@ -106,7 +104,6 @@ do_install:append:class-target () {
>  do_install:append:class-native() {
>         create_wrapper ${D}${bindir}/git \
>                 GIT_EXEC_PATH=3D'`dirname $''realpath`'/${REL_GIT_EXEC_PA=
TH} \
> -               GIT_SSL_CAINFO=3D'`dirname $''realpath`'/${REL_GIT_SSL_CA=
INFO} \
>                 GIT_TEMPLATE_DIR=3D'`dirname $''realpath`'/${REL_GIT_TEMP=
LATE_DIR}
>  }
>
> --
> TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Ge=
rmany
> Amtsgericht M=C3=BCnchen, HRB 105018
> Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan S=
chneider
> https://www.tq-group.com/
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#213382): https://lists.openembedded.org/g/openembedde=
d-core/message/213382
> Mute This Topic: https://lists.openembedded.org/mt/111806223/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

