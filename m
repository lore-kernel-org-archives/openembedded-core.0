Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF8CDD35676
	for <webhook@archiver.kernel.org>; Wed, 28 Jan 2026 05:09:19 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6534.1769576951900926394
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jan 2026 21:09:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=VopKe1wg;
 spf=pass (domain: mvista.com, ip: 209.85.214.176, mailfrom: hprajapati@mvista.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2a871c8b171so9469155ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Jan 2026 21:09:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1769576951; x=1770181751; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GU/LgqO25NWLM3F0je5rZEt1D2XMaqO/u0lOaywSlc0=;
        b=VopKe1wgs6FgFZY+LVgZce3arhIaB/G584B9unxnK4aUO4BT4kula3L16EeYwoqOB3
         TI2IvHKAzlQVGY0J5kRRrgD4z8Alrp3v4e8/zTKamGQK1eaSJ71D9Kv1kIJxGaUuWYbp
         g+AguF1t7c/Wn6kcBY9hSPMqU1laoDoOVdjSQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769576951; x=1770181751;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GU/LgqO25NWLM3F0je5rZEt1D2XMaqO/u0lOaywSlc0=;
        b=E++TSONdOIN1gcarUU3ExRsZvvqDIM7BQO6qCdybfqNjcxQW/k0fNO+YBg46/EOdCq
         oXhBM5k7hzYqMRy95VSbX0bbyXXN6XQeQGHf5g3IRVqGUfomTUKFq/2Yx2bLGZfBa3EA
         PIm6lKpqYkjneFEP7OgS2Unj/JV+JDEHueEWMF8i5Fq4me7E6c/sQYDoda1AwGQYPKtp
         eB7sefBUJB+ZCV1xKicWY6n5YE/EwHUy963yNxK3vzyiXhPwA8bvtY/siIbVriImWIkA
         kZZm7tAhYiZv5zrKDftjKq3329SD76U9XEEHuFEcamNQ32Fb93X0waOnroNWD9yooZ0W
         xLHQ==
X-Gm-Message-State: AOJu0YwxqmlGcHara5tDOnJBu6lVLk7Nyf/IMETiTF8sLLVQlRA5r8/D
	KBjeVh/R9MH5/gzwjg14i8N7PcqwQf2d35lOGxM2nBfx8+zD2++tzExTyFoHKiWN18s5UUPPzpR
	e/zHH
X-Gm-Gg: AZuq6aKmeFS95h2nvR0rf4shigRL/1Lvd8yOsQ1AXidSQvef+QUkKBxdLBXbOYDwhGq
	nHkCDnkOrNZAno0AuWnL+gCIgW40uj5tiJbA+SzX2u/CLfnmFAxi7l4zwr37fdeixz5AVuJPH5w
	Bwy7zyQVKySzufjtElvDXs4fxo5x9LtvZJH3/+9lP89xFTiIE/Xxq9ovVNv16+HoeU9QMhsZc3s
	D1CvcoAJhq9AQ5RF2odGuUaWL2GhQ5TsgtNBIjjAILR5yyKHPuxYKVHqvnf32lwzr2MNp5INPs5
	kAS5177hK1pqyP7glVcX/DAPhu4FVifYg1ouKiD53/FasNo5R4M+Bf4gtK0dorxkNPn6xeXbFdI
	w2g5Z39wx09ytTTcBEJJgjvk6w1yc9xWjqWDMvIOYFrFpk6SnBqknFSVLWRN3E+G+ihorr9KTTx
	bJ82rYvBiWstpKK5SJcLSiZb4=
X-Received: by 2002:a17:902:da82:b0:2a1:3e15:380e with SMTP id d9443c01a7336-2a870dc88aemr38201415ad.34.1769576950570;
        Tue, 27 Jan 2026 21:09:10 -0800 (PST)
Received: from MVIN00013.mvista.com ([27.121.101.102])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b4153c6sm9603285ad.37.2026.01.27.21.09.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 21:09:10 -0800 (PST)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [kirkstone][PATCH] grub: fix CVE-2025-54770
Date: Wed, 28 Jan 2026 10:39:00 +0530
Message-ID: <20260128050900.112191-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Jan 2026 05:09:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230076

Upstream-Status: Backport from https://gitweb.git.savannah.gnu.org/gitweb/?p=grub.git;a=commit;h=954c48b9c833d64b74ced1f27701af2ea5c6f55a && https://gitweb.git.savannah.gnu.org/gitweb/?p=grub.git;a=patch;h=10e58a14db20e17d1b6a39abe38df01fef98e29d

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../grub/files/CVE-2025-54770-01.patch        | 138 ++++++++++++++++++
 .../grub/files/CVE-2025-54770-02.patch        |  39 +++++
 meta/recipes-bsp/grub/grub2.inc               |   2 +
 3 files changed, 179 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2025-54770-01.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2025-54770-02.patch

diff --git a/meta/recipes-bsp/grub/files/CVE-2025-54770-01.patch b/meta/recipes-bsp/grub/files/CVE-2025-54770-01.patch
new file mode 100644
index 0000000000..ea749fc8f6
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2025-54770-01.patch
@@ -0,0 +1,138 @@
+From 954c48b9c833d64b74ced1f27701af2ea5c6f55a Mon Sep 17 00:00:00 2001
+From: Chad Kimes <chkimes@github.com>
+Date: Mon, 21 Mar 2022 17:29:16 -0400
+Subject: [PATCH] net/net: Add net_set_vlan command
+
+Previously there was no way to set the 802.1Q VLAN identifier, despite
+support for vlantag in the net module. The only location vlantag was
+being populated was from PXE boot and only for Open Firmware hardware.
+This commit allows users to manually configure VLAN information for any
+interface.
+
+Example usage:
+  grub> net_ls_addr
+  efinet1 00:11:22:33:44:55 192.0.2.100
+  grub> net_set_vlan efinet1 100
+  grub> net_ls_addr
+  efinet1 00:11:22:33:44:55 192.0.2.100 vlan100
+  grub> net_set_vlan efinet1 0
+  efinet1 00:11:22:33:44:55 192.0.2.100
+
+Signed-off-by: Chad Kimes <chkimes@github.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+CVE: CVE-2025-54770
+Upstream-Status: Backport [https://gitweb.git.savannah.gnu.org/gitweb/?p=grub.git;a=commit;h=954c48b9c833d64b74ced1f27701af2ea5c6f55a]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ docs/grub.texi      | 20 ++++++++++++++++++++
+ grub-core/net/net.c | 41 ++++++++++++++++++++++++++++++++++++++++-
+ 2 files changed, 60 insertions(+), 1 deletion(-)
+
+diff --git a/docs/grub.texi b/docs/grub.texi
+index f8b4b3b..f7fc6d7 100644
+--- a/docs/grub.texi
++++ b/docs/grub.texi
+@@ -5493,6 +5493,7 @@ This command is only available on AArch64 systems.
+ * net_ls_dns::                  List DNS servers
+ * net_ls_routes::               List routing entries
+ * net_nslookup::                Perform a DNS lookup
++* net_set_vlan::                Set vlan id on an interface
+ @end menu
+ 
+ 
+@@ -5669,6 +5670,25 @@ is given, use default list of servers.
+ @end deffn
+ 
+ 
++@node net_set_vlan
++@subsection net_set_vlan
++
++@deffn Command net_set_vlan @var{interface} @var{vlanid}
++Set the 802.1Q VLAN identifier on @var{interface} to @var{vlanid}. For example,
++to set the VLAN identifier on interface @samp{efinet1} to @samp{100}:
++
++@example
++net_set_vlan efinet1 100
++@end example
++
++The VLAN identifier can be removed by setting it to @samp{0}:
++
++@example
++net_set_vlan efinet1 0
++@end example
++@end deffn
++
++
+ @node Internationalisation
+ @chapter Internationalisation
+ 
+diff --git a/grub-core/net/net.c b/grub-core/net/net.c
+index ec7f01c..03ede6d 100644
+--- a/grub-core/net/net.c
++++ b/grub-core/net/net.c
+@@ -1162,6 +1162,42 @@ grub_cmd_addroute (struct grub_command *cmd __attribute__ ((unused)),
+     }
+ }
+ 
++static grub_err_t
++grub_cmd_setvlan (struct grub_command *cmd __attribute__ ((unused)),
++		  int argc, char **args)
++{
++  const char *vlan_string, *vlan_string_end;
++  unsigned long vlantag;
++  struct grub_net_network_level_interface *inter;
++
++  if (argc != 2)
++    return grub_error (GRUB_ERR_BAD_ARGUMENT, N_("two arguments expected"));
++
++  vlan_string = args[1];
++  vlantag = grub_strtoul (vlan_string, &vlan_string_end, 10);
++
++  if (*vlan_string == '\0' || *vlan_string_end != '\0')
++    return grub_error (GRUB_ERR_BAD_NUMBER,
++		       N_("non-numeric or invalid number `%s'"), vlan_string);
++
++  if (vlantag > 4094)
++    return grub_error (GRUB_ERR_OUT_OF_RANGE,
++		       N_("vlan id `%s' not in the valid range of 0-4094"),
++		       vlan_string);
++
++  FOR_NET_NETWORK_LEVEL_INTERFACES (inter)
++    {
++      if (grub_strcmp (inter->name, args[0]) != 0)
++	continue;
++
++      inter->vlantag = vlantag;
++      return GRUB_ERR_NONE;
++    }
++
++  return grub_error (GRUB_ERR_BAD_ARGUMENT,
++                     N_("network interface not found"));
++}
++
+ static void
+ print_net_address (const grub_net_network_level_netaddress_t *target)
+ {
+@@ -1876,7 +1912,7 @@ grub_net_search_config_file (char *config, grub_size_t config_buf_len)
+ static struct grub_preboot *fini_hnd;
+ 
+ static grub_command_t cmd_addaddr, cmd_deladdr, cmd_addroute, cmd_delroute;
+-static grub_command_t cmd_lsroutes, cmd_lscards;
++static grub_command_t cmd_setvlan, cmd_lsroutes, cmd_lscards;
+ static grub_command_t cmd_lsaddr, cmd_slaac;
+ 
+ GRUB_MOD_INIT(net)
+@@ -1914,6 +1950,9 @@ GRUB_MOD_INIT(net)
+   cmd_delroute = grub_register_command ("net_del_route", grub_cmd_delroute,
+ 					N_("SHORTNAME"),
+ 					N_("Delete a network route."));
++  cmd_setvlan = grub_register_command ("net_set_vlan", grub_cmd_setvlan,
++				       N_("SHORTNAME VLANID"),
++				       N_("Set an interface's vlan id."));
+   cmd_lsroutes = grub_register_command ("net_ls_routes", grub_cmd_listroutes,
+ 					"", N_("list network routes"));
+   cmd_lscards = grub_register_command ("net_ls_cards", grub_cmd_listcards,
+-- 
+2.50.1
+
diff --git a/meta/recipes-bsp/grub/files/CVE-2025-54770-02.patch b/meta/recipes-bsp/grub/files/CVE-2025-54770-02.patch
new file mode 100644
index 0000000000..bc56997726
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2025-54770-02.patch
@@ -0,0 +1,39 @@
+From 10e58a14db20e17d1b6a39abe38df01fef98e29d Mon Sep 17 00:00:00 2001
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
+Reported-by: Thomas Frauendorfer | Miray Software <tf@miray.de>
+Signed-off-by: Thomas Frauendorfer | Miray Software <tf@miray.de>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+CVE: CVE-2025-54770
+Upstream-Status: Backport [https://gitweb.git.savannah.gnu.org/gitweb/?p=grub.git;a=patch;h=10e58a14db20e17d1b6a39abe38df01fef98e29d]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ grub-core/net/net.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/grub-core/net/net.c b/grub-core/net/net.c
+index 03ede6d..e66d192 100644
+--- a/grub-core/net/net.c
++++ b/grub-core/net/net.c
+@@ -1980,6 +1980,7 @@ GRUB_MOD_FINI(net)
+   grub_unregister_command (cmd_deladdr);
+   grub_unregister_command (cmd_addroute);
+   grub_unregister_command (cmd_delroute);
++  grub_unregister_command (cmd_setvlan);
+   grub_unregister_command (cmd_lsroutes);
+   grub_unregister_command (cmd_lscards);
+   grub_unregister_command (cmd_lsaddr);
+-- 
+2.50.1
+
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 4744e26693..b21afe34f7 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -63,6 +63,8 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://CVE-2025-61661.patch \
            file://CVE-2025-61662.patch \
            file://CVE-2025-61663_61664.patch \
+           file://CVE-2025-54770-01.patch \
+           file://CVE-2025-54770-02.patch \
 "
 
 SRC_URI[sha256sum] = "23b64b4c741569f9426ed2e3d0e6780796fca081bee4c99f62aa3f53ae803f5f"
-- 
2.50.1


