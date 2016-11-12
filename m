Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id 3C7BD719C9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Nov 2016 19:19:55 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 3tGRSD3hpCz3hjhT;
	Sat, 12 Nov 2016 20:19:56 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.68])
	by mail.m-online.net (Postfix) with ESMTP id 3tGRSD29Jmzvknn;
	Sat, 12 Nov 2016 20:19:56 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.68]) (amavisd-new,
	port 10024)
	with ESMTP id 1jATsdhMDBxx; Sat, 12 Nov 2016 20:19:55 +0100 (CET)
X-Auth-Info: mTJKQQGAydhmEELELHSNulYopoAGLqDopGQmyjJWtMI=
Received: from [IPv6:::1] (unknown [195.140.253.167])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Sat, 12 Nov 2016 20:19:55 +0100 (CET)
To: "Burton, Ross" <ross.burton@intel.com>
References: <20161107182006.4207-1-marex@denx.de>
	<CAJTo0LaSLN1eVRH1ju1w5Ba3PLh6d+E0ZwmRimxcN1DjKRk6iQ@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <8fe5bfa6-cbf3-ebc3-394e-e1cef3ae8fc9@denx.de>
Date: Sat, 12 Nov 2016 19:31:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LaSLN1eVRH1ju1w5Ba3PLh6d+E0ZwmRimxcN1DjKRk6iQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: mkimage: Fix build of u-boot-mkimage
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
X-List-Received-Date: Sat, 12 Nov 2016 19:19:57 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 11/09/2016 01:15 AM, Burton, Ross wrote:
> 
> On 7 November 2016 at 18:20, Marek Vasut <marex@denx.de
> <mailto:marex@denx.de>> wrote:
> 
>     -EXTRA_OEMAKE = 'CROSS_COMPILE="${TARGET_PREFIX}" CC="${CC}
>     ${CFLAGS} ${LDFLAGS}" STRIP=true V=1'
>     +EXTRA_OEMAKE = 'HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}"'
>     +EXTRA_OEMAKE_append_class-target =
>     'CROSS_COMPILE="${TARGET_PREFIX}" CC="${CC} ${CFLAGS} ${LDFLAGS}"
>     STRIP=true V=1'
>     +EXTRA_OEMAKE_append_class-native = 'CC="${BUILD_CC} ${BUILD_CFLAGS}
>     ${BUILD_LDFLAGS}" STRIP=true V=1'
>     +EXTRA_OEMAKE_append_class-nativesdk = 'CC="${BUILD_CC}
>     ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" STRIP=true V=1'
> 
> 
> You're going to start hating u-boot...
> 
> Fails on the autobuilder if you're building for a 32-bit x86 target on a
> 64-bit x86 host:
> 
> ERROR: QA Issue: Architecture did not match (x86-64, expected x86) on
> /work/i586-poky-linux-musl/u-boot-mkimage/1_2016.09.01-r0/packages-split/u-boot-mkimage/usr/bin/uboot-mkimage
> [arch]
> 
> I'm guessing that it is using the host compiler instead of the cross
> compiler.

I should have a fix for it all I hope.


-- 
Best regards,
Marek Vasut

