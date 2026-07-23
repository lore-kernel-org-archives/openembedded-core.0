Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D3F6C531CF
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 09:26:17 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19544.1784798769297626049
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2026 02:26:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=BVFdZQiv;
 spf=pass (domain: mvista.com, ip: 209.85.210.171, mailfrom: sdoshi@mvista.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-845c92bc464so269154b3a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 02:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1784798769; x=1785403569; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kAb9aRdCKQFu+ZnVFV8GJCshqOQBr0afQE8glTI37Kg=;
        b=BVFdZQivyuXsq8adCHTmhH9amOJj39GOVasPUiP4BRcTtAp3ARS0C99WCBpTbEQobm
         z9WUAwLMyZadLPGudwHtct/5F9P3+58Xnq1mqqiZNj+4apmNBouE7YJ4OoiTuN4YY94T
         kOR9HqC0Ch6V/JB6G+BDjTsUkTCJcDdRVmjnM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784798769; x=1785403569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kAb9aRdCKQFu+ZnVFV8GJCshqOQBr0afQE8glTI37Kg=;
        b=mguAQKrOx0aHec2Oc38NWQZK88W6WFZhCzFru+0ph+hOKOR+L6COeQdbSb89lFv3QK
         X5B2Rxu4IqIYGe1m5ELhpwxd3lem10g7gK3RoQX8jxjddQ9lOqOSZitZUuQ5seuUCRKn
         BLE3Y3bwxXbuD2EsHp16x2Nkv08OpeVCF0I1snr7nl8SKMvpt41s/OLXCxGiK4BHEc0O
         suLjADKKl1LTexoTnRrzaKvnwzeX8tLrudfaUH585EMWEKfuYHB5L/Ta/W5Wrq5/30TB
         hq5l9mDb4Jie8mq/xE9FybuRUnGHxa7HOxm6T0x38Ij4oT8gFd5Lo1hWwnHk6rSXHIDR
         mfRw==
X-Gm-Message-State: AOJu0YzVXNnBZQKsFgMZjcM0qq5BMH9Pq5TxN16RU8zCK8hj/XHH3tbS
	zPsjTqeBYBOrLsPcxe/HW7aVuqizP0sOsTsak0wgDGx5kmf4fvq7wLP2/73ItHprzsIcfxuNfhh
	eHvs5Y/4=
X-Gm-Gg: AR+sD13xFa8Twe6oBKEWRsqlwzg2RkDpG0VvyV1tpTzWu8awFBdhBTK9KJt94o+E5r3
	0uLzw1rsrc1ScGlEaCP3xJEY7ezQcpXNa9+bunMGNRZIVDgR+tXboFUj5IxEqiwx3rxfhgo24ak
	Fk4bcJxTyiYy0PWbHDh1MiXHOddG5gep90uaNN3QWdpbECqmIYPup7lisjQ6Pwm2BDBzdR6vn90
	Q2953Xt4FiqwZJhh3dRT1Rhbi7T2H3tG5oJDD3thhvEcucI5ZNWoKfzEqZTskopcmG82NESQYw4
	AwtyAwd5oNWD0m258yhAInVuCq4j5MsEgTsZNkxOGbRpfBj4VNQjxj4r3ftNAMe/yGVDpVMcXWk
	ghrmZhhX4C/3DV97K30dWmYctFrQwkpljm1UOCXvC0u6inv9kHWCtXk5MMa2pc/E3any8l8kuxN
	7y8lJQBtnQfNmK8n8p8mb5kQ==
X-Received: by 2002:a05:6a20:c79a:b0:3bf:a698:ce4d with SMTP id adf61e73a8af0-3c44b244083mr2354062637.54.1784798768575;
        Thu, 23 Jul 2026 02:26:08 -0700 (PDT)
Received: from MVIN00030.mvista.com ([157.32.44.18])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e1c7ff4sm19333788eec.27.2026.07.23.02.26.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 02:26:07 -0700 (PDT)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Siddharth Doshi <sdoshi@mvista.com>
Subject: [OE-core][scarthgap][PATCHv2 03/13] vim: Security Fix for CVE-2026-43961
Date: Thu, 23 Jul 2026 14:53:44 +0530
Message-Id: <20260723092354.54697-3-sdoshi@mvista.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260723092354.54697-1-sdoshi@mvista.com>
References: <20260723092354.54697-1-sdoshi@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 09:26:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241807

From: Siddharth Doshi <sdoshi@mvista.com>

Picking patch as per [1], and same patch is mentioned in [2]

References:
[1] https://github.com/vim/vim/commit/8af0f098c3a42a28661d0295364e
[2] https://security-tracker.debian.org/tracker/CVE-2026-43961

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
---
 .../vim/files/CVE-2026-43961.patch            | 65 +++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |  1 +
 2 files changed, 66 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-43961.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-43961.patch b/meta/recipes-support/vim/files/CVE-2026-43961.patch
new file mode 100644
index 0000000000..f9e0fc0df4
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2026-43961.patch
@@ -0,0 +1,65 @@
+From f38c7cb2fcc9d5839386ea4722463ea921f0bbce Mon Sep 17 00:00:00 2001
+From: Christian Brabandt <cb@256bit.org>
+Date: Thu, 14 May 2026 16:43:15 +0000
+Subject: [PATCH 03/17] patch 9.2.0480: [security]: runtime(netrw): code
+ injection via mf command
+
+Problem:  [security]: runtime(netrw): code injection via mf command
+          (Christopher Lusk, Zdenek Dohnal)
+Solution: Do not use string concatenation inside the filter() commands
+          (Zdenek Dohnal)
+
+Github Security Advisory:
+https://github.com/vim/vim/security/advisories/GHSA-66hr-7p6x-x5j3
+
+Signed-off-by: Christian Brabandt <cb@256bit.org>
+
+Upstream-Status: Backport [https://github.com/vim/vim/commit/8af0f098c3a42a28661d0295364e]
+CVE: CVE-2026-43961
+Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
+---
+ runtime/pack/dist/opt/netrw/autoload/netrw.vim | 7 +++----
+ 1 file changed, 3 insertions(+), 4 deletions(-)
+
+diff --git a/runtime/pack/dist/opt/netrw/autoload/netrw.vim b/runtime/pack/dist/opt/netrw/autoload/netrw.vim
+index 805474616d..e484de5c93 100644
+--- a/runtime/pack/dist/opt/netrw/autoload/netrw.vim
++++ b/runtime/pack/dist/opt/netrw/autoload/netrw.vim
+@@ -5155,7 +5155,7 @@ function s:NetrwMarkFile(islocal,fname)
+ 
+         else
+             " remove filename from buffer's markfilelist
+-            call filter(s:netrwmarkfilelist_{curbufnr},'v:val != a:fname')
++            call filter(s:netrwmarkfilelist_{curbufnr}, {_, v -> v !=# a:fname})
+             if s:netrwmarkfilelist_{curbufnr} == []
+                 " local markfilelist is empty; remove it entirely
+                 call s:NetrwUnmarkList(curbufnr,curdir)
+@@ -5176,7 +5176,6 @@ function s:NetrwMarkFile(islocal,fname)
+ 
+     else
+         " initialize new markfilelist
+-
+         let s:netrwmarkfilelist_{curbufnr}= []
+         call add(s:netrwmarkfilelist_{curbufnr},substitute(a:fname,'[|@]$','',''))
+ 
+@@ -5196,7 +5195,7 @@ function s:NetrwMarkFile(islocal,fname)
+             call add(s:netrwmarkfilelist,netrw#fs#ComposePath(b:netrw_curdir,a:fname))
+         else
+             " remove new filename from global markfilelist
+-            call filter(s:netrwmarkfilelist,'v:val != "'.dname.'"')
++            call filter(s:netrwmarkfilelist, {_, v -> v !=# dname})
+             if s:netrwmarkfilelist == []
+                 unlet s:netrwmarkfilelist
+             endif
+@@ -7202,7 +7201,7 @@ function s:NetrwTreeDisplay(dir,depth)
+         " hide given patterns
+         let listhide= split(g:netrw_list_hide,',')
+         for pat in listhide
+-            call filter(w:netrw_treedict[dir],'v:val !~ "'.escape(pat,'\\').'"')
++            call filter(w:netrw_treedict[dir], {_, v -> v !~# pat})
+         endfor
+ 
+     elseif g:netrw_hide == 2
+-- 
+2.44.4
+
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 7a865f122e..2175c5f9a8 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -38,6 +38,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://CVE-2026-52860.patch \
            file://CVE-2026-28422.patch \
            file://CVE-2026-42307.patch \
+           file://CVE-2026-43961.patch \
            "
 
 PV .= ".1683"
-- 
2.34.1


