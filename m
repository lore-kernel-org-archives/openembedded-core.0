Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QHAz3-0002ew-Fg
	for openembedded-core@lists.openembedded.org;
	Tue, 03 May 2011 10:29:29 +0200
Received: by bwz5 with SMTP id 5so6139603bwz.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 May 2011 01:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=Wzj2/6uZ1tLyW6TTpmXMxAdgRGRDZ90b4EZjvJEVTdE=;
	b=lHtJHUlmUNqYwRMoK+OHscwYzHltF7dTWlt86p8xZFe6lnChnBegiduTts9HUvO8t2
	O0neHc56CrgbkkVu5LyFM1Wx5N2iFG6k3e8sYzxKlG4CnyY67I3/B3oZ/qQdLUviZbSw
	q6vpamYjTln/RFosLqFl/e4PtslHa0mkFzOvg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=abCam7+87d0Q5YPnN+04GhrEtaSoDiyW2DrepIhqoSrl8goiyJps6Fzg19cPcYAX3h
	4brR8C3qVUkJOHupe4EFGHk2rj3GGx9Za6mCpC9LiW7OkA39hck2rwvOp/2ezaZ+spRi
	+kzXhDV3Sep8iV8/b4T7GYZQ6M+ZcSIgXzCC0=
Received: by 10.204.0.71 with SMTP id 7mr1557777bka.11.1304411209252;
	Tue, 03 May 2011 01:26:49 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id c11sm3765124bkc.14.2011.05.03.01.26.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 03 May 2011 01:26:48 -0700 (PDT)
Date: Tue, 3 May 2011 10:26:46 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110503082646.GB3334@jama.jama.net>
References: <1304073898-12204-1-git-send-email-michael.lippautz@gmail.com>
	<9AB9810D-F908-4477-888F-056039505DCF@dominion.thruhere.net>
	<BANLkTik1anmE4n7fKMp4uV9ZSLK1Gx_C0g@mail.gmail.com>
	<9DA5872FEF993D41B7173F58FCF6BE94D86872CF@orsmsx504.amr.corp.intel.com>
	<20110503081159.GA29813@becca.researchstudio.at>
MIME-Version: 1.0
In-Reply-To: <20110503081159.GA29813@becca.researchstudio.at>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH]] python: Unbreak Python third-party extensions
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
X-List-Received-Date: Tue, 03 May 2011 08:29:29 -0000
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4bRzO86E/ozDv8r1"
Content-Disposition: inline

--4bRzO86E/ozDv8r1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 03, 2011 at 10:12:00AM +0200, Michael Lippautz wrote:
> On Mon, May 02, 2011 at 09:57:18AM -0700, Kamble, Nitin A wrote:
> > Michael,
> >    This patch is invasive for python recipe but looks fine to me. How m=
uch testing have you done? We have few python extensions in yocto repo, and=
 none of them were hit by this issue. So which python extensions are seeing=
 the issue?
>=20
> Basically any package that uses Python extensions [1] including C librari=
es
> should suffer from this. The compilation of the package issues a cross-co=
mpile
> warning, but the packaging should fail due to QA checks.
>=20
> Background [once more]:
> When building Python packages that contain C extensions, distutils has to=
 figure
> out the compiler/linker options. Distutils utilizes its own sysconfig mod=
ule to
> do so. However, this distutils.sysconfig module fetches the variables fro=
m the
> sysrooted Makefile (of the target). Without this patch this results in
> -I/usr/include and -L/usr/lib in the compiler/linker execution. (Python C
> extension are linked against -lpython2.6 for various reasons.)
>=20
> The patches shuffles the Makefiles (sysroot/target) around in a way that =
for
> each bitbake step the right file is in place.
>=20
> I did test this with some (private) packages and a gpsd build (2.96) that=
 I have
> not yet pushed somewhere. Everything works as expected so far.

I've tested this patch on python-numeric, reported here
http://www.mail-archive.com/openembedded-core@lists.openembedded.org/msg006=
29.html

and this patch works for me and looks better than
distutils-common-base.bbclass: Prepend STAGING_LIBDIR to linker library sea=
rch path.

BTW: PR was changed in 2870697f08c171f455dbba03dd529b8c4cf11937 so it
has to be changed in this patch to apply and there is extra ']' in
subject line.

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--4bRzO86E/ozDv8r1--
