Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 738BEEB64DA
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 02:56:20 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.39.1687143373333143035
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Jun 2023 19:56:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=5ggRjTxC;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-666edfc50deso1116990b3a.0
        for <openembedded-core@lists.openembedded.org>; Sun, 18 Jun 2023 19:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687143372; x=1689735372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SaAbyveAJx3aw5+T2mkVrS6V7frpBAg+lOoxYdzg0QU=;
        b=5ggRjTxC65QKpp+4JBmx3iXVyKAlgFZ+vnSvn4NPgXLOEj7Z39uUc2Igvjlr5lgmx6
         QyBbJm+X7UggAH6PHwKHbhmX/IjdyCUI42e1ETpZsio+kg0d+2AojHwpxXee9q+E3cH9
         qQ9Vh5TGFWSKVGdqaDGsrqm5Qt6819pjJ094XCwKUZ6UPvcsGmxLdzFEa6GrjZQOZvuN
         YPpVezXQ9l1+I27McohEbApnanHBu4VK8P4Gtn4mg361MCFOt2MpnyeYFWFPAnAMjGOc
         MGEpMyPKJCMbObN3wWlTabRhyvFZlWyxjls7Cb/ZxfDedisBYg9dTGopN/MV9qc4TLUy
         oKXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687143372; x=1689735372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SaAbyveAJx3aw5+T2mkVrS6V7frpBAg+lOoxYdzg0QU=;
        b=lX+HoUt5Wh6EmyFlGj8DE1uo0j+QE3DtbRFPb01m3E7jQg8Xciv4LSGOo695udBR0r
         l6emieEnwGixojBXGWy/XoOM/uwJ0x69NuAKWUbo1mRn3f31r1FrtnPKi852z77B0JhJ
         U69oLRQnFhG40VpwXqn8glRWLd+u8UjQNidTth6AhGTC/z5KvistdgfSO34uVpI6KdPT
         1ZELEFYlgh1zrpKSt99HonMe+T6arUZMUoF8AnlGr5B9fuBrvH9pTQvGCxQSCGA3dgPZ
         IDs7ljzocaz/u0I79N+Mgn9Y3D81ocqp5l5W4uYYnx3SsPPYtu/1jW7MkaQTCAm0YwKi
         +m9g==
X-Gm-Message-State: AC+VfDyPoKztKfzBA4Nf4sVVIWrYkSCIfCkquQzEBBY4ZoKWwhJxM5Mr
	bBIpZw+wa8tGOwTRz2ksUvoCpcCVCHHXifOtW00=
X-Google-Smtp-Source: ACHHUZ4rDKm44QaJnFiOwtYiFizg9hkmoxpBB7JMnqEPTSQbLTPrrLMgVuseCZtbXGgv8EsvYiWMUg==
X-Received: by 2002:a05:6a00:b56:b0:652:a559:b2c5 with SMTP id p22-20020a056a000b5600b00652a559b2c5mr10162566pfo.13.1687143372445;
        Sun, 18 Jun 2023 19:56:12 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id k12-20020aa7820c000000b0062dba4e4706sm16611481pfi.191.2023.06.18.19.56.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jun 2023 19:56:12 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 16/18] systemd-systemctl: support instance expansion in WantedBy
Date: Sun, 18 Jun 2023 16:55:36 -1000
Message-Id: <11d3f1c8252592c377ea6b92bba77ef6d9c75464.1687143192.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687143192.git.steve@sakoman.com>
References: <cover.1687143192.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Jun 2023 02:56:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183083

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
index 1c87beadad..c8b5c9efe3 100755
--- a/meta/recipes-core/systemd/systemd-systemctl/systemctl
+++ b/meta/recipes-core/systemd/systemd-systemctl/systemctl
@@ -190,13 +190,8 @@ class SystemdUnit():
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


