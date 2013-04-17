Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1USOTJ-00085J-90
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Apr 2013 11:16:12 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r3H8waG8010435
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Apr 2013 01:58:36 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.205) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Wed, 17 Apr 2013 01:58:36 -0700
From: Kang Kai <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 17 Apr 2013 17:00:25 +0800
Message-ID: <c233dd107f44c6654ab7ab9f1194875399d855fb.1366187846.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1366187846.git.kai.kang@windriver.com>
References: <cover.1366187846.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.205]
Subject: [PATCH 1/1] libpam: backport patches from upstream
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
X-List-Received-Date: Wed, 17 Apr 2013 09:16:17 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Backport patches from linux-pam git repo to fix test case
tst-pam_pwhistory1 failure.

[YOCTO #4107]

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../add-checks-for-crypt-returning-NULL.patch      |   63 ++++++++++++++++++++
 ...-enforce_for_root-semantics-change-in-pam.patch |   35 +++++++++++
 meta/recipes-extended/pam/libpam_1.1.6.bb          |    2 +
 3 files changed, 100 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-extended/pam/libpam/add-checks-for-crypt-returning-NULL.patch
 create mode 100644 meta/recipes-extended/pam/libpam/reflect-the-enforce_for_root-semantics-change-in-pam.patch

diff --git a/meta/recipes-extended/pam/libpam/add-checks-for-crypt-returning-NULL.patch b/meta/recipes-extended/pam/libpam/add-checks-for-crypt-returning-NULL.patch
new file mode 100644
index 0000000..d364cea
--- /dev/null
+++ b/meta/recipes-extended/pam/libpam/add-checks-for-crypt-returning-NULL.patch
@@ -0,0 +1,63 @@
+Backport from linux-pam git repo.
+
+[YOCTO #4107]
+
+Upstream-Status: Backport
+
+Signed-off-by: Kang Kai <kai.kang@windriver.com>
+
+From 8dc056c1c8bc7acb66c4decc49add2c3a24e6310 Mon Sep 17 00:00:00 2001
+From: Tomas Mraz <tmraz@fedoraproject.org>
+Date: Fri, 8 Feb 2013 15:04:26 +0100
+Subject: [PATCH] Add checks for crypt() returning NULL.
+
+modules/pam_pwhistory/opasswd.c (compare_password): Add check for crypt() NULL return.
+modules/pam_unix/bigcrypt.c (bigcrypt): Likewise.
+---
+ modules/pam_pwhistory/opasswd.c |    2 +-
+ modules/pam_unix/bigcrypt.c     |    9 +++++++++
+ 2 files changed, 10 insertions(+), 1 deletions(-)
+
+diff --git a/modules/pam_pwhistory/opasswd.c b/modules/pam_pwhistory/opasswd.c
+index 274fdb9..836d713 100644
+--- a/modules/pam_pwhistory/opasswd.c
++++ b/modules/pam_pwhistory/opasswd.c
+@@ -108,7 +108,7 @@ compare_password(const char *newpass, const char *oldpass)
+   outval = crypt (newpass, oldpass);
+ #endif
+ 
+-  return strcmp(outval, oldpass) == 0;
++  return outval != NULL && strcmp(outval, oldpass) == 0;
+ }
+ 
+ /* Check, if the new password is already in the opasswd file.  */
+diff --git a/modules/pam_unix/bigcrypt.c b/modules/pam_unix/bigcrypt.c
+index e10d1c5..e1d57a0 100644
+--- a/modules/pam_unix/bigcrypt.c
++++ b/modules/pam_unix/bigcrypt.c
+@@ -109,6 +109,10 @@ char *bigcrypt(const char *key, const char *salt)
+ #else
+ 	tmp_ptr = crypt(plaintext_ptr, salt);	/* libc crypt() */
+ #endif
++	if (tmp_ptr == NULL) {
++		free(dec_c2_cryptbuf);
++		return NULL;
++	}
+ 	/* and place in the static area */
+ 	strncpy(cipher_ptr, tmp_ptr, 13);
+ 	cipher_ptr += ESEGMENT_SIZE + SALT_SIZE;
+@@ -130,6 +134,11 @@ char *bigcrypt(const char *key, const char *salt)
+ #else
+ 			tmp_ptr = crypt(plaintext_ptr, salt_ptr);
+ #endif
++			if (tmp_ptr == NULL) {
++				_pam_overwrite(dec_c2_cryptbuf);
++				free(dec_c2_cryptbuf);
++				return NULL;
++			}
+ 
+ 			/* skip the salt for seg!=0 */
+ 			strncpy(cipher_ptr, (tmp_ptr + SALT_SIZE), ESEGMENT_SIZE);
+-- 
+1.7.5.4
+
diff --git a/meta/recipes-extended/pam/libpam/reflect-the-enforce_for_root-semantics-change-in-pam.patch b/meta/recipes-extended/pam/libpam/reflect-the-enforce_for_root-semantics-change-in-pam.patch
new file mode 100644
index 0000000..c13535e
--- /dev/null
+++ b/meta/recipes-extended/pam/libpam/reflect-the-enforce_for_root-semantics-change-in-pam.patch
@@ -0,0 +1,35 @@
+Backport from linux-pam git repo.
+
+[YOCTO #4107]
+
+Upstream-Status: Backport
+
+Signed-off-by: Kang Kai <kai.kang@windriver.com>
+
+From bd07ad3adc626f842a4391d256541883426fd389 Mon Sep 17 00:00:00 2001
+From: Tomas Mraz <tmraz@fedoraproject.org>
+Date: Tue, 13 Nov 2012 09:19:05 +0100
+Subject: [PATCH] Reflect the enforce_for_root semantics change in
+ pam_pwhistory xtest.
+
+xtests/tst-pam_pwhistory1.pamd: Use enforce_for_root as the test is
+running with real uid == 0.
+---
+ xtests/tst-pam_pwhistory1.pamd | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/xtests/tst-pam_pwhistory1.pamd b/xtests/tst-pam_pwhistory1.pamd
+index 68e1b94..d60db7c 100644
+--- a/xtests/tst-pam_pwhistory1.pamd
++++ b/xtests/tst-pam_pwhistory1.pamd
+@@ -1,6 +1,6 @@
+ #%PAM-1.0
+ auth     required       pam_permit.so
+ account  required       pam_permit.so
+-password required	pam_pwhistory.so remember=10 retry=1
++password required	pam_pwhistory.so remember=10 retry=1 enforce_for_root
+ password required	pam_unix.so	use_authtok md5
+ session  required       pam_permit.so
+-- 
+1.7.11.7
+
diff --git a/meta/recipes-extended/pam/libpam_1.1.6.bb b/meta/recipes-extended/pam/libpam_1.1.6.bb
index 9a49c50..c355634 100644
--- a/meta/recipes-extended/pam/libpam_1.1.6.bb
+++ b/meta/recipes-extended/pam/libpam_1.1.6.bb
@@ -15,6 +15,8 @@ SRC_URI = "http://linux-pam.org/library/Linux-PAM-${PV}.tar.bz2 \
            file://libpam-xtests.patch \
            file://destdirfix.patch \
            file://fixsepbuild.patch \
+           file://reflect-the-enforce_for_root-semantics-change-in-pam.patch \
+           file://add-checks-for-crypt-returning-NULL.patch \
           "
 SRC_URI[md5sum] = "7b73e58b7ce79ffa321d408de06db2c4"
 SRC_URI[sha256sum] = "bab887d6280f47fc3963df3b95735a27a16f0f663636163ddf3acab5f1149fc2"
-- 
1.7.5.4



