Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0824AC3DA40
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 14:37:39 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.214.1686926254663877589
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Jun 2023 07:37:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=Ei1CFHfQ;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1b4f95833c7so5348775ad.1
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 07:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1686926254; x=1689518254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mmq7eZ2YklufOA6q2AYuSL84XYkF/UaV9vFcbTUcRIY=;
        b=Ei1CFHfQT4hXvpJRUKP0/v6xxyLSMibtmYIQ/AZmu7JFvfX/APDSa0AptL+HHP8OrA
         Tixcb+lBv07xe0fJkIJHG9jwaZfRbdBq7aseSnkQDqxYjfHX41n++X2x8IVEOusacZDu
         mAQAt/MGd5LSvQwTW0M+JA9V4WhWV3gQJPtHgQE/OKwfLbkEEnwrqDnArg/SXDf11h7Z
         HMDhWjj1YrKxZbZXql+ULU7jrGDivKkxFXDuWa14v+EnxA9/4jHkhylC4J7aw5DNq2Vz
         qppxgfvwxyVMGjvC5tuKpxcd/IIgM3ZY6eSIh//B3yEfWufHsY3gOCZTPZw0dYXH5PX8
         phVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686926254; x=1689518254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mmq7eZ2YklufOA6q2AYuSL84XYkF/UaV9vFcbTUcRIY=;
        b=ijQGxkhNmgRHp9ZWfQxEUze998CAg31dfDn7Vg1nAZWi0atkQNGk6wR+rryd1E5Tj9
         oP8H34Igux3Nh80QTZ+2uLEui4WuXhY2AQp2f3QpPpy+oNz3Ti/MKi+2TbXg1qO6WP7H
         DPgHcLpVJjmtP346C7RPGJaLHCh635X9XjifkVT5Llb37UFK/i/bcSK8v6Had44/lwV7
         JhFUbSUZg6gXte+8tZ5FmVbHmy9Wp/J15pwA8B+GvGNQSGfb1/+uHxmxys0kVThNUTPk
         ChS6tED8kShoSOw1DMrqEpfurxBlRP7NLDoaeGLFcKNIQA8jhpgFAtFvaiS28jjHa/k8
         gQTg==
X-Gm-Message-State: AC+VfDwWJHoBOuaZi5AHr2PT0ai6l/NcVFFoLjdCqIeobG+m90tSTBy1
	y86/CG3rfXNzh1M7cFUNQQbI7QME/s5DDinaLa4=
X-Google-Smtp-Source: ACHHUZ5suKGIpAvFv2mGG+tnG0BA+DwQMAkB/4qiz6NSIYD52oPcZf8N0zc2UHUSlI3/eReio7aWKA==
X-Received: by 2002:a17:902:7443:b0:1b5:edd:e3c7 with SMTP id e3-20020a170902744300b001b50edde3c7mr1951994plt.16.1686926253589;
        Fri, 16 Jun 2023 07:37:33 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id k21-20020a170902761500b001b03f208323sm15865547pll.64.2023.06.16.07.37.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jun 2023 07:37:33 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 07/24] psmisc: Set ALTERNATIVE for pstree to resolve conflict with busybox
Date: Fri, 16 Jun 2023 04:36:58 -1000
Message-Id: <6071ff86edb1105ca470979ff691ba5910d7e2fc.1686925952.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1686925952.git.steve@sakoman.com>
References: <cover.1686925952.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 14:37:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183028

From: Frieder Schrempf <frieder.schrempf@kontron.de>

If pstree in busybox is enabled there is a conflict with pstree from
psmisc resulting in:

  do_rootfs: Postinstall scriptlets of ['busybox'] have failed. If
  the intention is to defer them to first boot, then please place
  them into pkg_postinst_ontarget:${PN} ().
  Deferring to first boot via 'exit 1' is no longer supported.

And more detailed in do_rootfs.log:

  update-alternatives: Error: not linking [...]/rootfs/usr/bin/pstree to /bin/busybox.nosuid since [...]/rootfs/usr/bin/pstree exists and is not a link

On order to fix this set ALTERNATIVE:pstree accordingly.

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit deb2176df76dcb16c0d90072ad63d308a0ab1158)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/psmisc/psmisc.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/psmisc/psmisc.inc b/meta/recipes-extended/psmisc/psmisc.inc
index a429c2ee96..23e98d21be 100644
--- a/meta/recipes-extended/psmisc/psmisc.inc
+++ b/meta/recipes-extended/psmisc/psmisc.inc
@@ -55,3 +55,5 @@ ALTERNATIVE_PRIORITY = "90"
 ALTERNATIVE:killall = "killall"
 
 ALTERNATIVE:fuser = "fuser"
+
+ALTERNATIVE:pstree = "pstree"
-- 
2.34.1


