Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f180.google.com (mail-ea0-f180.google.com
	[209.85.215.180])
	by mail.openembedded.org (Postfix) with ESMTP id 95ABD6BD80
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2013 09:21:07 +0000 (UTC)
Received: by mail-ea0-f180.google.com with SMTP id h10so780126eaj.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2013 02:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=EgLWNnaUkr5S8SRA2HUckyz2kqjgGoiRu6ulH3ZJn8c=;
	b=DMSJOJBa2CwDnhKQLcGE8yISsC5FiCZc7SvHWH2qkF+zKi/53AsZ4u4J674xOGOKr1
	hVyS0uWXwF7xVDnzCMp0pw1m6ckRKcxBrSb1o9vNPkpT4H8QIocFnYTyIA1smPoI2eNv
	IlOl+h21xRD7dsBF3vyyLIT1WETekisLFyQ6xP6QyJ0CIh2Rv58DqTcP0s2hnHs948OL
	rNAJT0R6Mag+mMxTKGODQzD9Md/REbgg2/5caGa2Lu7GTPKBxPWrywXkBNNSTvCoK1UW
	ftpjQM9EJqQ/RgOk56FL/hoGCGj/SuDPUSX66N4YAk+1PLKdr42fyoRkVJZv7j1qFu+c
	VUew==
X-Received: by 10.15.107.132 with SMTP id cb4mr2405110eeb.54.1377854467823;
	Fri, 30 Aug 2013 02:21:07 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	p5sm53022483eeg.5.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 30 Aug 2013 02:21:06 -0700 (PDT)
Date: Fri, 30 Aug 2013 11:22:20 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: jackie.huang@windriver.com
Message-ID: <20130830092220.GT3544@jama>
References: <cover.1377827133.git.jackie.huang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <cover.1377827133.git.jackie.huang@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/1] remove the unnecessary protocol parameters
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
X-List-Received-Date: Fri, 30 Aug 2013 09:21:08 -0000
X-Groupsio-MsgNum: 44327
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="YI37jEh306anPMfG"
Content-Disposition: inline

--YI37jEh306anPMfG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 30, 2013 at 09:56:35AM +0800, jackie.huang@windriver.com wrote:
> From: Jackie Huang <jackie.huang@windriver.com>
>=20
> What I did to remove these:
> I checked that we only use git and svn:
> $ find meta \( -name *.bb -o -name *.inc -o -name *.bbclass \) -exec sed =
-n 's/.*"\(\w*:\/\/\).*\(;protocol=3D\w*\)/\1 \2/p' {} \; | sort | uniq
> git:// ;protocol=3Dgit \
> git:// ;protocol=3Dgit"
> git:// ;protocol=3Dgit;bareclone=3D1;branch=3D${KBRANCH},${KMETA};name=3D=
machine,meta"
> git:// ;protocol=3Dgit;bareclone=3D1;branch=3D${KBRANCH},meta;name=3Dmach=
ine,meta"
> git:// ;protocol=3Dgit" % (gstpkg_basename, branch))
> git:// ;protocol=3Dgit;nocheckout=3D1;branch=3D${KBRANCH},${KMETA};name=
=3Dmachine,meta"
> git:// ;protocol=3Dhttp \
> svn:// ;protocol=3Dhttp \
> svn:// ;protocol=3Dhttp;module=3Dtrunk \
> svn:// ;protocol=3Dsvn"
>=20
> So I think it's safe to simply remove ";protocol=3Dgit" and ";protocol=3D=
svn":
>=20
> $ find meta \( -name *.bb -o -name *.inc -o -name *.bbclass \) -exec sed =
-i 's/;protocol=3Dgit//; s/;protocol=3Dsvn//' {} \;
>=20
> What left with protocol parameter after removal is:
> $ find meta \( -name *.bb -o -name *.inc -o -name *.bbclass \) -exec sed =
-n 's/.*"\(\w*:\/\/\).*\(;protocol=3D\w*\)/\1 \2/p' {} \; | sort | uniq
> git:// ;protocol=3Dhttp \
> svn:// ;protocol=3Dhttp \
> svn:// ;protocol=3Dhttp;module=3Dtrunk=20
>=20
> Please refer to "[OE-core] [PATCH] u-boot: update to 2013.07" for detail =
discussions.
>=20
> tested info:
> MACHINE ??=3D "qemux86-64"
>=20
> $ bitbake world

Would you mind running the same in meta-openembedded?

I can do the "bitbake world" part.

--YI37jEh306anPMfG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlIgZEwACgkQN1Ujt2V2gBzvxQCglI+8ihEIKbxW2iaDXgn/L9g5
4e0AoLIjukcFUevZvIhYW+hw73hbNg/T
=zyC3
-----END PGP SIGNATURE-----

--YI37jEh306anPMfG--
