Return-Path: <victor.kamensky7@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1160FE7AD7B
	for <webhook@archiver.kernel.org>; Fri, 26 Dec 2025 02:48:45 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.147475.1766717322428738423
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Dec 2025 18:48:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cN+dfujA;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: victor.kamensky7@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-bde0f62464cso6690139a12.2
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Dec 2025 18:48:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766717321; x=1767322121; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EaPWKSmVp6DarvEUYnU60dhs6ihR5Qx0g7p96EBfVcE=;
        b=cN+dfujAqPsx2kAM45FgMJHpYpm+TXdxwCOPArdaaXxuLV/43eLBQi4oMrzMadt3+c
         KcUoKVV/DQtDPsMh8kk2HOZiVxAGOTsM468+jnDoBpiu+WzgKYi6TUUI7JzFqRRTe687
         wN3JEy77swL5rWjFfn/70JDy4ShcWQIT5bpinA6r/bhF/RqK0r5WsA5ButisPJ3l7Ff/
         T8HCRgZvV65sKP586uIDuHn1UpLLF2g+VuY5pslmUkxVrELd5Ffssirw9ZajFY4uRet5
         ZkLgQgmered/dlhDvGXogpPOCoUsB3hL6vL8wy6d+Jz2QB5w6scB7ENWKkR1wOy57wzo
         IDHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766717321; x=1767322121;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EaPWKSmVp6DarvEUYnU60dhs6ihR5Qx0g7p96EBfVcE=;
        b=u3+vgy4oFGeCpbnePwGw9N4E2SIqrsPnom0AoHqGyM6cLa5ayOgG1Waw9rSCEaQ+r6
         fHH7JzEfb5Ww7e5I67oM1az4JkCsXrEsI2Scw3A97gnRfdfqXGdx6pI4i0x3eaDF3PL6
         ibnv+Dt61uopaXbytwxpEQuZaytEd7pMeqpWr4yOTobvJ5b23rZhT88Ln/7+U4SdmJAb
         vSMMZF87ttbvSofHsI0JZ1ZYT57KMW1IKrUUK9KwMAX5WnSRV+WhvxRUT2Ne+oZcGnzv
         559c0WikIkTaGuczFJG+dWt8xwSUjveaVn/OEIJTyBNNnoxTC2AhAH/tnmq9rNVY7CW4
         hGbA==
X-Gm-Message-State: AOJu0Yy4ceKewnBZjLFLW4aMz5GtU5IX5pCwMWHbXjOK0ZMUE1s0qNi/
	+B3wVktOY3zcnThcOfbXkps46u8VygWyy9L4wz9xgPvHfufZ0eTDmRjQ9wWEVg==
X-Gm-Gg: AY/fxX5TLel98laFNYK3XxCB0Xbge7ZkUzxk8sTyYv6pFqJD7a+h/wKMs6kT8NwFyFX
	DDaTbzdS+dIGYynUFTiSfgMZ/V3EyhiRqrAjsAPCiDxhBZCp6rYPxPfgA8kPNPasgwqj98PVfeU
	zRgUh3B8c22GKhvO3OJryZASa1EabkIohm+F8GYBOjeOXJUF9yuzZojW4p+B7mFu/KvFy02zuy4
	5RobEYvmpqJ8dzunx5wa4zINbnlGXqpax6dfTfrms/kvsbjcwpntWbXN+byr8ufhNfgVPzCg403
	Qj5xlhuFru9JwOPYDBghR9dX5PczmI/yUUHqu2ajf21JURd3527RMS71ubNKt67BjOhu0aWvG/h
	EvZVe0Wgi0Nwecg1NRkHx27n1pXHlkbXPoDEO16CR4NGRFQpy0ZYi0rIj0atOWCSvPVUlIj1ylO
	3YZ1ya5PqoW0mww6Pvrc0=
X-Google-Smtp-Source: AGHT+IGTz2Bsv2NmMyeVTItigU3qGDehG9/reEw2VUXcMQzr+yNqm12pYSCPAohW3YD/IEvjeoc4Og==
X-Received: by 2002:a05:7301:420a:b0:2ae:5cd4:6513 with SMTP id 5a478bee46e88-2b05ec97d48mr15058483eec.35.1766717320827;
        Thu, 25 Dec 2025 18:48:40 -0800 (PST)
Received: from kamensky-p15s.cisco.com ([2601:646:827e:e610::f46f])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b05fe5653esm49208826eec.1.2025.12.25.18.48.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Dec 2025 18:48:39 -0800 (PST)
From: Victor Kamensky <victor.kamensky7@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Victor Kamensky <victor.kamensky7@gmail.com>
Subject: [PATCH v2] systemtap: upgrade 5.3 -> 5.4
Date: Thu, 25 Dec 2025 18:48:12 -0800
Message-Id: <20251226024812.17109-1-victor.kamensky7@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Dec 2025 02:48:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228545

* removed upstreamed patch
* fixed patch fuzz issue
* backport 32bit build fix

Signed-off-by: Victor Kamensky <victor.kamensky7@gmail.com>
---
 ...-native_5.3.bb => systemtap-native_5.4.bb} |   0
 ...ython-modules-to-correct-library-dir.patch |   6 +-
 .../0001-elaborate.cxx-fix-32-bit-build.patch | 104 ++++++++++++++++++
 ...am-use-absolute-path-for-source-dire.patch |  36 ------
 .../{systemtap_5.3.bb => systemtap_5.4.bb}    |   1 -
 .../systemtap/systemtap_git.inc               |   3 +-
 6 files changed, 109 insertions(+), 41 deletions(-)
 rename meta/recipes-kernel/systemtap/{systemtap-native_5.3.bb => systemtap-native_5.4.bb} (100%)
 create mode 100644 meta/recipes-kernel/systemtap/systemtap/0001-elaborate.cxx-fix-32-bit-build.patch
 delete mode 100644 meta/recipes-kernel/systemtap/systemtap/0001-python-Makefile.am-use-absolute-path-for-source-dire.patch
 rename meta/recipes-kernel/systemtap/{systemtap_5.3.bb => systemtap_5.4.bb} (97%)

diff --git a/meta/recipes-kernel/systemtap/systemtap-native_5.3.bb b/meta/recipes-kernel/systemtap/systemtap-native_5.4.bb
similarity index 100%
rename from meta/recipes-kernel/systemtap/systemtap-native_5.3.bb
rename to meta/recipes-kernel/systemtap/systemtap-native_5.4.bb
diff --git a/meta/recipes-kernel/systemtap/systemtap/0001-Install-python-modules-to-correct-library-dir.patch b/meta/recipes-kernel/systemtap/systemtap/0001-Install-python-modules-to-correct-library-dir.patch
index ee9baedcda..21e3096405 100644
--- a/meta/recipes-kernel/systemtap/systemtap/0001-Install-python-modules-to-correct-library-dir.patch
+++ b/meta/recipes-kernel/systemtap/systemtap/0001-Install-python-modules-to-correct-library-dir.patch
@@ -1,4 +1,4 @@
-From 18d088d10c1a0885fa25ac40591e38c8aa545c81 Mon Sep 17 00:00:00 2001
+From 7847240a97f5010ebab775f7ac51812a7705a886 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 24 Feb 2017 17:53:02 +0200
 Subject: [PATCH] Install python modules to correct library dir.
@@ -19,11 +19,11 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 6 insertions(+), 2 deletions(-)
 
 diff --git a/python/Makefile.am b/python/Makefile.am
-index 13618dc2f..9d5cb7bcb 100644
+index 845db3661..130e90b24 100644
 --- a/python/Makefile.am
 +++ b/python/Makefile.am
 @@ -8,6 +8,10 @@ AUTOMAKE_OPTIONS = subdir-objects
- AM_CPPFLAGS = -I$(srcdir)/../includes
+ AM_CPPFLAGS = -I$(abs_srcdir)/../includes
  AM_CPPFLAGS += -I$(abs_builddir)/../includes/sys
  
 +# Add OE's CFLAGS which contains `-fdebug-prefix-map' options to
diff --git a/meta/recipes-kernel/systemtap/systemtap/0001-elaborate.cxx-fix-32-bit-build.patch b/meta/recipes-kernel/systemtap/systemtap/0001-elaborate.cxx-fix-32-bit-build.patch
new file mode 100644
index 0000000000..bfc9699728
--- /dev/null
+++ b/meta/recipes-kernel/systemtap/systemtap/0001-elaborate.cxx-fix-32-bit-build.patch
@@ -0,0 +1,104 @@
+From 94efb7c4eb02de0e3565cb165b53963602d3dcb6 Mon Sep 17 00:00:00 2001
+From: Sergei Trofimovich <slyich@gmail.com>
+Date: Sun, 30 Nov 2025 20:58:01 +0000
+Subject: [PATCH] elaborate.cxx: fix 32-bit build
+
+Without the change the build fails on i686-linux as:
+
+    elaborate.cxx:5119:33: error:
+      format '%ld' expects argument of type 'long int',
+      but argument 2 has type 'int64_t' {aka 'long long int'} [-Werror=format=]
+     5119 |       session.print_warning (_F("Collapsing unresolved @define to %ld [stapprobes]", value), e->tok);
+          |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+Upstream-Status: Backport [https://sourceware.org/git/?p=systemtap.git;a=patch;h=94efb7c4eb02de0e3565cb165b53963602d3dcb6]
+Signed-off-by: Victor Kamensky <victor.kamensky7@gmail.com>
+---
+ elaborate.cxx    | 2 +-
+ po/cs.po         | 2 +-
+ po/en.po         | 2 +-
+ po/fr.po         | 2 +-
+ po/pl.po         | 2 +-
+ po/systemtap.pot | 2 +-
+ 6 files changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/elaborate.cxx b/elaborate.cxx
+index 93ecffa1a..3ad3614e7 100644
+--- a/elaborate.cxx
++++ b/elaborate.cxx
+@@ -5116,7 +5116,7 @@ const_folder::visit_defined_op (defined_op* e)
+       // Don't be greedy... we'll only collapse one at a time so type
+       // resolution can have another go at it.
+       relaxed_p = false;
+-      session.print_warning (_F("Collapsing unresolved @define to %ld [stapprobes]", value), e->tok);
++      session.print_warning (_F("Collapsing unresolved @define to %lld [stapprobes]", (long long)value), e->tok);
+       literal_number* n = new literal_number (value);
+       n->tok = e->tok;
+       n->visit (this);
+diff --git a/po/cs.po b/po/cs.po
+index df6412772..92fdef7ad 100644
+--- a/po/cs.po
++++ b/po/cs.po
+@@ -2039,7 +2039,7 @@ msgstr "Zahazuji kontrolu '@defined' bez vedlejších účinků "
+ 
+ #: elaborate.cxx:5119
+ #, fuzzy, c-format
+-msgid "Collapsing unresolved @define to %ld [stapprobes]"
++msgid "Collapsing unresolved @define to %lld [stapprobes]"
+ msgstr "Zahazuji kontrolu '@defined' bez vedlejších účinků "
+ 
+ #: elaborate.cxx:5127
+diff --git a/po/en.po b/po/en.po
+index 8847639e8..1db2292bd 100644
+--- a/po/en.po
++++ b/po/en.po
+@@ -2050,7 +2050,7 @@ msgstr ""
+ 
+ #: elaborate.cxx:5119
+ #, c-format
+-msgid "Collapsing unresolved @define to %ld [stapprobes]"
++msgid "Collapsing unresolved @define to %lld [stapprobes]"
+ msgstr ""
+ 
+ #: elaborate.cxx:5127
+diff --git a/po/fr.po b/po/fr.po
+index b8677707b..55e409919 100644
+--- a/po/fr.po
++++ b/po/fr.po
+@@ -2090,7 +2090,7 @@ msgstr ""
+ 
+ #: elaborate.cxx:5119
+ #, c-format
+-msgid "Collapsing unresolved @define to %ld [stapprobes]"
++msgid "Collapsing unresolved @define to %lld [stapprobes]"
+ msgstr ""
+ 
+ #: elaborate.cxx:5127
+diff --git a/po/pl.po b/po/pl.po
+index e3b6700ee..0b35880c1 100644
+--- a/po/pl.po
++++ b/po/pl.po
+@@ -1977,7 +1977,7 @@ msgstr ""
+ 
+ #: elaborate.cxx:5119
+ #, c-format
+-msgid "Collapsing unresolved @define to %ld [stapprobes]"
++msgid "Collapsing unresolved @define to %lld [stapprobes]"
+ msgstr ""
+ 
+ #: elaborate.cxx:5127
+diff --git a/po/systemtap.pot b/po/systemtap.pot
+index 32ddb2290..4ec0d9a8c 100644
+--- a/po/systemtap.pot
++++ b/po/systemtap.pot
+@@ -1973,7 +1973,7 @@ msgstr ""
+ 
+ #: elaborate.cxx:5119
+ #, c-format
+-msgid "Collapsing unresolved @define to %ld [stapprobes]"
++msgid "Collapsing unresolved @define to %lld [stapprobes]"
+ msgstr ""
+ 
+ #: elaborate.cxx:5127
+-- 
+2.45.0
+
diff --git a/meta/recipes-kernel/systemtap/systemtap/0001-python-Makefile.am-use-absolute-path-for-source-dire.patch b/meta/recipes-kernel/systemtap/systemtap/0001-python-Makefile.am-use-absolute-path-for-source-dire.patch
deleted file mode 100644
index dacd19edd1..0000000000
--- a/meta/recipes-kernel/systemtap/systemtap/0001-python-Makefile.am-use-absolute-path-for-source-dire.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 71e4ffd46dbbb7de1d06edb66f3e1fe0de423586 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Wed, 21 May 2025 13:25:46 +0200
-Subject: [PATCH] python/Makefile.am: use absolute path for source directory
- includes as well
-
-Otherwise it would be relative to the build directory,
-which works only if the build and source directory are in the
-same parent directory, and breaks if they're on different levels.
-
-Upstream-Status: Submitted [by email to fche@redhat.com,wcohen@redhat.com,systemtap@sourceware.org]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- python/Makefile.am | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/python/Makefile.am b/python/Makefile.am
-index 9d5cb7bcb..130e90b24 100644
---- a/python/Makefile.am
-+++ b/python/Makefile.am
-@@ -2,10 +2,10 @@
- 
- AUTOMAKE_OPTIONS = subdir-objects
- 
--# Note that we have to use 'abs_builddir' here since we change
-+# Note that we have to use absolute directores here since we change
- # directories back to the source directory when building the python
- # extension.
--AM_CPPFLAGS = -I$(srcdir)/../includes
-+AM_CPPFLAGS = -I$(abs_srcdir)/../includes
- AM_CPPFLAGS += -I$(abs_builddir)/../includes/sys
- 
- # Add OE's CFLAGS which contains `-fdebug-prefix-map' options to
--- 
-2.39.5
-
diff --git a/meta/recipes-kernel/systemtap/systemtap_5.3.bb b/meta/recipes-kernel/systemtap/systemtap_5.4.bb
similarity index 97%
rename from meta/recipes-kernel/systemtap/systemtap_5.3.bb
rename to meta/recipes-kernel/systemtap/systemtap_5.4.bb
index 588b3b8d36..254bac4d6f 100644
--- a/meta/recipes-kernel/systemtap/systemtap_5.3.bb
+++ b/meta/recipes-kernel/systemtap/systemtap_5.4.bb
@@ -9,7 +9,6 @@ require systemtap_git.inc
 SRC_URI += " \
            file://0001-improve-reproducibility-for-c-compiling.patch \
            file://0001-staprun-address-ncurses-6.3-failures.patch \
-           file://0001-python-Makefile.am-use-absolute-path-for-source-dire.patch \
            "
 
 DEPENDS = "elfutils"
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recipes-kernel/systemtap/systemtap_git.inc
index c5d10c8fd5..24b6f0ae02 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.inc
+++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
@@ -5,9 +5,10 @@ SRC_URI = "git://sourceware.org/git/systemtap.git;protocol=https;branch=master;t
            file://0001-Do-not-let-configure-write-a-python-location-into-th.patch \
            file://0001-Install-python-modules-to-correct-library-dir.patch \
            file://0001-staprun-stapbpf-don-t-support-installing-a-non-root.patch \
+           file://0001-elaborate.cxx-fix-32-bit-build.patch \
            "
 
-SRCREV = "c4fc655170b534478a6b131292b987630c7c0865"
+SRCREV = "911a1354aac264651fda932061e7f20d2ecc2471"
 
 COMPATIBLE_HOST = '(x86_64|i.86|powerpc|arm|aarch64|microblazeel|mips|riscv64|riscv32).*-linux'
 COMPATIBLE_HOST:libc-musl = 'null'
-- 
2.45.0


