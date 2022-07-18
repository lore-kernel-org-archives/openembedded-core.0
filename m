Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5DFCC3F2D4
	for <webhook@archiver.kernel.org>; Mon, 18 Jul 2022 14:50:02 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web10.28037.1658155793263848263
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 07:49:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=dxG5Gekl;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.180,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f180.google.com with SMTP id f65so10766903pgc.12
        for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 07:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=iPc7NocptWA32GYzrCUB/G2dZyK3h0JflmP4fVj+tA0=;
        b=dxG5Gekl/2w0RGyiT0k/LSvZ1YFeMQXSU/jDVNg7nseBuLdeLWy7dXvKJIawD0tHyp
         1IeoaL0R2MJ1p04mOiC2mpM+rZVQn6ewJKSVHPwwI50RKxG+QnTylGvH7OTYv6qO0/1c
         jLFE1d8AqtgqpIdsDdbU4BAC6hzY4wXn6USsKdMFz4J30pKjuOnoQ1MdcA+TpC5ORtjI
         20vtjIOJjKNCj25aDGuNqrq98VbjA7gatSV3KSKlO59yKBVW2mUZzp6JXFy53/c2Lc9X
         xvpKLTYMWPEvBhorIg7/RkWncdLKt8w4u2HBzvhdBO8yfbVz6+88QuNgCySXS/HVCvqt
         iWNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iPc7NocptWA32GYzrCUB/G2dZyK3h0JflmP4fVj+tA0=;
        b=kA8JDF9G8uJx4AVKnwQtIrz9YJMJeQsVjECsB90NkNO2i1vWJvfs2F9agZ4WmHSOxv
         +v4SfS1CTEqPumKJjIOMxLYvUvTp6JLwzVJImYEwleCiMbZ6tq2BS2kOAVrgU1eGvsvb
         N+HK0RdL5Wl7/m3946XI7rwi7FFoEGorcGWjVSi5Mwoo9vfXfCzpfj7mTYlXI6sTdpOU
         FxpSs8Zrg2Ik+a4965Xuihg61B5h/b6oWS0uaJxx3D7yvbwFQQuOThVtaGBwFY3f+BRD
         QtUTYWlSwKruBdbqFzbB3e3uPJHTkIEawG7ZFje/M/ZX23vjLCw+RyVKhl+9HRngHtKS
         jEjg==
X-Gm-Message-State: AJIora/HA7QNgwBvhTnyM8vpJJuTEfmYvWxi2wIz63fmJRMuxD7Q/NOz
	S52YZK2VGkUv5M5F75ochyPzS2c4DX6087ER
X-Google-Smtp-Source: 
 AGRyM1u6kutlpQK7msq+xW9QtEkSmumRLIIpqMd8MAmBR4iW7df2bDqs0mGzXgdWzBkxkireHU1bLg==
X-Received: by 2002:a05:6a00:99f:b0:52a:dd61:a50f with SMTP id
 u31-20020a056a00099f00b0052add61a50fmr28354415pfg.9.1658155792244;
        Mon, 18 Jul 2022 07:49:52 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 ij8-20020a170902ab4800b0016c066e566bsm9551517plb.164.2022.07.18.07.49.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 07:49:51 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 14/35] package.bbclass: Avoid stripping signed
 kernel modules in splitdebuginfo
Date: Mon, 18 Jul 2022 04:48:39 -1000
Message-Id: 
 <cefc6ec245ac1ca7a1a47d55aaec793e730a24a5.1658155579.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1658155579.git.steve@sakoman.com>
References: <cover.1658155579.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Jul 2022 14:50:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168214

From: Christoph Lauer <christoph.lauer@xtronic.de>

Since commit d756b346f248df47b0540644adb1d0f17bcc4b6e kernel modules are stripped by the functions 'runstrip' and 'splitdebuginfo'. Signed modules must not be stripped. Function 'runstrip' avoids this by running is_kernel_module_signed. Apply the same check to splitdebuginfo.

(From OE-Core rev: 6859226652339b19cbc7bdfec074fe2016cdee60)

Signed-off-by: Christoph Lauer <christoph.lauer@xtronic.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit dc0f0413eabfd50f78d887f73f808d40a314fbd8)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/package.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 4850134022..63887b34f8 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -382,6 +382,11 @@ def splitdebuginfo(file, dvar, dv, d):
     debugfile = dvar + dest
     sources = []
 
+    if file.endswith(".ko") and file.find("/lib/modules/") != -1:
+        if oe.package.is_kernel_module_signed(file):
+            bb.debug(1, "Skip strip on signed module %s" % file)
+            return (file, sources)
+
     # Split the file...
     bb.utils.mkdirhier(os.path.dirname(debugfile))
     #bb.note("Split %s -> %s" % (file, debugfile))
-- 
2.25.1


