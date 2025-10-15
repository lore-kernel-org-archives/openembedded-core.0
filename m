Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC0B2CCD185
	for <webhook@archiver.kernel.org>; Wed, 15 Oct 2025 16:56:14 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.23121.1760547366219175240
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Oct 2025 09:56:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bxiVZSGD;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3f0ae439b56so4201221f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Oct 2025 09:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1760547364; x=1761152164; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=P7pT5AdzsHmke0psFmTevFw7yM0gBmcWpraNzlk1VSc=;
        b=bxiVZSGDtGolJo2Zx6fkrUUIjCXwcHMZWU+zYQXClWZOooUk1qyHQxwgEfN9h/P0sA
         AdbeVuYWd6TGnGZAbNzlpSlF6TFC0KwiZC3dCIPrFyIX/FkhLBmRDlx6CRQTdZOBPy83
         OpD1UINqnkSDFH2guqKMlY2OG6nhF9zz3ozQA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760547364; x=1761152164;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P7pT5AdzsHmke0psFmTevFw7yM0gBmcWpraNzlk1VSc=;
        b=p8ld6djOVCDhYO7IVxIfVcqyo8mk50JnrgahtnZiIKI3wMnoyD7gjM3q3p43tNV9zI
         V4wX+Ld7V4m0Tn8XR8GhQ8tLQoW4mSo+ozIZP/s1FYEJ7ukZS5RSR7NoggJkS9I5vu8K
         HjR56D3wA8X0yBypTbp+ZiIPCzIJ4NcdSwmhU2KeR+PVlZNAtshXkd6dQeJXSAqn4/uU
         f3Y8j7meLNuGwMGbHM0Yy8b/DZPUK40OTWap6bQsGH05kPX7VKsq8omhwpAWuVWTIFaf
         7fZ5Ngrlu0fYQzliwogBCko9GffkG0a2mu47MQmQOVZJTSWddM5Rua6k6DEsF4ljuAO5
         7TUg==
X-Gm-Message-State: AOJu0YzIHd7LXOrhLdsbrZdtU9deSEfDIiYIRpZhJZAw9UQrUzbriYCJ
	fi+r+KUZnRcdZ4QiyvckyVVYMyfxJztuIS7FCkfaIkBKSaZsftFMbjN58YXc042Tjcp3xI6wT8t
	i3/Ll
X-Gm-Gg: ASbGncu02UvujWaQr+KBoC0h/JOogev/2HYIIovt5wHm6A0w5V6gXId56kRsQmRURru
	gRU9kueXzPrdX1+wFJQ5PkQTNQMIOboqAYgI9lQe1EF8SgKFL5VBaJMELu/3J+wC3k8JUHLXMrG
	uGl8yqKJnUWYFqOdE45FMOOGOWCVbM3wIljPitXqfTB5aei8YaWuLAUSGxhLVXTIEblqaHyxZMw
	p7OjTGaXo/tDz3+l6whOJuJoc96Bn3bjU75MWv8i/41soavHF6LTOZmJfofjm/Yq5y01CSm5kH5
	cQyPU3wGMW0XE1OHniv3nW4YEn0LwBeZX+Z5x/MhPz65LDtdpMocC+oanKrHQQLdqgsjwaiRWyS
	OHvZl3dfnz+o4UYcsXAeKwuMxUrX1mwDLDNqpc1wxgnQOQ8Cdkuy0wmkXI0dxtWqj9nCP
X-Google-Smtp-Source: AGHT+IH4tW872Cf1lPJxOztYA+QArlTCzd/Is+6Mw7TQzDKvObAwYnBDHIjrcxXhqJ1VdhBtXTMBSw==
X-Received: by 2002:a05:6000:240a:b0:406:87ba:997c with SMTP id ffacd0b85a97d-4266e7df82fmr19056801f8f.40.1760547363926;
        Wed, 15 Oct 2025 09:56:03 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:ce79:b94c:542e:d1d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fb489af92sm339177545e9.17.2025.10.15.09.56.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 09:56:02 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] patchelf: Update 0.18.0 -> 0.18.0+git
Date: Wed, 15 Oct 2025 17:56:01 +0100
Message-ID: <20251015165601.848365-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Oct 2025 16:56:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224900

Patchelf hasn't released since 2023 but does have fixes on its master branch. We've been
seeing segfaults on relocated qemu-img binaries from qemu-system-native in some cases
and using an updated patchelf does seem to avoid these.

The patches have all be applied upstream.

https://github.com/NixOS/patchelf/commit/0e338941fc730c1e7080ca04fc1ee18b9ae2854b is 2/3 combined

License-Update: Change http -> https
[https://github.com/NixOS/patchelf/commit/30da44915ec3d22e27dad457dd585e985f576986]

[YOCTO #16003]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...-Set-interpreter-only-when-necessary.patch | 31 --------------
 ...t-with-p_align-instead-of-pagesize-f.patch | 42 -------------------
 ...t-extensions-based-on-p_align-instea.patch | 32 --------------
 .../{patchelf_0.18.0.bb => patchelf_git.bb}   |  9 ++--
 4 files changed, 4 insertions(+), 110 deletions(-)
 delete mode 100644 meta/recipes-devtools/patchelf/patchelf/0001-Set-interpreter-only-when-necessary.patch
 delete mode 100644 meta/recipes-devtools/patchelf/patchelf/0002-align-startOffset-with-p_align-instead-of-pagesize-f.patch
 delete mode 100644 meta/recipes-devtools/patchelf/patchelf/0003-make-LOAD-segment-extensions-based-on-p_align-instea.patch
 rename meta/recipes-devtools/patchelf/{patchelf_0.18.0.bb => patchelf_git.bb} (58%)

diff --git a/meta/recipes-devtools/patchelf/patchelf/0001-Set-interpreter-only-when-necessary.patch b/meta/recipes-devtools/patchelf/patchelf/0001-Set-interpreter-only-when-necessary.patch
deleted file mode 100644
index 9a8216b3fe3..00000000000
--- a/meta/recipes-devtools/patchelf/patchelf/0001-Set-interpreter-only-when-necessary.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From f5df94952e87eaa390e5c845bc48fdb3dbc31cc2 Mon Sep 17 00:00:00 2001
-From: Yuta Hayama <hayama@lineo.co.jp>
-Date: Fri, 21 Jul 2023 10:47:02 +0900
-Subject: [PATCH] Set interpreter only when necessary
-
-If the given interpreter is already set, nothing needs to be done.
-As with modifySoname(), it skips unnecessary processing.
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
-Upstream-Status: Submitted [https://github.com/NixOS/patchelf/pull/508]
-
- src/patchelf.cc | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/src/patchelf.cc b/src/patchelf.cc
-index 86429c4..e562c49 100644
---- a/src/patchelf.cc
-+++ b/src/patchelf.cc
-@@ -1460,6 +1460,11 @@ void ElfFile<ElfFileParamNames>::modifySoname(sonameMode op, const std::string &
- template<ElfFileParams>
- void ElfFile<ElfFileParamNames>::setInterpreter(const std::string & newInterpreter)
- {
-+    if (getInterpreter() == newInterpreter) {
-+        debug("given interpreter is already set\n");
-+        return;
-+    }
-+
-     std::string & section = replaceSection(".interp", newInterpreter.size() + 1);
-     setSubstr(section, 0, newInterpreter + '\0');
-     changed = true;
diff --git a/meta/recipes-devtools/patchelf/patchelf/0002-align-startOffset-with-p_align-instead-of-pagesize-f.patch b/meta/recipes-devtools/patchelf/patchelf/0002-align-startOffset-with-p_align-instead-of-pagesize-f.patch
deleted file mode 100644
index 7906f0f73b4..00000000000
--- a/meta/recipes-devtools/patchelf/patchelf/0002-align-startOffset-with-p_align-instead-of-pagesize-f.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 1198329b922f3cdddc3e87a7c81d7730b646c088 Mon Sep 17 00:00:00 2001
-From: Yuta Hayama <hayama@lineo.co.jp>
-Date: Fri, 28 Jul 2023 16:22:31 +0900
-Subject: [PATCH] align startOffset with p_align instead of pagesize for
- compatibility
-
-According to the ELF specification, the alignment of loadable process segments
-should satisfy (p_vaddr mod pagesize) == (p_offset mod pagesize). However,
-glibc earlier than 2.35 incorrectly requires that the LOAD segment be (p_vaddr
-mod p_align) == (p_offset mod p_align), and will output the error message
-"ELF load command address/offset not properly aligned" if this is not met.
-
-Since there are many systems that use glibc earlier than 2.35, it is preferable
-that newly added LOAD segments satisfy (p_vaddr mod p_align) == (p_offset mod
-p_align) for compatibility.
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
-Upstream-Status: Submitted [https://github.com/NixOS/patchelf/pull/510]
-
- src/patchelf.cc | 8 +++++++-
- 1 file changed, 7 insertions(+), 1 deletion(-)
-
-diff --git a/src/patchelf.cc b/src/patchelf.cc
-index 82b4b46..6edb81a 100644
---- a/src/patchelf.cc
-+++ b/src/patchelf.cc
-@@ -843,7 +843,13 @@ void ElfFile<ElfFileParamNames>::rewriteSectionsLibrary()
-         neededSpace += headerTableSpace;
-     debug("needed space is %d\n", neededSpace);
- 
--    Elf_Off startOffset = roundUp(fileContents->size(), getPageSize());
-+    /* glibc earlier than 2.35 requires that the LOAD segment satisfies
-+       (p_vaddr mod p_align) == (p_offset mod p_align).
-+       The ELF specification requires that loadable process segments satisfy
-+       (p_vaddr mod pagesize) == (p_offset mod pagesize), so glibc is probably
-+       wrong, but here startOffset is calculated according to p_align for
-+       compatibility. */
-+    Elf_Off startOffset = roundUp(fileContents->size(), alignStartPage);
- 
-     // In older version of binutils (2.30), readelf would check if the dynamic
-     // section segment is strictly smaller than the file (and not same size).
diff --git a/meta/recipes-devtools/patchelf/patchelf/0003-make-LOAD-segment-extensions-based-on-p_align-instea.patch b/meta/recipes-devtools/patchelf/patchelf/0003-make-LOAD-segment-extensions-based-on-p_align-instea.patch
deleted file mode 100644
index 37eaf992d8b..00000000000
--- a/meta/recipes-devtools/patchelf/patchelf/0003-make-LOAD-segment-extensions-based-on-p_align-instea.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 299ad5766921d593e11a42a8e4dec55b4b350876 Mon Sep 17 00:00:00 2001
-From: Yuta Hayama <hayama@lineo.co.jp>
-Date: Mon, 31 Jul 2023 11:58:49 +0900
-Subject: [PATCH] make LOAD segment extensions based on p_align instead of
- pagesize
-
-Since the p_align of the LOAD segment is no longer pagesize, the actual p_align
-value is used to calculate for the LOAD segment extension.
-
-If calculated with pagesize, new LOAD segment may be added even though the
-existing LOAD segment can be extended.
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
-Upstream-Status: Submitted [https://github.com/NixOS/patchelf/pull/510]
-
- src/patchelf.cc | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/patchelf.cc b/src/patchelf.cc
-index 6edb81a..86429c4 100644
---- a/src/patchelf.cc
-+++ b/src/patchelf.cc
-@@ -885,7 +885,7 @@ void ElfFile<ElfFileParamNames>::rewriteSectionsLibrary()
-         rdi(lastSeg.p_type) == PT_LOAD &&
-         rdi(lastSeg.p_flags) == (PF_R | PF_W) &&
-         rdi(lastSeg.p_align) == alignStartPage) {
--        auto segEnd = roundUp(rdi(lastSeg.p_offset) + rdi(lastSeg.p_memsz), getPageSize());
-+        auto segEnd = roundUp(rdi(lastSeg.p_offset) + rdi(lastSeg.p_memsz), alignStartPage);
-         if (segEnd == startOffset) {
-             auto newSz = startOffset + neededSpace - rdi(lastSeg.p_offset);
-             wri(lastSeg.p_filesz, wri(lastSeg.p_memsz, newSz));
diff --git a/meta/recipes-devtools/patchelf/patchelf_0.18.0.bb b/meta/recipes-devtools/patchelf/patchelf_git.bb
similarity index 58%
rename from meta/recipes-devtools/patchelf/patchelf_0.18.0.bb
rename to meta/recipes-devtools/patchelf/patchelf_git.bb
index 6e86ddbde63..daeae961424 100644
--- a/meta/recipes-devtools/patchelf/patchelf_0.18.0.bb
+++ b/meta/recipes-devtools/patchelf/patchelf_git.bb
@@ -5,13 +5,12 @@ HOMEPAGE = "https://github.com/NixOS/patchelf"
 LICENSE = "GPL-3.0-only"
 
 SRC_URI = "git://github.com/NixOS/patchelf;protocol=https;branch=master \
-    file://0001-Set-interpreter-only-when-necessary.patch \
-    file://0002-align-startOffset-with-p_align-instead-of-pagesize-f.patch \
-    file://0003-make-LOAD-segment-extensions-based-on-p_align-instea.patch \
 "
-SRCREV = "99c24238981b7b1084313aca8f5c493bb46f302c"
+SRCREV = "b49de1b3384e7928bf0df9a889fe5a4e7b3fbddf"
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+PV = "0.18.0+git"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=c678957b0c8e964aa6c70fd77641a71e"
 
 inherit autotools
 

