Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5211AC46467
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 11:06:01 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.9353.1672830354623515844
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 03:05:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=h0lJS27F;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id fm16-20020a05600c0c1000b003d96fb976efso23933665wmb.3
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 03:05:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2/JkgCmfY3Cel5pj2gbJAvMwGQhcVw0kk1og6UdKHTE=;
        b=h0lJS27FWuFzUgxo932oGkHzHZnYpq9X4ATtDserNIa5KPoQjz63rO/rs4h3HaxzHV
         371DMi7AP3UT+LSqSOMd5K031aR+UgH3H4l1wAsoqw7/NNf/6rPlM/70u0jJVq4ePzoG
         sBDcYU9f8xs5P9flaiXOHv9t5kTDIhK6BxlULmWx+Pb2PY8EVQr9v/gAO0mvPhOfjwiT
         Vd8iAbXKPCFipVJC//CwdmqtGW3gTy00vHpf+PFhrDEGsfUjVQ3S3icAVs14cENmCZxA
         DpzGtWL1ONY7F8QfcLF7CUS9OaQPvg7GydVhyrn1qBwRO3Fq6zzE/336Mf9mNTfmG2GP
         2s2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2/JkgCmfY3Cel5pj2gbJAvMwGQhcVw0kk1og6UdKHTE=;
        b=SHDJOq+WKbIij6TpMHr9h9cdmEAK9Nr1/DzDHpgYlQHpUYBSwMvIhytpn27Ej7mj0C
         AAP/RZCml1VAjGQCZFxEE4BluYXP2FKiucc0MbOpeFQ5jeZDDJwcCLsxOedt6X1wInKZ
         FD//woXkf9ZWLIkKX/mJ0vY6v7HtBFYWZSR9j2yiZA/T5cv+XHRnOdUAi4bAUu2jNipp
         mBv5uyfBfCmrfkx65dw65aoNcAUk+rKYDCdclmYpfO6ogRpQpbUBE/QxIamIuVIYgWfh
         f/l1JZwczH8tAbsXJycI2CakU8RWhukM8cTOdUohLp85FHkZmc4WSPkyVb802/zqENEO
         hgyQ==
X-Gm-Message-State: AFqh2koP314UryY1498SBMFOtisMK8nzhlCZtXVuRuxmD188pXN9XxXs
	Bw6Xo7hn6qk8853qYKBef1Z1wiTYcmU=
X-Google-Smtp-Source: AMrXdXvBW2odphWLPCP5lhOl+OY2gAhE3yP3PX/WF/j1v4jcL7A8ILqbTtoDbvGskhG/nKYP51t3bA==
X-Received: by 2002:a05:600c:3845:b0:3d1:caf1:3f56 with SMTP id s5-20020a05600c384500b003d1caf13f56mr37778924wmr.9.1672830352968;
        Wed, 04 Jan 2023 03:05:52 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id h15-20020adfaa8f000000b002421888a011sm34102161wrc.69.2023.01.04.03.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 03:05:52 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 01/77] glib-2.0: upgrade 2.74.3 -> 2.74.4
Date: Wed,  4 Jan 2023 12:04:32 +0100
Message-Id: <20230104110548.2537259-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 11:06:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175386

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../glib-2.0/glib-2.0/fix-errno.patch         | 31 +++++++++++++++++++
 .../glib-2.0/glib-2.0/relocate-modules.patch  |  4 +--
 ...{glib-2.0_2.74.3.bb => glib-2.0_2.74.4.bb} |  3 +-
 3 files changed, 35 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/fix-errno.patch
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.74.3.bb => glib-2.0_2.74.4.bb} (95%)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/fix-errno.patch b/meta/recipes-core/glib-2.0/glib-2.0/fix-errno.patch
new file mode 100644
index 0000000000..144fe8bbd8
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/fix-errno.patch
@@ -0,0 +1,31 @@
+From 6626765a79f125cf0ec9cdaefa51ceef718d41e7 Mon Sep 17 00:00:00 2001
+From: Michael Catanzaro <mcatanzaro@redhat.com>
+Date: Tue, 20 Dec 2022 17:10:41 -0600
+Subject: [PATCH] gthread-posix: need to #include <errno.h>
+
+a79c6af23eff5ee978db62e048828c9a992a1261 uses errno without the required
+header.
+
+
+(cherry picked from commit 03cb4261e00cf505790f4fd4e69f97b2ef4fcccd)
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/6626765a79f125cf0ec9cdaefa51ceef718d41e7]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ glib/gthreadprivate.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/glib/gthreadprivate.h b/glib/gthreadprivate.h
+index 6eaf422753..f34368a7c2 100644
+--- a/glib/gthreadprivate.h
++++ b/glib/gthreadprivate.h
+@@ -41,6 +41,7 @@ struct  _GRealThread
+ /* system thread implementation (gthread-posix.c, gthread-win32.c) */
+ 
+ #if defined(HAVE_FUTEX) || defined(HAVE_FUTEX_TIME64)
++#include <errno.h>
+ #include <linux/futex.h>
+ #include <sys/syscall.h>
+ #include <unistd.h>
+-- 
+GitLab
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch b/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
index 7723ac6672..168dc73290 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
@@ -1,4 +1,4 @@
-From 0da0b608fdbb144c39225233cbdd89995b76904b Mon Sep 17 00:00:00 2001
+From 2adfd458507c8c832955d6ffb9408d6c574b94f6 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Fri, 11 Mar 2016 15:35:55 +0000
 Subject: [PATCH] glib-2.0: relocate the GIO module directory for native builds
@@ -19,7 +19,7 @@ Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
  1 file changed, 11 insertions(+), 1 deletion(-)
 
 diff --git a/gio/giomodule.c b/gio/giomodule.c
-index f5dbb4555..c926e77a8 100644
+index f5dbb45..c926e77 100644
 --- a/gio/giomodule.c
 +++ b/gio/giomodule.c
 @@ -58,6 +58,8 @@
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.74.3.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.74.4.bb
similarity index 95%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.74.3.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.74.4.bb
index 8f66fd9581..e5279e946c 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.74.3.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.74.4.bb
@@ -18,10 +18,11 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://0001-gio-tests-meson.build-do-not-use-can_run_host_binari.patch \
            file://cpp-null.patch \
            file://cpp-null2.patch \
+           file://fix-errno.patch \
            "
 SRC_URI:append:class-native = " file://relocate-modules.patch"
 
-SRC_URI[sha256sum] = "e9bc41ecd9690d9bc6a970cc7380119b828e5b6a4b16c393c638b3dc2b87cbcb"
+SRC_URI[sha256sum] = "0e82da5ea129b4444227c7e4a9e598f7288d1994bf63f129c44b90cfd2432172"
 
 # Find any meson cross files in FILESPATH that are relevant for the current
 # build (using siteinfo) and add them to EXTRA_OEMESON.
-- 
2.30.2


