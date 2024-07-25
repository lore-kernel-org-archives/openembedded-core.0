Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 639BFC3DA64
	for <webhook@archiver.kernel.org>; Thu, 25 Jul 2024 13:23:27 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.36228.1721913802332670202
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jul 2024 06:23:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ifxnEnxm;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-42803bbf842so9395245e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Jul 2024 06:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721913800; x=1722518600; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nU5dT4CBcU5QOBsrOqtb8AbRlwa4nnJVFWYeE0eigOI=;
        b=ifxnEnxm7ziDwV4BIQ1wJsimDVOH3nncoXlIfxjX+cFXQH7vYSJ2PgOMCNzXhxNOIM
         sCib0iD4++ngrNOjPEn3xHtJiSeOVg13IUiZTeH0fM6EEBg6t79gFw79tuRCxSWKn4IE
         7a5/EjRx/zE9jko8A36ueMiLv+O388EvhxA4RWp213P8dlfbwvZT9xwVMDgDxH3+vYF2
         LGZbIk8osVTGvbgFBiYqepJ3+3lvsCtOm5rBliW/Cg8PiHeJQBLOxQllYFA1/X/DHR9X
         +OoaS6EsYyYVMuhVw6RJTutmND+kVWNM7WIhMlZdHy3Iyw9ZsqVew0aM4f5XNCxz3kmG
         DXOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721913800; x=1722518600;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nU5dT4CBcU5QOBsrOqtb8AbRlwa4nnJVFWYeE0eigOI=;
        b=WAUXLbHDp2FI7SBevch3fmB4nV221SOcvTF2+yArMo/jCQyUlj3P3e0HerruZPDnJC
         JAdWQ69fIjWrio/04Z9smz8eaOa1CahV5d9iRcwLsZDq0l2A8BHHDAXvrk8fjSrllwDZ
         0oBmO0I5XDkKMYT95rS5/LplAdTwOaQBygvn9+sZvjByxu+MC+AVw3PTaZ3h78e5rZPo
         ejggWikKz7WgheuvXNwsnVcY45hQN/VX5EBQA0HtnTRPRisJx+5x7/Htz6pSW0cE+9N7
         LikQPVav8T3lCrBXgzqytNAepc0yDz/cDzaGir4lgbbM+tipOUOF1Opd2/sVwB3HjlSi
         7ILw==
X-Gm-Message-State: AOJu0YxikWAD571WxqEoMkHg31TNROtIchwhhVXb1elKegS+h1Gpzttz
	ofYTiho0d5n9eEdJwYTOWyDFqtgD5PALlkpP+zMMrnos/3Fvuk8YPWomVQ==
X-Google-Smtp-Source: AGHT+IGK2ndpZX/KlGcWdBlTPYVK4DGxkq9HhVa12K82h/QJCUA/IRA2ujN9yKZzn8Ijo7IQuVdUNg==
X-Received: by 2002:a05:600c:5703:b0:426:6bf9:608d with SMTP id 5b1f17b1804b1-42806b86ef9mr17123655e9.12.1721913800188;
        Thu, 25 Jul 2024 06:23:20 -0700 (PDT)
Received: from toster.lan (bl15-243-112.dsl.telepac.pt. [188.80.243.112])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42805749f12sm37145475e9.21.2024.07.25.06.23.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jul 2024 06:23:19 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [OE-core][PATCH v8 3/3] libssh2: fix ptest regression with openssh 9.8p1
Date: Thu, 25 Jul 2024 14:23:13 +0100
Message-ID: <20240725132313.2179033-3-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240725132313.2179033-1-jose.quaresma@foundries.io>
References: <20240725132313.2179033-1-jose.quaresma@foundries.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Jul 2024 13:23:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202500

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 ...t-drop-ssh-dss-openssh_server-config.patch | 30 +++++++++++++++++++
 .../recipes-support/libssh2/libssh2_1.11.0.bb |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-support/libssh2/libssh2/0001-test-drop-ssh-dss-openssh_server-config.patch

diff --git a/meta/recipes-support/libssh2/libssh2/0001-test-drop-ssh-dss-openssh_server-config.patch b/meta/recipes-support/libssh2/libssh2/0001-test-drop-ssh-dss-openssh_server-config.patch
new file mode 100644
index 0000000000..acab5c3776
--- /dev/null
+++ b/meta/recipes-support/libssh2/libssh2/0001-test-drop-ssh-dss-openssh_server-config.patch
@@ -0,0 +1,30 @@
+From 3ba10a5fe090ef76e4dcb710d3f431a0caecc28d Mon Sep 17 00:00:00 2001
+From: Jose Quaresma <jose.quaresma@foundries.io>
+Date: Thu, 25 Jul 2024 14:02:00 +0100
+Subject: [PATCH] test: drop ssh-dss openssh_server config
+
+The ssh-dss was deprecated [1] in the OpenSSH 9.8p1
+
+Support for ssh-dss, ssh-dss-cert-* host and user keys is disabled
+by default at run-time. These may be re-enabled using the
+instructions at http://www.openssh.com/legacy.html
+
+[1] https://www.openssh.com/releasenotes.html
+
+Upstream-Status: Submitted [https://github.com/libssh2/libssh2/pull/1433]
+
+Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
+---
+ tests/openssh_server/sshd_config | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tests/openssh_server/sshd_config b/tests/openssh_server/sshd_config
+index 1069566f..5cd2b898 100644
+--- a/tests/openssh_server/sshd_config
++++ b/tests/openssh_server/sshd_config
+@@ -1,4 +1,4 @@
+ HostKeyAlgorithms +ssh-rsa
+-PubkeyAcceptedKeyTypes +ssh-rsa,ssh-dss,ssh-rsa-cert-v01@openssh.com
++PubkeyAcceptedKeyTypes +ssh-rsa,ssh-rsa-cert-v01@openssh.com
+ MACs +hmac-sha1,hmac-sha1-96,hmac-sha2-256,hmac-sha2-512,hmac-md5,hmac-md5-96,umac-64@openssh.com,umac-128@openssh.com,hmac-sha1-etm@openssh.com,hmac-sha1-96-etm@openssh.com,hmac-sha2-256-etm@openssh.com,hmac-sha2-512-etm@openssh.com,hmac-md5-etm@openssh.com,hmac-md5-96-etm@openssh.com,umac-64-etm@openssh.com,umac-128-etm@openssh.com
+ Ciphers +3des-cbc,aes128-cbc,aes192-cbc,aes256-cbc,aes128-ctr,aes192-ctr,aes256-ctr,aes128-gcm@openssh.com,aes256-gcm@openssh.com,chacha20-poly1305@openssh.com
diff --git a/meta/recipes-support/libssh2/libssh2_1.11.0.bb b/meta/recipes-support/libssh2/libssh2_1.11.0.bb
index dc9b9ae364..d47fc44cbf 100644
--- a/meta/recipes-support/libssh2/libssh2_1.11.0.bb
+++ b/meta/recipes-support/libssh2/libssh2_1.11.0.bb
@@ -10,6 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=24a33237426720395ebb1dd1349ca225"
 SRC_URI = "http://www.libssh2.org/download/${BP}.tar.gz \
            file://run-ptest \
            file://CVE-2023-48795.patch \
+           file://0001-test-drop-ssh-dss-openssh_server-config.patch \
            "
 
 SRC_URI[sha256sum] = "3736161e41e2693324deb38c26cfdc3efe6209d634ba4258db1cecff6a5ad461"
-- 
2.45.2


