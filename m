Received: from mail-wi0-f172.google.com ([209.85.212.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UQJGL-0006G4-QY
	for openembedded-core@lists.openembedded.org;
	Thu, 11 Apr 2013 17:18:13 +0200
Received: by mail-wi0-f172.google.com with SMTP id hr17so658912wib.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Apr 2013 08:00:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=DIPElhdOGP5E3i/3Mh+pCgps9Vw8mkmD0JVYP3pYeo4=;
	b=OwWnX2UFuaR1egXzTEDR4BdY+3zOw1/G+LwtXA8hS5h2q+prlWtYrqs84wHJrsBSde
	r0D3d0hJxn6lAkT/nGUBafDCrWc6tgnlBD+2RLklDirAhkMOyF6LNBXzgnx5wXu3ZH/w
	+HvOm8NxsRqo7azCVG5qpRii7hKelV3Tl/nqVMDTHwpkreRLIIBWor+3PbgTrN0M2F95
	ymNoCcRV55pd3RaaPRHKF57zOUxBxYbcuSZj3uCAFCNVN2HwsKqIgBpCxqBG+dEkCLLT
	q+Jd77N01pgVkc/0mRw/91jFU+zgpCmsvqpDTatRzw8vKz0AUOU/M+vwzA2zTAOaZLGY
	fR4g==
X-Received: by 10.180.182.36 with SMTP id eb4mr15261144wic.8.1365692446374;
	Thu, 11 Apr 2013 08:00:46 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id ej8sm3627871wib.9.2013.04.11.08.00.44
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 11 Apr 2013 08:00:45 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Apr 2013 15:57:58 +0100
Message-Id: <1365692278-28827-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQns4pSaeeFZsbpnEZelCQ43uecLJDKWdy9ckIlC0TujJaKIeE67sDr6Ziiuma1GXhyzhB6P
Subject: [PATCH] sudo: handle glibc 2.17 crypt semantics
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
X-List-Received-Date: Thu, 11 Apr 2013 15:18:19 -0000

Staring from glibc 2.17 the crypt() function will error out and return NULL if
the seed or "correct" is invalid. The failure case for this is the sudo user
having a locked account in /etc/shadow, so their password is "!", which is an
invalid hash.  crypt() never returned NULL previously so this is crashing in
strcmp().

[ YOCTO #4241 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-extended/sudo/files/crypt.patch |   24 ++++++++++++++++++++++++
 meta/recipes-extended/sudo/sudo_1.8.6p7.bb   |    1 +
 2 files changed, 25 insertions(+)
 create mode 100644 meta/recipes-extended/sudo/files/crypt.patch

diff --git a/meta/recipes-extended/sudo/files/crypt.patch b/meta/recipes-extended/sudo/files/crypt.patch
new file mode 100644
index 0000000..53a257f
--- /dev/null
+++ b/meta/recipes-extended/sudo/files/crypt.patch
@@ -0,0 +1,24 @@
+Staring from glibc 2.17 the crypt() function will error out and return NULL if
+the seed or "correct" is invalid. The failure case for this is the sudo user
+having a locked account in /etc/shadow, so their password is "!", which is an
+invalid hash.  crypt() never returned NULL previously so this is crashing in
+strcmp().
+
+Upstream-Status: Pending
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+Index: sudo-1.8.6p7/plugins/sudoers/auth/passwd.c
+===================================================================
+--- sudo-1.8.6p7.orig/plugins/sudoers/auth/passwd.c	2013-04-11 15:26:28.456416867 +0100
++++ sudo-1.8.6p7/plugins/sudoers/auth/passwd.c	2013-04-11 15:31:31.156421718 +0100
+@@ -96,7 +96,9 @@
+      */
+     epass = (char *) crypt(pass, pw_epasswd);
+     pass[8] = sav;
+-    if (HAS_AGEINFO(pw_epasswd, pw_len) && strlen(epass) == DESLEN)
++    if (epass == NULL)
++	error = AUTH_FAILURE;
++    else if (HAS_AGEINFO(pw_epasswd, pw_len) && strlen(epass) == DESLEN)
+ 	error = strncmp(pw_epasswd, epass, DESLEN);
+     else
+ 	error = strcmp(pw_epasswd, epass);
diff --git a/meta/recipes-extended/sudo/sudo_1.8.6p7.bb b/meta/recipes-extended/sudo/sudo_1.8.6p7.bb
index b79d0d5..7198fd3 100644
--- a/meta/recipes-extended/sudo/sudo_1.8.6p7.bb
+++ b/meta/recipes-extended/sudo/sudo_1.8.6p7.bb
@@ -4,6 +4,7 @@ PR = "r0"
 
 SRC_URI = "http://ftp.sudo.ws/sudo/dist/sudo-${PV}.tar.gz \
            file://libtool.patch \
+           file://crypt.patch \
            ${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)}"
 
 PAM_SRC_URI = "file://sudo.pam"
-- 
1.7.10.4



