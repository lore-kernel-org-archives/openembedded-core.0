Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6BDCCE79AD
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 05:42:40 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web10.30529.1695188559172201872
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Sep 2023 22:42:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EpnV3wKV;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-573e67cc6eeso4967328a12.2
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Sep 2023 22:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695188558; x=1695793358; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rbkLh94h8JwKbaBZr6xx2hQD6xKrjWFThZEIcz8PCm8=;
        b=EpnV3wKVzyeJtp1JoiEhJLrqvlRmjBWMYvG3amh8DlO6Ym1JQP2o1QslxTBHxHSbMe
         Z5bF53wvXOYD7Kfpq5l0m5QNAROC1kdelN3zzZt86TUqxa/uo+OAA2HO2Yo/hEeJjxCq
         7/GN+FYvLJNGDeAXJv0g+djFqQhrKUPcpfGr3TaJExbcVGXDfNNRXCovlYTloa9ZzEjk
         +pN3brU7Yio3OctEuetzVL2RZGUtHejye33rjS8+RfMuX4EbEy69zwwAOZmOB6/8ag2Y
         voVJMbD0nTE48Rt0jvSNsHsZq7HrebouwbpPiFDazKN0BRMqPB+9IoSk1IIvY5kogx0L
         yDKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695188558; x=1695793358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rbkLh94h8JwKbaBZr6xx2hQD6xKrjWFThZEIcz8PCm8=;
        b=DvKaCnPprsjhE+nXvkU3raH0a2mzHgZGZG/Kn4EM+6W4Fv2Pk2HfSuu3vb2jFrrAGc
         xO1Ev/3sAWbHqCWlUPM5WFlSMibiopf3B8CKhJNMDL99ZsA28JDZnfJp3ahPn81EOnmF
         eQECtr37Uz0M8b16mJUENSay/c6vhHxmFj1pABqba56ttXWuRP0gfs/0Qqv8IoUfXeSc
         RCwvUhBSGpp8oL75JeE2NeuEydoOVDTAJRJqZC7f3YREoMI2cj3GnhhvJSe7UeCEZ7j5
         wT6u/Nxklu6eGZHPu50y3/IhKHU2hdw+gQwC3bqwVZWHAz5+n+TQONEsXtD6v7IC83/J
         Fr8A==
X-Gm-Message-State: AOJu0YyoYwW8eY/E/9P15PY2ftnmvjmuDdnWXDUonQxD3P0lypAChGpo
	uWQb8mJglKLFU7BPjtZlKiYC8+w/aMM=
X-Google-Smtp-Source: AGHT+IFI/djV4BDNvybeBvFnHvMeDog1umCOlNQySjPCf5BUqxWyGOiGRfE2DqROqTO6oaJgAXusMg==
X-Received: by 2002:a05:6a20:729a:b0:153:81a6:b171 with SMTP id o26-20020a056a20729a00b0015381a6b171mr1803020pzk.38.1695188558353;
        Tue, 19 Sep 2023 22:42:38 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::cb5])
        by smtp.gmail.com with ESMTPSA id bh3-20020a170902a98300b001c55d591f07sm5134485plb.260.2023.09.19.22.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Sep 2023 22:42:37 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/4] m4: Disable error_at_line detection for musl
Date: Tue, 19 Sep 2023 22:42:32 -0700
Message-ID: <20230920054234.2514751-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230920054234.2514751-1-raj.khem@gmail.com>
References: <20230920054234.2514751-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 05:42:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187890

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/m4/m4-1.4.19.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/m4/m4-1.4.19.inc b/meta/recipes-devtools/m4/m4-1.4.19.inc
index fcc9e582701..b1b86d7f47c 100644
--- a/meta/recipes-devtools/m4/m4-1.4.19.inc
+++ b/meta/recipes-devtools/m4/m4-1.4.19.inc
@@ -27,6 +27,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464\
 acpaths = "-I ./m4"
 
 EXTRA_OECONF += "--without-libsigsegv-prefix"
+EXTRA_OECONF:append:libc-musl = " ac_cv_lib_error_at_line=no"
 
 EXTRA_OEMAKE += "'infodir=${infodir}'"
 
-- 
2.42.0


