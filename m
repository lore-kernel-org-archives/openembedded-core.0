Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EE13E85398
	for <webhook@archiver.kernel.org>; Fri,  3 Apr 2026 18:36:16 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2209.1775241373059255665
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Apr 2026 11:36:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Wa1De9vf;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: twoerner@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-8a58057d7baso32276146d6.1
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Apr 2026 11:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775241371; x=1775846171; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yohEfWFu2wyKVAv6KA6/vS3q4ppLP0PEe2HiXtUGIOs=;
        b=Wa1De9vfIFV+C7ElW9JDeG6umSoWHOmaTAzQHjpWwZuZuKozbG2SuX4kWCscp4j8Ge
         rckkoOTeqyAR4Y94UR8H6tnDglXXtQ8r+qrF81KxrJ7jutSRQPpXMb3SUVGQlXUKD4DM
         cy2xtS4R3+xpW2pSQcVm8E+6rjAqv022fBppbyt19K/+ltJk8dgpeMCT8Ftx7YvLpj3V
         RQ3nrxh/T0eKRDQWPlHmDWrCtMFxdRPO3juI8qz0rC2vI0fI5Wse9s7N8nCuzmsSUwQ7
         Qd840WlC4kP9gJsMids5rDemaWwjH3AY2vU5Ehrfu3e584uidijQQWP98PqXb5yH9w61
         +LWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775241371; x=1775846171;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yohEfWFu2wyKVAv6KA6/vS3q4ppLP0PEe2HiXtUGIOs=;
        b=KUXl4RDOytAE4r+nqNqjOTxVPPep+FfYYkPBrwx7Y0PdXt4yrY+8FlDUk46F3lF9oD
         cLyDfpFRuLoS+ZalOolPGYnOsfphJxLTs03qSoFliJ8tfH6ZuWV6Ij/K6A4513psbIhC
         bzpSn076PwF3ArWpjix1kcOV55BRQyzt+IUbZVZXIuq4GVsK60gLlQqkjZkTt9MHQCx/
         muztKNdqvNTxpVOxxhuMlF2LTi8ycYCW3SPRqGPpacActbK8+LczC4WNBkXeTibYPsj3
         zYloXo4D1CHkg0CExChDt4VxNc07DJYCD6EInoZj7vpJUyeqP+njseZhaTR6U911XwFd
         pvAg==
X-Gm-Message-State: AOJu0YzU43xHFQfGm8mkxKCvwjyB9ihgPTjfnq/E2qvd4lOTAYhwJ3TY
	uuQ82WNuLeeOYxzVFP6y4DhUczhScGn1Gx20pbvkITbgzh6axK5+/pTyX3QKlA==
X-Gm-Gg: AeBDievTtok4YOjTBdyXczoFZDCBy2BXs1NlcOofqOhBtvQN+eMS0wTGwSoN0Oo0dlv
	Cuyzw8M1lbY8XE8cqMMeYxvKRHvT1MdJuTQFwEaTI3WU1QHdhWy141g5uoeiGPhx5uAC/4FW1Rd
	7zWd41SI9aqtrr6aVpYMseNANFGod6/ORuunV6z3W1OBDCxFyj52YbntIqA/3wIdawE7+E+y3XC
	Ikx0+fi8qgpsaeI8Pn6dXi3EmZaIFALyH71xtUWpfHrAUlh4NWuckr/ynXgl/rRqNHSg/IsY2u0
	06x0Tlf9XaHBGFObCq5YdTtr+YmqwF4HyunW35c7pWv3xEkN1OhXSM6INd3rCtEr+/HayJmzZXF
	Q5pclV6y8PlCsh7C7i/+6Ai5E/xm4EdpvX7esWccNBuTiXcRf3Dc8gLXNCzMK50B/BGGIxQGhs8
	VyKwFH5/ECNe3OTLwyuG1y/HV8MEqlrbopjv98MGf8I63VsfHI5rmhiSESjjf4Su1+Ww==
X-Received: by 2002:a05:6214:611b:b0:8a2:d93c:993a with SMTP id 6a1803df08f44-8a7020bd044mr57567316d6.3.1775241371389;
        Fri, 03 Apr 2026 11:36:11 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8a593ee25c9sm64627916d6.22.2026.04.03.11.36.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 11:36:10 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>,
	Mark Hatle <mark.hatle@kernel.crashing.org>
Subject: [PATCH v9 4/5] wic: move canned *wks files
Date: Fri,  3 Apr 2026 14:35:40 -0400
Message-ID: <20260403183541.2631883-5-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260403183541.2631883-1-twoerner@gmail.com>
References: <20260403183541.2631883-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Apr 2026 18:36:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234596

When "wic create ..." is invoked with a bare *wks name (i.e. without the
`.wks` extension), wic calls engine.py:find_canned_images() to find the
fully qualified *wks file. This function searches every directory formed by:
    - permutating all BBLAYERS with `/wic`
    - permutating all BBLAYERS with `/scripts/lib/wic/canned-wks`
    - checking `<scripts_path>/lib/wic/canned-wks`
Where `<scripts_path>` is the directory containing the wic program.

When wic is part of oe-core, the last search path succeeds in finding
the canned *wks files in `<topdir>/scripts/lib/wic/canned-wks` (since
the wic program is found in oe-core's `<topdir>/scripts` directory, and
`<topdir>/scripts` is not a BBLAYER).

However, once wic is removed from oe-core, this algorithm will not find
these bare *wks files in any of the above-mentioned search paths since
the oe-core layer will no longer be the home of the wic program, and the
canned *wks files are not located in any directory relative to BBLAYERS.

Since these *wks files are specific to oe-core's meta layer, they should
stay with this layer. Therefore move the *wks files so they exist in one
of the locations searched relative to oe-core/meta's BBLAYERS.

NOTE: this patch is in preparation for removing wic from oe-core
      the wic oe-selftests work fine with this patch being added now

Reviewed-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Reviewed-by: Mark Hatle <mark.hatle@kernel.crashing.org>
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
changes in v9: 
- continue to search scripts/lib/wic/canned-wks for *wks files
- commit message updated to reflect this change and to more clearly
  explain how wic finds *wks files and why these files are moved

changes in v8: 
- (v8 was sending sector-size cmdline patch)

changes in v7: 
- (none)

changes in v6: 
- re-ordered so that this patch occurs before wic is removed, thus
  saving the commit history

changes in v5: 
- rebase with master
- split patchset out again into individual, small patches

changes in v4: 
- (skipped)

changes in v3: 
- squashed into 1 large commit

changes in v2: 
- (none)
---
 {scripts/lib/wic/canned-wks => meta/wic}/common.wks.inc           | 0
 .../wic/canned-wks => meta/wic}/directdisk-bootloader-config.cfg  | 0
 .../wic/canned-wks => meta/wic}/directdisk-bootloader-config.wks  | 0
 {scripts/lib/wic/canned-wks => meta/wic}/directdisk-gpt.wks       | 0
 .../lib/wic/canned-wks => meta/wic}/directdisk-multi-rootfs.wks   | 0
 {scripts/lib/wic/canned-wks => meta/wic}/directdisk.wks           | 0
 {scripts/lib/wic/canned-wks => meta/wic}/efi-bootdisk.wks.in      | 0
 {scripts/lib/wic/canned-wks => meta/wic}/efi-uki-bootdisk.wks.in  | 0
 {scripts/lib/wic/canned-wks => meta/wic}/mkefidisk.wks            | 0
 {scripts/lib/wic/canned-wks => meta/wic}/mkhybridiso.wks          | 0
 {scripts/lib/wic/canned-wks => meta/wic}/qemuloongarch.wks        | 0
 {scripts/lib/wic/canned-wks => meta/wic}/qemuriscv.wks            | 0
 {scripts/lib/wic/canned-wks => meta/wic}/qemux86-directdisk.wks   | 0
 {scripts/lib/wic/canned-wks => meta/wic}/sdimage-bootpart.wks     | 0
 {scripts/lib/wic/canned-wks => meta/wic}/systemd-bootdisk.wks     | 0
 15 files changed, 0 insertions(+), 0 deletions(-)
 rename {scripts/lib/wic/canned-wks => meta/wic}/common.wks.inc (100%)
 rename {scripts/lib/wic/canned-wks => meta/wic}/directdisk-bootloader-config.cfg (100%)
 rename {scripts/lib/wic/canned-wks => meta/wic}/directdisk-bootloader-config.wks (100%)
 rename {scripts/lib/wic/canned-wks => meta/wic}/directdisk-gpt.wks (100%)
 rename {scripts/lib/wic/canned-wks => meta/wic}/directdisk-multi-rootfs.wks (100%)
 rename {scripts/lib/wic/canned-wks => meta/wic}/directdisk.wks (100%)
 rename {scripts/lib/wic/canned-wks => meta/wic}/efi-bootdisk.wks.in (100%)
 rename {scripts/lib/wic/canned-wks => meta/wic}/efi-uki-bootdisk.wks.in (100%)
 rename {scripts/lib/wic/canned-wks => meta/wic}/mkefidisk.wks (100%)
 rename {scripts/lib/wic/canned-wks => meta/wic}/mkhybridiso.wks (100%)
 rename {scripts/lib/wic/canned-wks => meta/wic}/qemuloongarch.wks (100%)
 rename {scripts/lib/wic/canned-wks => meta/wic}/qemuriscv.wks (100%)
 rename {scripts/lib/wic/canned-wks => meta/wic}/qemux86-directdisk.wks (100%)
 rename {scripts/lib/wic/canned-wks => meta/wic}/sdimage-bootpart.wks (100%)
 rename {scripts/lib/wic/canned-wks => meta/wic}/systemd-bootdisk.wks (100%)

diff --git a/scripts/lib/wic/canned-wks/common.wks.inc b/meta/wic/common.wks.inc
similarity index 100%
rename from scripts/lib/wic/canned-wks/common.wks.inc
rename to meta/wic/common.wks.inc
diff --git a/scripts/lib/wic/canned-wks/directdisk-bootloader-config.cfg b/meta/wic/directdisk-bootloader-config.cfg
similarity index 100%
rename from scripts/lib/wic/canned-wks/directdisk-bootloader-config.cfg
rename to meta/wic/directdisk-bootloader-config.cfg
diff --git a/scripts/lib/wic/canned-wks/directdisk-bootloader-config.wks b/meta/wic/directdisk-bootloader-config.wks
similarity index 100%
rename from scripts/lib/wic/canned-wks/directdisk-bootloader-config.wks
rename to meta/wic/directdisk-bootloader-config.wks
diff --git a/scripts/lib/wic/canned-wks/directdisk-gpt.wks b/meta/wic/directdisk-gpt.wks
similarity index 100%
rename from scripts/lib/wic/canned-wks/directdisk-gpt.wks
rename to meta/wic/directdisk-gpt.wks
diff --git a/scripts/lib/wic/canned-wks/directdisk-multi-rootfs.wks b/meta/wic/directdisk-multi-rootfs.wks
similarity index 100%
rename from scripts/lib/wic/canned-wks/directdisk-multi-rootfs.wks
rename to meta/wic/directdisk-multi-rootfs.wks
diff --git a/scripts/lib/wic/canned-wks/directdisk.wks b/meta/wic/directdisk.wks
similarity index 100%
rename from scripts/lib/wic/canned-wks/directdisk.wks
rename to meta/wic/directdisk.wks
diff --git a/scripts/lib/wic/canned-wks/efi-bootdisk.wks.in b/meta/wic/efi-bootdisk.wks.in
similarity index 100%
rename from scripts/lib/wic/canned-wks/efi-bootdisk.wks.in
rename to meta/wic/efi-bootdisk.wks.in
diff --git a/scripts/lib/wic/canned-wks/efi-uki-bootdisk.wks.in b/meta/wic/efi-uki-bootdisk.wks.in
similarity index 100%
rename from scripts/lib/wic/canned-wks/efi-uki-bootdisk.wks.in
rename to meta/wic/efi-uki-bootdisk.wks.in
diff --git a/scripts/lib/wic/canned-wks/mkefidisk.wks b/meta/wic/mkefidisk.wks
similarity index 100%
rename from scripts/lib/wic/canned-wks/mkefidisk.wks
rename to meta/wic/mkefidisk.wks
diff --git a/scripts/lib/wic/canned-wks/mkhybridiso.wks b/meta/wic/mkhybridiso.wks
similarity index 100%
rename from scripts/lib/wic/canned-wks/mkhybridiso.wks
rename to meta/wic/mkhybridiso.wks
diff --git a/scripts/lib/wic/canned-wks/qemuloongarch.wks b/meta/wic/qemuloongarch.wks
similarity index 100%
rename from scripts/lib/wic/canned-wks/qemuloongarch.wks
rename to meta/wic/qemuloongarch.wks
diff --git a/scripts/lib/wic/canned-wks/qemuriscv.wks b/meta/wic/qemuriscv.wks
similarity index 100%
rename from scripts/lib/wic/canned-wks/qemuriscv.wks
rename to meta/wic/qemuriscv.wks
diff --git a/scripts/lib/wic/canned-wks/qemux86-directdisk.wks b/meta/wic/qemux86-directdisk.wks
similarity index 100%
rename from scripts/lib/wic/canned-wks/qemux86-directdisk.wks
rename to meta/wic/qemux86-directdisk.wks
diff --git a/scripts/lib/wic/canned-wks/sdimage-bootpart.wks b/meta/wic/sdimage-bootpart.wks
similarity index 100%
rename from scripts/lib/wic/canned-wks/sdimage-bootpart.wks
rename to meta/wic/sdimage-bootpart.wks
diff --git a/scripts/lib/wic/canned-wks/systemd-bootdisk.wks b/meta/wic/systemd-bootdisk.wks
similarity index 100%
rename from scripts/lib/wic/canned-wks/systemd-bootdisk.wks
rename to meta/wic/systemd-bootdisk.wks
-- 
2.51.0


