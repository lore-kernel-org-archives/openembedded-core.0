Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 419DAC001B3
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 15:32:18 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web10.14571.1687447935643942691
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jun 2023 08:32:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=xmPnJKC0;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.179, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-53fbf2c42bfso5769636a12.3
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 08:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687447935; x=1690039935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tkilat2ezKURTJLY7B6LgaXpImKUN6pa/wRD2f+RO0g=;
        b=xmPnJKC0/YLpbyaiYq0HaNhHmp/ukpskkjJp1UvrGGqpm0GxIP3nbVTUXZ/kUCMeQ2
         rHFej2nivwwC1RKvlVqj4JfATy+JRqfhC7XGqB9846NpJN3gzICpci8GMCplb0UpYyW1
         sXduMPfsmXlGo3MqkpXZrRkeGejVsW0+Y6nDmvex1C8FUS/Nzn8u7Hrb3tlGhnVDhSDM
         kyccGdM5saSRuav5kjxucfyUkTT16FS5y5ElN69zcgxEV9X3XV1Q8Ahn6LKMU4pVZuMR
         rL5K+HfMhD4CBPRBioJKWw3ZDvRowPKc/dmMLHUievKbcH8vqfsZiG0lyao2bGY+9bZ4
         RVlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687447935; x=1690039935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tkilat2ezKURTJLY7B6LgaXpImKUN6pa/wRD2f+RO0g=;
        b=GAzQKcbFOp155bTzPqqvojM4ZbUD/dKM/+Yvx/lRy9kyFI/yo6oL6oHAHE9ogkl914
         J63LD/PKsWl2hL9N48OTTGPMeMyhJrEAj0e5H8LcadsT6RAcEyEdYAtR9y22MYO9jY+2
         WR8vd8LUBfVveV6OhswartyIvGI8sCEHRyO8WhvWDGwuiH+BooNSQuefQjGhv3UkxCk1
         Xw8CAn+E4ULMF3jXIxKtgO0XqcFuD0HaOFt7ekVBo+Q9IMzhREUmSrTIaPi5D7dTN3f2
         35a2t94uLVELwCOe3FWb6LAZBtE4V+ZqgxDWZlBEZaXUEJ/9DVZ1i8gDHKzQVUpWN1uw
         EKCA==
X-Gm-Message-State: AC+VfDxah8PQhKW0/BA/HGDplKzawXY/ea3M2P4jIWYzCHCw1ovOGxtB
	+QIqgsgFNWpjUZuL4eXYOE12WKzl1nwK9w8N0ls=
X-Google-Smtp-Source: ACHHUZ43VGFqcQyHneX5ywCYWjINf5BvPtvmlk15qcN8n/Wz0YSeI+FK6dxnYpqMqIZs6E8L/QsyNg==
X-Received: by 2002:a05:6a20:a592:b0:123:9582:e9f2 with SMTP id bc18-20020a056a20a59200b001239582e9f2mr3473258pzb.33.1687447934669;
        Thu, 22 Jun 2023 08:32:14 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id bm17-20020a056a00321100b0064ccfb73cb8sm4713240pfb.46.2023.06.22.08.32.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 08:32:14 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 13/14] systemd-systemctl: fix instance template WantedBy symlink construction
Date: Thu, 22 Jun 2023 05:31:42 -1000
Message-Id: <2751472807edc6d2ccc93b6339e6dc57d4abb2da.1687446532.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687446532.git.steve@sakoman.com>
References: <cover.1687446532.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 15:32:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183260

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
index 6aa2e20465..577c373181 100755
--- a/meta/recipes-core/systemd/systemd-systemctl/systemctl
+++ b/meta/recipes-core/systemd/systemd-systemctl/systemctl
@@ -182,12 +182,19 @@ class SystemdUnit():
 
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
 
@@ -227,8 +234,8 @@ class SystemdUnit():
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


