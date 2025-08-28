Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29626CA0EED
	for <webhook@archiver.kernel.org>; Thu, 28 Aug 2025 18:07:11 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web11.4272.1756404427732378133
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Aug 2025 11:07:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=T8sUBpAd;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6188b7550c0so1687037a12.2
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Aug 2025 11:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756404426; x=1757009226; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=J1hIvyKPBabAYNC5faiXMQ5aIafZA73yu41KFBu4DQU=;
        b=T8sUBpAd86wDvgLajh47HpnmlRiD1ZcEKJo0PGxyzX6hVuVMOWdvGLrkmZ+DxyEAJx
         LhZ93Zhz0MNEgwJdfvA/2gMXqSjRktJ5wcBpicCLR46Jos585zGl5anFdFvr9g5Klpip
         MPB88U+frL91HphqtX2mtEhjHYbSlqCQyCtevBN/KiqUNJY+7XzQAu+sP0dq6hVTse+G
         HnCOQ5Kt6gi6Mk99AChQQs4C1xoRUkPjzseU5lzSYSbk3XksDqwISxGA1swLBMNqVwQn
         91CIpW0vMI5fmlG+7EYynmqnVyJqtEKNLUNe2l5QVd0S3SsPYFy/MJxUIOLpHcB+0BY3
         D9lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756404426; x=1757009226;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J1hIvyKPBabAYNC5faiXMQ5aIafZA73yu41KFBu4DQU=;
        b=CxuBV9zgraccVdhK7SUSJq9KgMzyisdE6QbeQBwnQVgIr5YJQP81XJ+qcDCsQfLe/r
         hTxR0+UIYhrny00CPetTg9CLkJLfRHijAYxjWb1VSIQCo/wAxQqJFy2T+4lz/LjH+ED3
         +kXXIUvzooyxC+oR2eKEQm5wPZV659ejc/KRqhGGIxHEy9Y/nrnfo0YclOug3s2ET760
         QH/+ZaZ95Wy5I/dlVefn+9gveiNQENfhrPYzuZouMlXSzaVpG679QuwelyyJ6kAeG77D
         yfZWWEcpDiEpp8WCmHzY0IM4zy1P8uNcK3lKaqb7kIc6drorGq0diPpZNorA0D5CEGBz
         5tgw==
X-Gm-Message-State: AOJu0Yx9VSioHykbrgTQRXDa/rN7LdixGkBwtolZEhxEqu74N1tRUOP+
	chTA5xyBIqtN8p6mMMx2/1uYMmAmBTCi+/0gD0glVcib16IJmQM9GSAkOr4k9Q==
X-Gm-Gg: ASbGncvS062OA877v4YiOq+FRYiM705DU45B3MOg5rQWkCV4PIV4BSh+HOvlVoAb23w
	Tgt9iflENiFoE+k63vlRak7EvTJVwbF8cIofmWUW/KyjeBecYhzGw9XhimAtnNf+y0ap1WaCQy/
	xTkactPqb1Pa2Vw43+baP+2qnekbP98y5w92LjnssP2VALC3K7v9YlDrRGOlc+i1i7NolGgAy8q
	4WiNmHfioyDv9384js/R+G+43iq9ozXsCqrYiPF1dHd9Q1A/k15n0P0a20WLQUdpIHIMVpnY+VJ
	aQ/dqpLXsyFlnNcrqFAZ/YRT+6Igg01HQg7MWriRybJ7i3ZVPzmJB5dmhlJdVl6AM7WLBTT6Tfv
	omw0A+XHl94LH6IVwUeiTNZC/O8+eHvI=
X-Google-Smtp-Source: AGHT+IGEyWLR0NcOkn91P1r4addE8GY8lR8pCHhE6/eYvqc7ijd5EI7iczPFn8WJNpwc84/7E2X3KA==
X-Received: by 2002:a05:6402:278d:b0:61c:e86b:8e3b with SMTP id 4fb4d7f45d1cf-61ce86b91e7mr2142513a12.23.1756404425898;
        Thu, 28 Aug 2025 11:07:05 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61cfc5319afsm117704a12.48.2025.08.28.11.07.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 11:07:05 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] libffi: upgrade 3.5.1 -> 3.5.2
Date: Thu, 28 Aug 2025 20:07:04 +0200
Message-ID: <20250828180704.1116083-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Aug 2025 18:07:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222587

Changelog:
-fix: enable FFI_MMAP_EXEC_WRIT for DragonFly BSD
-Emscripten: Add wasm64 target
-fix: Ensure trampoline file descriptors are closed on exec.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-support/libffi/{libffi_3.5.1.bb => libffi_3.5.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libffi/{libffi_3.5.1.bb => libffi_3.5.2.bb} (94%)

diff --git a/meta/recipes-support/libffi/libffi_3.5.1.bb b/meta/recipes-support/libffi/libffi_3.5.2.bb
similarity index 94%
rename from meta/recipes-support/libffi/libffi_3.5.1.bb
rename to meta/recipes-support/libffi/libffi_3.5.2.bb
index be16008e0f..f648a33a46 100644
--- a/meta/recipes-support/libffi/libffi_3.5.1.bb
+++ b/meta/recipes-support/libffi/libffi_3.5.2.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=ce4763670c5b7756000561f9af1ab178"
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BPN}-${PV}.tar.gz \
            file://not-win32.patch \
            "
-SRC_URI[sha256sum] = "f99eb68a67c7d54866b7706af245e87ba060d419a062474b456d3bc8d4abdbd1"
+SRC_URI[sha256sum] = "f3a3082a23b37c293a4fcd1053147b371f2ff91fa7ea1b2a52e335676bac82dc"
 
 EXTRA_OECONF += "--disable-builddir --disable-exec-static-tramp"
 EXTRA_OECONF:class-native += "--with-gcc-arch=generic"

