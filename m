Return-Path: <fabien.thomas@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E39BA108E1E8
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 11:05:16 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8563.1773918307093955422
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Mar 2026 04:05:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=izAXgybc;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4852c9b4158so4646445e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 04:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1773918305; x=1774523105; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EHALMsvYziNUkD1uvrZTHfMSLt7cnOeKnbe2nBVtCHU=;
        b=izAXgybcSbPVRvaheaKJxw/CFMEQQSl6SGKmmMBXb48JDkhAKQTbuNKl4pVhauwSF7
         +f2mFdGcPtIG87qVPxoerV1JasbkbbURX22csEEbPVDg9d5lB9mt5C4UEDor8s3RNY7J
         MXJAg4x6aNtmwtsINrorDMEiEoMwIZp6os60M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773918305; x=1774523105;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EHALMsvYziNUkD1uvrZTHfMSLt7cnOeKnbe2nBVtCHU=;
        b=keMBB+NYsts9NImIpj/I44lS8YhZqT1oKlczgmBj8W1Jhd9lc9PomHhTQaTxEZ6P+v
         R89jPsoZ8Qm594diGO/JZEkER5bGrfm4YGNv1rGbah1BhyPm/spO0FJ6byzFq3pOEIa9
         Epgk3RFpqNKYMcq1COlOUP6KVjil808GO81P/tR1egihqYrnRrlqkuRRhTBrTeJY41U/
         dkIa1rhPP2WSBfLnv0M/lah7YGLgs6mg6911sjpQP05ioVUvACMpKAY7YfuM70Y/yzg7
         7uTiYpFSzSeOaDS0sEBs3JIgj0aMAOqNYbuU4upoZb2mA75CtKlPKGQcikZzn6LOCr+n
         0AGg==
X-Forwarded-Encrypted: i=1; AJvYcCVAQFgTh1Bysabj6SWLjZN9391g9QMUVG/ywDuPmoE3CrErdRzK5DOaxMxgR5vkLX4CPR5tP8t5H3Ib1mWwKELpag==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yxjwq1AjCEBQrKsDFTQxlHcUYqypeDIatlyZBbMwbq/gzlihTRz
	8kqabqy3rglsOX10hkVdUX6ypCt/EMe8yHAMw0+1wayDhfr+qDGXZuTtXIxhHyrYarnDOWEvB5g
	ETnXr/G8=
X-Gm-Gg: ATEYQzzsEuLvWBorJSD2Ig2FBn3sCOGPdtIlx4mKGormWViWD5yVadWzNkmPSi2SGv+
	jhhVyATiHIUTp6JTDuv1gKSYrkxP6SgwoFc4CSpbYq4zPuv4MftY0Tav83D6xTqJ3ACNKrXhrcT
	eeB3TO4ZFLKa4dvPMt/IRdE2I/Xeu2J4FCQE05q5cPLyfJKUTAPrUQJ63bGjwfBbfrDMrlnAJJK
	GAyyrJBQlmPJYEvxLrEXhYxB9t8OHiMzP3Hsqg3YCz5XOjc52eiXdLjzuDrytiSXKIDA/GV7XwT
	EGFpZCitcVMfAGGWJjcRMf72mM2roJ2N8adwdqS1ErwZIQQ8L6ggrARQiPOstmjsjZXMR1dTOXW
	/iltFMxb0OiRxwUosxelWJXs4zHs5YzrwefOyzdusuSMpbqPvVfTcA+Oea/c5Y4D9TZ5G4mgLKG
	vw4TggCAkbUJsjP6wEEV++7fno3vYB2P5hPhA0Zk2ymoIdSyYGouxOAhHfwsyFdwOxEqOXeg5Vb
	SnYg89WzPNVTguAE8owCStq51Lw1Ax5RSZAcJ3I8Y1spcXiLCdUtOnsyeTftL9JYSXsirVOyg==
X-Received: by 2002:a05:600c:1d0c:b0:485:363b:fafd with SMTP id 5b1f17b1804b1-486f442e4f0mr113876655e9.6.1773918304956;
        Thu, 19 Mar 2026 04:05:04 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f5e162e2sm36280805e9.34.2026.03.19.04.05.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 04:05:04 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Mar 2026 12:05:03 +0100
Message-Id: <DH6PK2HKFZEL.OW09CNJ5IJ15@smile.fr>
Subject: Re: [OE-core] [kirkstone][PATCH] busybox: fix for CVE-2026-26157,
 CVE-2026-26158
From: "Fabien Thomas" <fabien.thomas@smile.fr>
To: <hprajapati@mvista.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0
References: <20260313131845.56221-1-hprajapati@mvista.com>
In-Reply-To: <20260313131845.56221-1-hprajapati@mvista.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 11:05:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233512

On Fri Mar 13, 2026 at 2:18 PM CET, Hitendra Prajapati via lists.openembedd=
ed.org wrote:
> Although the patch was not merged yet, Debian already took it ([1] & [2])=
.
> Since busybox CVE handling is slow, follow Debian decision.
>
> [1] https://sources.debian.org/src/busybox/1:1.37.0-10.1/debian/patches/0=
001-tar-strip-unsafe-hardlink-components-GNU-tar-does-th.patch
> [2] https://sources.debian.org/src/busybox/1:1.37.0-10.1/debian/patches/0=
002-tar-only-strip-unsafe-components-from-hardlinks-not-.patch
>
> Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> ---
>  .../CVE-2026-26157-CVE-2026-26158-01.patch    |  35 ++++
>  .../CVE-2026-26157-CVE-2026-26158-02.patch    | 197 ++++++++++++++++++
>  meta/recipes-core/busybox/busybox_1.35.0.bb   |   2 +
>  3 files changed, 234 insertions(+)
>  create mode 100644 meta/recipes-core/busybox/busybox/CVE-2026-26157-CVE-=
2026-26158-01.patch
>  create mode 100644 meta/recipes-core/busybox/busybox/CVE-2026-26157-CVE-=
2026-26158-02.patch
>
> diff --git a/meta/recipes-core/busybox/busybox/CVE-2026-26157-CVE-2026-26=
158-01.patch b/meta/recipes-core/busybox/busybox/CVE-2026-26157-CVE-2026-26=
158-01.patch
> new file mode 100644
> index 0000000000..306ccad511
> --- /dev/null
> +++ b/meta/recipes-core/busybox/busybox/CVE-2026-26157-CVE-2026-26158-01.=
patch
> @@ -0,0 +1,35 @@
> +From 038e0e4d791ea4e8a8da5e06904756142fc6b8dc Mon Sep 17 00:00:00 2001
> +From: Radoslav Kolev <radoslav.kolev@suse.com>
> +Date: Mon, 16 Feb 2026 11:50:04 +0200
> +Subject: tar: only strip unsafe components from hardlinks, not symlinks
> +
> +commit 3fb6b31c7 introduced a check for unsafe components in
> +tar archive hardlinks, but it was being applied to symlinks too
> +which broke "Symlinks and hardlinks coexist" tar test.
> +
> +Signed-off-by: Radoslav Kolev <radoslav.kolev@suse.com>
> +Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
> +
> +CVE: CVE-2026-26157, CVE-2026-26158=20
> +Upstream-Status: Backport [https://github.com/mirror/busybox/commit/3fb6=
b31c716669e12f75a2accd31bb7685b1a1cb]
> +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> +---
> + archival/libarchive/get_header_tar.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/archival/libarchive/get_header_tar.c b/archival/libarchive/=
get_header_tar.c
> +index dc0f7e0..a8c2ad8 100644
> +--- a/archival/libarchive/get_header_tar.c
> ++++ b/archival/libarchive/get_header_tar.c
> +@@ -453,7 +453,7 @@ char FAST_FUNC get_header_tar(archive_handle_t *arch=
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
> diff --git a/meta/recipes-core/busybox/busybox/CVE-2026-26157-CVE-2026-26=
158-02.patch b/meta/recipes-core/busybox/busybox/CVE-2026-26157-CVE-2026-26=
158-02.patch
> new file mode 100644
> index 0000000000..69e6e98c75
> --- /dev/null
> +++ b/meta/recipes-core/busybox/busybox/CVE-2026-26157-CVE-2026-26158-02.=
patch
> @@ -0,0 +1,197 @@
> +From 0c20d6b353b058ab910dd3a0211e2b906802b105 Mon Sep 17 00:00:00 2001
> +From: Denys Vlasenko <vda.linux@googlemail.com>
> +Date: Thu, 29 Jan 2026 11:48:02 +0100
> +Subject: tar: strip unsafe hardlink components - GNU tar does the same
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
> +CVE: CVE-2026-26157, CVE-2026-26158=20
> +Upstream-Status: Backport [https://github.com/mirror/busybox/commit/3fb6=
b31c716669e12f75a2accd31bb7685b1a1cb]
> +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> +---
> + .../archival/libarchive/data_extract_all.c    |  7 ++---
> + .../archival/libarchive/get_header_tar.c      | 11 +++++--
> + .../archival/libarchive/unsafe_prefix.c       | 30 +++++++++++++++----
> + .../libarchive/unsafe_symlink_target.c        |  1 +
> + archival/tar.c                 |  2 +-
> + archival/unzip.c               |  2 +-
> + include/bb_archive.h           |  3 +-
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
> +index d26868b..dc0f7e0 100644
> +--- a/archival/libarchive/get_header_tar.c
> ++++ b/archival/libarchive/get_header_tar.c
> +@@ -452,8 +452,15 @@ char FAST_FUNC get_header_tar(archive_handle_t *arc=
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
> +index fc92ac6..7b29d77 100644
> +--- a/archival/unzip.c
> ++++ b/archival/unzip.c
> +@@ -842,7 +842,7 @@ int unzip_main(int argc, char **argv)
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
> diff --git a/meta/recipes-core/busybox/busybox_1.35.0.bb b/meta/recipes-c=
ore/busybox/busybox_1.35.0.bb
> index 0b5ac220f5..bb07502ccc 100644
> --- a/meta/recipes-core/busybox/busybox_1.35.0.bb
> +++ b/meta/recipes-core/busybox/busybox_1.35.0.bb
> @@ -62,6 +62,8 @@ SRC_URI =3D "https://busybox.net/downloads/busybox-${PV=
}.tar.bz2;name=3Dtarball \
>             file://CVE-2025-46394-01.patch \
>             file://CVE-2025-46394-02.patch \
>             file://CVE-2025-60876.patch \
> +           file://CVE-2026-26157-CVE-2026-26158-01.patch \
> +           file://CVE-2026-26157-CVE-2026-26158-02.patch \
>             "
>  SRC_URI:append:libc-musl =3D " file://musl.cfg "
> =20

Hi Hitendra,

I'm working with Yoann, helping him to support the maintenance of=20
the stable branches.

Thanks for the patch. Indeed, since the Busybox CVE handling is indeed slow=
,=20
following Debian is acceptable. However, there are a few issues that need t=
o=20
be addressed before this can be merged:

In the patch metadata (Upstream-Status / Backport):
- Source URL: Please use the official upstream repository (git.busybox.net,=
=20
which I'm aware is littlebit downish) instead of the GitHub mirror.
- Commit Reference: The Debian patches you cited do not actually backport=
=20
the commit 3fb6b31c716669e12f75a2accd31bb7685b1a1cb as claimed in the statu=
s.=20
Seems that the first one is actually a backport of=20
599f5dd8fac390c18b79cba4c14c334957605dae, recently merged in busybox master=
.

Please clarify the "Upstream-Status" to reflect exactly=20
what these patches represent.

The first patch (01.patch) fails to apply on the current Kirkstone=20
busybox_1.35.0 recipe:

ERROR: busybox-1.35.0-r0 do_patch:=20
Applying patch 'CVE-2026-26157-CVE-2026-26158-01.patch'
patching file archival/libarchive/get_header_tar.c
Hunk #1 FAILED at 453.
1 out of 1 hunk FAILED -- rejects in file archival/libarchive/get_header_ta=
r.c

Please ensure the patches are rebased and tested against=20
the kirkstone branch of openembedded-core.

Best regards,

--=20
Fabien Thomas
Smile ECS


