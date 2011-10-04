Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RB4OD-0003du-2P for openembedded-core@lists.openembedded.org;
	Tue, 04 Oct 2011 14:46:29 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p94ClOrc032412 for <openembedded-core@lists.openembedded.org>;
	Tue, 4 Oct 2011 13:47:24 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id mJLyG9qaTQRF
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Oct 2011 13:47:24 +0100 (BST)
Received: from [192.168.1.40] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p94ClJ49032407
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 4 Oct 2011 13:47:21 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 04 Oct 2011 13:40:49 +0100
In-Reply-To: <201110032045.14771.schnitzeltony@gmx.de>
References: <201110031603.31007.schnitzeltony@gmx.de>
	<C4A96559-DE0F-4549-8A49-909A168B8A66@dominion.thruhere.net>
	<4E89D4F0.9080900@mlbassoc.com>
	<201110032045.14771.schnitzeltony@gmx.de>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1317732057.14671.38.camel@ted>
Mime-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by dan.rpsys.net id
	p94ClOrc032412
Subject: Re: bitbake webkit-gtk fails with clean temp dir
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
X-List-Received-Date: Tue, 04 Oct 2011 12:46:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2011-10-03 at 20:45 +0200, Andreas M=C3=BCller wrote:
> On Monday, October 03, 2011 05:29:52 PM Gary Thomas wrote:
> > >> NOTE: package webkit-gtk-1.5.1+svnr90727-r0: task do_compile: Fail=
ed
> > >> ERROR: Task 7 (/home/Superandy/data/oe-core/sources/openembedded-c=
ore/meta/recipes-sato/webkit/webkit-gtk_svn.bb, do_compile) failed with e=
xit code '1'
> > >>
> > >> ideas what causes this?
> > >
> > > no idea, but I get the same error
> > >
> >=20
> > It builds in Yocto/Poky so you might compare with those recipes.
> Dit you pull [1] and rebuild webkit-gtk?
> >=20
> >=20
> some investigation later: by diff'ing log files created by working envi=
ronment with the current environment I fell over log.do_configure:=20
>=20
> --disable-dependency-tracking=20
>=20
> was added in [1]. Tried manual bisecting by
>=20
> git reset --hard 288343e30604b944dc18fd82172febd314d9c520
>=20
> =C3=A9 voil=C3=A0: webkit-gtk builds again. Will send a patch with --en=
able-dependency-tracking after testing...
>=20
> Andreas


I'm planning to add this commit:

http://cgit.openembedded.org/cgit.cgi/openembedded-core/commit/?h=3Dmaste=
r-next&id=3Dd53a0282be132a4ced507c0277925ae4a0f2f40d

which means you should just be able to set:

CONFIGUREOPT_DEPTRACK =3D ""

for this recipe rather than having multiple configure options and hoping
the right one wins.

I'd also note this means there is a bug somewhere in the webkit
makefiles...

Cheers,

Richard




