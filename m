Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37CB1F30955
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 12:15:53 +0000 (UTC)
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.42722.1772712946075844441
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Mar 2026 04:15:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=K6S15Fet;
 spf=pass (domain: mvista.com, ip: 74.125.82.176, mailfrom: hprajapati@mvista.com)
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2ba9c484e5eso7421256eec.1
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 04:15:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1772712945; x=1773317745; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D5K7bDsJp+b6hvjfsx/UYwtF00ez+lW4imsMTgrbiIo=;
        b=K6S15Feti0lzwVQGjN/nMsxTg58fOCGVmpwLXLSMLa8JzLlX5CXY7EApVSWIrdAHBf
         R3cnzwtujcRgU8pFV3uQR0SRP+f8wPOfIpuea86Ysndc1UvbqSA3DriJ7qZd2WNKKhZb
         HjH5sRmGrvKoxtYJ6bT67UgPO6MwuOjJKNZLo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772712945; x=1773317745;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D5K7bDsJp+b6hvjfsx/UYwtF00ez+lW4imsMTgrbiIo=;
        b=E9N07H7LE4/pRKigFypfXSXaCE+tUw93AwQVo48RsLyRWXHT4XZhO5QqXK4JZNLeFv
         YWkhOa47rTv59v8ltydajb/P0tzuJd6L5iTfke0WuQAvuXtn6IprBJDjX64lOhOR8DJR
         Qe7IgzYLg8hlyYho2M5YqiTFPcPu224uGlEa8XyYscVEQDfU42Ukl1CfS1zE+cL19aLg
         hCbZ+JNdkCvBypOMqhI+0Nwj6cYjQuP2SLqjRM0vpbY7J9Ohre6RQYi0A5nQq68lruVX
         jjHDdfew65fLdpcTmWHWhPeVsSZGqqj5C9kDfgsPBbrIpJ3xhZPePSkgNOQPQ1hcETOP
         sS4Q==
X-Gm-Message-State: AOJu0Yx0fxVaKXLjlXhWeh3czA/B5Z9bYYPkf39P3npbE1NHubX9jv89
	ztUSRu1vD7Jcdz4T8u7ztT8d1bti+YpTrlJl9dCprblNtL93i1Bc9GPkxFWbvP83SyRR6XiV1Hp
	krj0v
X-Gm-Gg: ATEYQzzfOC8P1qCD31PjejHe3qGy3x9CKtRiK2P/pHSaEF//5o5Dtv0+IHZ6ScH5/lw
	cE9a88KiIQUbJSH75Xn7mknIzq7sN2Wc81QgU7g6MotfaF5I77i8qZOtP/8D+Ac6yGHO1kCcbNb
	tzkerNejQQo6kE6dVy4iJdA9p2IbEj6svJtJR9t7XS61XHHs9bCaOgxqWyOGnJaxEF4Rxmy+Lq9
	HpSWpuHF6sew3rIu9WeybvyNCoar8Fjrk56lR/g5TWQNwprzxTfPnNeWf5mmm0kaLFeGulwnPjq
	7HyMF/1lJf6erIJfDrHhps0C58tK/pPQVbu6bVz1v5MP+UUFcz4LCzvsy5TGDNhJMBVyiI3DdO9
	6zyQ56ooVbzbJJW/wNKN+X7777RyNmmL4fwDkZY7lbM8xeRYO1o+pz6bcmZgPWyGAe3gkvlAxqJ
	NYWoB3pqRxAoLY3YywBkP7F1QEStmwoLHlXXIV
X-Received: by 2002:a05:7300:1352:b0:2bd:fe5a:b861 with SMTP id 5a478bee46e88-2be30dba4dfmr1908868eec.0.1772712945056;
        Thu, 05 Mar 2026 04:15:45 -0800 (PST)
Received: from MVIN00013.mvista.com ([150.129.170.245])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be2ae7a2f5sm4083005eec.33.2026.03.05.04.15.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 04:15:44 -0800 (PST)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [kirkstone][PATCH] grub: fix CVE-2025-54770
Date: Thu,  5 Mar 2026 17:45:17 +0530
Message-ID: <20260305121517.15675-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 12:15:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232488

Pick up patch from Debian security tracker.
[0]: https://security-tracker.debian.org/tracker/CVE-2025-54770

More Details : https://nvd.nist.gov/vuln/detail/CVE-2025-54770

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


