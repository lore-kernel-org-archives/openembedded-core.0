Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D46BCC55180
	for <webhook@archiver.kernel.org>; Sun,  2 Aug 2026 12:56:20 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22812.1785675373946190177
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Aug 2026 05:56:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SPQr1iy0;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-493b966dd74so6144075e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 02 Aug 2026 05:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1785675372; x=1786280172; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kypLeZHy4QFrjVr8Sr5xIgqzwt9k2PESIJ7A1Aqi+nQ=;
        b=SPQr1iy00/MxS45noY7VtEtFFXt4Ayefx5GV/pdQwpBycWvaZChdD6GzN9nSrS5X3h
         zbWImwOxbBdCg1lXSCTOO+rCZ1XPkDlumDB1VNcm6CTzTdwGB8Tt6etXBDJSioN0cnT8
         BrqfHeLk/dib8hcTv6w80t0hKVoD8uTrxGDVQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785675372; x=1786280172;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kypLeZHy4QFrjVr8Sr5xIgqzwt9k2PESIJ7A1Aqi+nQ=;
        b=qcfZcGSuAG9d5cv4tY7IcHuvSErqe/xQvx6CzPb2Cck2zEqOrQ0uY+L+wN3HxTBtXd
         miLieEVBlAaczMZc+UQO2dzxneiF0/ukzhA2DW7dvuzWZh5l2WQ25ey7xvu4prugBXrj
         KGrUsV4t50JpJcy1XobRvkB8IXyrAcxzaOlX7cJtUHbUDAGjwPn7VnBbIigbUb95PA/l
         aHeUpBV/337qzfVhDni9PHaIK9djusa7MT/6JkcMWt6g/NXGHQK7/stJiluYLOwrMvHM
         xxzpe/uF+cLUKz18xYf+Jn8cu4/dOrfbFYvWHe47EWUgyYbq0ib/SzHzFzqUP1VpRpa1
         F8cA==
X-Gm-Message-State: AOJu0YwgGZaWYzmPE0zcoIhg8UGafTAuKrTC6FUho2C653DHpTk2VDF3
	o4q0RELbwfyU7Vm9Q/eOQNBBbW25183NHFAcEtkImD0WKTsnKzsrIoGoKzsh4ceWwtlf7ZBF1Mr
	TeImNRwI=
X-Gm-Gg: AR+sD12cHoh+EgmZjgFaHrfTesJDOQzxybp2a9cZd+qLq/Ap6DyfPHCad1J4Bu9TwTZ
	XpQuIw02sMPWvlQpyD9Q9M8piLD/LF84hVaS3BfF55+VlWWIpGG3UBXYzs67eCeYw2dsPEut336
	YAp9eLxLjEkDwXkaQkLiQ9gBwY9oLe6LMgW+Aft8BiMDc+UcDTQwuueLGO/Ag28wiM0GJUBgZfN
	Cn0QwFHJptwMBClVPaTL0N1RzS18KKxGEuqlGjkmDOjYeeZTxcRL8u8Bw8ES10CpvwRWMXIvKmA
	8KohkZo0MvHa3VaBnXuy2f4vvkCYgU3qKO599We6WtEa8kDitXyLnFVtAx6Hw+MM5EkLbPcK/vh
	bYxbtD3xoXv2/q38pK0y2+h7S78+caTbgVAWWOZ/cJSO9l9+ONggOKnquCighS68+TQtilfrq5P
	WHmXPbf4oKMiwmOwLJFoY1420mSKtA0ZFOC53B558t116EkSUcEfD0/Yj7Vb8udUWfba9z/ZaJL
	G81nkJL+ja+gTGPxg==
X-Received: by 2002:a05:600c:628d:b0:490:e5c1:b8bf with SMTP id 5b1f17b1804b1-4980c64e4c8mr135616515e9.13.1785675371396;
        Sun, 02 Aug 2026 05:56:11 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:11e3:e7fc:e526:8a64])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd458b73asm21911934f8f.29.2026.08.02.05.56.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 05:56:10 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/5] at-spi2-core: upgrade 2.60.5 -> 2.60.6
Date: Sun,  2 Aug 2026 13:56:03 +0100
Message-ID: <20260802125609.4049666-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Aug 2026 12:56:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242555

Source: NEWS

What's new in at-spi2-core 2.60.6:

* atk-bridge: Attempt to fix a crash in get_registered_event_listeners

* AtspiDevice: Avoid assigning 0 as a grab id

* Remove G_GNUC_CONST from *_get_type_declarations

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../atk/{at-spi2-core_2.60.5.bb => at-spi2-core_2.60.6.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/atk/{at-spi2-core_2.60.5.bb => at-spi2-core_2.60.6.bb} (94%)

diff --git a/meta/recipes-support/atk/at-spi2-core_2.60.5.bb b/meta/recipes-support/atk/at-spi2-core_2.60.6.bb
similarity index 94%
rename from meta/recipes-support/atk/at-spi2-core_2.60.5.bb
rename to meta/recipes-support/atk/at-spi2-core_2.60.6.bb
index b53a0e07953..1e7a16d747f 100644
--- a/meta/recipes-support/atk/at-spi2-core_2.60.5.bb
+++ b/meta/recipes-support/atk/at-spi2-core_2.60.6.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 CVE_PRODUCT += "at-spi2-atk"
 
-SRC_URI[archive.sha256sum] = "6059a77d507438ff6c8d6d06025f8f9f5774fa0f8eabe9c9b059b1cc41e1bbc0"
+SRC_URI[archive.sha256sum] = "a89b64a8b217a8042bdf0e35cbfab629ceee35640dba75df578afde9aa789d57"
 
 DEPENDS = " \
 	dbus \

