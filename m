Return-Path: <paul.betafive@gmail.com>
Received: from mail-lb0-f182.google.com (mail-lb0-f182.google.com
	[209.85.217.182])
	by mail.openembedded.org (Postfix) with ESMTP id 4FA8D60030
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Aug 2014 15:02:57 +0000 (UTC)
Received: by mail-lb0-f182.google.com with SMTP id z11so5697220lbi.27
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Aug 2014 08:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=TS8itBUeSoV3USgb7YVe/huAQnG1EugRfy8Uby5jyjw=;
	b=aPuHs1xdw3kG/XRg8J9n91VZwdgLsExMHXgZXShc7pSZKoz2doH/x8EnQa5GN38cxy
	wxUvsDQYSdyBh8m9Fxrg9Nq4bb6ia/LOKeLnMvhu3oZJwJNGIGGMlfSlFAI4BX5kn2l5
	VoAwvuERDBfWTqEBpjs/ns3K6SmK9ELPa5eIdZWeTvWF1spTL2xI10C3fhirZ9Zul6jP
	A/0GuqHELhzPT6O+L8K/P0Krf2EuZkszZksQrkblDmOAsj3r4zIV8NGkENbvg49zIZH1
	wr5EKJNyhPfbf0ojvpPwM8MJYIR1Lf0N+tg3kZUAZHGXczhhwJAKq3LcivMCJbWIwXU2
	mF/Q==
X-Received: by 10.112.156.10 with SMTP id wa10mr25901664lbb.68.1408460578559; 
	Tue, 19 Aug 2014 08:02:58 -0700 (PDT)
Received: from gmail.com (ygg.betafive.co.uk. [5.9.90.21])
	by mx.google.com with ESMTPSA id
	mi10sm32491604lbc.19.2014.08.19.08.02.56 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Aug 2014 08:02:56 -0700 (PDT)
Sender: Paul Barker <paul.betafive@gmail.com>
Date: Tue, 19 Aug 2014 15:02:54 +0000
From: Paul Barker <paul@paulbarker.me.uk>
To: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <20140819150254.GF7174@gmail.com>
References: <20140819114229.GE7174@gmail.com> <53F33B3C.5050206@windriver.com>
	<CANyK_8cHLJcKC5J+-hcAXgBGTW_HXrwidddC0oUV+29ewPAGeg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANyK_8cHLJcKC5J+-hcAXgBGTW_HXrwidddC0oUV+29ewPAGeg@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: OE Core <openembedded-core@lists.openembedded.org>
Subject: Re: core-image-full-cmdline build failure
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
X-List-Received-Date: Tue, 19 Aug 2014 15:03:07 -0000
X-Groupsio-MsgNum: 56747
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oFbHfjnMgUMsrGjO"
Content-Disposition: inline

--oFbHfjnMgUMsrGjO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 19, 2014 at 02:47:14PM +0100, Paul Barker wrote:
> On Aug 19, 2014 12:55 PM, "Robert Yang" <liezhi.yang@windriver.com> wrote:
> >
> > On 08/19/2014 07:42 PM, Paul Barker wrote:
> >>
> >> Looking into the rpcbind package, the useradd commands are performed i=
n a
> >> preinst script so I don't think the problem is opkg running the script
> too
> >> early. Do other package managers guarantee that a package's dependenci=
es
> are
> >> installed before the preinst script is ran? If so, I may need to
> re-order things
> >
> >
> > For rpm, I think yes ? The "pre" depends on base-passwd:
> > $ rpm -qpR -v tmp/deploy/rpm/core2_64/rpcbind-0.2.1-r0.core2_64.rpm |
> grep base-pass
> > manual: base-passwd
> > pre: base-passwd
> > post: base-passwd
> > preun: base-passwd
> > postun: base-passwd
> >
> > But I can't find such info in ipk.
> >
>=20
> Ok, looking at the opkg code it should satisfy dependencies before running
> the preinst script. I'll have to look into this further later and find out
> exactly what is going wrong.
>=20

Yea, I broke opkg. Also getting confused, I thought I'd switched back from =
the
development snapshot of opkg to the released version but I hadn't.

*facepalm*

opkg-0.2.2 works, opkg-0.2.3-SNAPSHOT doesn't work as it fails to install t=
hings
in the correct order. I'll have to fix this before releasing opkg-0.2.3.

--=20
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

--oFbHfjnMgUMsrGjO
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJT82ceAAoJEBwoJlo7UPQDOz0H/A3TbkoobZGJDWOI6FosdbRX
tdCm10MBCR5mvX/xSoRqnheOV2Er5KbqJP/XYyvWklReIvaWfdrSoB+B2uCFwqim
faDXdJ8uEpFLVl6naZX5XrGQfSg62X+Sa0/YpURUDlR8Xmd57+5fsnoSseE7mFaW
7+fSWMzoeFQXWfpwLkpgRKphwu4obJ/8AOElZyF+GfCwAKXsSWsXw6x0iUz+J4oH
TKDCCVdNQj21XkNbfqNvzi6JxEZYr/u6X2zUXC8esDLuFtKJGwkGtJxb0AW3CnN2
YYyIFnEpYqYnQ65JaxQlLTergwqqP5k7P4ZWPEugL5dewtXSLfn1IZKKthLjiqg=
=EPF/
-----END PGP SIGNATURE-----

--oFbHfjnMgUMsrGjO--
