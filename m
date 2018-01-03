Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 7ADAA780F3
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jan 2018 12:43:21 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w03ChK82014095
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Wed, 3 Jan 2018 12:43:22 GMT
Message-ID: <1514983400.5525.137.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>,
	openembedded-core@lists.openembedded.org
Date: Wed, 03 Jan 2018 12:43:20 +0000
In-Reply-To: <e911950fbee39af9c5889c41872f2f77f94cc9c1.1513133105.git.liezhi.yang@windriver.com>
References: <cover.1513133105.git.liezhi.yang@windriver.com>
	<e911950fbee39af9c5889c41872f2f77f94cc9c1.1513133105.git.liezhi.yang@windriver.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 2/2] image-live.bbclass: remove MLPREFIX from syslinux
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
X-List-Received-Date: Wed, 03 Jan 2018 12:43:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2017-12-13 at 10:45 +0800, Robert Yang wrote:
> Fixed:
> MACHINE = "qemux86-64"
> require conf/multilib.conf
> MULTILIBS = "multilib:lib32"
> DEFAULTTUNE_virtclass-multilib-lib32 = "x86"
> IMAGE_FSTYPES += "iso"
> 
> $ bitbake lib32-core-image-minimal
> ERROR: lib32-core-image-minimal-1.0-r0 do_bootimg: The file
> /usr/include/printf.h is installed by both glibc and lib32-glibc,
> aborting
> 
> This was because:
> lib32-syslinux -> lib32-glibc
> virtual/kernel -> glibc
> 
> We can build 64bit syslinux (only build, not install) to fix the
> problem, the
> do_bootimg only needs several data files of syslinux such as
> vesamenu.c32,
> these files are not arch related.

Hi Robert,

I've been thinking about this one and I'm not 100% convinced this is
the right thing to do.

When we build "lib32-core-image-minimal", one of the things we want to
avoid is building two different toolchains, there should only be one
needed for this image.

If there is a dependency on "syslinux", that will need the non-multilib 
toolchain. I suspect that is why libX-syslinux was used as a
dependency.

Also, there are some things which never make sense as a multilib, the
kernel is one example and I'm starting to wonder if syslinux would be
another. In the kernel (and kernel module) case we'd provide all the
libX variants from the same recipe, we may want to do that for
syslinux.

It may be we can't avoid the multiple compiler issue and the current
codebase may not do so, I think currently we can avoid multiple glibc
though.

Regardless, I do think this needs a little more thought, we also need
better multiple test cases as we're not catching issues like this. I
think this needs to be revisited along with your outstanding multilib
patch series which I haven't found the time to review yet (sorry).

Cheers,

Richard

