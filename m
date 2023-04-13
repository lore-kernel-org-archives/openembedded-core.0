Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15BB8C77B61
	for <webhook@archiver.kernel.org>; Thu, 13 Apr 2023 05:54:41 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web10.5879.1681365275974997540
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Apr 2023 22:54:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=TqKhOHT6;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id hg14-20020a17090b300e00b002471efa7a8fso470229pjb.0
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Apr 2023 22:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681365275; x=1683957275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qVs85qEIL9oyHm2VcltaypNOawPwxoZ16j5joV0Q9ZA=;
        b=TqKhOHT6mobI5VpKeWXfyA1He9yskQiKaT5zMNSEBnE06qAKuu9VaznlU9ZZMM5R2S
         0QeEeLIUdeuQXsz5zzS4xEagRbMjI5I0LEnO3/Ut2+vfGw7J7WRQVTg9tcxvtfYhehYb
         pw/ZNz+JrRGRnd0+gsIJYHnD2gCSQilFro3ABz7C8KLb6RqLyHu+Qg1ikg5Vqe01G2Ut
         SO3my2FOK3DNWml4ucR4JG05iDKXg2NwujjmOPGdbpS2FegIWWOz+r0REVQGzI14tusU
         YQ4nnYx7Ce1V1Sg7ikcvJV2/iq5pHAjUWqLzZdh0GJT50bMoHys5GCx9W+WCXVb+NyZG
         KZAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681365275; x=1683957275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qVs85qEIL9oyHm2VcltaypNOawPwxoZ16j5joV0Q9ZA=;
        b=PROzeXlwxq/gdMPORBxUsuKN1kcVdIZwEsjF2nYvthYZ3xAW6EMFCEMKoi39QpSOqN
         cB88YNcLDpUxWji39WkgUqII86dE5OXYv9RxSOvM/EnGZTVBLkTKX+uo3vhQJPOV7BTD
         Q79Ol0bfotp12fq4V+fu6irXxZerLGT6VDRI/A9FCL07f4vO6glcBqS+mtf0wIvrq6Gt
         nL0SQKGpOTCGHZhZoReHkW4q957GpfkObeCuITLaFWzCLGS9oiP8ON5hR5wlH/Y6AREr
         cnlW+hT0LYlL+KnBm7VV7bNQHexMNFrPUhnPTBkNc0yJCpErxdnt4jdw5D658ZESDqoB
         gnYQ==
X-Gm-Message-State: AAQBX9eIyLBjNLNicII6n8oHSkU70zldby1OsZ6DceR1EYeadakFzGrJ
	s+80tvilGE6xJCw3P33SgQJVOOkEpLk=
X-Google-Smtp-Source: AKy350avU9d17jJQTFgRrXWot1kHW5GAcOkrjfsQKDw/yzDcazFaPJJHX+7j5+OTKKGVg+1mlqWCtQ==
X-Received: by 2002:a17:90b:3747:b0:246:f73c:3aba with SMTP id ne7-20020a17090b374700b00246f73c3abamr699489pjb.39.1681365275086;
        Wed, 12 Apr 2023 22:54:35 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::ebd0])
        by smtp.gmail.com with ESMTPSA id on1-20020a17090b1d0100b00244b13111e6sm2410781pjb.38.2023.04.12.22.54.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Apr 2023 22:54:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] gawk: Fix ptests on musl
Date: Wed, 12 Apr 2023 22:54:32 -0700
Message-Id: <20230413055432.1977413-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230413055432.1977413-1-raj.khem@gmail.com>
References: <20230413055432.1977413-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Apr 2023 05:54:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179958

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...0001-Provide-fixes-for-tests-on-musl.patch | 73 +++++++++++++++++++
 meta/recipes-extended/gawk/gawk_5.2.1.bb      |  7 +-
 2 files changed, 77 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-extended/gawk/gawk/0001-Provide-fixes-for-tests-on-musl.patch

diff --git a/meta/recipes-extended/gawk/gawk/0001-Provide-fixes-for-tests-on-musl.patch b/meta/recipes-extended/gawk/gawk/0001-Provide-fixes-for-tests-on-musl.patch
new file mode 100644
index 0000000000..4ff2466c0e
--- /dev/null
+++ b/meta/recipes-extended/gawk/gawk/0001-Provide-fixes-for-tests-on-musl.patch
@@ -0,0 +1,73 @@
+From 95bcf4397b6f727208f3c627b7d00dacec406d02 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 12 Apr 2023 21:57:18 -0700
+Subject: [PATCH] Provide fixes for tests on musl
+
+Fixes rebt8b1 and regx8bit
+Disable clos1way6 [1]
+
+Disable commas and backsmalls1, they do not work
+with musl-locales somehow even though we do isntall
+en_US.UTF-8 on target
+
+[1] https://lists.gnu.org/archive/html/bug-gawk/2021-02/msg00005.html
+
+Upstream-Status: Inappropriate [musl-specific]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ test/Maketests | 11 ++++-------
+ 1 file changed, 4 insertions(+), 7 deletions(-)
+
+--- a/test/Maketests
++++ b/test/Maketests
+@@ -916,7 +916,8 @@ rebrackloc:
+ 
+ rebt8b1:
+ 	@echo $@
+-	@-AWKPATH="$(srcdir)" $(AWK) -f $@.awk  >_$@ 2>&1 || echo EXIT CODE: $$? >>_$@
++	@-[ -z "$$LANG" ] && LANG=C; export LANG; \
++	AWKPATH="$(srcdir)" $(AWK) -f $@.awk  >_$@ 2>&1 || echo EXIT CODE: $$? >>_$@
+ 	@-$(CMP) "$(srcdir)"/$@.ok _$@ && rm -f _$@
+ 
+ rebuild:
+@@ -1391,17 +1392,6 @@ clos1way5:
+ 	@-AWKPATH="$(srcdir)" $(AWK) -f $@.awk  >_$@ 2>&1 || echo EXIT CODE: $$? >>_$@
+ 	@-$(CMP) "$(srcdir)"/$@.ok _$@ && rm -f _$@
+ 
+-clos1way6:
+-	@echo $@ $(ZOS_FAIL)
+-	@-AWKPATH="$(srcdir)" $(AWK) -f $@.awk  >_$@ 2>&1 || echo EXIT CODE: $$? >>_$@
+-	@-$(CMP) "$(srcdir)"/$@.ok _$@ && rm -f _$@
+-
+-commas:
+-	@echo $@ $(ZOS_FAIL)
+-	@-[ -z "$$GAWKLOCALE" ] && GAWKLOCALE=en_US.UTF-8; export GAWKLOCALE; \
+-	AWKPATH="$(srcdir)" $(AWK) -f $@.awk  >_$@ 2>&1 || echo EXIT CODE: $$? >>_$@
+-	@-$(CMP) "$(srcdir)"/$@.ok _$@ && rm -f _$@
+-
+ crlf:
+ 	@echo $@
+ 	@-AWKPATH="$(srcdir)" $(AWK) -f $@.awk  >_$@ 2>&1 || echo EXIT CODE: $$? >>_$@
+@@ -2003,7 +1993,8 @@ regnul2:
+ 
+ regx8bit:
+ 	@echo $@
+-	@-AWKPATH="$(srcdir)" $(AWK) -f $@.awk  >_$@ 2>&1 || echo EXIT CODE: $$? >>_$@
++	@-[ -z "$$LANG" ] && LANG=C; export LANG; \
++	AWKPATH="$(srcdir)" $(AWK) -f $@.awk  >_$@ 2>&1 || echo EXIT CODE: $$? >>_$@
+ 	@-$(CMP) "$(srcdir)"/$@.ok _$@ && rm -f _$@
+ 
+ reint:
+@@ -2256,12 +2247,6 @@ backbigs1:
+ 	@echo $@ $(ZOS_FAIL)
+ 	@-[ -z "$$GAWKLOCALE" ] && GAWKLOCALE=en_US.UTF-8; export GAWKLOCALE; \
+ 	AWKPATH="$(srcdir)" $(AWK) -f $@.awk  < "$(srcdir)"/$@.in >_$@ 2>&1 || echo EXIT CODE: $$? >>_$@
+-	@-$(CMP) "$(srcdir)"/$@.ok _$@ && rm -f _$@
+-
+-backsmalls1:
+-	@echo $@ $(ZOS_FAIL)
+-	@-[ -z "$$GAWKLOCALE" ] && GAWKLOCALE=en_US.UTF-8; export GAWKLOCALE; \
+-	AWKPATH="$(srcdir)" $(AWK) -f $@.awk  < "$(srcdir)"/$@.in >_$@ 2>&1 || echo EXIT CODE: $$? >>_$@
+ 	@-$(CMP) "$(srcdir)"/$@.ok _$@ && rm -f _$@
+ 
+ backsmalls2:
diff --git a/meta/recipes-extended/gawk/gawk_5.2.1.bb b/meta/recipes-extended/gawk/gawk_5.2.1.bb
index e381bad148..b2eb6987ed 100644
--- a/meta/recipes-extended/gawk/gawk_5.2.1.bb
+++ b/meta/recipes-extended/gawk/gawk_5.2.1.bb
@@ -19,7 +19,7 @@ SRC_URI = "${GNU_MIRROR}/gawk/gawk-${PV}.tar.gz \
            file://remove-sensitive-tests.patch \
            file://run-ptest \
            "
-
+SRC_URI:append:libc-musl = " file://0001-Provide-fixes-for-tests-on-musl.patch "
 SRC_URI[sha256sum] = "529e7c8c6acf21ff3a6183f4d763c632810908989c24675c77995d51ac37b79c"
 
 inherit autotools gettext texinfo update-alternatives
@@ -62,8 +62,9 @@ do_install_ptest() {
 	rm -f ${D}${PTEST_PATH}/test/timeout.*
 }
 
-RDEPENDS:${PN}-ptest += "make"
+RDEPENDS:${PN}-ptest += "make locale-base-en-us"
 
-RDEPENDS:${PN}-ptest:append:libc-glibc = " locale-base-en-us locale-base-en-us.iso-8859-1"
+RDEPENDS:${PN}-ptest:append:libc-glibc = " locale-base-en-us.iso-8859-1"
+RDEPENDS:${PN}-ptest:append:libc-musl = " musl-locales"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.40.0


