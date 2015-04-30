Return-Path: <Wenlin.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 19D6372A85
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Apr 2015 10:17:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t3UAHiGG003962
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Apr 2015 03:17:44 -0700 (PDT)
Received: from PEK-WKANG-D1.corp.ad.wrs.com (128.224.162.214) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.224.2; Thu, 30 Apr 2015 03:17:44 -0700
From: Wenlin Kang <wenlin.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 30 Apr 2015 18:17:39 +0800
Message-ID: <1430389059-27361-1-git-send-email-wenlin.kang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] openssh: fix login fails for ssh -o Batchmode=yes with empty passwords
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
X-List-Received-Date: Thu, 30 Apr 2015 10:17:46 -0000
Content-Type: text/plain

The patch fixes the login fails for ssh -o Batchmode=yes when passwords is
empty and without authorized_keys file even if set "PermitEmptyPasswords yes"
in sshd_config file.

Here, to fix this issue, we remove the file auth2-none.c-avoid-authenticate-
empty-passwords-to-m.patch, that fixed broken pipe while sshd with pam,
but it isn't needed any more now, because we make it has gone by change
ChallengeResponseAuthentication value in sshd_config file.

Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
---
 ...c-avoid-authenticate-empty-passwords-to-m.patch |   30 --------------------
 .../openssh/openssh/sshd_config                    |    2 +-
 meta/recipes-connectivity/openssh/openssh_6.8p1.bb |    3 +-
 3 files changed, 2 insertions(+), 33 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssh/openssh/auth2-none.c-avoid-authenticate-empty-passwords-to-m.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/auth2-none.c-avoid-authenticate-empty-passwords-to-m.patch b/meta/recipes-connectivity/openssh/openssh/auth2-none.c-avoid-authenticate-empty-passwords-to-m.patch
deleted file mode 100644
index ba13cd1..0000000
--- a/meta/recipes-connectivity/openssh/openssh/auth2-none.c-avoid-authenticate-empty-passwords-to-m.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-Upstream-Status: Pending
-
-Subject: auth2-none.c: avoid authenticate empty passwords to mess up with PAM
-
-If UsePAM, PermitEmptyPasswords, PasswordAuthentication are enabled. The ssh daemon
-will try to authenticate an empty password, resulting in login failures of any user.
-If PAM is enabled, then we should leave the task of password authentication to PAM.
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
-
----
- auth2-none.c |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/auth2-none.c b/auth2-none.c
-index c8c6c74..b48b2fd 100644
---- a/auth2-none.c
-+++ b/auth2-none.c
-@@ -61,7 +61,7 @@ userauth_none(Authctxt *authctxt)
- {
- 	none_enabled = 0;
- 	packet_check_eom();
--	if (options.permit_empty_passwd && options.password_authentication)
-+	if (options.permit_empty_passwd && options.password_authentication && !options.use_pam)
- 		return (PRIVSEP(auth_password(authctxt, "")));
- 	return (0);
- }
--- 
-1.7.9.5
-
diff --git a/meta/recipes-connectivity/openssh/openssh/sshd_config b/meta/recipes-connectivity/openssh/openssh/sshd_config
index 3553669..d48bd2b 100644
--- a/meta/recipes-connectivity/openssh/openssh/sshd_config
+++ b/meta/recipes-connectivity/openssh/openssh/sshd_config
@@ -73,7 +73,7 @@ AuthorizedKeysFile .ssh/authorized_keys
 #PermitEmptyPasswords no
 
 # Change to no to disable s/key passwords
-#ChallengeResponseAuthentication yes
+ChallengeResponseAuthentication no
 
 # Kerberos options
 #KerberosAuthentication no
diff --git a/meta/recipes-connectivity/openssh/openssh_6.8p1.bb b/meta/recipes-connectivity/openssh/openssh_6.8p1.bb
index 8e07e00..b00ef6f 100644
--- a/meta/recipes-connectivity/openssh/openssh_6.8p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_6.8p1.bb
@@ -20,8 +20,7 @@ SRC_URI = "ftp://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar.
            file://sshdgenkeys.service \
            file://volatiles.99_sshd \
            file://add-test-support-for-busybox.patch \
-           file://run-ptest \
-           file://auth2-none.c-avoid-authenticate-empty-passwords-to-m.patch"
+           file://run-ptest"
 
 PAM_SRC_URI = "file://sshd"
 
-- 
1.7.9.5


