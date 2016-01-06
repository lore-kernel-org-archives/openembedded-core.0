Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com
	[209.85.213.173])
	by mail.openembedded.org (Postfix) with ESMTP id 80F3360249
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jan 2016 15:42:12 +0000 (UTC)
Received: by mail-ig0-f173.google.com with SMTP id z14so30809150igp.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Jan 2016 07:42:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=qGCcemkUDqyjU3ONdjdACMWbuP63sepJnHMoSCNDVO8=;
	b=bOPfes4ywB6E3Bwz7CPaAaD5fMAH2FGCtC3n1V//XtYwsFwyC7TlX6sSwZWZkopld7
	2Z5mfwY3iw2EciFQ3SF0aqp46wKzo6doDTN3elXyX4Izc32YrDStiHN3xFI42TR4P9cc
	bAjCHqFVpcB3mguObRBN6Rf17/9YY4P3ttNFu52czy3Du1P6zf79XhAVCg7/4dYOKhM8
	anEjwg5nzDhU56N0JLTNQpzbrk0L+veUl2PQ6CckcJPj6FcSwvp1Vt1jsDBKDwcgaHm6
	V9h0h/09SLIkm3GEuCxU1khwiMt7D+uba/F2R0/ZxowihVLEkU3bMrjlPZ6bLWc2KSxG
	KkJg==
X-Received: by 10.50.20.138 with SMTP id n10mr10073213ige.11.1452094933146;
	Wed, 06 Jan 2016 07:42:13 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.16.74 with HTTP; Wed, 6 Jan 2016 07:41:43 -0800 (PST)
In-Reply-To: <201601061256.18384.marex@denx.de>
References: <1452046409-7350-1-git-send-email-marex@denx.de>
	<C6305912-A665-4147-82C8-DB3213161A88@gmail.com>
	<201601061256.18384.marex@denx.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 6 Jan 2016 07:41:43 -0800
Message-ID: <CAMKF1srER82b_SoUvfqPoXZ7omHYgeZAhTpwSZZOhhQXo64JWw@mail.gmail.com>
To: Marek Vasut <marex@denx.de>
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
X-List-Received-Date: Wed, 06 Jan 2016 15:42:12 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jan 6, 2016 at 3:56 AM, Marek Vasut <marex@denx.de> wrote:
> On Wednesday, January 06, 2016 at 03:54:11 AM, Khem Raj wrote:
>> > On Jan 5, 2016, at 6:13 PM, Marek Vasut <marex@denx.de> wrote:
>> >
>> > The gcc 5.3 does not build on NIOS2 due to a missing MUSL_DYNAMIC_LINKER
>> > definition in it's config file. Add the definition to fix the build
>> > issue. The output produced during the failing build is as follows:
>> >
>> > g++    -isystem/b/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
>> > -DIN_GCC  -DCROSS_DIRECTORY_STRUCTURE  -fno-exceptions -fno-rtti
>> > -fasynchronous-unwind-tables -W -Wall -Wno-narrowing -Wwrite-strings
>> > -Wcast-qual -Wmissing-format-attribute -Woverloaded-virtual -pedantic
>> > -Wno-long-long -Wno-variadic-macros -Wno-overlength-strings
>> > -DHAVE_CONFIG_H -static-libstdc++ -static-libgcc
>> > -L/b/tmp/sysroots/x86_64-linux/usr/lib
>> > -L/b/tmp/sysroots/x86_64-linux/lib
>> > -Wl,-rpath-link,/b/tmp/sysroots/x86_64-linux/usr/lib
>> > -Wl,-rpath-link,/b/tmp/sysroots/x86_64-linux/lib
>> > -Wl,-rpath,/b/tmp/sysroots/x86_64-linux/usr/lib
>> > -Wl,-rpath,/b/tmp/sysroots/x86_64-linux/lib -Wl,-O1 gcc-ar.o -o gcc-ar \
>> >
>> >        file-find.o libcommon.a ../libcpp/libcpp.a
>> >        ../libbacktrace/.libs/libbacktrace.a ../libiberty/libiberty.a
>> >        ../libdecnumber/libdecnumber.a
>> >
>> > In file included from ./tm.h:27:0,
>> >
>> >                 from /b/tmp/work-shared/gcc-5.3.0-r0/gcc-5.3.0/gcc/gcc.c:34:
>> > ./config/linux.h:92:28: error: expected ',' or ';' before
>> > 'MUSL_DYNAMIC_LINKER'
>> >
>> >     BIONIC_DYNAMIC_LINKER, MUSL_DYNAMIC_LINKER)
>> >
>> >                            ^
>> >
>> > ./config/linux.h:59:60: note: in definition of macro
>> > 'CHOOSE_DYNAMIC_LINKER1'
>> >
>> >   "%{" LIBC2 ":" LD2 ";:%{" LIBC3 ":" LD3 ";:%{" LIBC4 ":" LD4 ";:" LD1
>> >   "}}}"
>> >
>> >                                                            ^
>> >
>> > ./config/linux.h:91:3: note: in expansion of macro
>> > 'CHOOSE_DYNAMIC_LINKER'
>> >
>> >   CHOOSE_DYNAMIC_LINKER (GLIBC_DYNAMIC_LINKER, UCLIBC_DYNAMIC_LINKER, \
>> >   ^
>> >
>> > ./config/nios2/linux.h:40:25: note: in expansion of macro
>> > 'GNU_USER_DYNAMIC_LINKER'
>> >
>> >       -dynamic-linker " GNU_USER_DYNAMIC_LINKER "} \
>> >
>> >                         ^
>> >
>> > /b/tmp/work-shared/gcc-5.3.0-r0/gcc-5.3.0/gcc/gcc.c:884:32: note: in
>> > expansion of macro 'LINK_SPEC' static const char *link_spec = LINK_SPEC;
>> >
>> >                                ^
>> >
>> > <command-line>:0:27: warning: deprecated conversion from string constant
>> > to 'char*' [-Wwrite-strings]
>> > /b/tmp/work-shared/gcc-5.3.0-r0/gcc-5.3.0/gcc/gcc.c:1295:48: note: in
>> > expansion of macro 'STANDARD_STARTFILE_PREFIX' static char *const
>> > standard_startfile_prefix = STANDARD_STARTFILE_PREFIX;
>>
>> This is ok to install.
>
> Hi Khem, I don't quite get your comment, but check the error above. That's
> what this patch addresses, the splat below is just a fallout from it.

it mean patch is ok to install :)

>
> Best regards,
> Marek Vasut

