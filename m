Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RUdCN-0005Kr-F9 for openembedded-core@lists.openembedded.org;
	Sun, 27 Nov 2011 12:47:08 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pARBeUlQ021606;
	Sun, 27 Nov 2011 11:40:30 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21291-04; Sun, 27 Nov 2011 11:40:26 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pARBeLDj021551
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Sun, 27 Nov 2011 11:40:21 GMT
Message-ID: <1322394029.4798.16.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Sun, 27 Nov 2011 11:40:29 +0000
In-Reply-To: <4ED0DDBF.9000104@eukrea.com>
References: <4ED0CC76.4040606@emagii.com> <4ED0DDBF.9000104@eukrea.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
X-MIME-Autoconverted: from 8bit to quoted-printable by tim.rpsys.net id
	pARBeUlQ021606
Cc: ulf@emagii.com
Subject: Re: Feedback on building openembedded-core for qemuarm. Excerpts from buildlog
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
X-List-Received-Date: Sun, 27 Nov 2011 11:47:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2011-11-26 at 13:38 +0100, Eric B=C3=A9nard wrote:
> Hi Ulf,
>=20
> Le 26/11/2011 12:24, Ulf Samuelsson a =C3=A9crit :
> > 3. When I ran into this problem, I exited with ctrl-C.
> > This left some recipes in the middle of a fetch ,and the build could =
not
> > continue.
> > I had to "bitbake -c clean <package>" on all problematic packages to =
recover.
> > Seems a little bit fragile to me.
> >
> already met here : you must let bitbake end the other tasks already sta=
rted to=20
> prevent that (so only one control C).
>=20
> > 4. linux-3.0 recipe in meta-ti does not build (On Ubuntu 11.10 x64).
> > Fails in the fetch stage.
> > I removed the layer, since it was not needed for qemuarm.
> >
> I also met this kind of problem. To prevent that problem, in my bsp ove=
rlay, I=20
> always add COMPATIBLE_MACHINE =3D "" to the machine specific recipes.
> What is strange is that meta-ti also have this in its recipes so their=20
> linux-3.0 recipe should not be used if you target qemuarm.
>=20
> > 5. When compiling on a Ubuntu 11.10 x64 host (linux 3.x host)
> > tiff won't build.
> > Did:
> > bitbake console-image"
> > bitbake -c clean tiff
> > bitbake tiff
> > - No luck
> > Reading through the mailing list, I found someone which deleted
> > $TMPDIR and then
> > bitbake tiff
> > bitbake console-image
> > That worked for me as well once, second time, same problem.
> > Problem is that #include <iostream> fails.
> >
> > I noted that "iostream" is built and available in <sysroot>/usr/inclu=
de/c++
> > On the host, it is located in /usr/incolude/c++/<version>
> > "tiff" build seems to be OK with Ubuntu 11.04 i686.
> >
> what is your BB_NUMBER_THREADS setting ?
> Here (on 2 different hosts/distro/arch but with an i7 CPU in both cases=
) if I=20
> set it over 4, I often (always with a value of 8) meet problems with c+=
+=20
> includes during build from scratch. 4 seems the magic value which never=
=20
> trigger the problem.

To help me get further data points on this issue, are you using rm_work?
Do the recent changes in master help (the bitbake sstate/task_skip()
ones in particular)? I've not been able to reproduce this :(

Cheers,

Richard



