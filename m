Return-Path: <jan.klare@bisdn.de>
Received: from mx.bisdn.de (mx.bisdn.de [185.27.182.31])
	by mail.openembedded.org (Postfix) with ESMTP id 4026F7EC56
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2019 09:46:59 +0000 (UTC)
Received: from [172.16.250.196] (unknown [172.16.250.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx.bisdn.de (Postfix) with ESMTPSA id B55B6A46BA;
	Wed, 28 Aug 2019 11:46:59 +0200 (CEST)
From: Jan Klare <jan.klare@bisdn.de>
Message-Id: <4AC88B77-4E2F-46B4-9217-8C9838A0FE91@bisdn.de>
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Date: Wed, 28 Aug 2019 11:46:58 +0200
In-Reply-To: <afb0751f-2c79-e598-7ba0-288cc1e47acd@windriver.com>
To: Randy MacLeod <randy.macleod@windriver.com>
References: <20190827145204.32598-1-jan.klare@bisdn.de>
	<f9d5a79f-8555-f4bf-976b-b773300f24f7@windriver.com>
	<281DDBDF-325B-4A54-9759-EDABED3B0888@bisdn.de>
	<afb0751f-2c79-e598-7ba0-288cc1e47acd@windriver.com>
X-Mailer: Apple Mail (2.3445.104.11)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [warrior][PATCH v3] systemd: update SRCREV for systemd v241-stable
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
X-List-Received-Date: Wed, 28 Aug 2019 09:47:00 -0000
X-Groupsio-MsgNum: 128332
Content-Type: multipart/signed;
	boundary="Apple-Mail=_2BE8A69A-39F7-44E9-A34D-F951E1D7F3B6";
	protocol="application/pgp-signature"; micalg=pgp-sha256

--Apple-Mail=_2BE8A69A-39F7-44E9-A34D-F951E1D7F3B6
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Hi,

thanks for the new testing instructions, I ran the builds this morning =
and everything worked fine. Let me know if I can do anything else to =
verify the builds or help otherwise in the process.

Cheers,
Jan

> On 27. Aug 2019, at 19:11, Randy MacLeod <randy.macleod@windriver.com> =
wrote:
>=20
> On 8/27/19 12:15 PM, Jan Klare wrote:
>> Hi,
>> Thanks for all the initial help and the quick followup review. I =
successfully build systemd for the patched SRCREV for all the platforms =
you mentioned, should I post something of the output or some proof =
somewhere?
>=20
> No, that usually would be fine.
> We trust you and the automated builders will verify that things work =
as well. :)
>=20
> But...
>=20
> In this case I just realized that my oneline build-all was wrong;
> you need:
>=20
> $ for i in `ls ../../oe-core.git/meta/conf/machine | \
>            grep qemu | sed -e 's/\.conf//'`; \
> do \
>    MACHINE=3D$i bitbake systemd && \
>    touch sd-okay-$i || \
>    touch sd-fail-$i; \
> done
>=20
>=20
> I had left off the setting of the MACHINE variable. Sorry about that.
> Can you re-run the test after removing the sd-* files?
>=20
> ../Randy
>=20
>> Cheers,
>> Jan
>>> On 27. Aug 2019, at 17:14, Randy MacLeod =
<randy.macleod@windriver.com <mailto:randy.macleod@windriver.com>> =
wrote:
>>>=20
>>> On 8/27/19 10:52 AM, Jan Klare wrote:
>>>> Currently systemd 241 does break for kernels 5.2+ with the error =
described here:
>>>> * https://github.com/systemd/systemd/issues/12784
>>>> The issue has been fixed in master and will be fixed in the release =
243. The
>>>> necessary patches have been backported to systemd/systemd-stable in =
the branch
>>>> v241-stable, but currently in warrior an old version of that branch =
is pulled
>>>> in.
>>>> This patch updates the SRCREV to the latest commit from that branch =
and
>>>> therefore pulls in the needed fix to run systemd 241 on 5.2+ =
kernels.
>>>> Signed-off-by: Jan Klare <jan.klare@bisdn.de =
<mailto:jan.klare@bisdn.de>>
>>>> ---
>>>>  meta/recipes-core/systemd/systemd.inc | 2 +-
>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>> diff --git a/meta/recipes-core/systemd/systemd.inc =
b/meta/recipes-core/systemd/systemd.inc
>>>> index 5bd88ed6ed..2b9c291959 100644
>>>> --- a/meta/recipes-core/systemd/systemd.inc
>>>> +++ b/meta/recipes-core/systemd/systemd.inc
>>>> @@ -14,7 +14,7 @@ LICENSE =3D "GPLv2 & LGPLv2.1"
>>>>  LIC_FILES_CHKSUM =3D =
"file://LICENSE.GPL2;md5=3D751419260aa954499f7abaabaa882bbe \
>>>> file://LICENSE.LGPL2.1;md5=3D4fbd65380cdd255951079008b364516c"
>>>>  -SRCREV =3D "c1f8ff8d0de7e303b8004b02a0a47d4cc103a7f8"
>>>> +SRCREV =3D "511646b8ac5c82f210b16920044465756913d238"
>>>>  SRCBRANCH =3D "v241-stable"
>>>>  SRC_URI =3D =
"git://github.com/systemd/systemd-stable.git;protocol=3Dgit;branch=3D${SRC=
BRANCH}"
>>>>=20
>>>=20
>>> That's a better log since it explains your motivation.
>>>=20
>>> We don't require it but if you send something like this commit =
again,
>>> it would be good to analyze the commit logs, like this (but likely
>>> without the tutorial flavour):
>>>=20
>>> $ cd .../systemd-stable.git
>>> $ git checkout v241-stable
>>> $ git pull
>>> $ git log --oneline c1f8ff8d0de7..511646b8ac5c | wc -l
>>> 157
>>>=20
>>> The patches are almost all (1) are cherry-picked back from master to =
fix bugs. The four commits (2) that are not cherry-picks,
>>> are:
>>>=20
>>> A revert of something that does not belong in stable,
>>> A customized fix for stable,
>>> A bug fix
>>> A merge commit
>>>=20
>>> I was talking with Jan on IRC and he said that he had built
>>> and tested this update for his target (agema-ag7648 switch).
>>> I've asked Jan to build for all qemus so hopefully that goes well.
>>>=20
>>> Looks good to me.
>>>=20
>>> ../Randy
>>>=20
>>>=20
>>> [1]
>>>=20
>>> $ git log --oneline \
>>>  --grep=3D"cherry picked from commit" c1f8ff8d0de7..511646b8ac5c  | =
wc -l
>>> 153
>>>=20
>>> $ git log --oneline c1f8ff8d0de7..511646b8ac5c | wc -l
>>> 157
>>>=20
>>>=20
>>> [2]
>>>=20
>>> $ git log --oneline --grep=3D"cherry picked from commit" \
>>>   --invert-grep c1f8ff8d0de7..511646b8ac5c
>>>=20
>>> 099c5e4f5f Revert "meson: stop creating enablement symlinks
>>>           in /etc during installation"
>>> dc903ec516 Enable RestrictSUIDSGID=3Dyes for our services
>>>           with DynamicUser=3Dyes
>>> ce52d60450 fstab-generator: use DefaultDependencies=3Dno for
>>>           /sysroot mounts
>>> 35387ea7e1 Merge pull request #48 from
>>>           yuwata/v241-stable-dbus-and-timedated
>>>=20
>>>=20
>>> --
>>> # Randy MacLeod
>>> # Wind River Linux
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org =
<mailto:Openembedded-core@lists.openembedded.org>
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20
>=20
> --
> # Randy MacLeod
> # Wind River Linux
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_2BE8A69A-39F7-44E9-A34D-F951E1D7F3B6
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEt80lub3VhefUQEYIB81h/G0bP5IFAl1mTZIACgkQB81h/G0b
P5L5Ig//bLP1riob8oJ0m+Mt2gBUlzviCp0iF5SlTduPD+Uw7z7WNzjYIl+BTliQ
D5gHJKtSsb1MP+chhHjDtvvR5dfYNZa4JUicCf4X+KGuxCEPOTYfIfZWZGVypAwX
cPCJZ33EvGr4YEgYUER2kknRzuTzxLM/HouQBr07dSwUhqzNKalP1wIUXE66PTU2
sZ/zIEQYeizHCTC7RjQMWqH1vWgrv9VUE1u4tC79upC/AoJFon3AHa81bScMSJmW
VMNWKxG2MjItaSr+DGIAyYx1sHAJJAFA1NJSCcXPYCK8HJnWHjmBfRft4QDA46R5
8knW9wdxoLcxupgMNoQjrxzaJ83PDf3DSm079v94gwikrrAqdxTqaUgfYeTWnG9M
r7VfAPDLy2/xOA64ojCFqi3lOXWHJEbJxU3103WOHHAc+TD/Raizsq8M1khpqEN3
kgL0BUbpLck5Pzp6JfBdFU7u4FF6Ei3QKQL3iNKeg1BI0fYyqusDAwmOGn5SDgNe
mDxHTOs5GAQnjk1IW8hEyVn2fWWMznAcCfpPfYgFV3Q+cjfMCTwJyOHFYvYYC569
q/xhwCYoy9AbemPCNIBwxbb9rixjeevWEfY7H6wKNjBETRfG4lcoLEEpnCzCfgv+
gT7n7uV74Ct4Fic7skjLMJxvmtCglUc9CgdkbL1Tx3MRkhDkzoA=
=y+IL
-----END PGP SIGNATURE-----

--Apple-Mail=_2BE8A69A-39F7-44E9-A34D-F951E1D7F3B6--
