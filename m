Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QB4S3-0004IQ-60
	for openembedded-core@lists.openembedded.org;
	Sat, 16 Apr 2011 14:18:11 +0200
Received: by wye20 with SMTP id 20so3209283wye.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Apr 2011 05:15:51 -0700 (PDT)
Received: by 10.216.87.8 with SMTP id x8mr3018939wee.46.1302955884792;
	Sat, 16 Apr 2011 05:11:24 -0700 (PDT)
Received: from [172.20.1.5] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id d6sm1715463wer.2.2011.04.16.05.11.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 16 Apr 2011 05:11:24 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4f60a8f2b1b3f935ea029e6b780151015ea31c18.1302936483.git.sgw@linux.intel.com>
Date: Sat, 16 Apr 2011 14:11:22 +0200
Message-Id: <5098B0B9-2B87-4BC4-AE7E-34900FAEEFD8@dominion.thruhere.net>
References: <cover.1302936483.git.sgw@linux.intel.com>
	<4f60a8f2b1b3f935ea029e6b780151015ea31c18.1302936483.git.sgw@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Cc: Scott Rifenbark <scott.m.rifenbark@intel.com>,
	Xiaofeng Yan <xiaofeng.yan@windriver.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	Kang Kai <kai.kang@windriver.com>, Jingdong Lu <jingdong.lu@windriver.com>
Subject: Re: [PATCH 47/58] setuptools: Make options for setup.py more flexible
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 16 Apr 2011 12:18:11 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

As I said in my other mail, the reasoning behind this patch is wrong and =
will lead to broken output. The '--single-version-externally-managed' is =
needed to stop the python egg code from doing the wrong thing. People =
running into problems with this need to do 'inherit distutils' instead =
of 'inherit setuptools'.

Besides all that, 'DISTUTILS_INSTALL_EXTRA_ARGS' would be the correct =
name for such a thing.

Op 16 apr 2011, om 08:55 heeft Saul Wold het volgende geschreven:

> From: Gary Thomas <gary@mlbassoc.com>
>=20
> The setuptools class uses hard-wired options for 'setup.py' during
> the install step.  In particular, not all versions of setup.py
> support the "--single-version-externally-managed" option.  This
> patch allows for a recipe to easily override these options, while
> leaving the majority (important) setup options intact.
>=20
> --
> ------------------------------------------------------------
> Gary Thomas                 |  Consulting for the
> MLB Associates              |    Embedded world
> ------------------------------------------------------------
>=20
>> =46rom 0afbe6b9477c207e37009c8ef5aa47b3438640a9 Mon Sep 17 00:00:00 =
2001
> From: Gary Thomas <gary@mlbassoc.com>
> Date: Wed, 13 Apr 2011 15:12:57 -0600
> Subject: [PATCH] setuptools: Make options for setup.py more flexible
>=20
> Signed-off-by: Gary Thomas <gary@mlbassoc.com>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
> meta/classes/setuptools.bbclass |    3 ++-
> 1 files changed, 2 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta/classes/setuptools.bbclass =
b/meta/classes/setuptools.bbclass
> index ced9509..cf1c224 100644
> --- a/meta/classes/setuptools.bbclass
> +++ b/meta/classes/setuptools.bbclass
> @@ -2,7 +2,8 @@ inherit distutils
>=20
> DEPENDS +=3D "python-setuptools-native"
>=20
> +DISTUTILS_INSTALL_OPTS ?=3D "--single-version-externally-managed "
> DISTUTILS_INSTALL_ARGS =3D "--root=3D${D} \
> -    --single-version-externally-managed \
> +    ${DISTUTILS_INSTALL_OPTS} \
>     --prefix=3D${prefix} \
>     --install-data=3D${datadir}"
> --=20
> 1.7.1.1
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



