Return-Path: <anibal.limon@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 484C77318A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Aug 2016 22:11:23 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 17 Aug 2016 15:11:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,535,1464678000"; 
	d="asc'?scan'208";a="1043062999"
Received: from alimonb-mobl1.zpn.intel.com (HELO [10.219.5.36]) ([10.219.5.36])
	by fmsmga002.fm.intel.com with ESMTP; 17 Aug 2016 15:11:22 -0700
To: Bill Randle <william.c.randle@intel.com>,
	openembedded-core@lists.openembedded.org
References: <1471388891-839-1-git-send-email-william.c.randle@intel.com>
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Message-ID: <57B4E112.6000506@linux.intel.com>
Date: Wed, 17 Aug 2016 17:11:30 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1471388891-839-1-git-send-email-william.c.randle@intel.com>
Subject: Re: [PATCH] testimage: allow using kvm when running qemux86* machines
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
X-List-Received-Date: Wed, 17 Aug 2016 22:11:24 -0000
X-Groupsio-MsgNum: 85854
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="bMxrmEf5KmSqX0FgknWPno7wXR7gv5lRR"

--bMxrmEf5KmSqX0FgknWPno7wXR7gv5lRR
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable



On 08/16/2016 06:08 PM, Bill Randle wrote:
> Using kvm can provide significant speedups when running qemux86* machin=
es
> on an x86* host. Enabled by using the new QEMU_USE_KVM variable.
>=20
> [YOCTO #9298]
>=20
> Signed-off-by: Bill Randle <william.c.randle@intel.com>
Acked-by: An=EDbal Lim=F3n <anibal.limon@linux.intel.com>
> ---
>  meta/lib/oeqa/targetcontrol.py    |  7 +++++++
>  meta/lib/oeqa/utils/qemurunner.py | 11 +++++++++--
>  2 files changed, 16 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/lib/oeqa/targetcontrol.py b/meta/lib/oeqa/targetcontr=
ol.py
> index 768c463..3209ef0 100644
> --- a/meta/lib/oeqa/targetcontrol.py
> +++ b/meta/lib/oeqa/targetcontrol.py
> @@ -125,6 +125,12 @@ class QemuTarget(BaseTarget):
>          dump_target_cmds =3D d.getVar("testimage_dump_target", True)
>          dump_host_cmds =3D d.getVar("testimage_dump_host", True)
>          dump_dir =3D d.getVar("TESTIMAGE_DUMP_DIR", True)
> +        if d.getVar("QEMU_USE_KVM", False) is not None \
> +           and d.getVar("QEMU_USE_KVM", False) =3D=3D "True" \
> +           and "x86" in d.getVar("MACHINE", True):
> +            use_kvm =3D True
> +        else:
> +            use_kvm =3D False
> =20
>          # Log QemuRunner log output to a file
>          import oe.path
> @@ -153,6 +159,7 @@ class QemuTarget(BaseTarget):
>                              display =3D d.getVar("BB_ORIGENV", False).=
getVar("DISPLAY", True),
>                              logfile =3D self.qemulog,
>                              boottime =3D int(d.getVar("TEST_QEMUBOOT_T=
IMEOUT", True)),
> +                            use_kvm =3D use_kvm,
>                              dump_dir =3D dump_dir,
>                              dump_host_cmds =3D d.getVar("testimage_dum=
p_host", True))
> =20
> diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qe=
murunner.py
> index df73120..77e506f 100644
> --- a/meta/lib/oeqa/utils/qemurunner.py
> +++ b/meta/lib/oeqa/utils/qemurunner.py
> @@ -29,7 +29,7 @@ re_control_char =3D re.compile('[%s]' % re.escape("".=
join(control_chars)))
> =20
>  class QemuRunner:
> =20
> -    def __init__(self, machine, rootfs, display, tmpdir, deploy_dir_im=
age, logfile, boottime, dump_dir, dump_host_cmds):
> +    def __init__(self, machine, rootfs, display, tmpdir, deploy_dir_im=
age, logfile, boottime, dump_dir, dump_host_cmds, use_kvm):
> =20
>          # Popen object for runqemu
>          self.runqemu =3D None
> @@ -49,6 +49,7 @@ class QemuRunner:
>          self.boottime =3D boottime
>          self.logged =3D False
>          self.thread =3D None
> +        self.use_kvm =3D use_kvm
> =20
>          self.runqemutime =3D 60
>          self.host_dumper =3D HostDumper(dump_host_cmds, dump_dir)
> @@ -133,7 +134,13 @@ class QemuRunner:
>          self.origchldhandler =3D signal.getsignal(signal.SIGCHLD)
>          signal.signal(signal.SIGCHLD, self.handleSIGCHLD)
> =20
> -        launch_cmd =3D 'runqemu tcpserial=3D%s %s %s %s' % (self.serve=
rport, self.machine, self.rootfs, self.qemuparams)
> +        launch_cmd =3D 'runqemu '
> +        if self.use_kvm:
> +            logger.info('Using kvm for runqemu')
> +            launch_cmd +=3D 'kvm '
> +        else:
> +            logger.info('Not using kvm for runqemu')
> +        launch_cmd +=3D 'tcpserial=3D%s %s %s %s' % (self.serverport, =
self.machine, self.rootfs, self.qemuparams)
>          # FIXME: We pass in stdin=3Dsubprocess.PIPE here to work aroun=
d stty
>          # blocking at the end of the runqemu script when using this wi=
thin
>          # oe-selftest (this makes stty error out immediately). There o=
ught
>=20


--bMxrmEf5KmSqX0FgknWPno7wXR7gv5lRR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJXtOEVAAoJEGJqcE9h3glg2HIP+wZWMmHGg9kzyPC5xialiFQS
KqMeVRsRnc6xEKfmn3DfwSz+eq3IIQvDwvxnr3k+mfeLRBIyQ8nRWruSWB9/cwdm
B7iTvgKdtOMH+zjiJ44DFQ99ovRV1W4buSwbRirxj4eeSjMJ9ArIBiqlmWYTx4Go
zXTjMyZL7ScCdtzpRU732bZJSMvBgwHnIJQjs62xeXcjRqYjJzt6ndRr4mi06hfc
2QgUMzJgUyGMT/a5jkny3jhc58VhYt74FFOeLmlPEawBseAO6MSiAgveXJ+RLdV7
pcJbG74dZaQXGMCitTnLYzvGExLn08hc/Q7w/6V0wveV2VMbQu2jKncPvq6NSKPn
Ccyrs9LLIuhHsC2Gbu4uSYMrf0se0uvBAywE5+8UXOVjT6jLFhqsCsVSisPzmdel
+Ut9WdJlqv54F4lMCij79eZJjBAwXFjLo3NczpH2pUfKktha12Ax9Gs8fK/olJ/R
CNPdumziH1qc8uIc007UqaqsrNVB+rJtMHglwbsPnDt+M46KW6cjGzVjaUALhXqO
Dy2rfQk1iYWKAnFuzGVJulyBCZW2akOqyCgnIBUpSL7BJW8fwIZouBuPZFbqZafo
8DIgWJZgtcnw06+ltIor349NHRE7UtZmDHCh5LvV51ZZ0HOSxZwvJB6Sr43W2kDm
0UWLBeSfJJIQt0t/HxiC
=Fmtu
-----END PGP SIGNATURE-----

--bMxrmEf5KmSqX0FgknWPno7wXR7gv5lRR--
