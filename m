Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74B17C04FFE
	for <webhook@archiver.kernel.org>; Mon, 20 May 2024 13:34:06 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.60352.1716212046035654129
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 May 2024 06:34:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=mo6RBjjo;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1ecd3867556so76890855ad.0
        for <openembedded-core@lists.openembedded.org>; Mon, 20 May 2024 06:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1716212045; x=1716816845; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YyM8Tc2QOmyjHx6yEFfVZstVtp1j2S4wttcJGZ44Fso=;
        b=mo6RBjjoj3vRowprEqXLPpP+hsKCWFZDzbwBYIaYBdd7iAcRVgioqYrrqB+4SYv9M8
         +ZC7MN8b8RmL7qQiTcvrdqtd6IEio6cEoeSuknY56xkyb4GYEXmJHxk8VZQoiWm6QI/E
         uoWQM0VXQ2BOzLfPImxixWPt+4hmjvu2xYktYcbN/lmGZXrh2DjPkQRGs+MFUedReyD6
         MKov350zfzXFvONlhaL9fniVB7wajMro2z33Wl4V50HD899Of38XIVpZaduUGsfp0oc2
         wrG+uBqo1IN6FJPHEmu/skwnyHzc7gm4uAS3Q5rrONysa5VZG95sh6CkuQ1kgDGwQ3mq
         9hYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716212045; x=1716816845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YyM8Tc2QOmyjHx6yEFfVZstVtp1j2S4wttcJGZ44Fso=;
        b=elTrMzP7IbZXaO4dmGRR4hjw0bLcqWs4L6g+75rZu1Pxd/WhvrLigDPwED/QEUNO8C
         9HWoPUpRoOPV8w6PyxPY90ngD81kJEMNSQYblH1okOIlUgrdOqyX0yw+IkO4q5ybclwL
         1O+jq529isofqdd5pFYvPE6loAmbqOMvAKkXi76phDI5sV1Iykbf4bUPq+MulOpBMB5z
         z1lubloxTqmHBZM6BMV0AYRupKH/ge45cAkNxPl3A1+r9bNsWTudCOiq0S5fkCLvuB/5
         m1hmir2JpKfCq9//LvFvPx24zpt3np3FTWfZYfqKzS8A3kdBU97eEwntB8fw9IhD6F+i
         ULaA==
X-Gm-Message-State: AOJu0Yy/XKUuIz8ln6cePgEbEzM+ostrgXYRL+y5lDY0XN43xrD0/412
	J04Ng4GctcS4DSOMA5MDxjV3WcZlYmy5TebLvwxw5eaNRR/rT2p1z9J1tkQuWweyLnrjyocYlgw
	d
X-Google-Smtp-Source: AGHT+IEoo3FbYXN7Np1ICk2lPQYXFEzq1c0UJp0bHhJWmKTjeKtfnzUXr50WYHUhawZ6EmlM+KNgGw==
X-Received: by 2002:a05:6a21:3949:b0:1b1:d519:6cce with SMTP id adf61e73a8af0-1b1d5196dc6mr3733811637.57.1716212045364;
        Mon, 20 May 2024 06:34:05 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2a66621sm19671465b3a.13.2024.05.20.06.34.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 06:34:04 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 18/21] recipetool: Handle several go-import tags in go resolver
Date: Mon, 20 May 2024 06:33:29 -0700
Message-Id: <b198617a988d6eeef09b84e1009c0dc8fb55a9c5.1716211838.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1716211838.git.steve@sakoman.com>
References: <cover.1716211838.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 May 2024 13:34:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199589

From: Sven Schwermer <sven.schwermer@disruptive-technologies.com>

When dynamically resolving go modules, the HTML page may contain several
go-import meta tags. We must handle all and pick the correct one based
on the module name. An example for such a behaviour is
gonum.org/v1/gonum:

<meta name="go-import" content="gonum.org/v1/exp git https://github.com/gonum/exp">
<meta name="go-import" content="gonum.org/v1/gonum git https://github.com/gonum/gonum">
<meta name="go-import" content="gonum.org/v1/hdf5 git https://github.com/gonum/hdf5">
<meta name="go-import" content="gonum.org/v1/netlib git https://github.com/gonum/netlib">
<meta name="go-import" content="gonum.org/v1/plot git https://github.com/gonum/plot">
<meta name="go-import" content="gonum.org/v1/tools git https://github.com/gonum/tools">

Signed-off-by: Sven Schwermer <sven.schwermer@disruptive-technologies.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 9c36a61e29359067165bddc7f2accdf2c4c8a761)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/recipetool/create_go.py | 23 +++++++++--------------
 1 file changed, 9 insertions(+), 14 deletions(-)

diff --git a/scripts/lib/recipetool/create_go.py b/scripts/lib/recipetool/create_go.py
index 0fb7115e26..a85a2f2786 100644
--- a/scripts/lib/recipetool/create_go.py
+++ b/scripts/lib/recipetool/create_go.py
@@ -225,7 +225,7 @@ class GoRecipeHandler(RecipeHandler):
 
             def __init__(self):
                 super().__init__()
-                self.__srv = []
+                self.__srv = {}
 
             def handle_starttag(self, tag, attrs):
                 if tag == 'meta' and list(
@@ -233,19 +233,14 @@ class GoRecipeHandler(RecipeHandler):
                     content = list(
                         filter(lambda a: (a[0] == 'content'), attrs))
                     if content:
-                        self.__srv = content[0][1].split()
+                        srv = content[0][1].split()
+                        self.__srv[srv[0]] = srv
 
-            @property
-            def import_prefix(self):
-                return self.__srv[0] if len(self.__srv) else None
-
-            @property
-            def vcs(self):
-                return self.__srv[1] if len(self.__srv) else None
-
-            @property
-            def repourl(self):
-                return self.__srv[2] if len(self.__srv) else None
+            def go_import(self, modulepath):
+                if modulepath in self.__srv:
+                    srv = self.__srv[modulepath]
+                    return GoImport(srv[0], srv[1], srv[2], None)
+                return None
 
         url = url.geturl() + "?go-get=1"
         req = urllib.request.Request(url)
@@ -265,7 +260,7 @@ class GoRecipeHandler(RecipeHandler):
         parser.feed(body.decode('utf-8'))
         parser.close()
 
-        return GoImport(parser.import_prefix, parser.vcs, parser.repourl, None)
+        return parser.go_import(modulepath)
 
     def __resolve_from_golang_proxy(self, modulepath, version):
         """
-- 
2.34.1


