Return-Path: <hiagofranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 009D0C5AE59
	for <webhook@archiver.kernel.org>; Thu,  5 Jun 2025 19:40:54 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.17266.1749152448879484190
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Jun 2025 12:40:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=N45Gz2qQ;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: hiagofranco@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2349f096605so16233985ad.3
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 12:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749152448; x=1749757248; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Fha29F2z70W0p5iQpttXLN0tshslMPlUeY7IxERpEWY=;
        b=N45Gz2qQcAzRqbzy6LBzPgAQz7Lud0VrkNtlfPxirdgRSplPJycBqQP9frew9oOWI+
         BMcMi4n/Ps6byWw5SnZUEVynZzXLJkFDV1D6Cu9asR2dHY0ahwwwz4GYxDXPbq84hAvZ
         8iuSvbxKJx3/JNpOXBqxL9B9T3m7fPEtQ+pmGEXvs/LGm9WwpJn0XV0wlnGW1wpARs93
         IMoBzBkSwDokzCs398aC1KdUy6LEYoTNn8d7luKh13apT983+0FqBIWCT1hYtuJqxrL3
         +VfUfFSqHwYqIig1AntmUmSQIU+vAXieuVB+RcfFN9pBvWYDRV6XmElcvSESdyQTvLS5
         Yunw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749152448; x=1749757248;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Fha29F2z70W0p5iQpttXLN0tshslMPlUeY7IxERpEWY=;
        b=ufgAX8EZ231uSviCugb5iMVW+EY1nViyHVLwqxdQ92WHF6Y0YdRYW6WGRYHzdqSwVn
         iIUUPYkwm2KMNEWpBYjlM25UBZOcuWj42ySWHXuEUrXurJ343OlisO/bmtO5tztTHp8b
         cqPlS+lPZExoqBc2ZDUwAM3O2tYsChwtAKoEFuXupqUtVy79W8Z237n8QYtHnJfod1WK
         3BogppnoSEI8zYq5DCcO6ragJ/QwMet7E+RrNXCjlecif27JL+vORYhu6CboKXIRrRL/
         HF5lBlW/iLQMOUFeqAoqoT6eCLcYNOVxh53FxY4RpFjwXzEOZZSY8hDHwhvci/63EiEp
         jFHA==
X-Gm-Message-State: AOJu0YzjjGuNSZ3osFZCloyQpraojOwMdBYEWoUmTZYymgZDg8ttcoE6
	mpK81LoBtjdFCcKHl6pPyZwhsb0uqxphpmKVMo55tjZ9HlW0XHx9flGg
X-Gm-Gg: ASbGnctNZqdk0HM9X/kVR54X4On9W+N9wfqvVNwFj+kV67O/fhQEuNxUOqVLBZZ/zdT
	34TCpkzSgyzQim4umB3tuCU3Mr1aBoTNdYltiDwew/bPIn4vxqGPhoendNohFakkda9GJe60QGk
	MqRMwaupohs3tmOMcsCg/KDslADviaG4Pwu22DQrif3zjHpw9ZvZQi1NJH9XAGHMO8wwDnVSck+
	S3s7TyPhePzWzpX3f9lF38rQJLHcY0eze1ls/+RbyZDHjWZul/0bqNoGUk4bIR/se6JzYsN2LOu
	GNeA4/QVkN/uvXiqWJsY/1PrLTdvOWAOo5wRUa/AdKUS5ITwvQ==
X-Google-Smtp-Source: AGHT+IExLP4t/YElnXdzo9KIvS0qYZepAccxQnB46rw0ZN4bOlnr84wYoS1jEL/VvDHygPFugeE62w==
X-Received: by 2002:a17:902:dac5:b0:234:be9b:539a with SMTP id d9443c01a7336-23601dc02c2mr9003465ad.40.1749152448014;
        Thu, 05 Jun 2025 12:40:48 -0700 (PDT)
Received: from hiago-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506cf5188sm123000155ad.189.2025.06.05.12.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 12:40:47 -0700 (PDT)
Date: Thu, 5 Jun 2025 16:40:43 -0300
From: Hiago De Franco <hiagofranco@gmail.com>
To: Ross Burton <Ross.Burton@arm.com>, Khem Raj <raj.khem@gmail.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>,
	Hongxu Jia <hongxu.jia@windriver.com>,
	Hiago De Franco <hiago.franco@toradex.com>
Subject: Re: [OE-core] [PATCH] libgcrypt: fix compile error for t-thread-local
Message-ID: <20250605194043.nzlanfitchaedeyb@hiago-nb>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="7bje32ga6qu3snwm"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <26D43BA4-43AE-4D40-8533-8D443F804F97@arm.com>
 <440c4178-40b0-47c7-b7dc-1e0ee9cf65b0@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 19:40:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218079


--7bje32ga6qu3snwm
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Ross, Khem,

On Thu, Jun 05, 2025 at 01:44:08PM +0000, Ross Burton wrote:
> On 2 Jun 2025, at 21:55, Hiago De Franco via lists.openembedded.org <hiagofranco=gmail.com@lists.openembedded.org> wrote:
> > 
> > From: Hiago De Franco <hiago.franco@toradex.com>
> > 
> > Currently the libgcrypt-native build is failing with the following
> > error:
> > 
> > | ld: t_thread_local-t-thread-local.o: in function `main':
> > | t-thread-local.c:(.text.startup+0x187): undefined reference to `pthread_create'
> > | ld: t-thread-local.c:(.text.startup+0x1d0): undefined reference to `pthread_join'
> > 
> > Backport the fix from upstream and add "-lpthread" to
> > "t_thread_local_CFLAGS" to make the compilation successfull, similar to
> > what 0004-tests-Makefile.am-fix-undefined-reference-to-pthread.patch
> > does.
> 
> This has been merged but I’m curious: in what situations does this fail? The commit talks about NetBSD and we’re not seeing this on the autobuilder cluster.

The NetBSD part is from the commit I backported, because I saw this was
fixed upstream. Looks they were the first to see this issue.

I am not sure why the autobuilder was not able to catch it, we do
nightly builds of oe-core master with our hardware and the upgrade of
libgcrypt recipe introduced a regression were all our machines were
broken.

I attached the do_compile log failure, but the issue happends here:

build/tmp/hosttools/ld: t-thread-local.o: in function `main':
t-thread-local.c:(.text.startup+0x187): undefined reference to `pthread_create'
/build/tmp/hosttools/ld: t-thread-local.c:(.text.startup+0x1d0): undefined reference to `pthread_join'

[...]

ERROR: Task (virtual:native:layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb:do_compile) failed with exit code '1'

> 
> Ross

On Thu, Jun 05, 2025 at 09:46:52AM -0700, Khem Raj wrote:
> 
> 
> On 6/5/25 6:44 AM, Ross Burton via lists.openembedded.org wrote:
> > On 2 Jun 2025, at 21:55, Hiago De Franco via lists.openembedded.org <hiagofranco=gmail.com@lists.openembedded.org> wrote:
> > > 
> > > From: Hiago De Franco <hiago.franco@toradex.com>
> > > 
> > > Currently the libgcrypt-native build is failing with the following
> > > error:
> > > 
> > > | ld: t_thread_local-t-thread-local.o: in function `main':
> > > | t-thread-local.c:(.text.startup+0x187): undefined reference to `pthread_create'
> > > | ld: t-thread-local.c:(.text.startup+0x1d0): undefined reference to `pthread_join'
> > > 
> > > Backport the fix from upstream and add "-lpthread" to
> > > "t_thread_local_CFLAGS" to make the compilation successfull, similar to
> > > what 0004-tests-Makefile.am-fix-undefined-reference-to-pthread.patch
> > > does.
> 
> I wonder if the -pthread should be added instead of -lpthread since its
> adding to CFLAGS and not LDFLAGS

When I saw the patch upstream I just had to add the -lpthread and the issue
was gone. Not sure if it was the correct approach, if it is not them I
can subbmit another patch.

> 
> > 
> > This has been merged but I’m curious: in what situations does this fail? The commit talks about NetBSD and we’re not seeing this on the autobuilder cluster.
> > 
> 
> My guess is that pthread check in configure is failing. If we can see
> config.log from build dir for this package we can get a better idea.

Good point, I checked and looks like it is correctly configured:

checking for pthread_create in -lpthread... yes

But after that the do_compile fails. I also attched the do_configure log
here.

> 
> > Ross
> > 
> > 
> > 
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#218020): https://lists.openembedded.org/g/openembedded-core/message/218020
> > Mute This Topic: https://lists.openembedded.org/mt/113436606/1997914
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> > 
>

Best Regards,
Hiago.

--7bje32ga6qu3snwm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="log.do_compile.2916029"
Content-Transfer-Encoding: quoted-printable

DEBUG: Executing shell function do_compile
NOTE: make -j 64
make  all-recursive
make[1]: Entering directory '/var/home/frh/tezi-master/build/tmp/work/x86_6=
4-linux/libgcrypt-native/1.11.1/build'
Making all in compat
make[2]: Entering directory '/var/home/frh/tezi-master/build/tmp/work/x86_6=
4-linux/libgcrypt-native/1.11.1/build/compat'
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/compat -I..  -I../src -I../../libgcrypt-1.11.1=
/src -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-nati=
ve/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/include -isy=
stem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/=
1.11.1/recipe-sysroot-native/usr/include  -isystem/var/home/frh/tezi-master=
/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/=
usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks=
 -Wall -c -o compat.lo ../../libgcrypt-1.11.1/compat/compat.c
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/compat =
-I.. -I../src -I../../libgcrypt-1.11.1/src -I/var/home/frh/tezi-master/buil=
d/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/l=
ib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master/build/t=
mp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/incl=
ude -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt=
-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dh=
idden -fno-delete-null-pointer-checks -Wall -c ../../libgcrypt-1.11.1/compa=
t/compat.c  -fPIC -DPIC -o .libs/compat.o
/bin/bash ../libtool  --tag=3DCC   --mode=3Dlink gcc   -isystem/var/home/fr=
h/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sy=
sroot-native/usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-p=
ointer-checks -Wall  -L/var/home/frh/tezi-master/build/tmp/work/x86_64-linu=
x/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib                    =
     -L/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-nati=
ve/1.11.1/recipe-sysroot-native/lib                         -Wl,--enable-ne=
w-dtags                         -Wl,-rpath-link,/var/home/frh/tezi-master/b=
uild/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/us=
r/lib                         -Wl,-rpath-link,/var/home/frh/tezi-master/bui=
ld/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/lib =
                        -Wl,-rpath,/var/home/frh/tezi-master/build/tmp/work=
/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib        =
                 -Wl,-rpath,/var/home/frh/tezi-master/build/tmp/work/x86_64=
-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/lib                   =
      -Wl,-O1 -o libcompat.la  compat.lo  -lcap
libtool: link: ar cr .libs/libcompat.a .libs/compat.o=20
libtool: link: ranlib -D .libs/libcompat.a
libtool: link: ( cd ".libs" && rm -f "libcompat.la" && ln -s "../libcompat.=
la" "libcompat.la" )
make[2]: Leaving directory '/var/home/frh/tezi-master/build/tmp/work/x86_64=
-linux/libgcrypt-native/1.11.1/build/compat'
Making all in mpi
make[2]: Entering directory '/var/home/frh/tezi-master/build/tmp/work/x86_6=
4-linux/libgcrypt-native/1.11.1/build/mpi'
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/mpi -I..  -I../src -I../../libgcrypt-1.11.1/sr=
c -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-n=
ative/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-master/=
build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/u=
sr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master/bui=
ld/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/=
include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks -Wa=
ll -c -o mpi-add.lo ../../libgcrypt-1.11.1/mpi/mpi-add.c
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/mpi -I..  -I../src -I../../libgcrypt-1.11.1/sr=
c -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-n=
ative/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-master/=
build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/u=
sr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master/bui=
ld/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/=
include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks -Wa=
ll -c -o mpi-bit.lo ../../libgcrypt-1.11.1/mpi/mpi-bit.c
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/mpi -I..  -I../src -I../../libgcrypt-1.11.1/sr=
c -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-n=
ative/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-master/=
build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/u=
sr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master/bui=
ld/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/=
include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks -Wa=
ll -c -o mpi-cmp.lo ../../libgcrypt-1.11.1/mpi/mpi-cmp.c
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/mpi -I..  -I../src -I../../libgcrypt-1.11.1/sr=
c -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-n=
ative/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-master/=
build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/u=
sr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master/bui=
ld/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/=
include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks -Wa=
ll -c -o mpi-div.lo ../../libgcrypt-1.11.1/mpi/mpi-div.c
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/mpi -I..  -I../src -I../../libgcrypt-1.11.1/sr=
c -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-n=
ative/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-master/=
build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/u=
sr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master/bui=
ld/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/=
include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks -Wa=
ll -c -o mpi-gcd.lo ../../libgcrypt-1.11.1/mpi/mpi-gcd.c
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/mpi -I..  -I../src -I../../libgcrypt-1.11.1/sr=
c -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-n=
ative/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-master/=
build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/u=
sr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master/bui=
ld/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/=
include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks -Wa=
ll -c -o mpi-inline.lo ../../libgcrypt-1.11.1/mpi/mpi-inline.c
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/mpi -I..  -I../src -I../../libgcrypt-1.11.1/sr=
c -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-n=
ative/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-master/=
build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/u=
sr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master/bui=
ld/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/=
include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks -Wa=
ll -c -o mpi-inv.lo ../../libgcrypt-1.11.1/mpi/mpi-inv.c
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/mpi -I..  -I../src -I../../libgcrypt-1.11.1/sr=
c -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-n=
ative/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-master/=
build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/u=
sr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master/bui=
ld/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/=
include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks -Wa=
ll -c -o mpi-mul.lo ../../libgcrypt-1.11.1/mpi/mpi-mul.c
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/mpi -I..  -I../src -I../../libgcrypt-1.11.1/sr=
c -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-n=
ative/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-master/=
build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/u=
sr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master/bui=
ld/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/=
include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks -Wa=
ll -c -o mpi-mod.lo ../../libgcrypt-1.11.1/mpi/mpi-mod.c
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/mpi -I..  -I../src -I../../libgcrypt-1.11.1/sr=
c -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-n=
ative/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-master/=
build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/u=
sr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master/bui=
ld/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/=
include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks -Wa=
ll -c -o mpi-pow.lo ../../libgcrypt-1.11.1/mpi/mpi-pow.c
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/mpi -I..  -I../src -I../../libgcrypt-1.11.1/sr=
c -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-n=
ative/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-master/=
build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/u=
sr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master/bui=
ld/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/=
include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks -Wa=
ll -c -o mpi-mpow.lo ../../libgcrypt-1.11.1/mpi/mpi-mpow.c
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/mpi -I..  -I../src -I../../libgcrypt-1.11.1/sr=
c -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-n=
ative/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-master/=
build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/u=
sr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master/bui=
ld/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/=
include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks -Wa=
ll -c -o mpi-scan.lo ../../libgcrypt-1.11.1/mpi/mpi-scan.c
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/mpi -I..  -I../src -I../../libgcrypt-1.11.1/sr=
c -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-n=
ative/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-master/=
build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/u=
sr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master/bui=
ld/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/=
include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks -Wa=
ll -c -o mpicoder.lo ../../libgcrypt-1.11.1/mpi/mpicoder.c
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/mpi -I..  -I../src -I../../libgcrypt-1.11.1/sr=
c -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-n=
ative/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-master/=
build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/u=
sr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master/bui=
ld/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/=
include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks -Wa=
ll -c -o mpih-div.lo ../../libgcrypt-1.11.1/mpi/mpih-div.c
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/mpi -I..  -I../src -I../../libgcrypt-1.11.1/sr=
c -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-n=
ative/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-master/=
build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/u=
sr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master/bui=
ld/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/=
include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks -Wa=
ll -c -o mpih-mul.lo ../../libgcrypt-1.11.1/mpi/mpih-mul.c
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/mpi -I..  -I../src -I../../libgcrypt-1.11.1/sr=
c -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-n=
ative/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-master/=
build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/u=
sr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master/bui=
ld/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/=
include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks -Wa=
ll -c -o mpih-pow.lo ../../libgcrypt-1.11.1/mpi/mpih-pow.c
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/mpi -I..  -I../src -I../../libgcrypt-1.11.1/sr=
c -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-n=
ative/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-master/=
build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/u=
sr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master/bui=
ld/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/=
include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks -Wa=
ll -c -o mpih-const-time.lo ../../libgcrypt-1.11.1/mpi/mpih-const-time.c
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/mpi -I..  -I../src -I../../libgcrypt-1.11.1/sr=
c -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-n=
ative/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-master/=
build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/u=
sr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master/bui=
ld/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/=
include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks -Wa=
ll -c -o mpiutil.lo ../../libgcrypt-1.11.1/mpi/mpiutil.c
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/mpi -I..  -I../src -I../../libgcrypt-1.11.1/sr=
c -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-n=
ative/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-master/=
build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/u=
sr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master/bui=
ld/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/=
include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks -Wa=
ll -c -o ec.lo ../../libgcrypt-1.11.1/mpi/ec.c
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/mpi -I..  -I../src -I../../libgcrypt-1.11.1/sr=
c -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-n=
ative/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-master/=
build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/u=
sr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master/bui=
ld/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/=
include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks -Wa=
ll -c -o ec-ed25519.lo ../../libgcrypt-1.11.1/mpi/ec-ed25519.c
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/mpi -I..  -I../src -I../../libgcrypt-1.11.1/sr=
c -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-n=
ative/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-master/=
build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/u=
sr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master/bui=
ld/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/=
include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks -Wa=
ll -c -o ec-nist.lo ../../libgcrypt-1.11.1/mpi/ec-nist.c
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/mpi -I..  -I../src -I../../libgcrypt-1.11.1/sr=
c -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-n=
ative/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-master/=
build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/u=
sr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master/bui=
ld/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/=
include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks -Wa=
ll -c -o ec-hw-s390x.lo ../../libgcrypt-1.11.1/mpi/ec-hw-s390x.c
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/mpi -I..  -I../src -I../../libgcrypt-1.11.1/sr=
c -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-n=
ative/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-master/=
build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/u=
sr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master/bui=
ld/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/=
include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks -Wa=
ll -c -o mpih-add1.lo mpih-add1.c
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/mpi -I..  -I../src -I../../libgcrypt-1.11.1/sr=
c -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-n=
ative/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-master/=
build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/u=
sr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master/bui=
ld/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/=
include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks -Wa=
ll -c -o mpih-sub1.lo mpih-sub1.c
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/mpi -I..  -I../src -I../../libgcrypt-1.11.1/sr=
c -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-n=
ative/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-master/=
build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/u=
sr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master/bui=
ld/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/=
include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks -Wa=
ll -c -o mpih-mul1.lo mpih-mul1.c
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/mpi -I..  -I../src -I../../libgcrypt-1.11.1/sr=
c -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-n=
ative/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-master/=
build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/u=
sr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master/bui=
ld/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/=
include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks -Wa=
ll -c -o mpih-mul2.lo mpih-mul2.c
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/mpi -I..  -I../src -I../../libgcrypt-1.11.1/sr=
c -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-n=
ative/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-master/=
build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/u=
sr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master/bui=
ld/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/=
include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks -Wa=
ll -c -o mpih-mul3.lo mpih-mul3.c
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/mpi -I..  -I../src -I../../libgcrypt-1.11.1/sr=
c -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-n=
ative/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-master/=
build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/u=
sr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master/bui=
ld/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/=
include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks -Wa=
ll -c -o mpih-lshift.lo mpih-lshift.c
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/mpi -I..  -I../src -I../../libgcrypt-1.11.1/sr=
c -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-n=
ative/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-master/=
build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/u=
sr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master/bui=
ld/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/=
include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks -Wa=
ll -c -o mpih-rshift.lo mpih-rshift.c
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/mpi -I.=
=2E -I../src -I../../libgcrypt-1.11.1/src -isystem/var/home/frh/tezi-master=
/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/=
usr/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcry=
pt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/inclu=
de -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-=
native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dhi=
dden -fno-delete-null-pointer-checks -Wall -c ../../libgcrypt-1.11.1/mpi/mp=
i-inv.c  -fPIC -DPIC -o .libs/mpi-inv.o
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/mpi -I.=
=2E -I../src -I../../libgcrypt-1.11.1/src -isystem/var/home/frh/tezi-master=
/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/=
usr/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcry=
pt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/inclu=
de -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-=
native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dhi=
dden -fno-delete-null-pointer-checks -Wall -c ../../libgcrypt-1.11.1/mpi/mp=
i-cmp.c  -fPIC -DPIC -o .libs/mpi-cmp.o
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/mpi -I.=
=2E -I../src -I../../libgcrypt-1.11.1/src -isystem/var/home/frh/tezi-master=
/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/=
usr/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcry=
pt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/inclu=
de -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-=
native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dhi=
dden -fno-delete-null-pointer-checks -Wall -c ../../libgcrypt-1.11.1/mpi/mp=
i-mul.c  -fPIC -DPIC -o .libs/mpi-mul.o
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/mpi -I.=
=2E -I../src -I../../libgcrypt-1.11.1/src -isystem/var/home/frh/tezi-master=
/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/=
usr/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcry=
pt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/inclu=
de -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-=
native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dhi=
dden -fno-delete-null-pointer-checks -Wall -c ../../libgcrypt-1.11.1/mpi/mp=
i-add.c  -fPIC -DPIC -o .libs/mpi-add.o
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/mpi -I.=
=2E -I../src -I../../libgcrypt-1.11.1/src -isystem/var/home/frh/tezi-master=
/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/=
usr/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcry=
pt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/inclu=
de -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-=
native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dhi=
dden -fno-delete-null-pointer-checks -Wall -c ../../libgcrypt-1.11.1/mpi/mp=
i-div.c  -fPIC -DPIC -o .libs/mpi-div.o
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/mpi -I.=
=2E -I../src -I../../libgcrypt-1.11.1/src -isystem/var/home/frh/tezi-master=
/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/=
usr/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcry=
pt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/inclu=
de -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-=
native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dhi=
dden -fno-delete-null-pointer-checks -Wall -c ../../libgcrypt-1.11.1/mpi/mp=
i-inline.c  -fPIC -DPIC -o .libs/mpi-inline.o
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/mpi -I.=
=2E -I../src -I../../libgcrypt-1.11.1/src -isystem/var/home/frh/tezi-master=
/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/=
usr/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcry=
pt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/inclu=
de -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-=
native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dhi=
dden -fno-delete-null-pointer-checks -Wall -c ../../libgcrypt-1.11.1/mpi/mp=
icoder.c  -fPIC -DPIC -o .libs/mpicoder.o
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/mpi -I.=
=2E -I../src -I../../libgcrypt-1.11.1/src -isystem/var/home/frh/tezi-master=
/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/=
usr/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcry=
pt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/inclu=
de -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-=
native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dhi=
dden -fno-delete-null-pointer-checks -Wall -c ../../libgcrypt-1.11.1/mpi/mp=
i-pow.c  -fPIC -DPIC -o .libs/mpi-pow.o
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/mpi -I.=
=2E -I../src -I../../libgcrypt-1.11.1/src -isystem/var/home/frh/tezi-master=
/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/=
usr/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcry=
pt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/inclu=
de -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-=
native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dhi=
dden -fno-delete-null-pointer-checks -Wall -c ../../libgcrypt-1.11.1/mpi/mp=
i-bit.c  -fPIC -DPIC -o .libs/mpi-bit.o
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/mpi -I.=
=2E -I../src -I../../libgcrypt-1.11.1/src -isystem/var/home/frh/tezi-master=
/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/=
usr/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcry=
pt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/inclu=
de -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-=
native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dhi=
dden -fno-delete-null-pointer-checks -Wall -c ../../libgcrypt-1.11.1/mpi/mp=
i-gcd.c  -fPIC -DPIC -o .libs/mpi-gcd.o
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/mpi -I.=
=2E -I../src -I../../libgcrypt-1.11.1/src -isystem/var/home/frh/tezi-master=
/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/=
usr/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcry=
pt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/inclu=
de -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-=
native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dhi=
dden -fno-delete-null-pointer-checks -Wall -c ../../libgcrypt-1.11.1/mpi/mp=
ih-pow.c  -fPIC -DPIC -o .libs/mpih-pow.o
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/mpi -I.=
=2E -I../src -I../../libgcrypt-1.11.1/src -isystem/var/home/frh/tezi-master=
/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/=
usr/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcry=
pt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/inclu=
de -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-=
native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dhi=
dden -fno-delete-null-pointer-checks -Wall -c mpih-mul3.c  -fPIC -DPIC -o .=
libs/mpih-mul3.o
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/mpi -I.=
=2E -I../src -I../../libgcrypt-1.11.1/src -isystem/var/home/frh/tezi-master=
/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/=
usr/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcry=
pt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/inclu=
de -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-=
native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dhi=
dden -fno-delete-null-pointer-checks -Wall -c ../../libgcrypt-1.11.1/mpi/mp=
ih-mul.c  -fPIC -DPIC -o .libs/mpih-mul.o
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/mpi -I.=
=2E -I../src -I../../libgcrypt-1.11.1/src -isystem/var/home/frh/tezi-master=
/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/=
usr/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcry=
pt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/inclu=
de -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-=
native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dhi=
dden -fno-delete-null-pointer-checks -Wall -c ../../libgcrypt-1.11.1/mpi/mp=
i-mpow.c  -fPIC -DPIC -o .libs/mpi-mpow.o
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/mpi -I.=
=2E -I../src -I../../libgcrypt-1.11.1/src -isystem/var/home/frh/tezi-master=
/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/=
usr/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcry=
pt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/inclu=
de -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-=
native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dhi=
dden -fno-delete-null-pointer-checks -Wall -c mpih-mul1.c  -fPIC -DPIC -o .=
libs/mpih-mul1.o
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/mpi -I.=
=2E -I../src -I../../libgcrypt-1.11.1/src -isystem/var/home/frh/tezi-master=
/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/=
usr/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcry=
pt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/inclu=
de -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-=
native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dhi=
dden -fno-delete-null-pointer-checks -Wall -c ../../libgcrypt-1.11.1/mpi/mp=
i-mod.c  -fPIC -DPIC -o .libs/mpi-mod.o
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/mpi -I.=
=2E -I../src -I../../libgcrypt-1.11.1/src -isystem/var/home/frh/tezi-master=
/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/=
usr/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcry=
pt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/inclu=
de -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-=
native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dhi=
dden -fno-delete-null-pointer-checks -Wall -c ../../libgcrypt-1.11.1/mpi/mp=
ih-const-time.c  -fPIC -DPIC -o .libs/mpih-const-time.o
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/mpi -I.=
=2E -I../src -I../../libgcrypt-1.11.1/src -isystem/var/home/frh/tezi-master=
/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/=
usr/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcry=
pt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/inclu=
de -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-=
native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dhi=
dden -fno-delete-null-pointer-checks -Wall -c ../../libgcrypt-1.11.1/mpi/mp=
ih-div.c  -fPIC -DPIC -o .libs/mpih-div.o
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/mpi -I.=
=2E -I../src -I../../libgcrypt-1.11.1/src -isystem/var/home/frh/tezi-master=
/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/=
usr/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcry=
pt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/inclu=
de -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-=
native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dhi=
dden -fno-delete-null-pointer-checks -Wall -c ../../libgcrypt-1.11.1/mpi/ec=
-ed25519.c  -fPIC -DPIC -o .libs/ec-ed25519.o
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/mpi -I.=
=2E -I../src -I../../libgcrypt-1.11.1/src -isystem/var/home/frh/tezi-master=
/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/=
usr/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcry=
pt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/inclu=
de -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-=
native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dhi=
dden -fno-delete-null-pointer-checks -Wall -c mpih-sub1.c  -fPIC -DPIC -o .=
libs/mpih-sub1.o
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/mpi -I.=
=2E -I../src -I../../libgcrypt-1.11.1/src -isystem/var/home/frh/tezi-master=
/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/=
usr/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcry=
pt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/inclu=
de -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-=
native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dhi=
dden -fno-delete-null-pointer-checks -Wall -c mpih-mul2.c  -fPIC -DPIC -o .=
libs/mpih-mul2.o
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/mpi -I.=
=2E -I../src -I../../libgcrypt-1.11.1/src -isystem/var/home/frh/tezi-master=
/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/=
usr/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcry=
pt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/inclu=
de -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-=
native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dhi=
dden -fno-delete-null-pointer-checks -Wall -c mpih-rshift.c  -fPIC -DPIC -o=
 .libs/mpih-rshift.o
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/mpi -I.=
=2E -I../src -I../../libgcrypt-1.11.1/src -isystem/var/home/frh/tezi-master=
/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/=
usr/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcry=
pt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/inclu=
de -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-=
native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dhi=
dden -fno-delete-null-pointer-checks -Wall -c ../../libgcrypt-1.11.1/mpi/mp=
i-scan.c  -fPIC -DPIC -o .libs/mpi-scan.o
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/mpi -I.=
=2E -I../src -I../../libgcrypt-1.11.1/src -isystem/var/home/frh/tezi-master=
/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/=
usr/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcry=
pt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/inclu=
de -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-=
native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dhi=
dden -fno-delete-null-pointer-checks -Wall -c ../../libgcrypt-1.11.1/mpi/ec=
-hw-s390x.c  -fPIC -DPIC -o .libs/ec-hw-s390x.o
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/mpi -I.=
=2E -I../src -I../../libgcrypt-1.11.1/src -isystem/var/home/frh/tezi-master=
/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/=
usr/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcry=
pt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/inclu=
de -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-=
native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dhi=
dden -fno-delete-null-pointer-checks -Wall -c mpih-add1.c  -fPIC -DPIC -o .=
libs/mpih-add1.o
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/mpi -I.=
=2E -I../src -I../../libgcrypt-1.11.1/src -isystem/var/home/frh/tezi-master=
/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/=
usr/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcry=
pt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/inclu=
de -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-=
native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dhi=
dden -fno-delete-null-pointer-checks -Wall -c ../../libgcrypt-1.11.1/mpi/ec=
=2Ec  -fPIC -DPIC -o .libs/ec.o
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/mpi -I.=
=2E -I../src -I../../libgcrypt-1.11.1/src -isystem/var/home/frh/tezi-master=
/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/=
usr/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcry=
pt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/inclu=
de -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-=
native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dhi=
dden -fno-delete-null-pointer-checks -Wall -c ../../libgcrypt-1.11.1/mpi/mp=
iutil.c  -fPIC -DPIC -o .libs/mpiutil.o
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/mpi -I.=
=2E -I../src -I../../libgcrypt-1.11.1/src -isystem/var/home/frh/tezi-master=
/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/=
usr/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcry=
pt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/inclu=
de -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-=
native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dhi=
dden -fno-delete-null-pointer-checks -Wall -c ../../libgcrypt-1.11.1/mpi/ec=
-nist.c  -fPIC -DPIC -o .libs/ec-nist.o
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/mpi -I.=
=2E -I../src -I../../libgcrypt-1.11.1/src -isystem/var/home/frh/tezi-master=
/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/=
usr/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcry=
pt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/inclu=
de -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-=
native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dhi=
dden -fno-delete-null-pointer-checks -Wall -c mpih-lshift.c  -fPIC -DPIC -o=
 .libs/mpih-lshift.o
/bin/bash ../libtool  --tag=3DCC   --mode=3Dlink gcc  -I/var/home/frh/tezi-=
master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-n=
ative/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-mas=
ter/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nati=
ve/usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-che=
cks -Wall  -L/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcryp=
t-native/1.11.1/recipe-sysroot-native/usr/lib                         -L/va=
r/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/=
recipe-sysroot-native/lib                         -Wl,--enable-new-dtags   =
                      -Wl,-rpath-link,/var/home/frh/tezi-master/build/tmp/w=
ork/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib     =
                    -Wl,-rpath-link,/var/home/frh/tezi-master/build/tmp/wor=
k/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/lib           =
              -Wl,-rpath,/var/home/frh/tezi-master/build/tmp/work/x86_64-li=
nux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib                  =
       -Wl,-rpath,/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/lib=
gcrypt-native/1.11.1/recipe-sysroot-native/lib                         -Wl,=
-O1 -o libmpi.la  mpi-add.lo mpi-bit.lo mpi-cmp.lo mpi-div.lo mpi-gcd.lo mp=
i-inline.lo mpi-inv.lo mpi-mul.lo mpi-mod.lo mpi-pow.lo mpi-mpow.lo mpi-sca=
n.lo mpicoder.lo mpih-div.lo mpih-mul.lo mpih-pow.lo mpih-const-time.lo mpi=
util.lo ec.lo ec-ed25519.lo ec-nist.lo ec-hw-s390x.lo mpih-add1.lo mpih-sub=
1.lo mpih-mul1.lo mpih-mul2.lo mpih-mul3.lo mpih-lshift.lo mpih-rshift.lo  =
  -lcap
libtool: link: ar cr .libs/libmpi.a .libs/mpi-add.o .libs/mpi-bit.o .libs/m=
pi-cmp.o .libs/mpi-div.o .libs/mpi-gcd.o .libs/mpi-inline.o .libs/mpi-inv.o=
 .libs/mpi-mul.o .libs/mpi-mod.o .libs/mpi-pow.o .libs/mpi-mpow.o .libs/mpi=
-scan.o .libs/mpicoder.o .libs/mpih-div.o .libs/mpih-mul.o .libs/mpih-pow.o=
 .libs/mpih-const-time.o .libs/mpiutil.o .libs/ec.o .libs/ec-ed25519.o .lib=
s/ec-nist.o .libs/ec-hw-s390x.o .libs/mpih-add1.o .libs/mpih-sub1.o .libs/m=
pih-mul1.o .libs/mpih-mul2.o .libs/mpih-mul3.o .libs/mpih-lshift.o .libs/mp=
ih-rshift.o=20
libtool: link: ranlib -D .libs/libmpi.a
libtool: link: ( cd ".libs" && rm -f "libmpi.la" && ln -s "../libmpi.la" "l=
ibmpi.la" )
make[2]: Leaving directory '/var/home/frh/tezi-master/build/tmp/work/x86_64=
-linux/libgcrypt-native/1.11.1/build/mpi'
Making all in cipher
make[2]: Entering directory '/var/home/frh/tezi-master/build/tmp/work/x86_6=
4-linux/libgcrypt-native/1.11.1/build/cipher'
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/cipher -I..  -I../src -I../../libgcrypt-1.11.1=
/src -I../mpi -I../../libgcrypt-1.11.1/mpi -isystem/var/home/frh/tezi-maste=
r/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native=
/usr/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcr=
ypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/incl=
ude -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt=
-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dh=
idden -fno-delete-null-pointer-checks -Wall -c -o cipher.lo ../../libgcrypt=
-1.11.1/cipher/cipher.c
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/cipher -I..  -I../src -I../../libgcrypt-1.11.1=
/src -I../mpi -I../../libgcrypt-1.11.1/mpi -isystem/var/home/frh/tezi-maste=
r/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native=
/usr/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcr=
ypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/incl=
ude -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt=
-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dh=
idden -fno-delete-null-pointer-checks -Wall -c -o cipher-cbc.lo ../../libgc=
rypt-1.11.1/cipher/cipher-cbc.c
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/cipher -I..  -I../src -I../../libgcrypt-1.11.1=
/src -I../mpi -I../../libgcrypt-1.11.1/mpi -isystem/var/home/frh/tezi-maste=
r/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native=
/usr/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcr=
ypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/incl=
ude -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt=
-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dh=
idden -fno-delete-null-pointer-checks -Wall -c -o cipher-cfb.lo ../../libgc=
rypt-1.11.1/cipher/cipher-cfb.c
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/cipher -I..  -I../src -I../../libgcrypt-1.11.1=
/src -I../mpi -I../../libgcrypt-1.11.1/mpi -isystem/var/home/frh/tezi-maste=
r/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native=
/usr/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcr=
ypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/incl=
ude -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt=
-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dh=
idden -fno-delete-null-pointer-checks -Wall -c -o cipher-ofb.lo ../../libgc=
rypt-1.11.1/cipher/cipher-ofb.c
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/cipher -I..  -I../src -I../../libgcrypt-1.11.1=
/src -I../mpi -I../../libgcrypt-1.11.1/mpi -isystem/var/home/frh/tezi-maste=
r/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native=
/usr/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcr=
ypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/incl=
ude -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt=
-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dh=
idden -fno-delete-null-pointer-checks -Wall -c -o cipher-ctr.lo ../../libgc=
rypt-1.11.1/cipher/cipher-ctr.c
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/cipher -I..  -I../src -I../../libgcrypt-1.11.1=
/src -I../mpi -I../../libgcrypt-1.11.1/mpi -isystem/var/home/frh/tezi-maste=
r/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native=
/usr/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcr=
ypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/incl=
ude -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt=
-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dh=
idden -fno-delete-null-pointer-checks -Wall -c -o cipher-aeswrap.lo ../../l=
ibgcrypt-1.11.1/cipher/cipher-aeswrap.c
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/cipher -I..  -I../src -I../../libgcrypt-1.11.1=
/src -I../mpi -I../../libgcrypt-1.11.1/mpi -isystem/var/home/frh/tezi-maste=
r/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native=
/usr/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcr=
ypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/incl=
ude -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt=
-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dh=
idden -fno-delete-null-pointer-checks -Wall -c -o cipher-ccm.lo ../../libgc=
rypt-1.11.1/cipher/cipher-ccm.c
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/cipher -I..  -I../src -I../../libgcrypt-1.11.1=
/src -I../mpi -I../../libgcrypt-1.11.1/mpi -isystem/var/home/frh/tezi-maste=
r/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native=
/usr/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcr=
ypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/incl=
ude -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt=
-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dh=
idden -fno-delete-null-pointer-checks -Wall -c -o cipher-cmac.lo ../../libg=
crypt-1.11.1/cipher/cipher-cmac.c
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/cipher -I..  -I../src -I../../libgcrypt-1.11.1=
/src -I../mpi -I../../libgcrypt-1.11.1/mpi -isystem/var/home/frh/tezi-maste=
r/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native=
/usr/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcr=
ypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/incl=
ude -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt=
-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dh=
idden -fno-delete-null-pointer-checks -Wall -c -o cipher-gcm.lo ../../libgc=
rypt-1.11.1/cipher/cipher-gcm.c
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/cipher -I..  -I../src -I../../libgcrypt-1.11.1=
/src -I../mpi -I../../libgcrypt-1.11.1/mpi -isystem/var/home/frh/tezi-maste=
r/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native=
/usr/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcr=
ypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/incl=
ude -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt=
-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dh=
idden -fno-delete-null-pointer-checks -Wall -c -o cipher-poly1305.lo ../../=
libgcrypt-1.11.1/cipher/cipher-poly1305.c
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/cipher -I..  -I../src -I../../libgcrypt-1.11.1=
/src -I../mpi -I../../libgcrypt-1.11.1/mpi -isystem/var/home/frh/tezi-maste=
r/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native=
/usr/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcr=
ypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/incl=
ude -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt=
-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dh=
idden -fno-delete-null-pointer-checks -Wall -c -o cipher-ocb.lo ../../libgc=
rypt-1.11.1/cipher/cipher-ocb.c
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/cipher -I..  -I../src -I../../libgcrypt-1.11.1=
/src -I../mpi -I../../libgcrypt-1.11.1/mpi -isystem/var/home/frh/tezi-maste=
r/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native=
/usr/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcr=
ypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/incl=
ude -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt=
-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dh=
idden -fno-delete-null-pointer-checks -Wall -c -o cipher-xts.lo ../../libgc=
rypt-1.11.1/cipher/cipher-xts.c
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/cipher -I..  -I../src -I../../libgcrypt-1.11.1=
/src -I../mpi -I../../libgcrypt-1.11.1/mpi -isystem/var/home/frh/tezi-maste=
r/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native=
/usr/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcr=
ypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/incl=
ude -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt=
-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dh=
idden -fno-delete-null-pointer-checks -Wall -c -o cipher-eax.lo ../../libgc=
rypt-1.11.1/cipher/cipher-eax.c
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/cipher -I..  -I../src -I../../libgcrypt-1.11.1=
/src -I../mpi -I../../libgcrypt-1.11.1/mpi -isystem/var/home/frh/tezi-maste=
r/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native=
/usr/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcr=
ypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/incl=
ude -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt=
-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dh=
idden -fno-delete-null-pointer-checks -Wall -c -o cipher-siv.lo ../../libgc=
rypt-1.11.1/cipher/cipher-siv.c
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/cipher -I..  -I../src -I../../libgcrypt-1.11.1=
/src -I../mpi -I../../libgcrypt-1.11.1/mpi -isystem/var/home/frh/tezi-maste=
r/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native=
/usr/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcr=
ypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/incl=
ude -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt=
-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dh=
idden -fno-delete-null-pointer-checks -Wall -c -o cipher-gcm-siv.lo ../../l=
ibgcrypt-1.11.1/cipher/cipher-gcm-siv.c
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/cipher -I..  -I../src -I../../libgcrypt-1.11.1=
/src -I../mpi -I../../libgcrypt-1.11.1/mpi -isystem/var/home/frh/tezi-maste=
r/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native=
/usr/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcr=
ypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/incl=
ude -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt=
-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dh=
idden -fno-delete-null-pointer-checks -Wall -c -o pubkey.lo ../../libgcrypt=
-1.11.1/cipher/pubkey.c
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/cipher -I..  -I../src -I../../libgcrypt-1.11.1=
/src -I../mpi -I../../libgcrypt-1.11.1/mpi -isystem/var/home/frh/tezi-maste=
r/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native=
/usr/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcr=
ypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/incl=
ude -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt=
-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dh=
idden -fno-delete-null-pointer-checks -Wall -c -o pubkey-util.lo ../../libg=
crypt-1.11.1/cipher/pubkey-util.c
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/cipher -I..  -I../src -I../../libgcrypt-1.11.1=
/src -I../mpi -I../../libgcrypt-1.11.1/mpi -isystem/var/home/frh/tezi-maste=
r/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native=
/usr/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcr=
ypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/incl=
ude -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt=
-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dh=
idden -fno-delete-null-pointer-checks -Wall -c -o md.lo ../../libgcrypt-1.1=
1.1/cipher/md.c
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/cipher -I..  -I../src -I../../libgcrypt-1.11.1=
/src -I../mpi -I../../libgcrypt-1.11.1/mpi -isystem/var/home/frh/tezi-maste=
r/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native=
/usr/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcr=
ypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/incl=
ude -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt=
-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dh=
idden -fno-delete-null-pointer-checks -Wall -c -o mac.lo ../../libgcrypt-1.=
11.1/cipher/mac.c
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/cipher -I..  -I../src -I../../libgcrypt-1.11.1=
/src -I../mpi -I../../libgcrypt-1.11.1/mpi -isystem/var/home/frh/tezi-maste=
r/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native=
/usr/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcr=
ypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/incl=
ude -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt=
-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dh=
idden -fno-delete-null-pointer-checks -Wall -c -o mac-hmac.lo ../../libgcry=
pt-1.11.1/cipher/mac-hmac.c
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/cipher -I..  -I../src -I../../libgcrypt-1.11.1=
/src -I../mpi -I../../libgcrypt-1.11.1/mpi -isystem/var/home/frh/tezi-maste=
r/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native=
/usr/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcr=
ypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/incl=
ude -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt=
-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dh=
idden -fno-delete-null-pointer-checks -Wall -c -o mac-cmac.lo ../../libgcry=
pt-1.11.1/cipher/mac-cmac.c
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/cipher -I..  -I../src -I../../libgcrypt-1.11.1=
/src -I../mpi -I../../libgcrypt-1.11.1/mpi -isystem/var/home/frh/tezi-maste=
r/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native=
/usr/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcr=
ypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/incl=
ude -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt=
-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dh=
idden -fno-delete-null-pointer-checks -Wall -c -o mac-gmac.lo ../../libgcry=
pt-1.11.1/cipher/mac-gmac.c
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/cipher -I..  -I../src -I../../libgcrypt-1.11.1=
/src -I../mpi -I../../libgcrypt-1.11.1/mpi -isystem/var/home/frh/tezi-maste=
r/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native=
/usr/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcr=
ypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/incl=
ude -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt=
-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dh=
idden -fno-delete-null-pointer-checks -Wall -c -o mac-poly1305.lo ../../lib=
gcrypt-1.11.1/cipher/mac-poly1305.c
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/cipher -I..  -I../src -I../../libgcrypt-1.11.1=
/src -I../mpi -I../../libgcrypt-1.11.1/mpi -isystem/var/home/frh/tezi-maste=
r/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native=
/usr/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcr=
ypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/incl=
ude -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt=
-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dh=
idden -fno-delete-null-pointer-checks -Wall -c -o poly1305.lo ../../libgcry=
pt-1.11.1/cipher/poly1305.c
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/cipher -I..  -I../src -I../../libgcrypt-1.11.1=
/src -I../mpi -I../../libgcrypt-1.11.1/mpi -isystem/var/home/frh/tezi-maste=
r/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native=
/usr/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcr=
ypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/incl=
ude -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt=
-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dh=
idden -fno-delete-null-pointer-checks -Wall -c -o kem.lo ../../libgcrypt-1.=
11.1/cipher/kem.c
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/cipher -I..  -I../src -I../../libgcrypt-1.11.1=
/src -I../mpi -I../../libgcrypt-1.11.1/mpi -isystem/var/home/frh/tezi-maste=
r/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native=
/usr/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcr=
ypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/incl=
ude -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt=
-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dh=
idden -fno-delete-null-pointer-checks -Wall -c -o sntrup761.lo ../../libgcr=
ypt-1.11.1/cipher/sntrup761.c
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/cipher -I..  -I../src -I../../libgcrypt-1.11.1=
/src -I../mpi -I../../libgcrypt-1.11.1/mpi -isystem/var/home/frh/tezi-maste=
r/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native=
/usr/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcr=
ypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/incl=
ude -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt=
-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dh=
idden -fno-delete-null-pointer-checks -Wall -c -o kyber.lo ../../libgcrypt-=
1.11.1/cipher/kyber.c
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/cipher -I..  -I../src -I../../libgcrypt-1.11.1=
/src -I../mpi -I../../libgcrypt-1.11.1/mpi -isystem/var/home/frh/tezi-maste=
r/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native=
/usr/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcr=
ypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/incl=
ude -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt=
-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dh=
idden -fno-delete-null-pointer-checks -Wall -c -o kem-ecc.lo ../../libgcryp=
t-1.11.1/cipher/kem-ecc.c
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/cipher -I..  -I../src -I../../libgcrypt-1.11.1=
/src -I../mpi -I../../libgcrypt-1.11.1/mpi -isystem/var/home/frh/tezi-maste=
r/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native=
/usr/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcr=
ypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/incl=
ude -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt=
-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dh=
idden -fno-delete-null-pointer-checks -Wall -c -o mceliece6688128f.lo ../..=
/libgcrypt-1.11.1/cipher/mceliece6688128f.c
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/cipher -I..  -I../src -I../../libgcrypt-1.11.1=
/src -I../mpi -I../../libgcrypt-1.11.1/mpi -isystem/var/home/frh/tezi-maste=
r/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native=
/usr/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcr=
ypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/incl=
ude -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt=
-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dh=
idden -fno-delete-null-pointer-checks -Wall -c -o kdf.lo ../../libgcrypt-1.=
11.1/cipher/kdf.c
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/cipher -I..  -I../src -I../../libgcrypt-1.11.1=
/src -I../mpi -I../../libgcrypt-1.11.1/mpi -isystem/var/home/frh/tezi-maste=
r/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native=
/usr/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcr=
ypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/incl=
ude -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt=
-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dh=
idden -fno-delete-null-pointer-checks -Wall -c -o primegen.lo ../../libgcry=
pt-1.11.1/cipher/primegen.c
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/cipher -I..  -I../src -I../../libgcrypt-1.11.1=
/src -I../mpi -I../../libgcrypt-1.11.1/mpi -isystem/var/home/frh/tezi-maste=
r/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native=
/usr/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcr=
ypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/incl=
ude -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt=
-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dh=
idden -fno-delete-null-pointer-checks -Wall -c -o hash-common.lo ../../libg=
crypt-1.11.1/cipher/hash-common.c
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/cipher -I..  -I../src -I../../libgcrypt-1.11.1=
/src -I../mpi -I../../libgcrypt-1.11.1/mpi -isystem/var/home/frh/tezi-maste=
r/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native=
/usr/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcr=
ypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/incl=
ude -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt=
-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dh=
idden -fno-delete-null-pointer-checks -Wall -c -o dsa-common.lo ../../libgc=
rypt-1.11.1/cipher/dsa-common.c
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/cipher -I..  -I../src -I../../libgcrypt-1.11.1=
/src -I../mpi -I../../libgcrypt-1.11.1/mpi -isystem/var/home/frh/tezi-maste=
r/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native=
/usr/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcr=
ypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/incl=
ude -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt=
-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dh=
idden -fno-delete-null-pointer-checks -Wall -c -o rsa-common.lo ../../libgc=
rypt-1.11.1/cipher/rsa-common.c
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/cipher -I..  -I../src -I../../libgcrypt-1.11.1=
/src -I../mpi -I../../libgcrypt-1.11.1/mpi -isystem/var/home/frh/tezi-maste=
r/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native=
/usr/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcr=
ypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/incl=
ude -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt=
-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dh=
idden -fno-delete-null-pointer-checks -Wall -c -o arcfour.lo ../../libgcryp=
t-1.11.1/cipher/arcfour.c
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/cipher -I..  -I../src -I../../libgcrypt-1.11.1=
/src -I../mpi -I../../libgcrypt-1.11.1/mpi -isystem/var/home/frh/tezi-maste=
r/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native=
/usr/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcr=
ypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/incl=
ude -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt=
-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dh=
idden -fno-delete-null-pointer-checks -Wall -c -o blowfish.lo ../../libgcry=
pt-1.11.1/cipher/blowfish.c
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/cipher -I..  -I../src -I../../libgcrypt-1.11.1=
/src -I../mpi -I../../libgcrypt-1.11.1/mpi -isystem/var/home/frh/tezi-maste=
r/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native=
/usr/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcr=
ypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/incl=
ude -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt=
-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dh=
idden -fno-delete-null-pointer-checks -Wall -c -o cast5.lo ../../libgcrypt-=
1.11.1/cipher/cast5.c
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/cipher -I..  -I../src -I../../libgcrypt-1.11.1=
/src -I../mpi -I../../libgcrypt-1.11.1/mpi -isystem/var/home/frh/tezi-maste=
r/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native=
/usr/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcr=
ypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/incl=
ude -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt=
-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dh=
idden -fno-delete-null-pointer-checks -Wall -c -o des.lo ../../libgcrypt-1.=
11.1/cipher/des.c
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/cipher -I..  -I../src -I../../libgcrypt-1.11.1=
/src -I../mpi -I../../libgcrypt-1.11.1/mpi -isystem/var/home/frh/tezi-maste=
r/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native=
/usr/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcr=
ypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/incl=
ude -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt=
-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dh=
idden -fno-delete-null-pointer-checks -Wall -c -o rijndael.lo ../../libgcry=
pt-1.11.1/cipher/rijndael.c
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/cipher -I..  -I../src -I../../libgcrypt-1.11.1=
/src -I../mpi -I../../libgcrypt-1.11.1/mpi -isystem/var/home/frh/tezi-maste=
r/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native=
/usr/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcr=
ypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/incl=
ude -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt=
-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dh=
idden -fno-delete-null-pointer-checks -Wall -c -o twofish.lo ../../libgcryp=
t-1.11.1/cipher/twofish.c
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/cipher -I..  -I../src -I../../libgcrypt-1.11.1=
/src -I../mpi -I../../libgcrypt-1.11.1/mpi -isystem/var/home/frh/tezi-maste=
r/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native=
/usr/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcr=
ypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/incl=
ude -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt=
-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dh=
idden -fno-delete-null-pointer-checks -Wall -c -o serpent.lo ../../libgcryp=
t-1.11.1/cipher/serpent.c
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/cipher -I..  -I../src -I../../libgcrypt-1.11.1=
/src -I../mpi -I../../libgcrypt-1.11.1/mpi -isystem/var/home/frh/tezi-maste=
r/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native=
/usr/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcr=
ypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/incl=
ude -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt=
-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dh=
idden -fno-delete-null-pointer-checks -Wall -c -o rfc2268.lo ../../libgcryp=
t-1.11.1/cipher/rfc2268.c
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/cipher -I..  -I../src -I../../libgcrypt-1.11.1=
/src -I../mpi -I../../libgcrypt-1.11.1/mpi -isystem/var/home/frh/tezi-maste=
r/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native=
/usr/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcr=
ypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/incl=
ude -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt=
-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dh=
idden -fno-delete-null-pointer-checks -Wall -c -o seed.lo ../../libgcrypt-1=
=2E11.1/cipher/seed.c
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/cipher -I..  -I../src -I../../libgcrypt-1.11.1=
/src -I../mpi -I../../libgcrypt-1.11.1/mpi -isystem/var/home/frh/tezi-maste=
r/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native=
/usr/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcr=
ypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/incl=
ude -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt=
-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dh=
idden -fno-delete-null-pointer-checks -Wall -c -o camellia.lo ../../libgcry=
pt-1.11.1/cipher/camellia.c
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/cipher -I..  -I../src -I../../libgcrypt-1.11.1=
/src -I../mpi -I../../libgcrypt-1.11.1/mpi -isystem/var/home/frh/tezi-maste=
r/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native=
/usr/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcr=
ypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/incl=
ude -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt=
-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dh=
idden -fno-delete-null-pointer-checks -Wall -c -o camellia-glue.lo ../../li=
bgcrypt-1.11.1/cipher/camellia-glue.c
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/cipher -I..  -I../src -I../../libgcrypt-1.11.1=
/src -I../mpi -I../../libgcrypt-1.11.1/mpi -isystem/var/home/frh/tezi-maste=
r/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native=
/usr/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcr=
ypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/incl=
ude -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt=
-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dh=
idden -fno-delete-null-pointer-checks -Wall -c -o idea.lo ../../libgcrypt-1=
=2E11.1/cipher/idea.c
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/cipher -I..  -I../src -I../../libgcrypt-1.11.1=
/src -I../mpi -I../../libgcrypt-1.11.1/mpi -isystem/var/home/frh/tezi-maste=
r/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native=
/usr/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcr=
ypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/incl=
ude -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt=
-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dh=
idden -fno-delete-null-pointer-checks -Wall -c -o salsa20.lo ../../libgcryp=
t-1.11.1/cipher/salsa20.c
gcc  -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcryp=
t-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -L/var/home/frh=
/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sys=
root-native/usr/lib                         -L/var/home/frh/tezi-master/bui=
ld/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/lib =
                        -Wl,--enable-new-dtags                         -Wl,=
-rpath-link,/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt=
-native/1.11.1/recipe-sysroot-native/usr/lib                         -Wl,-r=
path-link,/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-n=
ative/1.11.1/recipe-sysroot-native/lib                         -Wl,-rpath,/=
var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.=
1/recipe-sysroot-native/usr/lib                         -Wl,-rpath,/var/hom=
e/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recip=
e-sysroot-native/lib                         -Wl,-O1 \
    -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt=
-native/1.11.1/recipe-sysroot-native/usr/include -o gost-s-box ../../libgcr=
ypt-1.11.1/cipher/gost-s-box.c
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/cipher -I..  -I../src -I../../libgcrypt-1.11.1=
/src -I../mpi -I../../libgcrypt-1.11.1/mpi -isystem/var/home/frh/tezi-maste=
r/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native=
/usr/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcr=
ypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/incl=
ude -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt=
-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dh=
idden -fno-delete-null-pointer-checks -Wall -c -o chacha20.lo ../../libgcry=
pt-1.11.1/cipher/chacha20.c
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/cipher -I..  -I../src -I../../libgcrypt-1.11.1=
/src -I../mpi -I../../libgcrypt-1.11.1/mpi -isystem/var/home/frh/tezi-maste=
r/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native=
/usr/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcr=
ypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/incl=
ude -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt=
-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dh=
idden -fno-delete-null-pointer-checks -Wall -c -o sm4.lo ../../libgcrypt-1.=
11.1/cipher/sm4.c
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/cipher -I..  -I../src -I../../libgcrypt-1.11.1=
/src -I../mpi -I../../libgcrypt-1.11.1/mpi -isystem/var/home/frh/tezi-maste=
r/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native=
/usr/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcr=
ypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/incl=
ude -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt=
-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dh=
idden -fno-delete-null-pointer-checks -Wall -c -o aria.lo ../../libgcrypt-1=
=2E11.1/cipher/aria.c
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/cipher -I..  -I../src -I../../libgcrypt-1.11.1=
/src -I../mpi -I../../libgcrypt-1.11.1/mpi -isystem/var/home/frh/tezi-maste=
r/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native=
/usr/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcr=
ypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/incl=
ude -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt=
-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dh=
idden -fno-delete-null-pointer-checks -Wall -c -o dsa.lo ../../libgcrypt-1.=
11.1/cipher/dsa.c
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/cipher -I..  -I../src -I../../libgcrypt-1.11.1=
/src -I../mpi -I../../libgcrypt-1.11.1/mpi -isystem/var/home/frh/tezi-maste=
r/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native=
/usr/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcr=
ypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/incl=
ude -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt=
-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dh=
idden -fno-delete-null-pointer-checks -Wall -c -o rsa.lo ../../libgcrypt-1.=
11.1/cipher/rsa.c
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/cipher -I..  -I../src -I../../libgcrypt-1.11.1=
/src -I../mpi -I../../libgcrypt-1.11.1/mpi -isystem/var/home/frh/tezi-maste=
r/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native=
/usr/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcr=
ypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/incl=
ude -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt=
-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dh=
idden -fno-delete-null-pointer-checks -Wall -c -o elgamal.lo ../../libgcryp=
t-1.11.1/cipher/elgamal.c
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/cipher -I..  -I../src -I../../libgcrypt-1.11.1=
/src -I../mpi -I../../libgcrypt-1.11.1/mpi -isystem/var/home/frh/tezi-maste=
r/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native=
/usr/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcr=
ypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/incl=
ude -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt=
-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dh=
idden -fno-delete-null-pointer-checks -Wall -c -o ecc.lo ../../libgcrypt-1.=
11.1/cipher/ecc.c
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/cipher -I..  -I../src -I../../libgcrypt-1.11.1=
/src -I../mpi -I../../libgcrypt-1.11.1/mpi -isystem/var/home/frh/tezi-maste=
r/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native=
/usr/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcr=
ypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/incl=
ude -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt=
-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dh=
idden -fno-delete-null-pointer-checks -Wall -c -o ecc-curves.lo ../../libgc=
rypt-1.11.1/cipher/ecc-curves.c
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/cipher -I..  -I../src -I../../libgcrypt-1.11.1=
/src -I../mpi -I../../libgcrypt-1.11.1/mpi -isystem/var/home/frh/tezi-maste=
r/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native=
/usr/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcr=
ypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/incl=
ude -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt=
-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dh=
idden -fno-delete-null-pointer-checks -Wall -c -o ecc-misc.lo ../../libgcry=
pt-1.11.1/cipher/ecc-misc.c
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/cipher -I..  -I../src -I../../libgcrypt-1.11.1=
/src -I../mpi -I../../libgcrypt-1.11.1/mpi -isystem/var/home/frh/tezi-maste=
r/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native=
/usr/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcr=
ypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/incl=
ude -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt=
-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dh=
idden -fno-delete-null-pointer-checks -Wall -c -o ecc-ecdh.lo ../../libgcry=
pt-1.11.1/cipher/ecc-ecdh.c
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/cipher -I..  -I../src -I../../libgcrypt-1.11.1=
/src -I../mpi -I../../libgcrypt-1.11.1/mpi -isystem/var/home/frh/tezi-maste=
r/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native=
/usr/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcr=
ypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/incl=
ude -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt=
-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dh=
idden -fno-delete-null-pointer-checks -Wall -c -o ecc-ecdsa.lo ../../libgcr=
ypt-1.11.1/cipher/ecc-ecdsa.c
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/cipher -I..  -I../src -I../../libgcrypt-1.11.1=
/src -I../mpi -I../../libgcrypt-1.11.1/mpi -isystem/var/home/frh/tezi-maste=
r/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native=
/usr/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcr=
ypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/incl=
ude -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt=
-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dh=
idden -fno-delete-null-pointer-checks -Wall -c -o ecc-eddsa.lo ../../libgcr=
ypt-1.11.1/cipher/ecc-eddsa.c
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/cipher -I..  -I../src -I../../libgcrypt-1.11.1=
/src -I../mpi -I../../libgcrypt-1.11.1/mpi -isystem/var/home/frh/tezi-maste=
r/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native=
/usr/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcr=
ypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/incl=
ude -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt=
-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dh=
idden -fno-delete-null-pointer-checks -Wall -c -o ecc-gost.lo ../../libgcry=
pt-1.11.1/cipher/ecc-gost.c
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/cipher -I..  -I../src -I../../libgcrypt-1.11.1=
/src -I../mpi -I../../libgcrypt-1.11.1/mpi -isystem/var/home/frh/tezi-maste=
r/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native=
/usr/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcr=
ypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/incl=
ude -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt=
-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dh=
idden -fno-delete-null-pointer-checks -Wall -c -o ecc-sm2.lo ../../libgcryp=
t-1.11.1/cipher/ecc-sm2.c
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/cipher -I..  -I../src -I../../libgcrypt-1.11.1=
/src -I../mpi -I../../libgcrypt-1.11.1/mpi -isystem/var/home/frh/tezi-maste=
r/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native=
/usr/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcr=
ypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/incl=
ude -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt=
-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dh=
idden -fno-delete-null-pointer-checks -Wall -c -o crc.lo ../../libgcrypt-1.=
11.1/cipher/crc.c
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/cipher -I..  -I../src -I../../libgcrypt-1.11.1=
/src -I../mpi -I../../libgcrypt-1.11.1/mpi -isystem/var/home/frh/tezi-maste=
r/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native=
/usr/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcr=
ypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/incl=
ude -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt=
-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dh=
idden -fno-delete-null-pointer-checks -Wall -c -o gostr3411-94.lo ../../lib=
gcrypt-1.11.1/cipher/gostr3411-94.c
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/cipher =
-I.. -I../src -I../../libgcrypt-1.11.1/src -I../mpi -I../../libgcrypt-1.11.=
1/mpi -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcry=
pt-native/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-mas=
ter/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nati=
ve/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master=
/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/=
usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks=
 -Wall -c ../../libgcrypt-1.11.1/cipher/cipher.c  -fPIC -DPIC -o .libs/ciph=
er.o
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/cipher =
-I.. -I../src -I../../libgcrypt-1.11.1/src -I../mpi -I../../libgcrypt-1.11.=
1/mpi -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcry=
pt-native/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-mas=
ter/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nati=
ve/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master=
/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/=
usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks=
 -Wall -c ../../libgcrypt-1.11.1/cipher/cipher-cfb.c  -fPIC -DPIC -o .libs/=
cipher-cfb.o
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/cipher =
-I.. -I../src -I../../libgcrypt-1.11.1/src -I../mpi -I../../libgcrypt-1.11.=
1/mpi -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcry=
pt-native/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-mas=
ter/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nati=
ve/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master=
/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/=
usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks=
 -Wall -c ../../libgcrypt-1.11.1/cipher/cipher-cbc.c  -fPIC -DPIC -o .libs/=
cipher-cbc.o
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/cipher =
-I.. -I../src -I../../libgcrypt-1.11.1/src -I../mpi -I../../libgcrypt-1.11.=
1/mpi -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcry=
pt-native/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-mas=
ter/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nati=
ve/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master=
/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/=
usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks=
 -Wall -c ../../libgcrypt-1.11.1/cipher/cipher-ofb.c  -fPIC -DPIC -o .libs/=
cipher-ofb.o
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/cipher =
-I.. -I../src -I../../libgcrypt-1.11.1/src -I../mpi -I../../libgcrypt-1.11.=
1/mpi -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcry=
pt-native/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-mas=
ter/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nati=
ve/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master=
/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/=
usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks=
 -Wall -c ../../libgcrypt-1.11.1/cipher/cipher-ccm.c  -fPIC -DPIC -o .libs/=
cipher-ccm.o
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/cipher =
-I.. -I../src -I../../libgcrypt-1.11.1/src -I../mpi -I../../libgcrypt-1.11.=
1/mpi -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcry=
pt-native/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-mas=
ter/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nati=
ve/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master=
/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/=
usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks=
 -Wall -c ../../libgcrypt-1.11.1/cipher/cipher-ctr.c  -fPIC -DPIC -o .libs/=
cipher-ctr.o
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/cipher =
-I.. -I../src -I../../libgcrypt-1.11.1/src -I../mpi -I../../libgcrypt-1.11.=
1/mpi -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcry=
pt-native/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-mas=
ter/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nati=
ve/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master=
/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/=
usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks=
 -Wall -c ../../libgcrypt-1.11.1/cipher/cipher-cmac.c  -fPIC -DPIC -o .libs=
/cipher-cmac.o
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/cipher =
-I.. -I../src -I../../libgcrypt-1.11.1/src -I../mpi -I../../libgcrypt-1.11.=
1/mpi -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcry=
pt-native/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-mas=
ter/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nati=
ve/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master=
/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/=
usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks=
 -Wall -c ../../libgcrypt-1.11.1/cipher/cipher-siv.c  -fPIC -DPIC -o .libs/=
cipher-siv.o
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/cipher =
-I.. -I../src -I../../libgcrypt-1.11.1/src -I../mpi -I../../libgcrypt-1.11.=
1/mpi -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcry=
pt-native/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-mas=
ter/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nati=
ve/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master=
/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/=
usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks=
 -Wall -c ../../libgcrypt-1.11.1/cipher/cipher-aeswrap.c  -fPIC -DPIC -o .l=
ibs/cipher-aeswrap.o
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/cipher =
-I.. -I../src -I../../libgcrypt-1.11.1/src -I../mpi -I../../libgcrypt-1.11.=
1/mpi -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcry=
pt-native/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-mas=
ter/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nati=
ve/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master=
/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/=
usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks=
 -Wall -c ../../libgcrypt-1.11.1/cipher/cipher-poly1305.c  -fPIC -DPIC -o .=
libs/cipher-poly1305.o
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/cipher =
-I.. -I../src -I../../libgcrypt-1.11.1/src -I../mpi -I../../libgcrypt-1.11.=
1/mpi -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcry=
pt-native/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-mas=
ter/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nati=
ve/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master=
/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/=
usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks=
 -Wall -c ../../libgcrypt-1.11.1/cipher/pubkey-util.c  -fPIC -DPIC -o .libs=
/pubkey-util.o
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/cipher =
-I.. -I../src -I../../libgcrypt-1.11.1/src -I../mpi -I../../libgcrypt-1.11.=
1/mpi -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcry=
pt-native/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-mas=
ter/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nati=
ve/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master=
/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/=
usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks=
 -Wall -c ../../libgcrypt-1.11.1/cipher/cipher-xts.c  -fPIC -DPIC -o .libs/=
cipher-xts.o
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/cipher =
-I.. -I../src -I../../libgcrypt-1.11.1/src -I../mpi -I../../libgcrypt-1.11.=
1/mpi -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcry=
pt-native/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-mas=
ter/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nati=
ve/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master=
/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/=
usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks=
 -Wall -c ../../libgcrypt-1.11.1/cipher/cipher-gcm-siv.c  -fPIC -DPIC -o .l=
ibs/cipher-gcm-siv.o
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/cipher =
-I.. -I../src -I../../libgcrypt-1.11.1/src -I../mpi -I../../libgcrypt-1.11.=
1/mpi -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcry=
pt-native/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-mas=
ter/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nati=
ve/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master=
/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/=
usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks=
 -Wall -c ../../libgcrypt-1.11.1/cipher/cipher-ocb.c  -fPIC -DPIC -o .libs/=
cipher-ocb.o
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/cipher =
-I.. -I../src -I../../libgcrypt-1.11.1/src -I../mpi -I../../libgcrypt-1.11.=
1/mpi -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcry=
pt-native/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-mas=
ter/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nati=
ve/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master=
/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/=
usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks=
 -Wall -c ../../libgcrypt-1.11.1/cipher/pubkey.c  -fPIC -DPIC -o .libs/pubk=
ey.o
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/cipher =
-I.. -I../src -I../../libgcrypt-1.11.1/src -I../mpi -I../../libgcrypt-1.11.=
1/mpi -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcry=
pt-native/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-mas=
ter/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nati=
ve/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master=
/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/=
usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks=
 -Wall -c ../../libgcrypt-1.11.1/cipher/cipher-gcm.c  -fPIC -DPIC -o .libs/=
cipher-gcm.o
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/cipher =
-I.. -I../src -I../../libgcrypt-1.11.1/src -I../mpi -I../../libgcrypt-1.11.=
1/mpi -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcry=
pt-native/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-mas=
ter/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nati=
ve/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master=
/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/=
usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks=
 -Wall -c ../../libgcrypt-1.11.1/cipher/cipher-eax.c  -fPIC -DPIC -o .libs/=
cipher-eax.o
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/cipher =
-I.. -I../src -I../../libgcrypt-1.11.1/src -I../mpi -I../../libgcrypt-1.11.=
1/mpi -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcry=
pt-native/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-mas=
ter/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nati=
ve/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master=
/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/=
usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks=
 -Wall -c ../../libgcrypt-1.11.1/cipher/mac-hmac.c  -fPIC -DPIC -o .libs/ma=
c-hmac.o
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/cipher =
-I.. -I../src -I../../libgcrypt-1.11.1/src -I../mpi -I../../libgcrypt-1.11.=
1/mpi -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcry=
pt-native/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-mas=
ter/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nati=
ve/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master=
/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/=
usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks=
 -Wall -c ../../libgcrypt-1.11.1/cipher/md.c  -fPIC -DPIC -o .libs/md.o
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/cipher =
-I.. -I../src -I../../libgcrypt-1.11.1/src -I../mpi -I../../libgcrypt-1.11.=
1/mpi -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcry=
pt-native/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-mas=
ter/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nati=
ve/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master=
/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/=
usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks=
 -Wall -c ../../libgcrypt-1.11.1/cipher/mac.c  -fPIC -DPIC -o .libs/mac.o
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/cipher =
-I.. -I../src -I../../libgcrypt-1.11.1/src -I../mpi -I../../libgcrypt-1.11.=
1/mpi -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcry=
pt-native/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-mas=
ter/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nati=
ve/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master=
/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/=
usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks=
 -Wall -c ../../libgcrypt-1.11.1/cipher/mac-poly1305.c  -fPIC -DPIC -o .lib=
s/mac-poly1305.o
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/cipher =
-I.. -I../src -I../../libgcrypt-1.11.1/src -I../mpi -I../../libgcrypt-1.11.=
1/mpi -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcry=
pt-native/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-mas=
ter/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nati=
ve/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master=
/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/=
usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks=
 -Wall -c ../../libgcrypt-1.11.1/cipher/mac-cmac.c  -fPIC -DPIC -o .libs/ma=
c-cmac.o
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/cipher =
-I.. -I../src -I../../libgcrypt-1.11.1/src -I../mpi -I../../libgcrypt-1.11.=
1/mpi -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcry=
pt-native/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-mas=
ter/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nati=
ve/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master=
/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/=
usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks=
 -Wall -c ../../libgcrypt-1.11.1/cipher/poly1305.c  -fPIC -DPIC -o .libs/po=
ly1305.o
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/cipher =
-I.. -I../src -I../../libgcrypt-1.11.1/src -I../mpi -I../../libgcrypt-1.11.=
1/mpi -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcry=
pt-native/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-mas=
ter/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nati=
ve/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master=
/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/=
usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks=
 -Wall -c ../../libgcrypt-1.11.1/cipher/mac-gmac.c  -fPIC -DPIC -o .libs/ma=
c-gmac.o
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/cipher =
-I.. -I../src -I../../libgcrypt-1.11.1/src -I../mpi -I../../libgcrypt-1.11.=
1/mpi -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcry=
pt-native/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-mas=
ter/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nati=
ve/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master=
/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/=
usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks=
 -Wall -c ../../libgcrypt-1.11.1/cipher/kyber.c  -fPIC -DPIC -o .libs/kyber=
=2Eo
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/cipher =
-I.. -I../src -I../../libgcrypt-1.11.1/src -I../mpi -I../../libgcrypt-1.11.=
1/mpi -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcry=
pt-native/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-mas=
ter/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nati=
ve/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master=
/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/=
usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks=
 -Wall -c ../../libgcrypt-1.11.1/cipher/kem.c  -fPIC -DPIC -o .libs/kem.o
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/cipher =
-I.. -I../src -I../../libgcrypt-1.11.1/src -I../mpi -I../../libgcrypt-1.11.=
1/mpi -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcry=
pt-native/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-mas=
ter/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nati=
ve/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master=
/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/=
usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks=
 -Wall -c ../../libgcrypt-1.11.1/cipher/kem-ecc.c  -fPIC -DPIC -o .libs/kem=
-ecc.o
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/cipher =
-I.. -I../src -I../../libgcrypt-1.11.1/src -I../mpi -I../../libgcrypt-1.11.=
1/mpi -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcry=
pt-native/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-mas=
ter/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nati=
ve/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master=
/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/=
usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks=
 -Wall -c ../../libgcrypt-1.11.1/cipher/sntrup761.c  -fPIC -DPIC -o .libs/s=
ntrup761.o
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/cipher =
-I.. -I../src -I../../libgcrypt-1.11.1/src -I../mpi -I../../libgcrypt-1.11.=
1/mpi -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcry=
pt-native/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-mas=
ter/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nati=
ve/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master=
/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/=
usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks=
 -Wall -c ../../libgcrypt-1.11.1/cipher/hash-common.c  -fPIC -DPIC -o .libs=
/hash-common.o
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/cipher =
-I.. -I../src -I../../libgcrypt-1.11.1/src -I../mpi -I../../libgcrypt-1.11.=
1/mpi -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcry=
pt-native/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-mas=
ter/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nati=
ve/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master=
/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/=
usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks=
 -Wall -c ../../libgcrypt-1.11.1/cipher/kdf.c  -fPIC -DPIC -o .libs/kdf.o
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/cipher =
-I.. -I../src -I../../libgcrypt-1.11.1/src -I../mpi -I../../libgcrypt-1.11.=
1/mpi -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcry=
pt-native/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-mas=
ter/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nati=
ve/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master=
/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/=
usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks=
 -Wall -c ../../libgcrypt-1.11.1/cipher/mceliece6688128f.c  -fPIC -DPIC -o =
=2Elibs/mceliece6688128f.o
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/cipher =
-I.. -I../src -I../../libgcrypt-1.11.1/src -I../mpi -I../../libgcrypt-1.11.=
1/mpi -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcry=
pt-native/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-mas=
ter/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nati=
ve/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master=
/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/=
usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks=
 -Wall -c ../../libgcrypt-1.11.1/cipher/des.c  -fPIC -DPIC -o .libs/des.o
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/cipher =
-I.. -I../src -I../../libgcrypt-1.11.1/src -I../mpi -I../../libgcrypt-1.11.=
1/mpi -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcry=
pt-native/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-mas=
ter/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nati=
ve/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master=
/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/=
usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks=
 -Wall -c ../../libgcrypt-1.11.1/cipher/blowfish.c  -fPIC -DPIC -o .libs/bl=
owfish.o
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/cipher =
-I.. -I../src -I../../libgcrypt-1.11.1/src -I../mpi -I../../libgcrypt-1.11.=
1/mpi -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcry=
pt-native/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-mas=
ter/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nati=
ve/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master=
/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/=
usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks=
 -Wall -c ../../libgcrypt-1.11.1/cipher/primegen.c  -fPIC -DPIC -o .libs/pr=
imegen.o
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/cipher =
-I.. -I../src -I../../libgcrypt-1.11.1/src -I../mpi -I../../libgcrypt-1.11.=
1/mpi -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcry=
pt-native/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-mas=
ter/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nati=
ve/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master=
/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/=
usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks=
 -Wall -c ../../libgcrypt-1.11.1/cipher/dsa-common.c  -fPIC -DPIC -o .libs/=
dsa-common.o
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/cipher =
-I.. -I../src -I../../libgcrypt-1.11.1/src -I../mpi -I../../libgcrypt-1.11.=
1/mpi -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcry=
pt-native/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-mas=
ter/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nati=
ve/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master=
/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/=
usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks=
 -Wall -c ../../libgcrypt-1.11.1/cipher/arcfour.c  -fPIC -DPIC -o .libs/arc=
four.o
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/cipher =
-I.. -I../src -I../../libgcrypt-1.11.1/src -I../mpi -I../../libgcrypt-1.11.=
1/mpi -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcry=
pt-native/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-mas=
ter/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nati=
ve/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master=
/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/=
usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks=
 -Wall -c ../../libgcrypt-1.11.1/cipher/rsa-common.c  -fPIC -DPIC -o .libs/=
rsa-common.o
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/cipher =
-I.. -I../src -I../../libgcrypt-1.11.1/src -I../mpi -I../../libgcrypt-1.11.=
1/mpi -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcry=
pt-native/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-mas=
ter/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nati=
ve/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master=
/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/=
usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks=
 -Wall -c ../../libgcrypt-1.11.1/cipher/serpent.c  -fPIC -DPIC -o .libs/ser=
pent.o
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/cipher =
-I.. -I../src -I../../libgcrypt-1.11.1/src -I../mpi -I../../libgcrypt-1.11.=
1/mpi -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcry=
pt-native/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-mas=
ter/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nati=
ve/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master=
/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/=
usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks=
 -Wall -c ../../libgcrypt-1.11.1/cipher/cast5.c  -fPIC -DPIC -o .libs/cast5=
=2Eo
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/cipher =
-I.. -I../src -I../../libgcrypt-1.11.1/src -I../mpi -I../../libgcrypt-1.11.=
1/mpi -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcry=
pt-native/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-mas=
ter/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nati=
ve/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master=
/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/=
usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks=
 -Wall -c ../../libgcrypt-1.11.1/cipher/rfc2268.c  -fPIC -DPIC -o .libs/rfc=
2268.o
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/cipher =
-I.. -I../src -I../../libgcrypt-1.11.1/src -I../mpi -I../../libgcrypt-1.11.=
1/mpi -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcry=
pt-native/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-mas=
ter/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nati=
ve/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master=
/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/=
usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks=
 -Wall -c ../../libgcrypt-1.11.1/cipher/rijndael.c  -fPIC -DPIC -o .libs/ri=
jndael.o
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/cipher =
-I.. -I../src -I../../libgcrypt-1.11.1/src -I../mpi -I../../libgcrypt-1.11.=
1/mpi -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcry=
pt-native/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-mas=
ter/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nati=
ve/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master=
/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/=
usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks=
 -Wall -c ../../libgcrypt-1.11.1/cipher/twofish.c  -fPIC -DPIC -o .libs/two=
fish.o
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/cipher =
-I.. -I../src -I../../libgcrypt-1.11.1/src -I../mpi -I../../libgcrypt-1.11.=
1/mpi -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcry=
pt-native/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-mas=
ter/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nati=
ve/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master=
/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/=
usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks=
 -Wall -c ../../libgcrypt-1.11.1/cipher/chacha20.c  -fPIC -DPIC -o .libs/ch=
acha20.o
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/cipher =
-I.. -I../src -I../../libgcrypt-1.11.1/src -I../mpi -I../../libgcrypt-1.11.=
1/mpi -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcry=
pt-native/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-mas=
ter/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nati=
ve/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master=
/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/=
usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks=
 -Wall -c ../../libgcrypt-1.11.1/cipher/salsa20.c  -fPIC -DPIC -o .libs/sal=
sa20.o
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/cipher =
-I.. -I../src -I../../libgcrypt-1.11.1/src -I../mpi -I../../libgcrypt-1.11.=
1/mpi -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcry=
pt-native/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-mas=
ter/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nati=
ve/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master=
/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/=
usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks=
 -Wall -c ../../libgcrypt-1.11.1/cipher/aria.c  -fPIC -DPIC -o .libs/aria.o
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/cipher =
-I.. -I../src -I../../libgcrypt-1.11.1/src -I../mpi -I../../libgcrypt-1.11.=
1/mpi -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcry=
pt-native/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-mas=
ter/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nati=
ve/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master=
/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/=
usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks=
 -Wall -c ../../libgcrypt-1.11.1/cipher/seed.c  -fPIC -DPIC -o .libs/seed.o
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/cipher =
-I.. -I../src -I../../libgcrypt-1.11.1/src -I../mpi -I../../libgcrypt-1.11.=
1/mpi -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcry=
pt-native/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-mas=
ter/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nati=
ve/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master=
/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/=
usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks=
 -Wall -c ../../libgcrypt-1.11.1/cipher/sm4.c  -fPIC -DPIC -o .libs/sm4.o
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/cipher =
-I.. -I../src -I../../libgcrypt-1.11.1/src -I../mpi -I../../libgcrypt-1.11.=
1/mpi -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcry=
pt-native/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-mas=
ter/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nati=
ve/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master=
/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/=
usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks=
 -Wall -c ../../libgcrypt-1.11.1/cipher/idea.c  -fPIC -DPIC -o .libs/idea.o
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/cipher =
-I.. -I../src -I../../libgcrypt-1.11.1/src -I../mpi -I../../libgcrypt-1.11.=
1/mpi -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcry=
pt-native/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-mas=
ter/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nati=
ve/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master=
/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/=
usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks=
 -Wall -c ../../libgcrypt-1.11.1/cipher/camellia-glue.c  -fPIC -DPIC -o .li=
bs/camellia-glue.o
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/cipher =
-I.. -I../src -I../../libgcrypt-1.11.1/src -I../mpi -I../../libgcrypt-1.11.=
1/mpi -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcry=
pt-native/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-mas=
ter/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nati=
ve/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master=
/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/=
usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks=
 -Wall -c ../../libgcrypt-1.11.1/cipher/camellia.c  -fPIC -DPIC -o .libs/ca=
mellia.o
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/cipher =
-I.. -I../src -I../../libgcrypt-1.11.1/src -I../mpi -I../../libgcrypt-1.11.=
1/mpi -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcry=
pt-native/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-mas=
ter/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nati=
ve/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master=
/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/=
usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks=
 -Wall -c ../../libgcrypt-1.11.1/cipher/dsa.c  -fPIC -DPIC -o .libs/dsa.o
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/cipher =
-I.. -I../src -I../../libgcrypt-1.11.1/src -I../mpi -I../../libgcrypt-1.11.=
1/mpi -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcry=
pt-native/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-mas=
ter/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nati=
ve/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master=
/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/=
usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks=
 -Wall -c ../../libgcrypt-1.11.1/cipher/rsa.c  -fPIC -DPIC -o .libs/rsa.o
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/cipher =
-I.. -I../src -I../../libgcrypt-1.11.1/src -I../mpi -I../../libgcrypt-1.11.=
1/mpi -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcry=
pt-native/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-mas=
ter/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nati=
ve/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master=
/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/=
usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks=
 -Wall -c ../../libgcrypt-1.11.1/cipher/ecc-curves.c  -fPIC -DPIC -o .libs/=
ecc-curves.o
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/cipher =
-I.. -I../src -I../../libgcrypt-1.11.1/src -I../mpi -I../../libgcrypt-1.11.=
1/mpi -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcry=
pt-native/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-mas=
ter/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nati=
ve/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master=
/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/=
usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks=
 -Wall -c ../../libgcrypt-1.11.1/cipher/ecc.c  -fPIC -DPIC -o .libs/ecc.o
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/cipher =
-I.. -I../src -I../../libgcrypt-1.11.1/src -I../mpi -I../../libgcrypt-1.11.=
1/mpi -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcry=
pt-native/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-mas=
ter/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nati=
ve/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master=
/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/=
usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks=
 -Wall -c ../../libgcrypt-1.11.1/cipher/ecc-ecdsa.c  -fPIC -DPIC -o .libs/e=
cc-ecdsa.o
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/cipher =
-I.. -I../src -I../../libgcrypt-1.11.1/src -I../mpi -I../../libgcrypt-1.11.=
1/mpi -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcry=
pt-native/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-mas=
ter/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nati=
ve/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master=
/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/=
usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks=
 -Wall -c ../../libgcrypt-1.11.1/cipher/elgamal.c  -fPIC -DPIC -o .libs/elg=
amal.o
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/cipher =
-I.. -I../src -I../../libgcrypt-1.11.1/src -I../mpi -I../../libgcrypt-1.11.=
1/mpi -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcry=
pt-native/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-mas=
ter/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nati=
ve/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master=
/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/=
usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks=
 -Wall -c ../../libgcrypt-1.11.1/cipher/ecc-ecdh.c  -fPIC -DPIC -o .libs/ec=
c-ecdh.o
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/cipher =
-I.. -I../src -I../../libgcrypt-1.11.1/src -I../mpi -I../../libgcrypt-1.11.=
1/mpi -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcry=
pt-native/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-mas=
ter/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nati=
ve/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master=
/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/=
usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks=
 -Wall -c ../../libgcrypt-1.11.1/cipher/ecc-misc.c  -fPIC -DPIC -o .libs/ec=
c-misc.o
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/cipher =
-I.. -I../src -I../../libgcrypt-1.11.1/src -I../mpi -I../../libgcrypt-1.11.=
1/mpi -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcry=
pt-native/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-mas=
ter/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nati=
ve/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master=
/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/=
usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks=
 -Wall -c ../../libgcrypt-1.11.1/cipher/ecc-sm2.c  -fPIC -DPIC -o .libs/ecc=
-sm2.o
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/cipher =
-I.. -I../src -I../../libgcrypt-1.11.1/src -I../mpi -I../../libgcrypt-1.11.=
1/mpi -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcry=
pt-native/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-mas=
ter/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nati=
ve/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master=
/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/=
usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks=
 -Wall -c ../../libgcrypt-1.11.1/cipher/ecc-eddsa.c  -fPIC -DPIC -o .libs/e=
cc-eddsa.o
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/cipher =
-I.. -I../src -I../../libgcrypt-1.11.1/src -I../mpi -I../../libgcrypt-1.11.=
1/mpi -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcry=
pt-native/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-mas=
ter/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nati=
ve/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master=
/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/=
usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks=
 -Wall -c ../../libgcrypt-1.11.1/cipher/gostr3411-94.c  -fPIC -DPIC -o .lib=
s/gostr3411-94.o
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/cipher =
-I.. -I../src -I../../libgcrypt-1.11.1/src -I../mpi -I../../libgcrypt-1.11.=
1/mpi -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcry=
pt-native/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-mas=
ter/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nati=
ve/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master=
/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/=
usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks=
 -Wall -c ../../libgcrypt-1.11.1/cipher/ecc-gost.c  -fPIC -DPIC -o .libs/ec=
c-gost.o
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/cipher =
-I.. -I../src -I../../libgcrypt-1.11.1/src -I../mpi -I../../libgcrypt-1.11.=
1/mpi -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcry=
pt-native/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-mas=
ter/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nati=
ve/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master=
/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/=
usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks=
 -Wall -c ../../libgcrypt-1.11.1/cipher/crc.c  -fPIC -DPIC -o .libs/crc.o
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/cipher -I..  -I../src -I../../libgcrypt-1.11.1=
/src -I../mpi -I../../libgcrypt-1.11.1/mpi -isystem/var/home/frh/tezi-maste=
r/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native=
/usr/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcr=
ypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/incl=
ude -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt=
-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dh=
idden -fno-delete-null-pointer-checks -Wall -c -o stribog.lo ../../libgcryp=
t-1.11.1/cipher/stribog.c
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/cipher =
-I.. -I../src -I../../libgcrypt-1.11.1/src -I../mpi -I../../libgcrypt-1.11.=
1/mpi -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcry=
pt-native/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-mas=
ter/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nati=
ve/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master=
/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/=
usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks=
 -Wall -c ../../libgcrypt-1.11.1/cipher/stribog.c  -fPIC -DPIC -o .libs/str=
ibog.o
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/cipher -I..  -I../src -I../../libgcrypt-1.11.1=
/src -I../mpi -I../../libgcrypt-1.11.1/mpi -isystem/var/home/frh/tezi-maste=
r/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native=
/usr/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcr=
ypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/incl=
ude -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt=
-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dh=
idden -fno-delete-null-pointer-checks -Wall -c -o md4.lo ../../libgcrypt-1.=
11.1/cipher/md4.c
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/cipher -I..  -I../src -I../../libgcrypt-1.11.1=
/src -I../mpi -I../../libgcrypt-1.11.1/mpi -isystem/var/home/frh/tezi-maste=
r/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native=
/usr/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcr=
ypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/incl=
ude -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt=
-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dh=
idden -fno-delete-null-pointer-checks -Wall -c -o md5.lo ../../libgcrypt-1.=
11.1/cipher/md5.c
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/cipher -I..  -I../src -I../../libgcrypt-1.11.1=
/src -I../mpi -I../../libgcrypt-1.11.1/mpi -isystem/var/home/frh/tezi-maste=
r/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native=
/usr/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcr=
ypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/incl=
ude -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt=
-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dh=
idden -fno-delete-null-pointer-checks -Wall -c -o rmd160.lo ../../libgcrypt=
-1.11.1/cipher/rmd160.c
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/cipher -I..  -I../src -I../../libgcrypt-1.11.1=
/src -I../mpi -I../../libgcrypt-1.11.1/mpi -isystem/var/home/frh/tezi-maste=
r/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native=
/usr/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcr=
ypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/incl=
ude -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt=
-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dh=
idden -fno-delete-null-pointer-checks -Wall -c -o sha256.lo ../../libgcrypt=
-1.11.1/cipher/sha256.c
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/cipher -I..  -I../src -I../../libgcrypt-1.11.1=
/src -I../mpi -I../../libgcrypt-1.11.1/mpi -isystem/var/home/frh/tezi-maste=
r/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native=
/usr/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcr=
ypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/incl=
ude -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt=
-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dh=
idden -fno-delete-null-pointer-checks -Wall -c -o sha512.lo ../../libgcrypt=
-1.11.1/cipher/sha512.c
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/cipher -I..  -I../src -I../../libgcrypt-1.11.1=
/src -I../mpi -I../../libgcrypt-1.11.1/mpi -isystem/var/home/frh/tezi-maste=
r/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native=
/usr/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcr=
ypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/incl=
ude -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt=
-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dh=
idden -fno-delete-null-pointer-checks -Wall -c -o keccak.lo ../../libgcrypt=
-1.11.1/cipher/keccak.c
`echo /bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFI=
G_H -I. -I../../libgcrypt-1.11.1/cipher -I..  -I../src -I../../libgcrypt-1.=
11.1/src -I../mpi -I../../libgcrypt-1.11.1/mpi -isystem/var/home/frh/tezi-m=
aster/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-na=
tive/usr/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/li=
bgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/=
include -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgc=
rypt-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=
=3Dhidden -fno-delete-null-pointer-checks -Wall -c ../../libgcrypt-1.11.1/c=
ipher/tiger.c | sed -e 's/[[:blank:]]-O\([2-9sgz][2-9sgz]*\)/ -O1 /g' -e 's=
/[[:blank:]]-Ofast/ -O1 /g' `
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/cipher -I..  -I../src -I../../libgcrypt-1.11.1=
/src -I../mpi -I../../libgcrypt-1.11.1/mpi -isystem/var/home/frh/tezi-maste=
r/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native=
/usr/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcr=
ypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/incl=
ude -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt=
-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dh=
idden -fno-delete-null-pointer-checks -Wall -c -o whirlpool.lo ../../libgcr=
ypt-1.11.1/cipher/whirlpool.c
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/cipher -I..  -I../src -I../../libgcrypt-1.11.1=
/src -I../mpi -I../../libgcrypt-1.11.1/mpi -isystem/var/home/frh/tezi-maste=
r/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native=
/usr/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcr=
ypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/incl=
ude -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt=
-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dh=
idden -fno-delete-null-pointer-checks -Wall -c -o blake2.lo ../../libgcrypt=
-1.11.1/cipher/blake2.c
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/cipher -I..  -I../src -I../../libgcrypt-1.11.1=
/src -I../mpi -I../../libgcrypt-1.11.1/mpi -isystem/var/home/frh/tezi-maste=
r/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native=
/usr/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcr=
ypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/incl=
ude -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt=
-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dh=
idden -fno-delete-null-pointer-checks -Wall -c -o sm3.lo ../../libgcrypt-1.=
11.1/cipher/sm3.c
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/cipher -I..  -I../src -I../../libgcrypt-1.11.1=
/src -I../mpi -I../../libgcrypt-1.11.1/mpi -isystem/var/home/frh/tezi-maste=
r/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native=
/usr/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcr=
ypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/incl=
ude -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt=
-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dh=
idden -fno-delete-null-pointer-checks -Wall -c -o sha1.lo ../../libgcrypt-1=
=2E11.1/cipher/sha1.c
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/cipher -I..  -I../src -I../../libgcrypt-1.11.1=
/src -I../mpi -I../../libgcrypt-1.11.1/mpi -isystem/var/home/frh/tezi-maste=
r/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native=
/usr/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcr=
ypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/incl=
ude -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt=
-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dh=
idden -fno-delete-null-pointer-checks -Wall -c -o scrypt.lo ../../libgcrypt=
-1.11.1/cipher/scrypt.c
=2E/gost-s-box gost-sb.h
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/cipher -I..  -I../src -I../../libgcrypt-1.11.1=
/src -I../mpi -I../../libgcrypt-1.11.1/mpi -isystem/var/home/frh/tezi-maste=
r/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native=
/usr/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcr=
ypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/incl=
ude -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt=
-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dh=
idden -fno-delete-null-pointer-checks -Wall -c -o gost28147.lo ../../libgcr=
ypt-1.11.1/cipher/gost28147.c
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/cipher =
-I.. -I../src -I../../libgcrypt-1.11.1/src -I../mpi -I../../libgcrypt-1.11.=
1/mpi -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcry=
pt-native/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-mas=
ter/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nati=
ve/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master=
/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/=
usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks=
 -Wall -c ../../libgcrypt-1.11.1/cipher/md4.c  -fPIC -DPIC -o .libs/md4.o
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/cipher =
-I.. -I../src -I../../libgcrypt-1.11.1/src -I../mpi -I../../libgcrypt-1.11.=
1/mpi -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcry=
pt-native/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-mas=
ter/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nati=
ve/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master=
/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/=
usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks=
 -Wall -c ../../libgcrypt-1.11.1/cipher/md5.c  -fPIC -DPIC -o .libs/md5.o
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/cipher =
-I.. -I../src -I../../libgcrypt-1.11.1/src -I../mpi -I../../libgcrypt-1.11.=
1/mpi -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcry=
pt-native/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-mas=
ter/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nati=
ve/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master=
/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/=
usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks=
 -Wall -c ../../libgcrypt-1.11.1/cipher/sha512.c  -fPIC -DPIC -o .libs/sha5=
12.o
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/cipher =
-I.. -I../src -I../../libgcrypt-1.11.1/src -I../mpi -I../../libgcrypt-1.11.=
1/mpi -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcry=
pt-native/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-mas=
ter/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nati=
ve/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master=
/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/=
usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks=
 -Wall -c ../../libgcrypt-1.11.1/cipher/rmd160.c  -fPIC -DPIC -o .libs/rmd1=
60.o
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/cipher =
-I.. -I../src -I../../libgcrypt-1.11.1/src -I../mpi -I../../libgcrypt-1.11.=
1/mpi -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcry=
pt-native/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-mas=
ter/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nati=
ve/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master=
/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/=
usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks=
 -Wall -c ../../libgcrypt-1.11.1/cipher/sha256.c  -fPIC -DPIC -o .libs/sha2=
56.o
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/cipher =
-I.. -I../src -I../../libgcrypt-1.11.1/src -I../mpi -I../../libgcrypt-1.11.=
1/mpi -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcry=
pt-native/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-mas=
ter/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nati=
ve/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master=
/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/=
usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks=
 -Wall -c ../../libgcrypt-1.11.1/cipher/whirlpool.c  -fPIC -DPIC -o .libs/w=
hirlpool.o
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/cipher =
-I.. -I../src -I../../libgcrypt-1.11.1/src -I../mpi -I../../libgcrypt-1.11.=
1/mpi -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcry=
pt-native/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-mas=
ter/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nati=
ve/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master=
/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/=
usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks=
 -Wall -c ../../libgcrypt-1.11.1/cipher/blake2.c  -fPIC -DPIC -o .libs/blak=
e2.o
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/cipher =
-I.. -I../src -I../../libgcrypt-1.11.1/src -I../mpi -I../../libgcrypt-1.11.=
1/mpi -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcry=
pt-native/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-mas=
ter/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nati=
ve/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master=
/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/=
usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks=
 -Wall -c ../../libgcrypt-1.11.1/cipher/keccak.c  -fPIC -DPIC -o .libs/kecc=
ak.o
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/cipher =
-I.. -I../src -I../../libgcrypt-1.11.1/src -I../mpi -I../../libgcrypt-1.11.=
1/mpi -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcry=
pt-native/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-mas=
ter/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nati=
ve/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master=
/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/=
usr/include -O1 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks=
 -Wall -c ../../libgcrypt-1.11.1/cipher/tiger.c  -fPIC -DPIC -o .libs/tiger=
=2Eo
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/cipher =
-I.. -I../src -I../../libgcrypt-1.11.1/src -I../mpi -I../../libgcrypt-1.11.=
1/mpi -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcry=
pt-native/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-mas=
ter/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nati=
ve/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master=
/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/=
usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks=
 -Wall -c ../../libgcrypt-1.11.1/cipher/sm3.c  -fPIC -DPIC -o .libs/sm3.o
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/cipher =
-I.. -I../src -I../../libgcrypt-1.11.1/src -I../mpi -I../../libgcrypt-1.11.=
1/mpi -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcry=
pt-native/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-mas=
ter/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nati=
ve/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master=
/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/=
usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks=
 -Wall -c ../../libgcrypt-1.11.1/cipher/sha1.c  -fPIC -DPIC -o .libs/sha1.o
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/cipher =
-I.. -I../src -I../../libgcrypt-1.11.1/src -I../mpi -I../../libgcrypt-1.11.=
1/mpi -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcry=
pt-native/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-mas=
ter/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nati=
ve/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master=
/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/=
usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks=
 -Wall -c ../../libgcrypt-1.11.1/cipher/gost28147.c  -fPIC -DPIC -o .libs/g=
ost28147.o
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/cipher =
-I.. -I../src -I../../libgcrypt-1.11.1/src -I../mpi -I../../libgcrypt-1.11.=
1/mpi -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcry=
pt-native/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-mas=
ter/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nati=
ve/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master=
/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/=
usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks=
 -Wall -c ../../libgcrypt-1.11.1/cipher/scrypt.c  -fPIC -DPIC -o .libs/scry=
pt.o
/bin/bash ../libtool  --tag=3DCC   --mode=3Dlink gcc  -I/var/home/frh/tezi-=
master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-n=
ative/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-mas=
ter/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nati=
ve/usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-che=
cks -Wall  -L/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcryp=
t-native/1.11.1/recipe-sysroot-native/usr/lib                         -L/va=
r/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/=
recipe-sysroot-native/lib                         -Wl,--enable-new-dtags   =
                      -Wl,-rpath-link,/var/home/frh/tezi-master/build/tmp/w=
ork/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib     =
                    -Wl,-rpath-link,/var/home/frh/tezi-master/build/tmp/wor=
k/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/lib           =
              -Wl,-rpath,/var/home/frh/tezi-master/build/tmp/work/x86_64-li=
nux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib                  =
       -Wl,-rpath,/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/lib=
gcrypt-native/1.11.1/recipe-sysroot-native/lib                         -Wl,=
-O1 -o libcipher.la  cipher.lo cipher-cbc.lo cipher-cfb.lo cipher-ofb.lo ci=
pher-ctr.lo cipher-aeswrap.lo cipher-ccm.lo cipher-cmac.lo cipher-gcm.lo ci=
pher-poly1305.lo cipher-ocb.lo cipher-xts.lo cipher-eax.lo cipher-siv.lo ci=
pher-gcm-siv.lo pubkey.lo pubkey-util.lo md.lo mac.lo mac-hmac.lo mac-cmac.=
lo mac-gmac.lo mac-poly1305.lo poly1305.lo kem.lo sntrup761.lo kyber.lo kem=
-ecc.lo mceliece6688128f.lo kdf.lo primegen.lo hash-common.lo dsa-common.lo=
 rsa-common.lo arcfour.lo blowfish.lo cast5.lo des.lo rijndael.lo twofish.l=
o serpent.lo rfc2268.lo seed.lo camellia.lo camellia-glue.lo idea.lo salsa2=
0.lo gost28147.lo chacha20.lo sm4.lo aria.lo  dsa.lo rsa.lo elgamal.lo     =
                      ecc.lo ecc-curves.lo ecc-misc.lo                     =
      ecc-ecdh.lo ecc-ecdsa.lo ecc-eddsa.lo ecc-gost.lo                    =
       ecc-sm2.lo                           kyber.c crc.lo gostr3411-94.lo =
stribog.lo md4.lo md5.lo rmd160.lo sha256.lo sha512.lo keccak.lo tiger.lo w=
hirlpool.lo blake2.lo sm3.lo sha1.lo  scrypt.lo -lcap
libtool: link: ar cr .libs/libcipher.a .libs/cipher.o .libs/cipher-cbc.o .l=
ibs/cipher-cfb.o .libs/cipher-ofb.o .libs/cipher-ctr.o .libs/cipher-aeswrap=
=2Eo .libs/cipher-ccm.o .libs/cipher-cmac.o .libs/cipher-gcm.o .libs/cipher=
-poly1305.o .libs/cipher-ocb.o .libs/cipher-xts.o .libs/cipher-eax.o .libs/=
cipher-siv.o .libs/cipher-gcm-siv.o .libs/pubkey.o .libs/pubkey-util.o .lib=
s/md.o .libs/mac.o .libs/mac-hmac.o .libs/mac-cmac.o .libs/mac-gmac.o .libs=
/mac-poly1305.o .libs/poly1305.o .libs/kem.o .libs/sntrup761.o .libs/kyber.=
o .libs/kem-ecc.o .libs/mceliece6688128f.o .libs/kdf.o .libs/primegen.o .li=
bs/hash-common.o .libs/dsa-common.o .libs/rsa-common.o .libs/arcfour.o .lib=
s/blowfish.o .libs/cast5.o .libs/des.o .libs/rijndael.o .libs/twofish.o .li=
bs/serpent.o .libs/rfc2268.o .libs/seed.o .libs/camellia.o .libs/camellia-g=
lue.o .libs/idea.o .libs/salsa20.o .libs/gost28147.o .libs/chacha20.o .libs=
/sm4.o .libs/aria.o .libs/dsa.o .libs/rsa.o .libs/elgamal.o .libs/ecc.o .li=
bs/ecc-curves.o .libs/ecc-misc.o .libs/ecc-ecdh.o .libs/ecc-ecdsa.o .libs/e=
cc-eddsa.o .libs/ecc-gost.o .libs/ecc-sm2.o .libs/crc.o .libs/gostr3411-94.=
o .libs/stribog.o .libs/md4.o .libs/md5.o .libs/rmd160.o .libs/sha256.o .li=
bs/sha512.o .libs/keccak.o .libs/tiger.o .libs/whirlpool.o .libs/blake2.o .=
libs/sm3.o .libs/sha1.o .libs/scrypt.o=20
libtool: link: ranlib -D .libs/libcipher.a
libtool: link: ( cd ".libs" && rm -f "libcipher.la" && ln -s "../libcipher.=
la" "libcipher.la" )
make[2]: Leaving directory '/var/home/frh/tezi-master/build/tmp/work/x86_64=
-linux/libgcrypt-native/1.11.1/build/cipher'
Making all in random
make[2]: Entering directory '/var/home/frh/tezi-master/build/tmp/work/x86_6=
4-linux/libgcrypt-native/1.11.1/build/random'
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/random -I..  -I../src -I../../libgcrypt-1.11.1=
/src -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcryp=
t-native/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-mast=
er/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nativ=
e/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master/=
build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/u=
sr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks =
-Wall -c -o random.lo ../../libgcrypt-1.11.1/random/random.c
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/random -I..  -I../src -I../../libgcrypt-1.11.1=
/src -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcryp=
t-native/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-mast=
er/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nativ=
e/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master/=
build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/u=
sr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks =
-Wall -c -o random-csprng.lo ../../libgcrypt-1.11.1/random/random-csprng.c
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/random -I..  -I../src -I../../libgcrypt-1.11.1=
/src -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcryp=
t-native/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-mast=
er/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nativ=
e/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master/=
build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/u=
sr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks =
-Wall -c -o random-drbg.lo ../../libgcrypt-1.11.1/random/random-drbg.c
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/random -I..  -I../src -I../../libgcrypt-1.11.1=
/src -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcryp=
t-native/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-mast=
er/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nativ=
e/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master/=
build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/u=
sr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks =
-Wall -c -o random-system.lo ../../libgcrypt-1.11.1/random/random-system.c
`echo /bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFI=
G_H -I. -I../../libgcrypt-1.11.1/random -I..  -I../src -I../../libgcrypt-1.=
11.1/src -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libg=
crypt-native/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-=
master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-n=
ative/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-mas=
ter/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nati=
ve/usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-che=
cks -Wall -c ../../libgcrypt-1.11.1/random/rndjent.c | sed -e 's/[[:blank:]=
]-O\([1-9sgz][1-9sgz]*\)/ -O0 /g' -e 's/[[:blank:]]-Ofast/ -O0 /g' `
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/random -I..  -I../src -I../../libgcrypt-1.11.1=
/src -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcryp=
t-native/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-mast=
er/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nativ=
e/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master/=
build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/u=
sr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks =
-Wall -c -o rndhw.lo ../../libgcrypt-1.11.1/random/rndhw.c
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/random -I..  -I../src -I../../libgcrypt-1.11.1=
/src -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcryp=
t-native/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-mast=
er/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nativ=
e/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master/=
build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/u=
sr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks =
-Wall -c -o rndgetentropy.lo ../../libgcrypt-1.11.1/random/rndgetentropy.c
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/random =
-I.. -I../src -I../../libgcrypt-1.11.1/src -isystem/var/home/frh/tezi-maste=
r/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native=
/usr/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcr=
ypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/incl=
ude -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt=
-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dh=
idden -fno-delete-null-pointer-checks -Wall -c ../../libgcrypt-1.11.1/rando=
m/random.c  -fPIC -DPIC -o .libs/random.o
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/random =
-I.. -I../src -I../../libgcrypt-1.11.1/src -isystem/var/home/frh/tezi-maste=
r/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native=
/usr/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcr=
ypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/incl=
ude -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt=
-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dh=
idden -fno-delete-null-pointer-checks -Wall -c ../../libgcrypt-1.11.1/rando=
m/random-system.c  -fPIC -DPIC -o .libs/random-system.o
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/random =
-I.. -I../src -I../../libgcrypt-1.11.1/src -isystem/var/home/frh/tezi-maste=
r/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native=
/usr/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcr=
ypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/incl=
ude -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt=
-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dh=
idden -fno-delete-null-pointer-checks -Wall -c ../../libgcrypt-1.11.1/rando=
m/random-drbg.c  -fPIC -DPIC -o .libs/random-drbg.o
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/random =
-I.. -I../src -I../../libgcrypt-1.11.1/src -isystem/var/home/frh/tezi-maste=
r/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native=
/usr/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcr=
ypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/incl=
ude -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt=
-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dh=
idden -fno-delete-null-pointer-checks -Wall -c ../../libgcrypt-1.11.1/rando=
m/rndhw.c  -fPIC -DPIC -o .libs/rndhw.o
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/random =
-I.. -I../src -I../../libgcrypt-1.11.1/src -isystem/var/home/frh/tezi-maste=
r/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native=
/usr/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcr=
ypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/incl=
ude -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt=
-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dh=
idden -fno-delete-null-pointer-checks -Wall -c ../../libgcrypt-1.11.1/rando=
m/random-csprng.c  -fPIC -DPIC -o .libs/random-csprng.o
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/random =
-I.. -I../src -I../../libgcrypt-1.11.1/src -isystem/var/home/frh/tezi-maste=
r/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native=
/usr/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcr=
ypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/incl=
ude -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt=
-native/1.11.1/recipe-sysroot-native/usr/include -O0 -pipe -fvisibility=3Dh=
idden -fno-delete-null-pointer-checks -Wall -c ../../libgcrypt-1.11.1/rando=
m/rndjent.c  -fPIC -DPIC -o .libs/rndjent.o
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/random =
-I.. -I../src -I../../libgcrypt-1.11.1/src -isystem/var/home/frh/tezi-maste=
r/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native=
/usr/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcr=
ypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/incl=
ude -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt=
-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dh=
idden -fno-delete-null-pointer-checks -Wall -c ../../libgcrypt-1.11.1/rando=
m/rndgetentropy.c  -fPIC -DPIC -o .libs/rndgetentropy.o
/bin/bash ../libtool  --tag=3DCC   --mode=3Dlink gcc  -I/var/home/frh/tezi-=
master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-n=
ative/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-mas=
ter/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nati=
ve/usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-che=
cks -Wall  -L/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcryp=
t-native/1.11.1/recipe-sysroot-native/usr/lib                         -L/va=
r/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/=
recipe-sysroot-native/lib                         -Wl,--enable-new-dtags   =
                      -Wl,-rpath-link,/var/home/frh/tezi-master/build/tmp/w=
ork/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib     =
                    -Wl,-rpath-link,/var/home/frh/tezi-master/build/tmp/wor=
k/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/lib           =
              -Wl,-rpath,/var/home/frh/tezi-master/build/tmp/work/x86_64-li=
nux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib                  =
       -Wl,-rpath,/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/lib=
gcrypt-native/1.11.1/recipe-sysroot-native/lib                         -Wl,=
-O1 -o librandom.la  random.lo random-csprng.lo random-drbg.lo random-syste=
m.lo rndjent.lo rndhw.lo rndgetentropy.lo -lcap
libtool: link: ar cr .libs/librandom.a .libs/random.o .libs/random-csprng.o=
 .libs/random-drbg.o .libs/random-system.o .libs/rndjent.o .libs/rndhw.o .l=
ibs/rndgetentropy.o=20
libtool: link: ranlib -D .libs/librandom.a
libtool: link: ( cd ".libs" && rm -f "librandom.la" && ln -s "../librandom.=
la" "librandom.la" )
make[2]: Leaving directory '/var/home/frh/tezi-master/build/tmp/work/x86_64=
-linux/libgcrypt-native/1.11.1/build/random'
Making all in src
make[2]: Entering directory '/var/home/frh/tezi-master/build/tmp/work/x86_6=
4-linux/libgcrypt-native/1.11.1/build/src'
gcc  -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/src -I..   -isystem/var/h=
ome/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/rec=
ipe-sysroot-native/usr/include  -isystem/var/home/frh/tezi-master/build/tmp=
/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/includ=
e -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks -Wall -c =
-o dumpsexp-dumpsexp.o `test -f 'dumpsexp.c' || echo '../../libgcrypt-1.11.=
1/src/'`dumpsexp.c
gcc  -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/src -I..   -isystem/var/h=
ome/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/rec=
ipe-sysroot-native/usr/include -DSTANDALONE  -isystem/var/home/frh/tezi-mas=
ter/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nati=
ve/usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-che=
cks -Wall -c -o hmac256-hmac256.o `test -f 'hmac256.c' || echo '../../libgc=
rypt-1.11.1/src/'`hmac256.c
gcc  -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/src -I..   -isystem/var/h=
ome/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/rec=
ipe-sysroot-native/usr/include -I/var/home/frh/tezi-master/build/tmp/work/x=
86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig=
/../../../usr/include -isystem/var/home/frh/tezi-master/build/tmp/work/x86_=
64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pip=
e -fvisibility=3Dhidden -fno-delete-null-pointer-checks -Wall -c -o mpicalc=
-mpicalc.o `test -f 'mpicalc.c' || echo '../../libgcrypt-1.11.1/src/'`mpica=
lc.c
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/src -I..   -isystem/var/home/frh/tezi-master/b=
uild/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/us=
r/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt=
-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/include=
  -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-n=
ative/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dhid=
den -fno-delete-null-pointer-checks -Wall -c -o libgcrypt_la-visibility.lo =
`test -f 'visibility.c' || echo '../../libgcrypt-1.11.1/src/'`visibility.c
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/src -I..   -isystem/var/home/frh/tezi-master/b=
uild/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/us=
r/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt=
-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/include=
  -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-n=
ative/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dhid=
den -fno-delete-null-pointer-checks -Wall -c -o libgcrypt_la-misc.lo `test =
-f 'misc.c' || echo '../../libgcrypt-1.11.1/src/'`misc.c
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/src -I..   -isystem/var/home/frh/tezi-master/b=
uild/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/us=
r/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt=
-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/include=
  -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-n=
ative/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dhid=
den -fno-delete-null-pointer-checks -Wall -c -o libgcrypt_la-global.lo `tes=
t -f 'global.c' || echo '../../libgcrypt-1.11.1/src/'`global.c
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/src -I..   -isystem/var/home/frh/tezi-master/b=
uild/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/us=
r/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt=
-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/include=
  -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-n=
ative/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dhid=
den -fno-delete-null-pointer-checks -Wall -c -o libgcrypt_la-sexp.lo `test =
-f 'sexp.c' || echo '../../libgcrypt-1.11.1/src/'`sexp.c
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/src -I..   -isystem/var/home/frh/tezi-master/b=
uild/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/us=
r/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt=
-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/include=
  -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-n=
ative/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dhid=
den -fno-delete-null-pointer-checks -Wall -c -o libgcrypt_la-hwfeatures.lo =
`test -f 'hwfeatures.c' || echo '../../libgcrypt-1.11.1/src/'`hwfeatures.c
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/src -I..   -isystem/var/home/frh/tezi-master/b=
uild/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/us=
r/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt=
-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/include=
  -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-n=
ative/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dhid=
den -fno-delete-null-pointer-checks -Wall -c -o libgcrypt_la-stdmem.lo `tes=
t -f 'stdmem.c' || echo '../../libgcrypt-1.11.1/src/'`stdmem.c
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/src -I..   -isystem/var/home/frh/tezi-master/b=
uild/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/us=
r/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt=
-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/include=
  -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-n=
ative/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dhid=
den -fno-delete-null-pointer-checks -Wall -c -o libgcrypt_la-secmem.lo `tes=
t -f 'secmem.c' || echo '../../libgcrypt-1.11.1/src/'`secmem.c
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/src -I..   -isystem/var/home/frh/tezi-master/b=
uild/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/us=
r/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt=
-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/include=
  -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-n=
ative/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dhid=
den -fno-delete-null-pointer-checks -Wall -c -o libgcrypt_la-missing-string=
=2Elo `test -f 'missing-string.c' || echo '../../libgcrypt-1.11.1/src/'`mis=
sing-string.c
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/src -I..   -isystem/var/home/frh/tezi-master/b=
uild/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/us=
r/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt=
-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/include=
  -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-n=
ative/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dhid=
den -fno-delete-null-pointer-checks -Wall -c -o libgcrypt_la-fips.lo `test =
-f 'fips.c' || echo '../../libgcrypt-1.11.1/src/'`fips.c
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/src -I..   -isystem/var/home/frh/tezi-master/b=
uild/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/us=
r/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt=
-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/include=
  -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-n=
ative/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dhid=
den -fno-delete-null-pointer-checks -Wall -c -o libgcrypt_la-context.lo `te=
st -f 'context.c' || echo '../../libgcrypt-1.11.1/src/'`context.c
/bin/bash ../libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG_H -I=
=2E -I../../libgcrypt-1.11.1/src -I..   -isystem/var/home/frh/tezi-master/b=
uild/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/us=
r/include -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt=
-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/include=
  -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-n=
ative/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dhid=
den -fno-delete-null-pointer-checks -Wall -c -o libgcrypt_la-const-time.lo =
`test -f 'const-time.c' || echo '../../libgcrypt-1.11.1/src/'`const-time.c
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/src -I.=
=2E -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt=
-native/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-maste=
r/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native=
/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master/b=
uild/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/us=
r/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks -=
Wall -c ../../libgcrypt-1.11.1/src/sexp.c  -fPIC -DPIC -o .libs/libgcrypt_l=
a-sexp.o
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/src -I.=
=2E -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt=
-native/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-maste=
r/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native=
/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master/b=
uild/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/us=
r/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks -=
Wall -c ../../libgcrypt-1.11.1/src/secmem.c  -fPIC -DPIC -o .libs/libgcrypt=
_la-secmem.o
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/src -I.=
=2E -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt=
-native/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-maste=
r/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native=
/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master/b=
uild/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/us=
r/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks -=
Wall -c ../../libgcrypt-1.11.1/src/global.c  -fPIC -DPIC -o .libs/libgcrypt=
_la-global.o
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/src -I.=
=2E -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt=
-native/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-maste=
r/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native=
/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master/b=
uild/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/us=
r/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks -=
Wall -c ../../libgcrypt-1.11.1/src/visibility.c  -fPIC -DPIC -o .libs/libgc=
rypt_la-visibility.o
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/src -I.=
=2E -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt=
-native/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-maste=
r/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native=
/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master/b=
uild/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/us=
r/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks -=
Wall -c ../../libgcrypt-1.11.1/src/missing-string.c  -fPIC -DPIC -o .libs/l=
ibgcrypt_la-missing-string.o
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/src -I.=
=2E -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt=
-native/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-maste=
r/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native=
/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master/b=
uild/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/us=
r/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks -=
Wall -c ../../libgcrypt-1.11.1/src/misc.c  -fPIC -DPIC -o .libs/libgcrypt_l=
a-misc.o
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/src -I.=
=2E -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt=
-native/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-maste=
r/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native=
/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master/b=
uild/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/us=
r/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks -=
Wall -c ../../libgcrypt-1.11.1/src/stdmem.c  -fPIC -DPIC -o .libs/libgcrypt=
_la-stdmem.o
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/src -I.=
=2E -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt=
-native/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-maste=
r/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native=
/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master/b=
uild/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/us=
r/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks -=
Wall -c ../../libgcrypt-1.11.1/src/hwfeatures.c  -fPIC -DPIC -o .libs/libgc=
rypt_la-hwfeatures.o
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/src -I.=
=2E -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt=
-native/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-maste=
r/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native=
/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master/b=
uild/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/us=
r/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks -=
Wall -c ../../libgcrypt-1.11.1/src/fips.c  -fPIC -DPIC -o .libs/libgcrypt_l=
a-fips.o
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/src -I.=
=2E -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt=
-native/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-maste=
r/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native=
/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master/b=
uild/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/us=
r/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks -=
Wall -c ../../libgcrypt-1.11.1/src/context.c  -fPIC -DPIC -o .libs/libgcryp=
t_la-context.o
libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/src -I.=
=2E -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt=
-native/1.11.1/recipe-sysroot-native/usr/include -I/var/home/frh/tezi-maste=
r/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native=
/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-master/b=
uild/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/us=
r/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks -=
Wall -c ../../libgcrypt-1.11.1/src/const-time.c  -fPIC -DPIC -o .libs/libgc=
rypt_la-const-time.o
/bin/bash ../libtool  --tag=3DCC   --mode=3Dlink gcc   -isystem/var/home/fr=
h/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sy=
sroot-native/usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-p=
ointer-checks -Wall  -L/var/home/frh/tezi-master/build/tmp/work/x86_64-linu=
x/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib                    =
     -L/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-nati=
ve/1.11.1/recipe-sysroot-native/lib                         -Wl,--enable-ne=
w-dtags                         -Wl,-rpath-link,/var/home/frh/tezi-master/b=
uild/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/us=
r/lib                         -Wl,-rpath-link,/var/home/frh/tezi-master/bui=
ld/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/lib =
                        -Wl,-rpath,/var/home/frh/tezi-master/build/tmp/work=
/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib        =
                 -Wl,-rpath,/var/home/frh/tezi-master/build/tmp/work/x86_64=
-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/lib                   =
      -Wl,-O1 -o dumpsexp dumpsexp-dumpsexp.o  -lcap
/bin/bash ../libtool  --tag=3DCC   --mode=3Dlink gcc  -DSTANDALONE  -isyste=
m/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.1=
1.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dhidden -fno-=
delete-null-pointer-checks -Wall  -L/var/home/frh/tezi-master/build/tmp/wor=
k/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib       =
                  -L/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/l=
ibgcrypt-native/1.11.1/recipe-sysroot-native/lib                         -W=
l,--enable-new-dtags                         -Wl,-rpath-link,/var/home/frh/=
tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysr=
oot-native/usr/lib                         -Wl,-rpath-link,/var/home/frh/te=
zi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroo=
t-native/lib                         -Wl,-rpath,/var/home/frh/tezi-master/b=
uild/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/us=
r/lib                         -Wl,-rpath,/var/home/frh/tezi-master/build/tm=
p/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/lib      =
                   -Wl,-O1 -o hmac256 hmac256-hmac256.o  -lcap
libtool: link: gcc -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-=
linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -=
fvisibility=3Dhidden -fno-delete-null-pointer-checks -Wall -Wl,--enable-new=
-dtags -Wl,-rpath-link -Wl,/var/home/frh/tezi-master/build/tmp/work/x86_64-=
linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib -Wl,-rpath-link=
 -Wl,/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native=
/1.11.1/recipe-sysroot-native/lib -Wl,-rpath -Wl,/var/home/frh/tezi-master/=
build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/u=
sr/lib -Wl,-rpath -Wl,/var/home/frh/tezi-master/build/tmp/work/x86_64-linux=
/libgcrypt-native/1.11.1/recipe-sysroot-native/lib -Wl,-O1 -o dumpsexp dump=
sexp-dumpsexp.o  -L/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/li=
bgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib -L/var/home/frh/tezi-ma=
ster/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nat=
ive/lib -lcap
libtool: link: gcc -DSTANDALONE -isystem/var/home/frh/tezi-master/build/tmp=
/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/includ=
e -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-checks -Wall -Wl=
,--enable-new-dtags -Wl,-rpath-link -Wl,/var/home/frh/tezi-master/build/tmp=
/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib -W=
l,-rpath-link -Wl,/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/lib=
gcrypt-native/1.11.1/recipe-sysroot-native/lib -Wl,-rpath -Wl,/var/home/frh=
/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sys=
root-native/usr/lib -Wl,-rpath -Wl,/var/home/frh/tezi-master/build/tmp/work=
/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/lib -Wl,-O1 -o =
hmac256 hmac256-hmac256.o  -L/var/home/frh/tezi-master/build/tmp/work/x86_6=
4-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib -L/var/home/f=
rh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-s=
ysroot-native/lib -lcap
/bin/bash ../libtool  --tag=3DCC   --mode=3Dlink gcc  -I/var/home/frh/tezi-=
master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-n=
ative/usr/lib/pkgconfig/../../../usr/include  -isystem/var/home/frh/tezi-ma=
ster/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nat=
ive/usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-ch=
ecks -Wall    -Wl,--version-script=3D../../libgcrypt-1.11.1/src/libgcrypt.v=
ers -version-info 25:1:5 -L/var/home/frh/tezi-master/build/tmp/work/x86_64-=
linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib                =
         -L/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-=
native/1.11.1/recipe-sysroot-native/lib                         -Wl,--enabl=
e-new-dtags                         -Wl,-rpath-link,/var/home/frh/tezi-mast=
er/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nativ=
e/usr/lib                         -Wl,-rpath-link,/var/home/frh/tezi-master=
/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/=
lib                         -Wl,-rpath,/var/home/frh/tezi-master/build/tmp/=
work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib    =
                     -Wl,-rpath,/var/home/frh/tezi-master/build/tmp/work/x8=
6_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/lib               =
          -Wl,-O1 -o libgcrypt.la -rpath /var/home/frh/tezi-master/build/tm=
p/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib l=
ibgcrypt_la-visibility.lo libgcrypt_la-misc.lo libgcrypt_la-global.lo libgc=
rypt_la-sexp.lo libgcrypt_la-hwfeatures.lo libgcrypt_la-stdmem.lo libgcrypt=
_la-secmem.lo libgcrypt_la-missing-string.lo libgcrypt_la-fips.lo libgcrypt=
_la-context.lo libgcrypt_la-const-time.lo   ../cipher/libcipher.la ../rando=
m/librandom.la ../mpi/libmpi.la ../compat/libcompat.la  -L/var/home/frh/tez=
i-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot=
-native/usr/lib/pkgconfig/../../../usr/lib -lgpg-error -lcap
libtool: link: gcc  -shared  -fPIC -DPIC  .libs/libgcrypt_la-visibility.o .=
libs/libgcrypt_la-misc.o .libs/libgcrypt_la-global.o .libs/libgcrypt_la-sex=
p.o .libs/libgcrypt_la-hwfeatures.o .libs/libgcrypt_la-stdmem.o .libs/libgc=
rypt_la-secmem.o .libs/libgcrypt_la-missing-string.o .libs/libgcrypt_la-fip=
s.o .libs/libgcrypt_la-context.o .libs/libgcrypt_la-const-time.o  -Wl,--who=
le-archive ../cipher/.libs/libcipher.a ../random/.libs/librandom.a ../mpi/.=
libs/libmpi.a ../compat/.libs/libcompat.a -Wl,--no-whole-archive  -L/var/ho=
me/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/reci=
pe-sysroot-native/usr/lib -L/var/home/frh/tezi-master/build/tmp/work/x86_64=
-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/lib -L/var/home/frh/te=
zi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroo=
t-native/usr/lib/pkgconfig/../../../usr/lib -lgpg-error -lcap  -O2 -Wl,--ve=
rsion-script=3D../../libgcrypt-1.11.1/src/libgcrypt.vers -Wl,--enable-new-d=
tags -Wl,-rpath-link -Wl,/var/home/frh/tezi-master/build/tmp/work/x86_64-li=
nux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib -Wl,-rpath-link -=
Wl,/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1=
=2E11.1/recipe-sysroot-native/lib -Wl,-rpath -Wl,/var/home/frh/tezi-master/=
build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/u=
sr/lib -Wl,-rpath -Wl,/var/home/frh/tezi-master/build/tmp/work/x86_64-linux=
/libgcrypt-native/1.11.1/recipe-sysroot-native/lib -Wl,-O1   -Wl,-soname -W=
l,libgcrypt.so.20 -o .libs/libgcrypt.so.20.5.1
libtool: link: (cd ".libs" && rm -f "libgcrypt.so.20" && ln -s "libgcrypt.s=
o.20.5.1" "libgcrypt.so.20")
libtool: link: (cd ".libs" && rm -f "libgcrypt.so" && ln -s "libgcrypt.so.2=
0.5.1" "libgcrypt.so")
libtool: link: ( cd ".libs" && rm -f "libgcrypt.la" && ln -s "../libgcrypt.=
la" "libgcrypt.la" )
/bin/bash ../libtool  --tag=3DCC   --mode=3Dlink gcc  -I/var/home/frh/tezi-=
master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-n=
ative/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-mas=
ter/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nati=
ve/usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-che=
cks -Wall  -L/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcryp=
t-native/1.11.1/recipe-sysroot-native/usr/lib                         -L/va=
r/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/=
recipe-sysroot-native/lib                         -Wl,--enable-new-dtags   =
                      -Wl,-rpath-link,/var/home/frh/tezi-master/build/tmp/w=
ork/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib     =
                    -Wl,-rpath-link,/var/home/frh/tezi-master/build/tmp/wor=
k/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/lib           =
              -Wl,-rpath,/var/home/frh/tezi-master/build/tmp/work/x86_64-li=
nux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib                  =
       -Wl,-rpath,/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/lib=
gcrypt-native/1.11.1/recipe-sysroot-native/lib                         -Wl,=
-O1 -o mpicalc mpicalc-mpicalc.o libgcrypt.la -L/var/home/frh/tezi-master/b=
uild/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/us=
r/lib/pkgconfig/../../../usr/lib -lgpg-error -lcap
libtool: link: gcc -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/=
libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../us=
r/include -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/lib=
gcrypt-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibili=
ty=3Dhidden -fno-delete-null-pointer-checks -Wall -Wl,--enable-new-dtags -W=
l,-rpath-link -Wl,/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/lib=
gcrypt-native/1.11.1/recipe-sysroot-native/usr/lib -Wl,-rpath-link -Wl,/var=
/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/r=
ecipe-sysroot-native/lib -Wl,-rpath -Wl,/var/home/frh/tezi-master/build/tmp=
/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib -W=
l,-rpath -Wl,/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcryp=
t-native/1.11.1/recipe-sysroot-native/lib -Wl,-O1 -o .libs/mpicalc mpicalc-=
mpicalc.o  -L/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcryp=
t-native/1.11.1/recipe-sysroot-native/usr/lib -L/var/home/frh/tezi-master/b=
uild/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/li=
b ./.libs/libgcrypt.so -L/var/home/frh/tezi-master/build/tmp/work/x86_64-li=
nux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../.=
=2E/usr/lib -lgpg-error -lcap
make[2]: Leaving directory '/var/home/frh/tezi-master/build/tmp/work/x86_64=
-linux/libgcrypt-native/1.11.1/build/src'
Making all in doc
make[2]: Entering directory '/var/home/frh/tezi-master/build/tmp/work/x86_6=
4-linux/libgcrypt-native/1.11.1/build/doc'
make  all-am
make[3]: Entering directory '/var/home/frh/tezi-master/build/tmp/work/x86_6=
4-linux/libgcrypt-native/1.11.1/build/doc'
gcc  -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcryp=
t-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -L/var/home/frh=
/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sys=
root-native/usr/lib                         -L/var/home/frh/tezi-master/bui=
ld/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/lib =
                        -Wl,--enable-new-dtags                         -Wl,=
-rpath-link,/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt=
-native/1.11.1/recipe-sysroot-native/usr/lib                         -Wl,-r=
path-link,/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-n=
ative/1.11.1/recipe-sysroot-native/lib                         -Wl,-rpath,/=
var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.=
1/recipe-sysroot-native/usr/lib                         -Wl,-rpath,/var/hom=
e/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recip=
e-sysroot-native/lib                         -Wl,-O1 \
    -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt=
-native/1.11.1/recipe-sysroot-native/usr/include -o yat2m ../../libgcrypt-1=
=2E11.1/doc/yat2m.c
for file in gcrypt.texi ; do \
              ./yat2m -I ../../libgcrypt-1.11.1/doc --release "Libgcrypt 1.=
11.1-unknown" --source "Libgcrypt" --store \
          `test -f '$file' || echo '../../libgcrypt-1.11.1/doc/'`$file ; do=
ne
make[3]: Leaving directory '/var/home/frh/tezi-master/build/tmp/work/x86_64=
-linux/libgcrypt-native/1.11.1/build/doc'
make[2]: Leaving directory '/var/home/frh/tezi-master/build/tmp/work/x86_64=
-linux/libgcrypt-native/1.11.1/build/doc'
Making all in tests
make[2]: Entering directory '/var/home/frh/tezi-master/build/tmp/work/x86_6=
4-linux/libgcrypt-native/1.11.1/build/tests'
gcc  -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/tests -I..  -I../src -I..=
/../libgcrypt-1.11.1/src -isystem/var/home/frh/tezi-master/build/tmp/work/x=
86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/include -I/va=
r/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/=
recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/include -isystem/var/h=
ome/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/rec=
ipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-=
null-pointer-checks -Wall -c -o testdrv.o ../../libgcrypt-1.11.1/tests/test=
drv.c
gcc  -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/tests -I..  -I../src -I..=
/../libgcrypt-1.11.1/src -isystem/var/home/frh/tezi-master/build/tmp/work/x=
86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/include -I/va=
r/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/=
recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/include -isystem/var/h=
ome/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/rec=
ipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-=
null-pointer-checks -Wall -c -o version.o ../../libgcrypt-1.11.1/tests/vers=
ion.c
gcc  -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/tests -I..  -I../src -I..=
/../libgcrypt-1.11.1/src -isystem/var/home/frh/tezi-master/build/tmp/work/x=
86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/include -I/va=
r/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/=
recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/include -isystem/var/h=
ome/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/rec=
ipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-=
null-pointer-checks -Wall -c -o t-secmem.o ../../libgcrypt-1.11.1/tests/t-s=
ecmem.c
gcc  -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/tests -I..  -I../src -I..=
/../libgcrypt-1.11.1/src -isystem/var/home/frh/tezi-master/build/tmp/work/x=
86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/include -I/va=
r/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/=
recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/include -isystem/var/h=
ome/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/rec=
ipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-=
null-pointer-checks -Wall -c -o mpitests.o ../../libgcrypt-1.11.1/tests/mpi=
tests.c
gcc  -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/tests -I..  -I../src -I..=
/../libgcrypt-1.11.1/src -isystem/var/home/frh/tezi-master/build/tmp/work/x=
86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/include -I/va=
r/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/=
recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/include -isystem/var/h=
ome/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/rec=
ipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-=
null-pointer-checks -Wall -c -o t-sexp.o ../../libgcrypt-1.11.1/tests/t-sex=
p.c
gcc  -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/tests -I..  -I../src -I..=
/../libgcrypt-1.11.1/src -isystem/var/home/frh/tezi-master/build/tmp/work/x=
86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/include -I/va=
r/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/=
recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/include -isystem/var/h=
ome/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/rec=
ipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-=
null-pointer-checks -Wall -c -o t-convert.o ../../libgcrypt-1.11.1/tests/t-=
convert.c
gcc  -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/tests -I..  -I../src -I..=
/../libgcrypt-1.11.1/src -isystem/var/home/frh/tezi-master/build/tmp/work/x=
86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/include -I/va=
r/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/=
recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/include -isystem/var/h=
ome/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/rec=
ipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-=
null-pointer-checks -Wall -c -o t-mpi-bit.o ../../libgcrypt-1.11.1/tests/t-=
mpi-bit.c
gcc  -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/tests -I..  -I../src -I..=
/../libgcrypt-1.11.1/src -isystem/var/home/frh/tezi-master/build/tmp/work/x=
86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/include -I/va=
r/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/=
recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/include -isystem/var/h=
ome/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/rec=
ipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-=
null-pointer-checks -Wall -c -o t-mpi-point.o ../../libgcrypt-1.11.1/tests/=
t-mpi-point.c
gcc  -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/tests -I..  -I../src -I..=
/../libgcrypt-1.11.1/src -isystem/var/home/frh/tezi-master/build/tmp/work/x=
86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/include  -lpt=
hread -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcry=
pt-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=
=3Dhidden -fno-delete-null-pointer-checks -Wall -c -o t_lock-t-lock.o `test=
 -f 't-lock.c' || echo '../../libgcrypt-1.11.1/tests/'`t-lock.c
gcc  -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/tests -I..  -I../src -I..=
/../libgcrypt-1.11.1/src -isystem/var/home/frh/tezi-master/build/tmp/work/x=
86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/include -I/va=
r/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/=
recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/include -isystem/var/h=
ome/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/rec=
ipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-=
null-pointer-checks -Wall -c -o prime.o ../../libgcrypt-1.11.1/tests/prime.c
gcc  -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/tests -I..  -I../src -I..=
/../libgcrypt-1.11.1/src -isystem/var/home/frh/tezi-master/build/tmp/work/x=
86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/include -I/va=
r/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/=
recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/include -isystem/var/h=
ome/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/rec=
ipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-=
null-pointer-checks -Wall -c -o basic.o ../../libgcrypt-1.11.1/tests/basic.c
gcc  -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/tests -I..  -I../src -I..=
/../libgcrypt-1.11.1/src -isystem/var/home/frh/tezi-master/build/tmp/work/x=
86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/include -I/va=
r/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/=
recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/include -isystem/var/h=
ome/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/rec=
ipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-=
null-pointer-checks -Wall -c -o keygen.o ../../libgcrypt-1.11.1/tests/keyge=
n.c
gcc  -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/tests -I..  -I../src -I..=
/../libgcrypt-1.11.1/src -isystem/var/home/frh/tezi-master/build/tmp/work/x=
86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/include -I/va=
r/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/=
recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/include -isystem/var/h=
ome/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/rec=
ipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-=
null-pointer-checks -Wall -c -o pubkey.o ../../libgcrypt-1.11.1/tests/pubke=
y.c
gcc  -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/tests -I..  -I../src -I..=
/../libgcrypt-1.11.1/src -isystem/var/home/frh/tezi-master/build/tmp/work/x=
86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/include -I/va=
r/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/=
recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/include -isystem/var/h=
ome/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/rec=
ipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-=
null-pointer-checks -Wall -c -o hmac.o ../../libgcrypt-1.11.1/tests/hmac.c
gcc  -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/tests -I..  -I../src -I..=
/../libgcrypt-1.11.1/src -isystem/var/home/frh/tezi-master/build/tmp/work/x=
86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/include -I/va=
r/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/=
recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/include -isystem/var/h=
ome/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/rec=
ipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-=
null-pointer-checks -Wall -c -o hashtest.o ../../libgcrypt-1.11.1/tests/has=
htest.c
gcc  -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/tests -I..  -I../src -I..=
/../libgcrypt-1.11.1/src -isystem/var/home/frh/tezi-master/build/tmp/work/x=
86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/include  -lpt=
hread -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcry=
pt-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=
=3Dhidden -fno-delete-null-pointer-checks -Wall -c -o t_kdf-t-kdf.o `test -=
f 't-kdf.c' || echo '../../libgcrypt-1.11.1/tests/'`t-kdf.c
gcc  -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/tests -I..  -I../src -I..=
/../libgcrypt-1.11.1/src -isystem/var/home/frh/tezi-master/build/tmp/work/x=
86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/include -I/va=
r/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/=
recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/include -isystem/var/h=
ome/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/rec=
ipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-=
null-pointer-checks -Wall -c -o keygrip.o ../../libgcrypt-1.11.1/tests/keyg=
rip.c
gcc  -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/tests -I..  -I../src -I..=
/../libgcrypt-1.11.1/src -isystem/var/home/frh/tezi-master/build/tmp/work/x=
86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/include -I/va=
r/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/=
recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/include -isystem/var/h=
ome/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/rec=
ipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-=
null-pointer-checks -Wall -c -o aeswrap.o ../../libgcrypt-1.11.1/tests/aesw=
rap.c
gcc  -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/tests -I..  -I../src -I..=
/../libgcrypt-1.11.1/src -isystem/var/home/frh/tezi-master/build/tmp/work/x=
86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/include -I/va=
r/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/=
recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/include -isystem/var/h=
ome/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/rec=
ipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-=
null-pointer-checks -Wall -c -o random.o ../../libgcrypt-1.11.1/tests/rando=
m.c
gcc  -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/tests -I..  -I../src -I..=
/../libgcrypt-1.11.1/src -isystem/var/home/frh/tezi-master/build/tmp/work/x=
86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/include -I/va=
r/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/=
recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/include -isystem/var/h=
ome/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/rec=
ipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-=
null-pointer-checks -Wall -c -o t-kem.o ../../libgcrypt-1.11.1/tests/t-kem.c
gcc  -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/tests -I..  -I../src -I..=
/../libgcrypt-1.11.1/src -isystem/var/home/frh/tezi-master/build/tmp/work/x=
86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/include -I/va=
r/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/=
recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/include -isystem/var/h=
ome/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/rec=
ipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-=
null-pointer-checks -Wall -c -o t-mlkem.o ../../libgcrypt-1.11.1/tests/t-ml=
kem.c
gcc  -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/tests -I..  -I../src -I..=
/../libgcrypt-1.11.1/src -isystem/var/home/frh/tezi-master/build/tmp/work/x=
86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/include -I/va=
r/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/=
recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/include -isystem/var/h=
ome/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/rec=
ipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-=
null-pointer-checks -Wall -c -o t-thread-local.o ../../libgcrypt-1.11.1/tes=
ts/t-thread-local.c
gcc  -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/tests -I..  -I../src -I..=
/../libgcrypt-1.11.1/src -isystem/var/home/frh/tezi-master/build/tmp/work/x=
86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/include -I/va=
r/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/=
recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/include -isystem/var/h=
ome/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/rec=
ipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-=
null-pointer-checks -Wall -c -o t-fips-service-ind.o ../../libgcrypt-1.11.1=
/tests/t-fips-service-ind.c
gcc  -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/tests -I..  -I../src -I..=
/../libgcrypt-1.11.1/src -isystem/var/home/frh/tezi-master/build/tmp/work/x=
86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/include -I/va=
r/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/=
recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/include -isystem/var/h=
ome/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/rec=
ipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-=
null-pointer-checks -Wall -c -o pkcs1v2.o ../../libgcrypt-1.11.1/tests/pkcs=
1v2.c
gcc  -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/tests -I..  -I../src -I..=
/../libgcrypt-1.11.1/src -isystem/var/home/frh/tezi-master/build/tmp/work/x=
86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/include -I/va=
r/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/=
recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/include -isystem/var/h=
ome/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/rec=
ipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-=
null-pointer-checks -Wall -c -o t-rsa-pss.o ../../libgcrypt-1.11.1/tests/t-=
rsa-pss.c
gcc  -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/tests -I..  -I../src -I..=
/../libgcrypt-1.11.1/src -isystem/var/home/frh/tezi-master/build/tmp/work/x=
86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/include -I/va=
r/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/=
recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/include -isystem/var/h=
ome/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/rec=
ipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-=
null-pointer-checks -Wall -c -o t-rsa-15.o ../../libgcrypt-1.11.1/tests/t-r=
sa-15.c
gcc  -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/tests -I..  -I../src -I..=
/../libgcrypt-1.11.1/src -isystem/var/home/frh/tezi-master/build/tmp/work/x=
86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/include -I/va=
r/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/=
recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/include -isystem/var/h=
ome/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/rec=
ipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-=
null-pointer-checks -Wall -c -o t-rsa-testparm.o ../../libgcrypt-1.11.1/tes=
ts/t-rsa-testparm.c
gcc  -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/tests -I..  -I../src -I..=
/../libgcrypt-1.11.1/src -isystem/var/home/frh/tezi-master/build/tmp/work/x=
86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/include -I/va=
r/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/=
recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/include -isystem/var/h=
ome/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/rec=
ipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-=
null-pointer-checks -Wall -c -o fips186-dsa.o ../../libgcrypt-1.11.1/tests/=
fips186-dsa.c
gcc  -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/tests -I..  -I../src -I..=
/../libgcrypt-1.11.1/src -isystem/var/home/frh/tezi-master/build/tmp/work/x=
86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/include -I/va=
r/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/=
recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/include -isystem/var/h=
ome/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/rec=
ipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-=
null-pointer-checks -Wall -c -o dsa-rfc6979.o ../../libgcrypt-1.11.1/tests/=
dsa-rfc6979.c
gcc  -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/tests -I..  -I../src -I..=
/../libgcrypt-1.11.1/src -isystem/var/home/frh/tezi-master/build/tmp/work/x=
86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/include -I/va=
r/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/=
recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/include -isystem/var/h=
ome/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/rec=
ipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-=
null-pointer-checks -Wall -c -o t-dsa.o ../../libgcrypt-1.11.1/tests/t-dsa.c
gcc  -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/tests -I..  -I../src -I..=
/../libgcrypt-1.11.1/src -isystem/var/home/frh/tezi-master/build/tmp/work/x=
86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/include -I/va=
r/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/=
recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/include -isystem/var/h=
ome/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/rec=
ipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-=
null-pointer-checks -Wall -c -o curves.o ../../libgcrypt-1.11.1/tests/curve=
s.c
gcc  -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/tests -I..  -I../src -I..=
/../libgcrypt-1.11.1/src -isystem/var/home/frh/tezi-master/build/tmp/work/x=
86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/include -I/va=
r/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/=
recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/include -isystem/var/h=
ome/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/rec=
ipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-=
null-pointer-checks -Wall -c -o t-ecdsa.o ../../libgcrypt-1.11.1/tests/t-ec=
dsa.c
gcc  -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/tests -I..  -I../src -I..=
/../libgcrypt-1.11.1/src -isystem/var/home/frh/tezi-master/build/tmp/work/x=
86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/include -I/va=
r/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/=
recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/include -isystem/var/h=
ome/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/rec=
ipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-=
null-pointer-checks -Wall -c -o t-ed25519.o ../../libgcrypt-1.11.1/tests/t-=
ed25519.c
gcc  -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/tests -I..  -I../src -I..=
/../libgcrypt-1.11.1/src -isystem/var/home/frh/tezi-master/build/tmp/work/x=
86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/include -I/va=
r/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/=
recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/include -isystem/var/h=
ome/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/rec=
ipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-=
null-pointer-checks -Wall -c -o t-cv25519.o ../../libgcrypt-1.11.1/tests/t-=
cv25519.c
gcc  -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/tests -I..  -I../src -I..=
/../libgcrypt-1.11.1/src -isystem/var/home/frh/tezi-master/build/tmp/work/x=
86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/include -I/va=
r/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/=
recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/include -isystem/var/h=
ome/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/rec=
ipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-=
null-pointer-checks -Wall -c -o t-x448.o ../../libgcrypt-1.11.1/tests/t-x44=
8.c
gcc  -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/tests -I..  -I../src -I..=
/../libgcrypt-1.11.1/src -isystem/var/home/frh/tezi-master/build/tmp/work/x=
86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/include -I/va=
r/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/=
recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/include -isystem/var/h=
ome/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/rec=
ipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-=
null-pointer-checks -Wall -c -o t-ed448.o ../../libgcrypt-1.11.1/tests/t-ed=
448.c
gcc  -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/tests -I..  -I../src -I..=
/../libgcrypt-1.11.1/src -isystem/var/home/frh/tezi-master/build/tmp/work/x=
86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/include -I/va=
r/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/=
recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/include -isystem/var/h=
ome/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/rec=
ipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-=
null-pointer-checks -Wall -c -o benchmark.o ../../libgcrypt-1.11.1/tests/be=
nchmark.c
gcc  -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/tests -I..  -I../src -I..=
/../libgcrypt-1.11.1/src -isystem/var/home/frh/tezi-master/build/tmp/work/x=
86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/include -I/va=
r/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/=
recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/include -isystem/var/h=
ome/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/rec=
ipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-=
null-pointer-checks -Wall -c -o bench-slope.o ../../libgcrypt-1.11.1/tests/=
bench-slope.c
gcc  -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/tests -I..  -I../src -I..=
/../libgcrypt-1.11.1/src -isystem/var/home/frh/tezi-master/build/tmp/work/x=
86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/include -I/va=
r/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/=
recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/include -isystem/var/h=
ome/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/rec=
ipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-=
null-pointer-checks -Wall -c -o fipsdrv.o ../../libgcrypt-1.11.1/tests/fips=
drv.c
gcc  -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/tests -I..  -I../src -I..=
/../libgcrypt-1.11.1/src -isystem/var/home/frh/tezi-master/build/tmp/work/x=
86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/include -I/va=
r/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/=
recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/include -isystem/var/h=
ome/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/rec=
ipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-=
null-pointer-checks -Wall -c -o rsacvt.o ../../libgcrypt-1.11.1/tests/rsacv=
t.c
gcc  -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/tests -I..  -I../src -I..=
/../libgcrypt-1.11.1/src -isystem/var/home/frh/tezi-master/build/tmp/work/x=
86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/include -I/va=
r/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/=
recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/include -isystem/var/h=
ome/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/rec=
ipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-=
null-pointer-checks -Wall -c -o genhashdata.o ../../libgcrypt-1.11.1/tests/=
genhashdata.c
gcc  -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.11.1/tests -I..  -I../src -I..=
/../libgcrypt-1.11.1/src -isystem/var/home/frh/tezi-master/build/tmp/work/x=
86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/include -I/va=
r/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/=
recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/include -isystem/var/h=
ome/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/rec=
ipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-=
null-pointer-checks -Wall -c -o gchash.o ../../libgcrypt-1.11.1/tests/gchas=
h.c
/bin/bash ../libtool  --tag=3DCC   --mode=3Dlink gcc  -I/var/home/frh/tezi-=
master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-n=
ative/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-mas=
ter/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nati=
ve/usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-che=
cks -Wall -no-install -L/var/home/frh/tezi-master/build/tmp/work/x86_64-lin=
ux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib                   =
      -L/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-nat=
ive/1.11.1/recipe-sysroot-native/lib                         -Wl,--enable-n=
ew-dtags                         -Wl,-rpath-link,/var/home/frh/tezi-master/=
build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/u=
sr/lib                         -Wl,-rpath-link,/var/home/frh/tezi-master/bu=
ild/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/lib=
                         -Wl,-rpath,/var/home/frh/tezi-master/build/tmp/wor=
k/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib       =
                  -Wl,-rpath,/var/home/frh/tezi-master/build/tmp/work/x86_6=
4-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/lib                  =
       -Wl,-O1 -o version version.o ../src/libgcrypt.la ../compat/libcompat=
=2Ela -L/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-nat=
ive/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib -lgpg-e=
rror  -lcap
/bin/bash ../libtool  --tag=3DCC   --mode=3Dlink gcc  -I/var/home/frh/tezi-=
master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-n=
ative/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-mas=
ter/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nati=
ve/usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-che=
cks -Wall -no-install -L/var/home/frh/tezi-master/build/tmp/work/x86_64-lin=
ux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib                   =
      -L/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-nat=
ive/1.11.1/recipe-sysroot-native/lib                         -Wl,--enable-n=
ew-dtags                         -Wl,-rpath-link,/var/home/frh/tezi-master/=
build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/u=
sr/lib                         -Wl,-rpath-link,/var/home/frh/tezi-master/bu=
ild/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/lib=
                         -Wl,-rpath,/var/home/frh/tezi-master/build/tmp/wor=
k/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib       =
                  -Wl,-rpath,/var/home/frh/tezi-master/build/tmp/work/x86_6=
4-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/lib                  =
       -Wl,-O1 -o gchash gchash.o ../src/libgcrypt.la ../compat/libcompat.l=
a -L/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/=
1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib -lgpg-error=
  -lcap
/bin/bash ../libtool  --tag=3DCC   --mode=3Dlink gcc  -I/var/home/frh/tezi-=
master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-n=
ative/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-mas=
ter/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nati=
ve/usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-che=
cks -Wall -no-install -L/var/home/frh/tezi-master/build/tmp/work/x86_64-lin=
ux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib                   =
      -L/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-nat=
ive/1.11.1/recipe-sysroot-native/lib                         -Wl,--enable-n=
ew-dtags                         -Wl,-rpath-link,/var/home/frh/tezi-master/=
build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/u=
sr/lib                         -Wl,-rpath-link,/var/home/frh/tezi-master/bu=
ild/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/lib=
                         -Wl,-rpath,/var/home/frh/tezi-master/build/tmp/wor=
k/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib       =
                  -Wl,-rpath,/var/home/frh/tezi-master/build/tmp/work/x86_6=
4-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/lib                  =
       -Wl,-O1 -o t-secmem t-secmem.o ../src/libgcrypt.la ../compat/libcomp=
at.la  -lcap
/bin/bash ../libtool  --tag=3DCC   --mode=3Dlink gcc  -I/var/home/frh/tezi-=
master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-n=
ative/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-mas=
ter/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nati=
ve/usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-che=
cks -Wall -no-install -L/var/home/frh/tezi-master/build/tmp/work/x86_64-lin=
ux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib                   =
      -L/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-nat=
ive/1.11.1/recipe-sysroot-native/lib                         -Wl,--enable-n=
ew-dtags                         -Wl,-rpath-link,/var/home/frh/tezi-master/=
build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/u=
sr/lib                         -Wl,-rpath-link,/var/home/frh/tezi-master/bu=
ild/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/lib=
                         -Wl,-rpath,/var/home/frh/tezi-master/build/tmp/wor=
k/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib       =
                  -Wl,-rpath,/var/home/frh/tezi-master/build/tmp/work/x86_6=
4-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/lib                  =
       -Wl,-O1 -o hmac hmac.o ../src/libgcrypt.la ../compat/libcompat.la -L=
/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11=
=2E1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib -lgpg-error  =
-lcap
/bin/bash ../libtool  --tag=3DCC   --mode=3Dlink gcc  -I/var/home/frh/tezi-=
master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-n=
ative/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-mas=
ter/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nati=
ve/usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-che=
cks -Wall -no-install -L/var/home/frh/tezi-master/build/tmp/work/x86_64-lin=
ux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib                   =
      -L/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-nat=
ive/1.11.1/recipe-sysroot-native/lib                         -Wl,--enable-n=
ew-dtags                         -Wl,-rpath-link,/var/home/frh/tezi-master/=
build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/u=
sr/lib                         -Wl,-rpath-link,/var/home/frh/tezi-master/bu=
ild/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/lib=
                         -Wl,-rpath,/var/home/frh/tezi-master/build/tmp/wor=
k/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib       =
                  -Wl,-rpath,/var/home/frh/tezi-master/build/tmp/work/x86_6=
4-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/lib                  =
       -Wl,-O1 -o prime prime.o ../src/libgcrypt.la ../compat/libcompat.la =
 -lcap
/bin/bash ../libtool  --tag=3DCC   --mode=3Dlink gcc  -I/var/home/frh/tezi-=
master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-n=
ative/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-mas=
ter/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nati=
ve/usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-che=
cks -Wall -no-install -L/var/home/frh/tezi-master/build/tmp/work/x86_64-lin=
ux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib                   =
      -L/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-nat=
ive/1.11.1/recipe-sysroot-native/lib                         -Wl,--enable-n=
ew-dtags                         -Wl,-rpath-link,/var/home/frh/tezi-master/=
build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/u=
sr/lib                         -Wl,-rpath-link,/var/home/frh/tezi-master/bu=
ild/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/lib=
                         -Wl,-rpath,/var/home/frh/tezi-master/build/tmp/wor=
k/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib       =
                  -Wl,-rpath,/var/home/frh/tezi-master/build/tmp/work/x86_6=
4-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/lib                  =
       -Wl,-O1 -o t-thread-local t-thread-local.o ../src/libgcrypt.la ../co=
mpat/libcompat.la -L/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/l=
ibgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr=
/lib -lgpg-error  -lcap
/bin/bash ../libtool  --tag=3DCC   --mode=3Dlink gcc  -I/var/home/frh/tezi-=
master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-n=
ative/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-mas=
ter/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nati=
ve/usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-che=
cks -Wall -no-install -L/var/home/frh/tezi-master/build/tmp/work/x86_64-lin=
ux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib                   =
      -L/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-nat=
ive/1.11.1/recipe-sysroot-native/lib                         -Wl,--enable-n=
ew-dtags                         -Wl,-rpath-link,/var/home/frh/tezi-master/=
build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/u=
sr/lib                         -Wl,-rpath-link,/var/home/frh/tezi-master/bu=
ild/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/lib=
                         -Wl,-rpath,/var/home/frh/tezi-master/build/tmp/wor=
k/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib       =
                  -Wl,-rpath,/var/home/frh/tezi-master/build/tmp/work/x86_6=
4-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/lib                  =
       -Wl,-O1 -o genhashdata genhashdata.o ../src/libgcrypt.la ../compat/l=
ibcompat.la -L/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcry=
pt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib -=
lgpg-error  -lcap
/bin/bash ../libtool  --tag=3DCC   --mode=3Dlink gcc  -I/var/home/frh/tezi-=
master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-n=
ative/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-mas=
ter/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nati=
ve/usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-che=
cks -Wall -no-install -L/var/home/frh/tezi-master/build/tmp/work/x86_64-lin=
ux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib                   =
      -L/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-nat=
ive/1.11.1/recipe-sysroot-native/lib                         -Wl,--enable-n=
ew-dtags                         -Wl,-rpath-link,/var/home/frh/tezi-master/=
build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/u=
sr/lib                         -Wl,-rpath-link,/var/home/frh/tezi-master/bu=
ild/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/lib=
                         -Wl,-rpath,/var/home/frh/tezi-master/build/tmp/wor=
k/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib       =
                  -Wl,-rpath,/var/home/frh/tezi-master/build/tmp/work/x86_6=
4-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/lib                  =
       -Wl,-O1 -o curves curves.o ../src/libgcrypt.la ../compat/libcompat.l=
a -L/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/=
1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib -lgpg-error=
  -lcap
/bin/bash ../libtool  --tag=3DCC   --mode=3Dlink gcc  -I/var/home/frh/tezi-=
master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-n=
ative/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-mas=
ter/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nati=
ve/usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-che=
cks -Wall -no-install -L/var/home/frh/tezi-master/build/tmp/work/x86_64-lin=
ux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib                   =
      -L/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-nat=
ive/1.11.1/recipe-sysroot-native/lib                         -Wl,--enable-n=
ew-dtags                         -Wl,-rpath-link,/var/home/frh/tezi-master/=
build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/u=
sr/lib                         -Wl,-rpath-link,/var/home/frh/tezi-master/bu=
ild/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/lib=
                         -Wl,-rpath,/var/home/frh/tezi-master/build/tmp/wor=
k/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib       =
                  -Wl,-rpath,/var/home/frh/tezi-master/build/tmp/work/x86_6=
4-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/lib                  =
       -Wl,-O1 -o t-rsa-testparm t-rsa-testparm.o ../src/libgcrypt.la ../co=
mpat/libcompat.la -L/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/l=
ibgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr=
/lib -lgpg-error  -lcap
/bin/bash ../libtool  --tag=3DCC   --mode=3Dlink gcc   -lpthread -isystem/v=
ar/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1=
/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dhidden -fno-del=
ete-null-pointer-checks -Wall -no-install -L/var/home/frh/tezi-master/build=
/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/li=
b                         -L/var/home/frh/tezi-master/build/tmp/work/x86_64=
-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/lib                   =
      -Wl,--enable-new-dtags                         -Wl,-rpath-link,/var/h=
ome/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/rec=
ipe-sysroot-native/usr/lib                         -Wl,-rpath-link,/var/hom=
e/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recip=
e-sysroot-native/lib                         -Wl,-rpath,/var/home/frh/tezi-=
master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-n=
ative/usr/lib                         -Wl,-rpath,/var/home/frh/tezi-master/=
build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/l=
ib                         -Wl,-O1 -o t-lock t_lock-t-lock.o ../src/libgcry=
pt.la ../compat/libcompat.la   -lcap
/bin/bash ../libtool  --tag=3DCC   --mode=3Dlink gcc  -I/var/home/frh/tezi-=
master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-n=
ative/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-mas=
ter/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nati=
ve/usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-che=
cks -Wall -no-install -L/var/home/frh/tezi-master/build/tmp/work/x86_64-lin=
ux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib                   =
      -L/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-nat=
ive/1.11.1/recipe-sysroot-native/lib                         -Wl,--enable-n=
ew-dtags                         -Wl,-rpath-link,/var/home/frh/tezi-master/=
build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/u=
sr/lib                         -Wl,-rpath-link,/var/home/frh/tezi-master/bu=
ild/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/lib=
                         -Wl,-rpath,/var/home/frh/tezi-master/build/tmp/wor=
k/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib       =
                  -Wl,-rpath,/var/home/frh/tezi-master/build/tmp/work/x86_6=
4-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/lib                  =
       -Wl,-O1 -o keygrip keygrip.o ../src/libgcrypt.la ../compat/libcompat=
=2Ela -L/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-nat=
ive/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib -lgpg-e=
rror  -lcap
/bin/bash ../libtool  --tag=3DCC   --mode=3Dlink gcc  -I/var/home/frh/tezi-=
master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-n=
ative/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-mas=
ter/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nati=
ve/usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-che=
cks -Wall -no-install -L/var/home/frh/tezi-master/build/tmp/work/x86_64-lin=
ux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib                   =
      -L/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-nat=
ive/1.11.1/recipe-sysroot-native/lib                         -Wl,--enable-n=
ew-dtags                         -Wl,-rpath-link,/var/home/frh/tezi-master/=
build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/u=
sr/lib                         -Wl,-rpath-link,/var/home/frh/tezi-master/bu=
ild/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/lib=
                         -Wl,-rpath,/var/home/frh/tezi-master/build/tmp/wor=
k/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib       =
                  -Wl,-rpath,/var/home/frh/tezi-master/build/tmp/work/x86_6=
4-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/lib                  =
       -Wl,-O1 -o t-mpi-bit t-mpi-bit.o ../src/libgcrypt.la ../compat/libco=
mpat.la  -lcap
/bin/bash ../libtool  --tag=3DCC   --mode=3Dlink gcc  -I/var/home/frh/tezi-=
master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-n=
ative/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-mas=
ter/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nati=
ve/usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-che=
cks -Wall -no-install -L/var/home/frh/tezi-master/build/tmp/work/x86_64-lin=
ux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib                   =
      -L/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-nat=
ive/1.11.1/recipe-sysroot-native/lib                         -Wl,--enable-n=
ew-dtags                         -Wl,-rpath-link,/var/home/frh/tezi-master/=
build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/u=
sr/lib                         -Wl,-rpath-link,/var/home/frh/tezi-master/bu=
ild/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/lib=
                         -Wl,-rpath,/var/home/frh/tezi-master/build/tmp/wor=
k/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib       =
                  -Wl,-rpath,/var/home/frh/tezi-master/build/tmp/work/x86_6=
4-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/lib                  =
       -Wl,-O1 -o rsacvt rsacvt.o ../src/libgcrypt.la ../compat/libcompat.l=
a -L/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/=
1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib -lgpg-error=
  -lcap
/bin/bash ../libtool  --tag=3DCC   --mode=3Dlink gcc  -I/var/home/frh/tezi-=
master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-n=
ative/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-mas=
ter/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nati=
ve/usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-che=
cks -Wall -no-install -L/var/home/frh/tezi-master/build/tmp/work/x86_64-lin=
ux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib                   =
      -L/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-nat=
ive/1.11.1/recipe-sysroot-native/lib                         -Wl,--enable-n=
ew-dtags                         -Wl,-rpath-link,/var/home/frh/tezi-master/=
build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/u=
sr/lib                         -Wl,-rpath-link,/var/home/frh/tezi-master/bu=
ild/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/lib=
                         -Wl,-rpath,/var/home/frh/tezi-master/build/tmp/wor=
k/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib       =
                  -Wl,-rpath,/var/home/frh/tezi-master/build/tmp/work/x86_6=
4-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/lib                  =
       -Wl,-O1 -o t-x448 t-x448.o ../src/libgcrypt.la ../compat/libcompat.l=
a -L/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/=
1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib -lgpg-error=
  -lcap
/bin/bash ../libtool  --tag=3DCC   --mode=3Dlink gcc  -I/var/home/frh/tezi-=
master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-n=
ative/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-mas=
ter/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nati=
ve/usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-che=
cks -Wall -no-install -L/var/home/frh/tezi-master/build/tmp/work/x86_64-lin=
ux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib                   =
      -L/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-nat=
ive/1.11.1/recipe-sysroot-native/lib                         -Wl,--enable-n=
ew-dtags                         -Wl,-rpath-link,/var/home/frh/tezi-master/=
build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/u=
sr/lib                         -Wl,-rpath-link,/var/home/frh/tezi-master/bu=
ild/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/lib=
                         -Wl,-rpath,/var/home/frh/tezi-master/build/tmp/wor=
k/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib       =
                  -Wl,-rpath,/var/home/frh/tezi-master/build/tmp/work/x86_6=
4-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/lib                  =
       -Wl,-O1 -o t-mlkem t-mlkem.o ../src/libgcrypt.la ../compat/libcompat=
=2Ela -L/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-nat=
ive/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib -lgpg-e=
rror  -lcap
/bin/bash ../libtool  --tag=3DCC   --mode=3Dlink gcc  -I/var/home/frh/tezi-=
master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-n=
ative/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-mas=
ter/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nati=
ve/usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-che=
cks -Wall -no-install -L/var/home/frh/tezi-master/build/tmp/work/x86_64-lin=
ux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib                   =
      -L/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-nat=
ive/1.11.1/recipe-sysroot-native/lib                         -Wl,--enable-n=
ew-dtags                         -Wl,-rpath-link,/var/home/frh/tezi-master/=
build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/u=
sr/lib                         -Wl,-rpath-link,/var/home/frh/tezi-master/bu=
ild/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/lib=
                         -Wl,-rpath,/var/home/frh/tezi-master/build/tmp/wor=
k/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib       =
                  -Wl,-rpath,/var/home/frh/tezi-master/build/tmp/work/x86_6=
4-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/lib                  =
       -Wl,-O1 -o dsa-rfc6979 dsa-rfc6979.o ../src/libgcrypt.la ../compat/l=
ibcompat.la -L/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcry=
pt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib -=
lgpg-error  -lcap
/bin/bash ../libtool  --tag=3DCC   --mode=3Dlink gcc  -I/var/home/frh/tezi-=
master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-n=
ative/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-mas=
ter/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nati=
ve/usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-che=
cks -Wall -no-install -L/var/home/frh/tezi-master/build/tmp/work/x86_64-lin=
ux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib                   =
      -L/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-nat=
ive/1.11.1/recipe-sysroot-native/lib                         -Wl,--enable-n=
ew-dtags                         -Wl,-rpath-link,/var/home/frh/tezi-master/=
build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/u=
sr/lib                         -Wl,-rpath-link,/var/home/frh/tezi-master/bu=
ild/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/lib=
                         -Wl,-rpath,/var/home/frh/tezi-master/build/tmp/wor=
k/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib       =
                  -Wl,-rpath,/var/home/frh/tezi-master/build/tmp/work/x86_6=
4-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/lib                  =
       -Wl,-O1 -o fips186-dsa fips186-dsa.o ../src/libgcrypt.la ../compat/l=
ibcompat.la -L/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcry=
pt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib -=
lgpg-error  -lcap
/bin/bash ../libtool  --tag=3DCC   --mode=3Dlink gcc  -I/var/home/frh/tezi-=
master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-n=
ative/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-mas=
ter/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nati=
ve/usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-che=
cks -Wall -no-install -L/var/home/frh/tezi-master/build/tmp/work/x86_64-lin=
ux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib                   =
      -L/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-nat=
ive/1.11.1/recipe-sysroot-native/lib                         -Wl,--enable-n=
ew-dtags                         -Wl,-rpath-link,/var/home/frh/tezi-master/=
build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/u=
sr/lib                         -Wl,-rpath-link,/var/home/frh/tezi-master/bu=
ild/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/lib=
                         -Wl,-rpath,/var/home/frh/tezi-master/build/tmp/wor=
k/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib       =
                  -Wl,-rpath,/var/home/frh/tezi-master/build/tmp/work/x86_6=
4-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/lib                  =
       -Wl,-O1 -o t-cv25519 t-cv25519.o ../src/libgcrypt.la ../compat/libco=
mpat.la -L/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-n=
ative/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib -lgpg=
-error  -lcap
/bin/bash ../libtool  --tag=3DCC   --mode=3Dlink gcc  -I/var/home/frh/tezi-=
master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-n=
ative/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-mas=
ter/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nati=
ve/usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-che=
cks -Wall -no-install -L/var/home/frh/tezi-master/build/tmp/work/x86_64-lin=
ux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib                   =
      -L/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-nat=
ive/1.11.1/recipe-sysroot-native/lib                         -Wl,--enable-n=
ew-dtags                         -Wl,-rpath-link,/var/home/frh/tezi-master/=
build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/u=
sr/lib                         -Wl,-rpath-link,/var/home/frh/tezi-master/bu=
ild/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/lib=
                         -Wl,-rpath,/var/home/frh/tezi-master/build/tmp/wor=
k/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib       =
                  -Wl,-rpath,/var/home/frh/tezi-master/build/tmp/work/x86_6=
4-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/lib                  =
       -Wl,-O1 -o testdrv testdrv.o  -lcap
/bin/bash ../libtool  --tag=3DCC   --mode=3Dlink gcc  -I/var/home/frh/tezi-=
master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-n=
ative/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-mas=
ter/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nati=
ve/usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-che=
cks -Wall -no-install -L/var/home/frh/tezi-master/build/tmp/work/x86_64-lin=
ux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib                   =
      -L/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-nat=
ive/1.11.1/recipe-sysroot-native/lib                         -Wl,--enable-n=
ew-dtags                         -Wl,-rpath-link,/var/home/frh/tezi-master/=
build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/u=
sr/lib                         -Wl,-rpath-link,/var/home/frh/tezi-master/bu=
ild/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/lib=
                         -Wl,-rpath,/var/home/frh/tezi-master/build/tmp/wor=
k/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib       =
                  -Wl,-rpath,/var/home/frh/tezi-master/build/tmp/work/x86_6=
4-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/lib                  =
       -Wl,-O1 -o hashtest hashtest.o ../src/libgcrypt.la ../compat/libcomp=
at.la -L/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-nat=
ive/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib -lgpg-e=
rror  -lcap
/bin/bash ../libtool  --tag=3DCC   --mode=3Dlink gcc  -I/var/home/frh/tezi-=
master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-n=
ative/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-mas=
ter/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nati=
ve/usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-che=
cks -Wall -no-install -L/var/home/frh/tezi-master/build/tmp/work/x86_64-lin=
ux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib                   =
      -L/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-nat=
ive/1.11.1/recipe-sysroot-native/lib                         -Wl,--enable-n=
ew-dtags                         -Wl,-rpath-link,/var/home/frh/tezi-master/=
build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/u=
sr/lib                         -Wl,-rpath-link,/var/home/frh/tezi-master/bu=
ild/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/lib=
                         -Wl,-rpath,/var/home/frh/tezi-master/build/tmp/wor=
k/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib       =
                  -Wl,-rpath,/var/home/frh/tezi-master/build/tmp/work/x86_6=
4-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/lib                  =
       -Wl,-O1 -o t-kem t-kem.o ../src/libgcrypt.la ../compat/libcompat.la =
-L/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.=
11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib -lgpg-error  =
-lcap
/bin/bash ../libtool  --tag=3DCC   --mode=3Dlink gcc  -I/var/home/frh/tezi-=
master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-n=
ative/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-mas=
ter/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nati=
ve/usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-che=
cks -Wall -no-install -L/var/home/frh/tezi-master/build/tmp/work/x86_64-lin=
ux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib                   =
      -L/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-nat=
ive/1.11.1/recipe-sysroot-native/lib                         -Wl,--enable-n=
ew-dtags                         -Wl,-rpath-link,/var/home/frh/tezi-master/=
build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/u=
sr/lib                         -Wl,-rpath-link,/var/home/frh/tezi-master/bu=
ild/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/lib=
                         -Wl,-rpath,/var/home/frh/tezi-master/build/tmp/wor=
k/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib       =
                  -Wl,-rpath,/var/home/frh/tezi-master/build/tmp/work/x86_6=
4-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/lib                  =
       -Wl,-O1 -o mpitests mpitests.o ../src/libgcrypt.la ../compat/libcomp=
at.la -L/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-nat=
ive/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib -lgpg-e=
rror  -lcap
/bin/bash ../libtool  --tag=3DCC   --mode=3Dlink gcc  -I/var/home/frh/tezi-=
master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-n=
ative/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-mas=
ter/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nati=
ve/usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-che=
cks -Wall -no-install -L/var/home/frh/tezi-master/build/tmp/work/x86_64-lin=
ux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib                   =
      -L/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-nat=
ive/1.11.1/recipe-sysroot-native/lib                         -Wl,--enable-n=
ew-dtags                         -Wl,-rpath-link,/var/home/frh/tezi-master/=
build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/u=
sr/lib                         -Wl,-rpath-link,/var/home/frh/tezi-master/bu=
ild/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/lib=
                         -Wl,-rpath,/var/home/frh/tezi-master/build/tmp/wor=
k/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib       =
                  -Wl,-rpath,/var/home/frh/tezi-master/build/tmp/work/x86_6=
4-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/lib                  =
       -Wl,-O1 -o t-ed25519 t-ed25519.o ../src/libgcrypt.la ../compat/libco=
mpat.la -L/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-n=
ative/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib -lgpg=
-error  -lcap
/bin/bash ../libtool  --tag=3DCC   --mode=3Dlink gcc  -I/var/home/frh/tezi-=
master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-n=
ative/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-mas=
ter/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nati=
ve/usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-che=
cks -Wall -no-install -L/var/home/frh/tezi-master/build/tmp/work/x86_64-lin=
ux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib                   =
      -L/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-nat=
ive/1.11.1/recipe-sysroot-native/lib                         -Wl,--enable-n=
ew-dtags                         -Wl,-rpath-link,/var/home/frh/tezi-master/=
build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/u=
sr/lib                         -Wl,-rpath-link,/var/home/frh/tezi-master/bu=
ild/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/lib=
                         -Wl,-rpath,/var/home/frh/tezi-master/build/tmp/wor=
k/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib       =
                  -Wl,-rpath,/var/home/frh/tezi-master/build/tmp/work/x86_6=
4-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/lib                  =
       -Wl,-O1 -o t-convert t-convert.o ../src/libgcrypt.la ../compat/libco=
mpat.la -L/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-n=
ative/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib -lgpg=
-error  -lcap
/bin/bash ../libtool  --tag=3DCC   --mode=3Dlink gcc  -I/var/home/frh/tezi-=
master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-n=
ative/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-mas=
ter/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nati=
ve/usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-che=
cks -Wall -no-install -L/var/home/frh/tezi-master/build/tmp/work/x86_64-lin=
ux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib                   =
      -L/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-nat=
ive/1.11.1/recipe-sysroot-native/lib                         -Wl,--enable-n=
ew-dtags                         -Wl,-rpath-link,/var/home/frh/tezi-master/=
build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/u=
sr/lib                         -Wl,-rpath-link,/var/home/frh/tezi-master/bu=
ild/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/lib=
                         -Wl,-rpath,/var/home/frh/tezi-master/build/tmp/wor=
k/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib       =
                  -Wl,-rpath,/var/home/frh/tezi-master/build/tmp/work/x86_6=
4-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/lib                  =
       -Wl,-O1 -o t-rsa-pss t-rsa-pss.o ../src/libgcrypt.la ../compat/libco=
mpat.la -L/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-n=
ative/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib -lgpg=
-error  -lcap
/bin/bash ../libtool  --tag=3DCC   --mode=3Dlink gcc  -I/var/home/frh/tezi-=
master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-n=
ative/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-mas=
ter/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nati=
ve/usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-che=
cks -Wall -no-install -L/var/home/frh/tezi-master/build/tmp/work/x86_64-lin=
ux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib                   =
      -L/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-nat=
ive/1.11.1/recipe-sysroot-native/lib                         -Wl,--enable-n=
ew-dtags                         -Wl,-rpath-link,/var/home/frh/tezi-master/=
build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/u=
sr/lib                         -Wl,-rpath-link,/var/home/frh/tezi-master/bu=
ild/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/lib=
                         -Wl,-rpath,/var/home/frh/tezi-master/build/tmp/wor=
k/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib       =
                  -Wl,-rpath,/var/home/frh/tezi-master/build/tmp/work/x86_6=
4-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/lib                  =
       -Wl,-O1 -o aeswrap aeswrap.o ../src/libgcrypt.la ../compat/libcompat=
=2Ela -L/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-nat=
ive/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib -lgpg-e=
rror  -lcap
/bin/bash ../libtool  --tag=3DCC   --mode=3Dlink gcc  -I/var/home/frh/tezi-=
master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-n=
ative/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-mas=
ter/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nati=
ve/usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-che=
cks -Wall -no-install -L/var/home/frh/tezi-master/build/tmp/work/x86_64-lin=
ux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib                   =
      -L/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-nat=
ive/1.11.1/recipe-sysroot-native/lib                         -Wl,--enable-n=
ew-dtags                         -Wl,-rpath-link,/var/home/frh/tezi-master/=
build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/u=
sr/lib                         -Wl,-rpath-link,/var/home/frh/tezi-master/bu=
ild/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/lib=
                         -Wl,-rpath,/var/home/frh/tezi-master/build/tmp/wor=
k/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib       =
                  -Wl,-rpath,/var/home/frh/tezi-master/build/tmp/work/x86_6=
4-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/lib                  =
       -Wl,-O1 -o t-ed448 t-ed448.o ../src/libgcrypt.la ../compat/libcompat=
=2Ela -L/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-nat=
ive/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib -lgpg-e=
rror  -lcap
/bin/bash ../libtool  --tag=3DCC   --mode=3Dlink gcc   -lpthread -isystem/v=
ar/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1=
/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility=3Dhidden -fno-del=
ete-null-pointer-checks -Wall -no-install -L/var/home/frh/tezi-master/build=
/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/li=
b                         -L/var/home/frh/tezi-master/build/tmp/work/x86_64=
-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/lib                   =
      -Wl,--enable-new-dtags                         -Wl,-rpath-link,/var/h=
ome/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/rec=
ipe-sysroot-native/usr/lib                         -Wl,-rpath-link,/var/hom=
e/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recip=
e-sysroot-native/lib                         -Wl,-rpath,/var/home/frh/tezi-=
master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-n=
ative/usr/lib                         -Wl,-rpath,/var/home/frh/tezi-master/=
build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/l=
ib                         -Wl,-O1 -o t-kdf t_kdf-t-kdf.o ../src/libgcrypt.=
la ../compat/libcompat.la   -lcap
/bin/bash ../libtool  --tag=3DCC   --mode=3Dlink gcc  -I/var/home/frh/tezi-=
master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-n=
ative/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-mas=
ter/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nati=
ve/usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-che=
cks -Wall -no-install -L/var/home/frh/tezi-master/build/tmp/work/x86_64-lin=
ux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib                   =
      -L/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-nat=
ive/1.11.1/recipe-sysroot-native/lib                         -Wl,--enable-n=
ew-dtags                         -Wl,-rpath-link,/var/home/frh/tezi-master/=
build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/u=
sr/lib                         -Wl,-rpath-link,/var/home/frh/tezi-master/bu=
ild/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/lib=
                         -Wl,-rpath,/var/home/frh/tezi-master/build/tmp/wor=
k/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib       =
                  -Wl,-rpath,/var/home/frh/tezi-master/build/tmp/work/x86_6=
4-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/lib                  =
       -Wl,-O1 -o random random.o ../src/libgcrypt.la ../compat/libcompat.l=
a -L/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/=
1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib -lgpg-error=
  -lcap
/bin/bash ../libtool  --tag=3DCC   --mode=3Dlink gcc  -I/var/home/frh/tezi-=
master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-n=
ative/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-mas=
ter/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nati=
ve/usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-che=
cks -Wall -no-install -L/var/home/frh/tezi-master/build/tmp/work/x86_64-lin=
ux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib                   =
      -L/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-nat=
ive/1.11.1/recipe-sysroot-native/lib                         -Wl,--enable-n=
ew-dtags                         -Wl,-rpath-link,/var/home/frh/tezi-master/=
build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/u=
sr/lib                         -Wl,-rpath-link,/var/home/frh/tezi-master/bu=
ild/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/lib=
                         -Wl,-rpath,/var/home/frh/tezi-master/build/tmp/wor=
k/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib       =
                  -Wl,-rpath,/var/home/frh/tezi-master/build/tmp/work/x86_6=
4-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/lib                  =
       -Wl,-O1 -o keygen keygen.o ../src/libgcrypt.la ../compat/libcompat.l=
a -L/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/=
1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib -lgpg-error=
  -lcap
/bin/bash ../libtool  --tag=3DCC   --mode=3Dlink gcc  -I/var/home/frh/tezi-=
master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-n=
ative/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-mas=
ter/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nati=
ve/usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-che=
cks -Wall -no-install -L/var/home/frh/tezi-master/build/tmp/work/x86_64-lin=
ux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib                   =
      -L/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-nat=
ive/1.11.1/recipe-sysroot-native/lib                         -Wl,--enable-n=
ew-dtags                         -Wl,-rpath-link,/var/home/frh/tezi-master/=
build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/u=
sr/lib                         -Wl,-rpath-link,/var/home/frh/tezi-master/bu=
ild/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/lib=
                         -Wl,-rpath,/var/home/frh/tezi-master/build/tmp/wor=
k/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib       =
                  -Wl,-rpath,/var/home/frh/tezi-master/build/tmp/work/x86_6=
4-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/lib                  =
       -Wl,-O1 -o t-rsa-15 t-rsa-15.o ../src/libgcrypt.la ../compat/libcomp=
at.la -L/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-nat=
ive/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib -lgpg-e=
rror  -lcap
/bin/bash ../libtool  --tag=3DCC   --mode=3Dlink gcc  -I/var/home/frh/tezi-=
master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-n=
ative/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-mas=
ter/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nati=
ve/usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-che=
cks -Wall -no-install -L/var/home/frh/tezi-master/build/tmp/work/x86_64-lin=
ux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib                   =
      -L/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-nat=
ive/1.11.1/recipe-sysroot-native/lib                         -Wl,--enable-n=
ew-dtags                         -Wl,-rpath-link,/var/home/frh/tezi-master/=
build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/u=
sr/lib                         -Wl,-rpath-link,/var/home/frh/tezi-master/bu=
ild/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/lib=
                         -Wl,-rpath,/var/home/frh/tezi-master/build/tmp/wor=
k/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib       =
                  -Wl,-rpath,/var/home/frh/tezi-master/build/tmp/work/x86_6=
4-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/lib                  =
       -Wl,-O1 -o t-dsa t-dsa.o ../src/libgcrypt.la ../compat/libcompat.la =
-L/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.=
11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib -lgpg-error  =
-lcap
/bin/bash ../libtool  --tag=3DCC   --mode=3Dlink gcc  -I/var/home/frh/tezi-=
master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-n=
ative/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-mas=
ter/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nati=
ve/usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-che=
cks -Wall -no-install -L/var/home/frh/tezi-master/build/tmp/work/x86_64-lin=
ux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib                   =
      -L/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-nat=
ive/1.11.1/recipe-sysroot-native/lib                         -Wl,--enable-n=
ew-dtags                         -Wl,-rpath-link,/var/home/frh/tezi-master/=
build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/u=
sr/lib                         -Wl,-rpath-link,/var/home/frh/tezi-master/bu=
ild/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/lib=
                         -Wl,-rpath,/var/home/frh/tezi-master/build/tmp/wor=
k/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib       =
                  -Wl,-rpath,/var/home/frh/tezi-master/build/tmp/work/x86_6=
4-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/lib                  =
       -Wl,-O1 -o pubkey pubkey.o ../src/libgcrypt.la ../compat/libcompat.l=
a -L/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/=
1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib -lgpg-error=
  -lcap
/bin/bash ../libtool  --tag=3DCC   --mode=3Dlink gcc  -I/var/home/frh/tezi-=
master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-n=
ative/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-mas=
ter/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nati=
ve/usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-che=
cks -Wall -no-install -L/var/home/frh/tezi-master/build/tmp/work/x86_64-lin=
ux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib                   =
      -L/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-nat=
ive/1.11.1/recipe-sysroot-native/lib                         -Wl,--enable-n=
ew-dtags                         -Wl,-rpath-link,/var/home/frh/tezi-master/=
build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/u=
sr/lib                         -Wl,-rpath-link,/var/home/frh/tezi-master/bu=
ild/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/lib=
                         -Wl,-rpath,/var/home/frh/tezi-master/build/tmp/wor=
k/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib       =
                  -Wl,-rpath,/var/home/frh/tezi-master/build/tmp/work/x86_6=
4-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/lib                  =
       -Wl,-O1 -o t-fips-service-ind t-fips-service-ind.o ../src/libgcrypt.=
la ../compat/libcompat.la -L/var/home/frh/tezi-master/build/tmp/work/x86_64=
-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../.=
=2E/../usr/lib -lgpg-error  -lcap
/bin/bash ../libtool  --tag=3DCC   --mode=3Dlink gcc  -I/var/home/frh/tezi-=
master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-n=
ative/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-mas=
ter/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nati=
ve/usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-che=
cks -Wall -no-install -L/var/home/frh/tezi-master/build/tmp/work/x86_64-lin=
ux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib                   =
      -L/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-nat=
ive/1.11.1/recipe-sysroot-native/lib                         -Wl,--enable-n=
ew-dtags                         -Wl,-rpath-link,/var/home/frh/tezi-master/=
build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/u=
sr/lib                         -Wl,-rpath-link,/var/home/frh/tezi-master/bu=
ild/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/lib=
                         -Wl,-rpath,/var/home/frh/tezi-master/build/tmp/wor=
k/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib       =
                  -Wl,-rpath,/var/home/frh/tezi-master/build/tmp/work/x86_6=
4-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/lib                  =
       -Wl,-O1 -o t-sexp t-sexp.o ../src/libgcrypt.la ../compat/libcompat.l=
a -L/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/=
1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib -lgpg-error=
  -lcap
/bin/bash ../libtool  --tag=3DCC   --mode=3Dlink gcc  -I/var/home/frh/tezi-=
master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-n=
ative/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-mas=
ter/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nati=
ve/usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-che=
cks -Wall -no-install -L/var/home/frh/tezi-master/build/tmp/work/x86_64-lin=
ux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib                   =
      -L/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-nat=
ive/1.11.1/recipe-sysroot-native/lib                         -Wl,--enable-n=
ew-dtags                         -Wl,-rpath-link,/var/home/frh/tezi-master/=
build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/u=
sr/lib                         -Wl,-rpath-link,/var/home/frh/tezi-master/bu=
ild/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/lib=
                         -Wl,-rpath,/var/home/frh/tezi-master/build/tmp/wor=
k/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib       =
                  -Wl,-rpath,/var/home/frh/tezi-master/build/tmp/work/x86_6=
4-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/lib                  =
       -Wl,-O1 -o pkcs1v2 pkcs1v2.o ../src/libgcrypt.la ../compat/libcompat=
=2Ela -L/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-nat=
ive/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib -lgpg-e=
rror  -lcap
/bin/bash ../libtool  --tag=3DCC   --mode=3Dlink gcc  -I/var/home/frh/tezi-=
master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-n=
ative/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-mas=
ter/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nati=
ve/usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-che=
cks -Wall -no-install -L/var/home/frh/tezi-master/build/tmp/work/x86_64-lin=
ux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib                   =
      -L/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-nat=
ive/1.11.1/recipe-sysroot-native/lib                         -Wl,--enable-n=
ew-dtags                         -Wl,-rpath-link,/var/home/frh/tezi-master/=
build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/u=
sr/lib                         -Wl,-rpath-link,/var/home/frh/tezi-master/bu=
ild/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/lib=
                         -Wl,-rpath,/var/home/frh/tezi-master/build/tmp/wor=
k/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib       =
                  -Wl,-rpath,/var/home/frh/tezi-master/build/tmp/work/x86_6=
4-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/lib                  =
       -Wl,-O1 -o t-ecdsa t-ecdsa.o ../src/libgcrypt.la ../compat/libcompat=
=2Ela -L/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-nat=
ive/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib -lgpg-e=
rror  -lcap
libtool: link: gcc -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/=
libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../us=
r/include -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/lib=
gcrypt-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibili=
ty=3Dhidden -fno-delete-null-pointer-checks -Wall -Wl,--enable-new-dtags -W=
l,-rpath-link -Wl,/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/lib=
gcrypt-native/1.11.1/recipe-sysroot-native/usr/lib -Wl,-rpath-link -Wl,/var=
/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/r=
ecipe-sysroot-native/lib -Wl,-rpath -Wl,/var/home/frh/tezi-master/build/tmp=
/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib -W=
l,-rpath -Wl,/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcryp=
t-native/1.11.1/recipe-sysroot-native/lib -Wl,-O1 -o testdrv testdrv.o  -L/=
var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.=
1/recipe-sysroot-native/usr/lib -L/var/home/frh/tezi-master/build/tmp/work/=
x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/lib -lcap
/bin/bash ../libtool  --tag=3DCC   --mode=3Dlink gcc  -I/var/home/frh/tezi-=
master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-n=
ative/usr/lib/pkgconfig/../../../usr/include -isystem/var/home/frh/tezi-mas=
ter/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nati=
ve/usr/include -O2 -pipe -fvisibility=3Dhidden -fno-delete-null-pointer-che=
cks -Wall -no-install -L/var/home/frh/tezi-master/build/tmp/work/x86_64-lin=
ux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib                   =
      -L/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-nat=
ive/1.11.1/recipe-sysroot-native/lib                         -Wl,--enable-n=
ew-dtags                         -Wl,-rpath-link,/var/home/frh/tezi-master/=
build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/u=
sr/lib                         -Wl,-rpath-link,/var/home/frh/tezi-master/bu=
ild/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/lib=
                         -Wl,-rpath,/var/home/frh/tezi-master/build/tmp/wor=
k/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib       =
                  -Wl,-rpath,/var/home/frh/tezi-master/build/tmp/work/x86_6=
4-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/lib                  =
       -Wl,-O1 -o t-mpi-point t-mpi-point.o ../src/libgcrypt.la ../compat/l=
ibcompat.la -L/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcry=
pt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib -=
lgpg-error  -lcap
libtool: link: gcc -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/=
libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../us=
r/include -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/lib=
gcrypt-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibili=
ty=3Dhidden -fno-delete-null-pointer-checks -Wall -Wl,--enable-new-dtags -W=
l,-rpath-link -Wl,/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/lib=
gcrypt-native/1.11.1/recipe-sysroot-native/usr/lib -Wl,-rpath-link -Wl,/var=
/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/r=
ecipe-sysroot-native/lib -Wl,-rpath -Wl,/var/home/frh/tezi-master/build/tmp=
/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib -W=
l,-rpath -Wl,/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcryp=
t-native/1.11.1/recipe-sysroot-native/lib -Wl,-O1 -o hmac hmac.o  -L/var/ho=
me/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/reci=
pe-sysroot-native/usr/lib -L/var/home/frh/tezi-master/build/tmp/work/x86_64=
-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/lib ../src/.libs/libgc=
rypt.so -L/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-n=
ative/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib ../co=
mpat/.libs/libcompat.a -lgpg-error -lcap -Wl,-rpath -Wl,/var/home/frh/tezi-=
master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/build/src/.libs
libtool: link: gcc -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/=
libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../us=
r/include -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/lib=
gcrypt-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibili=
ty=3Dhidden -fno-delete-null-pointer-checks -Wall -Wl,--enable-new-dtags -W=
l,-rpath-link -Wl,/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/lib=
gcrypt-native/1.11.1/recipe-sysroot-native/usr/lib -Wl,-rpath-link -Wl,/var=
/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/r=
ecipe-sysroot-native/lib -Wl,-rpath -Wl,/var/home/frh/tezi-master/build/tmp=
/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib -W=
l,-rpath -Wl,/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcryp=
t-native/1.11.1/recipe-sysroot-native/lib -Wl,-O1 -o t-secmem t-secmem.o  -=
L/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.1=
1.1/recipe-sysroot-native/usr/lib -L/var/home/frh/tezi-master/build/tmp/wor=
k/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/lib ../src/.li=
bs/libgcrypt.so -L/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/lib=
gcrypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/l=
ib -lgpg-error ../compat/.libs/libcompat.a -lcap -Wl,-rpath -Wl,/var/home/f=
rh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/build/sr=
c/.libs
libtool: link: gcc -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/=
libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../us=
r/include -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/lib=
gcrypt-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibili=
ty=3Dhidden -fno-delete-null-pointer-checks -Wall -Wl,--enable-new-dtags -W=
l,-rpath-link -Wl,/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/lib=
gcrypt-native/1.11.1/recipe-sysroot-native/usr/lib -Wl,-rpath-link -Wl,/var=
/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/r=
ecipe-sysroot-native/lib -Wl,-rpath -Wl,/var/home/frh/tezi-master/build/tmp=
/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib -W=
l,-rpath -Wl,/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcryp=
t-native/1.11.1/recipe-sysroot-native/lib -Wl,-O1 -o t-thread-local t-threa=
d-local.o  -L/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcryp=
t-native/1.11.1/recipe-sysroot-native/usr/lib -L/var/home/frh/tezi-master/b=
uild/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/li=
b ../src/.libs/libgcrypt.so -L/var/home/frh/tezi-master/build/tmp/work/x86_=
64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/..=
/../../usr/lib ../compat/.libs/libcompat.a -lgpg-error -lcap -Wl,-rpath -Wl=
,/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.1=
1.1/build/src/.libs
libtool: link: gcc -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/=
libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../us=
r/include -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/lib=
gcrypt-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibili=
ty=3Dhidden -fno-delete-null-pointer-checks -Wall -Wl,--enable-new-dtags -W=
l,-rpath-link -Wl,/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/lib=
gcrypt-native/1.11.1/recipe-sysroot-native/usr/lib -Wl,-rpath-link -Wl,/var=
/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/r=
ecipe-sysroot-native/lib -Wl,-rpath -Wl,/var/home/frh/tezi-master/build/tmp=
/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib -W=
l,-rpath -Wl,/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcryp=
t-native/1.11.1/recipe-sysroot-native/lib -Wl,-O1 -o gchash gchash.o  -L/va=
r/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/=
recipe-sysroot-native/usr/lib -L/var/home/frh/tezi-master/build/tmp/work/x8=
6_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/lib ../src/.libs/l=
ibgcrypt.so -L/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcry=
pt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib .=
=2E/compat/.libs/libcompat.a -lgpg-error -lcap -Wl,-rpath -Wl,/var/home/frh=
/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/build/src/=
=2Elibs
libtool: link: gcc -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/=
libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../us=
r/include -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/lib=
gcrypt-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibili=
ty=3Dhidden -fno-delete-null-pointer-checks -Wall -Wl,--enable-new-dtags -W=
l,-rpath-link -Wl,/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/lib=
gcrypt-native/1.11.1/recipe-sysroot-native/usr/lib -Wl,-rpath-link -Wl,/var=
/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/r=
ecipe-sysroot-native/lib -Wl,-rpath -Wl,/var/home/frh/tezi-master/build/tmp=
/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib -W=
l,-rpath -Wl,/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcryp=
t-native/1.11.1/recipe-sysroot-native/lib -Wl,-O1 -o version version.o  -L/=
var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.=
1/recipe-sysroot-native/usr/lib -L/var/home/frh/tezi-master/build/tmp/work/=
x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/lib ../src/.libs=
/libgcrypt.so -L/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgc=
rypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib=
 ../compat/.libs/libcompat.a -lgpg-error -lcap -Wl,-rpath -Wl,/var/home/frh=
/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/build/src/=
=2Elibs
libtool: link: gcc -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/=
libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../us=
r/include -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/lib=
gcrypt-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibili=
ty=3Dhidden -fno-delete-null-pointer-checks -Wall -Wl,--enable-new-dtags -W=
l,-rpath-link -Wl,/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/lib=
gcrypt-native/1.11.1/recipe-sysroot-native/usr/lib -Wl,-rpath-link -Wl,/var=
/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/r=
ecipe-sysroot-native/lib -Wl,-rpath -Wl,/var/home/frh/tezi-master/build/tmp=
/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib -W=
l,-rpath -Wl,/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcryp=
t-native/1.11.1/recipe-sysroot-native/lib -Wl,-O1 -o genhashdata genhashdat=
a.o  -L/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-nati=
ve/1.11.1/recipe-sysroot-native/usr/lib -L/var/home/frh/tezi-master/build/t=
mp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/lib ../s=
rc/.libs/libgcrypt.so -L/var/home/frh/tezi-master/build/tmp/work/x86_64-lin=
ux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../..=
/usr/lib ../compat/.libs/libcompat.a -lgpg-error -lcap -Wl,-rpath -Wl,/var/=
home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/bu=
ild/src/.libs
libtool: link: gcc -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/=
libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../us=
r/include -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/lib=
gcrypt-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibili=
ty=3Dhidden -fno-delete-null-pointer-checks -Wall -Wl,--enable-new-dtags -W=
l,-rpath-link -Wl,/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/lib=
gcrypt-native/1.11.1/recipe-sysroot-native/usr/lib -Wl,-rpath-link -Wl,/var=
/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/r=
ecipe-sysroot-native/lib -Wl,-rpath -Wl,/var/home/frh/tezi-master/build/tmp=
/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib -W=
l,-rpath -Wl,/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcryp=
t-native/1.11.1/recipe-sysroot-native/lib -Wl,-O1 -o prime prime.o  -L/var/=
home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/re=
cipe-sysroot-native/usr/lib -L/var/home/frh/tezi-master/build/tmp/work/x86_=
64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/lib ../src/.libs/lib=
gcrypt.so -L/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt=
-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib -lg=
pg-error ../compat/.libs/libcompat.a -lcap -Wl,-rpath -Wl,/var/home/frh/tez=
i-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/build/src/.libs
/var/home/frh/tezi-master/build/tmp/hosttools/ld: t-thread-local.o: in func=
tion `main':
t-thread-local.c:(.text.startup+0x187): undefined reference to `pthread_cre=
ate'
/var/home/frh/tezi-master/build/tmp/hosttools/ld: t-thread-local.c:(.text.s=
tartup+0x1d0): undefined reference to `pthread_join'
libtool: link: gcc -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/=
libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../us=
r/include -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/lib=
gcrypt-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibili=
ty=3Dhidden -fno-delete-null-pointer-checks -Wall -Wl,--enable-new-dtags -W=
l,-rpath-link -Wl,/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/lib=
gcrypt-native/1.11.1/recipe-sysroot-native/usr/lib -Wl,-rpath-link -Wl,/var=
/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/r=
ecipe-sysroot-native/lib -Wl,-rpath -Wl,/var/home/frh/tezi-master/build/tmp=
/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib -W=
l,-rpath -Wl,/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcryp=
t-native/1.11.1/recipe-sysroot-native/lib -Wl,-O1 -o t-rsa-testparm t-rsa-t=
estparm.o  -L/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcryp=
t-native/1.11.1/recipe-sysroot-native/usr/lib -L/var/home/frh/tezi-master/b=
uild/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/li=
b ../src/.libs/libgcrypt.so -L/var/home/frh/tezi-master/build/tmp/work/x86_=
64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/..=
/../../usr/lib ../compat/.libs/libcompat.a -lgpg-error -lcap -Wl,-rpath -Wl=
,/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.1=
1.1/build/src/.libs
collect2: error: ld returned 1 exit status
make[2]: *** [Makefile:885: t-thread-local] Error 1
make[2]: *** Waiting for unfinished jobs....
libtool: link: gcc -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/=
libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../us=
r/include -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/lib=
gcrypt-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibili=
ty=3Dhidden -fno-delete-null-pointer-checks -Wall -Wl,--enable-new-dtags -W=
l,-rpath-link -Wl,/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/lib=
gcrypt-native/1.11.1/recipe-sysroot-native/usr/lib -Wl,-rpath-link -Wl,/var=
/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/r=
ecipe-sysroot-native/lib -Wl,-rpath -Wl,/var/home/frh/tezi-master/build/tmp=
/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib -W=
l,-rpath -Wl,/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcryp=
t-native/1.11.1/recipe-sysroot-native/lib -Wl,-O1 -o curves curves.o  -L/va=
r/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/=
recipe-sysroot-native/usr/lib -L/var/home/frh/tezi-master/build/tmp/work/x8=
6_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/lib ../src/.libs/l=
ibgcrypt.so -L/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcry=
pt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib .=
=2E/compat/.libs/libcompat.a -lgpg-error -lcap -Wl,-rpath -Wl,/var/home/frh=
/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/build/src/=
=2Elibs
libtool: link: gcc -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/=
libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../us=
r/include -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/lib=
gcrypt-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibili=
ty=3Dhidden -fno-delete-null-pointer-checks -Wall -Wl,--enable-new-dtags -W=
l,-rpath-link -Wl,/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/lib=
gcrypt-native/1.11.1/recipe-sysroot-native/usr/lib -Wl,-rpath-link -Wl,/var=
/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/r=
ecipe-sysroot-native/lib -Wl,-rpath -Wl,/var/home/frh/tezi-master/build/tmp=
/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib -W=
l,-rpath -Wl,/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcryp=
t-native/1.11.1/recipe-sysroot-native/lib -Wl,-O1 -o t-mpi-bit t-mpi-bit.o =
 -L/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1=
=2E11.1/recipe-sysroot-native/usr/lib -L/var/home/frh/tezi-master/build/tmp=
/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/lib ../src=
/.libs/libgcrypt.so -L/var/home/frh/tezi-master/build/tmp/work/x86_64-linux=
/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../u=
sr/lib -lgpg-error ../compat/.libs/libcompat.a -lcap -Wl,-rpath -Wl,/var/ho=
me/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/buil=
d/src/.libs
libtool: link: gcc -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/=
libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../us=
r/include -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/lib=
gcrypt-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibili=
ty=3Dhidden -fno-delete-null-pointer-checks -Wall -Wl,--enable-new-dtags -W=
l,-rpath-link -Wl,/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/lib=
gcrypt-native/1.11.1/recipe-sysroot-native/usr/lib -Wl,-rpath-link -Wl,/var=
/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/r=
ecipe-sysroot-native/lib -Wl,-rpath -Wl,/var/home/frh/tezi-master/build/tmp=
/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib -W=
l,-rpath -Wl,/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcryp=
t-native/1.11.1/recipe-sysroot-native/lib -Wl,-O1 -o rsacvt rsacvt.o  -L/va=
r/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/=
recipe-sysroot-native/usr/lib -L/var/home/frh/tezi-master/build/tmp/work/x8=
6_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/lib ../src/.libs/l=
ibgcrypt.so -L/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcry=
pt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib .=
=2E/compat/.libs/libcompat.a -lgpg-error -lcap -Wl,-rpath -Wl,/var/home/frh=
/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/build/src/=
=2Elibs
libtool: link: gcc -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-=
linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -=
fvisibility=3Dhidden -fno-delete-null-pointer-checks -Wall -Wl,--enable-new=
-dtags -Wl,-rpath-link -Wl,/var/home/frh/tezi-master/build/tmp/work/x86_64-=
linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib -Wl,-rpath-link=
 -Wl,/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native=
/1.11.1/recipe-sysroot-native/lib -Wl,-rpath -Wl,/var/home/frh/tezi-master/=
build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/u=
sr/lib -Wl,-rpath -Wl,/var/home/frh/tezi-master/build/tmp/work/x86_64-linux=
/libgcrypt-native/1.11.1/recipe-sysroot-native/lib -Wl,-O1 -o t-lock t_lock=
-t-lock.o  -lpthread -L/var/home/frh/tezi-master/build/tmp/work/x86_64-linu=
x/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib -L/var/home/frh/tez=
i-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot=
-native/lib ../src/.libs/libgcrypt.so -L/var/home/frh/tezi-master/build/tmp=
/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib/pk=
gconfig/../../../usr/lib -lgpg-error ../compat/.libs/libcompat.a -lcap -Wl,=
-rpath -Wl,/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-=
native/1.11.1/build/src/.libs
libtool: link: gcc -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/=
libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../us=
r/include -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/lib=
gcrypt-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibili=
ty=3Dhidden -fno-delete-null-pointer-checks -Wall -Wl,--enable-new-dtags -W=
l,-rpath-link -Wl,/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/lib=
gcrypt-native/1.11.1/recipe-sysroot-native/usr/lib -Wl,-rpath-link -Wl,/var=
/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/r=
ecipe-sysroot-native/lib -Wl,-rpath -Wl,/var/home/frh/tezi-master/build/tmp=
/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib -W=
l,-rpath -Wl,/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcryp=
t-native/1.11.1/recipe-sysroot-native/lib -Wl,-O1 -o keygrip keygrip.o  -L/=
var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.=
1/recipe-sysroot-native/usr/lib -L/var/home/frh/tezi-master/build/tmp/work/=
x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/lib ../src/.libs=
/libgcrypt.so -L/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgc=
rypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib=
 ../compat/.libs/libcompat.a -lgpg-error -lcap -Wl,-rpath -Wl,/var/home/frh=
/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/build/src/=
=2Elibs
libtool: link: gcc -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/=
libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../us=
r/include -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/lib=
gcrypt-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibili=
ty=3Dhidden -fno-delete-null-pointer-checks -Wall -Wl,--enable-new-dtags -W=
l,-rpath-link -Wl,/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/lib=
gcrypt-native/1.11.1/recipe-sysroot-native/usr/lib -Wl,-rpath-link -Wl,/var=
/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/r=
ecipe-sysroot-native/lib -Wl,-rpath -Wl,/var/home/frh/tezi-master/build/tmp=
/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib -W=
l,-rpath -Wl,/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcryp=
t-native/1.11.1/recipe-sysroot-native/lib -Wl,-O1 -o t-mlkem t-mlkem.o  -L/=
var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.=
1/recipe-sysroot-native/usr/lib -L/var/home/frh/tezi-master/build/tmp/work/=
x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/lib ../src/.libs=
/libgcrypt.so -L/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgc=
rypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib=
 ../compat/.libs/libcompat.a -lgpg-error -lcap -Wl,-rpath -Wl,/var/home/frh=
/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/build/src/=
=2Elibs
libtool: link: gcc -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/=
libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../us=
r/include -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/lib=
gcrypt-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibili=
ty=3Dhidden -fno-delete-null-pointer-checks -Wall -Wl,--enable-new-dtags -W=
l,-rpath-link -Wl,/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/lib=
gcrypt-native/1.11.1/recipe-sysroot-native/usr/lib -Wl,-rpath-link -Wl,/var=
/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/r=
ecipe-sysroot-native/lib -Wl,-rpath -Wl,/var/home/frh/tezi-master/build/tmp=
/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib -W=
l,-rpath -Wl,/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcryp=
t-native/1.11.1/recipe-sysroot-native/lib -Wl,-O1 -o t-x448 t-x448.o  -L/va=
r/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/=
recipe-sysroot-native/usr/lib -L/var/home/frh/tezi-master/build/tmp/work/x8=
6_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/lib ../src/.libs/l=
ibgcrypt.so -L/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcry=
pt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib .=
=2E/compat/.libs/libcompat.a -lgpg-error -lcap -Wl,-rpath -Wl,/var/home/frh=
/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/build/src/=
=2Elibs
libtool: link: gcc -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/=
libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../us=
r/include -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/lib=
gcrypt-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibili=
ty=3Dhidden -fno-delete-null-pointer-checks -Wall -Wl,--enable-new-dtags -W=
l,-rpath-link -Wl,/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/lib=
gcrypt-native/1.11.1/recipe-sysroot-native/usr/lib -Wl,-rpath-link -Wl,/var=
/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/r=
ecipe-sysroot-native/lib -Wl,-rpath -Wl,/var/home/frh/tezi-master/build/tmp=
/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib -W=
l,-rpath -Wl,/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcryp=
t-native/1.11.1/recipe-sysroot-native/lib -Wl,-O1 -o fips186-dsa fips186-ds=
a.o  -L/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-nati=
ve/1.11.1/recipe-sysroot-native/usr/lib -L/var/home/frh/tezi-master/build/t=
mp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/lib ../s=
rc/.libs/libgcrypt.so -L/var/home/frh/tezi-master/build/tmp/work/x86_64-lin=
ux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../..=
/usr/lib ../compat/.libs/libcompat.a -lgpg-error -lcap -Wl,-rpath -Wl,/var/=
home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/bu=
ild/src/.libs
libtool: link: gcc -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/=
libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../us=
r/include -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/lib=
gcrypt-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibili=
ty=3Dhidden -fno-delete-null-pointer-checks -Wall -Wl,--enable-new-dtags -W=
l,-rpath-link -Wl,/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/lib=
gcrypt-native/1.11.1/recipe-sysroot-native/usr/lib -Wl,-rpath-link -Wl,/var=
/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/r=
ecipe-sysroot-native/lib -Wl,-rpath -Wl,/var/home/frh/tezi-master/build/tmp=
/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib -W=
l,-rpath -Wl,/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcryp=
t-native/1.11.1/recipe-sysroot-native/lib -Wl,-O1 -o dsa-rfc6979 dsa-rfc697=
9.o  -L/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-nati=
ve/1.11.1/recipe-sysroot-native/usr/lib -L/var/home/frh/tezi-master/build/t=
mp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/lib ../s=
rc/.libs/libgcrypt.so -L/var/home/frh/tezi-master/build/tmp/work/x86_64-lin=
ux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../..=
/usr/lib ../compat/.libs/libcompat.a -lgpg-error -lcap -Wl,-rpath -Wl,/var/=
home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/bu=
ild/src/.libs
libtool: link: gcc -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/=
libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../us=
r/include -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/lib=
gcrypt-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibili=
ty=3Dhidden -fno-delete-null-pointer-checks -Wall -Wl,--enable-new-dtags -W=
l,-rpath-link -Wl,/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/lib=
gcrypt-native/1.11.1/recipe-sysroot-native/usr/lib -Wl,-rpath-link -Wl,/var=
/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/r=
ecipe-sysroot-native/lib -Wl,-rpath -Wl,/var/home/frh/tezi-master/build/tmp=
/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib -W=
l,-rpath -Wl,/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcryp=
t-native/1.11.1/recipe-sysroot-native/lib -Wl,-O1 -o t-cv25519 t-cv25519.o =
 -L/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1=
=2E11.1/recipe-sysroot-native/usr/lib -L/var/home/frh/tezi-master/build/tmp=
/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/lib ../src=
/.libs/libgcrypt.so -L/var/home/frh/tezi-master/build/tmp/work/x86_64-linux=
/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../u=
sr/lib ../compat/.libs/libcompat.a -lgpg-error -lcap -Wl,-rpath -Wl,/var/ho=
me/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/buil=
d/src/.libs
libtool: link: gcc -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/=
libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../us=
r/include -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/lib=
gcrypt-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibili=
ty=3Dhidden -fno-delete-null-pointer-checks -Wall -Wl,--enable-new-dtags -W=
l,-rpath-link -Wl,/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/lib=
gcrypt-native/1.11.1/recipe-sysroot-native/usr/lib -Wl,-rpath-link -Wl,/var=
/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/r=
ecipe-sysroot-native/lib -Wl,-rpath -Wl,/var/home/frh/tezi-master/build/tmp=
/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib -W=
l,-rpath -Wl,/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcryp=
t-native/1.11.1/recipe-sysroot-native/lib -Wl,-O1 -o t-kem t-kem.o  -L/var/=
home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/re=
cipe-sysroot-native/usr/lib -L/var/home/frh/tezi-master/build/tmp/work/x86_=
64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/lib ../src/.libs/lib=
gcrypt.so -L/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt=
-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib ../=
compat/.libs/libcompat.a -lgpg-error -lcap -Wl,-rpath -Wl,/var/home/frh/tez=
i-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/build/src/.libs
libtool: link: gcc -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/=
libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../us=
r/include -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/lib=
gcrypt-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibili=
ty=3Dhidden -fno-delete-null-pointer-checks -Wall -Wl,--enable-new-dtags -W=
l,-rpath-link -Wl,/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/lib=
gcrypt-native/1.11.1/recipe-sysroot-native/usr/lib -Wl,-rpath-link -Wl,/var=
/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/r=
ecipe-sysroot-native/lib -Wl,-rpath -Wl,/var/home/frh/tezi-master/build/tmp=
/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib -W=
l,-rpath -Wl,/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcryp=
t-native/1.11.1/recipe-sysroot-native/lib -Wl,-O1 -o hashtest hashtest.o  -=
L/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.1=
1.1/recipe-sysroot-native/usr/lib -L/var/home/frh/tezi-master/build/tmp/wor=
k/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/lib ../src/.li=
bs/libgcrypt.so -L/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/lib=
gcrypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/l=
ib ../compat/.libs/libcompat.a -lgpg-error -lcap -Wl,-rpath -Wl,/var/home/f=
rh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/build/sr=
c/.libs
libtool: link: gcc -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/=
libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../us=
r/include -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/lib=
gcrypt-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibili=
ty=3Dhidden -fno-delete-null-pointer-checks -Wall -Wl,--enable-new-dtags -W=
l,-rpath-link -Wl,/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/lib=
gcrypt-native/1.11.1/recipe-sysroot-native/usr/lib -Wl,-rpath-link -Wl,/var=
/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/r=
ecipe-sysroot-native/lib -Wl,-rpath -Wl,/var/home/frh/tezi-master/build/tmp=
/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib -W=
l,-rpath -Wl,/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcryp=
t-native/1.11.1/recipe-sysroot-native/lib -Wl,-O1 -o t-rsa-pss t-rsa-pss.o =
 -L/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1=
=2E11.1/recipe-sysroot-native/usr/lib -L/var/home/frh/tezi-master/build/tmp=
/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/lib ../src=
/.libs/libgcrypt.so -L/var/home/frh/tezi-master/build/tmp/work/x86_64-linux=
/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../u=
sr/lib ../compat/.libs/libcompat.a -lgpg-error -lcap -Wl,-rpath -Wl,/var/ho=
me/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/buil=
d/src/.libs
libtool: link: gcc -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/=
libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../us=
r/include -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/lib=
gcrypt-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibili=
ty=3Dhidden -fno-delete-null-pointer-checks -Wall -Wl,--enable-new-dtags -W=
l,-rpath-link -Wl,/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/lib=
gcrypt-native/1.11.1/recipe-sysroot-native/usr/lib -Wl,-rpath-link -Wl,/var=
/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/r=
ecipe-sysroot-native/lib -Wl,-rpath -Wl,/var/home/frh/tezi-master/build/tmp=
/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib -W=
l,-rpath -Wl,/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcryp=
t-native/1.11.1/recipe-sysroot-native/lib -Wl,-O1 -o mpitests mpitests.o  -=
L/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.1=
1.1/recipe-sysroot-native/usr/lib -L/var/home/frh/tezi-master/build/tmp/wor=
k/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/lib ../src/.li=
bs/libgcrypt.so -L/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/lib=
gcrypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/l=
ib ../compat/.libs/libcompat.a -lgpg-error -lcap -Wl,-rpath -Wl,/var/home/f=
rh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/build/sr=
c/.libs
libtool: link: gcc -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/=
libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../us=
r/include -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/lib=
gcrypt-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibili=
ty=3Dhidden -fno-delete-null-pointer-checks -Wall -Wl,--enable-new-dtags -W=
l,-rpath-link -Wl,/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/lib=
gcrypt-native/1.11.1/recipe-sysroot-native/usr/lib -Wl,-rpath-link -Wl,/var=
/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/r=
ecipe-sysroot-native/lib -Wl,-rpath -Wl,/var/home/frh/tezi-master/build/tmp=
/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib -W=
l,-rpath -Wl,/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcryp=
t-native/1.11.1/recipe-sysroot-native/lib -Wl,-O1 -o t-ed25519 t-ed25519.o =
 -L/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1=
=2E11.1/recipe-sysroot-native/usr/lib -L/var/home/frh/tezi-master/build/tmp=
/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/lib ../src=
/.libs/libgcrypt.so -L/var/home/frh/tezi-master/build/tmp/work/x86_64-linux=
/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../u=
sr/lib ../compat/.libs/libcompat.a -lgpg-error -lcap -Wl,-rpath -Wl,/var/ho=
me/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/buil=
d/src/.libs
libtool: link: gcc -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/=
libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../us=
r/include -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/lib=
gcrypt-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibili=
ty=3Dhidden -fno-delete-null-pointer-checks -Wall -Wl,--enable-new-dtags -W=
l,-rpath-link -Wl,/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/lib=
gcrypt-native/1.11.1/recipe-sysroot-native/usr/lib -Wl,-rpath-link -Wl,/var=
/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/r=
ecipe-sysroot-native/lib -Wl,-rpath -Wl,/var/home/frh/tezi-master/build/tmp=
/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib -W=
l,-rpath -Wl,/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcryp=
t-native/1.11.1/recipe-sysroot-native/lib -Wl,-O1 -o aeswrap aeswrap.o  -L/=
var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.=
1/recipe-sysroot-native/usr/lib -L/var/home/frh/tezi-master/build/tmp/work/=
x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/lib ../src/.libs=
/libgcrypt.so -L/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgc=
rypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib=
 ../compat/.libs/libcompat.a -lgpg-error -lcap -Wl,-rpath -Wl,/var/home/frh=
/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/build/src/=
=2Elibs
libtool: link: gcc -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/=
libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../us=
r/include -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/lib=
gcrypt-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibili=
ty=3Dhidden -fno-delete-null-pointer-checks -Wall -Wl,--enable-new-dtags -W=
l,-rpath-link -Wl,/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/lib=
gcrypt-native/1.11.1/recipe-sysroot-native/usr/lib -Wl,-rpath-link -Wl,/var=
/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/r=
ecipe-sysroot-native/lib -Wl,-rpath -Wl,/var/home/frh/tezi-master/build/tmp=
/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib -W=
l,-rpath -Wl,/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcryp=
t-native/1.11.1/recipe-sysroot-native/lib -Wl,-O1 -o t-ed448 t-ed448.o  -L/=
var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.=
1/recipe-sysroot-native/usr/lib -L/var/home/frh/tezi-master/build/tmp/work/=
x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/lib ../src/.libs=
/libgcrypt.so -L/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgc=
rypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib=
 ../compat/.libs/libcompat.a -lgpg-error -lcap -Wl,-rpath -Wl,/var/home/frh=
/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/build/src/=
=2Elibs
libtool: link: gcc -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/=
libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../us=
r/include -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/lib=
gcrypt-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibili=
ty=3Dhidden -fno-delete-null-pointer-checks -Wall -Wl,--enable-new-dtags -W=
l,-rpath-link -Wl,/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/lib=
gcrypt-native/1.11.1/recipe-sysroot-native/usr/lib -Wl,-rpath-link -Wl,/var=
/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/r=
ecipe-sysroot-native/lib -Wl,-rpath -Wl,/var/home/frh/tezi-master/build/tmp=
/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib -W=
l,-rpath -Wl,/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcryp=
t-native/1.11.1/recipe-sysroot-native/lib -Wl,-O1 -o t-convert t-convert.o =
 -L/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1=
=2E11.1/recipe-sysroot-native/usr/lib -L/var/home/frh/tezi-master/build/tmp=
/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/lib ../src=
/.libs/libgcrypt.so -L/var/home/frh/tezi-master/build/tmp/work/x86_64-linux=
/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../u=
sr/lib ../compat/.libs/libcompat.a -lgpg-error -lcap -Wl,-rpath -Wl,/var/ho=
me/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/buil=
d/src/.libs
libtool: link: gcc -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/=
libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../us=
r/include -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/lib=
gcrypt-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibili=
ty=3Dhidden -fno-delete-null-pointer-checks -Wall -Wl,--enable-new-dtags -W=
l,-rpath-link -Wl,/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/lib=
gcrypt-native/1.11.1/recipe-sysroot-native/usr/lib -Wl,-rpath-link -Wl,/var=
/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/r=
ecipe-sysroot-native/lib -Wl,-rpath -Wl,/var/home/frh/tezi-master/build/tmp=
/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib -W=
l,-rpath -Wl,/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcryp=
t-native/1.11.1/recipe-sysroot-native/lib -Wl,-O1 -o random random.o  -L/va=
r/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/=
recipe-sysroot-native/usr/lib -L/var/home/frh/tezi-master/build/tmp/work/x8=
6_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/lib ../src/.libs/l=
ibgcrypt.so -L/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcry=
pt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib .=
=2E/compat/.libs/libcompat.a -lgpg-error -lcap -Wl,-rpath -Wl,/var/home/frh=
/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/build/src/=
=2Elibs
libtool: link: gcc -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/=
libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../us=
r/include -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/lib=
gcrypt-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibili=
ty=3Dhidden -fno-delete-null-pointer-checks -Wall -Wl,--enable-new-dtags -W=
l,-rpath-link -Wl,/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/lib=
gcrypt-native/1.11.1/recipe-sysroot-native/usr/lib -Wl,-rpath-link -Wl,/var=
/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/r=
ecipe-sysroot-native/lib -Wl,-rpath -Wl,/var/home/frh/tezi-master/build/tmp=
/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib -W=
l,-rpath -Wl,/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcryp=
t-native/1.11.1/recipe-sysroot-native/lib -Wl,-O1 -o t-rsa-15 t-rsa-15.o  -=
L/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.1=
1.1/recipe-sysroot-native/usr/lib -L/var/home/frh/tezi-master/build/tmp/wor=
k/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/lib ../src/.li=
bs/libgcrypt.so -L/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/lib=
gcrypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/l=
ib ../compat/.libs/libcompat.a -lgpg-error -lcap -Wl,-rpath -Wl,/var/home/f=
rh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/build/sr=
c/.libs
libtool: link: gcc -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-=
linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -=
fvisibility=3Dhidden -fno-delete-null-pointer-checks -Wall -Wl,--enable-new=
-dtags -Wl,-rpath-link -Wl,/var/home/frh/tezi-master/build/tmp/work/x86_64-=
linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib -Wl,-rpath-link=
 -Wl,/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native=
/1.11.1/recipe-sysroot-native/lib -Wl,-rpath -Wl,/var/home/frh/tezi-master/=
build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/u=
sr/lib -Wl,-rpath -Wl,/var/home/frh/tezi-master/build/tmp/work/x86_64-linux=
/libgcrypt-native/1.11.1/recipe-sysroot-native/lib -Wl,-O1 -o t-kdf t_kdf-t=
-kdf.o  -lpthread -L/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/l=
ibgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib -L/var/home/frh/tezi-m=
aster/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-na=
tive/lib ../src/.libs/libgcrypt.so -L/var/home/frh/tezi-master/build/tmp/wo=
rk/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgco=
nfig/../../../usr/lib -lgpg-error ../compat/.libs/libcompat.a -lcap -Wl,-rp=
ath -Wl,/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-nat=
ive/1.11.1/build/src/.libs
libtool: link: gcc -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/=
libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../us=
r/include -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/lib=
gcrypt-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibili=
ty=3Dhidden -fno-delete-null-pointer-checks -Wall -Wl,--enable-new-dtags -W=
l,-rpath-link -Wl,/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/lib=
gcrypt-native/1.11.1/recipe-sysroot-native/usr/lib -Wl,-rpath-link -Wl,/var=
/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/r=
ecipe-sysroot-native/lib -Wl,-rpath -Wl,/var/home/frh/tezi-master/build/tmp=
/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib -W=
l,-rpath -Wl,/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcryp=
t-native/1.11.1/recipe-sysroot-native/lib -Wl,-O1 -o keygen keygen.o  -L/va=
r/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/=
recipe-sysroot-native/usr/lib -L/var/home/frh/tezi-master/build/tmp/work/x8=
6_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/lib ../src/.libs/l=
ibgcrypt.so -L/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcry=
pt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib .=
=2E/compat/.libs/libcompat.a -lgpg-error -lcap -Wl,-rpath -Wl,/var/home/frh=
/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/build/src/=
=2Elibs
libtool: link: gcc -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/=
libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../us=
r/include -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/lib=
gcrypt-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibili=
ty=3Dhidden -fno-delete-null-pointer-checks -Wall -Wl,--enable-new-dtags -W=
l,-rpath-link -Wl,/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/lib=
gcrypt-native/1.11.1/recipe-sysroot-native/usr/lib -Wl,-rpath-link -Wl,/var=
/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/r=
ecipe-sysroot-native/lib -Wl,-rpath -Wl,/var/home/frh/tezi-master/build/tmp=
/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib -W=
l,-rpath -Wl,/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcryp=
t-native/1.11.1/recipe-sysroot-native/lib -Wl,-O1 -o t-dsa t-dsa.o  -L/var/=
home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/re=
cipe-sysroot-native/usr/lib -L/var/home/frh/tezi-master/build/tmp/work/x86_=
64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/lib ../src/.libs/lib=
gcrypt.so -L/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt=
-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib ../=
compat/.libs/libcompat.a -lgpg-error -lcap -Wl,-rpath -Wl,/var/home/frh/tez=
i-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/build/src/.libs
libtool: link: gcc -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/=
libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../us=
r/include -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/lib=
gcrypt-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibili=
ty=3Dhidden -fno-delete-null-pointer-checks -Wall -Wl,--enable-new-dtags -W=
l,-rpath-link -Wl,/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/lib=
gcrypt-native/1.11.1/recipe-sysroot-native/usr/lib -Wl,-rpath-link -Wl,/var=
/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/r=
ecipe-sysroot-native/lib -Wl,-rpath -Wl,/var/home/frh/tezi-master/build/tmp=
/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib -W=
l,-rpath -Wl,/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcryp=
t-native/1.11.1/recipe-sysroot-native/lib -Wl,-O1 -o pubkey pubkey.o  -L/va=
r/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/=
recipe-sysroot-native/usr/lib -L/var/home/frh/tezi-master/build/tmp/work/x8=
6_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/lib ../src/.libs/l=
ibgcrypt.so -L/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcry=
pt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib .=
=2E/compat/.libs/libcompat.a -lgpg-error -lcap -Wl,-rpath -Wl,/var/home/frh=
/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/build/src/=
=2Elibs
libtool: link: gcc -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/=
libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../us=
r/include -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/lib=
gcrypt-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibili=
ty=3Dhidden -fno-delete-null-pointer-checks -Wall -Wl,--enable-new-dtags -W=
l,-rpath-link -Wl,/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/lib=
gcrypt-native/1.11.1/recipe-sysroot-native/usr/lib -Wl,-rpath-link -Wl,/var=
/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/r=
ecipe-sysroot-native/lib -Wl,-rpath -Wl,/var/home/frh/tezi-master/build/tmp=
/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib -W=
l,-rpath -Wl,/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcryp=
t-native/1.11.1/recipe-sysroot-native/lib -Wl,-O1 -o t-fips-service-ind t-f=
ips-service-ind.o  -L/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/=
libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib -L/var/home/frh/tezi-=
master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-n=
ative/lib ../src/.libs/libgcrypt.so -L/var/home/frh/tezi-master/build/tmp/w=
ork/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgc=
onfig/../../../usr/lib ../compat/.libs/libcompat.a -lgpg-error -lcap -Wl,-r=
path -Wl,/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-na=
tive/1.11.1/build/src/.libs
libtool: link: gcc -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/=
libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../us=
r/include -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/lib=
gcrypt-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibili=
ty=3Dhidden -fno-delete-null-pointer-checks -Wall -Wl,--enable-new-dtags -W=
l,-rpath-link -Wl,/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/lib=
gcrypt-native/1.11.1/recipe-sysroot-native/usr/lib -Wl,-rpath-link -Wl,/var=
/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/r=
ecipe-sysroot-native/lib -Wl,-rpath -Wl,/var/home/frh/tezi-master/build/tmp=
/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib -W=
l,-rpath -Wl,/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcryp=
t-native/1.11.1/recipe-sysroot-native/lib -Wl,-O1 -o t-ecdsa t-ecdsa.o  -L/=
var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.=
1/recipe-sysroot-native/usr/lib -L/var/home/frh/tezi-master/build/tmp/work/=
x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/lib ../src/.libs=
/libgcrypt.so -L/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgc=
rypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib=
 ../compat/.libs/libcompat.a -lgpg-error -lcap -Wl,-rpath -Wl,/var/home/frh=
/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/build/src/=
=2Elibs
libtool: link: gcc -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/=
libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../us=
r/include -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/lib=
gcrypt-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibili=
ty=3Dhidden -fno-delete-null-pointer-checks -Wall -Wl,--enable-new-dtags -W=
l,-rpath-link -Wl,/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/lib=
gcrypt-native/1.11.1/recipe-sysroot-native/usr/lib -Wl,-rpath-link -Wl,/var=
/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/r=
ecipe-sysroot-native/lib -Wl,-rpath -Wl,/var/home/frh/tezi-master/build/tmp=
/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib -W=
l,-rpath -Wl,/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcryp=
t-native/1.11.1/recipe-sysroot-native/lib -Wl,-O1 -o t-sexp t-sexp.o  -L/va=
r/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/=
recipe-sysroot-native/usr/lib -L/var/home/frh/tezi-master/build/tmp/work/x8=
6_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/lib ../src/.libs/l=
ibgcrypt.so -L/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcry=
pt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib .=
=2E/compat/.libs/libcompat.a -lgpg-error -lcap -Wl,-rpath -Wl,/var/home/frh=
/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/build/src/=
=2Elibs
libtool: link: gcc -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/=
libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../us=
r/include -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/lib=
gcrypt-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibili=
ty=3Dhidden -fno-delete-null-pointer-checks -Wall -Wl,--enable-new-dtags -W=
l,-rpath-link -Wl,/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/lib=
gcrypt-native/1.11.1/recipe-sysroot-native/usr/lib -Wl,-rpath-link -Wl,/var=
/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/r=
ecipe-sysroot-native/lib -Wl,-rpath -Wl,/var/home/frh/tezi-master/build/tmp=
/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib -W=
l,-rpath -Wl,/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcryp=
t-native/1.11.1/recipe-sysroot-native/lib -Wl,-O1 -o pkcs1v2 pkcs1v2.o  -L/=
var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.=
1/recipe-sysroot-native/usr/lib -L/var/home/frh/tezi-master/build/tmp/work/=
x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/lib ../src/.libs=
/libgcrypt.so -L/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgc=
rypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib=
 ../compat/.libs/libcompat.a -lgpg-error -lcap -Wl,-rpath -Wl,/var/home/frh=
/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/build/src/=
=2Elibs
libtool: link: gcc -I/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/=
libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../../us=
r/include -isystem/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/lib=
gcrypt-native/1.11.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibili=
ty=3Dhidden -fno-delete-null-pointer-checks -Wall -Wl,--enable-new-dtags -W=
l,-rpath-link -Wl,/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/lib=
gcrypt-native/1.11.1/recipe-sysroot-native/usr/lib -Wl,-rpath-link -Wl,/var=
/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/r=
ecipe-sysroot-native/lib -Wl,-rpath -Wl,/var/home/frh/tezi-master/build/tmp=
/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib -W=
l,-rpath -Wl,/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcryp=
t-native/1.11.1/recipe-sysroot-native/lib -Wl,-O1 -o t-mpi-point t-mpi-poin=
t.o  -L/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-nati=
ve/1.11.1/recipe-sysroot-native/usr/lib -L/var/home/frh/tezi-master/build/t=
mp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/lib ../s=
rc/.libs/libgcrypt.so -L/var/home/frh/tezi-master/build/tmp/work/x86_64-lin=
ux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/lib/pkgconfig/../../..=
/usr/lib ../compat/.libs/libcompat.a -lgpg-error -lcap -Wl,-rpath -Wl,/var/=
home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/bu=
ild/src/.libs
make[2]: Leaving directory '/var/home/frh/tezi-master/build/tmp/work/x86_64=
-linux/libgcrypt-native/1.11.1/build/tests'
make[1]: Leaving directory '/var/home/frh/tezi-master/build/tmp/work/x86_64=
-linux/libgcrypt-native/1.11.1/build'
make[1]: *** [Makefile:507: all-recursive] Error 1
make: *** [Makefile:439: all] Error 2
ERROR: oe_runmake failed
WARNING: exit code 1 from a shell command.

--7bje32ga6qu3snwm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="log.do_configure.2912626"
Content-Transfer-Encoding: quoted-printable

DEBUG: Executing python function extend_recipe_sysroot
NOTE: Direct dependencies are ['/var/home/frh/tezi-master/build/../layers/o=
penembedded-core/meta/recipes-devtools/libtool/libtool-native_2.5.4.bb:do_p=
opulate_sysroot', '/var/home/frh/tezi-master/build/../layers/openembedded-c=
ore/meta/recipes-devtools/quilt/quilt-native_0.68.bb:do_populate_sysroot', =
'/var/home/frh/tezi-master/build/../layers/openembedded-core/meta/recipes-e=
xtended/texinfo-dummy-native/texinfo-dummy-native.bb:do_populate_sysroot', =
'virtual:native:/var/home/frh/tezi-master/build/../layers/openembedded-core=
/meta/recipes-devtools/autoconf/autoconf_2.72.bb:do_populate_sysroot', 'vir=
tual:native:/var/home/frh/tezi-master/build/../layers/openembedded-core/met=
a/recipes-devtools/automake/automake_1.17.bb:do_populate_sysroot', 'virtual=
:native:/var/home/frh/tezi-master/build/../layers/openembedded-core/meta/re=
cipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:na=
tive:/var/home/frh/tezi-master/build/../layers/openembedded-core/meta/recip=
es-support/libcap/libcap_2.76.bb:do_populate_sysroot', 'virtual:native:/var=
/home/frh/tezi-master/build/../layers/openembedded-core/meta/recipes-suppor=
t/libgpg-error/libgpg-error_1.55.bb:do_populate_sysroot']
NOTE: Installed into sysroot: []
NOTE: Skipping as already exists in sysroot: ['gettext-minimal-native', 'li=
btool-native', 'm4-native', 'quilt-native', 'texinfo-dummy-native', 'autoco=
nf-native', 'automake-native', 'gnu-config-native', 'pkgconfig-native', 'xz=
-native', 'libcap-native', 'libgpg-error-native']
DEBUG: Python function extend_recipe_sysroot finished
DEBUG: Executing shell function autotools_preconfigure
DEBUG: Shell function autotools_preconfigure finished
DEBUG: Executing python function autotools_sitefiles
DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc', 'bit-64=
', 'x86_64-linux', 'common']
DEBUG: Python function autotools_sitefiles finished
DEBUG: Executing shell function do_configure
NOTE: Removing existing aclocal.m4
NOTE: Executing ACLOCAL=3D"aclocal --aclocal-path=3D/var/home/frh/tezi-mast=
er/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nativ=
e/usr/share/aclocal/" autoreconf -Wcross --verbose --install --force --excl=
ude=3Dautopoint
autoreconf: export WARNINGS=3Dcross,no-obsolete
autoreconf: Entering directory '.'
autoreconf: configure.ac: not using Gettext
autoreconf: running: aclocal --aclocal-path=3D/var/home/frh/tezi-master/bui=
ld/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/=
share/aclocal/ --force -I m4
autoreconf: configure.ac: tracing
autoreconf: running: libtoolize --copy --force
libtoolize: putting auxiliary files in AC_CONFIG_AUX_DIR, 'build-aux'.
libtoolize: copying file 'build-aux/ltmain.sh'
libtoolize: putting macros in AC_CONFIG_MACRO_DIRS, 'm4'.
libtoolize: copying file 'm4/libtool.m4'
libtoolize: copying file 'm4/ltoptions.m4'
libtoolize: copying file 'm4/ltsugar.m4'
libtoolize: copying file 'm4/ltversion.m4'
libtoolize: copying file 'm4/lt~obsolete.m4'
autoreconf: configure.ac: not using Intltool
autoreconf: configure.ac: not using Gtkdoc
autoreconf: running: aclocal --aclocal-path=3D/var/home/frh/tezi-master/bui=
ld/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/=
share/aclocal/ --force -I m4
autoreconf: running: /var/home/frh/tezi-master/build/tmp/work/x86_64-linux/=
libgcrypt-native/1.11.1/recipe-sysroot-native/usr/bin/autoconf --force
autoreconf: running: /var/home/frh/tezi-master/build/tmp/work/x86_64-linux/=
libgcrypt-native/1.11.1/recipe-sysroot-native/usr/bin/autoheader --force
autoreconf: running: automake --add-missing --copy --force-missing
configure.ac:86: installing 'build-aux/compile'
configure.ac:79: installing 'build-aux/missing'
cipher/Makefile.am: installing 'build-aux/depcomp'
autoreconf: 'build-aux/config.sub' is updated
autoreconf: 'build-aux/config.guess' is updated
autoreconf: Leaving directory '.'
NOTE: Running ../libgcrypt-1.11.1/configure  --build=3Dx86_64-linux 		  --h=
ost=3Dx86_64-linux 		  --target=3Dx86_64-linux 		  --prefix=3D/var/home/frh=
/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sys=
root-native/usr 		  --exec_prefix=3D/var/home/frh/tezi-master/build/tmp/wor=
k/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr 		  --bind=
ir=3D/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native=
/1.11.1/recipe-sysroot-native/usr/bin 		  --sbindir=3D/var/home/frh/tezi-ma=
ster/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-nat=
ive/usr/sbin 		  --libexecdir=3D/var/home/frh/tezi-master/build/tmp/work/x8=
6_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/libexec 		  --=
datadir=3D/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-n=
ative/1.11.1/recipe-sysroot-native/usr/share 		  --sysconfdir=3D/var/home/f=
rh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-s=
ysroot-native/etc 		  --sharedstatedir=3D/var/home/frh/tezi-master/build/tm=
p/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/com 		  -=
-localstatedir=3D/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libg=
crypt-native/1.11.1/recipe-sysroot-native/var 		  --libdir=3D/var/home/frh/=
tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysr=
oot-native/usr/lib 		  --includedir=3D/var/home/frh/tezi-master/build/tmp/w=
ork/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/include =
		  --oldincludedir=3D/var/home/frh/tezi-master/build/tmp/work/x86_64-linux=
/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/include 		  --infodir=3D=
/var/home/frh/tezi-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11=
=2E1/recipe-sysroot-native/usr/share/info 		  --mandir=3D/var/home/frh/tezi=
-master/build/tmp/work/x86_64-linux/libgcrypt-native/1.11.1/recipe-sysroot-=
native/usr/share/man 		  --disable-silent-rules 		  --disable-dependency-tr=
acking --disable-asm  --with-capabilities=20
configure: loading site script /var/home/frh/tezi-master/build/../layers/op=
enembedded-core/meta/site/endian-little
configure: loading site script /var/home/frh/tezi-master/build/../layers/op=
enembedded-core/meta/site/common-linux
configure: loading site script /var/home/frh/tezi-master/build/../layers/op=
enembedded-core/meta/site/common-glibc
configure: loading site script /var/home/frh/tezi-master/build/../layers/op=
enembedded-core/meta/site/x86_64-linux
configure: loading site script /var/home/frh/tezi-master/build/../layers/op=
enembedded-core/meta/site/common
checking for a BSD-compatible install... /var/home/frh/tezi-master/build/tm=
p/hosttools/install -c
checking whether sleep supports fractional seconds... yes
checking filesystem timestamp resolution... 0.01
checking whether build environment is sane... yes
checking for a race-free mkdir -p... /var/home/frh/tezi-master/build/tmp/ho=
sttools/mkdir -p
checking for gawk... gawk
checking whether make sets $(MAKE)... yes
checking whether make supports nested variables... yes
checking xargs -n works... yes
checking build system type... x86_64-pc-linux-gnu
checking host system type... x86_64-pc-linux-gnu
checking whether to enable maintainer-specific portions of Makefiles... no
checking whether make supports the include directive... yes (GNU style)
checking for x86_64-linux-gcc... gcc=20
checking whether the C compiler works... yes
checking for C compiler default output file name... a.out
checking for suffix of executables...=20
checking whether we are cross compiling... no
checking for suffix of object files... o
checking whether the compiler supports GNU C... yes
checking whether gcc  accepts -g... yes
checking for gcc  option to enable C11 features... none needed
checking whether gcc  understands -c and -o together... yes
checking dependency style of gcc ... none
checking for stdio.h... yes
checking for stdlib.h... yes
checking for string.h... yes
checking for inttypes.h... yes
checking for stdint.h... yes
checking for strings.h... yes
checking for sys/stat.h... yes
checking for sys/types.h... yes
checking for unistd.h... yes
checking for wchar.h... yes
checking for minix/config.h... no
checking whether it is safe to define __EXTENSIONS__... yes
checking whether _XOPEN_SOURCE should be defined... no
checking whether make sets $(MAKE)... (cached) yes
checking for x86_64-linux-gcc... (cached) gcc=20
checking whether the compiler supports GNU C... (cached) yes
checking whether gcc  accepts -g... (cached) yes
checking for gcc  option to enable C11 features... (cached) none needed
checking whether gcc  understands -c and -o together... (cached) yes
checking dependency style of gcc ... (cached) none
checking how to run the C preprocessor... gcc  -E
checking dependency style of gcc ... none
checking for library containing strerror... none required
checking for gawk... (cached) gawk
checking for grep that handles long lines and -e... /var/home/frh/tezi-mast=
er/build/tmp/hosttools/grep
checking for fgrep... /var/home/frh/tezi-master/build/tmp/hosttools/grep -F
checking how to print strings... printf
checking for a sed that does not truncate output... (cached) sed
checking for egrep... /var/home/frh/tezi-master/build/tmp/hosttools/grep -E
checking for ld used by gcc ... ld=20
checking if the linker (ld ) is GNU ld... yes
checking for BSD- or MS-compatible name lister (nm)... nm
checking the name lister (nm) interface... BSD nm
checking whether ln -s works... yes
checking the maximum length of command line arguments... 1572864
checking how to convert x86_64-pc-linux-gnu file names to x86_64-pc-linux-g=
nu format... func_convert_file_noop
checking how to convert x86_64-pc-linux-gnu file names to toolchain format.=
=2E. func_convert_file_noop
checking for ld  option to reload object files... -r
checking for file... file
checking for x86_64-linux-objdump... objdump
checking how to recognize dependent libraries... pass_all
checking for x86_64-linux-dlltool... no
checking for dlltool... no
checking how to associate runtime and link libraries... printf %s\n
checking for x86_64-linux-ranlib... ranlib -D
checking for x86_64-linux-ar... ar
checking for archiver @FILE support... @
checking for x86_64-linux-strip... strip
checking command to parse nm output from gcc  object... ok
checking for sysroot... no
checking for a working dd... /var/home/frh/tezi-master/build/tmp/hosttools/=
dd
checking how to truncate binary pipes... /var/home/frh/tezi-master/build/tm=
p/hosttools/dd bs=3D4096 count=3D1
checking for x86_64-linux-mt... no
checking for mt... no
checking if : is a manifest tool... no
checking for dlfcn.h... yes
checking for objdir... .libs
checking if gcc  supports -fno-rtti -fno-exceptions... no
checking for gcc  option to produce PIC... -fPIC -DPIC
checking if gcc  PIC flag -fPIC -DPIC works... yes
checking if gcc  static flag -static works... yes
checking if gcc  supports -c -o file.o... yes
checking if gcc  supports -c -o file.o... (cached) yes
checking whether the gcc  linker (ld  -m elf_x86_64) supports shared librar=
ies... yes
checking whether -lc should be explicitly linked in... no
checking dynamic linker characteristics... GNU/Linux ld.so
checking how to hardcode library paths into programs... immediate
checking whether stripping libraries is possible... yes
checking if libtool supports shared libraries... yes
checking whether to build shared libraries... yes
checking whether to build static libraries... no
checking for x86_64-linux-windres... no
checking for windres... no
checking whether byte ordering is bigendian... (cached) no
checking size of unsigned short... (cached) 2
checking size of unsigned int... (cached) 4
checking size of unsigned long... (cached) 8
checking size of unsigned long long... 8
checking size of unsigned __int128... 16
checking size of void *... (cached) 8
checking for uintptr_t... yes
checking for UINT64_C... yes
checking size of uint64_t... 8
checking which symmetric ciphers to include... arcfour blowfish cast5 des a=
es twofish serpent rfc2268 seed camellia idea salsa20 gost28147 chacha20 sm=
4 aria
checking which public-key ciphers to include... dsa elgamal rsa ecc kyber
checking which message digests to include... crc gostr3411-94  md4 md5 rmd1=
60 sha1 sha256 sha512 sha3 tiger whirlpool stribog blake2 sm3
checking which key derivation functions to include... s2k pkdf2 scrypt
checking which random module to use... default
checking whether use of /dev/random is requested... yes
checking whether MPI and cipher assembler modules are requested... no
checking whether to run large data tests... no
checking whether 'soft' HW feature bits are forced on... no
checking whether use of capabilities is requested... yes
checking whether a HMAC binary check is requested... no
checking whether jitter entropy support is requested... yes
checking whether padlock support is requested... yes
checking whether AESNI support is requested... yes
checking whether SHAEXT support is requested... yes
checking whether PCLMUL support is requested... yes
checking whether SSE4.1 support is requested... yes
checking whether DRNG support is requested... yes
checking whether AVX support is requested... yes
checking whether AVX2 support is requested... yes
checking whether AVX512 support is requested... yes
checking whether GFNI support is requested... yes
checking whether NEON support is requested... yes
checking whether ARMv8 Crypto Extension support is requested... yes
checking whether SVE support is requested... yes
checking whether SVE2 support is requested... yes
checking whether PPC crypto support is requested... yes
checking whether a -O flag munging is requested... yes
checking whether a instrumentation (-fprofile, -fsanitize) munging is reque=
sted... yes
checking whether to enable AMD64 as(1) feature detection... yes
checking for x86_64-linux-pkg-config... no
checking for pkg-config... /var/home/frh/tezi-master/build/tmp/work/x86_64-=
linux/libgcrypt-native/1.11.1/recipe-sysroot-native/usr/bin/pkg-config
checking pkg-config is at least version 0.9.0... yes
checking for gpg-error >=3D 1.49... yes
checking for pthread_create in -lpthread... yes
checking for library containing setsockopt... none required
checking for library containing setsockopt... (cached) none required
checking for unistd.h... (cached) yes
checking for sys/auxv.h... yes
checking for sys/random.h... yes
checking for sys/sysctl.h... yes
checking for an ANSI C-conforming const... yes
checking for inline... inline
checking for size_t... yes
checking for pid_t... yes
checking for byte... no
checking for ushort... yes
checking for u16... no
checking for u32... no
checking for u64... no
checking for __builtin_bswap32... yes
checking for __builtin_bswap64... yes
checking for __builtin_ctz... yes
checking for __builtin_ctzl... yes
checking for __builtin_clz... yes
checking for __builtin_clzl... yes
checking for __sync_synchronize... yes
checking whether the variable length arrays are supported... yes
checking whether the visibility attribute is supported... yes
checking for broken visibility attribute... no
checking for broken alias attribute... no
checking if gcc supports -fvisibility=3Dhidden... yes
checking whether the GCC style aligned attribute is supported... yes
checking whether the GCC style packed attribute is supported... yes
checking whether the GCC style may_alias attribute is supported... yes
checking whether 'asm' assembler keyword is supported... yes
checking whether '__asm__' assembler keyword is supported... yes
checking whether inline assembly memory barrier is supported... yes
checking whether GCC assembler is compatible for ARM assembly implementatio=
ns... n/a
checking whether GCC assembler is compatible for ARMv8/Aarch64 assembly imp=
lementations... n/a
checking whether GCC assembler supports for CFI directives... yes
checking whether GCC assembler supports for ELF directives... yes
checking for _ prefix in compiled symbols... no
checking architecture and mpi assembler functions... disabled
checking whether compiler supports 'optimize' function attribute... yes
checking whether compiler supports 'ms_abi' function attribute... yes
checking whether compiler supports 'sysv_abi' function attribute... yes
checking whether default calling convention is 'ms_abi'... no
checking whether default calling convention is 'sysv_abi'... yes
checking whether compiler supports '__thread' storage class specifier... yes
checking whether GCC inline assembler supports SSSE3 instructions... n/a
checking whether GCC inline assembler supports PCLMUL instructions... n/a
checking whether GCC inline assembler supports SHA Extensions instructions.=
=2E. n/a
checking whether GCC inline assembler supports SSE4.1 instructions... n/a
checking whether GCC inline assembler supports AVX instructions... n/a
checking whether GCC inline assembler supports AVX2 instructions... n/a
checking whether GCC inline assembler supports AVX512 instructions... n/a
checking whether GCC inline assembler supports VAES and VPCLMUL instruction=
s... n/a
checking whether GCC inline assembler supports GFNI instructions... n/a
checking whether GCC inline assembler supports BMI2 instructions... n/a
checking whether compiler supports x86/AVX512 intrinsics... n/a
checking whether GCC assembler handles division correctly... yes
checking whether GCC assembler is compatible for i386/amd64 assembly implem=
entations... n/a
checking whether GCC assembler is compatible for Intel syntax assembly impl=
ementations... n/a
checking whether compiler is configured for ARMv6 or newer architecture... =
n/a
checking whether GCC inline assembler supports NEON instructions... n/a
checking whether GCC inline assembler supports AArch32 Crypto Extension ins=
tructions... n/a
checking whether GCC inline assembler supports AArch64 NEON instructions...=
 n/a
checking whether GCC inline assembler supports AArch64 Crypto Extension ins=
tructions... n/a
checking whether GCC inline assembler supports AArch64 SVE instructions... =
n/a
checking whether GCC inline assembler supports AArch64 SVE2 instructions...=
 n/a
checking whether GCC inline assembler supports AArch64 SHA3/SHA512/SM3/SM4 =
instructions... n/a
checking whether compiler supports AArch64/NEON/crypto intrinsics... n/a
checking whether compiler supports PowerPC AltiVec/VSX/crypto intrinsics...=
 n/a
checking whether GCC inline assembler supports PowerPC AltiVec/VSX/crypto i=
nstructions... n/a
checking whether GCC inline assembler supports PowerISA 3.00 instructions..=
=2E n/a
checking whether compiler supports GCC PowerPC target attributes... n/a
checking whether compiler supports clang PowerPC target attributes... n/a
checking whether GCC inline assembler supports zSeries instructions... n/a
checking whether GCC inline assembler supports zSeries vector instructions.=
=2E. n/a
checking whether GCC inline assembler supports RISC-V instructions... n/a
checking whether GCC inline assembler supports RISC-V vector instructions..=
=2E n/a
checking whether compiler supports RISC-V vector intrinsics... n/a
checking for vprintf... yes
checking for stpcpy... yes
checking for strcasecmp... yes
checking for strtoul... yes
checking for memmove... yes
checking for stricmp... no
checking for atexit... yes
checking for raise... yes
checking for strerror... (cached) yes
checking for rand... yes
checking for mmap... yes
checking for getpagesize... (cached) yes
checking for sysconf... yes
checking for waitpid... yes
checking for wait4... yes
checking for gettimeofday... yes
checking for getrusage... yes
checking for gethrtime... no
checking for clock_gettime... yes
checking for syslog... yes
checking for syscall... yes
checking for fcntl... yes
checking for ftruncate... yes
checking for flockfile... yes
checking for getauxval... yes
checking for elf_aux_info... no
checking for explicit_bzero... yes
checking for explicit_memset... no
checking for getentropy... yes
checking for sysctlbyname... no
checking for mlock... yes
checking for sysconf... (cached) yes
checking for getpagesize... (cached) yes
checking whether mlock is broken... no
checking for sys/capability.h... yes
checking for cap_init in -lcap... yes
checking for random device... yes
configure: checking for cc features
checking if gcc supports -fno-delete-null-pointer-checks... yes
checking whether non excutable stack support is requested... yes
checking whether assembler supports --noexecstack option... yes
configure: creating ./config.status
config.status: creating Makefile
config.status: creating m4/Makefile
config.status: creating compat/Makefile
config.status: creating mpi/Makefile
config.status: creating cipher/Makefile
config.status: creating random/Makefile
config.status: creating doc/Makefile
config.status: creating src/Makefile
config.status: creating src/gcrypt.h
config.status: creating src/libgcrypt-config
config.status: creating src/libgcrypt.pc
config.status: creating src/versioninfo.rc
config.status: creating tests/Makefile
config.status: creating tests/hashtest-6g
config.status: creating tests/hashtest-256g
config.status: creating tests/basic-disable-all-hwf
config.status: creating config.h
config.status: linking ../libgcrypt-1.11.1/mpi/generic/mpih-add1.c to mpi/m=
pih-add1.c
config.status: linking ../libgcrypt-1.11.1/mpi/generic/mpih-sub1.c to mpi/m=
pih-sub1.c
config.status: linking ../libgcrypt-1.11.1/mpi/generic/mpih-mul1.c to mpi/m=
pih-mul1.c
config.status: linking ../libgcrypt-1.11.1/mpi/generic/mpih-mul2.c to mpi/m=
pih-mul2.c
config.status: linking ../libgcrypt-1.11.1/mpi/generic/mpih-mul3.c to mpi/m=
pih-mul3.c
config.status: linking ../libgcrypt-1.11.1/mpi/generic/mpih-lshift.c to mpi=
/mpih-lshift.c
config.status: linking ../libgcrypt-1.11.1/mpi/generic/mpih-rshift.c to mpi=
/mpih-rshift.c
config.status: linking ../libgcrypt-1.11.1/mpi/generic/mpi-asm-defs.h to mp=
i/mpi-asm-defs.h
config.status: executing depfiles commands
config.status: executing libtool commands
config.status: executing gcrypt-conf commands
        =20
        Libgcrypt v1.11.1-unknown has been configured as follows:
        =20
        Platform:                  GNU/Linux (x86_64-pc-linux-gnu)
        Hardware detection module: none
        Enabled cipher algorithms: arcfour blowfish cast5 des aes twofish
                                   serpent rfc2268 seed camellia idea salsa=
20
                                   gost28147 chacha20 sm4 aria
        Enabled digest algorithms: crc gostr3411-94 md4 md5 rmd160 sha1
                                   sha256 sha512 sha3 tiger whirlpool strib=
og
                                   blake2 sm3
        Enabled kdf algorithms:    s2k pkdf2 scrypt
        Enabled pubkey algorithms: dsa elgamal rsa ecc kyber
        Random number generator:   default
        Try using jitter entropy:  yes
        Using linux capabilities:  yes
        FIPS module version:      =20
        Try using Padlock crypto:  n/a
        Try using AES-NI crypto:   n/a
        Try using Intel SHAEXT:    n/a
        Try using Intel PCLMUL:    n/a
        Try using Intel SSE4.1:    n/a
        Try using DRNG (RDRAND):   n/a
        Try using Intel AVX:       n/a
        Try using Intel AVX2:      n/a
        Try using Intel AVX512:    n/a
        Try using Intel GFNI:      n/a
        Try using ARM NEON:        n/a
        Try using ARMv8 crypto:    n/a
        Try using ARMv8 SVE:       n/a
        Try using ARMv9 SVE2:      n/a
        Try using PPC crypto:      n/a
        =20
DEBUG: Shell function do_configure finished
DEBUG: Executing python function do_qa_configure
NOTE: Checking autotools environment for common misconfiguration
NOTE: Checking configure output for unrecognised options
DEBUG: Python function do_qa_configure finished
DEBUG: Executing shell function autotools_postconfigure
DEBUG: Shell function autotools_postconfigure finished

--7bje32ga6qu3snwm--

