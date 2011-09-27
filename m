Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R8bCv-00035M-CW for openembedded-core@lists.openembedded.org;
	Tue, 27 Sep 2011 19:12:37 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8RHDVaG029971 for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Sep 2011 18:13:32 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id j1k+WRrQ3WUI
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Sep 2011 18:13:31 +0100 (BST)
Received: from [192.168.1.40] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8RHDPHk029967
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Sep 2011 18:13:27 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 27 Sep 2011 18:07:00 +0100
X-Mailer: Evolution 3.1.91- 
Message-ID: <1317143228.26109.203.camel@ted>
Mime-Version: 1.0
Subject: Build Times and Performance - Discussion + new ideas
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 27 Sep 2011 17:12:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Every now and again I look at our build times and want to cry - we keep
taking longer with new features and whilst we have made many
improvements, I'm certain there are ways we can speed up. 

I've got some recent experiences to share with people. Its long and is
in the form of a story rather than a conclusion as I'd like people to
understand how I looked into the problem as well as the conclusion.

On Sunday my new build machine powered up. The exact specs aren't so
important but its built from shelf components and the end result is a
dual six core Xeon machine with 48GB RAM. Why is this a good idea when
most people don't have one of these on their desk (yet)? 

Several reasons. Firstly, it means I should be able to benchmark things
faster and test things faster. If I can speed builds up on this, they
should speed up for other systems too. Being able to iterate over
patches faster increases my productivity.

Secondly is the "yet" comment above. The trend for the future appears to
be for more cores so these machines will start appearing on people's
desks. It would be nice if when people do have them, the build system
can use their power.

Sadly, this is the first machine I've had where I've not been able to
max it out easily with OE/Poky. I hate not using the hardware so I see
this as a challenge :)

So the big question, where is our performance bottleneck?

People keep telling me we're disk IO bound. This was partly why I have a
machine with large amounts of memory, to either prove or disprove this
theory. My tests so far pretty clearly indicate this is not the problem.

I'm putting together some tips on build performance which I'm putting
on:

https://wiki.yoctoproject.org/wiki/Build_Performance

As detailed there I've setup a partition formatted with ext4 with no
journal, no barriers and most importantly a long commit time. The intent
here is to allow things to exist in memory and not block on disk IO.

My tests for a core-image-sato show the disk footprint (du -s tmp ) to
be about 26.9GB and my kernel disk cache is about 30.5GB after a build.
Allowing 3.6GB for the sources and system, its approximately right for a
totally cached build. My only question would be related to fsync() calls
during the build but I'm hoping there aren't too many of them. Certainly
we're not read bound.

I'm going to recheck the build time with a large tmpfs backed by swap
but looking at monitoring tools during the build so far I'm feeling disk
IO isn't our biggest problem. So what is?

As a marker stone, a build from scratch (prepopulated downloads) took:

NOTE: Tasks Summary: Attempted 4446 tasks of which 198 didn't need to be
rerun and 0 failed.

real    53m6.377s
user    295m55.850s
sys     52m20.720s


which for a system with this much power is pretty disappointing.
Watching the build, it unpacks most of the sources within the first few
minutes but takes an age to get the cross compiler established. We
aren't using all the cpu cores for a lot of that. The only times we do
are building qt (not in this test case) or the kernel.

I next had a look at "bitbake gcc-cross-initial -g" and "bitbake
gcc-cross-initial -e | grep DEPENDS=" which show we have a ton of
dependencies creeping in there. By the far the most problematic is
gettext-native.

There are some things in the system we don't autoreconf. By large I
encourage us to autoreconf but the exceptions are binutils, gcc and
glibc (I don't want to go into why here). Taking this as something we
aren't going to change, we can actually turn this to our advantage since
we don't need the gettext m4 macros to autoreconf and hence don't need
the gettext dependency if (and only if) we disable nls in binutils and
gcc.

Do we actually care about nls in binutils-cross and gcc-cross*? I'd say
not, especially since we always force the C locale anyway. Obviously fcc
and binutils themselves are different.

So I went on a spree of disabling nls for bitutils/gcc cross and all
their dependencies. 

While doing this I noticed that we can likely remove the help2man-native
dependency from many recipes. I'd really like to do this for all native
recipes and disable doc generation for the -native packages.

For now I came up with the hack below. The bugs in this are:

a) I removed bison-native and zlib-native from binutils-cross as 
   dependencies when they're needed. My system has those anyway so I'm 
   not worrying about this for a proof of concept
b) I've removed help2man-native dependencies but didn't check if any of 
   the recipes actually call help2man and need docs disabling
c) I excluded help2man in non -native cases for some recipes
d) I didn't disable nls and it dependencies for gcc-cross, only 
   -initial and -intermediate
e) I stopped analysing the dependency chain at gcc-cross-intermediate, 
   it would likely be faster again if I fixed gcc-cross' dependencies

At each step I was running the bitbake dependency graph for the next
item on the critical path and giving hard consideration to whether any
new additional items were really necessary.

The end result is that with the attached patch, the build time decreased
to be:

NOTE: Tasks Summary: Attempted 4446 tasks of which 198 didn't need to be
rerun and 0 failed.

real    44m37.830s
user    299m14.560s
sys     52m57.580s

That isn't a bad speed increase (~16%) and is a pretty clear indication
our critical build path (to get the toolchain) has too many convoluted
dependencies and we need to streamline it. I'd therefore propose we
dedicate some investigation into this area.

Just as a note, the critical path with this patch is roughly:

m4-native
autoconf-native
automake-native
pkgconfig-native
sqlite3-native
pseudo-native
quilt-native
libtool-native
gnu-config-native
flex-native
binutils-cross
gmp-native
mpfr-native
libmpc-native
gcc-cross-initial
unifdef-native
linux-libc-headers
help2man-native
elibc-initial
gcc-cross-intermediate

(with help2man-native just sitting where I've got so far in removing it
from dependencies)

When you add gettext to the above list (which requires git-native), the
list looks many times worse.

Cheers,

Richard



diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
index f213c18..b5da38a 100644
--- a/meta/classes/autotools.bbclass
+++ b/meta/classes/autotools.bbclass
@@ -7,7 +7,10 @@ def autotools_dep_prepend(d):
 
 	if pn in ['autoconf-native', 'automake-native', 'help2man-native']:
 		return deps
-	deps += 'autoconf-native automake-native help2man-native '
+	deps += 'autoconf-native automake-native '
+
+	if not d.getVar('INHIBIT_HELP2MAN_DEP', True):
+		deps += 'help2man-native '
 
 	if not pn in ['libtool', 'libtool-native'] and not pn.endswith("libtool-cross"):
 		deps += 'libtool-native '
diff --git a/meta/recipes-devtools/binutils/binutils-cross.inc b/meta/recipes-devtools/binutils/binutils-cross.inc
index 5a41970..3755640 100644
--- a/meta/recipes-devtools/binutils/binutils-cross.inc
+++ b/meta/recipes-devtools/binutils/binutils-cross.inc
@@ -1,10 +1,15 @@
 inherit cross
 PROVIDES = "virtual/${TARGET_PREFIX}binutils"
 
+INHIBIT_DEFAULT_DEPS = "1"
+INHIBIT_AUTOTOOLS_DEPS = "1"
+DEPENDS = "gnu-config-native flex-native"
+
 EXTRA_OECONF = "--with-sysroot=${STAGING_DIR_TARGET} \
                 --program-prefix=${TARGET_PREFIX} \
                 --disable-install-libbfd \
                 --disable-werror \
+                --disable-nls \
                 --enable-poison-system-directories \
 		${@base_contains('DISTRO_FEATURES', 'ld-is-gold', '--enable-gold=default', '', d)}"
 
diff --git a/meta/recipes-devtools/flex/flex.inc b/meta/recipes-devtools/flex/flex.inc
index 01f7571..975747a 100644
--- a/meta/recipes-devtools/flex/flex.inc
+++ b/meta/recipes-devtools/flex/flex.inc
@@ -8,6 +8,10 @@ LICENSE = "BSD"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/flex/flex-${PV}.tar.bz2 "
 
+INHIBIT_DEFAULT_DEPS_virtclass-native = "1"
+INHIBIT_HELP2MAN_DEP_virtclass-native = "1"
+EXTRA_OECONF_append_virtclass-native = " --disable-nls"
+
 inherit autotools gettext
 
 do_install_append_virtclass-native() {
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.inc b/meta/recipes-devtools/gcc/gcc-4.6.inc
index ee42fa7..f902a88 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.6.inc
@@ -23,7 +23,7 @@ BRANCH = "gcc-4_6-branch"
 FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/gcc-4.6' ], d)}"
 
 DEPENDS =+ "mpfr gmp libmpc"
-NATIVEDEPS = "mpfr-native gmp-native gettext-native libmpc-native"
+NATIVEDEPS = "mpfr-native gmp-native libmpc-native"
 
 LICENSE="GPL-3.0-with-GCC-exception & GPLv3"
 
diff --git a/meta/recipes-devtools/gcc/gcc-cross-initial.inc b/meta/recipes-devtools/gcc/gcc-cross-initial.inc
index 4e2e343..d58bf70 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-initial.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross-initial.inc
@@ -1,7 +1,10 @@
-DEPENDS = "virtual/${TARGET_PREFIX}binutils gettext-native ${NATIVEDEPS}"
+DEPENDS = "virtual/${TARGET_PREFIX}binutils ${NATIVEDEPS}"
 PROVIDES = "virtual/${TARGET_PREFIX}gcc-initial"
 PACKAGES = ""
 
+INHIBIT_AUTOTOOLS_DEPS = "1"
+INHIBIT_DEFAULT_DEPS = "1"
+
 CROSS_TARGET_SYS_DIR_append = ".${PN}"
 
 # This is intended to be a -very- basic config
@@ -11,6 +14,7 @@ EXTRA_OECONF = "--with-local-prefix=${STAGING_DIR_TARGET}${target_prefix} \
 		--without-headers \
 		--disable-shared \
 		--disable-threads \
+		--disable-nls \
 		--disable-multilib \
 		--disable-__cxa_atexit \
 		--enable-languages=c \
diff --git a/meta/recipes-devtools/gcc/gcc-cross-intermediate.inc b/meta/recipes-devtools/gcc/gcc-cross-intermediate.inc
index 7b1bb38..f368ae9 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-intermediate.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross-intermediate.inc
@@ -1,8 +1,11 @@
 DEPENDS = "virtual/${TARGET_PREFIX}binutils ${NATIVEDEPS}"
-DEPENDS += "virtual/${TARGET_PREFIX}libc-initial gettext-native"
+DEPENDS += "virtual/${TARGET_PREFIX}libc-initial"
 PROVIDES = "virtual/${TARGET_PREFIX}gcc-intermediate"
 PACKAGES = ""
 
+INHIBIT_DEFAULT_DEPS = "1"
+INHIBIT_AUTOTOOLS_DEPS = "1"
+
 CROSS_TARGET_SYS_DIR_append = ".${PN}"
 
 # This is intended to be a -very- basic config
@@ -13,6 +16,7 @@ CROSS_TARGET_SYS_DIR_append = ".${PN}"
 # preferred linker.
 EXTRA_OECONF = "--with-local-prefix=${STAGING_DIR_TARGET}${target_prefix} \
 		--enable-shared \
+		--disable-nls \
 		--disable-multilib \
 		--disable-threads \
 		--enable-languages=c \
diff --git a/meta/recipes-devtools/libtool/libtool-native_2.4.bb b/meta/recipes-devtools/libtool/libtool-native_2.4.bb
index 3d0998e..2587795 100644
--- a/meta/recipes-devtools/libtool/libtool-native_2.4.bb
+++ b/meta/recipes-devtools/libtool/libtool-native_2.4.bb
@@ -2,6 +2,8 @@ require libtool-${PV}.inc
 
 DEPENDS = ""
 
+INHIBIT_HELP2MAN_DEP = "1"
+
 PR = "r4"
 SRC_URI += "file://prefix.patch"
 
diff --git a/meta/recipes-support/gmp/gmp.inc b/meta/recipes-support/gmp/gmp.inc
index 66349e6..2dd5538 100644
--- a/meta/recipes-support/gmp/gmp.inc
+++ b/meta/recipes-support/gmp/gmp.inc
@@ -13,4 +13,6 @@ ARM_INSTRUCTION_SET = "arm"
 
 acpaths = ""
 
+INHIBIT_HELP2MAN_DEP = "1"
+
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-support/libmpc/libmpc_0.8.2.bb b/meta/recipes-support/libmpc/libmpc_0.8.2.bb
index f991a8e..1841719 100644
--- a/meta/recipes-support/libmpc/libmpc_0.8.2.bb
+++ b/meta/recipes-support/libmpc/libmpc_0.8.2.bb
@@ -11,5 +11,8 @@ SRC_URI[md5sum] = "e98267ebd5648a39f881d66797122fb6"
 SRC_URI[sha256sum] = "ae79f8d41d8a86456b68607e9ca398d00f8b7342d1d83bcf4428178ac45380c7"
 
 S = "${WORKDIR}/mpc-${PV}"
+
+INHIBIT_HELP2MAN_DEP = "1"
+
 BBCLASSEXTEND = "native nativesdk"
 
diff --git a/meta/recipes-support/mpfr/mpfr_3.0.1.bb b/meta/recipes-support/mpfr/mpfr_3.0.1.bb
index 9079e4b..c1ae168 100644
--- a/meta/recipes-support/mpfr/mpfr_3.0.1.bb
+++ b/meta/recipes-support/mpfr/mpfr_3.0.1.bb
@@ -11,4 +11,6 @@ SRC_URI[md5sum] = "bfbecb2eacb6d48432ead5cfc3f7390a"
 SRC_URI[sha256sum] = "e1977099bb494319c0f0c1f85759050c418a56884e9c6cef1c540b9b13e38e7f"
 S = "${WORKDIR}/mpfr-${PV}"
 
+INHIBIT_HELP2MAN_DEP = "1"
+
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-support/sqlite/sqlite3.inc b/meta/recipes-support/sqlite/sqlite3.inc
index 2a52a44..3d1c29b 100644
--- a/meta/recipes-support/sqlite/sqlite3.inc
+++ b/meta/recipes-support/sqlite/sqlite3.inc
@@ -28,4 +28,6 @@ FILES_lib${BPN}${PKGSUFFIX}-dev = "${libdir}/*.a ${libdir}/*.la ${libdir}/*.so \
 FILES_lib${BPN}${PKGSUFFIX}-doc = "${docdir} ${mandir} ${infodir}"
 AUTO_LIBNAME_PKGS = "lib${BPN}${PKGSUFFIX}"
 
+INHIBIT_HELP2MAN_DEP = "1"
+
 BBCLASSEXTEND = "native nativesdk"





