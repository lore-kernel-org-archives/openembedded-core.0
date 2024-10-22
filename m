Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF2CBD0E6FC
	for <webhook@archiver.kernel.org>; Tue, 22 Oct 2024 05:13:22 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.11613.1729573996002895891
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Oct 2024 22:13:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OoZ0T9lD;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-71eb1d0e3c2so2039828b3a.2
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Oct 2024 22:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729573995; x=1730178795; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=24XxBZQdZFJc1afV9cAQ8JiwwG5w9/nVYr3ut7zSRH8=;
        b=OoZ0T9lDw76PVpKFswRJ+VmMNZEo3o42OsJTank4CCCuZuEYVAUu4L3GDU2Hbc6xaB
         lv+IsRXujoYpwG4ARVj6Zeu5u5wwRtTD6LCIU4umU4+wT6BsK9ePytCR7vJQ0SwO1//x
         nOgE1RAvH62YsvOZtPKeZLeQXeOc/EE5UXx0UztQUPk5FhY2uPGNdlcXLQ6yJn6oNc5q
         mJBerJ9foAMIX5OanwaviegDGe82r/zISq1fZUcv00p3RQ+xIehZqYGNj7dJaHBtqXgO
         VKpb09UmGrihG1SiYzccdxC1B4BYLJV3RRf0kk0SbtwDYzhLMrJTEVQ2e41T7tujuoRF
         pUHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729573995; x=1730178795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=24XxBZQdZFJc1afV9cAQ8JiwwG5w9/nVYr3ut7zSRH8=;
        b=h3sKDkSiiKfdOc2ZAYUa5/TSk4Xyy4n8dL+kHWNyIJU8qggY8UR4VaYo2DyiCQVIyD
         yqfqgOHxlkBQyfGuaVcufikT8KRftnKrzMZkWo2WWbyEZq67po2pISJXfRKkW2U3rMeG
         EO+lIDXKB1HtJNhgRjXpbgd1RIcU/cK9tFAs6W0zRq1ATsBJlb/PvIHmyNOL6boZeCXT
         gj/Br+4dqlolaIzGx0zXYQUDdoZ2w/XNfAQJSFeT5q6ELlYeyuar5lbIN6PvW31S/DHA
         XgJXNKR7ccKbbXZmEevFEsU805ogOIBISn/ln3hlc6wUc7HDQ9M1XREvEIU8HHk3IjYB
         wJ5g==
X-Gm-Message-State: AOJu0Yx+86VG3KQCG1vAUCgYqv3D53Uk0Vb/LS+LO1tDehI65acCfn2L
	+YgYrCqqB9vjSttkBGQNN4OwbrI8z2yp599fq212Ul8/Y+ljJxP2mjhqkzHF
X-Google-Smtp-Source: AGHT+IHkc0mGnpCSiZy9YNOC0ZEi+1C3bMh337UVW3e6kPBVsisXDcG5HrMaRH40O24LOYVAXcGGGA==
X-Received: by 2002:a05:6a00:1792:b0:71d:fe64:e3fa with SMTP id d2e1a72fcca58-71ea31e4c3amr19907774b3a.19.1729573995102;
        Mon, 21 Oct 2024 22:13:15 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::2fbb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ec1407eafsm3831095b3a.208.2024.10.21.22.13.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 22:13:14 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 3/3] python3-libarchive-c: Avoid using find_library python API
Date: Mon, 21 Oct 2024 22:13:10 -0700
Message-ID: <20241022051310.1846604-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241022051310.1846604-1-raj.khem@gmail.com>
References: <20241022051310.1846604-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Oct 2024 05:13:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206137

find_library API depends on platform to provide ldconfig, ld, gcc, objdump
etc, so either we add these dependencies or avoid them by computing the
libarchive library name during build, which we can be done.

This ensures that ffi module works with musl as well as glibc equally
as musl does not provide ldconfig like glibc does

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Rebased

 meta/recipes-devtools/python/python3-libarchive-c_5.1.bb | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-libarchive-c_5.1.bb b/meta/recipes-devtools/python/python3-libarchive-c_5.1.bb
index 3116c6b62ec..510e2d9159c 100644
--- a/meta/recipes-devtools/python/python3-libarchive-c_5.1.bb
+++ b/meta/recipes-devtools/python/python3-libarchive-c_5.1.bb
@@ -16,6 +16,14 @@ inherit pypi setuptools3 ptest
 
 SRC_URI[sha256sum] = "7bcce24ea6c0fa3bc62468476c6d2f6264156db2f04878a372027c10615a2721"
 
+DEPENDS += "patchelf-native libarchive"
+# Avoid using find_library API which needs ldconfig and ld/objdump
+# https://docs.python.org/3/library/ctypes.html#ctypes-reference
+#
+do_configure:append() {
+    sed -i -e "s|find_library('archive')|'${libdir}/$(patchelf --print-soname ${STAGING_LIBDIR}/libarchive.so)'|" ${S}/libarchive/ffi.py
+}
+
 RDEPENDS:${PN} += "\
   libarchive \
   python3-ctypes \

