Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 077D1C3A59F
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 18:02:32 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.1190.1667844128899621444
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Nov 2022 10:02:09 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A54FC23A;
	Mon,  7 Nov 2022 10:02:14 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 157C33F534;
	Mon,  7 Nov 2022 10:02:07 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH][langdale 2/2] sudo: backport fix for CVE-2022-43995
Date: Mon,  7 Nov 2022 18:02:05 +0000
Message-Id: <20221107180205.2838225-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221107180205.2838225-1-ross.burton@arm.com>
References: <20221107180205.2838225-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 18:02:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172927

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../sudo/files/CVE-2022-43995.patch           | 54 +++++++++++++++++++
 meta/recipes-extended/sudo/sudo_1.9.11p3.bb   |  1 +
 2 files changed, 55 insertions(+)
 create mode 100644 meta/recipes-extended/sudo/files/CVE-2022-43995.patch

diff --git a/meta/recipes-extended/sudo/files/CVE-2022-43995.patch b/meta=
/recipes-extended/sudo/files/CVE-2022-43995.patch
new file mode 100644
index 00000000000..64dca8c9c6b
--- /dev/null
+++ b/meta/recipes-extended/sudo/files/CVE-2022-43995.patch
@@ -0,0 +1,54 @@
+CVE: CVE-2022-43995
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From bd209b9f16fcd1270c13db27ae3329c677d48050 Mon Sep 17 00:00:00 2001
+From: "Todd C. Miller" <Todd.Miller@sudo.ws>
+Date: Fri, 28 Oct 2022 07:29:55 -0600
+Subject: [PATCH] Fix CVE-2022-43995, potential heap overflow for passwor=
ds < 8
+ characters. Starting with sudo 1.8.0 the plaintext password buffer is
+ dynamically sized so it is not safe to assume that it is at least 9 byt=
es in
+ size. Found by Hugo Lefeuvre (University of Manchester) with ConfFuzz.
+
+---
+ plugins/sudoers/auth/passwd.c | 11 +++++------
+ 1 file changed, 5 insertions(+), 6 deletions(-)
+
+diff --git a/plugins/sudoers/auth/passwd.c b/plugins/sudoers/auth/passwd=
.c
+index b2046eca2..0416861e9 100644
+--- a/plugins/sudoers/auth/passwd.c
++++ b/plugins/sudoers/auth/passwd.c
+@@ -63,7 +63,7 @@ sudo_passwd_init(struct passwd *pw, sudo_auth *auth)
+ int
+ sudo_passwd_verify(struct passwd *pw, char *pass, sudo_auth *auth, stru=
ct sudo_conv_callback *callback)
+ {
+-    char sav, *epass;
++    char des_pass[9], *epass;
+     char *pw_epasswd =3D auth->data;
+     size_t pw_len;
+     int matched =3D 0;
+@@ -75,12 +75,12 @@ sudo_passwd_verify(struct passwd *pw, char *pass, su=
do_auth *auth, struct sudo_c
+=20
+     /*
+      * Truncate to 8 chars if standard DES since not all crypt()'s do t=
his.
+-     * If this turns out not to be safe we will have to use OS #ifdef's=
 (sigh).
+      */
+-    sav =3D pass[8];
+     pw_len =3D strlen(pw_epasswd);
+-    if (pw_len =3D=3D DESLEN || HAS_AGEINFO(pw_epasswd, pw_len))
+-	pass[8] =3D '\0';
++    if (pw_len =3D=3D DESLEN || HAS_AGEINFO(pw_epasswd, pw_len)) {
++	strlcpy(des_pass, pass, sizeof(des_pass));
++	pass =3D des_pass;
++    }
+=20
+     /*
+      * Normal UN*X password check.
+@@ -88,7 +88,6 @@ sudo_passwd_verify(struct passwd *pw, char *pass, sudo=
_auth *auth, struct sudo_c
+      * only compare the first DESLEN characters in that case.
+      */
+     epass =3D (char *) crypt(pass, pw_epasswd);
+-    pass[8] =3D sav;
+     if (epass !=3D NULL) {
+ 	if (HAS_AGEINFO(pw_epasswd, pw_len) && strlen(epass) =3D=3D DESLEN)
+ 	    matched =3D !strncmp(pw_epasswd, epass, DESLEN);
diff --git a/meta/recipes-extended/sudo/sudo_1.9.11p3.bb b/meta/recipes-e=
xtended/sudo/sudo_1.9.11p3.bb
index ba610ee2e77..fa9cf481967 100644
--- a/meta/recipes-extended/sudo/sudo_1.9.11p3.bb
+++ b/meta/recipes-extended/sudo/sudo_1.9.11p3.bb
@@ -4,6 +4,7 @@ SRC_URI =3D "https://www.sudo.ws/dist/sudo-${PV}.tar.gz \
            ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI=
}', '', d)} \
            file://0001-sudo.conf.in-fix-conflict-with-multilib.patch \
            file://0001-lib-util-mksigname.c-correctly-include-header-for=
-ou.patch \
+           file://CVE-2022-43995.patch \
            "
=20
 PAM_SRC_URI =3D "file://sudo.pam"
--=20
2.34.1


