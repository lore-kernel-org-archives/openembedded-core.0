Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58A00C982ED
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 14:58:50 +0000 (UTC)
Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50863.1790002722157299099
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Sep 2026 07:58:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FTzRx64j;
 spf=pass (domain: linuxfoundation.org, ip: 74.125.225.76, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843c3ea1f6so1252219f8f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 07:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1790002720; x=1790607520; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bA3aRYq01BykXKyF7SUJGTEaj1cRLfUsRCiJvrOwkqs=;
        b=FTzRx64j2Ce5l2cxoctkMFXgARAv2JmXXnel9GSXf7fZQaJ2SiUvTTmc/mNbh5r0Pn
         nLSB8xA+DQsl/R4cOoTP3HjBWxuMPIJBwffy1zrLg4V/9MXUfmOifT5QuTuILLmVVSJg
         isy8zdzq6enquOlAXSQaD6TQB3t7v8KO8L14w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790002720; x=1790607520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=bA3aRYq01BykXKyF7SUJGTEaj1cRLfUsRCiJvrOwkqs=;
        b=0g8FJDcs75zDuRJEITR1dXmAwzw/pKuizkEmU29SaV4xt1RH7ziybtuRzvosP8GWQa
         8vhIMeTanv8/Y1McXZ1M2LNzgR7YRhlYo3SkgCTTAXXqNVRdwJMiiAdSbu1eqZ83dOLm
         zMlu7G0okG+jKQfzfhHFlyTzhY9pk7zjpvlLqilzz/dGeW+94rsy+eY6eJoSv1wpTSLG
         KMOyhy8wIGyhMDEB2pp6g9dRdknq+CQ5e3JLgG9W/nTXnBjgnHfYDg3iciVS+30abRpn
         nZS4mSU74UbSjuSrpSaBmLoZ6g46JU0JB8jy5Za/LX+J4hnNqZOpVAj8rpOG/U1EvRkr
         5weQ==
X-Gm-Message-State: AFuF++lONpycHscD8+4C/9uwADGPJc4UCrSNLecb8SohtZIJN91Zr3cb
	GqD4f+mYMd1ca8XJ69tdkWMhnA+eEaWxT0xvMGZ4X8vpELI5RBSqXHSDwa6WsSqhM9NjM2MxQwu
	Dgx4+gY4=
X-Gm-Gg: AYBFou0+gsW1IcpWDUGUpp3IaQ0gPWrlvEo9UM9eweEnSswoy2D4hh1I34/gG0aXXZ3
	MHpwjrz/KReOKw2gy/k/xs+Ojj4BK2Q0eELER+BjS1UI1rVPBN/9CDdBVldeyspbeHiGpVg2dOz
	tbJ2SIs5smIMNE7Tt+Wlvub9otes+IrnYmfzm5rNTzN+ZkmihOl5/9A2h6Umg5EJuQSmVGdm8fS
	NOG+lXdn2N1b/Uw1JYJFPOFxJImt7vsxYl3Vxc6mpnLXuJnD3KW6FRd7oTN2rEncda9G6Sm199N
	p2nsOnt8pfEoLBES/vrc8DD8y8LHeSwavNlJAOTEDSEGOh/lCOBye/RFnBdHC8KxLZBKE/g1yYN
	AZbP0IqvV2vrAWbXK7Z4w11Si270dtEce7iacuY8h5AvZjnpTEnKgoKKOL7cUASz+miUoUtMAEG
	UvJYqdbze4XpGocgmdRz0cXVMjPwPYypLtB/+7rGuRrl1J1Q/fuN51UYmpFpVU4bpOpPXlYbMmE
	jN2XaBUnL8wRPdd+92fPYQrG5Q=
X-Received: by 2002:adf:e012:0:10b0:487:231a:fe8a with SMTP id ffacd0b85a97d-487231b01abmr8958370f8f.2.1790002720444;
        Mon, 21 Sep 2026 07:58:40 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:a46d:d671:f81e:e5f1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48724596604sm23856287f8f.30.2026.09.21.07.58.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 07:58:39 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/5] stress-ng: upgrade 0.22.00 -> 0.22.01
Date: Mon, 21 Sep 2026 15:58:34 +0100
Message-ID: <20260921145835.1106731-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260921145835.1106731-1-richard.purdie@linuxfoundation.org>
References: <20260921145835.1106731-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 14:58:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246337

stress-ng (0.22.01-1) unstable; urgency=medium

  * Sync to upstream version 0.22.01

 -- Colin Ian King <colin.i.king@gmail.com>  Sun, 20 Sep  2026 14:30:12 +0100

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../stress-ng/{stress-ng_0.22.00.bb => stress-ng_0.22.01.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/stress-ng/{stress-ng_0.22.00.bb => stress-ng_0.22.01.bb} (94%)

diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.22.00.bb b/meta/recipes-extended/stress-ng/stress-ng_0.22.01.bb
similarity index 94%
rename from meta/recipes-extended/stress-ng/stress-ng_0.22.00.bb
rename to meta/recipes-extended/stress-ng/stress-ng_0.22.01.bb
index 5c68f813110..548edf292b0 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.22.00.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.22.01.bb
@@ -6,7 +6,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/ColinIanKing/stress-ng.git;protocol=https;branch=master;tag=V${PV}"
-SRCREV = "6c2ab8831bca51f17d97538d106996ca411c4c79"
+SRCREV = "72a9d0cae0f420a887991d4024d3101c4af7a4fc"
 
 DEPENDS = "coreutils-native libbsd"
 

