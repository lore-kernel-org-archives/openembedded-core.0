Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 752C6C433F5
	for <webhook@archiver.kernel.org>; Fri, 25 Feb 2022 14:27:17 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web09.6931.1645799236453593493
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 06:27:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=c8klFGl8;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.181,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f181.google.com with SMTP id 75so4804081pgb.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 06:27:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=O8SOwzEl4GtSKXmZFpRgURIBRHC3QLY1jSivlcrA9w0=;
        b=c8klFGl8MLY+o924MpiiMNh+blVsnmyrUJH1N/XucLu08/NMLMs58sdFh+jYAnJFMX
         lwphY6wVzxUA6CfPE3yIrNXWs6dWOnApXqiKE5fZqJfHru8XBGGdqkieosCXmEdie2mm
         t3ESW1BSH8rJvABeErWP8FtO1NZpWieWH7JcbeOxNcL5CqRz1APzmgMnaMCnNe84eYoQ
         VMIN9U4s6fH6Y2+1sDXFJdd7ueW8dGeBKQzM0dQeAVVzmGA1yr4mWT5ClLqdSLfa/Do5
         1OdtilDOQas23M1jemleR/JTtjy5Q0M74ju3Ci4W9UC5K18jpCwdWO8Ri09xhBr1/jcK
         Xz2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=O8SOwzEl4GtSKXmZFpRgURIBRHC3QLY1jSivlcrA9w0=;
        b=J5L/8AAXdCe1GzxVjBnDkncFDT9SOzdYgOK/KMMqh7TvWOqLVyPkJildTdgonJoQmK
         TT89k0NYvLhM8OkbngNqz50RGQAP8U2Jhr3nva5FC8t52lrtxFeyFerdnUHCQ9lXY0cX
         U/sP+D+C1V3mg0teR3Z4CpEgjLKsKrcVbta3EZK8hd9LXsmhau/qEGodDCMknmt8zmVy
         2Vp0Rl4pZO2dMRuAKP+rQmEm3EweRD4S9XswpJW0aUhWwn54rE/5FRmfb9fDn5AjeHiB
         1gUSZHoPx6IifIuyf7Z+Fi7wRh+Tmglu4fIHxL1I7F/Yp8DiBTpkXOWi5F9vlgGqSTcd
         vyBg==
X-Gm-Message-State: AOAM533Olz57Cv+PiKGOSdaGyAoPVaQeBH5AnM2pZEcZk4NhmDGpBflR
	Yp+9+jPpwBKOqiKp8hUr4Uj4H7pwe7xLOWkZ
X-Google-Smtp-Source: 
 ABdhPJyWnDMUIq5SpWjwAAPvbLMQfeKQ7vDbxtt6Wy+PeGsjwTo5/piRdCkpLAAZB4p7MFjM4kHkKQ==
X-Received: by 2002:a63:90c8:0:b0:365:5cc7:e776 with SMTP id
 a191-20020a6390c8000000b003655cc7e776mr6278320pge.13.1645799235390;
        Fri, 25 Feb 2022 06:27:15 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 h17-20020a63df51000000b0036b9776ae5bsm2864538pgj.85.2022.02.25.06.27.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 06:27:14 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 12/50] grub: add a fix for unused variable in
 gnulib
Date: Fri, 25 Feb 2022 04:25:52 -1000
Message-Id: 
 <30cf1e62b0f139cd6e1e3d5c09b7156acfb276b5.1645798648.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1645798648.git.steve@sakoman.com>
References: <cover.1645798648.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Feb 2022 14:27:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162358

From: Marta Rybczynska <rybczynska@gmail.com>

This changes adds a fix for an unused variable issue in gnulib.
It is a part of a security series [1].

[1] https://lists.gnu.org/archive/html/grub-devel/2021-03/msg00007.html

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...ulib-regexec-Resolve-unused-variable.patch | 59 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 60 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/0008-gnulib-regexec-Resolve-unused-variable.patch

diff --git a/meta/recipes-bsp/grub/files/0008-gnulib-regexec-Resolve-unused-variable.patch b/meta/recipes-bsp/grub/files/0008-gnulib-regexec-Resolve-unused-variable.patch
new file mode 100644
index 0000000000..74ffb559e9
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/0008-gnulib-regexec-Resolve-unused-variable.patch
@@ -0,0 +1,59 @@
+From 9d36bce5d516b6379ba3a0dd1a94a9c035838827 Mon Sep 17 00:00:00 2001
+From: Darren Kenny <darren.kenny@oracle.com>
+Date: Wed, 21 Oct 2020 14:41:27 +0000
+Subject: [PATCH] gnulib/regexec: Resolve unused variable
+
+This is a really minor issue where a variable is being assigned to but
+not checked before it is overwritten again.
+
+The reason for this issue is that we are not building with DEBUG set and
+this in turn means that the assert() that reads the value of the
+variable match_last is being processed out.
+
+The solution, move the assignment to match_last in to an ifdef DEBUG too.
+
+Fixes: CID 292459
+
+Signed-off-by: Darren Kenny <darren.kenny@oracle.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=a983d36bd9178d377d2072fd4b11c635fdc404b4]
+Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
+---
+ conf/Makefile.extra-dist                           |  1 +
+ .../lib/gnulib-patches/fix-unused-value.patch      | 14 ++++++++++++++
+ 2 files changed, 15 insertions(+)
+ create mode 100644 grub-core/lib/gnulib-patches/fix-unused-value.patch
+
+diff --git a/conf/Makefile.extra-dist b/conf/Makefile.extra-dist
+index 46c4e95..9b01152 100644
+--- a/conf/Makefile.extra-dist
++++ b/conf/Makefile.extra-dist
+@@ -29,6 +29,7 @@ EXTRA_DIST += grub-core/genemuinit.sh
+ EXTRA_DIST += grub-core/genemuinitheader.sh
+ 
+ EXTRA_DIST += grub-core/lib/gnulib-patches/fix-null-deref.patch
++EXTRA_DIST += grub-core/lib/gnulib-patches/fix-unused-value.patch
+ EXTRA_DIST += grub-core/lib/gnulib-patches/fix-width.patch
+ EXTRA_DIST += grub-core/lib/gnulib-patches/no-abort.patch
+ 
+diff --git a/grub-core/lib/gnulib-patches/fix-unused-value.patch b/grub-core/lib/gnulib-patches/fix-unused-value.patch
+new file mode 100644
+index 0000000..ba51f1b
+--- /dev/null
++++ b/grub-core/lib/gnulib-patches/fix-unused-value.patch
+@@ -0,0 +1,14 @@
++--- a/lib/regexec.c	2020-10-21 14:25:35.310195912 +0000
+++++ b/lib/regexec.c	2020-10-21 14:32:07.961765604 +0000
++@@ -828,7 +828,11 @@
++ 		    break;
++ 		  if (__glibc_unlikely (err != REG_NOMATCH))
++ 		    goto free_return;
+++#ifdef DEBUG
+++		  /* Only used for assertion below when DEBUG is set, otherwise
+++		     it will be over-written when we loop around.  */
++ 		  match_last = -1;
+++#endif
++ 		}
++ 	      else
++ 		break; /* We found a match.  */
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 46d65d8609..d2a1502d56 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -54,6 +54,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://0005-efi-Fix-some-malformed-device-path-arithmetic-errors.patch \
            file://0006-kern-efi-Fix-memory-leak-on-failure.patch \
            file://0007-kern-efi-mm-Fix-possible-NULL-pointer-dereference.patch \
+           file://0008-gnulib-regexec-Resolve-unused-variable.patch \
            "
 SRC_URI[md5sum] = "5ce674ca6b2612d8939b9e6abed32934"
 SRC_URI[sha256sum] = "f10c85ae3e204dbaec39ae22fa3c5e99f0665417e91c2cb49b7e5031658ba6ea"
-- 
2.25.1


