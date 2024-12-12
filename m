Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64DC5E7717F
	for <webhook@archiver.kernel.org>; Thu, 12 Dec 2024 16:44:32 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.23994.1734021865587328514
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Dec 2024 08:44:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kyjs/PGx;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-385e1fcb0e1so442257f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Dec 2024 08:44:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734021864; x=1734626664; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k4rl2mFQyq/4wW6LlLbou5q/REaODnyWSsEkDxQEOnI=;
        b=kyjs/PGx5XH6jnkOy4SJha9nBngrJ2nA8V7pAa6nX8mmkpFAsVvjJ4/TI3nZOjZYML
         Ozz/eUPUjEHkx4owEnOT6neegdSjebbpVMlFAZzXNR8xBm5KTBDzS4diTtQo5uDN1t3W
         Xg/OWN6wJ/yfkGfyRwnukRVDbG+uMe9qXWoltb8M1PTbZ00VbIONhD5DhvFyBXupNR8n
         qUrZiv3OpGL1BDKtgvTh33ue5wvREhk7cPYV28CSgJshGpHS9FDrqNRNRh7qUpyRxi3Y
         Xcgq2zeRxGekTbBt9RZvrm3MJQVmqkl9WuxWu3ZagX7Gd8Wu8tesyHeEsyTldq5OITQc
         tlXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734021864; x=1734626664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k4rl2mFQyq/4wW6LlLbou5q/REaODnyWSsEkDxQEOnI=;
        b=rWADGfFIvCYLClDJ4eGk0CWPqP5C+T3rU4XUDjjLZLu8rtYuLch3p5blP+AQFGZb8r
         RWecydPOG+MHKb1Mtw5sq46ls0vkcODq9+C52w7+2mkRnN+iMmwkUKw7HzXZDbrfnNkK
         +sv93yYKpHUVLKJ9iJnZLOljxbuMeRoz5AHT5T+F6QzMgtvsYphRS1rk2KMmRQG1j+He
         ZwVSJRvNMeB7F7ckDXHbUydWxFf7AsOmrvvexGX+7PBEFtbpORv7hq8TMU22EDh6bXDX
         yAfHC5ad0+mE9wdKgk3WyXxHG3qQzkYeA52ZrAn7lZaclx2u+YzmHdtTylhoBNAcABk4
         9Cow==
X-Gm-Message-State: AOJu0Yw22t2mPPgYGU2UfOmeE0dBOLMMJzve3Od1Qm6VxgKMpz/ML98E
	91EV4alU23jO5zkJgzkXIZxbmZaVO832yEjLPlUhviEZepu9ULl29VWVLg==
X-Gm-Gg: ASbGnctwtXqXKZI+eodTOASdOBFF3ufBtKbBYVj466FMQ6AbDHmg9Lfxi7l5gMt7YGw
	nndUH+EOa9t696d7tY3oB/ySCgRffz6c0w83g2lJT80zZZTO3cn8MNoufkZFCtVJoTky1HaxeZL
	+mxWNd9kQ5tQwhxcFh/xfLLRBHhmW0a6h9V4NunYj5Jgu0Qf8BEQiEIQ2OTstwC0y3SCJ9AgQkg
	ezAwVYOY4Myx2T159iUN9NdoUWSpIxHxvGH/wIv6oB1fj/UImFyqBcsA5/4xdJ/SkXQ8FIGzEHa
X-Google-Smtp-Source: AGHT+IHfDZvcg6hj037UmEWkeORs0yvlO8sPc3awTgyzU0aK1+R1FsV+4mRHobhU0QiZl57GlEe4qg==
X-Received: by 2002:a5d:5f89:0:b0:385:e0ea:d4e7 with SMTP id ffacd0b85a97d-3864ced3a1bmr6863404f8f.55.1734021863459;
        Thu, 12 Dec 2024 08:44:23 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-387824a4815sm4473331f8f.26.2024.12.12.08.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 08:44:22 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCHv2 3/5] systemd.bbclass: refactor adding files
Date: Thu, 12 Dec 2024 16:55:24 +0100
Message-ID: <20241212164407.2904755-4-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241212164407.2904755-1-adrian.freihofer@gmail.com>
References: <20241212164407.2904755-1-adrian.freihofer@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Dec 2024 16:44:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208656

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


