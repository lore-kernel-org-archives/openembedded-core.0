Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFE6FCD98F5
	for <webhook@archiver.kernel.org>; Wed, 17 Jun 2026 07:45:39 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10390.1781682333408143559
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jun 2026 00:45:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=DsQooAh1;
 spf=pass (domain: smile.fr, ip: 209.85.221.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4629051c9d1so297266f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2026 00:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781682332; x=1782287132; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IouVVp09Jlsg8uxV+PTeTdWzoCG7dU5Gj/glrdmE42Q=;
        b=DsQooAh13/n6IoepqR/xKf2XL9tHzxKGHE3SiQ8IZdbqHpxx2rzAdW2WbfnO89/x/n
         X8d8PZE9RZQfNotehFCZ7XHZ8Ikz/ctarfdgn7CodHMjA/NcZZnSAQjwofgwohw8K4Zf
         kLifUxKQc80eSNVYqfwhDl4LbbM6fFQfsDaY4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781682332; x=1782287132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IouVVp09Jlsg8uxV+PTeTdWzoCG7dU5Gj/glrdmE42Q=;
        b=CmboVc/5+x9o0cHh9WsUkAoPkCp1Oevg7ERKTeQM98JWsBJdjeqSI4/G9OY6TAzVjW
         JJK8X3bYSu3kfBW00CXKGIHvDWT+zCT2teT8p3+17eG6aDuTdSL4krv9grcZhUXOPuLy
         +zrMHFTJef5FON8g+RLicqRrbpbR25Xe1rekjivD4OKWt4xvSg+rOZp9NOuJMhu6wEpp
         wDX9o/9X/mMZq/tRYg/5TMd8xE/7D0N4vFbG18b1dXvdaHJY1udkUoapYQBZwbCGf4pm
         BBBjstVO8LFp+rhbvg4+1LH+3xEoUaOUVt4R5ueNkw59uzPuvsIXcSvE+Gt7ejTpbWpJ
         NSVQ==
X-Gm-Message-State: AOJu0YyY8lIUGSxwLA0iL66+llHUMQtO/BJ2ohNKwM9qNBjsn7Yak9W5
	HzloOje8B8TR+m4f1qeju4/iGKTo1Qwvk956Sz6fYiOIGweAWZwbzjy4KRZqYW4JTZWFhv7Hjb5
	cFL1B
X-Gm-Gg: AfdE7cniM0Ref6e2/tv4wDCSyUbRAMJIGM4ZCmRyPlpLdtnXdpSkMZtDIIficSDCo3w
	uICBk///wrXfAw1fdzXblixMCPaeZv57L3nxtZMVQ3cTtYPtKyHIf/ziV1lO1u1/6L5xP1MwqP5
	oq/2YMZgVS+Ck6MBWje/aAZisf7aoU4DGYA1laSFIdoWUMdi/jOKw8Bj+7IEnJV/iNezVrnQj5O
	De38XFq/8GQ9RnGC+RF4s+0B5kGB1dzNZD+az7sd4X9krc6GuV1YX186a+xhln26RoKxDs/5Usk
	V8qnem7HT0n260KOB4a8i7wNcmWE8G1Vn9V08BGToYE3IAdrsecOO5UN4dMKt2789mTMwzwDfyf
	lAruRYO39AXBBQOhWbKch+h85EvOReCx6sTvqiZ787nP/JvyD4E0Kgeas6v3cdMHKUl14vIDWnj
	VJAHB6QJyzT4h7KZDHJE/CWqMD8oUf3ox1MBIrNfG8ThDl6ewlOMU9bEIElsAEO2i8AYAKyP3nl
	0OHi7CfHH1sSAWb0A==
X-Received: by 2002:a05:6000:4006:b0:452:8286:86bf with SMTP id ffacd0b85a97d-46235e98b35mr4564827f8f.1.1781682331493;
        Wed, 17 Jun 2026 00:45:31 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00bc19bde07170effe.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:bc19:bde0:7170:effe])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4619b9b7750sm23483215f8f.6.2026.06.17.00.45.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 00:45:31 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 09/30] python3: fix CVE-2026-6100
Date: Wed, 17 Jun 2026 09:44:44 +0200
Message-ID: <0bc9ba624b2fbeff3bf7e2ee4d2858b9c702fca1.1781682189.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1781682189.git.yoann.congal@smile.fr>
References: <cover.1781682189.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2026 07:45:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238991

From: Hitendra Prajapati <hprajapati@mvista.com>

Pick patch from [1] also mentioned at NVD report in [2]

[1] https://github.com/python/cpython/commit/c3cf71c3366fe49acb776a639405c0eea6169c20
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-6100
[3] https://security-tracker.debian.org/tracker/CVE-2026-6100

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../python/python3/CVE-2026-6100.patch        | 75 +++++++++++++++++++
 .../python/python3_3.12.13.bb                 |  1 +
 2 files changed, 76 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2026-6100.patch

diff --git a/meta/recipes-devtools/python/python3/CVE-2026-6100.patch b/meta/recipes-devtools/python/python3/CVE-2026-6100.patch
new file mode 100644
index 00000000000..9084101434b
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/CVE-2026-6100.patch
@@ -0,0 +1,75 @@
+From c3cf71c3366fe49acb776a639405c0eea6169c20 Mon Sep 17 00:00:00 2001
+From: "Miss Islington (bot)"
+ <31488909+miss-islington@users.noreply.github.com>
+Date: Mon, 13 Apr 2026 03:35:24 +0200
+Subject: [PATCH] [3.13] gh-148395: Fix a possible UAF in
+ `{LZMA,BZ2,_Zlib}Decompressor` (GH-148396) (#148479)
+
+gh-148395: Fix a possible UAF in `{LZMA,BZ2,_Zlib}Decompressor` (GH-148396)
+
+Fix dangling input pointer after `MemoryError` in _lzma/_bz2/_ZlibDecompressor.decompress
+(cherry picked from commit 8fc66aef6d7b3ae58f43f5c66f9366cc8cbbfcd2)
+
+Co-authored-by: Stan Ulbrych <stan@python.org>
+
+CVE: CVE-2026-6100
+Upstream-Status: Backport [https://github.com/python/cpython/commit/c3cf71c3366fe49acb776a639405c0eea6169c20]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ .../Security/2026-04-10-16-28-21.gh-issue-148395.kfzm0G.rst  | 5 +++++
+ Modules/_bz2module.c                                         | 1 +
+ Modules/_lzmamodule.c                                        | 1 +
+ Modules/zlibmodule.c                                         | 1 +
+ 4 files changed, 8 insertions(+)
+ create mode 100644 Misc/NEWS.d/next/Security/2026-04-10-16-28-21.gh-issue-148395.kfzm0G.rst
+
+diff --git a/Misc/NEWS.d/next/Security/2026-04-10-16-28-21.gh-issue-148395.kfzm0G.rst b/Misc/NEWS.d/next/Security/2026-04-10-16-28-21.gh-issue-148395.kfzm0G.rst
+new file mode 100644
+index 0000000..9502189
+--- /dev/null
++++ b/Misc/NEWS.d/next/Security/2026-04-10-16-28-21.gh-issue-148395.kfzm0G.rst
+@@ -0,0 +1,5 @@
++Fix a dangling input pointer in :class:`lzma.LZMADecompressor`,
++:class:`bz2.BZ2Decompressor`, and internal :class:`!zlib._ZlibDecompressor`
++when memory allocation fails with :exc:`MemoryError`, which could let a
++subsequent :meth:`!decompress` call read or write through a stale pointer to
++the already-released caller buffer.
+diff --git a/Modules/_bz2module.c b/Modules/_bz2module.c
+index 97bd44b..a732e89 100644
+--- a/Modules/_bz2module.c
++++ b/Modules/_bz2module.c
+@@ -587,6 +587,7 @@ decompress(BZ2Decompressor *d, char *data, size_t len, Py_ssize_t max_length)
+     return result;
+ 
+ error:
++    bzs->next_in = NULL;
+     Py_XDECREF(result);
+     return NULL;
+ }
+diff --git a/Modules/_lzmamodule.c b/Modules/_lzmamodule.c
+index 7bbd656..103a6ef 100644
+--- a/Modules/_lzmamodule.c
++++ b/Modules/_lzmamodule.c
+@@ -1114,6 +1114,7 @@ decompress(Decompressor *d, uint8_t *data, size_t len, Py_ssize_t max_length)
+     return result;
+ 
+ error:
++    lzs->next_in = NULL;
+     Py_XDECREF(result);
+     return NULL;
+ }
+diff --git a/Modules/zlibmodule.c b/Modules/zlibmodule.c
+index f94c57e..9759593 100644
+--- a/Modules/zlibmodule.c
++++ b/Modules/zlibmodule.c
+@@ -1645,6 +1645,7 @@ decompress(ZlibDecompressor *self, uint8_t *data,
+     return result;
+ 
+ error:
++    self->zst.next_in = NULL;
+     Py_XDECREF(result);
+     return NULL;
+ }
+-- 
+2.50.1
+
diff --git a/meta/recipes-devtools/python/python3_3.12.13.bb b/meta/recipes-devtools/python/python3_3.12.13.bb
index da7e3c604e0..4865178572c 100644
--- a/meta/recipes-devtools/python/python3_3.12.13.bb
+++ b/meta/recipes-devtools/python/python3_3.12.13.bb
@@ -35,6 +35,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
 	   file://0001-test_active_children-skip-problematic-test.patch \
            file://0001-test_readline-skip-limited-history-test.patch \
            file://CVE-2026-1502.patch \
+           file://CVE-2026-6100.patch \
            "
 
 SRC_URI:append:class-native = " \

