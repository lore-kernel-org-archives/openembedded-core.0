Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 070547864C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Nov 2017 10:34:29 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id z3so3959556wme.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Nov 2017 02:34:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=cOtZyULF/saUOzcyxMaAf6gPLAwcT4VogQoZPj676TE=;
	b=nDeqHlBpdyDbY0xrNF0bVL75KAiVCRObVoqVPTDyWB5HDoOgPjehWqXkiH9CwHMvpT
	cxbRQCuyQxvjDFHaOO50bqQ2LDqwBJsIOA4btvaDuqTWPb0uRKC7akZ4SyP/bwt6aIfJ
	a/WGONIcklDQuwE1EWYx0pc79AI4VjKvjgmZDpetrgQec8bzY3SMcr0UdYndfhZaGCWK
	2Z9Yas9Q4Qq1ua1UZzVzQ8Zug4DMMc5M290gKvTv1qlqiJ4G+d9gtXKAq3LijTJ/hhqG
	fG7KAmKR84IuUzFzQbjC7hLKHgLCGkpMxwxMaTaVYr2Fo37/jX97X9CbOwHn42cid0RY
	HCHQ==
X-Gm-Message-State: AJaThX7/sLjY842LH6F4DhplNIQkJthDEwNViz1pvhSSu1B2NSwLL7ZC
	KTDWGMC+5M2xrxW9guFvPdE=
X-Google-Smtp-Source: AGs4zMZn+XcLgx3PnzpBZw9i2l5UTUgFl9VDO/SvedP2sAR7s+rfmrJNg8hjc8Bl9uTB05g+VlOKpw==
X-Received: by 10.80.180.142 with SMTP id w14mr12121134edd.66.1510569270543;
	Mon, 13 Nov 2017 02:34:30 -0800 (PST)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	h2sm13483555edc.89.2017.11.13.02.34.29
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 13 Nov 2017 02:34:29 -0800 (PST)
Message-ID: <1510569268.4049.48.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 13 Nov 2017 10:34:28 +0000
In-Reply-To: <CA+chaQcS+pyDt4FVuu1tL-FPPDRx-_Jy6E+evC7SHQjkNgaTOg@mail.gmail.com>
References: <cover.1510550741.git.Qi.Chen@windriver.com>
	<62db9387c3ee71f4bed87a7a546afdf927ba5ac0.1510550741.git.Qi.Chen@windriver.com>
	<1510563249.4049.33.camel@andred.net>
	<CA+chaQcS+pyDt4FVuu1tL-FPPDRx-_Jy6E+evC7SHQjkNgaTOg@mail.gmail.com>
X-Mailer: Evolution 3.26.1-1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: opkg --prefer-arch-to-version (was: Re: [PATCH 1/1] autoconf-archive: inherit allarch and fix package splitting)
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
X-List-Received-Date: Mon, 13 Nov 2017 10:34:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Only during do_rootfs indeed (I don't ever do upgrades on the target using
opkg).

Is there a reason to still specify prefer-arch-to-version? I'd actually
expect the exact opposite compared to the original commit message's
statement, unless the version numbers are identical.

Also, I would argue that the defaults during do_rootfs and when using opkg
on the target should be the same...

Cheers,
Andre'


On Mon, 2017-11-13 at 11:12 +0100, Martin Jansa wrote:
> Is this during do_rootfs or are you seeing this issue when upgrading on
> the
> target as well?
> 
> I haven't found the bug for this but IIRC it's because do_rootfs is using
> --prefer-arch-to-version parameter.
> meta/classes/package_ipk.bbclass:OPKG_ARGS += "--force_postinstall
> --prefer-arch-to-version"
> which causes this undesired behavior.
> 
> On Mon, Nov 13, 2017 at 9:54 AM, André Draszik <git@andred.net> wrote:
> 
> > Hi,
> > 
> > On Mon, 2017-11-13 at 13:26 +0800, Chen Qi wrote:
> > > autoconf-archive is a set of common m4 macros, it should be allarch,
> > > just like it is on other distros.
> > 
> > I have found previously that when changing a recipe to produce more
> > generic
> > output, like in this case, and the old binary package is still in
> > deploy/,
> > then the package manager would always pick the more specific version,
> > even
> > if a more recent (by package version) exists in deploy. In my case I was
> > moving from PACKAGE_ARCH=${MACHINE_ARCH} to
> > PACKAGE_ARCH=${TUNE_PKGARCH},
> > but I guess it'll be the same here.
> > 
> > What is the correct way to deal with that other that cleansstate?
> > 
> > Cheers,
> > Andre'
> > 
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> > 

