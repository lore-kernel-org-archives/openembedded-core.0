Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 466B0F4BB9C
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 07:49:50 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.40873.1772005783381713756
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 23:49:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kpdikphK;
 spf=pass (domain: gmail.com, ip: 209.85.222.178, mailfrom: twoerner@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-8cb39647a70so625541285a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 23:49:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772005782; x=1772610582; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=17xcwOPRtzb3kMyBGfN1ydBVga2MN+jPRG3ipMsVCdg=;
        b=kpdikphKuKTLOLUWhuu1ya2kwHyyzlwMCV/0zdjBXLWbOpZsLN2BPmpjVVuavN4M5h
         7Cm+kdS1XbrLORGe1mEOb5TMfSuax1C+AV1jjFGQK1x4zE053ha3dAIZCfIa0B2LYQcz
         4emh625WUQQLMY9wXvIpZGszUEPDZaUsQGFN7NwPC04b5ziuD4pC0DHjpaIbw1ozAtZr
         Goekr8hrKtifPzkhx1j/xxWK+0DFnXRtY4vTcjkG0nmux5d+/82cQrrBokfXZu+L92m8
         lpRTktmwZ4Q3i4GIsehqjIxw5ZkStPY/bE7qRaiyyDt4qqIgUewbuWpnj3gEQBb4Qbg8
         BDIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772005782; x=1772610582;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=17xcwOPRtzb3kMyBGfN1ydBVga2MN+jPRG3ipMsVCdg=;
        b=i3vnDaV5N1vDfPm/vFO44KEC/fR6sHXr6RaZSvbHGgafqBhSawG+U2sRsPh/A0Fcjc
         H+9uRy2ghb7cLYEweJTeVf+L7hxppXinFxIfzPRDb/nSfQWhmhfJnCXLO9M3GQdCXlbe
         zMYZC/2bQDoVVjsmBO0L/cq5CRzrY3l0o5cvjmdMrKs+7iIqgBCr+3Aj01LQKiBXQ2lM
         fvrNZHB/2GxHT8rJCd8+cP3WSQmO5Ry7m1yI+I+xG2DaVqMx5mhkG9CRfZRkDzmn8efI
         4a18T29UACSOTxMvvXf91eTb/PrwqOgCoAYhauU9NW8LzENG3/3JQMen5imRdgaMXAYM
         5CDg==
X-Gm-Message-State: AOJu0YywzUHIsjgz44sjbyAkjymLD0662NtivBe1kvMJ/saBe79Bqx9u
	5FwyKEkce9nhWK5dkMw6YQVW99E97YAPV20cT5JpKNxds3QCuX+UFQGSWns9FWGx
X-Gm-Gg: ATEYQzxiChP8592HmD114LOvze5t2SZ8+x3E+j2WhJ1VzAkXdrh/figrAbxCMufJelx
	IOggERpa+pBlLPsGtrpXLfj+nrYsnblS13Hg4zsSWzVLX8r9uh4TwetxHXrWj1mSh1RbO6iY60e
	2VW2yxHavW5Zyuqy+UzneD3vD5cnEWy4Jl1vt45c82fmUMBEe533E0tu+XGlPtM2YvEt5WJQf5F
	fLPTCIWwN7LtozCCaOoD3hVYCGUfioZKbrMJi6fE3es6vp46bLJdNJzKglYjeCZB9kzn5Dr8wHb
	BZgI7G2ZRSqykUuY1XOkt7saWDfYnXD9iXvmpiBghPm+VP1wrkloBVsAs17EmqWobDedST8nKKG
	OHY1O4+lk+JEwqYN5HXs9wPZXwRpmhAskoPkpuLHc11wb+HcUax98dyRfkvNPCr0R9nMUbNUckt
	ZgSvA1Z6hpsYX2Hwj8a87mNc0K2fKQBZF31gt1PmNo7VuVNI7/60ecewEMJ+izHsWP2w==
X-Received: by 2002:a05:620a:c4a:b0:8c7:b5b:cea7 with SMTP id af79cd13be357-8cbb57b8e22mr180693985a.12.1772005781825;
        Tue, 24 Feb 2026 23:49:41 -0800 (PST)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cb8d0614fbsm1390089785a.17.2026.02.24.23.49.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 23:49:41 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v6 2/9] wic: move sample *wks files
Date: Wed, 25 Feb 2026 02:49:24 -0500
Message-ID: <20260225074931.1661345-3-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260225074931.1661345-1-twoerner@gmail.com>
References: <20260225074931.1661345-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Feb 2026 07:49:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231931

By convention, wic will look for a "wic" directory in the top-level
of all BBLAYERS in order to find *wks files. oe-core was the only
exception; it stored its *wks files in scripts/lib/wic/canned-wks. Take
the *wks, *wks.in, *inc, and *cfg files that were in the canned-wks
location and place them in a "wic" top-level directory in the oe-core
layer, thereby following the convention of every other layer.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
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
index 675aa9751367..f2fd00e6d7ec 100644
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


