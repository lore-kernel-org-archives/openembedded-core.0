Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69F9AC35FF6
	for <webhook@archiver.kernel.org>; Fri, 14 Mar 2025 14:10:35 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.15401.1741961425412615952
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Mar 2025 07:10:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=C4cg1TbE;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2232aead377so47385015ad.0
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Mar 2025 07:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1741961424; x=1742566224; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kElCm6tRMqNOX4jmaNGaiY/yGa0e4NW6rHDrEErZ+IE=;
        b=C4cg1TbEh9kVpz/DsS5OIAtWdtzBzufWbEMLxGqgYddkLsfrRDCABvCIQJrOEmqypk
         G8e9zZlnJBEc7gObaQMAAtf0ETMvuvqLZIeYcoTdX0MVhYNpL5J/YlSHsGDvL3cV27BM
         MHbWIdS53Pq/noFPqxAfrQFsRlHAb1Lbp7Ux9OguCyuv01Gbso1lqLu5eiFgQAzB+lEp
         ggpbVNkt+xyh8gxhOzk/w/I1kiNrc26Zd/ZmGEH6NWibo+oVc5/54cUhBbNDMQX+q16e
         u4sp0VhUkTgxnc3tkMXEjakkNm2Xv+qGkPAlmSWoJVduPAR71Lns7970Z00XstAw8ovP
         nZVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741961424; x=1742566224;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kElCm6tRMqNOX4jmaNGaiY/yGa0e4NW6rHDrEErZ+IE=;
        b=Fr4HBU6MCXYlNNYFFGx51zonEq26Zht9LwgxiCKJbmUkpoLGR/JhfR1jCx6fK2uKa3
         DLGUnoLFs8gV1SBfj71hx8bhoGSCs4Y0t8iNmVjnmWdZkzDXmouYyhv7dC2L3Vi9r35l
         i8DnFZTg+3ND5Y71cqjQ8RUf9McnTadlhHg1I3enUbQzaLaisGTJtdlXoihIwZi43Oow
         97R0ZdYgoyYga+UHXjHEmw5Tls6UppwlbrTW8a+US4U2W6Qe7ekJktJn7ZLTKtPNaLSw
         2c0TRv+jKQdlDPT5pkoZ9CaTwW7zFbzRDKpcJXQvPhYxeGfz2ermKQVwfInpCphTdHL2
         JLGA==
X-Gm-Message-State: AOJu0YzfAAkcoucF4yzHKw7rah9TmlfJGt+VIKqD74BpkkiaXOIIcExv
	GiLKgXdKkoZ4uoKtb/OMccuThZJT83bOKNM5uvI8yQJduXRgNz8rZAURiNvQoL2Suo6FfueUkTK
	8
X-Gm-Gg: ASbGncu2hPJE2dAa0HdYPeUF6pUoUdTMlBO1cHMQ77IKqvBb/zXVfPjSUCz8O/H99X+
	NAoJtg311G8bZiNCj2dgR3kkjpr48U3A65hDiEw/c1JAWgfstc+ONBkhabQe6vmrtQYbZPOuFA/
	9Nn6kx8/YskKClDEZpZe0P6tcWvqmb5VOx2MSnh4GCBDNRksbT7aBOvnj1Muq3O2UzhYGAcQilp
	DpddI0+xu/jbAzHOzHSEBTJk4KqvUDpUhNUgZk+rAvXnKHHxBdp8ASs9CtuuxNiLczLvwKFy5Xk
	YmQ2fvGZxCauvXUwJH2duHBvHte5SwuDcZ3g
X-Google-Smtp-Source: AGHT+IF/Bj/kfJ0UnPVsmVHaW4UQM7eu6nk8I1yPiod79yUuy1jFbL/Wx/a68xqcJuIEHjFmi2wbrw==
X-Received: by 2002:aa7:88d5:0:b0:732:a24:7354 with SMTP id d2e1a72fcca58-737223702c0mr3881917b3a.4.1741961423554;
        Fri, 14 Mar 2025 07:10:23 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:f60d:ac2a:8f85:c2ab])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73711559269sm3000774b3a.65.2025.03.14.07.10.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 07:10:23 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 4/7] grub: Fix multiple CVEs
Date: Fri, 14 Mar 2025 07:10:06 -0700
Message-ID: <5c4ee702f93f9bb4fcb557fd067242da16d63da2.1741961309.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1741961309.git.steve@sakoman.com>
References: <cover.1741961309.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Mar 2025 14:10:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212850

From: Hitendra Prajapati <hprajapati@mvista.com>

Backport fixes for :

* CVE-2025-0622 - Upstream-Status: Backport from https://git.savannah.gnu.org/cgit/grub.git/commit/?id=2123c5bca7e21fbeb0263df4597ddd7054700726 && https://git.savannah.gnu.org/cgit/grub.git/commit/?id=9c16197734ada8d0838407eebe081117799bfe67 && https://git.savannah.gnu.org/cgit/grub.git/commit/?id=7580addfc8c94cedb0cdfd7a1fd65b539215e637
* CVE-2025-0624 - Upstream-Status: Backport from https://git.savannah.gnu.org/cgit/grub.git/commit/?id=5eef88152833062a3f7e017535372d64ac8ef7e1
* CVE-2025-0677_CVE-2025-0684_CVE-2025-0685_CVE-2025-0686_CVE-2025-0689 - Upstream-Status: Backport from https://git.savannah.gnu.org/cgit/grub.git/commit/?id=47b2dfc7953f70f98ddf35dfdd6e7f4f20283b10
* CVE-2025-0678_CVE-2025-1125 - Upstream-Status: Backport from https://git.savannah.gnu.org/cgit/grub.git/commit/?id=84bc0a9a68835952ae69165c11709811dae7634e
* CVE-2025-0690 - Upstream-Status: Backport from https://git.savannah.gnu.org/cgit/grub.git/commit/?id=dad8f502974ed9ad0a70ae6820d17b4b142558fc
* CVE-2025-1118 - Upstream-Status: Backport from https://git.savannah.gnu.org/cgit/grub.git/commit/?id=34824806ac6302f91e8cabaa41308eaced25725f

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../grub/files/CVE-2025-0622-01.patch         |  39 ++
 .../grub/files/CVE-2025-0622-02.patch         |  44 ++
 .../grub/files/CVE-2025-0622-03.patch         |  41 ++
 .../grub/files/CVE-2025-0624.patch            |  87 ++++
 ...025-0685_CVE-2025-0686_CVE-2025-0689.patch | 380 ++++++++++++++++++
 .../files/CVE-2025-0678_CVE-2025-1125.patch   |  90 +++++
 .../grub/files/CVE-2025-0690.patch            |  75 ++++
 .../grub/files/CVE-2025-1118.patch            |  40 ++
 meta/recipes-bsp/grub/grub2.inc               |   8 +
 9 files changed, 804 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2025-0622-01.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2025-0622-02.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2025-0622-03.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2025-0624.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2025-0677_CVE-2025-0684_CVE-2025-0685_CVE-2025-0686_CVE-2025-0689.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2025-0678_CVE-2025-1125.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2025-0690.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2025-1118.patch

diff --git a/meta/recipes-bsp/grub/files/CVE-2025-0622-01.patch b/meta/recipes-bsp/grub/files/CVE-2025-0622-01.patch
new file mode 100644
index 0000000000..9b300c7224
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2025-0622-01.patch
@@ -0,0 +1,39 @@
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
+
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ grub-core/commands/pgp.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/grub-core/commands/pgp.c b/grub-core/commands/pgp.c
+index 5daa1e9..1abdea6 100644
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
+-- 
+2.25.1
+
diff --git a/meta/recipes-bsp/grub/files/CVE-2025-0622-02.patch b/meta/recipes-bsp/grub/files/CVE-2025-0622-02.patch
new file mode 100644
index 0000000000..17800dd7c4
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2025-0622-02.patch
@@ -0,0 +1,44 @@
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
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ grub-core/normal/main.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/grub-core/normal/main.c b/grub-core/normal/main.c
+index c4ebe9e..31c53a6 100644
+--- a/grub-core/normal/main.c
++++ b/grub-core/normal/main.c
+@@ -581,7 +581,9 @@ GRUB_MOD_FINI(normal)
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
+-- 
+2.25.1
+
diff --git a/meta/recipes-bsp/grub/files/CVE-2025-0622-03.patch b/meta/recipes-bsp/grub/files/CVE-2025-0622-03.patch
new file mode 100644
index 0000000000..c3147cdb1f
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2025-0622-03.patch
@@ -0,0 +1,41 @@
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
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ grub-core/gettext/gettext.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/grub-core/gettext/gettext.c b/grub-core/gettext/gettext.c
+index 85ea44a..7a25c9d 100644
+--- a/grub-core/gettext/gettext.c
++++ b/grub-core/gettext/gettext.c
+@@ -540,6 +540,10 @@ GRUB_MOD_INIT (gettext)
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
+-- 
+2.25.1
+
diff --git a/meta/recipes-bsp/grub/files/CVE-2025-0624.patch b/meta/recipes-bsp/grub/files/CVE-2025-0624.patch
new file mode 100644
index 0000000000..02f270a033
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2025-0624.patch
@@ -0,0 +1,87 @@
+From 5eef88152833062a3f7e017535372d64ac8ef7e1 Mon Sep 17 00:00:00 2001
+From: B Horn <b@horn.uk>
+Date: Fri, 15 Nov 2024 13:12:09 +0000
+Subject: [PATCH] net: Fix OOB write in grub_net_search_config_file()
+
+The function included a call to grub_strcpy() which copied data from an
+environment variable to a buffer allocated in grub_cmd_normal(). The
+grub_cmd_normal() didn't consider the length of the environment variable.
+So, the copy operation could exceed the allocation and lead to an OOB
+write. Fix the issue by replacing grub_strcpy() with grub_strlcpy() and
+pass the underlying buffers size to the grub_net_search_config_file().
+
+Fixes: CVE-2025-0624
+
+Reported-by: B Horn <b@horn.uk>
+Signed-off-by: B Horn <b@horn.uk>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+CVE: CVE-2025-0624
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=5eef88152833062a3f7e017535372d64ac8ef7e1]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ grub-core/net/net.c     | 7 ++++---
+ grub-core/normal/main.c | 2 +-
+ include/grub/net.h      | 2 +-
+ 3 files changed, 6 insertions(+), 5 deletions(-)
+
+diff --git a/grub-core/net/net.c b/grub-core/net/net.c
+index 4d3eb5c..ec7f01c 100644
+--- a/grub-core/net/net.c
++++ b/grub-core/net/net.c
+@@ -1773,14 +1773,15 @@ grub_config_search_through (char *config, char *suffix,
+ }
+ 
+ grub_err_t
+-grub_net_search_config_file (char *config)
++grub_net_search_config_file (char *config, grub_size_t config_buf_len)
+ {
+-  grub_size_t config_len;
++  grub_size_t config_len, suffix_len;
+   char *suffix;
+ 
+   config_len = grub_strlen (config);
+   config[config_len] = '-';
+   suffix = config + config_len + 1;
++  suffix_len = config_buf_len - (config_len + 1);
+ 
+   struct grub_net_network_level_interface *inf;
+   FOR_NET_NETWORK_LEVEL_INTERFACES (inf)
+@@ -1806,7 +1807,7 @@ grub_net_search_config_file (char *config)
+ 
+       if (client_uuid)
+         {
+-          grub_strcpy (suffix, client_uuid);
++          grub_strlcpy (suffix, client_uuid, suffix_len);
+           if (grub_config_search_through (config, suffix, 1, 0) == 0)
+             return GRUB_ERR_NONE;
+         }
+diff --git a/grub-core/normal/main.c b/grub-core/normal/main.c
+index 31c53a6..a95c25e 100644
+--- a/grub-core/normal/main.c
++++ b/grub-core/normal/main.c
+@@ -344,7 +344,7 @@ grub_cmd_normal (struct grub_command *cmd __attribute__ ((unused)),
+ 
+           if (grub_strncmp (prefix + 1, "tftp", sizeof ("tftp") - 1) == 0 &&
+               !disable_net_search)
+-            grub_net_search_config_file (config);
++            grub_net_search_config_file (config, config_len);
+ 
+ 	  grub_enter_normal_mode (config);
+ 	  grub_free (config);
+diff --git a/include/grub/net.h b/include/grub/net.h
+index 7ae4b6b..d6ba8b1 100644
+--- a/include/grub/net.h
++++ b/include/grub/net.h
+@@ -570,7 +570,7 @@ void
+ grub_net_remove_dns_server (const struct grub_net_network_level_address *s);
+ 
+ grub_err_t
+-grub_net_search_config_file (char *config);
++grub_net_search_config_file (char *config, grub_size_t config_buf_len);
+ 
+ extern char *grub_net_default_server;
+ 
+-- 
+2.25.1
+
diff --git a/meta/recipes-bsp/grub/files/CVE-2025-0677_CVE-2025-0684_CVE-2025-0685_CVE-2025-0686_CVE-2025-0689.patch b/meta/recipes-bsp/grub/files/CVE-2025-0677_CVE-2025-0684_CVE-2025-0685_CVE-2025-0686_CVE-2025-0689.patch
new file mode 100644
index 0000000000..f955611d9d
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2025-0677_CVE-2025-0684_CVE-2025-0685_CVE-2025-0686_CVE-2025-0689.patch
@@ -0,0 +1,380 @@
+From 47b2dfc7953f70f98ddf35dfdd6e7f4f20283b10 Mon Sep 17 00:00:00 2001
+From: Daniel Axtens <dja@axtens.net>
+Date: Sat, 23 Mar 2024 16:20:45 +1100
+Subject: [PATCH] fs: Disable many filesystems under lockdown
+
+The idea is to permit the following: btrfs, cpio, exfat, ext, f2fs, fat,
+hfsplus, iso9660, squash4, tar, xfs and zfs.
+
+The JFS, ReiserFS, romfs, UDF and UFS security vulnerabilities were
+reported by Jonathan Bar Or <jonathanbaror@gmail.com>.
+
+Fixes: CVE-2025-0677
+Fixes: CVE-2025-0684
+Fixes: CVE-2025-0685
+Fixes: CVE-2025-0686
+Fixes: CVE-2025-0689
+
+Suggested-by: Daniel Axtens <dja@axtens.net>
+Signed-off-by: Daniel Axtens <dja@axtens.net>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+CVE: CVE-2025-0677
+CVE: CVE-2025-0684
+CVE: CVE-2025-0685
+CVE: CVE-2025-0686
+CVE: CVE-2025-0689
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=47b2dfc7953f70f98ddf35dfdd6e7f4f20283b10]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ grub-core/fs/affs.c     | 9 +++++++--
+ grub-core/fs/cbfs.c     | 9 +++++++--
+ grub-core/fs/jfs.c      | 9 +++++++--
+ grub-core/fs/minix.c    | 9 +++++++--
+ grub-core/fs/nilfs2.c   | 9 +++++++--
+ grub-core/fs/ntfs.c     | 9 +++++++--
+ grub-core/fs/reiserfs.c | 9 +++++++--
+ grub-core/fs/romfs.c    | 9 +++++++--
+ grub-core/fs/sfs.c      | 9 +++++++--
+ grub-core/fs/udf.c      | 9 +++++++--
+ grub-core/fs/ufs.c      | 9 +++++++--
+ 11 files changed, 77 insertions(+), 22 deletions(-)
+
+diff --git a/grub-core/fs/affs.c b/grub-core/fs/affs.c
+index cafcd0f..d676532 100644
+--- a/grub-core/fs/affs.c
++++ b/grub-core/fs/affs.c
+@@ -26,6 +26,7 @@
+ #include <grub/types.h>
+ #include <grub/fshelp.h>
+ #include <grub/charset.h>
++#include <grub/lockdown.h>
+ 
+ GRUB_MOD_LICENSE ("GPLv3+");
+ 
+@@ -699,11 +700,15 @@ static struct grub_fs grub_affs_fs =
+ 
+ GRUB_MOD_INIT(affs)
+ {
+-  grub_fs_register (&grub_affs_fs);
++  if (!grub_is_lockdown ())
++    {
++      grub_fs_register (&grub_affs_fs);
++    }
+   my_mod = mod;
+ }
+ 
+ GRUB_MOD_FINI(affs)
+ {
+-  grub_fs_unregister (&grub_affs_fs);
++  if (!grub_is_lockdown ())
++    grub_fs_unregister (&grub_affs_fs);
+ }
+diff --git a/grub-core/fs/cbfs.c b/grub-core/fs/cbfs.c
+index 581215e..477a14e 100644
+--- a/grub-core/fs/cbfs.c
++++ b/grub-core/fs/cbfs.c
+@@ -26,6 +26,7 @@
+ #include <grub/dl.h>
+ #include <grub/i18n.h>
+ #include <grub/cbfs_core.h>
++#include <grub/lockdown.h>
+ 
+ GRUB_MOD_LICENSE ("GPLv3+");
+ 
+@@ -390,12 +391,16 @@ GRUB_MOD_INIT (cbfs)
+ #if (defined (__i386__) || defined (__x86_64__)) && !defined (GRUB_UTIL) && !defined (GRUB_MACHINE_EMU) && !defined (GRUB_MACHINE_XEN)
+   init_cbfsdisk ();
+ #endif
+-  grub_fs_register (&grub_cbfs_fs);
++  if (!grub_is_lockdown ())
++    {
++      grub_fs_register (&grub_cbfs_fs);
++    }
+ }
+ 
+ GRUB_MOD_FINI (cbfs)
+ {
+-  grub_fs_unregister (&grub_cbfs_fs);
++  if (!grub_is_lockdown ())
++    grub_fs_unregister (&grub_cbfs_fs);
+ #if (defined (__i386__) || defined (__x86_64__)) && !defined (GRUB_UTIL) && !defined (GRUB_MACHINE_EMU) && !defined (GRUB_MACHINE_XEN)
+   fini_cbfsdisk ();
+ #endif
+diff --git a/grub-core/fs/jfs.c b/grub-core/fs/jfs.c
+index 6f7c439..c0bbab8 100644
+--- a/grub-core/fs/jfs.c
++++ b/grub-core/fs/jfs.c
+@@ -26,6 +26,7 @@
+ #include <grub/types.h>
+ #include <grub/charset.h>
+ #include <grub/i18n.h>
++#include <grub/lockdown.h>
+ 
+ GRUB_MOD_LICENSE ("GPLv3+");
+ 
+@@ -963,11 +964,15 @@ static struct grub_fs grub_jfs_fs =
+ 
+ GRUB_MOD_INIT(jfs)
+ {
+-  grub_fs_register (&grub_jfs_fs);
++  if (!grub_is_lockdown ())
++    {
++      grub_fs_register (&grub_jfs_fs);
++    }
+   my_mod = mod;
+ }
+ 
+ GRUB_MOD_FINI(jfs)
+ {
+-  grub_fs_unregister (&grub_jfs_fs);
++  if (!grub_is_lockdown ())
++    grub_fs_unregister (&grub_jfs_fs);
+ }
+diff --git a/grub-core/fs/minix.c b/grub-core/fs/minix.c
+index 3cd18c8..7588835 100644
+--- a/grub-core/fs/minix.c
++++ b/grub-core/fs/minix.c
+@@ -25,6 +25,7 @@
+ #include <grub/dl.h>
+ #include <grub/types.h>
+ #include <grub/i18n.h>
++#include <grub/lockdown.h>
+ 
+ GRUB_MOD_LICENSE ("GPLv3+");
+ 
+@@ -732,7 +733,10 @@ GRUB_MOD_INIT(minix)
+ #endif
+ #endif
+ {
+-  grub_fs_register (&grub_minix_fs);
++  if (!grub_is_lockdown ())
++    {
++      grub_fs_register (&grub_minix_fs);
++    }
+   my_mod = mod;
+ }
+ 
+@@ -754,5 +758,6 @@ GRUB_MOD_FINI(minix)
+ #endif
+ #endif
+ {
+-  grub_fs_unregister (&grub_minix_fs);
++  if (!grub_is_lockdown ())
++    grub_fs_unregister (&grub_minix_fs);
+ }
+diff --git a/grub-core/fs/nilfs2.c b/grub-core/fs/nilfs2.c
+index 3c248a9..3f8e495 100644
+--- a/grub-core/fs/nilfs2.c
++++ b/grub-core/fs/nilfs2.c
+@@ -34,6 +34,7 @@
+ #include <grub/dl.h>
+ #include <grub/types.h>
+ #include <grub/fshelp.h>
++#include <grub/lockdown.h>
+ 
+ GRUB_MOD_LICENSE ("GPLv3+");
+ 
+@@ -1231,11 +1232,15 @@ GRUB_MOD_INIT (nilfs2)
+ 				  grub_nilfs2_dat_entry));
+   COMPILE_TIME_ASSERT (1 << LOG_INODE_SIZE
+ 		       == sizeof (struct grub_nilfs2_inode));
+-  grub_fs_register (&grub_nilfs2_fs);
++  if (!grub_is_lockdown ())
++    {
++      grub_fs_register (&grub_nilfs2_fs);
++    }
+   my_mod = mod;
+ }
+ 
+ GRUB_MOD_FINI (nilfs2)
+ {
+-  grub_fs_unregister (&grub_nilfs2_fs);
++  if (!grub_is_lockdown ())
++    grub_fs_unregister (&grub_nilfs2_fs);
+ }
+diff --git a/grub-core/fs/ntfs.c b/grub-core/fs/ntfs.c
+index 8f63c83..713e24d 100644
+--- a/grub-core/fs/ntfs.c
++++ b/grub-core/fs/ntfs.c
+@@ -27,6 +27,7 @@
+ #include <grub/fshelp.h>
+ #include <grub/ntfs.h>
+ #include <grub/charset.h>
++#include <grub/lockdown.h>
+ 
+ GRUB_MOD_LICENSE ("GPLv3+");
+ 
+@@ -1254,11 +1255,15 @@ static struct grub_fs grub_ntfs_fs =
+ 
+ GRUB_MOD_INIT (ntfs)
+ {
+-  grub_fs_register (&grub_ntfs_fs);
++  if (!grub_is_lockdown ())
++    {
++      grub_fs_register (&grub_ntfs_fs);
++    }
+   my_mod = mod;
+ }
+ 
+ GRUB_MOD_FINI (ntfs)
+ {
+-  grub_fs_unregister (&grub_ntfs_fs);
++  if (!grub_is_lockdown ())
++    grub_fs_unregister (&grub_ntfs_fs);
+ }
+diff --git a/grub-core/fs/reiserfs.c b/grub-core/fs/reiserfs.c
+index af6a226..76cb231 100644
+--- a/grub-core/fs/reiserfs.c
++++ b/grub-core/fs/reiserfs.c
+@@ -39,6 +39,7 @@
+ #include <grub/types.h>
+ #include <grub/fshelp.h>
+ #include <grub/i18n.h>
++#include <grub/lockdown.h>
+ 
+ GRUB_MOD_LICENSE ("GPLv3+");
+ 
+@@ -1417,11 +1418,15 @@ static struct grub_fs grub_reiserfs_fs =
+ 
+ GRUB_MOD_INIT(reiserfs)
+ {
+-  grub_fs_register (&grub_reiserfs_fs);
++  if (!grub_is_lockdown ())
++    {
++      grub_fs_register (&grub_reiserfs_fs);
++    }
+   my_mod = mod;
+ }
+ 
+ GRUB_MOD_FINI(reiserfs)
+ {
+-  grub_fs_unregister (&grub_reiserfs_fs);
++  if (!grub_is_lockdown ())
++    grub_fs_unregister (&grub_reiserfs_fs);
+ }
+diff --git a/grub-core/fs/romfs.c b/grub-core/fs/romfs.c
+index d97b8fb..d174449 100644
+--- a/grub-core/fs/romfs.c
++++ b/grub-core/fs/romfs.c
+@@ -23,6 +23,7 @@
+ #include <grub/disk.h>
+ #include <grub/fs.h>
+ #include <grub/fshelp.h>
++#include <grub/lockdown.h>
+ 
+ GRUB_MOD_LICENSE ("GPLv3+");
+ 
+@@ -475,10 +476,14 @@ static struct grub_fs grub_romfs_fs =
+ 
+ GRUB_MOD_INIT(romfs)
+ {
+-  grub_fs_register (&grub_romfs_fs);
++  if (!grub_is_lockdown ())
++    {
++      grub_fs_register (&grub_romfs_fs);
++    }
+ }
+ 
+ GRUB_MOD_FINI(romfs)
+ {
+-  grub_fs_unregister (&grub_romfs_fs);
++  if (!grub_is_lockdown ())
++    grub_fs_unregister (&grub_romfs_fs);
+ }
+diff --git a/grub-core/fs/sfs.c b/grub-core/fs/sfs.c
+index 983e880..f64bdd2 100644
+--- a/grub-core/fs/sfs.c
++++ b/grub-core/fs/sfs.c
+@@ -26,6 +26,7 @@
+ #include <grub/types.h>
+ #include <grub/fshelp.h>
+ #include <grub/charset.h>
++#include <grub/lockdown.h>
+ #include <grub/safemath.h>
+ 
+ GRUB_MOD_LICENSE ("GPLv3+");
+@@ -779,11 +780,15 @@ static struct grub_fs grub_sfs_fs =
+ 
+ GRUB_MOD_INIT(sfs)
+ {
+-  grub_fs_register (&grub_sfs_fs);
++  if (!grub_is_lockdown ())
++    {
++      grub_fs_register (&grub_sfs_fs);
++    }
+   my_mod = mod;
+ }
+ 
+ GRUB_MOD_FINI(sfs)
+ {
+-  grub_fs_unregister (&grub_sfs_fs);
++  if (!grub_is_lockdown ())
++    grub_fs_unregister (&grub_sfs_fs);
+ }
+diff --git a/grub-core/fs/udf.c b/grub-core/fs/udf.c
+index 2ac5c1d..f89c6b0 100644
+--- a/grub-core/fs/udf.c
++++ b/grub-core/fs/udf.c
+@@ -27,6 +27,7 @@
+ #include <grub/fshelp.h>
+ #include <grub/charset.h>
+ #include <grub/datetime.h>
++#include <grub/lockdown.h>
+ #include <grub/udf.h>
+ #include <grub/safemath.h>
+ 
+@@ -1382,11 +1383,15 @@ static struct grub_fs grub_udf_fs = {
+ 
+ GRUB_MOD_INIT (udf)
+ {
+-  grub_fs_register (&grub_udf_fs);
++  if (!grub_is_lockdown ())
++    {
++      grub_fs_register (&grub_udf_fs);
++    }
+   my_mod = mod;
+ }
+ 
+ GRUB_MOD_FINI (udf)
+ {
+-  grub_fs_unregister (&grub_udf_fs);
++  if (!grub_is_lockdown ())
++    grub_fs_unregister (&grub_udf_fs);
+ }
+diff --git a/grub-core/fs/ufs.c b/grub-core/fs/ufs.c
+index 4727266..90fda07 100644
+--- a/grub-core/fs/ufs.c
++++ b/grub-core/fs/ufs.c
+@@ -25,6 +25,7 @@
+ #include <grub/dl.h>
+ #include <grub/types.h>
+ #include <grub/i18n.h>
++#include <grub/lockdown.h>
+ 
+ GRUB_MOD_LICENSE ("GPLv3+");
+ 
+@@ -899,7 +900,10 @@ GRUB_MOD_INIT(ufs1)
+ #endif
+ #endif
+ {
+-  grub_fs_register (&grub_ufs_fs);
++  if (!grub_is_lockdown ())
++    {
++      grub_fs_register (&grub_ufs_fs);
++    }
+   my_mod = mod;
+ }
+ 
+@@ -913,6 +917,7 @@ GRUB_MOD_FINI(ufs1)
+ #endif
+ #endif
+ {
+-  grub_fs_unregister (&grub_ufs_fs);
++  if (!grub_is_lockdown ())
++    grub_fs_unregister (&grub_ufs_fs);
+ }
+ 
+-- 
+2.25.1
+
diff --git a/meta/recipes-bsp/grub/files/CVE-2025-0678_CVE-2025-1125.patch b/meta/recipes-bsp/grub/files/CVE-2025-0678_CVE-2025-1125.patch
new file mode 100644
index 0000000000..5e06a64969
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2025-0678_CVE-2025-1125.patch
@@ -0,0 +1,90 @@
+From 84bc0a9a68835952ae69165c11709811dae7634e Mon Sep 17 00:00:00 2001
+From: Lidong Chen <lidong.chen@oracle.com>
+Date: Tue, 21 Jan 2025 19:02:37 +0000
+Subject: [PATCH] fs: Prevent overflows when allocating memory for arrays
+
+Use grub_calloc() when allocating memory for arrays to ensure proper
+overflow checks are in place.
+
+The HFS+ and squash4 security vulnerabilities were reported by
+Jonathan Bar Or <jonathanbaror@gmail.com>.
+
+Fixes: CVE-2025-0678
+Fixes: CVE-2025-1125
+
+Signed-off-by: Lidong Chen <lidong.chen@oracle.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+CVE: CVE-2025-0678
+CVE: CVE-2025-1125
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=84bc0a9a68835952ae69165c11709811dae7634e]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ grub-core/fs/btrfs.c       | 4 ++--
+ grub-core/fs/hfspluscomp.c | 9 +++++++--
+ grub-core/fs/squash4.c     | 8 ++++----
+ 3 files changed, 13 insertions(+), 8 deletions(-)
+
+diff --git a/grub-core/fs/btrfs.c b/grub-core/fs/btrfs.c
+index 6320303..3b8b2f0 100644
+--- a/grub-core/fs/btrfs.c
++++ b/grub-core/fs/btrfs.c
+@@ -1197,8 +1197,8 @@ grub_btrfs_mount (grub_device_t dev)
+     }
+ 
+   data->n_devices_allocated = 16;
+-  data->devices_attached = grub_malloc (sizeof (data->devices_attached[0])
+-					* data->n_devices_allocated);
++  data->devices_attached = grub_calloc (data->n_devices_allocated,
++					sizeof (data->devices_attached[0]));
+   if (!data->devices_attached)
+     {
+       grub_free (data);
+diff --git a/grub-core/fs/hfspluscomp.c b/grub-core/fs/hfspluscomp.c
+index d76f3f1..4965ef1 100644
+--- a/grub-core/fs/hfspluscomp.c
++++ b/grub-core/fs/hfspluscomp.c
+@@ -244,14 +244,19 @@ hfsplus_open_compressed_real (struct grub_hfsplus_file *node)
+ 	  return 0;
+ 	}
+       node->compress_index_size = grub_le_to_cpu32 (index_size);
+-      node->compress_index = grub_malloc (node->compress_index_size
+-					  * sizeof (node->compress_index[0]));
++      node->compress_index = grub_calloc (node->compress_index_size,
++					  sizeof (node->compress_index[0]));
+       if (!node->compress_index)
+ 	{
+ 	  node->compressed = 0;
+ 	  grub_free (attr_node);
+ 	  return grub_errno;
+ 	}
++
++      /*
++       * The node->compress_index_size * sizeof (node->compress_index[0]) is safe here
++       * due to relevant checks done in grub_calloc() above.
++       */
+       if (grub_hfsplus_read_file (node, 0, 0,
+ 				  0x104 + sizeof (index_size),
+ 				  node->compress_index_size
+diff --git a/grub-core/fs/squash4.c b/grub-core/fs/squash4.c
+index 6dd731e..f79fc75 100644
+--- a/grub-core/fs/squash4.c
++++ b/grub-core/fs/squash4.c
+@@ -804,10 +804,10 @@ direct_read (struct grub_squash_data *data,
+ 	  break;
+ 	}
+       total_blocks = ((total_size + data->blksz - 1) >> data->log2_blksz);
+-      ino->block_sizes = grub_malloc (total_blocks
+-				      * sizeof (ino->block_sizes[0]));
+-      ino->cumulated_block_sizes = grub_malloc (total_blocks
+-						* sizeof (ino->cumulated_block_sizes[0]));
++      ino->block_sizes = grub_calloc (total_blocks,
++				      sizeof (ino->block_sizes[0]));
++      ino->cumulated_block_sizes = grub_calloc (total_blocks,
++						sizeof (ino->cumulated_block_sizes[0]));
+       if (!ino->block_sizes || !ino->cumulated_block_sizes)
+ 	{
+ 	  grub_free (ino->block_sizes);
+-- 
+2.25.1
+
diff --git a/meta/recipes-bsp/grub/files/CVE-2025-0690.patch b/meta/recipes-bsp/grub/files/CVE-2025-0690.patch
new file mode 100644
index 0000000000..9a2ca50d02
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2025-0690.patch
@@ -0,0 +1,75 @@
+From dad8f502974ed9ad0a70ae6820d17b4b142558fc Mon Sep 17 00:00:00 2001
+From: Jonathan Bar Or <jonathanbaror@gmail.com>
+Date: Thu, 23 Jan 2025 19:17:05 +0100
+Subject: [PATCH] commands/read: Fix an integer overflow when supplying more
+ than 2^31 characters
+
+The grub_getline() function currently has a signed integer variable "i"
+that can be overflown when user supplies more than 2^31 characters.
+It results in a memory corruption of the allocated line buffer as well
+as supplying large negative values to grub_realloc().
+
+Fixes: CVE-2025-0690
+
+Reported-by: Jonathan Bar Or <jonathanbaror@gmail.com>
+Signed-off-by: Jonathan Bar Or <jonathanbaror@gmail.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+CVE: CVE-2025-0690
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=dad8f502974ed9ad0a70ae6820d17b4b142558fc]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ grub-core/commands/read.c | 19 +++++++++++++++----
+ 1 file changed, 15 insertions(+), 4 deletions(-)
+
+diff --git a/grub-core/commands/read.c b/grub-core/commands/read.c
+index fe3e88b..f3ff826 100644
+--- a/grub-core/commands/read.c
++++ b/grub-core/commands/read.c
+@@ -25,19 +25,21 @@
+ #include <grub/types.h>
+ #include <grub/command.h>
+ #include <grub/i18n.h>
++#include <grub/safemath.h>
+ 
+ GRUB_MOD_LICENSE ("GPLv3+");
+ 
+ static char *
+ grub_getline (void)
+ {
+-  int i;
++  grub_size_t i;
+   char *line;
+   char *tmp;
+   char c;
++  grub_size_t alloc_size;
+ 
+   i = 0;
+-  line = grub_malloc (1 + i + sizeof('\0'));
++  line = grub_malloc (1 + sizeof('\0'));
+   if (! line)
+     return NULL;
+ 
+@@ -50,8 +52,17 @@ grub_getline (void)
+       line[i] = c;
+       if (grub_isprint (c))
+ 	grub_printf ("%c", c);
+-      i++;
+-      tmp = grub_realloc (line, 1 + i + sizeof('\0'));
++      if (grub_add (i, 1, &i))
++        {
++          grub_error (GRUB_ERR_OUT_OF_RANGE, N_("overflow is detected"));
++          return NULL;
++        }
++      if (grub_add (i, 1 + sizeof('\0'), &alloc_size))
++        {
++          grub_error (GRUB_ERR_OUT_OF_RANGE, N_("overflow is detected"));
++          return NULL;
++        }
++      tmp = grub_realloc (line, alloc_size);
+       if (! tmp)
+ 	{
+ 	  grub_free (line);
+-- 
+2.25.1
+
diff --git a/meta/recipes-bsp/grub/files/CVE-2025-1118.patch b/meta/recipes-bsp/grub/files/CVE-2025-1118.patch
new file mode 100644
index 0000000000..e26b5c8752
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2025-1118.patch
@@ -0,0 +1,40 @@
+From 34824806ac6302f91e8cabaa41308eaced25725f Mon Sep 17 00:00:00 2001
+From: B Horn <b@horn.uk>
+Date: Thu, 18 Apr 2024 20:29:39 +0100
+Subject: [PATCH] commands/minicmd: Block the dump command in lockdown mode
+
+The dump enables a user to read memory which should not be possible
+in lockdown mode.
+
+Fixes: CVE-2025-1118
+
+Reported-by: B Horn <b@horn.uk>
+Reported-by: Jonathan Bar Or <jonathanbaror@gmail.com>
+Signed-off-by: B Horn <b@horn.uk>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+CVE: CVE-2025-1118
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=34824806ac6302f91e8cabaa41308eaced25725f]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ grub-core/commands/minicmd.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/grub-core/commands/minicmd.c b/grub-core/commands/minicmd.c
+index fa49893..903af33 100644
+--- a/grub-core/commands/minicmd.c
++++ b/grub-core/commands/minicmd.c
+@@ -203,8 +203,8 @@ GRUB_MOD_INIT(minicmd)
+     grub_register_command ("help", grub_mini_cmd_help,
+ 			   0, N_("Show this message."));
+   cmd_dump =
+-    grub_register_command ("dump", grub_mini_cmd_dump,
+-			   N_("ADDR [SIZE]"), N_("Show memory contents."));
++    grub_register_command_lockdown ("dump", grub_mini_cmd_dump,
++				    N_("ADDR [SIZE]"), N_("Show memory contents."));
+   cmd_rmmod =
+     grub_register_command ("rmmod", grub_mini_cmd_rmmod,
+ 			   N_("MODULE"), N_("Remove a module."));
+-- 
+2.25.1
+
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 259a0a4c3d..cb61080aeb 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -51,6 +51,14 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://CVE-2024-45781.patch \
            file://CVE-2024-45782_CVE-2024-56737.patch \
            file://CVE-2024-45783.patch \
+           file://CVE-2025-0622-01.patch \
+           file://CVE-2025-0622-02.patch \
+           file://CVE-2025-0622-03.patch \
+           file://CVE-2025-0624.patch \
+           file://CVE-2025-0677_CVE-2025-0684_CVE-2025-0685_CVE-2025-0686_CVE-2025-0689.patch \
+           file://CVE-2025-0678_CVE-2025-1125.patch \
+           file://CVE-2025-0690.patch \
+           file://CVE-2025-1118.patch \
 "
 
 SRC_URI[sha256sum] = "23b64b4c741569f9426ed2e3d0e6780796fca081bee4c99f62aa3f53ae803f5f"
-- 
2.43.0


