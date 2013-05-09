Received: from mail-ea0-f178.google.com ([209.85.215.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UaQmg-0000Bo-RV
	for openembedded-core@lists.openembedded.org;
	Thu, 09 May 2013 15:21:25 +0200
Received: by mail-ea0-f178.google.com with SMTP id m14so1605663eaj.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 May 2013 06:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:mime-version
	:content-type:content-disposition:user-agent;
	bh=6l85sK5LJrR+PjTzNijbLliJ5+XjV0/Y67/FfkccP8A=;
	b=iN95a/OqSSpE3ZRLp7Uxu3MbUXxfKyG3gvZwd6bZfCz4xlO0rg4EfridFvDlPn/OsG
	sub61TFWU1xibSOkqeBuyvg8y+tbkgpy0qkxgv7jS5nWebptX765h249JiLcb3Ng9KvJ
	u+0PM9B7RD9Z2gVlK3xenha9jfYwHMGlEuPNuJwPsEeakm7RQOseatGRA/xOzkQhUpYV
	JqsbXLuszhx0wBbliPyOwNAaJbXkVqgl+FSFz5ipQN0njlgD67iOybaodYD/2OWIbv3J
	h5j0Hc7IMlhAagiZe2AoGQ/XnDuP5c93fvJVbwkSPOCga4jN2/MgoY3E0raOOllAa2Iu
	Gk5w==
X-Received: by 10.14.87.9 with SMTP id x9mr13794879eee.3.1368104599274;
	Thu, 09 May 2013 06:03:19 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	y10sm4126542eev.3.2013.05.09.06.03.18 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 09 May 2013 06:03:18 -0700 (PDT)
Date: Thu, 9 May 2013 15:03:19 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Kevin Tian <kevin.tian@intel.com>
Message-ID: <20130509130319.GE3188@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: flex wrapper returns wrong version
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
X-List-Received-Date: Thu, 09 May 2013 13:21:31 -0000
X-Groupsio-MsgNum: 38950
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tMbDGjvJuJijemkf"
Content-Disposition: inline

--tMbDGjvJuJijemkf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Flex wrapper was added with:
commit d835488c526aa61163ade503c6586eaa59509a07
Author: Kevin Tian <kevin.tian@intel.com>
Date:   Wed Jan 5 10:26:36 2011 +0800

    flex-native: create a wrapper script for sstate installation

    flex-native encodes M4 staging path in its binary, which breaks sstate
    installation in a new build environment. Use create_wrapper to create
    a wrapper script which explicitly set M4 environmental variable to the
    new path

and --version returns `basename $0` --version, so in my case:
sysroots/x86_64-linux/usr/bin/flex --version
flex.real 2.5.35

Which isn't parsed correctly e.g. in newer webkit
|   Could NOT find FLEX: Found unsuitable version "flex.real 2.5.35", but
|   required is at least "2.5.34" (found
|   /OE/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/bin/flex)

we can probably work around it by changing regexp in
/sysroots/x86_64-linux/usr/share/cmake-2.8/Modules/FindFLEX.cmake

but it would be nice to fix it in flex.

Cheers,

--tMbDGjvJuJijemkf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlGLnpcACgkQN1Ujt2V2gBwRTgCdG1k77OYdqpN2frjeEi18F3iM
m/0An0+Q9cVUS8TbQc5ajj/sK+nvXHdo
=5WIQ
-----END PGP SIGNATURE-----

--tMbDGjvJuJijemkf--
