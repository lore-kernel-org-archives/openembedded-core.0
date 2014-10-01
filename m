Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f177.google.com (mail-ie0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id ED9EE6017E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Oct 2014 10:06:49 +0000 (UTC)
Received: by mail-ie0-f177.google.com with SMTP id rd18so439974iec.36
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Oct 2014 03:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=WvYyzsEMikOCFusVm6rPP+fjtC0bylan2gg0Vn1ykhU=;
	b=CIkw+JCrKO6Uu0j0ZRf6d4VPvOskh5Us71b9gVjsrrYsQxizH5ZvjcyZ7JO74G7kNP
	RRerTkM+LJu1lR+l85thPu9pypF7ht6dnvwt/suZMJldvsdKUCSGUeLfE+SXcu10mcs9
	crlGtMPfUYkqLaPDqJhXtl781XVcBWulyazHPIAz2B4bEFV7z1yL9Cgifbg1X6ZFDbO1
	8y1WIfPpIlLLd8mZbwBHTcrpxV2BE3mjcOU9Lcny7+AMy6eKLWF+Og2dGQTXYeJiRygq
	mUoBUZ/3v+2jATdOdDCpc4otOfpzIPHuQ/l9wPjxJ1+s42Tj8/SkFaVFsv8tnruRLA5h
	AedQ==
X-Received: by 10.50.87.99 with SMTP id w3mr18167096igz.4.1412158010090; Wed,
	01 Oct 2014 03:06:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.179.5 with HTTP; Wed, 1 Oct 2014 03:06:19 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 1 Oct 2014 03:06:19 -0700
Message-ID: <CAMKF1sqWkAd=k9e-XXatP1Dy_B4OARpP1ZPKTfa-PViH8a9eGg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: shlibs failing to add dependencies if shared objects are called .so
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
X-List-Received-Date: Wed, 01 Oct 2014 10:06:57 -0000
Content-Type: text/plain; charset=UTF-8

Hi Richard

You did bunch of shlib refactoring lately.
I am seeing a change in dependency list for libegl-gallium and see
that on master libllvm3.3-llvm-3.3 has gone missing but the .so is
there in DT_NEEDED section of egl_gallium.so.


i586-rdk-linux/mesa/2_10.1.3-r0/packages-split/libegl-gallium/usr/lib/egl$
readelf -d egl_gallium.so


Dynamic section at offset 0x699394 contains 38 entries:

  Tag        Type                         Name/Value
 0x00000001 (NEEDED)                     Shared library: [libEGL.so.1]
 0x00000001 (NEEDED)                     Shared library: [libgbm.so.1]
 0x00000001 (NEEDED)                     Shared library: [libudev.so.1]
 0x00000001 (NEEDED)                     Shared library: [librt.so.1]
 0x00000001 (NEEDED)                     Shared library: [libglapi.so.0]
 0x00000001 (NEEDED)                     Shared library: [libdrm_nouveau.so.2]
 0x00000001 (NEEDED)                     Shared library: [libdrm_radeon.so.1]
 0x00000001 (NEEDED)                     Shared library: [libdrm.so.2]
 0x00000001 (NEEDED)                     Shared library: [libz.so.1]
 0x00000001 (NEEDED)                     Shared library: [libpthread.so.0]
 0x00000001 (NEEDED)                     Shared library: [libdl.so.2]
 0x00000001 (NEEDED)                     Shared library: [libLLVM-3.3.so]
 0x00000001 (NEEDED)                     Shared library: [libstdc++.so.6]
 0x00000001 (NEEDED)                     Shared library: [libm.so.6]
 0x00000001 (NEEDED)                     Shared library: [libc.so.6]
 0x00000001 (NEEDED)                     Shared library: [libgcc_s.so.1]
 0x0000000e (SONAME)                     Library soname: [egl_gallium.so]



 The special thing about libllvm3.3-llvm-3.3 is that
it has libraries which end with .so and they are not in /usr/lib but
in /usr/lib//llvm3.3
the one in /usr/lib is a symlink to /usr/lib//llvm3.3

PV = 3.3
PR = r0
RPROVIDES =
RDEPENDS = glibc (>= 2.20) libgcc (>= 4.9.1) libstdc++ (>= 4.9.1)
llvm3.3 zlib (>= 1.2.8)
RRECOMMENDS =
PKGSIZE = 18250362
FILES = /usr/lib/libLLVM-3.3.so /usr/lib/llvm3.3/.debug/libLLVM-3.3.so
/usr/lib/llvm3.3/libLLVM-3.3.so
FILELIST = /usr/lib/libLLVM-3.3.so /usr/lib/llvm3.3/libLLVM-3.3.so


Daisy

"libegl-gallium" -> "libc6";
"libegl-gallium" -> "libdrm-nouveau2";
"libegl-gallium" -> "libdrm-radeon1";
"libegl-gallium" -> "libdrm2";
"libegl-gallium" -> "libegl-mesa";
"libegl-gallium" -> "libgbm1";
"libegl-gallium" -> "libgcc1";
"libegl-gallium" -> "libglapi0";
"libegl-gallium" -> "libllvm3.3-llvm-3.3";
"libegl-gallium" -> "libstdc++6";
"libegl-gallium" -> "libudev1";
"libegl-gallium" -> "libz1";


master


"libegl-gallium" -> "libc6";
"libegl-gallium" -> "libdrm-nouveau2";
"libegl-gallium" -> "libdrm-radeon1";
"libegl-gallium" -> "libdrm2";
"libegl-gallium" -> "libegl-mesa";
"libegl-gallium" -> "libgbm1";
"libegl-gallium" -> "libgcc1";
"libegl-gallium" -> "libglapi0";
"libegl-gallium" -> "libstdc++6";
"libegl-gallium" -> "libudev1";
"libegl-gallium" -> "libz1";


To reproduce it.

MACHINE=qemux86 bitbake mesa

Let me know if more info it needed.


Thanks

-Khem

