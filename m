Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34915C77B7A
	for <webhook@archiver.kernel.org>; Fri, 26 May 2023 02:29:51 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web11.110.1685068189632772545
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 May 2023 19:29:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=AYFgkkJ/;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.181, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-5346d150972so221354a12.3
        for <openembedded-core@lists.openembedded.org>; Thu, 25 May 2023 19:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1685068188; x=1687660188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N217YmqVIndH3L25f/FEbbz4MlkkOrbmNuPmHVSjulk=;
        b=AYFgkkJ/11GfzbZYDVavngleUd8VESv0VDiyWeJaACDZ4yt0UCOadLnLNKacJHlw8g
         oRcp8UtcU6hLZtjlykqcunfKGkb28MQGCcHJW4hgId45QWjVDkEFK9n91c3Y7qu5yfMr
         JY32DK0CeYrTCF5xy5Rx0mR9S4WN6Ocw7uulrubTd7wIU9/ilgnHHz8ovHIji5qfmfFW
         6z7aXxPEYtttqDB3kFeCWBMoIUhidyJ30u+xV9bV5C+yprW5lRxTFSEPWj3IHq7nO/sb
         OjuuLVtP/+n0XCrAMQxI0D8/6rzPFtFAjwhUGPXqBla9nkTGG9ZGb0y8fLXB3jsfY3GU
         EvPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685068188; x=1687660188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N217YmqVIndH3L25f/FEbbz4MlkkOrbmNuPmHVSjulk=;
        b=eQcAVzuosDeYXUXablzK6LG8DxIlfhcB/7YzYqCfe5X148Hu72WMF+4gmUJG4JGNAq
         TzuRuP362IfjHOfMaF8kESX7aHPPmdaLFB6B5nm/Ili3SURAxRkO4JjsaxXa8h9jAW79
         TPMFllOpWKk6Mi0XemDiYyJYQ34jmZHS0UHCjQjF/WrvkWyeT3BUidaIz9pLQwmOUdXU
         4UZ8jgrbNDz2VkroNtFBIhjFq2CHWYZFl6MsLU8BdJN88MwX5nsePLYdLJmZJBvFkHhM
         3k/tAoeDGibpFCT91cKEvxE/76CdfMre3uyEgEyAhrPyMoE0XgV+kRgivXa5NiHDr3Y5
         44SA==
X-Gm-Message-State: AC+VfDyfvHN8X3QS7YNtiKLaWwZGyTSZ1RZMQUqXfi9J/CLY6zrpX0I8
	t/ld+VY/mCuLe0jSXgHwlCHvJaNQIhXP5agOXaU=
X-Google-Smtp-Source: ACHHUZ6fdzfpzHAwXDd+q9N85/7L5B0i/nUA2uihoLMo62UgotxstfsjB/BRj/xfAgHd4uOaosNYJw==
X-Received: by 2002:a17:902:7c89:b0:1ab:797:afbe with SMTP id y9-20020a1709027c8900b001ab0797afbemr940783pll.8.1685068188652;
        Thu, 25 May 2023 19:29:48 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id t13-20020a170902b20d00b0019ee045a2b3sm2023794plr.308.2023.05.25.19.29.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 May 2023 19:29:48 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 15/21] package_manager/ipk: fix config path generation in _create_custom_config()
Date: Thu, 25 May 2023 16:29:03 -1000
Message-Id: <4766ba017b7562e42b33fde7f2e84c2a339e3f4c.1685068004.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1685068004.git.steve@sakoman.com>
References: <cover.1685068004.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 May 2023 02:29:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181747

From: Enrico Jörns <ejo@pengutronix.de>

"sysconfdir" contains "/" by definition and thus using os.path.join()
leads to self.target_rootfs being always ignored (and thus attempting to
generate paths in host's /etc).

Use oe.path.join() instead which was made for this purpose.

Signed-off-by: Enrico Jorns <ejo@pengutronix.de>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8414c504138f6de663f5130c6b4a6ede5605d88b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oe/package_manager/ipk/__init__.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/package_manager/ipk/__init__.py b/meta/lib/oe/package_manager/ipk/__init__.py
index 9f60f3abcc..fd61340087 100644
--- a/meta/lib/oe/package_manager/ipk/__init__.py
+++ b/meta/lib/oe/package_manager/ipk/__init__.py
@@ -245,7 +245,7 @@ class OpkgPM(OpkgDpkgPM):
             """
             if (self.d.getVar('FEED_DEPLOYDIR_BASE_URI') or "") != "":
                 for arch in self.pkg_archs.split():
-                    cfg_file_name = os.path.join(self.target_rootfs,
+                    cfg_file_name = oe.path.join(self.target_rootfs,
                                                  self.d.getVar("sysconfdir"),
                                                  "opkg",
                                                  "local-%s-feed.conf" % arch)
-- 
2.34.1


