Return-Path: <ernstp@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCCBFF8A16E
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 12:37:23 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12957.1776343037712478729
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Apr 2026 05:37:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=F/04N6zA;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: ernstp@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-671dad7cac8so5163048a12.0
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 05:37:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776343036; cv=none;
        d=google.com; s=arc-20240605;
        b=O9QfGfsmNHY9p+v8Zii7yMnp1XzzytFDv42ix0PBlPtJ3fd1KqdOGmVZEpiV9wcnVU
         yr0Fv+grFQQZoYmfH0DHaDxqdhrB2CQ5kFvWSCljPZP/GPEQwkgKBL88k+YwbqpMq+hk
         IbqVqQj+V9B0f0QBUk9F6WsiLKhevtmiQgmOzYdOBRZXmuI7q0M+HP3twJcyauSSVprg
         Lc1RPKDG9UDlykrebMDYs4ldZIV5Ki6EbxE68YpdzN5zepPDjYNEZFD5i3AITkFA8VMM
         layE67yFkPBy400HP/kqVnlnkg+JLyR3n9YiHUWTpAMOjGJaMd/+W52m+SBAVtNruvbt
         nv8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=QNITEYYn48vtoMIJUJ+ESnYHpvdl6RhZvDUWOZZByZA=;
        fh=LCmL8/zUCubGGLjLccxHJaSWjT2mOTgHO2JSCIfmUgU=;
        b=ciP6OzKbGb2TZDzHXw3bOW05/BtESj4vnpY/VOSDv2xK0uh2cp68HU4GTOUqjc3YRF
         e4h9wn/33eyDmfJ4oj/+pKAiyaVXc16NxHOhZIwVj6aUIh7Bor+CbHaStoZmZasJgjs9
         h7Tl1TUTk/x+EYByhdaS6vjLrJhSzxxRoRPLC5H3tJhcSp9s2ETLKxtxlvDdQLUfaMvM
         jrwNf6vkZaQsBQIbkyJYOe4mt2r8C3mVxQhz1YCHruup1KCbpMPRRJoFiKgCV3tCaY90
         5vKJax3oYKnHN/v77f/7jJ/To72EwBhrgDaf3ahQrGTRsOCANQJ0erYGOW4WIJ5P+YCW
         zjkg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776343036; x=1776947836; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QNITEYYn48vtoMIJUJ+ESnYHpvdl6RhZvDUWOZZByZA=;
        b=F/04N6zAvyW6hjhcL4d28k/UxXQj9xS8qwuQ+uxfceMjPuoQspBeIWAlWEuGQm7D0M
         Xf22d7m9LpYd5dOFL4uiPCPqZOtX+bLrpFBLY3dGfvqvQ+hSEHzPoErdWxbEaNhjvJDr
         VSpOlg//evokXY0qF8SJlMrZisbBpE4EE5tF7VQwW1kluphSjnE0dd6bkJAmo3TDkeXZ
         HY92YB/4HTXtEzLB1FAyIVKjbotI0kJSTgvffUk4pTjTy/KOgN6VfS15teZe893/XxIN
         7QB4fVOQvgpfOVG3gNNd5R9GlLJpvRZFrcnCO+yP4scZ6ZbEEW9WFeD3J4tHakKtF3k5
         213w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776343036; x=1776947836;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QNITEYYn48vtoMIJUJ+ESnYHpvdl6RhZvDUWOZZByZA=;
        b=dLtoTbyNcTVoAs/+tfdZLyKjyt/gJ/lXfzw7K5Z9ON4Urn/DVLbuuVPOoPEUGknlzu
         nCBVF5fDqd6wDQyY7eUPcaqxbdotpRH+vdmg5n2ow+dJaANRdbh6rH36xcYpIngxbhlV
         7sJaEjJ5SimBtVrct5vWKNtoUBaghaJnHG1PCMsPDyiUjd7HteHKz4p/Eij2dRXJDpJf
         rNkiZNZYxHSughYVRfjmKdCAtcTZi8wJUwdVBBaT8MXYU0SjDt/5IJwwHF52hGtlrC04
         aDly+yjFOV/LqTDMStwHCI2jOjzHcq/7P7JvctOJ1fhCA+ERNjWp0DdyBCyPO7lwaSaN
         GCTA==
X-Gm-Message-State: AOJu0YypByytpfzuDLCnWUAINfjNaw3W/fc6GBqQmoohuTCc59MNVWr2
	1IfJUG/+2jvwGG/EfrUZJP2suhox+l28THwrBklqbJ/aPwnUBEvayxAR22MUd9HyfgxhHC458/b
	5wuCBn51wErbUFe0YUbyTrzpZzDiv7yQ=
X-Gm-Gg: AeBDievOfo3zekoTlFmFwbF745UjV1+UGJr2gjcmM2ggmQ2IlSEZ5oOQrGys6/848mm
	VvEIo1nRkWhds36W6ROv6vqWMKGvilNFG2xdaONLJHdjJBvYn5Edz6XxSgSFYqUJviDcRTVRtag
	cKKBz+7QewRj6i7xqq4KhyKsfTn1oi2P85FvUij+z27oWzrrju7Li1Ws+zhH7aDU011368vdPLO
	xVPPds+L96rvfW5f/82It8mqgFDvxsGtG6+p+D4ND7vN+cWMoQeKNoo/9/rd7q11KYrvHZWiwHe
	LvM0G872k2JC6wXns1/d7hi8BqvDOST8SyXOn8S4kcQ71+Q3/V+pq+gOyMP53L9sb0QUOcGgJfk
	Y23HitIDXmWSgQLTBdASd713UT/d6dK6Bt6ZxwLl0KrNCLCFxwbhTUEl5ZzPzmCeGJ5yrAFU3VY
	PBikzbhHIH+WEjPF+OXkkUJirYH3PAj3QRAyhooE+mYSFBQa0QmOggYdHkcQ4CQyL8QmEk+wP7y
	F38NUs=
X-Received: by 2002:a05:6402:505c:b0:66b:b6e2:66e1 with SMTP id
 4fb4d7f45d1cf-6707a47e6a3mr9639105a12.18.1776343035526; Thu, 16 Apr 2026
 05:37:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260410-busybox-fix-cve-v1-1-42202093b870@non.se.com>
In-Reply-To: <20260410-busybox-fix-cve-v1-1-42202093b870@non.se.com>
From: Ernst Persson <ernstp@gmail.com>
Date: Thu, 16 Apr 2026 14:37:02 +0200
X-Gm-Features: AQROBzBLhW3YkaRt558qe3OvbemkN7RIh-2nzfTA9tmk-hrCP7DbolzSoG13_cU
Message-ID: <CAD=4a=VBJ9za9RBKsLxH70uV5-mXGeFkRUdvzuR7VM2dzT3xZA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] busybox: fix for CVE-2026-26157, CVE-2026-26158
To: ernst.persson@non.se.com
Cc: openembedded-core@lists.openembedded.org, 
	Hitendra Prajapati <hprajapati@mvista.com>
Content-Type: multipart/alternative; boundary="000000000000a1c539064f931743"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 12:37:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235403

--000000000000a1c539064f931743
Content-Type: text/plain; charset="UTF-8"

Ping! This was for master, if that was unclear.

Den fre 10 apr. 2026 kl 12:51 skrev Ernst Persson via lists.openembedded.org
<ernst.persson=non.se.com@lists.openembedded.org>:

> From: Ernst Persson <ernst.persson@non.se.com>
>
> Pick up patch from NVD report.
>
> More details :
> [1]: https://nvd.nist.gov/vuln/detail/CVE-2026-26157
> [2]: https://nvd.nist.gov/vuln/detail/CVE-2026-26158
>
> Note:
> We use patch from busybox mirror that looks trustworthy
> https://gogs.librecmc.org/OWEALS/busybox.
>
> Suggested-by: Hitendra Prajapati <hprajapati@mvista.com>
> Signed-off-by: Ernst Persson <ernst.persson@non.se.com>
> ---
>  ...nsafe-hardlink-components-GNU-tar-does-th.patch | 196
> +++++++++++++++++++++
>  ...rip-unsafe-components-from-hardlinks-not-.patch |  35 ++++
>  meta/recipes-core/busybox/busybox_1.37.0.bb        |   4 +-
>  3 files changed, 234 insertions(+), 1 deletion(-)
>
> diff --git
> a/meta/recipes-core/busybox/busybox/0001-tar-strip-unsafe-hardlink-components-GNU-tar-does-th.patch
> b/meta/recipes-core/busybox/busybox/0001-tar-strip-unsafe-hardlink-components-GNU-tar-does-th.patch
> new file mode 100644
> index 0000000000..46e47c5993
> --- /dev/null
> +++
> b/meta/recipes-core/busybox/busybox/0001-tar-strip-unsafe-hardlink-components-GNU-tar-does-th.patch
> @@ -0,0 +1,196 @@
> +From 3ab1d6c123a6916e7efb821a441164ae56c6cd01 Mon Sep 17 00:00:00 2001
> +From: Denys Vlasenko <vda.linux@googlemail.com>
> +Date: Thu, 29 Jan 2026 11:48:02 +0100
> +Subject: [PATCH] tar: strip unsafe hardlink components - GNU tar does the
> same
> +
> +Defends against files like these (python reproducer):
> +
> +import tarfile
> +ti = tarfile.TarInfo("leak_hosts")
> +ti.type = tarfile.LNKTYPE
> +ti.linkname = "/etc/hosts"  # or "../etc/hosts" or ".."
> +ti.size = 0
> +with tarfile.open("/tmp/hardlink.tar", "w") as t:
> +       t.addfile(ti)
> +
> +function                                             old     new   delta
> +skip_unsafe_prefix                                     -     127    +127
> +get_header_tar                                      1752    1754      +2
> +.rodata                                           106861  106856      -5
> +unzip_main                                          2715    2706      -9
> +strip_unsafe_prefix                                  102      18     -84
>
> +------------------------------------------------------------------------------
> +(add/remove: 1/0 grow/shrink: 1/3 up/down: 129/-98)            Total: 31
> bytes
> +
> +Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
> +
> +CVE: CVE-2026-26157
> +CVE: CVE-2026-26158
> +Upstream-Status: Backport [
> https://git.busybox.net/busybox/commit/?id=3fb6b31c716669e12f75a2accd31bb7685b1a1cb
> ]
> +(Alternative mirrored URL:
> https://gogs.librecmc.org/OWEALS/busybox/commit/3fb6b31c716669e12f75a2accd31bb7685b1a1cb
> )
> +Signed-off-by: Ernst Persson <ernst.persson@non.se.com>
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
> +diff --git a/archival/libarchive/data_extract_all.c
> b/archival/libarchive/data_extract_all.c
> +index 8a69711..b84b960 100644
> +--- a/archival/libarchive/data_extract_all.c
> ++++ b/archival/libarchive/data_extract_all.c
> +@@ -66,8 +66,8 @@ void FAST_FUNC data_extract_all(archive_handle_t
> *archive_handle)
> +       }
> + #endif
> + #if ENABLE_FEATURE_PATH_TRAVERSAL_PROTECTION
> +-      /* Strip leading "/" and up to last "/../" path component */
> +-      dst_name = (char *)strip_unsafe_prefix(dst_name);
> ++      /* Skip leading "/" and past last ".." path component */
> ++      dst_name = (char *)skip_unsafe_prefix(dst_name);
> + #endif
> + // ^^^ This may be a problem if some applets do need to extract absolute
> names.
> + // (Probably will need to invent ARCHIVE_ALLOW_UNSAFE_NAME flag).
> +@@ -185,8 +185,7 @@ void FAST_FUNC data_extract_all(archive_handle_t
> *archive_handle)
> +
> +               /* To avoid a directory traversal attack via symlinks,
> +                * do not restore symlinks with ".." components
> +-               * or symlinks starting with "/", unless a magic
> +-               * envvar is set.
> ++               * or symlinks starting with "/"
> +                *
> +                * For example, consider a .tar created via:
> +                *  $ tar cvf bug.tar anything.txt
> +diff --git a/archival/libarchive/get_header_tar.c
> b/archival/libarchive/get_header_tar.c
> +index cc6f3f0..1c40ece 100644
> +--- a/archival/libarchive/get_header_tar.c
> ++++ b/archival/libarchive/get_header_tar.c
> +@@ -454,8 +454,15 @@ char FAST_FUNC get_header_tar(archive_handle_t
> *archive_handle)
> + #endif
> +
> +       /* Everything up to and including last ".." component is stripped
> */
> +-      overlapping_strcpy(file_header->name,
> strip_unsafe_prefix(file_header->name));
> +-//TODO: do the same for file_header->link_target?
> ++      strip_unsafe_prefix(file_header->name);
> ++      if (file_header->link_target) {
> ++              /* GNU tar 1.34 examples:
> ++               * tar: Removing leading '/' from hard link targets
> ++               * tar: Removing leading '../' from hard link targets
> ++               * tar: Removing leading 'etc/../' from hard link targets
> ++               */
> ++              strip_unsafe_prefix(file_header->link_target);
> ++      }
> +
> +       /* Strip trailing '/' in directories */
> +       /* Must be done after mode is set as '/' is used to check if it's
> a directory */
> +diff --git a/archival/libarchive/unsafe_prefix.c
> b/archival/libarchive/unsafe_prefix.c
> +index 6670811..89a371a 100644
> +--- a/archival/libarchive/unsafe_prefix.c
> ++++ b/archival/libarchive/unsafe_prefix.c
> +@@ -5,11 +5,11 @@
> + #include "libbb.h"
> + #include "bb_archive.h"
> +
> +-const char* FAST_FUNC strip_unsafe_prefix(const char *str)
> ++const char* FAST_FUNC skip_unsafe_prefix(const char *str)
> + {
> +       const char *cp = str;
> +       while (1) {
> +-              char *cp2;
> ++              const char *cp2;
> +               if (*cp == '/') {
> +                       cp++;
> +                       continue;
> +@@ -22,10 +22,25 @@ const char* FAST_FUNC strip_unsafe_prefix(const char
> *str)
> +                       cp += 3;
> +                       continue;
> +               }
> +-              cp2 = strstr(cp, "/../");
> ++              cp2 = cp;
> ++ find_dotdot:
> ++              cp2 = strstr(cp2, "/..");
> +               if (!cp2)
> +-                      break;
> +-              cp = cp2 + 4;
> ++                      break; /* No (more) malicious components */
> ++
> ++              /* We found "/..something" */
> ++              cp2 += 3;
> ++              if (*cp2 != '/') {
> ++                      if (*cp2 == '\0') {
> ++                              /* Trailing "/..": malicious, return "" */
> ++                              /* (causes harmless errors trying to
> create or hardlink a file named "") */
> ++                              return cp2;
> ++                      }
> ++                      /* "/..name" is not malicious, look for next "/.."
> */
> ++                      goto find_dotdot;
> ++              }
> ++              /* Found "/../": malicious, advance past it */
> ++              cp = cp2 + 1;
> +       }
> +       if (cp != str) {
> +               static smallint warned = 0;
> +@@ -37,3 +52,8 @@ const char* FAST_FUNC strip_unsafe_prefix(const char
> *str)
> +       }
> +       return cp;
> + }
> ++
> ++void FAST_FUNC strip_unsafe_prefix(char *str)
> ++{
> ++      overlapping_strcpy(str, skip_unsafe_prefix(str));
> ++}
> +diff --git a/archival/libarchive/unsafe_symlink_target.c
> b/archival/libarchive/unsafe_symlink_target.c
> +index f8dc803..d764c89 100644
> +--- a/archival/libarchive/unsafe_symlink_target.c
> ++++ b/archival/libarchive/unsafe_symlink_target.c
> +@@ -36,6 +36,7 @@ void FAST_FUNC create_links_from_list(llist_t *list)
> +                               *list->data ? "hard" : "sym",
> +                               list->data + 1, target
> +                       );
> ++                      /* Note: GNU tar 1.34 errors out only _after_ all
> links are (attempted to be) created */
> +               }
> +               list = list->link;
> +       }
> +diff --git a/archival/tar.c b/archival/tar.c
> +index d6ca6c1..d42dcfc 100644
> +--- a/archival/tar.c
> ++++ b/archival/tar.c
> +@@ -475,7 +475,7 @@ static int FAST_FUNC writeFileToTarball(struct
> recursive_state *state,
> +       DBG("writeFileToTarball('%s')", fileName);
> +
> +       /* Strip leading '/' and such (must be before memorizing
> hardlink's name) */
> +-      header_name = strip_unsafe_prefix(fileName);
> ++      header_name = skip_unsafe_prefix(fileName);
> +
> +       if (header_name[0] == '\0')
> +               return TRUE;
> +diff --git a/archival/unzip.c b/archival/unzip.c
> +index 71a3029..8a9a90f 100644
> +--- a/archival/unzip.c
> ++++ b/archival/unzip.c
> +@@ -860,7 +860,7 @@ int unzip_main(int argc, char **argv)
> +
> +               /* Guard against "/abspath", "/../" and similar attacks */
> + // NB: UnZip 6.00 has option -: to disable this
> +-              overlapping_strcpy(dst_fn, strip_unsafe_prefix(dst_fn));
> ++              strip_unsafe_prefix(dst_fn);
> +
> +               /* Filter zip entries */
> +               if (find_list_entry(zreject, dst_fn)
> +diff --git a/include/bb_archive.h b/include/bb_archive.h
> +index e0ef8fc..1dc77f3 100644
> +--- a/include/bb_archive.h
> ++++ b/include/bb_archive.h
> +@@ -202,7 +202,8 @@ char get_header_tar_xz(archive_handle_t
> *archive_handle) FAST_FUNC;
> + void seek_by_jump(int fd, off_t amount) FAST_FUNC;
> + void seek_by_read(int fd, off_t amount) FAST_FUNC;
> +
> +-const char *strip_unsafe_prefix(const char *str) FAST_FUNC;
> ++const char *skip_unsafe_prefix(const char *str) FAST_FUNC;
> ++void strip_unsafe_prefix(char *str) FAST_FUNC;
> + void create_or_remember_link(llist_t **link_placeholders,
> +               const char *target,
> +               const char *linkname,
> diff --git
> a/meta/recipes-core/busybox/busybox/0002-tar-only-strip-unsafe-components-from-hardlinks-not-.patch
> b/meta/recipes-core/busybox/busybox/0002-tar-only-strip-unsafe-components-from-hardlinks-not-.patch
> new file mode 100644
> index 0000000000..830082a7d6
> --- /dev/null
> +++
> b/meta/recipes-core/busybox/busybox/0002-tar-only-strip-unsafe-components-from-hardlinks-not-.patch
> @@ -0,0 +1,35 @@
> +From 981479997e29953c1a12c9c7376c9d259d035311 Mon Sep 17 00:00:00 2001
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
> +CVE: CVE-2026-26157
> +CVE: CVE-2026-26158
> +Upstream-Status: Backport [
> https://git.busybox.net/busybox/commit/?id=599f5dd8fac390c18b79cba4c14c334957605dae
> ]
> +(Alternative mirrored URL:
> https://gogs.librecmc.org/OWEALS/busybox/commit/599f5dd8fac390c18b79cba4c14c334957605dae
> )
> +Signed-off-by: Ernst Persson <ernst.persson@non.se.com>
> +---
> + archival/libarchive/get_header_tar.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/archival/libarchive/get_header_tar.c
> b/archival/libarchive/get_header_tar.c
> +index 1c40ece..606d806 100644
> +--- a/archival/libarchive/get_header_tar.c
> ++++ b/archival/libarchive/get_header_tar.c
> +@@ -455,7 +455,7 @@ char FAST_FUNC get_header_tar(archive_handle_t
> *archive_handle)
> +
> +       /* Everything up to and including last ".." component is stripped
> */
> +       strip_unsafe_prefix(file_header->name);
> +-      if (file_header->link_target) {
> ++      if (file_header->link_target && !S_ISLNK(file_header->mode)) {
> +               /* GNU tar 1.34 examples:
> +                * tar: Removing leading '/' from hard link targets
> +                * tar: Removing leading '../' from hard link targets
> diff --git a/meta/recipes-core/busybox/busybox_1.37.0.bb
> b/meta/recipes-core/busybox/busybox_1.37.0.bb
> index fbb0edb0fb..61ff602be6 100644
> --- a/meta/recipes-core/busybox/busybox_1.37.0.bb
> +++ b/meta/recipes-core/busybox/busybox_1.37.0.bb
> @@ -60,7 +60,9 @@ SRC_URI = "
> https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
>             file://CVE-2025-46394-01.patch \
>             file://CVE-2025-46394-02.patch \
>             file://CVE-2025-60876.patch \
> -
>  file://0001-busybox-fix-printf-ptest-failure-with-glibc-2.43.patch \
> +
>  file://0001-busybox-fix-printf-ptest-failure-with-glibc-2.43.patch \
> +
>  file://0001-tar-strip-unsafe-hardlink-components-GNU-tar-does-th.patch \
> +
>  file://0002-tar-only-strip-unsafe-components-from-hardlinks-not-.patch \
>             "
>  SRC_URI:append:libc-musl = " file://musl.cfg"
>  SRC_URI:append:x86-64 = " file://sha_accel.cfg"
>
> ---
> base-commit: 853baa702e3275fc8b4dc492a93d9a00c8cf5c0f
> change-id: 20260410-busybox-fix-cve-9a328417d358
>
> Best regards,
> --
> Ernst Persson <ernst.persson@non.se.com>
>
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#235017):
> https://lists.openembedded.org/g/openembedded-core/message/235017
> Mute This Topic: https://lists.openembedded.org/mt/118757543/4947266
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ernstp@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000a1c539064f931743
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:arial,he=
lvetica,sans-serif">Ping! This was for master, if that was unclear.</div></=
div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" c=
lass=3D"gmail_attr">Den fre 10 apr. 2026 kl 12:51 skrev Ernst Persson via <=
a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;ern=
st.persson=3D<a href=3D"mailto:non.se.com@lists.openembedded.org">non.se.co=
m@lists.openembedded.org</a>&gt;:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">From: Ernst Persson &lt;<a href=3D"mailto:ernst.persson@n=
on.se.com" target=3D"_blank">ernst.persson@non.se.com</a>&gt;<br>
<br>
Pick up patch from NVD report.<br>
<br>
More details :<br>
[1]: <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2026-26157" rel=3D"nor=
eferrer" target=3D"_blank">https://nvd.nist.gov/vuln/detail/CVE-2026-26157<=
/a><br>
[2]: <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2026-26158" rel=3D"nor=
eferrer" target=3D"_blank">https://nvd.nist.gov/vuln/detail/CVE-2026-26158<=
/a><br>
<br>
Note:<br>
We use patch from busybox mirror that looks trustworthy <a href=3D"https://=
gogs.librecmc.org/OWEALS/busybox" rel=3D"noreferrer" target=3D"_blank">http=
s://gogs.librecmc.org/OWEALS/busybox</a>.<br>
<br>
Suggested-by: Hitendra Prajapati &lt;<a href=3D"mailto:hprajapati@mvista.co=
m" target=3D"_blank">hprajapati@mvista.com</a>&gt;<br>
Signed-off-by: Ernst Persson &lt;<a href=3D"mailto:ernst.persson@non.se.com=
" target=3D"_blank">ernst.persson@non.se.com</a>&gt;<br>
---<br>
=C2=A0...nsafe-hardlink-components-GNU-tar-does-th.patch | 196 ++++++++++++=
+++++++++<br>
=C2=A0...rip-unsafe-components-from-hardlinks-not-.patch |=C2=A0 35 ++++<br=
>
=C2=A0meta/recipes-core/busybox/<a href=3D"http://busybox_1.37.0.bb" rel=3D=
"noreferrer" target=3D"_blank">busybox_1.37.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A04 +-<br>
=C2=A03 files changed, 234 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-core/busybox/busybox/0001-tar-strip-unsafe-hardli=
nk-components-GNU-tar-does-th.patch b/meta/recipes-core/busybox/busybox/000=
1-tar-strip-unsafe-hardlink-components-GNU-tar-does-th.patch<br>
new file mode 100644<br>
index 0000000000..46e47c5993<br>
--- /dev/null<br>
+++ b/meta/recipes-core/busybox/busybox/0001-tar-strip-unsafe-hardlink-comp=
onents-GNU-tar-does-th.patch<br>
@@ -0,0 +1,196 @@<br>
+From 3ab1d6c123a6916e7efb821a441164ae56c6cd01 Mon Sep 17 00:00:00 2001<br>
+From: Denys Vlasenko &lt;<a href=3D"mailto:vda.linux@googlemail.com" targe=
t=3D"_blank">vda.linux@googlemail.com</a>&gt;<br>
+Date: Thu, 29 Jan 2026 11:48:02 +0100<br>
+Subject: [PATCH] tar: strip unsafe hardlink components - GNU tar does the =
same<br>
+<br>
+Defends against files like these (python reproducer):<br>
+<br>
+import tarfile<br>
+ti =3D tarfile.TarInfo(&quot;leak_hosts&quot;)<br>
+ti.type =3D tarfile.LNKTYPE<br>
+ti.linkname =3D &quot;/etc/hosts&quot;=C2=A0 # or &quot;../etc/hosts&quot;=
 or &quot;..&quot;<br>
+ti.size =3D 0<br>
+with tarfile.open(&quot;/tmp/hardlink.tar&quot;, &quot;w&quot;) as t:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0t.addfile(ti)<br>
+<br>
+function=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0old=C2=A0 =C2=A0 =C2=A0new=C2=A0 =C2=A0delta<br>
+skip_unsafe_prefix=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0-=C2=A0 =C2=A0 =C2=A0127=C2=A0 =C2=A0 +127<br>
+get_header_tar=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1=
752=C2=A0 =C2=A0 1754=C2=A0 =C2=A0 =C2=A0 +2<br>
+.rodata=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0106861=C2=A0 106856=C2=A0 =C2=A0 =C2=A0 -5<br>
+unzip_main=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 2715=C2=A0 =C2=A0 2706=C2=A0 =C2=A0 =C2=A0 -9<br>
+strip_unsafe_prefix=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 102=C2=A0 =
=C2=A0 =C2=A0 18=C2=A0 =C2=A0 =C2=A0-84<br>
+--------------------------------------------------------------------------=
----<br>
+(add/remove: 1/0 grow/shrink: 1/3 up/down: 129/-98)=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 Total: 31 bytes<br>
+<br>
+Signed-off-by: Denys Vlasenko &lt;<a href=3D"mailto:vda.linux@googlemail.c=
om" target=3D"_blank">vda.linux@googlemail.com</a>&gt;<br>
+<br>
+CVE: CVE-2026-26157<br>
+CVE: CVE-2026-26158<br>
+Upstream-Status: Backport [<a href=3D"https://git.busybox.net/busybox/comm=
it/?id=3D3fb6b31c716669e12f75a2accd31bb7685b1a1cb" rel=3D"noreferrer" targe=
t=3D"_blank">https://git.busybox.net/busybox/commit/?id=3D3fb6b31c716669e12=
f75a2accd31bb7685b1a1cb</a>]<br>
+(Alternative mirrored URL: <a href=3D"https://gogs.librecmc.org/OWEALS/bus=
ybox/commit/3fb6b31c716669e12f75a2accd31bb7685b1a1cb" rel=3D"noreferrer" ta=
rget=3D"_blank">https://gogs.librecmc.org/OWEALS/busybox/commit/3fb6b31c716=
669e12f75a2accd31bb7685b1a1cb</a>)<br>
+Signed-off-by: Ernst Persson &lt;<a href=3D"mailto:ernst.persson@non.se.co=
m" target=3D"_blank">ernst.persson@non.se.com</a>&gt;<br>
+---<br>
+ archival/libarchive/data_extract_all.c=C2=A0 =C2=A0 =C2=A0 |=C2=A0 7 +++-=
-<br>
+ archival/libarchive/get_header_tar.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 11 ++++=
++--<br>
+ archival/libarchive/unsafe_prefix.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 30=
 +++++++++++++++++----<br>
+ archival/libarchive/unsafe_symlink_target.c |=C2=A0 1 +<br>
+ archival/tar.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
+ archival/unzip.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
+ include/bb_archive.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 3 ++-<br>
+ 7 files changed, 42 insertions(+), 14 deletions(-)<br>
+<br>
+diff --git a/archival/libarchive/data_extract_all.c b/archival/libarchive/=
data_extract_all.c<br>
+index 8a69711..b84b960 100644<br>
+--- a/archival/libarchive/data_extract_all.c<br>
++++ b/archival/libarchive/data_extract_all.c<br>
+@@ -66,8 +66,8 @@ void FAST_FUNC data_extract_all(archive_handle_t *archiv=
e_handle)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+ #endif<br>
+ #if ENABLE_FEATURE_PATH_TRAVERSAL_PROTECTION<br>
+-=C2=A0 =C2=A0 =C2=A0 /* Strip leading &quot;/&quot; and up to last &quot;=
/../&quot; path component */<br>
+-=C2=A0 =C2=A0 =C2=A0 dst_name =3D (char *)strip_unsafe_prefix(dst_name);<=
br>
++=C2=A0 =C2=A0 =C2=A0 /* Skip leading &quot;/&quot; and past last &quot;..=
&quot; path component */<br>
++=C2=A0 =C2=A0 =C2=A0 dst_name =3D (char *)skip_unsafe_prefix(dst_name);<b=
r>
+ #endif<br>
+ // ^^^ This may be a problem if some applets do need to extract absolute =
names.<br>
+ // (Probably will need to invent ARCHIVE_ALLOW_UNSAFE_NAME flag).<br>
+@@ -185,8 +185,7 @@ void FAST_FUNC data_extract_all(archive_handle_t *arch=
ive_handle)<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* To avoid a direc=
tory traversal attack via symlinks,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * do not restore s=
ymlinks with &quot;..&quot; components<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* or symlinks star=
ting with &quot;/&quot;, unless a magic<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* envvar is set.<b=
r>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* or symlinks star=
ting with &quot;/&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * For example, con=
sider a .tar created via:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=A0 $ tar cvf =
bug.tar anything.txt<br>
+diff --git a/archival/libarchive/get_header_tar.c b/archival/libarchive/ge=
t_header_tar.c<br>
+index cc6f3f0..1c40ece 100644<br>
+--- a/archival/libarchive/get_header_tar.c<br>
++++ b/archival/libarchive/get_header_tar.c<br>
+@@ -454,8 +454,15 @@ char FAST_FUNC get_header_tar(archive_handle_t *archi=
ve_handle)<br>
+ #endif<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Everything up to and including last &quot;..=
&quot; component is stripped */<br>
+-=C2=A0 =C2=A0 =C2=A0 overlapping_strcpy(file_header-&gt;name, strip_unsaf=
e_prefix(file_header-&gt;name));<br>
+-//TODO: do the same for file_header-&gt;link_target?<br>
++=C2=A0 =C2=A0 =C2=A0 strip_unsafe_prefix(file_header-&gt;name);<br>
++=C2=A0 =C2=A0 =C2=A0 if (file_header-&gt;link_target) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* GNU tar 1.34 examples=
:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* tar: Removing le=
ading &#39;/&#39; from hard link targets<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* tar: Removing le=
ading &#39;../&#39; from hard link targets<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* tar: Removing le=
ading &#39;etc/../&#39; from hard link targets<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 strip_unsafe_prefix(file=
_header-&gt;link_target);<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Strip trailing &#39;/&#39; in directories */=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Must be done after mode is set as &#39;/&#39=
; is used to check if it&#39;s a directory */<br>
+diff --git a/archival/libarchive/unsafe_prefix.c b/archival/libarchive/uns=
afe_prefix.c<br>
+index 6670811..89a371a 100644<br>
+--- a/archival/libarchive/unsafe_prefix.c<br>
++++ b/archival/libarchive/unsafe_prefix.c<br>
+@@ -5,11 +5,11 @@<br>
+ #include &quot;libbb.h&quot;<br>
+ #include &quot;bb_archive.h&quot;<br>
+ <br>
+-const char* FAST_FUNC strip_unsafe_prefix(const char *str)<br>
++const char* FAST_FUNC skip_unsafe_prefix(const char *str)<br>
+ {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0const char *cp =3D str;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0while (1) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 char *cp2;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *cp2;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (*cp =3D=3D &#39=
;/&#39;) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0cp++;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0continue;<br>
+@@ -22,10 +22,25 @@ const char* FAST_FUNC strip_unsafe_prefix(const char *=
str)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0cp +=3D 3;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0continue;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cp2 =3D strstr(cp, &quot=
;/../&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cp2 =3D cp;<br>
++ find_dotdot:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cp2 =3D strstr(cp2, &quo=
t;/..&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!cp2)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 break;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cp =3D cp2 + 4;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 break; /* No (more) malicious components */<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* We found &quot;/..som=
ething&quot; */<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cp2 +=3D 3;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (*cp2 !=3D &#39;/&#39=
;) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (*cp2 =3D=3D &#39;\0&#39;) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Trailing &quot;/..&quot;: malicious, ret=
urn &quot;&quot; */<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* (causes harmless errors trying to create=
 or hardlink a file named &quot;&quot;) */<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return cp2;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 /* &quot;/..name&quot; is not malicious, look for next &quot;/..&quot; =
*/<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 goto find_dotdot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Found &quot;/../&quot=
;: malicious, advance past it */<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cp =3D cp2 + 1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (cp !=3D str) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0static smallint war=
ned =3D 0;<br>
+@@ -37,3 +52,8 @@ const char* FAST_FUNC strip_unsafe_prefix(const char *st=
r)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return cp;<br>
+ }<br>
++<br>
++void FAST_FUNC strip_unsafe_prefix(char *str)<br>
++{<br>
++=C2=A0 =C2=A0 =C2=A0 overlapping_strcpy(str, skip_unsafe_prefix(str));<br=
>
++}<br>
+diff --git a/archival/libarchive/unsafe_symlink_target.c b/archival/libarc=
hive/unsafe_symlink_target.c<br>
+index f8dc803..d764c89 100644<br>
+--- a/archival/libarchive/unsafe_symlink_target.c<br>
++++ b/archival/libarchive/unsafe_symlink_target.c<br>
+@@ -36,6 +36,7 @@ void FAST_FUNC create_links_from_list(llist_t *list)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*list-&gt;data ? &quot;hard&quot; : &=
quot;sym&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0list-&gt;data + 1, target<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 /* Note: GNU tar 1.34 errors out only _after_ all links are (attempted =
to be) created */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0list =3D list-&gt;l=
ink;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+diff --git a/archival/tar.c b/archival/tar.c<br>
+index d6ca6c1..d42dcfc 100644<br>
+--- a/archival/tar.c<br>
++++ b/archival/tar.c<br>
+@@ -475,7 +475,7 @@ static int FAST_FUNC writeFileToTarball(struct recursi=
ve_state *state,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0DBG(&quot;writeFileToTarball(&#39;%s&#39;)&quot=
;, fileName);<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Strip leading &#39;/&#39; and such (must be =
before memorizing hardlink&#39;s name) */<br>
+-=C2=A0 =C2=A0 =C2=A0 header_name =3D strip_unsafe_prefix(fileName);<br>
++=C2=A0 =C2=A0 =C2=A0 header_name =3D skip_unsafe_prefix(fileName);<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (header_name[0] =3D=3D &#39;\0&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return TRUE;<br>
+diff --git a/archival/unzip.c b/archival/unzip.c<br>
+index 71a3029..8a9a90f 100644<br>
+--- a/archival/unzip.c<br>
++++ b/archival/unzip.c<br>
+@@ -860,7 +860,7 @@ int unzip_main(int argc, char **argv)<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Guard against &q=
uot;/abspath&quot;, &quot;/../&quot; and similar attacks */<br>
+ // NB: UnZip 6.00 has option -: to disable this<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 overlapping_strcpy(dst_f=
n, strip_unsafe_prefix(dst_fn));<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 strip_unsafe_prefix(dst_=
fn);<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Filter zip entri=
es */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (find_list_entry=
(zreject, dst_fn)<br>
+diff --git a/include/bb_archive.h b/include/bb_archive.h<br>
+index e0ef8fc..1dc77f3 100644<br>
+--- a/include/bb_archive.h<br>
++++ b/include/bb_archive.h<br>
+@@ -202,7 +202,8 @@ char get_header_tar_xz(archive_handle_t *archive_handl=
e) FAST_FUNC;<br>
+ void seek_by_jump(int fd, off_t amount) FAST_FUNC;<br>
+ void seek_by_read(int fd, off_t amount) FAST_FUNC;<br>
+ <br>
+-const char *strip_unsafe_prefix(const char *str) FAST_FUNC;<br>
++const char *skip_unsafe_prefix(const char *str) FAST_FUNC;<br>
++void strip_unsafe_prefix(char *str) FAST_FUNC;<br>
+ void create_or_remember_link(llist_t **link_placeholders,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *target,=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *linknam=
e,<br>
diff --git a/meta/recipes-core/busybox/busybox/0002-tar-only-strip-unsafe-c=
omponents-from-hardlinks-not-.patch b/meta/recipes-core/busybox/busybox/000=
2-tar-only-strip-unsafe-components-from-hardlinks-not-.patch<br>
new file mode 100644<br>
index 0000000000..830082a7d6<br>
--- /dev/null<br>
+++ b/meta/recipes-core/busybox/busybox/0002-tar-only-strip-unsafe-componen=
ts-from-hardlinks-not-.patch<br>
@@ -0,0 +1,35 @@<br>
+From 981479997e29953c1a12c9c7376c9d259d035311 Mon Sep 17 00:00:00 2001<br>
+From: Radoslav Kolev &lt;<a href=3D"mailto:radoslav.kolev@suse.com" target=
=3D"_blank">radoslav.kolev@suse.com</a>&gt;<br>
+Date: Mon, 16 Feb 2026 11:50:04 +0200<br>
+Subject: [PATCH] tar: only strip unsafe components from hardlinks, not<br>
+ symlinks<br>
+<br>
+commit 3fb6b31c7 introduced a check for unsafe components in<br>
+tar archive hardlinks, but it was being applied to symlinks too<br>
+which broke &quot;Symlinks and hardlinks coexist&quot; tar test.<br>
+<br>
+Signed-off-by: Radoslav Kolev &lt;<a href=3D"mailto:radoslav.kolev@suse.co=
m" target=3D"_blank">radoslav.kolev@suse.com</a>&gt;<br>
+Signed-off-by: Denys Vlasenko &lt;<a href=3D"mailto:vda.linux@googlemail.c=
om" target=3D"_blank">vda.linux@googlemail.com</a>&gt;<br>
+<br>
+CVE: CVE-2026-26157<br>
+CVE: CVE-2026-26158<br>
+Upstream-Status: Backport [<a href=3D"https://git.busybox.net/busybox/comm=
it/?id=3D599f5dd8fac390c18b79cba4c14c334957605dae" rel=3D"noreferrer" targe=
t=3D"_blank">https://git.busybox.net/busybox/commit/?id=3D599f5dd8fac390c18=
b79cba4c14c334957605dae</a>]<br>
+(Alternative mirrored URL: <a href=3D"https://gogs.librecmc.org/OWEALS/bus=
ybox/commit/599f5dd8fac390c18b79cba4c14c334957605dae" rel=3D"noreferrer" ta=
rget=3D"_blank">https://gogs.librecmc.org/OWEALS/busybox/commit/599f5dd8fac=
390c18b79cba4c14c334957605dae</a>)<br>
+Signed-off-by: Ernst Persson &lt;<a href=3D"mailto:ernst.persson@non.se.co=
m" target=3D"_blank">ernst.persson@non.se.com</a>&gt;<br>
+---<br>
+ archival/libarchive/get_header_tar.c | 2 +-<br>
+ 1 file changed, 1 insertion(+), 1 deletion(-)<br>
+<br>
+diff --git a/archival/libarchive/get_header_tar.c b/archival/libarchive/ge=
t_header_tar.c<br>
+index 1c40ece..606d806 100644<br>
+--- a/archival/libarchive/get_header_tar.c<br>
++++ b/archival/libarchive/get_header_tar.c<br>
+@@ -455,7 +455,7 @@ char FAST_FUNC get_header_tar(archive_handle_t *archiv=
e_handle)<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Everything up to and including last &quot;..=
&quot; component is stripped */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0strip_unsafe_prefix(file_header-&gt;name);<br>
+-=C2=A0 =C2=A0 =C2=A0 if (file_header-&gt;link_target) {<br>
++=C2=A0 =C2=A0 =C2=A0 if (file_header-&gt;link_target &amp;&amp; !S_ISLNK(=
file_header-&gt;mode)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* GNU tar 1.34 exa=
mples:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * tar: Removing le=
ading &#39;/&#39; from hard link targets<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * tar: Removing le=
ading &#39;../&#39; from hard link targets<br>
diff --git a/meta/recipes-core/busybox/<a href=3D"http://busybox_1.37.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">busybox_1.37.0.bb</a> b/meta/recipes-=
core/busybox/<a href=3D"http://busybox_1.37.0.bb" rel=3D"noreferrer" target=
=3D"_blank">busybox_1.37.0.bb</a><br>
index fbb0edb0fb..61ff602be6 100644<br>
--- a/meta/recipes-core/busybox/<a href=3D"http://busybox_1.37.0.bb" rel=3D=
"noreferrer" target=3D"_blank">busybox_1.37.0.bb</a><br>
+++ b/meta/recipes-core/busybox/<a href=3D"http://busybox_1.37.0.bb" rel=3D=
"noreferrer" target=3D"_blank">busybox_1.37.0.bb</a><br>
@@ -60,7 +60,9 @@ SRC_URI =3D &quot;<a href=3D"https://busybox.net/download=
s/busybox-$%7BPV%7D.tar.bz2;name=3Dtarball" rel=3D"noreferrer" target=3D"_b=
lank">https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=3Dtarball</a=
> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2025-46394-01.patch \<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2025-46394-02.patch \<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2025-60876.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-busybox-fix-printf-pt=
est-failure-with-glibc-2.43.patch \ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-busybox-fix-printf-pt=
est-failure-with-glibc-2.43.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-tar-strip-unsafe-hard=
link-components-GNU-tar-does-th.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-tar-only-strip-unsafe=
-components-from-hardlinks-not-.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
=C2=A0SRC_URI:append:libc-musl =3D &quot; file://musl.cfg&quot;<br>
=C2=A0SRC_URI:append:x86-64 =3D &quot; file://sha_accel.cfg&quot;<br>
<br>
---<br>
base-commit: 853baa702e3275fc8b4dc492a93d9a00c8cf5c0f<br>
change-id: 20260410-busybox-fix-cve-9a328417d358<br>
<br>
Best regards,<br>
-- <br>
Ernst Persson &lt;<a href=3D"mailto:ernst.persson@non.se.com" target=3D"_bl=
ank">ernst.persson@non.se.com</a>&gt;<br>
<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#235017): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/235017" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/235017</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/118757543/494=
7266" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/118757543/4947266</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:ernstp@gmail.com" target=
=3D"_blank">ernstp@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000a1c539064f931743--

