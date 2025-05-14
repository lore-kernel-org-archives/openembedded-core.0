Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5F9BC3ABCC
	for <webhook@archiver.kernel.org>; Wed, 14 May 2025 14:06:00 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.103383.1747231553119368152
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 May 2025 07:05:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IQJXki9d;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cfba466b2so77472325e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 14 May 2025 07:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1747231551; x=1747836351; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=N59KJ5z6dc1dUKszAicgWuBKY0kuDKR7B9Si2FY6PQM=;
        b=IQJXki9dndjJC0u3m0fW+IJFSd3T0583Ucq4LAj0PnmG12FHVyJqEOs9EerUrvsX6x
         Ye1Rb5IuvXAgOodvoUKKd1OiTRKdojoH82mSxO2GumH6E67Ackh9ldasbqmE/VewqWwY
         jhKqWYnCrVbXU8TsRAIlfPUZ7SOpvrUORfRq0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747231551; x=1747836351;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N59KJ5z6dc1dUKszAicgWuBKY0kuDKR7B9Si2FY6PQM=;
        b=cM2OvExQycsBxQ+BJl1XbrxodSSqSKOceG8iURlIfxvFusaDI2P/BfaXBUw8W3Nyza
         crTca/vUSbrvlfBivVa3H5QEEV1MbWPRZnomd1TuPd/obNaHgREVvX6M93EnFvIpsxfh
         1VvZOf8x4blayxo8gpjw9Bo6SYeYXzGA5cwxEwEOswo04yKc27U4gNCKKyZZboBMpXSj
         2OlS5AlcMjVZ9VSzekXuLznB2mbGyd8rTtC+UkGr2V35+G6tfCyZRZLxVmbe+u+Yc0U9
         aPei5aEWNLAZHaB4oLkZ/8KZWirTwolIsJJdiNZ/dbtSbY4djy+9IN+tGr4WGxTCIZIT
         jHcw==
X-Gm-Message-State: AOJu0YwWUsP14iLz03S59l5mkOkpL3ZK0+JTE3wStZ3CT96tzMeiYNKe
	ezd2XSuc0Arl0VDO7rCrJqw5qf/0ujIknL+jeQPqE6n46SA27lSfSRhZtS7Jv1njivc5zQ+c/As
	3
X-Gm-Gg: ASbGncsg/4UqsGFXzt1j2uId/AMYtDLaUYmuMHaz0K/F5ubqNAAtFr4ydq3Ov69UeqU
	a7vHhse2TFFmNq6tyIrAJhEe6+Kc+wqJNgGyI0GkOIibZrEJgki2lqNf3JRfPhC8lb9x8QsQgZP
	Ld0jQEQ0+EXuoH0kAtdkazacQlWP/niTs4we+94EV85q7qgbcZw438cbUKiv4uQLMOMqsovem1B
	rOHy2ExVu9HSivHHMrBndml4S3PDyqbwPPElpF5WPR6jvL026wiTTgxnf7S14bZOmwgU+TdZGCc
	/gLeO0IUOyPw+YJXdmmFLYK27k5hkxbIOQgKwargYd8hJ5ZPVCUrxMLSdwDjV51kwQyROBiOawT
	e+qG42P8a6Q5kcgE=
X-Google-Smtp-Source: AGHT+IF5V6zhElYohOoXq4MGZlRgKw3DUT0pYTswR6+HasUsE0IryHpTNo5vxYCqrAauRKtL/t1YPA==
X-Received: by 2002:a05:600c:64c8:b0:43d:1b74:e89a with SMTP id 5b1f17b1804b1-442f20db129mr34490565e9.9.1747231550063;
        Wed, 14 May 2025 07:05:50 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:ac80:8bbf:3444:fa34])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f3368fc5sm33824635e9.5.2025.05.14.07.05.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 07:05:49 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] openssh: Upgrade 9.9p2 -> 10.0p1
Date: Wed, 14 May 2025 15:05:47 +0100
Message-ID: <20250514140547.1482134-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 May 2025 14:06:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216495

Fix sshd by ensuring the agent daemon is included. The server doesn't function
without this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...gress-test-exec-use-the-absolute-path-in-the-SSH-e.patch | 6 +++---
 .../openssh/{openssh_9.9p2.bb => openssh_10.0p1.bb}         | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-connectivity/openssh/{openssh_9.9p2.bb => openssh_10.0p1.bb} (98%)

diff --git a/meta/recipes-connectivity/openssh/openssh/0001-regress-test-exec-use-the-absolute-path-in-the-SSH-e.patch b/meta/recipes-connectivity/openssh/openssh/0001-regress-test-exec-use-the-absolute-path-in-the-SSH-e.patch
index b90cd2e69d9..360b62af345 100644
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
index 51917257968..a044aec063e 100644
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

