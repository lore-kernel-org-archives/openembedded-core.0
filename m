Return-Path: <victor.kamensky7@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0800C27C5E
	for <webhook@archiver.kernel.org>; Mon, 10 Jun 2024 03:34:38 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.11499.1717990474548061918
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Jun 2024 20:34:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XB6AH2jz;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: victor.kamensky7@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1f70c457823so2908595ad.3
        for <openembedded-core@lists.openembedded.org>; Sun, 09 Jun 2024 20:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717990473; x=1718595273; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R5MfCD+VgRA2XC6Tam4MVRTSN/iKy2fK1C+xPfCxWSA=;
        b=XB6AH2jzCzkRfK9dkFoxkOPi45yws5RUkcEkQEF1vAkekwtCylr5bWs8kZEM18+jzs
         auxSRyQWFjIjcvn1A6b4ubTzOYXFs1hJzONAkk2Tnc652OX5r2ZOgIzXiacLTMsDJhXg
         sKOgu8e1F8cqZGnspT/0gf0kbZuMBidbIvl1hmlgV3+c8f3GfDd+bM7VpNnEEh63+8hL
         Z+iy5bfE5qFd7uKrk0ccqMeH5VZRXrMuZ7J4/qsO9QxEu5zGH/1uGPj3vzybFNAhJLc/
         U318iEtXoACsMOvmCGMP9OCfTolQOEcCpcadh4Qfa9gWzkc2296UOGOIIMfC6PwbYuoi
         ZykQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717990473; x=1718595273;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R5MfCD+VgRA2XC6Tam4MVRTSN/iKy2fK1C+xPfCxWSA=;
        b=LYFIXxsg33KLNr3RoK7dq6QRk+QfYFNPMdeSzA1OMAm+w+IMz0tMn8WphijWl6F4Zj
         Jw3jGUk/OkcvjPjuS4Isq/eX6FEzr5ZZYQnSQwnB3hzQCAtO1v5oNQfEHdas9NmUzuSg
         p7PJ3jVe6NR5lTPDznqMLpA2/jbq4orzeA/0F8sKxwIGjJd9JJhh0DJ4eXJPX3b4QkiP
         ZFO1woicTWwqGEl2ADWXGCQFtgjf0yScD1LcQK7Ch2z6b0QgigufB9InAKOHWy5YrbYA
         3KLuTcjPxQf7lMEtj6ohZg7DZ4s5IlTThhezs5MrsDVyUDUWzmsm1kcpwiYKh4QoJOFy
         AGGg==
X-Gm-Message-State: AOJu0YyijF6WCUvmcvd/XgHzGAfh4K0wq87RTXGgNDZR3L7keaENrmtf
	+zeZsia82IVV88G/AwvNyxUeJfzvWMcmWUyqtFnWFRwUeTqwMvsYpIK1rw==
X-Google-Smtp-Source: AGHT+IGkrWOCMbn51qb1o+3wPmpjR9A6sRbvcUevhejTRZ7HpyCFMnPNO9lVVmx4n+yQ2xmecTSVWQ==
X-Received: by 2002:a17:903:41d0:b0:1f6:83c5:1f06 with SMTP id d9443c01a7336-1f6d02dda50mr94458195ad.28.1717990473376;
        Sun, 09 Jun 2024 20:34:33 -0700 (PDT)
Received: from kamensky-p15s.cisco.com ([2601:641:8080:1a70::9705])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6dcb5a941sm50425265ad.203.2024.06.09.20.34.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jun 2024 20:34:32 -0700 (PDT)
From: Victor Kamensky <victor.kamensky7@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Victor Kamensky <victor.kamensky7@gmail.com>
Subject: [PATCH] systemtap: fix systemtap-native build error on Fedora 40
Date: Sun,  9 Jun 2024 20:34:03 -0700
Message-Id: <20240610033403.23741-1-victor.kamensky7@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jun 2024 03:34:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200466

Backport of couple patches from upstream.

Signed-off-by: Victor Kamensky <victor.kamensky7@gmail.com>
---
 ...gcc-version-compatibility-hack-redux.patch | 32 ++++++++++++
 ...e.cxx-gcc-version-compatibility-hack.patch | 52 +++++++++++++++++++
 .../systemtap/systemtap_git.inc               |  2 +
 3 files changed, 86 insertions(+)
 create mode 100644 meta/recipes-kernel/systemtap/systemtap/0001-elaborate.cxx-gcc-version-compatibility-hack-redux.patch
 create mode 100644 meta/recipes-kernel/systemtap/systemtap/0001-elaborate.cxx-gcc-version-compatibility-hack.patch

diff --git a/meta/recipes-kernel/systemtap/systemtap/0001-elaborate.cxx-gcc-version-compatibility-hack-redux.patch b/meta/recipes-kernel/systemtap/systemtap/0001-elaborate.cxx-gcc-version-compatibility-hack-redux.patch
new file mode 100644
index 0000000000..0c2888400d
--- /dev/null
+++ b/meta/recipes-kernel/systemtap/systemtap/0001-elaborate.cxx-gcc-version-compatibility-hack-redux.patch
@@ -0,0 +1,32 @@
+From 91caf37e4dfe862f9b68447b1597c0d0f31523c3 Mon Sep 17 00:00:00 2001
+From: "Frank Ch. Eigler" <fche@redhat.com>
+Date: Tue, 7 May 2024 15:04:04 -0400
+Subject: [PATCH] elaborate.cxx: gcc version compatibility hack redux
+
+Note __GNUC__ >= 14 for this diagnostic.
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=systemtap.git;a=commit;h=91caf37e4dfe862f9b68447b1597c0d0f31523c3]
+Signed-off-by: Victor Kamensky <victor.kamensky7@gmail.com>
+---
+ elaborate.cxx | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/elaborate.cxx b/elaborate.cxx
+index 88505559b..c08023f1d 100644
+--- a/elaborate.cxx
++++ b/elaborate.cxx
+@@ -2656,9 +2656,11 @@ symresolution_info::symresolution_info (systemtap_session& s, bool omniscient_un
+   session (s), unmangled_p(omniscient_unmangled), current_function (0), current_probe (0)
+ {
+   #pragma GCC diagnostic push
++  #if __GNUC__ >= 14
+   // c10s early snapshot GCC complains about this construct, which is
+   // made safe via our dtor usage
+   #pragma GCC diagnostic ignored "-Wdangling-pointer"
++  #endif
+   saved_session_symbol_resolver = s.symbol_resolver;
+   s.symbol_resolver = this; // save resolver for early PR25841 function resolution
+   #pragma GCC diagnostic pop
+-- 
+2.45.2
+
diff --git a/meta/recipes-kernel/systemtap/systemtap/0001-elaborate.cxx-gcc-version-compatibility-hack.patch b/meta/recipes-kernel/systemtap/systemtap/0001-elaborate.cxx-gcc-version-compatibility-hack.patch
new file mode 100644
index 0000000000..7cdcc93f14
--- /dev/null
+++ b/meta/recipes-kernel/systemtap/systemtap/0001-elaborate.cxx-gcc-version-compatibility-hack.patch
@@ -0,0 +1,52 @@
+From d11241bdd05bc4c745c8aef53a2725331e1a93b4 Mon Sep 17 00:00:00 2001
+From: "Frank Ch. Eigler" <fche@redhat.com>
+Date: Tue, 7 May 2024 14:25:12 -0400
+Subject: [PATCH] elaborate.cxx: gcc version compatibility hack
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Suppress -Wdangling-pointer for a construct that appears valid, but
+one particular GCC snapshot version complains about.
+
+In constructor ‘symresolution_info::symresolution_info(systemtap_session&, bool)’,
+inlined from ‘int semantic_pass_symbols(systemtap_session&)’ at ../systemtap/elaborate.cxx:1872:28:
+../systemtap/elaborate.cxx:2659:21: error: storing the address of local variable ‘sym’ in ‘*s.systemtap_session::symbol_resolver’ [-Werror=dangling-pointer=]
+ 2659 |   s.symbol_resolver = this; // save resolver for early PR25841 function resolution
+      |   ~~~~~~~~~~~~~~~~~~^~~~~~
+../systemtap/elaborate.cxx: In function ‘int semantic_pass_symbols(systemtap_session&)’:
+../systemtap/elaborate.cxx:1872:22: note: ‘sym’ declared here
+ 1872 |   symresolution_info sym (s);
+      |                      ^~~
+../systemtap/elaborate.cxx:1870:43: note: ‘s’ declared here
+ 1870 | semantic_pass_symbols (systemtap_session& s)
+      |                        ~~~~~~~~~~~~~~~~~~~^
+cc1plus: all warnings being treated as errors
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=systemtap.git;a=commit;h=d11241bdd05bc4c745c8aef53a2725331e1a93b4]
+Signed-off-by: Victor Kamensky <victor.kamensky7@gmail.com>
+---
+ elaborate.cxx | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/elaborate.cxx b/elaborate.cxx
+index 8bf9e6c06..88505559b 100644
+--- a/elaborate.cxx
++++ b/elaborate.cxx
+@@ -2655,8 +2655,13 @@ semantic_pass (systemtap_session& s)
+ symresolution_info::symresolution_info (systemtap_session& s, bool omniscient_unmangled):
+   session (s), unmangled_p(omniscient_unmangled), current_function (0), current_probe (0)
+ {
++  #pragma GCC diagnostic push
++  // c10s early snapshot GCC complains about this construct, which is
++  // made safe via our dtor usage
++  #pragma GCC diagnostic ignored "-Wdangling-pointer"
+   saved_session_symbol_resolver = s.symbol_resolver;
+   s.symbol_resolver = this; // save resolver for early PR25841 function resolution
++  #pragma GCC diagnostic pop
+ }
+ 
+ 
+-- 
+2.45.2
+
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recipes-kernel/systemtap/systemtap_git.inc
index cc9fc81430..80945ad7f8 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.inc
+++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
@@ -7,6 +7,8 @@ SRC_URI = "git://sourceware.org/git/systemtap.git;branch=master;protocol=https \
            file://0001-Do-not-let-configure-write-a-python-location-into-th.patch \
            file://0001-Install-python-modules-to-correct-library-dir.patch \
            file://0001-staprun-stapbpf-don-t-support-installing-a-non-root.patch \
+           file://0001-elaborate.cxx-gcc-version-compatibility-hack.patch \
+           file://0001-elaborate.cxx-gcc-version-compatibility-hack-redux.patch \
            "
 
 COMPATIBLE_HOST = '(x86_64|i.86|powerpc|arm|aarch64|microblazeel|mips|riscv64).*-linux'
-- 
2.45.2


