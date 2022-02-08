Return-Path: <daiane.angolini@foundries.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61DDAC4332F
	for <webhook@archiver.kernel.org>; Tue,  8 Feb 2022 14:39:55 +0000 (UTC)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com
 [209.85.167.172])
 by mx.groups.io with SMTP id smtpd.web08.11937.1644331194228248158
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Feb 2022 06:39:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@foundries.io header.s=google header.b=nJtC6Gii;
 spf=pass (domain: foundries.io, ip: 209.85.167.172,
 mailfrom: daiane.angolini@foundries.io)
Received: by mail-oi1-f172.google.com with SMTP id m10so20783644oie.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Feb 2022 06:39:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=foundries.io; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=W+yCQ1YOwaAu7zTCcU1M0yssZuIg8BIY02HibvLz/Eg=;
        b=nJtC6GiionYZDEKP3QbUqBlZCn4rBJiGXPi4o1YJE+pQfrtmvy+9L4pH4qTsy8JeqH
         iBhVHvQbS/ZsyYFpu+vtyYVGwBRy1M4Fm4rCk701gswEPBI7ehO1pEe4Kwu2LEiQL75K
         lBK/MoTciOxI6mM4wxOopVfxLX4n/s6sJPpupaOGU8Dxkfet9zdvribf35hFHXFfLeWs
         GQBo2t09MtnJBEqT6nLrQJlcckvk0l3HPaT7xJE1IZA4N5vmreMLlCoYv5ng4xHp0Qc1
         KomzDREquiMtEMdj3IE+QDct0X0IbHIqTHFRzXUISwBJK6R6wOTztUa4BmttILIxKmF+
         Jw9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=W+yCQ1YOwaAu7zTCcU1M0yssZuIg8BIY02HibvLz/Eg=;
        b=BUuiK/mL2HOHdf5ZvVVzsBaS+4peQhqVr6CXz8JZcjum02Vi2QXk0GJsZg/rmvi2Aa
         V3raLrgXK6OHQny0aOK9EF5VHOVvLOGS06iwZMcmcIesM4tPp+ZGAftcSvnx7nGO3MeR
         kb/NKHe7Ntq3e9QFr7mlme0EKRui8CK1ObkI5FicdM+Q9+KPXchT0ydf00yAchHdopMb
         MtoXhrfUFH3bSwj/C+u89YKwX1dS2iYFwzNxWW1zV0sWP0vd8QNC7m7BfJVyd421W3j/
         hK+RGpjNY3vaMWiJP+QbSzReHnMW3kscHuSSNQjVvRJKhyFOw2Z56IxxdWztEXORuKQ8
         YSMg==
X-Gm-Message-State: AOAM531zTSOEzOFue4skAufZT09KIA3AgARoYxsjsExYS4KVTTdVvZYB
	i5pYECGItZxmpHF+38Sy8CgMEmbJGuBVTw==
X-Google-Smtp-Source: 
 ABdhPJzJTIo+i3cxtdhJO1spbZbAll4YESd+WEiiKoZDY8GHmbUd7osgeo8b5YFOXHbErQ1iSc0C2Q==
X-Received: by 2002:a05:6808:2025:: with SMTP id
 q37mr652965oiw.31.1644331193167;
        Tue, 08 Feb 2022 06:39:53 -0800 (PST)
Received: from localhost.localdomain
 ([2804:14c:3bac:19c0:73ab:cecd:1b4f:f243])
        by smtp.gmail.com with ESMTPSA id
 d14sm5338987ooh.44.2022.02.08.06.39.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Feb 2022 06:39:52 -0800 (PST)
From: Daiane Angolini <daiane.angolini@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Daiane Angolini <daiane.angolini@foundries.io>
Subject: [PATCHi v2] classes/lib/useradd: The option -P is deprecated
Date: Tue,  8 Feb 2022 11:39:44 -0300
Message-Id: <20220208143944.2465441-1-daiane.angolini@foundries.io>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Feb 2022 14:39:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161512

This is also covered in documentation since:
https://git.yoctoproject.org/yocto-docs/commit/?id=3f3e5574ac9801ad92940168b61b532e0bd53a80

[YOCTO 14605]

Signed-off-by: Daiane Angolini <daiane.angolini@foundries.io>
---

changes since v1:
commit log
the patch was reworked

 meta/classes/useradd-staticids.bbclass | 4 ----
 meta/lib/oe/useradd.py                 | 2 --
 2 files changed, 6 deletions(-)

diff --git a/meta/classes/useradd-staticids.bbclass b/meta/classes/useradd-staticids.bbclass
index 8e2a7fb635..3acf59cd46 100644
--- a/meta/classes/useradd-staticids.bbclass
+++ b/meta/classes/useradd-staticids.bbclass
@@ -174,8 +174,6 @@ def update_useradd_static_config(d):
             newparam += ['', ' --non-unique'][uaargs.non_unique]
             if uaargs.password != None:
                 newparam += ['', ' --password %s' % uaargs.password][uaargs.password != None]
-            elif uaargs.clear_password:
-                newparam += ['', ' --clear-password %s' % uaargs.clear_password][uaargs.clear_password != None]
             newparam += ['', ' --root %s' % uaargs.root][uaargs.root != None]
             newparam += ['', ' --system'][uaargs.system]
             newparam += ['', ' --shell %s' % uaargs.shell][uaargs.shell != None]
@@ -236,8 +234,6 @@ def update_useradd_static_config(d):
             newparam += ['', ' --non-unique'][gaargs.non_unique]
             if gaargs.password != None:
                 newparam += ['', ' --password %s' % gaargs.password][gaargs.password != None]
-            elif gaargs.clear_password:
-                newparam += ['', ' --clear-password %s' % gaargs.clear_password][gaargs.clear_password != None]
             newparam += ['', ' --root %s' % gaargs.root][gaargs.root != None]
             newparam += ['', ' --system'][gaargs.system]
             newparam += ' %s' % gaargs.GROUP
diff --git a/meta/lib/oe/useradd.py b/meta/lib/oe/useradd.py
index 8fc77568ff..3caa3f851a 100644
--- a/meta/lib/oe/useradd.py
+++ b/meta/lib/oe/useradd.py
@@ -45,7 +45,6 @@ def build_useradd_parser():
     parser.add_argument("-N", "--no-user-group", dest="user_group", help="do not create a group with the same name as the user", action="store_const", const=False)
     parser.add_argument("-o", "--non-unique", help="allow to create users with duplicate (non-unique UID)", action="store_true")
     parser.add_argument("-p", "--password", metavar="PASSWORD", help="encrypted password of the new account")
-    parser.add_argument("-P", "--clear-password", metavar="CLEAR_PASSWORD", help="use this clear password for the new account")
     parser.add_argument("-R", "--root", metavar="CHROOT_DIR", help="directory to chroot into")
     parser.add_argument("-r", "--system", help="create a system account", action="store_true")
     parser.add_argument("-s", "--shell", metavar="SHELL", help="login shell of the new account")
@@ -63,7 +62,6 @@ def build_groupadd_parser():
     parser.add_argument("-K", "--key", metavar="KEY=VALUE", help="override /etc/login.defs defaults")
     parser.add_argument("-o", "--non-unique", help="allow to create groups with duplicate (non-unique) GID", action="store_true")
     parser.add_argument("-p", "--password", metavar="PASSWORD", help="use this encrypted password for the new group")
-    parser.add_argument("-P", "--clear-password", metavar="CLEAR_PASSWORD", help="use this clear password for the new group")
     parser.add_argument("-R", "--root", metavar="CHROOT_DIR", help="directory to chroot into")
     parser.add_argument("-r", "--system", help="create a system account", action="store_true")
     parser.add_argument("GROUP", help="Group name of the new group")
-- 
2.25.1


