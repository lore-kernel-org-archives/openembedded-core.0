Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 975C3D6D235
	for <webhook@archiver.kernel.org>; Wed, 27 Nov 2024 19:59:12 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.80587.1732737548855309138
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Nov 2024 11:59:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bbDJ7KXg;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-21260cfc918so484065ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 11:59:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732737547; x=1733342347; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4OHwTOUk2ynTdbld0Knl9EFB1JcfPdz3LjpXtSRgWhE=;
        b=bbDJ7KXgm7VyK8DxhX/2fDGJZSi3kAvGhxUkF19bcQRkBrbY038iPZvIiQdPKykM5C
         FjQV3Dw9tIbxY/IxZqqcuUFJo9yLmYmiuqp8NWCT/d1C6+/NNOFW1NQidZr1rF8GEhA0
         m7VIw2Op8FP3IwZYyasHf3EhNrzPwryx91nQHhSZslSTe1Q4SDH5wyaxYAt+oBgtmkS/
         4JXMTIr1G+lLQRFIYx+18qItHzhilOzxEiXxMECh7e5KgVlFZpn6zxXE/oKJH/fuDHRg
         od38uRev84mNXNzLC37NpE28zYQ9Y5/LB1P3fdo24knWEXk3kgr+V7X9wWWIZegG5oko
         ArKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732737547; x=1733342347;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4OHwTOUk2ynTdbld0Knl9EFB1JcfPdz3LjpXtSRgWhE=;
        b=G9dtxptNotoMCLHJ724MQcxVg6XeK3LXzErc7CPW+ZK+x4OJgD+aJzBU+tCFdlA78s
         7z0YD5mCdlpKbr2PvQEwE01Dmbt7a4hbrG1A+7EPEezCE+f1eYnsG3vnCIrGhN2UuqHn
         Ts9IVmdiTE0nCJqYD2wcYoNl9spXyM0pAWzpcsv97/BYxBRrNGVoy6NHgkv/+EDqv5Y8
         dB/uqmiWAPJIVu9MZt1fF+/5S1YHTVcZkR791PiPvsliwVPPURcW4BnhYCckAb5o1h7A
         E3QkKaSA416TSDGzixeMjfBmMsMHsK45xgxJSSmjkO3cgei8amHwXEIsIRuFVCXU7jMr
         K6Pg==
X-Gm-Message-State: AOJu0YwC30JkI+ZK+x5+OyN5PJlQbH8Jt9mA9a2ZmVFdPu+RFh49dwFu
	JC5j9lWcXv+ewcmLUDePJSIJ+1aBNafQoNJoAZqe2/KE66m/xucLq6mxJsWA
X-Gm-Gg: ASbGncsu+wlTsl12pMTxN305tNWpQT6q1z7EOFV0BWM4zc0KLEAyhQE3WxD2A6oL4Ag
	LCEH8VMd6HdGzu5DKdTdtrBqb7p/wtmRHZu+XUMAJ97osDY9UapDRBun5Eysux1KBGFkjO/XYWS
	WQzfI27bAtzhay7JewpYD67wkHTjOD274UV3fwCL+n4aF8qo6+HnDWX/PsKI6D4JYTnH5J/gAjU
	Dey9MsPNZt0u8KGh7Oa9bbZp43IsdquPBHdgpqIyNxSw3whf8R+
X-Google-Smtp-Source: AGHT+IH9paPyu1qhUBLktFoBna5uWcduAHRWWgaK1+A73kPtapGgB1EPZIyoI+K4lZrHlUm1Ey4P9g==
X-Received: by 2002:a17:902:cf07:b0:20c:5909:cc48 with SMTP id d9443c01a7336-21501b63d18mr60586135ad.40.1732737547040;
        Wed, 27 Nov 2024 11:59:07 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8201:fd20::4338])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2129dba5a7esm106958465ad.83.2024.11.27.11.59.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 11:59:06 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 1/2] seatd: Create seat user and package systemd service
Date: Wed, 27 Nov 2024 11:59:03 -0800
Message-ID: <20241127195904.91647-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 19:59:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207963

With latest version seatd does not work properly if
user access permissions are not correctly set, therefore
create 'seat' group and package the seatd.service file
and enable it by default with systemd distro feature

set logind to systemd when using systemd as default init system

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Use seat group instead of video group in init file

 meta/recipes-core/seatd/seatd/init     |  2 +-
 meta/recipes-core/seatd/seatd_0.9.1.bb | 11 +++++++++--
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/seatd/seatd/init b/meta/recipes-core/seatd/seatd/init
index 0589c765ac7..405000c16f3 100644
--- a/meta/recipes-core/seatd/seatd/init
+++ b/meta/recipes-core/seatd/seatd/init
@@ -15,7 +15,7 @@ killproc() {
 
 case "$1" in
   start)
-        seatd -g video -n 1 > /tmp/seatd-start-notify &
+        seatd -g seat -n 1 > /tmp/seatd-start-notify &
         [ -s /tmp/seatd-start-notify ] && exit 0
         sleep 0.1
         [ -s /tmp/seatd-start-notify ] && exit 0
diff --git a/meta/recipes-core/seatd/seatd_0.9.1.bb b/meta/recipes-core/seatd/seatd_0.9.1.bb
index 8da57acc567..8ee43a3dc8f 100644
--- a/meta/recipes-core/seatd/seatd_0.9.1.bb
+++ b/meta/recipes-core/seatd/seatd_0.9.1.bb
@@ -11,7 +11,7 @@ SRC_URI = "git://git.sr.ht/~kennylevinsen/seatd;protocol=https;branch=master \
 SRCREV = "566ffeb032af42865dc1210e48cec08368059bb9"
 S = "${WORKDIR}/git"
 
-inherit meson pkgconfig update-rc.d
+inherit meson pkgconfig systemd update-rc.d useradd
 
 # https://www.openwall.com/lists/musl/2020/01/20/3
 CFLAGS:append:libc-musl:powerpc64le = " -Wno-error=overflow"
@@ -22,14 +22,21 @@ PACKAGECONFIG ?= " \
 "
 
 PACKAGECONFIG[libseat-builtin] = "-Dlibseat-builtin=enabled,-Dlibseat-builtin=disabled"
-PACKAGECONFIG[systemd] = ",,systemd"
+PACKAGECONFIG[systemd] = "-Dlibseat-logind=systemd,,systemd"
 
 do_install:append() {
         if [ "${VIRTUAL-RUNTIME_init_manager}" != "systemd" ]; then
                 install -Dm755 ${UNPACKDIR}/init ${D}/${sysconfdir}/init.d/seatd
+        else
+                install -Dm644 ${S}/contrib/systemd/seatd.service ${D}${systemd_unitdir}/system/seatd.service
         fi
 }
 
+USERADD_PACKAGES = "${PN}"
+GROUPADD_PARAM:${PN} = "-r seat"
+
 INITSCRIPT_NAME = "seatd"
 INITSCRIPT_PARAMS = "start 9 5 2 . stop 20 0 1 6 ."
 INHIBIT_UPDATERCD_BBCLASS = "${@oe.utils.conditional('VIRTUAL-RUNTIME_init_manager', 'systemd', '1', '', d)}"
+
+SYSTEMD_SERVICE:${PN} = "seatd.service"

