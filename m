Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B568FCF58D7
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 19:56:20 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16209.1763582171472151140
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Nov 2025 11:56:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=JYckqc/u;
 spf=pass (domain: smile.fr, ip: 209.85.221.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-42b3c965ca9so69345f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 11:56:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1763582169; x=1764186969; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aXcAWIzPuLzt8q1EfAPzLeJ0S1sVF70Zi+MTdNrnlV8=;
        b=JYckqc/u2tUdkr/nNZbpaKTcYVIlfCyMJCv5LdMVIQ4//8LmY81Bmc7hWMjczaJ2x/
         9Jb+aOZr+pLxS4AUY4XhSFyWFOkHCkeMJjiz3ajv1NBu7q3NYikZHlahOc4fOELpb0lK
         V5WsQiVBjrFFZ4ocM0WxBYZWt217Jv5MbyGwY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763582169; x=1764186969;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aXcAWIzPuLzt8q1EfAPzLeJ0S1sVF70Zi+MTdNrnlV8=;
        b=iCjsi9uEGCUPPk622QceyNIaD4krO/oUGtKK9Zo3ErnPf5MardFLHHynlYaA+8jgKX
         09VExuYlr00Ybht7VSQYZEERhBc2ms43aZi0hswOI+3EzOTeqy6jTKjy956/nD0d3WRB
         hJfhplRi13zSXJ0plS5bp6I9G918lUDbiYKZV0d8jzRS4KHLoBK6gjy0g5L0L3EOfWqT
         ayE7KZ/Dm3t9IdfhUlDGLHniZwvi2P//7PMIW+u32DL6hyiObaFKoWUftYt2OCn+e6vS
         rig83RtoEGY89g4p2s1nQCwxIOdN3mDffR+vTzyNhjIGdG6uXbJyAHQ0NilZ+OzKn34X
         9I4w==
X-Gm-Message-State: AOJu0YxltcO8FaY/0mg6+8nJkHsUqbPrBya9Qw1sGVJpl+Jhk2xLexWX
	FBo/DYp552G2J3ZS2p4uSv1ExFLpgq374GUKeWtcMILLJJCfr+RNwSw9A5wjjG1NMrvgJiNxLOx
	RjfJETOg=
X-Gm-Gg: ASbGncv+Po1ve6lhsMxiO9R1c29ODukQu/xibmaNovh84qZyKe+7vnvgISGCz6u9oGm
	+Aw3EEHfMqWcWzjqi5zEq0cQx4Cm5s1yqjmDS/eiWMj6OYXDC4vddP2yHhayXXoJ7oYcejzOa9H
	sXMK6uOGFN8OqBHMgQuvP9eHWOeomBDs9e5p2iFDf0Brz0Gm78hWDI2+98ADYNSQecj7nT2dxGq
	Qpdbq0VSEwKvdhbQ2XiAwzTbUed+Knk7x63m4kdUBVEO8tyZDtLKI0GRplhTRoUVkUtflMGOkmQ
	B03K71nlo8A26ZtEujgqJ4GnTnxy5DPGb/OiUdrXwmAy+N3HA2Uw2pwzy9Rz+66S42LCbznRsxK
	NULp8ehVYyE89bvoVRJ6jQQSQBuKjfCvxb69TvlXPt8Moee5iYMrBf3/NWfCY6ai1qh7dZmqRbQ
	4PiCu4KDgpuLHFZXW2hdPCehM03DJE1A/YHT0ZiEayEnSoztv0HqVTHM5MyIdXOLB6IlFjIClog
	NUhssWaQIvLffWSpc2IeYY5nNaTuLY7
X-Google-Smtp-Source: AGHT+IGljkgj9W0ryaro0Rz1baDDQzbJUSxPCQT5FzH73fSemr+Rt1ZBa9lFLn7iT7RvLr9/g+ZXWA==
X-Received: by 2002:a5d:5f94:0:b0:429:c774:dbfc with SMTP id ffacd0b85a97d-42cb97fe96emr17438f8f.12.1763582169457;
        Wed, 19 Nov 2025 11:56:09 -0800 (PST)
Received: from P-ASN-ECS-830T8C3.home (2a01cb001331aa0017b58d8bf04048c3.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:17b5:8d8b:f040:48c3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a96a58c5sm50519895e9.0.2025.11.19.11.56.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 11:56:09 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [RFC PATCH 0/5] Kernel Rust out-of-tree module support
Date: Wed, 19 Nov 2025 20:55:35 +0100
Message-Id: <20251119195540.2671856-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 19:56:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226580

As followup of Harish Sadineni's RFC series "Enable rust support for
linux kernel" [0] (and to increase its test coverage), this series add
support for out-of-tree kernel module written in Rust as well as
associated test.

[0]: https://lists.openembedded.org/g/openembedded-core/message/226560

Yoann Congal (5):
  kernel.bbclass: Export artifacts needed for out-of-tree Rust
    compilation
  module.bbclass: Prepare out-of-tree rust module compilation
  meta-skeleton: Add rust-out-of-tree-module recipe
  rust-out-of-tree-module: Add myself as maintainer
  runtime_test: Add rust-out-of-tree selftest

 .../rust-out-of-tree-module_git.bb             | 18 ++++++++++++++++++
 meta/classes-recipe/kernel.bbclass             | 18 ++++++++++++++++++
 meta/classes-recipe/module.bbclass             |  8 ++++++++
 meta/conf/distro/include/maintainers.inc       |  1 +
 meta/lib/oeqa/selftest/cases/runtime_test.py   |  9 ++++++++-
 5 files changed, 53 insertions(+), 1 deletion(-)
 create mode 100644 meta-skeleton/recipes-kernel/rust-out-of-tree-module/rust-out-of-tree-module_git.bb


