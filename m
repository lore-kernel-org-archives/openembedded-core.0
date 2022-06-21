Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86C18C43334
	for <webhook@archiver.kernel.org>; Tue, 21 Jun 2022 20:17:06 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web09.48618.1655842623824846966
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 13:17:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cK4DYdGU;
 spf=pass (domain: gmail.com, ip: 209.85.208.53,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id eo8so20961664edb.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 13:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vdnIcQLYUJF2fdxFVdg+WgQ+NqAzOPNm9xXq++6pH/s=;
        b=cK4DYdGUKX2OsWHjsF3sYuUMvSVc8Hkp4npZmeQ+DLk0HNejvvJ/FXIkEaA28UGAbt
         40/kZrem0Y2M+74HvM6BXRvJ+pwY1FaAmCJ+gU5s779poncrWjqqdqasD4A/45nH6mUN
         ++lcpfyNegWcvTGceX+tK1p8u+mFBEd3hOGwsm+SxOSStjKS3N10aIxtPhgzJyE9BAlG
         W0Ko0GPIJJeeGbshNrUTF4ErtlVbWjuykLNu7E5EWHmgTDlcmsr6Jy5mNTSQuNeGDTd9
         n+sBt0gEMZ2TCY+K18illR+n91Y/lkWbt9URl9Vmynfx5JZXzeP4+3AaCnrn0PGsZnp4
         3Xjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vdnIcQLYUJF2fdxFVdg+WgQ+NqAzOPNm9xXq++6pH/s=;
        b=Ksaz5Z0IHfCDVPrwzaFSLjIZrNF2WZpSCGS+6HK6dKFisN0AIRk55MaOOshHeFFsh9
         WxbVb2wovOrFuEALN6bcTcnT22BAuAGbOfrIxALgL9cb2SnyUYoaQ8AN68ZjOIDdrMXf
         Y8zYjnbR2MCVstGKKTrFOoDUTdY6FEc1npFjzwRI2AFCWTeredq07L8G0M7YCnc3MZG6
         ZUKr1BgEmkYQ+w8XcuSwRWvWESP+QjyAsV4wL73xqSVc/CP+CrlsLLjXuBzxS4lNxLL+
         0LSPQUmUOzrqHOy0JlobDETUI3c2uHXxP82MJ1llV8z5+/WoVxRyAB0plkNrpCDL94uJ
         JbbA==
X-Gm-Message-State: AJIora8IDv0m5j4s+uCyAz4OAy8M/F/4Bab06kLxab34nwv3R6N9cOiD
	e20HRzBytnqzfV86GjCSQp2ZM9Y6eMiuiw==
X-Google-Smtp-Source: 
 AGRyM1shPMQqCcOaconvLJ1zfC35i/1Ar0ZOKwkYZ5SRoEZz6nndXcOtM51+ZAqO268w4PAN5/oHMg==
X-Received: by 2002:a05:6402:50c7:b0:435:923b:9b23 with SMTP id
 h7-20020a05640250c700b00435923b9b23mr7651584edb.336.1655842622362;
        Tue, 21 Jun 2022 13:17:02 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 j8-20020a056402238800b0043590660f16sm3420890eda.35.2022.06.21.13.17.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jun 2022 13:17:01 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 15/18] sudo: upgrade 1.9.10 -> 1.9.11p2
Date: Tue, 21 Jun 2022 22:16:34 +0200
Message-Id: <20220621201637.1378306-15-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220621201637.1378306-1-alex@linutronix.de>
References: <20220621201637.1378306-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jun 2022 20:17:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167183

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-extended/sudo/{sudo_1.9.10.bb => sudo_1.9.11p2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/sudo/{sudo_1.9.10.bb => sudo_1.9.11p2.bb} (96%)

diff --git a/meta/recipes-extended/sudo/sudo_1.9.10.bb b/meta/recipes-extended/sudo/sudo_1.9.11p2.bb
similarity index 96%
rename from meta/recipes-extended/sudo/sudo_1.9.10.bb
rename to meta/recipes-extended/sudo/sudo_1.9.11p2.bb
index aa0d814ed7..b3eae4a0fa 100644
--- a/meta/recipes-extended/sudo/sudo_1.9.10.bb
+++ b/meta/recipes-extended/sudo/sudo_1.9.11p2.bb
@@ -8,7 +8,7 @@ SRC_URI = "https://www.sudo.ws/dist/sudo-${PV}.tar.gz \
 
 PAM_SRC_URI = "file://sudo.pam"
 
-SRC_URI[sha256sum] = "44a1461098e7c7b8e6ac597499c24fb2e43748c0c139a8b4944e57d1349a64f4"
+SRC_URI[sha256sum] = "a21918eb9fc0063794f6887464fa2d924ab6d192e19063191a429605c22791d2"
 
 DEPENDS += " virtual/crypt ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS:${PN} += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
-- 
2.30.2


