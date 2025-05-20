Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D54BC54E90
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 19:48:34 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web11.415.1747770510245857572
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 May 2025 12:48:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=DOwqkQ6x;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.42, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-30ec226b7d6so2972917a91.2
        for <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 12:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1747770509; x=1748375309; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E7S7DJC2CmyaeljiVVYqwDTkbnqbfwXcJdCJyEdsBfo=;
        b=DOwqkQ6xRwQHQG4vYxnWLjlsNkHGvIgkzw7V4jfsi/4MFgizJmiIwhcOwWeDEqtULY
         ucvJttNSGD5TO5M4R+hjvKQKqNYenc00ZRVrd4GVBQJhK5YeCNQWOC++hglON2PgQCdm
         gzruBh1n9CJAo2ZoqVVmfe2bzAmbmBWFlZb39RHDZOh/8vTqqvNPRH6Do/TZTjIQakUI
         x/3GHaZNzkHOu/VkBMq99uBOIrGVBnWI6zrleylQ8F657EIsFlqo2sB2loMKs5yVkGa9
         EGbYkT82Sz14s3c8YMCPtMqxTdpaB7XnUH39QO4jpMZXRgvOIDA1AyO3um1Elntl89ei
         ZWog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747770509; x=1748375309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E7S7DJC2CmyaeljiVVYqwDTkbnqbfwXcJdCJyEdsBfo=;
        b=qk527x52w9ZhK41N7EvuN1gAGPDiDS5azZrHEs9F1csNjw5WahLelWzg3BhF8hiPGw
         6tdDB07kyoji0apl7fISARz/VYHFqIclneuFZ8fyCI1rZQ+Wh+V1rQn80sc85rae3pHy
         QKkDk1xzN7sJMnBVla+BwppSvPVUR7RSJthm84z4grE/gnly0TDmfvNKda+U9glO8XHo
         LrEOSJAgkK6ybPhhGCWeaX/cV/okC5R9fpmWmMVAaTOTGH5aqrLlTem6dwfWkBD96lGV
         lmq23tO+T6i7BTi7PqPTNZ2Rt+9JNj6YOaIQozuoyQaXZRrZ72WO7ILKJmV2el41YssY
         ZAZg==
X-Gm-Message-State: AOJu0YxVrDBeIdxNuAt1wdTbnZ4CORjLh2OeVQJFPv97uyKnC/D0DswM
	gc2C4t9LQt+cdAhFxI+5poE6zR9SM8gfwZQC3btKDT1C5vsRFOambFkcwt+XXs7hy/K4Z0wZrc/
	lzW1C
X-Gm-Gg: ASbGncvwgES5ryxwrqrlsFlChc+iLSE/zqQ4of8eoUHinhmI3k6LteyXI2e5GJqwj30
	VALHXCa1qoCHLmF6qewWL1rsRW9+vCUTFR3fsQhbNOWcSxgDt99PAfvTWiZM5exxxs7j4+YPRm2
	KZyUn3y1jIpQ+qO9As8PGiEnCFeZfyLlCU55JAITOYu3//+gR3PfMDDwnM64qpO6Y7aVSG0MJH2
	SBL5puKpgirSz60WPM+9kUVjZtnk0g6KE17NMxhtbZ6OwzofI5T0TqLYDGF4bIJnP1JGf1Evtv9
	Tooonq0F83SAOVVq7XqU7pPb5GfClqmkXFkx2I+ODA==
X-Google-Smtp-Source: AGHT+IG2UuySpvMPnPF2OW07PYVPG+7UArAPYtQ5qJDvuui8L+FoG85pxWf0xaVgLQzC+fPdhakZAg==
X-Received: by 2002:a17:90a:d604:b0:30c:523e:89e3 with SMTP id 98e67ed59e1d1-30e7d520e3dmr30268172a91.11.1747770509474;
        Tue, 20 May 2025 12:48:29 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:48df:296e:5350:93e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f36386944sm2120772a91.14.2025.05.20.12.48.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 12:48:29 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 4/8] openssh: Upgrade 9.9p2 -> 10.0p1
Date: Tue, 20 May 2025 12:48:11 -0700
Message-ID: <f1653e02abc2fe88fa33cb0956e43312c6c2cc25.1747770224.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1747770224.git.steve@sakoman.com>
References: <cover.1747770224.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 19:48:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216937

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Fix sshd by ensuring the agent daemon is included.

Internally, this release is versioned as 10.0p2 but upstream don't plan to
change this or re-release.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2a4dd93e98ca9e61644213aa00c1cb837fb27316)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...gress-test-exec-use-the-absolute-path-in-the-SSH-e.patch | 6 +++---
 .../openssh/{openssh_9.9p2.bb => openssh_10.0p1.bb}         | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-connectivity/openssh/{openssh_9.9p2.bb => openssh_10.0p1.bb} (98%)

diff --git a/meta/recipes-connectivity/openssh/openssh/0001-regress-test-exec-use-the-absolute-path-in-the-SSH-e.patch b/meta/recipes-connectivity/openssh/openssh/0001-regress-test-exec-use-the-absolute-path-in-the-SSH-e.patch
index b90cd2e69d..360b62af34 100644
--- a/meta/recipes-connectivity/openssh/openssh/0001-regress-test-exec-use-the-absolute-path-in-the-SSH-e.patch
+++ b/meta/recipes-connectivity/openssh/openssh/0001-regress-test-exec-use-the-absolute-path-in-the-SSH-e.patch
@@ -1,4 +1,4 @@
-From fb762172fb678fe29327b667f8fe7380962a4540 Mon Sep 17 00:00:00 2001
+From 9dcccafe44ea17e972e7cddea205bbe9fe71d8d6 Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <jose.quaresma@foundries.io>
 Date: Mon, 15 Jul 2024 18:43:08 +0100
 Subject: [PATCH] regress/test-exec: use the absolute path in the SSH env
@@ -18,10 +18,10 @@ Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
  1 file changed, 5 insertions(+)
 
 diff --git a/regress/test-exec.sh b/regress/test-exec.sh
-index 7afc2807..175f554b 100644
+index 8a00c72..2891f27 100644
 --- a/regress/test-exec.sh
 +++ b/regress/test-exec.sh
-@@ -175,6 +175,11 @@ if [ "x$TEST_SSH_OPENSSL" != "x" ]; then
+@@ -179,6 +179,11 @@ if [ "x$TEST_SSH_OPENSSL" != "x" ]; then
  fi
  
  # Path to sshd must be absolute for rexec
diff --git a/meta/recipes-connectivity/openssh/openssh_9.9p2.bb b/meta/recipes-connectivity/openssh/openssh_10.0p1.bb
similarity index 98%
rename from meta/recipes-connectivity/openssh/openssh_9.9p2.bb
rename to meta/recipes-connectivity/openssh/openssh_10.0p1.bb
index 5191725796..a044aec063 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.9p2.bb
+++ b/meta/recipes-connectivity/openssh/openssh_10.0p1.bb
@@ -26,7 +26,7 @@ SRC_URI = "https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.ta
            file://0001-regress-banner.sh-log-input-and-output-files-on-erro.patch \
            file://0001-regress-test-exec-use-the-absolute-path-in-the-SSH-e.patch \
            "
-SRC_URI[sha256sum] = "91aadb603e08cc285eddf965e1199d02585fa94d994d6cae5b41e1721e215673"
+SRC_URI[sha256sum] = "021a2e709a0edf4250b1256bd5a9e500411a90dddabea830ed59cef90eb9d85c"
 
 CVE_STATUS[CVE-2007-2768] = "not-applicable-config: This CVE is specific to OpenSSH with the pam opie which we don't build/use here."
 
@@ -197,7 +197,7 @@ FILES:${PN}-scp = "${bindir}/scp.${BPN}"
 FILES:${PN}-ssh = "${bindir}/ssh.${BPN} ${sysconfdir}/ssh/ssh_config"
 FILES:${PN}-sshd = "${sbindir}/sshd ${libexecdir}/sshd-session ${sysconfdir}/init.d/sshd ${systemd_system_unitdir}"
 FILES:${PN}-sshd += "${sysconfdir}/ssh/moduli ${sysconfdir}/ssh/sshd_config ${sysconfdir}/ssh/sshd_config_readonly ${sysconfdir}/default/volatiles/99_sshd ${sysconfdir}/pam.d/sshd"
-FILES:${PN}-sshd += "${libexecdir}/${BPN}/sshd_check_keys"
+FILES:${PN}-sshd += "${libexecdir}/${BPN}/sshd_check_keys ${libexecdir}/sshd-auth"
 FILES:${PN}-sftp = "${bindir}/sftp"
 FILES:${PN}-sftp-server = "${libexecdir}/sftp-server"
 FILES:${PN}-misc = "${bindir}/ssh* ${libexecdir}/ssh*"
-- 
2.43.0


