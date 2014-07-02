Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 865A265E1A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Jul 2014 06:23:01 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s626N3mB011042
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 1 Jul 2014 23:23:03 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Tue, 1 Jul 2014 23:23:02 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 2 Jul 2014 14:24:39 +0800
Message-ID: <f10b0de652bff0cfeb473eae9d31ebe7ed2e933d.1404282047.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1404282047.git.Qi.Chen@windriver.com>
References: <cover.1404282047.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] openssh: avoid checking empty passwords to mess up with PAM modules
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
X-List-Received-Date: Wed, 02 Jul 2014 06:23:04 -0000
Content-Type: text/plain

Previously, even if PAM is enabled for ssh, the daemon still tries to
authenticate an empty password. This leads to authentication failure
which would mess up with PAM modules.

As a result, if 'UsePAM', 'PermitEmptyPasswords' and 'PasswordAuthentication'
are enabled, no user can login correctly. We would meet the following error
message at the client side.

	Write failed: Broken Pipe

This patch fixes the above problem by checking whether PAM is enabled before
authenticating an empty password. After all, if PAM is enabled, the task of
authenticating passwords should be handled to PAM modules.

[YOCTO #6466]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...c-avoid-authenticate-empty-passwords-to-m.patch |   30 ++++++++++++++++++++
 meta/recipes-connectivity/openssh/openssh_6.6p1.bb |    3 +-
 2 files changed, 32 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/auth2-none.c-avoid-authenticate-empty-passwords-to-m.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/auth2-none.c-avoid-authenticate-empty-passwords-to-m.patch b/meta/recipes-connectivity/openssh/openssh/auth2-none.c-avoid-authenticate-empty-passwords-to-m.patch
new file mode 100644
index 0000000..ba13cd1
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/auth2-none.c-avoid-authenticate-empty-passwords-to-m.patch
@@ -0,0 +1,30 @@
+Upstream-Status: Pending
+
+Subject: auth2-none.c: avoid authenticate empty passwords to mess up with PAM
+
+If UsePAM, PermitEmptyPasswords, PasswordAuthentication are enabled. The ssh daemon
+will try to authenticate an empty password, resulting in login failures of any user.
+If PAM is enabled, then we should leave the task of password authentication to PAM.
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+
+---
+ auth2-none.c |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/auth2-none.c b/auth2-none.c
+index c8c6c74..b48b2fd 100644
+--- a/auth2-none.c
++++ b/auth2-none.c
+@@ -61,7 +61,7 @@ userauth_none(Authctxt *authctxt)
+ {
+ 	none_enabled = 0;
+ 	packet_check_eom();
+-	if (options.permit_empty_passwd && options.password_authentication)
++	if (options.permit_empty_passwd && options.password_authentication && !options.use_pam)
+ 		return (PRIVSEP(auth_password(authctxt, "")));
+ 	return (0);
+ }
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-connectivity/openssh/openssh_6.6p1.bb b/meta/recipes-connectivity/openssh/openssh_6.6p1.bb
index 8f32c2e..047a895 100644
--- a/meta/recipes-connectivity/openssh/openssh_6.6p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_6.6p1.bb
@@ -24,7 +24,8 @@ SRC_URI = "ftp://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar.
            file://add-test-support-for-busybox.patch \
            file://run-ptest \
            file://openssh-CVE-2014-2532.patch \
-           file://openssh-CVE-2014-2653.patch"
+           file://openssh-CVE-2014-2653.patch \
+           file://auth2-none.c-avoid-authenticate-empty-passwords-to-m.patch"
 
 PAM_SRC_URI = "file://sshd"
 
-- 
1.7.9.5


