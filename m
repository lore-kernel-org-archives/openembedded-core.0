Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QHOAV-0000bJ-Jl
	for openembedded-core@lists.openembedded.org;
	Wed, 04 May 2011 00:34:11 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p43MVVr3002997
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 3 May 2011 15:31:31 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.228) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Tue, 3 May 2011 15:31:31 -0700
Message-ID: <4DC08242.4030009@windriver.com>
Date: Tue, 3 May 2011 17:31:30 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.2.17) Gecko/20110414 Thunderbird/3.1.10
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <BANLkTikxo4jWt7zKciXt1w4iiJYHg=WnqQ@mail.gmail.com>
In-Reply-To: <BANLkTikxo4jWt7zKciXt1w4iiJYHg=WnqQ@mail.gmail.com>
Subject: Re: error: LOOP: udev/ libudev during do_rootfs?
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
X-List-Received-Date: Tue, 03 May 2011 22:34:12 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 5/3/11 5:19 PM, Leon Woestenberg wrote:
> Hello,
> 
> on oe-core I'm testing the addition of powerpc-linux-gnuspe targets.
> Everything runs fine up to do_rootfs where I hit this "LOOP" error
> which I found rather cryptic:
> 
> Seems a cyclic loop dependency. I have never seen this error, does
> this ring a bell with someone?
> 
> | error: LOOP:
> | error: removing udev-164-r1.ppce500v2 "Requires: libudev0 >= 164"
> from tsort relations.
> | error: removing libudev0-164-r1.ppce500v2 "Requires: udev = 164-r1"
> from tsort relations.
> | Preparing...                ##################################################
> | ERROR: Function 'do_rootfs' failed

The above is misleading.  The "error: LOOP:" is an installation warning, due to
having a dependency loop.  It is not itself an error.

...

> | + rpm --dbpath /var/lib/rpm '--define=_openall_before_chroot 1'
> --root /home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/work/p2020rdb-poky-linux-gnuspe/core-image-minimal-1.0-r0/rootfs
> --predefine '_rpmds_sysinfo_path
> /home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/work/p2020rdb-poky-linux-gnuspe/core-image-minimal-1.0-r0/rootfs/etc/rpm/sysinfo'
> --predefine '_rpmrc_platform_path
> /home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/work/p2020rdb-poky-linux-gnuspe/core-image-minimal-1.0-r0/rootfs/etc/rpm/platform'
> -D '_dbpath /var/lib/rpm' --noscripts --notriggers --noparentdirs
> --nolinktos -D '__dbi_txn create nofsync private' -Uhv
> /home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/work/p2020rdb-poky-linux-gnuspe/core-image-minimal-1.0-r0/rootfs/install/install_solution.manifest
> | error: LOOP:
> | error: removing busybox-1.17.3-r2.ppce500v2 "Requires(hint):
> busybox-udhcpc" from tsort relations.
> | error: removing busybox-udhcpc-1.17.3-r2.ppce500v2 "Requires(post):
> /bin/sh" from tsort relations.
> | error: LOOP:
> | error: removing busybox-syslog-1.17.3-r2.ppce500v2 "Requires(post):
> /bin/sh" from tsort relations.
> | error: removing busybox-1.17.3-r2.ppce500v2 "Requires(hint):
> busybox-syslog" from tsort relations.
> | error: LOOP:
> | error: removing udev-164-r1.ppce500v2 "Requires: libudev0 >= 164"
> from tsort relations.
> | error: removing libudev0-164-r1.ppce500v2 "Requires: udev = 164-r1"
> from tsort relations.
> | Preparing...                ##################################################
> | ERROR: Function 'do_rootfs' failed (see
> /home/leon/sandbox/sidebranch/yocto/oe-core/build/tmp/work/p2020rdb-poky-linux-gnuspe/core-image-minimal-1.0-r0/temp/log.do_rootfs.12166
> for further information)
> NOTE: package core-image-minimal-1.0-r0: task do_rootfs: Failed
> ERROR: Task 8 (/home/leon/sandbox/sidebranch/yocto/oe-core/meta/recipes-core/images/core-image-minimal.bb,
> do_rootfs) failed with exit code '1'
> ERROR: '/home/leon/sandbox/sidebranch/yocto/oe-core/meta/recipes-core/images/core-image-minimal.bb'
> failed

In the past I've only seen this type of "mystery" failure when PSEUDO was not be
run properly.  (pseudo is being configured by the "bitbake" wrapper, located in
the scripts directory.  It has to be preloaded by the wrapper for performance
reasons during the build.)  If you are not using the bitbake wrapper script
(automatically added to your environment when you use the environment setup
script oe-init-build-env) you will need to either use the environment setup
script, or add the wrapper to your path [or call it directly].

If the wrapper is being invoked, I have some further checks to verify behavior
on your system.

If the failures continue, what type of host system do you have (distro), and
what version of libc?  Do you have both 32-bit and 64-bit libraries and
executables installed?

--Mark

> Regards,



