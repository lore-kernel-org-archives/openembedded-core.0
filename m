Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E306C4321E
	for <webhook@archiver.kernel.org>; Fri, 29 Apr 2022 16:02:09 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web12.12065.1651248126868929833
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 09:02:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=MCHebqpO;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.172,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f172.google.com with SMTP id k14so6892915pga.0
        for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 09:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=UY7nHmPrIehh0f1MGNkpCbyaFtjFZlob5BgS7C/dtbs=;
        b=MCHebqpOSpZRRKtbXovSNUIYIVHNWMjlxteF5OoM8ul7wy7axCW8PRs61lQk2JryPm
         HTWmTk+EDVlqkH24Uq7FYFNHgerd7gO73Us7ulcmNkL9qw0ql8OqSx9qnNOx97r8LeTd
         JkRkMSsXPZBv2ynXQE+qxs5Vzj5kCeP/yH5JPL8D4QQAqUDxMlsFjX+ni2ysUHrwX0Gv
         lTYxwKjqRzvObBhRdJllUV3uZ05clUVxMjR4eZpQ7pI0VYzeAFpfHZpwDqF5CC9whI+n
         b+xElYhSVUKPPW4EbSASyHq+E/0lgynkBr37SgCKFm2J+93XmqzAr53ZX8wyIVkiJt82
         sy5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UY7nHmPrIehh0f1MGNkpCbyaFtjFZlob5BgS7C/dtbs=;
        b=c85PZNoSvREeVkiFvlYYHD9mbeyiwqWv0QQ/eTscjmAVBRcMG/QUAfsYETicqIjitx
         SUQdbY0LBO6kC0XmzLvqYYCaWI/cSY49SSt0Eowm27A2Owp9lkn16FkddtXzrpxEIwzz
         wJLd1sIlTeJJoDBC//VBlnAZZNm4BsixJGJrJJ4Ss7ixJk0AxifrUJIkacF6ZYkZx0AQ
         E+6yy0+GX49XDafaXsAJds86hEgxNuwrNP2lO+fb3aExnEvrfUSsdV+jF0+h8ZHb8QYY
         nTDitB8M3b7wASh/aqlrqo+HhdCZuIfn28DIQSFlusMBgdsKiZXGeO41iSKUprQdpG2I
         xY7w==
X-Gm-Message-State: AOAM531USvhM4ivY/ZC5s7tC1DzGiHPjTmI9IbQFmo9tv5g5EWxJGvdk
	vcDv6gJ5r8Qe5g9uQuc+46dmq7YyatgoENYW4VU=
X-Google-Smtp-Source: 
 ABdhPJzZPpPLC+3ujNU0qBkCAVTFyCZs2fD4g5gNqChxjJ6HLhVcU4NshyKgCTUPGzpCtTLBZtvkAQ==
X-Received: by 2002:a63:2b97:0:b0:3aa:ffe8:b2da with SMTP id
 r145-20020a632b97000000b003aaffe8b2damr95403pgr.194.1651248125669;
        Fri, 29 Apr 2022 09:02:05 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 i3-20020a056a00224300b0050d32f838e1sm3486125pfu.21.2022.04.29.09.02.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Apr 2022 09:02:05 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 18/34] busybox: Use base_bindir instead of
 hardcoding /bin path
Date: Fri, 29 Apr 2022 06:00:37 -1000
Message-Id: 
 <592464cb64a8eedf2ee1537934ba714059c2e0ce.1651246310.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1651246310.git.steve@sakoman.com>
References: <cover.1651246310.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Apr 2022 16:02:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165037

From: Khem Raj <raj.khem@gmail.com>

This symlink is not valid when using usrmerge and ptest packaging would fail

Exception: FileExistsError: [Errno 17] File exists: '/usr/bin/busybox.suid' -> '/mnt/b/yoe/master/build/tmp/work/ppc64p9le-yoe-linux-musl/busybox/1.35.0-r0/package/usr/lib/busybox/ptest/bin/login'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 238fd30689054c7b44176dce7180fb6dac4e1b6f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/busybox/busybox.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 69fa499737..5f1c473d5e 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -347,7 +347,7 @@ do_install_ptest () {
         # These access the internet which is not guaranteed to work on machines running the tests
         rm -rf ${D}${PTEST_PATH}/testsuite/wget
 	sort ${B}/.config > ${D}${PTEST_PATH}/.config
-	ln -s /bin/busybox   ${D}${PTEST_PATH}/busybox
+	ln -s ${base_bindir}/busybox   ${D}${PTEST_PATH}/busybox
 }
 
 inherit update-alternatives
-- 
2.25.1


