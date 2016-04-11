Return-Path: <anibal.limon@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id D87FD70034
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Apr 2016 15:57:01 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 11 Apr 2016 08:57:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,462,1455004800"; 
	d="asc'?scan'208";a="930055581"
Received: from alimonb-mobl1.zpn.intel.com (HELO [10.219.5.72]) ([10.219.5.72])
	by orsmga001.jf.intel.com with ESMTP; 11 Apr 2016 08:56:59 -0700
To: mariano.lopez@linux.intel.com, openembedded-core@lists.openembedded.org,
	Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1460357735-34044-1-git-send-email-mariano.lopez@linux.intel.com>
	<570BBF16.7000001@linux.intel.com>
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Message-ID: <570BC981.3000603@linux.intel.com>
Date: Mon, 11 Apr 2016 10:57:53 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <570BBF16.7000001@linux.intel.com>
Subject: Re: [PATCH] oeqa/runexported.py: Fix exported test
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
X-List-Received-Date: Mon, 11 Apr 2016 15:57:05 -0000
X-Groupsio-MsgNum: 80723
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="xP3bRC1Ir98Q7PXaSSkFwdXP2SCkhXMQa"

--xP3bRC1Ir98Q7PXaSSkFwdXP2SCkhXMQa
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

+ RP to integrate this patch before release 2.1

On 04/11/2016 10:13 AM, An=EDbal Lim=F3n wrote:
> Also will be a good idea to add testing for this functionality to avoid=

> future broke.
>=20
> Mariano could you load the bug for this task?
>=20
> Best regards,
> 	alimon
>=20
> On 04/11/2016 01:55 AM, mariano.lopez@linux.intel.com wrote:
>> From: Mariano Lopez <mariano.lopez@linux.intel.com>
>>
>> With the changes introduced to test the eSDK
>> the runexported test failed during the execution.
>>
>> This change fix runexported test in the least invasive
>> way, because of the release cycle.
>>
>> Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
> Acked-by: An=EDbal Lim=F3n <anibal.limon@linux.intel.com>
>=20
>> ---
>>  meta/lib/oeqa/oetest.py         |  6 +++++-
>>  meta/lib/oeqa/runexported.py    | 19 ++++++++++---------
>>  meta/lib/oeqa/utils/commands.py |  6 +++++-
>>  3 files changed, 20 insertions(+), 11 deletions(-)
>>
>> diff --git a/meta/lib/oeqa/oetest.py b/meta/lib/oeqa/oetest.py
>> index fc1e8b5..8eb84ed 100644
>> --- a/meta/lib/oeqa/oetest.py
>> +++ b/meta/lib/oeqa/oetest.py
>> @@ -19,7 +19,11 @@ except ImportError:
>>  import logging
>> =20
>>  import oeqa.runtime
>> -import oeqa.sdkext
>> +# Exported test doesn't require sdkext
>> +try:
>> +    import oeqa.sdkext
>> +except ImportError:
>> +    pass
>>  from oeqa.utils.decorators import LogResults, gettag, getResults
>>  from oeqa.utils import avoid_paths_in_environ
>> =20
>> diff --git a/meta/lib/oeqa/runexported.py b/meta/lib/oeqa/runexported.=
py
>> index e9a2912..cc89e13 100755
>> --- a/meta/lib/oeqa/runexported.py
>> +++ b/meta/lib/oeqa/runexported.py
>> @@ -30,7 +30,7 @@ except ImportError:
>> =20
>>  sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__=
), "oeqa")))
>> =20
>> -from oeqa.oetest import runTests
>> +from oeqa.oetest import TestContext
>>  from oeqa.utils.sshcontrol import SSHControl
>>  from oeqa.utils.dump import get_host_dumper
>> =20
>> @@ -49,7 +49,7 @@ class FakeTarget(object):
>>      def exportStart(self):
>>          self.sshlog =3D os.path.join(self.testdir, "ssh_target_log.%s=
" % self.datetime)
>>          sshloglink =3D os.path.join(self.testdir, "ssh_target_log")
>> -        if os.path.exists(sshloglink):
>> +        if os.path.lexists(sshloglink):
>>              os.remove(sshloglink)
>>          os.symlink(self.sshlog, sshloglink)
>>          print("SSH log file: %s" %  self.sshlog)
>> @@ -69,10 +69,9 @@ class MyDataDict(dict):
>>      def getVar(self, key, unused =3D None):
>>          return self.get(key, "")
>> =20
>> -class TestContext(object):
>> -    def __init__(self):
>> -        self.d =3D None
>> -        self.target =3D None
>> +class ExportTestContext(TestContext):
>> +    def __init__(self, d):
>> +        self.d =3D d
>> =20
>>  def main():
>> =20
>> @@ -121,7 +120,9 @@ def main():
>>      host_dumper.parent_dir =3D loaded["host_dumper"]["parent_dir"]
>>      host_dumper.cmds =3D loaded["host_dumper"]["cmds"]
>> =20
>> -    tc =3D TestContext()
>> +    target.exportStart()
>> +    tc =3D ExportTestContext(d)
>> +
>>      setattr(tc, "d", d)
>>      setattr(tc, "target", target)
>>      setattr(tc, "host_dumper", host_dumper)
>> @@ -129,8 +130,8 @@ def main():
>>          if key !=3D "d" and key !=3D "target" and key !=3D "host_dump=
er":
>>              setattr(tc, key, loaded[key])
>> =20
>> -    target.exportStart()
>> -    runTests(tc)
>> +    tc.loadTests()
>> +    tc.runTests()
>> =20
>>      return 0
>> =20
>> diff --git a/meta/lib/oeqa/utils/commands.py b/meta/lib/oeqa/utils/com=
mands.py
>> index 32e001c..48f6441 100644
>> --- a/meta/lib/oeqa/utils/commands.py
>> +++ b/meta/lib/oeqa/utils/commands.py
>> @@ -18,7 +18,11 @@ from oeqa.utils import CommandError
>>  from oeqa.utils import ftools
>>  import re
>>  import contextlib
>> -import bb
>> +# Export test doesn't require bb
>> +try:
>> +    import bb
>> +except ImportError:
>> +    pass
>> =20
>>  class Command(object):
>>      def __init__(self, command, bg=3DFalse, timeout=3DNone, data=3DNo=
ne, **options):
>>
>=20
>=20
>=20


--xP3bRC1Ir98Q7PXaSSkFwdXP2SCkhXMQa
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJXC8mDAAoJEGJqcE9h3glg9K4P+gPcNPvtk6pyErcXKOQ1KCb8
qsPeA5XrCLUxNYmkc3rWh0RoknBVwmiA3jY3nKLTX5588Hmj8jLGmdqznb9mNzf6
VBBX8VF0EJqxjo9huTocu4XPpMtRvJEorDu676vgUmMpFxCwmysOfxIvaAk6LnRm
lbpkAfeLAHvXxFVgJ4Ls5vvnImC1BFiJastpv7fe2s15WlKYtqmRXtt0NlK7dg8i
LbGrUtPyoLo6zHzHNeEWTM9shQ9sM+vLQPIbvxX9Bf+FO6T0L/m+a+xkc7etTgaO
uKSP3Fp1581h8ZSIcUyAXfGHNVvaKlxU5fua9VX1oZbqFr9jC7v0qcxspDM6qFkx
pPLFEu85Cz/DTQFntaBXLXvu7L3Mq4EpcXCcTWGYB5sB82Hkk3P3Kmkcl7UlJ+Ed
xQjA05E/lg+SU1h0292BTBK+bmp/fFm9/uAsD/CR7m3hPauZkk4Md+6jDhwEox3a
P12jlIpHP93O+4qbD5qdaGbC9WuzUMrvZ3lxzLK8fzBZZB1Na34ALsSQvxWEUxZn
um+Bhc9+/qcVrn2DkRlOosEd7DOHpQQHeYQPpF8gQLUxn9kVdxhjs+oPEVBzdDlK
zJ/r/OBw9vp2qN6eIwjJ6VowEIBKpBhdexWmWAsEaOF9Uq+9DFNg158H5JcxcjfS
0hB3n4N4uaUSYN6GNAcv
=cus+
-----END PGP SIGNATURE-----

--xP3bRC1Ir98Q7PXaSSkFwdXP2SCkhXMQa--
