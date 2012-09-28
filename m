Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1THacJ-0005H3-69 for openembedded-core@lists.openembedded.org;
	Fri, 28 Sep 2012 15:28:31 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8SDFaNJ010353
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Sep 2012 14:15:36 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 09843-05 for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Sep 2012 14:15:32 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8SDFTQa010347
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Sep 2012 14:15:30 +0100
Message-ID: <1348838130.15753.45.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 28 Sep 2012 14:15:30 +0100
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: perl: Fix substitution madness
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 28 Sep 2012 13:28:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

We're going around in circles trying to fix the sed expressions and making one case
work and others not work. This patch fixes the base configuration file so we have
non-overlapping substitutions. I've tried to significantly clean up various problems
that were occurring once and for all.

This will hopefully resolve all the issues people have been seeing with incorrect perl
paths.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-devtools/perl/perl-5.14.2/config.sh b/meta/recipes-devtools/perl/perl-5.14.2/config.sh
index ed946d3..0d4ca1c 100644
--- a/meta/recipes-devtools/perl/perl-5.14.2/config.sh
+++ b/meta/recipes-devtools/perl/perl-5.14.2/config.sh
@@ -14,7 +14,7 @@
 
 : Configure command line arguments.
 config_arg0='Configure'
-config_args='-des -Doptimize=-O2 -Dmyhostname=localhost -Dperladmin=root@localhost -Dcc=gcc -Dcf_by=Open Embedded -Dinstallprefix=@DESTDIR@ -Dprefix=/usr -Dvendorprefix=/usr -Dsiteprefix=/usr -Dotherlibdirs=/usr/lib/perl5/5.14.2 -Duseshrplib -Dusethreads -Duseithreads -Duselargefiles -Ud_dosuid -Dd_semctl_semun -Ui_db -Ui_ndbm -Ui_gdbm -Di_shadow -Di_syslog -Dman3ext=3pm -Duseperlio -Dinstallusrbinperl -Ubincompat5005 -Uversiononly -Dpager=/usr/bin/less -isr'
+config_args='-des -Doptimize=-O2 -Dmyhostname=localhost -Dperladmin=root@localhost -Dcc=gcc -Dcf_by=Open Embedded -Dinstallprefix=@EXECPREFIX@ -Dprefix=@EXECPREFIX@ -Dvendorprefix=@EXECPREFIX@ -Dsiteprefix=@EXECPREFIX@ -Dotherlibdirs=@LIBDIR@/perl/5.14.2 -Duseshrplib -Dusethreads -Duseithreads -Duselargefiles -Ud_dosuid -Dd_semctl_semun -Ui_db -Ui_ndbm -Ui_gdbm -Di_shadow -Di_syslog -Dman3ext=3pm -Duseperlio -Dinstallusrbinperl -Ubincompat5005 -Uversiononly -Dpager=/usr/bin/less -isr'
 config_argc=28
 config_arg1='-des'
 config_arg2='-Doptimize=-O2'
@@ -22,11 +22,11 @@ config_arg3='-Dmyhostname=localhost'
 config_arg4='-Dperladmin=root@localhost'
 config_arg5='-Dcc=gcc'
 config_arg6='-Dcf_by=Open Embedded'
-config_arg7='-Dinstallprefix=@DESTDIR@'
-config_arg8='-Dprefix=/usr'
-config_arg9='-Dvendorprefix=/usr'
-config_arg10='-Dsiteprefix=/usr'
-config_arg11='-Dotherlibdirs=/usr/lib/perl5/5.14.2'
+config_arg7='-Dinstallprefix=@EXECPREFIX@'
+config_arg8='-Dprefix=@EXECPREFIX@'
+config_arg9='-Dvendorprefix=@EXECPREFIX@'
+config_arg10='-Dsiteprefix=@EXECPREFIX@'
+config_arg11='-Dotherlibdirs=@LIBDIR@/perl/5.14.2'
 config_arg12='-Duseshrplib'
 config_arg13='-Dusethreads'
 config_arg14='-Duseithreads'
@@ -67,8 +67,8 @@ api_subversion='0'
 api_version='14'
 api_versionstring='5.14.0'
 ar='ar'
-archlib='/usr/lib/perl5/5.14.2/@ARCH@-thread-multi'
-archlibexp='@STAGINGDIR@/usr/lib/perl5/5.14.2/@ARCH@-thread-multi'
+archlib='@LIBDIR@/perl/5.14.2/@ARCH@-thread-multi'
+archlibexp='@STAGINGDIR@@LIBDIR@/perl/5.14.2/@ARCH@-thread-multi'
 archname64=''
 archname='@ARCH@-thread-multi'
 archobjs=''
@@ -76,9 +76,9 @@ asctime_r_proto='REENTRANT_PROTO_B_SB'
 awk='awk'
 baserev='5.0'
 bash=''
-bin='/usr/bin'
+bin='@USRBIN@'
 bin_ELF='define'
-binexp='/usr/bin'
+binexp='@USRBIN@'
 bison='bison'
 byacc='byacc'
 c=''
@@ -86,7 +86,7 @@ castflags='0'
 cat='cat'
 cc='gcc'
 cccdlflags='-fPIC'
-ccdlflags='-Wl,-E -Wl,-rpath,/usr/lib/perl5/5.14.2/@ARCH@-thread-multi/CORE'
+ccdlflags='-Wl,-E -Wl,-rpath,@LIBDIR@/perl/5.14.2/@ARCH@-thread-multi/CORE'
 ccflags='-D_REENTRANT -D_GNU_SOURCE -fno-strict-aliasing -pipe -fstack-protector -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64'
 ccflags_uselargefiles='-D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64'
 ccname='gcc'
@@ -602,9 +602,9 @@ fpossize='16'
 fpostype='fpos_t'
 freetype='void'
 from=':'
-full_ar='/usr/bin/ar'
+full_ar='ar'
 full_csh='csh'
-full_sed='/bin/sed'
+full_sed='sed'
 gccansipedantic=''
 gccosandvers=''
 gccversion='4.5.1'
@@ -631,7 +631,7 @@ getspnam_r_proto='REENTRANT_PROTO_I_CSBWR'
 gidsign='1'
 gidsize='4'
 gidtype='gid_t'
-glibpth='/usr/shlib  /lib /usr/lib /usr/lib/386 /lib/386 /usr/ccs/lib /usr/ucblib /usr/local/lib '
+glibpth='@EXECPREFIX@/shlib @BASELIBDIR@ @LIBDIR@ @LIBDIR@/386 @BASELIBDIR@/386 @EXECPREFIX@/ccs/lib @EXECPREFIX@/ucblib @EXECPREFIX@/local/lib '
 gmake='gmake'
 gmtime_r_proto='REENTRANT_PROTO_S_TS'
 gnulibc_version='2.12.1'
@@ -745,35 +745,35 @@ inc_version_list=' '
 inc_version_list_init='0'
 incpath=''
 inews=''
-initialinstalllocation='/usr/bin'
-installarchlib='@DESTDIR@/lib/perl5/5.14.2/@ARCH@-thread-multi'
-installbin='@DESTDIR@/bin'
+initialinstalllocation='@USRBIN@'
+installarchlib='@LIBDIR@/perl/5.14.2/@ARCH@-thread-multi'
+installbin='@USRBIN@'
 installhtml1dir=''
 installhtml3dir=''
 installman1dir=''
 installman3dir=''
-installprefix='@DESTDIR@'
-installprefixexp='@DESTDIR@'
-installprivlib='@DESTDIR@/lib/perl5/5.14.2'
-installscript='@DESTDIR@/bin'
-installsitearch='@DESTDIR@/lib/perl5/site_perl/5.14.2/@ARCH@-thread-multi'
-installsitebin='@DESTDIR@/bin'
+installprefix='@EXECPREFIX@'
+installprefixexp='@EXECPREFIX@'
+installprivlib='@LIBDIR@/perl/5.14.2'
+installscript='@USRBIN@'
+installsitearch='@LIBDIR@/perl/site_perl/5.14.2/@ARCH@-thread-multi'
+installsitebin='@USRBIN@'
 installsitehtml1dir=''
 installsitehtml3dir=''
-installsitelib='@DESTDIR@/lib/perl5/site_perl/5.14.2'
+installsitelib='@LIBDIR@/perl/site_perl/5.14.2'
 installsiteman1dir=''
 installsiteman3dir=''
-installsitescript='@DESTDIR@/bin'
-installstyle='lib/perl5'
+installsitescript='@USRBIN@'
+installstyle='lib/perl'
 installusrbinperl='define'
-installvendorarch='@DESTDIR@/lib/perl5/vendor_perl/5.14.2/@ARCH@-thread-multi'
-installvendorbin='@DESTDIR@/bin'
+installvendorarch='@LIBDIR@/perl/vendor_perl/5.14.2/@ARCH@-thread-multi'
+installvendorbin='@USRBIN@'
 installvendorhtml1dir=''
 installvendorhtml3dir=''
-installvendorlib='@DESTDIR@/lib/perl5/vendor_perl/5.14.2'
+installvendorlib='@LIBDIR@/perl/vendor_perl/5.14.2'
 installvendorman1dir=''
 installvendorman3dir=''
-installvendorscript='@DESTDIR@/bin'
+installvendorscript='@USRBIN@'
 intsize='4'
 issymlink='test -h'
 ivdformat='"ld"'
@@ -787,14 +787,14 @@ ldflags_uselargefiles=''
 ldlibpthname='LD_LIBRARY_PATH'
 less='less'
 lib_ext='.a'
-libc='/lib/libc-2.12.1.so'
+libc='@BASELIBDIR@/libc-2.12.1.so'
 libperl='libperl.so'
-libpth='/lib /usr/lib'
+libpth='@BASELIBDIR@ @LIBDIR@'
 libs='-lnsl -lgdbm -ldb -ldl -lm -lcrypt -lutil -lpthread -lc'
-libsdirs=' /usr/lib'
+libsdirs=' @LIBDIR@'
 libsfiles=' libnsl.so libgdbm.so libdb.so libdl.so libm.so libcrypt.so libutil.so libpthread.so libc.so'
-libsfound=' /usr/lib/libnsl.so /usr/lib/libgdbm.so /usr/lib/libdb.so /usr/lib/libdl.so /usr/lib/libm.so /usr/lib/libcrypt.so /usr/lib/libutil.so /usr/lib/libpthread.so /usr/lib/libc.so'
-libspath=' /lib /usr/lib'
+libsfound=' @LIBDIR@/libnsl.so @LIBDIR@/libgdbm.so @LIBDIR@/libdb.so @LIBDIR@/libdl.so @LIBDIR@/libm.so @LIBDIR@/libcrypt.so @LIBDIR@/libutil.so @LIBDIR@/libpthread.so @LIBDIR@/libc.so'
+libspath=' @BASELIBDIR@ @LIBDIR@'
 libswanted='sfio socket inet nsl nm ndbm gdbm dbm db malloc dl dld ld sun m crypt sec util pthread c cposix posix ucb BSD gdbm_compat'
 libswanted_uselargefiles=''
 line=''
@@ -803,8 +803,8 @@ lkflags=''
 ln='ln'
 lns='/bin/ln -s'
 localtime_r_proto='REENTRANT_PROTO_S_TS'
-locincpth='/usr/local/include /opt/local/include /usr/gnu/include /opt/gnu/include /usr/GNU/include /opt/GNU/include'
-loclibpth='/usr/local/lib /opt/local/lib /usr/gnu/lib /opt/gnu/lib /usr/GNU/lib /opt/GNU/lib'
+locincpth='@EXECPREFIX@/local/include /opt/local/include @EXECPREFIX@/gnu/include /opt/gnu/include @EXECPREFIX@/GNU/include /opt/GNU/include'
+loclibpth='@EXECPREFIX@/local/lib /opt/local/lib @EXECPREFIX@/gnu/lib /opt/gnu/lib @EXECPREFIX@/GNU/lib /opt/GNU/lib'
 longlongsize='8'
 lp=''
 lpr=''
@@ -864,28 +864,28 @@ optimize='-O2'
 orderlib='false'
 osname='linux'
 osvers='2.6.37-rc5-yocto-standard+'
-otherlibdirs='/usr/lib/perl5/5.14.2'
+otherlibdirs='@LIBDIR@/perl/5.14.2'
 package='perl5'
 pager='/usr/bin/less -isr'
 passcat='cat /etc/passwd'
 patchlevel='14'
 path_sep=':'
-perl5='/usr/bin/perl'
+perl5='@USRBIN@/perl'
 perl=''
 perl_patchlevel=''
 perladmin='root@localhost'
 perllibs='-lnsl -ldl -lm -lcrypt -lutil -lpthread -lc'
-perlpath='/usr/bin/perl'
+perlpath='@USRBIN@/perl'
 pg='pg'
 phostname=''
 pidtype='pid_t'
 plibpth=''
 pmake=''
 pr=''
-prefix='/usr'
-prefixexp='/usr'
-privlib='/usr/lib/perl5/5.14.2'
-privlibexp='/usr/lib/perl5/5.14.2'
+prefix='@EXECPREFIX@'
+prefixexp='@EXECPREFIX@'
+privlib='@LIBDIR@/perl/5.14.2'
+privlibexp='@LIBDIR@/perl/5.14.2'
 procselfexe='"/proc/self/exe"'
 prototype='define'
 randbits='48'
@@ -910,8 +910,8 @@ sPRIfldbl='"Lf"'
 sPRIgldbl='"Lg"'
 sSCNfldbl='"Lf"'
 sched_yield='sched_yield()'
-scriptdir='/usr/bin'
-scriptdirexp='/usr/bin'
+scriptdir='@USRBIN@'
+scriptdirexp='@USRBIN@'
 sed='sed'
 seedfunc='srand48'
 selecttype='fd_set *'
@@ -937,25 +937,25 @@ sig_num='0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26
 sig_num_init='0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 6, 17, 29, 31, 0'
 sig_size='69'
 signal_t='void'
-sitearch='/usr/lib/perl5/site_perl/5.14.2/@ARCH@-thread-multi'
-sitearchexp='/usr/lib/perl5/site_perl/5.14.2/@ARCH@-thread-multi'
-sitebin='/usr/bin'
-sitebinexp='/usr/bin'
+sitearch='@LIBDIR@/perl/site_perl/5.14.2/@ARCH@-thread-multi'
+sitearchexp='@LIBDIR@/perl/site_perl/5.14.2/@ARCH@-thread-multi'
+sitebin='@USRBIN@'
+sitebinexp='@USRBIN@'
 sitehtml1dir=''
 sitehtml1direxp=''
 sitehtml3dir=''
 sitehtml3direxp=''
-sitelib='/usr/lib/perl5/site_perl/5.14.2'
-sitelib_stem='/usr/lib/perl5/site_perl'
-sitelibexp='/usr/lib/perl5/site_perl/5.14.2'
+sitelib='@LIBDIR@/perl/site_perl/5.14.2'
+sitelib_stem='@LIBDIR@/perl/site_perl'
+sitelibexp='@LIBDIR@/perl/site_perl/5.14.2'
 siteman1dir=''
 siteman1direxp=''
 siteman3dir=''
 siteman3direxp=''
-siteprefix='/usr'
-siteprefixexp='/usr'
-sitescript='/usr/bin'
-sitescriptexp='/usr/bin'
+siteprefix='@EXECPREFIX@'
+siteprefixexp='@EXECPREFIX@'
+sitescript='@USRBIN@'
+sitescriptexp='@USRBIN@'
 sizetype='size_t'
 sleep=''
 smail=''
@@ -970,7 +970,7 @@ srand48_r_proto='REENTRANT_PROTO_I_LS'
 srandom_r_proto='REENTRANT_PROTO_I_TS'
 src='.'
 ssizetype='ssize_t'
-startperl='#!/usr/bin/perl'
+startperl='#!@USRBIN@/perl'
 startsh='#!/bin/sh'
 static_ext=' '
 stdchar='char'
@@ -981,17 +981,17 @@ stdio_filbuf=''
 stdio_ptr='((fp)->_IO_read_ptr)'
 stdio_stream_array=''
 strerror_r_proto='REENTRANT_PROTO_B_IBW'
-strings='/usr/include/string.h'
+strings='@INCLUDEDIR@/string.h'
 submit=''
 subversion='2'
-sysman='/usr/share/man/man1'
+sysman='@EXECPREFIX@/share/man/man1'
 tail=''
 tar=''
 targetarch=''
 tbl=''
 tee=''
 test='test'
-timeincl='/usr/include/sys/time.h /usr/include/time.h '
+timeincl='@INCLUDEDIR@/sys/time.h @INCLUDEDIR@/time.h '
 timetype='time_t'
 tmpnam_r_proto='REENTRANT_PROTO_B_B'
 to=':'
@@ -1037,7 +1037,7 @@ usesocks='undef'
 usethreads='define'
 usevendorprefix='define'
 usevfork='false'
-usrinc='/usr/include'
+usrinc='@INCLUDEDIR@'
 uuname=''
 uvXUformat='"lX"'
 uvoformat='"lo"'
@@ -1045,31 +1045,31 @@ uvtype='unsigned long'
 uvuformat='"lu"'
 uvxformat='"lx"'
 vaproto='define'
-vendorarch='/usr/lib/perl5/vendor_perl/5.14.2/@ARCH@-thread-multi'
-vendorarchexp='/usr/lib/perl5/vendor_perl/5.14.2/@ARCH@-thread-multi'
-vendorbin='/usr/bin'
-vendorbinexp='/usr/bin'
+vendorarch='@LIBDIR@/perl/vendor_perl/5.14.2/@ARCH@-thread-multi'
+vendorarchexp='@LIBDIR@/perl/vendor_perl/5.14.2/@ARCH@-thread-multi'
+vendorbin='@USRBIN@'
+vendorbinexp='@USRBIN@'
 vendorhtml1dir=' '
 vendorhtml1direxp=''
 vendorhtml3dir=' '
 vendorhtml3direxp=''
-vendorlib='/usr/lib/perl5/vendor_perl/5.14.2'
-vendorlib_stem='/usr/lib/perl5/vendor_perl'
-vendorlibexp='/usr/lib/perl5/vendor_perl/5.14.2'
+vendorlib='@LIBDIR@/perl/vendor_perl/5.14.2'
+vendorlib_stem='@LIBDIR@/perl/vendor_perl'
+vendorlibexp='@LIBDIR@/perl/vendor_perl/5.14.2'
 vendorman1dir=' '
 vendorman1direxp=''
 vendorman3dir=' '
 vendorman3direxp=''
 vendorprefix='/usr'
 vendorprefixexp='/usr'
-vendorscript='/usr/bin'
-vendorscriptexp='/usr/bin'
+vendorscript='@USRBIN@'
+vendorscriptexp='@USRBIN@'
 version='5.14.2'
 version_patchlevel_string='version 14 subversion 2'
 versiononly='undef'
 vi=''
 voidflags='15'
-xlibpth='/usr/lib/386 /lib/386'
+xlibpth='@LIBDIR@/386 @BASELIBDIR@/386'
 yacc='yacc'
 yaccflags=''
 zcat=''
diff --git a/meta/recipes-devtools/perl/perl_5.14.2.bb b/meta/recipes-devtools/perl/perl_5.14.2.bb
index 0009855..09b2acb 100644
--- a/meta/recipes-devtools/perl/perl_5.14.2.bb
+++ b/meta/recipes-devtools/perl/perl_5.14.2.bb
@@ -146,14 +146,14 @@ do_configure() {
 	${@base_contains('DISTRO_FEATURES', 'largefile', '', 'do_nolargefile', d)}
 
         # Update some paths in the configuration
-        sed -i -e 's,@DESTDIR@,${prefix},g' \
-               -e 's,@ARCH@-thread-multi,,g' \
+        sed -i -e 's,@ARCH@-thread-multi,,g' \
                -e 's,@ARCH@,${TARGET_ARCH}-${TARGET_OS},g' \
                -e 's,@STAGINGDIR@,${STAGING_DIR_HOST},g' \
-               -e "s%\([ \"^\',=]\+\)/usr/include\([ \"^\',=]\+\)%\1${STAGING_INCDIR}\2%g" \
-	       -e "s%\([ \"^\',=]\+\)/usr/lib/\([ \"^\',=]\+\)%\1${libdir}/\2%g" \
-	       -e "s%\([ \"^\',=]\+\)/usr/\([ \"^\',=]\+\)%\1${exec_prefix}/\2%g" \
-	       -e "s%/perl5%/perl%g" \
+               -e "s,@INCLUDEDIR@,${STAGING_INCDIR},g" \
+               -e "s,@LIBDIR@,${libdir},g" \
+               -e "s,@BASELIBDIR@,${base_libdir},g" \
+               -e "s,@EXECPREFIX@,${exec_prefix},g" \
+               -e 's,@USRBIN@,${bindir},g' \
             config.sh-${TARGET_ARCH}-${TARGET_OS}
 
 	case "${TARGET_ARCH}" in




