Return-Path: <mschiffer@universe-factory.net>
Received: from chaos.universe-factory.net (chaos.universe-factory.net
	[37.72.148.22])
	by mail.openembedded.org (Postfix) with ESMTP id 6B295731EC
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Jan 2016 17:13:05 +0000 (UTC)
Received: from [IPv6:fd1b:c28a:2fd6::2] (unknown [IPv6:fd1b:c28a:2fd6::2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by chaos.universe-factory.net (Postfix) with ESMTPSA id 9BE16181537;
	Sun, 10 Jan 2016 18:13:04 +0100 (CET)
To: Mark Hatle <mark.hatle@windriver.com>
References: <c00e9825d8e0221666adffd95ed157f9affe06b8.1451778497.git.mschiffer@universe-factory.net>
	<f8b6e0a67be1bede97cded62d1ee42aae8b8977b.1451778497.git.mschiffer@universe-factory.net>
	<568AF96A.50302@windriver.com> <568B0443.5090407@universe-factory.net>
	<568B0B5D.8000209@windriver.com>
From: Matthias Schiffer <mschiffer@universe-factory.net>
X-Enigmail-Draft-Status: N1110
Message-ID: <5692911F.1050601@universe-factory.net>
Date: Sun, 10 Jan 2016 18:13:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <568B0B5D.8000209@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 2/3] base-files: create ${base_bindir} etc. instead of /bin, /sbin and /lib
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
X-List-Received-Date: Sun, 10 Jan 2016 17:13:06 -0000
X-Groupsio-MsgNum: 75786
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="qdLWS3Ss9FiV0aLFN8d3hQx8gjaJljax0"

--qdLWS3Ss9FiV0aLFN8d3hQx8gjaJljax0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 01/05/2016 01:16 AM, Mark Hatle wrote:
> On 1/4/16 5:46 PM, Matthias Schiffer wrote:
>> On 01/04/2016 11:59 PM, Mark Hatle wrote:
>>> On 1/2/16 5:53 PM, Matthias Schiffer wrote:
>>>> These directories conflict with the symlinks created for merged-usr =
setups.
>>>>
>>>> Signed-off-by: Matthias Schiffer <mschiffer@universe-factory.net>
>>>> ---
>>>> v2: create both ${base_libdir} and ${nonarch_base_libdir}
>>>>
>>>>  meta/recipes-core/base-files/base-files_3.0.14.bb | 4 ++--
>>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/met=
a/recipes-core/base-files/base-files_3.0.14.bb
>>>> index b71d5c5..2af7ecd 100644
>>>> --- a/meta/recipes-core/base-files/base-files_3.0.14.bb
>>>> +++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
>>>> @@ -33,8 +33,8 @@ INHIBIT_DEFAULT_DEPS =3D "1"
>>>>  docdir_append =3D "/${P}"
>>>>  dirs1777 =3D "/tmp ${localstatedir}/volatile/tmp"
>>>>  dirs2775 =3D ""
>>>> -dirs755 =3D "/bin /boot /dev ${sysconfdir} ${sysconfdir}/default \
>>>> -           ${sysconfdir}/skel /lib /mnt /proc ${ROOT_HOME} /run /sb=
in \
>>>> +dirs755 =3D "${base_bindir} /boot /dev ${sysconfdir} ${sysconfdir}/=
default \
>>>> +           ${sysconfdir}/skel ${base_libdir} ${nonarch_base_libdir}=
 /mnt /proc ${ROOT_HOME} /run ${base_sbindir} \
>>>>             ${prefix} ${bindir} ${docdir} /usr/games ${includedir} \=

>>>>             ${libdir} ${sbindir} ${datadir} \
>>>>             ${datadir}/common-licenses ${datadir}/dict ${infodir} \
>>>>
>>>
>>> I agree this new set looks correct.. but I'd like to see the correspo=
nding
>>> change to fs-perms that sets the permissions and such for each of the=
se new
>>> locations.
>>>
>>> --Mark
>>>
>>
>> The current meta/files/fs-perms.txt doesn't mention any of /bin, /sbin=

>> or /lib, and seemingly never did. I guess they could be added, but tha=
t
>> could also be done in a separate patch (and as I mentioned in another
>> mail, I'm not exactly a fan of the fs-perms concept, so I don't really=

>> care.)
>=20
> Actually it does:
>=20
> # Note: all standard config directories are automatically assigned "075=
5 root
> root false - - -"
>=20
> Actual definition is buried in the code itself, meta/classes/package.bb=
class:
>=20
>     # By default all of the standard directories specified in
>     # bitbake.conf will get 0755 root:root.
>     target_path_vars =3D [    'base_prefix',
>                 'prefix',
>                 'exec_prefix',
>                 'base_bindir',
>                 'base_sbindir',
>                 'base_libdir',
>                 'datadir',
>                 'sysconfdir',
>                 'servicedir',
>                 'sharedstatedir',
>                 'localstatedir',
>                 'infodir',
>                 'mandir',
>                 'docdir',
>                 'bindir',
>                 'sbindir',
>                 'libexecdir',
>                 'libdir',
>                 'includedir',
>                 'oldincludedir' ]
>=20
> The problem is people have added 'additional' standard directories sinc=
e that
> time and have NOT updated the table.
>=20
> So likely the following needs to be added (based on the current bitbake=
=2Econf):
>=20
> nonarch_base_libdir
> systemd_unitdir
> systemd_system_unitdir
> nonarch_libdir
> systemd_user_unitdir
>=20
>=20
> As mentioned before.. the problem being solved is: If you don't have th=
e table
> of system directories and permission.. and you build a package that use=
s a
> standard system directory.. what owner/group/permission does that direc=
tory get?
>=20
> Answer? depends on the package, package manager and other misc things..=
 this is
> a really really bad case on non-deterministic behavior.  If we run thro=
ugh a
> table of operations (this internal table and the one in the fs-perms.tx=
t and
> other files, if added) then we can synchronize -all- packages in a buil=
d with
> the configured system setup.
>=20
> Note, with the way this was designed.. if /bin should NOT be a director=
y, the
> fs-perms.txt (or additional files provided by a configuration) can simp=
ly
> declare it as a symlink and the original entry goes away.
>=20
> A distribution definition is a combination of the distro config file, m=
atching
> fs-perms settings, and other associated files.  People miss the fs-perm=
s, I
> don't know if they don't realize it's there and why it's there or if th=
ey assume
> it's a one size fits all default configuration.  (The default does fit =
many
> configurations, but not all....)
>=20
> --Mark
>=20
>=20
>> Matthias
>>
>=20

Okay, I've thought a bit more about this now.

* I'm fine with fs-perms.txt fixing up permissions, that is actually a
good idea (I haven't yet researched though if any non-OE distros have a
similar feature.)


* I agree with you that having a base package like base-files create all
symlinks defined in fs-perms.txt would make sense.

I'd like to send a v3 of my patch which does that, thus dropping the
distro feature / package config again. If such an approach was rejected
a few years ago, I'd like to get a bit more input on this first, I
couldn't find that particular discussion in the archives.

(I'd also like to add some documentation about fs-perms.txt as comments
in the base-files recipe, so people who look into adjusting the
base-files package will find it.)


* I stand by my opinion that moving files automatically is a bad idea,
and the FILES issue mentioned in the other thread further backs my point
(besides that issue, I've mentioned relative symlinks and relative paths
in general as problems that can break packages when their files are moved=
).

My proposal would be to change the fs-perms.txt handling to only check
if nothing conflicts with default symlinks, but not to create or move
anything. This is another point I'd like to get more input on.


Matthias


--qdLWS3Ss9FiV0aLFN8d3hQx8gjaJljax0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCgAGBQJWkpEfAAoJEBbvP2TLIB2cC6YQAI8lUAfyPzv5EHjU9fEZ4YDe
iG1N18hEaMCD+mgfsn3NvsEvxDMO9T90VHkySNHI89y5PWSPR7AndTx2Q9ldKMct
O3/QlahZBe0tOAMwACNjcqGo9Q6iU9N1tEaMwvJwqATNuf3cSmaDsRBzj127H9CO
HZyVKrj/0/cwESztNYaT85LcDhjInw39XAhaoghHn57g6aJQaIRaoHHMpDFW4JT4
PVSsiVy8Zqp2/WTe/SiCJB09sxfuE3LaG1l4oxb/WXIbGwPP8ag0n81lXggHC8Fo
MXiR+wlvVLkNqJIxuwuTrmI5iEiZMCual50S78jktAvAAw4prtEsNzNDdQCPliXH
b/qItIzLqLDsveYfwi0dmXTvhK8W4rFPj+Ju7gN7y3hv9d5HVMBSug2Seteyqt0/
gzTWSjTxjo03O2PkUWFNkeQonTt1yIv+/DN8N+CaLPKGLzACL79Lns3QvWJmbgdS
LfvhXw8hkdoLUmK4qKFgOqkKdZMedUSMVqDCTBz118VvP1cgOmh51J4smL5g4aS7
QUGZLEjI96jTT1ds+bN2xfYioX5czYe3YH8mazzSmzjzZYM4WgHf04BrzWDiaCau
KYU/ITsK+FxaCti8+4jjPa9eWkWzToKZwyErC/R8ckX6CtgbADVHDQzYSWwpPfhL
BWmF769K4mvcGjnCzwKr
=MJkt
-----END PGP SIGNATURE-----

--qdLWS3Ss9FiV0aLFN8d3hQx8gjaJljax0--
