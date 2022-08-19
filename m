Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F46FC28B2B
	for <webhook@archiver.kernel.org>; Fri, 19 Aug 2022 02:43:25 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.50678.1660876991985982681
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Aug 2022 19:43:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=24isGWON;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id p9so2101627pfq.13
        for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Aug 2022 19:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=IQkRUIn/iSyyn91OEC03cHf31+jNIRroWueFunKCITI=;
        b=24isGWONeqegN3vpEM4KSaWDvwAS+rClH676Ut2T5uD/BHTu0HiE9jIQ5JwwVIvR75
         Jtr8ZtSBoTKbAsa6Ml3r9jJOkLr+Ts8su3jmgkG6COj1cOKr/6wKx8PmFkFItRvosk3D
         wJ5W9clgEFKd5n5FPkLe5a5CEXhdjDrh63/rAc+5YFN1CUleYwF8TFQqgd7lEc+cFQL7
         EN9pUZL7C6nm51rng76GKcbMQmQVgQ43qSlTUULMSj+Bgut46PFx2/H9vKDU7V7JgHUW
         cUAZ5vmLuG9SRbsActyrBDW2dBRzyML8K0+t2Z3WnNTvoxG06gYV7gltL9Pcegb4V0IG
         5ygQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=IQkRUIn/iSyyn91OEC03cHf31+jNIRroWueFunKCITI=;
        b=jzrYKn3xfy+4f8mKx45YvwUs3NKq5qYZiFsLFdIfNcplzLgrwmaeSTyA7ZOYRxDRdv
         u6Tf+3KctaayVCA9PK9+MBHN/+oPsjF1NNU5eEoJIvSrpBPMtdSMaFY/fIn2vjA6F71P
         bSqMDTJy5jvVlll7PRFhCXoyj0b7iTya1ut4Pwcy9y3sBJmwZpKellKWVTtJ/UiC82hR
         Gan7PFjnjh3yFA6+duw2+UiiiHI85fl+1Bh746JpI/jqN10u9dZ4kIuCFxAmMVzFCE+G
         LgN6vgEImVQvfkAWAVzFZVaLu07ZR8573RL+eJDkDF7DDxm8uBlEGn8aqQTdWbZfmdT5
         T2kQ==
X-Gm-Message-State: ACgBeo2A2Y25GrfBHQXrvMLEYvBAwCsUT69+dxPPEL0Nl+PjZUkBuqRC
	7mf05PR+NTR4IDY/FjEpbJvhbuRGKWxfviJu
X-Google-Smtp-Source: 
 AA6agR7pcTAb0MlmZhAthgI7d/j3KWPfwptzYFqoysXd/kI5Ro36Yf5fp0yLYbC8FLwk008iWvR4Rw==
X-Received: by 2002:a63:1e61:0:b0:41c:45d:7d50 with SMTP id
 p33-20020a631e61000000b0041c045d7d50mr4421097pgm.507.1660876997640;
        Thu, 18 Aug 2022 19:43:17 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 t12-20020a17090a4e4c00b001fa80cde150sm4150145pjl.20.2022.08.18.19.43.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Aug 2022 19:43:17 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 05/26] qemu: fix CVE-2022-0358
Date: Thu, 18 Aug 2022 16:42:27 -1000
Message-Id: 
 <99c4b60bc0266d131307e689ad3651497b3bca29.1660876844.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1660876844.git.steve@sakoman.com>
References: <cover.1660876844.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Aug 2022 02:43:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169548

From: Sakib Sajal <sakib.sajal@windriver.com>

Backport patch to fix CVE-2022-0358.

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |   1 +
 .../qemu/qemu/CVE-2022-0358.patch             | 106 ++++++++++++++++++
 2 files changed, 107 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2022-0358.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 1d04ad3c67..44d4c9ca2f 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -40,6 +40,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2021-3507_2.patch \
            file://CVE-2021-3929.patch \
            file://CVE-2021-4158.patch \
+           file://CVE-2022-0358.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2022-0358.patch b/meta/recipes-devtools/qemu/qemu/CVE-2022-0358.patch
new file mode 100644
index 0000000000..8eb1475638
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2022-0358.patch
@@ -0,0 +1,106 @@
+From 4d2558ec9336d3614a43f7437c9cf74793ae3a87 Mon Sep 17 00:00:00 2001
+From: Vivek Goyal <vgoyal@redhat.com>
+Date: Tue, 25 Jan 2022 13:51:14 -0500
+Subject: [PATCH] virtiofsd: Drop membership of all supplementary groups
+ (CVE-2022-0358)
+
+At the start, drop membership of all supplementary groups. This is
+not required.
+
+If we have membership of "root" supplementary group and when we switch
+uid/gid using setresuid/setsgid, we still retain membership of existing
+supplemntary groups. And that can allow some operations which are not
+normally allowed.
+
+For example, if root in guest creates a dir as follows.
+
+$ mkdir -m 03777 test_dir
+
+This sets SGID on dir as well as allows unprivileged users to write into
+this dir.
+
+And now as unprivileged user open file as follows.
+
+$ su test
+$ fd = open("test_dir/priviledge_id", O_RDWR|O_CREAT|O_EXCL, 02755);
+
+This will create SGID set executable in test_dir/.
+
+And that's a problem because now an unpriviliged user can execute it,
+get egid=0 and get access to resources owned by "root" group. This is
+privilege escalation.
+
+Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=2044863
+Fixes: CVE-2022-0358
+Reported-by: JIETAO XIAO <shawtao1125@gmail.com>
+Suggested-by: Miklos Szeredi <mszeredi@redhat.com>
+Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
+Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
+Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
+Message-Id: <YfBGoriS38eBQrAb@redhat.com>
+Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
+  dgilbert: Fixed missing {}'s style nit
+
+Upstream-Status: Backport [449e8171f96a6a944d1f3b7d3627ae059eae21ca]
+CVE: CVE-2022-0358
+
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ tools/virtiofsd/passthrough_ll.c | 27 +++++++++++++++++++++++++++
+ 1 file changed, 27 insertions(+)
+
+diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
+index 64b5b4fbb..b3d0674f6 100644
+--- a/tools/virtiofsd/passthrough_ll.c
++++ b/tools/virtiofsd/passthrough_ll.c
+@@ -54,6 +54,7 @@
+ #include <sys/wait.h>
+ #include <sys/xattr.h>
+ #include <syslog.h>
++#include <grp.h>
+ 
+ #include "qemu/cutils.h"
+ #include "passthrough_helpers.h"
+@@ -1161,6 +1162,30 @@ static void lo_lookup(fuse_req_t req, fuse_ino_t parent, const char *name)
+ #define OURSYS_setresuid SYS_setresuid
+ #endif
+ 
++static void drop_supplementary_groups(void)
++{
++    int ret;
++
++    ret = getgroups(0, NULL);
++    if (ret == -1) {
++        fuse_log(FUSE_LOG_ERR, "getgroups() failed with error=%d:%s\n",
++                 errno, strerror(errno));
++        exit(1);
++    }
++
++    if (!ret) {
++        return;
++    }
++
++    /* Drop all supplementary groups. We should not need it */
++    ret = setgroups(0, NULL);
++    if (ret == -1) {
++        fuse_log(FUSE_LOG_ERR, "setgroups() failed with error=%d:%s\n",
++                 errno, strerror(errno));
++        exit(1);
++    }
++}
++
+ /*
+  * Change to uid/gid of caller so that file is created with
+  * ownership of caller.
+@@ -3926,6 +3951,8 @@ int main(int argc, char *argv[])
+ 
+     qemu_init_exec_dir(argv[0]);
+ 
++    drop_supplementary_groups();
++
+     pthread_mutex_init(&lo.mutex, NULL);
+     lo.inodes = g_hash_table_new(lo_key_hash, lo_key_equal);
+     lo.root.fd = -1;
+-- 
+2.33.0
+
-- 
2.25.1


