Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD7BEC52D6F
	for <webhook@archiver.kernel.org>; Sat, 24 Aug 2024 12:55:05 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.12392.1724504097561528486
 for <openembedded-core@lists.openembedded.org>;
 Sat, 24 Aug 2024 05:54:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=NlmWsXLQ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 43E36240002;
	Sat, 24 Aug 2024 12:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724504095;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Lsa3St0q0r8TK+Zor+VD+K8ElmKgmzAXt/biHE8FZWk=;
	b=NlmWsXLQ6letCAS4Td4mmahz9U61o9hQk2ZBX0XQc2A6OuFYxoSlgeso+wcwqOiud75oFr
	k2Ouho9YKsqadgI/AFaBlHVAiY3tEec4v+bMqRmC/MTOqCMbbuEm0yVTS0a8jNLftNRzeI
	big0AS4PMUb2kuAW/bBUVaNPo4QJf5qbI/KsLgHQnskX1FCjj4XxroxK8cMLiIAF938NPe
	o854lC2nScXZCpH922aaxQ1M4vX4Gad7WaPvYclboYZHDxORB2cQx46+7GJUCr6ouItdyQ
	ouZ2AjEOonwGDBg6tv1A+ZLouBVUsciY3XvQSMcSmfp66Gf6M2IfgeSUkMEZyg==
Date: Sat, 24 Aug 2024 14:54:54 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCHv2 2/2] oeqa/selftest/bbclasses: Add tests for
 systemd and update-rc.d interaction
Message-ID: <202408241254541c6af4cb@mail.local>
References: <20240823170633.2776886-1-pkj@axis.com>
 <20240823170633.2776886-2-pkj@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240823170633.2776886-2-pkj@axis.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 24 Aug 2024 12:55:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203712

Hello,

This causes the following failures on the AB:

https://autobuilder.yoctoproject.org/typhoon/#/builders/131/builds/4746/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/102/builds/6435/steps/15/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/107/builds/6486/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/109/builds/8223/steps/15/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/101/builds/8110/steps/14/logs/stdio

Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/qemux86-alt/build/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
  File "/home/pokybuild/yocto-worker/qemux86-alt/build/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
  File "/home/pokybuild/yocto-worker/qemux86-alt/build/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
  [Previous line repeated 1 more time]
  File "/home/pokybuild/yocto-worker/qemux86-alt/build/meta/lib/oeqa/runtime/cases/opkg.py", line 59, in test_opkg_install_from_repo
    self.pkg('install run-postinsts-dev')
  File "/home/pokybuild/yocto-worker/qemux86-alt/build/meta/lib/oeqa/runtime/cases/opkg.py", line 19, in pkg
    self.assertEqual(status, expected, message)
AssertionError: 255 != 0 : opkg install run-postinsts-dev
Synchronizing state of run-postinsts.service with SysV service script with /usr/lib/systemd/systemd-sysv-install.
Executing: /usr/lib/systemd/systemd-sysv-install enable run-postinsts
Failed to execute /usr/lib/systemd/systemd-sysv-install: No such file or directory
error: pkg_run_script: package "run-postinsts" postinst script returned status 1.
error: opkg_configure: run-postinsts.postinst returned 1.

On 23/08/2024 19:06:33+0200, Peter Kjellerstedt wrote:
> These tests verify that the correct files are left behind when systemd
> is inherited and depending on whether the systemd and/or sysvinit distro
> features are enabled.
> 
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
> 
> PATCHv2:
> * Change LICENSE to MIT for the test recipes.
> * Add EXCLUDE_FROM_WORLD to the test recipes.
> 
>  .../bbclasses/systemd-and-sysvinit.bb         |  17 +++
>  .../recipes-test/bbclasses/systemd-only.bb    |  12 ++
>  meta/lib/oeqa/selftest/cases/bbclasses.py     | 106 ++++++++++++++++++
>  3 files changed, 135 insertions(+)
>  create mode 100644 meta-selftest/recipes-test/bbclasses/systemd-and-sysvinit.bb
>  create mode 100644 meta-selftest/recipes-test/bbclasses/systemd-only.bb
>  create mode 100644 meta/lib/oeqa/selftest/cases/bbclasses.py
> 
> diff --git a/meta-selftest/recipes-test/bbclasses/systemd-and-sysvinit.bb b/meta-selftest/recipes-test/bbclasses/systemd-and-sysvinit.bb
> new file mode 100644
> index 0000000000..f9fc59a494
> --- /dev/null
> +++ b/meta-selftest/recipes-test/bbclasses/systemd-and-sysvinit.bb
> @@ -0,0 +1,17 @@
> +LICENSE = "MIT"
> +
> +inherit allarch systemd update-rc.d
> +
> +do_install() {
> +	install -d ${D}${systemd_system_unitdir}
> +	touch ${D}${systemd_system_unitdir}/${BPN}.service
> +
> +	install -d ${D}${INIT_D_DIR}
> +	touch ${D}${INIT_D_DIR}/${BPN}
> +}
> +
> +INITSCRIPT_NAME = "${BPN}"
> +
> +SYSTEMD_SERVICE:${PN} = "${BPN}.service"
> +
> +EXCLUDE_FROM_WORLD="1"
> diff --git a/meta-selftest/recipes-test/bbclasses/systemd-only.bb b/meta-selftest/recipes-test/bbclasses/systemd-only.bb
> new file mode 100644
> index 0000000000..590a27b9cb
> --- /dev/null
> +++ b/meta-selftest/recipes-test/bbclasses/systemd-only.bb
> @@ -0,0 +1,12 @@
> +LICENSE = "MIT"
> +
> +inherit allarch systemd
> +
> +do_install() {
> +	install -d ${D}${systemd_system_unitdir}
> +	touch ${D}${systemd_system_unitdir}/${BPN}.service
> +}
> +
> +SYSTEMD_SERVICE:${PN} = "${BPN}.service"
> +
> +EXCLUDE_FROM_WORLD="1"
> diff --git a/meta/lib/oeqa/selftest/cases/bbclasses.py b/meta/lib/oeqa/selftest/cases/bbclasses.py
> new file mode 100644
> index 0000000000..10545ebe65
> --- /dev/null
> +++ b/meta/lib/oeqa/selftest/cases/bbclasses.py
> @@ -0,0 +1,106 @@
> +#
> +# Copyright OpenEmbedded Contributors
> +#
> +# SPDX-License-Identifier: MIT
> +#
> +
> +from oeqa.selftest.case import OESelftestTestCase
> +from oeqa.utils.commands import get_bb_vars, bitbake
> +
> +class Systemd(OESelftestTestCase):
> +    """
> +    Tests related to the systemd bbclass.
> +    """
> +
> +    def getVars(self, recipe):
> +        self.bb_vars = get_bb_vars(
> +            [
> +                'BPN',
> +                'D',
> +                'INIT_D_DIR',
> +                'prefix',
> +                'systemd_system_unitdir',
> +                'sysconfdir',
> +            ],
> +            recipe,
> +        )
> +
> +    def fileExists(self, filename):
> +        self.assertExists(filename.format(**self.bb_vars))
> +
> +    def fileNotExists(self, filename):
> +        self.assertNotExists(filename.format(**self.bb_vars))
> +
> +    def test_systemd_in_distro(self):
> +        """
> +        Summary:    Verify that no sysvinit files are installed when the
> +                    systemd distro feature is enabled, but sysvinit is not.
> +        Expected:   Systemd service file exists, but /etc does not.
> +        Product:    OE-Core
> +        Author:     Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> +        """
> +
> +        self.write_config("""
> +DISTRO_FEATURES:append = " systemd usrmerge"
> +DISTRO_FEATURES:remove = "sysvinit"
> +VIRTUAL-RUNTIME_init_manager = "systemd"
> +""")
> +        bitbake("systemd-only systemd-and-sysvinit -c install")
> +
> +        self.getVars("systemd-only")
> +        self.fileExists("{D}{systemd_system_unitdir}/{BPN}.service")
> +
> +        self.getVars("systemd-and-sysvinit")
> +        self.fileExists("{D}{systemd_system_unitdir}/{BPN}.service")
> +        self.fileNotExists("{D}{sysconfdir}")
> +
> +    def test_systemd_and_sysvinit_in_distro(self):
> +        """
> +        Summary:    Verify that both systemd and sysvinit files are installed
> +                    when both the systemd and sysvinit distro features are
> +                    enabled.
> +        Expected:   Systemd service file and sysvinit initscript exist.
> +        Product:    OE-Core
> +        Author:     Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> +        """
> +
> +        self.write_config("""
> +DISTRO_FEATURES:append = " systemd sysvinit usrmerge"
> +VIRTUAL-RUNTIME_init_manager = "systemd"
> +""")
> +        bitbake("systemd-only systemd-and-sysvinit -c install")
> +
> +        self.getVars("systemd-only")
> +        self.fileExists("{D}{systemd_system_unitdir}/{BPN}.service")
> +
> +        self.getVars("systemd-and-sysvinit")
> +        self.fileExists("{D}{systemd_system_unitdir}/{BPN}.service")
> +        self.fileExists("{D}{INIT_D_DIR}/{BPN}")
> +
> +    def test_sysvinit_in_distro(self):
> +        """
> +        Summary:    Verify that no systemd service files are installed when the
> +                    sysvinit distro feature is enabled, but systemd is not.
> +        Expected:   The systemd  service file does not exist, nor does /usr.
> +                    The sysvinit initscript exists.
> +        Product:    OE-Core
> +        Author:     Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> +        """
> +
> +        self.write_config("""
> +DISTRO_FEATURES:remove = "systemd"
> +DISTRO_FEATURES:append = " sysvinit usrmerge"
> +VIRTUAL-RUNTIME_init_manager = "sysvinit"
> +""")
> +        bitbake("systemd-only systemd-and-sysvinit -c install")
> +
> +        self.getVars("systemd-only")
> +        self.fileNotExists("{D}{systemd_system_unitdir}/{BPN}.service")
> +        self.fileNotExists("{D}{prefix}")
> +        self.fileNotExists("{D}{sysconfdir}")
> +        self.fileExists("{D}")
> +
> +        self.getVars("systemd-and-sysvinit")
> +        self.fileNotExists("{D}{systemd_system_unitdir}/{BPN}.service")
> +        self.fileNotExists("{D}{prefix}")
> +        self.fileExists("{D}{INIT_D_DIR}/{BPN}")

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#203702): https://lists.openembedded.org/g/openembedded-core/message/203702
> Mute This Topic: https://lists.openembedded.org/mt/108059587/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

