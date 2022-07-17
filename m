Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EC76CCA47B
	for <webhook@archiver.kernel.org>; Sun, 17 Jul 2022 12:57:25 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web08.15573.1658062627861176877
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Jul 2022 05:57:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OI15QwZx;
 spf=pass (domain: gmail.com, ip: 209.85.167.42,
 mailfrom: liu.ming50@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id n18so15222194lfq.1
        for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Jul 2022 05:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VKKfLOY5kO6EuNpq3jPN8+Sd2rGxYdiRDswRebGyL0Q=;
        b=OI15QwZxFxMdxEdN7ORBYROYsMzF7GGa17xVpSLBsgdZIauwkaIcks1bRXAEvZDTBo
         z+EZKTEFFZ6RqNi750w8QzUXb7s13DC457D4e3vDbcBfOqcWJ5SOhSgQ/i+WHBPN7Fn2
         nAEs/106BqXG4JWSRZbVrqeXYnOwDdHze9kellrBK69ioBcF31qdeSFX5r+A5/lme7x7
         bzTvqddb7BF00RwYIUwcMCYgJPhaNMI2OFY62Jl68F8HsXFwEgGz6lxMVaEvHNTjXZVj
         STHqlh8cm4uSugohd/XpsmZYyMpCGRKjKs2s5MS8bDdSxOgCGyh6X57IMgdeMXNABnAw
         ArGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VKKfLOY5kO6EuNpq3jPN8+Sd2rGxYdiRDswRebGyL0Q=;
        b=0Ke2eagp3Y0tX4cUjAR/PH/uEaLX7tOFu3C0y1WlDvoOas+/f+yjOGfUfhJygWjIOp
         BJoOn3lqjiDBVOKAHC8apqQZ6jzkNWcvW1gpEbqghrd6inrFMPPGU/4tV/QQZOovQru0
         vrr2THkxHrxbcYpRi63g+Y1TC4wyQ3xwbhIbAO40zYPi1XyTAU4PR9ScdXvtLeT2nwDQ
         pUcCKMJfL5zFsDzMHSngKwmg8K96JMrVCeKuEGkkP4F1qbbUI53/98JJHxKG7tINTN3q
         dQUZZa/pmsRvW8BoeTgGJXVMqM/W4xCi+xF8289rxVH7LoOk5WaXOJ6jGlzpGIIIsUy9
         znEg==
X-Gm-Message-State: AJIora9IHe/Ee7Y90Lb8u6D3AtoHqM0kTYT2D5b4PByxif9sZ9AtF3HH
	OjPhV8dq6agABOBMBm58ahs1fn+weUc=
X-Google-Smtp-Source: 
 AGRyM1sHc6En74raBFkvXzzS1dgPywstRpJtthVm8732boLK9XkbXXwEIWKlzhmhhGD2iQlzLr4HsA==
X-Received: by 2002:a05:6512:3f01:b0:46b:a5ba:3b89 with SMTP id
 y1-20020a0565123f0100b0046ba5ba3b89mr12411096lfa.28.1658062634128;
        Sun, 17 Jul 2022 05:57:14 -0700 (PDT)
Received: from peterliu-Precision-7530.emea.group.atlascopco.com
 (customer-212-100-112-191.stosn.net. [212.100.112.191])
        by smtp.gmail.com with ESMTPSA id
 v11-20020a05651203ab00b00483e5f01698sm2023056lfp.65.2022.07.17.05.57.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jul 2022 05:57:13 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Muhammad Hamza <Muhammad_Hamza@mentor.com>,
	Ansar Rasool <ansar_rasool@mentor.com>,
	Muhammad Hamza <muhammad_hamza@mentor.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Ming Liu <liu.ming50@gmail.com>
Subject: [OE-core] [kirkstone] [PATCH 7/9] udev-extraconf/mount.sh: ignore lvm
 in automount
Date: Sun, 17 Jul 2022 14:56:46 +0200
Message-Id: <20220717125648.2942046-8-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220717125648.2942046-1-liu.ming50@gmail.com>
References: <20220717125648.2942046-1-liu.ming50@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Jul 2022 12:57:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168155

From: Muhammad Hamza <Muhammad_Hamza@mentor.com>

Failure message is shown in boot logs when trying to
mount lvm as automounter does not handle cases where
lvm is mounted. This simply skips lvm while automounting
to avoid failure message in boot logs.

Signed-off-by: Ansar Rasool <ansar_rasool@mentor.com>
Signed-off-by: Muhammad Hamza <muhammad_hamza@mentor.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
(cherry picked from commit b1d18072ed9a8b0bca0f20f8e5deefa73ab6acbe)
Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta/recipes-core/udev/udev-extraconf/mount.sh | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-core/udev/udev-extraconf/mount.sh b/meta/recipes-core/udev/udev-extraconf/mount.sh
index 537828e3e3..8b6ce77741 100644
--- a/meta/recipes-core/udev/udev-extraconf/mount.sh
+++ b/meta/recipes-core/udev/udev-extraconf/mount.sh
@@ -76,6 +76,8 @@ automount_systemd() {
         ;;
     swap)
         return ;;
+    lvm*|LVM*)
+        return ;;
     # TODO
     *)
         ;;
@@ -129,6 +131,8 @@ automount() {
 		;;
 	swap)
 		return ;;
+	lvm*|LVM*)
+                return ;;
 	# TODO
 	*)
 		;;
-- 
2.25.1


