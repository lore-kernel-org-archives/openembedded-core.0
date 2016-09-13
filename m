Return-Path: <Mingli.Yu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5D9E277121
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Sep 2016 05:48:37 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u8D5mbWU001540
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Sep 2016 22:48:37 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Mon, 12 Sep 2016 22:48:36 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 13 Sep 2016 13:45:46 +0800
Message-ID: <1473745546-31884-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH] shadow: use relaxed usernames
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
X-List-Received-Date: Tue, 13 Sep 2016 05:48:38 -0000
Content-Type: text/plain

From: Shan Hai <shan.hai@windriver.com>

The groupadd from shadow does not allow upper case group names, the
same is true for the upstream shadow. But distributions like
Debian/Ubuntu/CentOS has their own way to cope with this problem,
this patch is picked up from CentOS release 7.0 to relax the usernames
restrictions to allow the upper case group names, and the relaxation is
POSIX compliant because POSIX indicate that usernames are composed of
characters from the portable filename character set [A-Za-z0-9._-].

Signed-off-by: Shan Hai <shan.hai@windriver.com>
Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 .../shadow/files/shadow-relaxed-usernames.patch    | 100 +++++++++++++++++++++
 meta/recipes-extended/shadow/shadow.inc            |   1 +
 2 files changed, 101 insertions(+)
 create mode 100644 meta/recipes-extended/shadow/files/shadow-relaxed-usernames.patch

diff --git a/meta/recipes-extended/shadow/files/shadow-relaxed-usernames.patch b/meta/recipes-extended/shadow/files/shadow-relaxed-usernames.patch
new file mode 100644
index 0000000..1af04d5
--- /dev/null
+++ b/meta/recipes-extended/shadow/files/shadow-relaxed-usernames.patch
@@ -0,0 +1,100 @@
+
+The groupadd from shadow does not allow upper case group names, the
+same is true for the upstream shadow. But distributions like
+Debian/Ubuntu/CentOS has their own way to cope with this problem,
+this patch is picked up from CentOS release 7.0 to relax the usernames
+restrictions to allow the upper case group names, and the relaxation is
+POSIX compliant because POSIX indicate that usernames are composed of 
+characters from the portable filename character set [A-Za-z0-9._-].
+
+Upstream-Status: Pending
+
+Signed-off-by: Shan Hai <shan.hai@windriver.com> 
+
+diff -urpN a/libmisc/chkname.c b/libmisc/chkname.c
+index 5089112..f40a0da 100644
+--- a/libmisc/chkname.c
++++ b/libmisc/chkname.c
+@@ -49,21 +49,28 @@
+ static bool is_valid_name (const char *name)
+ {
+ 	/*
+-	 * User/group names must match [a-z_][a-z0-9_-]*[$]
+-	 */
+-	if (('\0' == *name) ||
+-	    !((('a' <= *name) && ('z' >= *name)) || ('_' == *name))) {
++         * User/group names must match gnu e-regex:
++         *    [a-zA-Z0-9_.][a-zA-Z0-9_.-]{0,30}[a-zA-Z0-9_.$-]?
++         *
++         * as a non-POSIX, extension, allow "$" as the last char for
++         * sake of Samba 3.x "add machine script"
++         */
++	if ( ('\0' == *name) ||
++             !((*name >= 'a' && *name <= 'z') ||
++               (*name >= 'A' && *name <= 'Z') ||
++               (*name >= '0' && *name <= '9') ||
++               (*name == '_') || (*name == '.') 
++	      )) {
+ 		return false;
+ 	}
+ 
+ 	while ('\0' != *++name) {
+-		if (!(( ('a' <= *name) && ('z' >= *name) ) ||
+-		      ( ('0' <= *name) && ('9' >= *name) ) ||
+-		      ('_' == *name) ||
+-		      ('-' == *name) ||
+-		      ('.' == *name) ||
+-		      ( ('$' == *name) && ('\0' == *(name + 1)) )
+-		     )) {
++                if (!(  (*name >= 'a' && *name <= 'z') ||
++                        (*name >= 'A' && *name <= 'Z') ||
++                        (*name >= '0' && *name <= '9') ||
++                        (*name == '_') || (*name == '.') || (*name == '-') ||
++                        (*name == '$' && *(name + 1) == '\0') 
++                     )) {
+ 			return false;
+ 		}
+ 	}
+diff -urpN a/man/groupadd.8.xml b/man/groupadd.8.xml
+index 230fd0c..94f7807 100644
+--- a/man/groupadd.8.xml
++++ b/man/groupadd.8.xml
+@@ -222,12 +222,6 @@
+    <refsect1 id='caveats'>
+      <title>CAVEATS</title>
+      <para>
+-       Groupnames must start with a lower case letter or an underscore,
+-       followed by lower case letters, digits, underscores, or dashes.
+-       They can end with a dollar sign.
+-       In regular expression terms: [a-z_][a-z0-9_-]*[$]?
+-     </para>
+-     <para>
+        Groupnames may only be up to &GROUP_NAME_MAX_LENGTH; characters long.
+      </para>
+      <para>
+diff -urpN a/man/useradd.8.xml b/man/useradd.8.xml
+index 5dec989..fe623b9 100644
+--- a/man/useradd.8.xml
++++ b/man/useradd.8.xml
+@@ -336,7 +336,7 @@
+ 	</term>
+ 	<listitem>
+ 	  <para>
+-	    Do no create the user's home directory, even if the system
++	    Do not create the user's home directory, even if the system
+ 	    wide setting from <filename>/etc/login.defs</filename>
+ 	    (<option>CREATE_HOME</option>) is set to
+ 	    <replaceable>yes</replaceable>.
+@@ -607,12 +607,6 @@
+     </para>
+ 
+     <para>
+-      Usernames must start with a lower case letter or an underscore,
+-      followed by lower case letters, digits, underscores, or dashes.
+-      They can end with a dollar sign.
+-      In regular expression terms: [a-z_][a-z0-9_-]*[$]?
+-    </para>
+-    <para>
+       Usernames may only be up to 32 characters long.
+     </para>
+   </refsect1>
diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index 5605876..35a18f8 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -22,6 +22,7 @@ SRC_URI = "http://pkg-shadow.alioth.debian.org/releases/${BPN}-${PV}.tar.xz \
 SRC_URI_append_class-target = " \
            file://login_defs_pam.sed \
            file://shadow-update-pam-conf.patch \
+           file://shadow-relaxed-usernames.patch \
            "
 
 SRC_URI_append_class-native = " \
-- 
2.8.1


