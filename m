Return-Path: <danismostlikely@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8653AD6C280
	for <webhook@archiver.kernel.org>; Tue, 19 Nov 2024 17:51:11 +0000 (UTC)
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
 by mx.groups.io with SMTP id smtpd.web10.27821.1732038669612050866
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Nov 2024 09:51:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cO24z+lz;
 spf=pass (domain: gmail.com, ip: 209.85.166.176, mailfrom: danismostlikely@gmail.com)
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-3a75cad5eddso12733685ab.3
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Nov 2024 09:51:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732038668; x=1732643468; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=e/n4miOwEYETihJTYIWPfDtx1fAqckjMfhdA7i5oxnE=;
        b=cO24z+lzjU2eOfeZg8Er2MlQCVmVogxG3H2eT+w4cPe2ZCvyNFj+ozii/67U23nLz/
         aigwUe743MxCYGgrixzfrQcNb0o5CS1OrpkJ0N9JDNSn20vHhpGVTfUmARn01EN0KJAP
         1hAecVzDeTO1aMfKesfRdzsPIuNFYqyKa9MuyfDcG7XxDhEeZMNvaByEC4E6d9R8yQOp
         HIG8YMHqRiDbe6DqJTsoDEGOtaoII5ZPRgkXRqv+N4GYsv0EmEzFHIt9u6DYLqZUQkv+
         VrqSBqP6QjcoK5FdvueduhH9cFS8b2v4OSAkNebtiT2k1JNDun5cyjRVEowjrz37AqH0
         qsaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732038668; x=1732643468;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e/n4miOwEYETihJTYIWPfDtx1fAqckjMfhdA7i5oxnE=;
        b=YhWvtVNOs9BYViH0qcU6Sunlm2XgRtR9VNNm6Cxd6ftrIe0DrV+qqCP+nF1Q97XdcJ
         cOSDCFw/DoACmn4h3FApZmTJlJmyhdBC95Jxt2WE4ucgxJlmP+MUdu2VTwBmhiLfE2Vq
         qGJ41zWHxsYuA0QTeLaUE02PRzV9pSdCmBcXDEPfkjRiXwUEruc1nzCOIZLCVd9HRsFm
         taypkgm1CxQG3yaoXtE3QKY9N8GUiIKhmEz98pNM13iUmcfgzA7AydV5Ad7QHHybJl/K
         jZInkPdHV8KlKn88xaSQ2C+/VWMHPMhThq12Im6ScvV4PTh1XsjPhGY57dMZXvRx6dsn
         JEHA==
X-Gm-Message-State: AOJu0YyE/XiGt3DPMlf0R5h9Iy9g5lVJ/PKjgSj3Pss8owkzK3t1hx4X
	CoRHHLt5kZlTed/2hkPk6jeZ3RyXsYGzh6Wc6Dhhz/orFo8JH07eVw+IoQ==
X-Google-Smtp-Source: AGHT+IHI8vdUaVT5hebcreCN3P9/Qj10cNX/ZPd/Gcjrsw3CBGd1g+bd6QVEw0shKAVZKCzgDWto4A==
X-Received: by 2002:a05:6e02:1a68:b0:3a7:6566:1e8f with SMTP id e9e14a558f8ab-3a765661ffamr86167105ab.16.1732038668515;
        Tue, 19 Nov 2024 09:51:08 -0800 (PST)
Received: from nebuchadnezzar.home.arpa ([204.83.204.143])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3a74808dedfsm27355285ab.41.2024.11.19.09.51.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2024 09:51:07 -0800 (PST)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] systemd: wrap mtime based time with packageconfig
Date: Tue, 19 Nov 2024 11:51:06 -0600
Message-ID: <20241119175106.97694-1-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Nov 2024 17:51:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207401

From: Daniel McGregor <daniel.mcgregor@vecima.com>

Recently the systemd recipe grew support for setting the epoch time
at image build time. Unfortunately this is unconditional, and our
use case for the set-time-epoch PACKAGECONFIG is we have a system
requirement that our product boot with the time set to the UNIX
epoch.

Instead of trying to complicate things with either an image hook or
overriding the systemd recipe, just make setting the epoch at image
time optional, with the same PACKAGECONFIG that controls hardcoding
the systemd build time as the default epoch.

Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
---
 meta/recipes-core/systemd/systemd_256.7.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_256.7.bb b/meta/recipes-core/systemd/systemd_256.7.bb
index 3831baa511b..8b7ed2efe23 100644
--- a/meta/recipes-core/systemd/systemd_256.7.bb
+++ b/meta/recipes-core/systemd/systemd_256.7.bb
@@ -870,7 +870,9 @@ ALTERNATIVE_LINK_NAME[runlevel] = "${base_sbindir}/runlevel"
 ALTERNATIVE_PRIORITY[runlevel] ?= "300"
 
 pkg_postinst:${PN}:append () {
-	touch $D${libdir}/clock-epoch
+	if ${@bb.utils.contains('PACKAGECONFIG', 'set-time-epoch', 'true', 'false', d)}; then
+		touch $D${nonarch_libdir}/clock-epoch
+	fi
 }
 
 pkg_postinst:${PN}:libc-glibc () {
-- 
2.47.0


