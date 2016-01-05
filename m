Return-Path: <mschiffer@universe-factory.net>
Received: from chaos.universe-factory.net (chaos.universe-factory.net
	[37.72.148.22])
	by mail.openembedded.org (Postfix) with ESMTP id 93DD16FF9D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jan 2016 01:26:14 +0000 (UTC)
Received: from [IPv6:fd1b:c28a:2fd6::2] (unknown [IPv6:fd1b:c28a:2fd6::2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by chaos.universe-factory.net (Postfix) with ESMTPSA id 0BCA11814FD;
	Tue,  5 Jan 2016 02:26:13 +0100 (CET)
To: Mark Hatle <mark.hatle@windriver.com>
References: <cover.1451912446.git.ian.ray@ge.com>
	<4e736dcbaf5c32f9d7728990ad4ac0ca975dfd6d.1451912446.git.ian.ray@ge.com>
	<568A99CD.9000800@universe-factory.net>
	<568A9E97.2050909@windriver.com>
	<568AF189.5010801@universe-factory.net>
	<568AF894.1010405@windriver.com>
	<568B06D3.7030205@universe-factory.net>
	<568B0E13.6090108@windriver.com>
From: Matthias Schiffer <mschiffer@universe-factory.net>
X-Enigmail-Draft-Status: N1110
Message-ID: <568B1BB5.7060303@universe-factory.net>
Date: Tue, 5 Jan 2016 02:26:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.0
MIME-Version: 1.0
In-Reply-To: <568B0E13.6090108@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] linux-firmware: remove hard-coded paths
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Jan 2016 01:26:15 -0000
X-Groupsio-MsgNum: 75412
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="8qCQkK2frf4LCwAU1MgbsFnCP545jIPXr"

--8qCQkK2frf4LCwAU1MgbsFnCP545jIPXr
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 01/05/2016 01:28 AM, Mark Hatle wrote:
> On 1/4/16 5:57 PM, Matthias Schiffer wrote:
>> On 01/04/2016 11:56 PM, Mark Hatle wrote:
>>> On 1/4/16 4:26 PM, Matthias Schiffer wrote:
>>>> On 01/04/2016 05:32 PM, Mark Hatle wrote:
>>>>> On 1/4/16 10:11 AM, Matthias Schiffer wrote:
>>>>>> On 01/04/2016 02:14 PM, Ian Ray wrote:
>>>>>>> The recipe uses hard-coded paths (specifically /lib) in do_instal=
l
>>>>>>> and in FILES, however on a merged /usr system this directory migh=
t
>>>>>>> not exist. Prefer base_libdir.
>>>>>>>
>>>>>>> Signed-off-by: Ian Ray <ian.ray@ge.com>
>>>>>>> ---
>>>>>>
>>>>>> This should use nonarch_base_libdir, base_libdir defaults to /lib6=
4 on
>>>>>> ppc64, which is not where the firmware is expected.
>>>>>>
>>>>>
>>>>> At a minimum, I would agree nonarch_base_libdir, however..
>>>>>
>>>>> I believe that the kernel loader/modules/tools themselves actually =
have '/lib'
>>>>> hard coded into them.  This is the reason why /lib/firmware was use=
d and not one
>>>>> of the variables.
>>>>>
>>>>> This is one of the cases were /lib is actually correct, since that =
is what the
>>>>> system is expecting.  We can make some kind of accommodation for sy=
stems where
>>>>> /lib -> /usr/lib... but that should be done inside of the filesyste=
m setup
>>>>> processing and not the package itself.  (I'm referring to the
>>>>> 'meta/files/fs-perms.txt' file.
>>>>>
>>>>> --Mark
>>>>>
>>>>
>>>> There seem to be some intresting ideas going around about what can o=
r
>>>> should be done via fs-perms.txt... AFAICT, fs-perms.txt can't move
>>>> around files, so moving files form /lib to /usr/lib must be done in =
the
>>>> package recipes themselves. (In my opinion, fs-perms.txt is a bad ha=
ck
>>>> for broken recipes that shouldn't exist anyways, but that's another
>>>> discussion)
>>>
>>> Since I wrote fs-perms.txt, I'll explain the purpose.  Individual pac=
kages don't
>>> know if something is a directory, symbolic link, or what owner/group/=
permissions
>>> a system level directory should be set to.
>>>
>>> The entire purpose of it is to declare a common set of -system- direc=
tories.
>>> (Packages/layers can amend and override this as necessary to add thei=
r own
>>> system directories.)
>>>
>>> FYI System directories are things like /usr/bin.  Having every packag=
e in the
>>> system need to define /usr/bin as a directory with an owner/group of =
root:root
>>> and permission of 0755 is a REALLY bad practice.. but putting this kn=
owledge
>>> into a single file that synchronizes everything is very practical.
>>>
>>> When the system level directories are mapped to symlinks.. the case w=
here
>>> everyone is trying to folks /usr -> / or /bin -> /usr/bin.. then it c=
an
>>> AUTOMATICALLY map and move the files in these places..
>>
>> Thanks for the explanation, I asked a similar question a few weeks ago=

>> and didn't get a satisfactory answer about what fs-perms can do. I'll
>> rethink my approach for the merged-usr patchset.
>=20
> (I've been out since near the beginning of December, but I'm back now..=
)
>=20
>> So the remaining issue is how to conditionalize this. I'd like to find=
 a
>> solution which doesn't require distros to define their own fs-perms wh=
en
>> they just want to use a merged /usr dir.
>=20
> You conditionalize it by providing different default fs-perms files -- =
OR since
> more then one file can be loaded -- additional fs-perms with the permut=
ations
> you desire.
>=20
> I could easily see having an files/fs-perms-usr-only.txt and an
> files/fs-perms-no-usr.txt
>=20
> Where the first would be something like:
>=20
> # Define symlinks from base directories to their prefix versions
> /bin	link ${bindir}
> /sbin	link ${sbindir}
> ...
>=20
> fs-perms-no-user would be:
>=20
> # Define that $prefix as simply pointing back to root for compatibility=

> /usr	link /
>=20
>=20
> Then in your distro.conf file:
>=20
> FILESYSTEM_PERMS_TABLES =3D "files/fs-perms.txt"
> FILESYSTEM_PERMS_TABLES_append_usronly =3D " files/fs-perms-usr-only.tx=
t"
> FILESYSTEM_PERMS_TABLES_append_nousr =3D " files/fs-perms-no-user.txt"
>=20
>=20
> The above will cause packages to produce the symlinks ONLY if the packa=
ge itself
> creates a matching directory.  If the package is moving all of it's fil=
es to the
> new configured location (from the distro.conf file) then no link is pre=
sent.
>=20
> Assuming you want the links, I would add some kind of a change or confi=
guration
> to the base-files to do this.
>=20
> (I did argue in the past, unsuccessfully, that base-files or something =
it calls
> should process the fs-perms files and simply generate a base configurat=
ion based
> on this setup.  Ensuring symlinks and final directories were always cre=
ated..
> but that was rejected at the time..)

I see. Do you think it would make sense to provide a fs-perms snippet in
oe-core for the Fedora-style merged-usr setup?

>=20
>>>
>>>> I think if a distro config changes any of the base paths
>>>> ({nonarch_,}base_libdir, base_{,s}bindir), *all* packages should res=
pect
>>>> this. It's the distro's reponsiblity to create symlinks so everythin=
g is
>>>> found again at the expected paths (other examples for such hardcoded=

>>>> paths: /bin/sh; the dynamic linker). See also my patchset I submitte=
d to
>>>> this mailing list, which introduces a distro feature to have such
>>>> symlinks created by base-files.
>>>
>>> When this was written it was heavily argued against this knowledge be=
ing in
>>> base-files or base-dirs (suggested at the time) packages.
>>
>> Is that discussion archived somewhere? I'm interested in the
>> argumentation. Do any non-OE distros have a similar feature?
>=20
> This would have been discussed back in the original oe-core days.  Like=
ly around
> 2010 on the oe-core list....

Okay, I've found at least some fragments of the discussion.

>=20
>>>
>>> Defining a base setup, and then using a synchronization pass using th=
e
>>> fs-perms.txt was the way to go.
>>>
>>> Note, fs-perms process is absolutely supposed to move files around -i=
f- a
>>> symlink is generated.. i.e.:
>>>
>>> /lib -> /usr/lib
>>>
>>> if you write to /lib/firmware, the code is supposed to see the direct=
ory of
>>> '/lib', create a new /usr/lib (set perms properly) and move the conte=
nts if /lib
>>> to /usr/lib, then replace the directory with a symbolic link.
>>>
>>> If it's NOT doing that, lets fix it.
>>
>> I didn't try yet as I didn't now that it is supposed to to that.
>=20
> This is a good example where the upstream software is always going to u=
se
> '/lib', but you want it to go somewhere else.  Without this fs-perms me=
chanism,
> you would need to patch this package and potentially others.  But by us=
ing
> fs-perms, they can continue to rely on their special knowledge of '/lib=
', and
> the system will fix it up before packaging to where the distribution ac=
tually
> wants the files.
>=20

I guess I'm fine with fs-perms.txt fixing permissions and owners, but
moving around files goes a bit too far in my opinion. Doing so will
potentially break relative symlinks and other relative paths used by
packages. I'd have implemented the "link" feature as a QA-only thing:
make the build fail if there are any files where a symlink is supposed
to go, but don't try to fix it up.

Another (more easily fixable) issue is that the automagic renaming
doesn't work if the target dir already exists (if I understand the code
correctly). So fixing up a package containing both files in /bin and
/usr/bin, where /bin is supposed to link to /usr/bin, will fail.

Matthias



--8qCQkK2frf4LCwAU1MgbsFnCP545jIPXr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCgAGBQJWixu1AAoJEBbvP2TLIB2cOfIP/1luXnbqFGmR0+QN0dUIvjaj
pZmvdZANDRhoTYxFFCpLEmbYfsSbEkpAEU28AUqJmoKfXX5WWk54FwEqBSs9Pec8
s3yh0cVlbPK4Ph3NndLoLSx8b1xZMbdavxR6047h7HiBOfCv73jOvYJkQqU7+tue
JA0tot9BTHRSs0bwnzqAWm0mGwnwDDDq6ppk1IVM4jtlFQEhAtlEK9vS1VU/BpwI
aylpR8X5e4EzR1R98Xe1Izkh+us/VSMx6aY17gNH621GEKwKy2ThzCq3e+IcThPR
ouYf8bhWAaxCdgdRXmt1GWxBmNE0mBgjW59fVs2ARrh/CMJ6DvshSTrXoiWVh5Va
xkf1DM4NpGSYSNvELrBshPoqdFj/TXDY0dhCU9yVAKzJySd/+dp99T08C1OM881t
0u+rWiOeWO3b/dHpXs9Cc0SLT6OvRAO9kCwGzcs+fu0brv57+qGfJjw+AnxGadKM
SvyqNpMLG1wisWoQ5CrGyuQUnktKliEVmCvQ0iz0G+jOk5wIPZmVrhXrekYzLvIu
/JleLICFf+3sKV+3dL4FN85mv6RmX1q8J0H1i+DHSXjpZnhI9G4siZBBFZbsnuh6
KnRD9mT88XXCWtxN1MZujQFifo47x4GGrKHmttFWwz3Q/1IFIyJci0Lf4jCmgNOj
C602JGu90pyTKmIY0WkD
=ebD9
-----END PGP SIGNATURE-----

--8qCQkK2frf4LCwAU1MgbsFnCP545jIPXr--
