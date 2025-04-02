Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80D92C3601E
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 19:33:55 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.3968.1743622432267376715
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Apr 2025 12:33:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cp4gw9Mv;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43d04dc73b7so915715e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 12:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1743622431; x=1744227231; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g3lsKW0kM5sHJ4u5JSNnqHvD1MiCmkWeOHHZYKmLwao=;
        b=cp4gw9Mv4T1oI2086E5Kfd7mmCBUl39VZXtLwY4OvY2WbKQ+nMt2WPeKVk1hFyO7AV
         2Tv9aUf6lzAzdEyRZSJrprPia/DqZ7gFQ5yMavNdLe/t+LhBydchZsCqgdc92rT/0x6+
         hAcfjgmNsYCY/MEmo258i6eJeCPeNE4F8cs1E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743622431; x=1744227231;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g3lsKW0kM5sHJ4u5JSNnqHvD1MiCmkWeOHHZYKmLwao=;
        b=HGl481cGsNa1hX+SfCD75aKjTMjyNJ38wNind/XOuXPPGBAMm0uJ5gnS7IYrq3dvbi
         X6EVfKCZX6Hiwsh1LXhxu/yf9FA9Kr+T35FpD/QD2Oz3F3KTJUBXCQLaT/HcjXT9oh6q
         nVAcEQdciMWyu+juBS4DuNQGtf5BYaIF2ItfVYTKFGSV4VwIWDiAsZpMZ64/k0MnizKd
         Ll2gpY9JfzXp5ZbmpjDndp2Ps/qzVWR4cu+VdxXT1gGXJG+HSu7LqPamMloDH3ORk33O
         oddswoFQjIUo5UuVHQC1m5qv/as1B5d7NuAWSsserPA9TC1lqHHZMXyEE7fyZl62g5O0
         GxHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXmWpWQNmiM4EoosdVL9iDXxvIZfJ71uTzy9HUfPi13LtHluEK7YYz0AGRzue2fvnilUM5CE0O5FxZUoV0OuFhbQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzG1FksIlrzsjzbni3NDZU2qV7V0DtrWbXz7h6pfOy54ksWVLBC
	Yzx0+0eY+X0T5TuXy1iXPR593RPudL6lgIIDcz2q56cr+yXSi6sZy8lI/N2sQcw=
X-Gm-Gg: ASbGncu/XlaBEmjJhkDVvBnDh6p+WW678NfL4OLAgqDBMSDn3fKe8q8A0QH2/1l8Unm
	9rD7LSMjNNQPuyRrSKF544zwJ1aCFGtLZgQCwYAOHRMG9bKQ4ltmDkANTwgWMt4CRkSownAIa+i
	RbkAEtfTgceTVx0kz7X0xlkS/RdKeCM3jK9ol1zcEG/cAC1mPjHwroK3RClfMmjZ9dAVvZPLTeC
	MxL8fXjH6FUb1pYGK4OmzdJn5Kt7C2OjSTmi1caL1+dEsAqiVUXe5/NCq/u3gAfeaspRENYjroC
	F2bD7oBw+XGcyM6xyu8OIRioIVb5J65VXS7AB5kQCZWgVqKTHI2IusPAT4nt7JW7RGNSDL9xOkY
	SvYctbtfGM8sYUgCv+rrTWAnCkQhwFg4F16Jk9cN2Er9h
X-Google-Smtp-Source: AGHT+IExtdmTvbPPb063cR1WQZOR+r+KfgqrJDpllPcSHyaBnMKwdTloyYpGnfhFyIxD7z2nWnp1Mg==
X-Received: by 2002:a05:600c:34d0:b0:43c:fcb1:528a with SMTP id 5b1f17b1804b1-43db61d8dcbmr160018165e9.6.1743622430596;
        Wed, 02 Apr 2025 12:33:50 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:24b8:b374:749c:8558? ([2001:8b0:aba:5f3c:24b8:b374:749c:8558])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb5fd0a46sm30449135e9.9.2025.04.02.12.33.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 12:33:49 -0700 (PDT)
Message-ID: <633bbc8576502d873a8e2a3938a6ae64bc508eb2.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH OE-Core 0/5] connman: Update for all
 PACKAGECONFIG options, clean up legacy
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: alex.kiernan@gmail.com, openembedded-core@lists.openembedded.org
Date: Wed, 02 Apr 2025 20:33:48 +0100
In-Reply-To: <20250402-connman-v1-0-2e4fbbb7caf9@gmail.com>
References: <20250402-connman-v1-0-2e4fbbb7caf9@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 19:33:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214289

On Wed, 2025-04-02 at 16:02 +0000, Alex Kiernan via lists.openembedded.org =
wrote:
> connman has a legacy style, this patch set adds in all the PACKAGECONFIG
> options which the upstream pacakge supports, removes patches which are no
> longer required, explicitly supports operation alongside systemd-resolved=
 and
> reworks the packaging so that PACKAGECONFIG and explicit package selectio=
n for
> every VPN is no longer required.
>=20
> Everything up to the final patch should be backward compatible cleanup of=
 the
> existing recipe, with only the final patch reworking the packaging.
>=20
> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> ---
> Alex Kiernan (5):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 connman: Merge .inc into .bb
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 connman: Delete patches for gold and MIPS =
binutils fix
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 connman: Move ppp from DEPENDS to PACKAGEC=
ONFIG
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 connman: Add all build options as PACKAGEC=
ONFIG
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 connman: Rework to avoid splitting into ma=
ny single binary packages
>=20
> =C2=A0meta/recipes-connectivity/connman/connman.inc=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 221 ---------------------
> =C2=A0...vice-stop-systemd-resolved-when-we-use-co.patch |=C2=A0 26 ---
> =C2=A0...ange-visibility-to-default-for-debug-symb.patch |=C2=A0 31 ---
> =C2=A0.../connman/connman/no-version-scripts.patch=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 47 -----
> =C2=A0meta/recipes-connectivity/connman/connman_1.44.bb=C2=A0 | 154 +++++=
++++++++-
> =C2=A05 files changed, 147 insertions(+), 332 deletions(-)

This failed in testing on the first try. I've added:

diff --git a/meta/recipes-core/images/build-appliance-image_15.0.0.bb b/met=
a/recipes-core/images/build-appliance-image_15.0.0.bb
index 03f02d14ae8..c5ddea79005 100644
--- a/meta/recipes-core/images/build-appliance-image_15.0.0.bb
+++ b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
@@ -6,7 +6,7 @@ LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb7=
88c80a0384361b4de20420"
=20
 IMAGE_INSTALL =3D "packagegroup-core-boot packagegroup-core-ssh-openssh pa=
ckagegroup-self-hosted \
-                 kernel-dev kernel-devsrc connman connman-plugin-ethernet =
dhcpcd \
+                 kernel-dev kernel-devsrc connman dhcpcd \
                  tzdata python3-pip perl-misc"
=20
 IMAGE_FEATURES +=3D "x11-base package-management splash"


and will see what take 2 looks like.

Cheers,

Richard

