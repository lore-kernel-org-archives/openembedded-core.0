Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75F13D2502B
	for <webhook@archiver.kernel.org>; Sat, 10 Jan 2026 23:13:22 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1054.1768086797706540584
 for <openembedded-core@lists.openembedded.org>;
 Sat, 10 Jan 2026 15:13:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=CM3g+qko;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-2026011023131457b2cf872900020733-rtpu1y@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 2026011023131457b2cf872900020733
        for <openembedded-core@lists.openembedded.org>;
        Sun, 11 Jan 2026 00:13:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=g8dFu4ZtvULy1GjUs43Q6Tjg7NYZX90n9xmOfN2zeh0=;
 b=CM3g+qkopLjLLRnlW1pMhkbIVp4RlJQGEXhbEqVlw9T19/CfYGNtRbSuhkzUKh0RXDmu/P
 89BrvqZdNfgbTiWz8YequLO1BEYWM/49T3Mul3+2Ao8VsS/SeuG7C3zypkBEHqN38qG+slf8
 ZtPu5vm9nb0FzYPWujMSCIaB9ILRYH2agnPgWnJSFESAdcxDHvsq1vSP5TLg5ijtZ8KkUk4x
 rSnhcYxEesxDdt2ei7kGtGuEyUUGH+OMowjmSWxY9zTvfLPqN8dIv9ErODuLrbA3zcs1ZOv5
 P2qGKc+i0ScWki+ai26Nid37f5zWpdjjBAa5pq8s3PFBDV4MKQhL1dzw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Jiaying Song <jiaying.song.cn@windriver.com>,
	Steve Sakoman <steve@sakoman.com>,
	Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH] grub: fix CVE-2025-54770 CVE-2025-61661 CVE-2025-61662 CVE-2025-61663 CVE-2025-61664
Date: Sun, 11 Jan 2026 00:13:06 +0100
Message-Id: <20260110231306.598787-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 10 Jan 2026 23:13:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229171

From: Jiaying Song <jiaying.song.cn@windriver.com>

References:
https://nvd.nist.gov/vuln/detail/CVE-2025-54770
https://nvd.nist.gov/vuln/detail/CVE-2025-61661
https://nvd.nist.gov/vuln/detail/CVE-2025-61662
https://nvd.nist.gov/vuln/detail/CVE-2025-61663
https://nvd.nist.gov/vuln/detail/CVE-2025-61664

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../grub/files/CVE-2025-54770.patch           | 41 +++++++++++
 .../grub/files/CVE-2025-61661.patch           | 40 +++++++++++
 .../grub/files/CVE-2025-61662.patch           | 72 +++++++++++++++++++
 .../grub/files/CVE-2025-61663_61664.patch     | 64 +++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  4 ++
 5 files changed, 221 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2025-54770.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2025-61661.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2025-61662.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2025-61663_61664.patch

diff --git a/meta/recipes-bsp/grub/files/CVE-2025-54770.patch b/meta/recipes-bsp/grub/files/CVE-2025-54770.patch
new file mode 100644
index 0000000000..7df1d8534b
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2025-54770.patch
@@ -0,0 +1,41 @@
+From 80e0e9b2558c40fb108ae7a869362566eb4c1ead Mon Sep 17 00:00:00 2001
+From: Thomas Frauendorfer | Miray Software <tf@miray.de>
+Date: Fri, 9 May 2025 14:20:47 +0200
+Subject: [PATCH] net/net: Unregister net_set_vlan command on unload
+
+The commit 954c48b9c (net/net: Add net_set_vlan command) added command
+net_set_vlan to the net module. Unfortunately the commit only added the
+grub_register_command() call on module load but missed the
+grub_unregister_command() on unload. Let's fix this.
+
+Fixes: CVE-2025-54770
+Fixes: 954c48b9c (net/net: Add net_set_vlan command)
+
+CVE: CVE-2025-54770
+
+Upstream-Status: Backport
+[https://gitweb.git.savannah.gnu.org/gitweb/?p=grub.git;a=commit;h=10e58a14db20e17d1b6a39abe38df01fef98e29d]
+
+Reported-by: Thomas Frauendorfer | Miray Software <tf@miray.de>
+Signed-off-by: Thomas Frauendorfer | Miray Software <tf@miray.de>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
+---
+ grub-core/net/net.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/grub-core/net/net.c b/grub-core/net/net.c
+index 2b45c27d1..05f11be08 100644
+--- a/grub-core/net/net.c
++++ b/grub-core/net/net.c
+@@ -2080,6 +2080,7 @@ GRUB_MOD_FINI(net)
+   grub_unregister_command (cmd_deladdr);
+   grub_unregister_command (cmd_addroute);
+   grub_unregister_command (cmd_delroute);
++  grub_unregister_command (cmd_setvlan);
+   grub_unregister_command (cmd_lsroutes);
+   grub_unregister_command (cmd_lscards);
+   grub_unregister_command (cmd_lsaddr);
+-- 
+2.34.1
+
diff --git a/meta/recipes-bsp/grub/files/CVE-2025-61661.patch b/meta/recipes-bsp/grub/files/CVE-2025-61661.patch
new file mode 100644
index 0000000000..9f6cf68e4b
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2025-61661.patch
@@ -0,0 +1,40 @@
+From c24e11d87f8ee8cefd615e0c30eb71ff6149ee50 Mon Sep 17 00:00:00 2001
+From: Jamie <volticks@gmail.com>
+Date: Mon, 14 Jul 2025 09:52:59 +0100
+Subject: [PATCH 2/4] commands/usbtest: Use correct string length field
+
+An incorrect length field is used for buffer allocation. This leads to
+grub_utf16_to_utf8() receiving an incorrect/different length and possibly
+causing OOB write. This makes sure to use the correct length.
+
+Fixes: CVE-2025-61661
+
+CVE: CVE-2025-61661
+
+Upstream-Status: Backport
+[https://gitweb.git.savannah.gnu.org/gitweb/?p=grub.git;a=commit;h=549a9cc372fd0b96a4ccdfad0e12140476cc62a3]
+
+Reported-by: Jamie <volticks@gmail.com>
+Signed-off-by: Jamie <volticks@gmail.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
+---
+ grub-core/commands/usbtest.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/grub-core/commands/usbtest.c b/grub-core/commands/usbtest.c
+index 2c6d93fe6..8ef187a9a 100644
+--- a/grub-core/commands/usbtest.c
++++ b/grub-core/commands/usbtest.c
+@@ -99,7 +99,7 @@ grub_usb_get_string (grub_usb_device_t dev, grub_uint8_t index, int langid,
+       return GRUB_USB_ERR_NONE;
+     }
+ 
+-  *string = grub_malloc (descstr.length * 2 + 1);
++  *string = grub_malloc (descstrp->length * 2 + 1);
+   if (! *string)
+     {
+       grub_free (descstrp);
+-- 
+2.34.1
+
diff --git a/meta/recipes-bsp/grub/files/CVE-2025-61662.patch b/meta/recipes-bsp/grub/files/CVE-2025-61662.patch
new file mode 100644
index 0000000000..f04a52fe76
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2025-61662.patch
@@ -0,0 +1,72 @@
+From 498dc73aa661bb1cae4b06572b5cef154dcb1fb7 Mon Sep 17 00:00:00 2001
+From: Alec Brown <alec.r.brown@oracle.com>
+Date: Thu, 21 Aug 2025 21:14:06 +0000
+Subject: [PATCH 3/4] gettext/gettext: Unregister gettext command on module
+ unload
+
+When the gettext module is loaded, the gettext command is registered but
+isn't unregistered when the module is unloaded. We need to add a call to
+grub_unregister_command() when unloading the module.
+
+Fixes: CVE-2025-61662
+
+CVE: CVE-2025-61662
+
+Upstream-Status: Backport
+[https://gitweb.git.savannah.gnu.org/gitweb/?p=grub.git;a=commit;h=8ed78fd9f0852ab218cc1f991c38e5a229e43807]
+
+Reported-by: Alec Brown <alec.r.brown@oracle.com>
+Signed-off-by: Alec Brown <alec.r.brown@oracle.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
+---
+ grub-core/gettext/gettext.c | 19 ++++++++++++-------
+ 1 file changed, 12 insertions(+), 7 deletions(-)
+
+diff --git a/grub-core/gettext/gettext.c b/grub-core/gettext/gettext.c
+index 9ffc73428..edebed998 100644
+--- a/grub-core/gettext/gettext.c
++++ b/grub-core/gettext/gettext.c
+@@ -502,6 +502,8 @@ grub_cmd_translate (grub_command_t cmd __attribute__ ((unused)),
+   return 0;
+ }
+ 
++static grub_command_t cmd;
++
+ GRUB_MOD_INIT (gettext)
+ {
+   const char *lang;
+@@ -521,13 +523,14 @@ GRUB_MOD_INIT (gettext)
+   grub_register_variable_hook ("locale_dir", NULL, read_main);
+   grub_register_variable_hook ("secondary_locale_dir", NULL, read_secondary);
+ 
+-  grub_register_command_p1 ("gettext", grub_cmd_translate,
+-			    N_("STRING"),
+-			    /* TRANSLATORS: It refers to passing the string through gettext.
+-			       So it's "translate" in the same meaning as in what you're
+-			       doing now.
+-			     */
+-			    N_("Translates the string with the current settings."));
++  cmd = grub_register_command_p1 ("gettext", grub_cmd_translate,
++				  N_("STRING"),
++				  /*
++				   * TRANSLATORS: It refers to passing the string through gettext.
++				   * So it's "translate" in the same meaning as in what you're
++				   * doing now.
++				   */
++				  N_("Translates the string with the current settings."));
+ 
+   /* Reload .mo file information if lang changes.  */
+   grub_register_variable_hook ("lang", NULL, grub_gettext_env_write_lang);
+@@ -544,6 +547,8 @@ GRUB_MOD_FINI (gettext)
+   grub_register_variable_hook ("secondary_locale_dir", NULL, NULL);
+   grub_register_variable_hook ("lang", NULL, NULL);
+ 
++  grub_unregister_command (cmd);
++
+   grub_gettext_delete_list (&main_context);
+   grub_gettext_delete_list (&secondary_context);
+ 
+-- 
+2.34.1
+
diff --git a/meta/recipes-bsp/grub/files/CVE-2025-61663_61664.patch b/meta/recipes-bsp/grub/files/CVE-2025-61663_61664.patch
new file mode 100644
index 0000000000..bfc05008bf
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2025-61663_61664.patch
@@ -0,0 +1,64 @@
+From 8368c026562a72a005bea320cfde9fd7d62d3850 Mon Sep 17 00:00:00 2001
+From: Alec Brown <alec.r.brown@oracle.com>
+Date: Thu, 21 Aug 2025 21:14:07 +0000
+Subject: [PATCH 4/4] normal/main: Unregister commands on module unload
+
+When the normal module is loaded, the normal and normal_exit commands
+are registered but aren't unregistered when the module is unloaded. We
+need to add calls to grub_unregister_command() when unloading the module
+for these commands.
+
+Fixes: CVE-2025-61663
+Fixes: CVE-2025-61664
+
+CVE: CVE-2025-61663 CVE-2025-61664
+
+Upstream-Status: Backport
+[https://gitweb.git.savannah.gnu.org/gitweb/?p=grub.git;a=commit;h=05d3698b8b03eccc49e53491bbd75dba15f40917]
+
+Reported-by: Alec Brown <alec.r.brown@oracle.com>
+Signed-off-by: Alec Brown <alec.r.brown@oracle.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
+---
+ grub-core/normal/main.c | 12 +++++++-----
+ 1 file changed, 7 insertions(+), 5 deletions(-)
+
+diff --git a/grub-core/normal/main.c b/grub-core/normal/main.c
+index dad25e7d2..a810858c3 100644
+--- a/grub-core/normal/main.c
++++ b/grub-core/normal/main.c
+@@ -500,7 +500,7 @@ grub_mini_cmd_clear (struct grub_command *cmd __attribute__ ((unused)),
+   return 0;
+ }
+ 
+-static grub_command_t cmd_clear;
++static grub_command_t cmd_clear, cmd_normal, cmd_normal_exit;
+ 
+ static void (*grub_xputs_saved) (const char *str);
+ static const char *features[] = {
+@@ -542,10 +542,10 @@ GRUB_MOD_INIT(normal)
+   grub_env_export ("pager");
+ 
+   /* Register a command "normal" for the rescue mode.  */
+-  grub_register_command ("normal", grub_cmd_normal,
+-			 0, N_("Enter normal mode."));
+-  grub_register_command ("normal_exit", grub_cmd_normal_exit,
+-			 0, N_("Exit from normal mode."));
++  cmd_normal = grub_register_command ("normal", grub_cmd_normal,
++				      0, N_("Enter normal mode."));
++  cmd_normal_exit = grub_register_command ("normal_exit", grub_cmd_normal_exit,
++					   0, N_("Exit from normal mode."));
+ 
+   /* Reload terminal colors when these variables are written to.  */
+   grub_register_variable_hook ("color_normal", NULL, grub_env_write_color_normal);
+@@ -587,4 +587,6 @@ GRUB_MOD_FINI(normal)
+   grub_register_variable_hook ("color_highlight", NULL, NULL);
+   grub_fs_autoload_hook = 0;
+   grub_unregister_command (cmd_clear);
++  grub_unregister_command (cmd_normal);
++  grub_unregister_command (cmd_normal_exit);
+ }
+-- 
+2.34.1
+
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 5759fa06c2..125490183b 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -37,6 +37,10 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://CVE-2025-0677_CVE-2025-0684_CVE-2025-0685_CVE-2025-0686_CVE-2025-0689.patch \
            file://CVE-2025-0678_CVE-2025-1125.patch \
            file://CVE-2024-56738.patch \
+           file://CVE-2025-54770.patch \
+           file://CVE-2025-61661.patch \
+           file://CVE-2025-61662.patch \
+           file://CVE-2025-61663_61664.patch \
 "
 
 # remove at next version upgrade or when output changes

