Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A0F4F33A74
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 14:29:54 +0000 (UTC)
Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.45407.1772720987396900578
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Mar 2026 06:29:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=UOKoHn2W;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=nJODEd7w;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.151, mailfrom: paul@pbarker.dev)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id BF84D1D00244;
	Thu,  5 Mar 2026 09:29:46 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Thu, 05 Mar 2026 09:29:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1772720986; x=1772807386; bh=cXYoDbHBWx
	MLjc0TU9ni6l60hQ2/1yuvxpJvzMrGVE0=; b=UOKoHn2WL4MRq2W7kunpeqZjDV
	bC6pih7p/LHkwZn1wbbCkHfpja9xG2Vxu1YkS6KHzv+ibkEeqrPkbrtiWa31PNpG
	Ywr/ZKbQUNB28K26NGPiMA7KjPYhExI0AhkIpI5Vs1aD7Pso2XuDKTzpQjE74Z4j
	PiOCvBap+l69W+Ti9saYIKMXViyMqetH5APwJbGsslFw90+BpAo/BAUBb1GTpJkp
	zUnfptLuIXpPeaPbiyGKyXTf9b3lM4CMIqxE6nlPDJS7NphjVHXsU1kEsjDARxRA
	1LImH81T3yv1Yvn9rlU9cWfkq75UJSyCrOfz5NRbSKGrF4LpT2dS40CgoA2A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1772720986; x=1772807386; bh=cXYoDbHBWxMLjc0TU9ni6l60hQ2/1yuvxpJ
	vzMrGVE0=; b=nJODEd7w/G6hT64+N6KjgDpv2xrxxRNdPYrHkkTMDwIIZolqRVn
	qS1CuOlUCrQV63TkYR4Z2dX+BG3ZNnDqFGueOmEEVMSa5aJ07UpUHrNhh4FhEJv+
	MmnoiSfTFmZjzIEch+MCx3HX5EvtISOC6ptk4s2m/bojJoaznfcJWezMJ5jKbcXt
	f+I3CkqUdSe0ebD7nVbgvqVnpmAlwWZAKMdHx3XqQOVvDaBusf8VlC5iRJo8WXfe
	HfM9bS5p4pSrgysX2xTC3hQKQkynGw4zXZ7/xJ68m2tbluvtPFsPEGhYvpseSDRn
	OjjKOR7CFpSBFY5gFm10P+iJmu/Y4tS9hdg==
X-ME-Sender: <xms:WpOpaVeUqyn2rslwyxzrDKrF1uD-PhdzWFIxAHouF5e9CJ8Nq_mIrw>
    <xme:WpOpaZPyG_ARGpg5U0cOLsfPoA8LLc_v1d6HhFAlE143s9aZszGMsHNd0gbNudq0h
    d44RCl-q-HSYvCD3_k5OuIZJN1Aqoh14wJU-wAZnlOYfoeFpyf6RYM>
X-ME-Received: <xmr:WpOpacJQo6XMGeqy2zjQ30ipza9IU9FUEq2vst-1IK14QfFrzYNfvO_4MPEgFZJGsGsKQDyquuk3mO2KDXhuj1mg7QANRhZPCOfEjsSLT6ew>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvieeiiedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefkuffhvfffjghftggfggesghdtreertd
    erjeenucfhrhhomheprfgruhhluceurghrkhgvrhcuoehprghulhesphgsrghrkhgvrhdr
    uggvvheqnecuggftrfgrthhtvghrnhepteefvdevieeiteeiueefvdejueekhfekieetfe
    ejveeludejjeevudejleeljeelnecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdr
    ohhrghdphihotghtohhprhhojhgvtghtrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepphgruhhlsehpsggrrhhkvghrrdguvghvpdhn
    sggprhgtphhtthhopedvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehtrdhfrd
    hgrdhgvggvlhgvnhesghhmrghilhdrtghomhdprhgtphhtthhopehophgvnhgvmhgsvggu
    uggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrgh
X-ME-Proxy: <xmx:WpOpaaH3yRef27S5BNHYqwqrBq1xblQphihUDutXGmq-15enPH2SKw>
    <xmx:WpOpaUSTq2Xy7YqbVrJPE2SZJCvoF-4MTZSIH82cdqxqWdLtc9J7lA>
    <xmx:WpOpaWG3pMi7ldcmAn0RxDUwZE5gKEpatn9QB-t0b1TeLzi4062fag>
    <xmx:WpOpaQ_t43Gf9KMJzEjj9JaRa7DnXCF-8L7bYEoPPdVT2FAdqPfpsA>
    <xmx:WpOpaavIJOXyWr_xLFa22Y0qHOsBRf08_dFvShYVGKtNGWVoq25poNjT>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 5 Mar 2026 09:29:45 -0500 (EST)
Message-ID: <5acbeaf191e87bbce57caaa56e27434f30a32fa9.camel@pbarker.dev>
Subject: Re: [OE-core] [PATCH] devtool: Add test-image plugin for testing
 packages via devtool via images.
From: Paul Barker <paul@pbarker.dev>
To: t.f.g.geelen@gmail.com, openembedded-core@lists.openembedded.org
Date: Thu, 05 Mar 2026 14:29:43 +0000
In-Reply-To: <20260222232400.2475952-2-t.f.g.geelen@gmail.com>
References: <20260222232400.2475952-2-t.f.g.geelen@gmail.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-dRgrqYUpL70Ii3cb9gq6"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 14:29:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232494


--=-dRgrqYUpL70Ii3cb9gq6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2026-02-23 at 00:24 +0100, Tom Geelen via lists.openembedded.org
wrote:
> Based of a feature of AUH this is a plugin to run a testimage directly wi=
th packages installed that you are working on via devtool.
>=20
> Inputs would be a:
> - target image
> - target packages
>=20
> The tool will take care to make sure it also installs the minimal necessa=
ry dependencies to be able to run ptest on the target image.
> Logs will be captured and stored in the devtool workspace for easy access=
.
>=20
> An oe-selftest is added to test the plugin.
>=20
> Signed-off-by: Tom Geelen <t.f.g.geelen@gmail.com>
> ---
>  meta/lib/oeqa/selftest/cases/devtool.py |  61 +++++++++++
>  scripts/lib/devtool/test_image.py       | 130 ++++++++++++++++++++++++
>  2 files changed, 191 insertions(+)
>  create mode 100644 scripts/lib/devtool/test_image.py
>=20
> diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/self=
test/cases/devtool.py
> index d1209dd94e..c27934a3ca 100644
> --- a/meta/lib/oeqa/selftest/cases/devtool.py
> +++ b/meta/lib/oeqa/selftest/cases/devtool.py
> @@ -1932,6 +1932,67 @@ class DevtoolBuildImageTests(DevtoolBase):
>          if reqpkgs:
>              self.fail('The following packages were not present in the im=
age as expected: %s' % ', '.join(reqpkgs))
> =20
> +
> +class DevtoolTestImageTests(DevtoolBase):
> +
> +    @OETestTag("runqemu")
> +    def test_devtool_test_image(self):
> +        """Test devtool test-image plugin."""
> +
> +        machine =3D get_bb_var('MACHINE')
> +        if not machine or not machine.startswith('qemu'):
> +            self.skipTest('This test only works with qemu machines')
> +
> +        self.assertTrue(not os.path.exists(self.workspacedir),
> +                        'This test cannot be run with a workspace direct=
ory under the build directory')
> +
> +        image =3D 'oe-selftest-image'
> +        recipe =3D 'python3-atomicwrites'

I'm not sure that this is the best image recipe to use. Why not build
core-image-ptest-<packagename>?

> +
> +        # Ensure selected test package is ptest-capable.
> +        ptest_path =3D get_bb_var('PTEST_PATH', recipe)
> +        self.assertTrue(ptest_path,
> +                'Selected package %s does not appear to inherit ptest' %=
 recipe)
> +
> +        self.track_for_cleanup(self.workspacedir)
> +        # self.add_command_to_tearDown('bitbake -c clean %s' % image)
> +        self.add_command_to_tearDown('bitbake-layers remove-layer */work=
space')
> +
> +        # Ensure we're starting from a clean state
> +        bitbake('%s -c clean' % image)
> +
> +        result =3D runCmd('devtool test-image %s -p %s' % (image, recipe=
), ignore_status=3DTrue)
> +        if result.status !=3D 0 and 'runqemu - ERROR - Unknown path arg'=
 in result.output:
> +            self.skipTest('runqemu in this environment does not accept t=
estimage rootfs path args')
> +        self.assertEqual(result.status, 0,
> +                         'devtool test-image failed unexpectedly:\n%s' %=
 result.output)
> +
> +        # Check that requested package and its ptest package were instal=
led
> +        deploy_dir_image =3D get_bb_var('DEPLOY_DIR_IMAGE')
> +        self.assertTrue(deploy_dir_image, 'Unable to get DEPLOY_DIR_IMAG=
E')
> +
> +        manifests =3D sorted(glob.glob(os.path.join(deploy_dir_image, '%=
s*.manifest' % image)))
> +        self.assertTrue(manifests, 'Image manifest not found for %s in %=
s' % (image, deploy_dir_image))
> +        manifest =3D manifests[-1]
> +        self.assertExists(manifest, 'Image manifest not found: %s' % man=
ifest)
> +
> +        pkgs =3D set()
> +        with open(manifest, 'r') as f:
> +            for line in f:
> +                splitval =3D line.split()
> +                if splitval:
> +                    pkgs.add(splitval[0])
> +
> +        self.assertIn(recipe, pkgs)
> +        self.assertIn(recipe + '-ptest', pkgs)
> +
> +        match =3D re.search(r'Logs are in (\S+)', result.output)
> +        if match:
> +            logdir =3D match.group(1)
> +        else:
> +            logdir =3D os.path.join(self.workspacedir, 'testimage-logs')
> +        self.assertTrue(os.path.isdir(logdir), 'Expected logs directory =
not found: %s' % logdir)
> +

This test case took 10+ hours to run on the autobuilder [1]. Any ideas
why it's so slow?

[1]: https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/328=
0

> +def test_image(args, config, basepath, workspace):
> +    """Entry point for the devtool 'test-image' subcommand."""
> +
> +    if not args.imagename:
> +        raise DevtoolError('Image recipe to test must be specified')
> +    if not args.package:
> +        raise DevtoolError('Package(s) to install must be specified via =
-p/--package')
> +
> +    package_names =3D [p.strip() for p in args.package.split(',') if p.s=
trip()]
> +    if not package_names:
> +        raise DevtoolError('No valid package name(s) provided')
> +
> +    install_pkgs =3D package_names
> +
> +    logdir =3D os.path.join(config.workspace_path, 'testimage-logs')
> +    try:
> +        os.makedirs(logdir, exist_ok=3DTrue)
> +    except Exception as exc:
> +        raise DevtoolError(f'Failed to create test logs directory {logdi=
r}: {exc}')
> +
> +    pkg_append =3D ' '.join(sorted(set(install_pkgs)))
> +    extra_append =3D [
> +        f'TEST_LOG_DIR =3D "{logdir}"',
> +        # Ensure runtime test framework is enabled even if image/distro =
omitted it
> +        'IMAGE_CLASSES +=3D " testimage"',
> +        # Ensure the testimage task has the correct IMAGE_FEATURES set i=
n case the TEST_TARGET is qemu
> +        'IMAGE_FEATURES +=3D "allow-empty-password empty-root-password a=
llow-root-login"',
> +        'TEST_SUITES =3D " ping ssh ptest"',
> +        'TEST_RUNQEMUPARAMS +=3D "slirp"',

This should not be set by default as different users may have different
needs. We need to rely on users setting the runqemuparams that the need
in local.conf/site.conf.

> +        # Ensure image artifacts are built before do_testimage reads the=
m.
> +        'do_testimage[depends] +=3D " ${PN}:do_image_complete virtual/ke=
rnel:do_deploy"',

The do_testimage task should already have appropriate dependencies.

> +        # Ensure rootfs link naming is runqemu-compatible for image name=
s that
> +        # otherwise end with '-image' (without a trailing '-').
> +        'IMAGE_LINK_NAME =3D "${IMAGE_BASENAME}-${MACHINE}"',
> +        # Ensure a qemu-supported rootfs type is built/selected
> +        'IMAGE_FSTYPES:append =3D " ext4"',
> +        'QB_DEFAULT_FSTYPE =3D "ext4"',

Why do we need to force ext4 here?

> +        # Enable ptests and include available -ptest packages for instal=
led content
> +        'DISTRO_FEATURES:append =3D " ptest"',
> +        'IMAGE_FEATURES +=3D " ptest-pkgs"',
> +        'IMAGE_INSTALL:append =3D " ptest-runner dropbear"',

We shouldn't assume dropbear here. If an ssh server is needed, using
"sshd" here should do the job and allow openssh or dropbear to be
chosen.

> +        # Ensure requested packages (and -ptest where available) are ins=
talled
> +        f'IMAGE_INSTALL:append =3D " {pkg_append}"',
> +    ]

The extra_append argument to build_image_task is written to a bbappend
file for the image recipe, so it can't set global configuration like
DISTRO_FEATURES.

Best regards,

--=20
Paul Barker


--=-dRgrqYUpL70Ii3cb9gq6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCaamTVxEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bkDfAQDt/0PF/YxQAlUlIAkBpwK59inblhA03Us1
BMAOhZyf+AD8D3pNu/DqQQETHK6I/LDdfslPFrPxpcMBbMInCYh2mAg=
=fEIa
-----END PGP SIGNATURE-----

--=-dRgrqYUpL70Ii3cb9gq6--

