Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AB0CC47422
	for <webhook@archiver.kernel.org>; Sat, 27 Jan 2024 02:37:49 +0000 (UTC)
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
 by mx.groups.io with SMTP id smtpd.web10.8354.1706323062003220155
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jan 2024 18:37:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Uc+Cda2t;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.46, mailfrom: steve@sakoman.com)
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-7bfd527d443so18574339f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 18:37:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1706323060; x=1706927860; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fBNQtgAo6PvrWu8zzVg7uyN2Owe6HbrOIgSPPrI+9c8=;
        b=Uc+Cda2tCM4/1W0al239MDSIJYJJ1SY2F4Ya34GRgevm1lwqadtqkMS1G6H3npXito
         hFoRFl01pcPaqiX5bRpUypyJf81QgJzsE/YPx+StHzj44mtMBj0/Oq1EGwWzSW83R3Ba
         eyWBpQFQQVk62TOPsRXvpt+ZBtoRcDs0t5i5i8Gat1ERpW7uiDVVvtS3qVrwKWR8mb5D
         tayznPzGmUre6IY+0C9ZDKWhNwpXbXHzNJ2L5GrgwgAn2i8ipqWNPBbBwGLR8zq+EMj+
         XTS6TAgZD1BGk/JatCOx+ZUb6mt/vD+eKN3//mJYdNJQtpqMnOWhBcZPXg9bRxqV0brW
         Myzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706323060; x=1706927860;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fBNQtgAo6PvrWu8zzVg7uyN2Owe6HbrOIgSPPrI+9c8=;
        b=PogGTye2m+VkzN4ZDgP48DshjAQw6wax0Tzq14YAGL4HjY0CCGXVf+DNUyVVSnahqi
         QL/JD/TS5G50cLcMfL7lBH+cHskK0KQ75CXq1ML5nOvUPho6geGtN9AbBPOkvSsvDru1
         w1koLdAWmZAakkhhqD96K56D9PkcCTVZDDlaJQCGK89eIE9vldDTV3Dqyn8bfzOvHLRn
         4ALJlpEX2vfcuyPr/5Y/shuiN22QC2/jRxRGV4Sz+eS6TE2Nn71xQi8pf6jmCmqAEUPe
         gNm1vDOYtlzXA++dL0mS2MdruogesZ+rgoTxBQiK7UM+b/o9Egv+tUgUUwpdrbuqr8Ae
         Vpgg==
X-Gm-Message-State: AOJu0YwF0jnZA3xj10ecP8Ymz50dB16raRkCoHDrv6e6gSqSFGT8k7HB
	o3Fhx953Zo7Qn6abAWQjgHolOzgSa9XxZP1IxF3+0pUbZwqEWglp2QI1dTWOiLF1txHBhQRx7CN
	HSBGRbA==
X-Google-Smtp-Source: AGHT+IGfQ24fuoSVHEUjk7fXaZ0tMf/R+oW/ngnshcp7c1bRtJyCYka9BcZP18f2PJPlfeQJDsRCmw==
X-Received: by 2002:a05:6e02:1a4a:b0:361:a7a2:9daf with SMTP id u10-20020a056e021a4a00b00361a7a29dafmr1543426ilv.27.1706323060092;
        Fri, 26 Jan 2024 18:37:40 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id r8-20020a170902be0800b001d7405022ecsm1547045pls.159.2024.01.26.18.37.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 18:37:39 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 01/23] libatomic-ops: upgrade 7.8.0 -> 7.8.2
Date: Fri, 26 Jan 2024 16:37:09 -1000
Message-Id: <cae10312a45a686b118596e0e07000d3fae55f7a.1706322780.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1706322780.git.steve@sakoman.com>
References: <cover.1706322780.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Jan 2024 02:37:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194410

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
* Eliminate 'atomic_thread_fence is unsupported with tsan' gcc-11 warning
* Eliminate 'comparing signed/unsigned values' lcc warning in add_chunk_as
* Fix 'undefined reference to AO_pt_lock' if configure is using clang-16
* Fix 'undefined reference to __atomic_load/store/cas_16' Mingw64-gcc error
* Fix 'undefined reference' linker errors if shared build on OpenBSD (CMake)
* Fix get_chunk for case of mmap area is located before AO_initial_heap
* Fix typo in AO_HAVE_compare_and_swap_double name in atomic_ops_stack.h
* Fix typo in comment of run_one_test of test_stack
* Fix typos in comments of atomic_ops_malloc.c and atomic_ops_stack.c/h
* Update cmake minimum required version to 3.5

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1dea52da8cd00e6619890b8c4dcece8b5ff83f74)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../{libatomic-ops_7.8.0.bb => libatomic-ops_7.8.2.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libatomic-ops/{libatomic-ops_7.8.0.bb => libatomic-ops_7.8.2.bb} (89%)

diff --git a/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb b/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb
similarity index 89%
rename from meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb
rename to meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb
index d4b77f6244..824400e743 100644
--- a/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb
+++ b/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/libatomic_ops-${PV}.tar.gz"
 GITHUB_BASE_URI = "https://github.com/ivmai/libatomic_ops/releases"
 
-SRC_URI[sha256sum] = "15676e7674e11bda5a7e50a73f4d9e7d60452271b8acf6fd39a71fefdf89fa31"
+SRC_URI[sha256sum] = "d305207fe207f2b3fb5cb4c019da12b44ce3fcbc593dfd5080d867b1a2419b51"
 
 S = "${WORKDIR}/libatomic_ops-${PV}"
 
-- 
2.34.1


