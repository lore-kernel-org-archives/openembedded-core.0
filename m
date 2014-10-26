Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id E9D1B60233
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Oct 2014 11:34:29 +0000 (UTC)
Received: by mail-wi0-f174.google.com with SMTP id q5so4249238wiv.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Oct 2014 04:34:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=S5AGbHEb6Eb9DB3qECpfuEWK4idnRQNEYSalG/+YnHA=;
	b=kH1mdubkIX3zFxTzBvh1JR7LXYs+Kwc/FXcKGFC41vliM55PKbRUn5v/71EXav31K2
	7FJ8DEf2sBV3Hspd4Hc6HLiCGeUoceY2f6xw1Bx0X61WPwAtI1WPPevQw6xJAqWmXU2G
	P0H2+huLlrXuJ3pZ23ct/Liz1aNpSbdZPkQOu2M8vPRx5p3gUo+fOqekXIMXzwD+npl/
	QQE9WU6NEAQjHMMJhBjFkgh1UbN+jttVWS4tAy55FkLrzztwBPvAqanhy6ZlstGLaeqb
	kcRJwH8XvMWn40Ycg/V7v7riOwWGjJVMJKxGZ1uBv/sLDEs+WmVznx7NHWGue+K5zLxp
	ziYQ==
X-Gm-Message-State: ALoCoQmO8fhXuYoNdKi1MkG27eNc2meo4KHF2QsuudU/Utt+4YEvW9JgnuwxhqciNQ8/1VLNVjfF
X-Received: by 10.180.182.18 with SMTP id ea18mr15012762wic.32.1414323269721; 
	Sun, 26 Oct 2014 04:34:29 -0700 (PDT)
Received: from ?IPv6:2001:610:612::2dea:208b:3bce:914?
	([2001:610:612:0:2dea:208b:3bce:914])
	by mx.google.com with ESMTPSA id dr5sm4191730wib.4.2014.10.26.04.34.28
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 26 Oct 2014 04:34:28 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.0 \(1990.1\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1414159825.30118.9.camel@ted>
Date: Sun, 26 Oct 2014 12:34:27 +0100
Message-Id: <6202F7A5-D96F-419A-87BF-32C61888F85E@dominion.thruhere.net>
References: <1414159825.30118.9.camel@ted>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.1990.1)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc: poison default sysroot path
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
X-List-Received-Date: Sun, 26 Oct 2014 11:34:34 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> Op 24 okt. 2014, om 16:10 heeft Richard Purdie =
<richard.purdie@linuxfoundation.org> het volgende geschreven:
>=20
> Various pieces of the code assume that the --sysroot option gets =
passed
> into the compiler tools. By having a "sane" default, we don't always
> spot when this occurs and this can later show up as breakage in =
sstate,
> or in usage of the external toolchain.
>=20
> We've long since talked about poisoning the default such that it will
> break unless the correct option is specified. This patch does just =
that.
>=20
> If this patch causes something to fail to build, it most likely means
> the various compiler flags and commands are not correctly being passed
> through to the underlying piece of software and that there is a real
> problem that needs fixing, its not the fault of this patch.=20

So hopefully this won't be needed anymore in my autobuilders:

export GCCARCH=3D$(MACHINE=3D${machine} bitbake -e | grep TARGET_ARCH\=3D =
| awk -F'"' '{print $2}')=20
MACHINE=3D$machine bitbake gcc-cross-${GCCARCH} -c cleansstate || true

Current offenders are: u-boot, linux and on x86 only, opencv.

regards,

Koen=

