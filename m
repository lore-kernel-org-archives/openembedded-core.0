Return-Path: <sona.sarmadi@enea.com>
Received: from smtp-out10.electric.net (smtp-out10.electric.net
	[185.38.180.43])
	by mail.openembedded.org (Postfix) with ESMTP id EE0DC607A2
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Dec 2016 10:40:51 +0000 (UTC)
Received: from 1cDqhX-0007hh-UR by out10d.electric.net with emc1-ok (Exim 4.87)
	(envelope-from <sona.sarmadi@enea.com>) id 1cDqhX-0007jH-W6
	for openembedded-core@lists.openembedded.org;
	Mon, 05 Dec 2016 02:40:51 -0800
Received: by emcmailer; Mon, 05 Dec 2016 02:40:51 -0800
Received: from [192.36.1.72] (helo=mx-3.enea.com)
	by out10d.electric.net with esmtps (TLSv1:AES128-SHA:128) (Exim 4.87)
	(envelope-from <sona.sarmadi@enea.com>) id 1cDqhX-0007hh-UR
	for openembedded-core@lists.openembedded.org;
	Mon, 05 Dec 2016 02:40:51 -0800
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.294.0; Mon, 5 Dec 2016
	11:40:51 +0100
From: Sona Sarmadi <sona.sarmadi@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 5 Dec 2016 11:40:49 +0100
Message-ID: <1480934449-50405-1-git-send-email-sona.sarmadi@enea.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: sona.sarmadi@enea.com does not
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
Subject: [PATCH][krogoth] bash: fix CVE-2016-7543
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
X-List-Received-Date: Mon, 05 Dec 2016 10:40:52 -0000
Content-Type: text/plain

Specially crafted SHELLOPTS+PS4 variables allows command substitution

References:
https://bugzilla.redhat.com/show_bug.cgi?id=CVE-2016-7543
http://lists.gnu.org/archive/html/bug-bash/2016-10/msg00009.html

Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
---
 .../recipes-extended/bash/bash/CVE-2016-7543.patch | 38 ++++++++++++++++++++++
 meta/recipes-extended/bash/bash_4.3.30.bb          |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-extended/bash/bash/CVE-2016-7543.patch

diff --git a/meta/recipes-extended/bash/bash/CVE-2016-7543.patch b/meta/recipes-extended/bash/bash/CVE-2016-7543.patch
new file mode 100644
index 0000000..7c9a9c6
--- /dev/null
+++ b/meta/recipes-extended/bash/bash/CVE-2016-7543.patch
@@ -0,0 +1,38 @@
+bash: fix CVE-2016-7543
+
+Bug-Reference-URL:
+http://lists.gnu.org/archive/html/bug-bash/2015-12/msg00054.html
+
+Bug-Description:
+
+If a malicious user can inject a value of $SHELLOPTS containing `xtrace'
+and a value for $PS4 that includes a command substitution into a shell
+running as root, bash will expand the command substitution as part of
+expanding $PS4 when it executes a traced command.
+
+Patch (apply with `patch -p0'):
+
+CVE: CVE-2016-7543
+Upstream-Status: Backport
+[changes in patchlevel.h has been removed from original patch]
+
+Reference to upstream patch:
+http://lists.gnu.org/archive/html/bug-bash/2016-10/msg00009.html
+
+Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
+diff -Nurp a/variables.c b/variables.c
+--- a/variables.c	2016-12-05 09:49:39.552587211 +0100
++++ b/variables.c	2016-12-05 09:52:00.406522230 +0100
+@@ -495,7 +495,11 @@ initialize_shell_variables (env, privmod
+ #endif
+       set_if_not ("PS2", secondary_prompt);
+     }
+-  set_if_not ("PS4", "+ ");
++
++  if (current_user.euid == 0)
++    bind_variable ("PS4", "+ ", 0);
++  else
++    set_if_not ("PS4", "+ ");
+ 
+   /* Don't allow IFS to be imported from the environment. */
+   temp_var = bind_variable ("IFS", " \t\n", 0);
diff --git a/meta/recipes-extended/bash/bash_4.3.30.bb b/meta/recipes-extended/bash/bash_4.3.30.bb
index fcd6caf..fdad39b 100644
--- a/meta/recipes-extended/bash/bash_4.3.30.bb
+++ b/meta/recipes-extended/bash/bash_4.3.30.bb
@@ -22,6 +22,7 @@ SRC_URI = "${GNU_MIRROR}/bash/${BP}.tar.gz;name=tarball \
            file://run-ptest \
 	   file://fix-run-builtins.patch \
            file://CVE-2016-0634.patch;striplevel=0 \
+           file://CVE-2016-7543.patch \
            "
 
 SRC_URI[tarball.md5sum] = "a27b3ee9be83bd3ba448c0ff52b28447"
-- 
1.9.1


