Return-Path: <mhalstead@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 412A6C8303F
	for <webhook@archiver.kernel.org>; Thu, 28 Aug 2025 10:44:04 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web11.17855.1756377841055674239
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Aug 2025 03:44:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=H3/UzS9K;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.49, mailfrom: mhalstead@linuxfoundation.org)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-61cb4374d2fso960420a12.2
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Aug 2025 03:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1756377839; x=1756982639; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fIxo39QvebjJZgbYT7Nky7+ThqWT500SOKQlOhhEqsg=;
        b=H3/UzS9KKiazHLv591yTsIRezxP7ScfbTFE6teOQFfiW9hyBTiF61ePYPGCGM6YPbo
         /mpjBuz8H4ZdXZ7b16R06hHGaVIkbSNsbKqw0A9nenGJtoDiEhotsjy1g7jV71WJl/vO
         TUPG57ema3lSTleh+jRWZgAD6JGqYhYZ5NYhY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756377839; x=1756982639;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fIxo39QvebjJZgbYT7Nky7+ThqWT500SOKQlOhhEqsg=;
        b=AvOeotiqfarSmYyYyncZID9+W7MipitrWBLiHdhkq+Sg4Gzh0tRIadH8EevXKz5Oaq
         CiZvi/J/UEM0M6esMmIwH0d1QABYL9bDXh/3XAKPWnV99Pkt3DI4eMKBNC5A63CDPc12
         ufiGbk61VTvyIrZsHGpmpuJSInZhAb74K+xeVmUaikVcehjlZk+lRcM0xB+2QxUjkxl2
         VQ45rwbD0r8Y/EGTNz1MGyNE5jjbO7R1V7qND99oOmNe//cA2KVJv/Gcn60qLvdRGHF2
         q07Qsexj5nprlBzlksdMEkmpSfP0wV1vJdVxmWIVAHwmuPhyjYSMUCI7+lc6+3x2vLPr
         CRuQ==
X-Gm-Message-State: AOJu0YxZeMTTeJYjXX3bUvMx6nHO3mva/uG2xqsKbLghA1KKiyBauMrC
	4POj/JtVjNH8Lbg0Kw/0gz3ZCBXSpD3s4HZfujsq5zt0vHbYwwHdaYAXjrInyTBgxhGu1QFGgAL
	YmH9J
X-Gm-Gg: ASbGncttdJTzBeBA+p89u4V3622S/l9INIIW6QKA+tCbQlZUcA0FU+i8e5t1jZgYpEk
	8MYPp4ULTW0vtBoHRknkYGQKwd6OtVk4Ly0ZSSpIvsqDLLJdwaHc423OQLB3jTVlUsUnmQ+my0/
	2eA/9w7NEOB3sy93SvN7dOXVUuZ5g/Hxq+5QZQwzkke+e5PkIk0mMJg1Mmbvv5IkxvhQCAu5Q8e
	oJ6IGMdE6FYz0hDRSlIxKD8alUM9Ep1WQQYNjHI41JIialkzByxe5t+emBxQB7OwMmW6bVGqK28
	OAT4UAM8z0iQPZzfh5Mhdyun9GrmddoThDKvJjtI3yN/lu+yIHHxj/h5I+MP0gT9e2LrFd51qKn
	RWrG497iKqg/MnItfXW7+W6lG2TZ48UrN1a28KJ823yprHbMNFbKETtcAicMi1aus
X-Google-Smtp-Source: AGHT+IH3U01hAgxTVdd5fOZUORVfDODSvfOuUvNd3SaaK4XEkuzYPofCNc+e5lRiLjyS0+3brIPEmg==
X-Received: by 2002:a05:6402:a0d1:b0:617:4b56:5bb1 with SMTP id 4fb4d7f45d1cf-61c1b48f712mr17622723a12.11.1756377838590;
        Thu, 28 Aug 2025 03:43:58 -0700 (PDT)
Received: from yoctolap.taild15c8.ts.net ([193.32.249.240])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61ceaf46eb5sm416458a12.3.2025.08.28.03.43.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 03:43:58 -0700 (PDT)
From: Michael Halstead <mhalstead@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	Michael Halstead <mhalstead@linuxfoundation.org>
Subject: [OE-core][PATCH] default-distrovars.inc: Switch to the canonical website domain
Date: Thu, 28 Aug 2025 12:43:32 +0200
Message-ID: <20250828104332.75862-1-mhalstead@linuxfoundation.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Aug 2025 10:44:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222557

yoctoproject.org redirects to www.yoctoproject.org. Switching to the
true domain we avoid an unnessary redirect and avoid certifcate errors
on a default Debian 11 installation.

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
---
 meta/conf/distro/include/default-distrovars.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
index 9ea3b5414c..bbd936efa6 100644
--- a/meta/conf/distro/include/default-distrovars.inc
+++ b/meta/conf/distro/include/default-distrovars.inc
@@ -63,4 +63,4 @@ KERNEL_IMAGETYPES ??= "${KERNEL_IMAGETYPE}"
 # fetch from the network (and warn you if not). To disable the test set
 # the variable to be empty.
 # Git example url: git://git.yoctoproject.org/yocto-firewall-test;protocol=git;rev=master;branch=master
-CONNECTIVITY_CHECK_URIS ?= "https://yoctoproject.org/connectivity.html"
+CONNECTIVITY_CHECK_URIS ?= "https://www.yoctoproject.org/connectivity.html"
-- 
2.51.0


