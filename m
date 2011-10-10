Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RDH4t-0001Ro-J9
	for openembedded-core@lists.openembedded.org;
	Mon, 10 Oct 2011 16:43:39 +0200
Received: by ggnq1 with SMTP id q1so4539167ggn.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Oct 2011 07:37:58 -0700 (PDT)
Received: by 10.223.7.14 with SMTP id b14mr6953344fab.10.1318257478301;
	Mon, 10 Oct 2011 07:37:58 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id o22sm31939540fab.11.2011.10.10.07.37.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 10 Oct 2011 07:37:57 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1318256216.23801.37.camel@ted>
Date: Mon, 10 Oct 2011 16:37:51 +0200
Message-Id: <20848535-6A4E-47B5-9F7D-E96F00402867@dominion.thruhere.net>
References: <1317910796.6398.86.camel@ted>
	<37FC7DDC-D175-45B4-AF8A-F4D5AF384750@dominion.thruhere.net>
	<20111009181016.GB3847@jama.jama.net>
	<9CD7A2A3-228F-46AE-AE56-5D73C9372E4A@dominion.thruhere.net>
	<20111010114506.GC5065@jama.jama.net>
	<1318256216.23801.37.camel@ted>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Subject: Re: sstate.bbclass: Ensure machine specific stamps are only wiped for the current task
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
X-List-Received-Date: Mon, 10 Oct 2011 14:43:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 10 okt. 2011, om 16:16 heeft Richard Purdie het volgende geschreven:

> On Mon, 2011-10-10 at 13:45 +0200, Martin Jansa wrote:
>> On Sun, Oct 09, 2011 at 08:11:45PM +0200, Koen Kooi wrote:
>>>=20
>>> Op 9 okt. 2011, om 20:10 heeft Martin Jansa het volgende geschreven:
>>>=20
>>>> On Sun, Oct 09, 2011 at 01:25:09PM +0200, Koen Kooi wrote:
>>>>>=20
>>>>> Op 6 okt. 2011, om 16:19 heeft Richard Purdie het volgende =
geschreven:
>>>>>=20
>>>>>> sstate was being a little too ethusiastic about removing stamp =
files and
>>>>>> was removing stamp files for other machines when it shouldn't =
have been.
>>>>>>=20
>>>>>> This patch teaches sstate about machine specific stamp extensions =
and
>>>>>> allows it to only remove the current task's stampfiles.
>>>>>=20
>>>>> Not sure if it's related to this problem or not but sstate is =
still not working as intented for me when switching machines, it keeps =
rebuilding the toolchain when switching machine. What I did this =
morning:
>>>>>=20
>>>>> 1) wipe out tmp, sstate-cache, pseudodone
>>>>> 2) MACHINE=3Dbeagleboard bitbake u-boot
>>>>> 3) cp conf/machine/beagleboard.conf conf/machine/brokensstate.conf
>>>>> 4) MACHINE=3Dbrokensstate bitbake u-boot
>>>>=20
>>>> Same here.. :/ (building 3 armv7 machines.. always "from scratch").
>>>=20
>>> To eliminate varables: Angstrom/shr/aurora/micro/other/all of the =
above?
>>=20
>> DISTRO=3Dshr
>>=20
>> MACHINE=3Dnokia900 bitbake shr-image -> builds from scratch, finished =
ok
>> MACHINE=3Dpalmpre bitbake shr-image -> builds from scratch, finished =
ok
>> MACHINE=3Dpalmpre2 bitbake shr-image -> builds from scratch, finished =
ok
>>=20
>> without wiping anything (same tmp, same sstate-cache, same =
pseudodone)
>>=20
>> MACHINE=3Dpalmpre bitbake shr-image -> builds from scratch, again!, =
finished ok
>> MACHINE=3Dpalmpre2 bitbake shr-image -> builds from scratch, again!, =
finished ok
>> MACHINE=3Dnokia900 bitbake shr-image -> builds from scratch, again!, =
finished ok
>>=20
>> palmpre and palmpre2 are "the same"
>> $ cat meta-smartphone/meta-palm/conf/machine/palmpre.conf | grep -v =
^#
>> require conf/machine/include/palmpre.inc
>>=20
>> $ cat meta-smartphone/meta-palm/conf/machine/palmpre2.conf | grep -v =
^#
>> require conf/machine/include/palmpre.inc
>>=20
>> nokia900 is also armv7a-vfp-neon (that's why all packages except
>> MACHINE_ARCH were always reused without rebuilding in OE-classic).
>>=20
>> I have tried to debug sigdata files to see why and also tried to add
>> MACHINEOVERRIDES[vardepsexclude] =3D "MACHINE"
>> as RP suggested, but sofar haven't found solution at least to reuse
>> already built sstate packages for armv7a-vfp-neon.
>=20
> Also as a tip for debugging this, you can do what is in the following
> commit (patch also inline below):
>=20
> =
http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=3Drpurdie/wip9=
&id=3D1261cc69b152f33b934c2448020dfa3c95f312c6
>=20
> which will mean bitbake -n generates stamp files for a given bitbake
> run. You can then quickly do:
>=20
> MACHINE=3DA bitbake -n foo
> MACHINE=3DB bitbake -n foo
>=20
> for example and then look for cases where two stamp sigdata files were
> generated. If you see them you can "bitbake-diffsigs A B" and I'll be
> very interested in the results of that and "bitbake-diffsigs A"...
>=20
> Cheers,
>=20
> Richard
>=20
> bitbake: Allow easier dry run stamp debugging
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> diff --git a/bitbake/lib/bb/build.py b/bitbake/lib/bb/build.py

This seems to be against poky instead of bitbake and doesn't apply =
against bitbake master:

koen@dominion:/OE/tentacle/sources/bitbake$ patch -p2 < dry=20
patching file lib/bb/build.py
Hunk #1 succeeded at 257 (offset 2 lines).
Hunk #2 succeeded at 319 (offset 2 lines).
Hunk #3 succeeded at 360 (offset 2 lines).
patching file lib/bb/runqueue.py
Hunk #1 FAILED at 1156.
1 out of 1 hunk FAILED -- saving rejects to file lib/bb/runqueue.py.rej



