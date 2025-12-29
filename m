Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C62FE92FFE
	for <webhook@archiver.kernel.org>; Mon, 29 Dec 2025 23:03:36 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.53748.1767049408933610705
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Dec 2025 15:03:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=BscTD7BY;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2a0b4320665so144618075ad.1
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Dec 2025 15:03:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1767049408; x=1767654208; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GO7Zx9q64s01R+w7u2kj9S1QdESFbZvggeqfdZXt+Tc=;
        b=BscTD7BY7FlLp1rrxzo/tcqOssKqD6k4MYyBa+1KznspWXUePCS6ZC8Q221KvdvCV9
         dHtNFvzCyR7omLyHk58MF9s/9pzqHs8C1T3NDQ63IoPO0X0OOADeNuVU8e13zmFmEQYs
         lts+b33/cheLmS4+SPD7SJXwRINn0cw2dvMStT280pnrVoGiThK7u/OFg1K3gGjY+4Mh
         bjfJFLbGhHl4Ll4FsBlM/YWqsZrtti7LUl9m/2L//lz2frrzU6M1ObYOUiGJhFuWcyir
         Bf5eTN4k3vb5cF32kIzMjfRNYS7geSFzsoQAnGx2MsIDtXBmpAcss5dE3ZpG6pzkLKpy
         /iAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767049408; x=1767654208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GO7Zx9q64s01R+w7u2kj9S1QdESFbZvggeqfdZXt+Tc=;
        b=D3p7JjVym0ya9oJBhDNywZ0SxWjAN/6PZIywwI1RPkl6O4cFTcz1nfaWL1tKxrVtxj
         /BYxmUiLBxrt71yQdHZOp72MQe3k1Qq1NiCPp1buE1a2Z84bHcmINLhSMbF/LIjxG/Rk
         h5UUPqE/bG9nBNpGXjaBHTlijULH/bjoZ0yLKm1OicZ9aEtHLZ0PPUondIIJo+rwl1U9
         NYQdmLV1GEKyZ4t8dcySe4VBgjWewGBkUWRddiWDOSD8CCTEk6LuB3PWB660w0gNUlaZ
         OTUooIzoBFcfytZapXUw/WyGFzUleiE+94hwWihZtaZSVH06w20WHT7dkxGy6bpxvgDP
         n2Rg==
X-Gm-Message-State: AOJu0Yw0pfDE5nTs5LPhJJI9nje4jqnFszJNzqlvWmzyhTvWGWmCgGdz
	P5h31bgIP5DLwQI+FGfVO4Sd8uxxU1Sph8mMAbZTHzuzy2ykSRQBiEH0rdjCBI3XZD7piFDOZUJ
	ZnxHQ
X-Gm-Gg: AY/fxX4DojBmsBXcyLdvWgNTNoGmF67NdQlBYUXpe/1+IRPLxT1mFMvIAH6eEzKMHFu
	IgVsxqCTuRzSuwt0eQ+LpTPmFy2wmw9PDnu1TbxfcLmA9wPHaGOGc2JywfgVM7BPzZTmB+5XB2p
	35F8uOao72gQUvwQKKL7vtu42DVaAI1eX+Y813CdPQvbdqntfUzDvVXZ7DFz91pl8+iBxCJeJAT
	b7zzLIURxY9UCarLTFMmblF/IewzBjqnZUxBcvPE+ym78FECfe4ch8TmxtJmHVINoj2Gi2VPoaw
	Na43cmEY4YzxEu4Em5ddH35xLwVD0Qh5DazRN055EmA2Jg3Eq+k/gXz/Zf9IqE/UDB3C50FxIFo
	kaFCBIL6aVCIPDLQPc6Qp3oM5I4szF+zd1CVTYlq1a5GqWc/vsFWqbm5d+7b8kgj6XJKRZh2U2S
	ngag==
X-Google-Smtp-Source: AGHT+IFaJTfK5mhURbOLip0DU2Z5GQhnuqEnCKYzEmkVcykJ0KwhvHKnTrIjeLGiDb/mW7dAE3m6TA==
X-Received: by 2002:a17:902:ce92:b0:2a2:d066:b668 with SMTP id d9443c01a7336-2a2f222adc2mr259151975ad.12.1767049407930;
        Mon, 29 Dec 2025 15:03:27 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:c013:8f5c:baf3:22c3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c8d10esm277796855ad.42.2025.12.29.15.03.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 15:03:27 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 1/4] grub: fix CVE-2025-61661 CVE-2025-61662 CVE-2025-61663 CVE-2025-61664
Date: Mon, 29 Dec 2025 15:03:16 -0800
Message-ID: <f2031f39e423b764ccf4003bdee05f30d66fb7ce.1767048412.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1767048412.git.steve@sakoman.com>
References: <cover.1767048412.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Dec 2025 23:03:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228617

From: Jiaying Song <jiaying.song.cn@windriver.com>

References:
https://nvd.nist.gov/vuln/detail/CVE-2025-61661
https://nvd.nist.gov/vuln/detail/CVE-2025-61662
https://nvd.nist.gov/vuln/detail/CVE-2025-61663
https://nvd.nist.gov/vuln/detail/CVE-2025-61664

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../grub/files/CVE-2025-61661.patch           | 40 +++++++++++
 .../grub/files/CVE-2025-61662.patch           | 72 +++++++++++++++++++
 .../grub/files/CVE-2025-61663_61664.patch     | 64 +++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  3 +
 4 files changed, 179 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2025-61661.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2025-61662.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2025-61663_61664.patch

diff --git a/meta/recipes-bsp/grub/files/CVE-2025-61661.patch b/meta/recipes-bsp/grub/files/CVE-2025-61661.patch
new file mode 100644
index 0000000000..9ae4f3b307
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2025-61661.patch
@@ -0,0 +1,40 @@
+From 9c2ae73b549a653f5f1bd5d4edebc50a764bad06 Mon Sep 17 00:00:00 2001
+From: Jamie <volticks@gmail.com>
+Date: Mon, 14 Jul 2025 09:52:59 +0100
+Subject: [PATCH 1/3] commands/usbtest: Use correct string length field
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
index 0000000000..1614b00d53
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2025-61662.patch
@@ -0,0 +1,72 @@
+From c47760a907c91283bac9a8400d6975574b1d3986 Mon Sep 17 00:00:00 2001
+From: Alec Brown <alec.r.brown@oracle.com>
+Date: Thu, 21 Aug 2025 21:14:06 +0000
+Subject: [PATCH 2/3] gettext/gettext: Unregister gettext command on module
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
+index 7a25c9d67..ef1258ee0 100644
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
index 0000000000..cdf1e4ca36
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2025-61663_61664.patch
@@ -0,0 +1,64 @@
+From a182bd873e4aa93205ecbb7845ef7f0eda99dcf5 Mon Sep 17 00:00:00 2001
+From: Alec Brown <alec.r.brown@oracle.com>
+Date: Thu, 21 Aug 2025 21:14:07 +0000
+Subject: [PATCH 3/3] normal/main: Unregister commands on module unload
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
+index a95c25e5f..9d576de7a 100644
+--- a/grub-core/normal/main.c
++++ b/grub-core/normal/main.c
+@@ -499,7 +499,7 @@ grub_mini_cmd_clear (struct grub_command *cmd __attribute__ ((unused)),
+   return 0;
+ }
+ 
+-static grub_command_t cmd_clear;
++static grub_command_t cmd_clear, cmd_normal, cmd_normal_exit;
+ 
+ static void (*grub_xputs_saved) (const char *str);
+ static const char *features[] = {
+@@ -541,10 +541,10 @@ GRUB_MOD_INIT(normal)
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
+@@ -586,4 +586,6 @@ GRUB_MOD_FINI(normal)
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
index 94eeadfb99..4744e26693 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -60,6 +60,9 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://CVE-2025-0690.patch \
            file://CVE-2025-1118.patch \
            file://CVE-2024-56738.patch \
+           file://CVE-2025-61661.patch \
+           file://CVE-2025-61662.patch \
+           file://CVE-2025-61663_61664.patch \
 "
 
 SRC_URI[sha256sum] = "23b64b4c741569f9426ed2e3d0e6780796fca081bee4c99f62aa3f53ae803f5f"
-- 
2.43.0


