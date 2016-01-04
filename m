Return-Path: <mschiffer@universe-factory.net>
Received: from chaos.universe-factory.net (chaos.universe-factory.net
	[37.72.148.22])
	by mail.openembedded.org (Postfix) with ESMTP id 1AE3D6FEF5
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jan 2016 22:26:17 +0000 (UTC)
Received: from [IPv6:fd1b:c28a:2fd6::2] (unknown [IPv6:fd1b:c28a:2fd6::2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by chaos.universe-factory.net (Postfix) with ESMTPSA id 4C5BB181200
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jan 2016 23:26:18 +0100 (CET)
To: openembedded-core@lists.openembedded.org
References: <cover.1451912446.git.ian.ray@ge.com>
	<4e736dcbaf5c32f9d7728990ad4ac0ca975dfd6d.1451912446.git.ian.ray@ge.com>
	<568A99CD.9000800@universe-factory.net>
	<568A9E97.2050909@windriver.com>
From: Matthias Schiffer <mschiffer@universe-factory.net>
X-Enigmail-Draft-Status: N1110
Message-ID: <568AF189.5010801@universe-factory.net>
Date: Mon, 4 Jan 2016 23:26:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.0
MIME-Version: 1.0
In-Reply-To: <568A9E97.2050909@windriver.com>
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
X-List-Received-Date: Mon, 04 Jan 2016 22:26:18 -0000
X-Groupsio-MsgNum: 75403
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="MdrB97F9hHMOBhf0JGH2wAAiviMWQV43v"

--MdrB97F9hHMOBhf0JGH2wAAiviMWQV43v
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 01/04/2016 05:32 PM, Mark Hatle wrote:
> On 1/4/16 10:11 AM, Matthias Schiffer wrote:
>> On 01/04/2016 02:14 PM, Ian Ray wrote:
>>> The recipe uses hard-coded paths (specifically /lib) in do_install
>>> and in FILES, however on a merged /usr system this directory might
>>> not exist. Prefer base_libdir.
>>>
>>> Signed-off-by: Ian Ray <ian.ray@ge.com>
>>> ---
>>
>> This should use nonarch_base_libdir, base_libdir defaults to /lib64 on=

>> ppc64, which is not where the firmware is expected.
>>
>=20
> At a minimum, I would agree nonarch_base_libdir, however..
>=20
> I believe that the kernel loader/modules/tools themselves actually have=
 '/lib'
> hard coded into them.  This is the reason why /lib/firmware was used an=
d not one
> of the variables.
>=20
> This is one of the cases were /lib is actually correct, since that is w=
hat the
> system is expecting.  We can make some kind of accommodation for system=
s where
> /lib -> /usr/lib... but that should be done inside of the filesystem se=
tup
> processing and not the package itself.  (I'm referring to the
> 'meta/files/fs-perms.txt' file.
>=20
> --Mark
>=20

There seem to be some intresting ideas going around about what can or
should be done via fs-perms.txt... AFAICT, fs-perms.txt can't move
around files, so moving files form /lib to /usr/lib must be done in the
package recipes themselves. (In my opinion, fs-perms.txt is a bad hack
for broken recipes that shouldn't exist anyways, but that's another
discussion)

I think if a distro config changes any of the base paths
({nonarch_,}base_libdir, base_{,s}bindir), *all* packages should respect
this. It's the distro's reponsiblity to create symlinks so everything is
found again at the expected paths (other examples for such hardcoded
paths: /bin/sh; the dynamic linker). See also my patchset I submitted to
this mailing list, which introduces a distro feature to have such
symlinks created by base-files.

Matthias


--MdrB97F9hHMOBhf0JGH2wAAiviMWQV43v
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCgAGBQJWivGJAAoJEBbvP2TLIB2cwAUP/ArpcpzlbwXRnJMRRCx013K7
NJTlxfkALxtSAQ8yLBP8zp7wNxGZWhMxP/bfcOzqk348OioBsugtS/42sNAfskzy
R1Vgv7mq1nXAT1OjvTAcEtjJadxhZ3huT9qoGs3szief709WvldOaZn63WfplVpy
kqpRbx3co6qycLHVUcF8+QeJqOQ88fb3yBGGgAhcWXvZlAnYNsOKHSJsPemvodf0
OmSZaDGVurt25NUqW3+v3pepNc7ihsBeUXFXj5WGdVTtsKu5I/amU/R5DjFb/9ly
VE+XUBUmzxlFX1r5MXdmu6bCtU69NNO4BRyK7fJgjDtQBHyOg9fimuvlfv/oHiP/
/mrj2EhNTSEwWubPtEy4wivVqdJYhgNu0plolO/IL5SdRdt0937zEC6qNrUCoLeS
MdcznL/psXMeWd0qkQoc51k3KCiOT0/uGm3DWINAa7H7Ph7Dlr4TLaD1HZ8pS2fK
b55qkGiykhV/RV5rrHpdy5BTVo71CWI9Jg45SivNitG4UJEkN7yWbzERi1UvtEpF
61h7wTkzkWYwyof6zMheGVrcfwx55/tnN0i3hphvOYW6HqC7BjngegcbUmN2uawg
aqM4let93Z6oL/pW+Xi+IbhQXz1mNHbVjedSwwgzml7gZGieUOimcYU9R/Yg/Cxs
HuB6lmHAoTnPjlWNgBmf
=aTYw
-----END PGP SIGNATURE-----

--MdrB97F9hHMOBhf0JGH2wAAiviMWQV43v--
