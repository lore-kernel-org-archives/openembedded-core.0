Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FC62C05023
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 12:07:11 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.18819.1713269229631714398
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Apr 2024 05:07:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=fd4EvGZ+;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-6eff2be3b33so2046219b3a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 05:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1713269229; x=1713874029; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IQymY848img/bBwjwvCfv/pGFdQIduklfjlghPQSI7s=;
        b=fd4EvGZ+YZ8bpwDg7WNHUTvwTBla7L3r9W12fG8vJMafFtRFDB7SP1mEtwWB0pgA8B
         gNgAEn7cJBbgd/9vA77w8G18D13XP/koGaQvacQuxgvz1YOhdcN9LcVHueSGsjvC9Ohn
         Qq414CtnPBy8vlRrWNXQ/0XiHDH/gbwOcUkmrIcPfw/gJtpoopIHNrt4gjUyl2mXz+7h
         x6HWiaSeeK442M3SGW8Zi9d8HWN/t+pu4x+cun4IMUB2AhGAXnVLz/VImTSHVIfHqLEM
         kDQJoMuajy0a4es5MGD0zgnye2yJpwrQf97fXZLfmjzczhrKPYoe7dZAb3RGqZpNPu7a
         zhtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713269229; x=1713874029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IQymY848img/bBwjwvCfv/pGFdQIduklfjlghPQSI7s=;
        b=JyZn296I/r0nLN7de2jiIBM3Ev24lZ/RYG4zBg7einGdODatrNstbIEA58UvKh8pVH
         D5QS82DqUudtN1aNftl3l0kXPfmMQUIdGywYTOTJt0wY77UKABhopX2ixRDsktA9Rmtb
         KMehzlhdgppCAnB4SUC/RyALNwTVFvf6T6DvFv7zeYSYToUeXXERP0AAGHLywoEd4VYv
         dFJS/brGr5SHo+B03w8vMLx5Il3wNiIX2hqza4Xp4zbH0BOmxNVWIhHdaiXhSjzdyOGl
         ddfzNJ+uJQBvoSCIzA6A+BRZqHM7qAxYoGVjKI8hIotZ7/QWZabSqttdFWIhGziyza23
         2gFw==
X-Gm-Message-State: AOJu0YxmuY5aNfWLpXRK70ebVH1arAOv5hwv1dcICfZN3JAY3KnmTuTc
	pTmELBaHc4zFHnc9OmfIEPN7vzQzFPcuW+N4aMy+YaxAMruQTLtb079NTw9tTdOVx+sQj72Sp5E
	nU/c=
X-Google-Smtp-Source: AGHT+IEP2xWML/xu0FsBMl6CNgHxfOjGCU55txoVvNU0YRVTaa+E7/46mGN9WuN6wGL2uXBw0URuvQ==
X-Received: by 2002:a05:6a21:2791:b0:1a9:5ba1:3b1b with SMTP id rn17-20020a056a21279100b001a95ba13b1bmr11294130pzb.9.1713269228925;
        Tue, 16 Apr 2024 05:07:08 -0700 (PDT)
Received: from xps13.. ([199.58.97.236])
        by smtp.gmail.com with ESMTPSA id j5-20020aa78d05000000b006edd9339917sm8746111pfe.58.2024.04.16.05.07.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 05:07:08 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 03/10] openssh: Add CVE-2023-51767 to CVE_CHECK_IGNORE
Date: Tue, 16 Apr 2024 05:06:50 -0700
Message-Id: <de4186610335201c69d8952d605bb291f4a7427c.1713268959.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1713268959.git.steve@sakoman.com>
References: <cover.1713268959.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 12:07:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198440

From: Sana Kazi <sanakazisk19@gmail.com>

Add CVE-2023-51767 to CVE_CHECK_IGNORE to avoid in cve-check reports
as upstream does not consider CVE-2023-51767 a bug underlying in
OpenSSH and does not intent to address it in OpenSSH.

Signed-off-by: Sana Kazi <sana.kazi@kpit.com>
Signed-off-by: Sana Kazi <sana.kazisk19@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-connectivity/openssh/openssh_8.9p1.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-connectivity/openssh/openssh_8.9p1.bb b/meta/recipes-connectivity/openssh/openssh_8.9p1.bb
index bc8e2d81b8..6411a64eff 100644
--- a/meta/recipes-connectivity/openssh/openssh_8.9p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_8.9p1.bb
@@ -49,6 +49,11 @@ CVE_CHECK_IGNORE += "CVE-2014-9278"
 # CVE only applies to some distributed RHEL binaries
 CVE_CHECK_IGNORE += "CVE-2008-3844"
 
+# Upstream does not consider CVE-2023-51767 a bug underlying in OpenSSH and
+# does not intent to address it in OpenSSH
+# https://security-tracker.debian.org/tracker/CVE-2023-51767
+CVE_CHECK_IGNORE += "CVE-2023-51767"
+
 PAM_SRC_URI = "file://sshd"
 
 inherit manpages useradd update-rc.d update-alternatives systemd
-- 
2.34.1


