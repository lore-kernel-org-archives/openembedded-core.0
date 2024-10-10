Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 671B6CFC5F5
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 18:51:12 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.52172.1728586271407709931
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Oct 2024 11:51:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Zs5KPYNc;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-20b90ab6c19so12617345ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 11:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728586271; x=1729191071; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fGPMWzzbiprpRXdBry9FgfQSFFu6lIYu5S8cCYXC7g0=;
        b=Zs5KPYNczFwdlOxUSfRvBXHQR/JW5hlVc2T6qsZVWI0yv/a7OnXjhEXIPjNSNk4AwP
         2xWQBdEaRvMPvWwMiCmeI3FMqahevKHjEoiS48ul8y62BN9v8JGy/rnfMtYyfIyGsj+E
         MGZGCebcFGsHu03ZcwK+Os425mcNE0jCKmK/3iCdsIHJKTW5LszWawdlcImUWMd2OmcN
         ts4r8DLOHe6zcEaAu4fozSI+EJJ3CHlj/Ak+c8WqeBK3GY86Gk3uwu6/OcshOaVFFNBG
         8dcsjmsONgvtpIdTzN2Y/8YBd9VOG5O1hwIoXXwbAzeCLbCuMScebchdOZ7if9Q+R9PE
         qYtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728586271; x=1729191071;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fGPMWzzbiprpRXdBry9FgfQSFFu6lIYu5S8cCYXC7g0=;
        b=nSbuZMVHlouSViiFXM2gS6ofK+dpfhvHyDet4jo05OHcMLnkrgNFWl9T/RvJ9099zi
         iYBf1IgYhQe5ga63L+kwOZtNShOXQW40CvY2Gbh+64Qu1R4NUv04tbFxOg8m2aRcLeXI
         YxFO1+0YuRHPlFu3fLfQ7T4qaGpLFUCBCo/blxq8caEXBJSo1cjMSE77BejZqrDL/eua
         uYGw1F2u70c+rBAPzgX4o3d4QyjX6y7NRTVASrMDfxNEcfW7EEmihd+9KOyrfDAHHvo1
         Jpp43ujP26WhszoaUkvmLlC4P7VbuF9B21oWfr+VTvfBpBuBgoz2q6p3IDFv78rjPCFm
         BnZg==
X-Gm-Message-State: AOJu0Yy9isdXzLB7bafcQefvO6130sFI1FTifGuVSL4IhMV5T2jB9hOC
	sdSRazt2cyde+MBnVidDLkIa03/DWORihZwxRBoHG57LnzG+z3HTs1l1rTsf
X-Google-Smtp-Source: AGHT+IE89u6pGeID4ZxYqDRpKR5BtPiqmSqJkz0VBQHwhCBePJqLetuvFcw4gYywxFtUirSw5m1v6Q==
X-Received: by 2002:a17:903:192:b0:20c:6b1b:7210 with SMTP id d9443c01a7336-20c9d8ca150mr7736665ad.23.1728586270525;
        Thu, 10 Oct 2024 11:51:10 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::8d77])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c8c212e9csm12359415ad.188.2024.10.10.11.51.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 11:51:10 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Jean-Michel Papy <jean-michel.papy@exail.com>
Subject: [PATCH] openssh: Be more restrictive on private key file permissions
Date: Thu, 10 Oct 2024 11:51:07 -0700
Message-ID: <20241010185107.3312768-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 18:51:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205426

Sometimes default permissions on filesystems can be more permissive
e.g. 0644, this can make the private key file created here to inherit
those permissions and these permissions can then cause ssh server to
not allow ssh connections due to non-secure permissions on file.

Reported-by: Jean-Michel Papy <jean-michel.papy@exail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-connectivity/openssh/openssh/sshd_check_keys | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssh/openssh/sshd_check_keys b/meta/recipes-connectivity/openssh/openssh/sshd_check_keys
index 606d1894b55..fae2bc5d16c 100644
--- a/meta/recipes-connectivity/openssh/openssh/sshd_check_keys
+++ b/meta/recipes-connectivity/openssh/openssh/sshd_check_keys
@@ -8,7 +8,7 @@ generate_key() {
     mkdir -p "$DIR"
     rm -f ${FILE}.tmp
     ssh-keygen -q -f "${FILE}.tmp" -N '' -t $TYPE
-
+    chmod 0600 "$FILE.tmp"
     # Atomically rename file public key
     mv -f "${FILE}.tmp.pub" "${FILE}.pub"
 

