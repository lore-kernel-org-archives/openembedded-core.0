Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01C55C04FDF
	for <webhook@archiver.kernel.org>; Sun, 30 Jul 2023 18:01:42 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.78399.1690740093561131358
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Jul 2023 11:01:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=oAESAWPR;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-686f8614ce5so3422705b3a.3
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Jul 2023 11:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1690740093; x=1691344893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A1fW+DQriCntfZ7jbnks/JFbKj/mBXElwmOdw70JrRM=;
        b=oAESAWPRvNeuCkqGDMQNlubmbEGpk07rM83T0zXFPM4uH4/cAFS/iXBxR0DlcK/a0p
         0J4zNDSZBNXliJ9H7kxfVXc4w01BqWdCi56yWKPYjR2+VgVpAXEAAueScE8F18nuMwSj
         XgGn+xuyZXDp1QCidSoBwOr6lkdlAf6rayZFqJc65zL0+TEaPvUBQaZO9R7YfY55Vs9k
         eJsdtaWFkC7W9U1STfb+oFIQfvV3p+XjY/KIwMHLoxYk8uHyo6arwK6Y9fkenZ6fWmAB
         006zspCPHDSN8kghHn6zhwhn8FVvy7UFxt6Le0+xBUVH2RW/URMwpQXapHCgxI3rJcZV
         EbLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690740093; x=1691344893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A1fW+DQriCntfZ7jbnks/JFbKj/mBXElwmOdw70JrRM=;
        b=iz8DGLdYbi/VTUkuv9Wf+djwng8uQsnbHSFp26qnLK7XPK8OCOuouXO4J9wKT2Qjap
         5LDfe0eJzvnaOVd+la11qiUr+Qzbw09EXKoxhADpH4OcRV9ko1v6kyXYiJbeKQOUZCpv
         K+FTd0zUy2mno8rnHBQ8PYfHJKhCyqbzeQ574Gb6SH14mpnlaqT038njfl+BCHD4t3Gh
         1OxlzI8qO3Wvqf/aO/VHTuHDX+Xwl9cuzORscqyjPJcNUZqIF0fzNKLL4g8LL/7Yg3Wr
         f+2RDzoYg1MjCnYKZsJIdEMonmEIwX+Pl62W79zxID3FM6Gx8HoRvBweiqoKAPBWHho6
         mvQQ==
X-Gm-Message-State: ABy/qLYSsqgJV9MRaot4WG27ej0noXSUJKP4V39Mnr53dh2p1wKIDYDb
	991/ORV/fcXzCdivnEzUl3+3niBMvv4/S6abVbJYEQ==
X-Google-Smtp-Source: APBJJlENBwibcFyNqHSS8DQgx7cT3DpxDbUQERWbNIP2c33Q8s6vcjZ6NVetyaFz0vbnsZtMXv9iyA==
X-Received: by 2002:a05:6a20:105a:b0:133:f0b9:856d with SMTP id gt26-20020a056a20105a00b00133f0b9856dmr7971255pzc.17.1690740092733;
        Sun, 30 Jul 2023 11:01:32 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id e9-20020a62ee09000000b0066e7a540ea5sm6150494pfi.205.2023.07.30.11.01.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jul 2023 11:01:32 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 18/30] systemd-systemctl: fix errors in instance name expansion
Date: Sun, 30 Jul 2023 08:00:41 -1000
Message-Id: <d5859ed9dbb0c78e9e643ba43732944afb314dd5.1690739937.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690739937.git.steve@sakoman.com>
References: <cover.1690739937.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Jul 2023 18:01:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185096

From: Yuta Hayama <hayama@lineo.co.jp>

If the instance name indicated by %i begins with a number, the meaning of the
replacement string "\\1{}".format(instance) is ambiguous.

To indicate group number 1 regardless of the instance name, use "\g<1>".

Signed-off-by: Yuta Hayama <hayama@lineo.co.jp>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d18b939fb08b37380ce95934da38e6522392621c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/systemd/systemd-systemctl/systemctl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd-systemctl/systemctl b/meta/recipes-core/systemd/systemd-systemctl/systemctl
index c8b5c9efe3..0fd7e24085 100755
--- a/meta/recipes-core/systemd/systemd-systemctl/systemctl
+++ b/meta/recipes-core/systemd/systemd-systemctl/systemctl
@@ -191,7 +191,7 @@ class SystemdUnit():
         try:
             for dependent in config.get('Install', prop):
                 # expand any %i to instance (ignoring escape sequence %%)
-                dependent = re.sub("([^%](%%)*)%i", "\\1{}".format(instance), dependent)
+                dependent = re.sub("([^%](%%)*)%i", "\\g<1>{}".format(instance), dependent)
                 wants = systemdir / "{}.{}".format(dependent, dirstem) / service
                 add_link(wants, target)
 
-- 
2.34.1


