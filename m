Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFD9AC28B2F
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 18:15:42 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web11.17570.1741716940131801874
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Mar 2025 11:15:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=c9wHdOR+;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-202503111815385f1bd987ccfd553587-wv4lf9@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 202503111815385f1bd987ccfd553587
        for <openembedded-core@lists.openembedded.org>;
        Tue, 11 Mar 2025 19:15:38 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=QgVT5RpJ1m6qg7wycfQWOrssh27xHfaIfadWYVG0/PU=;
 b=c9wHdOR+/g9yEKKraqP7fx+Gtd9TSUgaq9Rp8B3oXhX5LmVC6UPMNjlAdxcnbOpwYoyWcu
 ptAy9OYyxs6WkBIKOhBb9ZvEUPy7mAnkEwyWpr+JZ1BuA3gITtAbnl+gsgt2h495atNBxyza
 3+9+WIhvKIznyevXcd5XxHAeOaLjDM1hnWMKbQO4YS9xHqhCh+0UHUxCy8XpCcx+PJpf15lf
 R6iISCqCW6newIC99TbjxCH0v3lScgLa0BCeuxO5fLJfKasPjDAUHF+COsJYlKU31CWiaEml
 HMs3Hhrxj0UeFWhiaRYJzHOznw368t7mnGVehGiLlEMQOYrQWFNz8MJA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][styhead][PATCH 10/17] grub: patch CVE-2025-0622
Date: Tue, 11 Mar 2025 19:14:17 +0100
Message-Id: <20250311181424.8837-10-peter.marko@siemens.com>
In-Reply-To: <20250311181424.8837-1-peter.marko@siemens.com>
References: <20250311181424.8837-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Mar 2025 18:15:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212604

From: Peter Marko <peter.marko@siemens.com>

Cherry-pick patch mentioning this CVE.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../grub/files/CVE-2025-0622-01.patch         | 35 ++++++++++++++++
 .../grub/files/CVE-2025-0622-02.patch         | 41 +++++++++++++++++++
 .../grub/files/CVE-2025-0622-03.patch         | 38 +++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  3 ++
 4 files changed, 117 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2025-0622-01.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2025-0622-02.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2025-0622-03.patch

diff --git a/meta/recipes-bsp/grub/files/CVE-2025-0622-01.patch b/meta/recipes-bsp/grub/files/CVE-2025-0622-01.patch
new file mode 100644
index 0000000000..09dbfce5f8
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2025-0622-01.patch
@@ -0,0 +1,35 @@
+From 2123c5bca7e21fbeb0263df4597ddd7054700726 Mon Sep 17 00:00:00 2001
+From: B Horn <b@horn.uk>
+Date: Fri, 1 Nov 2024 19:24:29 +0000
+Subject: [PATCH 1/3] commands/pgp: Unregister the "check_signatures" hooks on
+ module unload
+
+If the hooks are not removed they can be called after the module has
+been unloaded leading to an use-after-free.
+
+Fixes: CVE-2025-0622
+
+Reported-by: B Horn <b@horn.uk>
+Signed-off-by: B Horn <b@horn.uk>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+CVE: CVE-2025-0622
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=2123c5bca7e21fbeb0263df4597ddd7054700726]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ grub-core/commands/pgp.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/grub-core/commands/pgp.c b/grub-core/commands/pgp.c
+index c6766f044..5fadc33c4 100644
+--- a/grub-core/commands/pgp.c
++++ b/grub-core/commands/pgp.c
+@@ -1010,6 +1010,8 @@ GRUB_MOD_INIT(pgp)
+ 
+ GRUB_MOD_FINI(pgp)
+ {
++  grub_register_variable_hook ("check_signatures", NULL, NULL);
++  grub_env_unset ("check_signatures");
+   grub_verifier_unregister (&grub_pubkey_verifier);
+   grub_unregister_extcmd (cmd);
+   grub_unregister_extcmd (cmd_trust);
diff --git a/meta/recipes-bsp/grub/files/CVE-2025-0622-02.patch b/meta/recipes-bsp/grub/files/CVE-2025-0622-02.patch
new file mode 100644
index 0000000000..be01da3355
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2025-0622-02.patch
@@ -0,0 +1,41 @@
+From 9c16197734ada8d0838407eebe081117799bfe67 Mon Sep 17 00:00:00 2001
+From: B Horn <b@horn.uk>
+Date: Fri, 1 Nov 2024 23:46:55 +0000
+Subject: [PATCH 2/3] normal: Remove variables hooks on module unload
+
+The normal module does not entirely cleanup after itself in
+its GRUB_MOD_FINI() leaving a few variables hooks in place.
+It is not possible to unload normal module now but fix the
+issues for completeness.
+
+On the occasion replace 0s with NULLs for "pager" variable
+hooks unregister.
+
+Fixes: CVE-2025-0622
+
+Reported-by: B Horn <b@horn.uk>
+Signed-off-by: B Horn <b@horn.uk>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+CVE: CVE-2025-0622
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=9c16197734ada8d0838407eebe081117799bfe67]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ grub-core/normal/main.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/grub-core/normal/main.c b/grub-core/normal/main.c
+index 838f57fa5..04d058f55 100644
+--- a/grub-core/normal/main.c
++++ b/grub-core/normal/main.c
+@@ -582,7 +582,9 @@ GRUB_MOD_FINI(normal)
+   grub_xputs = grub_xputs_saved;
+ 
+   grub_set_history (0);
+-  grub_register_variable_hook ("pager", 0, 0);
++  grub_register_variable_hook ("pager", NULL, NULL);
++  grub_register_variable_hook ("color_normal", NULL, NULL);
++  grub_register_variable_hook ("color_highlight", NULL, NULL);
+   grub_fs_autoload_hook = 0;
+   grub_unregister_command (cmd_clear);
+ }
diff --git a/meta/recipes-bsp/grub/files/CVE-2025-0622-03.patch b/meta/recipes-bsp/grub/files/CVE-2025-0622-03.patch
new file mode 100644
index 0000000000..79078a4350
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2025-0622-03.patch
@@ -0,0 +1,38 @@
+From 7580addfc8c94cedb0cdfd7a1fd65b539215e637 Mon Sep 17 00:00:00 2001
+From: B Horn <b@horn.uk>
+Date: Fri, 1 Nov 2024 23:52:06 +0000
+Subject: [PATCH 3/3] gettext: Remove variables hooks on module unload
+
+The gettext module does not entirely cleanup after itself in
+its GRUB_MOD_FINI() leaving a few variables hooks in place.
+It is not possible to unload gettext module because normal
+module depends on it. Though fix the issues for completeness.
+
+Fixes: CVE-2025-0622
+
+Reported-by: B Horn <b@horn.uk>
+Signed-off-by: B Horn <b@horn.uk>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+CVE: CVE-2025-0622
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=7580addfc8c94cedb0cdfd7a1fd65b539215e637]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ grub-core/gettext/gettext.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/grub-core/gettext/gettext.c b/grub-core/gettext/gettext.c
+index 7a1c14e4f..e4f4f8ee6 100644
+--- a/grub-core/gettext/gettext.c
++++ b/grub-core/gettext/gettext.c
+@@ -535,6 +535,10 @@ GRUB_MOD_INIT (gettext)
+ 
+ GRUB_MOD_FINI (gettext)
+ {
++  grub_register_variable_hook ("locale_dir", NULL, NULL);
++  grub_register_variable_hook ("secondary_locale_dir", NULL, NULL);
++  grub_register_variable_hook ("lang", NULL, NULL);
++
+   grub_gettext_delete_list (&main_context);
+   grub_gettext_delete_list (&secondary_context);
+ 
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index b9b9d37637..7d463f8aeb 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -26,6 +26,9 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://CVE-2025-0624.patch \
            file://CVE-2024-45774.patch \
            file://CVE-2024-45775.patch \
+           file://CVE-2025-0622-01.patch \
+           file://CVE-2025-0622-02.patch \
+           file://CVE-2025-0622-03.patch \
 "
 
 SRC_URI[sha256sum] = "b30919fa5be280417c17ac561bb1650f60cfb80cc6237fa1e2b6f56154cb9c91"

