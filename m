Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B5DAC7618E
	for <webhook@archiver.kernel.org>; Thu, 16 Mar 2023 21:46:14 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.5081.1679003146620913086
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Mar 2023 14:46:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=tTR0u27f;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id a2so3271054plm.4
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Mar 2023 14:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1679003166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=coBCwh3NNriX0hs+wRG9AWNzTV8VdwkI3D6aEYj4EDU=;
        b=tTR0u27fbj2/J8pVkq85aQN1cq8lG+IsVjrKKK3PBjsmohX72c2eIODDZet1bVyALg
         2BCv/I3efOK5CV7P2DEwy9QFg7q9cz+7ZaoZ5TSsKlddqll4cNSDWGdZIo9BppzDBUX5
         1fQsx5FmIaT3atoZDL2hVGsGvrdEnjj03Kgs20Xd3aLt7z57QbhTdEBxuA22Szz5d1eq
         eaEj2Fpp8W/WfuAATxz+zKsl2b9ko33YyUHTWr9y2yOyyKrFVEcroK5AC+LD/eSJ4W/l
         gi48n6msY0Un5esfTcTNYbiikrPJYW1gzLG/ubsbX8z8B7bIz5H048gapKW833oqphb0
         65xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679003166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=coBCwh3NNriX0hs+wRG9AWNzTV8VdwkI3D6aEYj4EDU=;
        b=SRYU5rZOFZk1ox2e2CiFybXmC4W0MVS8ehBIhMyh8+XZfwc+FMgwwKLOxmDLnciKu9
         wlMAENCwXzx8ZJml4cjHh2QLiP8GupeAc6Xj67q3yoL/1GlALDLY8uV6aN6WyesltOur
         tNNknbRTVfc+Qhq0LOMcAPdVz2kQfq8MAOcLyJ1H4qJInwl5qq+xPJ2MAWhuzb2FvmDk
         /vlOjT4+F1dfCskFBMYMkQk2DmBFC5oX1OwhcJdQPmf94qfVrSrOKZ9nBvGhIU0s3UqJ
         B0tR++AvPFAIluM2Ftsgxt4BGYjylywfCQzFGkSn8AHsfLzuri7S9OIpAPNcJj0YXeQs
         Hi3A==
X-Gm-Message-State: AO0yUKXoPaB1bdJv9u8HGetc5wzQdd05XnOcUw26yx3tF/wepnTT2vAw
	4kEJ7G5HuJeRwV+0nvDHUPoRT7HvaBjf7z7w45M=
X-Google-Smtp-Source: AK7set/7jCIIivjkyNDl8NPe4Rn1qwBk+wNtaNA4FzMJ/HqBWq/l+IH4mBdupL8qtKQW/B4H8RmyzA==
X-Received: by 2002:a05:6a20:e688:b0:cc:e39e:3f64 with SMTP id mz8-20020a056a20e68800b000cce39e3f64mr4563295pzb.24.1679003166300;
        Thu, 16 Mar 2023 14:46:06 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id bn10-20020a056a00324a00b005a84ef49c63sm137746pfb.214.2023.03.16.14.46.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 14:46:06 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 22/23] dhcpcd: Fix install conflict when enable multilib.
Date: Thu, 16 Mar 2023 11:45:19 -1000
Message-Id: <ae3aa0ded86ae13060989d19e64795b00946cd2e.1679003014.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679003014.git.steve@sakoman.com>
References: <cover.1679003014.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Mar 2023 21:46:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178733

From: Wang Mingyu <wangmy@fujitsu.com>

Error: Transaction test error:
   file /usr/share/man/man8/dhcpcd.8 conflicts between attempted installs of dhcpcd-doc-9.4.1-r0.cortexa57 and lib32-dhcpcd-doc-9.4.1-r0.armv7ahf_neon

The differences between the two files are as follows:
@@ -821,7 +821,7 @@
 If you always use the same options, put them here.
 .It Pa /usr/libexec/dhcpcd-run-hooks
 Bourne shell script that is run to configure or de-configure an interface.
-.It Pa /usr/lib64/dhcpcd/dev
+.It Pa /usr/lib/dhcpcd/dev
 Linux
 .Pa /dev
 management modules.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 65ca2c4b7349a4f7dcfcc580d926a99c673deb60)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../dhcpcd/dhcpcd_9.4.1.bb                    |  1 +
 ...-conflict-error-when-enable-multilib.patch | 46 +++++++++++++++++++
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-connectivity/dhcpcd/files/0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch

diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_9.4.1.bb b/meta/recipes-connectivity/dhcpcd/dhcpcd_9.4.1.bb
index 39e689d2f6..579fa95df7 100644
--- a/meta/recipes-connectivity/dhcpcd/dhcpcd_9.4.1.bb
+++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_9.4.1.bb
@@ -19,6 +19,7 @@ SRC_URI = "https://roy.marples.name/downloads/${BPN}/${BPN}-${PV}.tar.xz \
            file://0001-privsep-linux-fix-SECCOMP_AUDIT_ARCH-missing-ppc64le.patch \
            file://dhcpcd.service \
            file://dhcpcd@.service \
+           file://0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch \
            "
 
 SRC_URI[sha256sum] = "819357634efed1ea5cf44ec01b24d3d3f8852fec8b4249925dcc5667c54e376c"
diff --git a/meta/recipes-connectivity/dhcpcd/files/0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch b/meta/recipes-connectivity/dhcpcd/files/0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch
new file mode 100644
index 0000000000..12998aada4
--- /dev/null
+++ b/meta/recipes-connectivity/dhcpcd/files/0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch
@@ -0,0 +1,46 @@
+From 4915a7e52fcea8fe283a842890a1e726b1e26b10 Mon Sep 17 00:00:00 2001
+From: Lei Maohui <leimaohui@fujitsu.com>
+Date: Fri, 10 Mar 2023 03:48:46 +0000
+Subject: [PATCH] dhcpcd.8: Fix conflict error when enable multilib.
+
+Error: Transaction test error:
+ file /usr/share/man/man8/dhcpcd.8 conflicts between attempted
+ installs of dhcpcd-doc-9.4.1-r0.cortexa57 and
+ lib32-dhcpcd-doc-9.4.1-r0.armv7ahf_neon
+
+The differences between the two files are as follows:
+@@ -821,7 +821,7 @@
+ If you always use the same options, put them here.
+ .It Pa /usr/libexec/dhcpcd-run-hooks
+ Bourne shell script that is run to configure or de-configure an interface.
+-.It Pa /usr/lib64/dhcpcd/dev
++.It Pa /usr/lib/dhcpcd/dev
+ Linux
+ .Pa /dev
+ management modules.
+
+It is just a man file, there is no necessary to manage multiple
+versions.
+
+Upstream-Status: Inappropriate [oe specific]
+Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
+---
+ src/dhcpcd.8.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/dhcpcd.8.in b/src/dhcpcd.8.in
+index bc6b3b5..791f2ba 100644
+--- a/src/dhcpcd.8.in
++++ b/src/dhcpcd.8.in
+@@ -821,7 +821,7 @@ Configuration file for dhcpcd.
+ If you always use the same options, put them here.
+ .It Pa @SCRIPT@
+ Bourne shell script that is run to configure or de-configure an interface.
+-.It Pa @LIBDIR@/dhcpcd/dev
++.It Pa /usr/<libdir>/dhcpcd/dev
+ Linux
+ .Pa /dev
+ management modules.
+-- 
+2.34.1
+
-- 
2.34.1


