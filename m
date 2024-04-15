Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1110C4345F
	for <webhook@archiver.kernel.org>; Mon, 15 Apr 2024 09:27:36 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web11.16887.1713173246342399931
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Apr 2024 02:27:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=S/A5HjYa;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-516cbf3fd3dso3715528e87.2
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Apr 2024 02:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713173244; x=1713778044; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cXxoLPVPjHABzJj61fHubv0UIbsubnitJ4OwplI4dhU=;
        b=S/A5HjYaqKWEmho3XduI2n7An8c+db8krPBuI86zibQQeWVBvwLGcHhvkq4dKMj7Wg
         dfgkMAPWJFCuXgW9aieTt6TQk4LZabDRvTONgvqRvhTTzLUvWoohrfQfoL4slT0rZyyR
         pNdqSWE77jqECsgmGmg4jhp87hNSBigoJhGhd3j7+/NvLJE4x4+I3tYGwpht24lvdyZ7
         uE+pqPbHYymqjgYh1HfoBKQpuGMEEOF7Ssn1bmK76/wg2XVmTOf7ot9DLTbb6cwJQlnY
         aXe5C2RUQJaxgwMJuONQrKpBiylC77uQEOamJU1gNGRZq8HY+hUUrTx8EgBfdqvL81go
         BZqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713173244; x=1713778044;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cXxoLPVPjHABzJj61fHubv0UIbsubnitJ4OwplI4dhU=;
        b=q/Rmmg95WIWiPZja4ydoZZImZiw7drPo7g8GXZKkwuLIICX9UE4KkBRnWyzZXc6A01
         6HWYR7iO2g27lRk1W0mjjjc7pZejGSOPqv7p4sd54NpjHZJM/sFXTKP9Yw40VVVVctK+
         ei8fm4yeLESLgZkcmonPHu06B11/4/eac4j7RVz8rPt6mEacpgZBewoxkAE/RFeWy3Ft
         3bF720E6fdWhNdrPjnnAbJTI0itsmI8W3vpTzbM7Dr0SYs0sztDTVisv9Xl9QpSwdWuG
         /SqrCRnHndapPSwHo4Y7rdEPMOEOidCcPfyRRK2u8ew5YcVIRVb4j0H0r2CLrLBnDqIm
         gKgQ==
X-Gm-Message-State: AOJu0YwwtJbKBPiQmJxbLc91dt4nrlmvtdrO4c7C8snOdpNlNYfdosmK
	yp7rxQa06tIOhm8q4NOKYnEeABWxCM2oS6DNGInfZt0vdCU8MXqg8RPW10YM/63Qzbt2vW1eTDP
	Gih1NNAnHIzr+DpTQ8K1pTB6b1YU=
X-Google-Smtp-Source: AGHT+IFU2haXLBdgxeD80UXsc66awrZaj3gvLfT992mypF6DZJuTdXGi4T4/7Skp/nWz6XXKbEO/DhBSrxkeDK6oSUg=
X-Received: by 2002:a2e:a718:0:b0:2d6:dba1:6d37 with SMTP id
 s24-20020a2ea718000000b002d6dba16d37mr6102811lje.11.1713173244192; Mon, 15
 Apr 2024 02:27:24 -0700 (PDT)
MIME-Version: 1.0
References: <20240413055421.210001-1-michael.opdenacker@bootlin.com>
In-Reply-To: <20240413055421.210001-1-michael.opdenacker@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 15 Apr 2024 11:27:12 +0200
Message-ID: <CANNYZj8-kuEEqTniboP1Pxmh9kv9K8cTfSQ+P_oo4cUV8rt_eQ@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH] scripts: new oe-test-system-upgrade test
To: michael.opdenacker@bootlin.com
Cc: openembedded-core@lists.openembedded.org, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Bruce Ashfield <bruce.ashfield@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Apr 2024 09:27:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198225

The standalone script almost certainly needs to rewritten as a
selftest, unless there's some other reason it should be living in
scripts/.

Alex

On Sat, 13 Apr 2024 at 07:54, Michael Opdenacker via
lists.openembedded.org
<michael.opdenacker=bootlin.com@lists.openembedded.org> wrote:
>
> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
>
> Proof of concept "testimage" test to check whether the generated
> package feeds can be used to update an older image provided
> by the Yocto Project autobuilder.
>
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> Suggested-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> CC: Bruce Ashfield <bruce.ashfield@gmail.com>
>
> ---
>
> Tested on the latest master against yocto-5.0_M3
> A bit surprised that only one package got upgraded:
>
> DEBUG: Command: opkg upgrade
> Status: 0 Output:  Upgrading libexpat1 (2.6.1-r0) to libexpat1 (2.6.2) on root
> Downloading http://192.168.7.1:44893/core2-64/libexpat1_2.6.2-r0_core2-64.ipk.
> Removing obsolete file /usr/lib/libexpat.so.1.9.1.
> Configuring libexpat1.
>
> Test with a more complete image than core-image-full-cmdline?
> ---
>  .../lib/oeqa/runtime/cases/opkg_sysupgrade.py | 71 +++++++++++++++++++
>  scripts/oe-test-system-upgrade                | 34 +++++++++
>  2 files changed, 105 insertions(+)
>  create mode 100644 meta/lib/oeqa/runtime/cases/opkg_sysupgrade.py
>  create mode 100755 scripts/oe-test-system-upgrade
>
> diff --git a/meta/lib/oeqa/runtime/cases/opkg_sysupgrade.py b/meta/lib/oeqa/runtime/cases/opkg_sysupgrade.py
> new file mode 100644
> index 0000000000..7431db9198
> --- /dev/null
> +++ b/meta/lib/oeqa/runtime/cases/opkg_sysupgrade.py
> @@ -0,0 +1,71 @@
> +#
> +# Copyright OpenEmbedded Contributors
> +#
> +# Test that generated ipk packages can be used to upgrade
> +# an older image version.
> +#
> +# This is done by the scripts/oe-test-system-upgrade script
> +# replacing the fresh generated image by the older image
> +# generated by the Yocto Project autobuilder.
> +#
> +# Here, we then replace the original package feeds by our own.
> +# This test is not meant to be used as a regular "testimage" test
> +# run on the fresh image.
> +#
> +# SPDX-License-Identifier: MIT
> +#
> +
> +import os
> +from oeqa.utils.httpserver import HTTPService
> +from oeqa.runtime.case import OERuntimeTestCase
> +from oeqa.core.decorator.data import skipIfNotDataVar, skipIfNotFeature, skipIfFeature
> +from oeqa.runtime.decorator.package import OEHasPackage
> +
> +class OpkgSysUpgradeTest(OERuntimeTestCase):
> +
> +    def pkg(self, command, expected = 0):
> +        command = 'opkg %s' % command
> +        status, output = self.target.run(command, 1500)
> +        message = os.linesep.join([command, output])
> +        self.assertEqual(status, expected, message)
> +        return output
> +
> +class OpkgRepoTest(OpkgSysUpgradeTest):
> +
> +    @classmethod
> +    def setUp(cls):
> +        service_repo = os.path.join(cls.tc.td['DEPLOY_DIR_IPK'])
> +        cls.repo_server = HTTPService(service_repo,
> +                                      '0.0.0.0', port=cls.tc.target.server_port,
> +                                      logger=cls.tc.logger)
> +        cls.repo_server.start()
> +
> +    @classmethod
> +    def tearDown(cls):
> +        cls.repo_server.stop()
> +
> +    def setup_source_config_for_package_install(self):
> +        source_server = 'http://%s:%s' % (self.tc.target.server_ip, self.repo_server.port)
> +        sourceslist_dir = '/etc/opkg'
> +        pkgarch = self.tc.td["TUNE_PKGARCH"]
> +        machinedir = self.tc.td["MACHINE"].replace("-", "_")
> +        self.target.run('cd %s; echo src/gz all %s/all > base-feeds.conf' % (sourceslist_dir, source_server))
> +        self.target.run('cd %s; echo src/gz %s %s/%s >> base-feeds.conf' % (sourceslist_dir, pkgarch, source_server, pkgarch))
> +        self.target.run('cd %s; echo src/gz %s %s/%s >> base-feeds.conf' % (sourceslist_dir, machinedir, source_server, machinedir))
> +
> +    def cleanup_source_config_for_package_install(self):
> +        sourceslist_dir = '/etc/opkg'
> +        self.target.run('rm -rf %s; mv %s.orig %s' % (sourceslist_dir, sourceslist_dir, sourceslist_dir))
> +
> +    @skipIfNotFeature('package-management',
> +                      'Test requires package-management to be in IMAGE_FEATURES')
> +    @skipIfNotDataVar('IMAGE_PKGTYPE', 'ipk',
> +                      'IPK is not the primary package manager')
> +    @skipIfFeature('read-only-rootfs',
> +                   'Test does not work with read-only-rootfs in IMAGE_FEATURES')
> +    @OEHasPackage(['opkg'])
> +    def test_opkg_system_upgrade_from_repo(self):
> +        self.setup_source_config_for_package_install()
> +        self.pkg('update')
> +        self.pkg('upgrade')
> +
> diff --git a/scripts/oe-test-system-upgrade b/scripts/oe-test-system-upgrade
> new file mode 100755
> index 0000000000..0d36a70a8a
> --- /dev/null
> +++ b/scripts/oe-test-system-upgrade
> @@ -0,0 +1,34 @@
> +#!/bin/sh
> +# Proof of concept script to test that generated ipk packages can
> +# be used to upgrade an older image version.
> +#
> +# This is done by generating an image but then replacing it
> +# by an older image shared by the Yocto Project autobuilder.
> +# We then run QEMU on the old image and replace the original
> +# original package feeds by our own.
> +
> +IMAGE=core-image-full-cmdline
> +MILESTONE=yocto-5.0_M3
> +MACHINE=qemux86-64
> +MACHINE_VARIANT=-alt
> +IMAGE_FILE=$IMAGE-$MACHINE.rootfs.ext4
> +IMAGE_PATH=tmp/deploy/images/$MACHINE/$IMAGE_FILE
> +PACKAGE_TYPE=ipk
> +
> +# Need a configuration with poky-alt, package_management, ipk package
> +# Need to build a full image to build the .json file needed by QEMU.
> +# Therefore, it is not sufficient to run only "package_write_ipk" for the image.
> +
> +bitbake $IMAGE
> +bitbake package-index
> +
> +# Download image to test
> +# Remove the link to the generated image if any
> +
> +rm -f $IMAGE_PATH
> +wget -O $IMAGE_PATH https://downloads.yoctoproject.org/releases/yocto/milestones/$MILESTONE/machines/qemu/$MACHINE$MACHINE_VARIANT/$IMAGE_FILE
> +
> +# Run test
> +
> +echo "TEST_SUITES=\"opkg_sysupgrade\"" > conf/auto.conf
> +bitbake $IMAGE -c testimage
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#198191): https://lists.openembedded.org/g/openembedded-core/message/198191
> Mute This Topic: https://lists.openembedded.org/mt/105496743/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

