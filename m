Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18082CD4934
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 22:31:44 +0000 (UTC)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
 by mx.groups.io with SMTP id smtpd.web10.3162.1695249100238254989
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Sep 2023 15:31:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Yd3ELn59;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.42, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-6c0a42a469dso221950a34.2
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 15:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1695249099; x=1695853899; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gCI02GTQirzcIOXpnlDQt7OTdE8zwauJE4LARibmH0k=;
        b=Yd3ELn59E1OpLd7c8C/hy4fW3Qr6Fw/F/gRQgs94umQNgTa7pFpDFI/2eAmu+5Irgn
         TxiCnuqTjP4xaUsncYm3MAMHKlqZTVuNajRGPi1LWgZWlYkGMkLi09ak0t/YgyJsxuT2
         j2ykI9LXhh7YDjZF5uFMSeoo9cH7QjD6c6sR9FKyRKUfPtDMSm7EcUMlTluNXeCxNwoa
         otMvBYcxzseZdzD2PB+YGyQVue+cMc0cPcHkYnICUXOzjIUpRAy9t3L0IrjgSmP4nHHC
         HSxVOPwes0kzsUimsQ3veOVXeh8UAnBXg+L3DhV/Swyt3blA4IZBm/KuPLlClmMbue5S
         ZeBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695249099; x=1695853899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gCI02GTQirzcIOXpnlDQt7OTdE8zwauJE4LARibmH0k=;
        b=ubrDPRKx5N8yWYSXyF0PtprscFYc4ncOXQdHInBqH0woI/h0ehbaBAQLtWLMOrl5iv
         5XPLzJPpJIn+Ck58/4De45rQ3tPeUd1oaFfvRL1TDI8o5kMGbDzwYku6KgKQzIDj/drD
         dg6wEoShwukr8K33wbDLG7Wyyix9ujo9ZCkGoaWyKdJv5zTFA5ZKh1dH0AWIOurHcmQ2
         5rDtQFtNpMyEON66tdzIPqbkz8aTEYAs5f5C1Ugxz2rDjoST8PBn2l7zQWrd7iVarkl3
         3Ot7oeVqdcV0rRdTiPV9hnDF8iG1D/dwwKHmXXSUo3dKeN9kGPdmEVk76PsAm1KDOj1o
         6DAQ==
X-Gm-Message-State: AOJu0YxEcZ03sxv6HJDuZRMl9zxckF2WXycvTdm91lIZKOLhOkpTe0Sh
	ABICxkaulIoK/kBbymNQW2HzMQfRvUJrWaPW8ec=
X-Google-Smtp-Source: AGHT+IHYcmvja/sHyZVTJBV/rBKTAAv3hhgP57WD/PIru0A6U0voYOr8RcRKVLppxtUhky+spcaAbA==
X-Received: by 2002:a9d:4d10:0:b0:6b7:5086:2f59 with SMTP id n16-20020a9d4d10000000b006b750862f59mr3589316otf.23.1695249099206;
        Wed, 20 Sep 2023 15:31:39 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id a13-20020a63704d000000b00578f1a71a91sm11535pgn.79.2023.09.20.15.31.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 15:31:38 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 19/20] dbus: Specify runstatedir configure option
Date: Wed, 20 Sep 2023 12:30:56 -1000
Message-Id: <55529a5cb481b64ab4390728e01650bc585be602.1695248921.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1695248921.git.steve@sakoman.com>
References: <cover.1695248921.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 22:31:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187967

From: Pavel Zhukov <pavel@zhukoff.net>

Without specifing runstatedir tmpfiles.d is configured to use /var/run
for dbus and this causes deprecation warnings in system logs.

Signed-off-by: Pavel Zhukov <pavel.zhukov@huawei.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4df1a16e5c38d0fb724f63d37cc032aa37fa122f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/dbus/dbus_1.14.8.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/dbus/dbus_1.14.8.bb b/meta/recipes-core/dbus/dbus_1.14.8.bb
index 2ba56bf782..4da307ecb3 100644
--- a/meta/recipes-core/dbus/dbus_1.14.8.bb
+++ b/meta/recipes-core/dbus/dbus_1.14.8.bb
@@ -25,6 +25,7 @@ EXTRA_OECONF = "--disable-xml-docs \
                 --enable-tests \
                 --enable-checks \
                 --enable-asserts \
+                --runstatedir=/run \
                 "
 EXTRA_OECONF:append:class-target = " SYSTEMCTL=${base_bindir}/systemctl"
 
@@ -132,7 +133,7 @@ do_install() {
 		sed 's:@bindir@:${bindir}:' < ${WORKDIR}/dbus-1.init >${WORKDIR}/dbus-1.init.sh
 		install -m 0755 ${WORKDIR}/dbus-1.init.sh ${D}${sysconfdir}/init.d/dbus-1
 		install -d ${D}${sysconfdir}/default/volatiles
-		echo "d messagebus messagebus 0755 ${localstatedir}/run/dbus none" \
+		echo "d messagebus messagebus 0755 /run/dbus none" \
 		     > ${D}${sysconfdir}/default/volatiles/99_dbus
 	fi
 
-- 
2.34.1


