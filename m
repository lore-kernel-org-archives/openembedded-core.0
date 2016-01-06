Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id BF7596FFC8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jan 2016 17:09:54 +0000 (UTC)
Received: from mail.nefkom.net (unknown [192.168.8.184])
	by mail-out.m-online.net (Postfix) with ESMTP id 3pbHHj0wShz3hjbp;
	Wed,  6 Jan 2016 18:09:53 +0100 (CET)
X-Auth-Info: PmRmbAkb9M6NU9JlAXdllzjNxMD5vx2lzC3fxlPwLh4=
Received: from chi.localnet (unknown [195.140.253.167])
	(using TLSv1 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp-auth.mnet-online.de (Postfix) with ESMTPSA id 3pbHHh4t3gzvdWS; 
	Wed,  6 Jan 2016 18:09:52 +0100 (CET)
From: Marek Vasut <marex@denx.de>
To: Khem Raj <raj.khem@gmail.com>
Date: Wed, 6 Jan 2016 18:09:52 +0100
User-Agent: KMail/1.13.7 (Linux/3.14-2-amd64; KDE/4.13.1; x86_64; ; )
References: <1452046409-7350-1-git-send-email-marex@denx.de>
	<201601061256.18384.marex@denx.de>
	<CAMKF1srER82b_SoUvfqPoXZ7omHYgeZAhTpwSZZOhhQXo64JWw@mail.gmail.com>
In-Reply-To: <CAMKF1srER82b_SoUvfqPoXZ7omHYgeZAhTpwSZZOhhQXo64JWw@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201601061809.52727.marex@denx.de>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc5: Fix build on NIOS2
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
X-List-Received-Date: Wed, 06 Jan 2016 17:09:55 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wednesday, January 06, 2016 at 04:41:43 PM, Khem Raj wrote:
> On Wed, Jan 6, 2016 at 3:56 AM, Marek Vasut <marex@denx.de> wrote:
> > On Wednesday, January 06, 2016 at 03:54:11 AM, Khem Raj wrote:
> >> > On Jan 5, 2016, at 6:13 PM, Marek Vasut <marex@denx.de> wrote:
> >> > 
> >> > The gcc 5.3 does not build on NIOS2 due to a missing
> >> > MUSL_DYNAMIC_LINKER definition in it's config file. Add the
> >> > definition to fix the build issue. The output produced during the
> >> > failing build is as follows:
> >> > 
> >> > g++    -isystem/b/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
> >> > -DIN_GCC  -DCROSS_DIRECTORY_STRUCTURE  -fno-exceptions -fno-rtti
> >> > -fasynchronous-unwind-tables -W -Wall -Wno-narrowing -Wwrite-strings
> >> > -Wcast-qual -Wmissing-format-attribute -Woverloaded-virtual -pedantic
> >> > -Wno-long-long -Wno-variadic-macros -Wno-overlength-strings
> >> > -DHAVE_CONFIG_H -static-libstdc++ -static-libgcc
> >> > -L/b/tmp/sysroots/x86_64-linux/usr/lib
> >> > -L/b/tmp/sysroots/x86_64-linux/lib
> >> > -Wl,-rpath-link,/b/tmp/sysroots/x86_64-linux/usr/lib
> >> > -Wl,-rpath-link,/b/tmp/sysroots/x86_64-linux/lib
> >> > -Wl,-rpath,/b/tmp/sysroots/x86_64-linux/usr/lib
> >> > -Wl,-rpath,/b/tmp/sysroots/x86_64-linux/lib -Wl,-O1 gcc-ar.o -o gcc-ar
> >> > \
> >> > 
> >> >        file-find.o libcommon.a ../libcpp/libcpp.a
> >> >        ../libbacktrace/.libs/libbacktrace.a ../libiberty/libiberty.a
> >> >        ../libdecnumber/libdecnumber.a
> >> > 
> >> > In file included from ./tm.h:27:0,
> >> > 
> >> >                 from /b/tmp/work-shared/gcc-5.3.0-
r0/gcc-5.3.0/gcc/gcc.c:34:
> >> > ./config/linux.h:92:28: error: expected ',' or ';' before
> >> > 'MUSL_DYNAMIC_LINKER'
> >> > 
> >> >     BIONIC_DYNAMIC_LINKER, MUSL_DYNAMIC_LINKER)
> >> >     
> >> >                            ^
> >> > 
> >> > ./config/linux.h:59:60: note: in definition of macro
> >> > 'CHOOSE_DYNAMIC_LINKER1'
> >> > 
> >> >   "%{" LIBC2 ":" LD2 ";:%{" LIBC3 ":" LD3 ";:%{" LIBC4 ":" LD4 ";:"
> >> >   LD1 "}}}"
> >> >   
> >> >                                                            ^
> >> > 
> >> > ./config/linux.h:91:3: note: in expansion of macro
> >> > 'CHOOSE_DYNAMIC_LINKER'
> >> > 
> >> >   CHOOSE_DYNAMIC_LINKER (GLIBC_DYNAMIC_LINKER, UCLIBC_DYNAMIC_LINKER,
> >> >   \ ^
> >> > 
> >> > ./config/nios2/linux.h:40:25: note: in expansion of macro
> >> > 'GNU_USER_DYNAMIC_LINKER'
> >> > 
> >> >       -dynamic-linker " GNU_USER_DYNAMIC_LINKER "} \
> >> >       
> >> >                         ^
> >> > 
> >> > /b/tmp/work-shared/gcc-5.3.0-r0/gcc-5.3.0/gcc/gcc.c:884:32: note: in
> >> > expansion of macro 'LINK_SPEC' static const char *link_spec =
> >> > LINK_SPEC;
> >> > 
> >> >                                ^
> >> > 
> >> > <command-line>:0:27: warning: deprecated conversion from string
> >> > constant to 'char*' [-Wwrite-strings]
> >> > /b/tmp/work-shared/gcc-5.3.0-r0/gcc-5.3.0/gcc/gcc.c:1295:48: note: in
> >> > expansion of macro 'STANDARD_STARTFILE_PREFIX' static char *const
> >> > standard_startfile_prefix = STANDARD_STARTFILE_PREFIX;
> >> 
> >> This is ok to install.
> > 
> > Hi Khem, I don't quite get your comment, but check the error above.
> > That's what this patch addresses, the splat below is just a fallout from
> > it.
> 
> it mean patch is ok to install :)

Ah, you mean like Reviewed-by or Acked-by ? :) Thanks

