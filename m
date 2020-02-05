Return-Path: <anuj.mittal@intel.com>
X-Greylist: delayed 427 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 05 Feb 2020 01:04:04 UTC
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id E4B2F610E0
	for <openembedded-core@openembedded.org>;
	Wed,  5 Feb 2020 01:04:04 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Feb 2020 16:56:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,403,1574150400"; d="scan'208";a="378590986"
Received: from kmsmsx157.gar.corp.intel.com ([172.21.138.134])
	by orsmga004.jf.intel.com with ESMTP; 04 Feb 2020 16:56:57 -0800
Received: from pgsmsx101.gar.corp.intel.com ([169.254.1.131]) by
	kmsmsx157.gar.corp.intel.com ([169.254.5.72]) with mapi id
	14.03.0439.000; Wed, 5 Feb 2020 08:56:56 +0800
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: Armin Kuster <akuster808@gmail.com>, "openembedded-core@openembedded.org"
	<openembedded-core@openembedded.org>
Thread-Topic: [OE-core] [zeus 2/8] bash: Fix CVE-2019-18276
Thread-Index: AQHV22zOSJ4f8xOONkee5tK3psLOMqgLxKdg
Date: Wed, 5 Feb 2020 00:56:55 +0000
Message-ID: <C0207330DF60C5409302EC78C3FE68F3033F5C7B@PGSMSX101.gar.corp.intel.com>
References: <cover.1580828664.git.akuster808@gmail.com>
	<14ee1e10505e52ad21aec0e3184896145d4d3efa.1580828664.git.akuster808@gmail.com>
In-Reply-To: <14ee1e10505e52ad21aec0e3184896145d4d3efa.1580828664.git.akuster808@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNTg3NWVkNTktZGE2My00MjU0LWFjMDEtNzdmNmFkYzZjOGU0IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiQ25KY1BzQ1wvQkp3K25vcUlHNXJVTVpTVHBaalhaKzZ3V2FBNGw0Zm5pRXZ2QW9WaGtqckMyaEdITG1FQXU1KzAifQ==
x-originating-ip: [172.30.20.206]
MIME-Version: 1.0
Subject: Re: [zeus 2/8] bash: Fix CVE-2019-18276
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
X-List-Received-Date: Wed, 05 Feb 2020 01:04:05 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Was the original patch sent to the oe-core list? This CVE should be applica=
ble to master too.

Also it looks like the patch is doing other things besides fixing just the =
CVE.

Thanks,

Anuj

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org <openembedded-core=
-
> bounces@lists.openembedded.org> On Behalf Of Armin Kuster
> Sent: Tuesday, February 4, 2020 11:06 PM
> To: openembedded-core@openembedded.org
> Subject: [OE-core] [zeus 2/8] bash: Fix CVE-2019-18276
>=20
> From: De Huo <De.Huo@windriver.com>
>=20
> An issue was discovered in disable_priv_mode in shell.c in GNU Bash throu=
gh 5.0
> patch 11.
> By default, if Bash is run with its effective UID not equal to its real U=
ID, it will drop
> privileges by setting its effective UID to its real UID.
> However, it does so incorrectly. On Linux and other systems that support =
"saved UID"
> functionality, the saved UID is not dropped. An attacker with command exe=
cution in
> the shell can use "enable -f" for runtime loading of a new builtin, which=
 can be a
> shared object that calls setuid() and therefore regains privileges. Howev=
er, binaries
> running with an effective UID of 0 are unaffected.
>=20
> Backport the CVE patche from https://github.com/bminor/bash/commit/
> 951bdaad7a18cc0dc1036bba86b18b90874d39ff to fix CVE-2019-18276
>=20
> Signed-off-by: Chet Ramey <chet.ramey@case.edu>
> Signed-off-by: De Huo <De.Huo@windriver.com>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  .../bash/bash/bash-CVE-2019-18276.patch       | 402 ++++++++++++++++++
>  meta/recipes-extended/bash/bash_5.0.bb        |   1 +
>  2 files changed, 403 insertions(+)
>  create mode 100644 meta/recipes-extended/bash/bash/bash-CVE-2019-18276.p=
atch
>=20
> diff --git a/meta/recipes-extended/bash/bash/bash-CVE-2019-18276.patch
> b/meta/recipes-extended/bash/bash/bash-CVE-2019-18276.patch
> new file mode 100644
> index 0000000000..78dcc1b636
> --- /dev/null
> +++ b/meta/recipes-extended/bash/bash/bash-CVE-2019-18276.patch
> @@ -0,0 +1,402 @@
> +From 951bdaad7a18cc0dc1036bba86b18b90874d39ff Mon Sep 17 00:00:00 2001
> +From: Chet Ramey <chet.ramey@case.edu>
> +Date: Mon, 1 Jul 2019 09:03:53 -0400
> +Subject: [PATCH] commit bash-20190628 snapshot
> +
> +An issue was discovered in disable_priv_mode in shell.c in GNU Bash thro=
ugh 5.0
> patch 11.
> +By default, if Bash is run with its effective UID not equal to its real
> +UID, it will drop privileges by setting its effective UID to its real UI=
D.
> +However, it does so incorrectly. On Linux and other systems that
> +support "saved UID" functionality, the saved UID is not dropped. An
> +attacker with command execution in the shell can use "enable -f" for
> +runtime loading of a new builtin, which can be a shared object that call=
s setuid() and
> therefore regains privileges. However, binaries running with an effective=
 UID of 0 are
> unaffected.
> +
> +Upstream-Status: Backport
> +[https://github.com/bminor/bash/commit/951bdaad7a18cc0dc1036bba86b18b90
> +874d39ff]
> +CVE: CVE-2019-18276
> +Signed-off-by: Chet Ramey <chet.ramey@case.edu>
> +Signed-off-by: De Huo <De.Huo@windriver.com>
> +---
> + MANIFEST          |  2 ++
> + bashline.c        | 50 +-----------------------------------------------=
--
> + builtins/help.def |  2 +-
> + config.h.in       | 10 +++++++++-
> + configure         | 11 +++++++++++
> + configure.ac      |  1 +
> + doc/bash.1        |  3 ++-
> + doc/bashref.texi  |  3 ++-
> + lib/glob/glob.c   |  5 ++++-
> + pathexp.c         | 16 ++++++++++++++--
> + shell.c           |  8 ++++++++
> + tests/glob.tests  |  2 ++
> + tests/glob6.sub   | 54
> ++++++++++++++++++++++++++++++++++++++++++++++++++++++
> + tests/glob7.sub   | 11 +++++++++++
> + 14 files changed, 122 insertions(+), 56 deletions(-)  create mode
> +100644 tests/glob6.sub  create mode 100644 tests/glob7.sub
> +
> +diff --git a/MANIFEST b/MANIFEST
> +index 03de221..f9ccad7 100644
> +--- a/MANIFEST
> ++++ b/MANIFEST
> +@@ -1037,6 +1037,8 @@ tests/extglob3.tests	f
> + tests/extglob3.right	f
> + tests/extglob4.sub	f
> + tests/extglob5.sub	f
> ++tests/glob6.sub		f
> ++tests/glob7.sub		f
> + tests/func.tests	f
> + tests/func.right	f
> + tests/func1.sub		f
> +diff --git a/bashline.c b/bashline.c
> +index 824ea9d..d86b47d 100644
> +--- a/bashline.c
> ++++ b/bashline.c
> +@@ -3718,55 +3718,7 @@ static int
> + completion_glob_pattern (string)
> +      char *string;
> + {
> +-  register int c;
> +-  char *send;
> +-  int open;
> +-
> +-  DECLARE_MBSTATE;
> +-
> +-  open =3D 0;
> +-  send =3D string + strlen (string);
> +-
> +-  while (c =3D *string++)
> +-    {
> +-      switch (c)
> +-	{
> +-	case '?':
> +-	case '*':
> +-	  return (1);
> +-
> +-	case '[':
> +-	  open++;
> +-	  continue;
> +-
> +-	case ']':
> +-	  if (open)
> +-	    return (1);
> +-	  continue;
> +-
> +-	case '+':
> +-	case '@':
> +-	case '!':
> +-	  if (*string =3D=3D '(')	/*)*/
> +-	    return (1);
> +-	  continue;
> +-
> +-	case '\\':
> +-	  if (*string++ =3D=3D 0)
> +-	    return (0);
> +-	}
> +-
> +-      /* Advance one fewer byte than an entire multibyte character to
> +-	 account for the auto-increment in the loop above. */
> +-#ifdef HANDLE_MULTIBYTE
> +-      string--;
> +-      ADVANCE_CHAR_P (string, send - string);
> +-      string++;
> +-#else
> +-      ADVANCE_CHAR_P (string, send - string);
> +-#endif
> +-    }
> +-  return (0);
> ++  return (glob_pattern_p (string) =3D=3D 1);
> + }
> +
> + static char *globtext;
> +diff --git a/builtins/help.def b/builtins/help.def index
> +006c4b5..92f9b38 100644
> +--- a/builtins/help.def
> ++++ b/builtins/help.def
> +@@ -128,7 +128,7 @@ help_builtin (list)
> +
> +   /* We should consider making `help bash' do something. */
> +
> +-  if (glob_pattern_p (list->word->word))
> ++  if (glob_pattern_p (list->word->word) =3D=3D 1)
> +     {
> +       printf ("%s", ngettext ("Shell commands matching keyword `", "She=
ll commands
> matching keywords `", (list->next ? 2 : 1)));
> +       print_word_list (list, ", ");
> +diff --git a/config.h.in b/config.h.in
> +index 8554aec..ad4b1e8 100644
> +--- a/config.h.in
> ++++ b/config.h.in
> +@@ -1,6 +1,6 @@
> + /* config.h -- Configuration file for bash. */
> +
> +-/* Copyright (C) 1987-2009,2011-2012 Free Software Foundation, Inc.
> ++/* Copyright (C) 1987-2009,2011-2012,2013-2019 Free Software Foundation=
, Inc.
> +
> +    This file is part of GNU Bash, the Bourne Again SHell.
> +
> +@@ -807,6 +807,14 @@
> + #undef HAVE_SETREGID
> + #undef HAVE_DECL_SETREGID
> +
> ++/* Define if you have the setregid function.  */ #undef HAVE_SETRESGID
> ++#undef HAVE_DECL_SETRESGID
> ++
> ++/* Define if you have the setresuid function.  */ #undef
> ++HAVE_SETRESUID #undef HAVE_DECL_SETRESUID
> ++
> + /* Define if you have the setvbuf function.  */ #undef HAVE_SETVBUF
> +
> +diff --git a/configure b/configure
> +index 2f62662..b3321c9 100755
> +--- a/configure
> ++++ b/configure
> +@@ -10281,6 +10281,17 @@ cat >>confdefs.h <<_ACEOF  #define
> +HAVE_DECL_SETREGID $ac_have_decl  _ACEOF
> +
> ++ac_fn_c_check_decl "$LINENO" "" "ac_cv_have_decl_" "$ac_includes_defaul=
t"
> ++if test "x$ac_cv_have_decl_" =3D xyes; then :
> ++  ac_have_decl=3D1
> ++else
> ++  ac_have_decl=3D0
> ++fi
> ++
> ++cat >>confdefs.h <<_ACEOF
> ++#define HAVE_DECL_ $ac_have_decl
> ++_ACEOF
> ++(setresuid, setresgid)
> + ac_fn_c_check_decl "$LINENO" "strcpy" "ac_cv_have_decl_strcpy"
> "$ac_includes_default"
> + if test "x$ac_cv_have_decl_strcpy" =3D xyes; then :
> +   ac_have_decl=3D1
> +diff --git a/configure.ac b/configure.ac index 52b4cdb..549adef 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -810,6 +810,7 @@ AC_CHECK_DECLS([confstr])
> + AC_CHECK_DECLS([printf])
> + AC_CHECK_DECLS([sbrk])
> + AC_CHECK_DECLS([setregid])
> ++AC_CHECK_DECLS[(setresuid, setresgid])
> + AC_CHECK_DECLS([strcpy])
> + AC_CHECK_DECLS([strsignal])
> +
> +diff --git a/doc/bash.1 b/doc/bash.1
> +index e6cd08d..9e58a0b 100644
> +--- a/doc/bash.1
> ++++ b/doc/bash.1
> +@@ -4681,7 +4681,8 @@ above).
> + .PD
> + .SH "SIMPLE COMMAND EXPANSION"
> + When a simple command is executed, the shell performs the following
> +-expansions, assignments, and redirections, from left to right.
> ++expansions, assignments, and redirections, from left to right, in the
> ++following order.
> + .IP 1.
> + The words that the parser has marked as variable assignments (those
> +preceding the command name) and redirections are saved for later diff
> +--git a/doc/bashref.texi b/doc/bashref.texi index d33cd57..3065126
> +100644
> +--- a/doc/bashref.texi
> ++++ b/doc/bashref.texi
> +@@ -2964,7 +2964,8 @@ is not specified.  If the file does not exist, it =
is created.
> + @cindex command expansion
> +
> + When a simple command is executed, the shell performs the following
> +-expansions, assignments, and redirections, from left to right.
> ++expansions, assignments, and redirections, from left to right, in the
> ++following order.
> +
> + @enumerate
> + @item
> +diff --git a/lib/glob/glob.c b/lib/glob/glob.c index 398253b..2eaa33e
> +100644
> +--- a/lib/glob/glob.c
> ++++ b/lib/glob/glob.c
> +@@ -607,6 +607,7 @@ glob_vector (pat, dir, flags)
> +   register unsigned int i;
> +   int mflags;		/* Flags passed to strmatch (). */
> +   int pflags;		/* flags passed to sh_makepath () */
> ++  int hasglob;		/* return value from glob_pattern_p */
> +   int nalloca;
> +   struct globval *firstmalloc, *tmplink;
> +   char *convfn;
> +@@ -648,10 +649,12 @@ glob_vector (pat, dir, flags)
> +   patlen =3D (pat && *pat) ? strlen (pat) : 0;
> +
> +   /* If the filename pattern (PAT) does not contain any globbing
> + characters,
> ++     or contains a pattern with only backslash escapes (hasglob =3D=3D =
2),
> +      we can dispense with reading the directory, and just see if there =
is
> +      a filename `DIR/PAT'.  If there is, and we can access it, just mak=
e the
> +      vector to return and bail immediately. */
> +-  if (skip =3D=3D 0 && glob_pattern_p (pat) =3D=3D 0)
> ++  hasglob =3D 0;
> ++  if (skip =3D=3D 0 && (hasglob =3D glob_pattern_p (pat)) =3D=3D 0 || h=
asglob =3D=3D
> ++ 2)
> +     {
> +       int dirlen;
> +       struct stat finfo;
> +diff --git a/pathexp.c b/pathexp.c
> +index c1bf2d8..e6c5392 100644
> +--- a/pathexp.c
> ++++ b/pathexp.c
> +@@ -58,7 +58,10 @@ int extended_glob =3D EXTGLOB_DEFAULT;
> + /* Control enabling special handling of `**' */  int glob_star =3D 0;
> +
> +-/* Return nonzero if STRING has any unquoted special globbing chars in
> +it.  */
> ++/* Return nonzero if STRING has any unquoted special globbing chars in =
it.
> ++   This is supposed to be called when pathname expansion is performed, =
so
> ++   it implements the rules in Posix 2.13.3, specifically that an unquot=
ed
> ++   slash cannot appear in a bracket expression. */
> + int
> + unquoted_glob_pattern_p (string)
> +      register char *string;
> +@@ -85,10 +88,14 @@ unquoted_glob_pattern_p (string)
> + 	  continue;
> +
> + 	case ']':
> +-	  if (open)
> ++	  if (open)		/* XXX - if --open =3D=3D 0? */
> + 	    return (1);
> + 	  continue;
> +
> ++	case '/':
> ++	  if (open)
> ++	    open =3D 0;
> ++
> + 	case '+':
> + 	case '@':
> + 	case '!':
> +@@ -106,6 +113,11 @@ unquoted_glob_pattern_p (string)
> + 	      string++;
> + 	      continue;
> + 	    }
> ++	  else if (open && *string =3D=3D '/')
> ++	    {
> ++	      string++;		/* quoted slashes in bracket expressions are ok */
> ++	      continue;
> ++	    }
> + 	  else if (*string =3D=3D 0)
> + 	    return (0);
> +
> +diff --git a/shell.c b/shell.c
> +index a2b2a55..6adabc8 100644
> +--- a/shell.c
> ++++ b/shell.c
> +@@ -1293,7 +1293,11 @@ disable_priv_mode ()  {
> +   int e;
> +
> ++#if HAVE_DECL_SETRESUID
> ++  if (setresuid (current_user.uid, current_user.uid, current_user.uid)
> ++< 0) #else
> +   if (setuid (current_user.uid) < 0)
> ++#endif
> +     {
> +       e =3D errno;
> +       sys_error (_("cannot set uid to %d: effective uid %d"),
> +current_user.uid, current_user.euid); @@ -1302,7 +1306,11 @@ disable_pri=
v_mode
> ()
> + 	exit (e);
> + #endif
> +     }
> ++#if HAVE_DECL_SETRESGID
> ++  if (setresgid (current_user.gid, current_user.gid, current_user.gid)
> ++< 0) #else
> +   if (setgid (current_user.gid) < 0)
> ++#endif
> +     sys_error (_("cannot set gid to %d: effective gid %d"),
> + current_user.gid, current_user.egid);
> +
> +   current_user.euid =3D current_user.uid; diff --git a/tests/glob.tests
> +b/tests/glob.tests index 01913bb..fb012f7 100644
> +--- a/tests/glob.tests
> ++++ b/tests/glob.tests
> +@@ -12,6 +12,8 @@ ${THIS_SH} ./glob1.sub  ${THIS_SH} ./glob2.sub
> +${THIS_SH} ./glob3.sub  ${THIS_SH} ./glob4.sub
> ++${THIS_SH} ./glob6.sub
> ++${THIS_SH} ./glob7.sub
> +
> + MYDIR=3D$PWD	# save where we are
> +
> +diff --git a/tests/glob6.sub b/tests/glob6.sub new file mode 100644
> +index 0000000..b099811
> +--- /dev/null
> ++++ b/tests/glob6.sub
> +@@ -0,0 +1,54 @@
> ++# tests of the backslash-in-glob-patterns discussion on the
> ++austin-group ML
> ++
> ++: ${TMPDIR:=3D/var/tmp}
> ++
> ++ORIG=3D$PWD
> ++GLOBDIR=3D$TMPDIR/bash-glob-$$
> ++mkdir $GLOBDIR && cd $GLOBDIR
> ++
> ++# does the pattern matcher allow backslashes as escape characters and
> ++remove # them as part of matching?
> ++touch abcdefg
> ++pat=3D'ab\cd*'
> ++printf '<%s>\n' $pat
> ++pat=3D'\.'
> ++printf '<%s>\n' $pat
> ++rm abcdefg
> ++
> ++# how about when escaping pattern characters?
> ++touch '*abc.c'
> ++a=3D'\**.c'
> ++printf '%s\n' $a
> ++rm -f '*abc.c'
> ++
> ++# how about when making the distinction between readable and
> ++searchable path # components?
> ++mkdir -m a=3Dx searchable
> ++mkdir -m a=3Dr readable
> ++
> ++p=3D'searchable/\.'
> ++printf "%s\n" $p
> ++
> ++p=3D'searchable/\./.'
> ++printf "%s\n" $p
> ++
> ++p=3D'readable/\.'
> ++printf "%s\n" $p
> ++
> ++p=3D'readable/\./.'
> ++printf "%s\n" $p
> ++
> ++printf "%s\n" 'searchable/\.'
> ++printf "%s\n" 'readable/\.'
> ++
> ++echo */.
> ++
> ++p=3D'*/\.'
> ++echo $p
> ++
> ++echo */'.'
> ++
> ++rmdir searchable readable
> ++
> ++cd $ORIG
> ++rmdir $GLOBDIR
> +diff --git a/tests/glob7.sub b/tests/glob7.sub new file mode 100644
> +index 0000000..0212b8e
> +--- /dev/null
> ++++ b/tests/glob7.sub
> +@@ -0,0 +1,11 @@
> ++# according to Posix 2.13.3, a slash in a bracket expression renders
> ++that # bracket expression invalid shopt -s nullglob
> ++
> ++echo 1: [qwe/qwe]
> ++echo 2: [qwe/
> ++echo 3: [qwe/]
> ++
> ++echo 4: [qwe\/qwe]
> ++echo 5: [qwe\/
> ++echo 6: [qwe\/]
> +--
> +1.9.1
> diff --git a/meta/recipes-extended/bash/bash_5.0.bb b/meta/recipes-
> extended/bash/bash_5.0.bb
> index eadc82279d..1b7058746f 100644
> --- a/meta/recipes-extended/bash/bash_5.0.bb
> +++ b/meta/recipes-extended/bash/bash_5.0.bb
> @@ -19,6 +19,7 @@ SRC_URI =3D
> "${GNU_MIRROR}/bash/${BP}.tar.gz;name=3Dtarball \
>             file://run-ptest \
>             file://run-bash-ptests \
>             file://fix-run-builtins.patch \
> +           file://bash-CVE-2019-18276.patch \
>             "
>=20
>  SRC_URI[tarball.md5sum] =3D "2b44b47b905be16f45709648f671820b"
> --
> 2.17.1
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

