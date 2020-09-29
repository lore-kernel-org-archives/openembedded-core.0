Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.web10.12974.1601351153639314478
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2020 20:45:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=suL0P8Oe;
 spf=pass (domain: gmail.com, ip: 209.85.222.196, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f196.google.com with SMTP id w16so3140690qkj.7
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2020 20:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+I1HSFQlbdFSn68HyJBds/6dio85Hj6+6fNuDB4fYS4=;
        b=suL0P8OeuinaStqYSJ79bpMJwHENyPFZy1+rrQfRFV5hiHVoYPD2AUXSozPum0fvPQ
         jqSY/beUhdVPetGGPCDJ39Pk1zeDwAgdfgqyTPqaPsFBwkOqlyG+jZeZl0k0eBgB+Rg0
         mxgq9lpDQU4nunRPGxvofp/K3cvDaQMR7o+jaLgdAgY2yBE8LVz9mcNbsgAFmbLlQpUv
         319NW1T188BHVle5Q5T9Gf30GIF1XZVJ2VKaCp5geltObDNvlqXOTpDW1vuDcv9hpmNA
         4fk2+KXdXA92L8mEu13Kl9+wtBx8aYgQnTi8LG21+5FWdZL45wyDYeIUswL5iJklqyeW
         xuNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+I1HSFQlbdFSn68HyJBds/6dio85Hj6+6fNuDB4fYS4=;
        b=DQuxBNY7Tyx20xpp1BUp16ugIyEKblWqZoDFle0abtkIUBnnoD1xvrRebPiMFV3wW0
         SQ0vwIDzIF/pHiJgHPxIZnF44iXbwbDxmcvGFg7VloWQvaJi7yWcaYidsNXxuXezWarU
         0Ld8aXCobCHxD1AxYdDm3rjFZQt6nE9BL+tYkql1KGr8U1wa5YFQ8O8DGBW2NdWoUvAO
         1wSO7zTLJJPf+wTZIMyplTFD15PKFCtm7qBeOhq1FUzR0/xLUhWzN+8zE5t/APGa7CNl
         GAJeFw8RrKSFXfvGzTlvj7KyOFXrFGS8D1lW5beY622UmqWkIeEOMPbcBNFFtUtgh1oN
         P75Q==
X-Gm-Message-State: AOAM5322L91Zz1tKTNY9f8KaqvIYzI7v33xF9MmXmRp+n1hmfNKKtwv/
	+oMRpi1X2wXGrb3eIPNDA0217hAXbhwAXTMjmys=
X-Google-Smtp-Source: ABdhPJyU+TqTdNCbc3i9NF0zcW59yMLPcBsWt7u2G8pypDVfOxNid2OgQL4O/qNryRdDwIqZRwM7SUlpWFEuUh+kU4o=
X-Received: by 2002:a37:9046:: with SMTP id s67mr2660583qkd.212.1601351152331;
 Mon, 28 Sep 2020 20:45:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200924023944.48941-1-mingli.yu@windriver.com>
 <25e019e30ea0a91d4c6f9d85a9beeb21f4470953.camel@intel.com>
 <a70aa029-fd52-f9a0-1cf8-6403e9370ee1@windriver.com> <CAMKF1spOERv6f00A=zrEzOAT_+heXx=rs3x09S8DnorcMqDPpQ@mail.gmail.com>
In-Reply-To: <CAMKF1spOERv6f00A=zrEzOAT_+heXx=rs3x09S8DnorcMqDPpQ@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 28 Sep 2020 20:45:26 -0700
Message-ID: <CAMKF1speF6tngdPzPkRhAkTC4pxGy=t211k+XLpbeBBifqpvYA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] bash: fix CVE-2019-18276
To: "Yu, Mingli" <mingli.yu@windriver.com>
Cc: Anuj Mittal <anuj.mittal@intel.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 28, 2020 at 8:27 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Wed, Sep 23, 2020 at 11:00 PM Yu, Mingli <mingli.yu@windriver.com> wrote:
> >
> > Hi Anuj,
> >
> > On 9/24/20 10:50 AM, Anuj Mittal wrote:
> > > Hi Mingli,
> > >
> > > On Thu, 2020-09-24 at 10:39 +0800, Yu, Mingli wrote:
> > >> From: De Huo <De.Huo@windriver.com>
> > >>
> > >> An issue was discovered in disable_priv_mode in shell.c in GNU Bash
> > >> through 5.0 patch 11. By default, if Bash is run with its effective
> > >> UID
> > >> not equal to its real UID, it will drop privileges by setting its
> > >> effective UID to its real UID. However, it does so incorrectly. On
> > >> Linux
> > >> and other systems that support "saved UID" functionality, the saved
> > >> UID
> > >> is not dropped. An attacker with command execution in the shell can
> > >> use
> > >> "enable -f" for runtime loading of a new builtin, which can be a
> > >> shared
> > >> object that calls setuid() and therefore regains privileges. However,
> > >> binaries running with an effective UID of 0 are unaffected.
> > >>
> > >> Get the patch from [1] to fix the issue.
> > >>
> > >> [1]
> > >> https://git.savannah.gnu.org/cgit/bash.git/commit/?h=devel&id=951bdaa
> > >
> > > Has something changed from last time this patch was submitted and later
> > > reverted because of the failing ptest? I remember the author saying
> > > this isn't a real security bug and there were also changes in the patch
> > > that weren't related to the CVE ...
> >
> > Changed the patch a little to remove the configure file part to fix the
> > reconfigure issue in v1 patch.
> >
> > Yes, the author saying the patch did fix the issue stated in
> > CVE-2019-18276 though the issue actually is't a big deal.
> >
>
> This seems to be regressing bash ptests now.
>
>     ptestresult.bash.run-glob-test
>     ptestresult.bash.run-read
>     ptestresult.bash.run-trap
>

These failures are happening without this patch too, so perhaps
something else has caused it, could be perhaps setup related too.

    ptestresult.bash.run-builtins
    ptestresult.bash.run-glob-test
    ptestresult.bash.run-intl
    ptestresult.bash.run-printf
    ptestresult.bash.run-read
    ptestresult.bash.run-trap



>
> If its not a real security bug then perhaps its better to revert it.
>
>
> > Thanks,
> >
> > >
> > > Thanks,
> > >
> > > Anuj
> > >
> > >>
> > >> Signed-off-by: De Huo <De.Huo@windriver.com>
> > >> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> > >> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> > >> ---
> > >>   .../bash/bash/bash-CVE-2019-18276.patch       | 386
> > >> ++++++++++++++++++
> > >>   meta/recipes-extended/bash/bash_5.0.bb        |   1 +
> > >>   2 files changed, 387 insertions(+)
> > >>   create mode 100644 meta/recipes-extended/bash/bash/bash-CVE-2019-
> > >> 18276.patch
> > >>
> > >> diff --git a/meta/recipes-extended/bash/bash/bash-CVE-2019-
> > >> 18276.patch b/meta/recipes-extended/bash/bash/bash-CVE-2019-
> > >> 18276.patch
> > >> new file mode 100644
> > >> index 0000000000..7b2073201e
> > >> --- /dev/null
> > >> +++ b/meta/recipes-extended/bash/bash/bash-CVE-2019-18276.patch
> > >> @@ -0,0 +1,386 @@
> > >> +From 951bdaad7a18cc0dc1036bba86b18b90874d39ff Mon Sep 17 00:00:00
> > >> 2001
> > >> +From: Chet Ramey <chet.ramey@case.edu>
> > >> +Date: Mon, 1 Jul 2019 09:03:53 -0400
> > >> +Subject: [PATCH] commit bash-20190628 snapshot
> > >> +
> > >> +An issue was discovered in disable_priv_mode in shell.c in GNU Bash
> > >> through 5.0 patch 11.
> > >> +By default, if Bash is run with its effective UID not equal to its
> > >> real UID,
> > >> +it will drop privileges by setting its effective UID to its real
> > >> UID.
> > >> +However, it does so incorrectly. On Linux and other systems that
> > >> support "saved UID" functionality,
> > >> +the saved UID is not dropped. An attacker with command execution in
> > >> the shell can use "enable -f" for
> > >> +runtime loading of a new builtin, which can be a shared object that
> > >> calls setuid() and therefore
> > >> +regains privileges. However, binaries running with an effective UID
> > >> of 0 are unaffected.
> > >> +
> > >> +Get the patch from [1] to fix the issue.
> > >> +
> > >> +Upstream-Status: Inappropriate [the upstream thinks it doesn't
> > >> increase the credibility of CVEs in general]
> > >> +CVE: CVE-2019-18276
> > >> +
> > >> +[1]
> > >> https://git.savannah.gnu.org/cgit/bash.git/commit/?h=devel&id=951bdaa
> > >> +
> > >> +Signed-off-by: De Huo <De.Huo@windriver.com>
> > >> +Signed-off-by: Kai Kang <kai.kang@windriver.com>
> > >> +Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> > >> +---
> > >> + MANIFEST          |  2 ++
> > >> + bashline.c        | 50 +-------------------------------------------
> > >> ------
> > >> + builtins/help.def |  2 +-
> > >> + config.h.in       | 10 +++++++++-
> > >> + configure.ac      |  1 +
> > >> + doc/bash.1        |  3 ++-
> > >> + doc/bashref.texi  |  3 ++-
> > >> + lib/glob/glob.c   |  5 ++++-
> > >> + pathexp.c         | 16 ++++++++++++++--
> > >> + shell.c           |  8 ++++++++
> > >> + tests/glob.tests  |  2 ++
> > >> + tests/glob6.sub   | 54
> > >> ++++++++++++++++++++++++++++++++++++++++++++++++++++++
> > >> + tests/glob7.sub   | 11 +++++++++++
> > >> + 14 files changed, 122 insertions(+), 56 deletions(-)
> > >> + create mode 100644 tests/glob6.sub
> > >> + create mode 100644 tests/glob7.sub
> > >> +
> > >> +diff --git a/MANIFEST b/MANIFEST
> > >> +index 03de221..f9ccad7 100644
> > >> +--- a/MANIFEST
> > >> ++++ b/MANIFEST
> > >> +@@ -1037,6 +1037,8 @@ tests/extglob3.tests  f
> > >> + tests/extglob3.right       f
> > >> + tests/extglob4.sub f
> > >> + tests/extglob5.sub f
> > >> ++tests/glob6.sub            f
> > >> ++tests/glob7.sub            f
> > >> + tests/func.tests   f
> > >> + tests/func.right   f
> > >> + tests/func1.sub            f
> > >> +diff --git a/bashline.c b/bashline.c
> > >> +index 824ea9d..d86b47d 100644
> > >> +--- a/bashline.c
> > >> ++++ b/bashline.c
> > >> +@@ -3718,55 +3718,7 @@ static int
> > >> + completion_glob_pattern (string)
> > >> +      char *string;
> > >> + {
> > >> +-  register int c;
> > >> +-  char *send;
> > >> +-  int open;
> > >> +-
> > >> +-  DECLARE_MBSTATE;
> > >> +-
> > >> +-  open = 0;
> > >> +-  send = string + strlen (string);
> > >> +-
> > >> +-  while (c = *string++)
> > >> +-    {
> > >> +-      switch (c)
> > >> +-   {
> > >> +-   case '?':
> > >> +-   case '*':
> > >> +-     return (1);
> > >> +-
> > >> +-   case '[':
> > >> +-     open++;
> > >> +-     continue;
> > >> +-
> > >> +-   case ']':
> > >> +-     if (open)
> > >> +-       return (1);
> > >> +-     continue;
> > >> +-
> > >> +-   case '+':
> > >> +-   case '@':
> > >> +-   case '!':
> > >> +-     if (*string == '(')   /*)*/
> > >> +-       return (1);
> > >> +-     continue;
> > >> +-
> > >> +-   case '\\':
> > >> +-     if (*string++ == 0)
> > >> +-       return (0);
> > >> +-   }
> > >> +-
> > >> +-      /* Advance one fewer byte than an entire multibyte character
> > >> to
> > >> +-    account for the auto-increment in the loop above. */
> > >> +-#ifdef HANDLE_MULTIBYTE
> > >> +-      string--;
> > >> +-      ADVANCE_CHAR_P (string, send - string);
> > >> +-      string++;
> > >> +-#else
> > >> +-      ADVANCE_CHAR_P (string, send - string);
> > >> +-#endif
> > >> +-    }
> > >> +-  return (0);
> > >> ++  return (glob_pattern_p (string) == 1);
> > >> + }
> > >> +
> > >> + static char *globtext;
> > >> +diff --git a/builtins/help.def b/builtins/help.def
> > >> +index 006c4b5..92f9b38 100644
> > >> +--- a/builtins/help.def
> > >> ++++ b/builtins/help.def
> > >> +@@ -128,7 +128,7 @@ help_builtin (list)
> > >> +
> > >> +   /* We should consider making `help bash' do something. */
> > >> +
> > >> +-  if (glob_pattern_p (list->word->word))
> > >> ++  if (glob_pattern_p (list->word->word) == 1)
> > >> +     {
> > >> +       printf ("%s", ngettext ("Shell commands matching keyword `",
> > >> "Shell commands matching keywords `", (list->next ? 2 : 1)));
> > >> +       print_word_list (list, ", ");
> > >> +diff --git a/config.h.in b/config.h.in
> > >> +index 8554aec..ad4b1e8 100644
> > >> +--- a/config.h.in
> > >> ++++ b/config.h.in
> > >> +@@ -1,6 +1,6 @@
> > >> + /* config.h -- Configuration file for bash. */
> > >> +
> > >> +-/* Copyright (C) 1987-2009,2011-2012 Free Software Foundation, Inc.
> > >> ++/* Copyright (C) 1987-2009,2011-2012,2013-2019 Free Software
> > >> Foundation, Inc.
> > >> +
> > >> +    This file is part of GNU Bash, the Bourne Again SHell.
> > >> +
> > >> +@@ -807,6 +807,14 @@
> > >> + #undef HAVE_SETREGID
> > >> + #undef HAVE_DECL_SETREGID
> > >> +
> > >> ++/* Define if you have the setregid function.  */
> > >> ++#undef HAVE_SETRESGID
> > >> ++#undef HAVE_DECL_SETRESGID
> > >> ++
> > >> ++/* Define if you have the setresuid function.  */
> > >> ++#undef HAVE_SETRESUID
> > >> ++#undef HAVE_DECL_SETRESUID
> > >> ++
> > >> + /* Define if you have the setvbuf function.  */
> > >> + #undef HAVE_SETVBUF
> > >> +
> > >> +diff --git a/configure.ac b/configure.ac
> > >> +index 52b4cdb..549adef 100644
> > >> +--- a/configure.ac
> > >> ++++ b/configure.ac
> > >> +@@ -810,6 +810,7 @@ AC_CHECK_DECLS([confstr])
> > >> + AC_CHECK_DECLS([printf])
> > >> + AC_CHECK_DECLS([sbrk])
> > >> + AC_CHECK_DECLS([setregid])
> > >> ++AC_CHECK_DECLS[(setresuid, setresgid])
> > >> + AC_CHECK_DECLS([strcpy])
> > >> + AC_CHECK_DECLS([strsignal])
> > >> +
> > >> +diff --git a/doc/bash.1 b/doc/bash.1
> > >> +index e6cd08d..9e58a0b 100644
> > >> +--- a/doc/bash.1
> > >> ++++ b/doc/bash.1
> > >> +@@ -4681,7 +4681,8 @@ above).
> > >> + .PD
> > >> + .SH "SIMPLE COMMAND EXPANSION"
> > >> + When a simple command is executed, the shell performs the following
> > >> +-expansions, assignments, and redirections, from left to right.
> > >> ++expansions, assignments, and redirections, from left to right, in
> > >> ++the following order.
> > >> + .IP 1.
> > >> + The words that the parser has marked as variable assignments (those
> > >> + preceding the command name) and redirections are saved for later
> > >> +diff --git a/doc/bashref.texi b/doc/bashref.texi
> > >> +index d33cd57..3065126 100644
> > >> +--- a/doc/bashref.texi
> > >> ++++ b/doc/bashref.texi
> > >> +@@ -2964,7 +2964,8 @@ is not specified.  If the file does not exist,
> > >> it is created.
> > >> + @cindex command expansion
> > >> +
> > >> + When a simple command is executed, the shell performs the following
> > >> +-expansions, assignments, and redirections, from left to right.
> > >> ++expansions, assignments, and redirections, from left to right, in
> > >> ++the following order.
> > >> +
> > >> + @enumerate
> > >> + @item
> > >> +diff --git a/lib/glob/glob.c b/lib/glob/glob.c
> > >> +index 398253b..2eaa33e 100644
> > >> +--- a/lib/glob/glob.c
> > >> ++++ b/lib/glob/glob.c
> > >> +@@ -607,6 +607,7 @@ glob_vector (pat, dir, flags)
> > >> +   register unsigned int i;
> > >> +   int mflags;              /* Flags passed to strmatch (). */
> > >> +   int pflags;              /* flags passed to sh_makepath () */
> > >> ++  int hasglob;             /* return value from glob_pattern_p */
> > >> +   int nalloca;
> > >> +   struct globval *firstmalloc, *tmplink;
> > >> +   char *convfn;
> > >> +@@ -648,10 +649,12 @@ glob_vector (pat, dir, flags)
> > >> +   patlen = (pat && *pat) ? strlen (pat) : 0;
> > >> +
> > >> +   /* If the filename pattern (PAT) does not contain any globbing
> > >> characters,
> > >> ++     or contains a pattern with only backslash escapes (hasglob ==
> > >> 2),
> > >> +      we can dispense with reading the directory, and just see if
> > >> there is
> > >> +      a filename `DIR/PAT'.  If there is, and we can access it, just
> > >> make the
> > >> +      vector to return and bail immediately. */
> > >> +-  if (skip == 0 && glob_pattern_p (pat) == 0)
> > >> ++  hasglob = 0;
> > >> ++  if (skip == 0 && (hasglob = glob_pattern_p (pat)) == 0 || hasglob
> > >> == 2)
> > >> +     {
> > >> +       int dirlen;
> > >> +       struct stat finfo;
> > >> +diff --git a/pathexp.c b/pathexp.c
> > >> +index c1bf2d8..e6c5392 100644
> > >> +--- a/pathexp.c
> > >> ++++ b/pathexp.c
> > >> +@@ -58,7 +58,10 @@ int extended_glob = EXTGLOB_DEFAULT;
> > >> + /* Control enabling special handling of `**' */
> > >> + int glob_star = 0;
> > >> +
> > >> +-/* Return nonzero if STRING has any unquoted special globbing chars
> > >> in it.  */
> > >> ++/* Return nonzero if STRING has any unquoted special globbing chars
> > >> in it.
> > >> ++   This is supposed to be called when pathname expansion is
> > >> performed, so
> > >> ++   it implements the rules in Posix 2.13.3, specifically that an
> > >> unquoted
> > >> ++   slash cannot appear in a bracket expression. */
> > >> + int
> > >> + unquoted_glob_pattern_p (string)
> > >> +      register char *string;
> > >> +@@ -85,10 +88,14 @@ unquoted_glob_pattern_p (string)
> > >> +      continue;
> > >> +
> > >> +    case ']':
> > >> +-     if (open)
> > >> ++     if (open)             /* XXX - if --open == 0? */
> > >> +        return (1);
> > >> +      continue;
> > >> +
> > >> ++   case '/':
> > >> ++     if (open)
> > >> ++       open = 0;
> > >> ++
> > >> +    case '+':
> > >> +    case '@':
> > >> +    case '!':
> > >> +@@ -106,6 +113,11 @@ unquoted_glob_pattern_p (string)
> > >> +          string++;
> > >> +          continue;
> > >> +        }
> > >> ++     else if (open && *string == '/')
> > >> ++       {
> > >> ++         string++;         /* quoted slashes in bracket
> > >> expressions are ok */
> > >> ++         continue;
> > >> ++       }
> > >> +      else if (*string == 0)
> > >> +        return (0);
> > >> +
> > >> +diff --git a/shell.c b/shell.c
> > >> +index a2b2a55..6adabc8 100644
> > >> +--- a/shell.c
> > >> ++++ b/shell.c
> > >> +@@ -1293,7 +1293,11 @@ disable_priv_mode ()
> > >> + {
> > >> +   int e;
> > >> +
> > >> ++#if HAVE_DECL_SETRESUID
> > >> ++  if (setresuid (current_user.uid, current_user.uid,
> > >> current_user.uid) < 0)
> > >> ++#else
> > >> +   if (setuid (current_user.uid) < 0)
> > >> ++#endif
> > >> +     {
> > >> +       e = errno;
> > >> +       sys_error (_("cannot set uid to %d: effective uid %d"),
> > >> current_user.uid, current_user.euid);
> > >> +@@ -1302,7 +1306,11 @@ disable_priv_mode ()
> > >> +    exit (e);
> > >> + #endif
> > >> +     }
> > >> ++#if HAVE_DECL_SETRESGID
> > >> ++  if (setresgid (current_user.gid, current_user.gid,
> > >> current_user.gid) < 0)
> > >> ++#else
> > >> +   if (setgid (current_user.gid) < 0)
> > >> ++#endif
> > >> +     sys_error (_("cannot set gid to %d: effective gid %d"),
> > >> current_user.gid, current_user.egid);
> > >> +
> > >> +   current_user.euid = current_user.uid;
> > >> +diff --git a/tests/glob.tests b/tests/glob.tests
> > >> +index 01913bb..fb012f7 100644
> > >> +--- a/tests/glob.tests
> > >> ++++ b/tests/glob.tests
> > >> +@@ -12,6 +12,8 @@ ${THIS_SH} ./glob1.sub
> > >> + ${THIS_SH} ./glob2.sub
> > >> + ${THIS_SH} ./glob3.sub
> > >> + ${THIS_SH} ./glob4.sub
> > >> ++${THIS_SH} ./glob6.sub
> > >> ++${THIS_SH} ./glob7.sub
> > >> +
> > >> + MYDIR=$PWD # save where we are
> > >> +
> > >> +diff --git a/tests/glob6.sub b/tests/glob6.sub
> > >> +new file mode 100644
> > >> +index 0000000..b099811
> > >> +--- /dev/null
> > >> ++++ b/tests/glob6.sub
> > >> +@@ -0,0 +1,54 @@
> > >> ++# tests of the backslash-in-glob-patterns discussion on the austin-
> > >> group ML
> > >> ++
> > >> ++: ${TMPDIR:=/var/tmp}
> > >> ++
> > >> ++ORIG=$PWD
> > >> ++GLOBDIR=$TMPDIR/bash-glob-$$
> > >> ++mkdir $GLOBDIR && cd $GLOBDIR
> > >> ++
> > >> ++# does the pattern matcher allow backslashes as escape characters
> > >> and remove
> > >> ++# them as part of matching?
> > >> ++touch abcdefg
> > >> ++pat='ab\cd*'
> > >> ++printf '<%s>\n' $pat
> > >> ++pat='\.'
> > >> ++printf '<%s>\n' $pat
> > >> ++rm abcdefg
> > >> ++
> > >> ++# how about when escaping pattern characters?
> > >> ++touch '*abc.c'
> > >> ++a='\**.c'
> > >> ++printf '%s\n' $a
> > >> ++rm -f '*abc.c'
> > >> ++
> > >> ++# how about when making the distinction between readable and
> > >> searchable path
> > >> ++# components?
> > >> ++mkdir -m a=x searchable
> > >> ++mkdir -m a=r readable
> > >> ++
> > >> ++p='searchable/\.'
> > >> ++printf "%s\n" $p
> > >> ++
> > >> ++p='searchable/\./.'
> > >> ++printf "%s\n" $p
> > >> ++
> > >> ++p='readable/\.'
> > >> ++printf "%s\n" $p
> > >> ++
> > >> ++p='readable/\./.'
> > >> ++printf "%s\n" $p
> > >> ++
> > >> ++printf "%s\n" 'searchable/\.'
> > >> ++printf "%s\n" 'readable/\.'
> > >> ++
> > >> ++echo */.
> > >> ++
> > >> ++p='*/\.'
> > >> ++echo $p
> > >> ++
> > >> ++echo */'.'
> > >> ++
> > >> ++rmdir searchable readable
> > >> ++
> > >> ++cd $ORIG
> > >> ++rmdir $GLOBDIR
> > >> +diff --git a/tests/glob7.sub b/tests/glob7.sub
> > >> +new file mode 100644
> > >> +index 0000000..0212b8e
> > >> +--- /dev/null
> > >> ++++ b/tests/glob7.sub
> > >> +@@ -0,0 +1,11 @@
> > >> ++# according to Posix 2.13.3, a slash in a bracket expression
> > >> renders that
> > >> ++# bracket expression invalid
> > >> ++shopt -s nullglob
> > >> ++
> > >> ++echo 1: [qwe/qwe]
> > >> ++echo 2: [qwe/
> > >> ++echo 3: [qwe/]
> > >> ++
> > >> ++echo 4: [qwe\/qwe]
> > >> ++echo 5: [qwe\/
> > >> ++echo 6: [qwe\/]
> > >> +--
> > >> +1.9.1
> > >> +
> > >> diff --git a/meta/recipes-extended/bash/bash_5.0.bb b/meta/recipes-
> > >> extended/bash/bash_5.0.bb
> > >> index 12d472be57..257a03bd8b 100644
> > >> --- a/meta/recipes-extended/bash/bash_5.0.bb
> > >> +++ b/meta/recipes-extended/bash/bash_5.0.bb
> > >> @@ -30,6 +30,7 @@ SRC_URI =
> > >> "${GNU_MIRROR}/bash/${BP}.tar.gz;name=tarball \
> > >>              file://run-ptest \
> > >>              file://run-bash-ptests \
> > >>              file://fix-run-builtins.patch \
> > >> +           file://bash-CVE-2019-18276.patch \
> > >>              "
> > >>
> > >>   SRC_URI[tarball.md5sum] = "2b44b47b905be16f45709648f671820b"
> > >>
> > >>
> > >>
> > >>
> > >>
> > >>
> >
> > 
> >
