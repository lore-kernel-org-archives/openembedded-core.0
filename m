Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57B0CC27C4F
	for <webhook@archiver.kernel.org>; Sat,  1 Jun 2024 12:25:06 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.36155.1717244702599890309
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Jun 2024 05:25:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=J72QMseU;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1f47f07aceaso16028285ad.0
        for <openembedded-core@lists.openembedded.org>; Sat, 01 Jun 2024 05:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1717244702; x=1717849502; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mbsx/bQydrlXw/lQez8RCl/4uNoZVsr3cF+QT+kJOoU=;
        b=J72QMseUDWjdSDTRS+afjXG4FQKIjCnBK8w6OXBONG5p+0dNvt8lECLWch/TXTPLey
         B5LP5Gm2H6iDlDHvuFhpfeRpLsatFqCu7oMk8QSat7XWLBgHsVGhmFv5jVi7MyPWZOz5
         bw8vTGPY1YGBViXofgX9pCBXjb5+xh4yhfbUOP+AXlRzj83YnPo00UtMgou9Re9gRDxW
         CmBpDL5ZrSlvGkO3skiLkxcgO4pESpsTiADaa0BVGvc/qY2HqU+QH2O8G/7UMQB+EYYk
         cZu6nPrPnDGWtZYcKpsPchE2mOE0BxnInqF/nhNl3RMS6sHDnl72bCd7kvTtPWAAUKDA
         jm4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717244702; x=1717849502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mbsx/bQydrlXw/lQez8RCl/4uNoZVsr3cF+QT+kJOoU=;
        b=H5NMkLEANwTX0T5U71FfwuHBRnsBRsHgj7TAXYq/HZ9tIXh0BOGsNdG2TPkC+2zeYd
         sx2C0eKDd1Z0HhrcoPXJnpbX4ra+JRbb5PMpnUkG0cUutCy9dYdILLcQrcKouu4OOSHM
         DOwgw6ETQ+yyVfwhLZonClogkRpBHsqP0q9Qp8k7kvnV5LzpxPEoyudFROjiEoF06ab3
         GhHt4jEA3Xl0bxEl09k1CnEnSQk9xkcsDnHYPywiRwzOh2e6/Lo/9MMiu3uNZlB8YXA5
         pssFnHUXCfBF3QQ+OEVAniXUgrSq+kK0361XEKcWNny6oAt6Quz9sDNPVGQx6VEdZSWO
         y4SQ==
X-Gm-Message-State: AOJu0Yz7D4ZisN2iwJ4VMtSqyyEJsKGr7Vo5syue1FkYdxMk/jTwXQZw
	ljF3DPvSaJTMNyTWuQTcdXpA7+owhMnlP3DxySIcdXPOaToRx9JMMPVpVMw2bGtf6lkJ/0FKPpm
	H
X-Google-Smtp-Source: AGHT+IE8/h/+A4Mfzp5Xnpzb3dSw0FUNcCP4QH9lAJIyS/ZHrkk/eLYjKrwHwPd7KZDnCfCtcrlKZw==
X-Received: by 2002:a17:902:c94b:b0:1f4:5d87:ffb3 with SMTP id d9443c01a7336-1f636fe89e5mr60583625ad.17.1717244701583;
        Sat, 01 Jun 2024 05:25:01 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f63241d4d9sm31804165ad.296.2024.06.01.05.25.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Jun 2024 05:25:01 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 05/21] ghostscript: fix CVE-2024-33869
Date: Sat,  1 Jun 2024 05:24:31 -0700
Message-Id: <d24e9c6c1016fbe8522f647aca76d93ab9cc5a41.1717243719.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1717243719.git.steve@sakoman.com>
References: <cover.1717243719.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Jun 2024 12:25:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200101

From: Archana Polampalli <archana.polampalli@windriver.com>

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ghostscript/CVE-2024-33869-0001.patch     | 39 ++++++++++++++
 .../ghostscript/CVE-2024-33869-0002.patch     | 52 +++++++++++++++++++
 .../ghostscript/ghostscript_10.02.1.bb        |  2 +
 3 files changed, 93 insertions(+)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2024-33869-0001.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2024-33869-0002.patch

diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2024-33869-0001.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2024-33869-0001.patch
new file mode 100644
index 0000000000..2f20c66ea3
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2024-33869-0001.patch
@@ -0,0 +1,39 @@
+From 5ae2e320d69a7d0973011796bd388cd5befa1a43 Mon Sep 17 00:00:00 2001
+From: Ken Sharp <Ken.Sharp@artifex.com>
+Date: Tue, 26 Mar 2024 12:02:57 +0000
+Subject: [PATCH 2/5] Bug #707691
+
+Part 1; when stripping a potential Current Working Dirctory specifier
+from a path, make certain it really is a CWD, and not simply large
+ebough to be a CWD.
+
+Reasons are in the bug thread, this is not (IMO) serious.
+
+This is part of the fix for CVE-2024-33869
+
+CVE: CVE-2024-33869
+
+Upstream-Status: Backport [https://cgit.ghostscript.com/cgi-bin/cgit.cgi/ghostpdl.git/commit/?id=5ae2e320d69a7d0973]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ base/gpmisc.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/base/gpmisc.c b/base/gpmisc.c
+index c4a69b0..1d4d5d8 100644
+--- a/base/gpmisc.c
++++ b/base/gpmisc.c
+@@ -1164,8 +1164,8 @@ gp_validate_path_len(const gs_memory_t *mem,
+
+             continue;
+         }
+-        else if (code < 0 && cdirstrl > 0 && prefix_len == 0 && buffer == bufferfull) {
+-            buffer = bufferfull + cdirstrl + dirsepstrl;
++        else if (code < 0 && cdirstrl > 0 && prefix_len == 0 && buffer == bufferfull
++            && memcmp(buffer, cdirstr, cdirstrl) && !memcmp(buffer + cdirstrl, dirsepstr, dirsepstrl)) {
+             continue;
+         }
+         break;
+--
+2.40.0
diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2024-33869-0002.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2024-33869-0002.patch
new file mode 100644
index 0000000000..5dcbcca998
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2024-33869-0002.patch
@@ -0,0 +1,52 @@
+From f5336e5b4154f515ac83bc5b9eba94302e6618d4 Mon Sep 17 00:00:00 2001
+From: Ken Sharp <Ken.Sharp@artifex.com>
+Date: Tue, 26 Mar 2024 12:07:18 +0000
+Subject: [PATCH 3/5] Bug 707691 part 2
+
+See bug thread for details
+
+This is the second part of the fix for CVE-2024-33869
+
+CVE: CVE-2024-33869
+
+Upstream-Status: Backport [https://cgit.ghostscript.com/cgi-bin/cgit.cgi/ghostpdl.git/commit/?id=f5336e5b4154f515ac83]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ base/gpmisc.c | 21 +++++++++++++++++++++
+ 1 file changed, 21 insertions(+)
+
+diff --git a/base/gpmisc.c b/base/gpmisc.c
+index 1d4d5d8..b0d5c71 100644
+--- a/base/gpmisc.c
++++ b/base/gpmisc.c
+@@ -1090,6 +1090,27 @@ gp_validate_path_len(const gs_memory_t *mem,
+         rlen = len;
+     }
+     else {
++        char *test = (char *)path, *test1;
++        uint tlen = len, slen;
++
++        /* Look for any pipe (%pipe% or '|' specifications between path separators
++         * Reject any path spec which has a %pipe% or '|' anywhere except at the start.
++         */
++        while (tlen > 0) {
++            if (test[0] == '|' || (tlen > 5 && memcmp(test, "%pipe", 5) == 0)) {
++                code = gs_note_error(gs_error_invalidfileaccess);
++                goto exit;
++            }
++            test1 = test;
++            slen = search_separator((const char **)&test, path + len, test1, 1);
++            if(slen == 0)
++                break;
++            test += slen;
++            tlen -= test - test1;
++            if (test >= path + len)
++                break;
++        }
++
+         rlen = len+1;
+         bufferfull = (char *)gs_alloc_bytes(mem->thread_safe_memory, rlen + prefix_len, "gp_validate_path");
+         if (bufferfull == NULL)
+--
+2.40.0
diff --git a/meta/recipes-extended/ghostscript/ghostscript_10.02.1.bb b/meta/recipes-extended/ghostscript/ghostscript_10.02.1.bb
index ca6f628f38..91285ed2ad 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_10.02.1.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_10.02.1.bb
@@ -27,6 +27,8 @@ SRC_URI = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/downlo
            file://avoid-host-contamination.patch \
            file://configure.ac-add-option-to-explicitly-disable-neon.patch \
            file://CVE-2024-33870.patch \
+           file://CVE-2024-33869-0001.patch \
+           file://CVE-2024-33869-0002.patch \
            "
 
 SRC_URI[sha256sum] = "e429e4f5b01615a4f0f93a4128e8a1a4d932dff983b1774174c79c0630717ad9"
-- 
2.34.1


