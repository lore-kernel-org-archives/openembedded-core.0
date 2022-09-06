Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E8D3C38145
	for <webhook@archiver.kernel.org>; Tue,  6 Sep 2022 23:18:21 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web12.1404.1662506295359196309
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Sep 2022 16:18:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=eVx0H0j7;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.47,
 mailfrom: steve@sakoman.com)
Received: by mail-ej1-f47.google.com with SMTP id lz22so5762145ejb.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Sep 2022 16:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=j/WHvtrbgOfMr5Hh8JAOW/37rgomYfAMRADPiMGHFFU=;
        b=eVx0H0j7YPZNnwVomH0wZBI1B/XodMuTH9ylX2K7r5BOjw3sadE+RQ8qB/KBR5HDIV
         i954/Xan+7PgzCWf4QELdefJfXY27gTKq7xo6DJKnpBSDSJ2RkVOpACq9pq1i7I8n9tU
         Y+hyrV+Byh7aFBfr7z3MukWj/WnrG/XdxsZsnM1BP+My0Ha53izpN28d+Mv3xqeOfTTW
         F5/Ee0vsjwvfPksiSKWyI7zPJIaxYXIQK/sJYkfT2hfaQ/11xMaWBJQpmdyAZh8IL98X
         D1DBfX36U3GxaxoGNOzXUBHshY8Pg+ODXSo5+G5mAgbfIsAuNduaM4ulCvS44KUzkdfg
         EZHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=j/WHvtrbgOfMr5Hh8JAOW/37rgomYfAMRADPiMGHFFU=;
        b=EagJT+20Wo+0iTEtIptdbBJfqv2NIvxDM/0zRs3MSx1FQFKryJWX13JueFpAHH42Tx
         k5YyBtOqQ505MhiO8KiSpJ9oJ2E4ShuHOcMtuR+ok5Kk2mbZC8eWpxBw/L21zgPi8xD3
         R/UhfPKK8frxOjFu2C/bRV/zxiP0ky+Lo2W7FnOcpI8hqHMpbfZp2HxwAcxL4oOs74Nq
         +GQgJtiOg2UqLmeEWSGZuhueCA62bFitzkLhGbnTyFl7+7C+AkLsrDwOpEgdq5cNjH7p
         hS0eisZrRbluZJJdUj8uvf6CO3VQzs1qpg/UtLqmTM8Dv55u1kx2Q0ASHmfBlkzYaD4K
         57Hg==
X-Gm-Message-State: ACgBeo1CqzbY06Csefw+ZhPJQgvphHWgBAt+otGxRIGtKbzr5+w7cc1k
	0o1Qoi4qcjzRkkK/YURzlNdFcrdr37kz1mvjpo0vVA==
X-Google-Smtp-Source: 
 AA6agR4e8kutR73DvNMDUfvKdVvUNVa9CmaI3oADbOrgV8eVeLAk83VFT2wvVrKA8Tpx6RV7I+97akwC6YvEiNuKOqI=
X-Received: by 2002:a17:906:58cc:b0:74f:f27a:e8a6 with SMTP id
 e12-20020a17090658cc00b0074ff27ae8a6mr559259ejs.18.1662506293558; Tue, 06 Sep
 2022 16:18:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220905130608.9341-1-ranjitsinh.rathod@kpit.com>
In-Reply-To: <20220905130608.9341-1-ranjitsinh.rathod@kpit.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 6 Sep 2022 13:18:02 -1000
Message-ID: 
 <CAOSpxda695me_a+bY92tT33SzV0oZTHvDJofJxnqO2PFqPYnGw@mail.gmail.com>
Subject: Re: [OE-Core][dunfell][PATCH 1/2] libarchive: Fix CVE-2021-23177
 issue
To: ranjitsinh.rathod@kpit.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Sep 2022 23:18:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170367

On Mon, Sep 5, 2022 at 3:06 AM Ranjitsinh Rathod via
lists.openembedded.org
<ranjitsinh.rathod=3Dkpit.com@lists.openembedded.org> wrote:
>
> Add patch to fix CVE-2021-23177 issue for libarchive
> Link: http://deb.debian.org/debian/pool/main/liba/libarchive/libarchive_3=
.4.3-2+deb11u1.debian.tar.xz

Fails to build with this patch:

NOTE: Applying patch 'CVE-2021-23177.patch'
(../meta/recipes-extended/libarchive/libarchive/CVE-2021-23177.patch)
ERROR: Applying patch 'CVE-2021-23177.patch' on target directory
'TOPDIR/tmp/work/x86_64-linux/libarchive-native/3.4.2-r0/libarchive-3.4.2'
Command Error: 'quilt --quiltrc
TOPDIR/tmp/work/x86_64-linux/libarchive-native/3.4.2-r0/recipe-sysroot-nati=
ve/etc/quiltrc
push' exited with 0  Output:
Applying patch CVE-2021-23177.patch
patching file libarchive/archive_disk_acl_freebsd.c
Hunk #1 succeeded at 319 with fuzz 1.
Hunk #2 FAILED at 364.
Hunk #3 FAILED at 542.
Hunk #4 FAILED at 677.
Hunk #5 FAILED at 693.
4 out of 5 hunks FAILED -- rejects in file libarchive/archive_disk_acl_free=
bsd.c
patching file libarchive/archive_disk_acl_linux.c
Hunk #1 FAILED at 343.
Hunk #2 succeeded at 455 with fuzz 1.
Hunk #3 FAILED at 488.
Hunk #4 FAILED at 727.
3 out of 4 hunks FAILED -- rejects in file libarchive/archive_disk_acl_linu=
x.c
patching file libarchive/archive_disk_acl_sunos.c
Hunk #1 succeeded at 443 with fuzz 1.
Hunk #2 FAILED at 467.
Hunk #3 FAILED at 492.
Hunk #4 FAILED at 801.
Hunk #5 FAILED at 810.
4 out of 5 hunks FAILED -- rejects in file libarchive/archive_disk_acl_suno=
s.c
Patch CVE-2021-23177.patch does not apply (enforce with -f)
DEBUG: Python function patch_do_patch finished
DEBUG: Python function do_patch finished

I'm going to drop both patches in the series and await a v2.

Steve

> Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
> ---
>  .../libarchive/CVE-2021-23177.patch           | 183 ++++++++++++++++++
>  .../libarchive/libarchive_3.4.2.bb            |   1 +
>  2 files changed, 184 insertions(+)
>  create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2021-=
23177.patch
>
> diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2021-23177.p=
atch b/meta/recipes-extended/libarchive/libarchive/CVE-2021-23177.patch
> new file mode 100644
> index 0000000000..555c7a47f7
> --- /dev/null
> +++ b/meta/recipes-extended/libarchive/libarchive/CVE-2021-23177.patch
> @@ -0,0 +1,183 @@
> +Description: Fix handling of symbolic link ACLs
> + Published as CVE-2021-23177
> +Origin: upstream, https://github.com/libarchive/libarchive/commit/fba4f1=
23cc456d2b2538f811bb831483bf336bad
> +Bug-Debian: https://bugs.debian.org/1001986
> +Author: Martin Matuska <martin@matuska.org>
> +Last-Updated: 2021-12-20
> +
> +CVE: CVE-2021-23177
> +Upstream-Status: Backport [http://deb.debian.org/debian/pool/main/liba/l=
ibarchive/libarchive_3.4.3-2+deb11u1.debian.tar.xz]
> +Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
> +
> +--- a/libarchive/archive_disk_acl_freebsd.c
> ++++ b/libarchive/archive_disk_acl_freebsd.c
> +@@ -319,7 +319,7 @@
> +
> + static int
> + set_acl(struct archive *a, int fd, const char *name,
> +-    struct archive_acl *abstract_acl,
> ++    struct archive_acl *abstract_acl, __LA_MODE_T mode,
> +     int ae_requested_type, const char *tname)
> + {
> +       int              acl_type =3D 0;
> +@@ -364,6 +364,13 @@
> +               return (ARCHIVE_FAILED);
> +       }
> +
> ++      if (acl_type =3D=3D ACL_TYPE_DEFAULT && !S_ISDIR(mode)) {
> ++              errno =3D EINVAL;
> ++              archive_set_error(a, errno,
> ++                  "Cannot set default ACL on non-directory");
> ++              return (ARCHIVE_WARN);
> ++      }
> ++
> +       acl =3D acl_init(entries);
> +       if (acl =3D=3D (acl_t)NULL) {
> +               archive_set_error(a, errno,
> +@@ -542,7 +549,10 @@
> +       else if (acl_set_link_np(name, acl_type, acl) !=3D 0)
> + #else
> +       /* FreeBSD older than 8.0 */
> +-      else if (acl_set_file(name, acl_type, acl) !=3D 0)
> ++      else if (S_ISLNK(mode)) {
> ++          /* acl_set_file() follows symbolic links, skip */
> ++          ret =3D ARCHIVE_OK;
> ++      } else if (acl_set_file(name, acl_type, acl) !=3D 0)
> + #endif
> +       {
> +               if (errno =3D=3D EOPNOTSUPP) {
> +@@ -677,14 +687,14 @@
> +           & ARCHIVE_ENTRY_ACL_TYPE_POSIX1E) !=3D 0) {
> +               if ((archive_acl_types(abstract_acl)
> +                   & ARCHIVE_ENTRY_ACL_TYPE_ACCESS) !=3D 0) {
> +-                      ret =3D set_acl(a, fd, name, abstract_acl,
> ++                      ret =3D set_acl(a, fd, name, abstract_acl, mode,
> +                           ARCHIVE_ENTRY_ACL_TYPE_ACCESS, "access");
> +                       if (ret !=3D ARCHIVE_OK)
> +                               return (ret);
> +               }
> +               if ((archive_acl_types(abstract_acl)
> +                   & ARCHIVE_ENTRY_ACL_TYPE_DEFAULT) !=3D 0)
> +-                      ret =3D set_acl(a, fd, name, abstract_acl,
> ++                      ret =3D set_acl(a, fd, name, abstract_acl, mode,
> +                           ARCHIVE_ENTRY_ACL_TYPE_DEFAULT, "default");
> +
> +               /* Simultaneous POSIX.1e and NFSv4 is not supported */
> +@@ -693,7 +703,7 @@
> + #if ARCHIVE_ACL_FREEBSD_NFS4
> +       else if ((archive_acl_types(abstract_acl) &
> +           ARCHIVE_ENTRY_ACL_TYPE_NFS4) !=3D 0) {
> +-              ret =3D set_acl(a, fd, name, abstract_acl,
> ++              ret =3D set_acl(a, fd, name, abstract_acl, mode,
> +                   ARCHIVE_ENTRY_ACL_TYPE_NFS4, "nfs4");
> +       }
> + #endif
> +--- a/libarchive/archive_disk_acl_linux.c
> ++++ b/libarchive/archive_disk_acl_linux.c
> +@@ -343,6 +343,11 @@
> +               return (ARCHIVE_FAILED);
> +       }
> +
> ++      if (S_ISLNK(mode)) {
> ++              /* Linux does not support RichACLs on symbolic links */
> ++              return (ARCHIVE_OK);
> ++      }
> ++
> +       richacl =3D richacl_alloc(entries);
> +       if (richacl =3D=3D NULL) {
> +               archive_set_error(a, errno,
> +@@ -455,7 +460,7 @@
> + #if ARCHIVE_ACL_LIBACL
> + static int
> + set_acl(struct archive *a, int fd, const char *name,
> +-    struct archive_acl *abstract_acl,
> ++    struct archive_acl *abstract_acl, __LA_MODE_T mode,
> +     int ae_requested_type, const char *tname)
> + {
> +       int              acl_type =3D 0;
> +@@ -488,6 +493,18 @@
> +               return (ARCHIVE_FAILED);
> +       }
> +
> ++      if (S_ISLNK(mode)) {
> ++              /* Linux does not support ACLs on symbolic links */
> ++              return (ARCHIVE_OK);
> ++      }
> ++
> ++      if (acl_type =3D=3D ACL_TYPE_DEFAULT && !S_ISDIR(mode)) {
> ++              errno =3D EINVAL;
> ++              archive_set_error(a, errno,
> ++                  "Cannot set default ACL on non-directory");
> ++              return (ARCHIVE_WARN);
> ++      }
> ++
> +       acl =3D acl_init(entries);
> +       if (acl =3D=3D (acl_t)NULL) {
> +               archive_set_error(a, errno,
> +@@ -727,14 +744,14 @@
> +           & ARCHIVE_ENTRY_ACL_TYPE_POSIX1E) !=3D 0) {
> +               if ((archive_acl_types(abstract_acl)
> +                   & ARCHIVE_ENTRY_ACL_TYPE_ACCESS) !=3D 0) {
> +-                      ret =3D set_acl(a, fd, name, abstract_acl,
> ++                      ret =3D set_acl(a, fd, name, abstract_acl, mode,
> +                           ARCHIVE_ENTRY_ACL_TYPE_ACCESS, "access");
> +                       if (ret !=3D ARCHIVE_OK)
> +                               return (ret);
> +               }
> +               if ((archive_acl_types(abstract_acl)
> +                   & ARCHIVE_ENTRY_ACL_TYPE_DEFAULT) !=3D 0)
> +-                      ret =3D set_acl(a, fd, name, abstract_acl,
> ++                      ret =3D set_acl(a, fd, name, abstract_acl, mode,
> +                           ARCHIVE_ENTRY_ACL_TYPE_DEFAULT, "default");
> +       }
> + #endif        /* ARCHIVE_ACL_LIBACL */
> +--- a/libarchive/archive_disk_acl_sunos.c
> ++++ b/libarchive/archive_disk_acl_sunos.c
> +@@ -443,7 +443,7 @@
> +
> + static int
> + set_acl(struct archive *a, int fd, const char *name,
> +-    struct archive_acl *abstract_acl,
> ++    struct archive_acl *abstract_acl, __LA_MODE_T mode,
> +     int ae_requested_type, const char *tname)
> + {
> +       aclent_t         *aclent;
> +@@ -467,7 +467,6 @@
> +       if (entries =3D=3D 0)
> +               return (ARCHIVE_OK);
> +
> +-
> +       switch (ae_requested_type) {
> +       case ARCHIVE_ENTRY_ACL_TYPE_POSIX1E:
> +               cmd =3D SETACL;
> +@@ -492,6 +491,12 @@
> +               return (ARCHIVE_FAILED);
> +       }
> +
> ++        if (S_ISLNK(mode)) {
> ++                /* Skip ACLs on symbolic links */
> ++              ret =3D ARCHIVE_OK;
> ++              goto exit_free;
> ++        }
> ++
> +       e =3D 0;
> +
> +       while (archive_acl_next(a, abstract_acl, ae_requested_type, &ae_t=
ype,
> +@@ -801,7 +806,7 @@
> +       if ((archive_acl_types(abstract_acl)
> +           & ARCHIVE_ENTRY_ACL_TYPE_POSIX1E) !=3D 0) {
> +               /* Solaris writes POSIX.1e access and default ACLs togeth=
er */
> +-              ret =3D set_acl(a, fd, name, abstract_acl,
> ++              ret =3D set_acl(a, fd, name, abstract_acl, mode,
> +                   ARCHIVE_ENTRY_ACL_TYPE_POSIX1E, "posix1e");
> +
> +               /* Simultaneous POSIX.1e and NFSv4 is not supported */
> +@@ -810,7 +815,7 @@
> + #if ARCHIVE_ACL_SUNOS_NFS4
> +       else if ((archive_acl_types(abstract_acl) &
> +           ARCHIVE_ENTRY_ACL_TYPE_NFS4) !=3D 0) {
> +-              ret =3D set_acl(a, fd, name, abstract_acl,
> ++              ret =3D set_acl(a, fd, name, abstract_acl, mode,
> +                   ARCHIVE_ENTRY_ACL_TYPE_NFS4, "nfs4");
> +       }
> + #endif
> diff --git a/meta/recipes-extended/libarchive/libarchive_3.4.2.bb b/meta/=
recipes-extended/libarchive/libarchive_3.4.2.bb
> index b7426a1be8..d8ed80686b 100644
> --- a/meta/recipes-extended/libarchive/libarchive_3.4.2.bb
> +++ b/meta/recipes-extended/libarchive/libarchive_3.4.2.bb
> @@ -36,6 +36,7 @@ SRC_URI =3D "http://libarchive.org/downloads/libarchive=
-${PV}.tar.gz \
>             file://CVE-2021-36976-1.patch \
>             file://CVE-2021-36976-2.patch \
>             file://CVE-2021-36976-3.patch \
> +           file://CVE-2021-23177.patch \
>  "
>
>  SRC_URI[md5sum] =3D "d953ed6b47694dadf0e6042f8f9ff451"
> --
> 2.17.1
>
> This message contains information that may be privileged or confidential =
and is the property of the KPIT Technologies Ltd. It is intended only for t=
he person to whom it is addressed. If you are not the intended recipient, y=
ou are not authorized to read, print, retain copy, disseminate, distribute,=
 or use this message or any part thereof. If you receive this message in er=
ror, please notify the sender immediately and delete all copies of this mes=
sage. KPIT Technologies Ltd. does not accept any liability for virus infect=
ed mails.
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#170314): https://lists.openembedded.org/g/openembedde=
d-core/message/170314
> Mute This Topic: https://lists.openembedded.org/mt/93477934/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

