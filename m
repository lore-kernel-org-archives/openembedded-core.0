Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57930C54F5E
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 22:22:16 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2705.1785277334069454655
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jul 2026 15:22:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=UtjyhrJg;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4953de5be0aso2310155e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Jul 2026 15:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785277332; x=1785882132; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sAhhuhBFGRONMIMxGwIdzNjmUhyogHsvHcBG1Zm+Gaw=;
        b=UtjyhrJgpY2THR+BGetMeNsRUVcn2+Da9u7rIBlvn4dvp5mQbxb3Kb3C+B3c0ohQLg
         qE71vb9DyUhffoSu6pZPMTkUG4FTwMBpBjcC3WmwZ1Mhcrjod+dL6xmghvd1DMh9ZZig
         mfFLGotSSIR7xYsxb4czCqFSOeQXDvWTLkXfs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785277332; x=1785882132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=sAhhuhBFGRONMIMxGwIdzNjmUhyogHsvHcBG1Zm+Gaw=;
        b=aFhL6ZxknUDYfj2xQBi/TaM8bRdUJHzqRVVqaGiujedQk09kZBnDLYZFJiPG7NnTOW
         z3v+OG0swd7vo3QoPi1UVMoRVXs0VhfHYWSWL3c3JImfC5y0PP9Mi7yN+k8sZTlc5RrY
         LYk80nNw3wDEYeXa9UlLgKs4wkvWg30TUDta2L2XE8KO0pQTWm4TQoXU/k0kPMFM9J1H
         7b1N4Ma3TFfoUtrGR3vVrZMXG16REBdY1hhw9vVDKtGwqU+GHRx3g2XxcY30bjdMSQov
         grNhQwG/qjuTQ8AB2RT9YSRYZPHc9VeKYwu7WkxFqfbsmdE5rSBoyUaqnxkUCQ5iMBa6
         b4ug==
X-Gm-Message-State: AOJu0YyjO60Vz/zdupW+RAtNV+E5QDX0Knd1RrBoJ94tqLKRfwUXgGIL
	1WsnwnjV1SunO0Jv0buOcImQL5xNvW9gyfI2TAsHFsSnkwb5ZXyEqaxCYWA729PKcDakHEu+AyI
	xuVuchBg=
X-Gm-Gg: AR+sD12FvLjDqV++yE21KpSuWkdbQalcvvZqsHMeg0Wb1CHmGchHHipQePtZR25hIm0
	Tk/vJm7PBY4OOjyXKaHE2lPb4qKA3S/++wBh8I1NXMfgvXLW/g9WQbX1OZKGlTXyQg1iFjHy6DR
	gnbn+6UpevGuwdV48CMrhBmdqKjzndr+HUDYhfJuWOjCMfheOsk4G8xpVHXZWF2Ho+RxZzzWoQI
	wLWEVm4Pb+GNge3A6O4GIE22XNAtxTdDSe098+OyV9VTYMFp6Ojljc7vA1fQ4ZEeo5sl9FeyzmT
	6fGcy3AkaX/yOi8Cmc8t4TyW8DJI4VHCN9HdJZYw1NlcP3J77ugx/4NRbj8OQENx20soAzrd9Uo
	82EsH8BK5luupyIZQX7WVAYiFrNol6XD32UoLDxQJdXWfEXk1DbEUoKn+hTfFr0OTixr8U8B8Hm
	qOaEUyjpr83tiVpAdDtzaAKis90FsYCDHeL15bbZdlzZDHkAuSDWywI50Aw31ENxJe3+oaICLOT
	TRNZsSXBD0Ke8LAFGj7UovIDNnSPmOLNYYm0nGj9RnQUcEtf8aCBd/Gtw8LlvOG
X-Received: by 2002:a05:600c:c173:b0:495:3e08:ad19 with SMTP id 5b1f17b1804b1-496c654d9dbmr44181015e9.9.1785277332324;
        Tue, 28 Jul 2026 15:22:12 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4976bd6da4asm7669405e9.1.2026.07.28.15.22.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 15:22:11 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 14/19] vim: Security Fix for CVE-2026-47162
Date: Wed, 29 Jul 2026 00:21:49 +0200
Message-ID: <2f2d13412852098c0a9c4d633d9f2f340d34b29b.1785277157.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1785277157.git.yoann.congal@smile.fr>
References: <cover.1785277157.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Jul 2026 22:22:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242217

From: Siddharth Doshi <sdoshi@mvista.com>

Picking patch as per [1], and same patch is mentioned in [2]

References:
[1] https://nvd.nist.gov/vuln/detail/CVE-2026-47162
[2] https://security-tracker.debian.org/tracker/CVE-2026-47162

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../vim/files/CVE-2026-47162.patch            | 39 +++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-47162.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-47162.patch b/meta/recipes-support/vim/files/CVE-2026-47162.patch
new file mode 100644
index 00000000000..33f1ebbfd14
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
index 2175c5f9a85..3fd0b66bf48 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -39,6 +39,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://CVE-2026-28422.patch \
            file://CVE-2026-42307.patch \
            file://CVE-2026-43961.patch \
+           file://CVE-2026-47162.patch \
            "
 
 PV .= ".1683"

