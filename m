Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F212C3DA61
	for <webhook@archiver.kernel.org>; Tue, 30 Jul 2024 10:10:59 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web11.14459.1722334251654655197
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jul 2024 03:10:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=JmCElgwl;
 spf=pass (domain: mvista.com, ip: 209.85.216.52, mailfrom: vanusuri@mvista.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2cd5d6b2581so2763120a91.2
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Jul 2024 03:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1722334250; x=1722939050; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LAHCfa7+jxb7D7xpbNxTB+0q6tiTrnJbS03JI/5kuY0=;
        b=JmCElgwl19PRfsWSh0UcR68m3DA9f9qX86qWCgPzViG6ugMWrvpgnl1hQq6qbNkv7N
         WnURZEG6jYA+gt8W6O6d5xILQiKc9wqGi++JZS9UOq3JAy/kU8DG1YiZuxjg/jCQtWwv
         +yx5Q+Q5Wt/zQO6DThXpHogFVN+2v4e5cWG84=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722334250; x=1722939050;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LAHCfa7+jxb7D7xpbNxTB+0q6tiTrnJbS03JI/5kuY0=;
        b=rr6fbNey9+kSqt0oBSNZnXWlTUaV3SExhxmiW+La4XjnEZuV8ZbFovMZJK8+PiB20O
         RUr6JYfzbpfv/Tnbw1vym2fV6Xg0GyMHtxX5/ILTHefJzIT6DtzNh62c3QchUziIW4z+
         +Qp7wSzxjgt9SPzCimzog38t6JrRsySIvf+SOVir3neYjgpVRclbLybLcJW1Ip+TKGOs
         yuGkrvW/XfDTvcP1ffrObvmZev1Qqi70VoHmtIdpqZhJ/yP+PLqAUZX0FxbzcgEw92xk
         XxHimisyUTX1cYo0kqT8l0fcPNFgKcN3DnTYrYOECh6b2/M2gjE6QBlEoPIs8OX2LuSg
         xtLQ==
X-Gm-Message-State: AOJu0YyJuxeuq2K72v4GW5q34cs7VXZ16MGlRT5yXZui4iWJWjEoHjey
	E31v5+2vLoNtXoycN0zEG37HwcAzx2nGQqjpFQgYSgeoYm4uv5RTmXHrhDrwoaw+YO7uUgH76vS
	4dGo=
X-Google-Smtp-Source: AGHT+IEz9CX/oO+GFbhk1ON2Kwh9s/ljU9zg9WUFcMZg3L3EmrjE2dKcxjeG5dEMV4z+Lq8Ro5ZDJQ==
X-Received: by 2002:a17:90a:aa89:b0:2cd:4b37:a965 with SMTP id 98e67ed59e1d1-2cf7e1bbf80mr8881608a91.1.1722334250012;
        Tue, 30 Jul 2024 03:10:50 -0700 (PDT)
Received: from MVIN00020.mvista.com ([2401:4900:882c:b426:c32c:1937:97a0:c60f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cf28e3f67csm10157223a91.53.2024.07.30.03.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 03:10:49 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][scarthgap][PATCH] orc: upgrade 0.4.38 -> 0.4.39
Date: Tue, 30 Jul 2024 15:40:39 +0530
Message-Id: <20240730101039.1757198-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Jul 2024 10:10:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202669

From: Vijay Anusuri <vanusuri@mvista.com>

Changelog:

- Security: Fix error message printing buffer overflow leading to possible
  code executation in orcc with specific input files (CVE-2024-40897). This
  only affects developers and CI environments using orcc, not users of liborc
  (Sebastian Dröge, L. E. Segovia)
- div255w: fix off-by-one error in the implementations (L. E. Segovia)
- x86: only run AVX detection if xgetbv is available (L. E. Segovia)
- x86: fix AVX detection by implementing the check recommended by Intel (L. E. Segovia)
- Only enable JIT compilation on Apple arm64 if running on macOS, fixes crashes on iOS (Piotr Brzeziński)
- Fix potential crash in emulation mode if logging is enabled (L. E. Segovia)
- Handle undefined TARGET_OS_OSX correctly (Joshua Root)
- orconce: Fix typo in GCC __sync-based implementation (Jakub Vaněk)
- orconce: Fix usage of __STDC_NO_ATOMICS__ (Alexander Slobodeniuk)
- Fix build with MSVC 17.10 + C11 (L. E. Segovia)
- Support stack unwinding on Windows (L. E. Segovia)
- Major opcode and instruction set code clean-ups and refactoring (Jorge Zapata)
- Refactor allocation and chunk initialization of code regions (L. E. Segovia)
- Fall back to emulation on Linux if JIT support is not available,
  e.g. because of SELinux sandboxing or noexec mounting) (L. E. Segovia)

Ref: https://github.com/GStreamer/orc/blob/0.4.39/RELEASE

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 meta/recipes-devtools/orc/{orc_0.4.38.bb => orc_0.4.39.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/orc/{orc_0.4.38.bb => orc_0.4.39.bb} (92%)

diff --git a/meta/recipes-devtools/orc/orc_0.4.38.bb b/meta/recipes-devtools/orc/orc_0.4.39.bb
similarity index 92%
rename from meta/recipes-devtools/orc/orc_0.4.38.bb
rename to meta/recipes-devtools/orc/orc_0.4.39.bb
index 5d2296694a..320abf536a 100644
--- a/meta/recipes-devtools/orc/orc_0.4.38.bb
+++ b/meta/recipes-devtools/orc/orc_0.4.39.bb
@@ -5,7 +5,7 @@ LICENSE = "BSD-2-Clause & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1400bd9d09e8af56b9ec982b3d85797e"
 
 SRC_URI = "http://gstreamer.freedesktop.org/src/orc/orc-${PV}.tar.xz"
-SRC_URI[sha256sum] = "a55a98d4772567aa3faed8fb84d540c3db77eaba16d3e2e10b044fbc9228668d"
+SRC_URI[sha256sum] = "33ed2387f49b825fa1b9c3b0072e05f259141b895474ad085ae51143d3040cc0"
 
 inherit meson pkgconfig gtk-doc
 
-- 
2.25.1


