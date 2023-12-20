Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB079C46CD4
	for <webhook@archiver.kernel.org>; Wed, 20 Dec 2023 02:18:23 +0000 (UTC)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
 by mx.groups.io with SMTP id smtpd.web10.13131.1703038695478194179
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Dec 2023 18:18:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Uo90LJEM;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.52, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-6db963bd3acso1477519a34.0
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 18:18:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1703038694; x=1703643494; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3QJKbplk84hWZzw51ChPPYHfJpsArUK/4uJnongMyFE=;
        b=Uo90LJEMxeJe/PBRZui7dedJNkWKFliLH/zsqm65OqBJbKJXR6yg5ApA8x7izuvp20
         EMgFwJ14NaK2pd2YIVrvM1RCR9MjXTponxXxDHRVjSceHSR0ApQcTWQlrwSA++6QkeN7
         TirbwgK6FoklKGaaar5/jmlxfXpWrXyJJmMgtJRJ3wRJ3Pl4c7K+aHN06ZNbIMrA2x1K
         KyISEBN4XIK/BSDQ35isPK2kdbIU7gWyIlnuVrf3vgZE339Cnz4fSMhbjlVr5PkEaUDq
         HXyl8k6Zs1dOFQ+eH2RzBGP3Y8pEUl+M0QunA91DWuzW6CAPUgK/TDm6NXogUsK4CsXu
         aHRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703038694; x=1703643494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3QJKbplk84hWZzw51ChPPYHfJpsArUK/4uJnongMyFE=;
        b=t71GgD0qjK8kpUTD6YaFnqY346g84RpH2DF9vJOw1R/lYHZo9BfSxvE0Wpb0CuVk7W
         32NflCalDjtTth3RejlmvlgkZ4ccL7+a9+JHYXW0bWgavfxDUmOoSEAWACdXm4qq/jVy
         /EgVat+5d/QoRk7ahujqJ4vsHrFe4n0d3ARN3Rxt/Zt3SLW52mHNOPG/rTyosq6uUQaJ
         ZAxHv4dWPGW/7hfqPEkpfFN+5cLMTVNmJFauZdp+xkgfwwjaTFwPSHuM64qNDsRCT7AD
         ZpKlbl+r/C/h88GIV/dNp7cn+IJqQ4rO56JsLfgXYYf1d5j3DWVzA3YTezB3apSXI+Vs
         e5RA==
X-Gm-Message-State: AOJu0YzA6VNcNu4fUVxbjjOF4b/d+miC6LieUWFCzjF25iDZMp8HN/bA
	ahzf4sYNJ8BtNC0OvjRy6y/PXKnvpDIc3kTaJEj/Pw==
X-Google-Smtp-Source: AGHT+IG+JALQwaObCbdDx0bDhW6F7dxy7sR3ufUw7AY4mkc14DhK+L7kKoURcAOgTQ1JVJXY7eBjPw==
X-Received: by 2002:a05:6830:1297:b0:6d8:74e2:634e with SMTP id z23-20020a056830129700b006d874e2634emr16215406otp.40.1703038694046;
        Tue, 19 Dec 2023 18:18:14 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id d6-20020aa78146000000b006d945660076sm367103pfn.59.2023.12.19.18.18.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 18:18:13 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 4/9] perlcross: update to 1.5.2
Date: Tue, 19 Dec 2023 16:17:54 -1000
Message-Id: <70b521284f8dbe3b38a2be9b312c632b3a51ef73.1703038443.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1703038443.git.steve@sakoman.com>
References: <cover.1703038443.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Dec 2023 02:18:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192763

From: Lee Chee Yang <chee.yang.lee@intel.com>

remove upstreamed 0001-cnf-configure_pfmt.sh-add-32-bit-integer-format-defi.patch

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...mt.sh-add-32-bit-integer-format-defi.patch | 28 -------------------
 .../{perlcross_1.5.bb => perlcross_1.5.2.bb}  |  3 +-
 2 files changed, 1 insertion(+), 30 deletions(-)
 delete mode 100644 meta/recipes-devtools/perl-cross/files/0001-cnf-configure_pfmt.sh-add-32-bit-integer-format-defi.patch
 rename meta/recipes-devtools/perl-cross/{perlcross_1.5.bb => perlcross_1.5.2.bb} (86%)

diff --git a/meta/recipes-devtools/perl-cross/files/0001-cnf-configure_pfmt.sh-add-32-bit-integer-format-defi.patch b/meta/recipes-devtools/perl-cross/files/0001-cnf-configure_pfmt.sh-add-32-bit-integer-format-defi.patch
deleted file mode 100644
index 4de4a5b955..0000000000
--- a/meta/recipes-devtools/perl-cross/files/0001-cnf-configure_pfmt.sh-add-32-bit-integer-format-defi.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 920abf3dc39c851a655b719622c76a6f0dc9981d Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Tue, 5 Sep 2023 19:47:33 +0200
-Subject: [PATCH] cnf/configure_pfmt.sh: add 32 bit integer format definitions
-
-These started to matter in perl 5.38 where they are used to print
-line numbers.
-
-Upstream-Status: Submitted [https://github.com/arsv/perl-cross/pull/143]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- cnf/configure_pfmt.sh | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/cnf/configure_pfmt.sh b/cnf/configure_pfmt.sh
-index 8f93da1..7bb4b6f 100644
---- a/cnf/configure_pfmt.sh
-+++ b/cnf/configure_pfmt.sh
-@@ -52,3 +52,9 @@ else
- 	define uvxformat '"lx"'
- 	define uvXUformat '"lX"'
- fi
-+
-+define i32dformat 'PRId32'
-+define u32uformat 'PRIu32'
-+define u32oformat 'PRIo32'
-+define u32xformat 'PRIx32'
-+define u32XUformat 'PRIX32'
diff --git a/meta/recipes-devtools/perl-cross/perlcross_1.5.bb b/meta/recipes-devtools/perl-cross/perlcross_1.5.2.bb
similarity index 86%
rename from meta/recipes-devtools/perl-cross/perlcross_1.5.bb
rename to meta/recipes-devtools/perl-cross/perlcross_1.5.2.bb
index 7ca4977b97..b41c182fad 100644
--- a/meta/recipes-devtools/perl-cross/perlcross_1.5.bb
+++ b/meta/recipes-devtools/perl-cross/perlcross_1.5.2.bb
@@ -15,11 +15,10 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/perl-cross-${PV}.tar.gz;name=perl-c
            file://0001-perl-cross-add-LDFLAGS-when-linking-libperl.patch \
            file://determinism.patch \
            file://0001-Makefile-check-the-file-if-patched-or-not.patch \
-           file://0001-cnf-configure_pfmt.sh-add-32-bit-integer-format-defi.patch \
            "
 GITHUB_BASE_URI = "https://github.com/arsv/perl-cross/releases/"
 
-SRC_URI[perl-cross.sha256sum] = "d744a390939e2ebb9a12f6725b4d9c19255a141d90031eff90ea183fdfcbf211"
+SRC_URI[perl-cross.sha256sum] = "584dc54c48dca25e032b676a15bef377c1fed9de318b4fc140292a5dbf326e90"
 
 S = "${WORKDIR}/perl-cross-${PV}"
 
-- 
2.34.1


