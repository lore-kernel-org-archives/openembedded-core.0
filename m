Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDC5AC433EF
	for <webhook@archiver.kernel.org>; Mon,  6 Dec 2021 23:24:38 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web09.59593.1638833077604092389
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Dec 2021 15:24:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UHCj/BSB;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id a18so25689117wrn.6
        for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Dec 2021 15:24:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NOTjcADjC9XFmwuxVDUdDNevsTVIj5Q4p015nr+oatA=;
        b=UHCj/BSBPkoRtZeeLSPc4jFoIeJjUJACM+Ljco5RbPFvlqQt/NMNgRmwNVMJ8p8VG2
         HkmV+T+3cVYW2qkLTrMnpGlKvx8lFxgLDwBxU6po50YzwnLta9e2CAyzzX/eTO+wS+on
         kNOf1Hhqnu8dT07Oa0AvTZAvvaN+HAmljq1B0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NOTjcADjC9XFmwuxVDUdDNevsTVIj5Q4p015nr+oatA=;
        b=TiUym1lVgTbYvvNxRRMt1h4tgW7NdfXq578/ROw4yKhNi912X4qz4NIoP4q6garCKi
         Tjl1tYu2w5W0cW3LeWq6nEg5rCOseni0RjIxTdfiWUK3EAExkhCAFqVb014ma7Fkfi+e
         pNnfG0z+9Ky/fJ1WVW0barAx7ajgo9ZgzWU4O0R6oYcofXu3b0BGusgexFthJ1PsHctM
         ajxbtuhMvR/ZENRTH7wxtQIsNLdFkEiydhWfXVhpUI7280eJDXdMfX5DQxB5grvzxoKT
         n4eSfB2OA6WCbuhfJFNzlhn5gNmL4Uoz+ceU8e494BXURmcqCNFRfG7H0x35FeA0LpHh
         ZWXA==
X-Gm-Message-State: AOAM531Ju6Ehlf5w84gvkUdSF8DFOCRScabu3k676AakXJbVUSDOZ38b
	VNQBYt4XUnGD2hbuqYSrOPDeH1KlSIxQOQ==
X-Google-Smtp-Source: 
 ABdhPJxF+hMpvIk3fURRYzQxVQBIjC7PvCcpeirshKqIRW96QXXHBiQbUN/vHFOT7fSYBZUtScaXPg==
X-Received: by 2002:a5d:4084:: with SMTP id o4mr48548387wrp.47.1638833075649;
        Mon, 06 Dec 2021 15:24:35 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:a430:ef69:a06e:8b4a])
        by smtp.gmail.com with ESMTPSA id
 j18sm929768wmq.44.2021.12.06.15.24.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Dec 2021 15:24:35 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] glibc: Drop patch for obsolete conflict issue
Date: Mon,  6 Dec 2021 23:24:35 +0000
Message-Id: <20211206232435.514340-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Dec 2021 23:24:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159274

We're no longer patching files called "libm-test-ulps" so this patch isn't
really needed. Regardless, if we were, we should fix the real issue in the
upstream code which may have already happened. Drop this patch.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...m-err-tab.pl-with-specific-dirs-in-S.patch | 33 -------------------
 meta/recipes-core/glibc/glibc_2.34.bb         |  1 -
 2 files changed, 34 deletions(-)
 delete mode 100644 meta/recipes-core/glibc/glibc/0013-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch

diff --git a/meta/recipes-core/glibc/glibc/0013-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch b/meta/recipes-core/glibc/glibc/0013-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch
deleted file mode 100644
index 474cea5a0de..00000000000
--- a/meta/recipes-core/glibc/glibc/0013-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From c5047b8f7d1a17324cfa02b99f07a70ebcec2cf2 Mon Sep 17 00:00:00 2001
-From: Ting Liu <b28495@freescale.com>
-Date: Wed, 19 Dec 2012 04:39:57 -0600
-Subject: [PATCH] eglibc: run libm-err-tab.pl with specific dirs in ${S}
-
-libm-err-tab.pl will parse all the files named "libm-test-ulps"
-in the given dir recursively. To avoid parsing the one in
-${S}/.pc/ (it does exist after eglibc adds aarch64 support,
-${S}/.pc/aarch64-0001-glibc-fsf-v1-eaf6f205.patch/ports/sysdeps/
-aarch64/libm-test-ulps), run libm-err-tab.pl with specific dirs
-in ${S}.
-
-Upstream-Status: Inappropriate [OE specific]
-
-Signed-off-by: Ting Liu <b28495@freescale.com>
----
- manual/Makefile | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/manual/Makefile b/manual/Makefile
-index e83444341e..aa2645bc55 100644
---- a/manual/Makefile
-+++ b/manual/Makefile
-@@ -103,7 +103,8 @@ $(objpfx)stamp-libm-err: $(..)math/gen-libm-test.py \
- 			 $(wildcard $(foreach dir,$(sysdirs),\
- 						  $(dir)/libm-test-ulps))
- 	pwd=`pwd`; \
--	$(PYTHON) $< -s $$pwd/.. -m $(objpfx)libm-err-tmp
-+	$(PYTHON) $< -s $$pwd/../ports -m $(objpfx)libm-err-tmp
-+	$(PYTHON) $< -s $$pwd/../sysdeps -m $(objpfx)libm-err-tmp
- 	$(move-if-change) $(objpfx)libm-err-tmp $(objpfx)libm-err.texi
- 	touch $@
- 
diff --git a/meta/recipes-core/glibc/glibc_2.34.bb b/meta/recipes-core/glibc/glibc_2.34.bb
index 2f3065484d1..cdce2c4112c 100644
--- a/meta/recipes-core/glibc/glibc_2.34.bb
+++ b/meta/recipes-core/glibc/glibc_2.34.bb
@@ -34,7 +34,6 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://makedbs.sh \
            \
            ${NATIVESDKFIXES} \
-           file://0013-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch \
            file://0015-sysdeps-gnu-configure.ac-handle-correctly-libc_cv_ro.patch \
            file://0016-yes-within-the-path-sets-wrong-config-variables.patch \
            file://0017-timezone-re-written-tzselect-as-posix-sh.patch \
-- 
2.32.0


