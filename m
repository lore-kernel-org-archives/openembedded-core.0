Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8E33F8A153
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 21:08:55 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.26345.1776373732576099087
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Apr 2026 14:08:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=BSjvm6Y4;
 spf=pass (domain: smile.fr, ip: 209.85.128.67, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-488a29e6110so88087755e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 14:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776373731; x=1776978531; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AV2Gjl1AHOHer2Q/dbsANtIcuKz1qmXyU9XsIoCMj6E=;
        b=BSjvm6Y4HIZhL1FCrJ0Vz/ag0lGRvXZ5L/J+EfgxuqhREcj6gcEqJeBt9vaZUCP0HQ
         DqQnhnRGaZF1uToZYl5J506wk3zUtjB+I+3EZ0ob+W+ME1MKtAbQ1qMq9NGpAXuzExEH
         NvgnAdzCm5RIRkRH9ZnQ7WmEpUtFSHD5c24Qg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776373731; x=1776978531;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AV2Gjl1AHOHer2Q/dbsANtIcuKz1qmXyU9XsIoCMj6E=;
        b=EEjM1SGrgxn6QeYKlbMCuwaD6CKzyfT973sBdj0g8uryYcxqFc1ShhgTPcjxvIPGnU
         JF8usVWhMCGLWJ0JITfqv+E4aW/04fLGkE4hQU6fNKyQggx31Dmvi8/+w1Qxe7gBuaQ9
         H3/HMfh0/osgCbpiP/blzVekIp7H59uVpvTbQwJrnSlj0THlxDqJrHOMmAA1XQFri28q
         GBLTmNi6bYiiVZ/ugiPMvik507QgZV0/eC/X82K5FRK64DVq5QBn9Lh0galS/VHYquLC
         gmPYjkaCf8CEjm4DPCm5plXajhqp5O/Z65IADAWuAyn3q+vFf+fGhTsR+9F3+YzdCv0T
         48Aw==
X-Gm-Message-State: AOJu0Yx9Whv1ali4ePjRmjOrxnBNAwY+7HGPMzWrR8LBf139JOcD7g10
	ycrC7cGXwOPRnCvkNBOgjvuBHHkGIIYVCxUKsXN1KJw6YpKRbRoPNFjPl/+QNK2sUnAk0NAv3ET
	H3aAoDWQBELpm
X-Gm-Gg: AeBDievyMwpKZ2vbSZa9GKpmz0Tx4FgzlnA9dWhA0VrfcHjs+8V4Ffh71nhRsvePLUP
	SRwhfQeTJKzCdPHhxZPoJ3ywpb9xDXJx4Izemgl/kkEZrZO3uAde/SuS3IKrtHRj88QEa2Fx17T
	TtJrDUGPWg7DTwyQgLtYJ36zYq3oyRKKo3cPhNlFsOT9Gom3wlhaTZ7Knf0T3qEMI/XcvDHIDs5
	upxv2niw8FUO+hMpS6T8S9DR/7sc1F9NQU9BUlqTXXT9Ok8P8wZjsyCQcJbFd8PWYoXFG+qTqca
	JGkPgWlLY9TZ1wetINGO09AgH6PL7Goa4sLAxqbECqpj+4bBcylLPJvEaeaMKLXiSEWEyOc46f7
	3YYVKa42TQ0xdIbsXNdgIdi1+ZENGyNVozlNKcSosmlgDo8uiL4fafskBOKHwmhdRb++KEVxJrw
	rgpGaMFnTc9WQWTv0im7PwND8ar4NnQsH43HTgAGIulD0ipGxc8/CU0oQGsz4JLQ871kfD0DLTi
	glPTNRHdsL5lJcpk0iZzXE0GuZ/U889VB6mwe920U05x6iC
X-Received: by 2002:a05:600c:c082:b0:488:b043:5efd with SMTP id 5b1f17b1804b1-488fb75f7a6mr2002815e9.13.1776373730666;
        Thu, 16 Apr 2026 14:08:50 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb7c2167sm944985e9.36.2026.04.16.14.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 14:08:50 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: OE-core ML <openembedded-core@lists.openembedded.org>
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH 0/8] Patches from kirkstone/whinlatter final series
Date: Thu, 16 Apr 2026 23:03:53 +0200
Message-ID: <20260416210836.1336162-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 21:08:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235418

There are the patches added to the backported one while finishing
kirkstone and whinlatter.

Mostly, changing the last git:// YP repos references to use https://.
But also:
* a feature check in testing (seen because whinlatter does not have wayland in
* nodistro)
* a patch Upstream-Status update

Yoann Congal (8):
  virglrenderer: update a merged patch Upstream-Status
  oeqa/selftest/incompatible_lic: add wayland feature check for test
    needing it
  build-appliance-image: switch SRC_URI to https protocol
  scripts: Default to https git protocol for YP/OE repos
  oeqa/selftest/git-submodule-test: Default to https git protocol for
    YP/OE repos
  oeqa/selftest/devtool-test-git-gitsm: Default to https git protocol
    for YP/OE repos
  meta/files/layers.example.json: switch to https clone URIs
  oeqa/sdk: Default to https git protocol for YP/OE repos

 .../recipes-test/devtool/devtool-test-git-gitsm_git.bb    | 8 ++++----
 .../recipes-test/git-submodule-test/git-submodule-test.bb | 4 ++--
 meta/files/layers.example.json                            | 4 ++--
 meta/lib/oeqa/buildtools-docs/cases/build.py              | 2 +-
 meta/lib/oeqa/selftest/cases/archiver.py                  | 4 ++--
 meta/lib/oeqa/selftest/cases/incompatible_lic.py          | 2 ++
 meta/recipes-core/images/build-appliance-image_15.0.0.bb  | 6 +++---
 ...use-glibc-s-once_flag-ONCE_FLAG_INIT-when-presen.patch | 2 +-
 scripts/combo-layer.conf.example                          | 4 ++--
 scripts/contrib/patchtest.sh                              | 4 ++--
 10 files changed, 21 insertions(+), 19 deletions(-)


