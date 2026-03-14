Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1E8711258BE
	for <webhook@archiver.kernel.org>; Sat, 14 Mar 2026 09:48:13 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6654.1773481683667857711
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Mar 2026 02:48:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=eKlcbu5W;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-439b6d9c981so2060279f8f.1
        for <openembedded-core@lists.openembedded.org>; Sat, 14 Mar 2026 02:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1773481681; x=1774086481; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PS0Sp+CqAY+4ZJtFWXncZunoBUVybZ4QlUKUNFQkxCY=;
        b=eKlcbu5Wqpn9o//f1rTDdy4q+rOYgez7R9bbfpefbzLLw7IBDNYNKFt2YsuRRW08/G
         1jxLAZQW0w0M/U3XzrU0nC+swnxM0w20o2Nv9pSSoum8PvmbygwnVgc682M+/Vc6e1I8
         rCgFnGXSBNlPVSfwjTalFAlXIjAa46vlPOqJs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773481681; x=1774086481;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PS0Sp+CqAY+4ZJtFWXncZunoBUVybZ4QlUKUNFQkxCY=;
        b=pd6R/irx0zr0KNv5dnQgs8f3hBsI2wzNbAPKrbm8utRtsr95hvfQFmFDECqtEroDnn
         6wwZmOCMkGoX8xXyBiG1m4hG1+WYT9kEPDPrwcIXLugo3kaLuHV+RKaShlj8GKuhipjx
         f0qCzGI8rYv+TZqltJif9y1AT94sAuys1pgjWAuy7h5AoyQvzGsMCfCZuB6zS78FaIZU
         rHx+F6chnb6fptEWvHpRlzp9nzv7CkZLAthZhqWMn418ogVT1EvK/41DugT4wqbC7Tr9
         MsoyHK6TrucxKbl7OdY42iQpcWyG6RQ0G4hLx214VUqLX3mAjxqNAqGYcJ0gyHVJHfzg
         KL+Q==
X-Gm-Message-State: AOJu0YwApjRoUKv9rp/zg+ArEPsVbuwQhO3FT+TQIfuCy9gCrTv2lUc0
	QQbKvUAX6C/ndwV12Ca5CyGg9fC8AQs+7AzjjfYfuSwsl5hiLyMicBUrYLUnFpOWOyRKOpRmv5Q
	eUFctxvg=
X-Gm-Gg: ATEYQzy4mF69mrv+62UUv2Lr59UuHTAVbk5VPKRPE7U5xqht5WFzBwaU9Hv/nfUWg4q
	ydS1OrlkQ/Yu6p51TXD2Bme1Z8PNibMAgG9DmP0cr772DiyeVCcOrLcFWkDHpo9t8c77O0mSnPj
	Sxw5nk5M83kyaMhBr0LDwkobotEueStd2m/xvwIGZso+gKHMq7t0QeplEllt8XVNhF0JIAFbpla
	0rOPYmFdT4Jc5yl90Jr0+h5rC5vriPeSjn5FRVw6KCJepENxuAOwdqKf8SdyaQ1V908jBPYlTZV
	jf9iKHhBIZv659Y5Kmo2SkO3xco4qfUfCEwj1iU0dahvlYZcLBtK42j7P8T9bkwrQxPRFREMQlc
	8LLzkcPfkGh1It8HpT7wyf9VZmejfXfPGAsi6dPQ86M+/lQVVXvmtPeSBDZDpnbTEnexnWZjsoO
	1szIofdFnzdjKAutHdOBF6JC2cBexVljXcA9QGYl//sW4PFYUz3Ng=
X-Received: by 2002:a05:6000:2210:b0:439:5fe4:421a with SMTP id ffacd0b85a97d-439fe1aef95mr19330315f8f.30.1773481681584;
        Sat, 14 Mar 2026 02:48:01 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:1366:c81f:8eb8:9990])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe20b544sm26554680f8f.20.2026.03.14.02.48.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2026 02:48:00 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/5] bitbake.conf: Add SDKMACHINE to BUILDCFG_VARS, drop TARGET_FPU
Date: Sat, 14 Mar 2026 09:47:55 +0000
Message-ID: <20260314094758.3929192-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260314094758.3929192-1-richard.purdie@linuxfoundation.org>
References: <20260314094758.3929192-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 14 Mar 2026 09:48:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233077

Tweak the default build header to add SDKMACHINE and drop TARGET_FPU since
that data is more likely to be of use to the general user.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 5f632d9f8e7..6b3443695a0 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -761,7 +761,7 @@ PREFERRED_PROVIDER_virtual/fakeroot-native ?= "pseudo-native"
 
 # Pre-build configuration output
 BUILDCFG_HEADER = "Build Configuration${@" (mc:${BB_CURRENT_MC})" if d.getVar("BBMULTICONFIG") else ""}:"
-BUILDCFG_VARS = "BB_VERSION BUILD_SYS NATIVELSBSTRING TARGET_SYS MACHINE DISTRO DISTRO_VERSION TUNE_FEATURES TARGET_FPU"
+BUILDCFG_VARS = "BB_VERSION BUILD_SYS NATIVELSBSTRING TARGET_SYS MACHINE SDKMACHINE DISTRO DISTRO_VERSION TUNE_FEATURES"
 BUILDCFG_VARS[type] = "list"
 BUILDCFG_NEEDEDVARS = "TARGET_ARCH TARGET_OS"
 BUILDCFG_NEEDEDVARS[type] = "list"

