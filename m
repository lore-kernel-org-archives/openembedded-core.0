Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FB6BC8300C
	for <webhook@archiver.kernel.org>; Fri,  9 Jun 2023 16:54:46 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.164.1686329681097730276
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Jun 2023 09:54:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=FA0gXLoO;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-65055aa4ed7so1671281b3a.3
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Jun 2023 09:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1686329680; x=1688921680;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=29meFdTFUMQq1hkbK1p45r7FNy00GPkSuNYusLB8qCE=;
        b=FA0gXLoORtiRXzHod43i6CuiOGqCkBIERrtOLr4Fy9CqP3fzSSA6qRjsPivyLKG8s5
         2eKDLY4Ex6BXBGu32b7bjrdHZ68san4VAMxrXVuEBQ0IkuHBkVHmJNtZ5rflok/eRSMH
         eiWrAcsm9mlxxPvjx0ZgrFAIosW/xhAKiHh4RM9j5DQDoFhxcCxWzkHXjFN7FLDLKj41
         hzWZchdX+drhIBbAK411WjOMFw+lBlrr8AHqkih5NWMmU6T+XDuYEBZkF9M8h10UdR1+
         rUSyQqCsSyvAukioPN8iSgd2QpOgPF2uNlgomQGX2Z7YZcO7FOgFfMmBrO2tDV5p4913
         +6hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686329680; x=1688921680;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=29meFdTFUMQq1hkbK1p45r7FNy00GPkSuNYusLB8qCE=;
        b=N9ls8gNVnx3HdTcf2PiI6peEbbOAvkPYs1Dmf5aZW5dSrHf77qcvgXot7pOJWj05L9
         cigWq5oJ2CWKWfAoSukeSa5xE0dIBwxd55ueLb8b756ITV73zJPgBkzrVUZKEFqF0d5e
         LPGAUqpjjv3rotN5Iep+6GBAAIz1e9hv+7+d7Cnq6RF4r0+LfGC9Pu7Vi94KPy6O1VLz
         jN2OdmYYbYYqd692PNxmgM2Smr6PRY9Y33jJZ9YcrIdF3TVWfxVAAsHCUUnzfLAibQJ8
         4C5ov9kO/Q1WXvTWwPG9UtDKLD70w4BmsihmyJl9y14/P5yWkMxHnrIRIVTvMsX7BsFz
         +f5g==
X-Gm-Message-State: AC+VfDxeZwY8lA5rHoc+eqhHo57Q2tz7UOHsQGSClgBsTiP2He+e4v6l
	v8ACtYH9rB89PgmBCs0hfVCt24miPJpd3VwSZ8Y=
X-Google-Smtp-Source: ACHHUZ4qrhnaEpx0pvSRlU0B6Z7kA2I2Fwn2adaa01DCc71ACZmbRPRZyXYTwtCwKebabFas3xWq3Q==
X-Received: by 2002:a05:6a00:2385:b0:64d:5864:c052 with SMTP id f5-20020a056a00238500b0064d5864c052mr1769330pfc.28.1686329680153;
        Fri, 09 Jun 2023 09:54:40 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id j24-20020a62b618000000b0065980654baasm2901071pff.130.2023.06.09.09.54.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 09:54:39 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 22/30] musl: Correct SRC_URI
Date: Fri,  9 Jun 2023 06:53:49 -1000
Message-Id: <bb3c35309e23121dfc9b0f2f06d31f38554a3820.1686329289.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1686329289.git.steve@sakoman.com>
References: <cover.1686329289.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Jun 2023 16:54:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182588

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

When the protocol used to fetch the Git repository was changed from
"git" to "https" in commit 139102a73d (recipes: Default to https git
protocol where possible), the URI was not updated to match.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0434a5ae168f737741e66a7fe1e30a8703b8ce16)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/musl/musl_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 3b0dd53c73..8b9642dda1 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -12,7 +12,7 @@ PV = "${BASEVER}+git${SRCPV}"
 
 # mirror is at git://github.com/kraj/musl.git
 
-SRC_URI = "git://git.musl-libc.org/musl;branch=master;protocol=https \
+SRC_URI = "git://git.musl-libc.org/git/musl;branch=master;protocol=https \
            file://0001-Make-dynamic-linker-a-relative-symlink-to-libc.patch \
            file://0002-ldso-Use-syslibdir-and-libdir-as-default-pathes-to-l.patch \
           "
-- 
2.34.1


