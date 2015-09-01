Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 49C7876B7C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Sep 2015 21:17:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t81LHkWU015567; Tue, 1 Sep 2015 22:17:46 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id R82HWQZfMXUq; Tue,  1 Sep 2015 22:17:46 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t81LHY1t015560
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 1 Sep 2015 22:17:45 +0100
Message-ID: <1441142254.24871.22.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Tue, 01 Sep 2015 22:17:34 +0100
In-Reply-To: <96e447b0dad1a139b68ee85780055379147ba40f.1440446289.git.raj.khem@gmail.com>
References: <87b72ec93b53c0a0ac61950f52480fa86a93c937.1440446289.git.raj.khem@gmail.com>
	<96e447b0dad1a139b68ee85780055379147ba40f.1440446289.git.raj.khem@gmail.com>
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 15/17] busybox: Use CC instead of bare LD to be the Linker
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
X-List-Received-Date: Tue, 01 Sep 2015 21:17:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2015-08-24 at 13:03 -0700, Khem Raj wrote:
> This patch was on mailing list, another patch to make sure -r is not
> passed directly but via -Wl switch is added.
> 
> This was exposed when using clang and gold linker, clang does not have
> -r switch to do relocatable objects and problem happens specific to OE
> becuase we use LD = CC
> 
> now what happens is that busybox assumes that linker will be called
> directly, and hence sprinkles linkers options in its kbuild system which
> aggregate into LDFLAGS, some of these options are happily ignored by gcc
> as well but it passes -r options rightly to linker so it all works,
> however when using clang, this falls apart since -r is not known option
> for clang so it drops this option and all obects which should be
> partially linked becomes ET_EXEC and when they are added to final link
> then gold starts to get confused
> 
> /mnt/home/kraj/work/angstrom/build/tmp-angstrom-glibc/sysroots/x86_64-linux/usr/bin/arm-angstrom-linux-gnueabi/arm-angstrom-linux-gnueabi-ld:
> error: applets/built-in.o: unsupported ELF file type 2
> clang-3.7: error: linker command failed with exit code 1 (use -v to see invocation)

This breaks DISTRO=poky-lsb:

http://errors.yoctoproject.org/Errors/Details/15705/

(searching for busybox shows many other versions of this too)

Cheers,

Richard


