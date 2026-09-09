Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BEA5C79FBF
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 07:30:12 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6325.1788939007983452348
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2026 00:30:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=T1xM7B6K;
 spf=pass (domain: smile.fr, ip: 209.85.221.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4858303de5dso6695489f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 00:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788939006; x=1789543806; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XJ24NKopBZqiOLYLpAUAjxnFL30tptHcStQ4QE3Y5go=;
        b=T1xM7B6KQZQwAqVn9TcmsXOSNV3Hrnp5iOCN4tTEwFG/bvnJw7wSU10uoG0pkQzDz/
         9xDA2h3keGNMmeDmRguq8u+x4lB4yLV0jP6VmLTpLnNywRPUvGojz47+OreiDxMNAgco
         bJ7O+iG6Yy0X0XWIaYMxfu1LTNnU/yzqeZu5o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788939006; x=1789543806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=XJ24NKopBZqiOLYLpAUAjxnFL30tptHcStQ4QE3Y5go=;
        b=Gun7QrU2y614Hj/7Zdbz8OmQreMTNUEiOpCUI2G0EnjX5IzM66BKGbomzEsxKvtpNH
         XsLkoDeU4u+PXbNyW94pudvWSZSv/8FUrRIaqk+75gjsEUe9paN3DUQG3KRyXCS0rSHe
         +2+fIOrmxOjjTZno8CinphccBeGxNK8/ta5JbnD6aCs/GPx2cWPKHIP9k9xrqm8MD6nK
         7PF28lDrZKvcQvNyA1GPKAQXOZBQUg+ZCJB0n3uMdLiLUS01zUEpP77YL8Mskhkp51fz
         blt8P06eXNqpn/OAvr+OAc59JgMrfPPFoK6yDA0HEf665F3hR0K0O+q6vOc500lwOeqs
         6vBA==
X-Gm-Message-State: AFuF++lR5Vy6qjI1MYGLtLvWtdl8YnWGyzHUrLuzF5DbOOMzE5X+TSwT
	ws5IgOwzvMUxT5QkS6ln5foY271M5PXZ48xR0wJutmcvXBH8mFZrL328M/SG7dtOblvG8uDx8tP
	WnHXkNzI=
X-Gm-Gg: AYBFou2o00TqvJRab26Amiwc0NFBDYQ4XUp5dxotTLBhsVAVPDnydvSgIBWDcXIp3Ws
	pKnd9zZ/INwVVrzfolKdg80IGQAMA6Xan8hDAjXb3VZI5Pv1sFHcPBsfPxfpTwdjM/jYjyBQYOG
	32RkbYEJvLo/1dMKvuhxrj+i/uO0bGx6qAzCOy00O7yd0deN+T9rJu0y1m9LXZSTNFtdk6SPQgK
	rxyX2ndjT7g4TYwslW5G1k39QgwXB7ZTPaSvO1R1+TmjCKP9ojm2ac8ytHXWlYyaXhAsLYjS7eK
	nH+f33ZwI5fL9VY+/yjDXba91A7d0xGpxzMHuQaRezd8wuluM0jD+jF4PmPEzhG84wqBvyIZoEC
	xb5rZ9gk/VQEYSbk3B4U5fEA1uoqoZb9+1/fCYJ6saVKC4jmhK2mn6lCkuL2bV4ts+zZOxgZGRx
	Kdif3Ly8WtFZV2DlUIownLWQVjlFf5ySAP0STzhGxpmHzhNzf41lJ8YotXlnVb7VZsIvry2+II5
	nfjcNzG3ecWnIxy8rKNxFB+c6yVCMfeqkxBELV9KmYx+TVUNlx5Xt2Ycg/SEaIiJccLVM3n5ns=
X-Received: by 2002:a05:6000:1a8d:b0:485:8c16:a32f with SMTP id ffacd0b85a97d-4858c16a6cemr31128044f8f.36.1788939006123;
        Wed, 09 Sep 2026 00:30:06 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858ac2b4cdsm40624310f8f.16.2026.09.09.00.30.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 00:30:05 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 19/38] p11-kit: upgrade 0.26.4 -> 0.26.5
Date: Wed,  9 Sep 2026 09:29:18 +0200
Message-ID: <ea6b9c4811aebe143fd5c93b59166b81d9c03379.1788938909.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788938908.git.yoann.congal@smile.fr>
References: <cover.1788938908.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 07:30:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245428

From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>

ChangeLog: https://github.com/p11-glue/p11-kit/releases/tag/0.26.5

0.26.5 (stable)
* rpc: guard against overflow when decoding nested attributes (CVE-2026-18938) [PR#777]

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 21a2c91ccca5257ede8994d30460b0dcda617c3a)
Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../p11-kit/{p11-kit_0.26.4.bb => p11-kit_0.26.5.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/p11-kit/{p11-kit_0.26.4.bb => p11-kit_0.26.5.bb} (97%)

diff --git a/meta/recipes-support/p11-kit/p11-kit_0.26.4.bb b/meta/recipes-support/p11-kit/p11-kit_0.26.5.bb
similarity index 97%
rename from meta/recipes-support/p11-kit/p11-kit_0.26.4.bb
rename to meta/recipes-support/p11-kit/p11-kit_0.26.5.bb
index fde122d3ca5..423c751307b 100644
--- a/meta/recipes-support/p11-kit/p11-kit_0.26.4.bb
+++ b/meta/recipes-support/p11-kit/p11-kit_0.26.5.bb
@@ -12,7 +12,7 @@ DEPENDS:append = "${@' glib-2.0' if d.getVar('GTKDOC_ENABLED') == 'True' else ''
 
 SRC_URI = "gitsm://github.com/p11-glue/p11-kit;branch=master;protocol=https;tag=${PV} \
            "
-SRCREV = "a14788849d1ef44422d679534a13821eab5bb5f4"
+SRCREV = "120050e353e8f43d7c40bbcc047f667f903f4de5"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[manpages] = "-Dman=true,-Dman=false,libxslt-native"

