Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71E6ACD4F54
	for <webhook@archiver.kernel.org>; Wed, 20 May 2026 08:21:33 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7294.1779265284213677946
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 May 2026 01:21:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=nsrOaO3c;
 spf=pass (domain: smile.fr, ip: 209.85.221.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-441209fb77eso2777287f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 01:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1779265282; x=1779870082; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QGkzejGpEyOxVF75zURy8a+xDjIbZrrS+ei7tppTCoA=;
        b=nsrOaO3cGiJXLGN4SJrbYZ5Xr3qq0yJyII2UDq9P8rm4UE+y1Ol7s/gLRZ3GM9KKgs
         iz4dDnLX22FRzCNIxjBn++eOMiwxSB76ehaBpN8CT7yFFQbFgFXJ7rdL3VzzGbNWe5G3
         OS7ifPPzN20f96c9Md/conSze5eBTaQRXjATI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779265282; x=1779870082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QGkzejGpEyOxVF75zURy8a+xDjIbZrrS+ei7tppTCoA=;
        b=ANge2GNL1c1XINt1dxcjf7xMjtl5e6J6/1+3hZ/16Ev4jGV7MDg77iCxvag7XgOrno
         LBUMf/ZH+sr3HY3Gt/5u2SoRzA83wDBc9sxxFmssA5Ia4pXG2XtQ7B3DGf/t/okjn0R0
         sH6Y5r/lPu5SoKjYQIWYOyqMpDEMGbwLGLBWbV7Udtd1l2NRXpOitq5ev5LjbWJJbd7Q
         /DxE0tHpSDsCU17CZoICGRKWeCEvFB8D72/pmOXmo6HvYfzlVOnartfbblQp5Nz/R04n
         CLwrIMX5UNf9dRBiR9alItU6foDvCSTJKI2JZRdWldRhwSRk8QMGhXHHs7jK5yd34HFF
         Ix7g==
X-Gm-Message-State: AOJu0YzYhtaxyEViweFoD3N3Ae9c2mQguRxllzolPUrNW4wcM4pAf7l+
	XQsWAIjXpumcWxpSbE8qqFnWDOj3grJm8NVeYTjqIj2LGm5I2xN5VyfHYfgOZyDCu8akh6Md2sf
	+uxAy
X-Gm-Gg: Acq92OEKmdHmcIGtEMaVk7phGAah+G9rQujweY8DxQf6cL1CeMfxsrIqo0dK4o3Dvt8
	NhqVkNDxwBoSUZefyOvXW2JtEC+/IScImXyIKwqmx6lUfUCnsxiBIKt0dT/o371nn2BrD4p+dFa
	zq5JrFCZhCG+mrQKLNRC66QQF/6kPjaqKYRofzyN5/PZQNHHha68jn2uoelPGwLYHIkEqrKxuV1
	9fZn+eQpADcCW4+QaOuh61pboaxs2WuPTMMdAlzT+EIwYgQrLGcMulGJXX/1TyfhSJyZ4CGFl6z
	k6AHZ2EZxIoRyJmgT5g+75m6ygTNp/viDSwd88PpoYynG0fpUXIzjnxQ8uKIsStGgjE9bhtMBJI
	xGKr3x02WLUgwe8h0o553l2serxTRVxBvbB36BZ3wzN2dcqMrkaX/nR9a7gerYkvZPmtJTMFMhN
	isHShW6xg7KYCGUGhdqJGlZK/quSOsF2D0Z1hncQWxyw6R6vAdbWfDGnJ9Admrix6kTzPJqeJOW
	2xOU+6aoztSfQBOBFKzSHnxI7hT
X-Received: by 2002:a5d:5d89:0:b0:45e:9520:d729 with SMTP id ffacd0b85a97d-45e9520d974mr2772751f8f.0.1779265282226;
        Wed, 20 May 2026 01:21:22 -0700 (PDT)
Received: from localhost.localdomain (2a02-8440-250c-63aa-0256-2b9f-d16e-d784.rev.sfr.net. [2a02:8440:250c:63aa:256:2b9f:d16e:d784])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9ec39ff1sm56350642f8f.10.2026.05.20.01.21.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 01:21:21 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose v2 27/28] glibc: stable 2.43 branch updates
Date: Wed, 20 May 2026 10:20:28 +0200
Message-ID: <438660e2972d154637e58b1c7d3bf0618ddc4781.1779264709.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1779264709.git.yoann.congal@smile.fr>
References: <cover.1779264709.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 08:21:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237426

From: Peter Marko <peter.marko@siemens.com>

$ git log --oneline ce1013a197eb4a3b8ff2b07e0672f4d0b976ce7c..e9517114acc77c0b8af9da6700107df16882b701
e9517114ac (origin/release/2.43/master) abilist.awk: Handle weak unversioned defined symbols
1634cc11a5 Linux: Only define OPEN_TREE_* macros in <sys/mount.h> if undefined (bug 33921)
d1d8d27164 include: isolate __O_CLOEXEC flag for sys/mount.h and fcntl.h
8362e8ce10 Use pending character state in IBM1390, IBM1399 character sets (CVE-2026-4046)

Testing Results:
+--------------+--------+--------+------+
| Result       | Before | After  | Diff |
+--------------+--------+--------+------+
| PASS         | 6629   | 6632   | +3   |
| XPASS        | 4      | 4      |  0   |
| FAIL         | 105    | 103    | -2   |
| XFAIL        | 16     | 16     |  0   |
| UNSUPPORTED  | 559    | 559    |  0   |
+--------------+--------+--------+------+

Changes in failed testcases:
malloc/tst-malloc-fork-deadlock-malloc-check  FAIL  PASS
malloc/tst-malloc-too-large-malloc-check      PASS  FAIL
nptl/tst-getpid3                              FAIL  PASS
stdlib/tst-qsort3                             FAIL  PASS

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8999a94dd8acd98a0f96b09d20e5b47cf2f7076b)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 meta/recipes-core/glibc/glibc_2.43.bb     | 4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index 015e7943c55..af3db54cee5 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.43/master"
 PV = "2.43+git"
-SRCREV_glibc ?= "ce1013a197eb4a3b8ff2b07e0672f4d0b976ce7c"
+SRCREV_glibc ?= "e9517114acc77c0b8af9da6700107df16882b701"
 SRCREV_localedef ?= "cba02c503d7c853a38ccfb83c57e343ca5ecd7e5"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;protocol=https"
diff --git a/meta/recipes-core/glibc/glibc_2.43.bb b/meta/recipes-core/glibc/glibc_2.43.bb
index ffc17eb0720..b84c55ca170 100644
--- a/meta/recipes-core/glibc/glibc_2.43.bb
+++ b/meta/recipes-core/glibc/glibc_2.43.bb
@@ -17,7 +17,9 @@ Allows for ASLR bypass so can bypass some hardening, not an exploit in itself, m
 easier access for another. 'ASLR bypass itself is not a vulnerability.'"
 
 CVE_STATUS_GROUPS += "CVE_STATUS_STABLE_BACKPORTS"
-CVE_STATUS_STABLE_BACKPORTS = "CVE-2025-15281 CVE-2026-0861 CVE-2026-0915 CVE-2026-4437 CVE-2026-4438"
+CVE_STATUS_STABLE_BACKPORTS = "CVE-2025-15281 CVE-2026-0861 CVE-2026-0915 CVE-2026-4437 CVE-2026-4438 \
+    CVE-2026-4046 \
+"
 CVE_STATUS_STABLE_BACKPORTS[status] = "cpe-stable-backport: fix available in used git hash"
 
 DEPENDS += "gperf-native bison-native"

