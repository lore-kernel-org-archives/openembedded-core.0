Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52331C5DF8C
	for <webhook@archiver.kernel.org>; Sun, 23 Aug 2026 07:51:40 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10753.1787471490513450176
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Aug 2026 00:51:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SeraQ3CI;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4954df200ddso13566725e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 23 Aug 2026 00:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1787471489; x=1788076289; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KUvNllUvA0RSrdMI64ly/ESpUkbo0wNQdxe2b4Nabwg=;
        b=SeraQ3CI7ETRfbO54Sm72H9qP4C6WN6plmMkaAFgKLdlZ4olufsAou5VTmblMIRAv7
         ivg5u4U2lvfaNaaqGW7nUvx2avvfIcKLa3FS1HH1A0nQsMbrVWK92gUX/CQEtmm78mXL
         ZLSE7Z83YuaivmiFBKLCX0vnDkaCGbQM0BIyk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787471489; x=1788076289;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KUvNllUvA0RSrdMI64ly/ESpUkbo0wNQdxe2b4Nabwg=;
        b=HEmNnRn0SbZXhiBIuSuZAqPXhZL5UZujhGP/hBl00TCikxYAwGKaos8U9sbLcRouG+
         D/tjqIU+tyiQe0O7qfX6DDSoJpzrpk/xjB91jIdadd8H5KffnNTrrSApC8+2pTJzcHz5
         z3+FT0Tm7FfVl8zDEYD6mN2ucRJkOQNeQ/qSATY5dhHHCJcq5qO3BdgfCy0FjPG94nbM
         RJgpdx2dRt4bMoiUpvfx3kA00LmgEQ4JaXCR/Xi/CqJfnv7fDF3rJvJ5jVvU43bMlFtE
         BWDQAKaOAiw4CYgcWMUxE2J6lWFSGeF7OOnrKA6dMTa6C/cTaSYqHPm2OicMr0clSbmu
         Fh3A==
X-Gm-Message-State: AFuF++lTEvVo/lDq9yQBBFL7hvi0zsMbsW4YGPx1/I4MP1pg8L1GB7VF
	ErqXnFzUqyYLG9hzm8qUQOq99kvLCho9WGNz9MsuGjHSS/CBs0AzhBpOGfY8JKFNc+g2EozQt+o
	fYYEzpp0=
X-Gm-Gg: AR+sD102ZzXIF1lx0IvqUpCnmzorf2J/pz1lLqrjBy0Q6Dpw2gbxtd++RRamxBx13sG
	kkiSwxk66yTZCeLdKS15bcbQ8PwIwH2YUVOdaPslx+8IArKeVgpzal1FYyYUfBrLwq2ecffHVAJ
	7Avm0eISJVfjIJfeUrbMtr0FS96+/k0WxLKmxp4BrV/PzgOKA0ahZO09sNjOt+zidIc5/FTKKES
	PUE+YgNGnDXgnka1WjwvYa0TkdUdOomyXqYrsSkgeJ9FEgKkXRiwrSc3F0MqNyxabCGaVspUlLX
	gKuA+dxhzWC5TyZ9BTfPnHkOhcfg7q70h5peSls0wsbnB9v8TGE3cm/A96ybFcHcL6Y0nz+aN+/
	Kqg+ftwdKHCfFHYq6J9N3pL4yYL5S+4LG9gyxn6ezR8zaU5D5Z0HkGUda7r5zlFNdgQLZi/lxau
	rA2nJEEMfdVdSxjA0+hjcWafjszlIDePiYBIJGuaFB80GzBsZNZqWXHMEpcjaPjXcfdlbRKHU/y
	ZQVan8ZaHlfuDy+ph3aXE8+kWUl
X-Received: by 2002:a05:600c:4f84:b0:499:93b3:91ea with SMTP id 5b1f17b1804b1-499c1af1687mr73993295e9.15.1787471488667;
        Sun, 23 Aug 2026 00:51:28 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:8601:39db:494d:605c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499bd581a49sm40990695e9.1.2026.08.23.00.51.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 00:51:27 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] diffoscope: upgrade 328 -> 329
Date: Sun, 23 Aug 2026 08:51:24 +0100
Message-ID: <20260823075125.1733690-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 23 Aug 2026 07:51:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244019

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../diffoscope/{diffoscope_328.bb => diffoscope_329.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_328.bb => diffoscope_329.bb} (93%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_328.bb b/meta/recipes-support/diffoscope/diffoscope_329.bb
similarity index 93%
rename from meta/recipes-support/diffoscope/diffoscope_328.bb
rename to meta/recipes-support/diffoscope/diffoscope_329.bb
index 7b4bd7640b0..f8033216318 100644
--- a/meta/recipes-support/diffoscope/diffoscope_328.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_329.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "8480ddffa8cc4860c6ada3c9c80a8169e75d6a39ad971662851f1ad776512870"
+SRC_URI[sha256sum] = "940ee30d8d98231f4d4855e36caf96e9eec9ec3d3cb359b744687b369b2b54d9"
 
 RDEPENDS:${PN} += "\
         binutils \

