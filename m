Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B40FC001E0
	for <webhook@archiver.kernel.org>; Sat, 21 Oct 2023 15:28:57 +0000 (UTC)
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
 by mx.groups.io with SMTP id smtpd.web11.81419.1697902127371386862
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Oct 2023 08:28:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=dzHwQxqV;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.180, mailfrom: steve@sakoman.com)
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-357cea96a40so182105ab.0
        for <openembedded-core@lists.openembedded.org>; Sat, 21 Oct 2023 08:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1697902126; x=1698506926; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x40d6R5PuAANO8v+D7mJdMnik7xilYIiuzoSOIfAGUQ=;
        b=dzHwQxqVQyP+0HTaoW5DS6dBgzLZT5pnBXbhrqBxegUS9tJNtOWShjgua0OyGSK8KK
         sEMg9UDOiBhzvdVmUJBm6b3bEohI75Q1TV2CZnISeCwU+rGb/zHmYFb7jSGU/5Q1zlF+
         A+aWUiHoMbs+TRW8qulyi2e+eY3STYS67iaciMFRGm4Eam7mZC7944OW8oBJEfucDasE
         F7kq/64ekvUj28ANZJYUpl/xydxdKcaNRlDBQ/+COxfSUCun0FulOC63mpiFVoTYVySw
         hKslzmfNj12ZhzgexZZNmJH/j1Jv1u/JcPfV5KvmbnZVaWaS2sPJ59Hz8Av96E975li9
         RrPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697902126; x=1698506926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x40d6R5PuAANO8v+D7mJdMnik7xilYIiuzoSOIfAGUQ=;
        b=rb0jEasqS9ZThhHiM65Sfns6v9RN1iVg7LAg5Q2bLY3JIlmfEK1FNWPzB+xI54XfeO
         Z8e4g8B7J9bz8zVaeQjHNhvDrnwq36BbcMUdDP6MADZq+WdyuazM9/1H/Il6pCSMzVl/
         Z93sohXIpOSFErwQzNlVFF91YcFid58JEDMD4MCBhdqT+CfSy49T4/vrPNV+kAgCMMlc
         s1HO2G42ii2F98JYbRrWDdMLS5S4Spi/6eSSW0aREqQbammNePVHryJF4iG3DxAVoKWb
         xrOia4h7pfex7+AWLiXqjCw4nZtOqUWnE25VyE2RtIekoCKtfrDaWtSvWU7FOPlh/8B3
         4bvw==
X-Gm-Message-State: AOJu0YyCtHcoVCjuULPdSE0gijGkyNAtYLutswENK57rRZwLtzwcZDfj
	hsSRqwG2nbuyahOoicQrx+L3RxxOmxp3hX8G1a4=
X-Google-Smtp-Source: AGHT+IHPbU7DRiyBvZAS4/Pe7ms+nsjFV/+TuaaGkqw7JvjhmkIKsY7dXb2SBNZPhe6tP1ELIpv/Gg==
X-Received: by 2002:a92:cb4a:0:b0:352:749b:720e with SMTP id f10-20020a92cb4a000000b00352749b720emr5085471ilq.12.1697902126261;
        Sat, 21 Oct 2023 08:28:46 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id by2-20020a056a02058200b0058c1383fa8bsm2876515pgb.0.2023.10.21.08.28.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Oct 2023 08:28:45 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 4/6] linux-firmware: upgrade 20230625 -> 20230804
Date: Sat, 21 Oct 2023 05:28:30 -1000
Message-Id: <d3f1448246c9711f4f23f2e12c664e0ba3ae3f02.1697901991.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697901991.git.steve@sakoman.com>
References: <cover.1697901991.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Oct 2023 15:28:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189591

From: Meenali Gupta <meenali.gupta@windriver.com>

License-Update: additional firmwares

upgrade include fix for CVE-2023-20569 CVE-2022-40982 CVE-2023-20593

Changelog:
      https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/

References:
      https://nvd.nist.gov/vuln/detail/CVE-2023-20569
      https://nvd.nist.gov/vuln/detail/CVE-2022-40982
      https://nvd.nist.gov/vuln/detail/CVE-2023-20593

Signed-off-by: Meenali Gupta <meenali.gupta@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...{linux-firmware_20230625.bb => linux-firmware_20230804.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20230625.bb => linux-firmware_20230804.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20230625.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20230804.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20230625.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20230804.bb
index 6765226b9d..4defab434d 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20230625.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20230804.bb
@@ -134,7 +134,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     "
 # WHENCE checksum is defined separately to ease overriding it if
 # class-devupstream is selected.
-WHENCE_CHKSUM  = "57bf874056926f12aec2405d3fc390d9"
+WHENCE_CHKSUM  = "41f9a48bf27971b126a36f9344594dcd"
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
 # so that the license files will be copied from fetched source
@@ -212,7 +212,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
 # Pin this to the 20220509 release, override this in local.conf
 SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
 
-SRC_URI[sha256sum] = "87597111c0d4b71b31e53cb85a92c386921b84c825a402db8c82e0e86015500d"
+SRC_URI[sha256sum] = "88d46c543847ee3b03404d4941d91c92974690ee1f6fdcbee9cef3e5f97db688"
 
 inherit allarch
 
-- 
2.34.1


