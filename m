Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57A1DD711AB
	for <webhook@archiver.kernel.org>; Wed, 20 Nov 2024 15:03:55 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web11.15554.1732115034258107108
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Nov 2024 07:03:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jg30oBML;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-539f84907caso2931182e87.3
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 07:03:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732115032; x=1732719832; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=isDlQn2u8cLdrLyd5qPtncSx+rzv9NF1WwV9MTS4kT0=;
        b=jg30oBMLT6crdVp12ACOZAPX781tfhU+l+3g2mPW0zoMDOf8dl0jXhaPsIetNkQKPl
         H80R1AaOusMQCvRUUS/Mb8m0FNJxfwbaaTcbB9Y+8qa3S35Tg0nHBDlZyTe5YxdRCbpj
         1hUhmuBa/LxNfy9T1F38l2EGMc+0oOakMPA5Yzvbrble9VlFpNcas75/AywbS1Oq7P5C
         sCQ1GgWTFFI9MhYKGuXAmNIR/ci0pK0HckfjBOHYicCrBnM/chxGKTQ5CR7KzHh+bSsI
         G5IpG+a0XRJXj4nGMUMBc+77ad9Ex7szqqyIz4oZpCfEuz00p708zOLZm/NwxMAg9DDk
         HYPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732115032; x=1732719832;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=isDlQn2u8cLdrLyd5qPtncSx+rzv9NF1WwV9MTS4kT0=;
        b=mX4ybOh9GcRDI8fhlVgIVD5ZGt9Jo1J2vlYVfICzt7cGaSTlyt/2cM9Y9DifzWQYko
         dpispWYrsFdpt3Y1FWggPfYfe3QPToFs3GfenwsFG6stfkuVDvNKBOUJIrdW2PNSCxcs
         cQQh45REc9UNlNaJSp7mTssvWf/cCsFOHR4xxSETWRXUvTqb/NChH9OV6GhL172BOgRz
         vmYH6vU5FyAhXAqs6pS2zzqUgolHJSu2h3RanAElmCsveHmfS+DxCHNDRgs7ZXZcsojw
         FPI1c9XxR3Uay+OgCtdxJqk7nj9kydANPWBspPepX1Xus88HUsDAPL4kO3x2SHxdZPGN
         Jq1g==
X-Gm-Message-State: AOJu0YwqDYjWdibNErX4d2k4QHPk3S/V7tzQ3sremKSyBG/w2+LaUV23
	dRWcE1ZRhcGr/TjwLeFJ2ZSTiPH9lVPY2RsXHy5VfxmigFooJbkXyFHefw==
X-Gm-Gg: ASbGncvEMsevUpEcc9UH///8tc4N7jd+nXjogdQAgxsAc8tYTYcgrtbk1i1VjTt3aob
	kNjg1p3+zdba6jTbpkhl6EGki+2A4ryD57PX012EN2cWcOAlmKU3/xP+UeokaOlay/1sV6BZ4RL
	yV3aN71K8V6fxvC1NIlEiKL2aDMYiNQnD3tIiFtOo7wmZdO4Y1T4Shz510yGWObc1vX9PzKRW2A
	2Jtxvyj1/AME48xmU2dYNibmqpihuVIUEci+g0/Yg35IRd6uqli8xTv+4hJb6kDdnl9zEIqF3yI
	QtLTmgQUd+Y=
X-Google-Smtp-Source: AGHT+IFcbcjhUXaZD1NKIt7VeyjZSyVJDaf+VGNlfovPlTyNq7s6b4+kTZxlhCG+h7A6pvvRU6gOLA==
X-Received: by 2002:a05:6512:3ca3:b0:53d:a34d:9faa with SMTP id 2adb3069b0e04-53dc136cf92mr1580129e87.45.1732115030369;
        Wed, 20 Nov 2024 07:03:50 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-433b01e1030sm21855025e9.7.2024.11.20.07.03.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 07:03:49 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/2] package_rpm: use zstd's default compression level
Date: Wed, 20 Nov 2024 16:03:45 +0100
Message-Id: <20241120150346.2279992-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 15:03:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207457

From: Alexander Kanavin <alex@linutronix.de>

zstd uses 3 by default, while 19 is the highest and slowest.
It's not clear why 19 was picked to begin with, possibly
I copy-pasted it from rpm's examples without thinking:
https://git.yoctoproject.org/poky/commit/?h=master-next&id=4a4d5f78a6962dda5f63e9891825c80a8a87bf66

This brings significant speedups in rpm's compression step:
for example compressing webkitgtk takes 11s instead of 36s.

The rpm size increases from 175648k to 234860k. I think it's
a worthy default tradeoff.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes-global/package_rpm.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-global/package_rpm.bbclass b/meta/classes-global/package_rpm.bbclass
index ddc4bf3a6a5..b2b7fafa177 100644
--- a/meta/classes-global/package_rpm.bbclass
+++ b/meta/classes-global/package_rpm.bbclass
@@ -10,7 +10,7 @@ IMAGE_PKGTYPE ?= "rpm"
 
 RPM = "rpm"
 RPMBUILD = "rpmbuild"
-RPMBUILD_COMPMODE ?= "${@'w19T%d.zstdio' % int(d.getVar('ZSTD_THREADS'))}"
+RPMBUILD_COMPMODE ?= "${@'w3T%d.zstdio' % int(d.getVar('ZSTD_THREADS'))}"
 
 PKGWRITEDIRRPM = "${WORKDIR}/deploy-rpms"
 
-- 
2.39.5


