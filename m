Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 417EA601A4
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Mar 2016 22:33:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u24MWvGN018600; Fri, 4 Mar 2016 22:33:33 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 47YUCyi8CLM5; Fri,  4 Mar 2016 22:33:33 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u24MXRsZ018708
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 4 Mar 2016 22:33:28 GMT
Message-ID: <1457130807.2804.59.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Fri, 04 Mar 2016 22:33:27 +0000
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: uninative stdc++ abi
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
X-List-Received-Date: Fri, 04 Mar 2016 22:33:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Khem,

I'm trying to get the autobuilders to use uninative and in wider
deployment we're seeing errors like:

https://autobuilder.yoctoproject.org/main/builders/nightly-x86-64/build
s/700/steps/BuildImages/logs/stdio

 x86_64-linux-libtool: link: gcc -isystem/home/pokybuild/yocto-autobuilder/=
yocto-worker/nightly-x86-64/build/build/tmp/sysroots/x86_64-linux/usr/inclu=
de -O2 -pipe -Wl,-rpath-link -Wl,/home/pokybuild/yocto-autobuilder/yocto-wo=
rker/nightly-x86-64/build/build/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpat=
h-link -Wl,/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86-64/bu=
ild/build/tmp/sysroots/x86_64-linux/lib -Wl,-rpath -Wl,/home/pokybuild/yoct=
o-autobuilder/yocto-worker/nightly-x86-64/build/build/tmp/sysroots/x86_64-l=
inux/usr/lib -Wl,-rpath -Wl,/home/pokybuild/yocto-autobuilder/yocto-worker/=
nightly-x86-64/build/build/tmp/sysroots/x86_64-linux/lib -Wl,-O1 -Bsymbolic=
-functions -o .libs/test-unicode test_unicode-test-unicode.o  -L/home/pokyb=
uild/yocto-autobuilder/yocto-worker/nightly-x86-64/build/build/tmp/sysroots=
/x86_64-linux/usr/lib -L/home/pokybuild/yocto-autobuilder/yocto-worker/nigh=
tly-x86-64/build/build/tmp/sysroots/x86_64-linux/lib ../../src/.libs/libhar=
fbuzz.so ../../src/.libs/libharfbuzz-icu.so /home/pokybuild/yocto-autobuild=
er/yocto-worker/nightly-x86-64/build/build/tmp/work/x86_64-linux/harfbuzz-n=
ative/1.2.3-r0/build/src/.libs/libharfbuzz.so /home/pokybuild/yocto-autobui=
lder/yocto-worker/nightly-x86-64/build/build/tmp/sysroots/x86_64-linux/usr/=
lib/libglib-2.0.so /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x=
86-64/build/build/tmp/sysroots/x86_64-linux/usr/lib/libpcre.so -lpthread /h=
ome/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86-64/build/build/tmp=
/sysroots/x86_64-linux/usr/lib/libfreetype.so -lz -licuuc -licudata -Wl,-rp=
ath -Wl,/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86-64/build=
/build/tmp/sysroots/x86_64-linux/usr/lib
| /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86-64/build/build=
/tmp/sysroots/x86_64-linux/usr/lib/libicuuc.so: undefined reference to `__c=
xa_throw_bad_array_new_length@CXXABI_1.3.8'
| collect2: error: ld returned 1 exit status

which I'm guessing is gcc5 verses gcc4 libstdc++ ABI differences? icu
probably built on a gcc 5 machine and is now being used on gcc4 giving
the error?

I'm considering a patch like:


diff --git a/meta/classes/uninative.bbclass b/meta/classes/uninative.bbclas=
s
index 7f242de..5fe0422 100644
--- a/meta/classes/uninative.bbclass
+++ b/meta/classes/uninative.bbclass
@@ -7,6 +7,12 @@ UNINATIVE_TARBALL ?=3D "${BUILD_ARCH}-nativesdk-libc.tar.b=
z2"
 #UNINATIVE_CHECKSUM[x86_64] =3D "dead"
 UNINATIVE_DLDIR ?=3D "${DL_DIR}"
=20
+# https://wiki.debian.org/GCC5
+# We may see binaries built with gcc5 run or linked into gcc4 environment
+# so use the older libstdc++ standard for now until we don't support gcc4
+# on the host system.
+BUILD_CXXFLAGS_append =3D " -D_GLIBCXX_USE_CXX11_ABI=3D0"


Is this the right way to try and fix this? Any better ideas?

Cheers,

Richard


