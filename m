Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE00DC74A4B
	for <webhook@archiver.kernel.org>; Tue,  7 Mar 2023 22:48:35 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web10.8625.1678229311538277265
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Mar 2023 14:48:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=KFMc/rsY;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.181, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f181.google.com with SMTP id 130so8581852pgg.3
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Mar 2023 14:48:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1678229310;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tKiyuaBqGvNHfG6besOqVp1cZQUxX3/eO1O0+Zj2+6w=;
        b=KFMc/rsYdyoeYfTKy9QE5DWFsWrZun5Y4q5gR2cIuEeSouzf6arVjywLOnteGhiDqU
         aBNeawDVNlrdUzkJ1BMLcUs5n7yZ+CnxG0wvO111yO4H4sOVOd+EOTQ9ypGj05wooM2Z
         3mWG5A1tkZQ67VPKT6hy67aKGZ//zuYnhpRXeMwzG0IMOjsyGMiWVMei8BdPC0+9GXKK
         wBG2K/Znpas1L3et/3ggyrKm9yLAoi2fBK1tQLkvXozHyDSjv0WLmFBPgfdrOtIRwdFg
         pfxllB4wwlCFeQjTC4jrBpLuXoJLNIovGDwsPuDaW+OeWVC1pAaNojhqRZujk10w5K9C
         6BcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678229310;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tKiyuaBqGvNHfG6besOqVp1cZQUxX3/eO1O0+Zj2+6w=;
        b=kV4yHS/AZeRmyHc5Z0CR6+MCnZnQLYaNE3c5D1CzxotZwueuenePiDHEO7LjHQ/WNz
         YbVmGrXG/Hl982eYpmi/zFdpDBgitcJeJlfSNb7cM8cYjBus32z2jHwLGduv9oVo/l91
         YfMnjODeivVPycr7EHt+Ve7pgGDZjGCRltB7o4VKtnxcsK7Yjz8daqIDChRok0lW7jP7
         e530twSqfL5w11iWp9FKzpioHVWwBu6LvSI7pd2e7MZcvk9z/mxvS+zCCTlLbA1QVeVy
         UM2bcK8rCaAmgsCHWk+tWk/Ks6LVrnJW/M4/Zi4QyuBIIyGBP0SuZ/4sbaVfex1LotX9
         hyrg==
X-Gm-Message-State: AO0yUKVzILmq9gYBP/54fSU5YogZbQFz//+oqMXPAiqtibyXF2LDndMk
	Z1/C0Q08C4AhqyWHhLZaIRJa2XsTqOwc5xsgqtw=
X-Google-Smtp-Source: AK7set9xHQkryP9mJbIg2FyMgz/uSpq+LSkvDn66dc32aeDiPEzpwA9XdRJGHrAiRsQ7dH+NjnddqQ==
X-Received: by 2002:aa7:9401:0:b0:578:ac9f:79a9 with SMTP id x1-20020aa79401000000b00578ac9f79a9mr11992298pfo.15.1678229310534;
        Tue, 07 Mar 2023 14:48:30 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id k1-20020aa78201000000b005cdbd9c8825sm8388958pfi.195.2023.03.07.14.48.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 14:48:30 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 07/23] vim: update 9.0.1211 -> 9.0.1293 to resolve open CVEs
Date: Tue,  7 Mar 2023 12:47:41 -1000
Message-Id: <ea88ec38aa0e42b8c45e300e69dae7c2f7a13299.1678228988.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1678228988.git.steve@sakoman.com>
References: <cover.1678228988.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Mar 2023 22:48:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178129

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6d77dbe499ee362b6e28902f1efcf52b961037a5)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 46250c0d37..234ecd0027 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -20,8 +20,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://no-path-adjust.patch \
            "
 
-PV .= ".1211"
-SRCREV = "f7d1c6e1884c76680980571f1cf15e0928d247b5"
+PV .= ".1293"
+SRCREV = "0caaf1e46511f7a92e036f05e6aa9d5992540117"
 
 # Remove when 8.3 is out
 UPSTREAM_VERSION_UNKNOWN = "1"
-- 
2.34.1


