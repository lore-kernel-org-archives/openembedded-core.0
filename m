Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 632A2C982E1
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 10:41:36 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.45102.1789981891391048872
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Sep 2026 02:11:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Wahc004/;
 spf=pass (domain: gmail.com, ip: 74.125.225.141, mailfrom: royzah@gmail.com)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49cd38e0e5dso37604535e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 02:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789981890; x=1790586690; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f7c5ruJTpY94pRXbTWFuREYLFUKYYE/s2AyA2SKMSV4=;
        b=Wahc004/L9+7LnpbSmqD9f0dO+Vvz5M1CZHKe6FlLaBNZ83VAa9RxAY6GweHrKZ5gc
         HIHsPEGG81KHhRBN4B0ZDItQdYmksaGcDJyJnj978KlDYEzrG97oGopZ5uaQbrarJto5
         SXxRWFnr7BwqzwPSk+CN27PMveN75Hryae75B7VT7P70Zas++UwCGigKAjOTwIKJNGPx
         cVcLYx8IxN/NXfmoXkjgxozjr0NG0xC49SqJimHo1sV1bBUv2xo3rTEo4c9y3VO9s8lX
         eDDiUV+9S1Tuz2f3kAJzs228Nn68Mje+q/9v+pEgrrMNPVPojPjrWP2N3Ii3Ot0uBcxY
         7gJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789981890; x=1790586690;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=f7c5ruJTpY94pRXbTWFuREYLFUKYYE/s2AyA2SKMSV4=;
        b=aGQg2O5vcH97pdATTHboZKlVuvgDKPYWzCTYCJdAfSK6envsJUP5nl6rnhl5muTA/4
         JjPH5TLBYUIwOA8dsFNeO2yYv/5LZLr76oMSemN1TV+Jq+AQ+8ZUhCWMaQx9ief+G3lM
         ykutm7tUmirbLnA8a/eOxKxR9jjM0O2Z4+h8WCLAZJ+30tQHTAM6RHliu50cxIlrfMGL
         tJUfsaeFlVaQhldvC0OjB39rqjQgsKfUxmG+yY6tSsJhkMO6XCjqfPVCCbWrX9CaLaxu
         +iJRzBWbQIjIa7a6llfRx6wuncYPsbnNIK6+0fSeTF2xVT43ah6YzBWj/Pvf5brbK9Vv
         i5OA==
X-Gm-Message-State: AFuF++na6Gfl2gPyKhJCviWSJdcZtx6V5uMmPflkf1PCzaURTsWBPg4u
	KmJCoJ3SCT2dZc65CXPMxa/BGvAxQkb8fm+4NXdfl4IEsGjMgWdgD+roso6FmtEVBeEKP1sYpX4
	=
X-Gm-Gg: AYBFou2PXNDjq9vKZpbksbrC6PRQGSk176oqN6bu4m0datJXAbH0C/+xagv4egVV22I
	Ak4NaoHdL9hMOR0iL0dy6D9b5q1VCWTASlkcsDrFnb++aSjWFUOSzc0SMEWAhWrpAhXiCAkaooI
	XE3G9XcZR3Yr774rI35uNZSnkmzWZXmww5GyDkSQWlncNOQGIf/cx+I0NMiXsIZ1ImksjOUsOo3
	6fEdHVK4jTLIP7bKlNl1CJ4LZCxjFyXDxtpMi31RT89d7+UqaLZpV+Pz+EM88LRDXRKqsTxJCTv
	NiRh+7FeWVXEP71upHLDag9ofHSwlcWBsFKs7NAxbr058YKrnATi8QIuK9l7Z6n5FHPYc42UvOI
	VJ3aeK1GDfGEYV6rQ3MoqP+nUqS/w2zOteCfU1/ibU3bST4S8swOiaILQU4tzwZj92RZLKqktb4
	O2OqwVCDuvC5vIpp+5qZ5HQy8vJEP1d7I/FV1KaxE2bwvGXbvao2WyaWn7bsWxTxpqBWQfpKHLa
	dgBwIU3/eRxmRLINbdQ4e5Vq6dGMsKdPCEEiDa4LgeUXyD5DPiDZBOWLOuEixw=
X-Received: by 2002:a05:600c:3b29:b0:49d:2450:68ac with SMTP id 5b1f17b1804b1-49fc566e6e0mr135305315e9.5.1789981889440;
        Mon, 21 Sep 2026 02:11:29 -0700 (PDT)
Received: from royzah-ThinkPad-T14-Gen-4.tii.local (bba-217-165-92-226.alshamil.net.ae. [217.165.92.226])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc5755c40sm284466265e9.3.2026.09.21.02.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 02:11:28 -0700 (PDT)
From: Royyan Zahir <royzah@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
Subject: Re: [meson.bbclass] bindgen_clang_arguments lacks C++ include paths, breaks C++ bindgen (mesa rusticl)
Date: Mon, 21 Sep 2026 13:11:18 +0400
Message-ID: <20260921091118.3545921-1-royzah@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260919172851.1564760-1-royzah@gmail.com>
References: <20260919172851.1564760-1-royzah@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 10:41:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246319

Hi Paul,

Thanks for looking. Versions first, then the trigger, then what I have not yet
established.

Layers, all pinned:

  openembedded-core  wrynose  f7397af248e1e338929d70a910b0fbc2341528ec
  bitbake            2.18     0ad6c1c34a5e07a5f8dd66ab248c1e7b37b69fa9
  meta-openembedded  wrynose  14282a02be9c74a1276a7cda7d6c89e054699a11
  meta-qcom          wrynose  ef0004df267743cc89d6a09bc724bc99ff541c01

Target is aarch64, mesa 26.0.5, LLVM 22.1.3, bindgen from bindgen-cli-native.

The trigger is only this:

  DISTRO_FEATURES:append = " opencl"

which selects mesa's PACKAGECONFIG[opencl], so -Dgallium-rusticl=true, and the
rusticl frontend runs bindgen over a C++ header. The failing command ends with
-x c++ -std=c++17 on rusticl_llvm_bindings.hpp, and clang cannot find cassert
from llvm/ADT/DenseMapInfo.h.

What I cannot give you is a runnable command line: our DISTRO and MACHINE are
in a layer I cannot share, and I have not yet reduced this to stock poky. I
tried to on the shared builder this morning and it refused before parsing with

  ERROR: User namespaces are not usable by BitBake, possibly due to AppArmor.

so that attempt proved nothing. Our own builds go through a wrapper that
handles it.

My reading is that nothing platform-specific is involved: bindgen_args() in
meson.bbclass passes HOST_CC_ARCH, TOOLCHAIN_OPTIONS and --target, and none of
those carry the libstdc++ include directories that clang needs when it
cross-compiles against a GCC sysroot. Any meson recipe running bindgen over a
C++ header should hit it. If that reasoning is wrong I would rather know than
have you chase our stack.

Happy to build a stock qemuarm64 case with opencl in DISTRO_FEATURES on a
machine without the namespace restriction and report back, or to test a patch
on aarch64, whichever is more useful.

Royyan

