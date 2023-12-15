Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4031C4167B
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 20:34:16 +0000 (UTC)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
 by mx.groups.io with SMTP id smtpd.web10.76399.1702672454429442193
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Dec 2023 12:34:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=l2ltO32/;
 spf=pass (domain: gmail.com, ip: 209.85.167.175, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3ba2dd905f9so825945b6e.2
        for <openembedded-core@lists.openembedded.org>; Fri, 15 Dec 2023 12:34:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702672453; x=1703277253; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q7B5wjOPhfRF1qBUV3RgGhNcGXlswQT8MbexAvwnJno=;
        b=l2ltO32/rcrk2BoG2VS/725ZvemDOgxFmEt1qvWIdk2/P2KG4WYVGm5M0GsnQvofpG
         +OwXPJ+VvbvIkWy8vxt1Cu268aKrHE6rzBhQkG62iVbW3Ng2AnLsrzf6oB0rfVaqnGsT
         SnpbDxLcl4QvdsoSJBNPhPk6m29bqXIEdi3jrcwVilRzM8eR/RNWswPbhBt9WpBzpgqe
         /icuBC7NPB0PhtMVfUvqLk5yRye719Ze7Ot91BO1y6CONWk9BfytOjSKpeODtJWUHI11
         k/dxWCia1t5Bj0XYNqArI4/GWY/ew3BzPksUyDeByQ/jQUthdb78YCiZfkMTwA7MtScU
         fHbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702672453; x=1703277253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q7B5wjOPhfRF1qBUV3RgGhNcGXlswQT8MbexAvwnJno=;
        b=fzrJdbkLeqLBx47kH1xl9SvG54OBajUDclPu+pQplYBIy3yexl5B6VMai5EXFTD6Am
         TF9XoaDyorZF2ehz7Z4yYL0BYx3urjC0xBHYRy4CA78xl8tArATeAx/9KGR0vGwDL8Xw
         5vL92XTxZbtUczIo7R10Ox7wuOWHYX0dgn5Aeoh45LFhJc0sPKvBgN39sPjnfQsXRvs4
         85d+4Pg3xHLip1sW3bJtO65YBEGMWpUoiKkOym8/IpyKjIJsYex5FF3YoF3LTqUK7g8m
         6qi7BUD0D3qk7WDR4wh4rQEanumMfB1CnSbWn3ys91b3MQgNzFuh9ka8wVrbJroG6qkD
         wlwA==
X-Gm-Message-State: AOJu0YwGEVgEsR9e0NnXFmLAsIOHTCmNMJkc9if1s27iBooSm6J2BBMV
	sLTtkk2fcTj+xitKakjCcZ4/FFlJrNk=
X-Google-Smtp-Source: AGHT+IG1MlHqL70QkoIfDpe9TRi6wPYAjSGY4bSfK2TX0v68B6QXx1SbdNTELYc4s4Id9jhZFyFOgg==
X-Received: by 2002:a05:6808:1597:b0:3b9:ebea:3bc2 with SMTP id t23-20020a056808159700b003b9ebea3bc2mr13971146oiw.69.1702672453118;
        Fri, 15 Dec 2023 12:34:13 -0800 (PST)
Received: from localhost.localdomain ([2601:282:4300:19e0::35cb])
        by smtp.gmail.com with ESMTPSA id bj14-20020a056808198e00b003b88c211777sm3846860oib.24.2023.12.15.12.34.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Dec 2023 12:34:12 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 2/2] rpcbind: Specify state directory under /run
Date: Fri, 15 Dec 2023 13:34:04 -0700
Message-Id: <20231215203404.2913433-2-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231215203404.2913433-1-JPEWhacker@gmail.com>
References: <20231215203404.2913433-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Dec 2023 20:34:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192545

The state directory must be correctly specified as under /run because
RequiresMountsFor doesn't follow symbolic links which means the unit may
run before /run is mounted if the default of /var/run/rpcbind is kept

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-extended/rpcbind/rpcbind_1.2.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/rpcbind/rpcbind_1.2.6.bb b/meta/recipes-extended/rpcbind/rpcbind_1.2.6.bb
index dd89726afc7..dbd4d32e0a0 100644
--- a/meta/recipes-extended/rpcbind/rpcbind_1.2.6.bb
+++ b/meta/recipes-extended/rpcbind/rpcbind_1.2.6.bb
@@ -40,7 +40,7 @@ PACKAGECONFIG[systemd] = "--with-systemdsystemunitdir=${systemd_system_unitdir}/
                           systemd \
 "
 
-EXTRA_OECONF += " --enable-warmstarts --with-rpcuser=rpc"
+EXTRA_OECONF += " --enable-warmstarts --with-rpcuser=rpc --with-statedir=${runtimedir}/rpcbind"
 
 do_install:append () {
 	install -d ${D}${sysconfdir}/init.d
-- 
2.34.1


