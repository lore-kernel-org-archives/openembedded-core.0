Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB64CC77B73
	for <webhook@archiver.kernel.org>; Tue,  6 Jun 2023 11:12:00 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web11.6234.1686049916545266605
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jun 2023 04:11:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=GIvvxGbo;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: liu.ming50@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-4f4b2bc1565so7463403e87.2
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Jun 2023 04:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686049914; x=1688641914;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZMaULCSZuXqV8nfNIQhFQ6T7urZjCSLxUjg/eMzjfZQ=;
        b=GIvvxGboo8q2WJwHLYP/XEiBL6lXmc46NVxcJ8+fzUAWRI7rTFjAXkxQPdxbhtO9rg
         h4yKLbZV+6XDXjO6puOdEJeRpi/YYmWojDL7rX1QajCKYmpjF8So8uAbwcJSdjBmOPXf
         y6VZS/tZNxcQqn6AMw5LYYsT+SX5DhT1UB+lTUzmIo9XQJd8akTtO7wvcwPiwKpMbUWU
         GAJU7NLvCLMadDdi6ZDIsiXhfEjw9PhMq4czD8gxVAlLt/3RYs2Qk8JkqIPV06eTVkjQ
         C+HHgmyifOatw73YzMPZLvs63gn3imlvXF9L82b681vtzHbiF2sULsZ+mQX85H4aL/59
         DH+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686049914; x=1688641914;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZMaULCSZuXqV8nfNIQhFQ6T7urZjCSLxUjg/eMzjfZQ=;
        b=NXaMKTnhOFsOKD4dSCPSX8db5KKKYfS9SJDyC3se5Moi0UOHrY56kc1Ebq3n0Cpb2r
         8OAumRlxSh6hg3663iY31g+10xYboDWcxCklwtS0G/1F/GXMDAvwYszCg6WJU1url+Xz
         1i4vK1gemA7zge0b32jVzf4nxO9mvLsobyzztAcWVZFzUh+G4r1LE0Yg+xOtBINg5bgB
         TFlYjnhmFnaScVTK6Yw0SFv2xi4K+tnXFz7x3rYRHeQRXo/KEHFdyzrgC5sXrbdYbicF
         0xu8zoqDXAZKx3KSMSUZPonPYUZorMBR9A+6U0on3eVvvp2bBN0weZ0EvmpURTyJeTrH
         0G6Q==
X-Gm-Message-State: AC+VfDxAn5fO+nKZ/FTaNrdwgxmQg9wl4O2H9YZmtV9dMwi/2HT7bovd
	VI6JdAkus7uhnM2LStPjcEDxvKTZAr0=
X-Google-Smtp-Source: ACHHUZ5maqzK+Q2XAD9u6a2bXwn7Vn0DNCJbMd30AIQHZHzTR3U5tPHjFkKfpv2w8Co503tZrMaurQ==
X-Received: by 2002:a2e:9c8e:0:b0:2b1:c8e2:531d with SMTP id x14-20020a2e9c8e000000b002b1c8e2531dmr1108010lji.16.1686049913849;
        Tue, 06 Jun 2023 04:11:53 -0700 (PDT)
Received: from peterliu-Precision-7530.emea.group.atlascopco.com (customer-212-100-112-191.stosn.net. [212.100.112.191])
        by smtp.gmail.com with ESMTPSA id w13-20020a2e300d000000b002af25598f07sm1810419ljw.78.2023.06.06.04.11.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 04:11:53 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [OE-core] [PATCH] weston-init: introduce xwayland PACKAGECONFIG
Date: Tue,  6 Jun 2023 13:11:50 +0200
Message-Id: <20230606111150.355619-1-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Jun 2023 11:12:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182424

From: Ming Liu <liu.ming50@gmail.com>

Some BSPs dont support xwayland in weston, this is easier for them to
control that.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta/recipes-graphics/wayland/weston-init.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/wayland/weston-init.bb b/meta/recipes-graphics/wayland/weston-init.bb
index 77dda03cf5..a7adce7fda 100644
--- a/meta/recipes-graphics/wayland/weston-init.bb
+++ b/meta/recipes-graphics/wayland/weston-init.bb
@@ -14,10 +14,11 @@ SRC_URI = "file://init \
 
 S = "${WORKDIR}"
 
-PACKAGECONFIG ??= ""
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xwayland', '', d)}"
 PACKAGECONFIG:append:qemuriscv64 = " use-pixman"
 PACKAGECONFIG:append:qemuppc64 = " use-pixman"
 
+PACKAGECONFIG[xwayland] = ",,"
 PACKAGECONFIG[no-idle-timeout] = ",,"
 PACKAGECONFIG[use-pixman] = ",,"
 
@@ -50,7 +51,7 @@ do_install() {
 		sed -i -e "/^\[core\]/a backend=${DEFAULTBACKEND}-backend.so" ${D}${sysconfdir}/xdg/weston/weston.ini
 	fi
 
-	if [ "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'yes', 'no', d)}" = "yes" ]; then
+	if [ "${@bb.utils.contains('PACKAGECONFIG', 'xwayland', 'yes', 'no', d)}" = "yes" ]; then
 		sed -i -e "/^\[core\]/a xwayland=true" ${D}${sysconfdir}/xdg/weston/weston.ini
 	fi
 
-- 
2.25.1


