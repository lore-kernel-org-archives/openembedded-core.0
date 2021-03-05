Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web12.7550.1614916471164155560
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Mar 2021 19:54:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jqeZIAkk;
 spf=pass (domain: gmail.com, ip: 209.85.222.172, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f172.google.com with SMTP id d20so788832qkc.2
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Mar 2021 19:54:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EZTBpVqw7V7OybnERa2xh+ZXVoCAHm4Euv5aTscndRE=;
        b=jqeZIAkkZsXCl41Ozhv5zwM87fru3hAegckzbcWGSEjG0de5vl7thXmTUbTpjORAC1
         WAX2tC/K+jbXU5HmemGRZ8JMKMYiJbpU/2298AGiPXWyTtnTxpklhqM+xaN8ysrY+zEf
         NCR3oz7mZ+ZKtph4oEyZ2MtfO9nA7MrJb873hpb+zwgal4WUS/jB+A30eBUQPfXTcpPk
         bd/CZCYWKCJJNDZGDgCq9WjVhS02e/CzrpLSwqN3ZmWHGm2I/ku37OIPEgwQOcFgwkyI
         i1xPWNobjVr3aJB/ZBdvGyKHHaqsSpncA3QHC+Q0TxAHax/PuLBtTNy6akOjH0VVmzQD
         /oWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EZTBpVqw7V7OybnERa2xh+ZXVoCAHm4Euv5aTscndRE=;
        b=Qqm58XUcC7E3yJqDdgoK3HVsyY/HQhK71wC6cRf76Hjv5L4XC1ujKwF+d3YygvBfhl
         q60olD/Fn/ZH0T7KtAngg074SZuIVd2iCYaWxh9dWWvYhUpwn/LtIjWAdb8BuA6byB5B
         bWPz/tthsLX2UJrsOjyLWPVDfrtcJNjNaG+MV4kGF5eYwmLAxKHbkFiKDgnFxCBMJ9Gx
         VYPgtEurdNs710dkQdYr3ANRC/X0JZF1UPF9OOST3VThGKxw8JTcQW0wVB4U8F3CjF4I
         ZdxRMiqRLchXhDdKCma+CwwAcKQfCWPsgT9HB9YZLPtCU6h6HpOfT9atKS73jfTN18S+
         hGqA==
X-Gm-Message-State: AOAM531MZuj+/4KI9K718Nly6RJ7b+MtwdSj06E22mARzzD2lsCfE1CE
	0RO8BrRZo4kP9IW2B8VaSoo=
X-Google-Smtp-Source: ABdhPJz3T+5b6vFDnXnvRnJEQETvQDP/aESsltckS411FRp4cUn4OTPw5Z2fTKvyVMiSPS92JD99TA==
X-Received: by 2002:a05:620a:24cd:: with SMTP id m13mr7561378qkn.273.1614916470319;
        Thu, 04 Mar 2021 19:54:30 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id 66sm997383qkk.18.2021.03.04.19.54.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Mar 2021 19:54:29 -0800 (PST)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/6] linux-yocto/5.10: fix qemumips testimage failures
Date: Thu,  4 Mar 2021 22:54:22 -0500
Message-Id: <9c95a9f46a7f7feadc42efc06d968668b48d8cd5.1614916283.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1614916283.git.bruce.ashfield@gmail.com>
References: <cover.1614916283.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/5.10:

    513e9332a00 qemumips32: disable CONFIG_COMPACTION

As mentioned in yocto bug: https://bugzilla.yoctoproject.org/show_bug.cgi?id=13992
testimages are failing due to issues with kernel page migration/compaction
function that does not work very well with MIPS kernel HIGHMEM that
is needed for 512Mb.

A valid workaround is to disable CONFIG_COMPACTION and the problematic
migration functionality is also disabled.

[YOCTO: #13992]

Signed-off-by: Victor Kamensky <victor.kamensky7@gmail.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.10.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index db17ffa5c4..26772a1acf 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "8dffd4d97d49439dae98e38b915729bca285f0cc"
-SRCREV_meta ?= "72ecf520873bd0e1a1d52db0a36d74ad88fd9824"
+SRCREV_meta ?= "513e9332a0092795b3b29eec0030b462ae4c8b6e"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 1bdacd86c4..7388e6ecda 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine_qemuarm ?= "55ff861a7f7be737c26b6c61f9cd170580dd3ccd"
 SRCREV_machine ?= "34523d7c8476942eb062d4f0201f9410605afc6d"
-SRCREV_meta ?= "72ecf520873bd0e1a1d52db0a36d74ad88fd9824"
+SRCREV_meta ?= "513e9332a0092795b3b29eec0030b462ae4c8b6e"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index c8ec0ae6b0..e17cd28601 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -21,7 +21,7 @@ SRCREV_machine_qemux86 ?= "34523d7c8476942eb062d4f0201f9410605afc6d"
 SRCREV_machine_qemux86-64 ?= "34523d7c8476942eb062d4f0201f9410605afc6d"
 SRCREV_machine_qemumips64 ?= "36e98aa424aa3ceff3d446ee2cb3f44ddcae8c31"
 SRCREV_machine ?= "34523d7c8476942eb062d4f0201f9410605afc6d"
-SRCREV_meta ?= "72ecf520873bd0e1a1d52db0a36d74ad88fd9824"
+SRCREV_meta ?= "513e9332a0092795b3b29eec0030b462ae4c8b6e"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
-- 
2.19.1

