Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03B73C433EF
	for <webhook@archiver.kernel.org>; Thu,  3 Mar 2022 15:30:04 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.12005.1646321403330025317
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Mar 2022 07:30:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=AfOXNLUJ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id u1so8375751wrg.11
        for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Mar 2022 07:30:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=J9WH0YsU2So1XNdbnpKld8Vt6+Y8qR4YMT57PpCZBTQ=;
        b=AfOXNLUJj+oP/bZXFz+z1atlxYdtJMwnWcxCc+cgJQHZvDS+0kC7ML2pME1NhnKAik
         0qPe8iptPNuFo8Dt9Zl+HobiFJExNf2U1WYKwwLzm50slYepF/Sf54kUjcaPfZwwsHgL
         p+ZRpLvyxWof0a7ev3hA83a2Dhxbo3dCPL7P8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=J9WH0YsU2So1XNdbnpKld8Vt6+Y8qR4YMT57PpCZBTQ=;
        b=iQ4Ikv48+emIyMxI1LSCTqIDRbkRmJMZo1BekraUXtBSeGkCodCQ3UyIkDqer6Hx3S
         M9HIL0qCPwWVLWJry3o8fxu8oKn8+VzhIKCwpu8iuYZjGP/AJf7uwu/gnkhI2SturCpa
         h1ootjfT/jo5W4Bcl/tgSzKcy7kv/mYgaADRopK+C/mRwXqE3a2z3sXKiz5vP6zWvC62
         E+jCOy0XO3FvbQIjHOEFpVEv0rTzbbrLLhSn3tAGvTgGdfyYtYbB2tY9vb9Uwp9hs45R
         OgEcSbFxMDn7hTdEUHiuMLNpv6XSqMgjRsXTmoSLbtNLyH221o2j0iAdfonYE9q5bdOk
         i3Vg==
X-Gm-Message-State: AOAM532OdAkkEISAm0toBbzkdXdzGw4GhS+AzqomGdZsPSUjuOGxN2uj
	IIzjzJ6HlWL9E9H+aRSEqsKlKgWBrzvRdqIj
X-Google-Smtp-Source: 
 ABdhPJxzhtOEQPnZBm8J7y49POu4kXLVsADPlr1ghzMKRk5Z7AFF9SLS1+q2Qyl9ys7mm2loiwxgjQ==
X-Received: by 2002:adf:9581:0:b0:1ed:c341:4ed1 with SMTP id
 p1-20020adf9581000000b001edc3414ed1mr26911063wrp.299.1646321401670;
        Thu, 03 Mar 2022 07:30:01 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:68d0:4b5c:ced3:87b1])
        by smtp.gmail.com with ESMTPSA id
 n8-20020adf8b08000000b001f046cc8891sm2295723wra.24.2022.03.03.07.30.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Mar 2022 07:30:01 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] cmake-native: Remove help docs from the native sysroot
Date: Thu,  3 Mar 2022 15:30:00 +0000
Message-Id: <20220303153000.332558-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Mar 2022 15:30:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162662

This drops the file count for cmake-native from ~3000 to ~1700
which is a decent chunk of files not to be copying to each native
sysroot for no reason.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/cmake/cmake-native_3.22.2.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/cmake/cmake-native_3.22.2.bb b/meta/recipes-devtools/cmake/cmake-native_3.22.2.bb
index 335097d3872..8293fe5e561 100644
--- a/meta/recipes-devtools/cmake/cmake-native_3.22.2.bb
+++ b/meta/recipes-devtools/cmake/cmake-native_3.22.2.bb
@@ -46,6 +46,9 @@ do_install() {
 	install -m 644 ${WORKDIR}/OEToolchainConfig.cmake ${D}${datadir}/cmake/
 	mkdir -p ${D}${base_prefix}/environment-setup.d
 	install -m 644 ${WORKDIR}/environment.d-cmake.sh ${D}${base_prefix}/environment-setup.d/cmake.sh
+
+	# Help docs create tons of files in the native sysroot and aren't needed there
+	rm -rf ${D}${datadir}/cmake-*/Help
 }
 
 do_compile[progress] = "percent"
-- 
2.32.0


