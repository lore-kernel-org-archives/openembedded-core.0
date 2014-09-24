Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 1CFED715D4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Sep 2014 17:58:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s8OHwtGa031787; Wed, 24 Sep 2014 18:58:55 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id vEKRJvSa2QTu; Wed, 24 Sep 2014 18:58:55 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s8OHwp1u031784
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Wed, 24 Sep 2014 18:58:52 +0100
Message-ID: <1411581534.4189.65.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Darren Hart <dvhart@linux.intel.com>
Date: Wed, 24 Sep 2014 18:58:54 +0100
In-Reply-To: <D04840BD.A9FE9%dvhart@linux.intel.com>
References: <D04840BD.A9FE9%dvhart@linux.intel.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: daisy: runtime-reverse/udev-hwdb missing during do_rootfs
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
X-List-Received-Date: Wed, 24 Sep 2014 17:59:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2014-09-24 at 09:34 -0700, Darren Hart wrote:
> I've hit the following on a custom image recipe (based on core-image):
> 
> | Configuring run-postinsts.
> |
> | NOTE: Installing complementary packages ...
> | NOTE: Running intercept scripts:
> | NOTE: Executing write_package_manifest ...
> | DEBUG: Executing python function write_package_manifest
> | DEBUG: Python function write_package_manifest finished
> | NOTE: Executing license_create_manifest ...
> | DEBUG: Executing shell function license_create_manifest
> | ls: cannot access
> /build/yocto/daisy/intel-corei7-64_20140718205500/build/tmp/sysroots/intel-
> internal-corei7-64/pkgdata/runtime-reverse/udev-hwdb: No such file or
> directory
> | readlink: missing operand
> | Try 'readlink --help' for more information.
> | basename: missing operand
> | Try 'basename --help' for more information.
> | WARNING: exit code 1 from a shell command.
> | DEBUG: Python function do_rootfs finished
> | ERROR: Function failed: license_create_manifest (log file is located at
> /build/yocto/daisy/intel-corei7-64_20140718205500/build/tmp/work/intel_inte
> rnal_corei7_64-eywa-linux/core-image-minimal-initramfs/1.0-r0/temp/log.do_r
> ootfs.15414)
> ERROR: Task 150 
> (/build/yocto/daisy/intel-corei7-64_20140718205500/poky/meta/recipes-core/i
> mages/core-image-minimal-initramfs.bb, do_rootfs) failed with exit code '1'
> NOTE: Tasks Summary: Attempted 4727 tasks of which 4697 didn't need to be
> rerun and 1 failed.
> Waiting for 0 running tasks to finish:

I don't know why it does this but I can perhaps give some pointers as to
where to look.

udev-hwdb was installed in the image. First question is whether that is
actually in the build dependencies. "bitbake
core-image-minimal-initramfs -c rootfs -g", then grep task-depends.dot
and see if udev is in there. If not, there is the question of why the
image is installing something not in its dependency list. a "bitbake
udev" will probably make the problem "disappear".

If it is there, we have a dependency so the question is why the file
doesn't exist. udev do_packagedata should write out files into
sysroots/intel-internal-corei7-64/pkgdata/runtime-reverse/ for each
package it generates. Are the other udev packages there? Is there a
stamp for the udev do_packagedata task?

Cheers,

Richard




