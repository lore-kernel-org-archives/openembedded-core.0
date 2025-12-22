Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41DDFE69199
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 20:08:47 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.87697.1766434117159858872
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 12:08:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bwFTzDLQ;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b7633027cb2so787383966b.1
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 12:08:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766434115; x=1767038915; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GEPb2RSxfPf5W8mXCj8YTJba2Wwhol8jgxZ6aTI6+RQ=;
        b=bwFTzDLQQVRwh4jVfmy/uRnDRNUeTcvcSh9Fii0QcLQYEFafor60itirtAzDswcvOR
         XiROvTmmNxkexnVHsCfvCE7dsudncfayxqsgUq0hKf6fRXvzPgxKKVUD/ATqrIyUuxpI
         Lp8cGX9KZtM3yd6IcdWh0zqLIeNfvji0PYqKnpn4TA0U82Mh+TcjwAtVE8J3pl326Q0M
         mYpixc3QQOPuQFjayGeKS9vjN+qWb1FI4QobfSjOJSFhZOKBxov85hg8QvJJddb4NGTO
         dk5M2/9QuSTitEwvTjYxHqIrmDqfcvzcYaMyFOxg/Krgdms2guOnaVs1cDZFGbM/bHaC
         T7bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766434115; x=1767038915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GEPb2RSxfPf5W8mXCj8YTJba2Wwhol8jgxZ6aTI6+RQ=;
        b=m2RmdIiXuLIusuLa/m3rD7Zb7cH0xIfqABrBqIR+w2RXC8ygPHiA27hqcvDEhIxGCg
         st+qR2qGtqpPzmqhTlkwNCkGA4bh2UV69EnrL+FNK09GdlcCszofI9c6CoLGz9NHFuDN
         E6K5S8NstxUfDP5B9uOhz9Gg8KEm/KRMkv9IG+DzNFI8hSpmEPxeASKkPqxab6bDJS53
         NeFhmMKzaVGha3WchiwXV3QsEqbp3i50Oe9gT/Lx0gOZCtGMHljmpmz71h+X1E8cTBmp
         jMkP+g4pVT/RZmK+bu5G3DQ5FKERIPpuMM/t0wjsv2FgFWZYHAzvzZGbi/lgLhffVW/+
         lZ3Q==
X-Gm-Message-State: AOJu0Yxv5prQBAi8/b47ry6U/zjt/bfx4jvcYHsAaKp7/UTsTxN5ezuB
	/EdRpo+HTNsw0YSLPzMPGoi6apUh2SlRoQmMi/zhLqS9u/PwFIhXt6TVVWk3sQ==
X-Gm-Gg: AY/fxX4/2J2lJu4DeB9G301KomkfvrWUKREcKNo0B4zb7J4Q4jtEWwsBRfIOHjYryaQ
	3l1RylboC+fUEzDlIq5b1i2sEt3XjaIveU+wwf5QBQeIEMRCBs9DAXTF6EQTmmEZt5bfFNXLzcV
	kkCWpar3NjNN6QdPm/HXcW6jQNSjfh3hk1gyu6zlk2R2rCNCafzsJFlxALDjRD1axBti3vgHhT3
	MQL2Jaq7r9ppVXTM9Pp4+wSGlKARKTZHulacxwske0iy30U/kgq7qi8ZCqpXopAqWkIkf+Hj/jH
	CUeXInvSLCu9dYtzr0jpyW2n8ZcSuMU4Ju0pi9prnKuxsWjIqzgRPYYivY193tKIRgCxRloOfCA
	HGHuwO8CywRkZ5BjsoN9QhGTgWKDJiqgRDn9e+s59QPc/ZElx31y96HRwZJOzIMNGr5l3iq+D9T
	YwdzB9butQ6Zav12Wu7oykCJ6DwsypN1Gn0woQv6tdvtFR8j0=
X-Google-Smtp-Source: AGHT+IE90qzZfF9h4JbxIkZ1og618Ve8c7iH/X2M4JKIP6Wt0XCQm9yUEukC/NnOW3IdH4ALviIFVw==
X-Received: by 2002:a17:907:961a:b0:b73:9be1:33ec with SMTP id a640c23a62f3a-b8036f0a432mr1211757766b.9.1766434115351;
        Mon, 22 Dec 2025 12:08:35 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f3e271sm1182344066b.60.2025.12.22.12.08.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 12:08:35 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 072/114] python3-pyparsing: upgrade 3.2.4 -> 3.2.5
Date: Mon, 22 Dec 2025 21:06:54 +0100
Message-ID: <20251222200739.2278706-72-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251222200739.2278706-1-alex.kanavin@gmail.com>
References: <20251222200739.2278706-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 20:08:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228397

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../{python3-pyparsing_3.2.4.bb => python3-pyparsing_3.2.5.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pyparsing_3.2.4.bb => python3-pyparsing_3.2.5.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-pyparsing_3.2.4.bb b/meta/recipes-devtools/python/python3-pyparsing_3.2.5.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-pyparsing_3.2.4.bb
rename to meta/recipes-devtools/python/python3-pyparsing_3.2.5.bb
index 46556e6fb8..e94bebae38 100644
--- a/meta/recipes-devtools/python/python3-pyparsing_3.2.4.bb
+++ b/meta/recipes-devtools/python/python3-pyparsing_3.2.5.bb
@@ -10,7 +10,7 @@ BUGTRACKER = "https://github.com/pyparsing/pyparsing/issues"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=657a566233888513e1f07ba13e2f47f1"
 
-SRC_URI[sha256sum] = "fff89494f45559d0f2ce46613b419f632bbb6afbdaed49696d322bcf98a58e99"
+SRC_URI[sha256sum] = "2df8d5b7b2802ef88e8d016a2eb9c7aeaa923529cd251ed0fe4608275d4105b6"
 
 inherit pypi python_flit_core
 
-- 
2.47.3


