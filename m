Return-Path: <ghaderer@wyplay.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FC5EC2BD09
	for <webhook@archiver.kernel.org>; Thu, 27 Jun 2024 08:42:51 +0000 (UTC)
Received: from mail-ej1-f98.google.com (mail-ej1-f98.google.com [209.85.218.98])
 by mx.groups.io with SMTP id smtpd.web11.3489.1719477766770263956
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jun 2024 01:42:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@wyplay.com header.s=google header.b=n91FxLOj;
 spf=pass (domain: wyplay.com, ip: 209.85.218.98, mailfrom: ghaderer@wyplay.com)
Received: by mail-ej1-f98.google.com with SMTP id a640c23a62f3a-a72604c8c5bso494434966b.2
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Jun 2024 01:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wyplay.com; s=google; t=1719477765; x=1720082565; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EZiZtnPI8qfrAfcvN02b9O7pVbSkfqAfyyHLXLjFZ0s=;
        b=n91FxLOjcLKOOgqrf8ZMmjuaseUHDws1ge6zAjVlDjQ+GgMCygnzZ5ckgjYZ+DSk2a
         tZw5xc7sSg9FSmnLm97GoAFyOUTkB4pquGUsM63wAytHW4A57hat3JB6qMIjG8KAmn04
         +JJ6bdu13/L7S0Qdv4cxalLaesjsOBahEbsb8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719477765; x=1720082565;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EZiZtnPI8qfrAfcvN02b9O7pVbSkfqAfyyHLXLjFZ0s=;
        b=WzSHiWY1DTo0tHOdtBXDOi7xg5YBxg5ECQSqMr0iVeghIc6dXqi6UAdDnijwekaGEx
         d2mAZgcpzE57xvZCe9AAvVOBky3V5gmF0KL5s08fN7C3CW2PeILGO0bLLO3sMTVJxO1f
         tTxebYbV9u9UfsqpEpk+9FwcmoRXlc4eVbgdA8dlzTj6BMZ6iUlvtRNUohUO4O5RXZrc
         +Q+NQBbpt1mH9NXYKbsDwSnnbg8gZ11wlDhm6XdunIwOEGV+TTs0yhmeF8nGtj7bbcTc
         pRSzU3k7HkJDlI+ac4cS9sxhGjBYkGjCyZ1G10tBTkmmn4/UNR8xSeeaf0+jjPNFSChl
         ro0Q==
X-Gm-Message-State: AOJu0YzmnqfK3T5uqrLAj70GsjDBJYwgMlt0l976IZACr2zCvLmJfIA8
	ljlX38nxOMQpxveH3WbjTrbHOuX9eGbY3cHL/yrGDW8ea8FLbU7sFtx123M9YzY+O177u29FpoY
	L5hJH/Gh8Hb4y10FCo02Lt1RpMipsM0u8qgzTXwBF
X-Google-Smtp-Source: AGHT+IEUulzfJ14XJtbR9woxjIxi43Ad/lNvW72zFhmN9bmOG8mSVp7imJysXnbo65wgF7WZrWEeVaYXhsxP
X-Received: by 2002:a17:907:c78a:b0:a6f:af87:b426 with SMTP id a640c23a62f3a-a7245b5660bmr1124702766b.20.1719477764122;
        Thu, 27 Jun 2024 01:42:44 -0700 (PDT)
Received: from s5lxsystem01.wyplay.com ([5.50.77.90])
        by smtp-relay.gmail.com with ESMTP id a640c23a62f3a-a729d7ca41esm250366b.118.2024.06.27.01.42.44;
        Thu, 27 Jun 2024 01:42:44 -0700 (PDT)
X-Relaying-Domain: wyplay.com
Received: from localhost.localdomain (unknown [10.60.225.20])
	by s5lxsystem01.wyplay.com (Postfix) with ESMTP id C728020558;
	Thu, 27 Jun 2024 10:42:43 +0200 (CEST)
From: Gauthier HADERER <ghaderer@wyplay.com>
To: openembedded-core@lists.openembedded.org
Cc: Gauthier HADERER <ghaderer@wyplay.com>
Subject: [PATCH] populate_sdk_ext.bclass: make sure OECORE_NATIVE_SYSROOT is exported.
Date: Thu, 27 Jun 2024 10:42:42 +0200
Message-Id: <20240627084242.122503-1-ghaderer@wyplay.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jun 2024 08:42:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201197

Fixes bug 15464.

OECORE_NATIVE_SYSROOT is correctly set up and exported in the SDK's
environment file. But it's then unset in buildtools/environment-setup-*.
The value is restored in the SDK's environment file but is not exported
again.

Signed-off-by: Gauthier HADERER <ghaderer@wyplay.com>
---
 meta/classes-recipe/populate_sdk_ext.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/populate_sdk_ext.bbclass b/meta/classes-recipe/populate_sdk_ext.bbclass
index 019330e3ef..b02295384b 100644
--- a/meta/classes-recipe/populate_sdk_ext.bbclass
+++ b/meta/classes-recipe/populate_sdk_ext.bbclass
@@ -724,7 +724,7 @@ sdk_ext_postinst() {
 		echo "# Save and reset OECORE_NATIVE_SYSROOT as buildtools may change it" >> $env_setup_script
 		echo "SAVED=\"\$OECORE_NATIVE_SYSROOT\"" >> $env_setup_script
 		echo ". $target_sdk_dir/buildtools/environment-setup*" >> $env_setup_script
-		echo "OECORE_NATIVE_SYSROOT=\"\$SAVED\"" >> $env_setup_script
+		echo "export OECORE_NATIVE_SYSROOT=\"\$SAVED\"" >> $env_setup_script
 	fi
 
 	# Allow bitbake environment setup to be ran as part of this sdk.
-- 
2.40.1


