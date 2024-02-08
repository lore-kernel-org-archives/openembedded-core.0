Return-Path: <jermain.horsman@nedap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C322C48260
	for <webhook@archiver.kernel.org>; Thu,  8 Feb 2024 09:12:16 +0000 (UTC)
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
 by mx.groups.io with SMTP id smtpd.web10.14053.1707383531077110234
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Feb 2024 01:12:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Xs2fN4th;
 spf=pass (domain: gmail.com, ip: 209.85.166.42, mailfrom: jhatnedap@gmail.com)
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-7bc332d49f6so72648639f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Feb 2024 01:12:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707383530; x=1707988330; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HvmxRgQSv2hvHqBdiebqU3ylt7/ylIvBzHRBXGsllRk=;
        b=Xs2fN4thmGETSr0blW33UuVAXsSWupZ+UAlzfO6gJdjPALvBA/RodZ5Wr+lFf1Sv78
         xGw9bZgM8+Mwlp4A4sR1O5aefWLB2G8UYThLU3Zx785uSpkK3Tr4HG5y5qM7XpjHhnd+
         OdeaRdfvu9ki75aLxM6vjJVRDP046ZbocLATpg0KgRFrp+SFVzJy21DLZL/ZW+X7/KEz
         Sc9KGZrzmuI28lXNvvw+Ke/K29j+KH5xT30rqAzlKymrxV6G+owlcDwY7Gxnv9OcJaC/
         FrywQvGvoYQx+C3lF8oHljBbBURxXz+PwsfnwzKLA7AvbQFFDCkVujLCiT73NN2UC0Oq
         aPXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707383530; x=1707988330;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HvmxRgQSv2hvHqBdiebqU3ylt7/ylIvBzHRBXGsllRk=;
        b=vpiWMsvS/9JPVNCoj7bQ4RGNlHeEqpJig29k0YNbSVm5d+F42VIoarFIqhN8DjNr1O
         Q6Gy2v+Dkr0SI0PdtLQe8WBqurlWKe/AQ/8E86ILx7wsZ1fDgmYvN7G3QRiYj8w2HVnZ
         6RfSxQ8qqLQYPdFvrn7+PjzPuAs1xNpQOPD9OL+KC75EtngvxIgwyb3uUS+JjegVG76q
         zn57VhreIvokufAMOFdMySaSMraXsORh1waccpQPz2p1swnC9SqvJFZbRvb/jhr5MBQM
         IriVupkGsgqQTflJOC4xCkIeWOf3S6oaNyWuZkna6YuV3tnAzt7OQi5u1XT3kQw3Sm80
         L8Vg==
X-Gm-Message-State: AOJu0YyrMI7VXxQgxYRcCWGMxdppDjGxa/Ludn1PL2JhOE+6ii8+5Z6T
	5T0sPbfi2QowEwlyTVqNg4ZoFyyoEf90GKrQm8v9qegOBjfx5gIUD8Ku+dH1
X-Google-Smtp-Source: AGHT+IEZvU2Rnm1Q6ltZ3h8G0AquvJggHQYWIsLYKk29448YC+GQmlAk7tDa3qWePJSfWx70knxMAg==
X-Received: by 2002:a92:c008:0:b0:363:81b8:bb1a with SMTP id q8-20020a92c008000000b0036381b8bb1amr8039121ild.22.1707383530214;
        Thu, 08 Feb 2024 01:12:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWS4Nahmam4gYLZHuZ5TcoX4d6M9Ak6kxVlxeN9C+HbHqU0kHSc9SUfs6sn60B0kVkYzIXx1eUt9er+0YnUj9ZUZFG48jM=
Received: from NVC4181.nedap.local ([149.3.168.10])
        by smtp.gmail.com with ESMTPSA id cw20-20020a05663849d400b0047110577c08sm795844jab.87.2024.02.08.01.12.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 01:12:09 -0800 (PST)
From: jhatnedap@gmail.com
X-Google-Original-From: jermain.horsman@nedap.com
To: openembedded-core@lists.openembedded.org
Cc: Jermain Horsman <jermain.horsman@nedap.com>,
	Chen Qi <Qi.Chen@windriver.com>
Subject: [kirkstone][PATCH] systemd: Only add myhostname to nsswitch.conf if in PACKAGECONFIG
Date: Thu,  8 Feb 2024 10:11:28 +0100
Message-ID: <20240208091128.592-2-jermain.horsman@nedap.com>
X-Mailer: git-send-email 2.43.0.windows.1
Reply-To: jermain.horsman@nedap.com
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Feb 2024 09:12:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195122

From: Jermain Horsman <jermain.horsman@nedap.com>

Currently myhostname is always added to nsswitch.conf even if it is
not included in PACKAGECONFIG.

This is based on changes made in OE-core rev:
ba3a78c08cb0ce08afde049610d3172b9e3b0695

Cc: Chen Qi <Qi.Chen@windriver.com>

Signed-off-by: Jermain Horsman <jermain.horsman@nedap.com>
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
2.43.0.windows.1


