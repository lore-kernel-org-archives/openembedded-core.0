Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F350BEED603
	for <webhook@archiver.kernel.org>; Thu, 12 Sep 2024 13:17:22 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.47704.1726147041698048105
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Sep 2024 06:17:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=fOA0xszF;
 spf=pass (domain: mvista.com, ip: 209.85.210.175, mailfrom: vanusuri@mvista.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-718e6299191so507882b3a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Sep 2024 06:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1726147040; x=1726751840; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DbwHP1XwpjD7E7vXs2F1ItmOTGoj5jynkVib4zPUVAs=;
        b=fOA0xszF0b5Jq7cyQNtjtRj7y4NVlrXd94KrvRQmimSCbMR1e98ilELX1+zOFwBtIU
         A3oRQMCSvNref1t7R1njpBf26j1A9/w80qjlKq4qTE9R3lkRF+DkuDAkRuYGzlkzViep
         apfwX3HgeVd8DZQ68dLQGHmgXkypPtk1pE4QU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726147040; x=1726751840;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DbwHP1XwpjD7E7vXs2F1ItmOTGoj5jynkVib4zPUVAs=;
        b=Bhx5oINrOJVPEze3KphjGvgZjO0uU+iYNwQEV5k6th95DEwiLyGaX1eeC61AxDr7Rz
         TpkmCThUl5dPGhmD+vEMP1WNgpp7nc5du9bK8nt5xMfhHpZWEmr3PGjvwLmYc/rBaBoH
         JAYM+zGVRTXNssjV1sP0AqM3+SH6UTfRP7b9IcoIuJQstmQLzY4PrW1ljo7JvMOv5GM9
         3zFEvHNWVeT1GIWCDRtB+jh9Beksz8iQhBzvXHl6pzQRmiLD0fYobO5sdkV+aOA64upA
         8w1iDx9o29TfZ0CfCpE4ZslmvSs/Uz14t1jueUaoJ4K23zj2l5z53bEG6rXTRmc2w29f
         X3bg==
X-Gm-Message-State: AOJu0Yzoz5jV0w2DP2lSuu/gD9P40AHFjHhPP9hcKR8Q7kZojL6g9G3w
	TSoiumFjZfqhSo3gJedBCV/MWWnZHWYNL5+k3SGDHE14Xg2OGGHjvMSCOUkhvIKMuoVrncTfl+6
	dyVk=
X-Google-Smtp-Source: AGHT+IHK8kv38kLrK64E29fdzSkQz4+7jazGFrkHc274xPI+zyD+eaxISwiF0Wi3jja72EbvNU3C9w==
X-Received: by 2002:a05:6a00:2401:b0:718:dd53:70db with SMTP id d2e1a72fcca58-7192606c438mr4282535b3a.11.1726147040543;
        Thu, 12 Sep 2024 06:17:20 -0700 (PDT)
Received: from MVIN00020.mvista.com ([2401:4900:882f:cf86:a4f2:e962:770a:c35a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-719090b0397sm4537830b3a.154.2024.09.12.06.17.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 06:17:19 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH] libpcap: upgrade 1.10.1 -> 1.10.5
Date: Thu, 12 Sep 2024 18:47:11 +0530
Message-Id: <20240912131711.243389-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Sep 2024 13:17:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204443

From: Vijay Anusuri <vanusuri@mvista.com>

Changelog:
https://git.tcpdump.org/libpcap/blob/HEAD:/CHANGES

Includes Security fixes
CVE-2023-7256, CVE-2024-8006

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../libpcap/{libpcap_1.10.1.bb => libpcap_1.10.5.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/libpcap/{libpcap_1.10.1.bb => libpcap_1.10.5.bb} (92%)

diff --git a/meta/recipes-connectivity/libpcap/libpcap_1.10.1.bb b/meta/recipes-connectivity/libpcap/libpcap_1.10.5.bb
similarity index 92%
rename from meta/recipes-connectivity/libpcap/libpcap_1.10.1.bb
rename to meta/recipes-connectivity/libpcap/libpcap_1.10.5.bb
index dbe2fd8157..94b6466722 100644
--- a/meta/recipes-connectivity/libpcap/libpcap_1.10.1.bb
+++ b/meta/recipes-connectivity/libpcap/libpcap_1.10.5.bb
@@ -10,8 +10,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5eb289217c160e2920d2e35bddc36453 \
                     file://pcap.h;beginline=1;endline=32;md5=39af3510e011f34b8872f120b1dc31d2"
 DEPENDS = "flex-native bison-native"
 
-SRC_URI = "https://www.tcpdump.org/release/${BP}.tar.gz"
-SRC_URI[sha256sum] = "ed285f4accaf05344f90975757b3dbfe772ba41d1c401c2648b7fa45b711bdd4"
+SRC_URI = "https://www.tcpdump.org/release/${BP}.tar.xz"
+SRC_URI[sha256sum] = "84fa89ac6d303028c1c5b754abff77224f45eca0a94eb1a34ff0aa9ceece3925"
 
 inherit autotools binconfig-disabled pkgconfig
 
-- 
2.25.1


