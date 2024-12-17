Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 850F1E77188
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 20:55:30 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.91469.1734468929359035510
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Dec 2024 12:55:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=K1RcZV36;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-728ea1573c0so5045170b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 12:55:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1734468928; x=1735073728; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c4xeq3ZMMGhk/FnEpgO8e6Czls9Wy1A312FsBq9FL0I=;
        b=K1RcZV36LU7dh0O/ikidUJc5nJC02A6bcnLbq0mCCGhwM4sQa1UfHpwe8BMLvaG7Kq
         +9YXnsNXUQd55fGWRlaUxpbjR/2R1wCcYD8HM9nZcgd5pziY16w1QpZBeRpr/iiYwsoJ
         BMC3Oghsq+NzSZyC9l7oLbXYd6Ba0qNeMuWp7ygwrJQLmoAtp4y7Ddhnt0S7zoc0nWNC
         xzrHLR+iX0R9OQM6qBmQ3qdcJQjprs8mSWt5PgFArZ5VLC0Mmn/a1YlT00lI2sFYPdDR
         bLgGGbm9EQUN0p5J0KqmdDz7tCXSoPzrrJe0lGvI1mNesygRBaciAHuHVPyey16Iuu/u
         uB3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734468928; x=1735073728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c4xeq3ZMMGhk/FnEpgO8e6Czls9Wy1A312FsBq9FL0I=;
        b=HrmaayqT829fegLScTFzRbySplGiX3xSdf4sbdD4ghr8xkkfj+pJG2/lU86W2bt5EU
         7KIujlDtHYWmflqFg1BNaV9oBpsJwEcLo+VS+gjR3HrexsHK7MPB9FQ/lsmJLhp3MD5l
         10ZZAVsvoPBBhp9wxk1CX8zqy3MU6yCpXm4n0+pjX7KGg7J6Z074uTlTNt1OpNCpoxY0
         9EWoFfcawLe1P5ebVgY1NzewlRzLSD7I7kkbrxmgg2HmztfOM1wm4kQod4FI4Aikg2Bg
         kju6tEMiuS+38Eq0JZgVw3rj/SBJ87+1AbH9sjdfQlyGfyBO5FybZLZhK6n/I5jtmInp
         Kvzw==
X-Gm-Message-State: AOJu0YyqHUe5452AU/tPqlmowTqjgLXq5D2yjrJpdTYMKZyeXxsexGyn
	Mlg9Eyl5/H0U2WCyKlkWAzLJAHGnkcDJK87y+6OQmZgFLqOGbdbxUl9PTDNbbzpBUD8k1aGN0kw
	Z
X-Gm-Gg: ASbGnctXSDJELILbHUvu5Q74TiY8arR4Bi2sTnSKWIdfLIoO9MqlW2dVl9F/TwIm+Wg
	ZdU9Uu1cZLrfKPiha27EGmzacdlZv0qfl1Q+LE8ohlVdtfWKI4Tn8vp0hqtb5RgY3Y2+PsiPLpr
	8Zzxaz/1XscBqdJpKW9YZrXIOFELsf+waH7x6XKLv0UHndEW23vf7Iu+ZMIv31jFyotFrgVZGwG
	J1pwnr1/Prl17hGJZ3XFZxh381h47H8+96n0lMZHjhK+g==
X-Google-Smtp-Source: AGHT+IF4a0K9IyCLF4NgOcnUIRgz+j3M2mCyd52ZMD9D868Q7mLbh7N1ZfE1LnQEOK6HjZD2f8SneQ==
X-Received: by 2002:a05:6a00:2405:b0:725:f212:12e5 with SMTP id d2e1a72fcca58-72a8d2ddd0emr670920b3a.24.1734468928576;
        Tue, 17 Dec 2024 12:55:28 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72918ad5bc5sm7353294b3a.69.2024.12.17.12.55.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 12:55:28 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 7/9] base-passwd: add the wheel group
Date: Tue, 17 Dec 2024 12:54:58 -0800
Message-Id: <9b0f71dbd5319af98af4554ccd8ca94ff2a2af04.1734468756.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1734468756.git.steve@sakoman.com>
References: <cover.1734468756.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 20:55:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208853

From: Louis Rannou <lrannou@baylibre.com>

The wheel group is not declared while it can be used to access the systemd
journal and to configure printers in CUPS. It can also be used for su and sudo
permissions.

So far it was created later in the rootfs postcommand systemd_create_users.

Signed-off-by: Louis Rannou <lrannou@baylibre.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit bebe52ae9576393ebb9d7405fc77fba21e84ba5b)
Signed-off-by: Jonas Gorski <jonas.gorski@bisdn.de>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../base-passwd/0008-Add-wheel-group.patch    | 20 +++++++++++++++++++
 .../base-passwd/base-passwd_3.5.52.bb         |  1 +
 2 files changed, 21 insertions(+)
 create mode 100644 meta/recipes-core/base-passwd/base-passwd/0008-Add-wheel-group.patch

diff --git a/meta/recipes-core/base-passwd/base-passwd/0008-Add-wheel-group.patch b/meta/recipes-core/base-passwd/base-passwd/0008-Add-wheel-group.patch
new file mode 100644
index 0000000000..00eaec38a2
--- /dev/null
+++ b/meta/recipes-core/base-passwd/base-passwd/0008-Add-wheel-group.patch
@@ -0,0 +1,20 @@
+
+We need to have a wheel group which has some system privileges to consult the
+systemd journal or manage printers with cups.
+
+Upstream status says the group does not exist by default.
+
+Upstream-Status: Inappropriate [enable feature]
+
+Signed-off-by: Louis Rannou <lrannou@baylibre.com>
+Index: base-passwd-3.5.26/group.master
+===================================================================
+--- base-passwd-3.5.29.orig/group.master
++++ base-passwd-3.5.29/group.master
+@@ -38,5 +38,6 @@
+ staff:*:50:
+ games:*:60:
+ shutdown:*:70:
++wheel:*:80:
+ users:*:100:
+ nogroup:*:65534:
diff --git a/meta/recipes-core/base-passwd/base-passwd_3.5.52.bb b/meta/recipes-core/base-passwd/base-passwd_3.5.52.bb
index f89752c077..66b5a0e7dc 100644
--- a/meta/recipes-core/base-passwd/base-passwd_3.5.52.bb
+++ b/meta/recipes-core/base-passwd/base-passwd_3.5.52.bb
@@ -13,6 +13,7 @@ SRC_URI = "https://launchpad.net/debian/+archive/primary/+files/${BPN}_${PV}.tar
            file://0005-Add-kvm-group.patch \
            file://0006-Make-it-possible-to-build-without-debconf-support.patch \
            file://0007-Make-it-possible-to-disable-the-generation-of-the-do.patch \
+           file://0008-Add-wheel-group.patch \
            "
 
 SRC_URI[sha256sum] = "5dfec6556b5a16ecf14dd3f7c95b591d929270289268123f31a3d6317f95ccea"
-- 
2.34.1


