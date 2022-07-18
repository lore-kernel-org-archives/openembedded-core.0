Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5B03CCA479
	for <webhook@archiver.kernel.org>; Mon, 18 Jul 2022 14:49:42 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web11.28050.1658155774226720500
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 07:49:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=6gpji2MX;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.53,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f53.google.com with SMTP id p9so11950113pjd.3
        for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 07:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=WFJuooYBy3WC7Y2K0PToLk6DpqsFg90VF9n74uf6yvs=;
        b=6gpji2MXozd4AM6DaydUlXws2jBJCtGWAQGm/reROKrrp5dN8Z1bIbhlbbT8ABeBSf
         AJDBc7pD+L/0SDWyVZSG4OU0pW6WIEacI/WUUH0oWupqg/an6EBbG3PrRjdIOGOBiVI9
         0svgQs+pa4wGQwpkOPHWMfJM1U16aUUVbPzsT2mEeExDmYueaMuRcTDorLRW9WvQKU2u
         B4fGMN9nXC6970Y8giNhYevIqu755qWKPHbjh04b1B3ASwnsNyhSFHvI/kgrXUBMeUPu
         ALS1ihVityonFeR8kz5tOkxJB8hTTCJZkKDpaxwvBbnNCfZHpmvn5MJAYQ7EH1koaJuL
         FPZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WFJuooYBy3WC7Y2K0PToLk6DpqsFg90VF9n74uf6yvs=;
        b=CjCtmlEjUAm5lzUJ8FZoMYmpA8S9rTyroffGfA1gDOhdnM2ryxgMPLk8Gbs1WCbSH5
         OJqM4QAuIUeTztUKXaAosTv7UOfI3bMG+FWS7HMDQqIkqzVe6+HcfiGsZv2cfu7NsUbZ
         AYQt0DAkWAm6HrZrSmk7ThcN66EKW/IYPpTDuwG2rh8ExUseFRAmLTmmnZk+TrPFkWhb
         eOS539XDJsMit2jlQwFIR7ym6m3qKKlqB7ZkybMks6HRKGvA1AHDiCzS+NVrCGN8r/oE
         rapQi09RNOKMQDsFY/kx8s6XIGTbM5vcTKac7P/LuabGmvkCmyEKlI8FUjPSDrs3Asem
         5T/g==
X-Gm-Message-State: AJIora+jlDcBDs/PlCBOut46hdiKYB6GZdDJfyzwCsy9mFueVU5VE+Sd
	D4LKqwocL78A5RPQvsxtGVPc57ZEmMFNKdm1
X-Google-Smtp-Source: 
 AGRyM1vgzJVsgzANC5Fgqs66LiIs8EIbAqNZoP50nodu1HMjjr0M7SaXd5FKM65QBQG8NOvNk5AhFw==
X-Received: by 2002:a17:90a:5904:b0:1f1:ca90:b5a8 with SMTP id
 k4-20020a17090a590400b001f1ca90b5a8mr6382526pji.54.1658155772934;
        Mon, 18 Jul 2022 07:49:32 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 ij8-20020a170902ab4800b0016c066e566bsm9551517plb.164.2022.07.18.07.49.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 07:49:32 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 06/35] udev-extraconf/mount.sh: save mount name
 in our tmp filecache
Date: Mon, 18 Jul 2022 04:48:31 -1000
Message-Id: 
 <55c2de8963cbaffdde4e527b044c3c3e3658924e.1658155579.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1658155579.git.steve@sakoman.com>
References: <cover.1658155579.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Jul 2022 14:49:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168206

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
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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


