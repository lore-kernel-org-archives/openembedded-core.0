Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3557ED1F9BD
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 11:31:25 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.41207.1764847878293617856
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Dec 2025 03:31:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=AiA23end;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4779a637712so5903595e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Dec 2025 03:31:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1764847876; x=1765452676; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=16smIO5zf3TSuF8OO4eIm+ZA6szo1En3GfOBePREQT4=;
        b=AiA23endVlHCqa0ZgVeihDXbOF2DgR6BaU76rTo+whIkY5dz5RihNNm93NUqAs0LcD
         qwYPVFJCio9ejpH26BbNJaZT98ZV9Ed/0S8aNhuGtnlv0DSdrts2lAXw789SWkU4e4jw
         E6WgKB96V1XlaQbGelTHoKMojmtV7QS8k1rlk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764847876; x=1765452676;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=16smIO5zf3TSuF8OO4eIm+ZA6szo1En3GfOBePREQT4=;
        b=IqHg4yScTZrVhA4RrWYPY0l0MQ4wEqi6N9syIWqunagQ/Ka4ETdK+SO5yiYJTRWs6R
         kqVOIXYCOweukFYNxnSJ+WOvaf9lQiir255Ho81PCtfNPmlogw7poXNJBWeiGkjaiwfc
         /0jDTuMpogCssyf/G2hLayQbOc3fQe19X7/kr8PVbYwKAkfgskcn86J5oiHjiu6vSzT4
         WC5FZb5y8r2+W4IfXEps27OrXrGhGl150oR8U+BZ1k6NJuKknmBI1EgM5ZmR22qnj5uz
         4fF7v6EsbpD/dxDklGucDbTg2gBmp8mv9+9/ujUs2QdTNQ6XXagycArHe1hy+3vzdJrq
         MpWw==
X-Gm-Message-State: AOJu0Yx6AS7Wo+a/qVrquPvzowwFSxXEMW/tNazjRJgAX+ny7jTXKPe2
	ls8OC6be4XrzT0QtKnDTPBcctddDRSc80sdpKDh69/UhQxPrTAIan/SpU3fzHjs78oPszL9vBXY
	wcAK9
X-Gm-Gg: ASbGncsXhz+x4qdE/7DNZAIxxu9+YMdjBi8so6UzmEAdIJ96+Lb82BgTF3vxiMayzsi
	n3sVruEUAqYRnEQv4hwGDy0YdTiWMwxVhQ95zYHVN3vK9xKWSEDqigBkHzsk0nyc76y+iwivTwJ
	vi9+QV8DfEKhXftpVoQL/HjjG36U3/7WsjXEBf97ANxJDkrnOGiJcSmOtDWe0dGAMDSqaOLGvyd
	nDa47w57AIbh7ga2l1L0OvwoqGdSfWCah2zeMXwPOHv98bLOfshIojQpn4KL+KVnZp1xufFjp9n
	GoPZLLHz7evnlBeHCQUhoZ5mG82g3pYnBdeZDOp1b99knEYecRCuPcI2RVQRz6pF9Q7AdLVbUTG
	UAzrkho1OZE4HDrSRZ3CI811FuxlHUe8dPhLKNjEeBfzuqNoFjC/egrKsl1q/U2Bk67Df8Kpl+U
	E07yQJWYRm4fagiCe1xglVLAveY2Ckzi5ynD44zSTrM6kmrDRxW6EvS8nWyE3CKDIfNyiScY+8R
	lQR9BOmj8N7BZVrGcuFZq4ukg==
X-Google-Smtp-Source: AGHT+IEQIflH8NLExwcwngwO7sFhW1VaSa//HzMVFw+1SYT+Ry+jSxMdcX1AMIUzlVeyFFddY/Mkig==
X-Received: by 2002:a05:600c:1c24:b0:477:9f34:17b8 with SMTP id 5b1f17b1804b1-4792aeded4bmr71413715e9.1.1764847876001;
        Thu, 04 Dec 2025 03:31:16 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479308cd87csm29385885e9.0.2025.12.04.03.31.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 03:31:15 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [RFC PATCH v2 0/5] Kernel Rust out-of-tree module support
Date: Thu,  4 Dec 2025 12:30:53 +0100
Message-ID: <20251204113058.948115-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Dec 2025 11:31:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227281

As followup of Harish Sadineni's RFC v4 series "Enable rust support for
linux kernel" [0] (and to increase its test coverage), this series add
support for out-of-tree kernel module written in Rust as well as
associated test.

[0]: https://lists.openembedded.org/g/openembedded-core/message/226623

v1->v2: Fix tests:
* maintainers.inc is not supposed to cover meta-skeleton => removed the
  patch adding myself as the new recipe maintainer
* enabled meta-skeleton in the test

Yoann Congal (5):
  kernel.bbclass: Copy include/config/auto.conf in
    STAGING_KERNEL_BUILDDIR
  kernel.bbclass: Export artifacts needed for out-of-tree Rust
    compilation
  module.bbclass: Prepare out-of-tree rust module compilation
  meta-skeleton: Add rust-out-of-tree-module recipe
  runtime_test: Add rust-out-of-tree selftest

 .../rust-out-of-tree-module_git.bb            | 18 ++++++++++++++++++
 meta/classes-recipe/kernel.bbclass            | 19 +++++++++++++++++++
 meta/classes-recipe/module.bbclass            |  8 ++++++++
 meta/lib/oeqa/selftest/cases/runtime_test.py  | 12 +++++++++++-
 4 files changed, 56 insertions(+), 1 deletion(-)
 create mode 100644 meta-skeleton/recipes-kernel/rust-out-of-tree-module/rust-out-of-tree-module_git.bb


