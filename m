Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01EBDEB64D9
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 14:05:26 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web11.13056.1686751516225544666
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jun 2023 07:05:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=3Ef1UzSb;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6537d2a8c20so5341848b3a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 07:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1686751515; x=1689343515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tkilat2ezKURTJLY7B6LgaXpImKUN6pa/wRD2f+RO0g=;
        b=3Ef1UzSbOj72Ii2gCE7GuQ4XXSSiWxpp34giqx7XWR/tva+crnsZfdM0BPpAgJAhpI
         zdICZGd9v1zRlbEElBCnaYpSuVObCE7iAPqKMZaGmXVbkW7skMc/vP4+H/12OTYpZIX+
         GoEjMNv8vIMW3axiSWNAXmOpKMoASBSeZExu6sHZrukLj+TocPHYNcxA2NGP9GhsC1xA
         uiGc/bwiUf3RQu5pYmnPT4zz4Ek0rvmahd+LgvO+J+axqHwERA16A2/kAfUxsMYE8f+B
         dW03Wr9BwLl2yRr2cRYRlbj8Y49td8hkJ9EGFwCUgcdpcJuwiFRZ/EkB6UoaNPVnzwgs
         ClkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686751515; x=1689343515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tkilat2ezKURTJLY7B6LgaXpImKUN6pa/wRD2f+RO0g=;
        b=fr4Hi3SgMBeLWAwF8IQbRUeT6itoScio9VFS8OScrsyrs2Idm5m1j3+BzFRRme9dKH
         vAsXRKE1RklooagVZgwD0ARnAFLQ/uM/PwPbcsOddv6KzDV5NHwwEqkjZEKNsctgsaCe
         tZSigB0UcjwVq6SW2Ty8lXwTcxGJ4nuQILWy09KZETsRDrHgy1A4mABr6IEiHg/c6Zpx
         WobQQxfS8uctgXT1bt4C94QVHJhWN2T5pVTouLdz48C7oW3kgZhCLDTbjyhnPgiCjt2C
         DNZrjDVQcbxbdmSBLTkY/8/a/TWGrhWApV1CHxMzc1GIAbbk3WoZntZjKnGjFFZoFqGQ
         vn3g==
X-Gm-Message-State: AC+VfDyWkXwk+VCLW0RJpqP3YA/DzRw7zfVFBHAZ3JmOhhFZpfI+xBW4
	mmnMoLJTyJHJwRxEhat4PrmqTjafDZr92Rq5BZQ=
X-Google-Smtp-Source: ACHHUZ7sd0UFpqG+i+GNdDl3l+QiEAxC0uql2UulcvOOwJKrC2TZE9m1v/3rRE36AuwDbrpALSjcmw==
X-Received: by 2002:a05:6a00:886:b0:64f:aea5:7b49 with SMTP id q6-20020a056a00088600b0064faea57b49mr2244901pfj.17.1686751514542;
        Wed, 14 Jun 2023 07:05:14 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id 187-20020a6306c4000000b005439aaf0301sm703757pgg.64.2023.06.14.07.05.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 07:05:14 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 3/5] systemd-systemctl: fix instance template WantedBy symlink construction
Date: Wed, 14 Jun 2023 04:04:54 -1000
Message-Id: <f5ebbb87943bc583049909f4216ca1d73a794261.1686751371.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1686751371.git.steve@sakoman.com>
References: <cover.1686751371.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 14:05:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182811

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


