Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09C6FC36008
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 05:44:00 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web10.12478.1743486231037615151
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Mar 2025 22:43:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QIMDDdH/;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ac25520a289so859814166b.3
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 22:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743486229; x=1744091029; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o8VmC1plK6m7L8Ywad/6VCQLO4TwRwIRoK+ehf1jz9U=;
        b=QIMDDdH/2vcS4Tjky9mFJvsJVF1SQ8ibmXmtiqzXwv784PdegMjzfgTecUeHO8Nk4/
         phPHWy5AIvCu3k9piFSA0XHTtgciPjBMJ67S6e89RKkXNLKdWncFq6RemYaxT6xTXLhl
         2xA46qCFSzRYvABXAUl1XVAd2w/ye9mSPSBCFVRcqhtmdLsGNJ4QEWO9gwcDWbWDh7SZ
         Fys5yODaHr5ZN9FmSjLfkN40h6ICAaCPvYHFPomNFPvqrQNR/p2phqV72pzBCe5TS0KT
         Q5huesd4MYlGPHFfj07gHt8KUUFzNby9MQqaNRjghQ7LFeurf13/bOvkG/sFg+CSW2Zt
         8POw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743486229; x=1744091029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o8VmC1plK6m7L8Ywad/6VCQLO4TwRwIRoK+ehf1jz9U=;
        b=DSKSW0H5j9SBAuOv7Y1fOVCFm4lpVLHWpSYb2LaKFU4bPvuUfDkRQwxeDBHb6Ifs7M
         XQjOo5HCtgSrEgm+EJuuCGNRJx3ONMbnNV/NViJROwH85lNk4D7qiT6AXTHVgGgAEtCk
         KNaTi32aekr7TCgmqcLrR32uP0fgp0uRNLZqlPrwMX625FvxJPzkR1iORyBLrkqExPSM
         suqjTrS3fanVjXZZxa0Pc876G5oYpl11GSboUCbnQijXYcNUTY76ComB4YhGZEC8TmB9
         Z0TEKcQA7vOOsplpNVMPzF5HjiGpuISHh6pkdFFi/Kj9tYT3qUSiNJie5/XiYPPlmuGW
         uu2Q==
X-Gm-Message-State: AOJu0Yy1STB9Ap3ujAt3XDVVMRDy72jiE3KPTqoiA9+RKujAiF3IqD+i
	Zlbr12+rOrSOATTG3GDP7bJlFUfQPtBDfJ+Qk7EKJuf+zXuuA/NkIUn5yetp
X-Gm-Gg: ASbGncs6oVSI9N/vVh2BouD/f5aaAa3oqp7aGhtWhpo+2uzRG/5+CVMX4q5K5+TB8Vo
	wgdSGnQ98WnV0nEM1+CfqZi9iek1CPVCCVdeaN3AoiEjf3GzStg+O8ZQwEjnRnA0tv+XuXcJ1Hd
	l1S5ttem5MNcrD8LsKgHNXUrUOt5SzRFlncrnPCcPQT1pOy/QjE4NB7qbg6FxCpmvGPLgU98v92
	KnwQvsLC0alWZkX2hE/2K0ZAFCBNfMYY80qaXJ/b/BjqcKUbMJhFZ4NSgl4vBml5mKDyN7sSCaM
	HxSvFTFs3NyTrLOE3BtOCysOqrLk3pJx1156UhfeuGzZnAA=
X-Google-Smtp-Source: AGHT+IGHXX7Ajp/kYrUhrjemEVEZWTh8CjqL9YlPrG3avj277hOC8932HMqm/bbR9epkHq2ZW6g8iw==
X-Received: by 2002:a17:907:a089:b0:abc:4b7:e3d3 with SMTP id a640c23a62f3a-ac738a3e93bmr1183308666b.27.1743486229184;
        Mon, 31 Mar 2025 22:43:49 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ac71961f8f0sm718984766b.95.2025.03.31.22.43.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 22:43:48 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Martin Jansa <martin.jansa@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap][PATCH 2/2] mc: set ac_cv_path_ZIP to avoid buildpaths QA issues
Date: Tue,  1 Apr 2025 07:43:34 +0200
Message-ID: <20250401054334.3043-2-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250401054334.3043-1-martin.jansa@gmail.com>
References: <20250401054334.3043-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 05:44:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214001

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

