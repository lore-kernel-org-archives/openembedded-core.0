Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03D2DC433EF
	for <webhook@archiver.kernel.org>; Thu, 24 Feb 2022 15:03:14 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web11.11406.1645714992628869541
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Feb 2022 07:03:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VMcmOt2n;
 spf=pass (domain: gmail.com, ip: 209.85.218.49,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id gb39so5002408ejc.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Feb 2022 07:03:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LWZTDaGYV9GuXB9fzjc6MzXU43O/Rm6tqNTo4+VN0C0=;
        b=VMcmOt2nWZTZek7hy/gybopfyO+i4exVuYo2mQ9+wfiOxqeRPlWj0uMg9m8u8qXgZb
         eLheLjt9DSb/PMHkclz3XFBT0K6EFAGs1sqekbz9f4VeI47bwms+5glY1+uSgiNRF0e+
         Vr/AXqpc5TmAtxbwYp4F4eVtyAEkLM0dM3mzv3Is9a9RhFXsm3WLgdfkWnwefcrgP6TJ
         iXyjEoFeBk0zB7yR8ILvHHXn/UobuvSmm7CU+xfb4XUJC5rQkFHsHPeMAvuoL/rrgrDa
         hAU3HrMkt5mA14yGTTxlO9BJpoSo2VCBUxW9VaJqJ4Tit+7sNUsX9p0yt4Edf61q4mY2
         EiJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LWZTDaGYV9GuXB9fzjc6MzXU43O/Rm6tqNTo4+VN0C0=;
        b=pyMlq35SxX9UAeLcrJzcnSXVoDgLKpt57T6s52Z4BuYwMU9JV4tZAhlr0cO2vlNvi8
         L+fPMCZ2CtGxpy6OWm+sjqLACmOt9Q06cAaXRQAi1aERrQJGDlhm5BB8wsGFMGS8Ga9L
         11xlZ0v3jce3oOLCpgz7lo93tdhgVbOWAG/OJ9TUQcJ1xwNMbZNFYUrTsad/pPkxHe/m
         1I+1PSm5UygCChP0w3YS03fXiyfY02omBDrp4KYw3ZuZ+BatkE14ly8DhInFxGwIl3SC
         cu6glg9HF+3H+daesQbnypgkTeBHY7/ZJpXjnQIHbkBAIQnrgs39fam3FLjjEv+Qd9Ue
         nbQQ==
X-Gm-Message-State: AOAM532XF/QyV/GG3VmG9YtxotnFmjlhA/2e4VkS16RMM0LXD1aIbgz4
	N5tjFS0lMkNYEqXRE6k14GxU8zE2l6Y=
X-Google-Smtp-Source: 
 ABdhPJy6caz+inATv0LQUy+B795JeLVKBOetiRdfjp6MQorgA4wqtsPNvstlfsbTwFPqAYs7rZqz8w==
X-Received: by 2002:a17:906:7b91:b0:6cd:19b4:edfa with SMTP id
 s17-20020a1709067b9100b006cd19b4edfamr2526389ejo.227.1645714990846;
        Thu, 24 Feb 2022 07:03:10 -0800 (PST)
Received: from nereus.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 z12sm1573173edb.77.2022.02.24.07.03.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Feb 2022 07:03:10 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 0/3] Fixes to enable cross-canadian toolchains
Date: Thu, 24 Feb 2022 16:02:59 +0100
Message-Id: <20220224150302.1341776-1-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Feb 2022 15:03:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162315

I've been working to enable putting a cross-compiler on a regular
Yocto target (as opposed to SDKs), and these are the changes
needed in oe-core to enable that.

Two of them swap TARGET for HOST (the terminology is set by the GNU project,
it is confusing, but it still needs to be followed), one allows populating
the native sysroot of a target recipe with the output of two different cross
recipes building for different TARGETs.

The actual cross-compiler is available from here, please refer to the README:
https://github.com/kanavin/meta-cross-toolchain

The plan is to further investigate what happens inside gcc's build system so that
the way that layer works can be better aligned with oe-core.

Alexander Kanavin (3):
  base/staging: use HOST_PREFIX, not TARGET_PREFIX
  sstate: do not add TARGET_ARCH to pkgarch for cross recipes.
  insane: use HOST_ variables, not TARGET_ to determine the cross system

 meta/classes/base.bbclass    | 2 +-
 meta/classes/insane.bbclass  | 8 ++++----
 meta/classes/sstate.bbclass  | 3 +--
 meta/classes/staging.bbclass | 4 ++--
 meta/lib/oe/sstatesig.py     | 2 +-
 5 files changed, 9 insertions(+), 10 deletions(-)

-- 
2.20.1


