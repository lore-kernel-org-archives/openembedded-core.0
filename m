Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9A67C27C53
	for <webhook@archiver.kernel.org>; Thu, 13 Jun 2024 02:00:46 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.5369.1718244041385784404
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jun 2024 19:00:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Jut9AyiZ;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1f44b45d6abso4435875ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Jun 2024 19:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718244040; x=1718848840; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jj3rmOMRK920xy38Px83Jf0pfVsmaURnezxGy1O3POM=;
        b=Jut9AyiZ35v+NhcGM6XDw13s7fCnxY5AFdzF4L+U+wzX+7bxb+Am0FwfokYHr6RCdh
         dYGDTkzXLI5bQu88B69OWzcJA2OZgghvUUqJ0rciKmAoeWiVaJ0t7jxpQzZurEJTyrMX
         8zz0+RtNDkaEAK8sr79DhtsQOAwJwAiFxwoRPSt3d5kTNrCGe30cQFcl/dWnssd0e0nr
         8acMsm1gW0JuExJ63JAWJ3iNHniyRVVuAm6erLUZ26mJnj7ciCpYv1vS4HE3aEi8x22h
         5T+vKOXxqjMd6rDrxJlNNgXtX/cGdHawDBsON2C/z11sUXnUGCESar6OZ6ktjied90eK
         RGNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718244040; x=1718848840;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jj3rmOMRK920xy38Px83Jf0pfVsmaURnezxGy1O3POM=;
        b=MwElovbJdiBN/m+AEwnDi1wX9E/emXU7ZCKlwZKu2em0s8tDzhpgMeZug3wid8Yt4z
         zEUpwCGi788W+/JveLGNdU/ItKiUJ3Pbg+bUKusU3JE/GJJVsgMZw8oGOvhfQ8oMp257
         598TibDz3PmQ0beJdgK8c47dDbxT9eAl8+ERs6EY+WdPJg1aLUo1wGz2yYEcnpkjm/vh
         tZSl3NZ2A3n4S2UGwN6oiRL4kQBx6NZAERBrS5FN86dLUE3gK8rjIXOIcyRm42FQLkEK
         dDYlIrjtdjmC6EE4dYFXisEM6Yn+ULWZC3+ZQjPrgKOAtMdFLpuXSnp1FCTy4I5yAij/
         isZA==
X-Gm-Message-State: AOJu0Yxr/6+1YAX11kNmjUszCSJS6eJ8L0Ctm4BW34tO69G0dPvnudAx
	fRgrN6SWdE5kl/egf/DNJNliVt5uPNBmxIiQbFogA+W4lUT9NxqSlhnp9Q==
X-Google-Smtp-Source: AGHT+IGbXT/Y8F2y6ok2zXvISelGvDqZwGpRgLNm/uJap5+Bt4Ruobf/3MlU9fPebTqKl4rk+i0EcA==
X-Received: by 2002:a17:902:c40e:b0:1f4:8a01:283e with SMTP id d9443c01a7336-1f83b626368mr43290435ad.5.1718244040223;
        Wed, 12 Jun 2024 19:00:40 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::9980])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855e5a0d5sm1539715ad.43.2024.06.12.19.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 19:00:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] gcc: Fix typo in increment expression in unicode from libstdc++
Date: Wed, 12 Jun 2024 19:00:37 -0700
Message-ID: <20240613020037.522794-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Jun 2024 02:00:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200583

This issue is seen when libstdc++ headers are used by clang18
see - https://github.com/llvm/llvm-project/issues/92586

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-14.1.inc        |  1 +
 ...-in-_Grapheme_cluster_view-_Iterator.patch | 76 +++++++++++++++++++
 2 files changed, 77 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc/0026-libstdc-Fix-typo-in-_Grapheme_cluster_view-_Iterator.patch

diff --git a/meta/recipes-devtools/gcc/gcc-14.1.inc b/meta/recipes-devtools/gcc/gcc-14.1.inc
index b057e570f3b..17a9c51d71a 100644
--- a/meta/recipes-devtools/gcc/gcc-14.1.inc
+++ b/meta/recipes-devtools/gcc/gcc-14.1.inc
@@ -68,6 +68,7 @@ SRC_URI = "${BASEURI} \
            file://0023-Fix-install-path-of-linux64.h.patch \
            file://0024-Avoid-hardcoded-build-paths-into-ppc-libgcc.patch \
            file://0025-gcc-testsuite-tweaks-for-mips-OE.patch \
+           file://0026-libstdc-Fix-typo-in-_Grapheme_cluster_view-_Iterator.patch \
 "
 
 S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/${SOURCEDIR}"
diff --git a/meta/recipes-devtools/gcc/gcc/0026-libstdc-Fix-typo-in-_Grapheme_cluster_view-_Iterator.patch b/meta/recipes-devtools/gcc/gcc/0026-libstdc-Fix-typo-in-_Grapheme_cluster_view-_Iterator.patch
new file mode 100644
index 00000000000..5a465b8c959
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0026-libstdc-Fix-typo-in-_Grapheme_cluster_view-_Iterator.patch
@@ -0,0 +1,76 @@
+From c9e05b03c18e898be604ab90401476e9c473cc52 Mon Sep 17 00:00:00 2001
+From: Jonathan Wakely <jwakely@redhat.com>
+Date: Thu, 16 May 2024 17:15:55 +0100
+Subject: [PATCH] libstdc++: Fix typo in _Grapheme_cluster_view::_Iterator
+ [PR115119]
+
+libstdc++-v3/ChangeLog:
+
+	PR libstdc++/115119
+	* include/bits/unicode.h (_Iterator::operator++(int)): Fix typo
+	in increment expression.
+	* testsuite/ext/unicode/grapheme_view.cc: Check post-increment
+	on view's iterator.
+
+Drop it when upgrading to 14.2
+
+Upstream-Status: Backport [https://github.com/gcc-mirror/gcc/commit/c9e05b03c18e898be604ab90401476e9c473cc52]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ libstdc++-v3/include/bits/unicode.h                 |  6 ++++--
+ libstdc++-v3/testsuite/ext/unicode/grapheme_view.cc | 11 +++++++++++
+ 2 files changed, 15 insertions(+), 2 deletions(-)
+
+diff --git a/libstdc++-v3/include/bits/unicode.h b/libstdc++-v3/include/bits/unicode.h
+index 46238143fb6..a14a17c5dfc 100644
+--- a/libstdc++-v3/include/bits/unicode.h
++++ b/libstdc++-v3/include/bits/unicode.h
+@@ -34,10 +34,12 @@
+ #include <array>
+ #include <bit>      // bit_width
+ #include <charconv> // __detail::__from_chars_alnum_to_val_table
++#include <string_view>
+ #include <cstdint>
+ #include <bits/stl_algo.h>
+ #include <bits/stl_iterator.h>
+-#include <bits/ranges_base.h>
++#include <bits/ranges_base.h> // iterator_t, sentinel_t, input_range, etc.
++#include <bits/ranges_util.h> // view_interface
+ 
+ namespace std _GLIBCXX_VISIBILITY(default)
+ {
+@@ -802,7 +804,7 @@ inline namespace __v15_1_0
+ 	operator++(int)
+ 	{
+ 	  auto __tmp = *this;
+-	  ++this;
++	  ++*this;
+ 	  return __tmp;
+ 	}
+ 
+diff --git a/libstdc++-v3/testsuite/ext/unicode/grapheme_view.cc b/libstdc++-v3/testsuite/ext/unicode/grapheme_view.cc
+index ac1e8c50b05..a3bb36e14b8 100644
+--- a/libstdc++-v3/testsuite/ext/unicode/grapheme_view.cc
++++ b/libstdc++-v3/testsuite/ext/unicode/grapheme_view.cc
+@@ -83,10 +83,21 @@ test_breaks()
+   VERIFY( iter == gv.end() );
+ }
+ 
++constexpr void
++test_pr115119()
++{
++  // PR 115119 Typo in _Grapheme_cluster_view::_Iterator::operator++(int)
++  uc::_Grapheme_cluster_view gv(" "sv);
++  auto it = std::ranges::begin(gv);
++  it++;
++  VERIFY( it == std::ranges::end(gv) );
++}
++
+ int main()
+ {
+   auto run_tests = []{
+     test_breaks();
++    test_pr115119();
+     return true;
+   };
+ 

