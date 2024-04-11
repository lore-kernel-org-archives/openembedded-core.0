Return-Path: <danismostlikely@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B3E6C4345F
	for <webhook@archiver.kernel.org>; Thu, 11 Apr 2024 22:19:41 +0000 (UTC)
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
 by mx.groups.io with SMTP id smtpd.web11.33227.1712873976183559280
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Apr 2024 15:19:36 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.41, mailfrom: danismostlikely@gmail.com)
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-7cc77e74b5cso11280739f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Apr 2024 15:19:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712873975; x=1713478775;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nH7+MKssdQ+WW0ocQiHz5/APkYXQ7beOdVDTxPIV82U=;
        b=FkoVWV4MwcWelzawoFxivpy97iM4UmWEj9mnnvXDx0oLWyxc7bhgGP3QoEus+AYYoW
         tEIcSpBlOHIdgI4MXJmTOECwInHIRH7L6DLGQoKO2IhfI00gBQ9Jr+13w/rQnlDY+wdH
         W1AOteB42BmIYFDvdgf87VK3H85G5l6CB0ZvBe+o2ydoqJtdmdj65NzBc/52zBv0GmNL
         +RyEOGbj7WYGgHLIRGIZXDeY9R5d+UPlud4fuFaw+muHrSQvpoTCF4esdUgjkF5Ejqc/
         D4UsoFY5f+k9pgRpgc3VeK43wsbqmLF0q+CTOnNQh/aUjQSt6CWOiXFs5qak0xZKA4PU
         p7Mg==
X-Gm-Message-State: AOJu0Yxs9eGo99cCngOb6NfjGAR0UjziSr9U7iGcTnHXsbHi+dj2x/Qn
	vdnQ4K8U0XLkjIz5TpDgTadAIcilijcIQr56hwfmUifZDFx8OEyLq1Va2sVC
X-Google-Smtp-Source: AGHT+IH1yzeE4+YEIsfRHzmtGQxJdk1TIdoawdbXl6f5pt189ForYoLhLE45FQYNy3zuJuy6Zxo78A==
X-Received: by 2002:a05:6602:4743:b0:7d5:ef76:a541 with SMTP id dy3-20020a056602474300b007d5ef76a541mr1339472iob.16.1712873975270;
        Thu, 11 Apr 2024 15:19:35 -0700 (PDT)
Received: from nebuchadnezzar.home.arpa ([204.83.204.143])
        by smtp.gmail.com with ESMTPSA id x11-20020a056638248b00b00482b484af1asm649287jat.67.2024.04.11.15.19.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 15:19:35 -0700 (PDT)
From: Dan McGregor <dan.mcgregor@usask.ca>
To: openembedded-core@lists.openembedded.org
Cc: Dan McGregor <dan.mcgregor@usask.ca>
Subject: [PATCH] openssh: add fido2 support
Date: Thu, 11 Apr 2024 16:19:19 -0600
Message-ID: <20240411221919.1290554-1-dan.mcgregor@usask.ca>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Apr 2024 22:19:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198146

OpenSSH supports FIDO security keys in both the client
and server.  Add an option to support them in oe.
This change requires a new recipe that I've submitted to
meta-openembedded that has not merged yet.

Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
---
 meta/recipes-connectivity/openssh/openssh_9.6p1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
index 78d1ca81626..6f016b471b4 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
@@ -59,6 +59,7 @@ DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)
 # and systemd-sshd-service-mode corresponding to sshd.service
 PACKAGECONFIG ??= "systemd-sshd-socket-mode \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'krb5', 'kerberos', '', d)}"
+PACKAGECONFIG[fido2] = "--with-security-key-builtin,--disable-security-key,libfido2"
 PACKAGECONFIG[kerberos] = "--with-kerberos5,--without-kerberos5,krb5"
 PACKAGECONFIG[ldns] = "--with-ldns,--without-ldns,ldns"
 PACKAGECONFIG[libedit] = "--with-libedit,--without-libedit,libedit"
-- 
2.41.0


