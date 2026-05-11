Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2FF7CD37B5
	for <webhook@archiver.kernel.org>; Mon, 11 May 2026 10:08:29 +0000 (UTC)
Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.47094.1778494108785694613
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 May 2026 03:08:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=gJisE8bq;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=l6TGiDIj;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.151, mailfrom: paul@pbarker.dev)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.stl.internal (Postfix) with ESMTP id 1357F1D00097;
	Mon, 11 May 2026 06:08:28 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Mon, 11 May 2026 06:08:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1778494107; x=1778580507; bh=xBKgkLx+hH
	K3w+gkuVP5vrEs1iuryLL9z5Of/o7ti6w=; b=gJisE8bqi1MYx1FvrUhBCS/qVi
	uyS0Kezs2CeMyvTnmoivmTFSgpLgIZ4GR0skOvdn9GYwOBL1bW2GYamrer/YlmcB
	5aPh64MBqPhb5ICX3/Hk5fSnncQpu2z70iT7lzALcnztsC1NtjvZUFkjsUIqKxO1
	q+WscDuEWkXtvYQc8HoisBIsYFt+nOe3IFz9UZKMR0/vZYAtTVUa0BlY3UrRL2UY
	ZtDOuTQIh/haaOMOY1DwbHzrhnOM/06ZfscP/mF7GxlmPUV58znXYRPAmxLBS+md
	xIitoPGr4YeY+xor6jZhbor+B5ANOFbdZeLGyhSeK8FgyfLcGCJ8vABktDoA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1778494107; x=1778580507; bh=xBKgkLx+hHK3w+gkuVP5vrEs1iuryLL9z5O
	f/o7ti6w=; b=l6TGiDIjBXH+49BNra2RJbb/DNYtorz9vqmud6R7WI9lZV8xcmm
	C8nklmW3R7p5yidCYaJGYLkzg5GeHke/AS40GVGNZq4Q5CfXn4pz9LJJsxpvJyd3
	XBH5DAElVrtbrzugJU2bYmSve3bTSoGxnruofsTdazoCcFGQBm3Z94tP4pxobGVu
	+2tLs6LiLgiIHtGQpc9G1192x5K8OZkvkGHog54XgHnYT7xIWCElm5E9S9U5EWat
	lw2sP/L4k06quNqkiaIdw2I4VxEYXFpyx0gxyeqncxZ2Up/90vFjzGlfasfnD+La
	htjYlDSX8ipkj3If2tIYNbo3h9h0H7M0fFQ==
X-ME-Sender: <xms:m6oBajamQMhAPz3zoVlvLSbrTsrf-y2b68nogFJdH8cQLAXSEi3yFQ>
    <xme:m6oBaoboNj9-Zv4ffe2DdR3v5xRdT7gvyKS5bZSWXwT5dUHsTye_Es2tqwYQ__t-m
    viKh84mTSKwIRfwxd-WO-IHcixnK4oH5sH0il7WeBPX6HdbL4Mh4yE>
X-ME-Received: <xmr:m6oBajlbGgNZCJepZ-dzVkp74BBbzQIeykLeR_lOyXoKKYb0giypoQYmH2eG_BxsyjDTtmQKB5YNaiqDu_eClgELg0V-qoNLUr64oDA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdduudekieeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepkffuhffvffgjfhgtfgggsehgtderredtreejnecuhfhrohhmpefrrghulhcuuegr
    rhhkvghruceophgruhhlsehpsggrrhhkvghrrdguvghvqeenucggtffrrghtthgvrhhnpe
    fhjefgteefteeiueevkeehudelgfdvgeevhfekkeeljeeufeekiedvtdejfffftdenucff
    ohhmrghinhepshgvlhhfthgvshhtrdgtrghsvgdpuggvtghorhgrthhorhdruggrthgrne
    cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgruhhl
    sehpsggrrhhkvghrrdguvghvpdhnsggprhgtphhtthhopedvpdhmohguvgepshhmthhpoh
    huthdprhgtphhtthhopehsrghmrdhjohhhnhdrkhgvnhhtsehgmhgrihhlrdgtohhmpdhr
    tghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvg
    hmsggvugguvggurdhorhhg
X-ME-Proxy: <xmx:m6oBakxWlK5Y0aIBU79w53bMi7htRKVNwNEPJThQdAZSoyR8djK5ZA>
    <xmx:m6oBahOEh_plZCDv-G49xlARqRevxx02ZNpR4VDhNCHM1c9aiFj-6A>
    <xmx:m6oBaoQ5eEXiSP_DtZoa2BMN8UGZM5N54NZhaj5O6RZnAekJ_ejcZA>
    <xmx:m6oBavbHIfHMvWa1QX9LXbXEKOBKYVJHIZ1lr4t-JJ1GcxLXF840dg>
    <xmx:m6oBamrufpARkouS9DMG0KEHdn1F2saCFYEuB3kVdSy8mB_A3M54jXS8>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 May 2026 06:08:27 -0400 (EDT)
Message-ID: <8b75a816b10a0d13ee25eaf50db570e93eefdf6c.camel@pbarker.dev>
Subject: Re: [PATCH 2/2] image_types_wic: add selftests for do_rootfs_wicenv
 hash safety
From: Paul Barker <paul@pbarker.dev>
To: Sam Kent <sam.john.kent@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 11 May 2026 11:08:24 +0100
In-Reply-To: <20260430083905.2967342-2-sam.john.kent@gmail.com>
References: <20260430083905.2967342-1-sam.john.kent@gmail.com>
	 <20260430083905.2967342-2-sam.john.kent@gmail.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-BMDa0VMKWBmQ9Qb77l8J"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 May 2026 10:08:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236799


--=-BMDa0VMKWBmQ9Qb77l8J
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2026-04-30 at 09:39 +0100, Sam Kent wrote:
> Add WicEnvHashTests to the wic selftest suite to cover the fix for
> bug 15662:
>=20
>  - test_bblayers_excluded_from_task_hash: static check via tinfoil that
>    BBLAYERS appears in do_rootfs_wicenv[vardepsexclude].
>=20
>  - test_hash_does_not_change_when_empty_layer_added_to_bblayers: runs
>    with -S none, adds a layer containing no wic plugins, and asserts the
>    sigdata hash is unchanged.
>=20
>  - test_hash_changes_when_wic_plugin_added_to_layer: the inverse =E2=80=
=94 adds
>    a layer that contains a wic plugin and asserts the hash does change.
>=20
> Signed-off-by: Sam Kent <sam.john.kent@gmail.com>
> ---
>  meta/lib/oeqa/selftest/cases/wic.py | 111 +++++++++++++++++++++++++++-
>  1 file changed, 108 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest=
/cases/wic.py
> index 4e94f4d..174e57d 100644
> --- a/meta/lib/oeqa/selftest/cases/wic.py
> +++ b/meta/lib/oeqa/selftest/cases/wic.py
> @@ -17,14 +17,13 @@ import filecmp
> =20
>  from glob import glob
>  from shutil import rmtree, copy
> -from tempfile import NamedTemporaryFile
> -from tempfile import TemporaryDirectory
> +from tempfile import NamedTemporaryFile, TemporaryDirectory, mkdtemp
>  from textwrap import dedent
> =20
>  from oeqa.selftest.case import OESelftestTestCase
>  from oeqa.core.decorator import OETestTag
>  from oeqa.core.decorator.data import skipIfNotArch
> -from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_bb_vars=
, runqemu
> +from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_bb_vars=
, runqemu, create_temp_layer
> =20
> =20
>  def extract_files(debugfs_output):
> @@ -2300,3 +2299,109 @@ class ModifyTests(WicTestCase):
>          # check if it's removed
>          result =3D runCmd("wic ls %s:2/ -n %s" % (images[0], sysroot))
>          self.assertNotIn('etc', [line.split()[-1] for line in result.out=
put.split('\n') if line])
> +
> +
> +class WicEnvHashTests(OESelftestTestCase):
> +    """Tests for do_rootfs_wicenv task hash safety (bug 15662)."""
> +
> +    def setUpLocal(self):
> +        super(WicEnvHashTests, self).setUpLocal()
> +        self.topdir =3D get_bb_var('TOPDIR')
> +
> +    def _fresh_tmpdir(self, name):
> +        """Return a clean TMPDIR path under TOPDIR, removing any prior c=
ontents."""
> +        import shutil
> +        path =3D os.path.join(self.topdir, name)
> +        if os.path.exists(path):
> +            shutil.rmtree(path)
> +        self.track_for_cleanup(path)
> +        return path
> +
> +    def _get_task_sigdata_hash(self, tmpdir, taskname):
> +        """Return the sigdata hash for taskname; fail if no match found.=
"""
> +        matches =3D []
> +        for root, _, files in os.walk(os.path.join(tmpdir, 'stamps')):
> +            for f in files:
> +                if taskname in f and '.sigdata.' in f:
> +                    matches.append(f.rsplit('.sigdata.', 1)[-1])
> +        self.assertGreater(len(matches), 0,
> +                           "No %s sigdata file found in %s" % (taskname,=
 tmpdir))
> +        return matches[0]
> +
> +    def test_bblayers_excluded_from_task_hash(self):
> +        """BBLAYERS must appear in do_rootfs_wicenv[vardepsexclude]."""
> +        import bb.tinfoil
> +        with bb.tinfoil.Tinfoil() as tinfoil:
> +            tinfoil.prepare(config_only=3DFalse, quiet=3D2)
> +            d =3D tinfoil.parse_recipe('core-image-minimal')
> +            vardepsexclude =3D (d.getVarFlag('do_rootfs_wicenv', 'vardep=
sexclude') or '').split()
> +
> +        self.assertIn('BBLAYERS', vardepsexclude,
> +                      "BBLAYERS is not in do_rootfs_wicenv[vardepsexclud=
e]; "
> +                      "host paths will change the task hash across works=
paces")

I don't think we need this first test case, the other two confirm that
BBLAYERS is excluded based on the observed behaviour.

> +
> +    def test_hash_does_not_change_when_empty_layer_added_to_bblayers(sel=
f):
> +        """Adding an empty layer to BBLAYERS must not change the do_root=
fs_wicenv hash."""
> +        tmpdir1 =3D self._fresh_tmpdir('tmp-wicenv-hash1')
> +        self.write_config(
> +            'TMPDIR =3D "%s"\n'
> +            'BB_SIGNATURE_HANDLER =3D "OEBasicHash"\n'
> +            'IMAGE_FSTYPES +=3D "wic"\n' % tmpdir1
> +        )
> +        bitbake('core-image-minimal -c do_rootfs_wicenv -S none')
> +        hash_before =3D self._get_task_sigdata_hash(tmpdir1, 'do_rootfs_=
wicenv')
> +
> +        # Add a layer with no wic plugins =E2=80=94 changes BBLAYERS but=
 must not change the hash.
> +        templayerdir =3D mkdtemp(prefix=3D'selftest-wicenv-')
> +        self.track_for_cleanup(templayerdir)
> +        create_temp_layer(templayerdir, 'selftestwicenvhash')
> +        runCmd('bitbake-layers add-layer %s' % templayerdir)
> +        self.add_command_to_tearDown('bitbake-layers remove-layer %s' % =
templayerdir)
> +
> +        tmpdir2 =3D self._fresh_tmpdir('tmp-wicenv-hash2')
> +        self.write_config(
> +            'TMPDIR =3D "%s"\n'
> +            'BB_SIGNATURE_HANDLER =3D "OEBasicHash"\n'
> +            'IMAGE_FSTYPES +=3D "wic"\n' % tmpdir2
> +        )
> +        bitbake('core-image-minimal -c do_rootfs_wicenv -S none')
> +        hash_after =3D self._get_task_sigdata_hash(tmpdir2, 'do_rootfs_w=
icenv')
> +
> +        self.assertEqual(hash_before, hash_after,
> +                         "do_rootfs_wicenv hash changed after adding an =
empty layer to "
> +                         "BBLAYERS even though no wic plugins changed (b=
ug 15662)")
> +
> +    def test_hash_changes_when_wic_plugin_added_to_layer(self):
> +        """Adding a layer that contains a wic plugin must change the do_=
rootfs_wicenv hash."""
> +        tmpdir3 =3D self._fresh_tmpdir('tmp-wicenv-hash3')
> +        self.write_config(
> +            'TMPDIR =3D "%s"\n'
> +            'BB_SIGNATURE_HANDLER =3D "OEBasicHash"\n'
> +            'IMAGE_FSTYPES +=3D "wic"\n' % tmpdir3
> +        )
> +        bitbake('core-image-minimal -c do_rootfs_wicenv -S none')
> +        hash_before =3D self._get_task_sigdata_hash(tmpdir3, 'do_rootfs_=
wicenv')
> +
> +        # Add a layer that contains a wic plugin =E2=80=94 must change t=
he hash.
> +        templayerdir =3D mkdtemp(prefix=3D'selftest-wicenv-plugin-')
> +        self.track_for_cleanup(templayerdir)
> +        create_temp_layer(templayerdir, 'selftestwicenvplugin')
> +        plugin_dir =3D os.path.join(templayerdir, 'lib', 'wic', 'plugins=
', 'source')
> +        os.makedirs(plugin_dir)
> +        with open(os.path.join(plugin_dir, 'selftest_dummy.py'), 'w') as=
 f:
> +            f.write('# selftest dummy wic source plugin\n')
> +        runCmd('bitbake-layers add-layer %s' % templayerdir)
> +        self.add_command_to_tearDown('bitbake-layers remove-layer %s' % =
templayerdir)
> +
> +        tmpdir4 =3D self._fresh_tmpdir('tmp-wicenv-hash4')
> +        self.write_config(
> +            'TMPDIR =3D "%s"\n'
> +            'BB_SIGNATURE_HANDLER =3D "OEBasicHash"\n'
> +            'IMAGE_FSTYPES +=3D "wic"\n' % tmpdir4
> +        )
> +        bitbake('core-image-minimal -c do_rootfs_wicenv -S none')
> +        hash_after =3D self._get_task_sigdata_hash(tmpdir4, 'do_rootfs_w=
icenv')
> +
> +        self.assertNotEqual(hash_before, hash_after,
> +                            "do_rootfs_wicenv hash did not change after =
adding a layer "
> +                            "with a wic plugin =E2=80=94 file-checksums =
tracking is not working")

Two questions:

- Why do we need a fresh TMPDIR for each build?

- Can we combine these two test cases into one so that we're not
  unnecessarily re-calculating hash_before?

Best regards,

--=20
Paul Barker


--=-BMDa0VMKWBmQ9Qb77l8J
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCagGqmBEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bjncAP9CM0D77ZLP2ou5N/VtxsFStn5FbE1ioIxg
AOlMu/pXJwEAlTVOcjEmas2OyJyzPRjv7Rxvzpjp8wiXy0SxERRfsg0=
=ILQI
-----END PGP SIGNATURE-----

--=-BMDa0VMKWBmQ9Qb77l8J--

