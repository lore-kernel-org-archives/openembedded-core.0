Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ACC5D4400A
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 16:21:19 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.45948.1731946875861379610
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Nov 2024 08:21:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=kwfExbrO;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2F60660005;
	Mon, 18 Nov 2024 16:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731946874;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PktGkb1FUYftaIMl2vAt6mo8Dk6X073qfvHc+tjVS0Q=;
	b=kwfExbrOSDjrZEXZ3vnSAcFfc3Dof18kUWD/zERzgGAjr4NFaQG58AVs5qzaN4Lh8k/qvc
	4xQzpRD2Kz+TIGnzGXjhl6cVvaY2YiAmiPbLkEFEXii3AZzeo+1EYRdZEHFdHJ948DERSf
	gJQjilCx1RQIPoBTSIiwOwgZBgOZLemBaizw1eRBxiKgCGvdHElx6CDFoIva40V/AY552T
	dcDJ1zmQgYActuqT9ulWzUocmriD2hvIVGzyUzMAvH/gwCKUPa8xSkCxbt087CZelHj9Bh
	kElDW3sq/lAOrkPBZ3Pe9BdyyPr2mCVWNk5ZOFhA+rzn5SKPJsJmEGOCe4FwqA==
Date: Mon, 18 Nov 2024 17:21:11 +0100
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
To: "Mingyu Wang (Fujitsu)" <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 07/47] gawk: upgrade 5.3.0 -> 5.3.1
Message-ID: <ZztpdwDKMBRDYfQx@bootlin-mathieu>
Mail-Followup-To: "Mingyu Wang (Fujitsu)" <wangmy@fujitsu.com>,
	openembedded-core@lists.openembedded.org
References: <1731403483-21399-1-git-send-email-wangmy@fujitsu.com>
 <1731403483-21399-7-git-send-email-wangmy@fujitsu.com>
 <ZznjAnJKfH8f_mxL@bootlin-mathieu>
 <TYWPR01MB1186132D4B68C5FBF61008C73DC272@TYWPR01MB11861.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TYWPR01MB1186132D4B68C5FBF61008C73DC272@TYWPR01MB11861.jpnprd01.prod.outlook.com>
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 16:21:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207221

On Mon, Nov 18, 2024 at 01:36:47PM +0000, Mingyu Wang (Fujitsu) wrote:
> I didn't find ptest error of gawk from the log.
> I did the ptest of gawk by running ptest-runner and there's no error occurred.
> Can you tell me how to reproduce the error.
> 

Ok, reproducing the ptest build locally is indeed not straightforward. I
used the following procedure to reproduce something close to the setup we have
on the autobuilder, and I did reproduce the ptest failure.

First, if you want to use the exact same branch, you can take
mathieu/master-next-e78c1f31b592 from
git://git.yoctoproject.org/poky-contrib.

Then, I created a new empty configuration and added entries in
local.conf, to correspond roughly to what is described in
https://git.yoctoproject.org/yocto-autobuilder2/tree/config.py. There is
probably a lot of things not relevant here, but it was good enough to
build and reproduce locally.

rm -rf build
source poky/oe-init-build-env
QEMU_USE_KVM = 'True'
INHERIT += 'report-error'
PREMIRRORS = ''
BB_GENERATE_MIRROR_TARBALLS = '1'
BB_NUMBER_THREADS = '16'
BB_NUMBER_PARSE_THREADS = '16'
PARALLEL_MAKE = '-j 16 -l 75'
BB_PRESSURE_MAX_CPU = '20000'
BB_PRESSURE_MAX_IO = '20000'
XZ_MEMLIMIT = '5%'
XZ_THREADS = '8'
ZSTD_THREADS = '8'
BB_TASK_NICE_LEVEL = '5'
BB_TASK_NICE_LEVEL:task-testimage = '0'
BB_TASK_IONICE_LEVEL = '2.7'
BB_TASK_IONICE_LEVEL:task-testimage = '2.1'
IMAGE_CLASSES += 'testimage'
TEST_QEMUBOOT_TIMEOUT = '1500'
SANITY_TESTED_DISTROS = ''
SDK_EXT_TYPE = 'minimal'
SDK_INCLUDE_TOOLCHAIN = '1'
ESDK_LOCALCONF_REMOVE:append = 'BB_HASHSERVE'
BB_DISKMON_DIRS = 'STOPTASKS,${TMPDIR},1G,100K STOPTASKS,${DL_DIR},1G
STOPTASKS,${SSTATE_DIR},1G STOPTASKS,/tmp,100M,30K
HALT,${TMPDIR},100M,1K HALT,${DL_DIR},100M HALT,${SSTATE_DIR},100M
HALT,/tmp,10M,1K'
BB_HEARTBEAT_EVENT = '60'
BB_LOG_HOST_STAT_ON_INTERVAL = '1'
BB_LOG_HOST_STAT_CMDS_INTERVAL = 'oe-time-dd-test.sh -c 100 -t 3'
BB_LOG_HOST_STAT_ON_FAILURE = '1'
BB_LOG_HOST_STAT_CMDS_FAILURE = 'oe-time-dd-test.sh -l'
SDK_TOOLCHAIN_LANGS += 'rust'
BB_SERVER_TIMEOUT = '60'
BB_LOADFACTOR_MAX = '1.5'

TEST_SUITES = 'ping ssh ptest'
INHERIT += 'image-buildinfo'
IMAGE_BUILDINFO_VARS:append = ' IMAGE_BASENAME IMAGE_NAME'
EOF

Then built my image and ran ptests. The runqemu-gen-tapdevs might or
might not be needed, more details in
documentation/dev-manual/runtime-testing.rst.

bitbake core-image-ptest-gawk
sudo ${BUILDDIR}/../scripts/runqemu-gen-tapdevs 1000 4
bitbake core-image-ptest-gawk:do_testimage

And I got this output:

WARNING: core-image-ptest-gawk-1.0-r0 do_testimage: There were failing ptests.
Traceback (most recent call last):
  File "/home/mathieu/projects/swat/builds/poky-contrib/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
           ^^^^^^^^^^^^^^^^^^^^^
  File "/home/mathieu/projects/swat/builds/poky-contrib/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
           ^^^^^^^^^^^^^^^^^^^^^
  File "/home/mathieu/projects/swat/builds/poky-contrib/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
           ^^^^^^^^^^^^^^^^^^^^^
  File "/home/mathieu/projects/swat/builds/poky-contrib/meta/lib/oeqa/runtime/cases/ptest.py", line 27, in test_ptestrunner_expectfail
    self.do_ptestrunner()
  File "/home/mathieu/projects/swat/builds/poky-contrib/meta/lib/oeqa/runtime/cases/ptest.py", line 120, in do_ptestrunner
    self.fail(failmsg)
AssertionError: 
Failed ptests:
{'gawk': ['printf-corners']}

-- 
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

