Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A83DC0032E
	for <webhook@archiver.kernel.org>; Wed, 25 Oct 2023 12:00:08 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.171493.1698235198077634960
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Oct 2023 04:59:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Mae34ew5;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-408425c7c10so45886395e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Oct 2023 04:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698235196; x=1698839996; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JPEzLogFCqL06gcok1H+NuvdbJnzyeFuuvIsScVK6eY=;
        b=Mae34ew5gfveZhd4mJ7tX3wBcRydL6dg9uDTLKQ5Xh3bBzG38ClSqu9021egUQP6Bg
         kCtDxNqykyDk0ABUcoQNvflhSWUxwm8lz6Uo+mubfq/fWuIeCi9LkFTBR3KO/lq2Rshw
         38v5J/+SgIr6NBisnw1i7wwrpI5gg6ARvLlO5ENLmTqwdchBiwrUTyt2p7+sDkgrokxQ
         Og1jZfKjUcTrx2OEXYk22n87S4Vu5RuG3N1cSzumub2ZlYfBcbaPpk/ui5APFsUd7NAP
         TzAoze6BGPcQ2aT53h98UzgWuTZGZIe8hmVr3xYGl7pP8pvrMT0e1hHWJBJPy/J/DNFX
         g+rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698235196; x=1698839996;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JPEzLogFCqL06gcok1H+NuvdbJnzyeFuuvIsScVK6eY=;
        b=IXCVqWYVx8n0ARtLOqKlp0rf54EnHr3zK0mGmRGUVHGyb13KD6BNT+Z67nw3cdxxor
         2v8PsbC9tgZUIrtdLKBQoyHiGqbH8xyaNxLQrMh7qUhX5FnPPksFosV20Jkm8Y5mGvVJ
         BayvUEzgS16OmWD3IpMr6bqJdsZTg/F92YmJKrQo4Yq5lr3a2HNLdBUv0gbq12AlICDf
         46Y/OLEoxdlLHRdqVMErEA1IERFVBSOaC+a8D+GihFbqr/sfyaJO8ID1x9Hdd5Ewqa9S
         6KlNpTIyZ1dAkrpyFAdyq50u2F7OaYT8IyIjzMp4Qr9y8xudX/fBif6w4zjqEbuXdiJ/
         8hyQ==
X-Gm-Message-State: AOJu0Yz5pWk5MFNAtyMSMR2MbePYnbEjQ2u83D7cK3+O96Zsh9PpQexr
	EqLzU2Fb9WGfoS5CjlTf+YQf15g2Y+E=
X-Google-Smtp-Source: AGHT+IHr4iDcJHreCn44ME6q5ZhCXf3bpN/v+qynwJE8J3oX5O6nfiz+uXFK7mmWiwcTS9tT+Ka/dw==
X-Received: by 2002:a05:600c:3483:b0:405:a30:151e with SMTP id a3-20020a05600c348300b004050a30151emr12723390wmq.12.1698235195896;
        Wed, 25 Oct 2023 04:59:55 -0700 (PDT)
Received: from localhost.localdomain ([2001:8a0:fa50:db00:862f:283e:2d66:4a27])
        by smtp.gmail.com with ESMTPSA id x9-20020a05600c420900b004065e235417sm18851463wmh.21.2023.10.25.04.59.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 04:59:55 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [OE-core][PATCH] make-mod-scripts: exclude rm_work
Date: Wed, 25 Oct 2023 12:59:33 +0100
Message-ID: <20231025115933.1006-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Oct 2023 12:00:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189675

- Add the recipe to the RM_WORK_EXCLUDE

With rm_work active, external module signing throws an error:
scripts/sign-file: error while loading shared libraries: libcrypto.so.3: can not open shared object file: No such file or directory
Preserve libraries that sign-file script needs during runtime.

Some solutions [1][2] for this problem have already been submitted
on the mailing list but none of them get merged:

[1] Fix using RM_WORK_EXCLUDE_ITEMS
    https://lists.openembedded.org/g/openembedded-core/message/180113

[2] Fix using static linking
    https://lists.openembedded.org/g/openembedded-core/message/182024

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
index f6f47cfff5..6dcca738a8 100644
--- a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
+++ b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
@@ -10,6 +10,8 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 S = "${WORKDIR}"
 
+RM_WORK_EXCLUDE += "${PN}"
+
 do_configure[depends] += "virtual/kernel:do_shared_workdir openssl-native:do_populate_sysroot"
 do_compile[depends] += "virtual/kernel:do_compile_kernelmodules"
 
-- 
2.42.0


