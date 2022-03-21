Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B0CCC433F5
	for <webhook@archiver.kernel.org>; Mon, 21 Mar 2022 22:29:51 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web09.2520.1647901791066067553
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Mar 2022 15:29:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=PGlO6RND;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id t5so16721187pfg.4
        for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Mar 2022 15:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=1dRDLPr6Xos85btpXI/abzPUvBs30tu5wuy75sKAhH4=;
        b=PGlO6RNDkVg7RJuEsz9b+CC81OxtteyiMCzsIlzdNq0J8jHbrObBpifvambEd9mweo
         j5SY6yimZ2xivaqlz0L3SnJYgPGxBKHffP/4qKrsOdmEO4AnvxOyykxd3KvVeGwLbtN3
         HRm6Ow3nOvqLND+EstpUcBjMIn0oLFm+ngDZfqO/rNAy6qvu+02gu8uU/4ZsRsxtzCFJ
         EaWU5nlH7L2GNim2FSYD6zzKacnPHkGnVATRJ5ZOi6an8881IlEJQg6L0jSzdezYIDMH
         /X0S2fxOXEEx1jSNJjO0+CLAo+tzdDkWr41pH77SR7IVtL+DDSCg/nYTc/2/fxJmqphs
         Pz6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1dRDLPr6Xos85btpXI/abzPUvBs30tu5wuy75sKAhH4=;
        b=U9A+VDCRvc2zPetAs+AIPKWvGilRlSknSxszDjzREbYqL86Zw2FgOIjZeRM9ikPiGd
         3JXleihxDygN7Fzrp5nnXsIF/jjcqSYJbbVuhMb/wD/eIkVQiOFUY3KixqwwtdKu5jiG
         btoQs0pJDkuSt2N23HA/cu/KRQt4eIPEBmA8c0y58Fzwqr4TnpV92hlMRT7+yul76Nh5
         XYMfgEfXnIpEqtYmnQr1JuRlHiqYUeUtvfG3Ve9a633rccGWNCJb36WSZ+/t7DVTf4g6
         VQdeqvxBCIymm0y6e2UITGq/8mAhyq1xDOSpTKrjrHhBPKjplulMriO8DHEyOZts/pFy
         fBFg==
X-Gm-Message-State: AOAM532RTEVzQFiHsPDQM4cQ0iOyRIfJop7E/YRD9XUWlALY4xLsqnDT
	4unQsUUN7lC6JIgjcCg1bPEbA/p8BgSl163UdCU=
X-Google-Smtp-Source: 
 ABdhPJzqsL7uuvpzEo9PjMs+s2DDuniYH711xRihGO7igQPsvMcP/DS9cXHKNo6axAjy3IbEeOrwog==
X-Received: by 2002:a65:604a:0:b0:375:5cc8:7458 with SMTP id
 a10-20020a65604a000000b003755cc87458mr19969888pgp.205.1647901789986;
        Mon, 21 Mar 2022 15:29:49 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 k13-20020aa7820d000000b004fa72a52040sm12352649pfi.172.2022.03.21.15.29.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Mar 2022 15:29:49 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 11/13] python3targetconfig: Use for nativesdk too
Date: Mon, 21 Mar 2022 12:29:11 -1000
Message-Id: 
 <e997487c0068bfe4017fc98c4fa5b51f660a1b4e.1647901591.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1647901591.git.steve@sakoman.com>
References: <cover.1647901591.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Mar 2022 22:29:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163524

From: Richard Purdie <richard.purdie@linuxfoundation.org>

nativesdk is a cross compiled target and therefore should use the target
config, not the native one. Copy the target entries accordingly.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b1b5fec350b390fa7f2d26966df1411b032faf87)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/python3targetconfig.bbclass | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta/classes/python3targetconfig.bbclass b/meta/classes/python3targetconfig.bbclass
index fc1025c207..a6e67f1bf8 100644
--- a/meta/classes/python3targetconfig.bbclass
+++ b/meta/classes/python3targetconfig.bbclass
@@ -15,3 +15,15 @@ do_compile_prepend_class-target() {
 do_install_prepend_class-target() {
         export _PYTHON_SYSCONFIGDATA_NAME="_sysconfigdata"
 }
+
+do_configure:prepend:class-nativesdk() {
+        export _PYTHON_SYSCONFIGDATA_NAME="_sysconfigdata"
+}
+
+do_compile:prepend:class-nativesdk() {
+        export _PYTHON_SYSCONFIGDATA_NAME="_sysconfigdata"
+}
+
+do_install:prepend:class-nativesdk() {
+        export _PYTHON_SYSCONFIGDATA_NAME="_sysconfigdata"
+}
-- 
2.25.1


