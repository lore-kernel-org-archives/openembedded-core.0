Return-Path: <luca.boccassi@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BA89C433F5
	for <webhook@archiver.kernel.org>; Wed, 17 Nov 2021 12:32:37 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web11.6379.1637152348241043353
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 04:32:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ap6n+K9Q;
 spf=pass (domain: gmail.com, ip: 209.85.208.49,
 mailfrom: luca.boccassi@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id e3so10437309edu.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 04:32:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FO/Qmb9jG2SEGcqS4LJ9y7R3DMJPZnFplJrAK7452Uc=;
        b=Ap6n+K9QuxwwMeZStbXpq5OK4rszZw2ExZH7ieG/veHL4gNX3TiqNHlAIrOW/sHSgf
         H/Uju9DYJjVTA3PzcyxwE7Q/FAc4dCE7O+z+LNUwGG4pf7mEbLf9HCn2xlM9iOEv1JRO
         d53g/shv+ejJVKxyKLGh1u1GAdo8oy8ZiuscouNTS11eisSm2EbNO7KyGB7wXCBIfohw
         Qea2bHBK+Lup4nS4a+wP28uTvQffhPz4m4c2ZMGJOCJZzEVxU501bB4JXvixkpwciZ6s
         N37vjAObVnBsSUY3gzZVGeIntXVMt6/DZ1oY9uD/vYmA4Tfzi5BWpkW8XdXCQ0So+pEa
         WeOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FO/Qmb9jG2SEGcqS4LJ9y7R3DMJPZnFplJrAK7452Uc=;
        b=nIG837I3BXMDPoyI9iRSUv/rQLUMZ4sODoyrm82KfSmRB/bYNje/NAeIl+jAsfBxSq
         XqpNZHOZYWa0RT7rewmINBm7FJDeupSwfVk2RbC9VGIxYdM+z/clSkdNsJPI36WYZSpy
         ZC+wq5VW9GfPL+l5+tWhM9ktcjm5NLM7Ifw90TQsvhuohFmYl1p8AfPgR3iBSYF5p+/J
         AkCeB0QgUVkEirzh09SlZMLqEF22qNFpvAf/K1VLNXxeDjqbehZRVu/OipQjKflczVZd
         MDNnivHuBlKHgbm/k95eUfb1ebydTvbCbv/mZEAQL2joAg/6DyCsvKfavMiIfBZ1BXsp
         Mebw==
X-Gm-Message-State: AOAM531bbTvz4DNlL38egzLQ+zjua3imL3afUAer/PQfyKvkmU2rs6ZB
	LdOsBeP1WBmg5v/XdLDsQypOMJPBMAvmTw==
X-Google-Smtp-Source: 
 ABdhPJyuSHAb7/e+Z2OSsjcf7eQC7Bwf7JDZUt0yfTqQCOZQK74JLA/9R51oxjL/J2WbMbmXpeLNug==
X-Received: by 2002:a05:6402:2930:: with SMTP id
 ee48mr22308267edb.295.1637152346355;
        Wed, 17 Nov 2021 04:32:26 -0800 (PST)
Received: from localhost ([137.220.125.106])
        by smtp.gmail.com with ESMTPSA id
 t20sm4800329edv.81.2021.11.17.04.32.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 04:32:26 -0800 (PST)
From: luca.boccassi@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: paul.eggleton@microsoft.com
Subject: [PATCH 8/8] systemd: add nativesdk
Date: Wed, 17 Nov 2021 12:32:01 +0000
Message-Id: <20211117123201.111905-9-luca.boccassi@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211117123201.111905-1-luca.boccassi@gmail.com>
References: <20211117123201.111905-1-luca.boccassi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Nov 2021 12:32:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158392

From: Luca Boccassi <luca.boccassi@microsoft.com>

Allows using tools like systemd-analyze at build time and in
CI systems

Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
---
 meta/recipes-core/systemd/systemd-conf_1.0.bb    | 2 ++
 meta/recipes-core/systemd/systemd-serialgetty.bb | 2 ++
 meta/recipes-core/systemd/systemd_249.5.bb       | 2 ++
 3 files changed, 6 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd-conf_1.0.bb b/meta/recipes-core/systemd/systemd-conf_1.0.bb
index 61ce7939d3..84de4d17cf 100644
--- a/meta/recipes-core/systemd/systemd-conf_1.0.bb
+++ b/meta/recipes-core/systemd/systemd-conf_1.0.bb
@@ -41,3 +41,5 @@ FILES:${PN} = "\
     ${systemd_unitdir}/system.conf.d/ \
     ${systemd_unitdir}/network/ \
 "
+
+BBCLASSEXTEND = "nativesdk"
diff --git a/meta/recipes-core/systemd/systemd-serialgetty.bb b/meta/recipes-core/systemd/systemd-serialgetty.bb
index 7ca951cdbd..f877e6ad18 100644
--- a/meta/recipes-core/systemd/systemd-serialgetty.bb
+++ b/meta/recipes-core/systemd/systemd-serialgetty.bb
@@ -50,3 +50,5 @@ FILES:${PN} = "${systemd_system_unitdir}/*.service ${sysconfdir}"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 ALLOW_EMPTY:${PN} = "1"
+
+BBCLASSEXTEND = "nativesdk"
diff --git a/meta/recipes-core/systemd/systemd_249.5.bb b/meta/recipes-core/systemd/systemd_249.5.bb
index 016058cd7f..8f5c737152 100644
--- a/meta/recipes-core/systemd/systemd_249.5.bb
+++ b/meta/recipes-core/systemd/systemd_249.5.bb
@@ -772,6 +772,8 @@ ALTERNATIVE_TARGET[runlevel] = "${base_bindir}/systemctl"
 ALTERNATIVE_LINK_NAME[runlevel] = "${base_sbindir}/runlevel"
 ALTERNATIVE_PRIORITY[runlevel] ?= "300"
 
+BBCLASSEXTEND = "nativesdk"
+
 # Nothing picks up /var in the nativesdk case
 do_install_append_class-nativesdk () {
 	rm -rf ${D}/var
-- 
2.30.2


