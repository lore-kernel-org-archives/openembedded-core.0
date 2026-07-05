Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 821DFC44502
	for <webhook@archiver.kernel.org>; Sun,  5 Jul 2026 22:43:19 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.140043.1783291396190398725
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Jul 2026 15:43:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ue6VVmY7;
 spf=pass (domain: smile.fr, ip: 209.85.221.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-474303f3c72so1336081f8f.0
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 15:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783291394; x=1783896194; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SXbZkXVXp/pqTD2BKd9FnJwjXFOhhzV0TOXTo8Pud3g=;
        b=ue6VVmY79EZwEsQr2bJeLUX5KkGCuM7UYfHRf/LMGB58E/dpO37s6Eo5vpr6Fo57zH
         8u6eBiKcB1dUMm4eZWwtkpjVKRXZ8cqqReuLRNCkBjMt1pGAOAlVkfqxAOE6FcjKV23I
         MCVsEHc3q/tE5vDLhtqoSPFwM62AOlAKqRCMA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783291394; x=1783896194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=SXbZkXVXp/pqTD2BKd9FnJwjXFOhhzV0TOXTo8Pud3g=;
        b=aYO8vmSYItZMBa6zB+Ppk2xdAFOQGHujpPA9ETc/rAabEG+79fyUNLz9+Z+q6HEBci
         geYjSMFBqHocg806AVEOZbF4+RMTevilFJDV9aedm60YDTKAJ5Nq4uMnsIW+U7a1l/+z
         p9cXzpHzHCLpxMiQ0mCXbBoLHEaxIgrjzbjWerZyte0auu8gtI9i73vz5J782I4dTBBu
         EwEg7AJq8xS5h5E+0T9KC25k8FJfu0Febs4Xdn/eXJx/7C9tUwsqo5MvkvwgZE5AHuX4
         7PYwqIFg2z4AdcwHT6HnU4Qtq26vtjxZHm/6GP5bXlsxa7+pPk+azTP/XOI62QjZ0vOV
         MqbQ==
X-Gm-Message-State: AOJu0YyqEi+d/9XZqpT1x8al2thiYWzHD/YVAdO/y6vjC0MOUeAAGmsh
	ABY8+licjKdwtd2u54Y1FPaJcwwpsgJ4ys7ln8DpQA+fTGsTO+48cCCpy2ZJbm+j66aDXhM7Mk/
	qoRvlmng=
X-Gm-Gg: AfdE7cmwYXtq+n4SiaccsCDro4xxg7nUeTdGFzdQVzawoN3VdPxump8qUFFuhLPQqS4
	vVgClgNAUDvVhzXAABue+gdZDrXCZPPqF5MVv7xJ08AihDKJgGHlDI3x4rsm/QGQBMGJ9HSFa8N
	+ECn4aPyHvioWX+JnUxuuw+8K035SDAZHMMMYYGb+UNeu2/fSH1vVEuvgiCKodklL0pspJar8QZ
	rUdRCoajwOd0aJj5QkQ91JXyijTUa+9v9LzuinAkpomgrbvT+EwlwXgWfRrYX5y3/QBoTT66Lkv
	MVYflJBKKLrvEW1vkzHx1abb3+6hJ1i2/uA+aKhOVlX/Zai4tizxDMr0SHxSR5TcTm9e7hr5ze2
	9CvIimPK8f54sG8W39afiJJ7j+ubUSm84avhvYox2kwDZgO1fdWNiR+a2Kql6B5tWmbktVnpvz8
	HNM/GTaUHQ7OFClKNom62CAmTW9g==
X-Received: by 2002:a05:6000:41ee:b0:441:1e1e:a050 with SMTP id ffacd0b85a97d-47aa9791009mr9716526f8f.16.1783291394473;
        Sun, 05 Jul 2026 15:43:14 -0700 (PDT)
Received: from FRSMI25-LASER.lan ([2001:861:8010:5750:6d3a:72ff:5857:d2a8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960af0sm17943606f8f.30.2026.07.05.15.43.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 15:43:14 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 52/55] bc: set CVE_PRODUCT
Date: Mon,  6 Jul 2026 00:41:42 +0200
Message-ID: <7411ce4204507e59b8cac23e509b20c08219b1ce.1783289522.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783289522.git.yoann.congal@smile.fr>
References: <cover.1783289522.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 22:43:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240206

From: Daniel Turull <daniel.turull@ericsson.com>

Set vendor to gnu similar as other tools from gnu
to have clear naming for registering into vulnerability management tools

Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ecf869558f7bd22a12281157bda432892e4362d0)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-extended/bc/bc_1.08.2.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-extended/bc/bc_1.08.2.bb b/meta/recipes-extended/bc/bc_1.08.2.bb
index cebfed9642b..933329caa64 100644
--- a/meta/recipes-extended/bc/bc_1.08.2.bb
+++ b/meta/recipes-extended/bc/bc_1.08.2.bb
@@ -10,6 +10,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
                     file://lib/number.c;endline=20;md5=cf43068cc88f837731dc53240456cfaf"
 
 SECTION = "base"
+
+CVE_PRODUCT = "gnu:bc"
+
 DEPENDS = "flex-native"
 
 SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.gz \

