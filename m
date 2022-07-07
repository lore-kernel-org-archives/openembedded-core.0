Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40507CCA480
	for <webhook@archiver.kernel.org>; Thu,  7 Jul 2022 22:00:31 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web10.731.1657231203162167088
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jul 2022 15:00:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=KiewHovP;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.176,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f176.google.com with SMTP id 145so20774875pga.12
        for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jul 2022 15:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=l05alUE6OBuaqFb8eOM99ok+UDrkOqXk8zSXmKjbXrc=;
        b=KiewHovPZq4Ss+7alPlA0Wenm7Lo/2rYcrCSPiBuicEmmGjtyWzH+5t1hdDBDEEAU1
         8lnbl1UdsbYCoM57ZEluXcb9Nb5avHSxs5RCfZ9zvXDLsr5AfA775ZJ6wBj1YyHcWbFA
         f1MZffaFsWJQwHzCfo109nVGNGbXZmDT7l13tQxz+YIB5W+GOF9EUW0Ffm/5D7/pglfB
         iB78OI4HR6HdsmMUYf993XQHi69Uy3eMaUDmcI/pSEc8I/6ZRCxf6W2uhgGBDqwn/6fu
         hOFAQyjic6J/vMWEHE4WEOsYxKcJFZHeEx5TvSpw0d1bk9QT0tYrkbzOL7KLenHj67LQ
         JBJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=l05alUE6OBuaqFb8eOM99ok+UDrkOqXk8zSXmKjbXrc=;
        b=3wM7bYl/R5XQh/mU8I8sgHMh3cxB9Xrc6hf1AvAf2erivNFSaxpK8csKd33aCM+z36
         Hsp2gY2CcZy4nD2Dh87KWKZsq8nmT991egXk1zxNEPIP+0yTBD2RYXTO4ev94+CbSmbp
         ljGlA3gBwGQYhz9ZrF5zyFLWYmsDEeYmS1fnIpJDbkOpehhGvCSzxKsPkK8PsjzpQFMg
         1+WwZWsvcOgk8jgf676+k0aKhqKo6JRVOvnqO/NjO3aFwegPiWm++UKAbg89eJf8Ey47
         c7tsVT5ozGRXXJma8AaeR932fRR85ETlxANg3OPevr88R6mBvdB8Gzg3gEMbFmWFkv3I
         OwFQ==
X-Gm-Message-State: AJIora+CyGapXPaad77vyLSCS34T5VbHIrdfbpK32L+eARoKzouo6H1r
	dHmuX+ku7QrhW13GLjgiz4LsZ45vl8ZJUb4+
X-Google-Smtp-Source: 
 AGRyM1vVD2UePQ4nJuplMIz/g2L8p5pcd96ldkDtr7uzWNeZCAIocL7+ZEBbMOrDU74QyWjYW9vpXg==
X-Received: by 2002:aa7:9892:0:b0:528:a45b:98b9 with SMTP id
 r18-20020aa79892000000b00528a45b98b9mr337392pfl.37.1657231224130;
        Thu, 07 Jul 2022 15:00:24 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 j1-20020a17090a31c100b001ef79eb5033sm56840pjf.11.2022.07.07.15.00.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jul 2022 15:00:23 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 11/14] openssh: break dependency on base package
 for -dev package
Date: Thu,  7 Jul 2022 11:59:33 -1000
Message-Id: 
 <e863fc060940d11cd6fd58f0f314333ed419cf54.1657231055.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1657231055.git.steve@sakoman.com>
References: <cover.1657231055.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Jul 2022 22:00:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167809

Otherwise the SDK fails to build as the main openssh and dropbear packages
conflict with each other

Signed-off-by: Steve Sakoman <steve@sakoman.com>
(cherry picked from commit f90647e9dd95cfd29b5bdb8d7dcd688a10fc060c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-connectivity/openssh/openssh_8.2p1.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-connectivity/openssh/openssh_8.2p1.bb b/meta/recipes-connectivity/openssh/openssh_8.2p1.bb
index eaec26cac0..c529d1d060 100644
--- a/meta/recipes-connectivity/openssh/openssh_8.2p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_8.2p1.bb
@@ -196,6 +196,11 @@ RRECOMMENDS_${PN}-sshd_append_class-target = "\
     ${@bb.utils.filter('PACKAGECONFIG', 'rng-tools', d)} \
 "
 
+# break dependency on base package for -dev package
+# otherwise SDK fails to build as the main openssh and dropbear packages
+# conflict with each other
+RDEPENDS:${PN}-dev = ""
+
 # gdb would make attach-ptrace test pass rather than skip but not worth the build dependencies
 RDEPENDS_${PN}-ptest += "${PN}-sftp ${PN}-misc ${PN}-sftp-server make sed sudo coreutils"
 
-- 
2.25.1


