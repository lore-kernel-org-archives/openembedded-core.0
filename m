Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15AECC54E41
	for <webhook@archiver.kernel.org>; Wed, 21 Feb 2024 19:40:53 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.462.1708544448815909680
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Feb 2024 11:40:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SC0cS5qk;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-33d7b8f563eso902497f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Feb 2024 11:40:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708544447; x=1709149247; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/9MRkgaFGReQNmekQ4NkMssEF9zxWvW4uBB6H4vnlyE=;
        b=SC0cS5qk7Jozjp4yiwocfel5goP/k0Gn2HmWWa2Fsbv02kXq4xS4sUpr51Ucp6uotR
         YROSvbyjp2hYizp37vGDJBQvARa2Dv6FgzKO/bnOSStg1EZekYpAXS3geOppj8vkVRZr
         JvoaJKMmGy9obw/kamc9NKcVzCuKKaindRzQjcJZwnyvVJ9X3NtKbVhbQnLjUR6xibUO
         olqXNEUlHQyVBQkP9nlE+NQt6g703QNeefUF4dLKOLbYa11VipU0yFDS9LUFtv4nMw8g
         MHLaQHoP1xdBAceYJFa+5fT6cniWf9qtO3itcr4ePRhEILBhfhuwzbkFmYFHwk8QnRfs
         cMOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708544447; x=1709149247;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/9MRkgaFGReQNmekQ4NkMssEF9zxWvW4uBB6H4vnlyE=;
        b=tTyK4bcj/QGahV0nPEQNkWaA0YgS/EktSOcfli3EEqaEnx8g2KAlaGlZcvu4mBqfBH
         pP8Fb1neacUdjKyQsNVv2QNScfto+/W79Bms2STlX3Kg5JfEusLUdBN7rkJjE4lTZvj7
         uxGyzVpocyOleTLgYI6I2ZsUYMylRacKGhlRZ0P13caYpW1Zj4TW3STQ7cbpTKZ0L/xm
         flr+fR2sRnFySvaoUjKL0knRxNkvZX6C8nlanDXfwVDPM6wh7lZteOgAZ/UUl9/aD7UY
         sVGfMPrAQITz4/ZnGfli0rVC17XA8HHzR5f7g9rGROwQcffhMpSn0cfiB43nHWSmmBmv
         vO9g==
X-Gm-Message-State: AOJu0YwR+EWjYyWfvAOPa/y5dh6QCXk3wu5PFzzJ1cx8qztLv9Gy8Hsd
	yWil7k+4Om5mBc+yDh9NkkBz/fhYiTymNEwmnGlZFUrE8OMvGNw6zEYjKNzj
X-Google-Smtp-Source: AGHT+IFl/22r8SopWu+3H/I9xp9x4jwL1HSDcE6gWs5br9KRhvSs/WH+NUMS7nuwBdH59qlNn2sVPg==
X-Received: by 2002:a5d:6ac9:0:b0:33d:1993:21cd with SMTP id u9-20020a5d6ac9000000b0033d199321cdmr12367764wrw.9.1708544446953;
        Wed, 21 Feb 2024 11:40:46 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id h5-20020a05600016c500b0033d60cba289sm8764686wrf.68.2024.02.21.11.40.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 11:40:46 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Subject: [kirkstone][PATCH v2 08/13] oeqa/selftest/recipetool: expect meson.bb
Date: Wed, 21 Feb 2024 20:37:00 +0100
Message-ID: <20240221194036.1804463-9-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240221194036.1804463-1-adrian.freihofer@siemens.com>
References: <20240221194036.1804463-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Feb 2024 19:40:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195992

Latest recipetool from master branch generates a pyhton3-meson.bb recipe
while the older version from kirkstone generates a meson.bb. Change the
test to pass with meson.bb.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/recipetool.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/selftest/cases/recipetool.py
index c888770533..a2d8d292ad 100644
--- a/meta/lib/oeqa/selftest/cases/recipetool.py
+++ b/meta/lib/oeqa/selftest/cases/recipetool.py
@@ -444,7 +444,7 @@ class RecipetoolCreateTests(RecipetoolBase):
         # older release of Meson at present so we don't need a toml parser.
         temprecipe = os.path.join(self.tempdir, 'recipe')
         os.makedirs(temprecipe)
-        recipefile = os.path.join(temprecipe, 'python3-meson_git.bb')
+        recipefile = os.path.join(temprecipe, 'meson_git.bb')
         srcuri = 'https://github.com/mesonbuild/meson;rev=0.52.1'
         cmd = ['recipetool', 'create', '-o', temprecipe, srcuri]
         result = runCmd(cmd)
@@ -480,7 +480,7 @@ class RecipetoolCreateTests(RecipetoolBase):
         temprecipe = os.path.join(self.tempdir, 'recipe')
         os.makedirs(temprecipe)
         pv = '0.52.1'
-        recipefile = os.path.join(temprecipe, 'python3-meson_%s.bb' % pv)
+        recipefile = os.path.join(temprecipe, 'meson_%s.bb' % pv)
         srcuri = 'https://github.com/mesonbuild/meson/releases/download/%s/meson-%s.tar.gz' % (pv, pv)
         result = runCmd('recipetool create -o %s %s' % (temprecipe, srcuri))
         self.assertTrue(os.path.isfile(recipefile))
-- 
2.43.1


