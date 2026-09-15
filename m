Return-Path: <michalwsieron@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2DF5C88E75
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 00:11:02 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12269.1789431060326649893
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Sep 2026 17:11:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=tNfM6pOW;
 spf=pass (domain: gmail.com, ip: 74.125.225.141, mailfrom: michalwsieron@gmail.com)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49ccf3ca94bso13501835e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2026 17:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789431058; x=1790035858; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P13u8uXHsB1IKscThexE+GYaOzHSmZbs3NHWro834R8=;
        b=tNfM6pOWGCar6cf2NpprEMcUh4TmDc3Z50Rf9MLfDY3a0bjCPrlJyuXsRVUVEmzWNx
         0xiMMPgYNdkyISewU2+Sw4QUPOYRt4y8cHc63cfmo7nmutAD242zN+pBctiOLxc8bMDw
         vF6vEaAcqozt4Rl5jer6iS2iTGxEu9lE/Fqtl3+ZdjbC+JRtANo+JM61Si0PvK1cGvir
         QxnQydPedTnbMYEsQsLy4uYBG43aC7BzyfrSiPlKGCXbEvTPHRLQhAijV0A4eYTE86EP
         Wp7se7k4U7FWKQxF1sFZ2kmTDVK1xxg/HwpisxBRYC3p/vW/OuTob4a9IbNXWzjQXp8c
         b2hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789431058; x=1790035858;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P13u8uXHsB1IKscThexE+GYaOzHSmZbs3NHWro834R8=;
        b=VINZUkpYlk7PBYTpArHmGfqE6KP7UQR+EZHJoX6Wtlr1nuit8qcEclNDgrrMPgaMKJ
         88g269VmEko1sFwpIJYsMvUENNjNLBH5qNbmEYm32SpSyoRkNOYdMSBlaj+1Ob4O+Q8/
         tTZ2vCkl8ncngMs14C6bif9jlnANJbtZmhA+N6tgCEHH4EvHPwQ8RxINXpsyLMvJu7QB
         VJL1sPeVRqYoNBOaslpBv1XDxdt1G3+1PXhjKc2lGEb6+g3wrMjbIQSwOJUJWEvhYEBg
         /sTokKssVMcRcv1fKbcOubK9EkCHzWcOJHUw7F0v5GEo7xGWWBYSu5Vo7t4r1eg6Re4q
         UT5Q==
X-Gm-Message-State: AFuF++kcu9aaTxCbJDgkbB9vk4J9iyu/liZ1sg3tIt4Diu12ylfaaaN8
	8+cDXpDLg8KZnNznqJzbHp90LeKBF++e0RaDxMtHJPZ0OsiRhStnpjZzgrNExQ==
X-Gm-Gg: AYBFou27aG4IHtMeO94kMXwV5DxbT/qqOeCVXyaL3j4RcZANERF/0sEn4J+NyV3bhsp
	vc+z9RfmOIxyxhTsDhSfmWpCW3gNLc6/6hcSatdvRci7/T/3Fio1wpw6fK688GUsJpkPeWTIFsG
	Es3w2Hm0Ao6kWjmuNBDh+IwyhVpb+EKKiMMU/1OvgQj3xqhH/BgakU6oI3qBdfRgCxiPP4C0olW
	fYl2PPqdsEch46zKCQkAxRrEcRV3pIDjncIHauI9dYk8rCfz0frQw0IWaY899uHajPpkxSMEfFn
	2P4wzXqmfG4TxzFgt+oBTt5et7fFXiOVwPHq23Gu0y4XE4R/YKMsi4FDbKqyvwjmGiwngnG1WfZ
	6Cm7yB1YcjZGpnELBnPadnO9X/vMJvn660RVSmpTRHK5KMxefYIoHlS0tOPOJUJd2F5+u0uDQrd
	qgcJcMLA+kSaRFaZzDQu27VBFPNYqrvTGWa67WaBeYFxYWkEc0T9LLMbValSVFWBf+d1YmgKfF1
	A==
X-Received: by 2002:a05:600c:628f:b0:49d:1df6:2592 with SMTP id 5b1f17b1804b1-49e7a66ae3dmr54915645e9.21.1789431058336;
        Mon, 14 Sep 2026 17:10:58 -0700 (PDT)
Received: from [127.0.1.1] ([193.28.84.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb2ed106sm29287221f8f.1.2026.09.14.17.10.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 17:10:58 -0700 (PDT)
From: Michal Sieron <michalwsieron@gmail.com>
X-Google-Original-From: Michal Sieron <michal.sieron@nokia.com>
Date: Tue, 15 Sep 2026 02:10:41 +0200
Subject: [PATCH 6/6] ethtool: Add PACKAGECONFIG option for pretty-dump
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-msieron-some-packageconfigs-v1-6-44dcf1145d3d@nokia.com>
References: <20260915-msieron-some-packageconfigs-v1-0-44dcf1145d3d@nokia.com>
In-Reply-To: <20260915-msieron-some-packageconfigs-v1-0-44dcf1145d3d@nokia.com>
To: openembedded-core@lists.openembedded.org
Cc: Michal Sieron <michal.sieron@nokia.com>
X-Mailer: b4 0.15.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 00:11:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245805

Not all deployments need it, and disabling it (especially since v6.15,
which added fbnic support) can save ~300 KiB in binary size.

Signed-off-by: Michal Sieron <michal.sieron@nokia.com>
---
 meta/recipes-extended/ethtool/ethtool_7.1.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/ethtool/ethtool_7.1.bb b/meta/recipes-extended/ethtool/ethtool_7.1.bb
index d215b27b0a..a24b64863d 100644
--- a/meta/recipes-extended/ethtool/ethtool_7.1.bb
+++ b/meta/recipes-extended/ethtool/ethtool_7.1.bb
@@ -19,8 +19,9 @@ inherit autotools ptest bash-completion pkgconfig
 
 RDEPENDS:${PN}-ptest += "make bash"
 
-PACKAGECONFIG ?= "netlink"
+PACKAGECONFIG ?= "netlink pretty-dump"
 PACKAGECONFIG[netlink] = "--enable-netlink,--disable-netlink,libmnl,"
+PACKAGECONFIG[pretty-dump] = "--enable-pretty-dump,--disable-pretty-dump"
 
 FILES:${PN} += "${datadir}/metainfo/org.kernel.software.network.ethtool.metainfo.xml"
 

-- 
2.43.0


