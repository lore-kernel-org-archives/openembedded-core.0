Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ED40C5478C
	for <webhook@archiver.kernel.org>; Mon,  4 Mar 2024 15:23:50 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web11.101505.1709565821363069802
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Mar 2024 07:23:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=wKgAbH5A;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.181, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-5d8b887bb0cso4126114a12.2
        for <openembedded-core@lists.openembedded.org>; Mon, 04 Mar 2024 07:23:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1709565820; x=1710170620; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ST0SCPKDPcwBtSWlc/p54LamQlXWTBcEc+J/6BQTR1Y=;
        b=wKgAbH5Aiku1sT5v5ClAz5iPoNlhIoxW9xXclfQ3b3TJrcn82M81rVs0tajfNajUrp
         8+Y6XrZJloa4qeIlOAeO6Rl/xMEshl1gLznufeBSEjAAlQ28Gg7bbWNXAjSpKGx9MVLE
         dvqOiQT3mctrjtss85f8okw9tK0NmT5vHlkTXzUhGvvlWdM61jD0cfC10q4X+fXAonyh
         chaHMcvmXrTiExKMIv5il/dpXIPqBFn27I1kFWWSSvCKpFBcP0dUWA0MTB74RXsmFEYx
         NAsNyg6xL3yTLOnYiWiQOKpnI8Q2Zl2Ks43ZOg9cMyrzXIvo3SfQS7MtGkDYUDxeXWI+
         dCpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709565820; x=1710170620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ST0SCPKDPcwBtSWlc/p54LamQlXWTBcEc+J/6BQTR1Y=;
        b=UTWo3gvBQuQCOD9ESdAIK4rxpnJ/d6lhLHaIV+rckr/dplgp/ocg83kP204M3/BHOD
         TpWRMIERJjtsR1nT5VyB5pEzIH0DfzMSn5MKQNByQxCyBEUhIwwFTaTivEajaSrSQZ7u
         gAOQIqnqEWT+aRU6Gk3xpwY82KRo27ukqWxMZi2yMsjF/uxqMwm+gZIkfRNoGmt1Mfpu
         w3ERSVOC5KDFalmgiJJ6M0WtyW8lzKdvDUXbSdOaC981H2NbZU4O9V04LMompDMTwlbW
         YK2hEafR+wxQy57grh4K9L1Mk5UxBQW3ehaArz5lTu2V+UGxK3QFWYV3JwcxSKZxN8L/
         Pkaw==
X-Gm-Message-State: AOJu0Yz6qZsURV4gXlcnScTxnZbKq9GgHNdADcFOhizzx+l9twrWOZjk
	0rGPyLrTXCkNE580+/i1lEMwmfQ3dPN/3Dz6nyWCYLZUP2iif86nHwwLehWNgVjffzoyr6700gx
	sWg4=
X-Google-Smtp-Source: AGHT+IGIMooSZgiwiJ9ZQgz0QJalE+i6sYQpN+E1hl13mYUdvBV0NdG78TCOIbPzd8GVv0caDjglTQ==
X-Received: by 2002:a05:6a20:3c8d:b0:1a1:2a5b:a6c3 with SMTP id b13-20020a056a203c8d00b001a12a5ba6c3mr11612285pzj.3.1709565820631;
        Mon, 04 Mar 2024 07:23:40 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id 1-20020a17090a0f0100b0029981c0d5c5sm8898968pjy.19.2024.03.04.07.23.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 07:23:33 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 08/11] bind: Upgrade 9.18.19 -> 9.18.24
Date: Mon,  4 Mar 2024 05:23:13 -1000
Message-Id: <f7ab2e99903c93e428fbaa391c977b428c8e2953.1709565668.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1709565668.git.steve@sakoman.com>
References: <cover.1709565668.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Mar 2024 15:23:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196606

From: Soumya Sambu <soumya.sambu@windriver.com>

Includes security fixes for - CVE-2023-4408, CVE-2023-5517,
CVE-2023-5679, CVE-2023-50868 and CVE-2023-50387

Changelog:
=========
https://gitlab.isc.org/isc-projects/bind9/-/blob/v9.18.24/CHANGES

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../bind/{bind_9.18.19.bb => bind_9.18.24.bb}                   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/bind/{bind_9.18.19.bb => bind_9.18.24.bb} (97%)

diff --git a/meta/recipes-connectivity/bind/bind_9.18.19.bb b/meta/recipes-connectivity/bind/bind_9.18.24.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.18.19.bb
rename to meta/recipes-connectivity/bind/bind_9.18.24.bb
index a829cc566d..fbbebe89ad 100644
--- a/meta/recipes-connectivity/bind/bind_9.18.19.bb
+++ b/meta/recipes-connectivity/bind/bind_9.18.24.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "115e09c05439bebade1d272eda08fa88eb3b60129edef690588c87a4d27612cc"
+SRC_URI[sha256sum] = "709d73023c9115ddad3bab65b6c8c79a590196d0d114f5d0ca2533dbd52ddf66"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
-- 
2.34.1


