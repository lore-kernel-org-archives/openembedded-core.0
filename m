Return-Path: <bindudaniel1996@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E50ACC64EC7
	for <webhook@archiver.kernel.org>; Wed,  1 Mar 2023 07:17:25 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web11.16678.1677655040413499000
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Feb 2023 23:17:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JR9yna1f;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: bindudaniel1996@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id p3-20020a17090ad30300b0023a1cd5065fso198349pju.0
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Feb 2023 23:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qYGNEsdEghPPnXPzADk/XVTrjggBEdiTwwK2ftww4T0=;
        b=JR9yna1f2NHZYHceC7LR4+Bp6fGh94YClq7mkBwa3UgUxnh6pDPbKk99DTsVpi0vtO
         xsnpDfcX8yHnyKEeE4uPT68c0FrR7IJdnoyRLU6GIzYCasPrCahqUx/P8rWlAT/WkmFQ
         PyBfAvBbukDrIYW7MN1XZ4cNYR/+dmWNwt1j6rIeJLM0DT5dwXG3iUn+dWNHWRcK2n2l
         pdu2nsfqWjbcg03fbXp74K5gDJIj52MjT6WY89zGGmS45XL6hnpG+Tu+l+VYPqWGwleM
         9FmrMq7CRE696CTlhmuUIduIMlaMFe1HSf872C5XWf/0QFhsVXKTjWq9Qq010drhF2Sk
         Pfzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qYGNEsdEghPPnXPzADk/XVTrjggBEdiTwwK2ftww4T0=;
        b=tP6PxVRdg7UuyZj3euyHwQ0CelGl/btldwhJz78cStjJwFNqqHINid5me4LFmdE4tZ
         ISujRx00wK/v0WPZ5m/+QuijX+UIkdM4/yJdNaNDJ9PmSyhM/as96+LQ4Xw0618/ZA6x
         iJVg2L3od+t+3nDTZxktAP4Y8D9mfylmNLo/HHGNuvnAQYARII2Vvg94zz7DgFtcC0tD
         fr84DPbr/SLCNPLbeM/kSdrCWS4VPNXuggqm7uDRavBweMJoFFPapSsCfr86lIP1Yu0b
         ZDOZLGGLjSFUATpcAWYZ6nGEDGIJHAGzTl/UzhRZBA9gWTODzzt1gGULxS5r/tBRA7nC
         MhtA==
X-Gm-Message-State: AO0yUKXH/JRUMbHkGw8CMukHT4AxxtjAkxObuQvmbmSKkefES6ZF3oEc
	zPvuZsTKIGqNZJkViPBEuWc2hA0OBcQ=
X-Google-Smtp-Source: AK7set9SBaUagyxGCamdAFELbqihPW7M25mI3AwXjeYHr1YlpKIlSIthpJmAFz/hztBIYZVnZng5/Q==
X-Received: by 2002:a05:6a20:4d9d:b0:cd:40b4:7c3c with SMTP id gj29-20020a056a204d9d00b000cd40b47c3cmr4827628pzb.57.1677655039219;
        Tue, 28 Feb 2023 23:17:19 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:1f26:5476:4c:b938:3502:1bdf])
        by smtp.gmail.com with ESMTPSA id z19-20020aa785d3000000b005a8a9950363sm7192555pfn.105.2023.02.28.23.17.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Feb 2023 23:17:18 -0800 (PST)
From: Bhabu Bindu <bindudaniel1996@gmail.com>
To: openembedded-core@lists.openembedded.org,
	bhabu.bindu@kpit.com
Cc: ranjitsinh.rathod@kpit.com,
	Virendra Thakur <virendrak@kpit.com>
Subject: [OE-core][dunfell][PATCH] gcc: Fix inconsistent noexcept specifier for valarray in libstdc++
Date: Wed,  1 Mar 2023 12:47:03 +0530
Message-Id: <20230301071703.24640-1-bindudaniel1996@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Mar 2023 07:17:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177870

From: Virendra Thakur <virendrak@kpit.com>

Backport of gcc upstream commit 2b2d97fc545635a0f6aa9c9ee3b017394bc494bf
to gcc release 9.5.0. This fix is available to all release-branches
except releases/gcc-9 because upstream do not support gcc-9 now.

Signed-off-by: Virendra Thakur <virendrak@kpit.com>
---
 meta/recipes-devtools/gcc/gcc-9.5.inc         |  1 +
 ...nsistent-noexcept-specific-for-valar.patch | 44 +++++++++++++++++++
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-9.5/0002-libstdc-Fix-inconsistent-noexcept-specific-for-valar.patch

diff --git a/meta/recipes-devtools/gcc/gcc-9.5.inc b/meta/recipes-devtools/gcc/gcc-9.5.inc
index 6a0a892b10..ec28246bf3 100644
--- a/meta/recipes-devtools/gcc/gcc-9.5.inc
+++ b/meta/recipes-devtools/gcc/gcc-9.5.inc
@@ -69,6 +69,7 @@ SRC_URI = "\
            file://0037-CVE-2019-14250-Check-zero-value-in-simple_object_elf.patch \
            file://0038-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch \
            file://0039-process_alt_operands-Don-t-match-user-defined-regs-o.patch \
+           file://0002-libstdc-Fix-inconsistent-noexcept-specific-for-valar.patch \
 "
 S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}"
 SRC_URI[sha256sum] = "27769f64ef1d4cd5e2be8682c0c93f9887983e6cfd1a927ce5a0a2915a95cf8f"
diff --git a/meta/recipes-devtools/gcc/gcc-9.5/0002-libstdc-Fix-inconsistent-noexcept-specific-for-valar.patch b/meta/recipes-devtools/gcc/gcc-9.5/0002-libstdc-Fix-inconsistent-noexcept-specific-for-valar.patch
new file mode 100644
index 0000000000..506064bfc2
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-9.5/0002-libstdc-Fix-inconsistent-noexcept-specific-for-valar.patch
@@ -0,0 +1,44 @@
+From 60d966708d7cf105dccf128d2b7a38b0b2580a1a Mon Sep 17 00:00:00 2001
+From: Jonathan Wakely <jwakely@redhat.com>
+Date: Fri, 5 Nov 2021 21:42:20 +0000
+Subject: [PATCH] libstdc++: Fix inconsistent noexcept-specific for valarray
+ begin/end
+
+These declarations should be noexcept after I added it to the
+definitions in <valarray>.
+
+libstdc++-v3/ChangeLog:
+
+	* include/bits/range_access.h (begin(valarray), end(valarray)):
+	Add noexcept.
+
+(cherry picked from commit 2b2d97fc545635a0f6aa9c9ee3b017394bc494bf)
+
+Upstream-Status: Backport [https://github.com/hkaelber/gcc/commit/2b2d97fc545635a0f6aa9c9ee3b017394bc494bf]
+Signed-off-by: Virendra Thakur <virendrak@kpit.com>
+
+---
+ libstdc++-v3/include/bits/range_access.h | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/libstdc++-v3/include/bits/range_access.h b/libstdc++-v3/include/bits/range_access.h
+index 3d99ea92027..4736e75fda1 100644
+--- a/libstdc++-v3/include/bits/range_access.h
++++ b/libstdc++-v3/include/bits/range_access.h
+@@ -101,10 +101,10 @@ _GLIBCXX_BEGIN_NAMESPACE_VERSION
+ 
+   template<typename _Tp> class valarray;
+   // These overloads must be declared for cbegin and cend to use them.
+-  template<typename _Tp> _Tp* begin(valarray<_Tp>&);
+-  template<typename _Tp> const _Tp* begin(const valarray<_Tp>&);
+-  template<typename _Tp> _Tp* end(valarray<_Tp>&);
+-  template<typename _Tp> const _Tp* end(const valarray<_Tp>&);
++  template<typename _Tp> _Tp* begin(valarray<_Tp>&) noexcept;
++  template<typename _Tp> const _Tp* begin(const valarray<_Tp>&) noexcept;
++  template<typename _Tp> _Tp* end(valarray<_Tp>&) noexcept;
++  template<typename _Tp> const _Tp* end(const valarray<_Tp>&) noexcept;
+ 
+   /**
+    *  @brief  Return an iterator pointing to the first element of
+-- 
+2.25.1
\ No newline at end of file
-- 
2.25.1


