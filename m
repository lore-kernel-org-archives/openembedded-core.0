Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40C55E8FDB2
	for <webhook@archiver.kernel.org>; Tue,  3 Oct 2023 19:37:21 +0000 (UTC)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
 by mx.groups.io with SMTP id smtpd.web11.146.1696361836274712511
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Oct 2023 12:37:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=bdtgAAI3;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.43, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-6c6504c9ac5so930064a34.0
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Oct 2023 12:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1696361835; x=1696966635; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DVxFCb7HQpn/jVK0G2RQDk3nIs0HM6vl9/iLSWub19I=;
        b=bdtgAAI3OsQtJrNLIWkhBI52HKB0t5nw0BVSiMGB6GU3a+R1HvLL5jhHffhNfs9BGH
         q5gjEjIw7CU1BzS2lym+l02rOQ+60+kvjCVpIG4KIyiD/UvNxhD3SHxhzkNxfPr1rhOm
         XxTuwdUcp6PbiZNE5nvE+zayB02dnnPnAV8zV7xJBOdqoHtCLi8x+grBc87MG/hZsPaa
         7EoHQ2smuuAbSGKRRBU7GdPaV2HtWyFx4xCzrM8WoCGeLDs+8oQHpbL3uWQ4AGSECWsu
         1IOzAv4VBv9hZ+i3gzmenqFuRL61PzcqaLY+L2FFzYSaNJhQqwPyQmdCluxDMIsLhwYZ
         IIew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696361835; x=1696966635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DVxFCb7HQpn/jVK0G2RQDk3nIs0HM6vl9/iLSWub19I=;
        b=Mg8J8rn0J/+t3ODX7mvmUf4lTYFN0DhKylTL0k9P5C41+Z0OY4DCd3MUZB49K+lJYZ
         5dy2pOyQgyGAEZn7SDrorOMgv+gGvUYUwxWmIIHhgj7QYxC/VOapTfegWZnJDw69GViy
         0qyx1WOxv3nYAjh8hOsDsaQ5J/HaPixnHxC0PnNQEz5McoQ57aGmZetbC3OmjgWfAmkd
         D4B7/w+MjRc2JeegFTwMcnR0GEJZ/eagqJRH23Kih1/aWsWzBPN2/OoBWLSJW0SlMnty
         c6mzYWnEaW6U6tlVsWFS7ag1F0cmCZFDsadzOKYQ/8KLye/SaA0wXSByu7cum8eCG2Cr
         LCpw==
X-Gm-Message-State: AOJu0YzlRXm4mm1XV6/QmPnMGmM8BR70jhp4rD0BvMRy2m9KX41aDZPz
	MLY5TGmzj3d0LNCQZOTrCU1H4cHs3LqOY1syVSQ=
X-Google-Smtp-Source: AGHT+IH4v6YaOBykOPamAjYW6pqv12lWLQu9MSUOObMiZbPhm3e4ytlNY93B9nqqGiwCmOr4RW249Q==
X-Received: by 2002:aca:1014:0:b0:3a3:95f9:c99b with SMTP id 20-20020aca1014000000b003a395f9c99bmr433133oiq.35.1696361835303;
        Tue, 03 Oct 2023 12:37:15 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id 23-20020a17090a031700b0025dc5749b4csm9333642pje.21.2023.10.03.12.37.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 12:37:14 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 10/10] fontcache.bbclass: avoid native recipes depending on target fontconfig
Date: Tue,  3 Oct 2023 09:36:50 -1000
Message-Id: <098d4ca85c2bc77949843f117c6e336d5b77271d.1696361593.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696361593.git.steve@sakoman.com>
References: <cover.1696361593.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Oct 2023 19:37:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188660

From: Martin Jansa <martin.jansa@gmail.com>

* this caused liberation-font-native to depend on TUNE_PKGARCH target fontconfig
  because ${MLPREFIX}fontconfig-utils is added to RDEPENDS in anonymous python

* the dependency tree for liberation-font-native got much shorter
  (just quilt-native and liberation-font-native itself):
   2 after/pn-buildlist
  78 before/pn-buildlist

* fixes graphviz-native signature issue as well as detected with sstate-diff-machines.sh

  $ bitbake-diffsigs \
    sstate-after/mako/x86_64-linux/graphviz-native/8.1.0.do_populate_sysroot.sigdata.184d4fd355f1e7a2d7d929ef4b5f62b94e2071df9dd674b2067ec21bfc7bcc1b \
    sstate-after/qemux86-64/x86_64-linux/graphviz-native/8.1.0.do_populate_sysroot.sigdata.35da674d2dbc275bac02869dfce4165466315023910bdef65a6026e2cb942a46
  Hash for task dependency liberation-fonts-native:do_populate_sysroot changed from 310d3da04ad9abf8ee99997e53d1ffa71c2b7d9d60fb0e8de85171a9ab6a77d3 to 048420ad1410c2b8d95498fc3c11681207335a2c722836f1f3e683cc449814da

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/fontcache.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/fontcache.bbclass b/meta/classes/fontcache.bbclass
index 442bfc7392..34688591f4 100644
--- a/meta/classes/fontcache.bbclass
+++ b/meta/classes/fontcache.bbclass
@@ -7,6 +7,7 @@ PACKAGE_WRITE_DEPS += "qemu-native"
 inherit qemu
 
 FONT_PACKAGES ??= "${PN}"
+FONT_PACKAGES:class-native = ""
 FONT_EXTRA_RDEPENDS ?= "${MLPREFIX}fontconfig-utils"
 FONTCONFIG_CACHE_DIR ?= "${localstatedir}/cache/fontconfig"
 FONTCONFIG_CACHE_PARAMS ?= "-v"
-- 
2.34.1


