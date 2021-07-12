Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.8491.1626081254881743183
 for <Openembedded-core@lists.openembedded.org>;
 Mon, 12 Jul 2021 02:14:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id BF30240004;
	Mon, 12 Jul 2021 09:14:12 +0000 (UTC)
Date: Mon, 12 Jul 2021 11:14:12 +0200
From: "Alexandre Belloni" <alexandre.belloni@bootlin.com>
To: Vyacheslav Yurkov <uvv.mail@gmail.com>
Cc: Openembedded-core@lists.openembedded.org,
	Alexander Kanavin <alex.kanavin@gmail.com>
Subject: Re: [PATCH v2 7/8] oeqa/selftest: overlayfs unit tests
Message-ID: <YOwH5Gi22iL5uzuE@piout.net>
References: <YOnVwpvuj3OFT5Ti@piout.net>
 <20210711151629.40035-1-uvv.mail@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210711151629.40035-1-uvv.mail@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

On 11/07/2021 17:16:29+0200, Vyacheslav Yurkov wrote:
> Unit tests for overlayfs.bbclass
> 

This still seems to fail the tests:
https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/2299/steps/14/logs/stdio

> Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
> ---
>  meta/lib/oeqa/selftest/cases/overlayfs.py | 167 ++++++++++++++++++++++
>  1 file changed, 167 insertions(+)
>  create mode 100644 meta/lib/oeqa/selftest/cases/overlayfs.py
> 
> diff --git a/meta/lib/oeqa/selftest/cases/overlayfs.py b/meta/lib/oeqa/selftest/cases/overlayfs.py
> new file mode 100644
> index 0000000000..a5a4792eb0
> --- /dev/null
> +++ b/meta/lib/oeqa/selftest/cases/overlayfs.py
> @@ -0,0 +1,167 @@
> +#
> +# SPDX-License-Identifier: MIT
> +#
> +
> +from oeqa.selftest.case import OESelftestTestCase
> +from oeqa.utils.commands import runCmd, bitbake, get_bb_var, runqemu
> +
> +class OverlayFSTests(OESelftestTestCase):
> +    """Overlayfs class usage tests"""
> +
> +    def getline(self, res, line):
> +        for l in res.output.split('\n'):
> +            if line in l:
> +                return l
> +
> +    def add_overlay_conf_to_machine(self):
> +        machine_inc = """
> +OVERLAYFS_MOUNT_POINT[mnt-overlay] = "/mnt/overlay"
> +"""
> +        self.set_machine_config(machine_inc)
> +
> +    def test_distro_features_missing(self):
> +        """
> +        Summary:   Check that required DISTRO_FEATURES are set
> +        Expected:  Fail when either systemd or overlayfs are not in DISTRO_FEATURES
> +        Author:    Vyacheslav Yurkov <uvv.mail@gmail.com>
> +        """
> +
> +        config = """
> +IMAGE_INSTALL_append = " overlayfs-user"
> +"""
> +        self.write_config(config)
> +        self.add_overlay_conf_to_machine()
> +
> +        res = bitbake('core-image-minimal', ignore_status=True)
> +        line = self.getline(res, "overlayfs-user was skipped: missing required distro features")
> +        self.assertTrue("overlayfs" in res.output, msg=res.output)
> +        self.assertTrue("systemd" in res.output, msg=res.output)
> +        self.assertTrue("ERROR: Required build target 'core-image-minimal' has no buildable providers." in res.output, msg=res.output)
> +
> +    def test_not_all_units_installed(self):
> +        """
> +        Summary:   Test QA check that we have required mount units in the image
> +        Expected:  Fail because mount unit for overlay partition is not installed
> +        Author:    Vyacheslav Yurkov <uvv.mail@gmail.com>
> +        """
> +
> +        config = """
> +IMAGE_INSTALL_append = " overlayfs-user"
> +DISTRO_FEATURES += "systemd overlayfs"
> +"""
> +
> +        self.write_config(config)
> +        self.add_overlay_conf_to_machine()
> +
> +        res = bitbake('core-image-minimal', ignore_status=True)
> +        line = self.getline(res, "Unit name mnt-overlay.mount not found in systemd unit directories")
> +        self.assertTrue(line and line.startswith("WARNING:"), msg=res.output)
> +        line = self.getline(res, "Not all mount units are installed by the BSP")
> +        self.assertTrue(line and line.startswith("ERROR:"), msg=res.output)
> +
> +    def test_mount_unit_not_set(self):
> +        """
> +        Summary:   Test whether mount unit was set properly
> +        Expected:  Fail because mount unit was not set
> +        Author:    Vyacheslav Yurkov <uvv.mail@gmail.com>
> +        """
> +
> +        config = """
> +IMAGE_INSTALL_append = " overlayfs-user"
> +DISTRO_FEATURES += "systemd overlayfs"
> +"""
> +
> +        self.write_config(config)
> +
> +        res = bitbake('core-image-minimal', ignore_status=True)
> +        line = self.getline(res, "A recipe uses overlayfs class but there is no OVERLAYFS_MOUNT_POINT set in your MACHINE configuration")
> +        self.assertTrue(line and line.startswith("Parsing recipes...ERROR:"), msg=res.output)
> +
> +    def test_wrong_mount_unit_set(self):
> +        """
> +        Summary:   Test whether mount unit was set properly
> +        Expected:  Fail because not the correct flag used for mount unit
> +        Author:    Vyacheslav Yurkov <uvv.mail@gmail.com>
> +        """
> +
> +        config = """
> +IMAGE_INSTALL_append = " overlayfs-user"
> +DISTRO_FEATURES += "systemd overlayfs"
> +"""
> +
> +        wrong_machine_config = """
> +OVERLAYFS_MOUNT_POINT[usr-share-overlay] = "/usr/share/overlay"
> +"""
> +
> +        self.write_config(config)
> +        self.set_machine_config(wrong_machine_config)
> +
> +        res = bitbake('core-image-minimal', ignore_status=True)
> +        line = self.getline(res, "Missing required mount point for OVERLAYFS_MOUNT_POINT[mnt-overlay] in your MACHINE configuration")
> +        self.assertTrue(line and line.startswith("Parsing recipes...ERROR:"), msg=res.output)
> +
> +    def test_correct_image(self):
> +        """
> +        Summary:   Check that we can create an image when all parameters are
> +                   set correctly
> +        Expected:  Image is created successfully
> +        Author:    Vyacheslav Yurkov <uvv.mail@gmail.com>
> +        """
> +
> +        config = """
> +IMAGE_INSTALL_append = " overlayfs-user systemd-machine-units"
> +DISTRO_FEATURES += "systemd overlayfs"
> +
> +# Use systemd as init manager
> +VIRTUAL-RUNTIME_init_manager = "systemd"
> +
> +# enable overlayfs in the kernel
> +KERNEL_EXTRA_FEATURES_append = " features/overlayfs/overlayfs.scc"
> +"""
> +
> +        systemd_machine_unit_append = """
> +SYSTEMD_SERVICE_${PN} += " \
> +    mnt-overlay.mount \
> +"
> +
> +do_install_append() {
> +    install -d ${D}${systemd_system_unitdir}
> +    cat <<EOT > ${D}${systemd_system_unitdir}/mnt-overlay.mount
> +[Unit]
> +Description=Tmpfs directory
> +DefaultDependencies=no
> +
> +[Mount]
> +What=tmpfs
> +Where=/mnt/overlay
> +Type=tmpfs
> +Options=mode=1777,strictatime,nosuid,nodev
> +
> +[Install]
> +WantedBy=multi-user.target
> +EOT
> +}
> +
> +"""
> +
> +        self.write_config(config)
> +        self.add_overlay_conf_to_machine()
> +        self.write_recipeinc('systemd-machine-units', systemd_machine_unit_append)
> +
> +        bitbake('core-image-minimal')
> +
> +        def getline_qemu(out, line):
> +            for l in out.split('\n'):
> +                if line in l:
> +                    return l
> +
> +        with runqemu('core-image-minimal') as qemu:
> +            # Check that we have /mnt/overlay fs mounted as tmpfs and
> +            # /usr/share/my-application as an overlay (see overlayfs-user recipe)
> +            status, output = qemu.run_serial("/bin/mount -t tmpfs,overlay")
> +
> +            line = getline_qemu(output, "on /mnt/overlay")
> +            self.assertTrue(line and line.startswith("tmpfs"), msg=output)
> +
> +            line = getline_qemu(output, "upperdir=/mnt/overlay/upper/usr/share/my-application")
> +            self.assertTrue(line and line.startswith("overlay"), msg=output)
> -- 
> 2.28.0
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
