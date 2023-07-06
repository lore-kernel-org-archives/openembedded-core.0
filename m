Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CED42C001B0
	for <webhook@archiver.kernel.org>; Thu,  6 Jul 2023 15:07:30 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.26520.1688656045335446475
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jul 2023 08:07:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=LoGBzPpP;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1b89bc52cd1so3279985ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 08:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1688656044; x=1691248044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=//86Hk2D8+l1YsM9s3WTgc6+my96cBgLgF0m7AwxLcE=;
        b=LoGBzPpPMP46e5G7T+YinR7QTpHTtr+mwTheTgGVG4fK5IkPM06wd7bnONJnJemNbX
         KJYWl9GEaBPZetVU4CvX+pQ8yH+5DzKZY/7XQzDkJa66XUSOt47O0RqVugsrdCV+lyoQ
         7fvg5lWODwigYwPDuyoZWQbi64gZuPaILz110Oi1Pv1JU8RXNreRavVFK6uJjdV05s1W
         Lo41HhnT86EK68RtiRbhw35w5VDT/2o2Z01hND/0mlmrJkr9OQpsMGVZkvW0FTx3OnU2
         13u4fSpfUPhw83z7Cb/EHacIgsCbvCY1SXqptPOr5rWPSTj5bd8F7wtpRBbR0ZL3uFcP
         1+Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688656044; x=1691248044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=//86Hk2D8+l1YsM9s3WTgc6+my96cBgLgF0m7AwxLcE=;
        b=Oo+PbWEsaoKpfgGBo1mw/Oj9H8xVZkpKp0/hN4zeQhtBXq2arF69Fg6aFP1kVzVUFI
         b2qUzcHFVGqFbZZZsyM25sz0XgKbX/hL/pYxbkBAOd4k5U1+Ywv63jsJlu3rlfV4XV67
         FT9j2ntaDSRVxdc+F16nWAeg6zUAZBAaiUEmWDM2/80ylCR0DaJ6G1PteHUC/emgb7qb
         jUPd27SrBn/8w3CG6FMR+8rXOAh20SJUQQMXBGfwrHSArHTc7RKgFiTkES9R6CQFhZEj
         NN8SVUNk81rv2uRK01FisgzmlmQbxhMhjCf1fnzUtma/rZNZC2G0Sp3u7cO3nQtWOPOi
         dHIA==
X-Gm-Message-State: ABy/qLbmIP5QksWxe/3Qe9m65R9bju/4qFoPI87wMka7hPgw7DllpeYn
	zrYOVv+FcIN66EG76gAr7jk7U7jIGx0mGf3qwJk=
X-Google-Smtp-Source: APBJJlFGIA+rt+dXdFQA7u+GfOuVK8krbJ4PBWB5+FpN6ZPoDPSk9PsP2o/yEvIKuRxUMAMN6YWyFw==
X-Received: by 2002:a17:903:2448:b0:1b8:9b1d:d7fa with SMTP id l8-20020a170903244800b001b89b1dd7famr1726098pls.59.1688656044388;
        Thu, 06 Jul 2023 08:07:24 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id jj7-20020a170903048700b001b3df3ae3f8sm1534159plb.281.2023.07.06.08.07.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 08:07:24 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 22/28] babeltrace2: Always use BFD linker when building tests with ld-is-lld distro feature
Date: Thu,  6 Jul 2023 05:06:25 -1000
Message-Id: <1c02416041498c649c517a9933ab736fca2ceae8.1688655871.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688655871.git.steve@sakoman.com>
References: <cover.1688655871.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 15:07:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183975

From: Khem Raj <raj.khem@gmail.com>

lld results in textrels in some .so used in tests, fixes

babeltrace2-ptest: ELF binary /usr/lib/babeltrace2/ptest/tests/lib/test-plugin-plugins/plugin-minimal.so has relocations in .text
babeltrace2-ptest: ELF binary /usr/lib/babeltrace2/ptest/tests/lib/test-plugin-plugins/plugin-sfs.so has relocations in .text [textrel]
ERROR: babeltrace2-2.0.5-r0 do_package_qa: QA Issue: babeltrace2: ELF binary /usr/lib/babeltrace2/plugins/babeltrace-plugin-ctf.so has relocations in .text
babeltrace2: ELF binary /usr/lib/babeltrace2/plugins/babeltrace-plugin-utils.so has relocations in .text
babeltrace2: ELF binary /usr/lib/babeltrace2/plugins/babeltrace-plugin-text.so has relocations in .text [textrel]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 18d443b53a0d76102fbbc1088fbcb3f8087a2b1b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/lttng/babeltrace2_2.0.5.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-kernel/lttng/babeltrace2_2.0.5.bb b/meta/recipes-kernel/lttng/babeltrace2_2.0.5.bb
index 146fe0b835..7ece3140f7 100644
--- a/meta/recipes-kernel/lttng/babeltrace2_2.0.5.bb
+++ b/meta/recipes-kernel/lttng/babeltrace2_2.0.5.bb
@@ -28,6 +28,7 @@ FILES:${PN}-staticdev += "${libdir}/babeltrace2/plugins/*.a"
 FILES:${PN} += "${libdir}/babeltrace2/plugins/*.so"
 
 ASNEEDED = ""
+LDFLAGS:append = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld ptest', ' -fuse-ld=bfd ', '', d)}"
 
 RDEPENDS:${PN}-ptest += "bash gawk python3"
 
-- 
2.34.1


