Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 211F8C00140
	for <webhook@archiver.kernel.org>; Mon, 15 Aug 2022 14:25:31 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web12.2696.1660573528312629335
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Aug 2022 07:25:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=I7vt9B4A;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id s23so3909833wmj.4
        for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Aug 2022 07:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc;
        bh=9U5RLUivVrWnbTwzJqKfI92Pte/Jx+0UPlfbhlEptJM=;
        b=I7vt9B4ATxHgtDnQP1vnroapOefqDIDiLaeDfVWqzzgxi7c2KjMaplkx4TEP4JLwtI
         ZT1/QTpcFkX0TEAu35rWWHwbqIDvlglkPuzPdKo7D4+mOczadagGi/aXphjafhEjcAwe
         fTZfAJc92eWVqTa1ZqwAgNoIUqE+bxz5fLM5Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc;
        bh=9U5RLUivVrWnbTwzJqKfI92Pte/Jx+0UPlfbhlEptJM=;
        b=yNsbBb9bchqZ2MHKWbxtSy+VI+9QmKHkh2VPKBGPcL1jFxT3zU/u5ZOjSbr/Uhax/F
         XtlSZ0EtOLDJ+CxJJx3W0NNG24QNx+x7gj9x62yr4RgP58pb7SIwpCJR+ddcKIZVKyH6
         mzAg/wT6hlnvv3ZB8DAryA2jm5fIg4IjZ3PG82oNiXiSpd0qewLzxg+Irbf5We3wFNEQ
         klM1gi87T3fNXauUXL6nx02G60suK7xRvHmoDAQZJjmGqk41pjMVg4z2xuEiJdtxg9ie
         cAAjaCrQ+m0Rky0CG41kpvHyvtJmSbV0Xs3NOjymrcLTbMcHQENHGtvCqhl9Q0q8iKSC
         zS9g==
X-Gm-Message-State: ACgBeo3UKjW14z1ZfYFP12cA7m89cS8iItt7UHuQurUoRPw3ijTl4zLT
	fFfq2E8L6ytepFHAB2LBttX48YmTWEpCXA==
X-Google-Smtp-Source: 
 AA6agR7YNX9j/PQRfHgKqdJG38ztghkWbmJkFpVrq1lJId32hQftx4hUY11+OeYuSrX0KQlby/GO4g==
X-Received: by 2002:a05:600c:3b9f:b0:3a5:45d9:8a69 with SMTP id
 n31-20020a05600c3b9f00b003a545d98a69mr16450054wms.186.1660573526282;
        Mon, 15 Aug 2022 07:25:26 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:27d9:5f4a:b4:2f81])
        by smtp.gmail.com with ESMTPSA id
 m20-20020a05600c3b1400b003a319b67f64sm15188260wms.0.2022.08.15.07.25.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Aug 2022 07:25:25 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] gcc: Resolve relative prefix-map filenames
Date: Mon, 15 Aug 2022 15:25:25 +0100
Message-Id: <20220815142525.1388474-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Aug 2022 14:25:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169353

Add a patch to gcc so that relative paths are handled by -fdebug-prefix-map
and friends. In OE we use relative paths in autotools and removing that
creates a lot of issues we'd have to fix. This alternative allows us to
fix the paths within gcc and improve our debug file coverage (and SPDX
manifests) accordingly.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/gcc/gcc-12.1.inc        |  1 +
 .../gcc/gcc/prefix-map-realpath.patch         | 59 +++++++++++++++++++
 2 files changed, 60 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc/prefix-map-realpath.patch

v2: Disable prefix remapping in directives such as #include

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
index 00000000000..6bad565ddef
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/prefix-map-realpath.patch
@@ -0,0 +1,59 @@
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
+@@ -70,19 +70,25 @@ remap_filename (file_prefix_map *maps, c
+   file_prefix_map *map;
+   char *s;
+   const char *name;
++  char *realname;
+   size_t name_len;
+ 
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


