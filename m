Return-Path: <anibal.limon@linux.intel.com>
X-Greylist: delayed 573 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 22 Aug 2016 19:54:02 UTC
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 81278731F6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Aug 2016 19:54:02 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga104.jf.intel.com with ESMTP; 22 Aug 2016 12:44:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,561,1464678000"; d="asc'?scan'208";a="651220"
Received: from alimonb-mobl1.zpn.intel.com (HELO [10.219.5.146])
	([10.219.5.146])
	by orsmga005.jf.intel.com with ESMTP; 22 Aug 2016 12:44:29 -0700
To: Robert Yang <liezhi.yang@windriver.com>,
	openembedded-core@lists.openembedded.org
References: <cover.1471850849.git.liezhi.yang@windriver.com>
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Message-ID: <57BB562C.40409@linux.intel.com>
Date: Mon, 22 Aug 2016 14:44:44 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <cover.1471850849.git.liezhi.yang@windriver.com>
Subject: Re: [PATCH V4 00/11] runqemu: refactor it and remove machine knowledge
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
X-List-Received-Date: Mon, 22 Aug 2016 19:54:04 -0000
X-Groupsio-MsgNum: 86106
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="MN8e05PnKvifIf100TkU2LoBgalMRqsoc"

--MN8e05PnKvifIf100TkU2LoBgalMRqsoc
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

Hi Robert,

May be your v4 now cover the current failures but only for notice,
here's some example.

https://autobuilder.yoctoproject.org/main/builders/nightly-arm/builds/926=
/steps/Running%20Sanity%20Tests/logs/stdio

Cheers,
	alimon

On 08/22/2016 02:52 AM, Robert Yang wrote:
> * V4
>   - Now the conf files can use @TAP@, @ROOTFS@ and @PORT@ when set vars=

>     for runqemu, so all the arch info are gone. And also update comment=
s
>     in qemuboot.bbclass.
>   - Add var QB_SLIRP_OPT for slirp mode as Nathan suggested, also add
>     QB_TAP_OPT whichi is for tap mode.
>   - Print "Try 'runqemu help' on how to use it" when failed to parse ar=
gs
>     as Nathan suggested.
>   - Fix device locking problems.
>   - Fix nativesdk-qemu-helper.
>   - Fix comments for qemurunner.py/qemutinyrunner.py
>=20
> * V3=20
>   - Move the qemu boot settings out of tune files (e.g., arch-x86.inc)
>     to avoid mixing BSP settings with the tunings as Mark suggested. an=
d
>     put them to <machine>.conf or <qemuboot>.inc file.
>=20
> * V2=20
>   - Fixes for RP's comments
>     a) Remove a kvm commit message since qemu-kvm can only run target w=
hen
>        its arch is the same as the host arch:
>        The kvm support is not limited on x86 or x86_64
>    =20
>     b) Fix a typo in commit message: qemu-boot.bbclass -> qemuboot.bbcl=
ass,
>        You may wonder why I use qemuboot.bbclass but not qemu-boot.bbcl=
ass,
>        this is because the bbclass will save vars into qemuboot.py, the=

>        qemuboot.py can't be qemu-boot.py here, otherwise,
>        "import qemu-boot.py" doesn't work since "-" is not a validate
>        identifier, so use "qemuboot" to make them unify.
>    =20
>     c) Reorder the patches to make sure they don't break the bisect bui=
ld.
>  =20
>   - Update commit message:
>     "Fix SLIRP mode" -> "Fix SLIRP mode, add help message, avoid mixing=

>   with tap"=20
>=20
> * V1
>   Previously, runqemu had hard coded machine knowledge, which limited i=
ts
>   usage, for example, qemu can boot genericx86, but runqemu can't, we n=
eed
>   edit runqemu/runqemu-internal a lot if we want to boot genericx86.
>  =20
>   Now bsp conf files can set vars to make it can be boot by runqemu, an=
d
>   qemuboot.bbclass will save these info to DEPLOY_DIR_IMAGE/qemuboot.py=
=2E
>   Please see qemuboot.bbclass' comments on how to set the vars.
>  =20
>   - Re-write it in python3, which can reduce lines from 1239 to about 7=
50
>     lines
>   - All the machine knowledges are gone
>   - All of the TUN_ARCH knowledge are gone (FIXED in V4)
>   - All the previous options are preserved, and there is a new way to r=
un
>     runqemu: (it doesn't need run "bitake -e" in such a case)
>     $ runqemu tmp/deploy/images/qemux86
>     or:
>     $ runqemu tmp/deploy/images/qemuarm/<image>.ext4
>     or:
>     $ runqemu tmp/deploy/images/qemuarm/qemuboot.py
>   - Fixed audio support, not limited on x86 or x86_64
>   - The kvm support is not limited on x86 or x86_64 (REMOVED by V2)
>   - Fix SLIRP mode (FIXED by V2)
>   - Fix NFS boot, it will extract <image>.tar.bz2 or tar.gz to
>     DEPLOY_DIR_IMAGE/<image>-nfsroot when no NFS_DIR, and remove it aft=
er
>     stop.
>   - More bsps can be boot, such as genericx86 and genericx86-64.
>   - The patch for qemuzynq, qemuzynqmp, qemumicroblaze has been sent to=

>     meta-xilinx' mailing list.
>   - I can't find any qemush4 bsp or how to build it, so it is not
>     considered atm.
>  =20
>   - Tested the following machines, all of them work well.
>     genericx86 genericx86-64
>     qemuarm qemuarm64
>     qemumips qemumips64 qemuppc
>     qemux86 qemux86-64
>     qemuzynq qemuzynqmp
>  =20
>     Tested ext4, nfs, slirp, vmdk, iso and cpio.gz when they are availa=
ble.
>  =20
>   And also test "bitbake core-image-sato -ctestimage" which uses runqem=
u,
>   it works, well.
>=20
> // Robert
>=20
> The following changes since commit 0865a5b8b8fbf478fb4b2310f808bcffff84=
a091:
>=20
>   packagefeed-stability.bbclass: cleansstate should remove pkgs from de=
ploy dir (2016-08-20 16:05:29 +0100)
>=20
> are available in the git repository at:
>=20
>   git://git.openembedded.org/openembedded-core-contrib rbt/runqemu
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?=
h=3Drbt/runqemu
>=20
> Robert Yang (11):
>   qemuboot.bbclass: add it for runqemu
>   qemuarm.conf: set vars for runqemu
>   qemuarm64.conf: set vars for runqemu
>   qemux86.conf/qemux86-64.conf: set vars for runqemu
>   qemumips/qemumips64.conf: set vars for runqemu
>   qemuppc.conf: set vars for runqemu
>   qemu.inc: inherit qemuboot.bbclass
>   runqemu: refactor it and remove machine knowledge
>   python-3.5-manifest.inc: the signal module RDEPENDS on enum
>   nativesdk-qemu-helper: fix for new runqemu
>   qemurunner.py/qemutinyrunner.py: remove runqemu-internal
>=20
>  meta/classes/qemuboot.bbclass                      |   67 +
>  meta/conf/machine/include/qemu.inc                 |    2 +
>  meta/conf/machine/include/qemuboot-mips.inc        |    7 +
>  meta/conf/machine/include/qemuboot-x86.inc         |   14 +
>  meta/conf/machine/qemuarm.conf                     |    5 +
>  meta/conf/machine/qemuarm64.conf                   |   13 +
>  meta/conf/machine/qemumips.conf                    |    1 +
>  meta/conf/machine/qemumips64.conf                  |    1 +
>  meta/conf/machine/qemuppc.conf                     |    7 +
>  meta/conf/machine/qemux86-64.conf                  |    1 +
>  meta/conf/machine/qemux86.conf                     |    1 +
>  meta/lib/oeqa/utils/qemurunner.py                  |    2 +-
>  meta/lib/oeqa/utils/qemutinyrunner.py              |    2 +-
>  .../python/python-3.5-manifest.inc                 |    2 +-
>  .../qemu/nativesdk-qemu-helper_1.0.bb              |    9 +-
>  scripts/contrib/python/generate-manifest-3.5.py    |    2 +-
>  scripts/runqemu                                    | 1287 ++++++++++++=
--------
>  scripts/runqemu-internal                           |  739 -----------
>  18 files changed, 890 insertions(+), 1272 deletions(-)
>  create mode 100644 meta/classes/qemuboot.bbclass
>  create mode 100644 meta/conf/machine/include/qemuboot-mips.inc
>  create mode 100644 meta/conf/machine/include/qemuboot-x86.inc
>  delete mode 100755 scripts/runqemu-internal
>=20


--MN8e05PnKvifIf100TkU2LoBgalMRqsoc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJXu1YuAAoJEGJqcE9h3glgQmkP/j0atBr6IZfwSHhtQXH3Mol3
ltTFPt4HZE4i6ba04khr8JwLeNMEyB5uRX75QwTP5zqHxvljC/Lz87kYM8mm7xjW
iYOYKObSpKBafwEUCFQbWc2lNHkKmDRQP4Ndi9MSaM5HqgH3mFWICifynlU8LbeW
dTfVH73sl61DjlDPPkPUAIUZwE8PCFe8ZpntNJ146nZZW6Yp9BQcQzDpEMbnBWvr
bcJBYsp6RSeKboz/Dlgv/YRl35eJmcbF0+qqxkHXQyTrVLTGUktBq9p02n+wAht3
MsljQUkA9UEOpkwA0X9mc+JpUwuD+8RhenGxtsGu1e+08CKD6dwIAUPOEnckZ406
HJourz1HHV9kbGIJ6QhzEy9srLIFEQVw3282O60qBQwKzjnjsfzTuc98eASSGC8Y
ovpOSkczxsSvrFHMa8pRpXp1oziKewk4ykAsP887ieWnmPL8arQxvht8B1KO7wJP
YN7atxzzQzmRrr8RC/KkpUysaUsMBWjxa0/6zglAmQZw7GVUC8B0co5URgqHEvew
WTOHRNY8fAHfTzvOZIEiue4TQPJJVBof3WBV4jZiuAsf/PnIgQPrsYAAcYThKobG
4FqJvfpR9YSJ8UUhyET4qNvESJAuQ7Gt5Riq970qjlo8uv+yOI8dwrSnTw2yxit9
T7x2uvUe4YuJnAxfmV9n
=W9CO
-----END PGP SIGNATURE-----

--MN8e05PnKvifIf100TkU2LoBgalMRqsoc--
