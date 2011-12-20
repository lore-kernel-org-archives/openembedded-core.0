Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Rcvn1-00069h-GB
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Dec 2011 10:15:15 +0100
Received: by eeit10 with SMTP id t10so2377644eei.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Dec 2011 01:08:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=o8e8uQN4Wn1eVUjP5ym0IWZigfKamTyq+aW4BuJIOkI=;
	b=qGMrvA6T0M35gHerA+zoEW/j9+jgy75QrS4dcgRfjDgO/tycWt22H359iNC6KflPbf
	dalWyGiDF8HsRy2PVNm6quJgCUsgSh6LGWJZeYCNmVlqcpNd90reZ47zQTGSVLaaeLbI
	COgRYkMr/J04nttk9HeOUJT5NVXZtu+iUgBTM=
Received: by 10.14.16.77 with SMTP id g53mr609736eeg.19.1324372091070;
	Tue, 20 Dec 2011 01:08:11 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id t1sm4322684eeb.3.2011.12.20.01.08.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 20 Dec 2011 01:08:09 -0800 (PST)
Date: Tue, 20 Dec 2011 10:07:56 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111220090753.GC3946@jama.jama.net>
References: <1323851280-6342-1-git-send-email-raj.khem@gmail.com>
	<1323856946.25491.31.camel@ted>
	<CAMKF1sqLHP1cWfBswrqnwhAPj4Tt3XCV8GpQv7Dm71PX3F=rAw@mail.gmail.com>
	<1323951419.4568.17.camel@ted>
	<20111216212424.GA28832@sakrah.homelinux.org>
MIME-Version: 1.0
In-Reply-To: <20111216212424.GA28832@sakrah.homelinux.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] gcc-4.6: Let G++ relocate gxx-include-dir when using --sysroot option
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
X-List-Received-Date: Tue, 20 Dec 2011 09:15:16 -0000
X-Groupsio-MsgNum: 14511
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gr/z0/N6AeWAPJVB"
Content-Disposition: inline

--gr/z0/N6AeWAPJVB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 16, 2011 at 01:24:24PM -0800, Khem Raj wrote:
> On (15/12/11 12:16), Richard Purdie wrote:
> > On Wed, 2011-12-14 at 07:49 -0800, Khem Raj wrote:
> > > On Wed, Dec 14, 2011 at 2:02 AM, Richard Purdie
> > > <richard.purdie@linuxfoundation.org> wrote:
> > > > Hi Khem,
> > > >
> > > > What's puzzling me is that reading through this patch, we already do
> > > > what this patch is doing?
> > > >
> > > > Where is the difference which this patch is fixing?
> > > >
> > >=20
> > > this does essentially what we were doing earlier but this one is going
> > > to go upstream
> >=20
> > Yes, that is good and I'm fine with the patch for that reason.
>=20
> there is additional detail that this patch does which is that in order
> to make gxx-includes to be sysroot relative --with-cxx-include option to
> be also specified relative to initials sysroot during configure time
>=20
> e.g. --with-sysroot=3DSYSROOT --with-gxx-include-dir=3DSYSROOT/usr/includ=
e/c++
>=20
> since the original behavior of --with-gxx-include-dir is to specify an
> absolute path that is preserved whereas the patch we have in OE relocates
> gxx-include-dir regardless.Therefore in order to adopt this patch we have
> to use the above syntax which was original syntax before the above patch
> and would make up forward compatible provided this patch makes into gcc
> upstream.
>=20
> >=20
> > >=20
> > > > I appreciate that patch adds in the prefix to the --with-gxx-includ=
e-dir
> > > > option but it then removes it again during configure so this should=
 be a
> > > > null op. Both versions of the patch set the "1" bit in gcc/cppdefau=
lt.c.
> > > >
> > > > So where is the change this patch makes which fixes things?
> > >=20
> > > changing --with-gxx-include-dir to be within sysroot triggers the
> > > relocation code.
> >=20
> > But we were already triggering the relocation code?
> >=20
> > I can't see *any* functionality difference between these, they should
> > both just give the same result as far as I can tell...
> >=20
> same functionality but with a different usage see above
>=20
> > Claiming it fixes things is therefore concerning me.
>=20
> correct it does not fix anything actually that I know was broken before
> Thinking out loud given that with-gxx-include-dir is absolute in nature i=
t could be
> the original patch we have, does not work in some weird case since the
> absolute path we use is still /usr/include/c++ during configure time.
> although I would expect that the include poisoning warning will report it=
 if that
> happened
>=20
> -Khem

Is there some pending patch for meta-oe/gcc?

I have some issues while rebuilding toolchain from scratch after this
patchset:

armv7a:
| /OE/shr-core/tmp-eglibc/work-shared/gcc-4.6.2+svnr181430-r23/gcc-4_6-bran=
ch/gcc/rtl.h:2163:12: note: expected 'enum machine_mode' but argument is of=
 type 'int'
| gcc -c   -isystem/OE/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-strings =
-Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -Wmissing-format-attri=
bute -pedantic -Wno-long-long -Wno-variadic-macros -Wno-overlength-strings =
-Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -I. -I. -I/OE/shr-cor=
e/tmp-eglibc/work-shared/gcc-4.6.2+svnr181430-r23/gcc-4_6-branch/gcc -I/OE/=
shr-core/tmp-eglibc/work-shared/gcc-4.6.2+svnr181430-r23/gcc-4_6-branch/gcc=
/. -I/OE/shr-core/tmp-eglibc/work-shared/gcc-4.6.2+svnr181430-r23/gcc-4_6-b=
ranch/gcc/../include -I/OE/shr-core/tmp-eglibc/work-shared/gcc-4.6.2+svnr18=
1430-r23/gcc-4_6-branch/gcc/../libcpp/include  -I/OE/shr-core/tmp-eglibc/wo=
rk-shared/gcc-4.6.2+svnr181430-r23/gcc-4_6-branch/gcc/../libdecnumber -I/OE=
/shr-core/tmp-eglibc/work-shared/gcc-4.6.2+svnr181430-r23/gcc-4_6-branch/gc=
c/../libdecnumber/dpd -I../libdecnumber    /OE/shr-core/tmp-eglibc/work-sha=
red/gcc-4.6.2+svnr181430-r23/gcc-4_6-branch/gcc/calls.c -o calls.o
| /OE/shr-core/tmp-eglibc/work-shared/gcc-4.6.2+svnr181430-r23/gcc-4_6-bran=
ch/gcc/calls.c: In function 'initialize_argument_information':
| /OE/shr-core/tmp-eglibc/work-shared/gcc-4.6.2+svnr181430-r23/gcc-4_6-bran=
ch/gcc/calls.c:1089:9: error: 'STACK_CHECK_MAX_VAR_SIZE' undeclared (first =
use in this function)
| /OE/shr-core/tmp-eglibc/work-shared/gcc-4.6.2+svnr181430-r23/gcc-4_6-bran=
ch/gcc/calls.c:1089:9: note: each undeclared identifier is reported only on=
ce for each function it appears in
| make[2]: *** [calls.o] Error 1

armv4t:
| gcc -c   -isystem/OE/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-strings =
-Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -Wmissing-format-attri=
bute -pedantic -Wno-long-long -Wno-variadic-macros -Wno-overlength-strings =
-Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -I. -I. -I/OE/shr-cor=
e/tmp-eglibc/work-shared/gcc-4.6.2+svnr181430-r23/gcc-4_6-branch/gcc -I/OE/=
shr-core/tmp-eglibc/work-shared/gcc-4.6.2+svnr181430-r23/gcc-4_6-branch/gcc=
/. -I/OE/shr-core/tmp-eglibc/work-shared/gcc-4.6.2+svnr181430-r23/gcc-4_6-b=
ranch/gcc/../include -I/OE/shr-core/tmp-eglibc/work-shared/gcc-4.6.2+svnr18=
1430-r23/gcc-4_6-branch/gcc/../libcpp/include  -I/OE/shr-core/tmp-eglibc/wo=
rk-shared/gcc-4.6.2+svnr181430-r23/gcc-4_6-branch/gcc/../libdecnumber -I/OE=
/shr-core/tmp-eglibc/work-shared/gcc-4.6.2+svnr181430-r23/gcc-4_6-branch/gc=
c/../libdecnumber/dpd -I../libdecnumber    insn-output.c -o insn-output.o
| In file included from insn-emit.c:23:0:
| /OE/shr-core/tmp-eglibc/work-shared/gcc-4.6.2+svnr181430-r23/gcc-4_6-bran=
ch/gcc/config/arm/constraints.md: In function 'satisfies_constraint_Uu':
| /OE/shr-core/tmp-eglibc/work-shared/gcc-4.6.2+svnr181430-r23/gcc-4_6-bran=
ch/gcc/config/arm/constraints.md:353:6: warning: implicit declaration of fu=
nction 'thumb1_legitimate_address_p' [-Wimplicit-function-declaration]
| insn-opinit.c: In function 'init_all_optabs':
| insn-opinit.c:25:5: warning: implicit declaration of function 'set_wideni=
ng_optab_handler' [-Wimplicit-function-declaration]
| insn-opinit.c:30:7: error: 'TARGET_IDIV' undeclared (first use in this fu=
nction)
| insn-opinit.c:30:7: note: each undeclared identifier is reported only onc=
e for each function it appears in
| insn-opinit.c:813:32: error: 'vec_load_lanes_optab' undeclared (first use=
 in this function)
| insn-opinit.c:833:32: error: 'vec_store_lanes_optab' undeclared (first us=
e in this function)
| insn-opinit.c:1009:24: error: 'vec_widen_sshiftl_lo_optab' undeclared (fi=
rst use in this function)
| insn-opinit.c:1011:24: error: 'vec_widen_ushiftl_lo_optab' undeclared (fi=
rst use in this function)
| insn-opinit.c:1021:24: error: 'vec_widen_sshiftl_hi_optab' undeclared (fi=
rst use in this function)
| insn-opinit.c:1023:24: error: 'vec_widen_ushiftl_hi_optab' undeclared (fi=
rst use in this function)
| make[2]: *** [insn-opinit.o] Error 1
| make[2]: *** Waiting for unfinished jobs....

Cheers,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--gr/z0/N6AeWAPJVB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk7wUGkACgkQN1Ujt2V2gBzYJQCgjx6kYw6Nava5G983DaKrb5dN
0n8AniExiY5JTSThnXp5aEisY6It2I54
=tls6
-----END PGP SIGNATURE-----

--gr/z0/N6AeWAPJVB--
