Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77CD3CAC5B9
	for <webhook@archiver.kernel.org>; Thu, 25 Sep 2025 13:41:20 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web11.12038.1758807676940512841
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Sep 2025 06:41:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=xufk+5Sf;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-77f3405c38aso1054285b3a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Sep 2025 06:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1758807676; x=1759412476; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6ejfFBj/Bf1qM2dkwUeEzOGD+9veLwXdIuGw0pU5ouM=;
        b=xufk+5SfpMGxltZlhjqV6fusVVZUVmZ13vY7iwZsnHAIYSsrvQS1IA8QeqSIEU92WH
         AYuliNiu9QLq6hDpjj3Je0oRudKGlzVIvnn/bRHikMROV8pxvMCKMjNvgBvC3a9yUSq9
         Xdfo/JPSt+7LZU7KIxhdCJPi7pDtfk8Zldz/zbTzH5Wz6GNcfiaqyniJ0Rzro/xdBCmj
         6Jrz0s95EtusV9bWB1+PhIq2cj2xIYI+ravId34TH9VawpXUiyw8VKLgbXet3Ypadke0
         L4H5DXy7dVj7Gqr1/a+PIYYzm5XC9Pz5432efEU7tJI/6dQGph+jUj9RqxQv0lGQM+iS
         eOhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758807676; x=1759412476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6ejfFBj/Bf1qM2dkwUeEzOGD+9veLwXdIuGw0pU5ouM=;
        b=rPS949Cg1xlfkxiaguwab8ewQI/hFLk6M6I5FKDy44SpoGNX2VBo4+sZku4HGo17GX
         /qT4dN8jDoEAJarpKPnEBPp3Uoq3BhFMLxpuEgaz0Rew2CdOOYQZgC4IJSFoxnIW484c
         4eM5Qw9FTHxNZwc2RoBE09HFWYjXaSKtZHC8oywO7XYLuxl4F1o7O7Qm22xxSDt34Zi9
         XnVF2wt9aTBG2WVzssXQJHjA0eNFjDPpK9XDMYlTN1AuvnZbRYH16fe7bJei7+qHOVcQ
         QZY2nJNukLi7TGBcQc4hcdI2m65STLSuJ/7/WqhOGjhRsu1EcGwT5DfarLc8q4aMr1Jf
         qOSA==
X-Gm-Message-State: AOJu0Yybni+e+4LTnomj/GyFXjsmssDwu4W5KpTaHeNBQBamtGS1tCC9
	74hIHUGM4ARhHGZ/V4mYKv4jBTIyBLS88Rg/FMi3vbtFYZVlIR1PtWCElQM+WfjTVGFtoVF4pEc
	SNuGP
X-Gm-Gg: ASbGncuNMlklDHwPhoJUMWiaZP3x0MA6ofRe/NpnvgdHprjHgyl/FXjGhGekVX1D1e6
	IbyF8MqES46P72jRSTQcg82DC+ALyiVn+rabdwFAo81D6lvdwddgsjnZLqKr63u1kxonSCSA0ua
	bCJ/MMjsvO7dpZLu72u1ChdZjZvew9zOqeVhoWRNFyRK3x1ImydBVHvwawrIvYofumhdPIs9Rtz
	0kDes3ANLvKVZOoY60vNwdS0BuLspz5AjIJIUPQ4rdIKnw40J9zYRMORU41cDtJxgTfzfM5qT0A
	87hDkldeFTcx5ywhSGD8+RUuHRDO+DxdyuvrHr7rvEDytWFDExnccrauyl6Pcbiy+QUlhXdWRA3
	gYDAb5LA2pv+gaw==
X-Google-Smtp-Source: AGHT+IEvjCDWxJ2cukwe0cjykqDgmEvF6DKsPNCYtaMFplf1i7VgyH5N8+ti6X21lA1TUCiSLMAMeg==
X-Received: by 2002:a17:90b:33c7:b0:327:ba77:a47 with SMTP id 98e67ed59e1d1-3342a28b8a3mr4273710a91.15.1758807675518;
        Thu, 25 Sep 2025 06:41:15 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:127b:348d:dc99:9937])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3346e9eba87sm2430014a91.0.2025.09.25.06.41.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 06:41:15 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 08/11] shared-mime-info: Handle USE_NLS
Date: Thu, 25 Sep 2025 06:40:52 -0700
Message-ID: <49a9aebc0e9f668cf2896d0b522f8194bb4049ad.1758807463.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1758807463.git.steve@sakoman.com>
References: <cover.1758807463.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Sep 2025 13:41:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224026

From: Philip Lorenz <philip.lorenz@bmw.de>

Skip building of translations when NLS is disabled.

(From OE-Core rev: b58a3f4e9c78522423a94821b7ba7a35eb18f75a)

Signed-off-by: Philip Lorenz <philip.lorenz@bmw.de>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: AshishKumar Mishra <emailaddress.ashish@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../recipes-support/shared-mime-info/shared-mime-info_2.4.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb b/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb
index b8a377e2b2..52daccc977 100644
--- a/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb
+++ b/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb
@@ -17,7 +17,10 @@ S = "${WORKDIR}/git"
 
 inherit meson pkgconfig gettext python3native mime
 
-EXTRA_OEMESON = "-Dupdate-mimedb=true"
+EXTRA_OEMESON = " \
+                 -Dupdate-mimedb=true \
+                 -Dbuild-translations=${@'false' if d.getVar('USE_NLS') == 'no' else 'true'} \
+                "
 
 FILES:${PN} += "${datadir}/mime"
 FILES:${PN}-dev += "${datadir}/pkgconfig/shared-mime-info.pc ${datadir}/gettext/its"
-- 
2.43.0


