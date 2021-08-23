Received: from mail6.pr.hu (mail6.pr.hu [87.242.0.6])
 by mx.groups.io with SMTP id smtpd.web09.23060.1629721415108005576
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Aug 2021 05:23:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pr.hu header.s=pr20170203 header.b=N+d1AlLT;
 spf=pass (domain: pr.hu, ip: 87.242.0.6, mailfrom: zboszor@pr.hu)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1mI8zF-0003fT-M0; Mon, 23 Aug 2021 14:23:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=hgMvWp+c6CKj+wBQBXIJKjGc8msrMlaXwnkEGkCrdog=; b=N+d1AlLTKyTLOaqm4OEYXzuyDu
	vB3IXmjnwD5Cw/S5e+/6hNMU6TcjUwWB+fmPumyDdDfmFED2XiL/rK6+GsGa2HnA+TeFp2ZRTDYMk
	NyWjlnvhYHmwjygnSOFyKP73wKupjrgaOmfvNP+cbGPHLMPULu2XQ0gjiKKUTQV17FkxQ2shfokJR
	QinDoq9uw9lSb5PMLnqA9V6LwjU4XmjkFUek37UG1XcpGne0bYYanGxwofNT6d5v8nbshQsEKJGeF
	dHdpOHpBUepk9ZC/CfwU4mc1UR0NwSDi9n5cXzoBE8PCIQ1hqKSOXWZTynp83BhCx6Lpnyd5BzR8V
	ijnV5TQg==;
Received: from host-87-242-23-58.prtelecom.hu ([87.242.23.58] helo=localhost.lan)
	by mail.pr.hu with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <zboszor@pr.hu>)
	id 1mI8zB-0005eF-Lw; Mon, 23 Aug 2021 14:23:31 +0200
From: "Zoltan Boszormenyi" <zboszor@pr.hu>
To: openembedded-core@lists.openembedded.org
Cc: zboszor@gmail.com
Subject: [PATCH 1/6] package_rpm.bbclass: Handle posttrans scriptlets
Date: Mon, 23 Aug 2021 14:23:18 +0200
Message-Id: <20210823122323.97400-2-zboszor@pr.hu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210823122323.97400-1-zboszor@pr.hu>
References: <20210823122323.97400-1-zboszor@pr.hu>
MIME-Version: 1.0
X-Spam-Score: -0.9 (/)
X-Scan-Signature: b50e38c8e3ec61f3b76c6c7154e05ff1
X-Spam-Tracer: backend.mail.pr.hu -0.9 20210823122331Z
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Zoltán Böszörményi <zboszor@gmail.com>

The "posttrans" scriptlet is the RPM equivalent of the
OPKG "intercept script" concept and probably a cleaner one.

"pretrans" also exists in RPM but there's no equivalent
for it in OPKG.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/classes/package_rpm.bbclass | 30 +++++++++++++++++++++---------
 1 file changed, 21 insertions(+), 9 deletions(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 88d861c0e7..5992d3fd06 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -308,10 +308,11 @@ python write_specfile () {
     srcrconflicts  = ""
     srcrobsoletes  = ""
 
-    srcrpreinst  = []
-    srcrpostinst = []
-    srcrprerm    = []
-    srcrpostrm   = []
+    srcrpreinst   = []
+    srcrpostinst  = []
+    srcrprerm     = []
+    srcrpostrm    = []
+    srcrposttrans = []
 
     spec_preamble_top = []
     spec_preamble_bottom = []
@@ -373,11 +374,11 @@ python write_specfile () {
         splitrconflicts  = localdata.getVar('RCONFLICTS') or ""
         splitrobsoletes  = ""
 
-        splitrpreinst  = localdata.getVar('pkg_preinst')
-        splitrpostinst = localdata.getVar('pkg_postinst')
-        splitrprerm    = localdata.getVar('pkg_prerm')
-        splitrpostrm   = localdata.getVar('pkg_postrm')
-
+        splitrpreinst   = localdata.getVar('pkg_preinst')
+        splitrpostinst  = localdata.getVar('pkg_postinst')
+        splitrprerm     = localdata.getVar('pkg_prerm')
+        splitrpostrm    = localdata.getVar('pkg_postrm')
+        splitrposttrans = localdata.getVar('pkg_posttrans')
 
         if not perfiledeps:
             # Add in summary of per file dependencies
@@ -405,6 +406,7 @@ python write_specfile () {
             srcrpostinst   = splitrpostinst
             srcrprerm      = splitrprerm
             srcrpostrm     = splitrpostrm
+            srcrposttrans  = splitrposttrans
 
             file_list = []
             walk_files(root, file_list, conffiles, dirfiles)
@@ -496,6 +498,11 @@ python write_specfile () {
             scriptvar = wrap_uninstall(splitrpostrm)
             spec_scriptlets_bottom.append(scriptvar)
             spec_scriptlets_bottom.append('')
+        if splitrposttrans:
+            spec_scriptlets_bottom.append('%%posttrans -n %s' % splitname)
+            spec_scriptlets_bottom.append('# %s - posttrans' % splitname)
+            spec_scriptlets_bottom.append(splitrposttrans)
+            spec_scriptlets_bottom.append('')
 
         # Now process files
         file_list = []
@@ -590,6 +597,11 @@ python write_specfile () {
         scriptvar = wrap_uninstall(srcrpostrm)
         spec_scriptlets_top.append(scriptvar)
         spec_scriptlets_top.append('')
+    if srcrposttrans:
+        spec_scriptlets_top.append('%posttrans')
+        spec_scriptlets_top.append('# %s - posttrans' % srcname)
+        spec_scriptlets_top.append(srcrposttrans)
+        spec_scriptlets_top.append('')
 
     # Write the SPEC file
     specfile = open(outspecfile, 'w')
-- 
2.31.1

