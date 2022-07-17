Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 449D6C43334
	for <webhook@archiver.kernel.org>; Sun, 17 Jul 2022 12:57:15 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web08.15573.1658062627861176877
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Jul 2022 05:57:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TVgJlE7M;
 spf=pass (domain: gmail.com, ip: 209.85.167.42,
 mailfrom: liu.ming50@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id n18so15222019lfq.1
        for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Jul 2022 05:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=o0jeXVmFSLCdna0HHTghQ38tuwxgXgLZhMih+C4XmFE=;
        b=TVgJlE7MYMxqaiE2x4fdJ9BKa9GuJOgnnq+QQ5gQN9pgs/7NsJlYQk0w/hvfsAlowf
         pmFnfPbNN+Bmccq/1vpuqKT8j21TROncQloCFEYvmAnIz7YIlQTdxPXhtiJTPGC2AuIs
         Tfxh1HedguR7Uz0DNGi2v+mGEZS0QMmnqFG85kq2E/fb3/nrFrONZdtv3dbrF9MXLFG6
         HtP0hM0t7tK3LW1JQ/PFTxr6G2u1rspWi58fJYDDrlLfqN+XxjYS2IT0otqHYAwcAFXw
         Vq9Z6USmkLhRs0cUlQqR9dbR6dxFuSJ8Bgz3kCem+jRA63WuUJXEaahtoO6sEd+SGgbu
         nCsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=o0jeXVmFSLCdna0HHTghQ38tuwxgXgLZhMih+C4XmFE=;
        b=bASVLOqBJ30W7T64r1IVauMQYFCUD7OruJvQgahoQ/9GUBGcMuD0jqK9a1UjwB55r6
         eVG/t/A/VaudFN3ip+bew8a5MIH6b8JTDjfaHg4V76PkbX5v8agqpkoA1z04UzQQryr5
         +7AqNryCLko9UPnciIgWErjsKupUmB9e8HEibFMhzzHj0JrUIdftQatWAVxdzBukLJHa
         vGCOf3zZA3JtwicAa9SBE9k0VSu9wKxOskNgU4znO3gePsAU256BertYrehG85P6C82U
         JSk1kT71nm8V57NpUGL9EwVKIcySVvRHY6qmKIJj/+XbsAdiEEpPzi23iM7B8JKT6VVN
         Fm0A==
X-Gm-Message-State: AJIora8/YqZHBZjR7wSbKhnAzRBepKjR1TEHSn1b65nv7rn+mHbEG1Zv
	Yskc4UBLs82AYVfKEyEMsmAR60N/dbc=
X-Google-Smtp-Source: 
 AGRyM1sPkIeG1ke9o2aeUETAIe8wcqarWufY31pZ0EvpYjhJQYpLR6H+h9O3zC3ktYPNkNO+8ZutUQ==
X-Received: by 2002:a05:6512:114e:b0:489:e8ef:1792 with SMTP id
 m14-20020a056512114e00b00489e8ef1792mr12067833lfg.446.1658062628978;
        Sun, 17 Jul 2022 05:57:08 -0700 (PDT)
Received: from peterliu-Precision-7530.emea.group.atlascopco.com
 (customer-212-100-112-191.stosn.net. [212.100.112.191])
        by smtp.gmail.com with ESMTPSA id
 v11-20020a05651203ab00b00483e5f01698sm2023056lfp.65.2022.07.17.05.57.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jul 2022 05:57:08 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Muhammad Hamza <Muhammad_Hamza@mentor.com>,
	Awais Belal <awais_belal@mentor.com>,
	Muhammad Hamza <muhammad_hamza@mentor.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Ming Liu <liu.ming50@gmail.com>
Subject: [OE-core] [kirkstone] [PATCH 4/9] udev-extraconf/mount.sh: save mount
 name in our tmp filecache
Date: Sun, 17 Jul 2022 14:56:43 +0200
Message-Id: <20220717125648.2942046-5-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220717125648.2942046-1-liu.ming50@gmail.com>
References: <20220717125648.2942046-1-liu.ming50@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Jul 2022 12:57:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168152

From: Muhammad Hamza <Muhammad_Hamza@mentor.com>

Doing this will allow to fetch the exact name created by the
auto-mounter during the remove action where depending on the
scenario utilities such as the blkid might not be usable due
to actual device not being present on the system.

Signed-off-by: Awais Belal <awais_belal@mentor.com>
Signed-off-by: Muhammad Hamza <muhammad_hamza@mentor.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
(cherry picked from commit 496b76f8775a620c1d449eb6f62a41656abf2a9b)
Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta/recipes-core/udev/udev-extraconf/mount.sh | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/udev/udev-extraconf/mount.sh b/meta/recipes-core/udev/udev-extraconf/mount.sh
index 40910be8bd..c4695ee27d 100644
--- a/meta/recipes-core/udev/udev-extraconf/mount.sh
+++ b/meta/recipes-core/udev/udev-extraconf/mount.sh
@@ -126,7 +126,10 @@ automount() {
 		rm_dir "$MOUNT_BASE/$name"
 	else
 		logger "mount.sh/automount" "Auto-mount of [$MOUNT_BASE/$name] successful"
-		touch "/tmp/.automount-$name"
+		# The actual device might not be present in the remove event so blkid cannot
+		# be used to calculate what name was generated here. Simply save the mount
+		# name in our tmp file.
+		echo "$name" > "/tmp/.automount-$name"
 	fi
 }
 	
-- 
2.25.1


