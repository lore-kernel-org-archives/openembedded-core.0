Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8835C41513
	for <webhook@archiver.kernel.org>; Mon, 17 Jun 2024 12:05:14 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web10.55009.1718625908623713045
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jun 2024 05:05:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=HiIOhV5a;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.170, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-656d8b346d2so3015873a12.2
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Jun 2024 05:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1718625908; x=1719230708; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a7bH4UGiW+MvGPh9wDOD3T4A2GrW+z9WGqtLSCI8xpA=;
        b=HiIOhV5aj/vpXJ/+TGBYRvtLV9cyUhc0pGmP83smg1tSI5J0PgdZSwfFyYZNpfzJzD
         K6kIY8bZDIFlS463l9juAcUSR8Y5tvUbROD0i6RazxYZYgW41sQcwsZbQNFIQl9iUKY/
         sznggL/6+6ijQxP5VVQyRHNeSkOC3pKdKRPftoZRT9bBZ3KhU+Y3C5BOB1PRmXdpoe9n
         XxzS4i5EO/px/YprbMTqEuBU1oB/efvR8YF7q7J8kSmVaate6hIhGaGNiLv12BnH7s24
         9VrKbjfAofKyt/SfosjUYZWW0xo2n89+3ONMjNI+GwOhNJex6Z+PShFBR6QKzTzp1Vtz
         1BAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718625908; x=1719230708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a7bH4UGiW+MvGPh9wDOD3T4A2GrW+z9WGqtLSCI8xpA=;
        b=jstw/peTUYWUuzGolpz2WdW0onugScPhWpREGGNAVXOu8CdsSbJ483saevDXaqH+zf
         rguMRr6ZMQr4pwye9ap61n7wOJi+7nNcWg1Fy6po6eAuRcU2uXJox3ogjW+UvIfM+hNb
         gZpiSdkDWmWtqb1D2z34qO2eHx50u6XOadboh34PRyx39ASch8EczbKGVwJH4ws6dMV8
         lkBS9FvHd5idp697AbDnVgb+SCQcdcpCqjW0qjAhQ76FQ2z/KT9TCnoGtyrqq0zQjbbn
         u2P5/X0aRh5dhsj49Vu7xmNI9eYwBNlLrPk2SN6PCW7Jje+Oyxd0hG2xXrX8FfviiFby
         TqQg==
X-Gm-Message-State: AOJu0YzBIzwOl3I06r+aYjsfvJklcd65TkxfxD9BqbUa2v984G5GHpbn
	zvmsJYEHIFlQtb9Mp/st+HXmyO8nQZQZldRaOKzt/jA06mQdt4MrPO0uJu9yQ9ggPScqCfAvMmm
	qdYU=
X-Google-Smtp-Source: AGHT+IH0NuogaMalxqqX9CuSnAAUreJL7mASXjlKlb3B77BI7MClwIALv3uj+Dp7Qozp72OclfQBRg==
X-Received: by 2002:a05:6a20:cf8b:b0:1b5:1b:d5d9 with SMTP id adf61e73a8af0-1bae800c69bmr9139500637.44.1718625907790;
        Mon, 17 Jun 2024 05:05:07 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-705cc925fe7sm7482348b3a.19.2024.06.17.05.05.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 05:05:07 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 02/22] oeqa/sdkext/devtool: replace use of librdfa
Date: Mon, 17 Jun 2024 05:04:40 -0700
Message-Id: <311e7b5b9ee4f0d96a376a06f01c5bfd379ca244.1718625680.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1718625680.git.steve@sakoman.com>
References: <cover.1718625680.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jun 2024 12:05:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200813

From: Ross Burton <ross.burton@arm.com>

librdfa hasn't had a commit for a decade now and as such has problems
with modern compilers (specifically gcc 14.1).  Switch the recipe
creation test to something much simpler that we also control: dbus-wait.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d801de1f702d8d0def55011b5b6ad39d85f978f1)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/sdkext/cases/devtool.py | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/sdkext/cases/devtool.py b/meta/lib/oeqa/sdkext/cases/devtool.py
index 5ffb732556..d0746e68eb 100644
--- a/meta/lib/oeqa/sdkext/cases/devtool.py
+++ b/meta/lib/oeqa/sdkext/cases/devtool.py
@@ -69,10 +69,9 @@ class DevtoolTest(OESDKExtTestCase):
         self._test_devtool_build(self.myapp_cmake_dst)
 
     def test_extend_autotools_recipe_creation(self):
-        req = 'https://github.com/rdfa/librdfa'
-        recipe = "librdfa"
-        self._run('devtool sdk-install libxml2')
-        self._run('devtool add %s %s' % (recipe, req) )
+        recipe = "test-dbus-wait"
+        self._run('devtool sdk-install dbus')
+        self._run('devtool add %s https://git.yoctoproject.org/git/dbus-wait' % (recipe) )
         try:
             self._run('devtool build %s' % recipe)
         finally:
-- 
2.34.1


