Return-Path: <michalwsieron@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14E69C8302F
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 11:23:23 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web10.8021.1751368995541890593
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 04:23:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=T4vSb1nG;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: michalwsieron@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ae3703c2a8bso620622066b.0
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 04:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751368994; x=1751973794; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZgH+4oHJVjW5fu8rRvpU9jAaAeRACS+eKAx9vQmH/MA=;
        b=T4vSb1nGCcRQSTLoSSL4Xof23u1i5A7DZlolY7GsEQUc2frbJVgdS0qGgj9flhLr0m
         J310yEtZDH4UIKnBNVTd8NXmktWPEp3x1shcYeO87M/S2Xl279Y6K7kqEMIE0aJBC1UV
         Wybdw4SqFHAdIm+o50fpJclaIX76pvCAuA7TXNY92XnWmhmOxifKoUUZSe5KcMTcZXxj
         3pbTRel9DH5km5DFdHezCCNhTjmxTKYjXHWw3Sm7cNnB4zRaKCPa2TKK4rkv/MsHyoj2
         ZJM7Z1htPS0nBHdW4+h8Zts5elb1qqwcp09ryVCp/iWMHX6DUL+Ag1AR6THmcfAoyepS
         LUQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751368994; x=1751973794;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZgH+4oHJVjW5fu8rRvpU9jAaAeRACS+eKAx9vQmH/MA=;
        b=CFtR3oc7Ucs4OV3IqNZQPTF09hXxA4NMO6q3ZzL/+bz9NL2+klQKFdLHAcqKC1N0j+
         D0ojnhT7y/3iMv39tTbP3JAyJ/nnSallCfFtWeasfwWWtPpNEtDsznbxRw/heNIMhf1H
         SMWpZUuLc78RmkOQf0s6Tv/eFLxtBBQ+PtAwaNPqevtS71Kt8AYrDjD6UNQIub8b8nxd
         j39yH8OMsgtEJ+/gJiCjlPoXeWm3rPvbXff8EKLW0PV2cKD1foOw/zaiR/ZkRZA7w4k9
         HgNIZWe8MKlwn7Kr608XQ7DatlsAHshNn/5M/WCdBaKJidSXULCYNyuuxqVN94FmUfVv
         jxrQ==
X-Gm-Message-State: AOJu0YxXtIvQrLra+D0OIYsUaQhrBLzHYjTCehZ0ab8B9EXVhI0atPe4
	DdHCzJ4IbLeXHhdWBeXt1+Nd/dortErSDIJaBRDFwLqk2oRjO4L0mLGnx3CWsg==
X-Gm-Gg: ASbGncvK6rCuFcQrpJ6Hn6jS6Ahtdreyknpgm7iCAc0A/VcLEQbINcha7zUvDTRrvun
	1KhoeMu4RIVsvliDuxLS7/uOiP8TnTjP3XPmt11Bi+v7CFWojNRZR1BFlmXYYX7evDFYN7X4zuE
	S/97j+NJd4KfBq/+hkt+Qtt5ulULjnO2lV6zEUvoaPftHruWvuV89tqwKw4ctMAIsrg2nE/9c3k
	TPXFH7q80UgpCRiZmKh6UKK0NVrkPO6vM0FpzULgumvc3vpGnDnkaDjI8goSUs7s177lNIOm5VV
	BPAGJeqqzfoXcsNGk9B1xFwfBvSktxz9kDo7JsHF2dGFTWsROCy2B72Bfv6r
X-Google-Smtp-Source: AGHT+IEliy+59Djat9H7+2LMHc37RGI/q4cq+wg2UShfDWA3R4J+VjUCMzG2l/vriUl2pGPApPKnxw==
X-Received: by 2002:a17:907:9d17:b0:ae3:5784:2b44 with SMTP id a640c23a62f3a-ae357842c32mr1189444766b.33.1751368993482;
        Tue, 01 Jul 2025 04:23:13 -0700 (PDT)
Received: from elitebook ([93.159.20.3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353c6b448sm841742866b.127.2025.07.01.04.23.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 04:23:13 -0700 (PDT)
From: Michal Sieron <michalwsieron@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Michal Sieron <michalwsieron@gmail.com>
Subject: [PATCH] bitbake.conf: Add relative path from B to S to DEBUG_PREFIX_MAP
Date: Tue,  1 Jul 2025 13:23:17 +0200
Message-ID: <20250701112317.1204143-1-michalwsieron@gmail.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 11:23:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219564

Basically since forever, meson uses relative paths when generating
ninja rules [1]. This breaks prefix mapping that bitbake sets up in
DEBUG_PREFIX_MAP. As a result practicaly no files are added to the -src
packages built with meson.

We could add it with :append in meson.bbclass, but then it's not really
possible to override it (DEBUG_PREFIX_MAP is defined with `?=` probably
for a reason).

[1]: https://github.com/mesonbuild/meson/commit/8d1641d6a42e0a5f6db03bc38d252d3712195929

Signed-off-by: Michal Sieron <michalwsieron@gmail.com>
---
 meta/conf/bitbake.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index b1f8ac5b11..0ecbc8c71f 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -656,6 +656,7 @@ TARGET_DBGSRC_DIR ?= "/usr/src/debug/${PN}/${PV}"
 DEBUG_PREFIX_MAP ?= "\
  -ffile-prefix-map=${S}=${TARGET_DBGSRC_DIR} \
  -ffile-prefix-map=${B}=${TARGET_DBGSRC_DIR} \
+ -ffile-prefix-map=${@os.path.relpath(S, B)}=${TARGET_DBGSRC_DIR} \
  -ffile-prefix-map=${STAGING_DIR_HOST}= \
  -ffile-prefix-map=${STAGING_DIR_NATIVE}= \
 "
-- 
2.49.0


