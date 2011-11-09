Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RO9Xr-0000uq-Pr
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Nov 2011 15:54:31 +0100
Received: by eyd9 with SMTP id 9so1511247eyd.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Nov 2011 06:48:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=UcwJTgZsvHQFbBGEIuiKYGDf5vWXSNjZlzKR96QCyAQ=;
	b=gJSZdIoW+lIsUbwfEP9Y299YKFoqj4r97PZ0ESQO6+G/RLEyHDJv7ptuK84AtvkaYv
	djBCYcv3PhgEV0mB2WHgV0fmzg6LUjReLmIO8fi9Yrcqw7II6A48Q5X4ayQlTaorQN/o
	8AwnHr4HoiJK0kBRmJsLzrxsFmILpSROGi7Cc=
Received: by 10.213.35.67 with SMTP id o3mr249887ebd.13.1320850095596;
	Wed, 09 Nov 2011 06:48:15 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 54sm14083109eex.8.2011.11.09.06.48.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 09 Nov 2011 06:48:14 -0800 (PST)
Date: Wed, 9 Nov 2011 15:48:02 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111109144802.GA21022@jama.jama.net>
References: <20111108143701.GC3641@jama.jama.net>
	<1320834738.10843.159.camel@ted>
	<20111109115126.GG3641@jama.jama.net>
	<1320840383.10843.173.camel@ted>
	<20111109124521.GH3641@jama.jama.net>
	<1320847986.10843.184.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1320847986.10843.184.camel@ted>
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
X-List-Received-Date: Wed, 09 Nov 2011 14:54:32 -0000
X-Groupsio-MsgNum: 12215
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2oS5YaxWCcQjTEyO"
Content-Disposition: inline

--2oS5YaxWCcQjTEyO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 09, 2011 at 02:13:06PM +0000, Richard Purdie wrote:
> On Wed, 2011-11-09 at 13:45 +0100, Martin Jansa wrote:
> > On Wed, Nov 09, 2011 at 12:06:23PM +0000, Richard Purdie wrote:
> > > On Wed, 2011-11-09 at 12:51 +0100, Martin Jansa wrote:
> > > > I have talked with kergoth on IRC yesterday and he had very nice re=
mark:
> > > >=20
> > > > 16:40:50 < kergoth_> JaMa: heh, the biggest weakness of the sstate
> > > > signature bits, in my opinion, is that it only tracks inputs, not
> > > > outputs. If task A depends on B, and the metadata input to B change=
s,
> > > > then A will be rebuilt, even if the *output* of B didn't change as =
a=20
> > > > result of the change to its metadata.
> > > >=20
> > > > And with this idea applied on those 2 changes I think that PR chang=
e in
> > > > libxml2 should of course invalidate checksum for=20
> > > > sstate-libxml2-native-x86_64-linux-2.7.8-r*populate-sysroot.tgz.sig=
info
> > > > and probably wont hurt so much when neon-native is also rebuilt, bu=
t then=20
> > > > if the output of neon build is the same with new sstate checksum as=
 it was=20
> > > > with older one (I know it's hard to detect ie if some file in build=
 has=20
> > > > "generation timestamp inside"), then we won't continue to rebuild
> > > > subversion, gcc, ... all (just because neon was rebuilt due to libx=
ml2 PR=20
> > > > change which didn't influence neon output).
> > > >=20
> > > > The same with openssl PR change.. which can cause python-native reb=
uild,
> > > > but as long as python-native build output is "the same" we don't ne=
ed to
> > > > rebuild everything which (even transitively) depends on python-nati=
ve.
> > >=20
> > > In an ideal world it would be nice to track the output. I've never se=
en
> > > a proposal for how we could make this work in practise though. There =
are
> > > at least two big problems that spring to mind:
> > >=20
> > > a) How do you compare two sets of output and decide whether they're t=
he
> > > same? Same list of files? Same contents? How to deal with timestamps?
> > >=20
> > > b) You can't know in advance that the output will or won't match and =
its
> > > near impossible to calculate any kind of checksum without having the
> > > output available to perform that calculation on. This breaks a lot of
> > > the way bitbake runs the builds and makes it hard to compare two
> > > configurations. Is A compatible with B? You'd have to build them both=
 to
> > > find out.
> > >=20
> > > Whilst output tracking sounds nice, I think its trading one set of
> > > problems for another and in the end, I'm not sure its the perfect
> > > solution it might look like from our current position.
> >=20
> > This could be completely silly idea and I don't have any tmpdir to check
> > it on real sstate data, but what if we extend
> >=20
> > sstate-libxml2-native-x86_64-linux-2.7.8-r4-x86_64-2-85a14f7a73ea96fe85=
227c5a4bac3f1f_populate-sysroot.tgz.siginfo
> > to contain checksums for every file included in
> > sstate-libxml2-native-x86_64-linux-2.7.8-r4-x86_64-2-85a14f7a73ea96fe85=
227c5a4bac3f1f_populate-sysroot.tgz
> > maybe store them in new extra file like
> > sstate-libxml2-native-x86_64-linux-85a14f7a73ea96fe85227c5a4bac3f1f_pop=
ulate-sysroot.tgz.files.siginfo
> > and add only checksum of this file to oridinal siginfo file
> >=20
> > And then when neon-native do_configure task is in runqueue because of:
> > Hash for dependent task virtual:native:/OE/shr-core/openembedded-core/m=
eta/recipes-core/libxml/libxml2_2.7.8.bb.do_populate_sysroot
> > changed from 85a14f7a73ea96fe85227c5a4bac3f1f to f3bbb2f69cdef3ee60360f=
bbd6fab311
> >=20
> > We'll compare
> > sstate-libxml2-native-x86_64-linux-85a14f7a73ea96fe85227c5a4bac3f1f_pop=
ulate-sysroot.tgz.files.siginfo
> > and
> > sstate-libxml2-native-x86_64-linux-f3bbb2f69cdef3ee60360fbbd6fab311_pop=
ulate-sysroot.tgz.files.siginfo
> > and if they're the same, we can skip neon-native.do_configure and all
> > followning tasks pulled to runqueue just because of libxml2-native PR
> > change.
>=20
> Two problems spring to mind to start with:
>=20
> a) bitbake could have to checksum the .tgz file each time it runs (yes
> we can add caches and so on but we've tried to be clever to avoid
> needing to md5sum data we don't already have)

checksum for whole .tgz is easy, but is tgz.files.siginfo would be
checksum per file (except excluded files), so it would be IMHO easier to st=
ore
it when we have all required metadata (from time of .tgz creation) then
on each time it runs.

> b) I can't calculate in advance what the checksum of a given task should
> be without executing the task itself and generating the output files to
> checksum. This means remote sstate packages become effectively useless.

That's why I think that we have to build neon-native (after
libxml2-native change) to see that libxml2 change was contained in
libxml2 and doesn't influence neon-native output (and then of course=20
everything after neon-native).

But it would build only 1 extra step (maybe unneeded) and then stop. And
sstate-cache dir will have neon-native siginfo and tgz.files.siginfo for
remote builder to find that even with different hash those 2 neon-native
populate-sysroot.tgz are compatible.

> > I know this still has a lot of false positives, but we can whitelist
> > some files with something like filesdepsexclude (as vardepsexclude) so
> > that files matching some pattern won't be included in files.siginfo
> > because they contain ie build timestamp (in generated files) or they
> > change name without change of content (like
> > /usr/doc/share/foo-1.0/README could be the same as
> > /usr/doc/share/foo-1.1/README and it's not important for other packages
> > depending on foo).
>=20
> I suspect this logic is going to get very difficult to write
> maintain :(.

Yes it would need more experiments to see how often we have different
sstate tgz with 100% same content (and this change would solve those
without extra filesdepsexclude) and how often we can add simple rule for
all recipes (maybe whole /usr/doc/share/ can be ignored for
populate-sysroot or vice-versa and rebuild everything depending on foo
when there is this only change /usr/doc/share/foo-1.[01], because we'll
know that this rebuild spree will end again only 1 step after foo in
dependency-tree.

> > What I fear is that change like this will force "rebuild almost from sc=
ratch"
> > too often to finish build before another such change is pushed in some
> > layer (=3D> cannot do continual builds on current hw anymore)
> >=20
> > Or that auto-PR-bump thing is going to use same checksum mechanism,=20
> > so even opkg upgrade will be slower then reflashing the device.
> >=20
> > And my last thought yesterday was that it would be nice to be able to
> > disable sstate completely, to save some IO (generating sstate-cache and
> > siginfos) for people who know what they're doing (and can rebuild stuff
> > manually when needed), as with basic signature handler it doesn't reuse
> > sstate much in multimachine builds (when everything is built acording t=
o=20
> > basic signature handler, but sstate checksums are already somewhere
> > else)
> > http://lists.linuxtogo.org/pipermail/openembedded-core/2011-November/01=
2053.html
> > and when it does reuse sstate package, it sometimes causes troubles
> > http://lists.linuxtogo.org/pipermail/openembedded-core/2011-November/01=
2149.html
>=20
> We can customise the siggen code to do whatever we think is appropriate,
> including just permanently just generate the same hash value with no
> computation, effectively disabling 99.9% of the code/overhead.

This is only about disabling it, right? For python issue it should be
handled by something like
SSTATEPOSTINSTFUNCS used in dbus lately to replace all sysroot specific
paths with right value for current machine or is it better to include
MACHINE in vardeps (this time only for python-native) to make sure that
Makefile has right sysroot? Which won't help users ie with different TMPDIR
(like I did by removing TCLIBCAPPEND =3D "" and expecting sstate to
populate it properly on new localtion).

> I think there are ways to solve the problems and we will find a solution
> that works the majority of the time but until people start thinking
> about and using the code, its not going to happen. Its nice to see
> people starting to think about this though :)

I'm sorry to be so pesimistic about it, I was just sad when I've found
out that it's not configuration problem on my side and that it does what
it's expected to do (and that's something else then what I expected).

Maybe per-recipe staging and package-based build-time dependencies would
make it easier. I'm glad you're also evaluating such options (as last
TSC meeting show).

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--2oS5YaxWCcQjTEyO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk66kqIACgkQN1Ujt2V2gBx6BACgtI4M/5m4BSEwpYhSxfdU/y6z
kmAAni2kk98CPa0VHZjha2pBZ0O5hB4b
=esbJ
-----END PGP SIGNATURE-----

--2oS5YaxWCcQjTEyO--
