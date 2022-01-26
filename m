Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68AD2C28CF5
	for <webhook@archiver.kernel.org>; Wed, 26 Jan 2022 09:21:09 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web11.10596.1643188867706564163
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jan 2022 01:21:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eOam/sV0;
 spf=pass (domain: gmail.com, ip: 209.85.218.42,
 mailfrom: rybczynska@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id m4so37604782ejb.9
        for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jan 2022 01:21:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VNCsv/32jVus/Z0AoZJUPeUpYC8FFkF5h4ZVVyOBn6A=;
        b=eOam/sV0avlKqT5g25xg0f3eSTB6ypprBZ/LdHMNd8D/l0ZPDw2rKLb9JRU8jHmFQj
         Ud9NSMzzk4rafQmEzNXLgtYoEtiol048zvq6AH8kqFcGUvX0i0hpISydhkBeReMuDqfO
         +u2k5cAvOeMyf3QqYclqv7yGJeT4yTJ2FpgcSe72IAR822n9GONvukNpVdHVmOk5AUXC
         qvDU3xK8ZirgdBVP34L7eUoBn35qDmpY+dWLIhrV5vVOlx5777dKegSioEcCswemrhUS
         Aoxxl4sMUc3EPoZwks7+0VnjfCZGGfI85o7cxH4xfYGFYAef4bil2kUsv4GQJEh5bxs9
         a9bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VNCsv/32jVus/Z0AoZJUPeUpYC8FFkF5h4ZVVyOBn6A=;
        b=lceHOyf/v8uKyyaFrtce/WsHY//JYRuHl0pzcr7/rvNMBFAg7d6Y61S6xzvt21xdsF
         wgzAAZWBFKE0wEm9fWC/wFy7NDAjVj/avvK6cC2JJuU4Gke8ZYcvmKGSS71Umlpp7qpq
         zgTAaiNkiP2c9sTYhn9xlGI/ThaIWnrnzyQIdaA1pXNMOtPAfeMMQQdXlcS0tGl2anD7
         Z/Uy7NwYVHpNmpgMcvhoXpOy5QVTi0WRXMhj/RItKL2hnSqvQ6fJXMKnxHw/Q3GA7WVE
         Hbb7DTRJP1zlOzOUllj/mTJEt5hwieF+APg2P7vr7299l8aPUT9nrPsx5zxXv3jxZ6Z5
         AkMw==
X-Gm-Message-State: AOAM530FT4e7DH6JRU/AntozYP+rtvcF9S9SaY9xo+105uxmpwnyJR1Z
	cdrP1PQmC/JXDgYtLdduR6rq67sky6s=
X-Google-Smtp-Source: 
 ABdhPJxFiyp2hvyVQuSblutHxMUJqFtXuT1UlBH01iXVCMp21ugAimSpWZDG/UNaSQjkP0mFQpPtIA==
X-Received: by 2002:a17:907:6e29:: with SMTP id
 sd41mr12032027ejc.276.1643188865705;
        Wed, 26 Jan 2022 01:21:05 -0800 (PST)
Received: from localhost.localdomain ([80.215.178.46])
        by smtp.gmail.com with ESMTPSA id
 j2sm7165750ejc.223.2022.01.26.01.21.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jan 2022 01:21:05 -0800 (PST)
From: Marta Rybczynska <rybczynska@gmail.com>
To: openembedded-core@lists.openembedded.org,
	anuj.mittal@intel.com,
	steve@sakoman.com
Cc: Marta Rybczynska <rybczynska@gmail.com>,
	Marta Rybczynska <marta.rybczynska@huawei.com>
Subject: [dunfell][OE-core][PATCH 1/2] grub: add a fix for CVE-2020-25632
Date: Wed, 26 Jan 2022 10:20:43 +0100
Message-Id: <20220126092044.2206160-1-rybczynska@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Jan 2022 09:21:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160963

Fix grub issue with module dereferencing. From the official description
from NVD [1]:

   The rmmod implementation allows the unloading of a module used as
   a dependency without checking if any other dependent module is still
   loaded leading to a use-after-free scenario. This could allow
   arbitrary code to be executed or a bypass of Secure Boot protections.

This patch is a part of a bigger security collection for grub [2].

[1] https://nvd.nist.gov/vuln/detail/CVE-2020-25632
[2] https://lists.gnu.org/archive/html/grub-devel/2021-03/msg00007.html

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
---
 .../grub/files/CVE-2020-25632.patch           | 90 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 91 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2020-25632.patch

diff --git a/meta/recipes-bsp/grub/files/CVE-2020-25632.patch b/meta/recipes-bsp/grub/files/CVE-2020-25632.patch
new file mode 100644
index 0000000000..0b37c72f0f
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2020-25632.patch
@@ -0,0 +1,90 @@
+From 7630ec5397fe418276b360f9011934b8c034936c Mon Sep 17 00:00:00 2001
+From: Javier Martinez Canillas <javierm@redhat.com>
+Date: Tue, 29 Sep 2020 14:08:55 +0200
+Subject: [PATCH] dl: Only allow unloading modules that are not dependencies
+
+When a module is attempted to be removed its reference counter is always
+decremented. This means that repeated rmmod invocations will cause the
+module to be unloaded even if another module depends on it.
+
+This may lead to a use-after-free scenario allowing an attacker to execute
+arbitrary code and by-pass the UEFI Secure Boot protection.
+
+While being there, add the extern keyword to some function declarations in
+that header file.
+
+Fixes: CVE-2020-25632
+
+Reported-by: Chris Coulson <chris.coulson@canonical.com>
+Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=7630ec5397fe418276b360f9011934b8c034936c]
+CVE: CVE-2020-25632
+Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
+---
+ grub-core/commands/minicmd.c | 7 +++++--
+ grub-core/kern/dl.c          | 9 +++++++++
+ include/grub/dl.h            | 8 +++++---
+ 3 files changed, 19 insertions(+), 5 deletions(-)
+
+diff --git a/grub-core/commands/minicmd.c b/grub-core/commands/minicmd.c
+index 6bbce3128..fa498931e 100644
+--- a/grub-core/commands/minicmd.c
++++ b/grub-core/commands/minicmd.c
+@@ -140,8 +140,11 @@ grub_mini_cmd_rmmod (struct grub_command *cmd __attribute__ ((unused)),
+   if (grub_dl_is_persistent (mod))
+     return grub_error (GRUB_ERR_BAD_ARGUMENT, "cannot unload persistent module");
+ 
+-  if (grub_dl_unref (mod) <= 0)
+-    grub_dl_unload (mod);
++  if (grub_dl_ref_count (mod) > 1)
++    return grub_error (GRUB_ERR_BAD_ARGUMENT, "cannot unload referenced module");
++
++  grub_dl_unref (mod);
++  grub_dl_unload (mod);
+ 
+   return 0;
+ }
+diff --git a/grub-core/kern/dl.c b/grub-core/kern/dl.c
+index 48eb5e7b6..48f8a7907 100644
+--- a/grub-core/kern/dl.c
++++ b/grub-core/kern/dl.c
+@@ -549,6 +549,15 @@ grub_dl_unref (grub_dl_t mod)
+   return --mod->ref_count;
+ }
+ 
++int
++grub_dl_ref_count (grub_dl_t mod)
++{
++  if (mod == NULL)
++    return 0;
++
++  return mod->ref_count;
++}
++
+ static void
+ grub_dl_flush_cache (grub_dl_t mod)
+ {
+diff --git a/include/grub/dl.h b/include/grub/dl.h
+index f03c03561..b3753c9ca 100644
+--- a/include/grub/dl.h
++++ b/include/grub/dl.h
+@@ -203,9 +203,11 @@ grub_dl_t EXPORT_FUNC(grub_dl_load) (const char *name);
+ grub_dl_t grub_dl_load_core (void *addr, grub_size_t size);
+ grub_dl_t EXPORT_FUNC(grub_dl_load_core_noinit) (void *addr, grub_size_t size);
+ int EXPORT_FUNC(grub_dl_unload) (grub_dl_t mod);
+-void grub_dl_unload_unneeded (void);
+-int EXPORT_FUNC(grub_dl_ref) (grub_dl_t mod);
+-int EXPORT_FUNC(grub_dl_unref) (grub_dl_t mod);
++extern void grub_dl_unload_unneeded (void);
++extern int EXPORT_FUNC(grub_dl_ref) (grub_dl_t mod);
++extern int EXPORT_FUNC(grub_dl_unref) (grub_dl_t mod);
++extern int EXPORT_FUNC(grub_dl_ref_count) (grub_dl_t mod);
++
+ extern grub_dl_t EXPORT_VAR(grub_dl_head);
+ 
+ #ifndef GRUB_UTIL
+-- 
+2.33.0
+
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index db7c23a84a..6a17940afb 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -45,6 +45,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://CVE-2020-27779_5.patch \
            file://CVE-2020-27779_6.patch \
            file://CVE-2020-27779_7.patch \
+           file://CVE-2020-25632.patch \
 "
 SRC_URI[md5sum] = "5ce674ca6b2612d8939b9e6abed32934"
 SRC_URI[sha256sum] = "f10c85ae3e204dbaec39ae22fa3c5e99f0665417e91c2cb49b7e5031658ba6ea"
-- 
2.33.0


