Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DBACC4453F
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 20:22:03 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9339.1784751715671614068
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 13:21:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=HY8g6kar;
 spf=pass (domain: mvista.com, ip: 209.85.210.170, mailfrom: sdoshi@mvista.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8486ac3f347so5558496b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 13:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1784751715; x=1785356515; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a0mzEY+lbFwh/gt03vTXdj/qJFufO8jGgsVmAQb6c/g=;
        b=HY8g6kargnJUo/Q3/jLFg6XXDXp0oYXphrNfVvvDxa9uN5XCePjvk8kg2Bcej6ias4
         J2j5tlj4Rd5TiQgSsxdRR97Gpwl3up40YMi0JJeBTfFIImaxGOZwsnHemHKtPC4etOoe
         LcSQOSxR06za53E2OIQFOrmJWECFjGYN09Iy0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784751715; x=1785356515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=a0mzEY+lbFwh/gt03vTXdj/qJFufO8jGgsVmAQb6c/g=;
        b=OrpP26HeDSoNGPqYD4ly2/s+UEo2jxyA0OOy/CDl96PjqUlJ2uNrNjvLjVznjEq1q4
         7XeDISmMlVylRtevQbCKIQsCn0Yw7Wq1e88kpg4Ped3myDzmPnpB4+JnJuY9EwXXxhRA
         re+oK5SFcrWzj9enx0YMAea/tAyXiF2kkDpE2haFnDbKVjT9xBTmIMCf8Mu3ZuHUdbs6
         VGEkWG4HRfDJkERd2RvCmV23lHdg52MTXR1ffIEM32uFFfRuB68bGfVY+NuwANn+nikr
         7dcBWQmxz7fif2l/l0SYAX1LYowmFJhxPLS7c/mcG5kjJt2J8iyGPfUPazWycjBNqNTL
         +Hyg==
X-Gm-Message-State: AOJu0Yw19rB9DolaXVofdTrLvdyq7mSVM6vvxZzV9N7YgRHSJUuyn3kS
	AsOU49ESUSWr2JU55EemCgDmW6dKWSzasFK+XnUylaKOTbVdR+uB6/49UpKlEXh1u6sqyk0WDKc
	NroMldbQ=
X-Gm-Gg: AR+sD10CsgFfgpfc3UoZStV+KBxEzQ54J6awKM7PNNBw4uKYmdswmvi6BTeVBUKUjZW
	CRMYHt2rY1XQB17GYpl3bMj6JwvneT3g6FzkwFSvfP5k6U4Fks2nxu3TnVbH2Q8iR9O2MOwK71f
	31+eklRoL8dBAR9ue5wzNzf6PwVjBvC07mu1O3HdnWYuxdz3PFMYVevsnDw9vMsJpeYDfB1voWu
	+SoU5BKOSc2nS77xC3u7mqUTqtNa+k69yjCTBzxIcghjlrBTLQzpp2dgdWmvWnfJeWn90p1Yha9
	y/bjefTatSkWeqFhnpG53tgG8hw3lzBuVQADpu8MZviX/TimIJPvYfL+mDhaG4wCi2ugXyKGy7u
	BH62WmD+I1t0UwW5Aye39ulaRW56EGfDgog0iR24QYj2ZFUka2i/ZSSFu1Jz73yOqJamS5OBzvr
	eahK6xKbAgZmuL
X-Received: by 2002:a05:6a21:46c4:b0:3c3:6e84:ace8 with SMTP id adf61e73a8af0-3c429455f22mr6090314637.23.1784751715025;
        Wed, 22 Jul 2026 13:21:55 -0700 (PDT)
Received: from MVIN00030.mvista.com ([157.32.46.199])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147d47960dsm11699468eec.0.2026.07.22.13.21.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 13:21:54 -0700 (PDT)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Siddharth Doshi <sdoshi@mvista.com>
Subject: [OE-core][scarthgap][PATCH 03/13] vim: Security Fix for CVE-2026-43961
Date: Thu, 23 Jul 2026 01:48:55 +0530
Message-Id: <20260722201905.491897-3-sdoshi@mvista.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260722201905.491897-1-sdoshi@mvista.com>
References: <20260722201905.491897-1-sdoshi@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 20:22:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241747

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
index 902115bbd6..006ae9473f 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -35,6 +35,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://CVE-2026-28420.patch \
            file://CVE-2026-28422.patch \
            file://CVE-2026-42307.patch \
+           file://CVE-2026-43961.patch \
            "
 
 PV .= ".1683"
-- 
2.34.1


