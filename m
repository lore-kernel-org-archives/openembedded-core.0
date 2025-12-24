Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACC00E74909
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 03:30:18 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.114136.1766547016446922892
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Dec 2025 19:30:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=XY0VKJYF;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4453f8d79f=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO2WNxM2294023
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Dec 2025 03:30:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=i9Fljf+fIwhZTVNukxey
	Dp8TVoLWMq5ebyfusq/344M=; b=XY0VKJYF1EwPhowWU6PckepVxcRwFkxCPl3O
	Vj6JR23TvQ7afKoxRz4aBYHvb/5ODh8XCTXzULepX9AdoFXpJ+ofrYS1mLXUVkkY
	5nTf8iMNqZ4l5qwpYo6QCBAN+Rc7Dkx06kEoyCn7MucwQgiN9t4T/0y2pd/JkeTy
	umDjYt/cYlwloDIhcPNWpLHHiExj96yF4lFQBI5X97e0ILT2OtehX6UEDwUj5tT4
	3iNnqO9xAd9akcgYNpOA1YgdKUlHI7Mv7M/KjrbxLN/tvZbkFXeBTk5XZT+zgscd
	2O9XXvYF+iJgVDoJZQuAHfbvwj/GmJkKkRarq4Z4LrVt562iZA==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b5js73rsh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Dec 2025 03:30:15 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Tue, 23 Dec 2025 19:30:13 -0800
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Tue, 23 Dec 2025 19:30:13 -0800
From: <jiaying.song.cn@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [scarthgap][PATCH] grub: fix CVE-2025-54770 CVE-2025-61661 CVE-2025-61662 CVE-2025-61663 CVE-2025-61664
Date: Wed, 24 Dec 2025 11:30:05 +0800
Message-ID: <20251224033005.1049743-1-jiaying.song.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: MVykUdLZ7zelRw3cNEtRs3aQ48Dn0YgF
X-Authority-Analysis: v=2.4 cv=To7rRTXh c=1 sm=1 tr=0 ts=694b5e47 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=PYnjg3YJAAAA:8 a=mDV3o1hIAAAA:8
 a=t7CeM3EgAAAA:8 a=yPCof4ZbAAAA:8 a=pGLkceISAAAA:8 a=e3viyiHBv5qeNTKYDE4A:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: MVykUdLZ7zelRw3cNEtRs3aQ48Dn0YgF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDAyNiBTYWx0ZWRfX8KS1TMTiJAve
 25pblNJuau3wwx9wdyiYfWkcvSalv/77yCFUGDBFDSIRS+SskB9o0BTAW0HKR7g36q0UbAYR/d0
 +2lBiLho29Do4Y+PRLeqaSmNftOpx6XXiQbE3F4ibWZfdNFjj3d3uIOmY6H+fPPJMCek/48DwHZ
 wqcAEYPQ0WbIivQKDkEYTdbW0cSalfNN5bF9CWWY8flkT3BgycL/Bw6kCuBOh/H67mmDyw6gXH+
 7VN+qMZwHk64+3PfoGARMxjuUkEtHeviE2jUaM5hqTJG75UGAW0MBGO5S+4WzBqHTQ/p/IhAB90
 MfFpVUBEqmhq2nyuz5onkAYKw+hFjyVSmU0tTUTsreYjEh6S3k1Tgd5ojUhffq7bLe67KuhmF+N
 vEFXHZ/E++CTaPpAIofPr/GtvFgvoUB42DfFKD7dP1sqvj+Ce33VQLrVRMqP7eENWjP8TuvwIcG
 mUDiAXA4KTbvLyZfkug==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_01,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 impostorscore=0 phishscore=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240026
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Dec 2025 03:30:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228515

From: Jiaying Song <jiaying.song.cn@windriver.com>

References:
https://nvd.nist.gov/vuln/detail/CVE-2025-54770
https://nvd.nist.gov/vuln/detail/CVE-2025-61661
https://nvd.nist.gov/vuln/detail/CVE-2025-61662
https://nvd.nist.gov/vuln/detail/CVE-2025-61663
https://nvd.nist.gov/vuln/detail/CVE-2025-61664

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
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
index edb87ef2ea..3160708113 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -38,6 +38,10 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://CVE-2025-0677_CVE-2025-0684_CVE-2025-0685_CVE-2025-0686_CVE-2025-0689.patch \
            file://CVE-2025-0678_CVE-2025-1125.patch \
            file://CVE-2024-56738.patch \
+           file://CVE-2025-54770.patch \
+           file://CVE-2025-61661.patch \
+           file://CVE-2025-61662.patch \
+           file://CVE-2025-61663_61664.patch \
 "
 
 SRC_URI[sha256sum] = "b30919fa5be280417c17ac561bb1650f60cfb80cc6237fa1e2b6f56154cb9c91"
-- 
2.34.1


