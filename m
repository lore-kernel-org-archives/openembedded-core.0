Return-Path: <emailaddress.ashish@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7864C44507
	for <webhook@archiver.kernel.org>; Tue, 14 Jul 2026 05:01:11 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3434.1784005262657274831
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jul 2026 22:01:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=LtNH2o+K;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: emailaddress.ashish@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c88a4d79ba5so2526132a12.2
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Jul 2026 22:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784005262; x=1784610062; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UD4xYbSTEoHNH4e2JVBjOAIbnvNjaJ6fAoqrvODFMn4=;
        b=LtNH2o+K7kQemdyKOl9Loahc7xEnKZWT/gvjQDHE91AvaRXXV33Ffp81W/kusEz/Yq
         JhSDKIUcUv9Q/ZjfNqMNSvZrYULWJ0QjhPpouqnp7Jv4hLUSBiz8ei1VXX9N/tI1O0VE
         nI0+kh2wV56CN9+26sEgDbkqw5GiAZ+tPhPksObLwQBUn6w0J6DltH/pWWLhbScpHKVz
         cMJEW7g5yhOAHsd3gp54LOqNxO0BhJfoGsH5IsBH7mXgq2d/YNlJHdUEWwoVIGDUWhAy
         IvUjC+F7emdPgTf7v6T2Me4lpcqLHpS35cxzYtxe2bLIWLm9RFU0uq4sy85JSI5FCR53
         ChGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784005262; x=1784610062;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UD4xYbSTEoHNH4e2JVBjOAIbnvNjaJ6fAoqrvODFMn4=;
        b=CEki4GWKYo9pyEeVDC9yxciSxUroOf6+o0UMfrm0JK4aXfiTRdrq9BxL/T+VlwmzHp
         ASO+KsUVBOsmGeOjqxUqVCvFdpmaruFXGKgd6Qq95aaZ0K8SLbA5EkDT2kfjbUv0CtiB
         kkBrx8GYwVg9hHTSxeCWUou/1Yu9bib5rModhehlpUKWKEmj7Ed+eaSCpb9hsCecFkGR
         o4TXDbzT4K0iLWw1oYN+l1JpYW9x6eTYATx1d7q5LcN1kf5IE7lCDMU4YoW0d+73mcRj
         Og5wQvoLs+qMd/GSDx2/LvohpKoqwSGp5elWac33zeXYvhOW/20BdT2J7GhOC6A2bQgH
         +jtw==
X-Gm-Message-State: AOJu0YyR+p0tljWJzMlN1OT31MRxkPW9pijIc+CViH4f01DFWDsUbtbu
	1cm3vwj3Mek/CUKhjdgOg7BwFhIvdCNiGkquOqBAb+nXz+9sCFe1L1C24FNq3A==
X-Gm-Gg: AfdE7clZSCVa9DKNUK8KOvb4bF5MyO8cAAULGJeyOjMEHtIQNniNRdTOGh+kTqK9Ij3
	kW/qq9BB9/1Sdi/zTI41+3lJYUyWV0k+aCyKFj4lC9kWHMjtodBO/Sob9zHKvz/eMnUkJfZOgwE
	cfYGR4I/Q5ttDq+l704jf1Q5mj53rJgMRpzcXhpnnNOFTX/T0Ux6+4pMM0Kf3rVEwhv407pYcyT
	XUb5yx1YUQS2oNjXZ/Z0kzaLpHflcIMIiYAfA3O9H32TIA4fL1t3IGu8vk2RZMvlKD/YAnD45Ip
	/3zf0OZ7jE7/2qdGMMqb2p2YDm/AYrliFI5aEPVhEY3VYkPalzPzei5RA86J1IjDAxL7rV85EjQ
	xIQXQJRL7IEWbupsfD7XB0dsbpC5VdTsRZoVIni2paefE3tZlY+SHVLcv+eP0zdYcOaQTTgwrDn
	mzgtp6QRZc8h9DsvxmlSt6c3syOXwaZKgyzB5U4yyp
X-Received: by 2002:a05:6300:218c:b0:3bf:82c5:ed13 with SMTP id adf61e73a8af0-3c35754ee80mr996968637.38.1784005261644;
        Mon, 13 Jul 2026 22:01:01 -0700 (PDT)
Received: from ashishkumar.. ([2406:7400:12b:e084:49b5:3276:f51c:9aff])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b93ae3b45sm23592861c88.15.2026.07.13.22.00.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 22:01:00 -0700 (PDT)
From: AshishKumar Mishra <emailaddress.ashish@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: AshishKumar Mishra <emailaddress.ashish@gmail.com>
Subject: [OE-core][PATCH v2] package.bbclass: hardcode emit_pkgdata to run last
Date: Tue, 14 Jul 2026 10:30:03 +0530
Message-ID: <20260714050003.210678-1-emailaddress.ashish@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Jul 2026 05:01:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240862

Ensure emit_pkgdata runs after all PACKAGEFUNCS to allow layers to
extend packaging behavior.
Layers can now append custom functions via PACKAGEFUNCS += "func_name"
and they will run before emit_pkgdata generates package metadata.

Signed-off-by: AshishKumar Mishra <emailaddress.ashish@gmail.com>
---
 meta/classes-global/package.bbclass | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/classes-global/package.bbclass b/meta/classes-global/package.bbclass
index 30accaeaa9..cb92b49571 100644
--- a/meta/classes-global/package.bbclass
+++ b/meta/classes-global/package.bbclass
@@ -472,8 +472,7 @@ PACKAGEFUNCS += " \
                 package_do_shlibs \
                 package_do_pkgconfig \
                 read_shlibdeps \
-                package_depchains \
-                emit_pkgdata"
+                package_depchains"
 
 python do_package () {
     # Change the following version to cause sstate to invalidate the package
@@ -564,9 +563,13 @@ python do_package () {
             for file in files:
                 pkgfiles[pkg].append(walkroot + os.sep + file)
 
+
+    # We want emit_pkgdata to run last, after everything
     for f in (d.getVar('PACKAGEFUNCS') or '').split():
         bb.build.exec_func(f, d)
 
+    bb.build.exec_func("emit_pkgdata", d)
+
     oe.qa.exit_if_errors(d)
 }
 
-- 
2.43.0


