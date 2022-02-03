Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25C78C433EF
	for <webhook@archiver.kernel.org>; Thu,  3 Feb 2022 19:51:09 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web12.2872.1643917868675256465
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Feb 2022 11:51:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=iuOG8nzL;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id x3so3131650pll.3
        for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Feb 2022 11:51:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=7+ms8K/kMH8R4pX4uaQ/k0GmpST4r721Us70wKYMpPk=;
        b=iuOG8nzL+80Hsr65BucG/yFZt/BrOXx3rAaEE4ahMG/Er92n7D3Nnfe83jLGj/GiN+
         Vyx1+9aeCz/wxU897TS0/r4c7eCC37xA3Jn9JBWcmJ7/hLP187tmCpA8FEiMCoSjTFzi
         BxX8R9Fj3A7tdKFAM1Qp0ZdbCl48yYX+G/Yo0r4yzSg/eSUgaAVuKB/iFjs7owTZGrFK
         D8pZ4eVBh7J8J728bKk8x1frKhfrIybCYB7HmxZZZ0opPAKBueLNwIlj9ETUEbl+1JMe
         JNEO7KLY2hD+ZKoIdTp/7/h1mzw+ZkfS/gKIrtcbkperHOzUZrmQ3Ve6UDTB8EbfpPp1
         T+UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7+ms8K/kMH8R4pX4uaQ/k0GmpST4r721Us70wKYMpPk=;
        b=ELudF6vQHkOpGLpbSzYuXpdsV57SNvRuptIu4GHm1Qor0SzqjhbDtCtUs+G+z447re
         DKdYrTdPBJbK/NnOPk9sgUYZHpwGZcOG632vqxA0F6+zZ6CwQ7OeCZbvHkvCdXjmwu8u
         38KcLpxVmHcuELvNxMrTJ+iMeM7KPXUBNJ/Zpa3uDpTGb5Yz25IA3jaoLf0rDWi9i7OD
         pBfCi/WatY5XA6O5V8JradPvIHoFrdVxdJ7nl4WmjgZAi3+YeI8AJIyRJWith99L9nzJ
         Os/1AieLySJCVOe3Us/vuVvcg8SRgo1fDzn56iVM1SZjSouNit55GDHNg1peeVEJDESf
         y6Rg==
X-Gm-Message-State: AOAM531xX5lUEa3bKhimPVc72AcAL5E2F8areIWa9O0t3jt6KH181mlP
	nlPjlmDSy7cqih94D8jo2DXCiDI1Pav3Mcth
X-Google-Smtp-Source: 
 ABdhPJywevaaul8u1AQM1KHgs9TnMM+UynU6V/HSczYcB9lNe5j3zkRpwass+dzU73lICu9zhZ6JIQ==
X-Received: by 2002:a17:903:1210:: with SMTP id
 l16mr34801899plh.63.1643917867510;
        Thu, 03 Feb 2022 11:51:07 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 s4sm27762216pgg.80.2022.02.03.11.51.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Feb 2022 11:51:06 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 03/20] grub: add a fix for CVE-2020-25632
Date: Thu,  3 Feb 2022 09:50:27 -1000
Message-Id: 
 <3ccb5fdde9aef8a2ebc23611d7764fb689e1f402.1643917717.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1643917717.git.steve@sakoman.com>
References: <cover.1643917717.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Feb 2022 19:51:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161298

From: Marta Rybczynska <rybczynska@gmail.com>

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
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.25.1


