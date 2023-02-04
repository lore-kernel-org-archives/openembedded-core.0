Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40F7DC636CC
	for <webhook@archiver.kernel.org>; Sat,  4 Feb 2023 21:49:13 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web10.16706.1675547349426592738
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Feb 2023 13:49:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=Qu+2XgjR;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.53, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f53.google.com with SMTP id cl23-20020a17090af69700b0022c745bfdc3so7998661pjb.3
        for <openembedded-core@lists.openembedded.org>; Sat, 04 Feb 2023 13:49:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GZxKh9VLbv8uO6mU4me+jvMm5lyxGm8tjgTeU5ehDJ4=;
        b=Qu+2XgjRTGtEu8nKJAK+gYYW/+RvmxHmcVBrV27t4n0OUy6/SrsDvuAJLDdGIA4pLo
         8sPg2EVEpsTuQhuvwyQnaSz0k0zFA6R7/T1OcGk6DFioryL9yDuY/vB5pfuOzIj/O4fM
         9SppRmmpEzFx1baLB+EiFcPDor1clAHw/+syXWEljnviplVxJQdSp1t+1fIwdjcAdKe1
         idOVcyuJTu/7s9tnDdCAou4ruhtM9Eo+QrUsRl0sSwG8vcmswpk2JBgePhpjfbYH7meR
         hlOS1apJDY+d/ukesSyATrjat/SJ1NjCeC+S7cCzpSHUxNkqNwx/EetPK4mPLEHOgl+J
         TQCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GZxKh9VLbv8uO6mU4me+jvMm5lyxGm8tjgTeU5ehDJ4=;
        b=bBt6fM4DesakCc6EGGRBJnPVRlUcmS1IzFfAOdio2ofx9TcQ7DdbXMckzhiGetGqJe
         7+dIozMoKIDggoXSLT00RXDd8nT58RO7925wpRsqJx96BcPL23V6FM8CaJNdMP4l0J9p
         P1yoroj6TCy83Aryh+ZBWl+ZCfbjYYlWka+S8VBZHXXcKytugBDfLDCfsFWmuodCHIme
         KljZVFf73Ct10cMAkuYcfCz64B41yiLnxGq/sosLitIhS808fh+U1twKnDvD4Hf4djzi
         TlujMUUbwWfoelzfchAYW3FekwzpMB43qVIYVCYucPq3Q9j6ONQjkUOUfkUxqKfftooV
         erBg==
X-Gm-Message-State: AO0yUKXXJKct0bovPiL4+jbwMw2HgoKichLg7+xK4JZQ6g3wO9JTphZL
	CFqb/iXlXi17DUwGk2QCEawoUkAJuwnzRxZvsuc=
X-Google-Smtp-Source: AK7set+DRB0JreIyWSRYlRtKY8lCPrKAJ6Vzd3hCTtoDQs4yqpMzEHSdpaGcsdOsFdIS4UNfH2M8VQ==
X-Received: by 2002:a17:902:d481:b0:196:1a56:b1d3 with SMTP id c1-20020a170902d48100b001961a56b1d3mr16927902plg.11.1675547348524;
        Sat, 04 Feb 2023 13:49:08 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id h4-20020a056a001a4400b00590774b9ea1sm4150960pfv.107.2023.02.04.13.49.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Feb 2023 13:49:08 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 11/12] libtirpc: Check if file exists before operating on it
Date: Sat,  4 Feb 2023 11:48:37 -1000
Message-Id: <a764e19736f24b8bf67ea87d58dd74652d6d81c9.1675547139.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1675547139.git.steve@sakoman.com>
References: <cover.1675547139.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Feb 2023 21:49:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176779

From: Khem Raj <raj.khem@gmail.com>

In some cases (e.g. mingw) this file may not be installed

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 547f3a13ee9268bbdd439c96108ba1fe9ab78873)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb b/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb
index fe4e30e61f..80151ff83a 100644
--- a/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb
+++ b/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb
@@ -22,7 +22,7 @@ inherit autotools pkgconfig
 EXTRA_OECONF = "--disable-gssapi"
 
 do_install_append() {
-	chown root:root ${D}${sysconfdir}/netconfig
+	test -e ${D}${sysconfdir}/netconfig && chown root:root ${D}${sysconfdir}/netconfig
 }
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1


