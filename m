Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA619C54EF0
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 11:06:21 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.9362.1672830357307718609
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 03:06:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Y/SMJK4H;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id h16so32517687wrz.12
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 03:06:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=emgtikgJiyQb+dwCEvIkN3o9b63TPhWDhqj9nHrQ/y8=;
        b=Y/SMJK4Haq7kyNfeh5vmx7TN3T7HQF50NKwGJGdq62UFEJOeoEzyZ5WknESfx+s/r9
         n5cgm95FzSdDXLSQPcvXcO3zK24zorusO3v5wX4xGWQzZwAwMr54gggb6s3Q+4lNQEI4
         +fJeW8GGfa3+FWOxgefbG8HRsEg8PjJNzNWblhwpWfp9PAGNFavkfGz/SaMGhcAPKdJP
         9KKlJ3Q61dp0jjanMuPq8F/D10M/v6jeQgkDqvUUOq7fV0qngBbCoMUpQ3VGHqDtroZC
         aodPKDfS6XwwO54IQ2I+KrB1h6AtoAfOkksOCadzo1h/JQcdf0uoc8BghG6lyTUpkyKX
         r2Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=emgtikgJiyQb+dwCEvIkN3o9b63TPhWDhqj9nHrQ/y8=;
        b=w2rmu+aMpwKvnNIzi6jNk4gFSrVsHHpSbKMaSRr7h9IwsDwcfS1FpwvkGslwsfdxKE
         AnOb2FbMMJc9ApNuZNO9kYyXMpGPRx8MznFew4ZpO1n2EFTwnEJjCWkaQJJWAJjJ/WkB
         DbOlADFLBYfGPcG3TQcgG10KaBXOQT9fIGe1GunbdZsMMvx6U3hfwQ8ZwdmL7wS7wJVt
         zARMJuKL3B8crThF1wp8tX2gDpSUAhNkVyK9cKzpoZMxcsvA0rNMKUiA6WHZZW9x9Z2M
         z37Cz4iF9Dbbnre9CnO+pX1MZEpMXXqCDIpxXhynlKKU8T04PyhI1S/EnEIAAqkZ5esP
         4IJA==
X-Gm-Message-State: AFqh2krI3finmd4y8AL3ssVt4hf4NhUpmpjn40dNKPnq0PoN6J6q71HN
	i1cbl3dIPmjwYHXsvTS/GMFo/fMOqBY=
X-Google-Smtp-Source: AMrXdXvUZAMPPEWTRebvMqxsOBIAgHMLymW1DuaO07Z0BrwtQ5pRPVuswai47+qsTf9IkbgHC9eP5Q==
X-Received: by 2002:a5d:52c9:0:b0:26a:ec28:3856 with SMTP id r9-20020a5d52c9000000b0026aec283856mr27306836wrv.3.1672830372818;
        Wed, 04 Jan 2023 03:06:12 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id h15-20020adfaa8f000000b002421888a011sm34102161wrc.69.2023.01.04.03.06.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 03:06:12 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 26/77] xwayland: upgrade 22.1.5 -> 22.1.7
Date: Wed,  4 Jan 2023 12:04:57 +0100
Message-Id: <20230104110548.2537259-26-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230104110548.2537259-1-alex@linutronix.de>
References: <20230104110548.2537259-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 11:06:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175411

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../xwayland/{xwayland_22.1.5.bb => xwayland_22.1.7.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xwayland/{xwayland_22.1.5.bb => xwayland_22.1.7.bb} (95%)

diff --git a/meta/recipes-graphics/xwayland/xwayland_22.1.5.bb b/meta/recipes-graphics/xwayland/xwayland_22.1.7.bb
similarity index 95%
rename from meta/recipes-graphics/xwayland/xwayland_22.1.5.bb
rename to meta/recipes-graphics/xwayland/xwayland_22.1.7.bb
index 51d847a093..dd32bd0111 100644
--- a/meta/recipes-graphics/xwayland/xwayland_22.1.5.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_22.1.7.bb
@@ -10,7 +10,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5df87950af51ac2c5822094553ea1880"
 
 SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz"
-SRC_URI[sha256sum] = "e317ac1f119f8321654921761420901e4abd95585a8c763ce26af3b045ac1672"
+SRC_URI[sha256sum] = "d53afac6c71953f5cf66d03d289dacd8961da5bd309c1dff125d5955d9db5f76"
 
 UPSTREAM_CHECK_REGEX = "xwayland-(?P<pver>\d+(\.(?!90\d)\d+)+)\.tar"
 
-- 
2.30.2


