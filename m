Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 98BA960698
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Aug 2013 10:09:23 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r7GAKPeK006160; Fri, 16 Aug 2013 11:20:25 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ZFKmJ8U6rD4A; Fri, 16 Aug 2013 11:20:25 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r7GAKKJs006132
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Fri, 16 Aug 2013 11:20:22 +0100
Message-ID: <1376647731.22952.114.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Saul Wold <sgw@linux.intel.com>
Date: Fri, 16 Aug 2013 11:08:51 +0100
In-Reply-To: <cover.1376580529.git.sgw@linux.intel.com>
References: <cover.1376580529.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: paul.eggleton@linux.intel.com, clarson@kergoth.com,
	openembedded-core@lists.openembedded.org
Subject: Re: [CONSOLIDATED PULL 00/32] Ready for Final ACK & Pull
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
X-List-Received-Date: Fri, 16 Aug 2013 10:09:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-08-15 at 08:32 -0700, Saul Wold wrote:
> Richard,
> 
> I updated this by removing the connman patch as suggested by Ross. I
> chose to leave in the Read-Only rootfs, as I have talked with Qi and
> I will have him send a follow on patch to fix the internal patch header.
> 
> I have tested the read-only stuff locally.
> 
> Thanks
> 	Sau!
> The following changes since commit 57662d4f813d5795cac1529633db80a09efdb089:
> 
>   meta-skeleton: Add busybox config fragment example (2013-08-13 23:03:44 +0100)
> 
> are available in the git repository at:
> 
>   git://git.openembedded.org/openembedded-core-contrib sgw/stage
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage
> 
> Chen Qi (14):
>   opkg.inc: remove the obsolete POSTLOG variable
>   makedevs: support using user/group names in device table files
>   image.bbclass: create device table after package installation
>   device_table-minimal.txt: use user/group names instead of uid/gid
>   init-live.sh: make $ROOT_MOUNT/media writable when necessary
>   use a uniform way to determine whether rootfs is read-only

I don't like the above patch since it spawns a ton of processes at boot
time. We can do better...

>   udev: remove implicit dependency on initscripts
>   populate-volatile.sh: use $ROOT_DIR/var/volatile/tmp as TMPDIR
>   populate-volatile.sh: don't spawn background process at rootfs time
>   runqemu-internal: fix to start X correctly in live images
>   initscripts: use a uniform way to handle directories in read-only
>     rootfs
>   populate-volatile.sh: use 'cp -a' to avoid potential problem
>   irda-utils: fix for read-only rootfs
>   openssh: fix for read-only rootfs
> 
> Cristiana Voicu (1):
>   systemtap: upgrade to 2.3
> 
> Martin Jansa (5):
>   at-spi2-core: add intltool-native dependency
>   gst-plugins-gl: add dependency on glew
>   xeyes: add dependency on libxrender
>   xrestop: add dependency on ncurses
>   qemu, default-providers: Add mesa as default virtual/egl
> 
> Muhammad Shakeel (3):
>   lighttpd: Replace spaces with tabs in shell function
>   rpcbind: Replace spaces with tabs in shell function
>   nfs-utils: Replace spaces with tabs in shell function
> 
> Otavio Salvador (1):
>   linux-dtb: Use kernel build system to generate the dtb files
> 
> Ross Burton (4):
>   cogl: GL/GLX feature cleanup
>   libmatchbox: upgrade to 1.11
>   matchbox-wm: fix icon handling on 64-bit hosts
>   wipe-sysroots: don't assume TMPDIR is under BUILDDIR
> 
> Saul Wold (2):
>   meta-skeleton: layer.conf Should also have .bbappend in example
>   texinfo: add perl RDEPENDS and fix up packaging
> 
> Stefan Herbrechtsmeier (1):
>   cmake.bbclass: Don't use packages from the native build machine
> 
> Wenzong Fan (1):
>   oe/path.py: call /bin/cp directly

Seriously? No. Add a sanity check and tell the user to fix their
environment if it will cause problems. There are a ton of other places
cp might fail have this issue, we're not hardcoding all of them.

Cheers,

Richard




