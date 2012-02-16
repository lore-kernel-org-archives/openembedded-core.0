Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Ry1lg-0006xI-GI
	for openembedded-core@lists.openembedded.org;
	Thu, 16 Feb 2012 14:53:04 +0100
Received: by eekd41 with SMTP id d41so646419eek.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Feb 2012 05:44:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=UEOVEbqTaQaXVWMXSZHbP1WZhYOKEx3D3NnWGk/Jx9Y=;
	b=aMDRTSXaVROOAAu9bqmiroaOa8aeVoAl2zP2KYUyqg0SkXkY5gTApMFu08gC1f7QTo
	qlfq9GSdQkgy3I3mAsmf8d69iyTJKvflN6I/sVFtnZCVYTY3zgzAR+zueHg1JI64Q6So
	HdXtu7moKJW6oi+Ndlv+yF2Fdig20YGnW41sQ=
Received: by 10.14.127.80 with SMTP id c56mr1631390eei.13.1329399891660;
	Thu, 16 Feb 2012 05:44:51 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id o49sm23488822eeb.7.2012.02.16.05.44.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 16 Feb 2012 05:44:50 -0800 (PST)
Date: Thu, 16 Feb 2012 14:44:47 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120216134447.GD5822@jama.jama.net>
References: <1327425729.19643.113.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1327425729.19643.113.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: Machine dependencies validation with sstate
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
X-List-Received-Date: Thu, 16 Feb 2012 13:53:04 -0000
X-Groupsio-MsgNum: 17540
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2Z2K0IlrPCVsbNpk"
Content-Disposition: inline

--2Z2K0IlrPCVsbNpk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 24, 2012 at 05:22:09PM +0000, Richard Purdie wrote:
> In the process of diving into the issues in bug 1916
> (http://bugzilla.yoctoproject.org/show_bug.cgi?id=3D1916), I've come up
> with a good way of detecting machine specific changes to generic
> PACKAGE_ARCH packages.
>=20
> The idea is to have two identical machines, qemux86 and qemux86copy.
> These can be setup by:
>=20
> $ cp meta/conf/machine/qemux86.conf meta/conf/machine/qemux86copy.conf=20
> [Add SRCREV entry for qemux86copy to meta/recipes-kernel/linux/linux-yoct=
o_3.0.bb]
> $ cp -r meta/recipes-core/netbase/netbase-4.47/qemux86 meta/recipes-core/=
netbase/netbase-4.47/qemux86copy
> [Add PACKAGE_ARCH_qemux86copy to meta/recipes-core/netbase/netbase_4.47.b=
b]
> [Add RRECOMMENDS_${PN}_qemux86copy to meta/recipes-multimedia/gstreamer/g=
streamer_0.10.35.bb]
>=20
> You can then generate all of the sigdata files for two machine builds by
> running the following commands. The nice thing about these is that you
> don't have to run a complete build, it just writes out the data the
> build would have generated:
>=20
> rm tmp/stamps/*/*sigdata*
> MACHINE=3Dqemux86 bitbake core-image-sato -S
> find tmp/stamps/i586-poky-linux/ -name \*sigdata* | sort > l1
> find tmp/stamps/all-poky-linux/ -name \*sigdata* | sort >> l1
> MACHINE=3Dqemux86copy bitbake core-image-sato -S
> find tmp/stamps/i586-poky-linux/ -name \*sigdata* | sort > l2
> find tmp/stamps/all-poky-linux/ -name \*sigdata* | sort >> l2
>=20
> and then comparing the files l1 and l2, you can see which sigdata files
> differ. Running bitbake-diffsigs on the files, e.g.:
>=20
> bitbake-diffsigs tmp/stamps/all-poky-linux/x11-common-0.1-r44.do_package_=
write_ipk.sigdata.*
>=20
> can show what changed and you can then consider whether that is a valid
> change and how it might be avoided if necessary. This is how some of the
> patches I've just posted were developed.
>=20
> Comparing qemux86 and qemux86copy as above with core-image-sato now
> yields only two differences, in the package_write* tasks of iptables and
> gstreamer. This is due to the dependencies these two recipes have on
> kernel-module-* packages which in turn depend on linux-yocto which is
> machine specific. As yet I can't find a good way to avoid the kernel
> dependencies. If we could break debian.bbclass's hold in the
> kernel-module case (which never get renamed), that would be one way to
> avoid this problem.
>=20
> I thought people might find this intersting and it was worth documenting
> in the list archives if nothing else.

Thanks for this how-to!

Helped me to find e.g. this:
http://git.shr-project.org/git/?p=3Dmeta-smartphone.git;a=3Dcommit;h=3Dc6be=
068de2f716c9fdfc54970fd9908b4f2cd0e6

Now I'm looking into why busybox depends on MACHINE variable.

And interesting case is when something depends on linux-libc-headers even t=
ask-* recipe=20
which includes ie iptables (which rdepends or rrecommends some kernel modul=
es)

Any idea why identical hash of linux-libc-headers_3.1.bb.do_package_write i=
s=20
once compared with linux-gta04_git.bb.do_deploy and once linux-nokia900-mee=
go_git.bb.do_package_write?

Is it bug in bitbake-diffsigs output or fault of signature handler?

om-gta02@shr ~/shr-core $ bitbake-diffsigs tmp-eglibc/stamps/armv7a-vfp-neo=
n-oe-linux-gnueabi/ecalc-git-r1.do_build.sigdata.e772dc750d69dd217f6c7dfe7d=
e98246 tmp-eglibc/stamps/armv7a-vfp-neon-oe-linux-gnueabi/ecalc-git-r1.do_b=
uild.sigdata.ec74b075811b5316554475fb6360313a
Task dependency hash changed from c38789fba09937fbb2c2ba96b13fb2e8 to 4068d=
abb3a553492e678b90434f6c893 (for linux-libc-headers_3.1.bb.do_package_write=
 and linux-gta04_git.bb.do_deploy)
Task dependency hash changed from 9470058e15b666452c6209230c2d445b to 74265=
7c20542706b17592336b1a0e09a (for linux-nokia900-meego_git.bb.do_deploy and =
linux-gta04_git.bb.do_package_write)
Task dependency hash changed from e547a64f5b883431b63dcbcaa0ad1f30 to c3878=
9fba09937fbb2c2ba96b13fb2e8 (for linux-nokia900-meego_git.bb.do_package_wri=
te and linux-libc-headers_3.1.bb.do_package_write)
Task dependency hash changed from 7f72940519de5e7f16fe1ec5f7108df5 to bd358=
0a29e1922eacec0c798b009f8e9 (for systemd-serialgetty.bb.do_package_write an=
d systemd-serialgetty.bb.do_package_write)
Task dependency hash changed from bcf02bbe9d89f4dff8d3c7b289202fbb to 644a5=
cc5cd8e2a05716bd84f694d2511 (for systemd_git.bb.do_package_write and system=
d_git.bb.do_package_write)

or more simple case
$ bitbake-diffsigs tmp-eglibc/stamps/armv7a-vfp-neon-oe-linux-gnueabi/iptab=
les-1.4.12.2-r0.do_package_write_ipk.sigdata.6cc951872c73234753749ba739be97=
96 tmp-eglibc/stamps/armv7a-vfp-neon-oe-linux-gnueabi/iptables-1.4.12.2-r0.=
do_package_write_ipk.sigdata.7eb3867f1291db17de32fb142e8c9af2
Task dependency hash changed from 4d510f798d684afd0edaf8c15720e595 to ef18c=
fc890c39697919a7a6f2ae3e2cb (for linux-nokia900-meego_git.bb.do_package and=
 linux-gta04_git.bb.do_package)

So everything what somehow rdepends/reccomends on machine specific kernel s=
hould be also machine specific?
Or can we remove kernel dependency somehow to way that we want package mana=
ger to fill use RRECOMMENDS_${PN}
but we don't care (from sstate pov) how kernel was built. We already don't =
need such module to be built at all.

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--2Z2K0IlrPCVsbNpk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk89CE8ACgkQN1Ujt2V2gBwVwACfeRRGCHTaX/CU+1HuxiHShHkm
6QgAnjCXxFsHkPE6mKFg7rYKbH02WEey
=mhaZ
-----END PGP SIGNATURE-----

--2Z2K0IlrPCVsbNpk--
