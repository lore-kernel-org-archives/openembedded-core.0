Return-Path: <sweng5080@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8505CC83F10
	for <webhook@archiver.kernel.org>; Thu, 31 Aug 2023 14:23:46 +0000 (UTC)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
 by mx.groups.io with SMTP id smtpd.web10.18488.1693491823069225711
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Aug 2023 07:23:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=Ip9sFfSF;
 spf=pass (domain: gmail.com, ip: 209.85.160.50, mailfrom: sweng5080@gmail.com)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-1cca0a1b3c7so478040fac.2
        for <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 07:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693491822; x=1694096622; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MOKXm6QetjTq5vKHpVI7WBFu38LBdE780NJCYz/txQM=;
        b=Ip9sFfSF0e/qFVm/OFOHZ2Sfyy8GnUhMw+QbZKCKmIb2O0qic1QICFq5CdozX3exku
         vgDATaaYbNFAAPzp1hQRySsD5bn1xttts+XzxxVz6qmAQ1shUN5n+/Ijnbv8TDXZUBxe
         2Z+m1OtZuA9P76sK2jNSgboVcDBCQDmVnA6dQnxEpMguL7AQeTo/aLNiqWmEvQKjKpv/
         8Pa4U/qXEa4Yp2xHpLTlDjJ7+4dUEXgDMvKuOj5qwmhcWygtYth7U9NWkwJ9fZUEFqy1
         udpL+WEhlD/EYp8AzNcgzejH2Y2EB9vZkMqvYj+iwDzeCAXCgyGk4DEHtfmvRxrVNELK
         bgTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693491822; x=1694096622;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MOKXm6QetjTq5vKHpVI7WBFu38LBdE780NJCYz/txQM=;
        b=Xq8VyWcQotPcfyBId9Kw1bx20rqtAzMkPA3PyN0YvnZ9g6X6OyrC1ugZbw4LPa1T2+
         kAw6BUzyAbR+B2LtSp/D2KydPgLUSmbDu9BQial6YgOFYeLgIGkNlppbAFoIuUJTqs2Z
         fXl8J3SgROFq7lhM+1iUldC7Hni8+w2TJcr56fCRnybSBoPvHpJcEhvgzX3n60wUuxWk
         /wIG1lvVY+HMzCQ3vAwlLqu5tDbSl6TiotLEMLysiDJTgoyYA3b0OvqwzWYes+/6ogXG
         aBk9tYPzpCk1O+bTSDiroxxvl1ngIVzCUrVmLL/gpEZTdFD5Rr44e2ZcPBWVDiMEwMvF
         ccjQ==
X-Gm-Message-State: AOJu0Yy6/JBd3PUbv6Q2ZeTCfOl4ToYqJde0YzrRjGd3kwyFhu4d65G/
	oJYyEYuXamf8QDD5vnEM+FTYE1M1Z+o=
X-Google-Smtp-Source: AGHT+IFVLziQkAHSCyxSQeP2NA0genGdO21QUQxPccxKW6Fsn0kO3vkMDs+Uyn8vtmBF2uoI97iuOg==
X-Received: by 2002:a05:6870:3124:b0:1be:feb0:33fb with SMTP id v36-20020a056870312400b001befeb033fbmr5954439oaa.4.1693491821984;
        Thu, 31 Aug 2023 07:23:41 -0700 (PDT)
Received: from OLA-8C2DT13.ad.garmin.com ([204.77.163.55])
        by smtp.gmail.com with ESMTPSA id h2-20020a056870860200b001c548ecc52asm903879oal.13.2023.08.31.07.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Aug 2023 07:23:41 -0700 (PDT)
From: JD Schroeder <sweng5080@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: JD Schroeder <sweng5080@gmail.com>
Subject: [PATCH 1/2] distcc: Fix groupname gid change warning
Date: Thu, 31 Aug 2023 09:23:04 -0500
Message-Id: <20230831142305.10981-1-sweng5080@gmail.com>
X-Mailer: git-send-email 2.37.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 14:23:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186977

This patch fixes warnings when useradd-staticids.bbclass is used and
USERADD_PARAM is used to add the user to a group that has not been
explicitly created yet. By adding the GROUPADD_PARAM for the new group
being used the warnings for changing the gid from GID-OLD to GID-NEW
is eliminated.

Warning fixed:
distcc: Changing groupname nogroup's gid from (WXYZ) to (JKLM), verify configuration files!

Signed-off-by: JD Schroeder <sweng5080@gmail.com>
---
 meta/recipes-devtools/distcc/distcc_3.4.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/distcc/distcc_3.4.bb b/meta/recipes-devtools/distcc/distcc_3.4.bb
index 45fc7cde53..0c20f74d68 100644
--- a/meta/recipes-devtools/distcc/distcc_3.4.bb
+++ b/meta/recipes-devtools/distcc/distcc_3.4.bb
@@ -33,6 +33,7 @@ EXTRA_OECONF += "--disable-Werror PYTHON='' --disable-pump-mode"
 PACKAGE_BEFORE_PN = "${PN}-distmon-gnome ${PN}-server"
 
 USERADD_PACKAGES = "${PN}-server"
+GROUPADD_PARAM:${PN}-server = "--system nogroup"
 USERADD_PARAM:${PN}-server = "--system \
                        --home /dev/null \
                        --no-create-home \
-- 
2.37.0


