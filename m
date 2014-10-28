Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id F367F601F6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Oct 2014 09:36:11 +0000 (UTC)
Received: by mail-wi0-f173.google.com with SMTP id ex7so8677324wid.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Oct 2014 02:36:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=tA3qYLJxtqNnE+aRvE6gZdjpLNpLwgGm3FEOyn34AJc=;
	b=RVZbVOKHL7BCDL9X2DJvsyygH2CpV/8OgU5xGUJ4vKgZx+hFPxqsN9gRxAsRQqLxD3
	51+miltGFfiOnofv5EAlb5qMjdXmQuE39emvICifvtNBgMJmVxy5Li87/o91rsgnDOC1
	q/0T6g6CQr1dxU7FfPYX3X0zizJ2n4O+C3v3oUs7IFh0U8VbfzjiNeRmx6dND1QG7MLF
	C6HyaqhU7fxHLa9CF2m9hiBaS2f5sIN0anC+3HRvm+TmpqWOF7W3eshzHRV8LfesVoiu
	T0Ib7JW861a/JIKoC2P8yc1PiWNOxJ0N5/A9+37/dMBZjCKYkUqZ7KjuujclNGItIXGs
	GJCQ==
X-Gm-Message-State: ALoCoQl7abUQ75vrjdeJlaloUtN2qN3ySZrs3TKTZ/CeOOgzI491V3ez+yBxX5zPet5vs7yI8ENV
X-Received: by 10.180.77.79 with SMTP id q15mr26454470wiw.8.1414488972174;
	Tue, 28 Oct 2014 02:36:12 -0700 (PDT)
Received: from [172.20.0.187] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPSA id ge1sm14725848wib.4.2014.10.28.02.36.10
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 28 Oct 2014 02:36:11 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.0 \(1990.1\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAJTo0LY5A00MG1hmFL7Smo1sdHnGdfqpun4+kbhDRZ3iAQ2NDw@mail.gmail.com>
Date: Tue, 28 Oct 2014 10:36:09 +0100
Message-Id: <A5FC7B4F-F911-4DFA-8F66-C006740DC0F4@dominion.thruhere.net>
References: <1414336254-22707-1-git-send-email-koen@dominion.thruhere.net>
	<CAJTo0LagpRtefUvm_rrOcEyj6hTZRkySk9fVzcYGm+UFFYe_rQ@mail.gmail.com>
	<18631FB3-E9CA-4DD0-BF5A-DB114D3B7422@dominion.thruhere.net>
	<CAJTo0Lam=wC-MBny66h-jC0ieb9tp9nTJUWEQ+KXvLDEqbk23Q@mail.gmail.com>
	<473E6E55-239E-4EC8-813C-8494BEF78CED@dominion.thruhere.net>
	<CAJTo0LY5A00MG1hmFL7Smo1sdHnGdfqpun4+kbhDRZ3iAQ2NDw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.1990.1)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] base bbclass: add support for tar.lz
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
X-List-Received-Date: Tue, 28 Oct 2014 09:36:16 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> Op 27 okt. 2014, om 14:15 heeft Burton, Ross <ross.burton@intel.com> =
het volgende geschreven:
>=20
>=20
> On 27 October 2014 13:06, Koen Kooi <koen@dominion.thruhere.net> =
wrote:
> Ah, two different problems :/
>=20
> The problem that lzip-native isn't in oe-core is only a problem when =
there's a .lz SRC_URI in oe-core, but the false-positives are a problem =
now.

Apart from this dependency problem, bitbake has a problem as well. Does =
anyone know why bitbake does:

	compressiontool --stdout file.tar.compressed | tar x

instead of:

	tar xf file.tar.compressed=20

Tar seems to do the right thing with 'tar xf' after installing lzip on =
my angstrom system, I don't have and .tar.lz lzops lying around to test =
with, though.

regards,

Koen=

