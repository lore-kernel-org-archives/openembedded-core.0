Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AA2AC3F6B0
	for <webhook@archiver.kernel.org>; Fri, 19 Aug 2022 02:43:25 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web09.51213.1660877000688735199
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Aug 2022 19:43:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=o5qwjdhK;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id
 x63-20020a17090a6c4500b001fabbf8debfso3593826pjj.4
        for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Aug 2022 19:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=/qw95IdSb2ze0viP4pfiKpRgKKGktUia2/Xz6o4+iRs=;
        b=o5qwjdhKEY2/CGimEdFFBia/4L+0ogt04Hxtqvbe26WvliNCtNg8CbV5TPVc+mennT
         OQIwR+z6NHcEIBILavWkhok+O96uUafPae2ho+Lba9MJO3YuqGJJI2cKvoT9lmpyvXxg
         Hsf76g8pxwEknGjSuPFx0OSqnbrL8j2ddlfHq3efpewmhAVjAEhX8wPdWHq6K2XwcLF1
         xuPfuEBjQrZxODjoiuYafS4IuUU9tu0fanYLfH/9dL062nqW3BNQgUPznKhdJab3i6cd
         TvDdNOK5MG6aAxKu/AHzLwHiA+Eb/KTyEFiImEOm+N6BPkm6gTM3FStv4tqKGzjOHGZB
         eAhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=/qw95IdSb2ze0viP4pfiKpRgKKGktUia2/Xz6o4+iRs=;
        b=1XIQMp4oZ02I288dWImAOxLQC2eG8kgu6GQLA5SrovquHIBKOgz1r60cct1Su6UBCL
         wtynicLJtgr9cQNUjEjCruE0KfCK0/gf/2+QsXQwSZdGdT5YAMEzSlGffQeB76WhEGi8
         8Y2f4Qie5MJnjBAX0T680no8+Q75JbUmy5jKyZzlYXV5q3gP82gyZFykHfE05Pu6ueAC
         Gm2xkhTbdAumsGY//UuRBt1omoYcMWEsknDuQzZsLMw6XwF5hrZjVv4xvlENCGfHu/tg
         bH48ecnOax/Zxms/pSpjii0dWwQ83++2PxKGgZJ9yineZQE98iFuhBne2cMBY79pE7lk
         Co9Q==
X-Gm-Message-State: ACgBeo0PehwlbCM3MF26iLNMVHbn/iaUVKaGvkAqXHlKDGxscYM6jl/5
	Mqs/UWetRIlkcKutz2+6OWyybH88xS7orus3
X-Google-Smtp-Source: 
 AA6agR5k5XixXMyxnKBjcyIhwfRnMPpF2sR0yBRhY4QaatN1RX97/ybPgJthFQk7SWS6c9VVEXuwuQ==
X-Received: by 2002:a17:90b:180f:b0:1f5:160c:a656 with SMTP id
 lw15-20020a17090b180f00b001f5160ca656mr11990253pjb.193.1660876999704;
        Thu, 18 Aug 2022 19:43:19 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 t12-20020a17090a4e4c00b001fa80cde150sm4150145pjl.20.2022.08.18.19.43.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Aug 2022 19:43:19 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 06/26] qemu: fix CVE-2022-0216
Date: Thu, 18 Aug 2022 16:42:28 -1000
Message-Id: 
 <f2ebd772edd9508af9b557b184d7716a7004f46d.1660876844.git.steve@sakoman.com>
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
 https://lists.openembedded.org/g/openembedded-core/message/169549

From: Sakib Sajal <sakib.sajal@windriver.com>

Backport relevant patches to fix CVE-2022-0216.

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  2 +
 .../qemu/qemu/CVE-2022-0216_1.patch           | 42 +++++++++++++++
 .../qemu/qemu/CVE-2022-0216_2.patch           | 52 +++++++++++++++++++
 3 files changed, 96 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2022-0216_1.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2022-0216_2.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 44d4c9ca2f..a493ac8add 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -41,6 +41,8 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2021-3929.patch \
            file://CVE-2021-4158.patch \
            file://CVE-2022-0358.patch \
+           file://CVE-2022-0216_1.patch \
+           file://CVE-2022-0216_2.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2022-0216_1.patch b/meta/recipes-devtools/qemu/qemu/CVE-2022-0216_1.patch
new file mode 100644
index 0000000000..de7458fc72
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2022-0216_1.patch
@@ -0,0 +1,42 @@
+From 1cedc914b2c4b4e0c9dfcd1b0e02917af35b5eb6 Mon Sep 17 00:00:00 2001
+From: Mauro Matteo Cascella <mcascell@redhat.com>
+Date: Tue, 5 Jul 2022 22:05:43 +0200
+Subject: [PATCH 1/3] scsi/lsi53c895a: fix use-after-free in lsi_do_msgout
+ (CVE-2022-0216)
+
+Set current_req->req to NULL to prevent reusing a free'd buffer in case of
+repeated SCSI cancel requests. Thanks to Thomas Huth for suggesting the patch.
+
+Fixes: CVE-2022-0216
+Resolves: https://gitlab.com/qemu-project/qemu/-/issues/972
+Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>
+Reviewed-by: Thomas Huth <thuth@redhat.com>
+Message-Id: <20220705200543.2366809-1-mcascell@redhat.com>
+Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
+
+Upstream-Status: Backport [6c8fa961da5e60f574bb52fd3ad44b1e9e8ad4b8]
+CVE: CVE-2022-0216
+
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ hw/scsi/lsi53c895a.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/hw/scsi/lsi53c895a.c b/hw/scsi/lsi53c895a.c
+index 85e907a78..8033cf050 100644
+--- a/hw/scsi/lsi53c895a.c
++++ b/hw/scsi/lsi53c895a.c
+@@ -1029,8 +1029,9 @@ static void lsi_do_msgout(LSIState *s)
+         case 0x0d:
+             /* The ABORT TAG message clears the current I/O process only. */
+             trace_lsi_do_msgout_abort(current_tag);
+-            if (current_req) {
++            if (current_req && current_req->req) {
+                 scsi_req_cancel(current_req->req);
++                current_req->req = NULL;
+             }
+             lsi_disconnect(s);
+             break;
+-- 
+2.33.0
+
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2022-0216_2.patch b/meta/recipes-devtools/qemu/qemu/CVE-2022-0216_2.patch
new file mode 100644
index 0000000000..12f5a602da
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2022-0216_2.patch
@@ -0,0 +1,52 @@
+From 8f2c2cb908758192d5ebc00605cbf0989b8a507c Mon Sep 17 00:00:00 2001
+From: Mauro Matteo Cascella <mcascell@redhat.com>
+Date: Mon, 11 Jul 2022 14:33:16 +0200
+Subject: [PATCH 3/3] scsi/lsi53c895a: really fix use-after-free in
+ lsi_do_msgout (CVE-2022-0216)
+
+Set current_req to NULL, not current_req->req, to prevent reusing a free'd
+buffer in case of repeated SCSI cancel requests.  Also apply the fix to
+CLEAR QUEUE and BUS DEVICE RESET messages as well, since they also cancel
+the request.
+
+Thanks to Alexander Bulekov for providing a reproducer.
+
+Fixes: CVE-2022-0216
+Resolves: https://gitlab.com/qemu-project/qemu/-/issues/972
+Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>
+Tested-by: Alexander Bulekov <alxndr@bu.edu>
+Message-Id: <20220711123316.421279-1-mcascell@redhat.com>
+Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
+
+Upstream-Status: Backport [4367a20cc442c56b05611b4224de9a61908f9eac]
+CVE: CVE-2022-0216
+
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ hw/scsi/lsi53c895a.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/hw/scsi/lsi53c895a.c b/hw/scsi/lsi53c895a.c
+index 8033cf050..fbe3fa3dd 100644
+--- a/hw/scsi/lsi53c895a.c
++++ b/hw/scsi/lsi53c895a.c
+@@ -1031,7 +1031,7 @@ static void lsi_do_msgout(LSIState *s)
+             trace_lsi_do_msgout_abort(current_tag);
+             if (current_req && current_req->req) {
+                 scsi_req_cancel(current_req->req);
+-                current_req->req = NULL;
++                current_req = NULL;
+             }
+             lsi_disconnect(s);
+             break;
+@@ -1057,6 +1057,7 @@ static void lsi_do_msgout(LSIState *s)
+             /* clear the current I/O process */
+             if (s->current) {
+                 scsi_req_cancel(s->current->req);
++                current_req = NULL;
+             }
+ 
+             /* As the current implemented devices scsi_disk and scsi_generic
+-- 
+2.33.0
+
-- 
2.25.1


