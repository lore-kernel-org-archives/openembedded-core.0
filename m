Received: from mail-wi0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1S4Sdh-0008GV-GM
	for openembedded-core@lists.openembedded.org;
	Mon, 05 Mar 2012 08:47:25 +0100
Received: by wibhq12 with SMTP id hq12so1798934wib.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 04 Mar 2012 23:38:51 -0800 (PST)
Received-SPF: pass (google.com: domain of koen@dominion.thruhere.net
	designates 10.216.134.155 as permitted sender)
	client-ip=10.216.134.155; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	koen@dominion.thruhere.net designates 10.216.134.155 as
	permitted sender) smtp.mail=koen@dominion.thruhere.net
Received: from mr.google.com ([10.216.134.155])
	by 10.216.134.155 with SMTP id s27mr4309451wei.80.1330933131304
	(num_hops = 1); Sun, 04 Mar 2012 23:38:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:x-gm-message-state;
	bh=rwwMumTHypKDR8Fyw2cLkCka5F2eswROFWCUGk0BWSo=;
	b=FoL415oMp1wCPc+7UiEE5tSvJSqwMTEeiy8DsU/Ks7QWdDruxkeaWyspNXEaAV3NN6
	jabpC/iV6R2Hdhi4NKjRxl6cXyl724/0tpIoMexVFt5J5eB8LBxptjC7AGnQkCZrm/+H
	d/2IV/3JwVMWwiIDufMety5PbolN4OhkICZp2H23tIoOkthLx2TJgWZcTA//cjT1dR6f
	NLi/Iyj3/GaozG3ETslXt6Ga9fSjI6xR/ncvxWqWhixjpL8Os39mWcCcmgA0QaqVzu2k
	sgD9Fj9zMRS1wGySPlVjIu3v7wTQf0fx3nWeZDh81Wq3yY+y6tHejkzR1hK0/LLkzvrw
	EQiQ==
MIME-Version: 1.0
Received: by 10.216.134.155 with SMTP id s27mr3574837wei.80.1330933131220;
	Sun, 04 Mar 2012 23:38:51 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id df3sm19101806wib.1.2012.03.04.23.38.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 04 Mar 2012 23:38:50 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Mar 2012 08:38:30 +0100
Message-Id: <1330933112-13510-2-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1330933112-13510-1-git-send-email-koen@dominion.thruhere.net>
References: <1330933112-13510-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQmGLzzF+swFpNOzGPfOnz0xXQcwWpUzZ4ca90ms2MFivHdNZfH+u+JIqemVUISNtWF4P5ys
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH v2 2/4] polkit 0.104: add 2 backports from upstream to fix crashes during auth
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 05 Mar 2012 07:47:25 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 ...ession-Set-error-if-we-cannot-find-a-sess.patch |   70 ++++++++++++++++++++
 ...ession-Actually-return-TRUE-if-a-session-.patch |   46 +++++++++++++
 meta/recipes-extended/polkit/polkit_0.104.bb       |    4 +-
 3 files changed, 119 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-extended/polkit/polkit-0.104/0001-PolkitUnixSession-Set-error-if-we-cannot-find-a-sess.patch
 create mode 100644 meta/recipes-extended/polkit/polkit-0.104/0002-PolkitUnixSession-Actually-return-TRUE-if-a-session-.patch

diff --git a/meta/recipes-extended/polkit/polkit-0.104/0001-PolkitUnixSession-Set-error-if-we-cannot-find-a-sess.patch b/meta/recipes-extended/polkit/polkit-0.104/0001-PolkitUnixSession-Set-error-if-we-cannot-find-a-sess.patch
new file mode 100644
index 0000000..aaa989e
--- /dev/null
+++ b/meta/recipes-extended/polkit/polkit-0.104/0001-PolkitUnixSession-Set-error-if-we-cannot-find-a-sess.patch
@@ -0,0 +1,70 @@
+From c46d2d13eac240d2a609b2dd8fc617ea18a78bfa Mon Sep 17 00:00:00 2001
+From: David Zeuthen <davidz@redhat.com>
+Date: Mon, 6 Feb 2012 11:24:53 -0500
+Subject: [PATCH 1/2] PolkitUnixSession: Set error if we cannot find a session for the given pid
+
+Also, don't treat the integer returned by sd_pid_get_session() as a
+boolean because that's just confusing. Also, don't confuse memory
+supposed to be freed by g_free() and free(3) with each other. See
+
+ https://bugzilla.redhat.com/show_bug.cgi?id=787222
+
+for more details.
+
+Signed-off-by: David Zeuthen <davidz@redhat.com>
+---
+
+Upstream-status: Accepted
+
+ src/polkit/polkitunixsession-systemd.c |   21 ++++++++++++++++-----
+ 1 files changed, 16 insertions(+), 5 deletions(-)
+
+diff --git a/src/polkit/polkitunixsession-systemd.c b/src/polkit/polkitunixsession-systemd.c
+index e7e913f..94a7ee4 100644
+--- a/src/polkit/polkitunixsession-systemd.c
++++ b/src/polkit/polkitunixsession-systemd.c
+@@ -23,6 +23,7 @@
+ #  include "config.h"
+ #endif
+ 
++#include <stdlib.h>
+ #include <string.h>
+ #include "polkitunixsession.h"
+ #include "polkitsubject.h"
+@@ -450,9 +451,8 @@ polkit_unix_session_initable_init (GInitable     *initable,
+                                    GError       **error)
+ {
+   PolkitUnixSession *session = POLKIT_UNIX_SESSION (initable);
+-  gboolean ret;
+-
+-  ret = FALSE;
++  gboolean ret = FALSE;
++  char *s;
+ 
+   if (session->session_id != NULL)
+     {
+@@ -461,8 +461,19 @@ polkit_unix_session_initable_init (GInitable     *initable,
+       goto out;
+     }
+ 
+-  if (!sd_pid_get_session (session->pid, &session->session_id))
+-    ret = TRUE;
++  if (sd_pid_get_session (session->pid, &s) == 0)
++    {
++      session->session_id = g_strdup (s);
++      free (s);
++      ret = TRUE;
++      goto out;
++    }
++
++  g_set_error (error,
++               POLKIT_ERROR,
++               POLKIT_ERROR_FAILED,
++               "No session for pid %d",
++               (gint) session->pid);
+ 
+ out:
+   return ret;
+-- 
+1.7.2.5
+
diff --git a/meta/recipes-extended/polkit/polkit-0.104/0002-PolkitUnixSession-Actually-return-TRUE-if-a-session-.patch b/meta/recipes-extended/polkit/polkit-0.104/0002-PolkitUnixSession-Actually-return-TRUE-if-a-session-.patch
new file mode 100644
index 0000000..3fdc731
--- /dev/null
+++ b/meta/recipes-extended/polkit/polkit-0.104/0002-PolkitUnixSession-Actually-return-TRUE-if-a-session-.patch
@@ -0,0 +1,46 @@
+From 8fb8b406bab50c5ef8c5d4f743e3f13924bd5f73 Mon Sep 17 00:00:00 2001
+From: David Zeuthen <davidz@redhat.com>
+Date: Mon, 6 Feb 2012 11:26:06 -0500
+Subject: [PATCH 2/2] PolkitUnixSession: Actually return TRUE if a session exists
+
+Also, don't treat the integer returned by sd_session_get_uid() as a
+boolean because that's just confusing.
+
+Signed-off-by: David Zeuthen <davidz@redhat.com>
+---
+
+Upstream-status: Accepted
+
+ src/polkit/polkitunixsession-systemd.c |   12 +++++-------
+ 1 files changed, 5 insertions(+), 7 deletions(-)
+
+diff --git a/src/polkit/polkitunixsession-systemd.c b/src/polkit/polkitunixsession-systemd.c
+index 94a7ee4..8a8bf65 100644
+--- a/src/polkit/polkitunixsession-systemd.c
++++ b/src/polkit/polkitunixsession-systemd.c
+@@ -361,17 +361,15 @@ polkit_unix_session_to_string (PolkitSubject *subject)
+ 
+ static gboolean
+ polkit_unix_session_exists_sync (PolkitSubject   *subject,
+-                                    GCancellable    *cancellable,
+-                                    GError         **error)
++                                 GCancellable    *cancellable,
++                                 GError         **error)
+ {
+   PolkitUnixSession *session = POLKIT_UNIX_SESSION (subject);
+-  gboolean ret;
++  gboolean ret = FALSE;
+   uid_t uid;
+ 
+-  ret = FALSE;
+-
+-  if (!sd_session_get_uid (session->session_id, &uid))
+-    ret = FALSE;
++  if (sd_session_get_uid (session->session_id, &uid) == 0)
++    ret = TRUE;
+ 
+   return ret;
+ }
+-- 
+1.7.2.5
+
diff --git a/meta/recipes-extended/polkit/polkit_0.104.bb b/meta/recipes-extended/polkit/polkit_0.104.bb
index 5dc82c5..dfbd300 100644
--- a/meta/recipes-extended/polkit/polkit_0.104.bb
+++ b/meta/recipes-extended/polkit/polkit_0.104.bb
@@ -11,12 +11,14 @@ DEPENDS = "expat dbus-glib eggdbus intltool-native"
 PACKAGECONFIG = "${@base_contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}"
 PACKAGECONFIG[pam] = "--with-authfw=pam,--with-authfw=none,libpam,libpam"
 
-PR = "r3"
+PR = "r4"
 
 PAM_SRC_URI = "file://polkit-1_pam.patch"
 SRC_URI = "http://hal.freedesktop.org/releases/polkit-${PV}.tar.gz \
            file://introspection.patch \
            ${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
+           file://0001-PolkitUnixSession-Set-error-if-we-cannot-find-a-sess.patch \
+           file://0002-PolkitUnixSession-Actually-return-TRUE-if-a-session-.patch \
           "
 
 SRC_URI[md5sum] = "e380b4c6fb1e7bccf854e92edc0a8ce1"
-- 
1.7.2.5



