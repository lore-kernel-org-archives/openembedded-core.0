Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DB2AC4829A
	for <webhook@archiver.kernel.org>; Sun, 11 Feb 2024 16:25:29 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.40241.1707668727548898779
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Feb 2024 08:25:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nCkJov8Q;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6e0a4823881so437476b3a.0
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Feb 2024 08:25:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707668727; x=1708273527; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Stu7Da5gvD/JtZbVuGQfsZm5Zw144aOjyf7MQ82LI1I=;
        b=nCkJov8QW/FrtLE2JQIi38IHV1VxlbzR9B/rNgM3q7ftJYL8smA41gQMXBFYm+tTvV
         O0k69vKFnAVIZhIoC26xCI6lhytGdqKWgK5j5/ZQ2/tCfDj2yiyI5GoYWIBzPc8YrnjW
         AAr4F2UO7WinT+R6RHM4hdUknK1mKguULbc+K9OXHKnG+Au8N5eoKMs8O2zVas/VzxZ8
         hee+z9l4Crr3f6mohl8OmqhGUZ796M+AfmNAvOLuXj4rURQSyFqg8eEwSwqtNP/xv1bn
         YbDKiIUrzLqK+3O84JFBrk4f6hU1bZaE8uXwJIhzstCCdpT4B09RfeUzDtZfv7OzFVk4
         PoVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707668727; x=1708273527;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Stu7Da5gvD/JtZbVuGQfsZm5Zw144aOjyf7MQ82LI1I=;
        b=X3j/ndTysLeBbvm1B/IT0pJU2E1LAhoCZbabYgfoU7WSLCcDuYwpq5BzcpeZ2HMyx2
         E3E0izhJPjnzZKBBX8Gi7fHiAYSsP0+z/sGg7jnGaLM3ENcHEhgsJunqy9nfLVatxPgb
         6FYdvFmeRAwNAeDoR9qqJjMHHv5i15DAHtxSiepK+fb7MQAFFo9akJFSOVyS4Sje08V7
         SVS+y2+dWhKf3zQh6zZkISt6XL5qpYMmspHcpF5ShZkfykkFJOjjJ/ijd3+d2416qnQ8
         YUXHRqVJXc5SFZTJ8WRdECV9Zp57M+fDHTnPZyqGQFap1I2j/RaefnCCHsS3vxD07zNA
         SDIA==
X-Gm-Message-State: AOJu0YzxYZ58FVbU7NJV+1d+3ZWJVHD2lfK43YaD3VohlhPmSrFltSk8
	PkbCFe+UU3X9piaS2qOW9d2MFIdG6LlBR2+ckYoahvnrPeMRjy6euFeRUzxXRck=
X-Google-Smtp-Source: AGHT+IFm/DORB3B6EwVYiO9Z1eEPDYJITDINpk2MY/yGw/rRGTtfEG43Q2CL7g0VY3/U9escv/KQcg==
X-Received: by 2002:a05:6a20:d809:b0:19c:b40a:d8ab with SMTP id iv9-20020a056a20d80900b0019cb40ad8abmr4618779pzb.4.1707668726567;
        Sun, 11 Feb 2024 08:25:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWdIqCK9+LwE69B69n3nbl23k1vKmYN1xbZ3XvjAyAb9Fik5n7bCuCUKFhgxorlfs6z51DyH5rgPIhFIv4o7QwaoTrH
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::fffa])
        by smtp.gmail.com with ESMTPSA id z6-20020aa79906000000b006e0ad616be3sm2388930pff.110.2024.02.11.08.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Feb 2024 08:25:26 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Ross Burton <ross.burton@arm.com>
Subject: [PATCH] tcmode-default: Do not define LLVMVERSION
Date: Sun, 11 Feb 2024 08:25:23 -0800
Message-ID: <20240211162523.387646-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Feb 2024 16:25:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195295

There is a single version of llvm in core these days, furthermore the
version is no longer asked for by recipes such as mesa, which would use
llvm-config tool according to version of llvm found.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Ross Burton <ross.burton@arm.com>
---
 meta/conf/distro/include/tcmode-default.inc | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index e0319394f02..192a4e0bb2b 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -24,7 +24,6 @@ GLIBCVERSION ?= "2.39%"
 LINUXLIBCVERSION ?= "6.6%"
 QEMUVERSION ?= "8.2%"
 GOVERSION ?= "1.20%"
-LLVMVERSION ?= "17.%"
 RUSTVERSION ?= "1.74%"
 
 PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
@@ -77,10 +76,6 @@ PREFERRED_VERSION_go-runtime ?= "${GOVERSION}"
 PREFERRED_VERSION_nativesdk-go ?= "${GOVERSION}"
 PREFERRED_VERSION_nativesdk-go-runtime ?= "${GOVERSION}"
 
-PREFERRED_VERSION_llvm = "${LLVMVERSION}"
-PREFERRED_VERSION_llvm-native = "${LLVMVERSION}"
-PREFERRED_VERSION_nativesdk-llvm = "${LLVMVERSION}"
-
 # Rust toolchain preferred versions:
 
 PREFERRED_VERSION_cargo ?= "${RUSTVERSION}"
-- 
2.43.0


