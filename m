Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 5403876988
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Apr 2016 08:48:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u328mtnQ016142; Sat, 2 Apr 2016 09:48:55 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Ao0fCyDBE2Ed; Sat,  2 Apr 2016 09:48:55 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u328mmUi016139
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 2 Apr 2016 09:48:49 +0100
Message-ID: <1459586928.7348.75.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andre McCurdy <armccurdy@gmail.com>, OE Core mailing list
	<openembedded-core@lists.openembedded.org>
Date: Sat, 02 Apr 2016 09:48:48 +0100
In-Reply-To: <CAJ86T=VWi3JQoCs23RqrW95M=z9DszLfgAo3fOT2UaqiJty5jg@mail.gmail.com>
References: <CAJ86T=VWi3JQoCs23RqrW95M=z9DszLfgAo3fOT2UaqiJty5jg@mail.gmail.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: Staging machine specific kernel headers in sysroot
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
X-List-Received-Date: Sat, 02 Apr 2016 08:48:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2016-04-01 at 20:38 -0700, Andre McCurdy wrote:
> Say I have a kernel driver with a user space API (simple struct and
> ioctl definitions) defined in a header file which is part of my
> machine specific kernel. The header file is not found in the upstream
> kernel, so doesn't clash with anything in linux-libc-headers.
> 
> Is it OK to use something like the following in my kernel recipe?
> 
>   sysroot_stage_all_append () {
>     install -d ${SYSROOT_DESTDIR}/${includedir}/linux
>     install -m644 ${S}/include/linux/foo.h
> ${SYSROOT_DESTDIR}/${includedir}/linux/
>   }
> 
> I've tested it and everything seems to work fine, but I'm wondering
> if
> bypassing do_install like that is going to cause problems somehow?

You can probably just do it in do_install to be honest, then on target
development would also work.

The trouble we usually have is that people expect more and more kernel
headers to be installed/usable (e.g. to build complete modules against)
until we have a complete build of the kernel there, at which point you
really want to use the kernel shared work directory instead. We did
pretty much the full circle on that.

Or people go the other route and hack linux-libc-headers to install
their header as well, and then the whole system including the compiler
becomes machine specific. I appreciate you're not doing that, I just
want this answer to mention it as that is a much worse idea and the
comments in that recipe reflect some bad experiences for good reason.

So in summary, you can probably do that reasonably safely, on the
understanding that any user of that header will also become machine
specific with a kernel build dependency. There is risk of overlap if
upstream do create such a header or API but its probably not a huge
deal.

Cheers,

Richard

