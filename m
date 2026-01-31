Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 540C9D79759
	for <webhook@archiver.kernel.org>; Sat, 31 Jan 2026 07:57:06 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5004.1769846218967127190
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Jan 2026 23:56:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=T08Ul2t9;
 spf=pass (domain: smile.fr, ip: 209.85.221.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-432d256c2e6so2453416f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Jan 2026 23:56:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1769846217; x=1770451017; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CvHKZCyij9Tx1SXn/Qq8GRIIyR5t6ek3Ea/2+8Aljvo=;
        b=T08Ul2t9kv/+2L4Kn6QO1vEsn8PA+UX96dN/Z3ilMGQ549e4tz+85LPhCbQVcap8zT
         Gqpaj6xbEqa8xXpTUjuKbCDtXxqgpcVxioU1DyHMAOpoh1ihd1+cKRNu/GY/EmTC8SNM
         GTbHqHzma4UTak98t6ofvConxsCYxRYT+TAsE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769846217; x=1770451017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CvHKZCyij9Tx1SXn/Qq8GRIIyR5t6ek3Ea/2+8Aljvo=;
        b=UceWaqm4N1d1KFnu1ty+FuhhzFfTX+hN8VzeulLKmW4g7VqI4aymd/6zm61YsBLnnS
         idCt698zIsbwe0Qxq1bMhq4jH36P1NW8N+yn5BzIiv8xQ8JID35poh+dBC+JufaxuW8W
         hQLAOSTpkzbXXV/8vVtL08EsMO2v88FPi4d7gk1Kv/syBGeXPDignU/N44rxdl5gzLp1
         zylLss9O9lJIG3rCFcjoxIodotRlXK1fDYy+YB6xyXlVSigbetOt8lrkdG3dD7Ua0tge
         bmjtBTIh4zzXp1DDiBbYJho+VuDxukzLnNWqicM+mKx1hgE5JRaV72PwLP4c0AE35v+c
         K2Gw==
X-Gm-Message-State: AOJu0Yz++thmTSIaBdu6JQSzVFfIMJiuILWCn93fNxpQ6x64qtYizt4B
	RHHIGCMlvLcc+ZU/yyBDRi6zOKWaRWSExYALpzV45Euyn23SMPCoaVlum00Tf9Ge6doqyps2pe7
	mdd9K1Ik=
X-Gm-Gg: AZuq6aJfrOx59tGrvYIiNsF2rR4/y7MiuAeGvvVsrrYbgM7bN+FNHqpCQRIL5O96Lqg
	sf2OhjAwdV9SzmVL3sQclSeGj4si8uq42r1mypLnrKKDlRYo2ewveqkzuwmjt9qsOh/yyOQhXb2
	d0GzPqp2PYaWPF8KGDJ4fCHgkCkMM0RX8iokgZlHCmMIxAljEsZztQmghclgyH5JQMYNe2Oq2X9
	+tSO3a2Bku+ze9VrnRs6SjxCFzXK0XhsnnvgbxhwfYv+VSZ6qrEuObHY+rhsy7PgNVYWl+pKzTN
	0cs1B34+BPmsxb5OH6A6wODn3cDiExwEZf4QZQDMvHld6VdAip0ovuXHlp/PHbPQzeS9Nz57APp
	IeqEyXqpCcCMWxCUXlObr3cv8kw4rOTBiS7sPe0lfkYoDD+EwnzyLDu3doZTAp9XMRwMqZdcqLI
	lrF5oNCqZLhq2XbkjxEHucMplylOS4H2sNauRyLlXDJe6dXtQjLCJzvmci+82ZQTvMW3x9EQOf/
	VD3HMbX44P60lNy
X-Received: by 2002:a05:600c:1388:b0:47e:e2ec:9960 with SMTP id 5b1f17b1804b1-482db49e83bmr80436405e9.35.1769846216996;
        Fri, 30 Jan 2026 23:56:56 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00fa8b238ae1dd6dd8.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:fa8b:238a:e1dd:6dd8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806ce564f9sm258621475e9.14.2026.01.30.23.56.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 23:56:56 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 04/22] grub: fix CVE-2025-54770 CVE-2025-61661 CVE-2025-61662 CVE-2025-61663 CVE-2025-61664
Date: Sat, 31 Jan 2026 08:56:15 +0100
Message-ID: <497bc29a9f95ea85e996572c28bcd43cdddd500a.1769845858.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1769845858.git.yoann.congal@smile.fr>
References: <cover.1769845858.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 31 Jan 2026 07:57:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230209

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
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e8ea34a3e891a8c9dac21ae8c5b6d2a97d9074a7)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
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
index 00000000000..7df1d8534b4
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
index 00000000000..9f6cf68e4bf
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
index 00000000000..f04a52fe76a
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
index 00000000000..bfc05008bfb
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
index 5759fa06c25..125490183b9 100644
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

