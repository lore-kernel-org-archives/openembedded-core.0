Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87519C19F2B
	for <webhook@archiver.kernel.org>; Fri, 29 Jul 2022 14:48:38 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web08.64.1659106110189799558
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jul 2022 07:48:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=2eXAJ24L;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id
 d65-20020a17090a6f4700b001f303a97b14so5493752pjk.1
        for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jul 2022 07:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Kl7V3lSlfNO5NfSYAJfB15GrvVZ8Nw3ecfeHl6AxHIQ=;
        b=2eXAJ24Lx2qybeN8UTmhgoMS5G6WXqCxgGrWN7M0y1/fQTqynE6t/Ave39UcYvs+LP
         e8R2snH+0+/u/FmJ1d0JEm4ONY7+Cq3J8FKI6mKTPYBEhjIk/iCT43lcvRaH7gYIq6rb
         Iy8KQmPbXONUBXKtifgnxB/T4tCZRHqleIxbF/judhsYhg7XMXyr65wDgA/mv3urvKf7
         Bi2+i5E4k24idpaOkef0H7Lxiq40QLhFvFrk3CIuwTNEsyOKfaoUTgNlguI3bmmwfhLr
         f0JznZRvqxGIfVZ18C4kPWIK8we+tL6IOLz3g6WZmUWqgjaFTQSIwqmRRjvYi7lPQu8F
         VLzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Kl7V3lSlfNO5NfSYAJfB15GrvVZ8Nw3ecfeHl6AxHIQ=;
        b=U+lWu+WvIK6u1xCq1YK/bOUmEuU9bwnqESxl/P5mJ9rzmfMHBNSkCWN1vgrJR8znFz
         Mz879IxRtyIH+IUPk0JOErgl8SKzMqkFiYTiKdSl8snbxb/8q1fMF4JyRrtkkN2tQ/9S
         U9G+skJ9kdFWB5X5aKiqstZNokcuHUCaNAsEglIGqq0SW+FGKN9Y2egVBRHcYd3N7JO3
         ZOgLcQJGYEMWujAatjFu9CDgGQT30SbO5EpI4/RJ5sNLAXGkp8ScmykjvZshiPmPzTcO
         lux6o9IptbWVEKD90h7mZqBFOHMlCklxI7STlNCZmCt5XUSVNQN8F49+Aw6ToGYmOqgy
         CGjg==
X-Gm-Message-State: ACgBeo2t/UzNNzc8OdHQjPKe14sEpPEY4obSD3FeJNuNle0haG7cRPgh
	rlh7wh84t93fAXvysBfjVeY9xF977g8yfPll
X-Google-Smtp-Source: 
 AA6agR5IN7NBY9MkeutlAq6O62WZthvMtO152NMVIbXQvjTLUJQ7+K6lDK8IhebNIvmHr11Us2gQEg==
X-Received: by 2002:a17:902:8c87:b0:16e:c739:5a81 with SMTP id
 t7-20020a1709028c8700b0016ec7395a81mr355180plo.150.1659106109093;
        Fri, 29 Jul 2022 07:48:29 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 x24-20020aa79418000000b00528c6c7bf37sm2958782pfo.129.2022.07.29.07.48.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jul 2022 07:48:28 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 27/29] efivar: fix import functionality
Date: Fri, 29 Jul 2022 04:46:43 -1000
Message-Id: 
 <7d63a9d4f482276a4431c47cc4407ac2ad855b42.1659105705.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1659105705.git.steve@sakoman.com>
References: <cover.1659105705.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Jul 2022 14:48:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168662

From: gr embeter <grembeter@gmail.com>

"efivar --import" is broken in v38:

 # efivar -i /8be4df61-93ca-11d2-aa0d-00e098032b8c-Timeout
free(): invalid pointer
Aborted

Backport upstream patch to fix it.

Upstream issue:
https://github.com/rhboot/efivar/issues/173

Signed-off-by: Grygorii Tertychnyi <grygorii.tertychnyi@leica-geosystems.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 27f263a9c69b711f39287c0dc8970ad41758fbb9)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../0001-Fix-invalid-free-in-main.patch       | 30 +++++++++++++++++++
 meta/recipes-bsp/efivar/efivar_38.bb          |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-bsp/efivar/efivar/0001-Fix-invalid-free-in-main.patch

diff --git a/meta/recipes-bsp/efivar/efivar/0001-Fix-invalid-free-in-main.patch b/meta/recipes-bsp/efivar/efivar/0001-Fix-invalid-free-in-main.patch
new file mode 100644
index 0000000000..7e63df578e
--- /dev/null
+++ b/meta/recipes-bsp/efivar/efivar/0001-Fix-invalid-free-in-main.patch
@@ -0,0 +1,30 @@
+From 085f027e9e9f1478f68ddda705f83b244ee3bd88 Mon Sep 17 00:00:00 2001
+From: Robbie Harwood <rharwood@redhat.com>
+Date: Mon, 18 Apr 2022 13:08:18 -0400
+Subject: [PATCH] Fix invalid free in main()
+
+data is allocated by mmap() in prepare_data().
+
+Resolves: #173
+Signed-off-by: Robbie Harwood <rharwood@redhat.com>
+Upstream-Status: Backport
+Link: https://github.com/rhboot/efivar/commit/6be2cb1c0139ac177e754b0767abf1ca1533847f
+Signed-off-by: Grygorii Tertychnyi <grygorii.tertychnyi@leica-geosystems.com>
+
+---
+ src/efivar.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/efivar.c b/src/efivar.c
+index 5cd1eb2bc73c..09f85edd0a38 100644
+--- a/src/efivar.c
++++ b/src/efivar.c
+@@ -633,7 +633,7 @@ int main(int argc, char *argv[])
+ 				if (sz < 0)
+ 					err(1, "Could not import data from \"%s\"", infile);
+ 
+-				free(data);
++				munmap(data, data_size);
+ 				data = NULL;
+ 				data_size = 0;
+ 
diff --git a/meta/recipes-bsp/efivar/efivar_38.bb b/meta/recipes-bsp/efivar/efivar_38.bb
index 53fe20a95b..42625fa041 100644
--- a/meta/recipes-bsp/efivar/efivar_38.bb
+++ b/meta/recipes-bsp/efivar/efivar_38.bb
@@ -11,6 +11,7 @@ SRC_URI = "git://github.com/rhinstaller/efivar.git;branch=main;protocol=https \
            file://0001-docs-do-not-build-efisecdb-manpage.patch \
            file://0001-src-Makefile-build-util.c-separately-for-makeguids.patch \
            file://efisecdb-fix-build-with-musl-libc.patch \
+           file://0001-Fix-invalid-free-in-main.patch \
            "
 SRCREV = "1753149d4176ebfb2b135ac0aaf79340bf0e7a93"
 
-- 
2.25.1


