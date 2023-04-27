Return-Path: <thakur.virendra1810@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E8E8C77B61
	for <webhook@archiver.kernel.org>; Thu, 27 Apr 2023 08:10:31 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.15217.1682583030807973722
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Apr 2023 01:10:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=GNWXVs+n;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: thakur.virendra1810@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1a6862e47b1so84246195ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Apr 2023 01:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682583030; x=1685175030;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dm7e5x/ARQKaOuWNgN1vPncn4eLDZpwzzn5BUQ5cFvA=;
        b=GNWXVs+nlq6/aZuRj6g2lvf10w1tB8G4AuV9bPzr31llxeFIlej5d8Fxo6UDas7Ypt
         D5hEKfn3mlHH4iJAB/Ma/SZQnoQ6R4fSn1wLcWT0scJ++HYVPcByhe6A4Q8O8giqfagZ
         nqPMMGLNCAddZa4ZKVqmn3rWCshUvcHUaD+yQuumWlV80PHHcxodVR2c3lxSDEjbgoqR
         i9ycVqsGF0C46TYkYFCDF2eykQyPJSPgP9kpRed+mU7eLEQatXq9zDQDcraH7KgoaSgA
         kg51R+FdKwM3Rr13eQIjkBmjRWe/bviqyJMuYLPFamv+m6QFJiyHz3N5S6h4q+IjvTNL
         9j2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682583030; x=1685175030;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dm7e5x/ARQKaOuWNgN1vPncn4eLDZpwzzn5BUQ5cFvA=;
        b=gA7ul+UC+CviqRKwiK/UnLdvWUbCGaM6YFUjmm2NrppsfFD5ioYNuXThn92ofOnlTH
         Y7IgraT+CXzGe1zZQK6SQ14b0XCKFRXp9KVqigLYmoBmzvfJCqME6kg2HiEU3ZWmCB1B
         PFTGs73225FK6NxOXmTzjdI7gcYLr3C2PYAnPjqcKT9SxsqUy447KB62CVL8hj38DziH
         8EEGjxPQdCQu0MrqolA8IybJ8xVZHbq7HcqXn0ruOMngdWWZH3SWBwWVy7aAMZfFjg7d
         jD/L+bk7m/yhg/H9J0yoO4rDSSNiX1p/aFJXVvbWnlfQ3UiVu4GudjKKUCj6kpTZYeDt
         rMTw==
X-Gm-Message-State: AC+VfDzMtOqQGb59VGwWSSem5+NpI1mzlogBAWcqx5HBZbNEY7c8fjbQ
	5nVc5PCqx2dOieoEXNG8rF8sIvY84Ds=
X-Google-Smtp-Source: ACHHUZ6RjUxYGLpzBC/qAYfr0/CqfTunqxWzhKOyplpOPNCkhwbvrBCgQCTZ5FBETxFuJzi5pntOpQ==
X-Received: by 2002:a17:902:f651:b0:1a5:3319:12f7 with SMTP id m17-20020a170902f65100b001a5331912f7mr627204plg.50.1682583029717;
        Thu, 27 Apr 2023 01:10:29 -0700 (PDT)
Received: from localhost.localdomain ([223.233.80.206])
        by smtp.gmail.com with ESMTPSA id m21-20020a170902bb9500b001a060007fcbsm1414621pls.213.2023.04.27.01.10.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Apr 2023 01:10:29 -0700 (PDT)
From: virendra thakur <thakur.virendra1810@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: virendrak@kpit.com
Subject: [meta][dunfell][PATCH] qemu: Whitelist CVE-2023-0664
Date: Thu, 27 Apr 2023 13:39:23 +0530
Message-Id: <20230427080923.24556-1-thakur.virendra1810@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Apr 2023 08:10:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180484

From: Virendra Thakur <virendrak@kpit.com>

This CVE is related to Windows.

Link: https://nvd.nist.gov/vuln/detail/CVE-2023-0664

Signed-off-by: Virendra Thakur <virendrak@kpit.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 3b1bd3b656..8d6c4050f7 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -157,6 +157,11 @@ CVE_CHECK_WHITELIST += "CVE-2018-18438"
 # the issue introduced in v5.1.0-rc0
 CVE_CHECK_WHITELIST += "CVE-2020-27661"
 
+# As per https://nvd.nist.gov/vuln/detail/CVE-2023-0664
+# https://bugzilla.redhat.com/show_bug.cgi?id=2167423
+# this bug related to windows specific.
+CVE_CHECK_WHITELIST += "CVE-2023-0664"
+
 COMPATIBLE_HOST_mipsarchn32 = "null"
 COMPATIBLE_HOST_mipsarchn64 = "null"
 
-- 
2.25.1


