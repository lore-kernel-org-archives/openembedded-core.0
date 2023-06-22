Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B352C001DB
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 15:32:18 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web11.14635.1687447937298855974
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jun 2023 08:32:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=ijvyKF5w;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.177, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-54fac3b7725so3497881a12.3
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 08:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687447936; x=1690039936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wa3GW8WU0oc3nmxKZT4iX/KZqen2LVkPvNuoz0X7wHI=;
        b=ijvyKF5wyJpcEK45RAsIgz/4q9FxrIUIsDaPvh4KQ+4PTedkINqEnuiav0r2M7sUy2
         U5vkKpAE/DmRAXmJdIiVUVKfP1+CM7Q6IpFBliJhMzM2YxPxhHF2/0iKHVF1ibGMuGdD
         TDicZXlikrJV3aaOKqt3waHmnBtAAM7htFQ7n4jj2MDV/x158rczOCQ0QIjffEUQxhdE
         MXaRw9iS5P2WcB7MwCsCTc504ungbPehL5zdjh/BwZlhOKIm0CdQPi+qdZn8Yt6j/Qfa
         P1oUlu/WvUN/ahc6aSQjLf4sROl7sgEFZSjq2bvOodAlO1uqNqAtjghjezoQ8PGeA2Au
         xE0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687447936; x=1690039936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wa3GW8WU0oc3nmxKZT4iX/KZqen2LVkPvNuoz0X7wHI=;
        b=Iwrc6B5Fvyd0LZ04rOo2hPa1ZDNpU5108QlVbImNEawJDMT5x/hoHl2L+chj6ClOwd
         Rr+7Ncw+tE03pYRTD5tP+xIWz4EPN0RxGCgRAuP7cQAx/iDCjtQVECt8cF8LN4qdEpCa
         gclUNMduiKJuarca893k1RBWSARLl/YGwqW3OKu8of33At51YzD5ZL6jKZvFmpfy5CtI
         4JSJIDIEAHyceonelPywhp4VnZ/XyUfqDIGaMocDDoWmrr19ZPIE+lJrWN8zBVkc1psC
         U/jAkQM8dLTqG7cPDi06V8rbXUK/xu/7u39nUjNgl/PQMeZUlaM9/bjm3meGftOSuN7I
         kwMw==
X-Gm-Message-State: AC+VfDzRzXAlA8E4XoX+YvNKGCutiwySv4x7j38gaPMNWe+b4Pun6zf8
	zX1xLUUtW/axfQI7qwktDCmW1pk2AJiMQQoQtDo=
X-Google-Smtp-Source: ACHHUZ4shyIGLVms3vxmq99d7zGH634tXy3jyMf9buUUyGz3F2gQDAtzBXEzk1kT3jU6Wq70bG0ptg==
X-Received: by 2002:a05:6a20:258d:b0:10c:7c72:bdf9 with SMTP id k13-20020a056a20258d00b0010c7c72bdf9mr15567930pzd.29.1687447936304;
        Thu, 22 Jun 2023 08:32:16 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id bm17-20020a056a00321100b0064ccfb73cb8sm4713240pfb.46.2023.06.22.08.32.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 08:32:16 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 14/14] systemd-systemctl: support instance expansion in WantedBy
Date: Thu, 22 Jun 2023 05:31:43 -1000
Message-Id: <2aa82324d43467e7c8bfbbb59570ee3306264b75.1687446532.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687446532.git.steve@sakoman.com>
References: <cover.1687446532.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 15:32:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183261

From: Ian Ray <ian.ray@ge.com>

Refactor _process_deps to expand systemd instance specifier "%i" to the
template instance.

This change expands on prior commit e510222b57 ("systemd-systemctl: fix
instance template WantedBy symlink construction") by substituting every
"%i" pattern-match with the instance name.

The regexp handles the following cases:

* svc-wants@%i.service

* sys-subsystem-net-devices-%i.device

Signed-off-by: Ian Ray <ian.ray@ge.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 9356276137267a29ae2289d796a2940918375308)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/systemd/systemd-systemctl/systemctl | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd-systemctl/systemctl b/meta/recipes-core/systemd/systemd-systemctl/systemctl
index 577c373181..b890bdd6f0 100755
--- a/meta/recipes-core/systemd/systemd-systemctl/systemctl
+++ b/meta/recipes-core/systemd/systemd-systemctl/systemctl
@@ -188,13 +188,8 @@ class SystemdUnit():
         target = ROOT / location.relative_to(self.root)
         try:
             for dependent in config.get('Install', prop):
-                # determine whether or not dependent is a template with an actual
-                # instance (i.e. a '@%i')
-                dependent_is_template = re.match(r"[^@]+@(?P<instance>[^\.]*)\.", dependent)
-                if dependent_is_template:
-                    # if so, replace with the actual instance to achieve
-                    # svc-wants@a.service.wants/svc-wanted-by@a.service
-                    dependent = re.sub(dependent_is_template.group('instance'), instance, dependent, 1)
+                # expand any %i to instance (ignoring escape sequence %%)
+                dependent = re.sub("([^%](%%)*)%i", "\\1{}".format(instance), dependent)
                 wants = systemdir / "{}.{}".format(dependent, dirstem) / service
                 add_link(wants, target)
 
-- 
2.34.1


