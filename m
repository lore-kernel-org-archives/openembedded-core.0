Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75586C4453A
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 20:22:03 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9342.1784751718358861205
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 13:21:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=cmDjBIEH;
 spf=pass (domain: mvista.com, ip: 209.85.214.177, mailfrom: sdoshi@mvista.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cacf197759so156056995ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 13:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1784751718; x=1785356518; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dbw0uGTNUuSNzwvng4oGurvFgdjKg2rGCI30S/KNZEk=;
        b=cmDjBIEHCZu710GmLN9nhuT1XlU8P975DkwCaY6XlpGrsOpP0h2XoOdItBLrkyGjll
         /3d61KqpHcGudKjrZUNpjQwjg7goUjWCFMfzK33S5q6++PyhVjyf7aRfBSqbBSAXRRQj
         +sJEFd71w8o6RQUV6PD217Rku1jHiRvY+9FWM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784751718; x=1785356518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Dbw0uGTNUuSNzwvng4oGurvFgdjKg2rGCI30S/KNZEk=;
        b=lv/ZkmKm+UZ/JLpsHrwUtfDrrCgeWxNpE6v7pY4/2fmZJI4NFQgdd73m/qeG0ciuNj
         7XVGlgCVwbeqWVakCcf5Ojf9EmQpA62yZrXmdHJ2fyabG4kG2dOVIapipNP1CXWlOy2c
         CX2tvQ1CU800cqKF+KXI1fYs24hxAhXcNFVLZJUHgvFDEyh3rWIMkVOdYwlDxa6Q10ch
         81zGLpByIU6tBQMS/BJfj+ydHgMIo1mI4kKToOkG9T2NDz1nHUXczxajJYiEXF20zhpP
         MpwC9/t4bC43HcrCD610qRH+5KReDnMxXQprwQQZyRunrsbA26LczKJJ0Nx6WpXhsGVq
         a5DA==
X-Gm-Message-State: AOJu0YxLk4EtT5GMu+EYY4tPBo43QeyBaHBgroV9Oe7lsHpWMz/Qv9eD
	CBaxH1tcc55LEEVY8Pu06r9lKiEo1l2ukwod/EGb5FT+WhdJCNPNgei0lwokzQiE8mYmQJRdMUT
	8dwztzvU=
X-Gm-Gg: AR+sD10kZKAs7POHP4bVpictl0kyAm/nm66QdcZnpsYyqz2nhlOvScV0L8DiGgDLviw
	JDvkXU5itMm3c9CF6p0CECDBRpnc+wO7w2kLOxiOQHc8/7OHXjirwfS0nBEEAZpDRdjp4baUpt5
	Nb0KV9cebpK8YaVDEcZEQG/G3s94B/BOUXbC9kjXpqUysUn2t87YuQNsv7HYcJwXfw5wjrt14Py
	cq/0gNQIldI1X9xyV1ALWldfZQL7eS27dc2PbNCi4VSG0BZ9r8FiAR8w6REkp67WbeaEeUVej9d
	dSEDHQx2sxOJQx8ChrFkHojop0XtnRHdQj/1sOk57uAMQzvkXNZvOEzinH2eqFPPSl1/OMHkO01
	Z80hnZs0xzyV810Wdyckk4tVs2BjO6f77ZTXDVxMMznmp6UghmctJVtdQNdSKoIsG6UGRn3xBF+
	gIuZfDqSnNCvQZKUsEZA2HA3U=
X-Received: by 2002:a17:902:eccb:b0:2c9:c46b:1286 with SMTP id d9443c01a7336-2cfa74ada2dmr3628315ad.34.1784751717673;
        Wed, 22 Jul 2026 13:21:57 -0700 (PDT)
Received: from MVIN00030.mvista.com ([157.32.46.199])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147d47960dsm11699468eec.0.2026.07.22.13.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 13:21:57 -0700 (PDT)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Siddharth Doshi <sdoshi@mvista.com>
Subject: [OE-core][scarthgap][PATCH 04/13] vim: Security Fix for CVE-2026-47162
Date: Thu, 23 Jul 2026 01:48:56 +0530
Message-Id: <20260722201905.491897-4-sdoshi@mvista.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260722201905.491897-1-sdoshi@mvista.com>
References: <20260722201905.491897-1-sdoshi@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 20:22:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241748

From: Siddharth Doshi <sdoshi@mvista.com>

Picking patch as per [1], and same patch is mentioned in [2]

References:
[1] https://nvd.nist.gov/vuln/detail/CVE-2026-47162
[2] https://security-tracker.debian.org/tracker/CVE-2026-47162

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
---
 .../vim/files/CVE-2026-47162.patch            | 39 +++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-47162.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-47162.patch b/meta/recipes-support/vim/files/CVE-2026-47162.patch
new file mode 100644
index 0000000000..33f1ebbfd1
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2026-47162.patch
@@ -0,0 +1,39 @@
+From d254c3b584e19555f2aecc4886ae7c92c0acc199 Mon Sep 17 00:00:00 2001
+From: Christian Brabandt <cb@256bit.org>
+Date: Sun, 17 May 2026 18:53:48 +0000
+Subject: [PATCH 04/17] patch 9.2.0495: [security]: runtime(netrw): code
+ injection via NetrwBookHistSave()
+
+Problem:  [security]: runtime(netrw): code injection via
+          NetrwBookHistSave()
+Solution: Properly quote the directory name using string() function
+          (Srinivas Piskala Ganesh Babu)
+
+Github Security Advisory:
+https://github.com/vim/vim/security/advisories/GHSA-crm5-rh6j-2c7c
+
+Signed-off-by: Christian Brabandt <cb@256bit.org>
+
+Upstream-Status: Backport [https://github.com/vim/vim/commit/f08ab2f4d7d2947c8dd6c179ae08ee6146a2694b]
+CVE: CVE-2026-47162
+Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
+---
+ runtime/pack/dist/opt/netrw/autoload/netrw.vim | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/runtime/pack/dist/opt/netrw/autoload/netrw.vim b/runtime/pack/dist/opt/netrw/autoload/netrw.vim
+index e484de5c93..9014ca339b 100644
+--- a/runtime/pack/dist/opt/netrw/autoload/netrw.vim
++++ b/runtime/pack/dist/opt/netrw/autoload/netrw.vim
+@@ -2921,7 +2921,7 @@ function s:NetrwBookHistSave()
+         while ( first || cnt != g:netrw_dirhistcnt )
+             let lastline= lastline + 1
+             if exists("g:netrw_dirhist_{cnt}")
+-                call setline(lastline,'let g:netrw_dirhist_'.cnt."='".g:netrw_dirhist_{cnt}."'")
++                call setline(lastline,'let g:netrw_dirhist_'.cnt.'='.string(g:netrw_dirhist_{cnt}))
+             endif
+             let first   = 0
+             let cnt     = ( cnt - 1 ) % g:netrw_dirhistmax
+-- 
+2.44.4
+
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 006ae9473f..7b0b140bf8 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -36,6 +36,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://CVE-2026-28422.patch \
            file://CVE-2026-42307.patch \
            file://CVE-2026-43961.patch \
+           file://CVE-2026-47162.patch \
            "
 
 PV .= ".1683"
-- 
2.34.1


