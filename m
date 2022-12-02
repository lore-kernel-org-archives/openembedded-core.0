Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14F9AC47088
	for <webhook@archiver.kernel.org>; Fri,  2 Dec 2022 16:37:53 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web10.80460.1669999069491293052
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Dec 2022 08:37:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LY8X9KdE;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id s5so7136041edc.12
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Dec 2022 08:37:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I+xhp0tuF2EgnO3+4n7v1ayOYTJ/prUIuRv2JJywfrM=;
        b=LY8X9KdEck/n8PMYnv8+5bzlJHO4toyiADtZDWQk/fwL//rrS/1X1054auF7FI7bMi
         IOrj6dOzWIM+8TMfr3HlMqLT7rNWYRejCs23GifR9O6Z6vdV2vPdUuyXUV4iirzby3lo
         GkdeyMuMQ6xiw9pkYSpI7qDAnqNksFhbgBlyUIQuvCp60vmKs7UvTm12Ir+sEk+U4IjS
         bTlqAYvhraoW0IrJXbno4Kul7Cx5MyMw3t11XvPwBGg/qT1G82eXxCfxHbLA1+HdC+h0
         kWeA3vMXwwRUW/JcrJdrhwpua+uTSvVCSX0euw/2i9+ps9Zf99/Wo2b4HhQoSoHEJZt9
         NOSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I+xhp0tuF2EgnO3+4n7v1ayOYTJ/prUIuRv2JJywfrM=;
        b=f9UtGIU7w31vNWJpUb6w1fmIr6g3eg81wo9yqrNr7YWIXOUUEMQdH71Anv8M0oGx1d
         dJnECiRN7ba0nBazKjMtyclOLX7d41o7HrCsBMQLuTMw6QMG2YlYFYM9JedVP36vcvOq
         ZsRvwiYfDB8OlFzKrYVmG6yunFAT6Z2fL/7Ntmv5whZaa8T7JAuNGEGiMK+v8EEXy0HD
         WBES8b6uu0B0P0skkHkuFfbUQ011SZ+P94AerXk6f0Jis56hFNRBvTgEpkt/3qoIRHME
         RVMzLr25WcY2oKhm+ohJZaDn9icdhCqnFJEgHP9SNqBIWZalHh65gXnMGBViA8hWpuAY
         xo1Q==
X-Gm-Message-State: ANoB5pntU+M9+OAZd+yuPB71u/7IovRssVa2qZetq3psmDSG9/jqE/MM
	Nsd+IKrNbBqvvdHbV3sn6QHkiVmKwTY=
X-Google-Smtp-Source: AA0mqf4Zgh6iW7iMdJ/GEpCTy8mfSWgrkWZIh+bmtnzjZsZMvNGURzP9HIMdRVVKY+zsN4V7BQCRlA==
X-Received: by 2002:aa7:d8d5:0:b0:46b:4156:76d2 with SMTP id k21-20020aa7d8d5000000b0046b415676d2mr21051214eds.224.1669999067936;
        Fri, 02 Dec 2022 08:37:47 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id kj22-20020a170907765600b007c090da9eb4sm3244340ejc.82.2022.12.02.08.37.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 08:37:47 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/4] glibc-tests: correctly pull in the actual tests when installing -ptest package
Date: Fri,  2 Dec 2022 17:37:37 +0100
Message-Id: <20221202163739.1194505-2-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221202163739.1194505-1-alex@linutronix.de>
References: <20221202163739.1194505-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Dec 2022 16:37:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174241

The tests are packaged into the main glibc-tests package which is fine,
but then glibc-tests-ptest package needs to depend on that.
Which is what this commit addresses.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-core/glibc/glibc-tests_2.36.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-tests_2.36.bb b/meta/recipes-core/glibc/glibc-tests_2.36.bb
index c71c0831c6..bb6ef06162 100644
--- a/meta/recipes-core/glibc/glibc-tests_2.36.bb
+++ b/meta/recipes-core/glibc/glibc-tests_2.36.bb
@@ -16,7 +16,6 @@ python __anonymous() {
        d.setVar("PACKAGES", "${PN} ${PN}-ptest")
 
        d.setVar("PROVIDES", "${PN} ${PN}-ptest")
-       d.setVar("RPROVIDES", "${PN} ${PN}-ptest")
 
        bbclassextend = d.getVar("BBCLASSEXTEND").replace("nativesdk", "").strip()
        d.setVar("BBCLASSEXTEND", bbclassextend)
@@ -29,6 +28,7 @@ python __anonymous() {
 RPROVIDES:${PN} = "${PN}"
 RRECOMMENDS:${PN} = ""
 RDEPENDS:${PN} = " glibc sed"
+RDEPENDS:${PN}-ptest = "${PN}"
 DEPENDS += "sed"
 
 export oe_srcdir="${exec_prefix}/src/debug/glibc/${PV}/"
-- 
2.30.2


