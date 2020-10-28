Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web11.3904.1603919179112423918
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2020 14:06:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HxeEDZJy;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id k9so957699edo.5
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2020 14:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YEMSJhB4Pyhd+DIzdH0//lpSU72s/t2wn42rYaFdGO8=;
        b=HxeEDZJyur3aBUmBIg3Q5yqh1ElcfiZl58a+r25RE6b709l9xpYZ3Zye+Q/i30N0RE
         q5XU65U1YzqB+tfhDrwVZD/lm8HeAD74LF9JJn36Y2ACXRC5RjA8BRfZsEWmxp+NEH1D
         QIkFPc5/U9iyvtglo4uCbdfv+KjXGHUM4HzxBIwf3j2s6TckT2xrQ8xCVM7pGdOzaguP
         Hu8QmooDY/pGtBqCZqfXAXDPZ098/jEQ5iuQ3CU3ccVlmvhThst5LLA4jCXPu2pfR0oS
         mT9nkMJK/k6cIYzW1mdzGYqrcodgN0eIAXBoTLoDXTuxISdM/ZtPts8wooHfjLMXsnDe
         crUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YEMSJhB4Pyhd+DIzdH0//lpSU72s/t2wn42rYaFdGO8=;
        b=Uii60dj9eRwl0K+TEvyCXoUSMpb7aPPH3iugJF3l0u7NRIseGbAVFGYKU0oT3hly4i
         pereGEekr28+KrfRjlDf8wIl9+7alsBepBNteySRqiUl3pcSi35OuWldBFi9eJtVUFUu
         d2q4c6UkXlozrvwQerHVgN4yEXJFANVPNZ/PeWsDWpZne+HFOEPBtrG3Ue7If+4M46Qi
         mK1roXeBcZYmiUPOFG2om0iGBp7snUTHimsXeDMXawMEK0zO5QN/QTk4kwX7oIYAHwv8
         vkDr53+KP4fg0wtDRIxl2Yu1/7KlAXo1VFsakXnXSyKS1QVTWst0OptzyFcXc3+2sEcB
         7YIA==
X-Gm-Message-State: AOAM532cf5VM0DNCgdXIGXDb+AVeNh3egKMnDdkvJZg7THbSqGEMae/7
	UGXQ8k+dfc8v+/DX3szxw3MQzFnUJ/1EGQ==
X-Google-Smtp-Source: ABdhPJxosCgbKAIgb5MO4WMw0gzZmJDfM63ftF2YIfrIUbsNvWpwCwSDE7sDpbc+FaOqLWxpDL5/Ng==
X-Received: by 2002:a50:c40c:: with SMTP id v12mr819532edf.233.1603919177358;
        Wed, 28 Oct 2020 14:06:17 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id q25sm352434eja.86.2020.10.28.14.06.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2020 14:06:16 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 13/33] ghostscript: update 9.52 -> 9.53.3
Date: Wed, 28 Oct 2020 22:05:38 +0100
Message-Id: <20201028210558.21070-13-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201028210558.21070-1-alex.kanavin@gmail.com>
References: <20201028210558.21070-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ghostscript-9.15-parallel-make.patch rebased; one of the
chunks removed upstream.

Remove bundled jpeg source, as that seems to be the only way
to get ghostscript to fall back to system jpeg library.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../ghostscript/CVE-2020-15900.patch          | 54 -------------------
 .../ghostscript-9.15-parallel-make.patch      | 24 +++------
 ...stscript_9.52.bb => ghostscript_9.53.3.bb} |  8 +--
 3 files changed, 12 insertions(+), 74 deletions(-)
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2020-15900.patch
 rename meta/recipes-extended/ghostscript/{ghostscript_9.52.bb => ghostscript_9.53.3.bb} (96%)

diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2020-15900.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2020-15900.patch
deleted file mode 100644
index d7c5f034e5..0000000000
--- a/meta/recipes-extended/ghostscript/ghostscript/CVE-2020-15900.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From 5d499272b95a6b890a1397e11d20937de000d31b Mon Sep 17 00:00:00 2001
-From: Ray Johnston <ray.johnston@artifex.com>
-Date: Wed, 22 Jul 2020 09:57:54 -0700
-Subject: [PATCH] Bug 702582, CVE 2020-15900 Memory Corruption in Ghostscript
- 9.52
-
-Fix the 'rsearch' calculation for the 'post' size to give the correct
-size.  Previous calculation would result in a size that was too large,
-and could underflow to max uint32_t. Also fix 'rsearch' to return the
-correct 'pre' string with empty string match.
-
-A future change may 'undefine' this undocumented, non-standard operator
-during initialization as we do with the many other non-standard internal
-PostScript operators and procedures.
-
-Upstream-Status: Backport [https://git.ghostscript.com/?p=ghostpdl.git;a=commitdiff;h=5d499272b95a6b890a1397e11d20937de000d31b]
-CVE: CVE-2020-15900
-Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
----
- psi/zstring.c | 17 +++++++++++------
- 1 file changed, 11 insertions(+), 6 deletions(-)
-
-diff --git a/psi/zstring.c b/psi/zstring.c
-index 33662dafa..58e1af2b3 100644
---- a/psi/zstring.c
-+++ b/psi/zstring.c
-@@ -142,13 +142,18 @@ search_impl(i_ctx_t *i_ctx_p, bool forward)
-     return 0;
- found:
-     op->tas.type_attrs = op1->tas.type_attrs;
--    op->value.bytes = ptr;
--    r_set_size(op, size);
-+    op->value.bytes = ptr;				/* match */
-+    op->tas.rsize = size;				/* match */
-     push(2);
--    op[-1] = *op1;
--    r_set_size(op - 1, ptr - op[-1].value.bytes);
--    op1->value.bytes = ptr + size;
--    r_set_size(op1, count + (!forward ? (size - 1) : 0));
-+    op[-1] = *op1;					/* pre */
-+    op[-3].value.bytes = ptr + size;			/* post */
-+    if (forward) {
-+        op[-1].tas.rsize = ptr - op[-1].value.bytes;	/* pre */
-+        op[-3].tas.rsize = count;			/* post */
-+    } else {
-+        op[-1].tas.rsize = count;			/* pre */
-+        op[-3].tas.rsize -= count + size;		/* post */
-+    }
-     make_true(op);
-     return 0;
- }
--- 
-2.17.1
-
diff --git a/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.15-parallel-make.patch b/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.15-parallel-make.patch
index ffa269e3b2..5b57da2a97 100644
--- a/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.15-parallel-make.patch
+++ b/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.15-parallel-make.patch
@@ -1,7 +1,7 @@
-From 84bb692d6b047c09266de154f404af9817fa04aa Mon Sep 17 00:00:00 2001
+From 04a86a613e0f9bfbbad99874f72217f75e8c53a3 Mon Sep 17 00:00:00 2001
 From: Robert Yang <liezhi.yang@windriver.com>
 Date: Thu, 29 Mar 2018 15:59:05 +0800
-Subject: [PATCH 01/10] contrib.mak: fix for parallel build
+Subject: [PATCH] contrib.mak: fix for parallel build
 
 Upstream-Status: Pending
 
@@ -9,23 +9,16 @@ Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
 
 Rebase to 9.23
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+
 ---
- contrib/contrib.mak | 2 ++
- 1 file changed, 2 insertions(+)
+ contrib/contrib.mak | 1 +
+ 1 file changed, 1 insertion(+)
 
 diff --git a/contrib/contrib.mak b/contrib/contrib.mak
-index f5a2fa4..4999752 100644
+index 2edee7a..c9100e8 100644
 --- a/contrib/contrib.mak
 +++ b/contrib/contrib.mak
-@@ -1067,6 +1067,7 @@ $(DEVOBJ)dviprlib.$(OBJ) : $(JAPSRC)dviprlib.c $(JAPSRC)dviprlib.h \
- 	$(DEVCC) $(O_)$@ $(C_) $(JAPSRC)dviprlib.c
- 
- extra-dmprt-install: install-libdata
-+	mkdir -p $(DESTDIR)$(gsdatadir)$(D)lib
- 	$(INSTALL_DATA) $(JAPSRC)dmp_init.ps $(DESTDIR)$(gsdatadir)$(D)lib || exit 1
- 	$(INSTALL_DATA) $(JAPSRC)dmp_site.ps $(DESTDIR)$(gsdatadir)$(D)lib || exit 1
- 	$(INSTALL_DATA) $(JAPSRC)escp_24.src $(DESTDIR)$(gsdatadir)$(D)lib || exit 1
-@@ -1235,6 +1236,7 @@ $(DEVOBJ)gdevalps.$(OBJ) : $(JAPSRC)gdevalps.c $(PDEVH) \
+@@ -1241,6 +1241,7 @@ $(DEVOBJ)gdevalps.$(OBJ) : $(JAPSRC)gdevalps.c $(PDEVH) \
  ### ----------------- Additional .upp files ---------------- ###
  
  extra-upp-install: install-libdata
@@ -33,6 +26,3 @@ index f5a2fa4..4999752 100644
  	for f in $(CONTRIBSRC)uniprint$(D)*.upp; do \
  	    $(INSTALL_DATA) $$f $(DESTDIR)$(gsdatadir)$(D)lib || exit 1; \
  	done
--- 
-1.8.3.1
-
diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.52.bb b/meta/recipes-extended/ghostscript/ghostscript_9.53.3.bb
similarity index 96%
rename from meta/recipes-extended/ghostscript/ghostscript_9.52.bb
rename to meta/recipes-extended/ghostscript/ghostscript_9.53.3.bb
index 65135f5821..cbf60c8c85 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.52.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.53.3.bb
@@ -34,7 +34,6 @@ SRC_URI_BASE = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/d
 SRC_URI = "${SRC_URI_BASE} \
            file://ghostscript-9.21-prevent_recompiling.patch \
            file://cups-no-gcrypt.patch \
-           file://CVE-2020-15900.patch \
            "
 
 SRC_URI_class-native = "${SRC_URI_BASE} \
@@ -42,8 +41,7 @@ SRC_URI_class-native = "${SRC_URI_BASE} \
                         file://base-genht.c-add-a-preprocessor-define-to-allow-fope.patch \
                         "
 
-SRC_URI[md5sum] = "0f6964ab9b83a63b7e373f136243f901"
-SRC_URI[sha256sum] = "c2501d8e8e0814c4a5aa7e443e230e73d7af7f70287546f7b697e5ef49e32176"
+SRC_URI[sha256sum] = "6eaf422f26a81854a230b80fd18aaef7e8d94d661485bd2e97e695b9dce7bf7f"
 
 # Put something like
 #
@@ -84,6 +82,10 @@ BUILD_CFLAGS += "-DHAVE_SYS_TIME_H=1"
 
 inherit autotools-brokensep
 
+do_configure_prepend_class-target () {
+        rm -rf ${S}/jpeg/
+}
+
 do_configure_append () {
 	# copy tools from the native ghostscript build
 	if [ "${PN}" != "ghostscript-native" ]; then
-- 
2.29.0

