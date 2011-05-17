Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QMIdN-00014F-Ew
	for openembedded-core@lists.openembedded.org;
	Tue, 17 May 2011 13:40:17 +0200
Received: by fxm19 with SMTP id 19so478032fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2011 04:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=Koszbzqj1C9hxTkiL9wYiUEaWN5kpKW01hdWC27aYlw=;
	b=TlWIuNcZzccrl4x7VPr7FtFKzC0JKGgaYG5+f0EZW47CEdWE7eeBn7Z3DficG2FfV4
	YWU/hIKfwgjgrH+NcuPkgSSx/0zj0QA/uI5a+VJ5rTWwajx3EVPQ1Nq7feXJ+IlfMYCU
	CK3635y3Y5OS8HbOBawLALKGlz0kDpHOwSu6w=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=UYF5EbjLx1tQUATsKpfEjyf0jExjPgeOrb6DS1pJmnqIZnmccjCQE7BffFig+7SzhX
	GN79mjRCxABpi85jKM3nsoQWaqQOZeef37BH/nDIFY1JuRE1KU5ADTK9GZCR2gHvP0An
	P4mqQytacqVIgJTeLcnf0cZGEemouXHF3N5Lw=
Received: by 10.223.53.84 with SMTP id l20mr681825fag.48.1305632244028;
	Tue, 17 May 2011 04:37:24 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id 13sm181221fau.16.2011.05.17.04.37.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 May 2011 04:37:23 -0700 (PDT)
Date: Tue, 17 May 2011 13:37:16 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110517113716.GA11317@jama.jama.net>
References: <46AB3A39-160F-4EB9-B92E-8DE957C1284D@dominion.thruhere.net>
	<20110517071446.GC3509@jama.jama.net>
	<1305625372.3424.216.camel@rex>
MIME-Version: 1.0
In-Reply-To: <1305625372.3424.216.camel@rex>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: sstate breakage with multimachine
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
X-List-Received-Date: Tue, 17 May 2011 11:40:17 -0000
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vtzGhvizbBRQ85DL"
Content-Disposition: inline

--vtzGhvizbBRQ85DL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 17, 2011 at 10:42:52AM +0100, Richard Purdie wrote:
> On Tue, 2011-05-17 at 09:14 +0200, Martin Jansa wrote:
> > there is also another source of many sstate rebuilds. I've discuessed
> > this with RP on IRC already and I'll fill bugs as recommended, sharing
> > here just because you have opened this topic.
> >=20
> > If you have package with
> > PACKAGE_ARCH =3D "all"
> > then the resulting package is created by run.* scripts with different
> > pathsi, *FLAGS etc even when it produces same output (ie some theme).
> >=20
> > So all packages with such PACKAGE_ARCH are rebuilt after machine switch
> > (if the machine is ie different arch like om-gta02/nokia900).
> > Sstate is reused when you go back to om-gta02 after building nokia900,
> > so you have ie populate_sysroot only with as many checksums as you're
> > building different archs.
> >=20
> > RP said, that right fix is to introduce something like all.bbclass which
> > excludes all variables which shouldn't change the output of such package
> > and then checksums will be the same.
>=20
> I think rather then exclude them, we should zero them out or unexport
> them and stop them being present in the task environment. We should file
> a bug about this problem in the Yocto bugzilla.

Already did in morning
http://bugzilla.yoctoproject.org/show_bug.cgi?id=3D1075

>=20
> > Here is example with gtk-theme-e17lookalike http://paste.pocoo.org/show=
/388032/
> >=20
> > And as side-note there is small problem when someone tries to hunt such
> > checksum changes, because some tasks which are not directly using sstate
> > like do_install do not save their run.* scripts in better place then
> > ${WORKDIR}/temp=20
> >=20
> > So if your bitbake-diffsigs shows something like this:
> >=20
> > Hash for dependent task
> > /OE/shr-core/meta-shr/recipes-shr/shr/gtk-theme-e17lookalike_git.bb.do_=
install
> > changed from 8a0de44f3f238f645eab9509172c2d8b to
> > 9d6bf027c5f435498017a652088d7327
> >=20
> > You need to find right ${WORKDIR} for that version, and there in temp
> > directory right combination of run.do_install._pid_ scripts, but you
> > don't know which _pid_ belongs to which sstate checksum and I guess pid
> > cannot be stored in .siginfo because it would be always different.
>=20
> Just for reference, if you want to generate two trees of all tasks
> sigdata to compare you can do something like:
>=20
> MACHINE=3Dqemuarm bitbake console-image -S
> MACHINE=3Dqemux86 bitbake console-image -S
>=20
> and then look at the tmpdir/stamps/*/* files using bitbake-diffsigs on
> the files there to try and do this comparison more directly.

This works for multimachine build when I'm trying to find what's
different between qemuarm and qemux86, but wont help if I'm trying to
find what's changed in run.do_install from last week when I notice that
some package is being rebuilt again.

Also already in bugzilla
http://bugzilla.yoctoproject.org/show_bug.cgi?id=3D1074

> I'm open to other ideas to improving the way we write out the sigdata
> pieces to make this kind of analysis easier...

I don't know sstate internals as you do, but cannot we store every
dependant task used to count checksum in something like=20
state-gtk-theme-e17lookalike-all-oe-linux-gnueabi-0.1.1+gitr3+9b92a3d095ef1=
b53f55026cc292771d1507e6800-r8-all-2-do_install_8a0de44f3f238f645eab9509172=
c2d8b.gz
and from second run
state-gtk-theme-e17lookalike-all-oe-linux-gnueabi-0.1.1+gitr3+9b92a3d095ef1=
b53f55026cc292771d1507e6800-r8-all-2-do_install_9d6bf027c5f435498017a652088=
d7327.gz

or even flat filename structure like
siginfo-do_install_8a0de44f3f238f645eab9509172c2d8b.gz and
siginfo-do_install_9d6bf027c5f435498017a652088d7327.gz
as hash collision is not very likely to happen and overwrites with same
script are ok.

Then it would be easy to find actuall scripts which caused checksum
change without ${WORKDIR}/temp files

Cheers,=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--vtzGhvizbBRQ85DL--
