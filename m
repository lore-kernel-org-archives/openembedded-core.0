Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70582C4332F
	for <webhook@archiver.kernel.org>; Thu,  9 Nov 2023 10:34:44 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.118588.1699526075898590984
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Nov 2023 02:34:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=O8/tyKwU;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4079ed65582so4494075e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Nov 2023 02:34:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1699526074; x=1700130874; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OWVcNlrBjmvmPojc6ajhWrenn1OSmn+0iTr8KsvAEow=;
        b=O8/tyKwUl3Df8m28G/yhtjf3KVrdkdsJY8aV/cXkIfeMP3KzzDowF7qVqGTT74BG++
         rdJtWygltVp9/zQLBjyDjhvFfLfpWjKTXSPPr5JdcFK3cTtcckDHuHhiw+C/W7rDxZnY
         gQQWAQyFo266J5hGZo9M7GzJlaBGZCy+Y9DR0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699526074; x=1700130874;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OWVcNlrBjmvmPojc6ajhWrenn1OSmn+0iTr8KsvAEow=;
        b=B3gV7Q/3O9yJfS50LTA0tyMWR+ipIib4j+HZSkjBSsSTBljYFQgECiZt9xba0ruZq1
         uxGbF9WQwkTVS7EYkidhjEUja8YqTbnKTCKkd/t+XLTCzVhuX6yVZbdqn2EFVcjRQ1vu
         Gzy0Th4CHWCh2bRkx+rFUbdGac5R70MwYsyqfESCbZnCNb+49EF/dFFK8bnwavB7D1nZ
         qpqz5YZZhZMTSDlggrYnmqXSgYDGVKu7Wm98p3OGQOwjWSZSDulb9MXc24AowDgWz6Wp
         KjgelpQ5KHgavlI5n4Vo/X1bQNEB369n9wvDUvJtKCd0wLtao1zY46enO5I1jWIlAcfy
         Gw9Q==
X-Gm-Message-State: AOJu0YysCZNDgRqV3NSq0FlpfqG3oUD234hQ+95cuf+vwndEW6jBNP80
	dCovPI3xD5ijXw1xJNIzy6Y5tVcyRMgrUu8g0vw=
X-Google-Smtp-Source: AGHT+IHIQgjE4Mlw6OQcPCYPorofqYH+LUdQJs/pIRdy0akL7DY/jFcDyY5IhbFxUrlU88uJUqRG1g==
X-Received: by 2002:a05:600c:4f93:b0:401:a0b1:aef6 with SMTP id n19-20020a05600c4f9300b00401a0b1aef6mr4463765wmq.2.1699526074020;
        Thu, 09 Nov 2023 02:34:34 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:7d6a:4777:87ed:703e])
        by smtp.gmail.com with ESMTPSA id u8-20020a05600c138800b004075d5664basm1697497wmf.8.2023.11.09.02.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Nov 2023 02:34:33 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Jon Mason <Jon.Mason@arm.com>,
	Ross Burton <ross.burton@arm.com>
Subject: [PATCH] libdnf: Fix arm arch mapping issues for qemuarmv5
Date: Thu,  9 Nov 2023 10:34:32 +0000
Message-Id: <20231109103432.1639496-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Nov 2023 10:34:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190380

qemuarmv5 currently fails with:

$ dnf --help
Error: Incorrect or unknown "arch": armv5hl

Fix this by removing the code in libdnf which is trying to be too
clever, we don't need this mappings given the way OE configures rpm.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/libdnf/libdnf_0.72.0.bb             | 1 +
 meta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb | 8 ++++----
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/libdnf/libdnf_0.72.0.bb b/meta/recipes-devtools/libdnf/libdnf_0.72.0.bb
index d58ad0353ff..a8685a16048 100644
--- a/meta/recipes-devtools/libdnf/libdnf_0.72.0.bb
+++ b/meta/recipes-devtools/libdnf/libdnf_0.72.0.bb
@@ -10,6 +10,7 @@ SRC_URI = "git://github.com/rpm-software-management/libdnf;branch=dnf-4-master;p
            file://0001-Get-parameters-for-both-libsolv-and-libsolvext-libdn.patch \
            file://enable_test_data_dir_set.patch \
            file://0001-drop-FindPythonInstDir.cmake.patch \
+           file://armarch.patch \
            "
 
 SRCREV = "908dba63c9e18c86a2d81166ce7523559e65338c"
diff --git a/meta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb b/meta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb
index 671c0a290e8..c9bf85013f4 100644
--- a/meta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb
+++ b/meta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb
@@ -17,7 +17,7 @@ S = "${WORKDIR}"
 # Since we refer to ROOTLESS_X which is normally enabled per-machine
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-inherit update-rc.d systemd features_check
+inherit systemd features_check
 
 REQUIRED_DISTRO_FEATURES = "x11 ${@oe.utils.conditional('ROOTLESS_X', '1', 'pam', '', d)}"
 
@@ -64,8 +64,8 @@ do_install() {
 
 RDEPENDS:${PN} = "xinit ${@oe.utils.conditional('ROOTLESS_X', '1', 'xuser-account libcap libcap-bin', '', d)}"
 
-INITSCRIPT_NAME = "xserver-nodm"
-INITSCRIPT_PARAMS = "start 9 5 . stop 20 0 1 2 3 6 ."
-SYSTEMD_SERVICE:${PN} = "xserver-nodm.service"
+#INITSCRIPT_NAME = "xserver-nodm"
+#INITSCRIPT_PARAMS = "start 9 5 . stop 20 0 1 2 3 6 ."
+#SYSTEMD_SERVICE:${PN} = "xserver-nodm.service"
 
 RCONFLICTS:${PN} = "xserver-common (< 1.34-r9) x11-common"
-- 
2.39.2


