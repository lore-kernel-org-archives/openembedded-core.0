Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08B7FC3DA79
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 19:21:34 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web11.143551.1671132072200312332
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Dec 2022 11:21:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=FWDxYIb1;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id 3-20020a17090a098300b00219041dcbe9so108873pjo.3
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 11:21:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tVSLlVH3TIEtMRaYg65VjiHwaGvWDcY0V7egBGjSWuE=;
        b=FWDxYIb1vdw69o7Lvs3K5UyIISmGu9MJNSNh++c9tfjCThaRAl/Yk8DTwr4Hug1LhZ
         m/VS4SEfhvPzuutVTrDmOccehePaQe772n08g8gRwzRgCv9KKOVnENdavu8DiSIX8XP1
         viiwaBd7I5qZomNeJnp5ilcLWzA7kJoBR7NCxFhx57DHcpkbYrISCcA2DybPvm4kXLN/
         uAHqmbv5Q1L0U5H3TPhrsJrD+yS/eigS2VRNmXY5q926zhHxLzk8HUbWN0DrVmQwx95U
         wnxEZNoPi/BYzaO7W0QRiEUD8nc6qbTZqiZRSEu1OuD0Zt3feybSaXkNsTgMfPFdHTvC
         C6+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tVSLlVH3TIEtMRaYg65VjiHwaGvWDcY0V7egBGjSWuE=;
        b=WdIwqPQ5scW6VGCY2p5HkgSesKRM4qZkgHEGu9xi2PP4w/0xmtRUQN8S/v+ZErs3+7
         EQvicOvLPg5VoWrZWIX39l8oNrsxTirXT5wlh4hw537NJ11Cik3QS6WpExCcX2/Jgje7
         Juo6u4FqoxdjA1GIiM5HhGbMdMQsiTnxO7lCH+Fa9nPEXEWUFq+UWgG13Vu3/LG4/FSO
         gEbVLLLf/6mKgV8RkOte0dF7KbmsmE6DHcpriiE//XV9GasJorJfCGxUzXKsUs0/zzKM
         MMOEMZ8qpOG3Pk8EiuX9JDtPRZP7TtFbLkPrfl0nGlcsc5YQ8iNuyALhESTvzEgHnXQm
         ci2Q==
X-Gm-Message-State: ANoB5pkh8wNfD2zd4Mk81qx3Gj0l3oVViJPEJHd4UiFWrcNAZt0IQaXC
	3MzFPOfjWnqq20atRwjOsB2HCaZK/ksSdoi7/XQ=
X-Google-Smtp-Source: AA0mqf5dffBZXiqHEcI3R+c0qqRzAQzLRZeijWXbHWQAYhIRXhMs8fdHmPzz8EyXEz70UI6fNUOqXw==
X-Received: by 2002:a17:902:7c8a:b0:189:ed86:178b with SMTP id y10-20020a1709027c8a00b00189ed86178bmr37111908pll.64.1671132084389;
        Thu, 15 Dec 2022 11:21:24 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id r19-20020a170902c61300b001869b988d93sm4167095plr.187.2022.12.15.11.21.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Dec 2022 11:21:24 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 13/30] glibc-tests: correctly pull in the actual tests when installing -ptest package
Date: Thu, 15 Dec 2022 09:20:37 -1000
Message-Id: <b1e15df2572da59d6063e5e2a52e978efa552abe.1671122751.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1671122751.git.steve@sakoman.com>
References: <cover.1671122751.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 19:21:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174605

From: Alexander Kanavin <alex.kanavin@gmail.com>

The tests are packaged into the main glibc-tests package which is fine,
but then glibc-tests-ptest package needs to depend on that.
Which is what this commit addresses.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit d37c2d428b09b9d0cbb875f083c6a1e9883a7fed)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.25.1


