Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5686C88E40
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 19:00:49 +0000 (UTC)
Received: from alln-iport-8.cisco.com (alln-iport-8.cisco.com [173.37.142.95])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20558.1788980446678247643
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2026 12:00:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=etFll1aG;
 spf=pass (domain: cisco.com, ip: 173.37.142.95, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=5844; q=dns/txt;
  s=iport01; t=1788980446; x=1790190046;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=XK1p/3yPKQCppyfgN8Kf64YWy1EqMResxbLLJsN/F3M=;
  b=etFll1aGbIdCdXiGdCgzLykccwyRqRRjXGFAMfnL6MJL+q7WCKxZazO0
   LEOB8G2fHR+qOLA2OH5OtehKCY9+MTjni0qPek2iQ6jvzeWGx6VnIiEee
   CXgiN/5Tdkq61VyyonfkgrVAMKtXTGab+qoziI4MWFz7iQX8G9Fqdl5F9
   L7A/55FNSp8noKgFcl/GKeGG/lH4v224TeCOt1ZGMT7zmO0d2rWjeCx5o
   PPKROyKk6kH+rOhFFcjDH53qvcuSLtvqeoOpxM52r7R+cBfXGpG1Q9D3x
   +tqo1MPeFiKPpLqtPKFgI9sTO3RPPPznBPmnnYgqjvteKJOKFFCYfYDF7
   A==;
X-CSE-ConnectionGUID: TfL0OKRyTS2IZdWowwa2oQ==
X-CSE-MsgGUID: qGv44GSOQf21vmy1StLtXw==
X-IPAS-Result: =?us-ascii?q?A0BFAgDZq6Fq/44QJK1aHgEBCxIMggULgld0YENJA5ZHi?=
 =?us-ascii?q?2eSN4F+DwEBAQ9EDQQBAYUFjgcCJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBA?=
 =?us-ascii?q?QUBAQECAQcFgQ4Thk8NkBIBAgE1ATQSLAMBAk8LIyEbgmcBgjoDNwMRwTyCL?=
 =?us-ascii?q?IEBhH3YSw2CWQELFAEFgTOFP4J/hSNdGYR8JxsbgXKBFYNpgQUBgRlCAoglB?=
 =?us-ascii?q?IIigQyBWh6SNkiBHgNZLAFVEw0KCwcFgWYDNRIqFW4yHYEjPheBBxsGBYEdg?=
 =?us-ascii?q?SeDPyMZNnqBCV6BKylgARIXgQeCCAKCVIIBAgFJQw4HRVMJJ0EKElMpBAsYD?=
 =?us-ascii?q?UgRLDcVGQQ+bgePIh+CWBZlEwEHJIEYLUYhEaVloB5xCiiDdowijz6FfBozh?=
 =?us-ascii?q?VulEpkIizeCU4QJkkeEaYFoPIFZcBWDIglKGQ+OOYNrzDknMgsDLwEBBwIHD?=
 =?us-ascii?q?gMLgWiRfgEB?=
IronPort-Data: A9a23:jsk1P6DFgDN0YRVW/3/iw5YqxClBgxIJ4kV8jS/XYbTApD8g0zwBz
 WoaXmCCP6rcNzGmf4h0aI2x9k1X65DdndUxOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGcYZsCCCM/n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jXmthh
 fuo+5eBYA79imYvWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TE//tKVGYVB5wkwbxWM21x8
 uMHIWoKV0XW7w626OrTpuhEj8AnKozveYgYoHwllWyfBvc9SpeFSKLPjTNa9G5v3YYVQ7CHO
 YxANWAHgBfoO3WjPn8bBYw3mvyonlH0ciZTrxSeoq9fD237nFcujOO0aIOJEjCMbdx6gBrEi
 VnhxmqjWw8fJYWk1R6Zwm3504cjmgu+Aur+DoaQ8eZnhlCWzGEfBBAaEFC8u/SRjk+lR8kZL
 FQZ/Ccrp6U++EGnCN7nUHWFTGWstxoYXZ9UVuY98gzIkveS6AeCDW9CRTlEADA7iPILqfUR/
 gfht7vU6fZH69V5lVr1Gm+okA6P
IronPort-HdrOrdr: A9a23:cr67iaAzJN7O3KHlHemA55DYdb4zR+YMi2TDGXofdfUzSL38qy
 nAppUmPHPP5Qr5O0tQ++xoRpPhfZq0z/cciuMs1NyZMjUO1lHFEGhK1/qH/9SZIVycysdtkY
 F9bqN5FNr8SXJ+jcr8/U2ENuxI+qjhzEht7t2utkuEimpRGsdd0zs=
X-Talos-CUID: =?us-ascii?q?9a23=3An45kAmrvMFJ9iY80K01ieYrmUfwrViX6703BH3T?=
 =?us-ascii?q?iKFRld7qKVlbK/5oxxg=3D=3D?=
X-Talos-MUID: 9a23:yW4RmAbv8kB9p+BTrhDy2G1ND+BR7f73FkUcyK4an9W0Knkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,270,1779148800"; 
   d="scan'208";a="837431014"
Received: from alln-l-core-05.cisco.com ([173.36.16.142])
  by alln-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 09 Sep 2026 19:00:45 +0000
Received: from sjc-ads-5197.cisco.com (sjc-ads-5197.cisco.com [10.28.35.211])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-05.cisco.com (Postfix) with ESMTPS id 84E8F18000146;
	Wed,  9 Sep 2026 19:00:45 +0000 (GMT)
Received: by sjc-ads-5197.cisco.com (Postfix, from userid 1887503)
	id 290E0CC12A6; Wed,  9 Sep 2026 12:00:45 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][wrynose][PATCH] vim: Fix CVE-2026-52858 regression
Date: Wed,  9 Sep 2026 12:00:45 -0700
Message-Id: <20260909190045.4928-1-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-5197.cisco.com [10.28.35.211];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.35.211, sjc-ads-5197.cisco.com
X-Outbound-Node: alln-l-core-05.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 19:00:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245489

From: Devansh Patel <devanshp@cisco.com>

This patch fixes a regression introduced by the CVE-2026-52858 fix
already carried by OE-Core in commit [1]. The original security fix
added the g:pythoncomplete_allow_import opt-in, but the documented
behavior was broken because vim was not imported in the completion
class scope. This patch applies upstream Vim patch 9.2.0568 to restore
that behavior.

[1] https://github.com/openembedded/openembedded-core/commit/24ef5a9dfffe7b3d96fb62c0d3248348696c9115
[2] https://github.com/vim/vim/commit/4b850457e12e1a678dd209f2868154f7553cbf8d
[3] https://github.com/vim/vim/commit/868ad62cb8bf8038322eab2badd31bd98b02b9df
[4] https://github.com/vim/vim/security/advisories/GHSA-52mc-rq6p-rc7c

Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 .../vim/files/CVE-2026-52858-regression.patch | 93 +++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |  1 +
 2 files changed, 94 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-52858-regression.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-52858-regression.patch b/meta/recipes-support/vim/files/CVE-2026-52858-regression.patch
new file mode 100644
index 0000000000..50392fb76f
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2026-52858-regression.patch
@@ -0,0 +1,93 @@
+From 8075209bb1e721ca89c2e7fd5d216d7fe2bd3ea6 Mon Sep 17 00:00:00 2001
+From: thinca <thinca@gmail.com>
+Date: Sun, 31 May 2026 12:33:07 +0000
+Subject: [PATCH] patch 9.2.0568: pythoncomplete: g:pythoncomplete_allow_import
+ had no effect
+
+Problem:  The security patch 9.2.0561 added a vim.eval() call inside
+          Completer.evalsource() to honor g:pythoncomplete_allow_import.
+          But the 'vim' module is only imported inside the outer
+          vimcomplete() / vimpy3complete() function, not at the script's
+          top level, so referring to it from a Completer method raises
+          NameError.  The surrounding bare 'except' silently swallows
+          the error and leaves allow_imports at 0, meaning the opt-in
+          never takes effect -- 'import os' (and any other
+          buffer-level import) is always skipped, no candidates are
+          produced for 'os.<...>' and
+          Test_popup_and_preview_autocommand() fails on the Windows
+          CI matrix (Linux skips the test because Python 2 is absent).
+Solution: Re-import 'vim' at the top of evalsource() in both
+          pythoncomplete.vim and python3complete.vim so the eval reads
+          the global, and set g:pythoncomplete_allow_import = 1 in the
+          test (it is the opt-in intended for callers that trust the
+          buffer contents) (thinca).
+
+closes: #20386
+
+CVE: CVE-2026-52858
+Upstream-Status: Backport [https://github.com/vim/vim/commit/868ad62cb8bf8038322eab2badd31bd98b02b9df]
+
+Backport Changes:
+- Omitted src/version.c because the Wrynose recipe remains at Vim 9.2.0340;
+  the upstream version-table hunk is not needed for this backport.
+
+Signed-off-by: thinca <thinca@gmail.com>
+Signed-off-by: Christian Brabandt <cb@256bit.org>
+(cherry picked from commit 868ad62cb8bf8038322eab2badd31bd98b02b9df)
+Signed-off-by: Devansh Patel <devanshp@cisco.com>
+---
+ runtime/autoload/python3complete.vim | 3 +++
+ runtime/autoload/pythoncomplete.vim  | 3 +++
+ src/testdir/test_popup.vim           | 4 ++++
+ 3 files changed, 10 insertions(+)
+
+diff --git a/runtime/autoload/python3complete.vim b/runtime/autoload/python3complete.vim
+index a0314242b..bdabf62c8 100644
+--- a/runtime/autoload/python3complete.vim
++++ b/runtime/autoload/python3complete.vim
+@@ -158,6 +158,9 @@ class Completer(object):
+        self.parser = PyParser()
+ 
+     def evalsource(self,text,line=0):
++        # vim is imported locally in vimpy3complete(); re-import here so the
++        # vim.eval() below works (otherwise NameError, silently caught).
++        import vim
+         sc = self.parser.parse(text,line)
+         try: allow_imports = int(
+           vim.eval("get(g:, 'pythoncomplete_allow_import', 0)"))
+diff --git a/runtime/autoload/pythoncomplete.vim b/runtime/autoload/pythoncomplete.vim
+index 39b1efd29..761488244 100644
+--- a/runtime/autoload/pythoncomplete.vim
++++ b/runtime/autoload/pythoncomplete.vim
+@@ -172,6 +172,9 @@ class Completer(object):
+        self.parser = PyParser()
+ 
+     def evalsource(self,text,line=0):
++        # vim is imported locally in vimcomplete(); re-import here so the
++        # vim.eval() below works (otherwise NameError, silently caught).
++        import vim
+         sc = self.parser.parse(text,line)
+         try: allow_imports = int(
+           vim.eval("get(g:, 'pythoncomplete_allow_import', 0)"))
+diff --git a/src/testdir/test_popup.vim b/src/testdir/test_popup.vim
+index fac2a7592..55c2f232d 100644
+--- a/src/testdir/test_popup.vim
++++ b/src/testdir/test_popup.vim
+@@ -723,6 +723,9 @@ func Test_popup_and_preview_autocommand()
+     au!
+     au BufAdd * nested tab sball
+   augroup END
++  " Let pythoncomplete follow the buffer's 'import os' (off by default
++  " since v9.2.0561) so 'os.' can be completed.
++  let g:pythoncomplete_allow_import = 1
+   set omnifunc=pythoncomplete#Complete
+   call setline(1, 'import os')
+   " make the line long
+@@ -745,6 +748,7 @@ func Test_popup_and_preview_autocommand()
+   augroup END
+   augroup! MyBufAdd
+   bw!
++  unlet g:pythoncomplete_allow_import
+ endfunc
+ 
+ func s:run_popup_and_previewwindow_dump(lines, dumpfile)
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 1da47d9243..1b52e11b31 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -21,6 +21,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https;tag=v${PV}
            file://CVE-2026-45130.patch \
            file://CVE-2026-46483.patch \
            file://CVE-2026-52858.patch \
+           file://CVE-2026-52858-regression.patch \
            file://CVE-2026-52859.patch \
            file://CVE-2026-52860.patch \
            file://CVE-2026-42307.patch \
-- 
2.35.6


