Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81271C44536
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 20:22:03 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9346.1784751721007595874
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 13:22:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=RbGDz39C;
 spf=pass (domain: mvista.com, ip: 209.85.215.171, mailfrom: sdoshi@mvista.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c998fd549a8so8645368a12.2
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 13:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1784751720; x=1785356520; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8TG39gHoxpQoiKdmxRy9lvILoXdedsRJ0AmJvYkKuJc=;
        b=RbGDz39C+aWpync61GLDeq3zydP+hSiBFDk7K4b/rMH8JuH7S3IfcNKET0evGwsAzr
         SF7JNVEplFy1NH1DuUenl0+XTdqUfipyUCzI9QsPio0E91evaXRrVBnzfdIQV7FrNCMs
         2539Hu8UCsPs/Y0EkSD0HR5vFU1GqmDxSZs48=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784751720; x=1785356520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8TG39gHoxpQoiKdmxRy9lvILoXdedsRJ0AmJvYkKuJc=;
        b=eidiJ/nRH2mhNSaSU7EbrURnEa+aEOzSDvqGuAJ3mhTXzRD3oqL+TtdbxffD67sytu
         cI54p8BA1/ZDm8S9JZQDceJJ/uX5AVP7qJJZP6THATIqn7TPzK3LoxlSb1Iq7U+dhh3v
         nn1SEeT8FTOWUAHbR+Quf1R6Kk/Oqt+LSBlG/LJ8APLRX/shHth5F37uLhDhRMBRBTHy
         kRv8Wwsh+mWa4BtSqb35XM1Mc68Stg44xTTFR/iOR+WbJX+D4R1SXpcNFUVXfX9hEJza
         nfFk4BR8HmcHiGrpRY7+m9fZA2CemrHrSVjfkmPpu0hY0yoqasOlRUnYZ0Jk2S5mJ1ag
         U7gA==
X-Gm-Message-State: AOJu0YywtsZCGXatB3WUAkFIK3qgp1/5F3Lt1v6ZgIXJypHzbWufUzok
	5yZpQJiD2Cdet35dpacYvrbvru2lKCwy9yiv7LquQTDAebSAkB0K3VsYitX94HXqNNCr4zdz49w
	GndzWNpw=
X-Gm-Gg: AR+sD12oXFnkuOE+UvrlsZCwDVG7Fc5dF3teeSrOGtOYLfZPlKQvvRlhGDPDWGK3ZIB
	59i+TiAY7KhRob8wx9d7NJuazwQBxOU6kzxS+nnqfwt/e+1pHhY+9uoHZrn/sT/gMn028thKEKa
	9RnRSMSnEVYei2buJ4egun76+sZ06uD3hhWBo2f26ziMEqn6FLQowyALxQZvHDUFpOpGFdr5gpI
	dodr3GPSFnwsTqIg1YII7HAf4Ddp5Hzh4EtjIi3eonhfhSdpyXXeDPwE9LBKPmLy1IoNp2KYFnZ
	nJUvd50wHLIg2WJv2/uyv8v8lAzukmM3idofRp0Oe+DpyLSPTh7NYbqv3g8TYmqaYmG2NZJXBV7
	ai/D2hW8aiLGoAOGopzOIjFMW50DcXA86hCE1V/Dy1o1/+JXxnAIOarecTaWleb6My6nsb0tL0O
	igOVLLqi+YJgqe
X-Received: by 2002:a05:6a20:7344:b0:3c4:1c9f:d81 with SMTP id adf61e73a8af0-3c44afaabf8mr46722637.7.1784751720412;
        Wed, 22 Jul 2026 13:22:00 -0700 (PDT)
Received: from MVIN00030.mvista.com ([157.32.46.199])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147d47960dsm11699468eec.0.2026.07.22.13.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 13:21:59 -0700 (PDT)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Siddharth Doshi <sdoshi@mvista.com>
Subject: [OE-core][scarthgap][PATCH 05/13] vim: Security Fix for CVE-2026-47167
Date: Thu, 23 Jul 2026 01:48:57 +0530
Message-Id: <20260722201905.491897-5-sdoshi@mvista.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260722201905.491897-1-sdoshi@mvista.com>
References: <20260722201905.491897-1-sdoshi@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 20:22:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241749

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
index 7b0b140bf8..038751ed74 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -37,6 +37,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://CVE-2026-42307.patch \
            file://CVE-2026-43961.patch \
            file://CVE-2026-47162.patch \
+           file://CVE-2026-47167.patch \
            "
 
 PV .= ".1683"
-- 
2.34.1


