Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 714CB73D27
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Apr 2016 00:47:25 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id 145so6670076pfz.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Apr 2016 17:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=JTUcYg1qzoyv277pZ4XmCLjuhCMU5qEhnkCO24Po+A0=;
	b=VG8nPVMOsrEjZiRgffISbIAr9gtr96Km87jLw3y2jtG2b0YS5se1S4XDanRLdZAmYf
	QUier3lKZRkC1XbmIVGLnYCByCa85I+76kFLdSRPRxckjlRmuwdOMoJTnxHR4On055+H
	b78ifgfAN3ox/GEQil8peCyShilERrzrKc5aHo0KQOro+MzcKjySgj7Ihs0Av8HZKn6s
	3qQhzuZ15zSK4GA/INUwuxMxRpJQBrz2kA4lnvE2QMQH8qNMEnjleh3G+Bt7FX3iJOJE
	rQppiDfgcrs5qCTqMEg3rHo0XakO7vjN6kTDPK2QBIPVWQGdvJFUrdmF7NnE8rxDX8VI
	y7qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=JTUcYg1qzoyv277pZ4XmCLjuhCMU5qEhnkCO24Po+A0=;
	b=CDHYhCRAm/p7LfmkALCtLaEyuFAWhxyMJQXxhJzC6uuAQsMR6SSg/S5WNLak/fqeyI
	hVt9a2MZ0svWlex3e4C94P2pKC9JJhYH9gtxwYeulET4kWDh4rJIdnJlGplKvFt1+uYF
	C5zpJ900ekFs4gSkUFI8C7ywY5ct73qUYEe6hhjpnBseu6R2ufkc2ovwSlOyHpWMLR+J
	aFM6VNaLSKcNr7V+Bs5qfsdJkQhNTX6zozwRTYpt6JEaRA7XuIakZ60CbH2F+F2YCHYJ
	wmiLysVZItFr2/DqsA/j9A/fSxAql17SNC7bAvguP39JWl1vLV1L5HhmiCyBYkJt1h97
	tdtQ==
X-Gm-Message-State: AOPr4FXaqHsZhIzRvuzNOK2mRb7SW2LDn62ytO68aSVEqKN1ePRGrfWVd3LdINMUP0wE2A==
X-Received: by 10.98.17.153 with SMTP id 25mr11676676pfr.105.1461804446585;
	Wed, 27 Apr 2016 17:47:26 -0700 (PDT)
Received: from Pahoa2.mvista.com ([64.2.3.194])
	by smtp.gmail.com with ESMTPSA id m12sm9636649pfi.5.2016.04.27.17.47.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 27 Apr 2016 17:47:25 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Apr 2016 17:47:20 -0700
Message-Id: <1461804443-13094-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Cc: Armin Kuster <akuster@mvista.com>
Subject: [master][krogoth][PATCH 1/4] openssh: Security Fix CVE-2016-3115
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
X-List-Received-Date: Thu, 28 Apr 2016 00:47:28 -0000

From: Armin Kuster <akuster@mvista.com>

opehssh <= 7.2

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../openssh/openssh/CVE-2016-3115.patch            | 84 ++++++++++++++++++++++
 meta/recipes-connectivity/openssh/openssh_7.1p2.bb |  4 +-
 2 files changed, 87 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2016-3115.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2016-3115.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2016-3115.patch
new file mode 100644
index 0000000..9a9ad77
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2016-3115.patch
@@ -0,0 +1,84 @@
+From 4b4bfb01cd40b9ddb948e6026ddd287cc303d871 Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Thu, 10 Mar 2016 11:47:57 +0000
+Subject: [PATCH] upstream commit
+
+sanitise characters destined for xauth reported by
+ github.com/tintinweb feedback and ok deraadt and markus
+
+Upstream-ID: 18ad8d0d74cbd2ea3306a16595a306ee356aa261
+
+Upstream-Status: Backport
+CVE: CVE-2016-3115
+https://anongit.mindrot.org/openssh.git/commit/?id=4b4bfb01cd40b9ddb948e6026ddd287cc303d871
+
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ session.c | 34 +++++++++++++++++++++++++++++++---
+ 1 file changed, 31 insertions(+), 3 deletions(-)
+
+Index: openssh-7.1p2/session.c
+===================================================================
+--- openssh-7.1p2.orig/session.c
++++ openssh-7.1p2/session.c
+@@ -46,6 +46,7 @@
+ 
+ #include <arpa/inet.h>
+ 
++#include <ctype.h>
+ #include <errno.h>
+ #include <fcntl.h>
+ #include <grp.h>
+@@ -273,6 +274,21 @@ do_authenticated(Authctxt *authctxt)
+ 	do_cleanup(authctxt);
+ }
+ 
++/* Check untrusted xauth strings for metacharacters */
++static int
++xauth_valid_string(const char *s)
++{
++	size_t i;
++
++	for (i = 0; s[i] != '\0'; i++) {
++		if (!isalnum((u_char)s[i]) &&
++		    s[i] != '.' && s[i] != ':' && s[i] != '/' &&
++		    s[i] != '-' && s[i] != '_')
++		return 0;
++	}
++	return 1;
++}
++
+ /*
+  * Prepares for an interactive session.  This is called after the user has
+  * been successfully authenticated.  During this message exchange, pseudo
+@@ -346,7 +362,13 @@ do_authenticated1(Authctxt *authctxt)
+ 				s->screen = 0;
+ 			}
+ 			packet_check_eom();
+-			success = session_setup_x11fwd(s);
++			if (xauth_valid_string(s->auth_proto) &&
++			    xauth_valid_string(s->auth_data))
++				success = session_setup_x11fwd(s);
++			else {
++				success = 0;
++				error("Invalid X11 forwarding data");
++			}
+ 			if (!success) {
+ 				free(s->auth_proto);
+ 				free(s->auth_data);
+@@ -2181,7 +2203,13 @@ session_x11_req(Session *s)
+ 	s->screen = packet_get_int();
+ 	packet_check_eom();
+ 
+-	success = session_setup_x11fwd(s);
++	if (xauth_valid_string(s->auth_proto) &&
++	    xauth_valid_string(s->auth_data))
++		success = session_setup_x11fwd(s);
++	else {
++		success = 0;
++		error("Invalid X11 forwarding data");
++	}
+ 	if (!success) {
+ 		free(s->auth_proto);
+ 		free(s->auth_data);
diff --git a/meta/recipes-connectivity/openssh/openssh_7.1p2.bb b/meta/recipes-connectivity/openssh/openssh_7.1p2.bb
index 3b5e28a..c1b0fb2 100644
--- a/meta/recipes-connectivity/openssh/openssh_7.1p2.bb
+++ b/meta/recipes-connectivity/openssh/openssh_7.1p2.bb
@@ -23,7 +23,9 @@ SRC_URI = "ftp://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar.
            file://run-ptest \
            file://CVE-2016-1907_upstream_commit.patch \
            file://CVE-2016-1907_2.patch \
-           file://CVE-2016-1907_3.patch "
+           file://CVE-2016-1907_3.patch \
+           file://CVE-2016-3115.patch \
+           "
 
 PAM_SRC_URI = "file://sshd"
 
-- 
2.3.5


