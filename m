Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f196.google.com (mail-it1-f196.google.com
	[209.85.166.196])
	by mail.openembedded.org (Postfix) with ESMTP id BC0117E225
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2019 15:46:59 +0000 (UTC)
Received: by mail-it1-f196.google.com with SMTP id m187so11565393ite.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2019 08:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=qa1Ue5qXuCJunGvxMa23lPGAxKTqHoTDoDpw9Z7w9yM=;
	b=fSvAfSUcaTk2mAyEKwdMvgpcawwjij52yHwAvy63N5NHURiz4QwLYRHZtOxV6zECeP
	yzQarB35Nwuo0XyteUd0wu43k1XGebNCyBQTgl1l86qHRBhXdG+Bx/l9/DohPQtpQ86r
	IeftK39MHH27eL/t8K9pLx6jD1wSOkTkNDKjUk9fxly4o1xLXbQRblRiUOy0OJYpOrST
	HCBIu5aBl5LcTxjUdziJo/oiWvwO5pieQr2JGjJpeO0vRolO+zJws78wdbf1NRYuMlrZ
	C8nxPMl0+tlXclwwzbdoqNn41rHmzhm6vatC08O+3lXIV5MEdx8PheYtuqm7H3HsCn5P
	LLXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=qa1Ue5qXuCJunGvxMa23lPGAxKTqHoTDoDpw9Z7w9yM=;
	b=LKLyDO69QdXk032j4ij82JKc86ghV7S6Q2VftB4vOo5+sdfoTL0lKcYw8DEeBzp5YP
	OuaFv0FLi+Z9eP0T7zW72ODKdRISVGztFUAOZ1HVrB0obup/zyTdfAXgwv0Tsampn6jW
	ex6bM0X7UiZNzcDRQhipDe8HPvWOXV8gkv+TkIS5NzAk+vOsoFaS3Yi0n9HD1KjMUkbr
	PdjR4Nuzp9lm1tyqiJjVtCzfF6uljecVaodVEfzRRrJwhwWIgnbck+NNzMEphJ3CjW6a
	RbQrCWakf0zx+gjpreL0WWLozmMzgPkMyE0YnPWqjidFSr7fzBDsEDjZqneN6WWenyjw
	odFA==
X-Gm-Message-State: APjAAAWwFKnPV2ohVBO2vMnesG7XINT5ycNkm0uCc1xoHh8VQCIjUE+q
	4g606ciyjDyurz2Vz3/Q8PzVhgTUkRahu44y2iMabA==
X-Google-Smtp-Source: APXvYqwurRnOTSBXge1hTilg8Kg1KysvqV4+GFkWcHH3pQjJ2EUWROPiAazFdI6BGx9bP3PmFNZCLG8+8205zgCa6lE=
X-Received: by 2002:a24:1d01:: with SMTP id 1mr17339452itj.83.1560354420653;
	Wed, 12 Jun 2019 08:47:00 -0700 (PDT)
MIME-Version: 1.0
References: <1557087292-30921-1-git-send-email-liu.ming50@gmail.com>
In-Reply-To: <1557087292-30921-1-git-send-email-liu.ming50@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 12 Jun 2019 16:46:49 +0100
Message-ID: <CAJTo0LaskMp781L1nraafVxf49Zmz8qsJ=KR0XegdoAUtSRQqw@mail.gmail.com>
To: Ming Liu <liu.ming50@gmail.com>
Cc: gerard.salvatella@toradex.com, luka.pivk@toradex.com,
	Stefan Agner <stefan.agner@toradex.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2 0/2] Split out libx11-locale from libx11
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 12 Jun 2019 15:47:00 -0000
Content-Type: text/plain; charset="UTF-8"

I didn't make myself clear.  To reduce the amount of moving parts and
changes I propose:

1) libx11 and libx11-diet are untouched
2) New recipe libx11-compose-data which just ships the compose data,
assuming that is all that is needed by xkeyboard-config's Compose
handling.  Refuses to build if x11 is in DISTRO_FEATURES
3) xkeyboard-config depends on either libx11 or libx11-compose-data,
depending whether x11 is in DISTRO_FEATURES

Ross

On Sun, 5 May 2019 at 21:15, <liu.ming50@gmail.com> wrote:
>
> From: Ming Liu <liu.ming50@gmail.com>
>
> Changes in V2:
> 1 As suggested by Ross Burton, split out libx11-locale from libx11
> as a standalone recipe.
>
> Ming Liu (2):
>   libx11: split out libx11-locale
>   libxkbcommon: RDEPENDS on libx11-locale
>
>  .../recipes-graphics/xorg-lib/libx11-diet_1.6.7.bb |  1 -
>  .../libx11-locale/0001-Drop-x11-dependencies.patch | 86 ++++++++++++++++++++++
>  .../xorg-lib/libx11-locale_1.6.7.bb                | 32 ++++++++
>  meta/recipes-graphics/xorg-lib/libx11.inc          |  8 +-
>  .../xorg-lib/libxkbcommon_0.8.4.bb                 |  4 +
>  5 files changed, 129 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-graphics/xorg-lib/libx11-locale/0001-Drop-x11-dependencies.patch
>  create mode 100644 meta/recipes-graphics/xorg-lib/libx11-locale_1.6.7.bb
>
> --
> 2.7.4
>

