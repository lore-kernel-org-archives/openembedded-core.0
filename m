Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RO7d8-00066B-R4
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Nov 2011 13:51:50 +0100
Received: by faat2 with SMTP id t2so1687475faa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Nov 2011 04:45:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=D58x1MYZ80zLlwQFwOMC6vMTEMgsvgLDAiVCVL8BRac=;
	b=WXRWBHm4xsp8sZWYf1TUWBIPU0MM83kgxbedMWxNb7Ac1Zr9enxdwQkHDoOktnbNBy
	dbaHBEjtWYHvxuBkOG/YWkf8by4hA89toTyViJwpYlfg3U6DGJij8W0rSFz+M87M9XBY
	4HjEfUTgjyzAD/TYtk+3vLAdiv8D+ePuXGwTk=
Received: by 10.223.57.132 with SMTP id c4mr4800018fah.0.1320842734379;
	Wed, 09 Nov 2011 04:45:34 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id i3sm6519353faf.0.2011.11.09.04.45.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 09 Nov 2011 04:45:33 -0800 (PST)
Date: Wed, 9 Nov 2011 13:45:21 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111109124521.GH3641@jama.jama.net>
References: <20111108143701.GC3641@jama.jama.net>
	<1320834738.10843.159.camel@ted>
	<20111109115126.GG3641@jama.jama.net>
	<1320840383.10843.173.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1320840383.10843.173.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: BB_SIGNATURE_HANDLER = "basichash" unusable strict?
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
X-List-Received-Date: Wed, 09 Nov 2011 12:51:51 -0000
X-Groupsio-MsgNum: 12210
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rCwQ2Y43eQY6RBgR"
Content-Disposition: inline

--rCwQ2Y43eQY6RBgR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 09, 2011 at 12:06:23PM +0000, Richard Purdie wrote:
> On Wed, 2011-11-09 at 12:51 +0100, Martin Jansa wrote:
> > I have talked with kergoth on IRC yesterday and he had very nice remark:
> >=20
> > 16:40:50 < kergoth_> JaMa: heh, the biggest weakness of the sstate
> > signature bits, in my opinion, is that it only tracks inputs, not
> > outputs. If task A depends on B, and the metadata input to B changes,
> > then A will be rebuilt, even if the *output* of B didn't change as a=20
> > result of the change to its metadata.
> >=20
> > And with this idea applied on those 2 changes I think that PR change in
> > libxml2 should of course invalidate checksum for=20
> > sstate-libxml2-native-x86_64-linux-2.7.8-r*populate-sysroot.tgz.siginfo
> > and probably wont hurt so much when neon-native is also rebuilt, but th=
en=20
> > if the output of neon build is the same with new sstate checksum as it =
was=20
> > with older one (I know it's hard to detect ie if some file in build has=
=20
> > "generation timestamp inside"), then we won't continue to rebuild
> > subversion, gcc, ... all (just because neon was rebuilt due to libxml2 =
PR=20
> > change which didn't influence neon output).
> >=20
> > The same with openssl PR change.. which can cause python-native rebuild,
> > but as long as python-native build output is "the same" we don't need to
> > rebuild everything which (even transitively) depends on python-native.
>=20
> In an ideal world it would be nice to track the output. I've never seen
> a proposal for how we could make this work in practise though. There are
> at least two big problems that spring to mind:
>=20
> a) How do you compare two sets of output and decide whether they're the
> same? Same list of files? Same contents? How to deal with timestamps?
>=20
> b) You can't know in advance that the output will or won't match and its
> near impossible to calculate any kind of checksum without having the
> output available to perform that calculation on. This breaks a lot of
> the way bitbake runs the builds and makes it hard to compare two
> configurations. Is A compatible with B? You'd have to build them both to
> find out.
>=20
> Whilst output tracking sounds nice, I think its trading one set of
> problems for another and in the end, I'm not sure its the perfect
> solution it might look like from our current position.

This could be completely silly idea and I don't have any tmpdir to check
it on real sstate data, but what if we extend

sstate-libxml2-native-x86_64-linux-2.7.8-r4-x86_64-2-85a14f7a73ea96fe85227c=
5a4bac3f1f_populate-sysroot.tgz.siginfo
to contain checksums for every file included in
sstate-libxml2-native-x86_64-linux-2.7.8-r4-x86_64-2-85a14f7a73ea96fe85227c=
5a4bac3f1f_populate-sysroot.tgz
maybe store them in new extra file like
sstate-libxml2-native-x86_64-linux-85a14f7a73ea96fe85227c5a4bac3f1f_populat=
e-sysroot.tgz.files.siginfo
and add only checksum of this file to oridinal siginfo file

And then when neon-native do_configure task is in runqueue because of:
Hash for dependent task virtual:native:/OE/shr-core/openembedded-core/meta/=
recipes-core/libxml/libxml2_2.7.8.bb.do_populate_sysroot
changed from 85a14f7a73ea96fe85227c5a4bac3f1f to f3bbb2f69cdef3ee60360fbbd6=
fab311

We'll compare
sstate-libxml2-native-x86_64-linux-85a14f7a73ea96fe85227c5a4bac3f1f_populat=
e-sysroot.tgz.files.siginfo
and
sstate-libxml2-native-x86_64-linux-f3bbb2f69cdef3ee60360fbbd6fab311_populat=
e-sysroot.tgz.files.siginfo
and if they're the same, we can skip neon-native.do_configure and all
followning tasks pulled to runqueue just because of libxml2-native PR
change.

I know this still has a lot of false positives, but we can whitelist
some files with something like filesdepsexclude (as vardepsexclude) so
that files matching some pattern won't be included in files.siginfo
because they contain ie build timestamp (in generated files) or they
change name without change of content (like
/usr/doc/share/foo-1.0/README could be the same as
/usr/doc/share/foo-1.1/README and it's not important for other packages
depending on foo).

What I fear is that change like this will force "rebuild almost from scratc=
h"
too often to finish build before another such change is pushed in some
layer (=3D> cannot do continual builds on current hw anymore)

Or that auto-PR-bump thing is going to use same checksum mechanism,=20
so even opkg upgrade will be slower then reflashing the device.

And my last thought yesterday was that it would be nice to be able to
disable sstate completely, to save some IO (generating sstate-cache and
siginfos) for people who know what they're doing (and can rebuild stuff
manually when needed), as with basic signature handler it doesn't reuse
sstate much in multimachine builds (when everything is built acording to=20
basic signature handler, but sstate checksums are already somewhere
else)
http://lists.linuxtogo.org/pipermail/openembedded-core/2011-November/012053=
=2Ehtml
and when it does reuse sstate package, it sometimes causes troubles
http://lists.linuxtogo.org/pipermail/openembedded-core/2011-November/012149=
=2Ehtml

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--rCwQ2Y43eQY6RBgR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk66deEACgkQN1Ujt2V2gBwjawCgrk5qruyUZ/7T1iyOjeEcR/yC
fk4An1CI3A6KfUnjjIjCD1J14xdb5Ge5
=f56y
-----END PGP SIGNATURE-----

--rCwQ2Y43eQY6RBgR--
