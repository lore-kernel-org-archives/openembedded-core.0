Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8BAEC10DC1
	for <webhook@archiver.kernel.org>; Thu, 30 Nov 2023 20:58:20 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web10.5286.1701377897989523503
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Nov 2023 12:58:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=JBYjtGcC;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.182, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-5bdf5a025c1so1190305a12.0
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 12:58:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1701377897; x=1701982697; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cbd+Cl+Qj7bYuZe7b2CXOk3eawraFJqgmZymdAdB/ns=;
        b=JBYjtGcChEjzAIi2QoQU45y6rVzT6FKo+Wll7R5ZvLGTNUw6ANOU/8/MsRE6Urisvc
         TuT/bES6KEldkvrO2E0/vtTbJi1NO1qMFQAl6o8Xu/xpq8TnPp6jbxkGe16H9nmANZII
         L5F6gTpoNew2fQ3qmvsG7mMguE3sRjUdWrvWOhU7c2GWyWclM9B2+JyTpILG2B+oyFaW
         anpLZzB0EnA61UAjYOaIHuR2qG31SVmAU7vRfnTI0tAj4ZmtJ3EK+43Ss8SP86tumIN0
         Yais2fhkq9tfUoNxFfx06PPbfrZ/uzXVDE19t2jg9X0ycAEj0i5OHkkkP5qAk512qmuY
         SnaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701377897; x=1701982697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cbd+Cl+Qj7bYuZe7b2CXOk3eawraFJqgmZymdAdB/ns=;
        b=UKdrIrNHThwKwhi4btoxb2Xe8zHu6Ib051rPKRHU7HYMKXHOPAu4KBW8yCjm8QWzJC
         8kuUSh4ABo6onEJ2qpz3av278ZCKjh7xNJSyyK3XvuFvAH5uh7tVX0DEI/BO2UAsiMVK
         SuD1L9ymR5dbYOIXGjGGmYk3vtdI7ZskhnnSZjr7aLFeiDlsnW5aV006BL0fyJBFM2g6
         XDrAwBmh+H3zalPA/fELGmuHnZp6K7HjUFQ2b71tuNBi0vuRl14D25n5QPAZMc8nXBqs
         OULtDqVJI/rk7Li1xpGVAFs1R9J79MDHdhQbXrUbooNJOdgP2LPQTlOHbgfizJVObF7T
         9kNw==
X-Gm-Message-State: AOJu0YxeQOM+xr/H0JwhPC/oSREjqiLlFbIpIzeTg1ex7sjeTSLJNMr6
	8KiEHi2BQHpDwND4yHnHCixuw/0D4EAwBxrsjTO7tA==
X-Google-Smtp-Source: AGHT+IFK7S1XTUois8CtD/WDl3qliAv9jpQIR3tqpP8cdUcGSg14P7sYSxNaKBb6g4DfLnX7dl8fSQ==
X-Received: by 2002:a05:6a20:6a22:b0:18c:346c:d59f with SMTP id p34-20020a056a206a2200b0018c346cd59fmr21732220pzk.62.1701377897124;
        Thu, 30 Nov 2023 12:58:17 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id f18-20020aa79d92000000b006cbbc07a1c0sm1635418pfq.156.2023.11.30.12.58.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 12:58:16 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 22/25] systemd: fix DynamicUser issue
Date: Thu, 30 Nov 2023 10:57:30 -1000
Message-Id: <5420215a3415f08c1d961fca2e3d8258f82fb7f1.1701377676.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1701377676.git.steve@sakoman.com>
References: <cover.1701377676.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 20:58:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191540

From: Chen Qi <Qi.Chen@windriver.com>

The DynamicUser needs libnss-systemd to be installed to function
well. The tweaks to nsswitch.conf should be conditional on PACKAGECONFIG
values.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit ba3a78c08cb0ce08afde049610d3172b9e3b0695)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/systemd/systemd_254.4.bb | 30 +++++++++++++++++-----
 1 file changed, 23 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_254.4.bb b/meta/recipes-core/systemd/systemd_254.4.bb
index 77724eb822..285ca92e68 100644
--- a/meta/recipes-core/systemd/systemd_254.4.bb
+++ b/meta/recipes-core/systemd/systemd_254.4.bb
@@ -178,7 +178,7 @@ PACKAGECONFIG[microhttpd] = "-Dmicrohttpd=true,-Dmicrohttpd=false,libmicrohttpd"
 PACKAGECONFIG[myhostname] = "-Dnss-myhostname=true,-Dnss-myhostname=false,,libnss-myhostname"
 PACKAGECONFIG[networkd] = "-Dnetworkd=true,-Dnetworkd=false"
 PACKAGECONFIG[no-dns-fallback] = "-Ddns-servers="
-PACKAGECONFIG[nss] = "-Dnss-systemd=true,-Dnss-systemd=false"
+PACKAGECONFIG[nss] = "-Dnss-systemd=true,-Dnss-systemd=false,,libnss-systemd"
 PACKAGECONFIG[nss-mymachines] = "-Dnss-mymachines=true,-Dnss-mymachines=false"
 PACKAGECONFIG[nss-resolve] = "-Dnss-resolve=true,-Dnss-resolve=false"
 PACKAGECONFIG[oomd] = "-Doomd=true,-Doomd=false"
@@ -826,15 +826,31 @@ ALTERNATIVE_LINK_NAME[runlevel] = "${base_sbindir}/runlevel"
 ALTERNATIVE_PRIORITY[runlevel] ?= "300"
 
 pkg_postinst:${PN}:libc-glibc () {
-	sed -e '/^hosts:/s/\s*\<myhostname\>//' \
-		-e 's/\(^hosts:.*\)\(\<files\>\)\(.*\)\(\<dns\>\)\(.*\)/\1\2 myhostname \3\4\5/' \
-		-i $D${sysconfdir}/nsswitch.conf
+	if ${@bb.utils.contains('PACKAGECONFIG', 'myhostname', 'true', 'false', d)}; then
+		sed -e '/^hosts:/s/\s*\<myhostname\>//' \
+			-e 's/\(^hosts:.*\)\(\<files\>\)\(.*\)\(\<dns\>\)\(.*\)/\1\2 myhostname \3\4\5/' \
+			-i $D${sysconfdir}/nsswitch.conf
+	fi
+	if ${@bb.utils.contains('PACKAGECONFIG', 'nss', 'true', 'false', d)}; then
+		sed -e 's#\(^passwd:.*\)#\1 systemd#' \
+			-e 's#\(^group:.*\)#\1 systemd#' \
+			-e 's#\(^shadow:.*\)#\1 systemd#' \
+			-i $D${sysconfdir}/nsswitch.conf
+	fi
 }
 
 pkg_prerm:${PN}:libc-glibc () {
-	sed -e '/^hosts:/s/\s*\<myhostname\>//' \
-		-e '/^hosts:/s/\s*myhostname//' \
-		-i $D${sysconfdir}/nsswitch.conf
+	if ${@bb.utils.contains('PACKAGECONFIG', 'myhostname', 'true', 'false', d)}; then
+		sed -e '/^hosts:/s/\s*\<myhostname\>//' \
+			-e '/^hosts:/s/\s*myhostname//' \
+			-i $D${sysconfdir}/nsswitch.conf
+	fi
+	if ${@bb.utils.contains('PACKAGECONFIG', 'nss', 'true', 'false', d)}; then
+		sed -e '/^passwd:/s#\s*systemd##' \
+			-e '/^group:/s#\s*systemd##' \
+			-e '/^shadow:/s#\s*systemd##' \
+			-i $D${sysconfdir}/nsswitch.conf
+	fi
 }
 
 PACKAGE_WRITE_DEPS += "qemu-native"
-- 
2.34.1


