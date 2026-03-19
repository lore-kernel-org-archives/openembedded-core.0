Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 560C5108E1F6
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 11:40:57 +0000 (UTC)
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9073.1773920452274773456
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Mar 2026 04:40:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=JC/AvimM;
 spf=pass (domain: mvista.com, ip: 74.125.82.172, mailfrom: hprajapati@mvista.com)
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2c0e3a2605fso1615311eec.0
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 04:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1773920452; x=1774525252; darn=lists.openembedded.org;
        h=in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kFSzwblhrlOEgErrCo53XJJlXojaPsuKMSVjI62PvJw=;
        b=JC/AvimMtszA28IhBrovXHfCE2tipgm59bPdmWko4N5tAeOosPHNPoPKytT/o0zwSh
         2y5UYzQ77ntCZlsSzIBAEC3EzJwPIXkSqd5MuP/iFGJ96BpqgT3iC5+/svMwF76CWBww
         /xvi//KpyIwX8zE4PZwrh4AEkHSshAJblegg8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773920452; x=1774525252;
        h=in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kFSzwblhrlOEgErrCo53XJJlXojaPsuKMSVjI62PvJw=;
        b=n7vOOxsK+4HLh3M55ZmN2KmkD+uaG1Dq3X+MJzEx2C3ADDYdijdqQuxUDKnCTEhKlp
         5PhlVVyMTWm8H+GO5afyHle0diRe9168eYqfX1qTkRia1b2njNK3TrrigwCupJztA1Ub
         k8PTr5SsGwZ+Hcdzfndc7iS21t9hIbp5D2ZBlD3HFDVPxToiVjM9oUm+Jxz51PHjqBRn
         PaWqxhSpx7pCPqIwn+demrT8wY8LsYe1q8gUpCJUZlqTULmK2px+HVIXIkdbTvXhuMJz
         rLMDkUBXhi/i1Rh0+7pmxUhVGbRfda+Sffj+1HqUuaJ03p9PCm+uaAJZBCoZ794RkFcY
         6wkQ==
X-Forwarded-Encrypted: i=1; AJvYcCWY5xnB6X0ZuVZ4vIJsJDOBrusIbjnyBJKlbPBzYZsfY1SEklsVYP5lkEBzTJHIHS2gxoc0qQunJdTUx5p/fnemxA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwMdSnAuY/glHxXztmQJ0c1s12xsr/CVGeUyLC5dBrJZaDSgcn7
	gc7ojx5PXW5zIgvmHppNXrxI2dlUcAwDTODgnSISRnxAbhwXp1AWdohlIIfg/2cV0V4j6frQOPP
	wow3T
X-Gm-Gg: ATEYQzyWaBUc8944CksiIO1CvMte02rlU946T6z6ivxFyW6D4rvAnuBE+xA6aOwwmUM
	pNf/6VKK6guucCjumuygAp0ho3eSBpihbd5SIWc7tH1xB3uwIS81d/vbVs60/gh7XfxXbQ34Kdw
	SR6UIm4wAAL1NAf0b9fggoFNAyDV1a0Ao2kLLI6PPCZM1Dq2vrsm1aTtalBB495Y8mAjPmsOTKu
	EtvHoIiUbz1L3w+XdyKChhV+NRZdFfCS5EEwrt/owYniYGqoLjiN+cIbywQkjj74sUVBA98IlbG
	J9MANcVa4nho5kX5tIotKiEvoz6bYldzqgE/D5djYcSY4jw3UJVNKgCoO0X7IbjL+GH1p8lKfJK
	alHqh1uzh7QgDIU80awT4rojx0RNxqNuwlOMeWq+JbHVByM5HiMHAk84tRH5i0bEBjKpMrciN5N
	Vb11/RwIXiwjZE9mbzDHEoZvt/kcyW
X-Received: by 2002:a05:7301:1904:b0:2bf:1eaf:995c with SMTP id 5a478bee46e88-2c0e50a6e3dmr4240369eec.17.1773920451112;
        Thu, 19 Mar 2026 04:40:51 -0700 (PDT)
Received: from [192.168.1.100] ([43.249.234.183])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c0e5582bdasm7950987eec.19.2026.03.19.04.40.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 04:40:50 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------sFA7waYp1JfWgqtpo0loe6VD"
Message-ID: <c643bc67-8d9a-4740-9539-ea7b90d93c99@mvista.com>
Date: Thu, 19 Mar 2026 17:10:44 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [kirkstone][PATCH] busybox: fix for CVE-2026-26157,
 CVE-2026-26158
To: Fabien Thomas <fabien.thomas@smile.fr>,
 openembedded-core@lists.openembedded.org
References: <20260313131845.56221-1-hprajapati@mvista.com>
 <DH6PK2HKFZEL.OW09CNJ5IJ15@smile.fr>
Content-Language: en-US
From: Hitendra Prajapati <hprajapati@mvista.com>
In-Reply-To: <DH6PK2HKFZEL.OW09CNJ5IJ15@smile.fr>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 11:40:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233522

This is a multi-part message in MIME format.
--------------sFA7waYp1JfWgqtpo0loe6VD
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Team,

I'm not able to load the official busybox repo form last week, so I used 
mirror.

If anyone have access, they may try to fix this or I will look into 
these later.

Regards,

Hitendra

On 19/03/26 4:35 pm, Fabien Thomas wrote:
> On Fri Mar 13, 2026 at 2:18 PM CET, Hitendra Prajapati via lists.openembedded.org wrote:
>> Although the patch was not merged yet, Debian already took it ([1] & [2]).
>> Since busybox CVE handling is slow, follow Debian decision.
>>
>> [1]https://sources.debian.org/src/busybox/1:1.37.0-10.1/debian/patches/0001-tar-strip-unsafe-hardlink-components-GNU-tar-does-th.patch
>> [2]https://sources.debian.org/src/busybox/1:1.37.0-10.1/debian/patches/0002-tar-only-strip-unsafe-components-from-hardlinks-not-.patch
>>
>> Signed-off-by: Hitendra Prajapati<hprajapati@mvista.com>
>> ---
>>   .../CVE-2026-26157-CVE-2026-26158-01.patch    |  35 ++++
>>   .../CVE-2026-26157-CVE-2026-26158-02.patch    | 197 ++++++++++++++++++
>>   meta/recipes-core/busybox/busybox_1.35.0.bb   |   2 +
>>   3 files changed, 234 insertions(+)
>>   create mode 100644 meta/recipes-core/busybox/busybox/CVE-2026-26157-CVE-2026-26158-01.patch
>>   create mode 100644 meta/recipes-core/busybox/busybox/CVE-2026-26157-CVE-2026-26158-02.patch
>>
>> diff --git a/meta/recipes-core/busybox/busybox/CVE-2026-26157-CVE-2026-26158-01.patch b/meta/recipes-core/busybox/busybox/CVE-2026-26157-CVE-2026-26158-01.patch
>> new file mode 100644
>> index 0000000000..306ccad511
>> --- /dev/null
>> +++ b/meta/recipes-core/busybox/busybox/CVE-2026-26157-CVE-2026-26158-01.patch
>> @@ -0,0 +1,35 @@
>> +From 038e0e4d791ea4e8a8da5e06904756142fc6b8dc Mon Sep 17 00:00:00 2001
>> +From: Radoslav Kolev<radoslav.kolev@suse.com>
>> +Date: Mon, 16 Feb 2026 11:50:04 +0200
>> +Subject: tar: only strip unsafe components from hardlinks, not symlinks
>> +
>> +commit 3fb6b31c7 introduced a check for unsafe components in
>> +tar archive hardlinks, but it was being applied to symlinks too
>> +which broke "Symlinks and hardlinks coexist" tar test.
>> +
>> +Signed-off-by: Radoslav Kolev<radoslav.kolev@suse.com>
>> +Signed-off-by: Denys Vlasenko<vda.linux@googlemail.com>
>> +
>> +CVE: CVE-2026-26157, CVE-2026-26158
>> +Upstream-Status: Backport [https://github.com/mirror/busybox/commit/3fb6b31c716669e12f75a2accd31bb7685b1a1cb]
>> +Signed-off-by: Hitendra Prajapati<hprajapati@mvista.com>
>> +---
>> + archival/libarchive/get_header_tar.c | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/archival/libarchive/get_header_tar.c b/archival/libarchive/get_header_tar.c
>> +index dc0f7e0..a8c2ad8 100644
>> +--- a/archival/libarchive/get_header_tar.c
>> ++++ b/archival/libarchive/get_header_tar.c
>> +@@ -453,7 +453,7 @@ char FAST_FUNC get_header_tar(archive_handle_t *archive_handle)
>> +
>> + 	/* Everything up to and including last ".." component is stripped */
>> + 	strip_unsafe_prefix(file_header->name);
>> +-	if (file_header->link_target) {
>> ++	if (file_header->link_target && !S_ISLNK(file_header->mode)) {
>> + 		/* GNU tar 1.34 examples:
>> + 		 * tar: Removing leading '/' from hard link targets
>> + 		 * tar: Removing leading '../' from hard link targets
>> +--
>> +2.50.1
>> +
>> diff --git a/meta/recipes-core/busybox/busybox/CVE-2026-26157-CVE-2026-26158-02.patch b/meta/recipes-core/busybox/busybox/CVE-2026-26157-CVE-2026-26158-02.patch
>> new file mode 100644
>> index 0000000000..69e6e98c75
>> --- /dev/null
>> +++ b/meta/recipes-core/busybox/busybox/CVE-2026-26157-CVE-2026-26158-02.patch
>> @@ -0,0 +1,197 @@
>> +From 0c20d6b353b058ab910dd3a0211e2b906802b105 Mon Sep 17 00:00:00 2001
>> +From: Denys Vlasenko<vda.linux@googlemail.com>
>> +Date: Thu, 29 Jan 2026 11:48:02 +0100
>> +Subject: tar: strip unsafe hardlink components - GNU tar does the same
>> +
>> +Defends against files like these (python reproducer):
>> +
>> +import tarfile
>> +ti = tarfile.TarInfo("leak_hosts")
>> +ti.type = tarfile.LNKTYPE
>> +ti.linkname = "/etc/hosts"  # or "../etc/hosts" or ".."
>> +ti.size = 0
>> +with tarfile.open("/tmp/hardlink.tar", "w") as t:
>> +	t.addfile(ti)
>> +
>> +function                                             old     new   delta
>> +skip_unsafe_prefix                                     -     127    +127
>> +get_header_tar                                      1752    1754      +2
>> +.rodata                                           106861  106856      -5
>> +unzip_main                                          2715    2706      -9
>> +strip_unsafe_prefix                                  102      18     -84
>> +------------------------------------------------------------------------------
>> +(add/remove: 1/0 grow/shrink: 1/3 up/down: 129/-98)            Total: 31 bytes
>> +
>> +Signed-off-by: Denys Vlasenko<vda.linux@googlemail.com>
>> +
>> +CVE: CVE-2026-26157, CVE-2026-26158
>> +Upstream-Status: Backport [https://github.com/mirror/busybox/commit/3fb6b31c716669e12f75a2accd31bb7685b1a1cb]
>> +Signed-off-by: Hitendra Prajapati<hprajapati@mvista.com>
>> +---
>> + .../archival/libarchive/data_extract_all.c    |  7 ++---
>> + .../archival/libarchive/get_header_tar.c      | 11 +++++--
>> + .../archival/libarchive/unsafe_prefix.c       | 30 +++++++++++++++----
>> + .../libarchive/unsafe_symlink_target.c        |  1 +
>> + archival/tar.c                 |  2 +-
>> + archival/unzip.c               |  2 +-
>> + include/bb_archive.h           |  3 +-
>> + 7 files changed, 42 insertions(+), 14 deletions(-)
>> +
>> +diff --git a/archival/libarchive/data_extract_all.c b/archival/libarchive/data_extract_all.c
>> +index 8a69711..b84b960 100644
>> +--- a/archival/libarchive/data_extract_all.c
>> ++++ b/archival/libarchive/data_extract_all.c
>> +@@ -66,8 +66,8 @@ void FAST_FUNC data_extract_all(archive_handle_t *archive_handle)
>> + 	}
>> + #endif
>> + #if ENABLE_FEATURE_PATH_TRAVERSAL_PROTECTION
>> +-	/* Strip leading "/" and up to last "/../" path component */
>> +-	dst_name = (char *)strip_unsafe_prefix(dst_name);
>> ++	/* Skip leading "/" and past last ".." path component */
>> ++	dst_name = (char *)skip_unsafe_prefix(dst_name);
>> + #endif
>> + // ^^^ This may be a problem if some applets do need to extract absolute names.
>> + // (Probably will need to invent ARCHIVE_ALLOW_UNSAFE_NAME flag).
>> +@@ -185,8 +185,7 @@ void FAST_FUNC data_extract_all(archive_handle_t *archive_handle)
>> +
>> + 		/* To avoid a directory traversal attack via symlinks,
>> + 		 * do not restore symlinks with ".." components
>> +-		 * or symlinks starting with "/", unless a magic
>> +-		 * envvar is set.
>> ++		 * or symlinks starting with "/"
>> + 		 *
>> + 		 * For example, consider a .tar created via:
>> + 		 *  $ tar cvf bug.tar anything.txt
>> +diff --git a/archival/libarchive/get_header_tar.c b/archival/libarchive/get_header_tar.c
>> +index d26868b..dc0f7e0 100644
>> +--- a/archival/libarchive/get_header_tar.c
>> ++++ b/archival/libarchive/get_header_tar.c
>> +@@ -452,8 +452,15 @@ char FAST_FUNC get_header_tar(archive_handle_t *archive_handle)
>> + #endif
>> +
>> + 	/* Everything up to and including last ".." component is stripped */
>> +-	overlapping_strcpy(file_header->name, strip_unsafe_prefix(file_header->name));
>> +-//TODO: do the same for file_header->link_target?
>> ++	strip_unsafe_prefix(file_header->name);
>> ++	if (file_header->link_target) {
>> ++		/* GNU tar 1.34 examples:
>> ++		 * tar: Removing leading '/' from hard link targets
>> ++		 * tar: Removing leading '../' from hard link targets
>> ++		 * tar: Removing leading 'etc/../' from hard link targets
>> ++		 */
>> ++		strip_unsafe_prefix(file_header->link_target);
>> ++	}
>> +
>> + 	/* Strip trailing '/' in directories */
>> + 	/* Must be done after mode is set as '/' is used to check if it's a directory */
>> +diff --git a/archival/libarchive/unsafe_prefix.c b/archival/libarchive/unsafe_prefix.c
>> +index 6670811..89a371a 100644
>> +--- a/archival/libarchive/unsafe_prefix.c
>> ++++ b/archival/libarchive/unsafe_prefix.c
>> +@@ -5,11 +5,11 @@
>> + #include "libbb.h"
>> + #include "bb_archive.h"
>> +
>> +-const char* FAST_FUNC strip_unsafe_prefix(const char *str)
>> ++const char* FAST_FUNC skip_unsafe_prefix(const char *str)
>> + {
>> + 	const char *cp = str;
>> + 	while (1) {
>> +-		char *cp2;
>> ++		const char *cp2;
>> + 		if (*cp == '/') {
>> + 			cp++;
>> + 			continue;
>> +@@ -22,10 +22,25 @@ const char* FAST_FUNC strip_unsafe_prefix(const char *str)
>> + 			cp += 3;
>> + 			continue;
>> + 		}
>> +-		cp2 = strstr(cp, "/../");
>> ++		cp2 = cp;
>> ++ find_dotdot:
>> ++		cp2 = strstr(cp2, "/..");
>> + 		if (!cp2)
>> +-			break;
>> +-		cp = cp2 + 4;
>> ++			break; /* No (more) malicious components */
>> ++
>> ++		/* We found "/..something" */
>> ++		cp2 += 3;
>> ++		if (*cp2 != '/') {
>> ++			if (*cp2 == '\0') {
>> ++				/* Trailing "/..": malicious, return "" */
>> ++				/* (causes harmless errors trying to create or hardlink a file named "") */
>> ++				return cp2;
>> ++			}
>> ++			/* "/..name" is not malicious, look for next "/.." */
>> ++			goto find_dotdot;
>> ++		}
>> ++		/* Found "/../": malicious, advance past it */
>> ++		cp = cp2 + 1;
>> + 	}
>> + 	if (cp != str) {
>> + 		static smallint warned = 0;
>> +@@ -37,3 +52,8 @@ const char* FAST_FUNC strip_unsafe_prefix(const char *str)
>> + 	}
>> + 	return cp;
>> + }
>> ++
>> ++void FAST_FUNC strip_unsafe_prefix(char *str)
>> ++{
>> ++	overlapping_strcpy(str, skip_unsafe_prefix(str));
>> ++}
>> +diff --git a/archival/libarchive/unsafe_symlink_target.c b/archival/libarchive/unsafe_symlink_target.c
>> +index f8dc803..d764c89 100644
>> +--- a/archival/libarchive/unsafe_symlink_target.c
>> ++++ b/archival/libarchive/unsafe_symlink_target.c
>> +@@ -36,6 +36,7 @@ void FAST_FUNC create_links_from_list(llist_t *list)
>> + 				*list->data ? "hard" : "sym",
>> + 				list->data + 1, target
>> + 			);
>> ++			/* Note: GNU tar 1.34 errors out only _after_ all links are (attempted to be) created */
>> + 		}
>> + 		list = list->link;
>> + 	}
>> +diff --git a/archival/tar.c b/archival/tar.c
>> +index 9de3759..cf8c2d1 100644
>> +--- a/archival/tar.c
>> ++++ b/archival/tar.c
>> +@@ -475,7 +475,7 @@ static int FAST_FUNC writeFileToTarball(struct recursive_state *state,
>> + 	DBG("writeFileToTarball('%s')", fileName);
>> +
>> + 	/* Strip leading '/' and such (must be before memorizing hardlink's name) */
>> +-	header_name = strip_unsafe_prefix(fileName);
>> ++	header_name = skip_unsafe_prefix(fileName);
>> +
>> + 	if (header_name[0] == '\0')
>> + 		return TRUE;
>> +diff --git a/archival/unzip.c b/archival/unzip.c
>> +index fc92ac6..7b29d77 100644
>> +--- a/archival/unzip.c
>> ++++ b/archival/unzip.c
>> +@@ -842,7 +842,7 @@ int unzip_main(int argc, char **argv)
>> + 		unzip_skip(zip.fmt.extra_len);
>> +
>> + 		/* Guard against "/abspath", "/../" and similar attacks */
>> +-		overlapping_strcpy(dst_fn, strip_unsafe_prefix(dst_fn));
>> ++		strip_unsafe_prefix(dst_fn);
>> +
>> + 		/* Filter zip entries */
>> + 		if (find_list_entry(zreject, dst_fn)
>> +diff --git a/include/bb_archive.h b/include/bb_archive.h
>> +index e0ef8fc..1dc77f3 100644
>> +--- a/include/bb_archive.h
>> ++++ b/include/bb_archive.h
>> +@@ -202,7 +202,8 @@ char get_header_tar_xz(archive_handle_t *archive_handle) FAST_FUNC;
>> + void seek_by_jump(int fd, off_t amount) FAST_FUNC;
>> + void seek_by_read(int fd, off_t amount) FAST_FUNC;
>> +
>> +-const char *strip_unsafe_prefix(const char *str) FAST_FUNC;
>> ++const char *skip_unsafe_prefix(const char *str) FAST_FUNC;
>> ++void strip_unsafe_prefix(char *str) FAST_FUNC;
>> + void create_or_remember_link(llist_t **link_placeholders,
>> + 		const char *target,
>> + 		const char *linkname,
>> +--
>> +2.50.1
>> +
>> diff --git a/meta/recipes-core/busybox/busybox_1.35.0.bb b/meta/recipes-core/busybox/busybox_1.35.0.bb
>> index 0b5ac220f5..bb07502ccc 100644
>> --- a/meta/recipes-core/busybox/busybox_1.35.0.bb
>> +++ b/meta/recipes-core/busybox/busybox_1.35.0.bb
>> @@ -62,6 +62,8 @@ SRC_URI ="https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \ 
>> file://CVE-2025-46394-01.patch \ file://CVE-2025-46394-02.patch \ 
>> file://CVE-2025-60876.patch \ + 
>> file://CVE-2026-26157-CVE-2026-26158-01.patch \ + 
>> file://CVE-2026-26157-CVE-2026-26158-02.patch \ "
>>   SRC_URI:append:libc-musl =" file://musl.cfg "
>>   
> Hi Hitendra,
>
> I'm working with Yoann, helping him to support the maintenance of
> the stable branches.
>
> Thanks for the patch. Indeed, since the Busybox CVE handling is indeed slow,
> following Debian is acceptable. However, there are a few issues that need to
> be addressed before this can be merged:
>
> In the patch metadata (Upstream-Status / Backport):
> - Source URL: Please use the official upstream repository (git.busybox.net,
> which I'm aware is littlebit downish) instead of the GitHub mirror.
> - Commit Reference: The Debian patches you cited do not actually backport
> the commit 3fb6b31c716669e12f75a2accd31bb7685b1a1cb as claimed in the status.
> Seems that the first one is actually a backport of
> 599f5dd8fac390c18b79cba4c14c334957605dae, recently merged in busybox master.
>
> Please clarify the "Upstream-Status" to reflect exactly
> what these patches represent.
>
> The first patch (01.patch) fails to apply on the current Kirkstone
> busybox_1.35.0 recipe:
>
> ERROR: busybox-1.35.0-r0 do_patch:
> Applying patch 'CVE-2026-26157-CVE-2026-26158-01.patch'
> patching file archival/libarchive/get_header_tar.c
> Hunk #1 FAILED at 453.
> 1 out of 1 hunk FAILED -- rejects in file archival/libarchive/get_header_tar.c
>
> Please ensure the patches are rebased and tested against
> the kirkstone branch of openembedded-core.
>
> Best regards,
>
-- 
Regards,
Hitendra Prajapati
MontaVista Software LLC
Mo: +91 9998906483
--------------sFA7waYp1JfWgqtpo0loe6VD
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><font size="2">Hi Team,</font></p>
    <p><font size="2">I'm not able to load the official busybox repo
        form last week, so I used mirror.</font></p>
    <p><font size="2">If anyone have access, they may try to fix this or
        I will look into these later.</font></p>
    <p><font size="2">Regards,</font></p>
    <p><font size="2">Hitendra <br>
      </font></p>
    <div class="moz-cite-prefix">On 19/03/26 4:35 pm, Fabien Thomas
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:DH6PK2HKFZEL.OW09CNJ5IJ15@smile.fr">
      <pre class="moz-quote-pre" wrap="">On Fri Mar 13, 2026 at 2:18 PM CET, Hitendra Prajapati via lists.openembedded.org wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Although the patch was not merged yet, Debian already took it ([1] &amp; [2]).
Since busybox CVE handling is slow, follow Debian decision.

[1] <a class="moz-txt-link-freetext" href="https://sources.debian.org/src/busybox/1:1.37.0-10.1/debian/patches/0001-tar-strip-unsafe-hardlink-components-GNU-tar-does-th.patch">https://sources.debian.org/src/busybox/1:1.37.0-10.1/debian/patches/0001-tar-strip-unsafe-hardlink-components-GNU-tar-does-th.patch</a>
[2] <a class="moz-txt-link-freetext" href="https://sources.debian.org/src/busybox/1:1.37.0-10.1/debian/patches/0002-tar-only-strip-unsafe-components-from-hardlinks-not-.patch">https://sources.debian.org/src/busybox/1:1.37.0-10.1/debian/patches/0002-tar-only-strip-unsafe-components-from-hardlinks-not-.patch</a>

Signed-off-by: Hitendra Prajapati <a class="moz-txt-link-rfc2396E" href="mailto:hprajapati@mvista.com">&lt;hprajapati@mvista.com&gt;</a>
---
 .../CVE-2026-26157-CVE-2026-26158-01.patch    |  35 ++++
 .../CVE-2026-26157-CVE-2026-26158-02.patch    | 197 ++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.35.0.bb   |   2 +
 3 files changed, 234 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2026-26157-CVE-2026-26158-01.patch
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2026-26157-CVE-2026-26158-02.patch

diff --git a/meta/recipes-core/busybox/busybox/CVE-2026-26157-CVE-2026-26158-01.patch b/meta/recipes-core/busybox/busybox/CVE-2026-26157-CVE-2026-26158-01.patch
new file mode 100644
index 0000000000..306ccad511
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/CVE-2026-26157-CVE-2026-26158-01.patch
@@ -0,0 +1,35 @@
+From 038e0e4d791ea4e8a8da5e06904756142fc6b8dc Mon Sep 17 00:00:00 2001
+From: Radoslav Kolev <a class="moz-txt-link-rfc2396E" href="mailto:radoslav.kolev@suse.com">&lt;radoslav.kolev@suse.com&gt;</a>
+Date: Mon, 16 Feb 2026 11:50:04 +0200
+Subject: tar: only strip unsafe components from hardlinks, not symlinks
+
+commit 3fb6b31c7 introduced a check for unsafe components in
+tar archive hardlinks, but it was being applied to symlinks too
+which broke "Symlinks and hardlinks coexist" tar test.
+
+Signed-off-by: Radoslav Kolev <a class="moz-txt-link-rfc2396E" href="mailto:radoslav.kolev@suse.com">&lt;radoslav.kolev@suse.com&gt;</a>
+Signed-off-by: Denys Vlasenko <a class="moz-txt-link-rfc2396E" href="mailto:vda.linux@googlemail.com">&lt;vda.linux@googlemail.com&gt;</a>
+
+CVE: CVE-2026-26157, CVE-2026-26158 
+Upstream-Status: Backport [<a class="moz-txt-link-freetext" href="https://github.com/mirror/busybox/commit/3fb6b31c716669e12f75a2accd31bb7685b1a1cb">https://github.com/mirror/busybox/commit/3fb6b31c716669e12f75a2accd31bb7685b1a1cb</a>]
+Signed-off-by: Hitendra Prajapati <a class="moz-txt-link-rfc2396E" href="mailto:hprajapati@mvista.com">&lt;hprajapati@mvista.com&gt;</a>
+---
+ archival/libarchive/get_header_tar.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/archival/libarchive/get_header_tar.c b/archival/libarchive/get_header_tar.c
+index dc0f7e0..a8c2ad8 100644
+--- a/archival/libarchive/get_header_tar.c
++++ b/archival/libarchive/get_header_tar.c
+@@ -453,7 +453,7 @@ char FAST_FUNC get_header_tar(archive_handle_t *archive_handle)
+ 
+ 	/* Everything up to and including last ".." component is stripped */
+ 	strip_unsafe_prefix(file_header-&gt;name);
+-	if (file_header-&gt;link_target) {
++	if (file_header-&gt;link_target &amp;&amp; !S_ISLNK(file_header-&gt;mode)) {
+ 		/* GNU tar 1.34 examples:
+ 		 * tar: Removing leading '/' from hard link targets
+ 		 * tar: Removing leading '../' from hard link targets
+-- 
+2.50.1
+
diff --git a/meta/recipes-core/busybox/busybox/CVE-2026-26157-CVE-2026-26158-02.patch b/meta/recipes-core/busybox/busybox/CVE-2026-26157-CVE-2026-26158-02.patch
new file mode 100644
index 0000000000..69e6e98c75
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/CVE-2026-26157-CVE-2026-26158-02.patch
@@ -0,0 +1,197 @@
+From 0c20d6b353b058ab910dd3a0211e2b906802b105 Mon Sep 17 00:00:00 2001
+From: Denys Vlasenko <a class="moz-txt-link-rfc2396E" href="mailto:vda.linux@googlemail.com">&lt;vda.linux@googlemail.com&gt;</a>
+Date: Thu, 29 Jan 2026 11:48:02 +0100
+Subject: tar: strip unsafe hardlink components - GNU tar does the same
+
+Defends against files like these (python reproducer):
+
+import tarfile
+ti = tarfile.TarInfo("leak_hosts")
+ti.type = tarfile.LNKTYPE
+ti.linkname = "/etc/hosts"  # or "../etc/hosts" or ".."
+ti.size = 0
+with tarfile.open("/tmp/hardlink.tar", "w") as t:
+	t.addfile(ti)
+
+function                                             old     new   delta
+skip_unsafe_prefix                                     -     127    +127
+get_header_tar                                      1752    1754      +2
+.rodata                                           106861  106856      -5
+unzip_main                                          2715    2706      -9
+strip_unsafe_prefix                                  102      18     -84
+------------------------------------------------------------------------------
+(add/remove: 1/0 grow/shrink: 1/3 up/down: 129/-98)            Total: 31 bytes
+
+Signed-off-by: Denys Vlasenko <a class="moz-txt-link-rfc2396E" href="mailto:vda.linux@googlemail.com">&lt;vda.linux@googlemail.com&gt;</a>
+
+CVE: CVE-2026-26157, CVE-2026-26158 
+Upstream-Status: Backport [<a class="moz-txt-link-freetext" href="https://github.com/mirror/busybox/commit/3fb6b31c716669e12f75a2accd31bb7685b1a1cb">https://github.com/mirror/busybox/commit/3fb6b31c716669e12f75a2accd31bb7685b1a1cb</a>]
+Signed-off-by: Hitendra Prajapati <a class="moz-txt-link-rfc2396E" href="mailto:hprajapati@mvista.com">&lt;hprajapati@mvista.com&gt;</a>
+---
+ .../archival/libarchive/data_extract_all.c    |  7 ++---
+ .../archival/libarchive/get_header_tar.c      | 11 +++++--
+ .../archival/libarchive/unsafe_prefix.c       | 30 +++++++++++++++----
+ .../libarchive/unsafe_symlink_target.c        |  1 +
+ archival/tar.c                 |  2 +-
+ archival/unzip.c               |  2 +-
+ include/bb_archive.h           |  3 +-
+ 7 files changed, 42 insertions(+), 14 deletions(-)
+
+diff --git a/archival/libarchive/data_extract_all.c b/archival/libarchive/data_extract_all.c
+index 8a69711..b84b960 100644
+--- a/archival/libarchive/data_extract_all.c
++++ b/archival/libarchive/data_extract_all.c
+@@ -66,8 +66,8 @@ void FAST_FUNC data_extract_all(archive_handle_t *archive_handle)
+ 	}
+ #endif
+ #if ENABLE_FEATURE_PATH_TRAVERSAL_PROTECTION
+-	/* Strip leading "/" and up to last "/../" path component */
+-	dst_name = (char *)strip_unsafe_prefix(dst_name);
++	/* Skip leading "/" and past last ".." path component */
++	dst_name = (char *)skip_unsafe_prefix(dst_name);
+ #endif
+ // ^^^ This may be a problem if some applets do need to extract absolute names.
+ // (Probably will need to invent ARCHIVE_ALLOW_UNSAFE_NAME flag).
+@@ -185,8 +185,7 @@ void FAST_FUNC data_extract_all(archive_handle_t *archive_handle)
+ 
+ 		/* To avoid a directory traversal attack via symlinks,
+ 		 * do not restore symlinks with ".." components
+-		 * or symlinks starting with "/", unless a magic
+-		 * envvar is set.
++		 * or symlinks starting with "/"
+ 		 *
+ 		 * For example, consider a .tar created via:
+ 		 *  $ tar cvf bug.tar anything.txt
+diff --git a/archival/libarchive/get_header_tar.c b/archival/libarchive/get_header_tar.c
+index d26868b..dc0f7e0 100644
+--- a/archival/libarchive/get_header_tar.c
++++ b/archival/libarchive/get_header_tar.c
+@@ -452,8 +452,15 @@ char FAST_FUNC get_header_tar(archive_handle_t *archive_handle)
+ #endif
+ 
+ 	/* Everything up to and including last ".." component is stripped */
+-	overlapping_strcpy(file_header-&gt;name, strip_unsafe_prefix(file_header-&gt;name));
+-//TODO: do the same for file_header-&gt;link_target?
++	strip_unsafe_prefix(file_header-&gt;name);
++	if (file_header-&gt;link_target) {
++		/* GNU tar 1.34 examples:
++		 * tar: Removing leading '/' from hard link targets
++		 * tar: Removing leading '../' from hard link targets
++		 * tar: Removing leading 'etc/../' from hard link targets
++		 */
++		strip_unsafe_prefix(file_header-&gt;link_target);
++	}
+ 
+ 	/* Strip trailing '/' in directories */
+ 	/* Must be done after mode is set as '/' is used to check if it's a directory */
+diff --git a/archival/libarchive/unsafe_prefix.c b/archival/libarchive/unsafe_prefix.c
+index 6670811..89a371a 100644
+--- a/archival/libarchive/unsafe_prefix.c
++++ b/archival/libarchive/unsafe_prefix.c
+@@ -5,11 +5,11 @@
+ #include "libbb.h"
+ #include "bb_archive.h"
+ 
+-const char* FAST_FUNC strip_unsafe_prefix(const char *str)
++const char* FAST_FUNC skip_unsafe_prefix(const char *str)
+ {
+ 	const char *cp = str;
+ 	while (1) {
+-		char *cp2;
++		const char *cp2;
+ 		if (*cp == '/') {
+ 			cp++;
+ 			continue;
+@@ -22,10 +22,25 @@ const char* FAST_FUNC strip_unsafe_prefix(const char *str)
+ 			cp += 3;
+ 			continue;
+ 		}
+-		cp2 = strstr(cp, "/../");
++		cp2 = cp;
++ find_dotdot:
++		cp2 = strstr(cp2, "/..");
+ 		if (!cp2)
+-			break;
+-		cp = cp2 + 4;
++			break; /* No (more) malicious components */
++
++		/* We found "/..something" */
++		cp2 += 3;
++		if (*cp2 != '/') {
++			if (*cp2 == '\0') {
++				/* Trailing "/..": malicious, return "" */
++				/* (causes harmless errors trying to create or hardlink a file named "") */
++				return cp2;
++			}
++			/* "/..name" is not malicious, look for next "/.." */
++			goto find_dotdot;
++		}
++		/* Found "/../": malicious, advance past it */
++		cp = cp2 + 1;
+ 	}
+ 	if (cp != str) {
+ 		static smallint warned = 0;
+@@ -37,3 +52,8 @@ const char* FAST_FUNC strip_unsafe_prefix(const char *str)
+ 	}
+ 	return cp;
+ }
++
++void FAST_FUNC strip_unsafe_prefix(char *str)
++{
++	overlapping_strcpy(str, skip_unsafe_prefix(str));
++}
+diff --git a/archival/libarchive/unsafe_symlink_target.c b/archival/libarchive/unsafe_symlink_target.c
+index f8dc803..d764c89 100644
+--- a/archival/libarchive/unsafe_symlink_target.c
++++ b/archival/libarchive/unsafe_symlink_target.c
+@@ -36,6 +36,7 @@ void FAST_FUNC create_links_from_list(llist_t *list)
+ 				*list-&gt;data ? "hard" : "sym",
+ 				list-&gt;data + 1, target
+ 			);
++			/* Note: GNU tar 1.34 errors out only _after_ all links are (attempted to be) created */
+ 		}
+ 		list = list-&gt;link;
+ 	}
+diff --git a/archival/tar.c b/archival/tar.c
+index 9de3759..cf8c2d1 100644
+--- a/archival/tar.c
++++ b/archival/tar.c
+@@ -475,7 +475,7 @@ static int FAST_FUNC writeFileToTarball(struct recursive_state *state,
+ 	DBG("writeFileToTarball('%s')", fileName);
+ 
+ 	/* Strip leading '/' and such (must be before memorizing hardlink's name) */
+-	header_name = strip_unsafe_prefix(fileName);
++	header_name = skip_unsafe_prefix(fileName);
+ 
+ 	if (header_name[0] == '\0')
+ 		return TRUE;
+diff --git a/archival/unzip.c b/archival/unzip.c
+index fc92ac6..7b29d77 100644
+--- a/archival/unzip.c
++++ b/archival/unzip.c
+@@ -842,7 +842,7 @@ int unzip_main(int argc, char **argv)
+ 		unzip_skip(zip.fmt.extra_len);
+ 
+ 		/* Guard against "/abspath", "/../" and similar attacks */
+-		overlapping_strcpy(dst_fn, strip_unsafe_prefix(dst_fn));
++		strip_unsafe_prefix(dst_fn);
+ 
+ 		/* Filter zip entries */
+ 		if (find_list_entry(zreject, dst_fn)
+diff --git a/include/bb_archive.h b/include/bb_archive.h
+index e0ef8fc..1dc77f3 100644
+--- a/include/bb_archive.h
++++ b/include/bb_archive.h
+@@ -202,7 +202,8 @@ char get_header_tar_xz(archive_handle_t *archive_handle) FAST_FUNC;
+ void seek_by_jump(int fd, off_t amount) FAST_FUNC;
+ void seek_by_read(int fd, off_t amount) FAST_FUNC;
+ 
+-const char *strip_unsafe_prefix(const char *str) FAST_FUNC;
++const char *skip_unsafe_prefix(const char *str) FAST_FUNC;
++void strip_unsafe_prefix(char *str) FAST_FUNC;
+ void create_or_remember_link(llist_t **link_placeholders,
+ 		const char *target,
+ 		const char *linkname,
+-- 
+2.50.1
+
diff --git a/meta/recipes-core/busybox/busybox_1.35.0.bb b/meta/recipes-core/busybox/busybox_1.35.0.bb
index 0b5ac220f5..bb07502ccc 100644
--- a/meta/recipes-core/busybox/busybox_1.35.0.bb
+++ b/meta/recipes-core/busybox/busybox_1.35.0.bb
@@ -62,6 +62,8 @@ SRC_URI = <a class="moz-txt-link-rfc2396E" href="https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball\file://CVE-2025-46394-01.patch\file://CVE-2025-46394-02.patch\file://CVE-2025-60876.patch\+file://CVE-2026-26157-CVE-2026-26158-01.patch\+file://CVE-2026-26157-CVE-2026-26158-02.patch\">"https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://CVE-2025-46394-01.patch \
            file://CVE-2025-46394-02.patch \
            file://CVE-2025-60876.patch \
+           file://CVE-2026-26157-CVE-2026-26158-01.patch \
+           file://CVE-2026-26157-CVE-2026-26158-02.patch \
            "</a>
 SRC_URI:append:libc-musl = <a class="moz-txt-link-rfc2396E" href="file://musl.cfg">" file://musl.cfg "</a>
 
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Hi Hitendra,

I'm working with Yoann, helping him to support the maintenance of 
the stable branches.

Thanks for the patch. Indeed, since the Busybox CVE handling is indeed slow, 
following Debian is acceptable. However, there are a few issues that need to 
be addressed before this can be merged:

In the patch metadata (Upstream-Status / Backport):
- Source URL: Please use the official upstream repository (git.busybox.net, 
which I'm aware is littlebit downish) instead of the GitHub mirror.
- Commit Reference: The Debian patches you cited do not actually backport 
the commit 3fb6b31c716669e12f75a2accd31bb7685b1a1cb as claimed in the status. 
Seems that the first one is actually a backport of 
599f5dd8fac390c18b79cba4c14c334957605dae, recently merged in busybox master.

Please clarify the "Upstream-Status" to reflect exactly 
what these patches represent.

The first patch (01.patch) fails to apply on the current Kirkstone 
busybox_1.35.0 recipe:

ERROR: busybox-1.35.0-r0 do_patch: 
Applying patch 'CVE-2026-26157-CVE-2026-26158-01.patch'
patching file archival/libarchive/get_header_tar.c
Hunk #1 FAILED at 453.
1 out of 1 hunk FAILED -- rejects in file archival/libarchive/get_header_tar.c

Please ensure the patches are rebased and tested against 
the kirkstone branch of openembedded-core.

Best regards,

</pre>
    </blockquote>
    <div class="moz-signature">-- <br>
      <font color="#0000FF">
        Regards,<br>
        Hitendra Prajapati<br>
        MontaVista Software LLC<br>
        Mo: +91 9998906483 <br>
      </font></div>
  </body>
</html>

--------------sFA7waYp1JfWgqtpo0loe6VD--

