Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UOAQ0-0002uK-0z
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Apr 2013 19:27:29 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 05 Apr 2013 10:09:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,415,1363158000"; d="scan'208";a="314232996"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.14.17])
	by fmsmga001.fm.intel.com with ESMTP; 05 Apr 2013 10:09:35 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Apr 2013 10:09:32 -0700
Message-Id: <1365181772-18644-3-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <1365181772-18644-1-git-send-email-sgw@linux.intel.com>
References: <1365181772-18644-1-git-send-email-sgw@linux.intel.com>
Subject: [PATCH 2/2] shadow: add patch to fix crypt: Invalid Argument
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 05 Apr 2013 17:27:31 -0000

This patch came from Slackware and address a change in crypt()'s handling
of an invalid seed, which in the past returned an encrypted string and now
returns a NULL.

[YOCTO #4097] related to tinylogin segfault

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../files/slackware_fix_for_glib-2.17_crypt.patch  | 63 ++++++++++++++++++++++
 meta/recipes-extended/shadow/shadow_4.1.4.3.bb     |  1 +
 2 files changed, 64 insertions(+)
 create mode 100644 meta/recipes-extended/shadow/files/slackware_fix_for_glib-2.17_crypt.patch

diff --git a/meta/recipes-extended/shadow/files/slackware_fix_for_glib-2.17_crypt.patch b/meta/recipes-extended/shadow/files/slackware_fix_for_glib-2.17_crypt.patch
new file mode 100644
index 0000000..7cd45af
--- /dev/null
+++ b/meta/recipes-extended/shadow/files/slackware_fix_for_glib-2.17_crypt.patch
@@ -0,0 +1,63 @@
+
+This patch is from Slackware, I tried to find the actual
+author to add that attribution.  The comment below is the
+best summary, I will not repeat it here.
+
+Upstream-Status: Backport from slackware
+
+Signed-off-by: Saul Wold <sgw@linux.intel.com>
+
+Index: shadow-4.1.4.3/lib/encrypt.c
+===================================================================
+--- shadow-4.1.4.3.orig/lib/encrypt.c
++++ shadow-4.1.4.3/lib/encrypt.c
+@@ -45,15 +45,40 @@ char *pw_encrypt (const char *clear, con
+ 	static char cipher[128];
+ 	char *cp;
+ 
+-	cp = crypt (clear, salt);
+-	if (!cp) {
+-		/*
+-		 * Single Unix Spec: crypt() may return a null pointer,
+-		 * and set errno to indicate an error.  The caller doesn't
+-		 * expect us to return NULL, so...
+-		 */
+-		perror ("crypt");
+-		exit (EXIT_FAILURE);
++ 	cp = crypt (clear, salt);
++ 	if (!cp) {
++ 		/*
++		 * In glibc-2.17 and newer, crypt() will return NULL if
++		 * it was called using an invalid salt format.  Previous
++		 * versions of glibc would go ahead and compute a DES hash
++		 * using the invalid salt.  The salt value in this case was
++		 * always '!'.  We might arrive at this place if either the
++		 * user does not exist, or if the hash in /etc/shadow doesn't
++		 * have the proper magic for one of the supported hash
++		 * formats (for example, if the account was locked using
++		 * "passwd -l".  To handle this situation, we will recompute
++		 * the hash using a hardcoded salt as was previously done
++		 * by glibc.  The hash returned by the old glibc function
++		 * always began with "!!", which would ensure that it could
++		 * never match an otherwise valid hash in /etc/shadow that
++		 * was disabled with a "!" at the beginning (since the second
++		 * character would never be "!" as well), so we will also
++		 * prepend the resulting hash with "!!".  Finally, in case
++		 * crypt() failed for some other reason we will check to see
++		 * if we still get NULL from crypt even with the valid salt
++		 * and will fail if that's the case.
++ 		 */
++
++		/* Recalculate hash using a hardcoded, valid SHA512 salt: */
++		cp = crypt (clear, "$6$8IIcy/1EPOk/");
++
++		if (!cp) {
++			perror ("crypt");
++			exit (EXIT_FAILURE);
++		} else {
++			sprintf (cipher, "!!%s", cp);
++			return cipher;
++		}
+ 	}
+ 
+ 	/* The GNU crypt does not return NULL if the algorithm is not
diff --git a/meta/recipes-extended/shadow/shadow_4.1.4.3.bb b/meta/recipes-extended/shadow/shadow_4.1.4.3.bb
index 8226a6e..caf24c0 100644
--- a/meta/recipes-extended/shadow/shadow_4.1.4.3.bb
+++ b/meta/recipes-extended/shadow/shadow_4.1.4.3.bb
@@ -23,6 +23,7 @@ SRC_URI = "http://pkg-shadow.alioth.debian.org/releases/${BPN}-${PV}.tar.bz2 \
            file://shadow-4.1.4.2-su_no_sanitize_env.patch \
            file://shadow-update-pam-conf.patch \
            file://shadow_fix_for_automake-1.12.patch \
+           file://slackware_fix_for_glib-2.17_crypt.patch \
            "
 
 SRC_URI[md5sum] = "b8608d8294ac88974f27b20f991c0e79"
-- 
1.8.0.2



