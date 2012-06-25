Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1SjIyU-0000nv-Ed
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Jun 2012 01:45:42 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 25 Jun 2012 16:34:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="162529767"
Received: from unknown (HELO envy.home) ([10.255.12.249])
	by orsmga002.jf.intel.com with ESMTP; 25 Jun 2012 16:34:46 -0700
Message-ID: <4FE8F542.2070304@linux.intel.com>
Date: Mon, 25 Jun 2012 16:33:22 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Enigmail-Version: 1.4.2
Subject: kernel: building target-arch scripts/* to include in kernel-headers package
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 25 Jun 2012 23:45:42 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

I'm working on a patch series to provide a kernel-headers package which
allows for the compilation of Linux kernel modules on the target. I
currently have something working, but it requires that I first build the
scripts/* binaries on the target, prior to trying to build a module.

	# cd /usr/src/kernel-headers
	# make scripts

Then I can build modules:

	# cd /home/root/hello-mod/files
	# export KERNEL_SRC=/usr/src/kernel-headers
	# make

And test:

	# insmod hello.ko
	# rmmod hello.ko
	# dmesg | tail -n2
	Hello World!
	Goodbye Cruel World!

I would like to package the target-arch scripts binaries with the
kernel-headers package, but I'm not sure how to go about building both
the native and the target binaries as part of the kernel building
process. Does it make sense to build these as part of the do_install()
task after I've moved the files from the linux recipe's workdir and
removed the host-arch binaries from scripts?

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel



