Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40A06FEE4CE
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 00:38:40 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.150259.1772411915524152450
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Mar 2026 16:38:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Hs17/S5N;
 spf=pass (domain: gmail.com, ip: 209.85.222.171, mailfrom: twoerner@gmail.com)
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-8c9f6b78ca4so530932285a.0
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Mar 2026 16:38:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772411914; x=1773016714; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AdlR4Vzo/qffFk8/iUzJfRndscrinIDlSywo4+9/jNI=;
        b=Hs17/S5NDecFmWemaNBNWRRwBw4pt0dik8ph+Cq5Xf99EsA1cOs4hZFQk0p1+kFmwY
         fXIndFoe8MMZu0ZRHglY2z3MH5IVZ3Ib2TcLZe/P/+zPGCUyqoVUnatKr0luIYMce+wS
         vXsr8H9LjzRt86GXe/oVPzu0RYscaYxODmetop4nUcBIjBHdRkmkZ43v3SCJJ4STdVAr
         7IdLjLpDkIsz7e0gsgEWtCRzNoyH35Y3hzHnVQomc8R3ZmrqDF6npDvBDfAk9zREN79G
         c/3GgjbiKblxWSnDTw50dUTA/QdZSKGfkbBewKfqUsfSg2NkMzEUiUxkxL+QLFi9B6ir
         zpdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772411914; x=1773016714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AdlR4Vzo/qffFk8/iUzJfRndscrinIDlSywo4+9/jNI=;
        b=XhEZYVi6RL2o1YCcWB8QjEQWAV5XPD3gK4kM7MfD+cfxjy28LQTau/KKVPH+UMIIOE
         qchTNdOl5WdcOHtoeXhOvsaFjdd6KnPXb8t/aytWHV/qjBmo/B3DVwFTgbUWtqa0u6hx
         PMydC1q9+0iGEaR5ZkUfZlNbZE67WR8yckYPu29BjffobsmrE8lR6TeAyy8sj0AzEBZa
         b24cIiscNe16o0PERNR3OoXxuwnRAPX8efGOeiv8caHHXixsBoG/4FmGSjPr5+OrFjEy
         wwMk+rrtT4tNJeJsPjZwHYRALJtV8WAujWMkwf7hoBXbo9gkkMg8IftspG4O5a1nM9Ah
         BQtg==
X-Gm-Message-State: AOJu0Ywmy9pLqy7pkOZZrUrsEo6WAuDDw+qxgZ7iIqHll2zqHMcJna79
	nxsd+ZeyMvDUJ65adYL1gTiKm+EWIZUnU8guylmdG6p1PMCj2bt4yxteZ+2J5CwJ
X-Gm-Gg: ATEYQzwDeCju2V7I8sStTlWhpeV6sGxPx3bZTVhVDMPoxKWJG9mhozMb/OlaNvjBZcF
	O5dlij5aC0BZPJAvrk7zViiCio/dPXFPuI95kDg+mgvLHPYnob1hvBf1ZaPgwKNyESJCMpv0U5V
	d3l3iEYwqiLx0Ql/xrC+IXm0gYzfHaINlXxUYwuPGcN8k0z1OGQiB84feKACD8+Y43mohQOeXcK
	cl7Ajr/2jyyO/+QBNO+4W6oRM+IEgcThG3Y2VCMbiYcVgg7dzJnX8imynloQd7mSvyQrcjt+0db
	zWYw1kUt0SezWvknBKGj9cBqcKnQnit8Ikt76/Q9UL2xxI5yqrKtC19KDvZL+YWNXMB/UcWySLv
	pTYR4ogZpd4IZhTYTc0GIt4JfLVQE+swXVPjklTp/GBUeamcn6UVJycPjYJFLJ16gGebWLfDAz3
	uJWCbuSqh7R41qQba4rI9IeMVdzt52/TV9yQ2mUf4RljI0wJRlzQ6kRJMTe0PM7YklMw==
X-Received: by 2002:a05:620a:298d:b0:8cb:4128:ec29 with SMTP id af79cd13be357-8cbc8e8261fmr1394545585a.72.1772411913591;
        Sun, 01 Mar 2026 16:38:33 -0800 (PST)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-899ebb09772sm33710356d6.12.2026.03.01.16.38.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 16:38:32 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v7 2/9] wic: move sample *wks files
Date: Sun,  1 Mar 2026 19:38:19 -0500
Message-ID: <20260302003826.3995222-3-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260302003826.3995222-1-twoerner@gmail.com>
References: <20260302003826.3995222-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Mar 2026 00:38:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232148

By convention, wic will look for a "wic" directory in the top-level
of all BBLAYERS in order to find *wks files. oe-core was the only
exception; it stored its *wks files in scripts/lib/wic/canned-wks. Take
the *wks, *wks.in, *inc, and *cfg files that were in the canned-wks
location and place them in a "wic" top-level directory in the oe-core
layer, thereby following the convention of every other layer.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
changes in v7:
- none

changes in v6:
- re-ordered so that this patch occurs before wic is removed, thus
  saving the commit history

changes in v5:
- rebase with master
- split patchset out again

v4: skipped to align/combine with other patch set

changes in v3:
- squashed into 1 large patch

changes in v2:
- none
---
 meta/classes-recipe/image_types_wic.bbclass                     | 2 +-
 {scripts/lib/wic/canned-wks => meta/wic}/common.wks.inc         | 0
 .../canned-wks => meta/wic}/directdisk-bootloader-config.cfg    | 0
 .../canned-wks => meta/wic}/directdisk-bootloader-config.wks    | 0
 {scripts/lib/wic/canned-wks => meta/wic}/directdisk-gpt.wks     | 0
 .../lib/wic/canned-wks => meta/wic}/directdisk-multi-rootfs.wks | 0
 {scripts/lib/wic/canned-wks => meta/wic}/directdisk.wks         | 0
 {scripts/lib/wic/canned-wks => meta/wic}/efi-bootdisk.wks.in    | 0
 .../lib/wic/canned-wks => meta/wic}/efi-uki-bootdisk.wks.in     | 0
 {scripts/lib/wic/canned-wks => meta/wic}/mkefidisk.wks          | 0
 {scripts/lib/wic/canned-wks => meta/wic}/mkhybridiso.wks        | 0
 {scripts/lib/wic/canned-wks => meta/wic}/qemuloongarch.wks      | 0
 {scripts/lib/wic/canned-wks => meta/wic}/qemuriscv.wks          | 0
 {scripts/lib/wic/canned-wks => meta/wic}/qemux86-directdisk.wks | 0
 {scripts/lib/wic/canned-wks => meta/wic}/sdimage-bootpart.wks   | 0
 {scripts/lib/wic/canned-wks => meta/wic}/systemd-bootdisk.wks   | 0
 16 files changed, 1 insertion(+), 1 deletion(-)
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

diff --git a/meta/classes-recipe/image_types_wic.bbclass b/meta/classes-recipe/image_types_wic.bbclass
index aea61d67e3ed..c9baf35ed35d 100644
--- a/meta/classes-recipe/image_types_wic.bbclass
+++ b/meta/classes-recipe/image_types_wic.bbclass
@@ -45,7 +45,7 @@ inherit_defer ${@bb.utils.contains('INITRAMFS_IMAGE_BUNDLE', '1', 'kernel-artifa
 
 WKS_FILE ??= "${IMAGE_BASENAME}.${MACHINE}.wks"
 WKS_FILES ?= "${WKS_FILE} ${IMAGE_BASENAME}.wks"
-WKS_SEARCH_PATH ?= "${THISDIR}:${@':'.join('%s/wic' % p for p in '${BBPATH}'.split(':'))}:${@':'.join('%s/scripts/lib/wic/canned-wks' % l for l in '${BBPATH}:${COREBASE}'.split(':'))}"
+WKS_SEARCH_PATH ?= "${THISDIR}:${@':'.join('%s/wic' % p for p in '${BBPATH}'.split(':'))}"
 WKS_FULL_PATH = "${@wks_search(d.getVar('WKS_FILES').split(), d.getVar('WKS_SEARCH_PATH')) or ''}"
 
 def wks_search(files, search_path):
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


