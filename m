Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E0B6C53219
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 22:22:15 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2808.1785277334655703757
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jul 2026 15:22:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=0RjxGAEW;
 spf=pass (domain: smile.fr, ip: 209.85.221.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-47f6609c657so188219f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Jul 2026 15:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785277333; x=1785882133; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2jD6oYCmCdWorxur2jvs8bkR/neLQzb1cFyadIjlDlM=;
        b=0RjxGAEWyZHnu91mdST0qyBUKNHhPLG9/IpwcKRpkRSTTQjGscuLRLkwneW/yCqTfw
         5VVujMfkQ2jrGF3D9HSy3yX1De+zlLmFaHTGU1NadTRLqtmrMo+PD1HbIDayp+I4QWl+
         /I1vUCO78YZg20Xeqv4CLf3vmySyMoOJqd63c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785277333; x=1785882133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=2jD6oYCmCdWorxur2jvs8bkR/neLQzb1cFyadIjlDlM=;
        b=XMqeC4jVDV+M4p7sT1Tzk3GRoQVNO2WhsFol5zXWGDixqv4t/nZ+ycUjWFQkQLJpVK
         5ZKM8lKKDG7ocSAsEj50Ku3U11IUgKLV4mKnGG/OH8jzl9oE0GY5ScXgK1ZfZl5r8/a1
         +9GdmdIZ8yoqU6YS/kGkiWHg6X/x2TBYX7xaeMnwhdsffbPnd2fDyz2foSEfd1+pudMD
         dgVJAQi/YrjJMkesucr84zuB9GZtrKSkdm9VKCRPtsx+EQhT/C/JjqVsde8y3cJ5ogCX
         zYvjJEOyj2Qgih3NT0XgO8P7eghHSXYXYTH6aBDdYxcRFRxxDDkZcETiAGCcsZ6fP2HG
         nWaQ==
X-Gm-Message-State: AOJu0YwyCH9YdOJ7sauqnJHQpBK0On83TEd6A4mjaVyz2f3NKG2Tb5Ak
	MtGbhEVMez8U8LXJUHp59dAXLkvfXV+UYq9yfY5oTAoeLIR/tuBb2+y0NUxuj76Oa3xbThEKZfK
	sJB2Awzc=
X-Gm-Gg: AR+sD115KXCc/W9/HZFajRk+9PTaoTVnyvZf7USudiJ7eAr83uWewsfZ9i0E1TIwSZY
	aZV4faQJ2DVZQtJszO1KhGUVhtZoHmKKHcuB0NiDAqN9h1CLR0PRlk0ad9UoSjvHASjKCdQARlr
	1uXOZg1tGckIJeiFfhTs8tk6oTF6oHiQEAy5wjpOqIwkVjxlDzg107nSY8fLhC1nNw3zAngutVs
	uSX6DTuGMBc7M0RRIqG0/AUq1Pf2sQOnmgahccZmOOV8clD/Eq7bbFEQB/Nc566JhCBcqKUuuUh
	Ssuyk/UaT2ElClVFi0fQPu2djP+5KuBtPkJPcmlIrXC0ZpJnvR2X1aUNFtk/ls3XOFcAhFsQQoi
	CWOxMqxoJG6oDKM8eXVZfCtE5poQKAHI3OM96Iqo42ggCrv//+xyIVsb128nBajszbEmmo+tti0
	8BlVgjKJgva6Ff/mg6o077Coy1gcP1c0a36f1agx2DlBC8HfE5ZFgcnbXlsCIXyvBnPwbe4YXlc
	u0b8wkEyxF8wISeQRJSoNJccjgY3Hhu/I8FvNPwHi1JeBDNYjGsGwM8UKsJRIlN
X-Received: by 2002:a05:600c:4704:b0:495:5d6d:d4f7 with SMTP id 5b1f17b1804b1-496c658ee8bmr45459875e9.24.1785277332943;
        Tue, 28 Jul 2026 15:22:12 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4976bd6da4asm7669405e9.1.2026.07.28.15.22.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 15:22:12 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 15/19] vim: Security Fix for CVE-2026-47167
Date: Wed, 29 Jul 2026 00:21:50 +0200
Message-ID: <4c3c569a7d9e19f7d613d01afd2ab793a4d35453.1785277157.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1785277157.git.yoann.congal@smile.fr>
References: <cover.1785277157.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Jul 2026 22:22:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242218

From: Siddharth Doshi <sdoshi@mvista.com>

Picking patch as per [1], and same patch is mentioned in [2]

References:
[1] https://nvd.nist.gov/vuln/detail/CVE-2026-47167
[2] https://security-tracker.debian.org/tracker/CVE-2026-47167

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../vim/files/CVE-2026-47167.patch            | 39 +++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-47167.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-47167.patch b/meta/recipes-support/vim/files/CVE-2026-47167.patch
new file mode 100644
index 00000000000..f0e493290c2
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2026-47167.patch
@@ -0,0 +1,39 @@
+From e117fcc6f1c1973602c8e2c6529fba9ee1ce59b4 Mon Sep 17 00:00:00 2001
+From: Christian Brabandt <cb@256bit.org>
+Date: Sun, 17 May 2026 19:39:24 +0000
+Subject: [PATCH 05/17] patch 9.2.0496: [security]: Code Injection in cucumber
+ filetype plugin
+
+Problem:  [security]: Code Injection in cucumber filetype plugin
+          (Christopher Lusk)
+Solution: Use rubys Regexp.new() with the untrusted pattern
+
+Github Security Advisory:
+https://github.com/vim/vim/security/advisories/GHSA-4473-94jm-w5x9
+
+Signed-off-by: Christian Brabandt <cb@256bit.org>
+
+Upstream-Status: Backport [https://github.com/vim/vim/commit/a65a52d684bc58535ad28a4ae824d22e76399934]
+CVE: CVE-2026-47167
+Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
+---
+ runtime/ftplugin/cucumber.vim | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/runtime/ftplugin/cucumber.vim b/runtime/ftplugin/cucumber.vim
+index f4848d1c60..3361f1db4a 100644
+--- a/runtime/ftplugin/cucumber.vim
++++ b/runtime/ftplugin/cucumber.vim
+@@ -96,7 +96,8 @@ function! s:stepmatch(receiver,target)
+   catch
+   endtry
+   if has("ruby") && pattern !~ '\\\@<!#{'
+-    ruby VIM.command("return #{if (begin; Kernel.eval('/'+VIM.evaluate('pattern')+'/'); rescue SyntaxError; end) === VIM.evaluate('a:target') then 1 else 0 end}")
++    " Use Regexp.new, so the pattern stays untrusted data and cannot inject Ruby
++    ruby VIM.command("return #{if (begin; Regexp.new(VIM.evaluate('pattern')); rescue RegexpError; end) === VIM.evaluate('a:target') then 1 else 0 end}")
+   else
+     return 0
+   endif
+-- 
+2.44.4
+
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 3fd0b66bf48..ec2cedc965d 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -40,6 +40,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://CVE-2026-42307.patch \
            file://CVE-2026-43961.patch \
            file://CVE-2026-47162.patch \
+           file://CVE-2026-47167.patch \
            "
 
 PV .= ".1683"

