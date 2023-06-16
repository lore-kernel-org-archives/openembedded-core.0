Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDB56EB64D7
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 14:38:08 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.295.1686926282962098921
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Jun 2023 07:38:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=EVHHRpHR;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1b539d2f969so2240065ad.0
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 07:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1686926282; x=1689518282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JVzh0DNlOiEig4CMUFBDTnWEbxA5jca24NLayS2BhJs=;
        b=EVHHRpHRvcm+wKSCpZsaBwqjGJkYGAz+jUyYmh/7//R2qGsKu/cUdvEUTs8jPQKAfZ
         WFs2t+1+eT5YzJkQfUbMWEobi3ltG83dlwtZqzTUZ8x2rXyHQqUv+w6mJzwAXl7yroBr
         ZTowv3LvxU66ldj5Ww6vduTeJKKhGVbrjVMhGETDyUBOKsF4OqZCnTqLw9DEgdE5W/vY
         g5PYvboLQFCyhoCQ90LV3fxYH2MxlqfngnkMhPlc4tQyAlgMxTccZe7MKv/EIbWcKzJ3
         qoVTfy21jh0GNnsAfRu92gpzhx0QOur0gZzf4oTUCSPsu+HnX18gkUAcYFyk+AjgoN2T
         +MLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686926282; x=1689518282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JVzh0DNlOiEig4CMUFBDTnWEbxA5jca24NLayS2BhJs=;
        b=VJIkYzHRCTcYtaj4EE2D3T26Ly2KxQlYANr7Prx7EoGTo3m7L8pHrzXwOnMMCBLH/C
         zHoyA1Kl2PeiY978Jbmnbf4adnvj5Uqpwsk7GPECLcq5kc4DAQX88z7iFhi8NSCCBepT
         0abMe0E4b/OZHjFg/yc3xMbSg/wQjcoxD/LWfXFyrQ6Fc1F6k4VlD4Mx1Jfg9vRIex1m
         niTmoRO/zHY5mRzTIQI407PDHJMQUjBTju2/Ei73Cy8amguaSj6zGna6tTfWkmsIvjuK
         hZWi+fPH/6LpqoksPTMu3/bCQPYr2o3PLR+CXHCtzUWSfT9vrkBTca9ngNYWVXIsS+kn
         FdZw==
X-Gm-Message-State: AC+VfDzDWtJ1zJY4sweqryN6/IIMj5TL3PTFlsiF6PaSx8ZIFxGp2Uaz
	qBtTlgTkMDs2p4GOur2zrFPQLfZUNiEonZ121YY=
X-Google-Smtp-Source: ACHHUZ7J9IwcsFqHfLOHPdRcxU5SOPqU5rTkM1P/RdxcIWhCQ+Yg36KZ2aZBMlkgT4D8eZtnF8Rg7g==
X-Received: by 2002:a17:902:f7d3:b0:1b3:b84b:9008 with SMTP id h19-20020a170902f7d300b001b3b84b9008mr2619449plw.5.1686926281971;
        Fri, 16 Jun 2023 07:38:01 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id k21-20020a170902761500b001b03f208323sm15865547pll.64.2023.06.16.07.38.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jun 2023 07:38:01 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 24/24] systemd-systemctl: support instance expansion in WantedBy
Date: Fri, 16 Jun 2023 04:37:15 -1000
Message-Id: <c734906a901c5dead9d879df0f251ba848fdb577.1686925952.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1686925952.git.steve@sakoman.com>
References: <cover.1686925952.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 14:38:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183045

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
index b45a2dc2f7..514f747fe6 100755
--- a/meta/recipes-core/systemd/systemd-systemctl/systemctl
+++ b/meta/recipes-core/systemd/systemd-systemctl/systemctl
@@ -201,13 +201,8 @@ class SystemdUnit():
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


