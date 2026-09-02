Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23808C624D8
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 05:27:19 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5546.1788326834200316952
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2026 22:27:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=QxltZJwA;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-499b2981a7bso5899725e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2026 22:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788326832; x=1788931632; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cf1f1emJTxHXT0oUSRdRqmnHXb6av4SJU441WMHAPp4=;
        b=QxltZJwA9yIDjVg0gKBGqIRmrwbzxNXqg4qlhT6M4gEZRrXNCZifStd7W9mHLBvD5Y
         AbZdx0lCZzp65MeldX3BHE3xyMDe+7aJ5o1NYcuAP/py2vdrRYPPy0lpdcRAmQOtAhYY
         LXVoQjPg54HUb77Lf1kN/zCfqdF2EH/kXU84o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788326832; x=1788931632;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=cf1f1emJTxHXT0oUSRdRqmnHXb6av4SJU441WMHAPp4=;
        b=GLQukcWCAV98DUWv5y4Ms3hUAsnrrBTvdphOAfDd4T5WbGowBgK0XBfdf44piL90AX
         9gNtZERsvdTK4XJZBsl5CqlILuLOg4C9CMWah3M1AEk1hjIK8gL8/B9BslZJwqWfjih0
         oWG0T+rWA3FnyU2vK5mR501zQa09aAIuF7uXn0tgjJT7hxlVYea10jlaMtA+BUuO7c/f
         PtuE1f3q23m4SDeKSFpdRMm9KE/QOlAoaLaKtvgnGdb/hz2emphA5ajdz0+NEaM3DHGd
         pFnRVDjIxavBubdsiomkCzgK9QyGF18v1g0UD9hsDKXNtVMwPHaD29tllVZ8732JkxkN
         abvw==
X-Gm-Message-State: AFuF++mbagbc6BjwwV9GvLuCxkMws8ddhlDGklSvDAcmIeA2UeNS2ZkF
	yzU9OT3I4wr7o49qKZXJpr8vQ0SKnlG0O+bmaKHPh+Ni8goz1Th1OFz33/BlYoOKrwd5G+62nbE
	YVTjq0qU=
X-Gm-Gg: AR+sD139CpYR48BcWOdIVHViI8BV5wQNqXpfZ1D2vJuXLi/xMZFzbWCZBeHyWC+kjQ/
	T2FcivMFPnWwGbsMid9HoSDRQEl01/I8QBUkQwuKlnK1f3r2NqyNMuNUdIZQT+tRQJmZBbnRYxu
	f8JfcUlkxH+q7GyrOQIvorR9peEN1fHM6i20dgGkRgG+8GR+E3xAL8cUIdInPnsbNcwPA4AM53i
	ZOwRv9mDwagX10ufHcjUGgGtTTGPZODuNEJvh90KBQtUbjMN2tfEMwt32QgflPG4wFjtES/Exu/
	un5LNapSuohNdCfRVKHvtdrbmIzmnsXuC8Te1gAxVY1jGM9pfEU/r2JdNr69RL0OTf77KZxFqaL
	yMwBTPImnbXWx416tWecaF33gVsosV3k38sNv5Eo6o/Y/Jp/mLndnWiFxa1AgH8dsrS3Y3b+LHq
	TV+/G4izjDLJPKN0zv0CArTICfDmxywui6ZUdVb7cdCCJ+ec5CbpZvluEEaqxk3ccSzyWUvdSjn
	b7tT2x8Yy1/4ahRWQ==
X-Received: by 2002:a05:600c:699b:b0:49b:9205:45b3 with SMTP id 5b1f17b1804b1-49ce584c6femr36914935e9.15.1788326832336;
        Tue, 01 Sep 2026 22:27:12 -0700 (PDT)
Received: from FRSMI25-LASER.wifi-gare.sncf.com ([148.169.40.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce4780f0dsm37084695e9.12.2026.09.01.22.27.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 22:27:12 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 25/27] vim: Security Fix for CVE-2026-57456
Date: Wed,  2 Sep 2026 07:25:42 +0200
Message-ID: <146c6244fdc0647f6c24b92cc8410da02645ee96.1788326578.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788326578.git.yoann.congal@smile.fr>
References: <cover.1788326578.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 05:27:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244876

From: Siddharth Doshi <sdoshi@mvista.com>

Picking patch as per [1], and same patch is mentioned in [2]

References:
[1] https://nvd.nist.gov/vuln/detail/CVE-2026-57456
[2] https://security-tracker.debian.org/tracker/CVE-2026-57456

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../vim/files/CVE-2026-57456.patch            | 90 +++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |  1 +
 2 files changed, 91 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-57456.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-57456.patch b/meta/recipes-support/vim/files/CVE-2026-57456.patch
new file mode 100644
index 00000000000..b9f3fcc84d4
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2026-57456.patch
@@ -0,0 +1,90 @@
+From 911e10a2e8e677c3982d392e185b7d9b3e574401 Mon Sep 17 00:00:00 2001
+From: Christian Brabandt <cb@256bit.org>
+Date: Sun, 21 Jun 2026 19:50:56 +0000
+Subject: [PATCH 14/17] patch 9.2.0699: [security]: possible code execution
+ with python complete
+
+Problem:  [security]: possible code execution with python complete
+          (morningbread)
+Solution: Use repr() to quote the doc strings correctly
+
+Github Security Advisory:
+https://github.com/vim/vim/security/advisories/GHSA-ppj8-wqjf-6fp3
+
+Supported by AI
+
+Signed-off-by: Christian Brabandt <cb@256bit.org>
+
+Upstream-Status: Backport [https://github.com/vim/vim/commit/cce141c42740f122dd8486ae04e21c2a81016ba8]
+CVE: CVE-2026-57456
+Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
+---
+ runtime/autoload/python3complete.vim | 6 +++---
+ runtime/autoload/pythoncomplete.vim  | 6 +++---
+ 2 files changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/runtime/autoload/python3complete.vim b/runtime/autoload/python3complete.vim
+index 56ee636b8d..e7cd149cdd 100644
+--- a/runtime/autoload/python3complete.vim
++++ b/runtime/autoload/python3complete.vim
+@@ -326,7 +326,7 @@ class Scope(object):
+ 
+     def get_code(self):
+         str = ""
+-        if len(self.docstr) > 0: str += '"""'+self.docstr+'"""\n'
++        if len(self.docstr) > 0: str += repr(self.docstr)+'\n'
+         str += 'class _PyCmplNoType:\n    def __getattr__(self,name):\n        return None\n'
+         for sub in self.subscopes:
+             str += sub.get_code()
+@@ -369,7 +369,7 @@ class Class(Scope):
+                        if _DOTTED_NAME_RE.match(s.strip())]
+         if len(safe_supers) > 0: str += '(%s)' % ','.join(safe_supers)
+         str += ':\n'
+-        if len(self.docstr) > 0: str += self.childindent()+'"""'+self.docstr+'"""\n'
++        if len(self.docstr) > 0: str += self.childindent()+repr(self.docstr)+'\n'
+         if len(self.subscopes) > 0:
+             for s in self.subscopes: str += s.get_code()
+         else:
+@@ -392,7 +392,7 @@ class Function(Scope):
+         safe_params = [p for p in safe_params if p]
+         str = "%sdef %s(%s):\n" % \
+             (self.currentindent(),self.name,','.join(safe_params))
+-        if len(self.docstr) > 0: str += self.childindent()+'"""'+self.docstr+'"""\n'
++        if len(self.docstr) > 0: str += self.childindent()+repr(self.docstr)+'\n'
+         str += "%spass\n" % self.childindent()
+         return str
+ 
+diff --git a/runtime/autoload/pythoncomplete.vim b/runtime/autoload/pythoncomplete.vim
+index 0f41405c0e..abef32faf2 100644
+--- a/runtime/autoload/pythoncomplete.vim
++++ b/runtime/autoload/pythoncomplete.vim
+@@ -341,7 +341,7 @@ class Scope(object):
+ 
+     def get_code(self):
+         str = ""
+-        if len(self.docstr) > 0: str += '"""'+self.docstr+'"""\n'
++        if len(self.docstr) > 0: str += repr(self.docstr)+'\n'
+         str += 'class _PyCmplNoType:\n    def __getattr__(self,name):\n        return None\n'
+         for sub in self.subscopes:
+             str += sub.get_code()
+@@ -384,7 +384,7 @@ class Class(Scope):
+                        if _DOTTED_NAME_RE.match(s.strip())]
+         if len(safe_supers) > 0: str += '(%s)' % ','.join(safe_supers)
+         str += ':\n'
+-        if len(self.docstr) > 0: str += self.childindent()+'"""'+self.docstr+'"""\n'
++        if len(self.docstr) > 0: str += self.childindent()+repr(self.docstr)+'\n'
+         if len(self.subscopes) > 0:
+             for s in self.subscopes: str += s.get_code()
+         else:
+@@ -407,7 +407,7 @@ class Function(Scope):
+         safe_params = [p for p in safe_params if p]
+         str = "%sdef %s(%s):\n" % \
+             (self.currentindent(),self.name,','.join(safe_params))
+-        if len(self.docstr) > 0: str += self.childindent()+'"""'+self.docstr+'"""\n'
++        if len(self.docstr) > 0: str += self.childindent()+repr(self.docstr)+'\n'
+         str += "%spass\n" % self.childindent()
+         return str
+ 
+-- 
+2.44.4
+
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 6ef9745b574..a4f8162d31c 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -49,6 +49,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://CVE-2026-59856.patch \
            file://CVE-2026-59857.patch \
            file://CVE-2026-59858.patch \
+           file://CVE-2026-57456.patch \
            "
 
 PV .= ".1683"

