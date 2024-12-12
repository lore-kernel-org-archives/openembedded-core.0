Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69BB6E77183
	for <webhook@archiver.kernel.org>; Thu, 12 Dec 2024 16:44:32 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.23995.1734021866865706399
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Dec 2024 08:44:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IG8IVA9N;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-385f06d0c8eso433304f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Dec 2024 08:44:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734021865; x=1734626665; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3cNNviIoa8QXy0mweKmzVrVZKmKqQ21eUG0Zu1E6tlc=;
        b=IG8IVA9N1g0m2gksIUV6UdNAwnaXNVoRpAd8ZjPNbIiqXUJf1bvGoX2EAPyCA+W0xk
         8yTrFqY5+8KACiTzuD6SaGr+fKfqh3GWx9Otjv6QmDFcfGife0I7n/3hrBlKXFGkUowh
         41jO6zo+kXAOB6DPlKPRKk3JWjAatP/0/rZUjSstzvDFA7yzaQtqIAIQ1mxdRxQwg22v
         52HxAe9jHuIwm/FZirNitEp1XfXJRNVp1MRYj5lu5wotExpU3MDfwDksmHdeT0Pb+k2m
         bcUOD0dP+SGSKrhRJgBvcQLwvr8oKTQXBNFNVu5hvfXj3rIA7j76HOURssE9/bnSaWDQ
         fBWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734021865; x=1734626665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3cNNviIoa8QXy0mweKmzVrVZKmKqQ21eUG0Zu1E6tlc=;
        b=beJf9Brz50wlZnN6Z4zeppBX0LqL8R+RBT40kDb6FtoXdd8nNEOlx8h0IQvKD2Nuqk
         9vCSQP7mxsh+y/HdQQCT19A7fabSBlW7Q4Yy75XMHjQjVcg6TnBH992NEbolrx/MOMJs
         RkiW8BX/Drq7fp4Rs3U2SLU5TaIdp6dO6nzUQKajoS4mf/ziCqITP6j6j9Il9aQ7Vn/7
         CzFAp3o99TOjQglLBIEn23Lz7zl3VFkjDa2sJx5tQ7jiLy6ODCmQH6kAWpOWgIDjlqeF
         SlvD3+QRPxj1xb/RnOdKxU8jfr6dGfPZxDxAveMi/fYYvLvE5o8a3yAJli0fB1nDoJqA
         dIPw==
X-Gm-Message-State: AOJu0Yy1ohNH+UHEVpr6ifASu8y6UW4a9OXn8tUfbRPpFI6ME6qDv7M9
	WAoX+zmChuBOhs2AKUMkmZoIMXIh4rgr0PPGAIAqgdx3VBxPJb6/QHDeDQ==
X-Gm-Gg: ASbGncuCIN3dtv4F5oiAJzh6n8bHMWkqlu8DTu/Et5Ym2RacLYsMXsztBTBb3vZ26Xe
	1PyP2ez5wAudkj4akMB31UZU4mwfVfdh+uufbcfG8K5oenZYRkEOBGRQN5H91GDB7fK594//kcd
	ad0kUuJJMNIlW+iwOkEOFBNPSi6ooLZ3tevCl2NQ0Ys/N/7Plu0DFwYCIGQPA1YSoIXvnvXkx3L
	IRuuu1qPxdkVf77mUUtdV94yaLgcZI8J1UacCC6G60TvGn5w0nAJlh+SnZt+/b4gnw1zkjF9F9V
X-Google-Smtp-Source: AGHT+IEsp5Ny6jIK33MEmPr+ZDRTqFcyiilPNP/i3XYWYYs9TzJR7O6b6Da25xjrK9zdJeTaFNybEg==
X-Received: by 2002:a05:6000:785:b0:385:db11:badf with SMTP id ffacd0b85a97d-3864ce54346mr6045598f8f.22.1734021864822;
        Thu, 12 Dec 2024 08:44:24 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-387824a4815sm4473331f8f.26.2024.12.12.08.44.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 08:44:23 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCHv2 4/5] systemd.bbclass: do not automatically add Also services
Date: Thu, 12 Dec 2024 16:55:25 +0100
Message-ID: <20241212164407.2904755-5-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241212164407.2904755-1-adrian.freihofer@gmail.com>
References: <20241212164407.2904755-1-adrian.freihofer@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Dec 2024 16:44:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208657

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Starting a systemd service “Also” does not mean that both services
must be in the same package. However, the systemd.bbclass enforces
this.

Example:
  a.service:
    [Install]
    Also=b.service
If a.service is packed in package A, b.service is automatically packed
into package A as well. This happens even if b.service is explicitly
added to package B using FILES and SYSTEMD_SERVICE variables.

The automatic packing of socket files with the corresponding service
files is probably a widely used feature of systemd.bbclass. This bahavior
does not change.

Adding regular service files to a package just because it is another
service in the same package that "Also" uses the service is a bug that
this commit fixes.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/classes-recipe/systemd.bbclass | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/classes-recipe/systemd.bbclass b/meta/classes-recipe/systemd.bbclass
index be77da48125..4b4470b7b34 100644
--- a/meta/classes-recipe/systemd.bbclass
+++ b/meta/classes-recipe/systemd.bbclass
@@ -132,18 +132,18 @@ python systemd_populate_packages() {
                 # for *.service add *@.service
                 service_base = service.replace('.service', '')
                 systemd_add_files_and_parse(pkg_systemd, path, service_base + '@.service')
+                # Add the socket unit which is referred by the Also= in this service file to the same package.
+                with open(fullpath, 'r') as unit_f:
+                    for line in unit_f:
+                        if line.startswith('Also'):
+                            also_unit = line.split('=', 1)[1].strip()
+                            if also_unit.find('.socket') != -1:
+                                systemd_add_files_and_parse(pkg_systemd, path, also_unit)
             if service.find('.socket') != -1:
                 # for *.socket add *.service and *@.service
                 service_base = service.replace('.socket', '')
                 systemd_add_files_and_parse(pkg_systemd, path, service_base + '.service')
                 systemd_add_files_and_parse(pkg_systemd, path, service_base + '@.service')
-            # Add all units which have an Also= referring a unit in this package to this package as well.
-            with open(fullpath, 'r') as unit_f:
-                for line in unit_f:
-                    if line.startswith('Also'):
-                        also_unit = line.split('=', 1)[1].strip()
-                        bb.warn("also: %s" % also_unit)
-                        systemd_add_files_and_parse(pkg_systemd, path, also_unit)
 
     # Check service-files and call systemd_add_files_and_parse for each entry
     def systemd_check_services():
-- 
2.47.0


