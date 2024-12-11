Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E033E7717D
	for <webhook@archiver.kernel.org>; Wed, 11 Dec 2024 21:59:16 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.6560.1733954351715409635
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Dec 2024 13:59:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CpgyztH9;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3862d16b4f5so727308f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Dec 2024 13:59:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733954350; x=1734559150; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k4rl2mFQyq/4wW6LlLbou5q/REaODnyWSsEkDxQEOnI=;
        b=CpgyztH9aDE+JQeZKgAHboD5elNmEewugp6nCUJ4e9DPVDBwQ79AmWYFlkJNXl3rOB
         xr6hscLVu1hLnmN00n/0KRsBJmO7pljPJd00s8JLsZ0KKHqnikl2li+olayf7HwlcYwK
         0vVDJVYPxFYd083IsQHxGdNodYFtt1E2SgBZRvG07//3Jzc88qlZw5bZfkIbp/8iFO3d
         ASZszlHEUIPoachpAh0bviUwIIhZVOWb1Ot5WxScyZcBr1jyUZr9/Nqnlkb0u5KoDLMt
         uS5sp7CbeC7aH8oAp0rKwPzRzjn/5h4+F/yASEskwWAOC57AUTtd8/ellah0AfJvAWMy
         aYNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733954350; x=1734559150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k4rl2mFQyq/4wW6LlLbou5q/REaODnyWSsEkDxQEOnI=;
        b=Y5iAa9MJZ35dL/FuB1KMMvUpyJ+4Hud7f2rePeajW5npOm2FpdpkCsTOLBKtLB6t5O
         3LVg6tJE/Za5SylIJ4SU3KyhuBQ+m15OySiOE3rZAtjXlqd2Uzg5wWRA5A3ANrpsd6I0
         OiOaJ8m6yELIT6lrzfq8n1B6XoWbEJfiVrsWuA0adejR1sO6C/wUCiPTB69y/bqmeeuU
         Muppvnqbk7p4QbXrB5Th6nEutfdjIz8PNC7M9PPChtC8OwkuHrubH0knvswJlR2TqInr
         2bPw8KsSFExxO1Xn7X+A1ZlyFYyukOfb/m2F6UeUBgDWzY6K9wLRWcvnBPgP4yLzt73q
         nhLw==
X-Gm-Message-State: AOJu0Yxw6hjIgMUpmaGM2VqUGyWTynilrHUNgjTK91XMxjug4S3KtBV4
	X7rzzr0ulEXjZ4faA2JeePQQLhsuGK+m3sTDHTuWJpdX4Jhm3L7SkR8kjw==
X-Gm-Gg: ASbGnctXzyVERWJkkIYSv5OLfw0jqQaS2N7dV7VE0856pEMO1om1yMpPCdDxtVvcT58
	houc19rLfArx9KLttPrMPNeoIrI9IiX+weuOQnWWT4dfr7KfhllMOU1I47m6gwp/bxh+4fDSw42
	S1mvio212bbrR74Lnkn9TNjYJgwVafHiGI5Ij3clravIg0rVGOScN//j43laSNjOMEoHduu17Ez
	0JouqKdzSiHiytrvMzKSXDTOOXYs/X7zNVegdJtbZV3BAycRlu+xI9CHS0baNdvO0rtUdicuQ==
X-Google-Smtp-Source: AGHT+IFt8kaDN2o+fchRAtbp2EQRYmEPsilaZYFpivjkH6mork4w1IxYyLavera5Oe5LuyjAZrITjA==
X-Received: by 2002:a05:6000:699:b0:385:ea40:b46b with SMTP id ffacd0b85a97d-387887ac9d0mr629588f8f.4.1733954349698;
        Wed, 11 Dec 2024 13:59:09 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-387824c5c98sm2180792f8f.58.2024.12.11.13.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 13:59:08 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 3/5] systemd.bbclass: refactor adding files
Date: Wed, 11 Dec 2024 22:58:39 +0100
Message-ID: <20241211215859.2187259-4-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241211215859.2187259-1-adrian.freihofer@gmail.com>
References: <20241211215859.2187259-1-adrian.freihofer@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Dec 2024 21:59:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208614

From: Adrian Freihofer <adrian.freihofer@siemens.com>

The keys variable was intended as an array of keys. But it looks like
this has not been used for more than 10 years now. Adding files
automatically to packages needs probably anyway very specific code
rather than a generic loop. Lets simplify this a bit.
Using python code should also not be slower for these usually small
files.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/classes-recipe/systemd.bbclass | 28 ++++++++++++----------------
 1 file changed, 12 insertions(+), 16 deletions(-)

diff --git a/meta/classes-recipe/systemd.bbclass b/meta/classes-recipe/systemd.bbclass
index 7324af8555d..be77da48125 100644
--- a/meta/classes-recipe/systemd.bbclass
+++ b/meta/classes-recipe/systemd.bbclass
@@ -124,29 +124,26 @@ python systemd_populate_packages() {
         return appended
 
     # Add systemd files to FILES:*-systemd, parse for Also= and follow recursive
-    def systemd_add_files_and_parse(pkg_systemd, path, service, keys):
+    def systemd_add_files_and_parse(pkg_systemd, path, service):
         # avoid infinite recursion
         if systemd_append_file(pkg_systemd, oe.path.join(path, service)):
             fullpath = oe.path.join(d.getVar("D"), path, service)
             if service.find('.service') != -1:
                 # for *.service add *@.service
                 service_base = service.replace('.service', '')
-                systemd_add_files_and_parse(pkg_systemd, path, service_base + '@.service', keys)
+                systemd_add_files_and_parse(pkg_systemd, path, service_base + '@.service')
             if service.find('.socket') != -1:
                 # for *.socket add *.service and *@.service
                 service_base = service.replace('.socket', '')
-                systemd_add_files_and_parse(pkg_systemd, path, service_base + '.service', keys)
-                systemd_add_files_and_parse(pkg_systemd, path, service_base + '@.service', keys)
-            for key in keys.split():
-                # recurse all dependencies found in keys ('Also';'Conflicts';..) and add to files
-                cmd = "grep %s %s | sed 's,%s=,,g' | tr ',' '\\n'" % (key, shlex.quote(fullpath), key)
-                pipe = os.popen(cmd, 'r')
-                line = pipe.readline()
-                while line:
-                    line = line.replace('\n', '')
-                    systemd_add_files_and_parse(pkg_systemd, path, line, keys)
-                    line = pipe.readline()
-                pipe.close()
+                systemd_add_files_and_parse(pkg_systemd, path, service_base + '.service')
+                systemd_add_files_and_parse(pkg_systemd, path, service_base + '@.service')
+            # Add all units which have an Also= referring a unit in this package to this package as well.
+            with open(fullpath, 'r') as unit_f:
+                for line in unit_f:
+                    if line.startswith('Also'):
+                        also_unit = line.split('=', 1)[1].strip()
+                        bb.warn("also: %s" % also_unit)
+                        systemd_add_files_and_parse(pkg_systemd, path, also_unit)
 
     # Check service-files and call systemd_add_files_and_parse for each entry
     def systemd_check_services():
@@ -155,7 +152,6 @@ python systemd_populate_packages() {
         searchpaths.append(d.getVar("systemd_user_unitdir"))
         systemd_packages = d.getVar('SYSTEMD_PACKAGES')
 
-        keys = 'Also'
         # scan for all in SYSTEMD_SERVICE[]
         for pkg_systemd in systemd_packages.split():
             for service in get_package_var(d, 'SYSTEMD_SERVICE', pkg_systemd).split():
@@ -179,7 +175,7 @@ python systemd_populate_packages() {
                             break
 
                 if path_found != '':
-                    systemd_add_files_and_parse(pkg_systemd, path_found, service, keys)
+                    systemd_add_files_and_parse(pkg_systemd, path_found, service)
                 else:
                     bb.fatal("Didn't find service unit '{0}', specified in SYSTEMD_SERVICE:{1}. {2}".format(
                         service, pkg_systemd, "Also looked for service unit '{0}'.".format(base) if base is not None else ""))
-- 
2.47.0


