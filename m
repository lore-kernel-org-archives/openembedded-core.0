Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37E52C48297
	for <webhook@archiver.kernel.org>; Mon, 12 Feb 2024 13:54:59 +0000 (UTC)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
 by mx.groups.io with SMTP id smtpd.web11.6811.1707746092420944654
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Feb 2024 05:54:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=z/F90A4s;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.53, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-6e2edb28554so188628a34.2
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Feb 2024 05:54:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1707746091; x=1708350891; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6FGwgp937DsuMA/7j1yLSrvc1p1ozzllVCo70P99m10=;
        b=z/F90A4sKwL7ZZt58Bs1LfdsaUkn/wDjmpKmM6l8DB4wqdM5CD1m77UEpHEa1VHB1E
         fBL3Nd5fk4ZmN/5f+i7wKjk93UWT0kCoYeapUzOO5ObzcSQeIWCpBlTdgkV+ZLhW/tLj
         BxIudZx1V4calJPDMJnBQFsQCjPpS08iB41C+j4sZyEM58T2x/B7Z3C4HOCGR7S5bxGj
         qOC47MWgTNxehGhaZx2QvnDocPAnYJQyzPM2ScUoJbNP2J5OtF6zNkdIKuT5gEYybpH4
         ibQCy8u2Tu3G7LOfpdKetSpxarXtr71m02ahgt7XiXHDuhGwATMwssvvaKXIKe1Nzg79
         bvjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707746091; x=1708350891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6FGwgp937DsuMA/7j1yLSrvc1p1ozzllVCo70P99m10=;
        b=FrjaFGkpUxyQ6H7fSd51qDw995VYXEzrL8wh8NUGFTLhIJzLMVh7IAikEgGtJVoQmH
         1dDx0tkcoQXv7vdkz+787HDNLUlg2nETSmpLcI64mcEFBc2y8fl/S6QtPgl0uLoMlILb
         TUH3S/1X1GvWLK81xk6PiHZM4SqvnG9/vWX8SknraasZDdF5PT82YHQt5BTfvNzU7zlk
         K9CUY06yfpoypBM+G8QtE9f8Ub5eBrmYxC/gk00ykkT0/3xRpB47Y6U88Qe2bFX2ISP+
         GJVnJIsOlHIeuubHg3FWHQvxs/cqDdKWiM4iS5OhcS5q9RypduaCwVEzYMbxt8jW/TZk
         wXow==
X-Gm-Message-State: AOJu0YzEi4fW2g3c4V69rpGA9eZLQNA0PZdw9in+i6LHKb8F4+/SAsk3
	F9o6ur+cfPkL8qBNtJH0MM48k+sFrhaN7pqKpwVYifpZR9Saz8Fg73T5vBudo4D1SgyMl0ETpQ/
	RCqI=
X-Google-Smtp-Source: AGHT+IHExEGJiJ70puW1390FCeN8BfOa40ue3tOrWTLFYUm+dHkdDrBUhJToQXlLvOlX39lK2RlD7g==
X-Received: by 2002:a05:6358:1202:b0:176:4f31:75de with SMTP id h2-20020a056358120200b001764f3175demr9079970rwi.6.1707746091568;
        Mon, 12 Feb 2024 05:54:51 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id k69-20020a638448000000b005dc421f8889sm439889pgd.26.2024.02.12.05.54.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 05:54:51 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 6/8] systemd: Only add myhostname to nsswitch.conf if in PACKAGECONFIG
Date: Mon, 12 Feb 2024 03:54:17 -1000
Message-Id: <17e20ce90b5b3abb5a597d4a5b470c8eaa3fd296.1707745886.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1707745886.git.steve@sakoman.com>
References: <cover.1707745886.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Feb 2024 13:54:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195327

From: Jermain Horsman <jermain.horsman@nedap.com>

Currently myhostname is always added to nsswitch.conf even if it is
not included in PACKAGECONFIG.

This is based on changes made in OE-core rev:
ba3a78c08cb0ce08afde049610d3172b9e3b0695

Cc: Chen Qi <Qi.Chen@windriver.com>

Signed-off-by: Jermain Horsman <jermain.horsman@nedap.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/systemd/systemd_250.5.bb | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_250.5.bb b/meta/recipes-core/systemd/systemd_250.5.bb
index 889473ee1f..80a797cf2c 100644
--- a/meta/recipes-core/systemd/systemd_250.5.bb
+++ b/meta/recipes-core/systemd/systemd_250.5.bb
@@ -776,15 +776,19 @@ ALTERNATIVE_LINK_NAME[runlevel] = "${base_sbindir}/runlevel"
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
 }
 
 PACKAGE_WRITE_DEPS += "qemu-native"
-- 
2.34.1


