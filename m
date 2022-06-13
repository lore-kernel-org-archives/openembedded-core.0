Return-Path: <badganchipv@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AC58C433EF
	for <webhook@archiver.kernel.org>; Mon, 13 Jun 2022 13:48:37 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web08.6104.1655128108694745634
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jun 2022 06:48:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ciEtH/0+;
 spf=pass (domain: gmail.com, ip: 209.85.216.46,
 mailfrom: badganchipv@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id cx11so5694383pjb.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jun 2022 06:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GCdrs0P5jpCRP1A6s54Wd0Pwy1zdZE8isXcOrnNaUv0=;
        b=ciEtH/0+WQricng2G0ph3ZSOv/jwYmk7aEGxWFB6WgtCSE8rnWT8O5v7qF7jLYay40
         dd7jwA2NlDv1GyglQkOb4w0RLYN15K6Tm7ZVKZ92KZ1ZV7HZTbCiPYj09KwGn8isAu7f
         Iz0oicMnsHZ5YpwY+zjGA/SOp8byCZ2PVqN/PcNorkMKE9RFL+8ss7Y5jKTNXx8bf0Ax
         KFAO7LengpWEaca0jHw0vWfwexSbc1qZQblQlboC6ZE/4ZxvLGJpasbzbXuPlq1MRNjR
         R2kya6rhYWGXHosAr9k6LTG2jVMNtBqwi4PCsoZWBzlM8UKdcmxTeV/rhB8Nx+5C8sG6
         YPaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GCdrs0P5jpCRP1A6s54Wd0Pwy1zdZE8isXcOrnNaUv0=;
        b=DqidAs7Cx4yvox5GhVpiKhIofl1kQIJpz5vpdqklhuzeMh0+MJcqxS4w/KzS3DSUa4
         eBH/LRRrt0i9gf6I16vHGkvDYTWZJ6YGTdMQlMI1McIFavG4DUHpCJ419gtAvCp6RH5D
         yUHxCfmMFQrKos4Q1AN9gvXjX6B06sCo1i6Qsuo6XoadY4MMGHq3brBcvcQPdFtXCV5z
         eBVcvVNQJXNfTfSLRQib9moZpt0KUCuvXQ5KYg4+crwTxDl7+fqsIrclN+CJwjSFa46I
         jLpyq3Vk05k9krlvTh1YG5CPJoF7/BRGx5kTmGm4DqypO0lyc4NwTe3bvDA8rynzd3kt
         G68A==
X-Gm-Message-State: AOAM533z08Cti0hEmJtexORg/AtU1GC+bU4LVpucUBGmGmjJeLTeMbQL
	7I2g7X4k9XZjT0YkpSSejC4FaKyULfew7g==
X-Google-Smtp-Source: 
 ABdhPJzn0LidntjVzLREsxhI/MIvfYm0gdLYrrQkiG0K/Di1ZSU8pQs8Is7bS6zcZeuAsZqetDNMSg==
X-Received: by 2002:a17:902:b610:b0:168:cd85:d7a2 with SMTP id
 b16-20020a170902b61000b00168cd85d7a2mr11011648pls.125.1655128108063;
        Mon, 13 Jun 2022 06:48:28 -0700 (PDT)
Received: from localhost.localdomain
 ([2409:4042:2407:4bd4:598a:2931:da4d:4bf])
        by smtp.gmail.com with ESMTPSA id
 z10-20020a1709027e8a00b0015e8d4eb209sm5127207pla.83.2022.06.13.06.48.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jun 2022 06:48:27 -0700 (PDT)
From: pawan <badganchipv@gmail.com>
To: openembedded-core@lists.openembedded.org,
	badganchipv@gmail.com
Cc: ranjitsinh.rathod@kpit.com
Subject: [meta][dunfell][PATCH] openssh: Whitelist CVE-2021-36368
Date: Mon, 13 Jun 2022 19:18:15 +0530
Message-Id: <20220613134815.9686-1-badganchipv@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jun 2022 13:48:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166844

From: Pawan Badganchi <badganchipv@gmail.com>

As per debian, the issue is fixed by a feature called
"agent restriction" in openssh 8.9.
Urgency is unimportant as per debian, Hence this CVE is whitelisting.
Link:
https://security-tracker.debian.org/tracker/CVE-2021-36368
https://bugzilla.mindrot.org/show_bug.cgi?id=3316#c2
https://docs.ssh-mitm.at/trivialauth.html

Signed-off-by: Pawan Badganchi <badganchipv@gmail.com>
---
 meta/recipes-connectivity/openssh/openssh_8.2p1.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-connectivity/openssh/openssh_8.2p1.bb b/meta/recipes-connectivity/openssh/openssh_8.2p1.bb
index ddc9ed0b32..eaec26cac0 100644
--- a/meta/recipes-connectivity/openssh/openssh_8.2p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_8.2p1.bb
@@ -60,6 +60,13 @@ CVE_CHECK_WHITELIST += "CVE-2008-3844"
 # https://ubuntu.com/security/CVE-2016-20012
 CVE_CHECK_WHITELIST += "CVE-2016-20012"
 
+# As per debian, the issue is fixed by a feature called "agent restriction" in openssh 8.9
+# Urgency is unimportant as per debian, Hence this CVE is whitelisting.
+# https://security-tracker.debian.org/tracker/CVE-2021-36368
+# https://bugzilla.mindrot.org/show_bug.cgi?id=3316#c2
+# https://docs.ssh-mitm.at/trivialauth.html
+CVE_CHECK_WHITELIST += "CVE-2021-36368"
+
 PAM_SRC_URI = "file://sshd"
 
 inherit manpages useradd update-rc.d update-alternatives systemd
-- 
2.36.1


