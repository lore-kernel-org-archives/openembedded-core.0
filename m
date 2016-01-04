Return-Path: <mschiffer@universe-factory.net>
Received: from chaos.universe-factory.net (chaos.universe-factory.net
	[37.72.148.22])
	by mail.openembedded.org (Postfix) with ESMTP id 01963600B3
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jan 2016 23:57:07 +0000 (UTC)
Received: from [IPv6:fd1b:c28a:2fd6::2] (unknown [IPv6:fd1b:c28a:2fd6::2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by chaos.universe-factory.net (Postfix) with ESMTPSA id AF082181501;
	Tue,  5 Jan 2016 00:57:07 +0100 (CET)
To: Mark Hatle <mark.hatle@windriver.com>
References: <cover.1451912446.git.ian.ray@ge.com>
	<4e736dcbaf5c32f9d7728990ad4ac0ca975dfd6d.1451912446.git.ian.ray@ge.com>
	<568A99CD.9000800@universe-factory.net>
	<568A9E97.2050909@windriver.com>
	<568AF189.5010801@universe-factory.net>
	<568AF894.1010405@windriver.com>
From: Matthias Schiffer <mschiffer@universe-factory.net>
X-Enigmail-Draft-Status: N1110
Message-ID: <568B06D3.7030205@universe-factory.net>
Date: Tue, 5 Jan 2016 00:57:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.0
MIME-Version: 1.0
In-Reply-To: <568AF894.1010405@windriver.com>
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
X-List-Received-Date: Mon, 04 Jan 2016 23:57:08 -0000
X-Groupsio-MsgNum: 75409
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="Xtc8t0MHrKTIJsgepNpVMHECVoHQA9w7Q"

--Xtc8t0MHrKTIJsgepNpVMHECVoHQA9w7Q
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 01/04/2016 11:56 PM, Mark Hatle wrote:
> On 1/4/16 4:26 PM, Matthias Schiffer wrote:
>> On 01/04/2016 05:32 PM, Mark Hatle wrote:
>>> On 1/4/16 10:11 AM, Matthias Schiffer wrote:
>>>> On 01/04/2016 02:14 PM, Ian Ray wrote:
>>>>> The recipe uses hard-coded paths (specifically /lib) in do_install
>>>>> and in FILES, however on a merged /usr system this directory might
>>>>> not exist. Prefer base_libdir.
>>>>>
>>>>> Signed-off-by: Ian Ray <ian.ray@ge.com>
>>>>> ---
>>>>
>>>> This should use nonarch_base_libdir, base_libdir defaults to /lib64 =
on
>>>> ppc64, which is not where the firmware is expected.
>>>>
>>>
>>> At a minimum, I would agree nonarch_base_libdir, however..
>>>
>>> I believe that the kernel loader/modules/tools themselves actually ha=
ve '/lib'
>>> hard coded into them.  This is the reason why /lib/firmware was used =
and not one
>>> of the variables.
>>>
>>> This is one of the cases were /lib is actually correct, since that is=
 what the
>>> system is expecting.  We can make some kind of accommodation for syst=
ems where
>>> /lib -> /usr/lib... but that should be done inside of the filesystem =
setup
>>> processing and not the package itself.  (I'm referring to the
>>> 'meta/files/fs-perms.txt' file.
>>>
>>> --Mark
>>>
>>
>> There seem to be some intresting ideas going around about what can or
>> should be done via fs-perms.txt... AFAICT, fs-perms.txt can't move
>> around files, so moving files form /lib to /usr/lib must be done in th=
e
>> package recipes themselves. (In my opinion, fs-perms.txt is a bad hack=

>> for broken recipes that shouldn't exist anyways, but that's another
>> discussion)
>=20
> Since I wrote fs-perms.txt, I'll explain the purpose.  Individual packa=
ges don't
> know if something is a directory, symbolic link, or what owner/group/pe=
rmissions
> a system level directory should be set to.
>=20
> The entire purpose of it is to declare a common set of -system- directo=
ries.
> (Packages/layers can amend and override this as necessary to add their =
own
> system directories.)
>=20
> FYI System directories are things like /usr/bin.  Having every package =
in the
> system need to define /usr/bin as a directory with an owner/group of ro=
ot:root
> and permission of 0755 is a REALLY bad practice.. but putting this know=
ledge
> into a single file that synchronizes everything is very practical.
>=20
> When the system level directories are mapped to symlinks.. the case whe=
re
> everyone is trying to folks /usr -> / or /bin -> /usr/bin.. then it can=

> AUTOMATICALLY map and move the files in these places..

Thanks for the explanation, I asked a similar question a few weeks ago
and didn't get a satisfactory answer about what fs-perms can do. I'll
rethink my approach for the merged-usr patchset.

So the remaining issue is how to conditionalize this. I'd like to find a
solution which doesn't require distros to define their own fs-perms when
they just want to use a merged /usr dir.

>=20
>> I think if a distro config changes any of the base paths
>> ({nonarch_,}base_libdir, base_{,s}bindir), *all* packages should respe=
ct
>> this. It's the distro's reponsiblity to create symlinks so everything =
is
>> found again at the expected paths (other examples for such hardcoded
>> paths: /bin/sh; the dynamic linker). See also my patchset I submitted =
to
>> this mailing list, which introduces a distro feature to have such
>> symlinks created by base-files.
>=20
> When this was written it was heavily argued against this knowledge bein=
g in
> base-files or base-dirs (suggested at the time) packages.

Is that discussion archived somewhere? I'm interested in the
argumentation. Do any non-OE distros have a similar feature?

>=20
> Defining a base setup, and then using a synchronization pass using the
> fs-perms.txt was the way to go.
>=20
> Note, fs-perms process is absolutely supposed to move files around -if-=
 a
> symlink is generated.. i.e.:
>=20
> /lib -> /usr/lib
>=20
> if you write to /lib/firmware, the code is supposed to see the director=
y of
> '/lib', create a new /usr/lib (set perms properly) and move the content=
s if /lib
> to /usr/lib, then replace the directory with a symbolic link.
>=20
> If it's NOT doing that, lets fix it.

I didn't try yet as I didn't now that it is supposed to to that.

>=20
> --Mark
>=20
>> Matthias
>>
>>
>>
>=20



--Xtc8t0MHrKTIJsgepNpVMHECVoHQA9w7Q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCgAGBQJWiwbTAAoJEBbvP2TLIB2cgkUQAMrAdoyKgNfDeAPJkJICGv4k
HlptMXQJN9BC+3TmAE6hoORu3TeSmWA6jZXmOupTQ5UfYLII3vMHjzx8zUgd4nzR
9e2lwkCV6VDwXc+l89Xgw6t9uBDTnVwfN6x+wzDjUPrs991YzUOtLgBtbwd6RnNf
N+nSb5hr11rAkTOzKeSKn56/VK7L71Yr+zT59D6cfrtSUj/rOmvjRs4ENcDR0S/u
/ZSzOJCQd3M2qCmEbQMyBDDKk9eieEVSJCquyPFfKxldk4i+FalPuibo2iLo1cSA
FaxzHBAqFApOixnX9ThJdaQskSNa4FZc3RV7XS8FOF2ANEkUPOl0/GBLl7Dl6nYJ
tTp99C5LCTuD5GftiDD1tWemqc6td5jo5qgYIC20fB7QWCz5h+SGcP3bVL++Sk9n
sV5QTsal+x+NTDNvI7zOJ+NUat5xE4RIe0o2sCKxESgKYAKD6evakCePbEcO6joy
KQ/bE7hN5KnIgub9rx+vHIRTcbkUuyzweE9/d7PU73q0W4UEQs+jggrYFdkLvi6e
cQzP5cm0r1Mp7Un3T+NsWeKKH5nxFIgqpL/e30cx2CX1L5KtycWsJAB1e7o+p+Uw
PMQ76e7eKPW8AjOQ/NoNGsgsn+VHRPg8wdyuzwqsUBNpwGAvOlUTrwX2VRTvj2NS
xkB/nvFfy+WpXq2e150L
=yv70
-----END PGP SIGNATURE-----

--Xtc8t0MHrKTIJsgepNpVMHECVoHQA9w7Q--
