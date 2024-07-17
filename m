Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 198FFC3DA62
	for <webhook@archiver.kernel.org>; Wed, 17 Jul 2024 19:06:51 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.1328.1721243208541176146
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jul 2024 12:06:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=O6DresjL;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1fb3e9e32ffso477015ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Jul 2024 12:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721243208; x=1721848008; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3xu71hZjrFQlhpDl8YMkiEE3BTaduO6PDfvW9Mn+aVI=;
        b=O6DresjLrqXz7Ix/VGaVfWB2drcp/8YV4MVczFU54tfHGJGzCCK+hgvYv1mCSmMgps
         EYybMLLBRTkEIV9cB7H7Z1BqCC5eJQm0qSwBUttTJdPQp0NFq2myRdHh5/T9lKp0USCT
         tmFfxBVK57sgzOt5K2xd+Z3wr3Z1ZkJM3Rmyftr0523lSttP0BSG9e+m5Z9ZBNMini5y
         qEAzx5Y7Ykp5cbRowlPkO+v5bCCevhuTaZh7QdU92Rraiygyy/mR6laRQf93NcMRcvKn
         /nj71eZbAAFv6f7yMzPoWF5vh6xwGgKZFMsu3Ng1c1UlTbNfxQUOslaW5hXAm4QE/AkM
         oClA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721243208; x=1721848008;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3xu71hZjrFQlhpDl8YMkiEE3BTaduO6PDfvW9Mn+aVI=;
        b=iFaX9/IvFSzbsTF+zYBjdab8Z4GUTlk5FyhoFYGZQvBQX+hD+57P6+HbaewQD+N8av
         1jvT7WNPc1yB8Blg23Y9jmndacKbS6YiXLEeLVaVB0WZYEQRQiQPIZmruoHl/wFAUghq
         Ku/CiTv5YW8ArUcY2F3rTKJ6go81gdHA9AsRxQrFFcicLsYNn1I5Layr2ovImHVs5R9C
         ec34A/sNl+93/Mcma4u6yKkA69o/aFGDGoLmq6Lvkt7XqvU8e+K9U7QG/BYZdK0KNb8j
         89pJU8Jr527vGK2E7ExaPJ5rfR+p3KA1QsY+6x2yDrAie8Jkvp+XvFbllZCjJwohTe/L
         qJqw==
X-Gm-Message-State: AOJu0YzmEouxl/ofvdjr0oAIvD//Wu7bzxFePJNJDUS3K/h+5ZTV6ekG
	lsUcfjiya+Al1mAsW+HArgPhHQdzFlGVF7vHJ1wjxUYQYqOl1sLEJEMvAJgj
X-Google-Smtp-Source: AGHT+IGfdoTBrta/96Fae7Qcp9qV6g2Gpsfmq/CfpLy3pi+OsoUVniWeTbcIaU/QA1pmLUovF/ljhA==
X-Received: by 2002:a17:902:ce8a:b0:1fb:82f5:6638 with SMTP id d9443c01a7336-1fc4e147d27mr24600465ad.34.1721243207467;
        Wed, 17 Jul 2024 12:06:47 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::5842])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fc0bc27345sm78757915ad.121.2024.07.17.12.06.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 12:06:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] systemd: Replace deprecate udevadm command
Date: Wed, 17 Jul 2024 12:06:44 -0700
Message-ID: <20240717190644.67681-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jul 2024 19:06:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202178

In postinstall we run this script on target
these days systemd-hwdb is recommended

Fixes
...
Configuring udev-hwdb.
udevadm hwdb is deprecated. Use systemd-hwdb instead.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/systemd/systemd_256.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_256.bb b/meta/recipes-core/systemd/systemd_256.bb
index 2e1f82dc8d1..a197b165832 100644
--- a/meta/recipes-core/systemd/systemd_256.bb
+++ b/meta/recipes-core/systemd/systemd_256.bb
@@ -904,7 +904,7 @@ pkg_postinst:udev-hwdb () {
 	if test -n "$D"; then
 		$INTERCEPT_DIR/postinst_intercept update_udev_hwdb ${PKG} mlprefix=${MLPREFIX} binprefix=${MLPREFIX} rootlibexecdir="${rootlibexecdir}" PREFERRED_PROVIDER_udev="${PREFERRED_PROVIDER_udev}" base_bindir="${base_bindir}"
 	else
-		udevadm hwdb --update
+		systemd-hwdb update
 	fi
 }
 

