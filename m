Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id ADD9275C60
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Sep 2016 02:32:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u8J2WSNL030902
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Sun, 18 Sep 2016 19:32:28 -0700
Received: from [172.25.44.6] (172.25.44.6) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Sun, 18 Sep 2016 19:32:26 -0700
To: Christopher Larson <clarson@kergoth.com>
References: <1474076227-17032-1-git-send-email-Randy.MacLeod@windriver.com>
	<CABcZANk=aHGZVw5vnh5+KyQaxLa8=7NB2GuFt49P0B_hDyaXcQ@mail.gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <82ab3d71-56c0-44b8-a892-91cfc90c0330@windriver.com>
Date: Sun, 18 Sep 2016 22:32:25 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <CABcZANk=aHGZVw5vnh5+KyQaxLa8=7NB2GuFt49P0B_hDyaXcQ@mail.gmail.com>
X-Originating-IP: [172.25.44.6]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] e2fsprogs: add packageconfig for -file-
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
X-List-Received-Date: Mon, 19 Sep 2016 02:32:29 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2016-09-17 01:09 AM, Christopher Larson wrote:
>
> On Fri, Sep 16, 2016 at 6:37 PM, Randy MacLeod
> <Randy.MacLeod@windriver.com <mailto:Randy.MacLeod@windriver.com>> wrote:
>
>     Without a packageconfig dependency for the file utility, there's
>     a very rare compile faiure caused by a race where the magic.h
>     header file is not found:
>
>      ../../../git/lib/support/plausible.c:33:19: fatal error: magic.h:
>     No such file or directory
>
>     This file, plausible.c, is part of libsupport.a which is used by
>     many binaries produced by the e2fsprogs package. plausible.c attempts
>     to dynamically load libmagic.so if the e2fsprogs configure detects
>     that magic was available. Adding the packageconfig will eliminate
>     the build as well as the possible configure-time race condition.
>
>     Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com
>     <mailto:Randy.MacLeod@windriver.com>>
>     ---
>      meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.bb
>     <http://e2fsprogs_1.43.bb> | 1 +
>      1 file changed, 1 insertion(+)
>
>     diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.bb
>     <http://e2fsprogs_1.43.bb>
>     b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.bb
>     <http://e2fsprogs_1.43.bb>
>     index f4855bc..1707cb9 100644
>     --- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.bb
>     <http://e2fsprogs_1.43.bb>
>     +++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.bb
>     <http://e2fsprogs_1.43.bb>
>     @@ -23,6 +23,7 @@ EXTRA_OECONF += "--libdir=${base_libdir}
>     --sbindir=${base_sbindir} \
>      EXTRA_OECONF_darwin = "--libdir=${base_libdir}
>     --sbindir=${base_sbindir} --enable-bsd-shlibs"
>
>      PACKAGECONFIG ??= ""
>     +PACKAGECONFIG[file] = ',,file'
>
>
> This isn’t going to be good enough. You aren’t explicitly
> enabling/disabling the option, so it’ll still detect based on what’s in
> the sysroot, so recipe build order will result in non-deterministic
> behavior.

Hi Christopher,

Thanks for the response but I don't understand.
I'm probably wrong so please explain.
It seems that you're suggesting that I add:
  --with[out]-magic to e2fsprogs configure, and while
I could do that, it does not seem to be needed.


Short response:

   This change forces 'file' to be built before e2fsprogs if 'file'
   is present in the image or world build. Then e2fsprogs will
   detect magic.h,libmagic.so and  the race is eliminated.



The details:

Note, that I thought this was a rare race condition but
it showed up again yesterday in a work-related build.

It seems to work when I tested it and there are
several other examples of using:
    PACKAGECONFIG[foo] = ",,foo,"
such as:
    meta/recipes-devtools/python/python-smartpm_git.bb

    GTK_RDEP = "${PN}-interface-gtk"
    ...
    PACKAGECONFIG[gtk] = ",,gtk+,${GTK_RDEP}"

and 38 others:
$ grep -r PACKAGECONFIG meta/recipes* | \
      grep ",,"| grep -v with | grep -v ",,," | wc -l
38

Also from:
    meta/classes/base.bbclass
The PACKAGEDEPENDS handling code looks at:

         for flag, flagval in sorted(pkgconfigflags.items()):
             items = flagval.split(",")
             num = len(items)
             if num > 4:
                 ...

             if flag in pkgconfig:
                 if num >= 3 and items[2]:
                     extradeps.append(items[2])

In my case, num = 3 and file gets added to the depends
and therefore built first. Then when e2fsprogs is built,
the configure script auto-detects that file and libmagic
are present (without risk of a race) and sets the magic flags
as shown below. If there were a configure flag, I'd be happy
to use it but from e2fsprogs's configure.ac:

dnl
dnl See if libmagic exists
dnl
AC_CHECK_LIB(magic, magic_file, [MAGIC_LIB=-lmagic
AC_CHECK_HEADERS([magic.h])])
if test "$ac_cv_func_dlopen" = yes ; then
    MAGIC_LIB=$DLOPEN_LIB
fi
AC_SUBST(MAGIC_LIB)
dnl

so even with my limited exposure to the autotools syntax,
it seems like there's no: --with[out]-libmagic=yes option, right?

Some logs:

# No patch:
$ grep -i magic /tmp/e2fsprogs-no-patch-cleanall-file-config.log

configure:13035: checking for magic_file in -lmagic
configure:13060: x86_64-oe-linux-gcc  <flags> \
    conftest.c -lmagic  -lblkid  >&5
/.../tmp-glibc/sysroots/x86_64-linux/usr/libexec/x86_64-oe-linux/gcc/x86_64-oe-linux/6.2.0/ld: 
cannot find -lmagic
| char magic_file ();
| return magic_file ();
ac_cv_lib_magic_magic_file=no
MAGIC_LIB='-ldl'

# with patch:
$ grep -i magic /tmp/e2fsprogs-with-patch-cim-config.log
g'
configure:13035: checking for magic_file in -lmagic
configure:13060: x86_64-oe-linux-gcc <flags> \
     conftest.c -lmagic  -lblkid  >&5
configure:13075: checking magic.h usability
configure:13075: checking magic.h presence
configure:13075: checking for magic.h
| #define HAVE_MAGIC_H 1
ac_cv_header_magic_h=yes
ac_cv_lib_magic_magic_file=yes
MAGIC_LIB='-ldl'
#define HAVE_MAGIC_H 1

Granted this doens't prove that the race went away.
[1]


$ cd .../e2fsprogs.git
$ git pull
$ grep magic ./configure
{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for magic_file in 
-lmagic" >&5
$as_echo_n "checking for magic_file in -lmagic... " >&6; }
if ${ac_cv_lib_magic_magic_file+:} false; then :
LIBS="-lmagic  $LIBS"
char magic_file ();
return magic_file ();
   ac_cv_lib_magic_magic_file=yes
   ac_cv_lib_magic_magic_file=no
{ $as_echo "$as_me:${as_lineno-$LINENO}: result: 
$ac_cv_lib_magic_magic_file" >&5
$as_echo "$ac_cv_lib_magic_magic_file" >&6; }
if test "x$ac_cv_lib_magic_magic_file" = xyes; then :
   MAGIC_LIB=-lmagic
for ac_header in magic.h
   ac_fn_c_check_header_mongrel "$LINENO" "magic.h" 
"ac_cv_header_magic_h" "$ac_includes_default"
if test "x$ac_cv_header_magic_h" = xyes; then :


Thanks,
../Randy 'often knows how to spell bitbake' MacLeod

> --
> Christopher Larson
> clarson at kergoth dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Maintainer - Tslib
> Senior Software Engineer, Mentor Graphics


-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200, Ottawa, ON, 
Canada, K2K 2W5

