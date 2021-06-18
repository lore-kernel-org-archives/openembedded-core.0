Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
 by mx.groups.io with SMTP id smtpd.web11.14575.1624053752444403139
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Jun 2021 15:02:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=khFejJs5;
 spf=pass (domain: gmail.com, ip: 209.85.166.181, mailfrom: wallinux@gmail.com)
Received: by mail-il1-f181.google.com with SMTP id i17so1092539ilj.11
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Jun 2021 15:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rboqsl0Ns/U8nnddnijxXIyuoSTLuoHs/HOO1DDcvpQ=;
        b=khFejJs5w47NlWjMTvzl7Dxt9rGvk6TxV5H1WzZ8hLbKPrY/MZ/pPb1jY3txX1UvTd
         A8a68akM0WKo5ppY5gUcSgRkfJIXaUfVW3pZZSyDNg/wPug14RHWCbUSMZy9G6uq+1CP
         qXJDn9xn63Jd/t7+j1ZVr/6UyEJ2MPFCO1uxb3eb7cb+TF2t0I4B6eNExBRrVwAFO8SI
         O5CRJge9s6u4DkHgUcLkn3QGwJNLjec6iOtbNBnEco1BwNy/iOmkT64Aw9zij4AVX1HM
         q1aRMEbJ98Tw8RyxiQiO+e3rB7z2+0fsw2IJ4SAwLYI+XRdG+QX7ADrEz4IjzoZq4t+v
         H2cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rboqsl0Ns/U8nnddnijxXIyuoSTLuoHs/HOO1DDcvpQ=;
        b=K2nRBdIRDH4+ofW1PVYnGaTG9KovLIftM4kGyYCC5qWDsjllKAmzPwS7nvqERzp4mL
         2NyA7o+sWHptACn2gnVzUTE04UyZKZz3bkNXeb7eoZ+pmrP2b5Q01PX9h1qjnwP9Gvcf
         UR9sy+xyyx4rD/Ky9tEpsWpNjfiTwuPc35bKDddjCCYFjga/sixl7mrVHJesiwzvDO1N
         f+ewmllNKU9txyEtxTGPt9XrB2snG15FVDe4vCPl/vDmFN2QYIfGDr0e6b8WbAF7+MPV
         dNR1aRCLr2mbW/3WJkm7QxzjDgpSbC++lA76/jT4AzE0O1kQpgrqit3+fvp5LYRvXvII
         jBgA==
X-Gm-Message-State: AOAM531vtRuBU9y7JfcqsDvse7FnfrgnVSYipTnfdR559EgW+Og6EdvE
	OsOqCc1HZ7dwQYhgehhIcTEGZGuY47xk5UdGbLJ+DPNuz4SnFA==
X-Google-Smtp-Source: ABdhPJyVx0vC+GbYFKW1dydGWhxfRBnUhauOfQ8hx64cakrfQlz9UoaXUNtN0q6fm+OtkYIP/7ggiWcdPbrTDBA/sas=
X-Received: by 2002:a92:cd8d:: with SMTP id r13mr6463109ilb.20.1624053751362;
 Fri, 18 Jun 2021 15:02:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210618204301.426877-1-anders.wallin@windriver.com>
In-Reply-To: <20210618204301.426877-1-anders.wallin@windriver.com>
From: "Anders Wallin" <wallinux@gmail.com>
Date: Sat, 19 Jun 2021 00:02:20 +0200
Message-ID: <CAF2baFeHBtnnczA++v=ST080Uy7NunATOFzXitG6EkVzPdbLxQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH] coreutils: remove NOSTAT_LEAF_OPTIMIZATION
To: OE-core <openembedded-core@lists.openembedded.org>
Cc: Anders Wallin <anders.wallin@windriver.com>
Content-Type: multipart/alternative; boundary="000000000000f23c8105c5117a75"

--000000000000f23c8105c5117a75
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alex,

coreutils is using gnulib as a submodule. In the tarball used by the recipe
the gnulib source is included. The patch comes from
gnulib
https://github.com/coreutils/gnulib/commit/47bf2cf3184027c1eb9c1dfeea5c5b8b=
2d69710d
In the next release of coreutils this fix will be included.

I will make a V2 patch with this information and add the Upstream-Status,
but it's late now so I will do it on Monday

Anders Wallin


On Fri, Jun 18, 2021 at 10:43 PM Anders Wallin <wallinux@gmail.com> wrote:

> It caused =E2=80=98find=E2=80=99 and =E2=80=98du=E2=80=99 to dump core, a=
nd it was useful
> only for obsolescent Linux filesystems anyway.  Problem reported in:
> https://lists.gnu.org/r/bug-gnulib/2020-04/msg00068.html
> Quite possibly there is still a serious underlying fts bug with
> tight-loop-check and mutating file systems, but if so this patch
> should cause the bug to be triggered less often.
> * lib/fts.c (enum leaf_optimization): Remove
> NOSTAT_LEAF_OPTIMIZATION, as it=E2=80=99s problematic.
> (S_MAGIC_REISERFS, S_MAGIC_XFS): Remove; no longer needed.
> (leaf_optimization): Remove special cases for ReiserFS and XFS.
> (fts_read): Remove NOSTAT_LEAF_OPTIMIZATION code.
> * lib/fts_.h (struct _ftsent.fts_n_dirs_remaining):
> Remove.  All uses removed.
>
> Signed-off-by: Anders Wallin <anders.wallin@windriver.com>
> ---
>  ...-fts-remove-NOSTAT_LEAF_OPTIMIZATION.patch | 162 ++++++++++++++++++
>  meta/recipes-core/coreutils/coreutils_8.32.bb |   1 +
>  2 files changed, 163 insertions(+)
>  create mode 100644
> meta/recipes-core/coreutils/coreutils/0001-fts-remove-NOSTAT_LEAF_OPTIMIZ=
ATION.patch
>
> diff --git
> a/meta/recipes-core/coreutils/coreutils/0001-fts-remove-NOSTAT_LEAF_OPTIM=
IZATION.patch
> b/meta/recipes-core/coreutils/coreutils/0001-fts-remove-NOSTAT_LEAF_OPTIM=
IZATION.patch
> new file mode 100644
> index 0000000000..e3f9e3b502
> --- /dev/null
> +++
> b/meta/recipes-core/coreutils/coreutils/0001-fts-remove-NOSTAT_LEAF_OPTIM=
IZATION.patch
> @@ -0,0 +1,162 @@
> +From 0a0d887e095f97185d25e90b59612b1da8197533 Mon Sep 17 00:00:00 2001
> +Message-Id: <
> 0a0d887e095f97185d25e90b59612b1da8197533.1624008099.git.wallinux@gmail.co=
m
> >
> +From: Paul Eggert <eggert@cs.ucla.edu>
> +Date: Wed, 15 Apr 2020 20:50:32 -0700
> +Subject: [PATCH] fts: remove NOSTAT_LEAF_OPTIMIZATION
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +It caused =E2=80=98find=E2=80=99 and =E2=80=98du=E2=80=99 to dump core, =
and it was useful
> +only for obsolescent Linux filesystems anyway.  Problem reported in:
> +https://lists.gnu.org/r/bug-gnulib/2020-04/msg00068.html
> +Quite possibly there is still a serious underlying fts bug with
> +tight-loop-check and mutating file systems, but if so this patch
> +should cause the bug to be triggered less often.
> +* lib/fts.c (enum leaf_optimization): Remove
> +NOSTAT_LEAF_OPTIMIZATION, as it=E2=80=99s problematic.
> +(S_MAGIC_REISERFS, S_MAGIC_XFS): Remove; no longer needed.
> +(leaf_optimization): Remove special cases for ReiserFS and XFS.
> +(fts_read): Remove NOSTAT_LEAF_OPTIMIZATION code.
> +* lib/fts_.h (struct _ftsent.fts_n_dirs_remaining):
> +Remove.  All uses removed.
> +---
> + lib/fts.c  | 56 ++++++++----------------------------------------------
> + lib/fts_.h |  5 -----
> + 2 files changed, 8 insertions(+), 53 deletions(-)
> +
> +diff --git a/lib/fts.c b/lib/fts.c
> +index d3a0472..ade8c33 100644
> +--- a/lib/fts.c
> ++++ b/lib/fts.c
> +@@ -445,7 +445,6 @@ fts_open (char * const *argv,
> +                 if ((parent =3D fts_alloc(sp, "", 0)) =3D=3D NULL)
> +                         goto mem2;
> +                 parent->fts_level =3D FTS_ROOTPARENTLEVEL;
> +-                parent->fts_n_dirs_remaining =3D -1;
> +           }
> +
> +         /* The classic fts implementation would call fts_stat with
> +@@ -634,9 +633,8 @@ fts_close (FTS *sp)
> + }
> +
> + /* Minimum link count of a traditional Unix directory.  When leaf
> +-   optimization is OK and MIN_DIR_NLINK <=3D st_nlink, then st_nlink is
> +-   an upper bound on the number of subdirectories (counting "." and
> +-   "..").  */
> ++   optimization is OK and a directory's st_nlink =3D=3D MIN_DIR_NLINK,
> ++   then the directory has no subdirectories.  */
> + enum { MIN_DIR_NLINK =3D 2 };
> +
> + /* Whether leaf optimization is OK for a directory.  */
> +@@ -645,12 +643,8 @@ enum leaf_optimization
> +     /* st_nlink is not reliable for this directory's subdirectories.  *=
/
> +     NO_LEAF_OPTIMIZATION,
> +
> +-    /* Leaf optimization is OK, but is not useful for avoiding stat
> calls.  */
> +-    OK_LEAF_OPTIMIZATION,
> +-
> +-    /* Leaf optimization is not only OK: it is useful for avoiding
> +-       stat calls, because dirent.d_type does not work.  */
> +-    NOSTAT_LEAF_OPTIMIZATION
> ++    /* st_nlink =3D=3D 2 means the directory lacks subdirectories.  */
> ++    OK_LEAF_OPTIMIZATION
> +   };
> +
> + #if (defined __linux__ || defined __ANDROID__) \
> +@@ -663,9 +657,7 @@ enum leaf_optimization
> + # define S_MAGIC_CIFS 0xFF534D42
> + # define S_MAGIC_NFS 0x6969
> + # define S_MAGIC_PROC 0x9FA0
> +-# define S_MAGIC_REISERFS 0x52654973
> + # define S_MAGIC_TMPFS 0x1021994
> +-# define S_MAGIC_XFS 0x58465342
> +
> + # ifdef HAVE___FSWORD_T
> + typedef __fsword_t fsword;
> +@@ -782,23 +774,15 @@ dirent_inode_sort_may_be_useful (FTSENT const *p,
> int dir_fd)
> + }
> +
> + /* Given an FTS entry P for a directory with descriptor DIR_FD,
> +-   return true if it is both useful and valid to apply leaf optimizatio=
n.
> +-   The optimization is useful only for file systems that lack usable
> +-   dirent.d_type info.  The optimization is valid if an st_nlink value
> +-   of at least MIN_DIR_NLINK is an upper bound on the number of
> +-   subdirectories of D, counting "." and ".."  as subdirectories.
> ++   return whether it is valid to apply leaf optimization.
> ++   The optimization is valid if a directory's st_nlink value equal
> ++   to MIN_DIR_NLINK means the directory has no subdirectories.
> +    DIR_FD is negative if unavailable.  */
> + static enum leaf_optimization
> + leaf_optimization (FTSENT const *p, int dir_fd)
> + {
> +   switch (filesystem_type (p, dir_fd))
> +     {
> +-      /* List here the file system types that may lack usable
> dirent.d_type
> +-         info, yet for which the optimization does apply.  */
> +-    case S_MAGIC_REISERFS:
> +-    case S_MAGIC_XFS: /* XFS lacked it until 2013-08-22 commit.  */
> +-      return NOSTAT_LEAF_OPTIMIZATION;
> +-
> +     case 0:
> +       /* Leaf optimization is unsafe if the file system type is
> unknown.  */
> +       FALLTHROUGH;
> +@@ -1023,26 +1007,7 @@ check_for_dir:
> +                 if (p->fts_info =3D=3D FTS_NSOK)
> +                   {
> +                     if (p->fts_statp->st_size =3D=3D FTS_STAT_REQUIRED)
> +-                      {
> +-                        FTSENT *parent =3D p->fts_parent;
> +-                        if (parent->fts_n_dirs_remaining =3D=3D 0
> +-                            && ISSET(FTS_NOSTAT)
> +-                            && ISSET(FTS_PHYSICAL)
> +-                            && (leaf_optimization (parent,
> sp->fts_cwd_fd)
> +-                                =3D=3D NOSTAT_LEAF_OPTIMIZATION))
> +-                          {
> +-                            /* nothing more needed */
> +-                          }
> +-                        else
> +-                          {
> +-                            p->fts_info =3D fts_stat(sp, p, false);
> +-                            if (S_ISDIR(p->fts_statp->st_mode)
> +-                                && p->fts_level !=3D FTS_ROOTLEVEL
> +-                                && 0 < parent->fts_n_dirs_remaining
> +-                                && parent->fts_n_dirs_remaining !=3D
> (nlink_t) -1)
> +-                                  parent->fts_n_dirs_remaining--;
> +-                          }
> +-                      }
> ++                      p->fts_info =3D fts_stat(sp, p, false);
> +                     else
> +                       fts_assert (p->fts_statp->st_size =3D=3D
> FTS_NO_STAT_REQUIRED);
> +                   }
> +@@ -1826,11 +1791,6 @@ err:            memset(sbp, 0, sizeof(struct
> stat));
> +         }
> +
> +         if (S_ISDIR(sbp->st_mode)) {
> +-                p->fts_n_dirs_remaining
> +-                  =3D ((sbp->st_nlink < MIN_DIR_NLINK
> +-                      || p->fts_level <=3D FTS_ROOTLEVEL)
> +-                     ? -1
> +-                     : sbp->st_nlink - (ISSET (FTS_SEEDOT) ? 0 :
> MIN_DIR_NLINK));
> +                 if (ISDOT(p->fts_name)) {
> +                         /* Command-line "." and ".." are real
> directories. */
> +                         return (p->fts_level =3D=3D FTS_ROOTLEVEL ? FTS=
_D :
> FTS_DOT);
> +diff --git a/lib/fts_.h b/lib/fts_.h
> +index 6c7d0ce..15c248c 100644
> +--- a/lib/fts_.h
> ++++ b/lib/fts_.h
> +@@ -219,11 +219,6 @@ typedef struct _ftsent {
> +
> +         size_t fts_namelen;             /* strlen(fts_name) */
> +
> +-        /* If not (nlink_t) -1, an upper bound on the number of
> +-           remaining subdirectories of interest.  If this becomes
> +-           zero, some work can be avoided.  */
> +-        nlink_t fts_n_dirs_remaining;
> +-
> + # define FTS_D           1              /* preorder directory */
> + # define FTS_DC          2              /* directory that causes cycles
> */
> + # define FTS_DEFAULT     3              /* none of the above */
> +--
> +2.29.2
> +
> diff --git a/meta/recipes-core/coreutils/coreutils_8.32.bb
> b/meta/recipes-core/coreutils/coreutils_8.32.bb
> index f3fe31fd3b..dd271d4968 100644
> --- a/meta/recipes-core/coreutils/coreutils_8.32.bb
> +++ b/meta/recipes-core/coreutils/coreutils_8.32.bb
> @@ -21,6 +21,7 @@ SRC_URI =3D "${GNU_MIRROR}/coreutils/${BP}.tar.xz \
>             file://0001-local.mk-fix-cross-compiling-problem.patch \
>             file://run-ptest \
>
> file://0001-ls-restore-8.31-behavior-on-removed-directories.patch \
> +           file://0001-fts-remove-NOSTAT_LEAF_OPTIMIZATION.patch \
>             "
>
>  SRC_URI[md5sum] =3D "022042695b7d5bcf1a93559a9735e668"
> --
> 2.32.0
>
>

--000000000000f23c8105c5117a75
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Alex,<div><br></div><div>coreutils is using gnulib as a=
 submodule. In the tarball used by the recipe the gnulib source is included=
. The patch comes from</div><div>gnulib=C2=A0<a href=3D"https://github.com/=
coreutils/gnulib/commit/47bf2cf3184027c1eb9c1dfeea5c5b8b2d69710d">https://g=
ithub.com/coreutils/gnulib/commit/47bf2cf3184027c1eb9c1dfeea5c5b8b2d69710d<=
/a></div><div>In the next release of coreutils this fix will be included.</=
div><div><br></div><div>I will make a V2 patch with this information and ad=
d the Upstream-Status, but it&#39;s late now so I will do it on Monday<br><=
br clear=3D"all"><div><div dir=3D"ltr" class=3D"gmail_signature" data-smart=
mail=3D"gmail_signature">Anders Wallin</div></div><br></div></div><br><div =
class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jun 18,=
 2021 at 10:43 PM Anders Wallin &lt;<a href=3D"mailto:wallinux@gmail.com">w=
allinux@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">It caused =E2=80=98find=E2=80=99 and =E2=80=98du=E2=80=99 =
to dump core, and it was useful<br>
only for obsolescent Linux filesystems anyway.=C2=A0 Problem reported in:<b=
r>
<a href=3D"https://lists.gnu.org/r/bug-gnulib/2020-04/msg00068.html" rel=3D=
"noreferrer" target=3D"_blank">https://lists.gnu.org/r/bug-gnulib/2020-04/m=
sg00068.html</a><br>
Quite possibly there is still a serious underlying fts bug with<br>
tight-loop-check and mutating file systems, but if so this patch<br>
should cause the bug to be triggered less often.<br>
* lib/fts.c (enum leaf_optimization): Remove<br>
NOSTAT_LEAF_OPTIMIZATION, as it=E2=80=99s problematic.<br>
(S_MAGIC_REISERFS, S_MAGIC_XFS): Remove; no longer needed.<br>
(leaf_optimization): Remove special cases for ReiserFS and XFS.<br>
(fts_read): Remove NOSTAT_LEAF_OPTIMIZATION code.<br>
* lib/fts_.h (struct _ftsent.fts_n_dirs_remaining):<br>
Remove.=C2=A0 All uses removed.<br>
<br>
Signed-off-by: Anders Wallin &lt;<a href=3D"mailto:anders.wallin@windriver.=
com" target=3D"_blank">anders.wallin@windriver.com</a>&gt;<br>
---<br>
=C2=A0...-fts-remove-NOSTAT_LEAF_OPTIMIZATION.patch | 162 +++++++++++++++++=
+<br>
=C2=A0meta/recipes-core/coreutils/<a href=3D"http://coreutils_8.32.bb" rel=
=3D"noreferrer" target=3D"_blank">coreutils_8.32.bb</a> |=C2=A0 =C2=A01 +<b=
r>
=C2=A02 files changed, 163 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-core/coreutils/coreutils/0001-fts-rem=
ove-NOSTAT_LEAF_OPTIMIZATION.patch<br>
<br>
diff --git a/meta/recipes-core/coreutils/coreutils/0001-fts-remove-NOSTAT_L=
EAF_OPTIMIZATION.patch b/meta/recipes-core/coreutils/coreutils/0001-fts-rem=
ove-NOSTAT_LEAF_OPTIMIZATION.patch<br>
new file mode 100644<br>
index 0000000000..e3f9e3b502<br>
--- /dev/null<br>
+++ b/meta/recipes-core/coreutils/coreutils/0001-fts-remove-NOSTAT_LEAF_OPT=
IMIZATION.patch<br>
@@ -0,0 +1,162 @@<br>
+From 0a0d887e095f97185d25e90b59612b1da8197533 Mon Sep 17 00:00:00 2001<br>
+Message-Id: &lt;<a href=3D"mailto:0a0d887e095f97185d25e90b59612b1da8197533=
.1624008099.git.wallinux@gmail.com" target=3D"_blank">0a0d887e095f97185d25e=
90b59612b1da8197533.1624008099.git.wallinux@gmail.com</a>&gt;<br>
+From: Paul Eggert &lt;<a href=3D"mailto:eggert@cs.ucla.edu" target=3D"_bla=
nk">eggert@cs.ucla.edu</a>&gt;<br>
+Date: Wed, 15 Apr 2020 20:50:32 -0700<br>
+Subject: [PATCH] fts: remove NOSTAT_LEAF_OPTIMIZATION<br>
+MIME-Version: 1.0<br>
+Content-Type: text/plain; charset=3DUTF-8<br>
+Content-Transfer-Encoding: 8bit<br>
+<br>
+It caused =E2=80=98find=E2=80=99 and =E2=80=98du=E2=80=99 to dump core, an=
d it was useful<br>
+only for obsolescent Linux filesystems anyway.=C2=A0 Problem reported in:<=
br>
+<a href=3D"https://lists.gnu.org/r/bug-gnulib/2020-04/msg00068.html" rel=
=3D"noreferrer" target=3D"_blank">https://lists.gnu.org/r/bug-gnulib/2020-0=
4/msg00068.html</a><br>
+Quite possibly there is still a serious underlying fts bug with<br>
+tight-loop-check and mutating file systems, but if so this patch<br>
+should cause the bug to be triggered less often.<br>
+* lib/fts.c (enum leaf_optimization): Remove<br>
+NOSTAT_LEAF_OPTIMIZATION, as it=E2=80=99s problematic.<br>
+(S_MAGIC_REISERFS, S_MAGIC_XFS): Remove; no longer needed.<br>
+(leaf_optimization): Remove special cases for ReiserFS and XFS.<br>
+(fts_read): Remove NOSTAT_LEAF_OPTIMIZATION code.<br>
+* lib/fts_.h (struct _ftsent.fts_n_dirs_remaining):<br>
+Remove.=C2=A0 All uses removed.<br>
+---<br>
+ lib/fts.c=C2=A0 | 56 ++++++++--------------------------------------------=
--<br>
+ lib/fts_.h |=C2=A0 5 -----<br>
+ 2 files changed, 8 insertions(+), 53 deletions(-)<br>
+<br>
+diff --git a/lib/fts.c b/lib/fts.c<br>
+index d3a0472..ade8c33 100644<br>
+--- a/lib/fts.c<br>
++++ b/lib/fts.c<br>
+@@ -445,7 +445,6 @@ fts_open (char * const *argv,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ((parent =
=3D fts_alloc(sp, &quot;&quot;, 0)) =3D=3D NULL)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0goto mem2;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0parent-&gt;f=
ts_level =3D FTS_ROOTPARENTLEVEL;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 parent-&gt;fts_n_=
dirs_remaining =3D -1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* The classic fts implementation would =
call fts_stat with<br>
+@@ -634,9 +633,8 @@ fts_close (FTS *sp)<br>
+ }<br>
+ <br>
+ /* Minimum link count of a traditional Unix directory.=C2=A0 When leaf<br=
>
+-=C2=A0 =C2=A0optimization is OK and MIN_DIR_NLINK &lt;=3D st_nlink, then =
st_nlink is<br>
+-=C2=A0 =C2=A0an upper bound on the number of subdirectories (counting &qu=
ot;.&quot; and<br>
+-=C2=A0 =C2=A0&quot;..&quot;).=C2=A0 */<br>
++=C2=A0 =C2=A0optimization is OK and a directory&#39;s st_nlink =3D=3D MIN=
_DIR_NLINK,<br>
++=C2=A0 =C2=A0then the directory has no subdirectories.=C2=A0 */<br>
+ enum { MIN_DIR_NLINK =3D 2 };<br>
+ <br>
+ /* Whether leaf optimization is OK for a directory.=C2=A0 */<br>
+@@ -645,12 +643,8 @@ enum leaf_optimization<br>
+=C2=A0 =C2=A0 =C2=A0/* st_nlink is not reliable for this directory&#39;s s=
ubdirectories.=C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0NO_LEAF_OPTIMIZATION,<br>
+ <br>
+-=C2=A0 =C2=A0 /* Leaf optimization is OK, but is not useful for avoiding =
stat calls.=C2=A0 */<br>
+-=C2=A0 =C2=A0 OK_LEAF_OPTIMIZATION,<br>
+-<br>
+-=C2=A0 =C2=A0 /* Leaf optimization is not only OK: it is useful for avoid=
ing<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0stat calls, because dirent.d_type does not wor=
k.=C2=A0 */<br>
+-=C2=A0 =C2=A0 NOSTAT_LEAF_OPTIMIZATION<br>
++=C2=A0 =C2=A0 /* st_nlink =3D=3D 2 means the directory lacks subdirectori=
es.=C2=A0 */<br>
++=C2=A0 =C2=A0 OK_LEAF_OPTIMIZATION<br>
+=C2=A0 =C2=A0};<br>
+ <br>
+ #if (defined __linux__ || defined __ANDROID__) \<br>
+@@ -663,9 +657,7 @@ enum leaf_optimization<br>
+ # define S_MAGIC_CIFS 0xFF534D42<br>
+ # define S_MAGIC_NFS 0x6969<br>
+ # define S_MAGIC_PROC 0x9FA0<br>
+-# define S_MAGIC_REISERFS 0x52654973<br>
+ # define S_MAGIC_TMPFS 0x1021994<br>
+-# define S_MAGIC_XFS 0x58465342<br>
+ <br>
+ # ifdef HAVE___FSWORD_T<br>
+ typedef __fsword_t fsword;<br>
+@@ -782,23 +774,15 @@ dirent_inode_sort_may_be_useful (FTSENT const *p, in=
t dir_fd)<br>
+ }<br>
+ <br>
+ /* Given an FTS entry P for a directory with descriptor DIR_FD,<br>
+-=C2=A0 =C2=A0return true if it is both useful and valid to apply leaf opt=
imization.<br>
+-=C2=A0 =C2=A0The optimization is useful only for file systems that lack u=
sable<br>
+-=C2=A0 =C2=A0dirent.d_type info.=C2=A0 The optimization is valid if an st=
_nlink value<br>
+-=C2=A0 =C2=A0of at least MIN_DIR_NLINK is an upper bound on the number of=
<br>
+-=C2=A0 =C2=A0subdirectories of D, counting &quot;.&quot; and &quot;..&quo=
t;=C2=A0 as subdirectories.<br>
++=C2=A0 =C2=A0return whether it is valid to apply leaf optimization.<br>
++=C2=A0 =C2=A0The optimization is valid if a directory&#39;s st_nlink valu=
e equal<br>
++=C2=A0 =C2=A0to MIN_DIR_NLINK means the directory has no subdirectories.<=
br>
+=C2=A0 =C2=A0 DIR_FD is negative if unavailable.=C2=A0 */<br>
+ static enum leaf_optimization<br>
+ leaf_optimization (FTSENT const *p, int dir_fd)<br>
+ {<br>
+=C2=A0 =C2=A0switch (filesystem_type (p, dir_fd))<br>
+=C2=A0 =C2=A0 =C2=A0{<br>
+-=C2=A0 =C2=A0 =C2=A0 /* List here the file system types that may lack usa=
ble dirent.d_type<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0info, yet for which the optimization do=
es apply.=C2=A0 */<br>
+-=C2=A0 =C2=A0 case S_MAGIC_REISERFS:<br>
+-=C2=A0 =C2=A0 case S_MAGIC_XFS: /* XFS lacked it until 2013-08-22 commit.=
=C2=A0 */<br>
+-=C2=A0 =C2=A0 =C2=A0 return NOSTAT_LEAF_OPTIMIZATION;<br>
+-<br>
+=C2=A0 =C2=A0 =C2=A0case 0:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Leaf optimization is unsafe if the file syst=
em type is unknown.=C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0FALLTHROUGH;<br>
+@@ -1023,26 +1007,7 @@ check_for_dir:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (p-&gt;ft=
s_info =3D=3D FTS_NSOK)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0if (p-&gt;fts_statp-&gt;st_size =3D=3D FTS_STAT_REQUIRED)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 FTSENT *parent =3D p-&gt;fts_parent;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if (parent-&gt;fts_n_dirs_remaining =3D=3D 0<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; ISSET(FTS_NOSTAT)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; ISSET(FTS_PHYSICAL)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; (leaf_optimization (parent, sp-&gt;fts_=
cwd_fd)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D=3D NOSTAT_LEAF_OPTIMIZATION))<br=
>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 /* nothing more needed */<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 }<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 else<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 p-&gt;fts_info =3D fts_stat(sp, p, false);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 if (S_ISDIR(p-&gt;fts_statp-&gt;st_mode)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; p-&gt;fts_level !=3D FTS_=
ROOTLEVEL<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; 0 &lt; parent-&gt;fts_n_d=
irs_remaining<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; parent-&gt;fts_n_dirs_rem=
aining !=3D (nlink_t) -1)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 parent-&gt;fts_n_dirs_remaini=
ng--;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 }<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 p-&gt;fts_info =3D fts_stat(sp, p, false);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0fts_assert (p-&gt;fts_statp-&gt;st_size =3D=3D FTS_NO_STAT_REQUIR=
ED);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+@@ -1826,11 +1791,6 @@ err:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 memse=
t(sbp, 0, sizeof(struct stat));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (S_ISDIR(sbp-&gt;st_mode)) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 p-&gt;fts_n_dirs_=
remaining<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D ((sbp-=
&gt;st_nlink &lt; MIN_DIR_NLINK<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 || p-&gt;fts_level &lt;=3D FTS_ROOTLEVEL)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0? -1<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0: sbp-&gt;st_nlink - (ISSET (FTS_SEEDOT) ? 0 : MIN_DIR_NLINK));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ISDOT(p-=
&gt;fts_name)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0/* Command-line &quot;.&quot; and &quot;..&quot; are real =
directories. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0return (p-&gt;fts_level =3D=3D FTS_ROOTLEVEL ? FTS_D : FTS=
_DOT);<br>
+diff --git a/lib/fts_.h b/lib/fts_.h<br>
+index 6c7d0ce..15c248c 100644<br>
+--- a/lib/fts_.h<br>
++++ b/lib/fts_.h<br>
+@@ -219,11 +219,6 @@ typedef struct _ftsent {<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size_t fts_namelen;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0/* strlen(fts_name) */<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* If not (nlink_t) -1, an upper bound on the=
 number of<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0remaining subdirectories of inte=
rest.=C2=A0 If this becomes<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0zero, some work can be avoided.=
=C2=A0 */<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 nlink_t fts_n_dirs_remaining;<br>
+-<br>
+ # define FTS_D=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* preorder directory */<br>
+ # define FTS_DC=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 2=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* directory that causes cycles */<br>
+ # define FTS_DEFAULT=C2=A0 =C2=A0 =C2=A03=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 /* none of the above */<br>
+-- <br>
+2.29.2<br>
+<br>
diff --git a/meta/recipes-core/coreutils/<a href=3D"http://coreutils_8.32.b=
b" rel=3D"noreferrer" target=3D"_blank">coreutils_8.32.bb</a> b/meta/recipe=
s-core/coreutils/<a href=3D"http://coreutils_8.32.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">coreutils_8.32.bb</a><br>
index f3fe31fd3b..dd271d4968 100644<br>
--- a/meta/recipes-core/coreutils/<a href=3D"http://coreutils_8.32.bb" rel=
=3D"noreferrer" target=3D"_blank">coreutils_8.32.bb</a><br>
+++ b/meta/recipes-core/coreutils/<a href=3D"http://coreutils_8.32.bb" rel=
=3D"noreferrer" target=3D"_blank">coreutils_8.32.bb</a><br>
@@ -21,6 +21,7 @@ SRC_URI =3D &quot;${GNU_MIRROR}/coreutils/${BP}.tar.xz \<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-local.mk-fix-cross-co=
mpiling-problem.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://run-ptest \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-ls-restore-8.31-behav=
ior-on-removed-directories.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-fts-remove-NOSTAT_LEA=
F_OPTIMIZATION.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0SRC_URI[md5sum] =3D &quot;022042695b7d5bcf1a93559a9735e668&quot;<br>
-- <br>
2.32.0<br>
<br>
</blockquote></div>

--000000000000f23c8105c5117a75--
