Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B2FBC71157
	for <webhook@archiver.kernel.org>; Wed, 18 Jun 2025 09:21:15 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.3103.1750238469934416675
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Jun 2025 02:21:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UfBpYthn;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a510432236so4951742f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 02:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750238468; x=1750843268; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hAfPxn9JEc9u1Co2NS/Gm/MrjqnWx9DW8XbcouDhcfs=;
        b=UfBpYthnlt3+q7i/szao7Y3oGSKaGk6oWcuZjSo3vC1MxAbHuRrztbM9oPbePcNvWF
         vd9hMPgB1kY1rUdWBoleAywpw+rASPkdr0YKbdlquhCcxXJwfBLyvizGrDreB31QBEit
         t6KWX7Ip4w+e2rFa0vHl52/Z2TvcxW9ipb7DDnsLpyNZFH0bUwQIxzUP4Af0ix0ORvVt
         XBxQJm6rdZdHmNIlBYVQYytxwdmERVGmiFaaox9AJ7GWfD2nbxvwKXTRMisgAKhwSvZs
         DEELXBP5bYfkJXvogFdBKdwHI8v76QeQMiaLIcEeAxo9zsQxHm9bjQBXv9XuYADqvB0v
         PK3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750238468; x=1750843268;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hAfPxn9JEc9u1Co2NS/Gm/MrjqnWx9DW8XbcouDhcfs=;
        b=dKeEUcTeJraXEF+gyUrXP9m/4MTQkLrF8i2hMpVW1z+e+Gc4x/lZtS5oIUwL5M31nT
         KwNKcQ86+RDHDQSU6+avkGP1O4YMcKFz/ANam4ZG1b9qjm983SCl33r8MLGGIlj5IzWC
         vxyoxFWqgg+kBC9dzaHNrUTAddHjKXR9cYram6asnoNKw5zQUcOJKeJWgjZ13QP1zy1K
         HGE8cZJEPcu2iOaE5zMVDp6++g7rEAw54H2pozxTzfulPHy5D0uWjqw7T8eGyG2K4VN5
         sJ4gUTHm1rzIV6A9GvPdvDrPUEH7I2cYHhIvD+LR6FAeAsAnwGSFQOomlAbZmWY/bpfm
         v8Nw==
X-Gm-Message-State: AOJu0YwHbt9HFtlxN5HyyYbdKcPC3r7H2xIRweMlbsHnPm0nZ5V54/GB
	eTyDH3knCdh9ahQoh4e5aB4yPfAHp6ggR6DPXCyvw8ggeIjylA5WYjTdo8GGSQ==
X-Gm-Gg: ASbGncstlKqxBsy67v+yU2U80rADZ3wJSaD3kphcZ5AlSH5Ur9lAGRm8SYAxAPqqhKg
	FUcBeZezgK3tnm+ePb8A4DV/j+o7PPl/pfKpFK7j/dWq6Oq7z9Dt1MfTOsH2Ixe+olGdCFEFICV
	QZOYCqzpNDDvo8NhkVRYCHqz0fVVPH62lgWVkNQsA4WykYKTkryiLJpk1yimpCLC0ogBWn/NGvH
	/vP57V3shQF+W9bwdHVpMQ9RvqWwZj10jyHx2F+4Jegri/dwgvwOVzB83VoTW3c/9KXkLlxsJDv
	OpQusxtLp2ub+zMxr1KFnqvF02fEt/s2bupH6xTGMrzLwdtVHC7tLSg7QSVyWNHkXIZ1XAtM7mi
	H+qWr8dikFFelm616P/RBWZ8=
X-Google-Smtp-Source: AGHT+IEyyEsEO8wZ3KOTYSw6h76wJrm94THWsWsCWuUlNDRjEnaKKnXxYk+X8j65ID2LtLj0akZFKw==
X-Received: by 2002:a05:6000:2486:b0:3a4:ec32:e4f3 with SMTP id ffacd0b85a97d-3a5723975b5mr14205623f8f.17.1750238467969;
        Wed, 18 Jun 2025 02:21:07 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b28240sm16459936f8f.72.2025.06.18.02.21.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 02:21:07 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/2] bitbake.conf: enable built-in fragments for MACHINE and DISTRO
Date: Wed, 18 Jun 2025 11:21:01 +0200
Message-Id: <20250618092102.4142243-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 09:21:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218986

From: Alexander Kanavin <alex@linutronix.de>

Please see the patch for bitbake for rationale. With this
setting in place, it's possible to set

OE_FRAGMENTS += "distro/poky machine/qemuarm"

and bitbake will interpret that as

DISTRO = "poky"
MACHINE = "qemuarm"

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/bitbake.conf | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 54d6bebc39f..77399abce0a 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -821,7 +821,8 @@ include conf/local.conf
 
 OE_FRAGMENTS_PREFIX ?= "conf/fragments"
 OE_FRAGMENTS_METADATA_VARS ?= "BB_CONF_FRAGMENT_SUMMARY BB_CONF_FRAGMENT_DESCRIPTION"
-addfragments ${OE_FRAGMENTS_PREFIX} OE_FRAGMENTS OE_FRAGMENTS_METADATA_VARS
+OE_FRAGMENTS_BUILTIN ?= "machine:MACHINE distro:DISTRO"
+addfragments ${OE_FRAGMENTS_PREFIX} OE_FRAGMENTS OE_FRAGMENTS_METADATA_VARS OE_FRAGMENTS_BUILTIN
 
 require ${@"conf/multiconfig/${BB_CURRENT_MC}.conf" if "${BB_CURRENT_MC}" != "" else ""}
 include conf/machine/${MACHINE}.conf
-- 
2.39.5


