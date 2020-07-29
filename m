Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com [209.85.219.68])
 by mx.groups.io with SMTP id smtpd.web12.4606.1595989736590160511
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jul 2020 19:28:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=S/82HD1b;
 spf=pass (domain: gmail.com, ip: 209.85.219.68, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f68.google.com with SMTP id dm12so10159954qvb.9
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Jul 2020 19:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vIAJTeqiYTggUSgUmgdoQFt04GYpiMBMPjX/WHNxvo8=;
        b=S/82HD1baEWhO7+5RzVNrIpt1/+iBaDEOy6UfATwIrr8fDpDfgowcwTE/slO+FJg9N
         Dl0wT6C7pq2h6MNdUrtZBUTvi1k2/xnS9eFgMVvBi0ctLDjCVTq2eVIgvDl0/2DB8dlN
         KvhW1UUHm9nTQCBWM+FYslFJosEBFMLxfiOk2zo7SPxMg7Aep8pEGObJev27barXEZ9U
         x/pRernL/b3Wvcfm1N4CU9Kl4qO9M+J0dQ75p3QTZIe8rmIdrUo9HSpZum/t4UM3mcsz
         +VuR4Ye62FGwdyf1/qMthJnS1JUAia2AcvNU1p9yWhPC/QbIKuk/87iOUxgg3kuqMlnl
         lsfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vIAJTeqiYTggUSgUmgdoQFt04GYpiMBMPjX/WHNxvo8=;
        b=eRtHmCtP3TgWjZp5gZ62zyWRYAzhVa2UH3VF8Am/LD4DBDdPKBrTHHw0sCIMh6/zBG
         bxLxZbGK8mn2snQgzgNXnLjV0PSme9zMHx9tbL/mlvBWBhKHYYtXBAc+QRHgIY3ZJcqO
         PbOwQk9qUnVMTgNbjMnKtEiLzwSym0GJSvoq9dN+YGSWeOa0VZw/oOn4UjRYTjc4tVmC
         frCWIi5JejknhDmx2ZxpSWwq7m3HIOMGWuBRCp9cOiGgcWQsx1mZvqPWIBfTlCPyzCmg
         zSg1H4OL1ytknA/jhEGY48gQChOr+xvu1TczAcg5iyfCqEvQ/WYDms9J+v7pg7zkCLpf
         55IQ==
X-Gm-Message-State: AOAM531u+KEAKONm0khLEUEta8y7lQ6eUgZbxztV1iaiPGhE/ODAwxBA
	T0xh0JWh2ZOPhalU5RWBulbV9m6OixU=
X-Google-Smtp-Source: ABdhPJwuh3/UCHsBDKDxDTjsvc3ml4FgVUiIaZGKQfl6M3MMxRGGObn4zurqLLRv7g1pK1nvVHbTyA==
X-Received: by 2002:ad4:452c:: with SMTP id l12mr30166987qvu.198.1595989735384;
        Tue, 28 Jul 2020 19:28:55 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.cable.comcast.com ([2601:646:9200:4e0::e841])
        by smtp.gmail.com with ESMTPSA id 205sm480947qkj.19.2020.07.28.19.28.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2020 19:28:54 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] qemumips: Use 34Kf CPU emulation
Date: Tue, 28 Jul 2020 19:28:52 -0700
Message-Id: <20200729022852.1792061-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Few years ago we switched to using mips32r2 tunings for qemumips however
the default CPU emulation still remained 24Kf which is not optimal for
mips32r2 ISA for qemu [1], therefore switch to recommended 32Kf for CPU
emulation when running qemu in system mode

Boot time to console is ~1s faster with this setting, hopefully this
should speed up qemumips in general

[1] https://www.qemu.org/docs/master/system/target-mips.html#preferred-cpu-models-for-mips-hosts

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/machine/qemumips.conf | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/conf/machine/qemumips.conf b/meta/conf/machine/qemumips.conf
index 31ad754483..4617c3c7b6 100644
--- a/meta/conf/machine/qemumips.conf
+++ b/meta/conf/machine/qemumips.conf
@@ -12,3 +12,5 @@ KERNEL_ALT_IMAGETYPE = "vmlinux.bin"
 SERIAL_CONSOLES ?= "115200;ttyS0 115200;ttyS1"
 
 QB_SYSTEM_NAME = "qemu-system-mips"
+
+QB_CPU = "-cpu 34Kf"
-- 
2.27.0

