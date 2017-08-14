Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C105C60767
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Aug 2017 08:30:07 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v7E8U6Ci016410
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Mon, 14 Aug 2017 09:30:07 +0100
Message-ID: <1502699405.13978.2.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Mon, 14 Aug 2017 09:30:05 +0100
In-Reply-To: <20170809164518.35834-1-raj.khem@gmail.com>
References: <20170809164518.35834-1-raj.khem@gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Mon, 14 Aug 2017 09:30:07 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH] rootfs-postcommands.bbclass: Filter out dangling symlinks in ssh_allow_empty_password()
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
X-List-Received-Date: Mon, 14 Aug 2017 08:30:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2017-08-09 at 09:45 -0700, Khem Raj wrote:
> In images built with pam in DISTRO_FEATURES, we end up with dangling
> symlinks
> if su is not packaged into image
> 
> $ ls /mnt/a/oe/build/tmp/work/raspberrypi3-bec-linux-gnueabi/core-
> image-minimal/1.0-r0/rootfs/etc/pam.d/su-l -l
> lrwxrwxrwx 1 kraj users 2 Aug  9 07:56
> /mnt/a/oe/build/tmp/work/raspberrypi3-bec-linux-gnueabi/core-image-
> minimal/1.0-r0/rootfs/etc/pam.d/su-l -> su
> 
> This causes image do_rootfs to fail
> 
> > 
> > sed: can't read /mnt/a/oe/build/tmp/work/raspberrypi3-bec-linux-
> > gnueabi/core-image-minimal/1.0-r0/rootfs/etc/pam.d/s
> u-l: No such file or directory
> > 
> > WARNING: /mnt/a/oe/build/tmp/work/raspberrypi3-bec-linux-
> > gnueabi/core-image-minimal/1.0-r0/temp/run.ssh_allow_empty_
> password.19238:1 exit 2 from 'sed -i 's/nullok_secure/nullok/'
> /mnt/a/oe/build/tmp/work/raspberrypi3-bec-linux-gnueabi
> /core-image-minimal/1.0-r0/rootfs/etc/pam.d/*'
> 
> Therefore we need to filter out dangling symlinks before sed'ing
> things out
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/classes/rootfs-postcommands.bbclass | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

This caused all rootfs sanity tests to fail in lsb images (for all
arches):

https://autobuilder.yocto.io/builders/nightly-x86-lsb/builds/410
https://autobuilder.yocto.io/builders/nightly-x86-64-lsb/builds/408
https://autobuilder.yocto.io/builders/nightly-ppc-lsb/builds/407
https://autobuilder.yocto.io/builders/nightly-mips-lsb/builds/394
https://autobuilder.yocto.io/builders/nightly-arm-lsb/builds/406

(I've confirmed dropping this patch made this issue go away)

Cheers,

Richard



