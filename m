Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92458CD11BF
	for <webhook@archiver.kernel.org>; Wed, 20 Mar 2024 16:10:43 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.49401.1710951033575498475
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Mar 2024 09:10:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=EhmfYMub;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1dff837d674so35412255ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Mar 2024 09:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1710951033; x=1711555833; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=shtJfcZ8wRAXrdgxJT+aqQDcjm9BmdjW8s5AuYlo3D0=;
        b=EhmfYMubzY9iQJabAEY3jowsfy/Q2g+vZ3keb5zg/T/i+/XvzBqN2+FPGd2Ic26Xgj
         agnZ6zeUTZLBONrQWff9fHUnQRwVU90fCbeX8hralFeiMcv78rMFupo1FKNQfjN3xzCc
         vPjU7XNwtllOtyUAIICszvyaa61ZaZGnXrX/5+dfACFfAI0EMLpxoivHqW8uGj3UB8rZ
         LCYjEBhedbcuYfmc7/JVnSoKy3iO6JXGyiE9MtkNjKsuMN7eW6lS/Q2iHlDe/ZXyDgoN
         4Pt568J9Jw9vlQ6g6Gm1z7c9pmcy1vOx5vauF1DGmsBCpRT3Ugrrzammd/DREfaJwB0f
         Qc2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710951033; x=1711555833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=shtJfcZ8wRAXrdgxJT+aqQDcjm9BmdjW8s5AuYlo3D0=;
        b=FkdfJpO5CzbCWRoN43dN3Jyj7FxHOBuHoddWpsWOWBzKatFRC/VSvVd6iwthn2haVB
         tzZxORCNyYMjjOYDqlDja3aaUKOiLnQZQnLqbWiPGnTt1RINumR30diQFCRpmj2qUM64
         E1Gdd7Ockm2uxDz8vIbvOyOqgDl71B3IfFFrse5sK51MXAvzqTkyNnM3YwgJ4WTidT3N
         jVriM5b7ZSJkKvXqimmwFu7EUdROKySkigTZILAp20V2LTKn9QZQFSQ9HXhEfFGSOlrH
         zeLcsoFA8fveh+rr6HOD+nx5QT5hAgU2J/ZT1UaS9kQcvFogIwNBVuZHs7BtYT7V2XJM
         Be8g==
X-Gm-Message-State: AOJu0Yzn+TMcltArqEm+lKasRNYJEZ5x0f4LT1CHFk9cgdlOh5WBmJ7y
	nOrKAiNn+na9D8/M4gCLj4+oF7dMfi35LXtKRNfb+Qexl4ycxJnOGb/19CDuPKzyFr6uTfaIGKa
	2V94=
X-Google-Smtp-Source: AGHT+IEdJVDx/5kfOSMpX3DdACjlO/Rn68xO9vM9gD+irEwM4BOzdDa3lCmNEU1mZAEO8vPUxvYQFg==
X-Received: by 2002:a17:902:cf05:b0:1de:e3d5:cdde with SMTP id i5-20020a170902cf0500b001dee3d5cddemr2647979plg.5.1710951032827;
        Wed, 20 Mar 2024 09:10:32 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id l18-20020a170903121200b001ddc93c5759sm13775694plh.196.2024.03.20.09.10.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Mar 2024 09:10:32 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 08/15] cve-update-nvd2-native: Fix CVE configuration update
Date: Wed, 20 Mar 2024 06:09:46 -1000
Message-Id: <38402b5e89d43bf2a45c8f5f2d631033be5019cd.1710950846.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1710950846.git.steve@sakoman.com>
References: <cover.1710950846.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Mar 2024 16:10:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197379

From: Yoann Congal <yoann.congal@smile.fr>

When a CVE is created, it often has no precise version information and
this is stored as "-" (matching any version). After an update, version
information is added. The previous "-" must be removed, otherwise, the
CVE is still "Unpatched" for cve-check.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 641ae3f36e09af9932dc33043a0a5fbfce62122e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/meta/cve-update-nvd2-native.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb b/meta/recipes-core/meta/cve-update-nvd2-native.bb
index a703b68aac..0044529b7d 100644
--- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
+++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
@@ -352,6 +352,10 @@ def update_db(conn, elt):
                 [cveId, cveDesc, cvssv2, cvssv3, date, accessVector]).close()
 
     try:
+        # Remove any pre-existing CVE configuration. Even for partial database
+        # update, those will be repopulated. This ensures that old
+        # configuration is not kept for an updated CVE.
+        conn.execute("delete from PRODUCTS where ID = ?", [cveId]).close()
         for config in elt['cve']['configurations']:
             # This is suboptimal as it doesn't handle AND/OR and negate, but is better than nothing
             for node in config["nodes"]:
-- 
2.34.1


