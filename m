Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53B35CF64A1
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 01:58:06 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web10.45290.1727661479390878325
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Sep 2024 18:57:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=07U2+syo;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.181, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-6bce380eb96so2254230a12.0
        for <openembedded-core@lists.openembedded.org>; Sun, 29 Sep 2024 18:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1727661479; x=1728266279; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jPCxZXZ8TPqd0XDNEDAiT+sxJlyX9H2+ssOpJypd9QY=;
        b=07U2+syoDNfyeafYbJ9pzZ9gtjeMNBZMnGCROx3xaIhPd2jo1AXrQ5uUwJUJvhjcIo
         VEg6xLJaDCrmtYgX24wKifKZOlsdoMlt8mZWsOXXswCss/VxGTGfCUvw2LM1QD0X+342
         X3iFfkzs7p6+L828Ozthhk3UcX5kMD1Z8PzdzjoN/Ds1NEXNxVM/xGAyqzio4TuLcL5V
         vWktv+C/ITC2jPjgUFY8KLmDpD5Zwstu0tVAIwGfDQObR4qFvmEG42MbCutxNyPfRVM/
         DOwfzyytc+rxjD+dI1vovUni8Hs+KP5nXnYQoIofp33A8V4k8KEdpp2orQWU6grtXEvc
         KcOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727661479; x=1728266279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jPCxZXZ8TPqd0XDNEDAiT+sxJlyX9H2+ssOpJypd9QY=;
        b=RYZs20CEw+h5vnWlBA/vy9zD1a4oCaYUmnszAsazeVt6zzsCMvpNDWenI/RJkYZCJ9
         PaF0jlyoJGhMc/m13qQ9fW5H/358evzaGAjjfbfrk6fpctTyMp2MdH6JcAPMJX8blQVZ
         vPU8KExbJXJOlkUgjTwmxiCDTeaVjOIDRDX4Ds1/tY1l2atMBoq5xPuEMvPNzvjYgQxA
         g3FhNS6CB1NpQu1L5J8N4XtSsPANrPuzWi3QIxMS+cr2dTx6lPbgfh/hVCFv7ou6RR/Y
         23BkMKZ7yIIoqWYvhNj2jzDHWKoM/cx52HtDFQ36ikCQURt9aTLHrpmkme+ZbGhb6Vin
         Az6g==
X-Gm-Message-State: AOJu0YwItQz5zW0QGqqAqQtsTs+mmXk1GhT9tDNE0chvQOd9SSWdUj+L
	A8arEvUX4n0G2UOFosm4PcHWtMI+zjVm8r3x9D0+x0+LVvdAqwc30ximP3mo8sokDg4tCMm9Nwe
	Dlhg=
X-Google-Smtp-Source: AGHT+IEowxAiTprz9J3/vddiJdNuyPDhrj8HterN41u4PLss+cWrFBFDvHV7wmU9aTlFbamVhxOPtQ==
X-Received: by 2002:a17:90a:eb0c:b0:2dd:92e5:6f7d with SMTP id 98e67ed59e1d1-2e0b8c54e71mr12387282a91.20.1727661478534;
        Sun, 29 Sep 2024 18:57:58 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e0d4af744bsm5496070a91.23.2024.09.29.18.57.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Sep 2024 18:57:58 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 17/27] systemtap: fix systemtap-native build error on Fedora 40
Date: Sun, 29 Sep 2024 18:57:12 -0700
Message-Id: <bca8aa07ce0cea82f6f17381efaeba897edab265.1727661284.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1727661284.git.steve@sakoman.com>
References: <cover.1727661284.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Sep 2024 01:58:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205079

From: Victor Kamensky <victor.kamensky7@gmail.com>

Backport of couple patches from upstream.

Signed-off-by: Victor Kamensky <victor.kamensky7@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit cc486f26db46c562e35f770c16edf3f4035e536e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
index c574bcb2ba..7cbc0fcbb4 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.inc
+++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
@@ -12,6 +12,8 @@ SRC_URI = "git://sourceware.org/git/systemtap.git;branch=master;protocol=https \
            file://0001-configure.ac-fix-broken-libdebuginfod-library-auto-d.patch \
            file://0001-bpf-translate.cxx-fix-build-against-upcoming-gcc-14-.patch \
            file://0001-staprun-fix-build-against-upcoming-gcc-14-Werror-cal.patch \
+           file://0001-elaborate.cxx-gcc-version-compatibility-hack.patch \
+           file://0001-elaborate.cxx-gcc-version-compatibility-hack-redux.patch \
            "
 
 COMPATIBLE_HOST = '(x86_64|i.86|powerpc|arm|aarch64|microblazeel|mips|riscv64).*-linux'
-- 
2.34.1


