Return-Path: <danismostlikely@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45FA6C4345F
	for <webhook@archiver.kernel.org>; Fri, 12 Apr 2024 01:45:20 +0000 (UTC)
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
 by mx.groups.io with SMTP id smtpd.web10.37161.1712886311669317049
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Apr 2024 18:45:11 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.170, mailfrom: danismostlikely@gmail.com)
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-36aa0eb4adbso1948515ab.3
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Apr 2024 18:45:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712886311; x=1713491111;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lcOzvl2UVGBZ5m9bjVhTR2sho34UuP2uBH3Bc5V9rHY=;
        b=CSUQ4bIqBs62i+O3pubiksy427OG0BZexfNHp3aMp1XH0TwGdLCUMyc5zC7LQqkUsU
         yY9RoK1HBfCBrq4Ko68VhNV7dAt0HsWBoeebZElkS9rvWRLvYf1t1U6zC4H/FwCVPhx9
         yqUkuLMiGqpW4ZdwlarvlJKzwB3O9JsUzwwsPPDXvq7WcVRyKVNE/4Ho0CfuoyCXMNG8
         NLi/MyNwr99mq11yCJ1Jn+5bOE9xrNE+wmb8RmRCyLfUDW/UpEVTBfoHEdAeX3DqP+K4
         07ZEiQzPuU7jNuK1NAuPQmBPkxfBaiDaJ6zHwktg5R7U5/EmeVUQQdxamn0icSTFMt7y
         0TNQ==
X-Gm-Message-State: AOJu0YztWjPl4lLkbIBkpPdDUnPvJ1Cfjq3nmKAVEe1gNxAXtITd5Dhc
	GKrqS0q+rO6CaAk4zy1+tNt1d3InOmBZpKc4gGB5n/2gCk3OFQ9qyIXKvaQR
X-Google-Smtp-Source: AGHT+IFba9qj7Mww4LTTTLR0H+oeT8PIieFZyyDGuANBBaKj9FuGeP1qf2T5mrBejYKKw+SUgwHhmA==
X-Received: by 2002:a05:6e02:214d:b0:36a:199f:345e with SMTP id d13-20020a056e02214d00b0036a199f345emr1432161ilv.7.1712886310744;
        Thu, 11 Apr 2024 18:45:10 -0700 (PDT)
Received: from nebuchadnezzar.home.arpa ([204.83.204.143])
        by smtp.gmail.com with ESMTPSA id k5-20020a02c765000000b00476def848f1sm723582jao.131.2024.04.11.18.45.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 18:45:10 -0700 (PDT)
From: Dan McGregor <dan.mcgregor@usask.ca>
To: openembedded-core@lists.openembedded.org
Cc: Dan McGregor <dan.mcgregor@usask.ca>
Subject: [PATCH v2] openssh: add fido2 support
Date: Thu, 11 Apr 2024 19:45:01 -0600
Message-ID: <20240412014501.2329038-1-dan.mcgregor@usask.ca>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Apr 2024 01:45:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198152

OpenSSH supports FIDO security keys in both the client
and server.  Add an option to support them in oe.
This change requires a new recipe that I've submitted to
meta-openembedded that has not merged yet.

Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
---
 meta/recipes-connectivity/openssh/openssh_9.7p1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/openssh/openssh_9.7p1.bb b/meta/recipes-connectivity/openssh/openssh_9.7p1.bb
index 3b0b47097c2..d1468c59fc4 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.7p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.7p1.bb
@@ -58,6 +58,7 @@ DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)
 # systemd-sshd-socket-mode means installing sshd.socket
 # and systemd-sshd-service-mode corresponding to sshd.service
 PACKAGECONFIG ??= "systemd-sshd-socket-mode"
+PACKAGECONFIG[fido2] = "--with-security-key-builtin,--disable-security-key,libfido2"
 PACKAGECONFIG[kerberos] = "--with-kerberos5,--without-kerberos5,krb5"
 PACKAGECONFIG[ldns] = "--with-ldns,--without-ldns,ldns"
 PACKAGECONFIG[libedit] = "--with-libedit,--without-libedit,libedit"
-- 
2.41.0


