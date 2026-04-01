Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12A9410F9318
	for <webhook@archiver.kernel.org>; Wed,  1 Apr 2026 01:40:31 +0000 (UTC)
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3413.1775007624789422638
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Mar 2026 18:40:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=qAsbQCef;
 spf=pass (domain: gmail.com, ip: 74.125.82.170, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2c87871133dso1259253eec.0
        for <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2026 18:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775007624; x=1775612424; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pEAxjV0tqvQ9rhqrf8zs7v1nBxbaGSeQOcAQzKc1ngE=;
        b=qAsbQCefOxfikOOVsKFkm5dc50qOOM8SzZu7qvn6hdgQQORLtnTGbT7EInAyYOnmTT
         sSDDn2jfaowPF0Qo/uWQsyAGQxa04ikml012iTusIML4h1hkzo9qfs7yctRlYpomHkXs
         h48UGHOrRnTAMMGs5KDws8yEDGExX5Fi4tvAwP0dJLSdutrKJ5y+tRMEp2WTEAoNWARJ
         HSYaN8C2yUHl81avioDt5RIZV4SdfNOlE0DtXPCvcTQdQ78xUXUqgyvStfFJ2Sfn1Gd1
         wYgZC9lZIYPKPsmCYl0Tfb2hDVnMhpPHSOnyNJbodCUt/FWV92hQnK8MICZnXp5i9Tav
         njMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775007624; x=1775612424;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pEAxjV0tqvQ9rhqrf8zs7v1nBxbaGSeQOcAQzKc1ngE=;
        b=POQ/W3TPn0cQS3ZvFn39Odgg1Sz6blW3JZrr5NmMu2QIEHklYGHm38rSVlNVdzuulZ
         cYHgt2vvFzCzM+ZVxW4UN7VzOm+QpDi6bkOY6BwfSxyzcHI6xKBwrhKC9JEC/gYcq6DM
         ItUgKCJJ8JFc/RluJm8p+fwz5wz7CJQoFe9skWhvLGM5UbW5WXleH7DnjcxR3orF3TDL
         TVFABJAS23lk/pxBao4BjOg5GWvfF5iNc6JyTNbxFzjMCJOBgiwyjgG1YsCZsZffTVhs
         InjWAbxWSmoFqQuQ4acLkJ+O/YzxE5oUU5s8yuKlNysd6KV8wBYS7rr1jI17FhFcikHx
         aK/w==
X-Gm-Message-State: AOJu0YwHmiHQN67j+6BtDaXp2jbvdnADqUDbMwo4zsYwSHpYxSzhF32d
	k6GRkLWdVtm6lNkIJ0DLIveCTm2DwDNn+8G5NBu3N8LRFt/pu+KROyv/FcJUGw==
X-Gm-Gg: ATEYQzxAF7wOq8bK+m822XHvdzlboDG4DRXD5hqQPnUze9HDAJlYO2e6Yj8WLCK4LSB
	w7/xI/r1BapELMaFfBd98jDXCns/boNjOLN4pAp2kze/4Sbhdq9rcE1UYNhApqT4YhuD6+awvAQ
	jYdKI+ALDcYO5BH/MzCUBvc8YZLfbB+3mmNnGaPAWQBy5IqXtYrEn24DJtZuSZP4h7vlNkkknCv
	9rMDc9uO0/bry9GQZs36zC1MiHf3Pg7vkGELNGqKncJdh9Hevly04JfeMJJvXaJvp3FbOrSihha
	+1YM4kRP1fLYjcrs4ccJ6KOho4DaNR/kHGmYzw5xSV10BP5Pzh0ISAwEdD+QJ6glxt/bpWin1Nz
	H39F8NHL4q9jSaVf3PKtKI3x4HhAPvpyW0TSH03bKclOqn/K9Hl80wcAqJ3SXETA1zcoZR0MP9j
	60a8l4FZhoIfIe1ejaFCV5w2UDtYn9Uy5wG8wH9jOhns9Gr++GiiGXvhkhivw8XMda3r+OUTPKZ
	hv6AIHzXxPKLLI+rJFQc5NGRtI7G2a9xovxQ0JYnCERkLW78E4feWie/nZX
X-Received: by 2002:a05:7300:4306:b0:2c6:55cf:de42 with SMTP id 5a478bee46e88-2c93049a70cmr932209eec.7.1775007623840;
        Tue, 31 Mar 2026 18:40:23 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c3c46a0d06sm11234225eec.10.2026.03.31.18.40.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 18:40:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH] virglrenderer: Fix gallium build with glibc 2.43
Date: Tue, 31 Mar 2026 18:40:20 -0700
Message-ID: <20260401014020.1203451-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 01:40:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234323

Backport a patch from upstream trunk.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...5fc57b07c06b5e0b3a3694d06898ebc80163.patch | 36 +++++++++++++++++++
 .../virglrenderer/virglrenderer_1.2.0.bb      |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-graphics/virglrenderer/virglrenderer/986b5fc57b07c06b5e0b3a3694d06898ebc80163.patch

diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer/986b5fc57b07c06b5e0b3a3694d06898ebc80163.patch b/meta/recipes-graphics/virglrenderer/virglrenderer/986b5fc57b07c06b5e0b3a3694d06898ebc80163.patch
new file mode 100644
index 0000000000..91e01f0616
--- /dev/null
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer/986b5fc57b07c06b5e0b3a3694d06898ebc80163.patch
@@ -0,0 +1,36 @@
+From 986b5fc57b07c06b5e0b3a3694d06898ebc80163 Mon Sep 17 00:00:00 2001
+From: Maximilian Hofmann <maxi@maxiicodes.dev>
+Date: Thu, 26 Feb 2026 23:28:58 +0100
+Subject: [PATCH] fix: build with glibc 2.43
+
+Several glibc functions now return a const pointer if the input is a
+const pointer and a non-const pointer if the input is non-const, causing
+a build failure.
+
+Fix this by declaring the output pointers as const if they are never
+modified, and for the lone failure where the output is modified, instead
+make the input non-const.
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/virgl/virglrenderer/-/merge_requests/1599]
+Signed-off-by: Maximilian Hofmann <maxi@maxiicodes.dev>
+Part-of: <https://gitlab.freedesktop.org/virgl/virglrenderer/-/merge_requests/1599>
+---
+ src/gallium/auxiliary/tgsi/tgsi_text.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/gallium/auxiliary/tgsi/tgsi_text.c b/src/gallium/auxiliary/tgsi/tgsi_text.c
+index db7d7b952..7e37bf794 100644
+--- a/src/gallium/auxiliary/tgsi/tgsi_text.c
++++ b/src/gallium/auxiliary/tgsi/tgsi_text.c
+@@ -84,7 +84,7 @@ streq_nocase_uprcase(const char *str1,
+ static inline bool skip_n_chars(const char **pcur,
+                                    int n)
+ {
+-   char* str = memchr(*pcur, '\0', n);
++   const char* str = memchr(*pcur, '\0', n);
+    if (unlikely(str)) {
+       *pcur = str;
+       return false;
+--
+GitLab
+
diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer_1.2.0.bb b/meta/recipes-graphics/virglrenderer/virglrenderer_1.2.0.bb
index df8473dad2..c7aef527b0 100644
--- a/meta/recipes-graphics/virglrenderer/virglrenderer_1.2.0.bb
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer_1.2.0.bb
@@ -13,6 +13,7 @@ SRCREV = "500b41d5c8638f9b80dd558f4044f3301c7457a4"
 SRC_URI = "git://gitlab.freedesktop.org/virgl/virglrenderer.git;branch=main;protocol=https;tag=${PV} \
            file://0001-meson.build-use-python3-directly-for-python.patch \
            file://0001-c11-use-glibc-s-once_flag-ONCE_FLAG_INIT-when-presen.patch \
+           file://986b5fc57b07c06b5e0b3a3694d06898ebc80163.patch \
            "
 
 inherit meson pkgconfig features_check

