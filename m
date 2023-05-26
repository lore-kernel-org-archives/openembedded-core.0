Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F375C7EE2F
	for <webhook@archiver.kernel.org>; Fri, 26 May 2023 02:29:51 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.83.1685068182554096545
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 May 2023 19:29:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=UnxOQ4+r;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1ae763f9c0bso1793145ad.2
        for <openembedded-core@lists.openembedded.org>; Thu, 25 May 2023 19:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1685068181; x=1687660181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cSWFCvBo3YeMHpqxjDLYuOwLwA2FLHPMe8Hk5LDphuc=;
        b=UnxOQ4+roMROM+Ii47CXuKjG1LrBAOfPZTun//a5pcwnUknmWHn8VFZnXXFbtnOu+C
         gi+x3UgPqQHtvsGO2FN8UC9jYqbNDsyREp5JsHtG9zXwpG68pqTRKaYh1EGZplvY/xdx
         MhGOFwKGvB1u75iqxUL3YKuQ+afDfbtJpv38YJVZjfDDTdyBijgnI/Xm6Q/0JFnr+bAk
         ozz5njYkZoKK8fvb3ZJFJvDTmyNTa7iKcvPYzqYlHhsgoGNGYIMsQ7yF/QQm0KXSKbNZ
         9OdTY52w161j1L3uXilqFXaavPNXkFZQQ6WODGgdkCfjWmcoAanL/1Oo55OlvEew0VU2
         EAFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685068181; x=1687660181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cSWFCvBo3YeMHpqxjDLYuOwLwA2FLHPMe8Hk5LDphuc=;
        b=PIThv7XnRDkN/CgQABx19CvL1YGWX4hO4/BtHAwvJkKuj9pCHZoXP43cqJnQmY4T5I
         vo75rYLmRKWR4afj2Q7olnFKlUHD1u9u6AbLksBQVZFTnsNF53W0ITVuXy6uWtSorDlu
         UNiiUkNlqPrl4NAeEJTVrZ1odLuaO5PWRakMqjMrH1iLrtxznC4Ii6ps0f5LwNgptV0q
         iYik+pBUhDOdVOIMsCe4JXe7Ouv0UL9EGdFqVNSJjpqFT+5Ye6R4RJoXTorXioLBPngA
         rAANWdjMbc8+w3Z8ZZPJARYnNZqCA/27dVtBAYPn9NvWCKT/wM9zVyXcYcSB6MlaiA2j
         rI0g==
X-Gm-Message-State: AC+VfDzs1UFAznSJtCN2oBV2OkarAift6MfPaiSGCRrUDSFoVq0kqDy+
	FE7b7Peo6ZOnXnJzjym1V31xCGAmFN0Bj5Q7iNA=
X-Google-Smtp-Source: ACHHUZ6q/3uBKVeVs4Bv9+fBc1ES6ZEnTZ5/snustid4H55cc8WmHvJhfBVHw7SUTPFYs63VUcRGMw==
X-Received: by 2002:a17:902:e5cc:b0:1ae:2c87:f771 with SMTP id u12-20020a170902e5cc00b001ae2c87f771mr898769plf.20.1685068181610;
        Thu, 25 May 2023 19:29:41 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id t13-20020a170902b20d00b0019ee045a2b3sm2023794plr.308.2023.05.25.19.29.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 May 2023 19:29:41 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 11/21] systemd-systemctl: fix instance template WantedBy symlink construction
Date: Thu, 25 May 2023 16:28:59 -1000
Message-Id: <e572d096e81bb7dba8a07ee9dba93d0944857212.1685068004.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1685068004.git.steve@sakoman.com>
References: <cover.1685068004.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 May 2023 02:29:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181743

From: Martin Siegumfeldt <mns@gomspace.com>

Fix issue of the below instance template systemd service dependency

[Install]
WantedBy=svc-wants@%i.service

creating the symlink (instance "a" example)

/etc/systemd/system/svc-wants@%i.service.wants/svc-wanted-by@a.service

which should be

/etc/systemd/system/svc-wants@a.service.wants/svc-wanted-by@a.service

as implemented by this change.

The functionality appears regressed just after "thud" baseline when the
logic was refactored from shell script into python (commit
925e30cb104ece7bfa48b78144e758a46dc9ec3f)

(From OE-Core rev: 308397f0bb3d6f3d4e9ec2c6a10823184049c9b5)

Signed-off-by: Martin Siegumfeldt <mns@gomspace.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
(cherry picked from commit 372b29c8ad270d4d430c26a4e614976c7029afaf)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../systemd/systemd-systemctl/systemctl             | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd-systemctl/systemctl b/meta/recipes-core/systemd/systemd-systemctl/systemctl
index 6d19666d82..1c87beadad 100755
--- a/meta/recipes-core/systemd/systemd-systemctl/systemctl
+++ b/meta/recipes-core/systemd/systemd-systemctl/systemctl
@@ -184,12 +184,19 @@ class SystemdUnit():
 
         raise SystemdUnitNotFoundError(self.root, unit)
 
-    def _process_deps(self, config, service, location, prop, dirstem):
+    def _process_deps(self, config, service, location, prop, dirstem, instance):
         systemdir = self.root / SYSCONFDIR / "systemd" / "system"
 
         target = ROOT / location.relative_to(self.root)
         try:
             for dependent in config.get('Install', prop):
+                # determine whether or not dependent is a template with an actual
+                # instance (i.e. a '@%i')
+                dependent_is_template = re.match(r"[^@]+@(?P<instance>[^\.]*)\.", dependent)
+                if dependent_is_template:
+                    # if so, replace with the actual instance to achieve
+                    # svc-wants@a.service.wants/svc-wanted-by@a.service
+                    dependent = re.sub(dependent_is_template.group('instance'), instance, dependent, 1)
                 wants = systemdir / "{}.{}".format(dependent, dirstem) / service
                 add_link(wants, target)
 
@@ -229,8 +236,8 @@ class SystemdUnit():
         else:
             service = self.unit
 
-        self._process_deps(config, service, path, 'WantedBy', 'wants')
-        self._process_deps(config, service, path, 'RequiredBy', 'requires')
+        self._process_deps(config, service, path, 'WantedBy', 'wants', instance)
+        self._process_deps(config, service, path, 'RequiredBy', 'requires', instance)
 
         try:
             for also in config.get('Install', 'Also'):
-- 
2.34.1


