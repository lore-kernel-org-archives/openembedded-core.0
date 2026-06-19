Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AD26CDB473
	for <webhook@archiver.kernel.org>; Fri, 19 Jun 2026 08:33:23 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38257.1781857994877010989
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jun 2026 01:33:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=MbDx+v0Q;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-46066e640easo1128703f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2026 01:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781857993; x=1782462793; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QXHNCJPS6qLN3PQYHf/9sM8KggzRMYc8WXxJstQB/jo=;
        b=MbDx+v0QCQ8VrBhGK+xNY6/wKBYyqrRkWxTwOzk1beqB/NcGe47FlhjO3hIjMclQ8x
         puKOLUqbuFMGimcfkjkhcQHcborJq2cqT54CANxR2UCYimKef+VIgTb6X9wy61Oekl3f
         gHYtVJzGQhfI92kYRxpkFKWIZBEo3pgeQYACACy3k6Ft/d7ZUzxStaqD8qffTrth2ilM
         pssu6VnVXrzOEaSsMZ2iWIc6QeBt89wH+7fFaMNGiPjJWdbJHmxOaSKFnxHwo2W+xpM/
         60VObJobu7bHm1D7FT8lQCOUJE5QNuTKFxmGtpx4OA7gO222tUK0wkdXma0HAJNBgq0i
         U0KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781857993; x=1782462793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QXHNCJPS6qLN3PQYHf/9sM8KggzRMYc8WXxJstQB/jo=;
        b=qHbW5Z+MXKTYqQLwQ1nD0do3zhHhAJJUUiXnFbiEJmYVDTMUadAtQcXLG3rf2FkHvf
         u/MW5dGHWZ4Brl/zHzS+qrz4YtnDNAlPbAPKG1Je+Ad/QXnVJ5wp62zvS7ZiZjjkymDK
         UEF87eTrZtkYmEs4GUgYMWHm8MqO62UZDINbkeQNseMlF6qWOagtjTIXx4nVhELU75NJ
         Vrrx2wj1QtIrHjK0rDuQsrhj7ZAM5QQbfg7q5TjpnYpwHZZMDzWPWoewzR6xnX9KESUB
         OhU7wDVU8DdsE3QPQwcdIFiR1s6Lsi352YFdzyr3hRE/RxgyCOfbBppl81ssbOM7yGIN
         1EbQ==
X-Gm-Message-State: AOJu0YyQVGnz/WOPQUi/KRoLsRzlE7dTxkFvpxa75ic+rrurbhtzVxAC
	X3KDOgPQXclyc8uM2t/WaEBBrrW78wfEaHs6Se0yp0Icmdo815+e1V8G0nnXJF/P
X-Gm-Gg: AfdE7cmrCdjzvTAluV7yczz5KUPnTDXnZKvqxZYwhUP87rfQubFO4gKFduMpcxS97Xf
	g3ePz/tt+KckJJsqcMbV4TVoyrMwYK8SpYnrSad9SaHflog2o2uRDWJ/iLFm4/0BhzFdlFuxItq
	unb+jAIVYCGPO7CCqRIN90PcCHK3MgnjFS7SPetcmTyMS8B1enrK70NSBQsRIuLrjVTZDJtG6Yb
	UtV8NRdmCQxseB+m8VoVJVjReqXYH3MXl6glo9st6JnoXTQPww2EZq6AuVSLW5qw59o+0dsS5ls
	KCONSwQQpxs62N2H+uEozoRSJ6M5W8re7BgBh9O850qTiNTNm+y8m+8+MxeI2Ej68tCuXNUZ0P3
	fzAkayez+fzs+vPNMvgDE8+9xD/0uDNY1vHx3x6TYykFONSlfEO7zj2UVKDclFmWDLLPZaQbjO8
	de+LQcUM3Y+sywjiRPXK5v0KmXQxfPnpRvQlHrApnhXNlQHDUR
X-Received: by 2002:a05:6000:481b:b0:45e:eaed:afd2 with SMTP id ffacd0b85a97d-465041d5b0amr5022874f8f.0.1781857992985;
        Fri, 19 Jun 2026 01:33:12 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4650bc429a1sm5878368f8f.30.2026.06.19.01.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 01:33:12 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 06/15] systemtap: upgrade 5.4 -> 5.5
Date: Fri, 19 Jun 2026 10:32:48 +0200
Message-ID: <20260619083305.3505156-6-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260619083305.3505156-1-alex.kanavin@gmail.com>
References: <20260619083305.3505156-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2026 08:33:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239141

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...-native_5.4.bb => systemtap-native_5.5.bb} |   0
 ...gure-write-a-python-location-into-th.patch |   7 +-
 ...ython-modules-to-correct-library-dir.patch |   2 +-
 .../0001-elaborate.cxx-fix-32-bit-build.patch | 104 ------------------
 ...rove-reproducibility-for-c-compiling.patch |  10 +-
 ...staprun-address-ncurses-6.3-failures.patch |  11 +-
 ...-don-t-support-installing-a-non-root.patch |  17 ++-
 .../systemtap/systemtap/readline.patch        |  29 +++--
 .../{systemtap_5.4.bb => systemtap_5.5.bb}    |   0
 .../systemtap/systemtap_git.inc               |   3 +-
 10 files changed, 39 insertions(+), 144 deletions(-)
 rename meta/recipes-kernel/systemtap/{systemtap-native_5.4.bb => systemtap-native_5.5.bb} (100%)
 delete mode 100644 meta/recipes-kernel/systemtap/systemtap/0001-elaborate.cxx-fix-32-bit-build.patch
 rename meta/recipes-kernel/systemtap/{systemtap_5.4.bb => systemtap_5.5.bb} (100%)

diff --git a/meta/recipes-kernel/systemtap/systemtap-native_5.4.bb b/meta/recipes-kernel/systemtap/systemtap-native_5.5.bb
similarity index 100%
rename from meta/recipes-kernel/systemtap/systemtap-native_5.4.bb
rename to meta/recipes-kernel/systemtap/systemtap-native_5.5.bb
diff --git a/meta/recipes-kernel/systemtap/systemtap/0001-Do-not-let-configure-write-a-python-location-into-th.patch b/meta/recipes-kernel/systemtap/systemtap/0001-Do-not-let-configure-write-a-python-location-into-th.patch
index 742b1187fc..8a6cc4e0a4 100644
--- a/meta/recipes-kernel/systemtap/systemtap/0001-Do-not-let-configure-write-a-python-location-into-th.patch
+++ b/meta/recipes-kernel/systemtap/systemtap/0001-Do-not-let-configure-write-a-python-location-into-th.patch
@@ -1,4 +1,4 @@
-From ab29615ed6c2e779b472903564dc683dc1015de7 Mon Sep 17 00:00:00 2001
+From adf505ededdd25cf43111fd12a59090a8f7de856 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 22 Feb 2017 13:37:33 +0200
 Subject: [PATCH] Do not let configure write a python location into the dtrace
@@ -11,7 +11,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/dtrace.in b/dtrace.in
-index 5e1cf8079..a24229cbc 100644
+index 73a6f22e2..870999e36 100644
 --- a/dtrace.in
 +++ b/dtrace.in
 @@ -1,4 +1,4 @@
@@ -20,6 +20,3 @@ index 5e1cf8079..a24229cbc 100644
  # vim: et sta sts=4 sw=4 ts=8
  
  # This handles the systemtap equivalent of
--- 
-2.11.0
-
diff --git a/meta/recipes-kernel/systemtap/systemtap/0001-Install-python-modules-to-correct-library-dir.patch b/meta/recipes-kernel/systemtap/systemtap/0001-Install-python-modules-to-correct-library-dir.patch
index 21e3096405..6a3fa04bea 100644
--- a/meta/recipes-kernel/systemtap/systemtap/0001-Install-python-modules-to-correct-library-dir.patch
+++ b/meta/recipes-kernel/systemtap/systemtap/0001-Install-python-modules-to-correct-library-dir.patch
@@ -1,4 +1,4 @@
-From 7847240a97f5010ebab775f7ac51812a7705a886 Mon Sep 17 00:00:00 2001
+From a261ee9efca120b6d65310a972d91dffc00ac937 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 24 Feb 2017 17:53:02 +0200
 Subject: [PATCH] Install python modules to correct library dir.
diff --git a/meta/recipes-kernel/systemtap/systemtap/0001-elaborate.cxx-fix-32-bit-build.patch b/meta/recipes-kernel/systemtap/systemtap/0001-elaborate.cxx-fix-32-bit-build.patch
deleted file mode 100644
index bfc9699728..0000000000
--- a/meta/recipes-kernel/systemtap/systemtap/0001-elaborate.cxx-fix-32-bit-build.patch
+++ /dev/null
@@ -1,104 +0,0 @@
-From 94efb7c4eb02de0e3565cb165b53963602d3dcb6 Mon Sep 17 00:00:00 2001
-From: Sergei Trofimovich <slyich@gmail.com>
-Date: Sun, 30 Nov 2025 20:58:01 +0000
-Subject: [PATCH] elaborate.cxx: fix 32-bit build
-
-Without the change the build fails on i686-linux as:
-
-    elaborate.cxx:5119:33: error:
-      format '%ld' expects argument of type 'long int',
-      but argument 2 has type 'int64_t' {aka 'long long int'} [-Werror=format=]
-     5119 |       session.print_warning (_F("Collapsing unresolved @define to %ld [stapprobes]", value), e->tok);
-          |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-Upstream-Status: Backport [https://sourceware.org/git/?p=systemtap.git;a=patch;h=94efb7c4eb02de0e3565cb165b53963602d3dcb6]
-Signed-off-by: Victor Kamensky <victor.kamensky7@gmail.com>
----
- elaborate.cxx    | 2 +-
- po/cs.po         | 2 +-
- po/en.po         | 2 +-
- po/fr.po         | 2 +-
- po/pl.po         | 2 +-
- po/systemtap.pot | 2 +-
- 6 files changed, 6 insertions(+), 6 deletions(-)
-
-diff --git a/elaborate.cxx b/elaborate.cxx
-index 93ecffa1a..3ad3614e7 100644
---- a/elaborate.cxx
-+++ b/elaborate.cxx
-@@ -5116,7 +5116,7 @@ const_folder::visit_defined_op (defined_op* e)
-       // Don't be greedy... we'll only collapse one at a time so type
-       // resolution can have another go at it.
-       relaxed_p = false;
--      session.print_warning (_F("Collapsing unresolved @define to %ld [stapprobes]", value), e->tok);
-+      session.print_warning (_F("Collapsing unresolved @define to %lld [stapprobes]", (long long)value), e->tok);
-       literal_number* n = new literal_number (value);
-       n->tok = e->tok;
-       n->visit (this);
-diff --git a/po/cs.po b/po/cs.po
-index df6412772..92fdef7ad 100644
---- a/po/cs.po
-+++ b/po/cs.po
-@@ -2039,7 +2039,7 @@ msgstr "Zahazuji kontrolu '@defined' bez vedlejších účinků "
- 
- #: elaborate.cxx:5119
- #, fuzzy, c-format
--msgid "Collapsing unresolved @define to %ld [stapprobes]"
-+msgid "Collapsing unresolved @define to %lld [stapprobes]"
- msgstr "Zahazuji kontrolu '@defined' bez vedlejších účinků "
- 
- #: elaborate.cxx:5127
-diff --git a/po/en.po b/po/en.po
-index 8847639e8..1db2292bd 100644
---- a/po/en.po
-+++ b/po/en.po
-@@ -2050,7 +2050,7 @@ msgstr ""
- 
- #: elaborate.cxx:5119
- #, c-format
--msgid "Collapsing unresolved @define to %ld [stapprobes]"
-+msgid "Collapsing unresolved @define to %lld [stapprobes]"
- msgstr ""
- 
- #: elaborate.cxx:5127
-diff --git a/po/fr.po b/po/fr.po
-index b8677707b..55e409919 100644
---- a/po/fr.po
-+++ b/po/fr.po
-@@ -2090,7 +2090,7 @@ msgstr ""
- 
- #: elaborate.cxx:5119
- #, c-format
--msgid "Collapsing unresolved @define to %ld [stapprobes]"
-+msgid "Collapsing unresolved @define to %lld [stapprobes]"
- msgstr ""
- 
- #: elaborate.cxx:5127
-diff --git a/po/pl.po b/po/pl.po
-index e3b6700ee..0b35880c1 100644
---- a/po/pl.po
-+++ b/po/pl.po
-@@ -1977,7 +1977,7 @@ msgstr ""
- 
- #: elaborate.cxx:5119
- #, c-format
--msgid "Collapsing unresolved @define to %ld [stapprobes]"
-+msgid "Collapsing unresolved @define to %lld [stapprobes]"
- msgstr ""
- 
- #: elaborate.cxx:5127
-diff --git a/po/systemtap.pot b/po/systemtap.pot
-index 32ddb2290..4ec0d9a8c 100644
---- a/po/systemtap.pot
-+++ b/po/systemtap.pot
-@@ -1973,7 +1973,7 @@ msgstr ""
- 
- #: elaborate.cxx:5119
- #, c-format
--msgid "Collapsing unresolved @define to %ld [stapprobes]"
-+msgid "Collapsing unresolved @define to %lld [stapprobes]"
- msgstr ""
- 
- #: elaborate.cxx:5127
--- 
-2.45.0
-
diff --git a/meta/recipes-kernel/systemtap/systemtap/0001-improve-reproducibility-for-c-compiling.patch b/meta/recipes-kernel/systemtap/systemtap/0001-improve-reproducibility-for-c-compiling.patch
index 7d35f76b29..894cd3b407 100644
--- a/meta/recipes-kernel/systemtap/systemtap/0001-improve-reproducibility-for-c-compiling.patch
+++ b/meta/recipes-kernel/systemtap/systemtap/0001-improve-reproducibility-for-c-compiling.patch
@@ -1,4 +1,4 @@
-From 6288ba5df0a8c73ef842b609081449ac4de86123 Mon Sep 17 00:00:00 2001
+From 06522edad080caa76f5abc8586fe5baf3b620f16 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Wed, 18 Jul 2018 16:58:33 +0800
 Subject: [PATCH] improve reproducibility for c++ compiling
@@ -13,10 +13,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  stringtable.h | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-Index: git/stringtable.h
-===================================================================
---- git.orig/stringtable.h
-+++ git/stringtable.h
+diff --git a/stringtable.h b/stringtable.h
+index aef564824..a04888f3c 100644
+--- a/stringtable.h
++++ b/stringtable.h
 @@ -23,7 +23,7 @@
  
  #if 0 && defined(HAVE_BOOST_UTILITY_STRING_REF_HPP)
diff --git a/meta/recipes-kernel/systemtap/systemtap/0001-staprun-address-ncurses-6.3-failures.patch b/meta/recipes-kernel/systemtap/systemtap/0001-staprun-address-ncurses-6.3-failures.patch
index 1decf21593..59c0e8a7fd 100644
--- a/meta/recipes-kernel/systemtap/systemtap/0001-staprun-address-ncurses-6.3-failures.patch
+++ b/meta/recipes-kernel/systemtap/systemtap/0001-staprun-address-ncurses-6.3-failures.patch
@@ -1,4 +1,4 @@
-From 191f528da19193d713d94ee252e2485efd9af4d3 Mon Sep 17 00:00:00 2001
+From 7672d0e398b29a52f59a1a0cbb75d4d07bd5f975 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Mon, 25 Oct 2021 17:59:24 +0200
 Subject: [PATCH] staprun: address ncurses 6.3 failures
@@ -10,10 +10,10 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 12 insertions(+), 12 deletions(-)
 
 diff --git a/staprun/monitor.c b/staprun/monitor.c
-index 478634c09..f4fbfd686 100644
+index 851ee14c4..7d83a3846 100644
 --- a/staprun/monitor.c
 +++ b/staprun/monitor.c
-@@ -448,12 +448,12 @@ void monitor_render(void)
+@@ -453,12 +453,12 @@ void monitor_render(void)
        if (active_window == 0)
          wattron(status, A_BOLD);
        wprintw(status, "\n%*s\t%*s\t%*s\t%*s\t%*s\t%*s\t%s\n",
@@ -32,7 +32,7 @@ index 478634c09..f4fbfd686 100644
                HIGHLIGHT("name", p_name, comp_fn_index));
        if (active_window == 0)
          wattroff(status, A_BOLD);
-@@ -466,17 +466,17 @@ void monitor_render(void)
+@@ -471,17 +471,17 @@ void monitor_render(void)
            json_object *probe, *field;
            probe = json_object_array_get_idx(jso_probe_list, i);
            json_object_object_get_ex(probe, "index", &field);
@@ -56,6 +56,3 @@ index 478634c09..f4fbfd686 100644
            getyx(status, discard, cur_x);
            json_object_object_get_ex(probe, "name", &field);
            wprintw(status, "%.*s", max_cols-cur_x-1, json_object_get_string(field));
--- 
-2.20.1
-
diff --git a/meta/recipes-kernel/systemtap/systemtap/0001-staprun-stapbpf-don-t-support-installing-a-non-root.patch b/meta/recipes-kernel/systemtap/systemtap/0001-staprun-stapbpf-don-t-support-installing-a-non-root.patch
index e2f8b3b057..8273e34b57 100644
--- a/meta/recipes-kernel/systemtap/systemtap/0001-staprun-stapbpf-don-t-support-installing-a-non-root.patch
+++ b/meta/recipes-kernel/systemtap/systemtap/0001-staprun-stapbpf-don-t-support-installing-a-non-root.patch
@@ -1,4 +1,4 @@
-From 3e13a006fe3dff9489269274093bf868532036e2 Mon Sep 17 00:00:00 2001
+From 3483d0bc400eb618add607097027eafb075722f4 Mon Sep 17 00:00:00 2001
 From: Saul Wold <sgw@linux.intel.com>
 Date: Tue, 5 Sep 2017 16:02:55 -0700
 Subject: [PATCH] staprun/stapbpf: don't support installing a non-root
@@ -10,15 +10,14 @@ the binaries.
 Upstream-Status: Inappropriate [Embedded]
 Signed-off-by: Saul Wold <sgw@linux.intel.com>
 ---
- stapbpf/Makefile.am | 14 +++++++-------
- staprun/Makefile.am | 12 ++++++------
- 2 files changed, 13 insertions(+), 13 deletions(-)
+ stapbpf/Makefile.am | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
 
-Index: git/stapbpf/Makefile.am
-===================================================================
---- git.orig/stapbpf/Makefile.am
-+++ git/stapbpf/Makefile.am
-@@ -41,10 +41,10 @@
+diff --git a/stapbpf/Makefile.am b/stapbpf/Makefile.am
+index 4bd116bc3..e06d0801b 100644
+--- a/stapbpf/Makefile.am
++++ b/stapbpf/Makefile.am
+@@ -40,10 +40,10 @@ git_version.stamp ../git_version.h:
  
  # Why the "id -u" condition?  This way, an unprivileged user can run
  # make install, and have "sudo stap ...." or "sudo stapbpf ...." work later.
diff --git a/meta/recipes-kernel/systemtap/systemtap/readline.patch b/meta/recipes-kernel/systemtap/systemtap/readline.patch
index d7afc800cd..f452188179 100644
--- a/meta/recipes-kernel/systemtap/systemtap/readline.patch
+++ b/meta/recipes-kernel/systemtap/systemtap/readline.patch
@@ -1,4 +1,7 @@
-configure: add option to enable/disable readline
+From ee20cb1c1ca0337c56087934efbd66ba30d2d5c3 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Mon, 13 Apr 2026 11:28:39 +0100
+Subject: [PATCH] configure: add option to enable/disable readline
 
 Add an option to control explicitly whether systemtap will look for and
 use readline, for reproducible builds.
@@ -10,11 +13,14 @@ not be used.
 
 Upstream-Status: Submitted [https://sourceware.org/pipermail/systemtap/2026q2/028333.html]
 Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ configure.ac | 67 +++++++++++++++++++++++++++++-----------------------
+ 1 file changed, 38 insertions(+), 29 deletions(-)
 
-diff --git i/configure.ac w/configure.ac
-index 6fb99da40..01457bafb 100644
---- i/configure.ac
-+++ w/configure.ac
+diff --git a/configure.ac b/configure.ac
+index 6fb99da40..2ec72e85a 100644
+--- a/configure.ac
++++ b/configure.ac
 @@ -525,38 +525,47 @@ AC_CHECK_HEADERS([rpm/rpmcrypto.h], [
                        have_rpmcrypto_h=yes
  		      AC_MSG_NOTICE([separate rpm/rpmcrypto.h])])
@@ -23,7 +29,7 @@ index 6fb99da40..01457bafb 100644
 -dnl
 -dnl First save the orignal value of LIBS.
 -LIBS_no_readline=$LIBS
- 
+-
 -dnl Check how for readline presence and how to link with it. On some
 -dnl systems you need to add a termcap compatible library.
 -have_libreadline="no"
@@ -31,6 +37,7 @@ index 6fb99da40..01457bafb 100644
 -for libtermcap in "" tinfo ncursesw ncurses curses termcap; do
 -  if test -z "$libtermcap"; then
 -    READLINE_LIBS="-lreadline"
++
 +AC_ARG_WITH([readline],
 +  AS_HELP_STRING([--without-readline],[disable use of readline]), [], [with_readline="check"])
 +
@@ -66,17 +73,17 @@ index 6fb99da40..01457bafb 100644
 +    READLINE_LIBS=""
    else
 -    READLINE_LIBS="-lreadline -l$libtermcap"
-+    AC_MSG_RESULT([$READLINE_LIBS])
-+    AC_DEFINE(HAVE_LIBREADLINE, [1],
-+        [Define if you have the readline library (-lreadline).])
-   fi
+-  fi
 -  LIBS="$READLINE_LIBS $LIBS_no_readline"
 -  AC_LINK_IFELSE(
 -    [AC_LANG_CALL([],[readline])],
 -    [have_libreadline="yes"])
 -  if test "$have_libreadline" = "yes"; then
 -    break
--  fi
++    AC_MSG_RESULT([$READLINE_LIBS])
++    AC_DEFINE(HAVE_LIBREADLINE, [1],
++        [Define if you have the readline library (-lreadline).])
+   fi
 -done
 -if test "$have_libreadline" = "no"; then
 -  AC_MSG_RESULT([none])
diff --git a/meta/recipes-kernel/systemtap/systemtap_5.4.bb b/meta/recipes-kernel/systemtap/systemtap_5.5.bb
similarity index 100%
rename from meta/recipes-kernel/systemtap/systemtap_5.4.bb
rename to meta/recipes-kernel/systemtap/systemtap_5.5.bb
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recipes-kernel/systemtap/systemtap_git.inc
index a18381a56d..7845905d10 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.inc
+++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
@@ -5,11 +5,10 @@ SRC_URI = "git://sourceware.org/git/systemtap.git;protocol=https;branch=master;t
            file://0001-Do-not-let-configure-write-a-python-location-into-th.patch \
            file://0001-Install-python-modules-to-correct-library-dir.patch \
            file://0001-staprun-stapbpf-don-t-support-installing-a-non-root.patch \
-           file://0001-elaborate.cxx-fix-32-bit-build.patch \
            file://readline.patch \
            "
 
-SRCREV = "911a1354aac264651fda932061e7f20d2ecc2471"
+SRCREV = "90b164cf106ef16f873ab58c8c6f653718bb6e17"
 
 COMPATIBLE_HOST = '(x86_64|i.86|powerpc|arm|aarch64|microblazeel|mips|riscv64|riscv32).*-linux'
 COMPATIBLE_HOST:libc-musl = 'null'
-- 
2.47.3


