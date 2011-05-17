Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QMEXG-0004L1-An
	for openembedded-core@lists.openembedded.org;
	Tue, 17 May 2011 09:17:42 +0200
Received: by fxm19 with SMTP id 19so338720fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2011 00:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=tWSZCmU9Xd2TLXmJQOky/985oBnt6du8q4TMgyAqSKY=;
	b=nEpCEDhZuTN4mVhP0PJCNvz4tncczccQ+zmCom1PfNUJXa5/V+EKSYOsEGayLrwKb/
	jg98j+nRWrkWM5MYhpBLbLWt3qkjHnflesBp2ZrR6OjL6AIbSyLu0JAe5lnIUDUijpeY
	SO/OhBfnHKNWKVvzaM/ik+Culo6QWQRDTXMgo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=CZIET8kTAMbEkvh384f5rhGDw4JgpkP9xAMowrh0TWe+xmtMZTBVQtZfdc9SaMAyaT
	G4MZi2PZ5Hk4dxJ+6hRby0ncKbTkOS0PdEUF+rak49zrzlDFnATEYbThi/K+mjU6Xb+N
	hCkVxpYEN/V/wbtLtDq0rU49aDvl0K8FT6YAU=
Received: by 10.223.63.147 with SMTP id b19mr371283fai.114.1305616489152;
	Tue, 17 May 2011 00:14:49 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id d16sm78872faa.12.2011.05.17.00.14.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 May 2011 00:14:47 -0700 (PDT)
Date: Tue, 17 May 2011 09:14:46 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110517071446.GC3509@jama.jama.net>
References: <46AB3A39-160F-4EB9-B92E-8DE957C1284D@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <46AB3A39-160F-4EB9-B92E-8DE957C1284D@dominion.thruhere.net>
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
X-List-Received-Date: Tue, 17 May 2011 07:17:42 -0000
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="MnLPg7ZWsaic7Fhd"
Content-Disposition: inline

--MnLPg7ZWsaic7Fhd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 16, 2011 at 01:20:02PM +0200, Koen Kooi wrote:
> Hi,
>=20
> This bug gets reintroduced every other week, so let's try to fix it prope=
rly this time. The situation:
>=20
> 2 machines (beagleboard, pandaboard) using the same base architecture (ar=
mv7a).
>=20
> step 0: rm build pseudone -rf
> step 1: MACHINE=3Dbeagleboard bitbake console-image
> step 2: MACHINE=3Domap4430-panda bitbake console-image
>=20
> Step 0 and 1 work great, but I can't get step 2 to work. Attached is the =
complete output of step 2. As you can see without any updates to the reposi=
tories it wants to rebuild (e)glibc.
>=20
> Why does it wants to rebuild all that? Why does it fail?
>=20
> regards,
>=20
> Koen

Hi,

there is also another source of many sstate rebuilds. I've discuessed
this with RP on IRC already and I'll fill bugs as recommended, sharing
here just because you have opened this topic.

If you have package with
PACKAGE_ARCH =3D "all"
then the resulting package is created by run.* scripts with different
pathsi, *FLAGS etc even when it produces same output (ie some theme).

So all packages with such PACKAGE_ARCH are rebuilt after machine switch
(if the machine is ie different arch like om-gta02/nokia900).
Sstate is reused when you go back to om-gta02 after building nokia900,
so you have ie populate_sysroot only with as many checksums as you're
building different archs.

RP said, that right fix is to introduce something like all.bbclass which
excludes all variables which shouldn't change the output of such package
and then checksums will be the same.

Here is example with gtk-theme-e17lookalike http://paste.pocoo.org/show/388=
032/

And as side-note there is small problem when someone tries to hunt such
checksum changes, because some tasks which are not directly using sstate
like do_install do not save their run.* scripts in better place then
${WORKDIR}/temp=20

So if your bitbake-diffsigs shows something like this:

Hash for dependent task
/OE/shr-core/meta-shr/recipes-shr/shr/gtk-theme-e17lookalike_git.bb.do_inst=
all
changed from 8a0de44f3f238f645eab9509172c2d8b to
9d6bf027c5f435498017a652088d7327

You need to find right ${WORKDIR} for that version, and there in temp
directory right combination of run.do_install._pid_ scripts, but you
don't know which _pid_ belongs to which sstate checksum and I guess pid
cannot be stored in .siginfo because it would be always different.

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--MnLPg7ZWsaic7Fhd--
