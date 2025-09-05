Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7010FCA1016
	for <webhook@archiver.kernel.org>; Fri,  5 Sep 2025 16:09:39 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web11.583.1757088571670302440
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Sep 2025 09:09:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SJZ0UE8N;
 spf=pass (domain: gmail.com, ip: 209.85.222.177, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7e86faa158fso248153285a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Sep 2025 09:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757088571; x=1757693371; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oc2PU+YKSXxNYm5S3opdr2gGmwfSfz13L9YNXatGykk=;
        b=SJZ0UE8NuKqQUe1rpfHCPOivtJymn7/ee6q+kG+bTvv52u520uBno00Kc3r2YCnBmX
         4ZoXNOaEnJWwCpMkDDDdXCEntjSlTz42gvh4GxsXuxeJcwUm4Rtqqa2G98UbR49KPSvN
         H3JZSmi7w6e2Enponqmeau9tSTuZR/PhBmW4OF1sTv7DvlGaeqG9UXL/fOvbhR88biEQ
         Tt7AqHfj8g91hFkg6lA69oAX+BixsBTSJMIsent0b5thCWss2ny2Oa1D6I6NghMFCXBV
         r8FObNEFrx1OnAkCpjpeGfXzecBWZcBVhwgRU9H6+RSDWBLatoRU4gsZ5Bszk4jcIBEa
         +k0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757088571; x=1757693371;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oc2PU+YKSXxNYm5S3opdr2gGmwfSfz13L9YNXatGykk=;
        b=uYrd7nsrjMe5+tI98W1U1MqSZsK+uKHxnsLxI82Qk9SBZQ4tSEPi90j6i8bFtlnW+G
         7pKOgT6NpQBlXBWOFLbfr1DKVIhHvvgUTNtxDBuSg3DRJeWzxWfkNlvciQT+DP0SFFYj
         O8hkBtb5cuFlZrOts1Di1We+WcW1cD3mlYQ6U+EKbkMYtZA2d7mdVjQUxgEjrWPF7enx
         f7dcPpgB84ngoK7Q+DmAfoP921rWBeyv4W8QKBE6ufMr+bAnARHiibeq1VUNTynYb1je
         /w/WksoxMBulekAF4AZNAKHcKqquTfxUPlwjsXMV/huQ5b7BybGTVyPzqYDkhl02+trl
         8sXg==
X-Gm-Message-State: AOJu0YyhSCszm3wqAXwun6Q2NZ2gGCi7qkD6G1KNePOnfok02mMa3bP5
	oYc6U7IiPmtS8kXKRi+6XCXxj9x0Xq+gKVtAUtXL5yDdaLNWmxoGauAnBxx4JHEI
X-Gm-Gg: ASbGncurOivJCU4pbiwqMcfRhmQy67tBXa8fK4kne1jl+BaRhwQsEWnMrMRUD0DxyBD
	Tqg30iL0PAXKd/B5eEpzuzluY2c4fpwiFFYgv0N2aDm2fGiHMifKlNWWCANmA1Az+jx0J3j+2w5
	ZoV1ZaxRYc5JO3ottsvnaPxgA/dV29SYubrz/BJjM7frHH1pzXvbreIAaHh6sSR5IVxluLsk48w
	Z4GXI2Ln9VzKtGf4iYKZi68Xi+gWJ8lYZpBIU7vdEgmuU8CygtOeQ61D0gW7QDBzqt4qe70H4yv
	M/64eklChsGXVr0iE7eBB82JK5CRxY7cBrd7xGEGRY7oCn0VbN/mtoH2vxmxB4Tao92r+jrafKI
	AUsGbSRNIABzxMJR5iDvaQNjg2TBp5cjLlEF9bzFKTZwVBxx/kzUyjvHETGWSVKtOSouFb4PhuR
	erNgBtlmZ9gqq8DPR1PKo3Q3Ph/V9z0m1rxsNVvi9NmZWew2g9sS1lpvM=
X-Google-Smtp-Source: AGHT+IFPsAT3HVknFA861uG2ZmCTrhNf5qy+xa4bu6e4XU3/flWhtxc29dK9OefIfEfHZY+pmCFY/g==
X-Received: by 2002:a05:620a:4628:b0:7f3:c6ab:e836 with SMTP id af79cd13be357-8109a54dc48mr459575085a.18.1757088570274;
        Fri, 05 Sep 2025 09:09:30 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-720ac16de30sm69127446d6.7.2025.09.05.09.09.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 09:09:29 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/5] poky: bump default kernel reference to 6.16
Date: Fri,  5 Sep 2025 12:09:23 -0400
Message-Id: <0074b1cd80c242493c1e50d9ff58cc4427272a50.1757088383.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1757088383.git.bruce.ashfield@gmail.com>
References: <cover.1757088383.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Sep 2025 16:09:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223011

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Bumping the reference kernel to 6.16. We keep the alt distro
on 6.12 for better coverage.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta-poky/conf/distro/poky-tiny.conf | 2 +-
 meta-poky/conf/distro/poky.conf      | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-poky/conf/distro/poky-tiny.conf b/meta-poky/conf/distro/poky-tiny.conf
index 81153b3b36..84baef347c 100644
--- a/meta-poky/conf/distro/poky-tiny.conf
+++ b/meta-poky/conf/distro/poky-tiny.conf
@@ -41,7 +41,7 @@ FULL_OPTIMIZATION = "-Os"
 # Distro config is evaluated after the machine config, so we have to explicitly
 # set the kernel provider to override a machine config.
 PREFERRED_PROVIDER_virtual/kernel = "linux-yocto-tiny"
-PREFERRED_VERSION_linux-yocto-tiny ?= "6.12%"
+PREFERRED_VERSION_linux-yocto-tiny ?= "6.16%"
 
 # We can use packagegroup-core-boot, but in the future we may need a new packagegroup-core-tiny
 #POKY_DEFAULT_EXTRA_RDEPENDS += "packagegroup-core-boot"
diff --git a/meta-poky/conf/distro/poky.conf b/meta-poky/conf/distro/poky.conf
index b12df2be70..d86630b153 100644
--- a/meta-poky/conf/distro/poky.conf
+++ b/meta-poky/conf/distro/poky.conf
@@ -19,8 +19,8 @@ POKY_DEFAULT_EXTRA_RRECOMMENDS = "kernel-module-af-packet"
 
 DISTRO_FEATURES ?= "${DISTRO_FEATURES_DEFAULT} ${POKY_DEFAULT_DISTRO_FEATURES}"
 
-PREFERRED_VERSION_linux-yocto ?= "6.12%"
-PREFERRED_VERSION_linux-yocto-rt ?= "6.12%"
+PREFERRED_VERSION_linux-yocto ?= "6.16%"
+PREFERRED_VERSION_linux-yocto-rt ?= "6.16%"
 
 SDK_NAME = "${DISTRO}-${TCLIBC}-${SDKMACHINE}-${IMAGE_BASENAME}-${TUNE_PKGARCH}-${MACHINE}"
 SDKPATHINSTALL = "/opt/${DISTRO}/${SDK_VERSION}"
-- 
2.39.2


