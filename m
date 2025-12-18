Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0E0BD711C0
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 20:23:13 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1943.1766089391735649261
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Dec 2025 12:23:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KAou1qs3;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-88a32bf0248so8584546d6.0
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 12:23:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766089391; x=1766694191; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QKbcLIpZDtBl6CVPtmhnp7f16P1G8BoZBNf2JQ3rab4=;
        b=KAou1qs3Hr20dDRO+cut61iEIVZ3lvb1y6OQRr1bn1SOGWLTpw1pBt+/xBUiGEXmhS
         KsIqzZ6D9vAghTEXXvnAHt/N/WwMWzDcx7+els4P1W7K/v9S6JeJb7DpZgwkj1xbjEn1
         9cJ5XF1JzD5a5BuWaNxN5ChQTr2XBOEhP3EiLhEivpxMeGnbwUha2oiwrihm/i101TO5
         Kgpbcph4wROGPaEqW88LnfZ2a3KeX0nHLSeAobE8LMiD5og1rwkq/HP49s9K/yA26qlS
         fwa0wYM0l1bXvZDN0B8lj/5tUYc0niqMth7peINRZQyj78mIg/y4VWjQfulkUUQ4eyNF
         FwFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766089391; x=1766694191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QKbcLIpZDtBl6CVPtmhnp7f16P1G8BoZBNf2JQ3rab4=;
        b=H+j9YNX4lbDJm3BJlQfoHzHd0QXEtMK3WUHGUqEDK2Lhwc+9vOC9dXeE5y66NrMqPh
         BVKNDksT/+25D7JRXt2i69+OABSaBQf+N0smFHrdq2CC+lnjA9f1cz0e22oBHaNK87qa
         ZUxsBF28Fb84UOh0wKSgo4hYVcZgXQzoz626cW/TeiLzxXYO3oktebBXXvLE+uGYvpor
         XYrFdZe4kthEl7k8T+5WnYf+owQ2tDv99ojx6lgJN8VhBVnrNOMzBoUkLyfHqu2ZSubK
         a8tDt9lqyw0Q428bgc/35A0RDDM5OVvE/O14Bl2XmdTWVhZG6muPdzgMIMDuH4ZjOjv7
         fQqg==
X-Gm-Message-State: AOJu0YwdnCJvbBfFnouDpx6VQ9ftevDO1KqfPYDJd06QrWNTfqQfWEj/
	6s8LYJq3MX0dqX1fFdyc1IfwmInhNbHcKVuvzYdKk7TOy1bedpyouLN6
X-Gm-Gg: AY/fxX7mOdTTgApowCY/Mp9FUlUSmtWBFkmwiEnA9IhLXmSv95kcKqqWWwx8rNvfAlN
	tuCEFJLr0PSjLE4JMrrpTFD7yUtripsRJi3VaClo1P+uROd5Gq9967tuyXH2cpPV8iDPxc/Hgq7
	YRdwd+k1RGM9Sbqy19lFt2QD5IPiDdi1Sec1HKOOiyYRl4PusbNV8CXRvgF21n/fJrsZ27SCJKC
	XbqXshVUxI2YTvCSVcUsnF4tuTAQ/f19UhDTQZ04cV1IuDcWdgArlz7t/zSDOUq9y8M0N87UENV
	ZpXp1zOPn/e82nmk3RomargK+WFjBhqNEzvTLFfsylxilbHdtNN/2mD1O9aIaErrC65Ks8LCYOl
	DS0R/O2k5qYFVP0xv4UFVC/zexDcObOI7TJdmZa2IocRVAJZD1JjvS3ibv5ZPgp3UalApplswrY
	vwu82ITUdrZ2Ss8AgcW6e/EaK+b4pDDhcZZesA2ig98TEw7Cpw1ejQuVxDqpyX3XXuU/tdnsONI
	hEA6IAkW0bXQHA=
X-Google-Smtp-Source: AGHT+IE4aoa5fyjoc9FSe//wrYk4OwpKMOh0raUFnBkcALmRqivxGfltuEm2syWE6O5nhK/Du4gNZQ==
X-Received: by 2002:a05:6214:5b89:b0:880:4bde:e0cb with SMTP id 6a1803df08f44-88d82335321mr16063476d6.29.1766089390614;
        Thu, 18 Dec 2025 12:23:10 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d99d7dbdcsm3226456d6.43.2025.12.18.12.23.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 12:23:10 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [01/06][meta-yocto] yocto-bsp: introduce 6.18 h/w reference
Date: Thu, 18 Dec 2025 15:22:41 -0500
Message-Id: <20251218202248.70476-16-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1766087617.bruce.ashfield@gmail.com>
References: <cover.1766087617.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 20:23:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228159

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../recipes-kernel/linux/linux-yocto_6.18.bbappend    | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend

diff --git a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend b/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend
new file mode 100644
index 0000000..68e7b00
--- /dev/null
+++ b/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend
@@ -0,0 +1,11 @@
+COMPATIBLE_MACHINE:genericarm64 = "genericarm64"
+COMPATIBLE_MACHINE:beaglebone-yocto = "beaglebone-yocto"
+COMPATIBLE_MACHINE:genericx86 = "genericx86"
+COMPATIBLE_MACHINE:genericx86-64 = "genericx86-64"
+
+KMACHINE:beaglebone-yocto ?= "beaglebone"
+KMACHINE:genericx86 ?= "common-pc"
+KMACHINE:genericx86-64 ?= "common-pc-64"
+
+KBRANCH:genericarm64 ?= "v6.18/standard/genericarm64"
+SRCREV_machine:genericarm64 ?= "2a6b42e5c86e010e52dc2908775a92048987d65c"
-- 
2.39.2


