Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D95C7C433EF
	for <webhook@archiver.kernel.org>; Sun,  3 Jul 2022 19:38:55 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web10.64482.1656877123909976958
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Jul 2022 12:38:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=Q7p8/Hts;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id a15so646294pjs.0
        for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Jul 2022 12:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=zKH3jrxofuB7b9cJgCc3rnHoiLmsjFB7I2njRCoarls=;
        b=Q7p8/Hts+LCCI1SAVH4EGQYQYbG93fsN1Oj9ZdY13diqP8v3MhYTlQkMkyVzMhriNG
         l4G4MRYWOXIqD8Snk6gxk93FTXkceBVSvreWilgOvDj+BRXClII7nJKso1VzOX32Xdkj
         FEuVRYjp7rPdDyp7y9/ialKOBD+HruzR1xb8FL0xRM4pXzx8xVVY+PT98mnfz68DrdYP
         ms7PBvohpVC+Szo1abeh2jhNWJ1wo4I7KahmaUeJjXrwb5VZGjfM7kzYXbfajI7Jl65o
         tEPRcnvnnaoBg6RH36WBuKIzxGDe+6zXDZfGaKmO0XQBjnzZTDyvsGQetaJUU55CZMLp
         nfHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zKH3jrxofuB7b9cJgCc3rnHoiLmsjFB7I2njRCoarls=;
        b=tH7pOaO3W3DYuZoeOyMLCnZsofH1iQAzXa40J88aHqWwHVxFSBY3fiRGC95Fc12rok
         fepH87UfihXEVy/mlcBz+b8kWo8w66Q/esrM77x5wKZeUaeZPDe21zdtu5HQXc7kco28
         j4iUCXtVXBs0iJ3Uo5ZbO/QYrbR5GYBihTvYO35eGCzaVGR0AsBiM6I/UG4QBsts2IKQ
         ocvkrAB7/Qh9XCq/2gXDayvoUD/zu4cGHZhUjR+PZTJ+VAGz8IFJ2MgW8Xd9BivvlNLP
         cn/vrQ0UaYeQ1u/nR85KjVcLvp9bFahsnl8xBQQldlRszL00e+syep1ql/HUFJl+4A3Z
         mMgg==
X-Gm-Message-State: AJIora/+WcXSy5IHGexEWYnjQD/1Q+03bPBcaFTDwrBSGPFbmvVrNqmq
	XxJN7H4jUBKqvO3rBN56cYB2kNyqZfBSb5gx
X-Google-Smtp-Source: 
 AGRyM1s+U3p1RyOFkdiSxCoSSAIJVB4M8qYG0MSPzI68/JFxbDxdzTRDMdPbvVqPdWI0orGhTJ3cIw==
X-Received: by 2002:a17:90b:4d07:b0:1ef:521c:f051 with SMTP id
 mw7-20020a17090b4d0700b001ef521cf051mr19057428pjb.164.1656877122966;
        Sun, 03 Jul 2022 12:38:42 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 d4-20020a170902654400b00168aed83c63sm19441739pln.237.2022.07.03.12.38.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Jul 2022 12:38:41 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 29/30] openssh: break dependency on base package
 for -dev package
Date: Sun,  3 Jul 2022 09:36:04 -1000
Message-Id: 
 <f90647e9dd95cfd29b5bdb8d7dcd688a10fc060c.1656876825.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1656876825.git.steve@sakoman.com>
References: <cover.1656876825.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 03 Jul 2022 19:38:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167589

Otherwise the SDK fails to build as the main openssh and dropbear packages
conflict with each other

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-connectivity/openssh/openssh_8.9p1.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-connectivity/openssh/openssh_8.9p1.bb b/meta/recipes-connectivity/openssh/openssh_8.9p1.bb
index f306b1245a..a3a0016ce5 100644
--- a/meta/recipes-connectivity/openssh/openssh_8.9p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_8.9p1.bb
@@ -166,6 +166,11 @@ RRECOMMENDS:${PN}-sshd:append:class-target = "\
     ${@bb.utils.filter('PACKAGECONFIG', 'rng-tools', d)} \
 "
 
+# break dependency on base package for -dev package
+# otherwise SDK fails to build as the main openssh and dropbear packages
+# conflict with each other
+RDEPENDS:${PN}-dev = ""
+
 # gdb would make attach-ptrace test pass rather than skip but not worth the build dependencies
 RDEPENDS:${PN}-ptest += "${PN}-sftp ${PN}-misc ${PN}-sftp-server make sed sudo coreutils"
 
-- 
2.25.1


