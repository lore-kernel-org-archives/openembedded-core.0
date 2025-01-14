Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ECCAC02189
	for <webhook@archiver.kernel.org>; Tue, 14 Jan 2025 12:50:45 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web10.43086.1736858060489111405
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jan 2025 04:34:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NlsBGBtI;
 spf=pass (domain: gmail.com, ip: 209.85.208.170, mailfrom: arturkow2000@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-30227c56b11so48995501fa.3
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Jan 2025 04:34:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736858058; x=1737462858; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pcJRygFYCbzJG2rQ1n3UEsxd1nm965Vj9vkbXqgqnsE=;
        b=NlsBGBtI5I3gmzsDrOy3OwsF6ib77tEvLN5SgS9RVRL+6Q7JPT+GPx1LnrrYA8UaWC
         wJfm3IsAp9+lN1Ai6b3KI0aZD52/iTOhAbLT/o+wCCJhKIcX7Ta0JQpr/wXX4cmw5Yrd
         n8okFPhav3e9MGvkZ1Xz3Hyhytsn0Nn+kESQshbB+oExQKubgKZAgnqdMLiqVZtDAL9T
         ryAKFbxEH8+7Yxs31vWJIr1m6n8XB2xhmZNz4WQBkaueMraBa1SHgs+UJTU+8uJP8fU6
         OUWYG1xq1ZRaq5e45niyvcchWMLzhB7vfSPukD9xkuuSqk2cKtxvQLIU5xI7kD7M7NdH
         ub9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736858058; x=1737462858;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pcJRygFYCbzJG2rQ1n3UEsxd1nm965Vj9vkbXqgqnsE=;
        b=RjuMj2COaHU+EN/RjH0Z8XFgtYqu1tF8dm+PurXZMXibsYa9ScuQXBFbKprPpCtHsn
         w8ZO8tL6AGoKGQ1PUDhw7nGEAz6xaTp8SWdxZRy7F+pnDNCLj1Oz8mahWXuQvhkZAi/R
         0b4la//BYzgOUG5zpcA/bzeLbw9xexEcLR1CdSCfjNgOCZXylnDPz4siAZG8/x0GEsYM
         AmRT8E+puV0CfO0PNGIu3XjBbmxe2hPdKyj19p81SDJHFDbIatVEplrMvMLrELaOs2mc
         A75jJurEThKSPXCyFJMxCqtCbuO6R3JGFXQRPXKDgDfUFRZxOPwnkmROLaIMyO/goZkI
         280w==
X-Gm-Message-State: AOJu0YzqPFnahcv7HSs8TCZyLNVFNO2yJey4smJKVCEUOAr+gcEK97y6
	YXDHUo84rTAHJ+Hkm7jfZP7ysnFlgq4C8fRm4Jt5g7v5K1BuYBG4ZJP5AQ==
X-Gm-Gg: ASbGncsF/DZwICOh+TKN6biFxOKwz52K1YfTTAYdpzp8N7ZadGivlO19faNtajTRj0N
	x+YILgDk/D+/Bti+TWQYpLodu7jciiq0CeJGjF107ljt0skRV6zp5pVQCIJvfkn2P76nfxxGsqT
	UUUJ+2ajyefOfJ5WGQU6jqWzChqUkdB4Ks0jQyFQvSuoj/G2V/HIlYcgGwyhv+MYSNmUZ6wBidI
	r+EvaeAqiK1W/0qpTl14WZmTmarjz0qzntkYkx19ChSxQocVzrukemPicq8ll8d
X-Google-Smtp-Source: AGHT+IFU1Hhw0RMPYWe49f7Ez9mEinF+qOTNRV9AONEkdXTq46ryXG3iwoGcrT5sDQgiz7XcR3Y7Yw==
X-Received: by 2002:a05:651c:2223:b0:302:4115:b69 with SMTP id 38308e7fff4ca-305f452fde1mr81509261fa.8.1736858058093;
        Tue, 14 Jan 2025 04:34:18 -0800 (PST)
Received: from eta.play.pl ([2a02:a312:c49b:a180:86d6:2e13:1a85:5192])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-305ff1ec4d6sm17230521fa.111.2025.01.14.04.34.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 04:34:17 -0800 (PST)
From: "Artur Kowalski" <arturkow2000@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Artur Kowalski <arturkow2000@gmail.com>
Subject: [PATCH v2 3/8] systemd.bbclass: factor out service lookup logic into separate function
Date: Tue, 14 Jan 2025 13:26:11 +0100
Message-ID: <20250114122613.3046925-7-arturkow2000@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250114122613.3046925-4-arturkow2000@gmail.com>
References: <20250114122613.3046925-4-arturkow2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Jan 2025 12:50:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209795

Factor out the logic into systemd_service_path(). This will be needed by
following commits to avoid code duplication.

Signed-off-by: Artur Kowalski <arturkow2000@gmail.com>
---
 meta/classes-recipe/systemd.bbclass | 41 ++++++++++++++++-------------
 1 file changed, 23 insertions(+), 18 deletions(-)

diff --git a/meta/classes-recipe/systemd.bbclass b/meta/classes-recipe/systemd.bbclass
index c167689d2a..14fef2d7a6 100644
--- a/meta/classes-recipe/systemd.bbclass
+++ b/meta/classes-recipe/systemd.bbclass
@@ -68,6 +68,28 @@ systemd_populate_packages[vardeps] += "systemd_prerm systemd_postinst"
 systemd_populate_packages[vardepsexclude] += "OVERRIDES"
 
 
+def systemd_service_path(service, searchpaths, d):
+    path_found = ''
+
+    # Deal with adding, for example, 'ifplugd@eth0.service' from
+    # 'ifplugd@.service'
+    base = None
+    at = service.find('@')
+    if at != -1:
+        ext = service.rfind('.')
+        base = service[:at] + '@' + service[ext:]
+
+    for path in searchpaths:
+        if os.path.lexists(oe.path.join(d.getVar("D"), path, service)):
+            path_found = path
+            break
+        elif base is not None:
+            if os.path.exists(oe.path.join(d.getVar("D"), path, base)):
+                path_found = path
+                break
+
+    return path_found, base
+
 python systemd_populate_packages() {
     import re
     import shlex
@@ -158,24 +180,7 @@ python systemd_populate_packages() {
         # scan for all in SYSTEMD_SERVICE[]
         for pkg_systemd in systemd_packages.split():
             for service in get_package_var(d, 'SYSTEMD_SERVICE', pkg_systemd).split():
-                path_found = ''
-
-                # Deal with adding, for example, 'ifplugd@eth0.service' from
-                # 'ifplugd@.service'
-                base = None
-                at = service.find('@')
-                if at != -1:
-                    ext = service.rfind('.')
-                    base = service[:at] + '@' + service[ext:]
-
-                for path in searchpaths:
-                    if os.path.lexists(oe.path.join(d.getVar("D"), path, service)):
-                        path_found = path
-                        break
-                    elif base is not None:
-                        if os.path.exists(oe.path.join(d.getVar("D"), path, base)):
-                            path_found = path
-                            break
+                path_found, base = systemd_service_path(service, searchpaths, d)
 
                 if path_found != '':
                     systemd_add_files_and_parse(pkg_systemd, path_found, service)
-- 
2.47.0


