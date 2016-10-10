Return-Path: <sona.sarmadi@enea.com>
Received: from smtp-out10.electric.net (smtp-out10.electric.net
	[185.38.180.33])
	by mail.openembedded.org (Postfix) with ESMTP id ECA71719A2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Oct 2016 17:02:56 +0000 (UTC)
Received: from 1btdya-0001pL-Ts by out10d.electric.net with emc1-ok (Exim 4.87)
	(envelope-from <sona.sarmadi@enea.com>) id 1btdya-0001px-Ui
	for openembedded-core@lists.openembedded.org;
	Mon, 10 Oct 2016 10:02:56 -0700
Received: by emcmailer; Mon, 10 Oct 2016 10:02:56 -0700
Received: from [192.36.1.72] (helo=mx-3.enea.com)
	by out10d.electric.net with esmtps (TLSv1:AES128-SHA:128) (Exim 4.87)
	(envelope-from <sona.sarmadi@enea.com>) id 1btdya-0001pL-Ts
	for openembedded-core@lists.openembedded.org;
	Mon, 10 Oct 2016 10:02:56 -0700
Received: from sestofb11.enea.se (172.21.3.152) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 10 Oct 2016 19:02:56 +0200
From: Sona Sarmadi <sona.sarmadi@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 10 Oct 2016 13:54:35 +0200
Message-ID: <1476100475-54954-1-git-send-email-sona.sarmadi@enea.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: sona.sarmadi@enea.com does not
	designate permitted sender hosts)
X-Outbound-IP: 192.36.1.72
X-Env-From: sona.sarmadi@enea.com
X-Proto: esmtps
X-Revdns: mx-3.enea.com
X-HELO: mx-3.enea.com
X-TLS: TLSv1:AES128-SHA:128
X-Authenticated_ID: 
X-PolicySMART: 6551647
X-Virus-Status: Scanned by VirusSMART (c)
X-Virus-Status: Scanned by VirusSMART (s)
Subject: [PATCH][krogoth] bash: Security fix CVE-2016-0634
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
X-List-Received-Date: Mon, 10 Oct 2016 17:03:02 -0000
Content-Type: text/plain

References to upstream patch:
https://ftp.gnu.org/pub/gnu/bash/bash-4.3-patches/bash43-047
http://openwall.com/lists/oss-security/2016/09/16/8

Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
---
 .../recipes-extended/bash/bash/CVE-2016-0634.patch | 136 +++++++++++++++++++++
 meta/recipes-extended/bash/bash_4.3.30.bb          |   1 +
 2 files changed, 137 insertions(+)
 create mode 100644 meta/recipes-extended/bash/bash/CVE-2016-0634.patch

diff --git a/meta/recipes-extended/bash/bash/CVE-2016-0634.patch b/meta/recipes-extended/bash/bash/CVE-2016-0634.patch
new file mode 100644
index 0000000..71c033e
--- /dev/null
+++ b/meta/recipes-extended/bash/bash/CVE-2016-0634.patch
@@ -0,0 +1,136 @@
+Bash-Release:	4.3
+Patch-ID:	bash43-047
+
+Bug-Reported-by:	Bernd Dietzel
+Bug-Reference-ID:
+Bug-Reference-URL:	https://bugs.launchpad.net/ubuntu/+source/bash/+bug/1507025
+
+Bug-Description:
+
+Bash performs word expansions on the prompt strings after the special
+escape sequences are expanded.  If a malicious user can modify the system
+hostname or change the name of the bash executable and coerce a user into
+executing it, and the new name contains word expansions (including
+command substitution), bash will expand them in prompt strings containing
+the \h or \H and \s escape sequences, respectively.
+
+Patch (apply with `patch -p0')
+
+CVE:  CVE-2016-0634
+Upstream-Status: Backport
+Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
+
+*** ../bash-4.3-patched/parse.y	2015-08-13 15:11:54.000000000 -0400
+--- parse.y	2016-03-07 15:44:14.000000000 -0500
+***************
+*** 5259,5263 ****
+    int result_size, result_index;
+    int c, n, i;
+!   char *temp, octal_string[4];
+    struct tm *tm;  
+    time_t the_time;
+--- 5259,5263 ----
+    int result_size, result_index;
+    int c, n, i;
+!   char *temp, *t_host, octal_string[4];
+    struct tm *tm;  
+    time_t the_time;
+***************
+*** 5407,5411 ****
+  	    case 's':
+  	      temp = base_pathname (shell_name);
+! 	      temp = savestring (temp);
+  	      goto add_string;
+  
+--- 5407,5415 ----
+  	    case 's':
+  	      temp = base_pathname (shell_name);
+! 	      /* Try to quote anything the user can set in the file system */
+! 	      if (promptvars || posixly_correct)
+! 		temp = sh_backslash_quote_for_double_quotes (temp);
+! 	      else
+! 		temp = savestring (temp);
+  	      goto add_string;
+  
+***************
+*** 5497,5503 ****
+  	    case 'h':
+  	    case 'H':
+! 	      temp = savestring (current_host_name);
+! 	      if (c == 'h' && (t = (char *)strchr (temp, '.')))
+  		*t = '\0';
+  	      goto add_string;
+  
+--- 5501,5515 ----
+  	    case 'h':
+  	    case 'H':
+! 	      t_host = savestring (current_host_name);
+! 	      if (c == 'h' && (t = (char *)strchr (t_host, '.')))
+  		*t = '\0';
++ 	      if (promptvars || posixly_correct)
++ 		/* Make sure that expand_prompt_string is called with a
++ 		   second argument of Q_DOUBLE_QUOTES if we use this
++ 		   function here. */
++ 		temp = sh_backslash_quote_for_double_quotes (t_host);
++ 	      else
++ 		temp = savestring (t_host);
++ 	      free (t_host);
+  	      goto add_string;
+  
+*** ../bash-4.3-patched/y.tab.c	2015-08-13 15:11:54.000000000 -0400
+--- y.tab.c	2016-03-07 15:44:14.000000000 -0500
+***************
+*** 7571,7575 ****
+    int result_size, result_index;
+    int c, n, i;
+!   char *temp, octal_string[4];
+    struct tm *tm;  
+    time_t the_time;
+--- 7571,7575 ----
+    int result_size, result_index;
+    int c, n, i;
+!   char *temp, *t_host, octal_string[4];
+    struct tm *tm;  
+    time_t the_time;
+***************
+*** 7719,7723 ****
+  	    case 's':
+  	      temp = base_pathname (shell_name);
+! 	      temp = savestring (temp);
+  	      goto add_string;
+  
+--- 7719,7727 ----
+  	    case 's':
+  	      temp = base_pathname (shell_name);
+! 	      /* Try to quote anything the user can set in the file system */
+! 	      if (promptvars || posixly_correct)
+! 		temp = sh_backslash_quote_for_double_quotes (temp);
+! 	      else
+! 		temp = savestring (temp);
+  	      goto add_string;
+  
+***************
+*** 7809,7815 ****
+  	    case 'h':
+  	    case 'H':
+! 	      temp = savestring (current_host_name);
+! 	      if (c == 'h' && (t = (char *)strchr (temp, '.')))
+  		*t = '\0';
+  	      goto add_string;
+  
+--- 7813,7827 ----
+  	    case 'h':
+  	    case 'H':
+! 	      t_host = savestring (current_host_name);
+! 	      if (c == 'h' && (t = (char *)strchr (t_host, '.')))
+  		*t = '\0';
++ 	      if (promptvars || posixly_correct)
++ 		/* Make sure that expand_prompt_string is called with a
++ 		   second argument of Q_DOUBLE_QUOTES if we use this
++ 		   function here. */
++ 		temp = sh_backslash_quote_for_double_quotes (t_host);
++ 	      else
++ 		temp = savestring (t_host);
++ 	      free (t_host);
+  	      goto add_string;
+
diff --git a/meta/recipes-extended/bash/bash_4.3.30.bb b/meta/recipes-extended/bash/bash_4.3.30.bb
index 95ed392..fcd6caf 100644
--- a/meta/recipes-extended/bash/bash_4.3.30.bb
+++ b/meta/recipes-extended/bash/bash_4.3.30.bb
@@ -21,6 +21,7 @@ SRC_URI = "${GNU_MIRROR}/bash/${BP}.tar.gz;name=tarball \
            file://fix-run-coproc-run-heredoc-run-execscript-run-test-f.patch \
            file://run-ptest \
 	   file://fix-run-builtins.patch \
+           file://CVE-2016-0634.patch;striplevel=0 \
            "
 
 SRC_URI[tarball.md5sum] = "a27b3ee9be83bd3ba448c0ff52b28447"
-- 
1.9.1


