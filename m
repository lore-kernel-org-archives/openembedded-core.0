Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id 2D35565D34
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Aug 2014 14:55:30 +0000 (UTC)
Received: from mail.nefkom.net (unknown [192.168.8.184])
	by mail-out.m-online.net (Postfix) with ESMTP id 3hkRn971y2z3hhkT;
	Thu, 28 Aug 2014 16:55:09 +0200 (CEST)
X-Auth-Info: OFtbTc33I2LCn1wdESS7Uo5+jNC8dcwp5AW1IBjFzvI=
Received: from chi.localnet (unknown [195.140.253.167])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp-auth.mnet-online.de (Postfix) with ESMTPSA id 3hkRn96DJWzvhTk; 
	Thu, 28 Aug 2014 16:55:09 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: Khem Raj <raj.khem@gmail.com>
Date: Thu, 28 Aug 2014 14:52:59 +0200
User-Agent: KMail/1.13.7 (Linux/3.13-trunk-amd64; KDE/4.13.1; x86_64; ; )
References: <1407425157-2736-1-git-send-email-marex@denx.de>
	<20140826020430.GB18989@haswell>
In-Reply-To: <20140826020430.GB18989@haswell>
MIME-Version: 1.0
Message-Id: <201408281452.59494.marex@denx.de>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Yocto: qt4: Let qmake control some compiler/linker flags
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
X-List-Received-Date: Thu, 28 Aug 2014 14:55:34 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tuesday, August 26, 2014 at 04:04:30 AM, Khem Raj wrote:
> On 14-08-07 17:25:57, Marek Vasut wrote:
> > In the case of building an Qt application outside of the Yocto
> > build system, we want to make sure that a "debug" configuration
> > of the application does contain debug symbols and is has the
> > compiler optimalization unset. On the other hand, we want to
> > have a "release" build which does not contain the debug symbols
> > and has the compiler optimalization turned on.
> > 
> > The OE_QMAKE_* flags serve to pass all kinds of flags into the
> > qmake-generated Makefile. Currently, we set OE_QMAKE_CFLAGS to
> > be ${CFLAGS} and ditto for CXXFLAGS and LDFLAGS in the SDK
> > toolchain environment script. This poses a problem, since the
> > CFLAGS can contain optimization options (-O*) and even flags to
> > produce debugging info (-g). The LDFLAGS may also contain some
> > harmful flags.
> > 
> > The easy way out is to let qmake's army of configuration files
> > handle the proper configuration of CFLAGS, CXXFLAGS and LDFLAGS
> > for the generated Makefile and don't interfere with qmake's
> > decisions by adding arbitrary flags. This patch completely
> > scrubs OE_QMAKE_C{,XX}FLAGS and leaves only harmless flags in
> > OE_QMAKE_LDFLAGS. With this patch, the behavior is as it is
> > explained in the first paragraph.
> 
> This is fine if you see it from QT app developer POV, however I see a
> downside, where we are then not compiling the application with the same
> consistent set of flags which you would use with OE-mill when you
> integrate the app back into OE build system.

This is fine, I want to build Qt application with the RELEASE build flags.

> This reminds me of the
> scenario where apps built with MSVS ended up shipping debug builds
> because that was what developers tested on and there wasnt enough time
> to fix release builds.

This is a different scenario -- I know what I want to achieve, but the SDK 
toolchain is broken and interferes with qmake's operation.

> Having said that, I would prefer that you add -g flag to whatever you
> are getting from SDK and debug using that ( which will be -g -O2)

I do not want to debug the code. I want to produce a RELEASE build, which means 
without debug symbols. If I want to debug, I want the code to be build with -g -
O0 to avoid optimization. Again, the SDK toolchain butts in and forces -O2 into 
the flags, which makes even the DEBUG build corrupted.

> in most cases optimized code debugging works well with modern gcc if it
> does not we can always complain to gcc community.

This is a toolchain problem, which disrupts the correct operation of qmake . And 
this worked until Yocto 1.3 too.

> IMHO its better to debug the code that you will ship. It saves a lot of
> time as various steps of code life cycle.

I think it would be better to fix the toolchain .

Best regards,
Marek Vasut

