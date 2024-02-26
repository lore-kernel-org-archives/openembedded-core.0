Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00593C5478C
	for <webhook@archiver.kernel.org>; Mon, 26 Feb 2024 22:34:57 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web11.7228.1708986896261883824
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Feb 2024 14:34:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cquf9dq2;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-68fcedcf8aaso18067996d6.2
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Feb 2024 14:34:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708986895; x=1709591695; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XfcNPWZnUo7+tKcDjcxwhre8gl9QqrnDElruzcnzSMM=;
        b=cquf9dq2Qg3RST+rP7lEDG+s+NfPsdw/ZTMqEjaqVTd4OLcoaQlZwqzR8JSAqHyPKv
         o7zx8/CqzibnDhPv3PDrbT2jqLinmEsu/cKU6YouHbepcuHwa3ZazO2QljzfLhZgE0gQ
         JvmdMxvNCmoeOmdijB2CP4+Upn1aSxN8w6RUD3K2PTrmvzk7kksNVC9ZPYhhZgFKxRza
         Oyz/daQY9OxjuWCQUbJ5/Mcg1BvBm33pAdX4bcNPxLWs6OjD0Up2BPBWtQpG7BfK9gUJ
         2Nwy/tETr3341H0vr5Rry/fWB4yKmwbsaiLxm7nk0LGHoIDMA8Uz2iboY+iFgE8BpG+U
         iXGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708986895; x=1709591695;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XfcNPWZnUo7+tKcDjcxwhre8gl9QqrnDElruzcnzSMM=;
        b=J9/Cwv0sbe0OMFXOnsykOyETm6QDDWP5HQV/SYfw0+fU481vR1t8I3frSKj6/Ws69i
         gJGCqNnn2R5rEWCyjsr8YFMn4rpHUb31v/G/ThnGuBAp83XEyFBtzmN+PyF2oPOL5hU8
         NFm6yRZ3xKqfxHCMnIq0a/2qsfE9xo0jzJYJpL0whe8NYVGZzamvWucVOe2o+7rkRVJ7
         y8d9uFNrQqZNeN4mU6onZiytFwwS+Mf/dvjeJu1UeEr+MSOec+lSwaiU1k3/ZM0UN34Q
         p86zyEbdKaen4BXgzhfnBirk6JKMjh05uGNlyTrttWXVCa9FlE9z9mC+PYvaGmG13aNs
         zY4g==
X-Gm-Message-State: AOJu0YzxrpWaQGq2nm0fBJTehTlQ2up+HDtUBFIdEsapzBX3OxuaYGXy
	QkDGMkklHdPAKB+7OM8E84wEsurPANFAsCKASBUPNxYcflz0Ky8w
X-Google-Smtp-Source: AGHT+IGs1QCdeUoybOC6Vu47gdZlPM6yaoN/3yjvk5s8FG5P70vnnRW2A97sHVmoNcgVd2aH8Sfg4g==
X-Received: by 2002:a05:6214:224d:b0:686:a185:dc11 with SMTP id c13-20020a056214224d00b00686a185dc11mr624085qvc.55.1708986895242;
        Mon, 26 Feb 2024 14:34:55 -0800 (PST)
Received: from bruce-XPS-8940.localdomain ([174.112.62.108])
        by smtp.gmail.com with ESMTPSA id qj24-20020a056214321800b0068f9fd1d688sm3422091qvb.21.2024.02.26.14.34.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 14:34:54 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/6] kernel-yocto: pull request
Date: Mon, 26 Feb 2024 17:34:47 -0500
Message-Id: <cover.1708986570.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Feb 2024 22:34:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196224

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

Here are the collected change for the reference kernel.

Everything is relatively routine, except for the awaited genericarm64.

We'll have more configuration fixes/tweaks for it over the next little
while, but there's no reason to keep it out of the tree while we do that.

Cheers,

Bruce

The following changes since commit 6b356b74d83dbb088e4128cf933b8713b63898ce:

  dev-manual: packages: need enough free space (2024-02-24 16:13:29 +0000)

are available in the Git repository at:

  https://git.yoctoproject.org/poky-contrib zedd/kernel
  https://git.yoctoproject.org/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (6):
  linux-yocto/6.6: enable squashfs for selftests
  linux-yocto/6.6: config: x86 tidy & consolidation
  kern-tools: depend on git-replacement-native
  linux-yocto/6.6: genericarm64 configuration/definition
  linux-yocto/6.6: update to v6.6.18
  linux-yocto/6.6: update CVE exclusions

 .../kern-tools/kern-tools-native_git.bb       |   2 +-
 .../linux/cve-exclusion_6.6.inc               | 124 +++++++++++++++++-
 .../linux/linux-yocto-rt_6.6.bb               |   6 +-
 .../linux/linux-yocto-tiny_6.6.bb             |   6 +-
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  |  28 ++--
 5 files changed, 139 insertions(+), 27 deletions(-)

-- 
2.39.2


