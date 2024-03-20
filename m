Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DBFAC6FD1F
	for <webhook@archiver.kernel.org>; Wed, 20 Mar 2024 16:44:44 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.50475.1710953078849756828
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Mar 2024 09:44:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Pm07wrvY;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6e6b5aa0b52so85960b3a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Mar 2024 09:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1710953078; x=1711557878; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LnRFFXoiKdWQt+YvhVzPR+AWzYwx1rrafxD9FTfzIOo=;
        b=Pm07wrvYr0SiWH54sv/XNQb1jisiaQsdVePRQaj6JsTCRdjfFES2ZjQwZnbzM2n8Ph
         EvmVvQZ0OPT6Pus4sVKZ5Z25eM+r2KETOip74E978OFl4Aj4GWMG36C6u7ss88XDbOsl
         HTyN/Wit2xTKqIGjf2WAO+XodPi66w/jVS2G+lAnn0jwmYl9dDAYNb4T3EmXsFHaxF9q
         OdwK0SwA1cQ4ExUWN/5TtJkiCasv5Yuw8NTP+vR9qQhoVqNrSUINhZJZmpMdUz9bUssd
         QNj6zc04uH1ZPQKPxUEenmzTQ3SxDTregjCiI+fjWIfkOOwhaCv3O0v7rn3VNk9EtbF1
         p2Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710953078; x=1711557878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LnRFFXoiKdWQt+YvhVzPR+AWzYwx1rrafxD9FTfzIOo=;
        b=s3Q90aoF1r4kKbpvVlO6WWJ491cwVLBvvf6gx5T4q2tmkDaAfPdBgXUgMBj+DSGEQT
         gpPucaDcBPj3LEYewTPA89x22n0mlmop6hC9w8e61VcpvaQxe6BB+iFtaaGrYyrQIovl
         BkQaaE0uUzoj+0rDdSRzUJ+GfOk8PRbpJ8TuMfQ1W0Hrp6avnCRkoEfMojb+KHDD6wlI
         3ebh+CFy1vQzGEZoRkSR9FteDocsIkkcj0IKSi49ElWgtKLo5CMRd3mtvynph9SMayLv
         5eg3C2LqoYC+i3Toabt0FhZuOi3Ooc+PYG7qFlVMhR0NHQFIIYUo2wADwotsEgwcVY6N
         3Jhg==
X-Gm-Message-State: AOJu0Yz4U/726DDA+8jiN10scr7jo4GsGVwFM4Cg9qb1T2jzhailJAvQ
	jN1MbA3cKQ4i3PqfsrVox9EIBKr99HslOzZfkWjPkQA2hz3ZDNuFD/MAmxMQ8n8OfymQziuNM2T
	0ZWU=
X-Google-Smtp-Source: AGHT+IFEctPCQJsHo6fD1mdP7+eSQx4dL59LHDrrMMp+kSSo55fje4vc5mBi94cXyJ3HzfO4IY0m5A==
X-Received: by 2002:a05:6a20:2450:b0:1a3:63a4:5332 with SMTP id t16-20020a056a20245000b001a363a45332mr9881096pzc.23.1710953078159;
        Wed, 20 Mar 2024 09:44:38 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id a3-20020a62d403000000b006e6bfff6085sm12725437pfh.143.2024.03.20.09.44.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Mar 2024 09:44:37 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 11/12] linux-firmware: upgrade 20231211 -> 20240220
Date: Wed, 20 Mar 2024 06:44:05 -1000
Message-Id: <c6e4ac2acf35fb2e477799e6faa1cc30feda44c3.1710952928.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1710952928.git.steve@sakoman.com>
References: <cover.1710952928.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Mar 2024 16:44:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197398

From: Alexander Kanavin <alex.kanavin@gmail.com>

License-Update: additional files

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit add81ef0299ea5260f9bdc59ffc8f5cc0e74276f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...{linux-firmware_20231211.bb => linux-firmware_20240220.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20231211.bb => linux-firmware_20240220.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20231211.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20240220.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20231211.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20240220.bb
index 3f201d853f..873ba9cdf0 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20231211.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20240220.bb
@@ -134,7 +134,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     "
 # WHENCE checksum is defined separately to ease overriding it if
 # class-devupstream is selected.
-WHENCE_CHKSUM  = "3113c4ea08e5171555f3bf49eceb5b07"
+WHENCE_CHKSUM  = "a344e6c28970fc7daafa81c10247aeb6"
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
 # so that the license files will be copied from fetched source
@@ -212,7 +212,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
 # Pin this to the 20220509 release, override this in local.conf
 SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
 
-SRC_URI[sha256sum] = "96af7e4b5eabd37869cdb3dcbb7ab36911106d39b76e799fa1caab16a9dbe8bb"
+SRC_URI[sha256sum] = "bf0f239dc0801e9d6bf5d5fb3e2f549575632cf4688f4348184199cb02c2bcd7"
 
 inherit allarch
 
-- 
2.34.1


