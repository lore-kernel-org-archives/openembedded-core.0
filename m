Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F20BC43327
	for <webhook@archiver.kernel.org>; Wed,  1 Jul 2026 07:54:32 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.39677.1782892467350939030
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jul 2026 00:54:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=X+BWJIl+;
 spf=pass (domain: gmail.com, ip: 209.85.222.177, mailfrom: twoerner@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-9217d13c276so19560185a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Jul 2026 00:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782892466; x=1783497266; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QSgUu9S1D6LpUfreqme4h0fQH0VqnxSYhu7rmfe4P0s=;
        b=X+BWJIl+pLwOU5sFTEQWTig1JqWqB0i2S3wQnaevjOHcoy2Y2ZTqs/u7N7KCL1dzTv
         9ncOKMgaIXWrn57BvQRZ6hEYH1p0M2tM0cqk0ASmrzTniMCQA4sZ92H53pzocM9/NqvM
         Md3s21ZmG7fG9WEsghoMXaK0i11LCvqP5dDVCdmUUNz4Z4Fm67jXapfqCA4HLT7luWY0
         2NM4bDLzy7dU7KwBvylobCZePmWyYcvojT3/hEP1P3HjNIl659tPlHSKIumsmbbdksny
         3/7b+pUH1RmdG5c78ZcsplBlEh/BZhdJCFGkPi/x5lcAWw3mkxl4eg+77NYfWG+uzayQ
         41tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782892466; x=1783497266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QSgUu9S1D6LpUfreqme4h0fQH0VqnxSYhu7rmfe4P0s=;
        b=CibCB0hhQEfEwZZTwC/xq+d9e8Gj3jnOm+JlOz58RKSAvKqAb8KNDTeKKbpkYwcVPi
         4uEieaXhI58NRbzAoDjXKObTcKN/tnrDuJJG9lXeuygyjgUatOvMHvzx0i5KGwHmAyPb
         v3B+wbJCplV2yMzHDIf/sStPFEkhS1oiogX8SOt3k36K+euMDaUUDrMNMbXbHqomi9Zv
         nr04m23MCh6TUAbi6c94qbIL+SdL+LtCVDYcvq/zCWWxA5cqn2g2tpK3nZrSiHU6vYgL
         +xPtAVwb2WQTBjIWoWoF0hqy7M7jNYPPiEyXKUEHvlRkO3OldgEJeWMscrdNcw//9f0O
         sYKQ==
X-Gm-Message-State: AOJu0YwV2tzXzzSYjbxuucXCbgqGgsA2NSWPZRsirLR8OuxJwv7hQYOg
	n1kBqVnClrMT7PD28QL8kiOwNfOt/6pga20MJQlu3VK/k3enI9yrcwguuUZ+GA==
X-Gm-Gg: AfdE7clB52sCFsbSQ1q6tCRdgtd7IBdPVbYCPtJxsT03bOobrL/q7f3M+3MSNkoyEq8
	C/3erEKm6zxjROUBpVLT4GTzEFDfevbOM+LSbdcI8tY3oY7JCwSj0ZYcu8Sd8TdnnqNhRfVAY7O
	Wrf7ovCYI5gZiRfuFMJ+Y11zXt+7WyZ/cFlLRKKGJEzKvxAVpLpJTgiogwCMAy9mz0owBHQIcoD
	mELdVrdcEDYrgofBZBKvWyaEBQpb8f5hwMUgNlVA1bI5fIX35t1vrdlHoIFkm6pNJo7j/ocMAHR
	4KrmMO9tiAv7dDnAcrMAL3Y0NSQhMOKnBDSUD7OFGYMa9qL2XWyBmxO9ZRDT+JrFHJoaDliVwgU
	lmHMYl2+UQ7H4KQOZJKl4e/YkzMjT60yk7XUocimAE11mhRJzofZn94K9F274bK/IYq/FdpHP+u
	h7sMGV2uS836W3CnADIC5S79eIAOkzv5J/X8Yf1Z9DQQyQ7GXCfCGHpTY=
X-Received: by 2002:a05:620a:4720:b0:92e:59b0:df08 with SMTP id af79cd13be357-92e781d49c3mr80465685a.3.1782892466245;
        Wed, 01 Jul 2026 00:54:26 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e62371ba1sm502294485a.42.2026.07.01.00.54.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 00:54:24 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] wic: add runtime dependencies on the tools it invokes
Date: Wed,  1 Jul 2026 03:54:09 -0400
Message-ID: <20260701075411.1092848-3-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260701075411.1092848-1-twoerner@gmail.com>
References: <20260701075411.1092848-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jul 2026 07:54:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239950

wic shells out to a number of host-side tools (parted, mkdosfs, mcopy,
the mkfs.* family, mdir, sfdisk, e2fsck, resize2fs, debugfs, blkid,
...) but does not declare them as dependencies. For the bitbake
do_image_wic task this is handled by the wic-tools recipe, which builds
those tools into the native sysroot. Wherever else wic is installed as
a package it gets none of them, and its offline lookup (wic ls/cp/write)
falls back to the host PATH, so wic works only by chance depending on
what the host has installed:

  wic.WicError: Can't find executable 'mcopy'

Make wic carry the tools it may invoke by adding the shared WIC_TOOLS
helpers as RDEPENDS. They are added to the nativesdk variant, which is
where wic is packaged for use outside a bitbake build; the native and
target variants are unaffected.

resize2fs is added explicitly: e2fsprogs splits it into its own
e2fsprogs-resize2fs package, so nativesdk-e2fsprogs alone does not
provide it, and it is needed by the wic cp/write resize path.

syslinux (with its isohybrid helper) is gated to x86 hosts; cdrtools
(mkisofs) is native-only with no nativesdk variant and is only needed
for ISO images, so it cannot be included.

AI-Generated: codex/claude-opus 4.8 (xhigh)
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta/recipes-support/wic/wic_0.3.0.bb | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/meta/recipes-support/wic/wic_0.3.0.bb b/meta/recipes-support/wic/wic_0.3.0.bb
index 7dbf84b039a6..6efe974e02bd 100644
--- a/meta/recipes-support/wic/wic_0.3.0.bb
+++ b/meta/recipes-support/wic/wic_0.3.0.bb
@@ -10,6 +10,8 @@ CVE_PRODUCT = "yoctoproject:wic"
 
 inherit python_hatchling
 
+require recipes-core/meta/wic-tools.inc
+
 RDEPENDS:${PN} += " \
     python3-core \
     python3-json \
@@ -17,4 +19,20 @@ RDEPENDS:${PN} += " \
     python3-misc \
     "
 
+# wic shells out to the WIC_TOOLS tools but does not declare them, so
+# wherever wic is installed as a package it may not have them and its
+# offline lookup falls back to the host PATH. Pull them in for the
+# nativesdk variant so they are present regardless of the host; native
+# and target wic are unaffected.
+RDEPENDS:${PN}:append:class-nativesdk = "${@' '.join(' nativesdk-%s' % t for t in d.getVar('WIC_TOOLS').split())}"
+
+# resize2fs is split into its own e2fsprogs-resize2fs package, so
+# nativesdk-e2fsprogs alone does not provide it.
+RDEPENDS:${PN}:append:class-nativesdk = " nativesdk-e2fsprogs-resize2fs"
+
+# syslinux (and its isohybrid helper, in the -misc package) only builds
+# for x86 hosts; cdrtools (mkisofs) is native-only with no nativesdk
+# variant and so cannot be included.
+RDEPENDS:${PN}:append:class-nativesdk = "${@' nativesdk-syslinux nativesdk-syslinux-misc' if d.getVar('SDK_ARCH') in ['x86_64', 'i686'] else ''}"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.50.0.173.g8b6f19ccfc3a


