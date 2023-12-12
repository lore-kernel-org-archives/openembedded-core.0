Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0ECAC4332F
	for <webhook@archiver.kernel.org>; Tue, 12 Dec 2023 22:40:46 +0000 (UTC)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
 by mx.groups.io with SMTP id smtpd.web11.9988.1702420839581131274
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Dec 2023 14:40:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=u4xFzDHr;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.50, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-6d9f9fbfd11so2865368a34.2
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Dec 2023 14:40:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1702420838; x=1703025638; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N2aAaiZ85/tbtR505dDO+52SRxmv3lq+6HzNhrs9t7w=;
        b=u4xFzDHr7kStXSE1YvpEh6+pkVpFRM1ScH11MhXwxMma4kMbuqOI/J3tmJKKEb+13p
         O9ZVX+JNKkgkzFKBJsywjRF1Lk8jrNz8pqZXiR6WEjPVFfg6AXN7qIQKkAMGRB+WDffc
         Hr8jWyec0sGz4jcozKJIrIMyYQVyZZwffpFhtAnCA2c9I7IP2+gs2V5mzz6D+WOnQ+Ov
         XRBd3plgvqegBiqiy4LcW1FrTqRntfAoBsH2qcT7d1XhiYniqpM9BWLl/rdkEJuXN346
         76xILbHRQG3lhqtMDeH/1ljmA16YYzSKhCydbiZBgN1Q/nXvOmXV7nnlPlD0MNYUvDwV
         C+jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702420838; x=1703025638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N2aAaiZ85/tbtR505dDO+52SRxmv3lq+6HzNhrs9t7w=;
        b=QAzAU7C+uuXusahMpMMlDxT49A8B+9u/DtCiovyCWP0u/uKv8n14ngokGo9XbT5oRi
         jdAmjViWI6r3Z43kOwYWkEbr0WyL8KkpcjLxJpxFENe3n9IMjrYbC4F1RWglEUnQq0Fm
         XGnFTweFYJBJMHrvu/4c3g/pfo47m5cs/yoZbUfGgk4jTLn4j5a+E80OtQlr86PYFDFg
         4LvprUGzASa8F8iYmceQbUWGjvntP7xbIXdFILdBLRPR6bMnEHwQoGQQ4LfNsdt7Grh6
         iLAPhhoFtxgOAZxs6RXikylptdDVCRGB+KKrFEqOgI+U9j081uZ6MwiXb7C5HsOeEl51
         2gqA==
X-Gm-Message-State: AOJu0YwKhHtAWR4ZMW4HmZx/9NprhnRMoAb82p/xbk6yb3BI+Gt7CKbq
	MJu5tWsoUZy19VDiQiDaULVf7UQxUCJQfvD7T68=
X-Google-Smtp-Source: AGHT+IHiF9XMt+0yfwrDrJLwcVALEpI2hl8GU23Is7NX8l8GTP3uHnZtoe+somnlwIpvCw7YtVpa+Q==
X-Received: by 2002:a05:6830:16c5:b0:6cd:a989:c7ea with SMTP id l5-20020a05683016c500b006cda989c7eamr6320843otr.16.1702420838182;
        Tue, 12 Dec 2023 14:40:38 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id g25-20020aa78759000000b006d0951e74cbsm3847974pfo.178.2023.12.12.14.40.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 14:40:37 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 5/5] openssh: drop sudo from ptest dependencies
Date: Tue, 12 Dec 2023 12:40:20 -1000
Message-Id: <96888cdac83ecc328ee4039bd1dd3f29b775cb40.1702420654.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1702420654.git.steve@sakoman.com>
References: <cover.1702420654.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Dec 2023 22:40:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192251

From: Mikko Rapeli <mikko.rapeli@linaro.org>

The tests don't actually need sudo on core-image-ptest-openssh.
Based on logs seen in
https://bugzilla.yoctoproject.org/show_bug.cgi?id=15178 it seems
that socket errors from sudo are creeping into stderr which are failing
the banner ptest from openssh. Removing sudo should help removing
the stderr messages and possibly cure the banner test failures.

(From OE-Core rev: 47e754f483b674b207bfddcc8d4c5d9a3008e102)

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-connectivity/openssh/openssh/run-ptest | 2 +-
 meta/recipes-connectivity/openssh/openssh_8.9p1.bb  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/openssh/openssh/run-ptest b/meta/recipes-connectivity/openssh/openssh/run-ptest
index 8a9b770d59..9a406e9b65 100755
--- a/meta/recipes-connectivity/openssh/openssh/run-ptest
+++ b/meta/recipes-connectivity/openssh/openssh/run-ptest
@@ -5,7 +5,7 @@ export SKIP_UNIT=1
 
 cd regress
 sed -i "/\t\tagent-ptrace /d" Makefile
-make -k BUILDDIR=`pwd`/.. .OBJDIR=`pwd` .CURDIR=`pwd` SUDO="sudo" tests \
+make -k BUILDDIR=`pwd`/.. .OBJDIR=`pwd` .CURDIR=`pwd` SUDO="" tests \
         | sed -u -e 's/^skipped/SKIP: /g' -e 's/^ok /PASS: /g' -e 's/^failed/FAIL: /g'
 
 SSHAGENT=`which ssh-agent`
diff --git a/meta/recipes-connectivity/openssh/openssh_8.9p1.bb b/meta/recipes-connectivity/openssh/openssh_8.9p1.bb
index da7ab7716c..32761b8bb8 100644
--- a/meta/recipes-connectivity/openssh/openssh_8.9p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_8.9p1.bb
@@ -170,7 +170,7 @@ RDEPENDS:${PN}-sshd += "${PN}-keygen ${@bb.utils.contains('DISTRO_FEATURES', 'pa
 # conflict with each other
 RDEPENDS:${PN}-dev = ""
 # gdb would make attach-ptrace test pass rather than skip but not worth the build dependencies
-RDEPENDS:${PN}-ptest += "${PN}-sftp ${PN}-misc ${PN}-sftp-server make sed sudo coreutils"
+RDEPENDS:${PN}-ptest += "${PN}-sftp ${PN}-misc ${PN}-sftp-server make sed coreutils"
 
 RPROVIDES:${PN}-ssh = "ssh"
 RPROVIDES:${PN}-sshd = "sshd"
-- 
2.34.1


