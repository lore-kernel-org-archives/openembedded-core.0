Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFC11C0502C
	for <webhook@archiver.kernel.org>; Wed, 31 Aug 2022 14:40:21 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web09.26484.1661956812267696694
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Aug 2022 07:40:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=ozjKuJtK;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id p185so14596518pfb.13
        for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Aug 2022 07:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=MinV2oaxQgpeKhixzvo7fwNRrurKqPR7g4QeYclSnHY=;
        b=ozjKuJtKXX/0HfWqUOrt5+IgbCQ3bjjYfFIUJORV14fs4EvPEHgweN1CJ9zXE3smq/
         jdxgwFtgBhJMJgVZy7txrs4skrrCw84DXAyVJm7rDjUIVPBy4Q5l8fop6OhCcv/V5UrS
         OtriIEexkZPPvdbqS1fG7j+VaUfFTSc7RHE9O90KBbzkeUkS1ySaCYVbyfifgf5MSdSK
         52cCTDBq+BOmqfRRDa2A1tt0sujmIDGhT5u80IdPKNZgPYr3qGP4twYZ4FkVt+AJCSiC
         AlT4CcAIclu9B24fTG4r4vKOV3jVMO8JYv0DanUnADK95ds9jLxitFdJW8R4L345H//M
         TkNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=MinV2oaxQgpeKhixzvo7fwNRrurKqPR7g4QeYclSnHY=;
        b=c/rpWyOgLgS6t/gRWmtK1dIhqTTH+eXEbHJ27ueK5HHYFFG9V8ppFJu92y8KdGFDXj
         WJRGm0ywss6mOPOJmC12Lgh1nwgvuP9G74VRbWAsKEu8WFYUup1Z1HvRp6BmhrHlyA3S
         ttfDqM9UFfJfTdPsLXR7cCT4QsdDaSwLXNSgj67UMz/yPcBQZM8hhmkEhTtU5MV80DTp
         AgdvYkDVG4EUr+Ilt5GxISTuzEucc8tyQJT6+oCjWWF2rsGA2mPll8Hrr9GuIwlCAqEo
         orrKpk8Q0XVQjZ3c6wxZfnLz0CNybt/+8aJHDcTRAb0baP5YNYKuRoogWVrfwj/9lVxA
         oFag==
X-Gm-Message-State: ACgBeo00Nwvi7l6+Ri5hEJJKiAnRqJMBdAomwDw+sT1Uf5QcnSnlj297
	6rWWyUlJ7Rd1SrPrN4yeaE0Y4egJCdWeRxYl
X-Google-Smtp-Source: 
 AA6agR4sEaT/slkDYy5VUeyeIIBymym8O8R3kBNjeJK7aqqikGc7zyWF4kK452g0HTtCgh3LqykEEQ==
X-Received: by 2002:a65:6491:0:b0:42a:c39a:e58e with SMTP id
 e17-20020a656491000000b0042ac39ae58emr21929116pgv.68.1661956811390;
        Wed, 31 Aug 2022 07:40:11 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 g5-20020a170902d1c500b00174d715cb76sm6070780plb.2.2022.08.31.07.40.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Aug 2022 07:40:10 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 09/19] shadow: Enable subid support
Date: Wed, 31 Aug 2022 04:39:29 -1000
Message-Id: 
 <5cdc9c1809ef169b8af7ce3085f316d1e68eb7ec.1661956484.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1661956484.git.steve@sakoman.com>
References: <cover.1661956484.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 Aug 2022 14:40:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170120

From: Andrei Gherzan <andrei.gherzan@huawei.com>

shadow utils are used when creating users at image creation time. The
useradd/usermod tools will only try to add a default configuration for
subid files if they exist.

Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/shadow/shadow.inc | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index f5fdf436f7..b3ae2b4874 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -149,6 +149,13 @@ do_install:append() {
 	# Handle link properly after rename, otherwise missing files would
 	# lead rpm failed dependencies.
 	ln -sf newgrp.${BPN} ${D}${bindir}/sg
+
+	# usermod requires the subuid/subgid files to be in place before being
+	# able to use the -v/-V flags otherwise it fails:
+	# usermod: /etc/subuid does not exist, you cannot use the flags -v or -V
+	install -d ${D}${sysconfdir}
+	touch ${D}${sysconfdir}/subuid
+	touch ${D}${sysconfdir}/subgid
 }
 
 PACKAGES =+ "${PN}-base"
-- 
2.25.1


