Return-Path: <sona.sarmadi@enea.com>
Received: from smtp-out10.electric.net (smtp-out10.electric.net
	[185.38.180.37])
	by mail.openembedded.org (Postfix) with ESMTP id C6AD77315A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2017 08:51:16 +0000 (UTC)
Received: from 1chBau-0003sP-UM by out10c.electric.net with emc1-ok (Exim 4.87)
	(envelope-from <sona.sarmadi@enea.com>) id 1chBau-0003tP-Us
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Feb 2017 00:51:16 -0800
Received: by emcmailer; Fri, 24 Feb 2017 00:51:16 -0800
Received: from [192.36.1.72] (helo=mx-3.enea.com)
	by out10c.electric.net with esmtps (TLSv1:ECDHE-RSA-AES256-SHA:256)
	(Exim 4.87) (envelope-from <sona.sarmadi@enea.com>)
	id 1chBau-0003sP-UM for openembedded-core@lists.openembedded.org;
	Fri, 24 Feb 2017 00:51:16 -0800
Received: from sestofb11.enea.se (172.21.3.152) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.319.2;
	Fri, 24 Feb 2017 09:51:16 +0100
From: Sona Sarmadi <sona.sarmadi@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 24 Feb 2017 09:51:11 +0100
Message-ID: <1487926271-29866-1-git-send-email-sona.sarmadi@enea.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: sona.sarmadi@enea.com does not
	designate permitted sender hosts)
X-Outbound-IP: 192.36.1.72
X-Env-From: sona.sarmadi@enea.com
X-Proto: esmtps
X-Revdns: mx-3.enea.com
X-HELO: mx-3.enea.com
X-TLS: TLSv1:ECDHE-RSA-AES256-SHA:256
X-Authenticated_ID: 
X-PolicySMART: 6551647
X-Virus-Status: Scanned by VirusSMART (c)
X-Virus-Status: Scanned by VirusSMART (s)
Subject: [PATCH] tar: CVE-2016-6321
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 24 Feb 2017 08:51:25 -0000
Content-Type: text/plain

Skip members whose names contain "..".

Reference:
https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2016-6321

Upstream patch:
http://git.savannah.gnu.org/cgit/tar.git/commit/?id=7340f67b9860ea0531c1450e5aa261c50f671

Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
---
 meta/recipes-extended/tar/tar/CVE-2016-6321.patch | 58 +++++++++++++++++++++++
 meta/recipes-extended/tar/tar_1.29.bb             |  1 +
 2 files changed, 59 insertions(+)
 create mode 100644 meta/recipes-extended/tar/tar/CVE-2016-6321.patch

diff --git a/meta/recipes-extended/tar/tar/CVE-2016-6321.patch b/meta/recipes-extended/tar/tar/CVE-2016-6321.patch
new file mode 100644
index 0000000..4705d2d
--- /dev/null
+++ b/meta/recipes-extended/tar/tar/CVE-2016-6321.patch
@@ -0,0 +1,58 @@
+From 7340f67b9860ea0531c1450e5aa261c50f67165d Mon Sep 17 00:00:00 2001
+From: Paul Eggert <eggert@Penguin.CS.UCLA.EDU>
+Date: Sat, 29 Oct 2016 21:04:40 -0700
+Subject: When extracting, skip ".." members
+
+    * NEWS: Document this.
+    * src/extract.c (extract_archive): Skip members whose names
+    contain "..".
+
+CVE: CVE-2016-6321
+Upstream-Status: Backport
+
+Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
+
+diff -Nurp a/NEWS b/NEWS
+--- a/NEWS	2016-05-16 10:51:12.000000000 +0200
++++ b/NEWS	2017-02-24 07:51:53.279524073 +0100
+@@ -1,9 +1,15 @@
+-GNU tar NEWS - User visible changes. 2016-05-16
++GNU tar NEWS - User visible changes. 2016-10-29
+ Please send GNU tar bug reports to <bug-tar@gnu.org>
+ 
+ 
+ version 1.29 - Sergey Poznyakoff, 2016-05-16
+ 
++CVE-2016-6321
++* Member names containing '..' components are now skipped when extracting.
++This fixes tar's behavior to match its documentation, and is a bit
++safer when extracting untrusted archives over old files (an unsafe
++practice that the tar manual has long recommended against).
++
+ * New options: --verbatim-files-from, --no-verbatim-files-from
+ 
+ The --verbatim-files-from option instructs tar to treat each line read
+diff -Nurp a/src/extract.c b/src/extract.c
+--- a/src/extract.c	2016-01-20 10:26:32.000000000 +0100
++++ b/src/extract.c	2017-02-24 07:41:27.990942240 +0100
+@@ -1629,12 +1629,20 @@ extract_archive (void)
+ {
+   char typeflag;
+   tar_extractor_t fun;
++  bool skip_dotdot_name;
+ 
+   fatal_exit_hook = extract_finish;
+ 
+   set_next_block_after (current_header);
+ 
++  skip_dotdot_name = (!absolute_names_option
++		      && contains_dot_dot (current_stat_info.orig_file_name));
++  if (skip_dotdot_name)
++    ERROR ((0, 0, _("%s: Member name contains '..'"),
++	    quotearg_colon (current_stat_info.orig_file_name)));
++
+   if (!current_stat_info.file_name[0]
++      || skip_dotdot_name
+       || (interactive_option
+ 	  && !confirm ("extract", current_stat_info.file_name)))
+     {
diff --git a/meta/recipes-extended/tar/tar_1.29.bb b/meta/recipes-extended/tar/tar_1.29.bb
index efce57d..f22d9c9 100644
--- a/meta/recipes-extended/tar/tar_1.29.bb
+++ b/meta/recipes-extended/tar/tar_1.29.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 SRC_URI += "file://remove-gets.patch \
             file://musl_dirent.patch \
+            file://CVE-2016-6321.patch \
            "
 SRC_URI[md5sum] = "955cd533955acb1804b83fd70218da51"
 SRC_URI[sha256sum] = "236b11190c0a3a6885bdb8d61424f2b36a5872869aa3f7f695dea4b4843ae2f2"
-- 
1.9.1


