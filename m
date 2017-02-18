Return-Path: <paul@paulbarker.me.uk>
Received: from slow1-d.mail.gandi.net (slow1-d.mail.gandi.net [217.70.178.86])
	by mail.openembedded.org (Postfix) with ESMTP id 93256601D3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Feb 2017 12:12:24 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
	[217.70.183.197])
	by slow1-d.mail.gandi.net (Postfix) with ESMTP id 7D1BF486486
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Feb 2017 13:11:53 +0100 (CET)
Received: from mfilter19-d.gandi.net (mfilter19-d.gandi.net [217.70.178.147])
	by relay5-d.mail.gandi.net (Postfix) with ESMTP id 8017041C087;
	Sat, 18 Feb 2017 13:11:51 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mfilter19-d.gandi.net
Received: from relay5-d.mail.gandi.net ([IPv6:::ffff:217.70.183.197])
	by mfilter19-d.gandi.net (mfilter19-d.gandi.net [::ffff:10.0.15.180])
	(amavisd-new, port 10024)
	with ESMTP id GyOEuIcBy0KK; Sat, 18 Feb 2017 13:11:50 +0100 (CET)
X-Originating-IP: 86.24.150.36
Received: from host0.betafive.co.uk
	(cpc15-shep11-2-0-cust35.8-3.cable.virginm.net [86.24.150.36])
	(Authenticated sender: paul@paulbarker.me.uk)
	by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id CFE7441C084;
	Sat, 18 Feb 2017 13:11:49 +0100 (CET)
Date: Sat, 18 Feb 2017 12:11:48 +0000
From: Paul Barker <paul@paulbarker.me.uk>
To: Bruce Ashfield <bruce.ashfield@windriver.com>,
	openembedded-core@lists.openembedded.org
Message-ID: <20170218121148.59d11d00@host0.betafive.co.uk>
X-Mailer: Claws Mail 3.14.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Subject: linux-yocto-dev currently trips do_kernel_version_sanity_check
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
X-List-Received-Date: Sat, 18 Feb 2017 12:12:24 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi all,

I've cloned the master branch of poky, ran oe-init-build-env then
edited local.conf to include the following line:

    PREFERRED_PROVIDER_virtual/kernel = "linux-yocto-dev"

After this I ran 'bitbake linux-yocto-dev' and got the following error:

    ERROR: linux-yocto-dev-4.9-rc++gitAUTOINC+a5183d8346_36439e87c8-r0 do_kernel_version_sanity_check: Package Version (4.9-rc++gitAUTOINC+a5183d8346_36439e87c8) does not match of kernel being built (4.10-rc8). Please update the PV variable to match the kernel source.
    ERROR: linux-yocto-dev-4.9-rc++gitAUTOINC+a5183d8346_36439e87c8-r0 do_kernel_version_sanity_check: Function failed: do_kernel_version_sanity_check (log file is located at .../poky/build/tmp/work/qemux86-poky-linux/linux-yocto-dev/4.9-rc++gitAUTOINC+a5183d8346_36439e87c8-r0/temp/log.do_kernel_version_sanity_check.30252)
    ERROR: Logfile of failure stored in: .../poky/build/tmp/work/qemux86-poky-linux/linux-yocto-dev/4.9-rc++gitAUTOINC+a5183d8346_36439e87c8-r0/temp/log.do_kernel_version_sanity_check.30252
    ERROR: Task (.../poky/meta/recipes-kernel/linux/linux-yocto-dev.bb:do_kernel_version_sanity_check) failed with exit code '1'

I found this problem whilst playing around with the
linux-raspberrypi_dev in meta-raspberrypi which also includes
linux-yocto.inc.

Should this task be disabled for linux-yocto-dev and similar recipes?
I'd be happy with PV = "4.9+git...." for anything in the 4.9 series
myself.

Thanks,
Paul

