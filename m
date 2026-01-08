Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32B52D185F9
	for <webhook@archiver.kernel.org>; Thu,  8 Jan 2026 13:46:32 +0000 (UTC)
Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6656.1767879984343274529
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Jan 2026 05:46:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=CaCzXobR;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=zJfThMtx;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.159, mailfrom: paul@pbarker.dev)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 9CBAB7A002B;
	Thu,  8 Jan 2026 08:46:23 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Thu, 08 Jan 2026 08:46:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1767879983; x=1767966383; bh=jfRJGhXYPn
	z1zhA9+uugtPiGflLo8NwiOVHXqR9X3b8=; b=CaCzXobR0FDfTAu3w1ptA1frQq
	D6OB54MNp6nvFVdMamkEUKMr4eaOZsFhVxxkM8DeVc0Iq9LgEPbCIeEsMry0eIdf
	TP9KjiSsyU691UwY6HdDq31JMzL1gB7xNe3GAafC1KI7x6O8qyj8IcIgsHyglrJN
	zeS8zsQuVzkx1p00SerdLmi5gW7+I9NdUxijGfN/QFScedrzaU97UYSgbCIgAk2A
	8NgJMQ2wWUW+BK0/PkwcS/Rlz8F2EOiktwP98v7n/BxCq4ybi42gyl0dPzrB06lq
	6K1UX7tSzbCNOLwi8ktrGsJzJ9LCielU/dFAfLh4JmXivlY4Hbb5HjVMS3Lg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1767879983; x=1767966383; bh=jfRJGhXYPnz1zhA9+uugtPiGflLo8NwiOVH
	XqR9X3b8=; b=zJfThMtxyrh+fLgCK8RdA41yZp7xoRCrN7+555swAr21lalnuxY
	KhlbHr4PnH32/A9/l99sjxj2kfsX77nAdckUBE1sumhGEMbo/wP63CLdlNi2jVKM
	a4hl8F8zPOLNhf8Sdkt6SGm4I66q1vWYJjw6XEq+BN225dF5rh2yvzRldHLOnFqY
	E3oICcaes6qzH0Rs0qPKAiMW6rc8BZM+xdoVkXAOhYRFXwPu7G3KFtsnOq15EWm4
	4YUazH8NxHJX+Twf7ln1TuJdYG8e7IlF7K2/vEPbxbTrxPZIHCUklZk4+Yni3dH0
	3yO+vfvrOj6bJZlRkmTEnFd5EAzvb/A9cag==
X-ME-Sender: <xms:L7VfaQzokHLJ8KvDXE7Zv1CTPYAxMYnPSFs_GjWB9EaiNpLxVgGA7Q>
    <xme:L7VfaaQ00SMi5OtcrvALo0QbQmLkOM6pK8f_9X1RxF3Aj9clfgqjt15y9XuIjyCFn
    JAeOBNwK1t6QofZJ_p16X3JFTM62yPN9mTp5ymzR4F-DdN_UPDJUOyg>
X-ME-Received: <xmr:L7Vfaf-31ygPz04h7bVi641Ze5w0hEw7LPxUgfQ9q57RERlYMuzleM1TE4plFqHr0ZQmkP3M8K6bpgsmdx2qvaXdwPYvt2pzhCOQAQF1WiHN>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddutdeiuddtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefkuffhvfffjghftggfggesghdtreertd
    erjeenucfhrhhomheprfgruhhluceurghrkhgvrhcuoehprghulhesphgsrghrkhgvrhdr
    uggvvheqnecuggftrfgrthhtvghrnheptedufeeutdefvdejtdegvedujeeguefhjefhtd
    dtffetjeeihfejhefggffhgedtnecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdr
    ohhrghdpfihkshdrihhnnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomhepphgruhhlsehpsggrrhhkvghrrdguvghvpdhnsggprhgtphhtthhopedv
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehuvhhvrdhmrghilhesghhmrghilh
    drtghomhdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhs
    rdhophgvnhgvmhgsvgguuggvugdrohhrgh
X-ME-Proxy: <xmx:L7VfaZq6Fhw5A7ickNVMhn50tmt84CDeGxyDm7cH8MljbfL_ETFVZw>
    <xmx:L7VfaUlNEt1SL9XZbH028J1ydMx_SF9V434DH80zzo7lQV01ofWwhg>
    <xmx:L7VfaYJpHr17aNculmAveueMbAUKJiFeo2l8ZBKSNE-332uKt4EWtQ>
    <xmx:L7VfaRxrKrTg0GNGqVjNdRq0lNfSR91iprNQAcKU0XRDpgg9sdchPg>
    <xmx:L7VfaQDbkLWmy0YKA4ZiFqT9MboaTIZwQjePoX3oIi2IaiRzEY4IbZml>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 8 Jan 2026 08:46:22 -0500 (EST)
Message-ID: <95ec050db607457c2ae6e979dd5ae1c7d9df328c.camel@pbarker.dev>
Subject: Re: [OE-core] [PATCH v2 4/4] oe-selftest: overlayfs: Add a demo
 case for /etc
From: Paul Barker <paul@pbarker.dev>
To: uvv.mail@gmail.com, openembedded-core@lists.openembedded.org
Date: Thu, 08 Jan 2026 13:46:19 +0000
In-Reply-To: <20251224141659.2218381-4-uvv.mail@gmail.com>
References: <20251224141659.2218381-1-uvv.mail@gmail.com>
	 <20251224141659.2218381-4-uvv.mail@gmail.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 ep0k17xg==
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-FzdkvwQdqbu9WbywoUf5"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Jan 2026 13:46:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229070


--=-FzdkvwQdqbu9WbywoUf5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2025-12-24 at 14:16 +0000, Vyacheslav Yurkov via
lists.openembedded.org wrote:
> From: Vyacheslav Yurkov <uvv.mail@gmail.com>
>=20
> /etc is a special directory. It's possible to create a mount unit for
> it, but many system services that start early at boot time will not
> rescan its content when you mount overlay on top. The added test case
> demonstrates this by adding a sample systemd service and enabling it in
> overlay.
>=20
> Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
> ---
>  meta/lib/oeqa/selftest/cases/overlayfs.py | 98 +++++++++++++++++++++++
>  1 file changed, 98 insertions(+)
>=20
> diff --git a/meta/lib/oeqa/selftest/cases/overlayfs.py b/meta/lib/oeqa/se=
lftest/cases/overlayfs.py
> index 3e55e97927..426b4ccee3 100644
> --- a/meta/lib/oeqa/selftest/cases/overlayfs.py
> +++ b/meta/lib/oeqa/selftest/cases/overlayfs.py
> @@ -263,6 +263,104 @@ EOT
> =20
>          self._test_correct_image('systemd-machine-units', systemd_machin=
e_unit_append)
> =20
> +    @skipIfNotMachine("qemux86-64", "tests are qemux86-64 specific curre=
ntly")
> +    def test_etc_mount(self):
> +        """
> +        Summary:   /etc is not supposed to be used with overlayfs.bbclas=
s
> +        Expected:  Observe inconsistencies after using etc overlay with =
a mount unit
> +        Author:    Vyacheslav Yurkov <uvv.mail@gmail.com>
> +        """
> +        systemd_machine_unit_append =3D """
> +SYSTEMD_SERVICE:${PN} +=3D " \
> +    data.mount \
> +    etc.mount \
> +"
> +
> +do_install:append() {
> +    install -d ${D}${systemd_system_unitdir}
> +    install -d ${D}${ROOT_HOME}
> +    cat <<EOT > ${D}${systemd_system_unitdir}/etc.mount
> +[Unit]
> +Description=3DOverlayFS mount for /etc directory
> +DefaultDependencies=3Dno
> +RequiresMountsFor=3D/data
> +
> +[Mount]
> +What=3Doverlay
> +Where=3D/etc
> +Type=3Doverlay
> +Options=3Dlowerdir=3D/etc,upperdir=3D/data/overlay/etc,workdir=3D/data/o=
verlay-workdir/etc
> +[Install]
> +WantedBy=3Dlocal-fs.target
> +EOT
> +
> +    cat <<EOT >${D}${systemd_system_unitdir}/data.mount
> +[Unit]
> +Description=3DPersistent storage partition
> +
> +[Mount]
> +What=3D/dev/sda3
> +Where=3D/data
> +Type=3Dext4
> +Options=3Ddefaults
> +
> +[Install]
> +WantedBy=3Dlocal-fs.target
> +EOT
> +    cat <<EOT > ${D}${ROOT_HOME}/test-daemon.service
> +[Unit]
> +Description=3DMy one-shot task
> +After=3Dlocal-fs.target
> +
> +[Service]
> +Type=3Doneshot
> +ExecStart=3D/usr/bin/echo test
> +RemainAfterExit=3Dyes
> +
> +[Install]
> +WantedBy=3Dmulti-user.target
> +EOT
> +}
> +
> +FILES:${PN} +=3D "${ROOT_HOME}"
> +"""
> +
> +        config =3D """
> +IMAGE_INSTALL:append =3D " systemd-machine-units"
> +DISTRO_FEATURES:append =3D " overlayfs"
> +
> +# Use systemd as init manager
> +INIT_MANAGER =3D "systemd"
> +
> +# enable overlayfs in the kernel
> +KERNEL_EXTRA_FEATURES:append =3D " features/overlayfs/overlayfs.scc"
> +
> +IMAGE_FSTYPES +=3D "wic"
> +WKS_FILE =3D "overlayfs_etc.wks.in"
> +OVERLAYFS_ROOTFS_TYPE =3D "ext4"
> +"""
> +
> +        self.write_config(config)
> +
> +        machine_inc =3D """
> +OVERLAYFS_MOUNT_POINT[etc] =3D "/etc"
> +OVERLAYFS_QA_SKIP[mnt-overlay] =3D "mount-configured"
> +"""
> +        self.set_machine_config(machine_inc)
> +        self.write_recipeinc('systemd-machine-units', systemd_machine_un=
it_append)
> +        bitbake('core-image-minimal')
> +        with runqemu('core-image-minimal', image_fstype=3D'wic', discard=
_writes=3DFalse) as qemu:
> +            test_daemon_path =3D get_bb_var('ROOT_HOME') + '/test-daemon=
.service'
> +            status, output =3D qemu.run_serial('cp -f ' + test_daemon_pa=
th + ' /etc/systemd/system/')
> +            status, output =3D qemu.run_serial("systemctl enable test-da=
emon")
> +            status, output =3D qemu.run_serial("sync")
> +        with runqemu('core-image-minimal', image_fstype=3D'wic') as qemu=
:
> +            # Check the test service status. It's enabled and supposed t=
o start, but it didn't
> +            status, output =3D qemu.run_serial("systemctl is-enabled tes=
t-daemon")
> +            self.assertTrue("enabled" in output, msg=3Doutput)
> +            status, output =3D qemu.run_serial("systemctl is-active test=
-daemon")
> +            self.assertTrue("inactive" in output, msg=3Doutput)
> +

What is actually being tested here? It looks like we're just confirming
that incorrect behaviour occurs. Why do we want to ensure that the
behaviour stays incorrect?

If someone is installing an 'etc.mount' unit into the rootfs that
behaves like this then there's probably nothing we can do within Yocto
Project to help them. I suppose you could use overlayfs for /etc if you
set it up from an initramfs before pivoting to the main rootfs.

Best regards,

--=20
Paul Barker



--=-FzdkvwQdqbu9WbywoUf5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCaV+1KxEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0braRAP48hq74wAOxRblczh2Ds6badrJlnRE25dpZ
sY/moSKkNgEA3GK3sn6fQ6wkAk5qvdl+RRIiy/nvtpRZYaGvqQzhxgQ=
=olkW
-----END PGP SIGNATURE-----

--=-FzdkvwQdqbu9WbywoUf5--

