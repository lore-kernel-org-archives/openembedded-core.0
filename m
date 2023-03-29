Return-Path: <loc.renesas@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40592C6FD18
	for <webhook@archiver.kernel.org>; Wed, 29 Mar 2023 08:08:24 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web11.19173.1680077297857158564
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Mar 2023 01:08:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cdq92KAl;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: loc.renesas@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id s19so8806459pgi.0
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Mar 2023 01:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680077297;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=0Pw2FiTZ22EP8vWtpYrZ/Q/n5qPbVEqKA6syA0XojWk=;
        b=cdq92KAlzHKuHoIh7M+d/Lp5iCGlJXyE1ig8UgVYFNylSagjwAlIHcLe8fEsXFAC5V
         PL1LXCfYEak6wXQTNysbUZhBu9zg4CL5Bwr3h8WL0k6rNW/KIp65PKWGKZzOEC+LA+Nd
         I7jbGcRHzB0MdTqhmcv3xyqZSwa0v4ZYenDLfQ0E9GkxWtLGwg8+7hmYL/ozyaNo5H0u
         9JwUtjWkx62WP08drAZpxT/l0CUt8eHIS1d1doy7PqgneS7/hXmi0k50qdKxwhexiNb3
         o9aT377mw03ye9mjH5zK09NNVLv2C8dQUDIh2GCgmPHPzTA3A4RdcrN1eJDV6uyho48/
         9MuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680077297;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0Pw2FiTZ22EP8vWtpYrZ/Q/n5qPbVEqKA6syA0XojWk=;
        b=TQhtYDEp1yz6c2pLhC9a24vOK6fqkWlxOlhmvTNNNXaiWvYtlz2ddyo5bDu5HFdlWV
         bh6yVXGYYuu/+zlzsrq7OD9k/L6TbpnnE1OZC0Henm/uOdydImPcVMzfgaB3o8sQ2W3y
         ZhERuoOvJbx8J+7TL4whofxAitVTQ1n6myMoaAKxUzPrsbhFtWJOnODUbq6C7s6L5yN2
         xDIMNMqhsiarBY18heIz/YTCcbVD89y7a6TkQCSBp1mnbrYM3GgEo/69L2Suj356nvLU
         BK9ZtzkJhk2My9QvRs4v+kg93yEGbFrLSj81etQ1d7w8WjMPoxDGlYnqkQE/ci2Id7ai
         ZsXA==
X-Gm-Message-State: AAQBX9d+aMzCW8uImOCbuhOO/NWD2xPNyqOSJYZCMU/z0J4QS/tra0km
	R/+UzT0gKq4v7PFe82ARAUABqPRzh3B88Q==
X-Google-Smtp-Source: AKy350bJp7/A2iUYfDm15U7u1asqgm/5qftUR4oOLD5KeMNBbPinFGhfKK1sQ5Dq8v90YTK4MzmWcQ==
X-Received: by 2002:a05:6a00:c5:b0:622:85e2:fb93 with SMTP id e5-20020a056a0000c500b0062285e2fb93mr1462897pfj.15.1680077297054;
        Wed, 29 Mar 2023 01:08:17 -0700 (PDT)
Received: from localhost.localdomain ([113.161.39.1])
        by smtp.gmail.com with ESMTPSA id q27-20020a63505b000000b0050bebfe464dsm20967038pgl.53.2023.03.29.01.08.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 01:08:16 -0700 (PDT)
From: loc.renesas@gmail.com
X-Google-Original-From: loc.nguyen.wt@renesas.com
To: openembedded-core@lists.openembedded.org
Subject: [poky][PATCH 0/1] setuptools3: adding sanity check to detect python-eggs install
Date: Wed, 29 Mar 2023 15:08:04 +0700
Message-Id: <cover.1680070372.git.loc.nguyen.wt@renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Mar 2023 08:08:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179266

From: Loc Nguyen <loc.nguyen.wt@renesas.com>

I'm a new comer, please help to review and feedback.
We are planning to contribute to yocto prj, beginning with fixing newcomer's
bug at: https://bugzilla.yoctoproject.org/show_bug.cgi?id=5725

The following changes since commit 23212c8c44315ed6612009e0e667d14ad26459b0:

  rpm: fix RPM_ETCCONFIGDIR value in SDK (2023-03-22 23:17:27 +0000)

are available in the Git repository at:

  https://git.yoctoproject.org/poky-contrib locNg/bugfix_bug5725
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=locNg/bugfix_bug5725

Loc Nguyen (1):
  setuptools3: adding sanity check to detect python-eggs install

 meta/classes-recipe/setuptools3.bbclass | 10 ++++++++++
 1 file changed, 10 insertions(+)

-- 
2.25.1


