Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 592D8C4345F
	for <webhook@archiver.kernel.org>; Thu, 25 Apr 2024 19:59:17 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.web10.26631.1714075155407019435
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Apr 2024 12:59:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=x6O/ywJ4;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.172, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6114c9b4d83so12370187b3.3
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Apr 2024 12:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1714075154; x=1714679954; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qLjsdsINnkY7bXkGSDVhre8Lo3pZSR9ur8ZytQdKfj4=;
        b=x6O/ywJ4BcYzSPw6VloXI0rcSDbdfCHufpyyCH5XJx6FLWcaiCYw6K2jLvP6+6l7CY
         Il99L7OzKtN9Nik1AB++wJdT38pX0FqBHwzWIMK18Wij+KuGVi5tgGw2GQKsGJVCNCB2
         4DvLBqrF0KI54oKN6wxmGrYyHloxJeP0x21xlgGyum2MD+QwGAVORjfBwxv00/M5jTIW
         UqLXn2IVUYYQ3O3F8Gm+8YN8wYhPf0A0DRy5x9SiQX3tKcBq1C+60Oj2vtvvNWX0CgeQ
         lYAf4JcPNR1Q7wSYG2oSzfrbl0k2+4b8mMCXXVOt2Rmmwqx3KAo3mpIZTOB6LBE3Y1yv
         Hrjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714075154; x=1714679954;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qLjsdsINnkY7bXkGSDVhre8Lo3pZSR9ur8ZytQdKfj4=;
        b=IrkPtiDsAX9/dRG0QCMfaMEYMZdmg9uiVp6HVv+vMtqA5yZ9FtXbAlK15o0iq7vvy5
         jnlZFvTswtXxRSp2f2j7z98jGsp64BQy5pMzp7K7/aoh7qUUNdmGU2cXP/C+5u+6mZyp
         AlSj7gtLQ8q2cG4VjPndW+Rn9kuSeyepUR16RWpUNg2QipiB9Rwg9fV993Sxp6a0ZZoc
         TmD3Vtdik44WPvr/as6UbgZXFRC7U0UpjQf3yMlBz0Ii3TPJGVtNeDaNr1XG3sJ7TePH
         Cimn3DGUFMGJSp00PUh77bPkwLiIEiaqVUgGdE6ldGhYxjsAc0JVOOao6qyxGOZnxjZ4
         dJag==
X-Gm-Message-State: AOJu0YzOm8FEMZtV7nO0PWLG2lqvZEm5AzGfpCceSYFdF4kO37/gDtGt
	W0qDqiMvHKQ+dXUGhePm3RkyoMRpuCc5dTHeDShI7PAxY5vTNB2IRgG1uNLht8q3LDUCB/sBf3E
	Lx0iAJKlS4xg0tShBYc51wcWHtOAQaFi9bTIuEQ==
X-Google-Smtp-Source: AGHT+IGdqf7yqsviK7OraKfnRJSDzxZ2PU5Stk6TEjTjCWzHu1FD6jNYLnfic0JJ3vrlX0+vaRxCoP3Wp7iNPytQ4tQ=
X-Received: by 2002:a05:690c:680e:b0:615:35e1:e512 with SMTP id
 id14-20020a05690c680e00b0061535e1e512mr713784ywb.0.1714075154361; Thu, 25 Apr
 2024 12:59:14 -0700 (PDT)
MIME-Version: 1.0
References: <20240423162844.1563233-1-vkumbhar@mvista.com>
In-Reply-To: <20240423162844.1563233-1-vkumbhar@mvista.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 25 Apr 2024 12:59:03 -0700
Message-ID: <CAOSpxdZYEQCU6ufL=ngA1kZ26XEE1kUsX8duaPMpekffTNJrhQ@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH] rpm: Backport fix CVE-2021-35939
To: vkumbhar@mvista.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Apr 2024 19:59:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198708

This patch caused multiple build failures both locally and on the autobuild=
er.

Here is a link to the autobuilder run:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6845

Sample error log:

https://errors.yoctoproject.org/Errors/Details/763370/

Steve

On Tue, Apr 23, 2024 at 9:30=E2=80=AFAM Vivek Kumbhar via
lists.openembedded.org <vkumbhar=3Dmvista.com@lists.openembedded.org>
wrote:
>
> Upstream-Status: Backport https://github.com/rpm-software-management/rpm/=
commit/96ec957e281220f8e137a2d5eb23b83a6377d556
>                           https://github.com/rpm-software-management/rpm/=
commit/fb13f7fd9eff012cb7b9dbf94ac5381c69404055
>
> Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
> ---
>  .../rpm/files/CVE-2021-35939.patch            | 378 ++++++++++++++++++
>  meta/recipes-devtools/rpm/rpm_4.17.1.bb       |   1 +
>  2 files changed, 379 insertions(+)
>  create mode 100644 meta/recipes-devtools/rpm/files/CVE-2021-35939.patch
>
> diff --git a/meta/recipes-devtools/rpm/files/CVE-2021-35939.patch b/meta/=
recipes-devtools/rpm/files/CVE-2021-35939.patch
> new file mode 100644
> index 0000000000..b60cc0e5ce
> --- /dev/null
> +++ b/meta/recipes-devtools/rpm/files/CVE-2021-35939.patch
> @@ -0,0 +1,378 @@
> +From 96ec957e281220f8e137a2d5eb23b83a6377d556 Mon Sep 17 00:00:00 2001
> +From: Panu Matilainen <pmatilai@redhat.com>
> +Date: Thu, 10 Feb 2022 14:32:43 +0200
> +Subject: [PATCH] Validate intermediate symlinks during installation,
> + CVE-2021-35939
> +
> +Whenever directory changes during unpacking, walk the entire tree from
> +starting from / and validate any symlinks crossed, fail the install
> +on invalid links.
> +
> +This is the first of step of many towards securing our file operations
> +against local tamperers and besides plugging that one CVE, paves the way
> +for the next step by adding the necessary directory fd tracking.
> +This also bumps the rpm OS requirements to a whole new level by requirin=
g
> +the *at() family of calls from POSIX-1.2008.
> +
> +This necessarily does a whole lot of huffing and puffing we previously
> +did not do. It should be possible to cache secure (ie root-owned)
> +directory structures to avoid validating everything a million times
> +but for now, just keeping things simple.
> +
> +Upstream-Status: Backport [https://github.com/rpm-software-management/rp=
m/commit/96ec957e281220f8e137a2d5eb23b83a6377d556]
> +CVE: CVE-2021-35939
> +Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
> +---
> + INSTALL              |   2 +
> + configure.ac         |   3 +-
> + lib/fsm.c            | 144 +++++++++++++++++++++++++++++++++++++++++--
> + lib/rpmfi.c          |  27 +++++++-
> + lib/rpmfi_internal.h |  17 +++++
> + 5 files changed, 183 insertions(+), 10 deletions(-)
> +
> +diff --git a/INSTALL b/INSTALL
> +index 358e5ae0d..9a9c7b0d0 100644
> +--- a/INSTALL
> ++++ b/INSTALL
> +@@ -103,6 +103,8 @@ option to configure).  For GCC, OpenMP 4.5 is fully =
supported since GCC 6.1,
> + which is available from
> +     http://www.gnu.org/
> +
> ++Rpm requires a POSIX.1-2008 level operating system.
> ++
> + To compile RPM:
> + --------------
> +
> +diff --git a/configure.ac b/configure.ac
> +index 78c555f90..4ddacdfe2 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -570,7 +570,8 @@ AC_CHECK_FUNCS([secure_getenv __secure_getenv])
> +
> + AC_CHECK_FUNCS(
> +    [mkstemp getcwd basename dirname realpath setenv unsetenv regcomp lc=
hown \
> +-    utimes getline localtime_r statvfs getaddrinfo ],
> ++    utimes getline localtime_r statvfs getaddrinfo \
> ++    openat mkdirat fstatat ],
> +    [], [AC_MSG_ERROR([function required by rpm])])
> +
> + AC_LIBOBJ(fnmatch)
> +diff --git a/lib/fsm.c b/lib/fsm.c
> +index 935a0a5c6..0b29284e8 100644
> +--- a/lib/fsm.c
> ++++ b/lib/fsm.c
> +@@ -8,6 +8,7 @@
> + #include <inttypes.h>
> + #include <utime.h>
> + #include <errno.h>
> ++#include <fcntl.h>
> + #if WITH_CAP
> + #include <sys/capability.h>
> + #endif
> +@@ -20,6 +21,7 @@
> + #include "rpmio/rpmio_internal.h"     /* fdInit/FiniDigest */
> + #include "lib/fsm.h"
> + #include "lib/rpmte_internal.h"       /* XXX rpmfs */
> ++#include "lib/rpmfi_internal.h" /* rpmfiSetOnChdir */
> + #include "lib/rpmplugins.h"   /* rpm plugins hooks */
> + #include "lib/rpmug.h"
> +
> +@@ -406,17 +408,118 @@ static int fsmRmdir(const char *path)
> +     return rc;
> + }
> +
> +-static int fsmMkdir(const char *path, mode_t mode)
> ++static int fsmMkdir(int dirfd, const char *path, mode_t mode)
> + {
> +-    int rc =3D mkdir(path, (mode & 07777));
> ++    int rc =3D mkdirat(dirfd, path, (mode & 07777));
> +     if (_fsm_debug)
> +-      rpmlog(RPMLOG_DEBUG, " %8s (%s, 0%04o) %s\n", __func__,
> +-             path, (unsigned)(mode & 07777),
> ++      rpmlog(RPMLOG_DEBUG, " %8s (%d %s, 0%04o) %s\n", __func__,
> ++             dirfd, path, (unsigned)(mode & 07777),
> +              (rc < 0 ? strerror(errno) : ""));
> +     if (rc < 0)       rc =3D RPMERR_MKDIR_FAILED;
> +     return rc;
> + }
> +
> ++static int fsmOpenat(int dirfd, const char *path, int flags)
> ++{
> ++    struct stat lsb, sb;
> ++    int sflags =3D flags | O_NOFOLLOW;
> ++    int fd =3D openat(dirfd, path, sflags);
> ++
> ++    /*
> ++     * Only ever follow symlinks by root or target owner. Since we can'=
t
> ++     * open the symlink itself, the order matters: we stat the link *af=
ter*
> ++     * opening the target, and if the link ownership changed between th=
e calls
> ++     * it could've only been the link owner or root.
> ++     */
> ++    if (fd < 0 && errno =3D=3D ELOOP && flags !=3D sflags) {
> ++      int ffd =3D openat(dirfd, path, flags);
> ++      if (ffd >=3D 0 && fstatat(dirfd, path, &lsb, AT_SYMLINK_NOFOLLOW)=
 =3D=3D 0) {
> ++          if (fstat(ffd, &sb) =3D=3D 0) {
> ++              if (lsb.st_uid =3D=3D 0 || lsb.st_uid =3D=3D sb.st_uid) {
> ++                  fd =3D ffd;
> ++              } else {
> ++                  close(ffd);
> ++              }
> ++          }
> ++      }
> ++    }
> ++    return fd;
> ++}
> ++
> ++static int fsmDoMkDir(rpmPlugins plugins, int dirfd, const char *dn,
> ++                      int owned, mode_t mode)
> ++{
> ++    int rc;
> ++    rpmFsmOp op =3D (FA_CREATE);
> ++    if (!owned)
> ++      op |=3D FAF_UNOWNED;
> ++
> ++    /* Run fsm file pre hook for all plugins */
> ++    rc =3D rpmpluginsCallFsmFilePre(plugins, NULL, dn, mode, op);
> ++
> ++    if (!rc)
> ++      rc =3D fsmMkdir(dirfd, dn, mode);
> ++
> ++    if (!rc) {
> ++      rc =3D rpmpluginsCallFsmFilePrepare(plugins, NULL, dn, dn, mode, =
op);
> ++    }
> ++
> ++    /* Run fsm file post hook for all plugins */
> ++    rpmpluginsCallFsmFilePost(plugins, NULL, dn, mode, op, rc);
> ++
> ++    if (!rc) {
> ++      rpmlog(RPMLOG_DEBUG,
> ++              "%s directory created with perms %04o\n",
> ++              dn, (unsigned)(mode & 07777));
> ++    }
> ++
> ++    return rc;
> ++}
> ++
> ++static int ensureDir(rpmPlugins plugins, const char *p, int owned, int =
create)
> ++{
> ++    char *path =3D xstrdup(p);
> ++    char *dp =3D path;
> ++    char *sp =3D NULL, *bn;
> ++    int oflags =3D O_RDONLY;
> ++
> ++    int dirfd =3D fsmOpenat(-1, "/", oflags);
> ++    int fd =3D dirfd; /* special case of "/" */
> ++
> ++    while ((bn =3D strtok_r(dp, "/", &sp)) !=3D NULL) {
> ++      struct stat sb;
> ++      fd =3D fsmOpenat(dirfd, bn, oflags);
> ++
> ++      if (fd < 0 && errno =3D=3D ENOENT && create) {
> ++          mode_t mode =3D S_IFDIR | (_dirPerms & 07777);
> ++          if (fsmDoMkDir(plugins, dirfd, bn, owned, mode) =3D=3D 0) {
> ++              fd =3D fsmOpenat(dirfd, bn, oflags|O_NOFOLLOW);
> ++          }
> ++      }
> ++
> ++      if (fd >=3D 0 && fstat(fd, &sb) =3D=3D 0 && !S_ISDIR(sb.st_mode))=
 {
> ++          close(fd);
> ++          errno =3D ENOTDIR;
> ++          fd =3D -1;
> ++      }
> ++
> ++      close(dirfd);
> ++      if (fd >=3D 0) {
> ++          dirfd =3D fd;
> ++      } else {
> ++          dirfd =3D -1;
> ++          rpmlog(RPMLOG_ERR, _("failed to open dir %s of %s: %s\n"),
> ++                              bn, p, strerror(errno));
> ++          break;
> ++      }
> ++
> ++      dp =3D NULL;
> ++    }
> ++
> ++    free(path);
> ++    return dirfd;
> ++}
> ++
> + static int fsmMkfifo(const char *path, mode_t mode)
> + {
> +     int rc =3D mkfifo(path, (mode & 07777));
> +@@ -507,7 +610,7 @@ static int fsmMkdirs(rpmfiles files, rpmfs fs, rpmPl=
ugins plugins)
> +               rc =3D rpmpluginsCallFsmFilePre(plugins, NULL, dn, mode, =
op);
> +
> +               if (!rc)
> +-                  rc =3D fsmMkdir(dn, mode);
> ++                  rc =3D fsmMkdir(-1, dn, mode);
> +
> +               if (!rc) {
> +                   rc =3D rpmpluginsCallFsmFilePrepare(plugins, NULL, dn=
, dn,
> +@@ -874,6 +977,21 @@ static void setFileState(rpmfs fs, int i)
> +     }
> + }
> +
> ++struct diriter_s {
> ++    int dirfd;
> ++};
> ++
> ++static int onChdir(rpmfi fi, void *data)
> ++{
> ++    struct diriter_s *di =3D data;
> ++
> ++    if (di->dirfd >=3D 0) {
> ++      close(di->dirfd);
> ++      di->dirfd =3D -1;
> ++    }
> ++    return 0;
> ++}
> ++
> + int rpmPackageFilesInstall(rpmts ts, rpmte te, rpmfiles files,
> +               rpmpsm psm, char ** failedFile)
> + {
> +@@ -890,6 +1008,7 @@ int rpmPackageFilesInstall(rpmts ts, rpmte te, rpmf=
iles files,
> +     char *tid =3D NULL;
> +     struct filedata_s *fdata =3D xcalloc(fc, sizeof(*fdata));
> +     struct filedata_s *firstlink =3D NULL;
> ++    struct diriter_s di =3D { -1 };
> +
> +     /* transaction id used for temporary path suffix while installing *=
/
> +     rasprintf(&tid, ";%08x", (unsigned)rpmtsGetTid(ts));
> +@@ -929,6 +1048,7 @@ int rpmPackageFilesInstall(rpmts ts, rpmte te, rpmf=
iles files,
> +         rc =3D RPMERR_BAD_MAGIC;
> +         goto exit;
> +     }
> ++    rpmfiSetOnChdir(fi, onChdir, &di);
> +
> +     /* Detect and create directories not explicitly in package. */
> +     if (!rc)
> +@@ -943,6 +1063,16 @@ int rpmPackageFilesInstall(rpmts ts, rpmte te, rpm=
files files,
> +           if (!fp->suffix) {
> +               rc =3D fsmBackup(fi, fp->action);
> +           }
> ++
> ++          if (di.dirfd =3D=3D -1) {
> ++              di.dirfd =3D ensureDir(plugins, rpmfiDN(fi), 0,
> ++                                  (fp->action =3D=3D FA_CREATE));
> ++              if (di.dirfd =3D=3D -1) {
> ++                  rc =3D RPMERR_OPEN_FAILED;
> ++                  break;
> ++              }
> ++          }
> ++
> +           /* Assume file does't exist when tmp suffix is in use */
> +           if (!fp->suffix) {
> +               if (fp->action =3D=3D FA_TOUCH) {
> +@@ -977,7 +1107,7 @@ int rpmPackageFilesInstall(rpmts ts, rpmte te, rpmf=
iles files,
> +                     mode_t mode =3D fp->sb.st_mode;
> +                     mode &=3D ~07777;
> +                     mode |=3D  00700;
> +-                    rc =3D fsmMkdir(fp->fpath, mode);
> ++                    rc =3D fsmMkdir(di.dirfd, fp->fpath, mode);
> +                 }
> +             } else if (S_ISLNK(fp->sb.st_mode)) {
> +               if (rc =3D=3D RPMERR_ENOENT) {
> +@@ -1019,6 +1149,8 @@ int rpmPackageFilesInstall(rpmts ts, rpmte te, rpm=
files files,
> +       fp->stage =3D FILE_UNPACK;
> +     }
> +     fi =3D rpmfiFree(fi);
> ++    close(di.dirfd);
> ++    di.dirfd =3D -1;
> +
> +     if (!rc && fx < 0 && fx !=3D RPMERR_ITER_END)
> +       rc =3D fx;
> +diff --git a/lib/rpmfi.c b/lib/rpmfi.c
> +index 33b657aa2..740e257fe 100644
> +--- a/lib/rpmfi.c
> ++++ b/lib/rpmfi.c
> +@@ -55,6 +55,9 @@ struct rpmfi_s {
> +     int intervalStart;                /*!< Start of iterating interval.=
 */
> +     int intervalEnd;          /*!< End of iterating interval. */
> +
> ++    rpmfiChdirCb onChdir;     /*!< Callback for directory changes */
> ++    void *onChdirData;                /*!< Caller private callback data=
 */
> ++
> +     rpmfiles files;           /*!< File info set */
> +     rpmcpio_t archive;                /*!< Archive with payload */
> +     unsigned char * found;    /*!< Bit field of files found in the arch=
ive */
> +@@ -309,6 +312,17 @@ int rpmfiDI(rpmfi fi)
> + }
> + #endif
> +
> ++int rpmfiSetOnChdir(rpmfi fi, rpmfiChdirCb cb, void *data)
> ++{
> ++    int rc =3D -1;
> ++    if (fi !=3D NULL) {
> ++      fi->onChdir =3D cb;
> ++      fi->onChdirData =3D data;
> ++      rc =3D 0;
> ++    }
> ++    return rc;
> ++}
> ++
> + int rpmfiFX(rpmfi fi)
> + {
> +     return (fi !=3D NULL ? fi->i : -1);
> +@@ -319,9 +333,17 @@ int rpmfiSetFX(rpmfi fi, int fx)
> +     int i =3D -1;
> +
> +     if (fi !=3D NULL && fx >=3D 0 && fx < rpmfilesFC(fi->files)) {
> +-      i =3D fi->i;
> ++      int dx =3D fi->j;
> ++      i =3D fi->i;
> +       fi->i =3D fx;
> +       fi->j =3D rpmfilesDI(fi->files, fi->i);
> ++      i =3D fi->i;
> ++
> ++      if (fi->j !=3D dx && fi->onChdir) {
> ++          int chrc =3D fi->onChdir(fi, fi->onChdirData);
> ++          if (chrc < 0)
> ++              i =3D chrc;
> ++      }
> +     }
> +     return i;
> + }
> +@@ -1816,10 +1838,9 @@ static rpmfi initIter(rpmfiles files, int itype, =
int link)
> +
> +     if (files && itype>=3D0 && itype<=3DRPMFILEITERMAX) {
> +       fi =3D xcalloc(1, sizeof(*fi));
> +-      fi->i =3D -1;
> ++      fi->j =3D -1;
> +       fi->files =3D link ? rpmfilesLink(files) : files;
> +       fi->next =3D nextfuncs[itype];
> +-      fi->i =3D -1;
> +       if (itype =3D=3D RPMFI_ITER_BACK) {
> +           fi->i =3D rpmfilesFC(fi->files);
> +       } else if (itype >=3DRPMFI_ITER_READ_ARCHIVE
> +diff --git a/lib/rpmfi_internal.h b/lib/rpmfi_internal.h
> +index dccc6ccbe..37f1d45f5 100644
> +--- a/lib/rpmfi_internal.h
> ++++ b/lib/rpmfi_internal.h
> +@@ -13,6 +13,23 @@
> + extern "C" {
> + #endif
> +
> ++/** \ingroup rpmfi
> ++ * Callback on file iterator directory changes
> ++ * @param fi          file info
> ++ * @param data                caller private callback data
> ++ * @return            0 on success, < 0 on error (to stop iteration)
> ++ */
> ++typedef int (*rpmfiChdirCb)(rpmfi fi, void *data);
> ++
> ++/** \ingroup rpmfi
> ++ * Set a callback for directory changes during iteration.
> ++ * @param fi          file info
> ++ * @param cb          callback function
> ++ * @param data                caller private callback data
> ++ * @return            string pool handle (weak reference)
> ++ */
> ++int rpmfiSetOnChdir(rpmfi fi, rpmfiChdirCb cb, void *data);
> ++
> + /** \ingroup rpmfi
> +  * Return file info set string pool handle
> +  * @param fi          file info
> +--
> +2.39.3
> +
> diff --git a/meta/recipes-devtools/rpm/rpm_4.17.1.bb b/meta/recipes-devto=
ols/rpm/rpm_4.17.1.bb
> index 9b6446f265..aad8f2468f 100644
> --- a/meta/recipes-devtools/rpm/rpm_4.17.1.bb
> +++ b/meta/recipes-devtools/rpm/rpm_4.17.1.bb
> @@ -40,6 +40,7 @@ SRC_URI =3D "git://github.com/rpm-software-management/r=
pm;branch=3Drpm-4.17.x;protoc
>             file://0001-docs-do-not-build-manpages-requires-pandoc.patch =
\
>             file://0001-build-pack.c-do-not-insert-payloadflags-into-.rpm=
-me.patch \
>             file://0001-configure.ac-add-linux-gnux32-variant-to-triplet-=
han.patch \
> +           file://CVE-2021-35939.patch \
>             "
>
>  PE =3D "1"
> --
> 2.39.3
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#198630): https://lists.openembedded.org/g/openembedde=
d-core/message/198630
> Mute This Topic: https://lists.openembedded.org/mt/105692772/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

