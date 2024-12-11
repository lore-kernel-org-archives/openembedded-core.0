Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57C66E77180
	for <webhook@archiver.kernel.org>; Wed, 11 Dec 2024 21:59:06 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.6603.1733954345595308824
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Dec 2024 13:59:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Sw4tSrar;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3862b364538so691591f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Dec 2024 13:59:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733954343; x=1734559143; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jJqStQMBLnMZ+zH81QxcfSUCiQFzvuwmI2XadlPKVvg=;
        b=Sw4tSrarj0u0qLuozUBSIUuaoQwsvMm1/K5m6epclw5zC1GffWAYJz5j8/7fCWeZBW
         Olf4BsIZaze3RsXFdl3n4vcupEPd/KgIzPvqewP7S+gsYvMZAEnoTt/HgvAKya8pbmF2
         sL6c4zHOtJ8VDO+BkFu+CClJqKqvpcPwFE7uzET55RP+8piFbcRSKGdq9OE/Vmyc5MsA
         ptVAxR2KWQOihpArPAvBRt4npw3G5kzNDslAB+xB2W/ttvwqXRUgz/QxE+EpHEQVp/TL
         8a/pSRlt2mWUivabgJgldPxX+UtJ8gzTpxm6td1hAws2AomXu+5/JCBOhS7YNOuEDPGU
         xjXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733954343; x=1734559143;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jJqStQMBLnMZ+zH81QxcfSUCiQFzvuwmI2XadlPKVvg=;
        b=dvh+1xK0bmNyn5KoEHAic7ZrXPPfYAk+r91+0VPAqmg0DQQpHvzk6VLpkiSXgRMvlv
         ksalEOEZXBN7s7yIixqW8lzEQoEZEg1lotsfW+7DPYpnBqJ1Wq7bk843njzXc07heU3Y
         UQDysEm10dzykLbvv+nPZm3ac72Ynn4tk1+wlnQuumzHm53ZhIwXhlZQ7yj/bnUgTh5h
         9lOXS+YmTBPovDEEp7Eh0XMG/wLPyzsSAF9pA0TMl5bYOpGDYslMd5QsYG5HkdiaNsvE
         DOyf8YiglvG4fvItW3fCyEZuLvntf3uUqLdA7+FT+/NSoTGepEaAmOdKCc2krvxsm99b
         rO/A==
X-Gm-Message-State: AOJu0YxA4fHmUKwMVa1eWhPxVUmNpjawUiKN8JaHeFr1bD+IoGbwwmHX
	J4Uz+75nGHavlebCcvoYZuN7BDxh4VMf1MZbOYKQ0VhHWwy5g9ho++RCOA==
X-Gm-Gg: ASbGncujIV6/kSuLjJA/VgdVRSY/UkTRzi2s9gLHX5AlVBqPT2fcnigrMVKECyjSn9y
	QlxN7bpuSXLJ/IDNqeYJRWr+OiEgM0/K07cFHsJTccDqX45cXOmhi+wCnw081I4iifJwjNCwGVP
	S5p5hg/8H6TtC3euJiFtfXZhEWJY/DxiCDIpShKKP1Yr6evE2cRirdB+FmiNXM5ZQTZBru0iJ43
	j424QHHeoZpTJKaD9hdhVEfX6P9GvNjOxBC6TqnmzbKqRL8bSjM8xmcULOI34LshmIgBb1RmA==
X-Google-Smtp-Source: AGHT+IF4YmovGVIrruyTPkw8GrEOy2QR1jgYqCDXeGwxqiD+t8+7dAmh5Nb2HpCxvMTHT1zTRKFnQA==
X-Received: by 2002:a05:6000:1567:b0:386:2e53:445c with SMTP id ffacd0b85a97d-387888624c1mr535146f8f.22.1733954343371;
        Wed, 11 Dec 2024 13:59:03 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-387824c5c98sm2180792f8f.58.2024.12.11.13.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 13:59:03 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@gmail.com>
Subject: [PATCH 0/5] systemd split networkd package
Date: Wed, 11 Dec 2024 22:58:36 +0100
Message-ID: <20241211215859.2187259-1-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Dec 2024 21:59:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208611

First of all, this patch series fixes a bug in systemd.bbclass that
forces service files with an Also= relationship to be in the same
package. This may often be the case, but as long as the RDEPENDS
between the packages are set correctly, it is no problem to distribute
the service files over several packages.

If service files referenced with Also= are no longer automatically added
to the list of FILES, build errors caused by unpacked files are
expected. A bitbake world has shown that there are only two recipes in
oe-core that use automatic packing: busybox and dropbear. There are 2
patches that fix this.

Also= relation are probably most often used for sockets. Consequently
the systemd.bbclass should also allow to split socket files into
separate packages. However, that's proably practically not used and
would cause tons of packaging errors. Therefore the automatic packaging
feature for sockets is not changed.

The latest patch splits systemd-networkd into its own package. This adds
a little extra complexity, but splitting systemd into packages is a good
step towards making Yocto more usable in binary form.

Adrian Freihofer (5):
  busybox: add klogd service to FILES
  dropbear: add dropbearkey.service to FILES
  systemd.bbclass: refactor adding files
  systemd.bbclass: do not automatically add Also services
  systemd: split networkd into its own package

 meta/classes-recipe/systemd.bbclass           | 28 ++++++++-----------
 meta/recipes-core/busybox/busybox.inc         |  9 +++++-
 .../recipes-core/dropbear/dropbear_2024.86.bb |  2 ++
 meta/recipes-core/systemd/systemd_256.8.bb    | 27 ++++++++++++++++--
 4 files changed, 46 insertions(+), 20 deletions(-)

-- 
2.47.0


