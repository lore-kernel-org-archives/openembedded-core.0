Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A97AE64AA6
	for <webhook@archiver.kernel.org>; Tue,  3 Dec 2024 13:38:04 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.19591.1733233075663722592
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Dec 2024 05:37:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=tozLPqRO;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-21583cf5748so21033995ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 05:37:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1733233075; x=1733837875; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QOcJs0m8NDhEEMao40XAlH96WUHYxgDP0r+4kn36He4=;
        b=tozLPqROshUDvG+dTrnSS4fN7dqH37BO6hu81ff7V7NuqSbRAH5xLFii1XgVM230DQ
         vxV+TvosIWv+KfENVNjtjS4qfYhk9UKfwbtF69g9W5SB6MjDJnWoe6A2dAGFDPl0oCw7
         EVzP+UQnGeAbX7LZj90cvWev3VTxeRiVvdwLZ7qPmWKG8yDBqkPEJYEWBgoEwhsXlI4B
         WvI4I3m+E1yYwoOMvBpqPwBlLJB852cAD8F7mvqi44toyhli/YYJs2GJWt4kqw4z0QRL
         GRxSme/Eser9tPArj4nAH05cfnH9KaO0KxxCI9+gQ5EqxP+NqSWGnbq1i4OJf7CWRwJx
         hUbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733233075; x=1733837875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QOcJs0m8NDhEEMao40XAlH96WUHYxgDP0r+4kn36He4=;
        b=Z1Tyre+FCai8iSUe/lciuu/J/+b4uJAEGDyqYHbeKEC5eBFfs3kl2l65b236uPKmMh
         xRjvHLDbT1vuWu3dpPr1O2/mLTKx0eHlYC1Vvm3MoTKjd44sJdEUnuNsCKoGdA892EVX
         rju+02oFoUDNWGGa89mK7sKrYKGxJzYjMMEH96Hr4bG982PlMgF6RKEFEhYP20FjZ3d8
         zvjlG8vt0n+DItEfUid15gDaM1OEt96QNOukCAoJizibV6SNvImVOwqG/fc9usFDVL0w
         +hQUUm7AJy/pj45rBjK3wEqcWGKge9tEAc6n7lXsA9eTP70mfzbiG5uedxYMJzUxgI35
         5AgA==
X-Gm-Message-State: AOJu0YzIy9j+bmwIL7415P73RQs4R36btIuLjhhhjG9iEkmzUvVBrExe
	9Tvpx6KwB69vjWw9x6V0wEbxrp9LAW8CKxwxzk0Fd8+RCTaMZ3FPxJErqo/TjiiOlXa/1aRSVAe
	/
X-Gm-Gg: ASbGncv50JmGlk121TK/sDVRWf/KyyetNcKbNQw3m5/vTu0Mip07a1h6nsS7HdC72OX
	0E//SQi7xoJotaTGmtaDQjjglTvLmOwTX0pCdX0v9pk6Tvv+ow6NQlRt7h+paHU9JYXhKAdYXh7
	uphRuuXvnb2LP9zFMxc07zGeopK4/83sn9Jcmzl5hamMmW8ASuwBCJNLD6uW9y8wcE+tPic5ZMK
	be9l1u5dsmoGElr3fmOvUwd9dtTgBA5tn0mAxU=
X-Google-Smtp-Source: AGHT+IHfHjZ2FS5U2X9C6Ha2coBMOL9oFETjoo50o2gY3UlqXowX1STYkwgXGQsHyZcVdgCU7vp5uQ==
X-Received: by 2002:a17:902:e5cf:b0:215:6e01:ad07 with SMTP id d9443c01a7336-215bcfc3bcamr34734805ad.6.1733233074933;
        Tue, 03 Dec 2024 05:37:54 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2153540d792sm84560225ad.66.2024.12.03.05.37.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 05:37:54 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 15/16] dropbear: backport fix for concurrent channel open/close
Date: Tue,  3 Dec 2024 05:37:19 -0800
Message-Id: <808972c0418a64fbed2134b55f25fb90e5d498e9.1733232895.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1733232895.git.steve@sakoman.com>
References: <cover.1733232895.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 13:38:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208204

From: Florian Kreutzer <florian.kreutzer.oss@rohde-schwarz.com>

Prevents sporadic crashes of dropbear server when multiple channels are
active at the same time.

Upstream discussion:
https://github.com/mkj/dropbear/pull/326/commits
https://github.com/mkj/dropbear/issues/321

Issue was introduced in dropbear-2022.83 and fixed in v2024.86.

Signed-off-by: Florian Kreutzer <florian.kreutzer.oss@rohde-schwarz.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...e-channels-when-a-PID-hasn-t-started.patch | 45 +++++++++++++++++++
 .../recipes-core/dropbear/dropbear_2022.83.bb |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-core/dropbear/dropbear/0007-Don-t-close-channels-when-a-PID-hasn-t-started.patch

diff --git a/meta/recipes-core/dropbear/dropbear/0007-Don-t-close-channels-when-a-PID-hasn-t-started.patch b/meta/recipes-core/dropbear/dropbear/0007-Don-t-close-channels-when-a-PID-hasn-t-started.patch
new file mode 100644
index 0000000000..dff6534027
--- /dev/null
+++ b/meta/recipes-core/dropbear/dropbear/0007-Don-t-close-channels-when-a-PID-hasn-t-started.patch
@@ -0,0 +1,45 @@
+From 5c34e70b80e5fc539f96e029b56b95cdee556010 Mon Sep 17 00:00:00 2001
+From: Matt Johnston <matt@ucc.asn.au>
+Date: Sun, 8 Sep 2024 11:07:41 +0200
+Subject: Don't close channels when a PID hasn't started
+
+If check_close() ran prior to a server channel exec/shell
+request, it would send a close immediately.
+This fix changes it to exclude write_fd==FD_UNINIT from
+being closed there.
+
+When a channel was closed by the time shell/exec request
+was received, then data sent hits an assertion.
+This fixes #321 on Github.
+
+The "pid == 0" check was initially added to avoid waiting
+to close a channel when a process has never been launched
+(which is correct), but that isn't correct in the case
+of the closed-fd test.
+
+Fixes: 8e6f73e879ca ("- Remove "flushing" handling for exited processes)
+
+Upstream-Status: Backport [https://github.com/mkj/dropbear/commit/71521d1b78706a70d3570b860e65234cefdc8c81]
+
+Signed-off-by: Florian Kreutzer <florian.kreutzer.oss@rohde-schwarz.com>
+---
+ common-channel.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/common-channel.c b/common-channel.c
+index be5b57f..9926972 100644
+--- a/common-channel.c
++++ b/common-channel.c
+@@ -317,7 +317,8 @@ static void check_close(struct Channel *channel) {
+ 
+ 	if ((channel->recv_eof && !write_pending(channel))
+ 		/* have a server "session" and child has exited */
+-		|| (channel->type->check_close && close_allowed)) {
++		|| (channel->writefd != FD_UNINIT
++			&& channel->type->check_close && close_allowed)) {
+ 		close_chan_fd(channel, channel->writefd, SHUT_WR);
+ 	}
+ 
+-- 
+2.34.1
+
diff --git a/meta/recipes-core/dropbear/dropbear_2022.83.bb b/meta/recipes-core/dropbear/dropbear_2022.83.bb
index 686cb8a809..772e08eaed 100644
--- a/meta/recipes-core/dropbear/dropbear_2022.83.bb
+++ b/meta/recipes-core/dropbear/dropbear_2022.83.bb
@@ -14,6 +14,7 @@ RCONFLICTS:${PN} = "openssh-sshd openssh"
 
 SRC_URI = "http://matt.ucc.asn.au/dropbear/releases/dropbear-${PV}.tar.bz2 \
            file://0001-urandom-xauth-changes-to-options.h.patch \
+           file://0007-Don-t-close-channels-when-a-PID-hasn-t-started.patch \
            file://init \
            file://dropbearkey.service \
            file://dropbear@.service \
-- 
2.34.1


