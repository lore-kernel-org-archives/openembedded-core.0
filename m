Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50AD5C531CB
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 09:26:17 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19546.1784798774795153125
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2026 02:26:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=WOkwO4Kb;
 spf=pass (domain: mvista.com, ip: 209.85.216.41, mailfrom: sdoshi@mvista.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38e041ea211so401354a91.0
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 02:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1784798774; x=1785403574; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qrbF6GTkiHbfTyR0uiHvwBxcb7poKJrnY3oVr37IyF8=;
        b=WOkwO4KbDZ3/GKMxcC7soN2sgcq1G6aPefZvGHCra2m0iXyMDLnMiDk5RsgXwuWuyI
         GGBDaE6X2kAXhU3IZEUujbKsn/Em7yJAMX1oPEI2uW9h4QpunS4MnC3ZDwpATLUCf5n9
         fscOlySED4dFKIFcVHqJMpkqE8cL0hDbCQLbE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784798774; x=1785403574;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qrbF6GTkiHbfTyR0uiHvwBxcb7poKJrnY3oVr37IyF8=;
        b=VVdIFcjNmHnYZoqoqLVgH6PfwYPodn/xYQNqNbq3pFe0sfsxqrRGtspq5hWVwdyPcJ
         aPlhuEBPy+mMtdsS/tmuE9qvt+lgRVjOGIeEiXzSPSCc0GmlFzvWsjBKR/ckNuFeqK2v
         EFKIdhuwC0I83NHenoNUpWKt3Pe1AJEOIBfG5YZa695G9d0AD5z3CtzhEI3KXJulULIN
         Jlrb6ZfkRIZhfN5rdLqo1QKmH2MOHRMjx5AyEXxCRDYeVFBZAtt+LhHNZ5NFb43KJTWM
         /o8IuhliOfkKa/0tD949wIYdsundvQCKqLD7iBaUzu/DucM8JtUIYH3XPgGk8erXgUK8
         v8qw==
X-Gm-Message-State: AOJu0Ywrbz3frPr1YM3nV7bfWup70TLYuiEu5fvbdmvBoBCjm1P34YlQ
	YrOKF0QxI1Q+HPkEhaCFDOBUXWWawR/ggMLZAM8IcCXNpiclMiv//9AbNbrgzG44pLDqziikUM6
	ZBpCQNgA=
X-Gm-Gg: AR+sD13eYBglmXFU0MZOTfcPcjusyDy0QnDjk+DmZQrOGnAbw9D2QoPkqQuhDe/siKw
	4Dp80qlwFh3lB8xEC0mmSnfVkHWd2AGCLxFDHLSrL2oYZq6D4c0V/bfrMdlkeFOrt2Dlnbm+rp5
	Jbmhoz3+hm+va5Ti1noz+A4h+V8ZhG1Qxuk8Gvhx9Mi3o0wxUCPR4MeZuGSa21WK7QIhaM36kVI
	neGwstIS9s0b6fQGwWajHc73p6N1btY3suHUikZS9WAh5z/4bIbxkIaFhQvc2qiXaUt/wI9TG/n
	uXOFIus7D/4YXwMVShnRofJaOfYcsUvKOdkgmyDgb9CWPC3LOH1ql/OvKulMSqrY+4glp+0Gaep
	Tj3SuR7rctgTABNyoNN+RaZQ1ebsn8zEPNtMzuC8pfJYtbImUyzT462/kdJW6aVHMTItTMuRVcm
	rZxABbozDGFvqSzY/rw4ncXA==
X-Received: by 2002:a05:6a20:6a1c:b0:3c3:9c4e:de3a with SMTP id adf61e73a8af0-3c44afb705dmr2337641637.6.1784798774199;
        Thu, 23 Jul 2026 02:26:14 -0700 (PDT)
Received: from MVIN00030.mvista.com ([157.32.44.18])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e1c7ff4sm19333788eec.27.2026.07.23.02.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 02:26:13 -0700 (PDT)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Siddharth Doshi <sdoshi@mvista.com>
Subject: [OE-core][scarthgap][PATCHv2 05/13] vim: Security Fix for CVE-2026-47167
Date: Thu, 23 Jul 2026 14:53:46 +0530
Message-Id: <20260723092354.54697-5-sdoshi@mvista.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260723092354.54697-1-sdoshi@mvista.com>
References: <20260723092354.54697-1-sdoshi@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 09:26:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241809

From: Siddharth Doshi <sdoshi@mvista.com>

Picking patch as per [1], and same patch is mentioned in [2]

References:
[1] https://nvd.nist.gov/vuln/detail/CVE-2026-47167
[2] https://security-tracker.debian.org/tracker/CVE-2026-47167

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
---
 .../vim/files/CVE-2026-47167.patch            | 39 +++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-47167.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-47167.patch b/meta/recipes-support/vim/files/CVE-2026-47167.patch
new file mode 100644
index 0000000000..f0e493290c
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
index 3fd0b66bf4..ec2cedc965 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -40,6 +40,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://CVE-2026-42307.patch \
            file://CVE-2026-43961.patch \
            file://CVE-2026-47162.patch \
+           file://CVE-2026-47167.patch \
            "
 
 PV .= ".1683"
-- 
2.34.1


