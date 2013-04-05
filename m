Received: from mail-da0-f51.google.com ([209.85.210.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UOEKj-0004Cg-8a
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Apr 2013 23:38:09 +0200
Received: by mail-da0-f51.google.com with SMTP id g27so1730984dan.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Apr 2013 14:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=xue+0pbeY1MognYB9ss4YEoHliyAXFoFYvhDDbJNlLQ=;
	b=WhaTeyr3t49eSxqUY0TyHZKjJNugLbUeCTfJYjU2lPPpn5fKKLMyyK0bkhDBnsYq4W
	huPSbAyrOZb8p4zNEotfLT90lrxww6rXCXO2RghRl1HD8F7ioFQbhUeaFTf7o92TmHg9
	HcLHMR8QoKt6+YPScu4qa5LovnzSMQLM0s4ptXjUy8sefiluXkKnmlv2omC1AWhLl2Iv
	sIcPFmfLGF2EnMj46fKozSoaH4UTKauqkbqo7ZLdNhFmk76mXDnsfgxUmI/8nyqrcNrR
	f0GLCujfqo7h21XoOeskpQk3Al4vK2Fby9ptITeO181Ku4A3GuUeZv6LsWG86fOl03y0
	ERkQ==
X-Received: by 10.68.31.130 with SMTP id a2mr16188039pbi.213.1365196848951;
	Fri, 05 Apr 2013 14:20:48 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id li15sm17481864pab.2.2013.04.05.14.20.45
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 05 Apr 2013 14:20:47 -0700 (PDT)
Date: Fri, 5 Apr 2013 23:20:38 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Message-ID: <20130405212038.GG3191@jama>
References: <515E976C.8060302@linaro.org>
MIME-Version: 1.0
In-Reply-To: <515E976C.8060302@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Does support for external toolchains working in current OE?
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
X-List-Received-Date: Fri, 05 Apr 2013 21:38:15 -0000
X-Groupsio-MsgNum: 37504
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FLPM4o+7JoHGki3m"
Content-Disposition: inline

--FLPM4o+7JoHGki3m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 05, 2013 at 11:20:44AM +0200, Marcin Juszkiewicz wrote:
> For last few months I am working on fixing Linaro binary cross
> toolchains and their support in OpenEmbedded. Got to point when they=20
> work (both AArch64 and ARMv7a ones) for single packages but problem=20
> starts when I want to create image...

Today I got different king of issue with external toolchain.

systemd is using AC_PATH_TOOL(OBJCOPY, objcopy)
but host prefix in OE is not the same as in binary toolchain (different TAR=
GET_VENDOR)
so it looks for configure:14545: checking for arm-foo-linux-gnueabi-objcopy
while binary toolchain has only               arm-bar-linux-gnueabi-objcopy

and because arm-foo-linux-gnueabi-objcopy wasn't found it continues:
configure:14588: checking for objcopy
configure:14606: found /usr/bin/objcopy
and bam a lot later when it tries objcopy from host on some arm lib

Interesting that systemd is first recipe in our image where I've noticed
issues like this

Any idea how to easily resolve this without checking every configure.ac
how it's looking for e.g. objcopy?

--FLPM4o+7JoHGki3m
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFfQCYACgkQN1Ujt2V2gBwypACgr1WrbUj+jl0/xgaCi9QkvcoK
B+EAoI0A82xrMxKHXbxysyx5nUY/5dGV
=7Hd/
-----END PGP SIGNATURE-----

--FLPM4o+7JoHGki3m--
