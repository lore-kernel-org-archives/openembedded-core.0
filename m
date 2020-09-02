Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web12.4468.1599043327958879964
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2020 03:42:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YEDqClWr;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f67.google.com with SMTP id l9so4002348wme.3
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2020 03:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=E3DrxrvXy28q0TLWbDO3H7RhVJqLIKHW9dEEH/2jQls=;
        b=YEDqClWrUSegOpovMaBjDTZtBgu+iwsZ26j9uTLVJfsH/eXOw7p7T8l81YFM2EAhlG
         a39tl2u3lGhVuahZcgUTYdZsZQD4fJ5Tz7OZHnUvzFg9lbB8O9nPBrvoW50DRgKyX4We
         5iZwgyuAjpG9jsGr7f8bemQe5AK0l0P5EgMHI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=E3DrxrvXy28q0TLWbDO3H7RhVJqLIKHW9dEEH/2jQls=;
        b=SuCJMaicsQ3BxP0rUqRNiKlUmn78L/ml+fVk4FGowENXGJ0p75szhQsj8Wk6UN4e++
         YLRkU22XqqDyNEkxlcekp71pB/7Xlm9MGlqYRAYCsfDA0/Z7sHMtg0h1guFzR3GHFX79
         9jl6Bu3Zz+wTUsHpBfWtRtOnnXbsf0auIh30jAwrVZ2c5onC9sVDwkWLclWekV5GcrFW
         mL4QOwOlACflZ0I42qNwOVHVLWT9kQrmuMzST7Vz1C9oi3PmOXyfjsfmajmr1Qsu9IVD
         AFK7sE9iQcUJyiuJdXK53YeLtIDD9AHynP6dUz5yoE5kGJQq4pGkliaRBpgRzB7bHZau
         o11A==
X-Gm-Message-State: AOAM531Yd3rhu2/BmIOTDiG77OBlGHBJxavgcofcr5HpdARPe4Xa7KM6
	PDJZn1QpAXkBCnqlyVtwx25CZ3kCdj0o3vcB
X-Google-Smtp-Source: ABdhPJxMSZS9Q5MjqGs3Znk9C51Qezc0Vja+CwEpy3S4rDdSL8DhsioCzOSl2ECEZOQhhra9dxNC0Q==
X-Received: by 2002:a05:600c:210a:: with SMTP id u10mr51520wml.16.1599043326253;
        Wed, 02 Sep 2020 03:42:06 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (4.a.9.e.c.f.e.5.5.1.2.c.8.4.d.9.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:9d48:c215:5efc:e9a4])
        by smtp.gmail.com with ESMTPSA id l7sm5730759wmh.15.2020.09.02.03.42.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2020 03:42:05 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Changhyeok Bae <changhyeok.bae@gmail.com>
Subject: [PATCH] iputils: Adapt ${PN}-tftpd package dependency to PACKAGECONFIG
Date: Wed,  2 Sep 2020 11:42:03 +0100
Message-Id: <20200902104203.1730906-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This avoids failures when recipes try and use the iptuils package.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-extended/iputils/iputils_s20200821.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/iputils/iputils_s20200821.bb b/meta/recipes-extended/iputils/iputils_s20200821.bb
index 87891140e7e..28dd194a12b 100644
--- a/meta/recipes-extended/iputils/iputils_s20200821.bb
+++ b/meta/recipes-extended/iputils/iputils_s20200821.bb
@@ -46,8 +46,9 @@ ALTERNATIVE_PRIORITY = "100"
 ALTERNATIVE_${PN}-ping = "ping"
 ALTERNATIVE_LINK_NAME[ping] = "${base_bindir}/ping"
 
-SPLITPKGS = "${PN}-ping ${PN}-arping ${PN}-tracepath ${PN}-clockdiff ${PN}-tftpd ${PN}-rdisc \
+SPLITPKGS = "${PN}-ping ${PN}-arping ${PN}-tracepath ${PN}-clockdiff ${PN}-rdisc \
              ${@bb.utils.contains('PACKAGECONFIG', 'rarpd', '${PN}-rarpd', '', d)} \
+             ${@bb.utils.contains('PACKAGECONFIG', 'tftpd', '${PN}-tftpd', '', d)} \
              ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', '${PN}-traceroute6 ${PN}-ninfod', '', d)}"
 PACKAGES += "${SPLITPKGS}"
 
-- 
2.25.1

