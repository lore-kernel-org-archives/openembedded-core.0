Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id D377265D58
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Sep 2014 15:05:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 468602E3C2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Sep 2014 17:05:17 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id R5kr0WYzcSjf
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Sep 2014 17:05:16 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bes.se.axis.com (Postfix) with ESMTP id 5A0A52E437
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Sep 2014 17:05:16 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 42FC4A67
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Sep 2014 17:05:16 +0200 (CEST)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
	by boulder.se.axis.com (Postfix) with ESMTP id 374F79B2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Sep 2014 17:05:16 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id 33C1B3E048
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Sep 2014 17:05:16 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id s8CF5Glj020889
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Sep 2014 17:05:16 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id s8CF5GsH020888
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Sep 2014 17:05:16 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Sep 2014 17:05:00 +0200
Message-Id: <e597b73e20fb51c8c5895626e6f84fd753d6bc72.1410534231.git.pkj@axis.com>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <cover.1410534231.git.pkj@axis.com>
References: <cover.1410534231.git.pkj@axis.com>
In-Reply-To: <cover.1410534231.git.pkj@axis.com>
References: <cover.1410534231.git.pkj@axis.com>
Subject: [PATCH 1/1] shadow: Make useradd work correctly with --root again
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
X-List-Received-Date: Fri, 12 Sep 2014 15:05:29 -0000

Even if useradd --root <root> is used it would still read login.defs
before doing the chroot() and thus use the one provided by the host
rather than the sysroot.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 ...o-not-read-login.defs-before-doing-chroot.patch | 46 ++++++++++++++++++++++
 meta/recipes-extended/shadow/shadow.inc            |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-extended/shadow/files/0001-Do-not-read-login.defs-before-doing-chroot.patch

diff --git a/meta/recipes-extended/shadow/files/0001-Do-not-read-login.defs-before-doing-chroot.patch b/meta/recipes-extended/shadow/files/0001-Do-not-read-login.defs-before-doing-chroot.patch
new file mode 100644
index 0000000..828b95a
--- /dev/null
+++ b/meta/recipes-extended/shadow/files/0001-Do-not-read-login.defs-before-doing-chroot.patch
@@ -0,0 +1,46 @@
+From 170c25c8e0b5c3dc2615d1db94c8d24a13ff99bf Mon Sep 17 00:00:00 2001
+From: Peter Kjellerstedt <pkj@axis.com>
+Date: Thu, 11 Sep 2014 15:11:23 +0200
+Subject: [PATCH] Do not read login.defs before doing chroot()
+
+If "useradd --root <root> ..." was used, the login.defs file would still
+be read from /etc/login.defs instead of <root>/etc/login.defs. This was
+due to getdef_ulong() being called before process_root_flag().
+
+Upstream-Status: Submitted [http://lists.alioth.debian.org/pipermail/pkg-shadow-devel/2014-September/010446.html]
+
+Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
+---
+ src/useradd.c | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/src/useradd.c b/src/useradd.c
+index a8a1f76..e1ebf50 100644
+--- a/src/useradd.c
++++ b/src/useradd.c
+@@ -1993,9 +1993,11 @@ int main (int argc, char **argv)
+ #endif				/* USE_PAM */
+ #endif				/* ACCT_TOOLS_SETUID */
+ 
++#ifdef ENABLE_SUBIDS
+ 	/* Needed for userns check */
+-	uid_t uid_min = (uid_t) getdef_ulong ("UID_MIN", 1000UL);
+-	uid_t uid_max = (uid_t) getdef_ulong ("UID_MAX", 60000UL);
++	uid_t uid_min;
++	uid_t uid_max;
++#endif
+ 
+ 	/*
+ 	 * Get my name so that I can use it to report errors.
+@@ -2026,6 +2028,8 @@ int main (int argc, char **argv)
+ 	is_shadow_grp = sgr_file_present ();
+ #endif
+ #ifdef ENABLE_SUBIDS
++	uid_min = (uid_t) getdef_ulong ("UID_MIN", 1000UL);
++	uid_max = (uid_t) getdef_ulong ("UID_MAX", 60000UL);
+ 	is_sub_uid = sub_uid_file_present () && !rflg &&
+ 	    (!user_id || (user_id <= uid_max && user_id >= uid_min));
+ 	is_sub_gid = sub_gid_file_present () && !rflg &&
+-- 
+1.9.0
+
diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index 84d1f86..6a769df 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -15,6 +15,7 @@ SRC_URI = "http://pkg-shadow.alioth.debian.org/releases/${BPN}-${PV}.tar.xz \
            file://usermod-fix-compilation-failure-with-subids-disabled.patch \
            file://fix-installation-failure-with-subids-disabled.patch \
            file://0001-su.c-fix-to-exec-command-correctly.patch \
+           file://0001-Do-not-read-login.defs-before-doing-chroot.patch \
            ${@bb.utils.contains('PACKAGECONFIG', 'pam', '${PAM_SRC_URI}', '', d)} \
            "
 
-- 
1.9.0


