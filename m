Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F554C83F0A
	for <webhook@archiver.kernel.org>; Tue,  8 Jul 2025 14:36:44 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web10.20459.1751985398451059970
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Jul 2025 07:36:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=X2TBQOx2;
 spf=pass (domain: gmail.com, ip: 209.85.160.181, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4a58e0b26c4so70278281cf.3
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Jul 2025 07:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751985397; x=1752590197; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p/OELYIxgyOcrupr/DJljrm/rWOi1ZqXNoNoVjPs9Hs=;
        b=X2TBQOx26nzKrqNWRxOmnhphQJ4KN3QJhOqf+pqezAkP9nGsswonTXV3NINOWInIis
         nZSZsJP9gYsAY3ZuIddvrq0CgWfH2cA7rAHU+9/5btEscST7kG2diLNtT1ntwU6RykrH
         OTmlq53Q55ckNFqKDDoDGmkM3yDNReUrkiikZuoHGqi9oNlVw0ZW8gZ9A0kdK+POjxUM
         a3CmQFdGJNPya+Mefsme0iqUUVfRpU9ZP58qWfq+rZT7EYXK3ittSXVaK1nRbJ4gWQ4a
         CIDp0pEd9H5FkpbJ77FlL687lbSkTFv4bg08KgnrYuyMP4gKchcendv2xANQJshhM/Q3
         27Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751985397; x=1752590197;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p/OELYIxgyOcrupr/DJljrm/rWOi1ZqXNoNoVjPs9Hs=;
        b=F6zUJfo/B3S1TX/zT23qOEB5lpP7FLZ6OZSugIlmFfdZgtU0S0iFtF2fUg5VgcTlq7
         6j6+zFuq4VAH5Dg4P8fKYWrl9u/RWGLAdqLL54ABBbRtEnq/w2Ved6gGio8hqOIDgkhG
         vMMZ6kUX/XvAmiKoKG4y8V6ihseQtCCSP7x9imWP/N8j65bInlt4m8pdcdRfcA7fG+Ja
         mBbyT6cpx6wuq36O2vN251jJX+9b2SB3rN3VaVdwl1jwpy/JmE2On/J7dY2JunntO27e
         g/LeNafJNdkVlHnHv9XgIPFo2GRPl3JGB8ucKV0MJBs5cMbWVoqaDXYIUuif+5AcjK4W
         zbQg==
X-Gm-Message-State: AOJu0Yw6bl+fbH7611t9+iS/z5EC1HHpINI/oXNN/XEj5SaS3NgtDtMP
	1OE4KLGaP9ghuFAmS0gqtsbDRh2q8oG4aW9DpnrfxXTX68xfHYdjeJz8viPO60Hx
X-Gm-Gg: ASbGncsQ/sZqU7P18Rak3DyN7MaoK5J+kpfj/tVzpGfUfFyrQDOT2Cj6AGkWhUWufIE
	Frc00MD+evm8g7j9HL+n+nifs2OnEhMajqrzMy7VmVinxcP8AB1Dch8iWAwugmE2VrY9DCmT35C
	a39bRuMe0jSxukmWGobrMESxnhH8RVm2tZcSoLnoB/jpVCjxa/i80WZR7DHMDOro8YMu2o9Vok4
	aBvvH2ta68IRZZ537xLkx8PY/+nJyGEKyUAg3ocvB8O/9LuX2wm1BqxsqAFX68vW3sjtt2VLea4
	9GRO5bIMOL3MFXyzpNrXpgUVDU/w7S/q8qIP/Pm+UaA+DA789Z5S1dGDn985La97rXzc02wJT7E
	h9v2DgJKw5q6YQO94ZQ3lp7UrxhnVeMXCz6b4OdnBvQtEOEoPR1KxO2vhak0RwNk=
X-Google-Smtp-Source: AGHT+IFpyCIfTMduF2uvC3aLSDBlD94orm1FQy230oNa7EIHydD+bs2LFLLGIjWCKslcKDftQQDRqw==
X-Received: by 2002:a05:622a:4e8f:b0:4a9:cdae:1bfe with SMTP id d75a77b69052e-4a9ce024b1fmr58145941cf.49.1751985397330;
        Tue, 08 Jul 2025 07:36:37 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a9949e4c8esm80462671cf.4.2025.07.08.07.36.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 07:36:36 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/6] kernel-yocto: consolidated pull request
Date: Tue,  8 Jul 2025 10:36:29 -0400
Message-Id: <cover.1751985223.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Jul 2025 14:36:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220032

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Hi all,

I'm clearing the kernel queue now that I'm back at the office.

Following this will be libc-header updates and a bump to the new
release/reference kernel version (v6.15 ... or possibly v6.16) depending
on the timing of the upstream release.

Cheers,

Bruce

The following changes since commit 51d825b367971e8b63e704de4ff4419ba7afaa05:

  bitbake: cooker: Add better parse debug (2025-07-07 22:13:14 +0100)

are available in the Git repository at:

  https://git.yoctoproject.org/poky-contrib zedd/kernel
  https://git.yoctoproject.org/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (6):
  linux-yocto/6.12: update to v6.12.32
  linux-yocto/6.12: yaffs2: silence warnings
  linux-yocto/6.12: update to v6.12.33
  linux-yocto/6.12: riscv tune fragments
  linux-yocto/6.12: update to v6.12.34
  linux-yocto/6.12: update to v6.12.36

 .../linux/linux-yocto-rt_6.12.bb              |  6 ++--
 .../linux/linux-yocto-tiny_6.12.bb            |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.12.bb | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

-- 
2.39.2


