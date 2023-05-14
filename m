Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7951C7EE2A
	for <webhook@archiver.kernel.org>; Sun, 14 May 2023 16:32:16 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.70174.1684081928446285192
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 May 2023 09:32:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=IWKWO4Yj;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-643846c006fso12577027b3a.0
        for <openembedded-core@lists.openembedded.org>; Sun, 14 May 2023 09:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1684081927; x=1686673927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6shsjqqSNJNiS1k+I7/FHyfdavPBzFbfLX+xZCB0yJE=;
        b=IWKWO4YjvmVQUfdaj+1PF72LfdSKGQzdFF0mjjSl3YadMOE6uZ6trMB8+w6OtPeCEx
         FmMYaii8W4mfRb22tlEYcHWN5HJ5HNIV33X0/WLwTD+tt8YMYE61kUxLbkkwDfYtUufQ
         hLcBL+ZDMOx8oYKLfM5FYQULLCr1AoaSFvRFRtogSijwLPMkoCVbr9VAqEeEkAiSKGz8
         SylieqlQHJdmmohC1SUZ8HpV9Ur9CzDrhwZjQzlfDhxXgYeu/1ulFdzlsV+Cl1pZscwT
         qIO2fa9qwCkufwPQQAlOPZecrLholTXBl1yOtH222a94Jdktqyw338jY2b7ZR5blOVIJ
         8yeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684081927; x=1686673927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6shsjqqSNJNiS1k+I7/FHyfdavPBzFbfLX+xZCB0yJE=;
        b=hcIZUsHguniEvWiz3YBN/UdLAjyMLlQkmfdzJBA+kC9KG13klrg90meGVvClZ/3WFH
         9xXjWjgSW4tH5ukV/x1kpfGzy8ylZumPZZATSvmELsaIxWjXgVuQBxE8YgCJjdfNlpLk
         R3HDws3OHitPMjYrsWns1QhXkm3VZjFROhV0DEIu8UXTGhxpII6/W/DPfGNLz8ZVZga1
         M5R+OYm0xjUYFgAQvn+iRcQ2AmolwyR7v07Zp6k8dFtYoYKfZe0WVqth1XkIdFMaUkIN
         hE8r2GlOlI45mhLsvkLfhoJ9pdl8JS13jCTKsiSvQPldNCrzr4snG4YcldDJdIGgPX/Q
         x68w==
X-Gm-Message-State: AC+VfDx/ono7ROU1uNIV2cPP2wfxJ9bau2Rb0qq3suulk4M/xH1UAiBN
	ms+OLU4TJTvKchTEG+pckwUT2W0+KyOcxZiNNSk=
X-Google-Smtp-Source: ACHHUZ5Zf4Jd+dq7O4aEK4OGJe4bEGdQ6q1d0kF4ejwlOAmR5qht5L6KoHKBQ7mM1ZBUs1L7iRjhHA==
X-Received: by 2002:a05:6a20:7f8a:b0:ff:8911:c695 with SMTP id d10-20020a056a207f8a00b000ff8911c695mr35715194pzj.43.1684081927548;
        Sun, 14 May 2023 09:32:07 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id x14-20020aa784ce000000b006475f831838sm981877pfn.30.2023.05.14.09.32.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 May 2023 09:32:07 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 12/15] systemd-systemctl: fix instance template WantedBy symlink construction
Date: Sun, 14 May 2023 06:31:37 -1000
Message-Id: <372b29c8ad270d4d430c26a4e614976c7029afaf.1684081748.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1684081748.git.steve@sakoman.com>
References: <cover.1684081748.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 May 2023 16:32:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181213

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
---
 .../systemd/systemd-systemctl/systemctl             | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd-systemctl/systemctl b/meta/recipes-core/systemd/systemd-systemctl/systemctl
index cddae75a06..b45a2dc2f7 100755
--- a/meta/recipes-core/systemd/systemd-systemctl/systemctl
+++ b/meta/recipes-core/systemd/systemd-systemctl/systemctl
@@ -195,12 +195,19 @@ class SystemdUnit():
 
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
 
@@ -240,8 +247,8 @@ class SystemdUnit():
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


