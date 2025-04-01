Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75AF2C36010
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 19:59:45 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.3281.1743537576105406015
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Apr 2025 12:59:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ndbCqoBN;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2254e0b4b79so153534645ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 12:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1743537575; x=1744142375; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z5qxrrutOVIJyfIh38RK7hHD8iIrmGWzisulXdJewVc=;
        b=ndbCqoBNdMKxna54XC/9m9rWnC9+bnFw1TX0TX1WhjpJIvfXng3bieZ46rzpomFhm/
         o5d+LS+h+en9Qngan+aR7mAVKvFh/mGmvcSHjv3VMq+0QpB7qwIMSskRYGx9fNBTZpBd
         wInIJjWDsIOJKMjINd326VGd2U+tSJrxlmAQIrHEIZJ1932Ue8JzwbuslrHDUdm/+rRi
         U+yRPLB6/ivj+Q0RK9EW9I6qVM1bvqiwTaHl8c3WjBoobB1C0U9Qb4z1kVS9sIrsXQNL
         VW7x+j5iJtCvfqA4aMUYN8wUJUQe9jpXBn5hl/gCWZbaFqMBrKDpvGeWgU1yK2uJ5bEg
         6LHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743537575; x=1744142375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z5qxrrutOVIJyfIh38RK7hHD8iIrmGWzisulXdJewVc=;
        b=o0J7U8MhJCyd0e6yn9Nm9LGMNxaIViICW0Ooy+F4iQqnFOchqw/B6RZBrwYOgTjVEh
         tqfFuS3MufPtE1Jg+2iYmaYaKNg5ekYLkDctJabVXVJ6C6ixDDDr7d8PVY4ZPc6CzYde
         axYajNYdGyPcVzEDWLUL58JOJ2eEkkqB8TfJruk/M5oHFx52tgzXQg70jrM8joiSA9Tu
         pNqiHqN16dwrM3WFgRXEDa9qAGpJFoU6QK8LGaO5ujZgwU8P95wjIYY0J0LZaHmznbOU
         pam8e1+BL/I8oYa8HJGMj2J04OmmDEOKnW7O9Y8pUWXh3tehhWQb7SyEZF0MUl/jyK5P
         UojQ==
X-Gm-Message-State: AOJu0YxtTPexCR9C0XROtqjhgiSatDZBDi1m0cWDlW33yLX8kShjOcXu
	YwSRmac6yQ9tyN1DOAzgKrSOvOItbP7w8b7cPfz8ZPgrF/uhYXIQpbv6ubKkElwmKaYgywQPvL4
	d
X-Gm-Gg: ASbGnct+EVQez95zUB0DUXOJBpkQ/JMetNNLcl6Vn8TJoCOzGACCK9miEIxXlwO4O0e
	Rk06ucASV1yKjXd8USikC1AgTFFxN+H83ONvFyQ/Ii5mdPFrArje99BibPhQ9wo9xpBLMWoPhdi
	b0zCyH18Z1ms6bPBjgmaqeWVew9wp2/SW9FmsNY52R3bkub5aH5QHZXDWL2G63L541UOZxgVkg9
	uFsdmqRVJet4qvcVmh7mSmBTRXEPW7MekLsIil3doZVmVJ8J9IOXwt/+zSiKmF3LfOS3NOlun2Y
	Px8NVO8z9KAD34D0yTbjgn8v9Yf0O7n2/XuplGoo7uWAl4s=
X-Google-Smtp-Source: AGHT+IEJwyzCh4kfdfQqdIImOAHKC5kPcwOrBM1xbqEJHhWd85sQeOIGRhobs3oB2Vi5uxwlyiuvMA==
X-Received: by 2002:a05:6a21:1512:b0:1fd:e9c8:b8c3 with SMTP id adf61e73a8af0-2009f778131mr21985213637.26.1743537575430;
        Tue, 01 Apr 2025 12:59:35 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:6021:5333:bc00:e45b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af93b52ea6bsm7234369a12.0.2025.04.01.12.59.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 12:59:35 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 5/5] mc: set ac_cv_path_ZIP to avoid buildpaths QA issues
Date: Tue,  1 Apr 2025 12:59:22 -0700
Message-ID: <4003b5faa1e5acfa025e1d0df4e021e06cf8724c.1743537463.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1743537463.git.steve@sakoman.com>
References: <cover.1743537463.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 19:59:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214150

From: Martin Jansa <martin.jansa@gmail.com>

* in builds with zip in HOSTTOOLS mc fails with:
  ERROR: mc-4.8.31-r0 do_package_qa: QA Issue: File /usr/libexec/mc/extfs.d/uzip in package mc-helpers-perl contains reference to TMPDIR [buildpaths]
  and it's because of the path to zip:
  mc/4.8.31/package $ grep -R styhead .
  ./usr/libexec/mc/extfs.d/uzip:my $app_zip = "TMPDIR/hosttools/zip";

* don't use /usr/bin/env as in other cases, because app_zip is then used e.g. with:
  my $cmd_addlink = "$app_zip -g -y";

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/mc/mc_4.8.31.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/mc/mc_4.8.31.bb b/meta/recipes-extended/mc/mc_4.8.31.bb
index 5f8257f71f..69d089d267 100644
--- a/meta/recipes-extended/mc/mc_4.8.31.bb
+++ b/meta/recipes-extended/mc/mc_4.8.31.bb
@@ -31,6 +31,7 @@ CACHED_CONFIGUREVARS += "ac_cv_path_PERL='/usr/bin/env perl'"
 CACHED_CONFIGUREVARS += "ac_cv_path_PERL_FOR_BUILD='/usr/bin/env perl'"
 CACHED_CONFIGUREVARS += "ac_cv_path_PYTHON='/usr/bin/env python'"
 CACHED_CONFIGUREVARS += "ac_cv_path_GREP='/usr/bin/env grep'"
+CACHED_CONFIGUREVARS += "ac_cv_path_ZIP='/usr/bin/zip'"
 CACHED_CONFIGUREVARS += "mc_cv_have_zipinfo=yes"
 
 do_install:append () {
-- 
2.43.0


