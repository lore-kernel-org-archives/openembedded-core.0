Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4001C531F7
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 16:27:50 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.893.1784824069693369479
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2026 09:27:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=S/E2jCMM;
 spf=pass (domain: mvista.com, ip: 209.85.215.175, mailfrom: sdoshi@mvista.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-ca88130e09aso649317a12.3
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 09:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1784824069; x=1785428869; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IzIOR5uFLELfVKgKJNgVceVxIQ9/cQRPeksn3ERya0E=;
        b=S/E2jCMMs63y2xGzyPht+6DM1OCRUhea0megBmcLf76DnCWAyEyXgDseobky7UFTo5
         igU0PdpJUDEtDPD0u6XBODE0HkegWOB14m9swOgmUIsJLvU2YvbK7x50sbK7BCUV/5EG
         /AkANqVWHPNbHfQs6vI8nPKf1sE//CD01JAOI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784824069; x=1785428869;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IzIOR5uFLELfVKgKJNgVceVxIQ9/cQRPeksn3ERya0E=;
        b=dRQ7GpyE0mYo25Z+vdX9b36mKogorFzm3TAQ0FIi6Nr7JVhZYZc8EAUnv4SMguusTb
         OZaeXbev7U9Rf0aG0OxVc589rB4RsoUXocqC7e3bxItKoimbzRn67hgzS4zPZr10NoLC
         EmClxNUTRNBzNCn/ZYV1Sumn7Gj9WSAiQ6fwWHqeelvGrjNRgznR6AO7gObO8GHh24P2
         JffefzQ+rBxPF8GsMVfeDw/gpSDxB/p4yGp0TaZXS4RRqqrmnJ5vdqjzMQ/m2egaDoGC
         OcbeiIrSpa5n3SrAmen7/znjL3kdS0ql3+2YMM55SE+gElGpq1KOOqOrjl2yGm7/bFNi
         NyEA==
X-Gm-Message-State: AOJu0YwukMq06koj2W/kzwzkZczD1lnGEmcoenKYDlGVNJfhLL5bxPuB
	xHhJH2R03W9RjxpXAGGWKXl/rF//KZ/e+Qjd1aF0+5gWvvDwj1SjWMMaSViH63iaWqlECGT7b0z
	Ez4Edauo=
X-Gm-Gg: AR+sD10GApv2szShOaMu1Z6Ux8wXw5tq8DToFpzu3saX3A7EX/OyJpjFU+K5VR7Z5B/
	cavY6lWdYL2QPLS0RMehcxz7H9ZnUvF0/eFvMToafBNPGqdLACzUZ8ZEN2/JPAMdhiquatInz/0
	VpyY3sXka5EAqTY6BlMLR34PLc/4VRzt8hZmZpzWQrqwJNDMcxu0lPjLZKYoq+YwlQIcBm7VhTT
	v8QeC1Fa33yI/yCs+qtqGm527gYzJK/4uCaEW1YSEt54N8s/sDTTa4OpeKIOQv2gY5WRtSfrSob
	qZJpPJX2X1c6H7GWBv1bkgvdYeFZ2MCVsDMba9ibZyfznkQbrUTvprRX7Uu0pmm5JMycnEksbNS
	CJo33X8Xhe3USml6q/CDQmtLIsYXhk/h1Yger3g7iDQBKmPHmVecvXXJ7Wo+sIB4zc8m+KQt8P4
	6StJhF9AD6LkYT
X-Received: by 2002:a05:6300:95:b0:3c3:a1ed:3c23 with SMTP id adf61e73a8af0-3c44b00675emr4604287637.23.1784824069005;
        Thu, 23 Jul 2026 09:27:49 -0700 (PDT)
Received: from MVIN00030.mvista.com ([157.32.44.119])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147dc9d932sm20799484eec.12.2026.07.23.09.27.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 09:27:48 -0700 (PDT)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Siddharth Doshi <sdoshi@mvista.com>
Subject: [OE-core][scarthgap][PATCH] vim: Security Fix for CVE-2026-57456
Date: Thu, 23 Jul 2026 21:55:35 +0530
Message-Id: <20260723162535.69358-1-sdoshi@mvista.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 16:27:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241863

From: Siddharth Doshi <sdoshi@mvista.com>

Picking patch as per [1], and same patch is mentioned in [2]

References:
[1] https://nvd.nist.gov/vuln/detail/CVE-2026-57456
[2] https://security-tracker.debian.org/tracker/CVE-2026-57456

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
---
 .../vim/files/CVE-2026-57456.patch            | 90 +++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |  1 +
 2 files changed, 91 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-57456.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-57456.patch b/meta/recipes-support/vim/files/CVE-2026-57456.patch
new file mode 100644
index 0000000000..b9f3fcc84d
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
index 6ef9745b57..a4f8162d31 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -49,6 +49,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://CVE-2026-59856.patch \
            file://CVE-2026-59857.patch \
            file://CVE-2026-59858.patch \
+           file://CVE-2026-57456.patch \
            "
 
 PV .= ".1683"
-- 
2.34.1


