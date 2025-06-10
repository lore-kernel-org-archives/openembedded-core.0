Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B910C5B543
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 16:09:48 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.91301.1749571778444246589
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jun 2025 09:09:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=UDrYDz6O;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-236377f00a1so10093725ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 09:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1749571778; x=1750176578; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WIDnlPWT17Lxw9+OqoUkqtpQpFMOVXjOZj5KIa9gE68=;
        b=UDrYDz6OUKhHRBIA5cM4s6HxB8Hx/+B06WFPWyDTmmS/yaK7GSNNqGzf70qXxcVvDO
         mmeSsreUy7vpKUvWDzBTg1I7jK3/p7WiyGMGB5+8VY2tVQIsWfgax1MAJjinDEKdlmWR
         29n9XXk0zd7z8/eza0hb+IECiCXl0rmEdTWVRHSrQ0RFBnIWWhy5IzeIN4uwBz8bN8nb
         jjfI8fxPfdn+f8eoN+GBNPhTt9nKS8Ykz87NoaQWF1z3uFnJTDTS7cLGZNiv0GZJzWaI
         cQPitOn9Ipc1Cz5hnZH9GCp9iESuKIs9RYMV2igeS8AuePEDPRVTVs+8kcaTwrjV4vJp
         OGmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749571778; x=1750176578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WIDnlPWT17Lxw9+OqoUkqtpQpFMOVXjOZj5KIa9gE68=;
        b=TJAYL7PWcZ1PZN3O6lxjTnGy3udf747BfJaCOFii7PxXKZouwTimrr5ZR7SIXxqSwO
         uKAYEOnk47VpYDJd3wmZZT+GUKdfyCvi+PfgvvtCT8/qfsaHZiDmVlv2Vut4dlOu76sO
         6fC6tQpxIN9QF2OA+viK1niABRkHW2WLN3d6KZ9FguabhDiMX8bQ9KBqtLnOyX8Jojk6
         uh5gVGFP5SU3/hgyGhL0eJh6oFglvREzJJqnOqm8HnbJnC9KhRs46RCz4T6qOBgNQ0NY
         UcJF6/GPhYQsPNNbcC6nZycgmghReYU2f9eZv9rw6688eFzL3ZKmrhyJMIufwe2J+iUf
         wtLA==
X-Gm-Message-State: AOJu0Yzp8g3SHuY+96MoYoNXIXHbGtjsPg33VdRRGXsfFkBrjaAc6zE3
	uGILJd0EPUtR4YVethJytJ4dlxpWyng6JWx9HpFY3gE5Ie2X8spE4i9pnnwtSozo5Aw2YGhq+Aj
	Ycg6/
X-Gm-Gg: ASbGnctBnSvmXWqOR6ix0Abeevs3kcVx2MsmA67VxVPhl5DfFhsIbQafMOz68cX37Yy
	PAawdlNBXHUiwMi5yMIj4IwgzR5RIDtB8n7hdzlx2eGhPvdHQAl2bKLLnUseLINVKIUgwEX+hVK
	Pkf/MZh8C1VagPz4kG0st/uyvBzf74UEzv5l3MeSaXy63Kggd+950kZr58aM+og1hoUMWUpkNsU
	pGCl4cwlveYnsTzZSJEdkGLLmzcZ+BthG6q51LPTuFSX2GG8eNfKJf9+E6OxFtVq7hyq2Fm0P6S
	I896QwGYAd0oQKr6YpeeXhY0q9GhRSStqdX1XSrSJ80c2YMfBuKHng==
X-Google-Smtp-Source: AGHT+IH+Jh4iA+uvtfFAgUVe6lwQtZYKz24Ozi7cadoAE/TzVvxQvH2R8yRF6yQh1JYfQCBItnccLg==
X-Received: by 2002:a17:902:dacf:b0:22e:6cc6:cf77 with SMTP id d9443c01a7336-23640d066bfmr6421435ad.53.1749571777139;
        Tue, 10 Jun 2025 09:09:37 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7bc4:2c75:fa51:ff16])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236034056e7sm72597295ad.166.2025.06.10.09.09.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 09:09:36 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 28/32] systemd.bbclass: generate preset for templates
Date: Tue, 10 Jun 2025 09:08:41 -0700
Message-ID: <ea207dce1f5f8579d8ddde487ac9852f50bfc792.1749571556.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1749571556.git.steve@sakoman.com>
References: <cover.1749571556.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 16:09:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218397

From: Patrick Williams <patrick@stwcx.xyz>

There was a regression introduced by the change to use
systemd-systemctl-native rather than a python fake implementation,
which caused template units to not be properly enabled when set in
the SYSTEMD_SERVICE variable.  Through investigation, it seems that
the best way to re-enable template instances is to handle them
explicitly in the systemd.bbclass and enable them with `preset`, like
most units are handled[1,2].

Per the systemd.preset manpage, the format for template units is
different than for regular units[3].  We need to coalesce all the
template instances onto a single line and emit them as an additional
space-deliminated argument.

Ran this against openbmc's phosphor-ipmi-net recipe and generated
the following preset file:
```
$ cat packages-split/phosphor-ipmi-net/usr/lib/systemd/system-preset/98-phosphor-ipmi-net.preset
enable phosphor-ipmi-net@.service eth0
enable phosphor-ipmi-net@.socket eth0
```

[1]: https://lore.kernel.org/openembedded-core/Z2ch.1747051947055246176.oktf@lists.openembedded.org/
[2]: https://lore.kernel.org/openembedded-core/aDdoTVtCmElpURYD@heinlein/
[3]: https://www.freedesktop.org/software/systemd/man/latest/systemd.preset.html

Fixes: 7a580800db39 ("systemd: Build the systemctl executable")
(From OE-Core rev: f33d9b1f434e40a459614d8dc21ce45e11581008)

Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/systemd.bbclass | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/systemd.bbclass b/meta/classes-recipe/systemd.bbclass
index 4c9f51d33d..12c59647be 100644
--- a/meta/classes-recipe/systemd.bbclass
+++ b/meta/classes-recipe/systemd.bbclass
@@ -224,6 +224,8 @@ python systemd_populate_packages() {
                         service, pkg_systemd, "Also looked for service unit '{0}'.".format(base) if base is not None else ""))
 
     def systemd_create_presets(pkg, action, user):
+        import re
+
         # Check there is at least one service of given type (system/user), don't
         # create empty files.
         needs_preset = False
@@ -239,10 +241,17 @@ python systemd_populate_packages() {
         presetf = oe.path.join(d.getVar("PKGD"), d.getVar("systemd_unitdir"), "%s-preset/98-%s.preset" % (prefix, pkg))
         bb.utils.mkdirhier(os.path.dirname(presetf))
         with open(presetf, 'a') as fd:
+            template_services = {}
             for service in d.getVar('SYSTEMD_SERVICE:%s' % pkg).split():
                 if not systemd_service_exists(service, user, d):
                     continue
-                fd.write("%s %s\n" % (action,service))
+                if '@' in service and '@.' not in service:
+                    (servicename, instance, service_type) = re.split('[@.]', service)
+                    template_services.setdefault(servicename + '@.' + service_type, []).append(instance)
+                else:
+                    fd.write("%s %s\n" % (action,service))
+            for template, instances in template_services.items():
+                fd.write("%s %s %s\n" % (action, template, ' '.join(instances)))
         d.appendVar("FILES:%s" % pkg, ' ' + oe.path.join(d.getVar("systemd_unitdir"), "%s-preset/98-%s.preset" % (prefix, pkg)))
 
     # Run all modifications once when creating package
-- 
2.43.0


