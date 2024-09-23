Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E595DCF9C74
	for <webhook@archiver.kernel.org>; Mon, 23 Sep 2024 13:14:13 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.36269.1727097250942611594
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Sep 2024 06:14:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=2QbP3mGw;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-719b17b2da1so1086224b3a.0
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Sep 2024 06:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1727097250; x=1727702050; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KfU1ATu8YF/XeYDsAmlN1vIrMqYMHOtO44r1vZeZtaY=;
        b=2QbP3mGwZp4vrwM2lRWq/lvnf+9tAj9K5cACUydQ0MHfaZUU3+IrOh9t3rUErObqUh
         YUWgVL6/Ahs4xz+U9Kf9SONZLYio3feHNeHOE1ZYNN1KR8eA4MR+InWoQYHEOYj+am34
         kC3WhdnsqinM4kzWa9Ue/VR69tcCYvd+R88Ic77giZ1M4WNrbDWPAFCiptZg8Ew/cS8P
         3Njot+4zyTezYaC9HYvglkh9bpAmchnoLas65AvJAEW+DpkIoAP63RGMRmbstqFNixWD
         N2uBg2Ganp4/Dn4ZKWDa9gK70qajXKGBuKiTPxFd3IOkVEFfamYihsriEiX11rtCyk50
         tvOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727097250; x=1727702050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KfU1ATu8YF/XeYDsAmlN1vIrMqYMHOtO44r1vZeZtaY=;
        b=P/FhQaVs96YW/WY/CIjGKjTyOZAJbfbDhBkj/+ix6AwhKvEhmxKZQhS1Ya8op+GOFc
         ETNgcgBPAYW5GvltF1vhYVDJkdcryPTQ6/EBgxakTGgC8PyiflHFGHoRx3bi1kZvFyD8
         l9kalfcpDExButvFzjXdGhL5H9tSUyqeo3yoN5O8IFJBOzEVdEyGvfgh1T65TjyU4+rv
         AOwtbHM3AL61+iGb7AdDTuEzy8ACgVdwvbcgHKQV7E/CWGWpAXPUajrUeQ8hf8F2tchq
         vPCHXPNpjL/0CL4CNDZAHw+PN4uSwppHRiR1z1Bnk7JC5MdJ27C0gWnCJbNpAgeF9dd1
         MPhg==
X-Gm-Message-State: AOJu0YzBcOTIh+aUetqxsmAngq6hCO0SC/1P8sLZxkxTga2LOvW9/dQk
	d9cnTh/xqYAwSJCZ5R0nJ1/wJdirw/WSeNwFPzzfZr1d84pWa6s+2znaunX2NVyEyEIqXYMr+6R
	NOJ4=
X-Google-Smtp-Source: AGHT+IFHwOKn3LDwJCR/f40T6IjZOcCRy5z4jBXn6zSX4ezSagRAxOS86+46Y1Ft7nCR2O0oJnAOjQ==
X-Received: by 2002:a05:6a21:178a:b0:1cf:37bd:b548 with SMTP id adf61e73a8af0-1d30a9b1af3mr15582101637.37.1727097250133;
        Mon, 23 Sep 2024 06:14:10 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944b7ee58sm13831391b3a.127.2024.09.23.06.14.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Sep 2024 06:14:09 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 05/15] yocto-uninative: Update to 4.6 for glibc 2.40
Date: Mon, 23 Sep 2024 06:13:46 -0700
Message-Id: <81b225f27ee22c2533e9698fe27163d7c7fe295f.1726971209.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1726971209.git.steve@sakoman.com>
References: <cover.1726971209.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Sep 2024 13:14:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204811

From: Michael Halstead <mhalstead@linuxfoundation.org>

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b29bfd333dffe635ab67475dcd8d22ad8b114c84)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/distro/include/yocto-uninative.inc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index 657c1032f9..a6f7107dfe 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -6,10 +6,10 @@
 # to the distro running on the build machine.
 #
 
-UNINATIVE_MAXGLIBCVERSION = "2.39"
-UNINATIVE_VERSION = "4.5"
+UNINATIVE_MAXGLIBCVERSION = "2.40"
+UNINATIVE_VERSION = "4.6"
 
 UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/${UNINATIVE_VERSION}/"
-UNINATIVE_CHECKSUM[aarch64] ?= "df2e29e2e6feb187a3499abf3b1322a3b251da819c77a7b19d4fe952351365ab"
-UNINATIVE_CHECKSUM[i686] ?= "8ef3eda53428b484c20157f6ec3c130b03080b3d4b3889067e0e184e05102d35"
-UNINATIVE_CHECKSUM[x86_64] ?= "43ee6a25bcf5fce16ea87076d6a96e79ead6ced90690a058d07432f902773473"
+UNINATIVE_CHECKSUM[aarch64] ?= "c2d36338272eba101580f648dd8dff5352cdb4c1809db7dedf8fc4d7e7df716c"
+UNINATIVE_CHECKSUM[i686] ?= "0041584678109c18deca48fb59eaf14cf725cf024a170ab537b354b63240c504"
+UNINATIVE_CHECKSUM[x86_64] ?= "6bf00154c5a7bc48adbf63fd17684bb87eb07f4814fbb482a3fbd817c1ccf4c5"
-- 
2.34.1


