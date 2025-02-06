Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35937C02198
	for <webhook@archiver.kernel.org>; Thu,  6 Feb 2025 07:30:33 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web10.34519.1738827027131297248
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Feb 2025 23:30:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=hvNiT5Rs;
 spf=pass (domain: linaro.org, ip: 209.85.208.178, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-304e4562516so5386761fa.1
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Feb 2025 23:30:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738827025; x=1739431825; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tVegHoMCibGozTgJEhglDNErB7RShnpoMBXeHo/MnD8=;
        b=hvNiT5Rsijj/67MNra8w4O9u+Koi6uM3gILz2I1Yg0+Tfxu0eqsIpzXe2FjeMkRELX
         n9gGFm4q83eb9GWtOeO0frIDNLQ7Dbiod29MHqnyiwiiJm1st6ajXthM52zLN6ORhBZ9
         MlSVOqrBuTQWzsI0rDybJUxjZSW0MPQtjbaIlEpqqF+ydnkDIZTLIywGnR7o/kjK0CuF
         KTwCDgZDTql/J9geI96BbHSTCWp5xsagioccifZZBdP3PsLyoGpvKq5LlcGoJJh9GlKk
         /Vj2f59uEOqN43Tx2q8wMaLPkhWAxgQTdhSlbwXaD36Hm0Y2om5hLxwxyQ7acbhahXoW
         6e6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738827025; x=1739431825;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tVegHoMCibGozTgJEhglDNErB7RShnpoMBXeHo/MnD8=;
        b=FrOw5J6lj57cwb4sHIWReOo01f18LPsf/9xEh4+1f1cXzgZ/rTHbafr1qkp1JbzuT2
         lbrtFRtmbD2gM1tinrqLPThS1cOPO3yw3U+dtUPfKSMIxTSfHwhBZ4XytxX9QOO105mY
         v+xbeZPGV4RDo8NsbHJYMPjZBM7SF92Xi4pEBhI1bHt3eVDXfvNFOQEDjdLAfBeZKMlc
         m4p7qPgCUfOuORk9WPg+y3Jo5+cctARhoSubz3EkkeQNz/u7PsqGUSCnnfCIBtbj/GoM
         Q3v5d0et6/ukCtnGt9uSOFiqyGyOzy89pZfgPrkv2yr75n6pf/PivJsNoFZmxlq6C+j2
         Ngcg==
X-Gm-Message-State: AOJu0YwaWEKy8T5SY792TXS9eL0C+6E7sws0RPCs0hJipzMWQ1gI4Agw
	6rVm6Z9NGwbRdEWZbBHgdHziIbCpR+DQUdZru0y+cFLyJnmFKeG1s94YNzn1zuvE58Jrw76iYds
	hmcE=
X-Gm-Gg: ASbGncvwGOq12+pd9Xjq/wnsyE/zg+4+mnIHzNYags58qYk5r3dM0YB+4Sg78dY8+ny
	LysQhggBGYvMR4x3ufwnyEJohLdgL903lZxf8M7RbOOneHOqzC1/FceTMVu9cGMn6RWO6smTAId
	54SuRfkGlPPgy0oub0xW5mFkGXdlXtYPB2qK8g0cAYYiK2sGTIRwSQffzLmO/49KLU04irf8KjG
	s2bpPJyvDPqdtKEu2xGSO3RQQ8u5jwRtwnlJs+vuFgo92EPphd2j3PzWB9qjLLAHL2zz8ibT6Ku
	AkXWmOIm270jmBDQA5t7VNbjdYsJHpjRYrzw2ZpekJItLfncXzfFpvEJLGO3
X-Google-Smtp-Source: AGHT+IG9G1jyxBy5kNtU3uPaCBop4buE8R9qijO33hiTyddoT2JHwZf794HTCASbz1tevnQLH/97jw==
X-Received: by 2002:a2e:a7ca:0:b0:302:2565:6fea with SMTP id 38308e7fff4ca-307da51cb89mr8783771fa.3.1738827025127;
        Wed, 05 Feb 2025 23:30:25 -0800 (PST)
Received: from localhost.localdomain (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307de1a67c9sm654781fa.48.2025.02.05.23.30.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 23:30:24 -0800 (PST)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v4 1/3] systemd-boot-native: move do_install() to after do_patch()
Date: Thu,  6 Feb 2025 09:30:11 +0200
Message-ID: <20250206073013.1280187-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Feb 2025 07:30:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210904

The tasks were deleted and do_patch() was run after do_install()
which means that patches applied in SRC_URI were not in the
ukify.py binary installed. Moving do_install() to after do_patch()
fixes this.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/recipes-core/systemd/systemd-boot-native_257.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd-boot-native_257.1.bb b/meta/recipes-core/systemd/systemd-boot-native_257.1.bb
index 58db408dcf..7b60d6b583 100644
--- a/meta/recipes-core/systemd/systemd-boot-native_257.1.bb
+++ b/meta/recipes-core/systemd/systemd-boot-native_257.1.bb
@@ -8,7 +8,7 @@ deltask do_compile
 do_install () {
        install -Dm 0755 ${S}/src/ukify/ukify.py ${D}${bindir}/ukify
 }
-addtask install after do_unpack
+addtask install after do_patch
 
 PACKAGES = "${PN}"
 
-- 
2.43.0


