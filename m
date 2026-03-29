Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBDE1FC9816
	for <webhook@archiver.kernel.org>; Sun, 29 Mar 2026 22:43:29 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38686.1774824203988956960
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Mar 2026 15:43:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ZL4BwK+7;
 spf=pass (domain: smile.fr, ip: 209.85.221.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43ba1f3fa7eso1968232f8f.2
        for <openembedded-core@lists.openembedded.org>; Sun, 29 Mar 2026 15:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1774824202; x=1775429002; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HCi9VW/Et3R70+i9oE1L6X1M6OhV6WJxMp8ZU8OSBmo=;
        b=ZL4BwK+7tk4g78cuCfu4Aht1zQ0X2stXf4bfVFhoxJAYokDQlH/QlYfzN8KJ2v2fR9
         vIY9HG1v4axW4AS+22vskiNqdkM82UFhcZw5k9cNbXRKYmH9OapHZ3S2ARO7/kyiYpjv
         +hfYy2n2stANgrD2SY81Q0Tj/NaITyxVOtXR0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774824202; x=1775429002;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HCi9VW/Et3R70+i9oE1L6X1M6OhV6WJxMp8ZU8OSBmo=;
        b=GiA9Nwn8Wkt0NSKT2MdMAKgVAjC8oJtSYLv8fEcap7NjDOPwpEU7jSL//re/J+fVFY
         egBaxfhJjpM0o/3oLVOhEqy5AyN0obVGTFRY8HeNLNn+LkAegD8r6HX3mUJ8RsMwRSzG
         Q1LrqyJVFVARwzR98gD66mguJ1U4qxhsNwQ1HvLb6qbm4MPz3tj4nOd6JlP75J5ja5hl
         TY3YgFjq+SaTljxxWVh7onfRfpsk2rhZXpak12TUCkRLm7CGJq+JjIE8IezoFcfnqxpO
         IDzkdiRTwyDf0Atgq7TgAhpx1nCnHDkoLJyep110gUPYZVBcTvaig9GDrOuecwFgcNeU
         egLg==
X-Forwarded-Encrypted: i=1; AJvYcCXvimhr2F1vlL7PCt54H1NB+dN3QFQIVxjw/29KPokII0p7gc9yUnJrB82mo3vjacZGoWAxcFw9f7/YDDUarWWibQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyvHWPeKxgW6Ds/mE7sfc8FEORnbhmS/Xf/0jNF+nKmi2pmPtMo
	TPga7MPWpXSp8kwni3RTPHg9NMbb25dEKktsdg+4BiqGIoftE5X1jXJBsWRSGiw9m7j14revHWK
	vRYojxA4=
X-Gm-Gg: ATEYQzzTFXzU9Z6uo3zalWxpR0CA+Y17L/RYtDEfajsEO+jwzqtGCpy4TjEIZR2RTL4
	JI50BEFoGh4tZLFnXzTBxGdKh8dq7kBpMKJLptq/yLX8Pj1O2l7hynqt3LfkwvnpeY51F/CE8z0
	ektsNpJ4/zgzIfo1zX+BUf1Nc2/OdKwESdUIAXLjozQlfUFvKXXN/ELCQ8TB433Jeor0hKN5UYK
	ogiDuBVzaV/T6EaNryI0W6C52iLzLZPgZkbWvRLy+8q6tax65INw4Ijsj6mChnTXPHPffg4O95c
	ACbTy63zhRsh0MwlbkBLlWXbNysp8RFUjvjZYaDnJg0lORzZDXQAvIqZLOxLrHFF7kkVZAwy4fy
	8Tbj+yvnKNzp7h5maD00bB2RX2ykqjd8cfeWM1pUysLo4HBBWDTYhkLlXUEFuKuaBp23q4SaDji
	bj6jzwau7H5ORTh4Ez5t7phCCPWZKmTzU4c8bpfLTAAEM3Ydpgz4RrHi8nKPLCWh++ixJFjFweJ
	peFKuIDXL8rxgI=
X-Received: by 2002:a05:6000:d10:b0:43c:f7f6:6016 with SMTP id ffacd0b85a97d-43cf7f660damr5334086f8f.32.1774824202205;
        Sun, 29 Mar 2026 15:43:22 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf2471ee2sm13060652f8f.29.2026.03.29.15.43.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Mar 2026 15:43:21 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 30 Mar 2026 00:43:21 +0200
Message-Id: <DHFMO6AYFION.2E87F8QF463B0@smile.fr>
To: "Yoann Congal" <yoann.congal@smile.fr>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][scarthgap 15/16] busybox: fix for CVE-2026-26157,
 CVE-2026-26158
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <cover.1774823430.git.yoann.congal@smile.fr>
 <d8c85244176b3106264bd135b3f5d506db8ff888.1774823430.git.yoann.congal@smile.fr>
In-Reply-To: <d8c85244176b3106264bd135b3f5d506db8ff888.1774823430.git.yoann.congal@smile.fr>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 29 Mar 2026 22:43:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234179

On Mon Mar 30, 2026 at 12:37 AM CEST, Yoann Congal wrote:
> From: Hitendra Prajapati <hprajapati@mvista.com>
>
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
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> ---

I did not wanted to send that patch, please ignore.

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
> index 00000000000..cdc23947949
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
> index 00000000000..00a276fa4f8
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
> index d870e2ee10c..228bfdadd33 100644
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


