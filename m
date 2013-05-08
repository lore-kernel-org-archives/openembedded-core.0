Received: from mail-pb0-f44.google.com ([209.85.160.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UaA6I-0005BU-0V
	for openembedded-core@lists.openembedded.org;
	Wed, 08 May 2013 21:32:32 +0200
Received: by mail-pb0-f44.google.com with SMTP id wz17so1434795pbc.31
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 May 2013 12:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=Qh+BApV3+VFI5A6EYV7bGI3sivE6GzzlbIH8vdMmNpw=;
	b=LoCEPdSIlWsSuZk72nDDrV2PdpHuDRdtKYAOm3HM0VMD8TkAKVZNA1jBfY8w0zUufM
	PJmau5IDN4cqMr+mytkIA4gTQ4Q78iod7JLhoHiTL1jkLYXBODdxGjk2Yc4PB55l3Ydt
	4UghnCQEeoyVeDFNPV+M0lNpZ1s8dAXSJzSYn0MO9pbCnQm7PiTU0YnuXnX4T9p6El2J
	1+sAwLomwFFbXhmFoyHvw4AQf6oL9RgtYCc8WtHk5zLGbAZfSOiqyVCnCBcmWaHJixFJ
	Cb9vYNLfb6wCZHXbkYWs50wvZaW7UoaD84AN2CBodDmk3ovPw31I7qXdA7aff7zUMu9i
	7fRw==
X-Received: by 10.68.87.229 with SMTP id bb5mr8947378pbb.171.1368040466652;
	Wed, 08 May 2013 12:14:26 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	ya4sm33672084pbb.24.2013.05.08.12.14.23 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 08 May 2013 12:14:25 -0700 (PDT)
Date: Wed, 8 May 2013 21:14:16 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Paul Barker <paul@paulbarker.me.uk>
Message-ID: <20130508191416.GC3188@jama>
References: <1367917522-29378-1-git-send-email-paul@paulbarker.me.uk>
	<CANyK_8e2uowYYky7Oq=yDsZcxWNVMmeTjaVxWEhubVspuQrLDw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANyK_8e2uowYYky7Oq=yDsZcxWNVMmeTjaVxWEhubVspuQrLDw@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qt4: remove trailing slash from prefix
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 08 May 2013 19:32:37 -0000
X-Groupsio-MsgNum: 38914
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="f+W+jCU1fRNres8c"
Content-Disposition: inline

--f+W+jCU1fRNres8c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 08, 2013 at 07:07:57PM +0100, Paul Barker wrote:
> On 7 May 2013 10:05, Paul Barker <paul@paulbarker.me.uk> wrote:
> > The trailing slashs on "Prefix=3D${prefix}/" and "-prefix ${prefix}/" a=
re passed
> > through to the generated pkgconfig files and may be joined to paths like
> > "/include" yielding a final path with a double forward-slash (eg.
> > "/usr//include"). This may end up in the debugging symbols in other app=
lications
> > or libraries which depend on qt4 which in turn causes the debugedit pro=
gram to
> > fail with the message "canonicalization unexpectedly shrank by one char=
acter"
> > when it tries to replace the double forward-slash with a single forward=
-slash.
> > Thus the function split_and_strip_files fails and ultimately do_package=
 fails.
> >
> > As this slash is removed from the prefix it is added into the regular e=
xpression
> > used to fix up pkgconfig files later in the recipe.
> >
> > This error was seen in vlc in meta-openembedded and should be solved by=
 this
> > change in openembedded-core.
> >
> > Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
>=20
> Martin, could you check whether applying this patch to oe-core fixes
> the vlc do_package failure you were seeing?

Yes I plan to include it in next build, but I would like to fix
webkit-efl build with newer binutils first, because that adds 3.9M lines=20
=66rom log.do_compile and resulting logs from world have 600M :/

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--f+W+jCU1fRNres8c
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlGKpAgACgkQN1Ujt2V2gBzanQCfTcTdGHONhTeraaUKzqxLQs08
UaAAnjd7DZdkwAD6wzmz25Yt910ShHzl
=UAc8
-----END PGP SIGNATURE-----

--f+W+jCU1fRNres8c--
