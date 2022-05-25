Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C37BC433EF
	for <webhook@archiver.kernel.org>; Wed, 25 May 2022 14:30:56 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web08.7523.1653489047676357078
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 07:30:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=8HeZ9C/g;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id y199so19365469pfb.9
        for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 07:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=I6ztsUHh7mUM4+CtZVX5007uBtWWyI6NMCcDGpItQG0=;
        b=8HeZ9C/g/rGmSCrVKJfOkUWTw9hVnTeqGWPEfl4d/ehb0fMHiLGh8AGjuHzYRKaQcB
         k/4A9tM8Aj+jG/ewYce2CMg2HIiYkVLTPcBTIGMREWdjkdvBzq6ZQmAQxxTGvehiXw7D
         pkKXadoqmzaO1GPHmrcr1C+pqixLCDpkzonhUzFwkgAD+yPFt2MB0WfnWuNHQy5TbCQA
         3b2kRwMmvzYl0tC7gvaSxfz2h+v0FqVrm8M83Gsm+yHy7vySpr+NgY/3tquw6SD/YqDS
         fY6VOX3jgvYmkqMe9bWMmTG3XFAH30+mjVl6qzXo2Jm1BcORITCNsydprx8G8PRRcCnM
         pWvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=I6ztsUHh7mUM4+CtZVX5007uBtWWyI6NMCcDGpItQG0=;
        b=P04dHE9uvPVxEFbKh0u11/Y6fc8y+OnjpHqmasD+rX1dmsFqd4ez3IAuLMCdVJyDiB
         /ZT4I50htn7Qz+p8j5yWzGIVUjyRNd0O0Or91DY9zTb+nPOYngHjRheIYd2lQrr8y35b
         Nm/tE++kQWIQ4K40MVKDbxMbx85DZGsfm/jQEq9ucOsYJI1I1sa+ZezO4o1n+l8JcBh+
         g1DnfrHv5IHDlH0YCU0bIeDNPVYPvlHXjV6BrjyN8il834qvYpu7xGZcO0fHdoZYK07L
         rUa8zVE2dGXclnTIefnOkjaZRtNGahTOlk/EQUyRcAhNlUEKruDVjxufUuk9RJovnePO
         4/Yw==
X-Gm-Message-State: AOAM531vFAtqlRJzJQ9sevgX3xcvtACXgJG72riWK7/3nPTl6PqNzI7A
	0z/Kx+xvpdetu2rK2KXQnnSW945d4CKBhzbO
X-Google-Smtp-Source: 
 ABdhPJxU5NuXA42WrnrwpuLjwO6ufw/UL41BmCy4vGXmiKcGAM2vOuAfUezsxtmL63gqXq99HLVJ6A==
X-Received: by 2002:a05:6a00:9a2:b0:505:974f:9fd6 with SMTP id
 u34-20020a056a0009a200b00505974f9fd6mr34012915pfg.12.1653489046426;
        Wed, 25 May 2022 07:30:46 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 a8-20020a656408000000b003db141a5f26sm8553837pgv.1.2022.05.25.07.30.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 May 2022 07:30:45 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 18/19] sqlite3: upgrade 3.38.3 -> 3.38.5
Date: Wed, 25 May 2022 04:29:46 -1000
Message-Id: 
 <c762a5c97b61b4d560cda33ba4a7c329df0fc9f8.1653488418.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1653488418.git.steve@sakoman.com>
References: <cover.1653488418.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 May 2022 14:30:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166144

From: Alexander Kanavin <alex.kanavin@gmail.com>

Additional changes in version 3.38.4 (2022-05-04):

Fix a byte-code problem in the Bloom filter pull-down optimization added by release 3.38.0 in which an error in the byte code causes the byte code engine to enter an infinite loop when the pull-down optimization encounters a NULL key. Forum thread 2482b32700384a0f.
Other minor patches. See the timeline for details.

Additional changes in version 3.38.5 (2022-05-06):

Fix a blunder in the CLI of the 3.38.4 release.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e1bd414792ae2576685b2a352a5cc93343f06985)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../sqlite/{sqlite3_3.38.3.bb => sqlite3_3.38.5.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/sqlite/{sqlite3_3.38.3.bb => sqlite3_3.38.5.bb} (86%)

diff --git a/meta/recipes-support/sqlite/sqlite3_3.38.3.bb b/meta/recipes-support/sqlite/sqlite3_3.38.5.bb
similarity index 86%
rename from meta/recipes-support/sqlite/sqlite3_3.38.3.bb
rename to meta/recipes-support/sqlite/sqlite3_3.38.5.bb
index 286987b708..d56a3a0209 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.38.3.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.38.5.bb
@@ -4,7 +4,7 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed00c66"
 
 SRC_URI = "http://www.sqlite.org/2022/sqlite-autoconf-${SQLITE_PV}.tar.gz"
-SRC_URI[sha256sum] = "61f2dd93a2e38c33468b7125967c3218bf9f4dd8365def6025e314f905dc942e"
+SRC_URI[sha256sum] = "5af07de982ba658fd91a03170c945f99c971f6955bc79df3266544373e39869c"
 
 # -19242 is only an issue in specific development branch commits
 CVE_CHECK_IGNORE += "CVE-2019-19242"
-- 
2.25.1


