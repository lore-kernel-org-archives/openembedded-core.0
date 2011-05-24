Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1QOstd-0004UL-NQ
	for openembedded-core@lists.openembedded.org;
	Tue, 24 May 2011 16:47:48 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 24 May 2011 07:44:43 -0700
X-ExtLoop1: 1
Received: from unknown (HELO [10.255.12.133]) ([10.255.12.133])
	by orsmga002.jf.intel.com with ESMTP; 24 May 2011 07:44:42 -0700
Message-ID: <4DDBC45A.6090102@intel.com>
Date: Tue, 24 May 2011 07:44:42 -0700
From: Saul Wold <saul.wold@intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1306037150.git.raj.khem@gmail.com>
	<c3ce108a01c4c250640528973e4cf12dfe062671.1306037150.git.raj.khem@gmail.com>
In-Reply-To: <c3ce108a01c4c250640528973e4cf12dfe062671.1306037150.git.raj.khem@gmail.com>
Subject: Re: [PATCH 1/1] eglibc.inc: Transfer PARALLEL_MAKE to	PARALLELMFLAGS
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
X-List-Received-Date: Tue, 24 May 2011 14:47:48 -0000
X-Groupsio-MsgNum: 2942
Content-Type: multipart/mixed; boundary="------------080707000209080004080109"

--------------080707000209080004080109
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/21/2011 09:09 PM, Khem Raj wrote:
> * Currently we are passing -jN flags to eglibc makefiles
>    however eglibc uses a make variable called PARALLELMFLAGS
>    to pass information about parallel build to sub-makes
>
> * Currently make install ran without parallelism but now
>    it should have parallel building flags passed to do_install
>    correctly which inturn should improve build time of
>    eglibc on systems using parallel build -j with values>  1
>
Khem,

What kind of testing have you done with this patch, I get a consistent 
failure on multiple machines with eglibc-initial do_install.

Please review this error log, the make target `<number>' changes, which
leads me to believe it's related to the PARALLEL_MAKE number.

Thanks
	Sau!


> Signed-off-by: Khem Raj<raj.khem@gmail.com>
> ---
>   meta/recipes-core/eglibc/eglibc.inc |    6 ++++++
>   1 files changed, 6 insertions(+), 0 deletions(-)
>
> diff --git a/meta/recipes-core/eglibc/eglibc.inc b/meta/recipes-core/eglibc/eglibc.inc
> index 8314cb1..39972b0 100644
> --- a/meta/recipes-core/eglibc/eglibc.inc
> +++ b/meta/recipes-core/eglibc/eglibc.inc
> @@ -36,4 +36,10 @@ INHIBIT_DEFAULT_DEPS = "1"
>
>   ARM_INSTRUCTION_SET = "arm"
>
> +# eglibc uses PARALLELMFLAGS variable to pass parallel build info so transfer
> +# PARALLEL_MAKE into PARALLELMFLAGS and empty out PARALLEL_MAKE
> +EGLIBCPARALLELISM := "PARALLELMFLAGS=${PARALLEL_MAKE}"
> +EXTRA_OEMAKE += ${EGLIBCPARALLELISM}
> +PARALLEL_MAKE = ""
> +
>   PACKAGES = "glibc catchsegv sln nscd ldd localedef glibc-utils glibc-dev glibc-doc glibc-locale libsegfault glibc-extra-nss glibc-thread-db glibc-pcprofile"


--------------080707000209080004080109
Content-Type: text/plain;
 name="do_install_failure"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="do_install_failure"

NOTE: make PARALLELMFLAGS=3D-j 6 cross-compiling=3Dyes install_root=3D/inte=
l/poky/builds/lsb/tmp/work/core2-poky-linux/eglibc-initial-2.13-r0+svnr1335=
6/image includedir=3D/usr/include prefix=3D/usr install-bootstrap-headers=
=3Dyes install-headers
make -r PARALLELMFLAGS=3D"-j" CVSOPTS=3D"" -C /intel/poky/builds/lsb/tmp/wo=
rk/core2-poky-linux/eglibc-initial-2.13-r0+svnr13356/eglibc-2_13/libc objdi=
r=3D`pwd` 6
make[1]: Entering directory `/intel/poky/builds/lsb/tmp/work/core2-poky-lin=
ux/eglibc-initial-2.13-r0+svnr13356/eglibc-2_13/libc'
for inc in -I/intel/poky/builds/lsb/tmp/work/core2-poky-linux/eglibc-initia=
l-2.13-r0+svnr13356/build-i586-poky-linux -Isysdeps/i386/elf -Inptl/sysdeps=
/unix/sysv/linux/i386/i586 -Inptl/sysdeps/unix/sysv/linux/i386 -Isysdeps/un=
ix/sysv/linux/i386 -Inptl/sysdeps/unix/sysv/linux -Inptl/sysdeps/pthread -I=
sysdeps/pthread -Iports/sysdeps/unix/sysv/linux -Isysdeps/unix/sysv/linux -=
Isysdeps/gnu -Isysdeps/unix/common -Isysdeps/unix/mman -Isysdeps/unix/inet =
-Iports/sysdeps/unix/sysv/i386 -Isysdeps/unix/sysv/i386 -Inptl/sysdeps/unix=
/sysv -Iports/sysdeps/unix/sysv -Isysdeps/unix/sysv -Isysdeps/unix/i386 -In=
ptl/sysdeps/unix -Iports/sysdeps/unix -Isysdeps/unix -Isysdeps/posix -Inptl=
/sysdeps/i386/i586 -Isysdeps/i386/i586 -Isysdeps/i386/i486 -Inptl/sysdeps/i=
386/i486 -Isysdeps/i386/fpu -Inptl/sysdeps/i386 -Isysdeps/i386 -Isysdeps/wo=
rdsize-32 -Isysdeps/ieee754/ldbl-96 -Isysdeps/ieee754/dbl-64 -Isysdeps/ieee=
754/flt-32 -Isysdeps/ieee754 -Isysdeps/generic/elf -Isysdeps/generic -Inptl=
 -Iports  -nostdinc -isystem /intel/poky/builds/lsb/tmp/sysroots/i686-linux=
/usr/lib/core2-poky-linux.gcc-cross-initial/gcc/i586-poky-linux/4.6.0/inclu=
de -isystem /intel/poky/builds/lsb/tmp/sysroots/i686-linux/usr/lib/core2-po=
ky-linux.gcc-cross-initial/gcc/i586-poky-linux/4.6.0/include-fixed -isystem=
 /intel/poky/builds/lsb/tmp/sysroots/n450/usr/include; do echo "$inc"; done=
 \
	  > /intel/poky/builds/lsb/tmp/work/core2-poky-linux/eglibc-initial-2.13-r=
0+svnr13356/build-i586-poky-linux/includesT
mv -f /intel/poky/builds/lsb/tmp/work/core2-poky-linux/eglibc-initial-2.13-=
r0+svnr13356/build-i586-poky-linux/includesT /intel/poky/builds/lsb/tmp/wor=
k/core2-poky-linux/eglibc-initial-2.13-r0+svnr13356/build-i586-poky-linux/i=
ncludes
echo 'saved-includes :=3D -I/intel/poky/builds/lsb/tmp/work/core2-poky-linu=
x/eglibc-initial-2.13-r0+svnr13356/build-i586-poky-linux -Isysdeps/i386/elf=
 -Inptl/sysdeps/unix/sysv/linux/i386/i586 -Inptl/sysdeps/unix/sysv/linux/i3=
86 -Isysdeps/unix/sysv/linux/i386 -Inptl/sysdeps/unix/sysv/linux -Inptl/sys=
deps/pthread -Isysdeps/pthread -Iports/sysdeps/unix/sysv/linux -Isysdeps/un=
ix/sysv/linux -Isysdeps/gnu -Isysdeps/unix/common -Isysdeps/unix/mman -Isys=
deps/unix/inet -Iports/sysdeps/unix/sysv/i386 -Isysdeps/unix/sysv/i386 -Inp=
tl/sysdeps/unix/sysv -Iports/sysdeps/unix/sysv -Isysdeps/unix/sysv -Isysdep=
s/unix/i386 -Inptl/sysdeps/unix -Iports/sysdeps/unix -Isysdeps/unix -Isysde=
ps/posix -Inptl/sysdeps/i386/i586 -Isysdeps/i386/i586 -Isysdeps/i386/i486 -=
Inptl/sysdeps/i386/i486 -Isysdeps/i386/fpu -Inptl/sysdeps/i386 -Isysdeps/i3=
86 -Isysdeps/wordsize-32 -Isysdeps/ieee754/ldbl-96 -Isysdeps/ieee754/dbl-64=
 -Isysdeps/ieee754/flt-32 -Isysdeps/ieee754 -Isysdeps/generic/elf -Isysdeps=
/generic -Inptl -Iports  -nostdinc -isystem /intel/poky/builds/lsb/tmp/sysr=
oots/i686-linux/usr/lib/core2-poky-linux.gcc-cross-initial/gcc/i586-poky-li=
nux/4.6.0/include -isystem /intel/poky/builds/lsb/tmp/sysroots/i686-linux/u=
sr/lib/core2-poky-linux.gcc-cross-initial/gcc/i586-poky-linux/4.6.0/include=
-fixed -isystem /intel/poky/builds/lsb/tmp/sysroots/n450/usr/include' > /in=
tel/poky/builds/lsb/tmp/work/core2-poky-linux/eglibc-initial-2.13-r0+svnr13=
356/build-i586-poky-linux/includes.mkT
mv -f /intel/poky/builds/lsb/tmp/work/core2-poky-linux/eglibc-initial-2.13-=
r0+svnr13356/build-i586-poky-linux/includes.mkT /intel/poky/builds/lsb/tmp/=
work/core2-poky-linux/eglibc-initial-2.13-r0+svnr13356/build-i586-poky-linu=
x/includes.mk
(echo 'sysd-rules-sysdirs :=3D sysdeps/i386/elf nptl/sysdeps/unix/sysv/linu=
x/i386/i586 nptl/sysdeps/unix/sysv/linux/i386 sysdeps/unix/sysv/linux/i386 =
nptl/sysdeps/unix/sysv/linux nptl/sysdeps/pthread sysdeps/pthread ports/sys=
deps/unix/sysv/linux sysdeps/unix/sysv/linux sysdeps/gnu sysdeps/unix/commo=
n sysdeps/unix/mman sysdeps/unix/inet ports/sysdeps/unix/sysv/i386 sysdeps/=
unix/sysv/i386 nptl/sysdeps/unix/sysv ports/sysdeps/unix/sysv sysdeps/unix/=
sysv sysdeps/unix/i386 nptl/sysdeps/unix ports/sysdeps/unix sysdeps/unix sy=
sdeps/posix nptl/sysdeps/i386/i586 sysdeps/i386/i586 sysdeps/i386/i486 nptl=
/sysdeps/i386/i486 sysdeps/i386/fpu nptl/sysdeps/i386 sysdeps/i386 sysdeps/=
wordsize-32 sysdeps/ieee754/ldbl-96 sysdeps/ieee754/dbl-64 sysdeps/ieee754/=
flt-32 sysdeps/ieee754 sysdeps/generic/elf sysdeps/generic';		      \
	 for dir in sysdeps/i386/elf nptl/sysdeps/unix/sysv/linux/i386/i586 nptl/s=
ysdeps/unix/sysv/linux/i386 sysdeps/unix/sysv/linux/i386 nptl/sysdeps/unix/=
sysv/linux nptl/sysdeps/pthread sysdeps/pthread ports/sysdeps/unix/sysv/lin=
ux sysdeps/unix/sysv/linux sysdeps/gnu sysdeps/unix/common sysdeps/unix/mma=
n sysdeps/unix/inet ports/sysdeps/unix/sysv/i386 sysdeps/unix/sysv/i386 npt=
l/sysdeps/unix/sysv ports/sysdeps/unix/sysv sysdeps/unix/sysv sysdeps/unix/=
i386 nptl/sysdeps/unix ports/sysdeps/unix sysdeps/unix sysdeps/posix nptl/s=
ysdeps/i386/i586 sysdeps/i386/i586 sysdeps/i386/i486 nptl/sysdeps/i386/i486=
 sysdeps/i386/fpu nptl/sysdeps/i386 sysdeps/i386 sysdeps/wordsize-32 sysdep=
s/ieee754/ldbl-96 sysdeps/ieee754/dbl-64 sysdeps/ieee754/flt-32 sysdeps/iee=
e754 sysdeps/generic/elf sysdeps/generic; do				      \
	   case "$dir" in						      \
	   /*) ;;							      \
	   *) dir=3D"\$(..)$dir" ;;					      \
	   esac;							      \
	   asm=3D'.S .s';							      \
	   						      \
	   for o in .o .os .op .og .ob .oS; do				      \
	     set % % rtld-% rtld-% rtld-% % m_% s_% ptw-% %;			      \
	     while [ $# -ge 2 ]; do					      \
	       t=3D$1; shift; 						      \
	       d=3D$1; shift;						      \
	       v=3D${t%%%}; [ x"$v" =3D x ] || v=3D"\$(${v}CPPFLAGS)";	      \
	       for s in $asm .c; do					      \
		 echo "\$(objpfx)$t$o: $dir/$d$s \$(before-compile)";  \
		 echo "	\$(compile-command$s) $v";			      \
	       done;							      \
	     done;							      \
	   done;							      \
	   echo "\$(inst_includedir)/%.h: $dir/%.h \$(+force)";	      \
	   echo "	\$(do-install)"; 				      \
	 done;								      \
	 echo 'sysd-rules-done =3D t') > /intel/poky/builds/lsb/tmp/work/core2-pok=
y-linux/eglibc-initial-2.13-r0+svnr13356/build-i586-poky-linux/sysd-rulesT
mv -f /intel/poky/builds/lsb/tmp/work/core2-poky-linux/eglibc-initial-2.13-=
r0+svnr13356/build-i586-poky-linux/sysd-rulesT /intel/poky/builds/lsb/tmp/w=
ork/core2-poky-linux/eglibc-initial-2.13-r0+svnr13356/build-i586-poky-linux=
/sysd-rules
for dir in /intel/poky/builds/lsb/tmp/work/core2-poky-linux/eglibc-initial-=
2.13-r0+svnr13356/build-i586-poky-linux sysdeps/i386/elf nptl/sysdeps/unix/=
sysv/linux/i386/i586 nptl/sysdeps/unix/sysv/linux/i386 sysdeps/unix/sysv/li=
nux/i386 nptl/sysdeps/unix/sysv/linux nptl/sysdeps/pthread sysdeps/pthread =
ports/sysdeps/unix/sysv/linux sysdeps/unix/sysv/linux sysdeps/gnu sysdeps/u=
nix/common sysdeps/unix/mman sysdeps/unix/inet ports/sysdeps/unix/sysv/i386=
 sysdeps/unix/sysv/i386 nptl/sysdeps/unix/sysv ports/sysdeps/unix/sysv sysd=
eps/unix/sysv sysdeps/unix/i386 nptl/sysdeps/unix ports/sysdeps/unix sysdep=
s/unix sysdeps/posix nptl/sysdeps/i386/i586 sysdeps/i386/i586 sysdeps/i386/=
i486 nptl/sysdeps/i386/i486 sysdeps/i386/fpu nptl/sysdeps/i386 sysdeps/i386=
 sysdeps/wordsize-32 sysdeps/ieee754/ldbl-96 sysdeps/ieee754/dbl-64 sysdeps=
/ieee754/flt-32 sysdeps/ieee754 sysdeps/generic/elf sysdeps/generic  nptl  =
ports; do \
	  test -f $dir/syscalls.list && \
	  { sysdirs=3D'sysdeps/i386/elf nptl/sysdeps/unix/sysv/linux/i386/i586 npt=
l/sysdeps/unix/sysv/linux/i386 sysdeps/unix/sysv/linux/i386 nptl/sysdeps/un=
ix/sysv/linux nptl/sysdeps/pthread sysdeps/pthread ports/sysdeps/unix/sysv/=
linux sysdeps/unix/sysv/linux sysdeps/gnu sysdeps/unix/common sysdeps/unix/=
mman sysdeps/unix/inet ports/sysdeps/unix/sysv/i386 sysdeps/unix/sysv/i386 =
nptl/sysdeps/unix/sysv ports/sysdeps/unix/sysv sysdeps/unix/sysv sysdeps/un=
ix/i386 nptl/sysdeps/unix ports/sysdeps/unix sysdeps/unix sysdeps/posix npt=
l/sysdeps/i386/i586 sysdeps/i386/i586 sysdeps/i386/i486 nptl/sysdeps/i386/i=
486 sysdeps/i386/fpu nptl/sysdeps/i386 sysdeps/i386 sysdeps/wordsize-32 sys=
deps/ieee754/ldbl-96 sysdeps/ieee754/dbl-64 sysdeps/ieee754/flt-32 sysdeps/=
ieee754 sysdeps/generic/elf sysdeps/generic' \
	    asm_CPP=3D'i586-poky-linux-gcc -m32 -march=3Dcore2 -msse3 -mtune=3Dgen=
eric -mfpmath=3Dsse --sysroot=3D/intel/poky/builds/lsb/tmp/sysroots/n450-tc=
bootstrap -c  -Iinclude  @/intel/poky/builds/lsb/tmp/work/core2-poky-linux/=
eglibc-initial-2.13-r0+svnr13356/build-i586-poky-linux/includes  -Ilibio -I=
. -D_LIBC_REENTRANT -include include/libc-symbols.h       -DASSEMBLER  -DGA=
S_SYNTAX -g -Wa,--noexecstack   -E -x assembler-with-cpp' \
	    /bin/sh sysdeps/unix/make-syscalls.sh $dir || exit 1; }; \
	  test $dir =3D sysdeps/unix && break; \
	done > /intel/poky/builds/lsb/tmp/work/core2-poky-linux/eglibc-initial-2.1=
3-r0+svnr13356/build-i586-poky-linux/sysd-syscallsT
mv -f /intel/poky/builds/lsb/tmp/work/core2-poky-linux/eglibc-initial-2.13-=
r0+svnr13356/build-i586-poky-linux/sysd-syscallsT /intel/poky/builds/lsb/tm=
p/work/core2-poky-linux/eglibc-initial-2.13-r0+svnr13356/build-i586-poky-li=
nux/sysd-syscalls
gawk -f scripts/gen-sorted.awk \
	       -v subdirs=3D'csu assert ctype locale intl catgets math setjmp sign=
al stdlib stdio-common libio malloc string wcsmbs time dirent grp pwd posix=
 io termios resource misc socket sysvipc gmon gnulib iconv iconvdata wctype=
 manual shadow gshadow po argp crypt nss localedata timezone rt conform deb=
ug libidn dlfcn elf' \
	       -v srcpfx=3D'' \
	       nptl/sysdeps/pthread/Subdirs sysdeps/unix/inet/Subdirs sysdeps/unix=
/Subdirs assert/Depend intl/Depend catgets/Depend stdlib/Depend stdio-commo=
n/Depend libio/Depend malloc/Depend string/Depend wcsmbs/Depend time/Depend=
 posix/Depend iconvdata/Depend nss/Depend localedata/Depend rt/Depend debug=
/Depend > /intel/poky/builds/lsb/tmp/work/core2-poky-linux/eglibc-initial-2=
.13-r0+svnr13356/build-i586-poky-linux/sysd-sorted-tmp
mv -f /intel/poky/builds/lsb/tmp/work/core2-poky-linux/eglibc-initial-2.13-=
r0+svnr13356/build-i586-poky-linux/sysd-sorted-tmp /intel/poky/builds/lsb/t=
mp/work/core2-poky-linux/eglibc-initial-2.13-r0+svnr13356/build-i586-poky-l=
inux/sysd-sorted
make[1]: Leaving directory `/intel/poky/builds/lsb/tmp/work/core2-poky-linu=
x/eglibc-initial-2.13-r0+svnr13356/eglibc-2_13/libc'
make[1]: Entering directory `/intel/poky/builds/lsb/tmp/work/core2-poky-lin=
ux/eglibc-initial-2.13-r0+svnr13356/eglibc-2_13/libc'
{ echo '#include "posix/bits/posix1_lim.h"';		\
	  echo '#define _LIBC 1';					\
	  echo '#include "misc/sys/uio.h"'; } |			\
	i586-poky-linux-gcc -m32 -march=3Dcore2 -msse3 -mtune=3Dgeneric -mfpmath=
=3Dsse --sysroot=3D/intel/poky/builds/lsb/tmp/sysroots/n450-tcbootstrap -E =
-dM -MD -MP -MF /intel/poky/builds/lsb/tmp/work/core2-poky-linux/eglibc-ini=
tial-2.13-r0+svnr13356/build-i586-poky-linux/bits/stdio_lim.dT -MT '/intel/=
poky/builds/lsb/tmp/work/core2-poky-linux/eglibc-initial-2.13-r0+svnr13356/=
build-i586-poky-linux/bits/stdio_lim.h /intel/poky/builds/lsb/tmp/work/core=
2-poky-linux/eglibc-initial-2.13-r0+svnr13356/build-i586-poky-linux/bits/st=
dio_lim.d' 	\
	      -Iinclude  @/intel/poky/builds/lsb/tmp/work/core2-poky-linux/eglibc-=
initial-2.13-r0+svnr13356/build-i586-poky-linux/includes  -Ilibio -I. -xc -=
 -o /intel/poky/builds/lsb/tmp/work/core2-poky-linux/eglibc-initial-2.13-r0=
+svnr13356/build-i586-poky-linux/bits/stdio_lim.hT
sed -e 's@ /intel/poky/builds/lsb/tmp/work/core2-poky-linux/eglibc-initial-=
2\.13-r0+svnr13356/build-i586-poky-linux/@ $(common-objpfx)@g' -e 's@^/inte=
l/poky/builds/lsb/tmp/work/core2-poky-linux/eglibc-initial-2\.13-r0+svnr133=
56/build-i586-poky-linux/@$(common-objpfx)@g' -e 's@  *\([^ 	\/$][^ 	\]*\)@=
 $(..)\1@g' -e 's@^\([^ 	\/$][^ 	\]*\)@$(..)\1@g'			\
	    /intel/poky/builds/lsb/tmp/work/core2-poky-linux/eglibc-initial-2.13-r=
0+svnr13356/build-i586-poky-linux/bits/stdio_lim.dT > /intel/poky/builds/ls=
b/tmp/work/core2-poky-linux/eglibc-initial-2.13-r0+svnr13356/build-i586-pok=
y-linux/bits/stdio_lim.dt
mv -f /intel/poky/builds/lsb/tmp/work/core2-poky-linux/eglibc-initial-2.13-=
r0+svnr13356/build-i586-poky-linux/bits/stdio_lim.dt /intel/poky/builds/lsb=
/tmp/work/core2-poky-linux/eglibc-initial-2.13-r0+svnr13356/build-i586-poky=
-linux/bits/stdio_lim.d
fopen_max=3D`sed -n 's/^#define OPEN_MAX //1p' /intel/poky/builds/lsb/tmp/w=
ork/core2-poky-linux/eglibc-initial-2.13-r0+svnr13356/build-i586-poky-linux=
/bits/stdio_lim.hT`; 	\
	filename_max=3D`sed -n 's/^#define PATH_MAX //1p' /intel/poky/builds/lsb/t=
mp/work/core2-poky-linux/eglibc-initial-2.13-r0+svnr13356/build-i586-poky-l=
inux/bits/stdio_lim.hT`;	\
	iov_max=3D`sed -n 's/^#define UIO_MAXIOV //p' /intel/poky/builds/lsb/tmp/w=
ork/core2-poky-linux/eglibc-initial-2.13-r0+svnr13356/build-i586-poky-linux=
/bits/stdio_lim.hT`;	\
	fopen_max=3D${fopen_max:-16};					\
	filename_max=3D${filename_max:-1024};				\
	if [ -z "$iov_max" ]; then					\
	  define_iov_max=3D"# undef IOV_MAX";				\
	else								\
	  define_iov_max=3D"# define IOV_MAX $iov_max";			\
	fi;								\
	sed -e "s/@FOPEN_MAX@/$fopen_max/"				\
	    -e "s/@FILENAME_MAX@/$filename_max/"			\
	    -e "s/@L_tmpnam@/20/"				\
	    -e "s/@TMP_MAX@/238328/"				\
	    -e "s/@L_ctermid@/9/"				\
	    -e "s/@L_cuserid@/9/"				\
	    -e "s/@define_IOV_MAX@/$define_iov_max/"			\
	    stdio-common/stdio_lim.h.in > /intel/poky/builds/lsb/tmp/work/core2-po=
ky-linux/eglibc-initial-2.13-r0+svnr13356/build-i586-poky-linux/bits/stdio_=
lim.h.new
/bin/sh scripts/move-if-change /intel/poky/builds/lsb/tmp/work/core2-poky-l=
inux/eglibc-initial-2.13-r0+svnr13356/build-i586-poky-linux/bits/stdio_lim.=
h.new /intel/poky/builds/lsb/tmp/work/core2-poky-linux/eglibc-initial-2.13-=
r0+svnr13356/build-i586-poky-linux/bits/stdio_lim.h
rm -f /intel/poky/builds/lsb/tmp/work/core2-poky-linux/eglibc-initial-2.13-=
r0+svnr13356/build-i586-poky-linux/bits/stdio_lim.hT /intel/poky/builds/lsb=
/tmp/work/core2-poky-linux/eglibc-initial-2.13-r0+svnr13356/build-i586-poky=
-linux/bits/stdio_lim.dT /intel/poky/builds/lsb/tmp/work/core2-poky-linux/e=
glibc-initial-2.13-r0+svnr13356/build-i586-poky-linux/bits/stdio_lim.dt
touch /intel/poky/builds/lsb/tmp/work/core2-poky-linux/eglibc-initial-2.13-=
r0+svnr13356/build-i586-poky-linux/bits/stdio_lim.st
/bin/sh scripts/gen-libc-abis \
		 i386-poky-linux-gnu \
		 < libc-abis > /intel/poky/builds/lsb/tmp/work/core2-poky-linux/eglibc-in=
itial-2.13-r0+svnr13356/build-i586-poky-linux/libc-abis.hT
/bin/sh scripts/move-if-change /intel/poky/builds/lsb/tmp/work/core2-poky-l=
inux/eglibc-initial-2.13-r0+svnr13356/build-i586-poky-linux/libc-abis.hT /i=
ntel/poky/builds/lsb/tmp/work/core2-poky-linux/eglibc-initial-2.13-r0+svnr1=
3356/build-i586-poky-linux/libc-abis.h
touch /intel/poky/builds/lsb/tmp/work/core2-poky-linux/eglibc-initial-2.13-=
r0+svnr13356/build-i586-poky-linux/libc-abis.stamp
sed '/^[ 	]*%/!s/#.*$//;/^[ 	]*$/d;s/^[ 	]*%/#/' \
	    nptl/shlib-versions libidn/shlib-versions nptl_db/shlib-versions shlib=
-versions \
	| i586-poky-linux-gcc -m32 -march=3Dcore2 -msse3 -mtune=3Dgeneric -mfpmath=
=3Dsse --sysroot=3D/intel/poky/builds/lsb/tmp/sysroots/n450-tcbootstrap -E =
-undef  -Iinclude  @/intel/poky/builds/lsb/tmp/work/core2-poky-linux/eglibc=
-initial-2.13-r0+svnr13356/build-i586-poky-linux/includes  -Ilibio -I. -D_L=
IBC_REENTRANT -include include/libc-symbols.h       -x assembler-with-cpp -=
 \
		   > /intel/poky/builds/lsb/tmp/work/core2-poky-linux/eglibc-initial-2.13=
-r0+svnr13356/build-i586-poky-linux/shlib-versions.v.iT
mv -f /intel/poky/builds/lsb/tmp/work/core2-poky-linux/eglibc-initial-2.13-=
r0+svnr13356/build-i586-poky-linux/shlib-versions.v.iT /intel/poky/builds/l=
sb/tmp/work/core2-poky-linux/eglibc-initial-2.13-r0+svnr13356/build-i586-po=
ky-linux/shlib-versions.v.i
sed '/^[ 	]*#/d;/^[ 	]*$/d' /intel/poky/builds/lsb/tmp/work/core2-poky-linu=
x/eglibc-initial-2.13-r0+svnr13356/build-i586-poky-linux/shlib-versions.v.i=
 > /intel/poky/builds/lsb/tmp/work/core2-poky-linux/eglibc-initial-2.13-r0+=
svnr13356/build-i586-poky-linux/shlib-versions.vT
mv -f /intel/poky/builds/lsb/tmp/work/core2-poky-linux/eglibc-initial-2.13-=
r0+svnr13356/build-i586-poky-linux/shlib-versions.vT /intel/poky/builds/lsb=
/tmp/work/core2-poky-linux/eglibc-initial-2.13-r0+svnr13356/build-i586-poky=
-linux/shlib-versions.v
gawk -v default_setname=3D'' \
	       -v cpu=3D'i586' \
	       -v vendor=3D'poky' \
	       -v os=3D'linux-gnu' \
	       -f scripts/soversions.awk /intel/poky/builds/lsb/tmp/work/core2-pok=
y-linux/eglibc-initial-2.13-r0+svnr13356/build-i586-poky-linux/shlib-versio=
ns.v > /intel/poky/builds/lsb/tmp/work/core2-poky-linux/eglibc-initial-2.13=
-r0+svnr13356/build-i586-poky-linux/soversions.iT
mv -f /intel/poky/builds/lsb/tmp/work/core2-poky-linux/eglibc-initial-2.13-=
r0+svnr13356/build-i586-poky-linux/soversions.iT /intel/poky/builds/lsb/tmp=
/work/core2-poky-linux/eglibc-initial-2.13-r0+svnr13356/build-i586-poky-lin=
ux/soversions.i
sed '/^[ 	]*%/!s/#.*$//;/^[ 	]*$/d;s/^[ 	]*%/#/' \
	    Versions.def \
	| i586-poky-linux-gcc -m32 -march=3Dcore2 -msse3 -mtune=3Dgeneric -mfpmath=
=3Dsse --sysroot=3D/intel/poky/builds/lsb/tmp/sysroots/n450-tcbootstrap -E =
-undef  -Iinclude  @/intel/poky/builds/lsb/tmp/work/core2-poky-linux/eglibc=
-initial-2.13-r0+svnr13356/build-i586-poky-linux/includes  -Ilibio -I. -D_L=
IBC_REENTRANT -include include/libc-symbols.h       -x assembler-with-cpp -=
 \
		   > /intel/poky/builds/lsb/tmp/work/core2-poky-linux/eglibc-initial-2.13=
-r0+svnr13356/build-i586-poky-linux/Versions.def.v.iT
mv -f /intel/poky/builds/lsb/tmp/work/core2-poky-linux/eglibc-initial-2.13-=
r0+svnr13356/build-i586-poky-linux/Versions.def.v.iT /intel/poky/builds/lsb=
/tmp/work/core2-poky-linux/eglibc-initial-2.13-r0+svnr13356/build-i586-poky=
-linux/Versions.def.v.i
sed '/^[ 	]*#/d;/^[ 	]*$/d' /intel/poky/builds/lsb/tmp/work/core2-poky-linu=
x/eglibc-initial-2.13-r0+svnr13356/build-i586-poky-linux/Versions.def.v.i >=
 /intel/poky/builds/lsb/tmp/work/core2-poky-linux/eglibc-initial-2.13-r0+sv=
nr13356/build-i586-poky-linux/Versions.def.vT
mv -f /intel/poky/builds/lsb/tmp/work/core2-poky-linux/eglibc-initial-2.13-=
r0+svnr13356/build-i586-poky-linux/Versions.def.vT /intel/poky/builds/lsb/t=
mp/work/core2-poky-linux/eglibc-initial-2.13-r0+svnr13356/build-i586-poky-l=
inux/Versions.def.v
{ while read which lib version setname; do \
	    test x"$which" =3D xDEFAULT || continue; \
	    test -z "$setname" || echo "$lib : $setname"; \
	  done < /intel/poky/builds/lsb/tmp/work/core2-poky-linux/eglibc-initial-2=
.13-r0+svnr13356/build-i586-poky-linux/soversions.i; \
	  cat /intel/poky/builds/lsb/tmp/work/core2-poky-linux/eglibc-initial-2.13=
-r0+svnr13356/build-i586-poky-linux/Versions.def.v; \
	} | LC_ALL=3DC gawk -f scripts/firstversions.awk > /intel/poky/builds/lsb/=
tmp/work/core2-poky-linux/eglibc-initial-2.13-r0+svnr13356/build-i586-poky-=
linux/Versions.allT
mv -f /intel/poky/builds/lsb/tmp/work/core2-poky-linux/eglibc-initial-2.13-=
r0+svnr13356/build-i586-poky-linux/Versions.allT /intel/poky/builds/lsb/tmp=
/work/core2-poky-linux/eglibc-initial-2.13-r0+svnr13356/build-i586-poky-lin=
ux/Versions.all
LC_ALL=3DC gawk -v oldest_abi=3Ddefault -f scripts/abi-versions.awk /intel/=
poky/builds/lsb/tmp/work/core2-poky-linux/eglibc-initial-2.13-r0+svnr13356/=
build-i586-poky-linux/Versions.all > /intel/poky/builds/lsb/tmp/work/core2-=
poky-linux/eglibc-initial-2.13-r0+svnr13356/build-i586-poky-linux/abi-versi=
ons.hT
mv -f /intel/poky/builds/lsb/tmp/work/core2-poky-linux/eglibc-initial-2.13-=
r0+svnr13356/build-i586-poky-linux/abi-versions.hT /intel/poky/builds/lsb/t=
mp/work/core2-poky-linux/eglibc-initial-2.13-r0+svnr13356/build-i586-poky-l=
inux/abi-versions.h
./scripts/mkinstalldirs /intel/poky/builds/lsb/tmp/work/core2-poky-linux/eg=
libc-initial-2.13-r0+svnr13356/build-i586-poky-linux/gnu
mkdir /intel/poky/builds/lsb/tmp/work/core2-poky-linux/eglibc-initial-2.13-=
r0+svnr13356/build-i586-poky-linux/gnu
LC_ALL=3DC gawk -f scripts/option-groups.awk option-groups.defaults > /inte=
l/poky/builds/lsb/tmp/work/core2-poky-linux/eglibc-initial-2.13-r0+svnr1335=
6/build-i586-poky-linux/gnu/option-groups.T
/bin/sh scripts/move-if-change /intel/poky/builds/lsb/tmp/work/core2-poky-l=
inux/eglibc-initial-2.13-r0+svnr13356/build-i586-poky-linux/gnu/option-grou=
ps.T /intel/poky/builds/lsb/tmp/work/core2-poky-linux/eglibc-initial-2.13-r=
0+svnr13356/build-i586-poky-linux/gnu/option-groups.h
touch /intel/poky/builds/lsb/tmp/work/core2-poky-linux/eglibc-initial-2.13-=
r0+svnr13356/build-i586-poky-linux/gnu/option-groups.stmp
rm -f /intel/poky/builds/lsb/tmp/work/core2-poky-linux/eglibc-initial-2.13-=
r0+svnr13356/build-i586-poky-linux/tls.makeT /intel/poky/builds/lsb/tmp/wor=
k/core2-poky-linux/eglibc-initial-2.13-r0+svnr13356/build-i586-poky-linux/t=
ls.make.dT
(echo '# Generated from tls.make.c by Makerules.'; \
	 i586-poky-linux-gcc -m32 -march=3Dcore2 -msse3 -mtune=3Dgeneric -mfpmath=
=3Dsse --sysroot=3D/intel/poky/builds/lsb/tmp/sysroots/n450-tcbootstrap -st=
d=3Dgnu99 -fgnu89-inline -O2 -Wall -Winline -Wwrite-strings -fmerge-all-con=
stants -g -Wstrict-prototypes -mpreferred-stack-boundary=3D2     -Iinclude =
 @/intel/poky/builds/lsb/tmp/work/core2-poky-linux/eglibc-initial-2.13-r0+s=
vnr13356/build-i586-poky-linux/includes  -Ilibio -I. -D_LIBC_REENTRANT -inc=
lude include/libc-symbols.h       -E -DASSEMBLER tls.make.c \
	       -MD -MP -MT '$(common-objpfx)tls.make' -MF /intel/poky/builds/lsb/t=
mp/work/core2-poky-linux/eglibc-initial-2.13-r0+svnr13356/build-i586-poky-l=
inux/tls.make.dT \
	 | sed -n '/@@@/{s/@@@[	 ]*\(.*\)@@@/\1/;s/[	 ]*$//p;}'; \
	 echo 'common-generated +=3D tls.make'; \
	 sed -e 's@ /intel/poky/builds/lsb/tmp/work/core2-poky-linux/eglibc-initia=
l-2\.13-r0+svnr13356/build-i586-poky-linux/@ $(common-objpfx)@g' -e 's@^/in=
tel/poky/builds/lsb/tmp/work/core2-poky-linux/eglibc-initial-2\.13-r0+svnr1=
3356/build-i586-poky-linux/@$(common-objpfx)@g' -e 's@  *\([^ 	\/$][^ 	\]*\=
)@ $(..)\1@g' -e 's@^\([^ 	\/$][^ 	\]*\)@$(..)\1@g' /intel/poky/builds/lsb/=
tmp/work/core2-poky-linux/eglibc-initial-2.13-r0+svnr13356/build-i586-poky-=
linux/tls.make.dT; \
	 rm -f /intel/poky/builds/lsb/tmp/work/core2-poky-linux/eglibc-initial-2.1=
3-r0+svnr13356/build-i586-poky-linux/tls.make.dT) > /intel/poky/builds/lsb/=
tmp/work/core2-poky-linux/eglibc-initial-2.13-r0+svnr13356/build-i586-poky-=
linux/tls.makeT
mv -f /intel/poky/builds/lsb/tmp/work/core2-poky-linux/eglibc-initial-2.13-=
r0+svnr13356/build-i586-poky-linux/tls.makeT /intel/poky/builds/lsb/tmp/wor=
k/core2-poky-linux/eglibc-initial-2.13-r0+svnr13356/build-i586-poky-linux/t=
ls.make
sed '/^[ 	]*%/!s/#.*$//;/^[ 	]*$/d;s/^[ 	]*%/#/' \
	    csu/Versions iconv/Versions locale/Versions assert/Versions ctype/Vers=
ions intl/Versions catgets/Versions math/Versions setjmp/Versions signal/Ve=
rsions stdlib/Versions stdio-common/Versions libio/Versions dlfcn/Versions =
malloc/Versions string/Versions wcsmbs/Versions time/Versions dirent/Versio=
ns grp/Versions pwd/Versions posix/Versions io/Versions termios/Versions re=
source/Versions misc/Versions socket/Versions sysvipc/Versions gmon/Version=
s wctype/Versions shadow/Versions gshadow/Versions argp/Versions crypt/Vers=
ions nptl/Versions resolv/Versions nss/Versions rt/Versions debug/Versions =
libidn/Versions nptl_db/Versions inet/Versions hesiod/Versions sunrpc/Versi=
ons nis/Versions streams/Versions login/Versions elf/Versions sysdeps/i386/=
elf/Versions sysdeps/unix/sysv/linux/i386/Versions nptl/sysdeps/unix/sysv/l=
inux/Versions sysdeps/pthread/Versions sysdeps/unix/sysv/linux/Versions sys=
deps/unix/sysv/Versions sysdeps/i386/i486/Versions sysdeps/i386/fpu/Version=
s sysdeps/i386/Versions sysdeps/wordsize-32/Versions \
	| i586-poky-linux-gcc -m32 -march=3Dcore2 -msse3 -mtune=3Dgeneric -mfpmath=
=3Dsse --sysroot=3D/intel/poky/builds/lsb/tmp/sysroots/n450-tcbootstrap -E =
-undef  -Iinclude  @/intel/poky/builds/lsb/tmp/work/core2-poky-linux/eglibc=
-initial-2.13-r0+svnr13356/build-i586-poky-linux/includes  -Ilibio -I. -D_L=
IBC_REENTRANT -include include/libc-symbols.h       -x assembler-with-cpp -=
 \
		   > /intel/poky/builds/lsb/tmp/work/core2-poky-linux/eglibc-initial-2.13=
-r0+svnr13356/build-i586-poky-linux/Versions.v.iT
mv -f /intel/poky/builds/lsb/tmp/work/core2-poky-linux/eglibc-initial-2.13-=
r0+svnr13356/build-i586-poky-linux/Versions.v.iT /intel/poky/builds/lsb/tmp=
/work/core2-poky-linux/eglibc-initial-2.13-r0+svnr13356/build-i586-poky-lin=
ux/Versions.v.i
sed '/^[ 	]*#/d;/^[ 	]*$/d' /intel/poky/builds/lsb/tmp/work/core2-poky-linu=
x/eglibc-initial-2.13-r0+svnr13356/build-i586-poky-linux/Versions.v.i > /in=
tel/poky/builds/lsb/tmp/work/core2-poky-linux/eglibc-initial-2.13-r0+svnr13=
356/build-i586-poky-linux/Versions.vT
mv -f /intel/poky/builds/lsb/tmp/work/core2-poky-linux/eglibc-initial-2.13-=
r0+svnr13356/build-i586-poky-linux/Versions.vT /intel/poky/builds/lsb/tmp/w=
ork/core2-poky-linux/eglibc-initial-2.13-r0+svnr13356/build-i586-poky-linux=
/Versions.v
( echo 'sysd-versions-subdirs =3D csu iconv locale localedata iconvdata ass=
ert ctype intl catgets math setjmp signal stdlib stdio-common libio dlfcn m=
alloc string wcsmbs timezone time dirent grp pwd posix io termios resource =
misc socket sysvipc gmon gnulib wctype manual shadow gshadow po argp crypt =
nptl resolv nss rt conform debug libidn nptl_db inet hesiod sunrpc nis nscd=
 streams login elf sysdeps/i386/elf nptl/sysdeps/unix/sysv/linux/i386/i586 =
nptl/sysdeps/unix/sysv/linux/i386 sysdeps/unix/sysv/linux/i386 nptl/sysdeps=
/unix/sysv/linux nptl/sysdeps/pthread sysdeps/pthread ports/sysdeps/unix/sy=
sv/linux sysdeps/unix/sysv/linux sysdeps/gnu sysdeps/unix/common sysdeps/un=
ix/mman sysdeps/unix/inet ports/sysdeps/unix/sysv/i386 sysdeps/unix/sysv/i3=
86 nptl/sysdeps/unix/sysv ports/sysdeps/unix/sysv sysdeps/unix/sysv sysdeps=
/unix/i386 nptl/sysdeps/unix ports/sysdeps/unix sysdeps/unix sysdeps/posix =
nptl/sysdeps/i386/i586 sysdeps/i386/i586 sysdeps/i386/i486 nptl/sysdeps/i38=
6/i486 sysdeps/i386/fpu nptl/sysdeps/i386 sysdeps/i386 sysdeps/wordsize-32 =
sysdeps/ieee754/ldbl-96 sysdeps/ieee754/dbl-64 sysdeps/ieee754/flt-32 sysde=
ps/ieee754 sysdeps/generic/elf sysdeps/generic' ; \
	  cat /intel/poky/builds/lsb/tmp/work/core2-poky-linux/eglibc-initial-2.13=
-r0+svnr13356/build-i586-poky-linux/Versions.v \
	  | LC_ALL=3DC gawk -v buildroot=3D/intel/poky/builds/lsb/tmp/work/core2-p=
oky-linux/eglibc-initial-2.13-r0+svnr13356/build-i586-poky-linux/ -v defsfi=
le=3D/intel/poky/builds/lsb/tmp/work/core2-poky-linux/eglibc-initial-2.13-r=
0+svnr13356/build-i586-poky-linux/Versions.all \
			    -v move_if_change=3D'/bin/sh scripts/move-if-change' \
			    -v versioning=3Dyes \
			    -f scripts/versions.awk; \
	) > /intel/poky/builds/lsb/tmp/work/core2-poky-linux/eglibc-initial-2.13-r=
0+svnr13356/build-i586-poky-linux/sysd-versionsT
mv -f /intel/poky/builds/lsb/tmp/work/core2-poky-linux/eglibc-initial-2.13-=
r0+svnr13356/build-i586-poky-linux/sysd-versionsT /intel/poky/builds/lsb/tm=
p/work/core2-poky-linux/eglibc-initial-2.13-r0+svnr13356/build-i586-poky-li=
nux/sysd-versions
(seen_DEFAULT=3D0; seen_WORDSIZE32=3D0; seen_WORDSIZE64=3D0; \
	 while read which lib number setname; do \
	   eval seen_$which=3D1; \
	   test x"$which" !=3D xABI || echo abi-name =3D "$lib"; \
	   test x"$which" =3D xDEFAULT || continue; \
	   case $number in \
	     [0-9]*) echo "$lib.so-version=3D.$number"; \
		     echo "all-sonames+=3D$lib=3D$lib.so\$($lib.so-version)";;\
	     *)	     echo "$lib.so-version=3D$number"; \
		     echo "all-sonames+=3D$lib=3D\$($lib.so-version)";;\
	   esac; \
	 done; \
	 case "$seen_DEFAULT$seen_WORDSIZE32$seen_WORDSIZE64" in \
	   100) echo biarch =3D no;; \
	   101) echo biarch =3D 32;; \
	   ?1?) echo biarch =3D 64;; \
	   *) echo >&2 BUG; exit 2;; \
	 esac; \
	 echo soversions.mk-done =3D t;) < /intel/poky/builds/lsb/tmp/work/core2-p=
oky-linux/eglibc-initial-2.13-r0+svnr13356/build-i586-poky-linux/soversions=
.i > /intel/poky/builds/lsb/tmp/work/core2-poky-linux/eglibc-initial-2.13-r=
0+svnr13356/build-i586-poky-linux/soversions.mkT; exit 0
mv -f /intel/poky/builds/lsb/tmp/work/core2-poky-linux/eglibc-initial-2.13-=
r0+svnr13356/build-i586-poky-linux/soversions.mkT /intel/poky/builds/lsb/tm=
p/work/core2-poky-linux/eglibc-initial-2.13-r0+svnr13356/build-i586-poky-li=
nux/soversions.mk
make[1]: Leaving directory `/intel/poky/builds/lsb/tmp/work/core2-poky-linu=
x/eglibc-initial-2.13-r0+svnr13356/eglibc-2_13/libc'
make[1]: Entering directory `/intel/poky/builds/lsb/tmp/work/core2-poky-lin=
ux/eglibc-initial-2.13-r0+svnr13356/eglibc-2_13/libc'
LC_ALL=3DC gawk -f scripts/lib-names.awk /intel/poky/builds/lsb/tmp/work/co=
re2-poky-linux/eglibc-initial-2.13-r0+svnr13356/build-i586-poky-linux/sover=
sions.i > /intel/poky/builds/lsb/tmp/work/core2-poky-linux/eglibc-initial-2=
.13-r0+svnr13356/build-i586-poky-linux/gnu/lib-names.T
/bin/sh scripts/move-if-change /intel/poky/builds/lsb/tmp/work/core2-poky-l=
inux/eglibc-initial-2.13-r0+svnr13356/build-i586-poky-linux/gnu/lib-names.T=
 /intel/poky/builds/lsb/tmp/work/core2-poky-linux/eglibc-initial-2.13-r0+sv=
nr13356/build-i586-poky-linux/gnu/lib-names.h
touch /intel/poky/builds/lsb/tmp/work/core2-poky-linux/eglibc-initial-2.13-=
r0+svnr13356/build-i586-poky-linux/gnu/lib-names.stmp
rm -f /intel/poky/builds/lsb/tmp/work/core2-poky-linux/eglibc-initial-2.13-=
r0+svnr13356/build-i586-poky-linux/tls.makeT /intel/poky/builds/lsb/tmp/wor=
k/core2-poky-linux/eglibc-initial-2.13-r0+svnr13356/build-i586-poky-linux/t=
ls.make.dT
(echo '# Generated from tls.make.c by Makerules.'; \
	 i586-poky-linux-gcc -m32 -march=3Dcore2 -msse3 -mtune=3Dgeneric -mfpmath=
=3Dsse --sysroot=3D/intel/poky/builds/lsb/tmp/sysroots/n450-tcbootstrap -st=
d=3Dgnu99 -fgnu89-inline -O2 -Wall -Winline -Wwrite-strings -fmerge-all-con=
stants -g -Wstrict-prototypes -mpreferred-stack-boundary=3D2     -Iinclude =
 @/intel/poky/builds/lsb/tmp/work/core2-poky-linux/eglibc-initial-2.13-r0+s=
vnr13356/build-i586-poky-linux/includes  -Ilibio -I. -D_LIBC_REENTRANT -inc=
lude include/libc-symbols.h       -E -DASSEMBLER tls.make.c \
	       -MD -MP -MT '$(common-objpfx)tls.make' -MF /intel/poky/builds/lsb/t=
mp/work/core2-poky-linux/eglibc-initial-2.13-r0+svnr13356/build-i586-poky-l=
inux/tls.make.dT \
	 | sed -n '/@@@/{s/@@@[	 ]*\(.*\)@@@/\1/;s/[	 ]*$//p;}'; \
	 echo 'common-generated +=3D tls.make'; \
	 sed -e 's@ /intel/poky/builds/lsb/tmp/work/core2-poky-linux/eglibc-initia=
l-2\.13-r0+svnr13356/build-i586-poky-linux/@ $(common-objpfx)@g' -e 's@^/in=
tel/poky/builds/lsb/tmp/work/core2-poky-linux/eglibc-initial-2\.13-r0+svnr1=
3356/build-i586-poky-linux/@$(common-objpfx)@g' -e 's@  *\([^ 	\/$][^ 	\]*\=
)@ $(..)\1@g' -e 's@^\([^ 	\/$][^ 	\]*\)@$(..)\1@g' /intel/poky/builds/lsb/=
tmp/work/core2-poky-linux/eglibc-initial-2.13-r0+svnr13356/build-i586-poky-=
linux/tls.make.dT; \
	 rm -f /intel/poky/builds/lsb/tmp/work/core2-poky-linux/eglibc-initial-2.1=
3-r0+svnr13356/build-i586-poky-linux/tls.make.dT) > /intel/poky/builds/lsb/=
tmp/work/core2-poky-linux/eglibc-initial-2.13-r0+svnr13356/build-i586-poky-=
linux/tls.makeT
mv -f /intel/poky/builds/lsb/tmp/work/core2-poky-linux/eglibc-initial-2.13-=
r0+svnr13356/build-i586-poky-linux/tls.makeT /intel/poky/builds/lsb/tmp/wor=
k/core2-poky-linux/eglibc-initial-2.13-r0+svnr13356/build-i586-poky-linux/t=
ls.make
make[1]: Leaving directory `/intel/poky/builds/lsb/tmp/work/core2-poky-linu=
x/eglibc-initial-2.13-r0+svnr13356/eglibc-2_13/libc'
make[1]: Entering directory `/intel/poky/builds/lsb/tmp/work/core2-poky-lin=
ux/eglibc-initial-2.13-r0+svnr13356/eglibc-2_13/libc'
make[1]: *** No rule to make target `6'.  Stop.
make[1]: Leaving directory `/intel/poky/builds/lsb/tmp/work/core2-poky-linu=
x/eglibc-initial-2.13-r0+svnr13356/eglibc-2_13/libc'
make: *** [6] Error 2
ERROR: oe_runmake failed
ERROR: Function 'do_install' failed (see /intel/poky/builds/lsb/tmp/work/co=
re2-poky-linux/eglibc-initial-2.13-r0+svnr13356/temp/log.do_install.29298 f=
or further information)
ERROR: Function 'do_install' failed (see /intel/poky/builds/lsb/tmp/work/co=
re2-poky-linux/eglibc-initial-2.13-r0+svnr13356/temp/log.do_install.29298 f=
or further information)

--------------080707000209080004080109--
