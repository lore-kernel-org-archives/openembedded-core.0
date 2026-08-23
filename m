Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA0E0C5DF9A
	for <webhook@archiver.kernel.org>; Sun, 23 Aug 2026 07:49:28 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10585.1787471357920340707
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Aug 2026 00:49:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LmjbcJ6J;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47ddf7b09e5so2198818f8f.1
        for <openembedded-core@lists.openembedded.org>; Sun, 23 Aug 2026 00:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1787471356; x=1788076156; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bzOvKfFYvrjGu75wbJsxBhbgUHIlhH55d068OZnCY78=;
        b=LmjbcJ6JGHjRa9CKvh6k9p2sJHRd+5Tu52pD5Dtp24lqsdQD3WoA7JDC5XWYGWS4iW
         DW43PhKEaBx9zQMinJHaixz7tPsKuLOYBVVcY5EWgtnD5Gy6GdYIS5wIv0ctbIrdp65b
         felSP+vsYUtfhLLuAGjMap+x3Wb0nSrFi5FBE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787471356; x=1788076156;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bzOvKfFYvrjGu75wbJsxBhbgUHIlhH55d068OZnCY78=;
        b=S7HmHXUFOsyTGJzB5bLmGOXlkottluqMMnofidWO6elyfy5rq9vB2zzKHtJR/gmOcz
         Iz4SQh3her7O6WxuZYpM0WkYn6aS/2ptiO6t7Nwsx9uhSqWGiV3K+qAbz80WpS5yvaK/
         +rHIGLfg124cHLAyn2eSuefidtgmz5mQhGbeTY9XiSLVmxLGUQu+xtgA9O8PBPfpDBoN
         SiLnRJb3m15USIXkFjaZ0Epo7HNyCThVWFP2wQVyJXx/w4Rn3x2LzgDP/i6NTO++HJHD
         FuYZAHLEicSWKjkTjBRBndLQXQirN85LZbFyqZfz+qd+e4w86dfFqZAAdrH71/USIUDI
         IojA==
X-Gm-Message-State: AFuF++nLSuNG8GLqVbvhzFTFTEVa7pd0hsj6lCM9VOkGql0BO7whlZPx
	YrEiQSoQtIk8Po91grOB0o3txKYqcrxRF72VeuQuhMn8qPnViUlXjLyo5nxT374v9WGqTI6E7uJ
	hmYvdI2A=
X-Gm-Gg: AR+sD10bhQiThLFyN43TjM4Doin/Qn8jgMXi2aIe+HB0GX0zzWipt2wudpVMXed3FjQ
	1GHp9mt+P7H+1AJBkesiH9HeD8WFiXbO5O2erMnOFP89Bco/v4WYhVkP/9BboD0J9mPbM0OvAe0
	4MrtftPq7IeH2zFM+1wb4keBibfjbCRKIwxFAx8yYWZYSDTFi9x+t2P3Ns3v3CVayhbR8esXe4d
	McIOWN/nMGFBfXVklhMhxc/Fc9MP9aLVbPSB3UT5VhgTKNHQfmc708hM6mukXX15vHJV8yC6CWU
	B3LKFmQPyhb9fDdODr66yfEzq8DdbrjCBZ5QCTe+QxHQgUuHUDjeN+7yZU/b79HOZRE15+dozF9
	qZPC2UFeDvajbVygkaGeeshJj3fhPu/Qm5fO6KQHT+1jrntz7qSy31TB9lJrsBDM4tNy4vAcM7k
	HBwM2ZV6bMXGEFD+3jcR+QmM8O95EONPlQhG44CORoaNQrYFuIwzoELwcgnaiBz6I5GW0+VZodN
	RgQdO5NTa/FvkMBdik=
X-Received: by 2002:a05:6000:989:b0:481:512c:b6b3 with SMTP id ffacd0b85a97d-482c0b55df6mr20825789f8f.3.1787471355976;
        Sun, 23 Aug 2026 00:49:15 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:8601:39db:494d:605c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482c9bfcc31sm4279602f8f.17.2026.08.23.00.49.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 00:49:13 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/7] libxfont2: upgrade 2.0.8 -> 2.0.9
Date: Sun, 23 Aug 2026 08:49:05 +0100
Message-ID: <20260823074911.1711858-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 23 Aug 2026 07:49:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244012

-    libXfont2 2.0.9
-    fserve: bounds-check cumulative glyph data writes in fs_read_glyphs (CVE-2026-44950)
-    fserve: validate num_chars against encoding array size in fs_read_glyphs (CVE-2026-59679)
-    Disable fontserver support by default
-    README: fix documentation for --enable-snfformat

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../xorg-lib/{libxfont2_2.0.8.bb => libxfont2_2.0.9.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libxfont2_2.0.8.bb => libxfont2_2.0.9.bb} (87%)

diff --git a/meta/recipes-graphics/xorg-lib/libxfont2_2.0.8.bb b/meta/recipes-graphics/xorg-lib/libxfont2_2.0.9.bb
similarity index 87%
rename from meta/recipes-graphics/xorg-lib/libxfont2_2.0.8.bb
rename to meta/recipes-graphics/xorg-lib/libxfont2_2.0.9.bb
index 33cf5816e0b..82ca4d50246 100644
--- a/meta/recipes-graphics/xorg-lib/libxfont2_2.0.8.bb
+++ b/meta/recipes-graphics/xorg-lib/libxfont2_2.0.9.bb
@@ -15,7 +15,7 @@ XORG_PN = "libXfont2"
 
 BBCLASSEXTEND = "native"
 
-SRC_URI[sha256sum] = "f556c0e1093a4e6911cc90bc4b106d201902ee187fd74af206ff162f7e6a24d5"
+SRC_URI[sha256sum] = "f042a370666815e7b941e9b7019024755bd1c6c2954afbfa515af378251799e2"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"

