Return-Path: <luca.boccassi@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27E6AC433FE
	for <webhook@archiver.kernel.org>; Fri, 19 Nov 2021 11:34:47 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web08.7629.1637321685839166132
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Nov 2021 03:34:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JV2yalFX;
 spf=pass (domain: gmail.com, ip: 209.85.208.48,
 mailfrom: luca.boccassi@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id t5so41774602edd.0
        for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Nov 2021 03:34:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xTOuBZgp5oGRq1fFxpY5iTn4vt5/2QQJ4TVRvKKsXyM=;
        b=JV2yalFXDEyt9/XMlBGmKS2Jl6fhn7yOYmOj2cKgCUz5Eq9WKgqL9B3WV8MRyQs0jJ
         IPeBqKxEAGVPkvClHY8YB5RW4X5tubxUbjGD5Sp2o/VRI6uxFT7Jt8Hl2cMN85cchSlI
         oKw8mLNEGXcyIwj5+oZ0XMcFfJp2Fx8u3QPvg/K5h/G7q/HyDmw+u1ycw4QHPuTNI6AW
         SG2PMupxxJ2vbRlnmvYqD5rOg5q6+MZycu/WDmQfaZOL/pwCdISNaxX9NOLaliBFAXXt
         Vsh72X/SBIdKrdxVWPAbTycyBhLhA056Co9aOHyoMX2zav+Ht2YrJdO9S05VXhfAVu6s
         X+mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xTOuBZgp5oGRq1fFxpY5iTn4vt5/2QQJ4TVRvKKsXyM=;
        b=r/hj1r4ZccRWExNdNEb5aUI0cmoOcAwnzhBXdFYUIyDcwfm3kJNEk3TnWeYCX2Nar+
         9VYIAi8+0pRaUKtXehYlS6oILi0bmTPZklZaw3UQj0k7fr+YQlZRQw+Pl8uWFKQ+aEe4
         QcQx28KcQ1Kv0VcNMUp9R3iWytHxEI5LsfwhiSr8Vg2ihLuVLOLIbb8nLYyDzpI4UlLH
         cASJ3IcUWdenEh1AXB/uz6fPRlQpS2D757Qd5yr1zSodQ7rSH5KY8PtOUuPKkatmS0kI
         ZTG2Hp1QS8J8xA1TiziJzVMMqke4y4mtyKROuftxai0Ml3muhcQbuyKQO0BUBafNsoI5
         5NLg==
X-Gm-Message-State: AOAM532lSv/hifI3HDRcoPcwBQj3zLQ/Bfadx8wrbellaxyo2LZRyyKy
	HXd1KX5QE87rTcCcZbxS/1hGrt/YozMKxQ==
X-Google-Smtp-Source: 
 ABdhPJzsTIW5rtX3F7/fzjKyjke7dw0gC3SBdw09pCxxByBQ+BNAAhv1QRyzN3l8bGfI4C6Y/qT6MQ==
X-Received: by 2002:a17:906:1913:: with SMTP id
 a19mr6970085eje.484.1637321684206;
        Fri, 19 Nov 2021 03:34:44 -0800 (PST)
Received: from localhost ([137.220.125.106])
        by smtp.gmail.com with ESMTPSA id
 e13sm1063540eje.95.2021.11.19.03.34.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Nov 2021 03:34:43 -0800 (PST)
From: luca.boccassi@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: paul.eggleton@microsoft.com
Subject: [PATCH v2 4/7] systemd: remove volatile-binds RDEPENDS for nativesdk
Date: Fri, 19 Nov 2021 11:34:26 +0000
Message-Id: <20211119113429.502652-4-luca.boccassi@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211119113429.502652-1-luca.boccassi@gmail.com>
References: <20211117123201.111905-1-luca.boccassi@gmail.com>
 <20211119113429.502652-1-luca.boccassi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Nov 2021 11:34:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158510

From: Luca Boccassi <luca.boccassi@microsoft.com>

Not needed for SDK binaries

Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
---
v2: remove dependency instead of adding nativesdk to volatile-binds

 meta/recipes-core/systemd/systemd_249.5.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd_249.5.bb b/meta/recipes-core/systemd/systemd_249.5.bb
index 9993036aac..2928a85c93 100644
--- a/meta/recipes-core/systemd/systemd_249.5.bb
+++ b/meta/recipes-core/systemd/systemd_249.5.bb
@@ -644,6 +644,7 @@ FILES:${PN}-dev += "${base_libdir}/security/*.la ${datadir}/dbus-1/interfaces/ $
 RDEPENDS:${PN} += "kmod dbus util-linux-mount util-linux-umount udev (= ${EXTENDPKGV}) systemd-udev-rules util-linux-agetty util-linux-fsck"
 RDEPENDS:${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'serial-getty-generator', '', 'systemd-serialgetty', d)}"
 RDEPENDS:${PN} += "volatile-binds"
+RDEPENDS_${PN}_remove_class-nativesdk = "volatile-binds"
 
 RRECOMMENDS:${PN} += "systemd-extra-utils \
                       udev-hwdb \
-- 
2.30.2


