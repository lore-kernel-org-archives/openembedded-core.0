Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66B0DFF8875
	for <webhook@archiver.kernel.org>; Wed, 29 Apr 2026 12:29:12 +0000 (UTC)
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10083.1777465751244193520
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Apr 2026 05:29:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=OX/0HyP2;
 spf=pass (domain: mvista.com, ip: 74.125.82.43, mailfrom: hprajapati@mvista.com)
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-12dbd0f8063so2381413c88.0
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2026 05:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1777465750; x=1778070550; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pzO9ZrywLbdZc45ZvmOV3PUmNcwFXetTDFWrQeSX+6g=;
        b=OX/0HyP2aTCnAPhF0xfyN311dwtvK26uctKFN/Jq7W2ns4mvcdKCwp0IryskopQxZM
         AxPsBDysLrYILh84J2RwLYJPK5Miq3d1MRp6Ty1xTOV2t9FhOCcMb7OB6nBG0luRcamM
         bNPJbunBvQVHRaBwMWXLNxoafXBAh6lIcJvDQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777465750; x=1778070550;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pzO9ZrywLbdZc45ZvmOV3PUmNcwFXetTDFWrQeSX+6g=;
        b=VBHRgv7QaRo1UTqyyrRmy4Gi5dHz5hnmt9+v/K6EUf0qok+NBZcQoAwroS+VKyBmwi
         bHHF+JQ7xAztDrcpCRzmr2laxLzEBm1A2ZhbR5TU3zoupovgEG7AT4uIBCi3xeFZHOQL
         Z17KqCTnQbPl3W6FHYVwN09Kb0QroEiRWDtBnpp89Z+YMCYb6i0ZKv8AHTEZjuFxwp1v
         o16nNcfXaPmiTKFptKpGa7aoqG1404rxsEqoB+snPSJ0h69utpPioBOZ8uRqw1XKb0u2
         Lo+UDajCF4lVE9USYjWFaYiYzJs5C7e+tyYj7xMJUG1RKIA1md8WjG5nBXpeUvCHBBQt
         nUdQ==
X-Gm-Message-State: AOJu0Yz1Wofz1O2YNGqB2L7XwStwu5ThyRB9GxES0JddI5z1Uzbtp/DT
	wMW/R5caIRgH1FLdyWZUd1GbLQgyo05EmexFYWRJ9o68i7jUq8lcwxZTzkeXco8ndHV4ZemnfSI
	0XuPF
X-Gm-Gg: AeBDieti13Fyc+55/H6xTtAmPwVCxEGNwxCAqP8e8Uf38jP7BV1NV6ssdj84Fs+6k/7
	W2TCwJ5tRXnYADI5JJ6uLQkTdcXKHM+7Hhgn5Gd9eOnxqwa7fkg9ZPlkcTlMz6cFnZwMr6FwOc0
	FSdts3kCtgWzE0tm0Vs3AP0JKgqnVhyYdWx2hrHVLRwLx2iC+Fqz1vGo14G7EDcmitI7X5zNRpQ
	5b2u7HwKniPqsJNDnEx4DGwyEGhw2JUS/gH+goVE8T1c2e623UHGEDCEvPe41ZLBRe1/NFmKsDV
	F5cPbg+Yt+GgU/y5yOLDkbShGj9A7nHDhOb5fw05OOHhTRN6TIB23XhiL16ZXHaIooB8hXTdOcT
	4ZhzpVRriik7m6YbQ24R/D22JCQL6aplNfHPEVVg6RvNbeh+yDnFa7R+lly9veNjFb6aOxfDrpN
	vWXBDfU26PXeTgTalsQ2KkOzVrlRBrLZwOaRuyOIU8omgjWVw=
X-Received: by 2002:a05:7300:fd0d:b0:2dd:6937:79b8 with SMTP id 5a478bee46e88-2ed0a003e90mr4229378eec.5.1777465750182;
        Wed, 29 Apr 2026 05:29:10 -0700 (PDT)
Received: from MVIN00013.mvista.com ([103.250.136.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ed1c0d8f90sm1947730eec.30.2026.04.29.05.29.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 05:29:09 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [scarthgap][PATCH] python3: fix CVE-2026-6100
Date: Wed, 29 Apr 2026 17:59:02 +0530
Message-ID: <20260429122902.304581-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2026 12:29:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236098

Pick patch from [1] also mentioned at NVD report in [2]

[1] https://github.com/python/cpython/commit/c3cf71c3366fe49acb776a639405c0eea6169c20
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-6100
[3] https://security-tracker.debian.org/tracker/CVE-2026-6100

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../python/python3/CVE-2026-6100.patch        | 75 +++++++++++++++++++
 .../python/python3_3.12.13.bb                 |  1 +
 2 files changed, 76 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2026-6100.patch

diff --git a/meta/recipes-devtools/python/python3/CVE-2026-6100.patch b/meta/recipes-devtools/python/python3/CVE-2026-6100.patch
new file mode 100644
index 0000000000..9084101434
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
index da7e3c604e..4865178572 100644
--- a/meta/recipes-devtools/python/python3_3.12.13.bb
+++ b/meta/recipes-devtools/python/python3_3.12.13.bb
@@ -35,6 +35,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
 	   file://0001-test_active_children-skip-problematic-test.patch \
            file://0001-test_readline-skip-limited-history-test.patch \
            file://CVE-2026-1502.patch \
+           file://CVE-2026-6100.patch \
            "
 
 SRC_URI:append:class-native = " \
-- 
2.50.1


