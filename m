Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51DD0C6FD1C
	for <webhook@archiver.kernel.org>; Thu, 23 Mar 2023 21:05:12 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web11.85126.1679605502647757845
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Mar 2023 14:05:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=shojMjh0;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id j13so22592322pjd.1
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Mar 2023 14:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1679605502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YVgv/IwobnJo1jqwmbVeQNUTmQtsBmbRSNbUF2Ys/uM=;
        b=shojMjh0L1oVan9ZaOjH4heFfD92jTBgnh+WGIpF+VIPXrMdKrsQS4TzUJrAuCzRIw
         EfMemYrKAuttFv8sVay0g+gafH7zZUG1qqaAFNbbs1jta8pVlOuuWfxNqOLvfz57rg+X
         1i4LdLx3sx720rbhnqpqA6jgDDfPnX+KZ9smaHrFvrC8GcBQorxj9j1WafJOoho1IkFp
         lZYTnQtvBlvIOWntnrkroU998uY8U10CpnZOWSFrRo3b633agnCpJ/scXpXwMhsnuMrv
         Ru2RdQsswFA6AVmOYr33WVqAA6gqllOEokcG/4LsWOHaSDkCcdkNTyLu6rWDK4vguSvH
         RJcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679605502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YVgv/IwobnJo1jqwmbVeQNUTmQtsBmbRSNbUF2Ys/uM=;
        b=tP6kFGVFY10DSfDBXSn7Pk+9oS3xXqGiCrwzR4LohovcKUjgES04gLwCkyfmZEzXUy
         kec+JxRf6GSqZXvTCBYU8cLnPClzecQSVOdm9FXigmRu4M2Mcz5xuySoBluzqRU6EAOc
         d8gxedDDjVLJZjvXNsQz6jQtXD3N0XEYX8R8DQFnNahl8frOT8mqVb+jWVEj+/GzSNy2
         vGWowBBdoNVpKGBj58/qj291W1L7aqcWlWXBfuwKjRtRWXSsz5sDQpun2rkT1GFKO9Wl
         A3AOMyBU9nnOlSLT5RgMwz9fB2nm6CzVQNoEIHb0W8ZbYzCgXPGCSK7tZW5hknxvT5fj
         ZL+w==
X-Gm-Message-State: AAQBX9c55RPLYJp1mQwuhfApaph+RbGEaJwmQa0X80cU/0TjrWtKWEAl
	830WNhIkMnTao6u4tGCYEAGXjeJdvsSYIVQ1r7A=
X-Google-Smtp-Source: AKy350YgmWjr/+0DbM5iKBPvC5Zq9LC4/T6UkmpMk5ycD9vCsgCtUxRQf9bKdAkvvkyD/KHxtOKJAg==
X-Received: by 2002:a17:903:234f:b0:1a1:f0ce:bb51 with SMTP id c15-20020a170903234f00b001a1f0cebb51mr305741plh.5.1679605501712;
        Thu, 23 Mar 2023 14:05:01 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id c1-20020a170902724100b001a198adb190sm12760417pll.88.2023.03.23.14.05.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 14:05:01 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 05/14] systemd.bbclass: Add /usr/lib/systemd to searchpaths as well
Date: Thu, 23 Mar 2023 11:04:33 -1000
Message-Id: <7582421fc3a711e5ed23add75ed49207e699c422.1679605352.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679605352.git.steve@sakoman.com>
References: <cover.1679605352.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Mar 2023 21:05:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178999

From: Khem Raj <raj.khem@gmail.com>

Some packages like lirc places its unit files into $systemd_user_unitdir
and also uses them in SYSTEMD_SERVICE list in recipe. This fails in
do_package

ERROR: Didn't find service unit 'lircmd.service', specified in SYSTEMD_SERVICE:lirc.

here lircmd.service is installed in /usr/lib/systemd/system/lircmd.service

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 12808a4159835b67d8d53d32bc9135811701a779)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/systemd.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/systemd.bbclass b/meta/classes/systemd.bbclass
index 09ec52792d..c07332d5b6 100644
--- a/meta/classes/systemd.bbclass
+++ b/meta/classes/systemd.bbclass
@@ -146,6 +146,7 @@ python systemd_populate_packages() {
     def systemd_check_services():
         searchpaths = [oe.path.join(d.getVar("sysconfdir"), "systemd", "system"),]
         searchpaths.append(d.getVar("systemd_system_unitdir"))
+        searchpaths.append(d.getVar("systemd_user_unitdir"))
         systemd_packages = d.getVar('SYSTEMD_PACKAGES')
 
         keys = 'Also'
-- 
2.34.1


