Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64AC6C531C7
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 09:26:17 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19545.1784798772170353856
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2026 02:26:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Ih7Pk8jX;
 spf=pass (domain: mvista.com, ip: 209.85.214.181, mailfrom: sdoshi@mvista.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2cf52d15d88so4278075ad.2
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 02:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1784798771; x=1785403571; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C2wqpPQjn9/7VR4RuOnbDZMeCjm8VCQnwMblmJ4BHkk=;
        b=Ih7Pk8jXPG4PU4OSizLx4cfJ13rFyx0B/4GY23ige5TOhb6oNjKTI8IZvwvRiHNnsE
         HlremurdCXj1K8tePKPwbLxq6xFWTWhFUgJSrcIjsAHQuLZWZ/JkjzR+sSsYTjFjb8TO
         jjHIqml34YX4MnMzvNz3WqYOqMK+YgA8ons9U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784798771; x=1785403571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=C2wqpPQjn9/7VR4RuOnbDZMeCjm8VCQnwMblmJ4BHkk=;
        b=ch9TLuRDBvLCNSVzYDhDFi7VK7MYLWtDEusWyK4qNLJoGSM+oltH/pmTffI1sAiP9s
         9cW7N6z5sQLRV2EBCbLtkjAaeoH3Vy5tTTxIAOIxt2tUzpr33isEF9l59ynNTWhJ6WBG
         kRwo3sDBjpHjrWbBoNtsmiSThOpr/6cUodROh9eMGCouZUhz/VOFAmNcr9PQCsN4SNqZ
         oQfEUNvzfJA/66K7/oSOHRccV6xOslYl1FjAD5Oa41AvICal4mLWj2LQQQs2Et8qonBu
         WVqKoOeSKmzXfQ5UvxbvoIy2ML8esJKaPAaWf1R3+vEO2C4mycbynKTeqLYO1u6gd/TK
         bITw==
X-Gm-Message-State: AOJu0Yz3fi3mIYXWcAw/5ph8NDk7OGu6Z2hUeplBD9Smq9eVr/AEnICW
	1P6QLZ9bwaza5/x7joSmo2Q718tyzb0U9+5xQACrpotPPP5f1fsZ4AyLhuIyZr+CE7xJAdouk0P
	e6+JK7cM=
X-Gm-Gg: AR+sD11z+t6QEG4dAwjldJEyuLLg9pCg4jCNhQ7PaQnRB6bxhjBwAP3mJzBse9Hh48A
	ldNKf7AVg1qyQcEb1VROFMpQYQU2BtFw91gN5wh9OBS/enLGFSsD1sOx+VppJnNoyDU9O8F5ZAr
	d98MNHWlDFK7E2CWYcl0iju00ye4dvFzCyov0SnHgKybZHlT8gE7JcEk8+et9COyi2WC5426a8e
	MzctQHrxgDYJTSppjbEckEXh8ntbEIambYEq05eXYgAp+gnq3Mg6TPlYJkIEGKZAG+ktOZpbZIf
	F16NGadIvfW06Sy2cfa4+V6xn4ZjonuzwKLfUPVEN91Kv2xmHQHVVbvpxQksUWHykEIaI1jqLqi
	ZJdDEUp1bIbvbcwLL0QDDnGx7d01ji8u9wscm3LOx/LaDIb1VE4vk0NnJyUDrFDoUknuSW5V1Ev
	R66tzCHlrs1ng=
X-Received: by 2002:a17:903:9ce:b0:2cf:83bf:6b05 with SMTP id d9443c01a7336-2cfa6f82203mr26830205ad.41.1784798771402;
        Thu, 23 Jul 2026 02:26:11 -0700 (PDT)
Received: from MVIN00030.mvista.com ([157.32.44.18])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e1c7ff4sm19333788eec.27.2026.07.23.02.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 02:26:11 -0700 (PDT)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Siddharth Doshi <sdoshi@mvista.com>
Subject: [OE-core][scarthgap][PATCHv2 04/13] vim: Security Fix for CVE-2026-47162
Date: Thu, 23 Jul 2026 14:53:45 +0530
Message-Id: <20260723092354.54697-4-sdoshi@mvista.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260723092354.54697-1-sdoshi@mvista.com>
References: <20260723092354.54697-1-sdoshi@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 09:26:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241808

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
index 2175c5f9a8..3fd0b66bf4 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -39,6 +39,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://CVE-2026-28422.patch \
            file://CVE-2026-42307.patch \
            file://CVE-2026-43961.patch \
+           file://CVE-2026-47162.patch \
            "
 
 PV .= ".1683"
-- 
2.34.1


