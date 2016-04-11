Return-Path: <anibal.limon@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 2804070149
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Apr 2016 15:12:52 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 11 Apr 2016 08:12:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,462,1455004800"; 
	d="asc'?scan'208";a="782533998"
Received: from alimonb-mobl1.zpn.intel.com (HELO [10.219.5.72]) ([10.219.5.72])
	by orsmga003.jf.intel.com with ESMTP; 11 Apr 2016 08:12:37 -0700
To: mariano.lopez@linux.intel.com, openembedded-core@lists.openembedded.org
References: <1460357735-34044-1-git-send-email-mariano.lopez@linux.intel.com>
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Message-ID: <570BBF16.7000001@linux.intel.com>
Date: Mon, 11 Apr 2016 10:13:26 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1460357735-34044-1-git-send-email-mariano.lopez@linux.intel.com>
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
X-List-Received-Date: Mon, 11 Apr 2016 15:12:55 -0000
X-Groupsio-MsgNum: 80722
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="FxGkP8UIkdvbC9Dl8C92rJGbnLrhBmUPJ"

--FxGkP8UIkdvbC9Dl8C92rJGbnLrhBmUPJ
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

Also will be a good idea to add testing for this functionality to avoid
future broke.

Mariano could you load the bug for this task?

Best regards,
	alimon

On 04/11/2016 01:55 AM, mariano.lopez@linux.intel.com wrote:
> From: Mariano Lopez <mariano.lopez@linux.intel.com>
>=20
> With the changes introduced to test the eSDK
> the runexported test failed during the execution.
>=20
> This change fix runexported test in the least invasive
> way, because of the release cycle.
>=20
> Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
Acked-by: An=EDbal Lim=F3n <anibal.limon@linux.intel.com>

> ---
>  meta/lib/oeqa/oetest.py         |  6 +++++-
>  meta/lib/oeqa/runexported.py    | 19 ++++++++++---------
>  meta/lib/oeqa/utils/commands.py |  6 +++++-
>  3 files changed, 20 insertions(+), 11 deletions(-)
>=20
> diff --git a/meta/lib/oeqa/oetest.py b/meta/lib/oeqa/oetest.py
> index fc1e8b5..8eb84ed 100644
> --- a/meta/lib/oeqa/oetest.py
> +++ b/meta/lib/oeqa/oetest.py
> @@ -19,7 +19,11 @@ except ImportError:
>  import logging
> =20
>  import oeqa.runtime
> -import oeqa.sdkext
> +# Exported test doesn't require sdkext
> +try:
> +    import oeqa.sdkext
> +except ImportError:
> +    pass
>  from oeqa.utils.decorators import LogResults, gettag, getResults
>  from oeqa.utils import avoid_paths_in_environ
> =20
> diff --git a/meta/lib/oeqa/runexported.py b/meta/lib/oeqa/runexported.p=
y
> index e9a2912..cc89e13 100755
> --- a/meta/lib/oeqa/runexported.py
> +++ b/meta/lib/oeqa/runexported.py
> @@ -30,7 +30,7 @@ except ImportError:
> =20
>  sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__)=
, "oeqa")))
> =20
> -from oeqa.oetest import runTests
> +from oeqa.oetest import TestContext
>  from oeqa.utils.sshcontrol import SSHControl
>  from oeqa.utils.dump import get_host_dumper
> =20
> @@ -49,7 +49,7 @@ class FakeTarget(object):
>      def exportStart(self):
>          self.sshlog =3D os.path.join(self.testdir, "ssh_target_log.%s"=
 % self.datetime)
>          sshloglink =3D os.path.join(self.testdir, "ssh_target_log")
> -        if os.path.exists(sshloglink):
> +        if os.path.lexists(sshloglink):
>              os.remove(sshloglink)
>          os.symlink(self.sshlog, sshloglink)
>          print("SSH log file: %s" %  self.sshlog)
> @@ -69,10 +69,9 @@ class MyDataDict(dict):
>      def getVar(self, key, unused =3D None):
>          return self.get(key, "")
> =20
> -class TestContext(object):
> -    def __init__(self):
> -        self.d =3D None
> -        self.target =3D None
> +class ExportTestContext(TestContext):
> +    def __init__(self, d):
> +        self.d =3D d
> =20
>  def main():
> =20
> @@ -121,7 +120,9 @@ def main():
>      host_dumper.parent_dir =3D loaded["host_dumper"]["parent_dir"]
>      host_dumper.cmds =3D loaded["host_dumper"]["cmds"]
> =20
> -    tc =3D TestContext()
> +    target.exportStart()
> +    tc =3D ExportTestContext(d)
> +
>      setattr(tc, "d", d)
>      setattr(tc, "target", target)
>      setattr(tc, "host_dumper", host_dumper)
> @@ -129,8 +130,8 @@ def main():
>          if key !=3D "d" and key !=3D "target" and key !=3D "host_dumpe=
r":
>              setattr(tc, key, loaded[key])
> =20
> -    target.exportStart()
> -    runTests(tc)
> +    tc.loadTests()
> +    tc.runTests()
> =20
>      return 0
> =20
> diff --git a/meta/lib/oeqa/utils/commands.py b/meta/lib/oeqa/utils/comm=
ands.py
> index 32e001c..48f6441 100644
> --- a/meta/lib/oeqa/utils/commands.py
> +++ b/meta/lib/oeqa/utils/commands.py
> @@ -18,7 +18,11 @@ from oeqa.utils import CommandError
>  from oeqa.utils import ftools
>  import re
>  import contextlib
> -import bb
> +# Export test doesn't require bb
> +try:
> +    import bb
> +except ImportError:
> +    pass
> =20
>  class Command(object):
>      def __init__(self, command, bg=3DFalse, timeout=3DNone, data=3DNon=
e, **options):
>=20


--FxGkP8UIkdvbC9Dl8C92rJGbnLrhBmUPJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJXC78dAAoJEGJqcE9h3glgBJIP/3iTIHa2qoRkDsTxIp57ai+O
6ImQ2trtONIwwdL7+qevEe/j8XUidG+/j3C+qx/65a1G3N1i0H1XcbLTf5jBVZFi
3+4j5mNQfYGMVeKGTGMBBMg3qJ0ZY3cv9jx8t4Gl2ZsBzrGNIR735BsNix57CDsG
LD/PbsMQa+eetsjkxw4O4RhowOMwB6lRZdI6o9lnN5IdgDqzvQeHTPfjQdaZ+VKy
DrBhbQezs+nG4IGfOD5iPhQzCNG0i+GCo9mdySDOthIzARr2WYEKvoswftDBlaH1
8ruzG2bAwSb7ds3Ze60i51qFXp8RLrwELW2RcV0GymBCUKUthg2dNNg6EXKgpFrL
nQbPCmFdwD6nQUbyooUA94PrZDexrv0b5RYMs1Tpqu76ZNTchbei8eX2QVfCutqW
ur807C4hAvhspzrPPlQMTuJV37bX07FkQuFfWsq7TLCu+5B+AKp/T6py+oXFW/44
fMGmKjIdjECpij3ohTsFsEOKCPUzbz362LKR8vDkXPDIkvYWkS2gwMFdwrUKHyuL
vYualICe6dEatYGT4N8y+pMDUeR7zYNpXuBCylhOBgW4HB1wxxbMfLBEH1iu5o5P
+yVgWid0Lg6QttulIwHuAfe00GcjvpWxDBkp9VSM5mfIJ74K64gfTvW3Oxd+yUpS
A4BiDlcl7vgvIJU5V7wS
=4j/n
-----END PGP SIGNATURE-----

--FxGkP8UIkdvbC9Dl8C92rJGbnLrhBmUPJ--
