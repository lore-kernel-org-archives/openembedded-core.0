Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 2C3DB79295
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2018 09:12:12 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w7G9CBsL015947
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Thu, 16 Aug 2018 10:12:12 +0100
Message-ID: <a63df1ae1995451e42523aa8dd99af5d6611d5a3.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Sunny Shukla <ssshukla26@gmail.com>,
	Openembedded-core@lists.openembedded.org
Date: Thu, 16 Aug 2018 10:12:11 +0100
In-Reply-To: <CAH4qu14LEam1dM0L6kKrKyhd0DPsSs=eHX7YTyoi60uEE_CDFw@mail.gmail.com>
References: <CAH4qu14LEam1dM0L6kKrKyhd0DPsSs=eHX7YTyoi60uEE_CDFw@mail.gmail.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Subject: Re: Libs compiled using Yocto has incorrect version appended to their names
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
X-List-Received-Date: Thu, 16 Aug 2018 09:12:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2018-08-16 at 12:42 +0530, Sunny Shukla wrote:
> We are using Rocko build for our am335x starter kit. While building
> core-image-minimal (rootfs) we are facing a strange problem, some of
> the libs we have included are getting build but the version appended
> to libs names are not proper, as shown in the examples below.

In short this is entirely expected. The library version of any given
bit of software doesn't have to match the main recipe/release version
of that piece of software. Taking opkg as an example:

> ls -l ./usr/lib/libopkg.so*
> lrwxrwxrwx 1 root root 16 Aug 9 14:46 ./usr/lib/libopkg.so.1 ->
> libopkg.so.1.0.0
> -rwxr-xr-x 1 root root 143316 Aug 9 14:46 ./usr/lib/libopkg.so.1.0.0
> 
> Here the version number appended after libopkg.so under "./usr/lib/"
> is 1.0.0 instead of 0.3.5 which is the version number of the package
> as described by BB file opkg_0.3.5.bb.

which comes from:

tmp/work/i586-poky-linux/opkg/1_0.3.6-r0/opkg-0.3.6/libopkg/Makefile.am

which sets:

libopkg_la_LDFLAGS = -version-info 1:0:0

hence the library version for libopkg is 1.0.0.

Cheers,

Richard

