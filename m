Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 65F666093E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jan 2018 14:19:58 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w03EJw6S020204
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Wed, 3 Jan 2018 14:19:59 GMT
Message-ID: <1514989197.5525.147.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>,
	openembedded-core@lists.openembedded.org
Date: Wed, 03 Jan 2018 14:19:57 +0000
In-Reply-To: <8555d421-668e-a2ba-d405-4ef01ee2f3f4@windriver.com>
References: <cover.1513133105.git.liezhi.yang@windriver.com>
	<e911950fbee39af9c5889c41872f2f77f94cc9c1.1513133105.git.liezhi.yang@windriver.com>
	<1514983400.5525.137.camel@linuxfoundation.org>
	<8555d421-668e-a2ba-d405-4ef01ee2f3f4@windriver.com>
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
X-List-Received-Date: Wed, 03 Jan 2018 14:19:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2018-01-03 at 21:56 +0800, Robert Yang wrote:
> > Also, there are some things which never make sense as a multilib,
> > the
> > kernel is one example and I'm starting to wonder if syslinux would
> > be
> > another. In the kernel (and kernel module) case we'd provide all
> > the
> > libX variants from the same recipe, we may want to do that for
> > syslinux.
> I think that syslinux is different from kernel, 64bit kernel can
> provide 32bit kernel via kernel config, but syslinux can't (except
> these non arch files).

Think about this differently. The system can ever only boot one single
kernel. The image can have several different multilibs running at once
in different userspace processes but there can only ever be one running
kernel.

How that kernel is configured is obviously important but the key thing
is there can only be one running.

The bootloader is similar in that you likely only ever want one and I
suspect syslinux is similar.

Also, don't confuse this with multi-boot or multi partition systems
where there could be a "main" and a "backup" kernel. In those cases
there would only ever be one running at once.

> > It may be we can't avoid the multiple compiler issue and the
> > current
> > codebase may not do so, I think currently we can avoid multiple
> > glibc
> > though.
> I'm not sure about a problem on this, should lib32-image can run
> 64bit programs or not ? If yes, then kernel should be 64bit, and we
> can't avoid building 64bit compilers. And I'm leaning to yes since we
> call it multilib, the pure 32bit image which can't run 64bit programs
> can't be called multilib.

That is a configuration issue for the multilib you select. In general,
yes you'd want a 64 bit kernel.

> I did a rough search on why glibc is built, when bitbake lib32-image, 
> it is because:
> 
> 64 bit kernel -> gcc-cross-x86_64 -> virtual/${TARGET_PREFIX}libc-
> for-gcc,
> and the TARGET_PREFIX is x86_64 when building gcc-cross-x86_64,
> While the virtual/x86_64-poky-linux-libc-for-gcc is provided by
> glibc.
> 
> I tried to remove the depends, both "bitbake gcc-cross-x86_64" and
> "bitbake linux-yocto" can be built, but other recipes such as quilt
> would be failed:

I find it interesting that gcc-cross-x86_64 would build without glibc.
If that really is the case we may be able to speed up our compiler
bootstrap so that could be worth investigating further.

Its not surprising that libgcc won't build without glibc though.
Perhaps gcc-cross works since we split out the build of libgcc?

> > collect2: error: ld returned 1 exit status
> > Makefile:978: recipe for target 'libgcc_s.so' failed
> And move virtual/${TARGET_PREFIX}libc-for-gcc to BASE_DEFAULT_DEPS
> can't make it work either, so it seems that we can't avoid building
> glibc.

No, I'd forgotten that gcc-cross depends on glibc. Based on the above
there may still be some optimisation we can make here.

In the back of my mind, I'm concious that one x86 cross compiler should
be able to work for 32 and 64 bit too, its just the compiler options
and libgcc etc. would need to be generated for both...

> > Regardless, I do think this needs a little more thought, we also
> > need
> > better multiple test cases as we're not catching issues like this. 
> > think this needs to be revisited along with your outstanding
> > multilib
> > patch series which I haven't found the time to review yet (sorry).
> That's all right, I'm very glad to make mutilib work well, including
> adding test cases for them. It is nearly broken after changed from
> smart + rpm5 to dnf + rpm4, those patches fixed the problem.

Agreed, its important and on my list of things to review, I've just had
to focus on getting build testing working properly and now I can try
and clear some of the patch backlog.

Cheers,

Richard

