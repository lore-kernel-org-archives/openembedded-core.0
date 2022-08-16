Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91484C32789
	for <webhook@archiver.kernel.org>; Tue, 16 Aug 2022 20:58:00 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web12.21086.1660683473560717094
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Aug 2022 13:57:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MRVYDMrw;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id ba1so3437110wrb.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Aug 2022 13:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=yvlev//svyahMVmySplBImj64OBFTlWR6so0A/v7q6I=;
        b=MRVYDMrw6bPwq9KvoL3ibRmpepycvVYRQNgQZRnH3IPI8D7A4iJSNWJgeZrvEXXmlN
         hvcAd67kHQK9x1UIG7uz7/OCmSFznUf8D0JUXC0wZlEwuTa+qH5LbzHVS//Gl6sckVOL
         ZgAdX50Dv19G08Cgh/KviVcWK6cA40qwpJf9Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=yvlev//svyahMVmySplBImj64OBFTlWR6so0A/v7q6I=;
        b=ZBzwHTKmJ7zhEbHDUYPQcKKgONHmQ1o7U8TzCRB+MnQMasl2sXSscVNYCBiqxaLBG+
         749eIeKrnUPTHLZS6uak09YPAsF1htS+kGaYcm1cMQoxRZlxPT6N8NuTIcMZWwvWFrq/
         28d7s0O+Tm/+MJCwmQxzF2zVTriHjuPsvpb8ZGeWS/5zCezavw8CBZoLzNVAR87G1qyf
         OjeA9q5j4Xapw8FpuC5B5xoMPZUMXpYWpIZBIeCw7BVlmz5bLUZ5FLgbwpb0g+JUoqgP
         v0UGqPKMhu4HOV3OLW6KUPCxX1GJrQhHAudTBYp1cPfpEdpzNzyU6vH5wMWB5ONKsvKp
         GLRQ==
X-Gm-Message-State: ACgBeo3CscKsGd9NQR074v5lFc/5GNnCuoHgBGw8PJLzjJgxkFuoRUPN
	r1aEE+iYLC9qlJ2W7jXqfgG52Oiyz+UHjg==
X-Google-Smtp-Source: 
 AA6agR4NMr5vqEFrPel7B45ZxFKnczZ8YPnezT02ZzelsA/s9iSm1eik3GGNU8ZiHzWLMcDbaE8MfQ==
X-Received: by 2002:adf:fbc7:0:b0:220:6004:18ca with SMTP id
 d7-20020adffbc7000000b00220600418camr12301621wrs.632.1660683471643;
        Tue, 16 Aug 2022 13:57:51 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:3694:2ef4:2932:37d5])
        by smtp.gmail.com with ESMTPSA id
 m18-20020adffa12000000b002250f9abdefsm5349460wrr.117.2022.08.16.13.57.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 13:57:51 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/8] gcc: Resolve relative prefix-map filenames
Date: Tue, 16 Aug 2022 21:57:44 +0100
Message-Id: <20220816205746.1672987-6-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220816205746.1672987-1-richard.purdie@linuxfoundation.org>
References: <20220816205746.1672987-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Aug 2022 20:58:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169460

Add a patch to gcc so that relative paths are handled by -fdebug-prefix-map
and friends. In OE we use relative paths in autotools and removing that
creates a lot of issues we'd have to fix. This alternative allows us to
fix the paths within gcc and improve our debug file coverage (and SPDX
manifests) accordingly.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/gcc/gcc-12.1.inc        |  1 +
 .../gcc/gcc/prefix-map-realpath.patch         | 62 +++++++++++++++++++
 2 files changed, 63 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc/prefix-map-realpath.patch

diff --git a/meta/recipes-devtools/gcc/gcc-12.1.inc b/meta/recipes-devtools/gcc/gcc-12.1.inc
index 56678c78bef..c42fa3d72f0 100644
--- a/meta/recipes-devtools/gcc/gcc-12.1.inc
+++ b/meta/recipes-devtools/gcc/gcc-12.1.inc
@@ -65,6 +65,7 @@ SRC_URI = "${BASEURI} \
            file://0025-Move-sched.h-include-ahead-of-user-headers.patch \
            file://0026-rust-recursion-limit.patch \
            file://0001-libsanitizer-cherry-pick-9cf13067cb5088626ba7-from-u.patch \
+           file://prefix-map-realpath.patch \
 "
 SRC_URI[sha256sum] = "62fd634889f31c02b64af2c468f064b47ad1ca78411c45abe6ac4b5f8dd19c7b"
 
diff --git a/meta/recipes-devtools/gcc/gcc/prefix-map-realpath.patch b/meta/recipes-devtools/gcc/gcc/prefix-map-realpath.patch
new file mode 100644
index 00000000000..3544f61a744
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/prefix-map-realpath.patch
@@ -0,0 +1,62 @@
+Relative paths don't work with -fdebug-prefix-map and friends. This
+can lead to paths which the user wanted to be remapped being missed.
+Setting -fdebug-prefix-map to work with a relative path isn't practical
+either.
+
+Instead, call gcc's realpath function on the incomming path name before
+comparing it with the remapping. This means other issues like symlinks
+are also accounted for and leads to a more consistent remapping experience.
+
+Upstream-Status: Pending [need to see if gcc developers would accept this]
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+
+
+Index: gcc-12.1.0/gcc/file-prefix-map.cc
+===================================================================
+--- gcc-12.1.0.orig/gcc/file-prefix-map.cc
++++ gcc-12.1.0/gcc/file-prefix-map.cc
+@@ -70,19 +70,28 @@ remap_filename (file_prefix_map *maps, c
+   file_prefix_map *map;
+   char *s;
+   const char *name;
++  char *realname;
+   size_t name_len;
+ 
++  if (lbasename (filename) == filename)
++    return filename;
++
++  realname = lrealpath (filename);
++
+   for (map = maps; map; map = map->next)
+-    if (filename_ncmp (filename, map->old_prefix, map->old_len) == 0)
++    if (filename_ncmp (realname, map->old_prefix, map->old_len) == 0)
+       break;
+-  if (!map)
++  if (!map) {
++    free (realname);
+     return filename;
+-  name = filename + map->old_len;
++  }
++  name = realname + map->old_len;
+   name_len = strlen (name) + 1;
+ 
+   s = (char *) ggc_alloc_atomic (name_len + map->new_len);
+   memcpy (s, map->new_prefix, map->new_len);
+   memcpy (s + map->new_len, name, name_len);
++  free (realname);
+   return s;
+ }
+ 
+Index: gcc-12.1.0/libcpp/macro.cc
+===================================================================
+--- gcc-12.1.0.orig/libcpp/macro.cc
++++ gcc-12.1.0/libcpp/macro.cc
+@@ -563,7 +563,7 @@ _cpp_builtin_macro_text (cpp_reader *pfi
+ 	    if (!name)
+ 	      abort ();
+ 	  }
+-	if (pfile->cb.remap_filename)
++	if (pfile->cb.remap_filename && !pfile->state.in_directive)
+ 	  name = pfile->cb.remap_filename (name);
+ 	len = strlen (name);
+ 	buf = _cpp_unaligned_alloc (pfile, len * 2 + 3);
-- 
2.34.1


