Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 8117872F54
	for <openembedded-core@lists.openembedded.org>;
	Sat,  4 Mar 2017 10:38:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v24Ac7uE022821; Sat, 4 Mar 2017 10:38:07 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Hm2DZeB1xib6; Sat,  4 Mar 2017 10:38:07 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v24Ac40u022817
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 4 Mar 2017 10:38:06 GMT
Message-ID: <1488623884.22968.4.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ed Bartosh <ed.bartosh@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Date: Sat, 04 Mar 2017 10:38:04 +0000
In-Reply-To: <1488378511-18969-1-git-send-email-ed.bartosh@linux.intel.com>
References: <1488378511-18969-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH] sstate.bbclass: update .siginfo atime
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
X-List-Received-Date: Sat, 04 Mar 2017 10:38:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2017-03-01 at 16:28 +0200, Ed Bartosh wrote:
> .siginfo files are not being accessed from local or NFS-mounted
> sstate mirrors when sstate package is installed, so their atime
> is not updated. If sstate mirror is cleaned based on access time,
> they get deleted, even though they are still being used.
> 
> Updated atime of .siginfo symlinks with 'touch -a'. This command
> dereferences symlinks pointing to the local mirror and updates
> atime of the .siginfo file on the mirror.
> 
> [YOCTO #10857]
> 
> Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
> ---
>  meta/classes/sstate.bbclass | 2 ++
>  1 file changed, 2 insertions(+)

https://autobuilder.yoctoproject.org/main/builders/nightly-x86-64/builds/1138/steps/Running%20ESDK%20Sanity%20Tests/logs/stdio

rpurdie@opensuse132:~> less  /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86-64/build/build/tmp/work/qemux86_64-poky-linux/core-image-sato/1.0-r0/testsdkext/tmp/work/core2-64-poky-linux/meta-extsdk-toolchain/1.0-r0/temp/log.do_populate_sysroot_setscene.31530
DEBUG: Executing python function do_populate_sysroot_setscene
DEBUG: Executing shell function sstate_unpack_package
sysroot-destdir/
sysroot-destdir/sysroot-providers/
sysroot-destdir/sysroot-providers/meta-extsdk-toolchain
WARNING: /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86-64/build/build/tmp/work/qemux86_64-poky-linux/core-image-sato/1.0-r0/testsdkext/tmp/work/core2-64-poky-linux/meta-extsdk-toolchain/1.0-r0/temp/run.sstate_unpack_package.31530:1 exit 1 from '[ -h /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86-64/build/build/tmp/work/qemux86_64-poky-linux/core-image-sato/1.0-r0/testsdkext/sstate-cache/56/sstate:meta-extsdk-toolchain:core2-64-poky-linux:1.0:r0:core2-64:3:563a7c8c6206b04c5b117d6df021982b_populate_sysroot.tgz.siginfo ]'
DEBUG: Python function do_populate_sysroot_setscene finished

So it looks like this failure is from this patch somehow...

Cheers,

Richard

