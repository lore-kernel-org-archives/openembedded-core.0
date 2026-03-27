Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA33110F2875
	for <webhook@archiver.kernel.org>; Fri, 27 Mar 2026 23:03:01 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1180.1774652573013207934
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Mar 2026 16:02:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=xbvxtJmz;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48538c5956bso25568825e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2026 16:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1774652571; x=1775257371; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p/GslL40w5+RVpf2dXGwIDliU9WXZt23L66DYbrNSvA=;
        b=xbvxtJmzup+l70PSseNwM8oaLJ4a2wlfw41tGxcKRSr8suQmwp43YXl0+7sPQqcOk6
         SSM+88UOOFn6gCDWYJDLcrRB44NHH76LdQGZC3i+gve5mcmsGyhnhz+6ufjCHofamm47
         DDaD2O/1TKi+pvzDEhFSANH0QLE9zkNT09N7k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774652571; x=1775257371;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p/GslL40w5+RVpf2dXGwIDliU9WXZt23L66DYbrNSvA=;
        b=KSlIB+n9YGq81aV9rUfBYVnTqSZ0ifIclWoJ/iYkz0eX/qjuUVxB5go8GWsQbDjpfK
         RPTeVCU2vTkBnMEwe4bxNc+HGmoFmsriNOfZ1SQfP0jD7ZkwZt3jC4tGeWCtdvca+d3o
         Y9iVAK/ObwfD7bdvgRnJO8UamN0qfmqOptbaHB9LbIsjhb1De0wc1V1wIYuNCN6AZQCX
         0eatO6YDXiNNUFKxWQoHLq44zLZI2lXus1xEXrVx6PQiQtpdUm0cVn3QZ5Gy1zVr6uz7
         TKy19I9JyxTVwHdtdVj1GD1yBdk/t8QHIQb/9swDLbnezhTPUqqmtLMAcpiNlDxX0NFV
         EYoA==
X-Forwarded-Encrypted: i=1; AJvYcCWCA0pUA/6x7TkrUQTE3u2AI8QWmdXW0FRe25GYasahoUn83TIjLWAzuylvHFKr2h/IvvHzm9RzBHebsuSAKyr7AQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YytXNX27lij0GSYJMqyihbHp7K+J6W8jjVpa5KF9D/1V9F8+0Oj
	mIJxP6nQRdPcEWMEcXYHHBEiqhEcJQUnd1durjGjxdNEVEgie/E4lwvuIXvsp0hTOR3GH3PhA7B
	MGlaopGw=
X-Gm-Gg: ATEYQzwWhQEn0LyrZnQ2D29rbjMl8GRjJRhCUQjqpGfk6C4h3gDAdazclQO6d0HGPkj
	/S6SFZqJ4TbpYRhPtI/dH03VxuOEomyQoi56E+jFu8geH/UAjFaY8eZaW5cc4qr8LNUFe40EWjC
	RKhRQ8EBtTLi3wv1XlfUIZjglwNuQXz03fZbdODR3mngbBxqVzElf6XGVM30N+4FgqQQo/+BkZP
	0sTD3xfP7ZGo+ugqmHQAfPo0uN63ZCk1/ZIkJVsxvCqEjEBzi3fQcLzijw7sYta5pu0B8/V9fh/
	VTxA8C52+uWgnX7nmDxeR3gQnbCCAQhZC+49HpnoyhxNSBg3PUHLhxKRzCFWnnkGUuymxNjMn6j
	OQvgJ0PmKEolbd/njPmE0l5J4I8KqvdYMagUKCIVEa6C/2W+SfW3xxT4uxlPMWz5y81cYKQIQk8
	InxMuHqgi/19pdlRrYNonhZ3H0vI+hlndtxssqenGVJ0pj0fTu00NDT33f86s7iFcpbv1N39PYK
	bguYYX2+ni2nUo=
X-Received: by 2002:a05:600c:c089:b0:485:3e00:944a with SMTP id 5b1f17b1804b1-48729109d76mr50036995e9.9.1774652571149;
        Fri, 27 Mar 2026 16:02:51 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48727161bb2sm22368015e9.23.2026.03.27.16.02.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 16:02:50 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 28 Mar 2026 00:02:50 +0100
Message-Id: <DHDXTZVTX375.10CYDEYY8UJK9@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCHv2] busybox: fix for CVE-2026-26157,
 CVE-2026-26158
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <hprajapati@mvista.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260323053041.7848-1-hprajapati@mvista.com>
In-Reply-To: <20260323053041.7848-1-hprajapati@mvista.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2026 23:03:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234107

On Mon Mar 23, 2026 at 6:30 AM CET, Hitendra Prajapati via lists.openembedd=
ed.org wrote:
> Pick up patch from NVD report.
>
> More details :
> [1]: https://nvd.nist.gov/vuln/detail/CVE-2026-26157
> [2]: https://nvd.nist.gov/vuln/detail/CVE-2026-26158
>
> Note:
> We use patch from busybox mirror that looks trustworthy https://gogs.libr=
ecmc.org/OWEALS/busybox.
>
> Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> ---

Hello,

Thank you for this new patch, it looks good now.
But, as far as I can tell, this CVE also applies to whinlatter and
master. You need to send the fix there before I can take it for
scarthgap and kirkstone.

Regards,

>  .../CVE-2026-26157-CVE-2026-26158-01.patch    | 198 ++++++++++++++++++
>  .../CVE-2026-26157-CVE-2026-26158-02.patch    |  37 ++++
>  meta/recipes-core/busybox/busybox_1.36.1.bb   |   2 +
>  3 files changed, 237 insertions(+)
>  create mode 100644 meta/recipes-core/busybox/busybox/CVE-2026-26157-CVE-=
2026-26158-01.patch
>  create mode 100644 meta/recipes-core/busybox/busybox/CVE-2026-26157-CVE-=
2026-26158-02.patch
>
> diff --git a/meta/recipes-core/busybox/busybox/CVE-2026-26157-CVE-2026-26=
158-01.patch b/meta/recipes-core/busybox/busybox/CVE-2026-26157-CVE-2026-26=
158-01.patch
> new file mode 100644
> index 0000000000..cdc2394794
> --- /dev/null
> +++ b/meta/recipes-core/busybox/busybox/CVE-2026-26157-CVE-2026-26158-01.=
patch
> @@ -0,0 +1,198 @@
> +From 3fb6b31c716669e12f75a2accd31bb7685b1a1cb Mon Sep 17 00:00:00 2001
> +From: Denys Vlasenko <vda.linux@googlemail.com>
> +Date: Thu, 29 Jan 2026 11:48:02 +0100
> +Subject: [PATCH] tar: strip unsafe hardlink components - GNU tar does th=
e same
> +
> +Defends against files like these (python reproducer):
> +
> +import tarfile
> +ti =3D tarfile.TarInfo("leak_hosts")
> +ti.type =3D tarfile.LNKTYPE
> +ti.linkname =3D "/etc/hosts"  # or "../etc/hosts" or ".."
> +ti.size =3D 0
> +with tarfile.open("/tmp/hardlink.tar", "w") as t:
> +	t.addfile(ti)
> +
> +function                                             old     new   delta
> +skip_unsafe_prefix                                     -     127    +127
> +get_header_tar                                      1752    1754      +2
> +.rodata                                           106861  106856      -5
> +unzip_main                                          2715    2706      -9
> +strip_unsafe_prefix                                  102      18     -84
> +------------------------------------------------------------------------=
------
> +(add/remove: 1/0 grow/shrink: 1/3 up/down: 129/-98)            Total: 31=
 bytes
> +
> +Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
> +
> +CVE: CVE-2026-26157, CVE-2026-26158
> +Upstream-Status: Backport [https://git.busybox.net/busybox/commit/?id=3D=
3fb6b31c716669e12f75a2accd31bb7685b1a1cb]
> +(Alternative mirrored URL: https://gogs.librecmc.org/OWEALS/busybox/comm=
it/3fb6b31c716669e12f75a2accd31bb7685b1a1cb)
> +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> +---
> + archival/libarchive/data_extract_all.c      |  7 +++--
> + archival/libarchive/get_header_tar.c        | 11 ++++++--
> + archival/libarchive/unsafe_prefix.c         | 30 +++++++++++++++++----
> + archival/libarchive/unsafe_symlink_target.c |  1 +
> + archival/tar.c                              |  2 +-
> + archival/unzip.c                            |  2 +-
> + include/bb_archive.h                        |  3 ++-
> + 7 files changed, 42 insertions(+), 14 deletions(-)
> +
> +diff --git a/archival/libarchive/data_extract_all.c b/archival/libarchiv=
e/data_extract_all.c
> +index 8a69711..b84b960 100644
> +--- a/archival/libarchive/data_extract_all.c
> ++++ b/archival/libarchive/data_extract_all.c
> +@@ -66,8 +66,8 @@ void FAST_FUNC data_extract_all(archive_handle_t *arch=
ive_handle)
> + 	}
> + #endif
> + #if ENABLE_FEATURE_PATH_TRAVERSAL_PROTECTION
> +-	/* Strip leading "/" and up to last "/../" path component */
> +-	dst_name =3D (char *)strip_unsafe_prefix(dst_name);
> ++	/* Skip leading "/" and past last ".." path component */
> ++	dst_name =3D (char *)skip_unsafe_prefix(dst_name);
> + #endif
> + // ^^^ This may be a problem if some applets do need to extract absolut=
e names.
> + // (Probably will need to invent ARCHIVE_ALLOW_UNSAFE_NAME flag).
> +@@ -185,8 +185,7 @@ void FAST_FUNC data_extract_all(archive_handle_t *ar=
chive_handle)
> +=20
> + 		/* To avoid a directory traversal attack via symlinks,
> + 		 * do not restore symlinks with ".." components
> +-		 * or symlinks starting with "/", unless a magic
> +-		 * envvar is set.
> ++		 * or symlinks starting with "/"
> + 		 *
> + 		 * For example, consider a .tar created via:
> + 		 *  $ tar cvf bug.tar anything.txt
> +diff --git a/archival/libarchive/get_header_tar.c b/archival/libarchive/=
get_header_tar.c
> +index cc6f3f0..1c40ece 100644
> +--- a/archival/libarchive/get_header_tar.c
> ++++ b/archival/libarchive/get_header_tar.c
> +@@ -454,8 +454,15 @@ char FAST_FUNC get_header_tar(archive_handle_t *arc=
hive_handle)
> + #endif
> +=20
> + 	/* Everything up to and including last ".." component is stripped */
> +-	overlapping_strcpy(file_header->name, strip_unsafe_prefix(file_header-=
>name));
> +-//TODO: do the same for file_header->link_target?
> ++	strip_unsafe_prefix(file_header->name);
> ++	if (file_header->link_target) {
> ++		/* GNU tar 1.34 examples:
> ++		 * tar: Removing leading '/' from hard link targets
> ++		 * tar: Removing leading '../' from hard link targets
> ++		 * tar: Removing leading 'etc/../' from hard link targets
> ++		 */
> ++		strip_unsafe_prefix(file_header->link_target);
> ++	}
> +=20
> + 	/* Strip trailing '/' in directories */
> + 	/* Must be done after mode is set as '/' is used to check if it's a di=
rectory */
> +diff --git a/archival/libarchive/unsafe_prefix.c b/archival/libarchive/u=
nsafe_prefix.c
> +index 6670811..89a371a 100644
> +--- a/archival/libarchive/unsafe_prefix.c
> ++++ b/archival/libarchive/unsafe_prefix.c
> +@@ -5,11 +5,11 @@
> + #include "libbb.h"
> + #include "bb_archive.h"
> +=20
> +-const char* FAST_FUNC strip_unsafe_prefix(const char *str)
> ++const char* FAST_FUNC skip_unsafe_prefix(const char *str)
> + {
> + 	const char *cp =3D str;
> + 	while (1) {
> +-		char *cp2;
> ++		const char *cp2;
> + 		if (*cp =3D=3D '/') {
> + 			cp++;
> + 			continue;
> +@@ -22,10 +22,25 @@ const char* FAST_FUNC strip_unsafe_prefix(const char=
 *str)
> + 			cp +=3D 3;
> + 			continue;
> + 		}
> +-		cp2 =3D strstr(cp, "/../");
> ++		cp2 =3D cp;
> ++ find_dotdot:
> ++		cp2 =3D strstr(cp2, "/..");
> + 		if (!cp2)
> +-			break;
> +-		cp =3D cp2 + 4;
> ++			break; /* No (more) malicious components */
> ++
> ++		/* We found "/..something" */
> ++		cp2 +=3D 3;
> ++		if (*cp2 !=3D '/') {
> ++			if (*cp2 =3D=3D '\0') {
> ++				/* Trailing "/..": malicious, return "" */
> ++				/* (causes harmless errors trying to create or hardlink a file name=
d "") */
> ++				return cp2;
> ++			}
> ++			/* "/..name" is not malicious, look for next "/.." */
> ++			goto find_dotdot;
> ++		}
> ++		/* Found "/../": malicious, advance past it */
> ++		cp =3D cp2 + 1;
> + 	}
> + 	if (cp !=3D str) {
> + 		static smallint warned =3D 0;
> +@@ -37,3 +52,8 @@ const char* FAST_FUNC strip_unsafe_prefix(const char *=
str)
> + 	}
> + 	return cp;
> + }
> ++
> ++void FAST_FUNC strip_unsafe_prefix(char *str)
> ++{
> ++	overlapping_strcpy(str, skip_unsafe_prefix(str));
> ++}
> +diff --git a/archival/libarchive/unsafe_symlink_target.c b/archival/liba=
rchive/unsafe_symlink_target.c
> +index f8dc803..d764c89 100644
> +--- a/archival/libarchive/unsafe_symlink_target.c
> ++++ b/archival/libarchive/unsafe_symlink_target.c
> +@@ -36,6 +36,7 @@ void FAST_FUNC create_links_from_list(llist_t *list)
> + 				*list->data ? "hard" : "sym",
> + 				list->data + 1, target
> + 			);
> ++			/* Note: GNU tar 1.34 errors out only _after_ all links are (attempt=
ed to be) created */
> + 		}
> + 		list =3D list->link;
> + 	}
> +diff --git a/archival/tar.c b/archival/tar.c
> +index 9de3759..cf8c2d1 100644
> +--- a/archival/tar.c
> ++++ b/archival/tar.c
> +@@ -475,7 +475,7 @@ static int FAST_FUNC writeFileToTarball(struct recur=
sive_state *state,
> + 	DBG("writeFileToTarball('%s')", fileName);
> +=20
> + 	/* Strip leading '/' and such (must be before memorizing hardlink's na=
me) */
> +-	header_name =3D strip_unsafe_prefix(fileName);
> ++	header_name =3D skip_unsafe_prefix(fileName);
> +=20
> + 	if (header_name[0] =3D=3D '\0')
> + 		return TRUE;
> +diff --git a/archival/unzip.c b/archival/unzip.c
> +index 691a2d8..5844215 100644
> +--- a/archival/unzip.c
> ++++ b/archival/unzip.c
> +@@ -853,7 +853,7 @@ int unzip_main(int argc, char **argv)
> + 		unzip_skip(zip.fmt.extra_len);
> +=20
> + 		/* Guard against "/abspath", "/../" and similar attacks */
> +-		overlapping_strcpy(dst_fn, strip_unsafe_prefix(dst_fn));
> ++		strip_unsafe_prefix(dst_fn);
> +=20
> + 		/* Filter zip entries */
> + 		if (find_list_entry(zreject, dst_fn)
> +diff --git a/include/bb_archive.h b/include/bb_archive.h
> +index e0ef8fc..1dc77f3 100644
> +--- a/include/bb_archive.h
> ++++ b/include/bb_archive.h
> +@@ -202,7 +202,8 @@ char get_header_tar_xz(archive_handle_t *archive_han=
dle) FAST_FUNC;
> + void seek_by_jump(int fd, off_t amount) FAST_FUNC;
> + void seek_by_read(int fd, off_t amount) FAST_FUNC;
> +=20
> +-const char *strip_unsafe_prefix(const char *str) FAST_FUNC;
> ++const char *skip_unsafe_prefix(const char *str) FAST_FUNC;
> ++void strip_unsafe_prefix(char *str) FAST_FUNC;
> + void create_or_remember_link(llist_t **link_placeholders,
> + 		const char *target,
> + 		const char *linkname,
> +--=20
> +2.50.1
> +
> diff --git a/meta/recipes-core/busybox/busybox/CVE-2026-26157-CVE-2026-26=
158-02.patch b/meta/recipes-core/busybox/busybox/CVE-2026-26157-CVE-2026-26=
158-02.patch
> new file mode 100644
> index 0000000000..00a276fa4f
> --- /dev/null
> +++ b/meta/recipes-core/busybox/busybox/CVE-2026-26157-CVE-2026-26158-02.=
patch
> @@ -0,0 +1,37 @@
> +From 599f5dd8fac390c18b79cba4c14c334957605dae Mon Sep 17 00:00:00 2001
> +From: Radoslav Kolev <radoslav.kolev@suse.com>
> +Date: Mon, 16 Feb 2026 11:50:04 +0200
> +Subject: [PATCH] tar: only strip unsafe components from hardlinks, not
> + symlinks
> +
> +commit 3fb6b31c7 introduced a check for unsafe components in
> +tar archive hardlinks, but it was being applied to symlinks too
> +which broke "Symlinks and hardlinks coexist" tar test.
> +
> +Signed-off-by: Radoslav Kolev <radoslav.kolev@suse.com>
> +Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
> +
> +CVE: CVE-2026-26157, CVE-2026-26158
> +Upstream-Status: Backport [https://git.busybox.net/busybox/commit/?id=3D=
599f5dd8fac390c18b79cba4c14c334957605dae]
> +(Alternative mirrored URL: https://gogs.librecmc.org/OWEALS/busybox/comm=
it/599f5dd8fac390c18b79cba4c14c334957605dae)
> +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> +---
> + archival/libarchive/get_header_tar.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/archival/libarchive/get_header_tar.c b/archival/libarchive/=
get_header_tar.c
> +index 1c40ece..606d806 100644
> +--- a/archival/libarchive/get_header_tar.c
> ++++ b/archival/libarchive/get_header_tar.c
> +@@ -455,7 +455,7 @@ char FAST_FUNC get_header_tar(archive_handle_t *arch=
ive_handle)
> +=20
> + 	/* Everything up to and including last ".." component is stripped */
> + 	strip_unsafe_prefix(file_header->name);
> +-	if (file_header->link_target) {
> ++	if (file_header->link_target && !S_ISLNK(file_header->mode)) {
> + 		/* GNU tar 1.34 examples:
> + 		 * tar: Removing leading '/' from hard link targets
> + 		 * tar: Removing leading '../' from hard link targets
> +--=20
> +2.50.1
> +
> diff --git a/meta/recipes-core/busybox/busybox_1.36.1.bb b/meta/recipes-c=
ore/busybox/busybox_1.36.1.bb
> index d870e2ee10..228bfdadd3 100644
> --- a/meta/recipes-core/busybox/busybox_1.36.1.bb
> +++ b/meta/recipes-core/busybox/busybox_1.36.1.bb
> @@ -62,6 +62,8 @@ SRC_URI =3D "https://busybox.net/downloads/busybox-${PV=
}.tar.bz2;name=3Dtarball \
>             file://CVE-2025-46394-01.patch \
>             file://CVE-2025-46394-02.patch \
>             file://CVE-2025-60876.patch \
> +           file://CVE-2026-26157-CVE-2026-26158-01.patch \
> +           file://CVE-2026-26157-CVE-2026-26158-02.patch \
>             "
>  SRC_URI:append:libc-musl =3D " file://musl.cfg "
>  # TODO http://lists.busybox.net/pipermail/busybox/2023-January/090078.ht=
ml


--=20
Yoann Congal
Smile ECS


