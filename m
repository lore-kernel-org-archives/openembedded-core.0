Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2538B60119
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Apr 2016 14:47:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u3JElNK7005274
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 19 Apr 2016 07:47:23 -0700 (PDT)
Received: from soho-mhatle-m.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 19 Apr 2016 07:47:22 -0700
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@googlemail.com>, Hongxu Jia
	<hongxu.jia@windriver.com>
References: <cover.1459147231.git.hongxu.jia@windriver.com>
	<62a9bef209d903048c1095d90387384115eb6fd5.1459147231.git.hongxu.jia@windriver.com>
	<CALbNGRRL0O+j6axaHL3W2bKZLLyYEe1kxsiguZGL0=a1Lz8ryg@mail.gmail.com>
	<571496CC.8010607@windriver.com>
	<CALbNGRQwKQJxC+17UAoLBhhN9ZfXrYF4Ysur68NCD8v24Uavcw@mail.gmail.com>
	<57149B89.2090607@windriver.com>
	<CALbNGRTgnNYhN68zcDBKrhQ==fxP9wJ7wjj8pQ5jvMEgF=DF4g@mail.gmail.com>
	<5714A30A.9000204@windriver.com>
	<CALbNGRSBJSR4xMqCOUvu2yQcG38E=1UZBehkjmFZLdrtRyfamw@mail.gmail.com>
	<5714AA1E.9020505@windriver.com>
	<CALbNGRSe6B9-QRftL54DEEKrmCjxTt91K7FXk+CUzuGxjTvf5A@mail.gmail.com>
	<5714DC35.7040206@windriver.com>
	<CAJTo0LYTcA-c99-T_Z6q9Kn=X2C9Y1kBX+D6rzHrn+eLMUcSdA@mail.gmail.com>
	<CALbNGRR0ySfXHZFgTAPGCi5sZXehjG3_vUzGobawrTW6-DOOVg@mail.gmail.com>
	<5715DF5B.5030406@windriver.com>
	<CALbNGRQB-BUVH6qcQxey9CYOji-z8ydVA==qi5bx-ouBVpGaWw@mail.gmail.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <571644F9.1080400@windriver.com>
Date: Tue, 19 Apr 2016 09:47:21 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.7.2
MIME-Version: 1.0
In-Reply-To: <CALbNGRQB-BUVH6qcQxey9CYOji-z8ydVA==qi5bx-ouBVpGaWw@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/17] conf/bitbake.conf package.bbclass: fix dbg package not contain sources while -fdebug-prefix-map used
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
X-List-Received-Date: Tue, 19 Apr 2016 14:47:26 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On 4/19/16 9:11 AM, Andreas Müller wrote:
> thanks a lot for your efforts. Do I understand this right: You suggest
> to use build sysroot (on my own risk - as I did before) and make gdb
> happy by linking sources?
> 
> Problem I see is that we have multiple package archs e.g
> ARM/ARMThumb/Machine so ${BASE_WORKDIR}/${MULTIMACH_TARGET_SYS}
> expands to multiple paths. But a script symlinking all together + set
> substitute-path might help here...
> 
> I will play around with this in the later...
> 
> Andreas
> 

See Yocto Project bug #9481: https://bugzilla.yoctoproject.org/show_bug.cgi?id=9481

Below are the steps that I have added that I hope will be documented in the YP
2.1 documentation. (This matches current master.)

I just went through and verified the steps on my local machine. As noted, there
is currently a bug in the debugfs creation. RP helped me fix the 'rpm' case, but
it appears ipkg support is broken in some way.



1. Configure your build system to construct the companion debug filesystem

In the local.conf:

IMAGE_GEN_DEBUGFS = '1'
IMAGE_FSTYPES_DEBUGFS = 'tar.bz2'

The options above will cause the system to generate a special companion
filesystem fragment, that contains the matching source and debug symbols to your
deployable filesystem. It does this by looking at what is in the deployed
filesystem, and pulling the corresponding -dbg packages.

The companion debug filesystem is NOT a complete filesystem, but only contains
the debug fragements. It must be combined with the full filesystem for
debugging. (Later steps will show this.)

2. Configure the system to include gdbserver in the target filesystem

In the local.conf (or an image recipe):

IMAGE_INSTALL_append = “ gdbserver"

3. Build the environment

Construct the image (and companion Debug Filesystem)
bitbake <image>

Build the cross GDB component and make it available for debugging

Build the SDK that matches the image (this is best for a production build for
later debugging, especially during long term maintenance)
bitbake -c populate_sdk <image>

or

Build the minimal toolchain components that match the target (this is smaller
then a typical SDK and only contains a minimal set of components to build simple
test applications, as well as run the debugger)
bitbake meta-toolchain

or

Build gdb itself within the build system (this produces a temporary copy of
cross-gdb that can be used for debugging during development. It is the quickest
approach, but the other methods are better for long term maintenance strategies.)
bitbake gdb-cross-<arch>

(Note: If you run bitbake gdb-cross, the system will give you a suggestion like
gdb-cross-i586, the suggestion is likely the actual name you want to use.)

4. Setup your environment

4.1 Setup the debugfs

$ mkdir debugfs
$ cd debugfs
$ tar xvfj <build dir>/tmp-glibc/deploy/images/<machine>/<image>.rootfs.tar.bz2
$ tar xvfj <build dir>/tmp-glibc/deploy/images/<machine>/<image>-dbg.rootfs.tar.bz2

4.2 Setup GDB

Install the SDK (if you built one) and source the correct environment file. This
will put it in your path.

if using the build system gdb will be in
<build>/<tmp>/sysroots/<host>/usr/bin/<arch>/<arch>-gdb

5. Boot the target

For QEMU, <link to runqemu docs…>

(verify that your host can access the target via TCP)

6. Debug a program

6.1 Run gdbserver on the target, such as:

(We’ll debug gzip in this example, see gdbserver docs for additional options)

root@qemux86:~# gdbserver localhost:1234 /bin/gzip —help

6.2 On the host, run gdb, configure it and connect to the target:

$ cd <directory holding the debugfs dir>
$ <arch>-gdb

(gdb) set sysroot debugfs
(gdb) set substitute-path /usr/src/debug debugfs/usr/src/debug
(gdb) target remote <ip of target>:1234

At this point everything should automatically load (matching binaries, symbols
and headers.)

Note: the gdb ‘set’ commands above can be placed into the users ~/.gdbinit GDB
will automatically run whatever commands are in that file when it is started.


7. Deploying WITHOUT a full image rebuild

In many cases, during development you want a quick method to deploy a new binary
to the target and debug it, without waiting for a full image build.

One approach to this is to build the component you want to debug. Then directly
copy the executable to BOTH the target and the host ‘debugfs’. If the binary is
processed through the debug splitting in OE, you should also copy the debug
items (the .debug contents and corresponding /usr/src/debug) from the work dir.

Such as:

$ bitbake bash
$ bitbake -c devshell bash
$ cd ..
$ scp packages-split/bash/bin/bash <target>:/bin/bash
$ cp -a packages-split/bash-dbg/* <path>/debugfs



