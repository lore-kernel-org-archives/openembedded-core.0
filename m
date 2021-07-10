Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.22611.1625910119410509865
 for <Openembedded-core@lists.openembedded.org>;
 Sat, 10 Jul 2021 02:42:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 7DFCBE0002;
	Sat, 10 Jul 2021 09:41:56 +0000 (UTC)
Date: Sat, 10 Jul 2021 11:41:56 +0200
From: "Alexandre Belloni" <alexandre.belloni@bootlin.com>
To: Vyacheslav Yurkov <uvv.mail@gmail.com>
Cc: Openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v2 7/8] oeqa/selftest: overlayfs unit tests
Message-ID: <YOlrZMKjhMGDaJz2@piout.net>
References: <20210709113146.69020-1-uvv.mail@gmail.com>
 <20210709113146.69020-7-uvv.mail@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210709113146.69020-7-uvv.mail@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

On 09/07/2021 13:31:45+0200, Vyacheslav Yurkov wrote:
> Unit tests for overlayfs.bbclass
> 

I believe I properly applied the series but it fails with:

Parsing recipes...ERROR: /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-1517413/meta-selftest/recipes-test/overlayfs/overlayfs-user.bb: A recipe uses overlayfs class but there is no OVERLAYFS_MOUNT_POINT set in your MACHINE configuration

See https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/2290/steps/14/logs/stdio

> Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
> ---
>  meta/lib/oeqa/selftest/cases/overlayfs.py | 126 ++++++++++++++++++++++
>  1 file changed, 126 insertions(+)
>  create mode 100644 meta/lib/oeqa/selftest/cases/overlayfs.py
> 
> diff --git a/meta/lib/oeqa/selftest/cases/overlayfs.py b/meta/lib/oeqa/selftest/cases/overlayfs.py
> new file mode 100644
> index 0000000000..74bf1c4167
> --- /dev/null
> +++ b/meta/lib/oeqa/selftest/cases/overlayfs.py
> @@ -0,0 +1,126 @@
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
> +    def test_distro_features_missing(self):
> +        """
> +        Summary:   Check that required DISTRO_FEATURES are set
> +        Expected:  Fail when either systemd or overlayfs are not in DISTRO_FEATURES
> +        Author:    Vyacheslav Yurkov <uvv.mail@gmail.com>
> +        """
> +
> +        config = """
> +OVERLAYFS_MOUNT_POINT[mnt-overlay] = "/mnt/overlay"
> +IMAGE_INSTALL_append = "overlayfs-user"
> +"""
> +        self.write_config(config)
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
> +OVERLAYFS_MOUNT_POINT[mnt-overlay] = "/mnt/overlay"
> +IMAGE_INSTALL_append = "overlayfs-user"
> +DISTRO_FEATURES += "systemd overlayfs"
> +"""
> +        self.write_config(config)
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
> +IMAGE_INSTALL_append = "overlayfs-user"
> +DISTRO_FEATURES += "systemd overlayfs"
> +"""
> +        self.write_config(config)
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
> +OVERLAYFS_MOUNT_POINT[usr-share-overlay] = "/usr/share/overlay"
> +IMAGE_INSTALL_append = "overlayfs-user"
> +DISTRO_FEATURES += "systemd overlayfs"
> +"""
> +        self.write_config(config)
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
> +OVERLAYFS_MOUNT_POINT[mnt-overlay] = "/mnt/overlay"
> +IMAGE_INSTALL_append = "overlayfs-user systemd-machine-units"
> +DISTRO_FEATURES += "systemd overlayfs"
> +"""
> +
> +        systemd_machine_unit_append = """
> +SYSTEMD_SERVICE_${PN} += " \
> +    mnt-overlay.mount \
> +"
> +
> +do_install() {
> +    install -d ${D}${systemd_unitdir}/system
> +    cat <<EOT > ${D}${systemd_unitdir}/system/mnt-overlay.mount
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
> +        self.write_config(config)
> +        self.write_recipeinc('systemd-machine-units', systemd_machine_unit_append)
> +        bitbake('core-image-minimal')
> -- 
> 2.28.0
> 

> 
> 
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
