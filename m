Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 759A3C982ED
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 16:05:36 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.215.1790005963792479637
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Sep 2026 08:52:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=mgiowE6V;
 spf=pass (domain: gmail.com, ip: 74.125.225.141, mailfrom: royzah@gmail.com)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49ccfd61ecaso27884395e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 08:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790005962; x=1790610762; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UpOX4d1dBIszvk/67rxjeBsKDemCUJGaAj/yrTjkVtw=;
        b=mgiowE6VqjUfO2BBml+pw2BmoOG+HcWBT50PYKmBkmZkaYuTxvmLuF1rmcKmDNh0EV
         G4XZzbTFMnXstloN+oc+t1rKTCvHdjYR3GmPcyZgQTuoi2XKYjWc3DEqpMMl0QaCnKLg
         6xDFYNV/q0UNgQ5YzkTJl79g6U9uvwTCi5vBxIDzqxSV38nDeUxhVtu2r/v57Z7JlTkL
         pRUgn5uY+0Md/yPet//F3xVwRpDDgVMCUFvvS7psutItuRdEg+IdyCJDmfW3jouXlRmo
         Fx+xeKV6u2ROsj308OCfKG+2sZowb7Vd/GjVtiyki3wdva/JEcnLIc8ZsppVxpGgkru8
         V8EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790005962; x=1790610762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UpOX4d1dBIszvk/67rxjeBsKDemCUJGaAj/yrTjkVtw=;
        b=GQiKn0FU1ztBSHswbJeW1Sowtbw+TMuoEP1ZwNFb9RbO9HQHJbM3wL9bOjNHtDZykr
         Bo7TZT1Tf0u9vCjG/Q3ac1tuMwDXsyrys0JOUXDYgoJys3DrPAuRm/YzavOaY8iZ1AFE
         87Gfvj9JwAZwWfj7q93z+tmb0eGshjcpHQUb9UpwEgDyxl0WBbneVEnN1SD/C129ecEl
         pjpibMFPi0q/2GsZZF/1hkhA+kxW+ecyVxV9K/Rml20zz04EjIyuNC/Y9WRBCwtwIwSG
         L7piNAPwIqWt9BvWSyc8wXJY3jKbjcfdS9iSnUanrDthCAC3W86f+kbYRuj6xLWb5Ttc
         ha2A==
X-Gm-Message-State: AFuF++lzJNoMsIiR7e6XSBRXy48qt9HRsoe4pbGv2S8q9K3oqgc030Kj
	9ZeRC6gWxYJTy8vQC6Y2RgbJJMvd9GHP1IjVjIvzepR9jQnfvX19Yy57KuXf01DBpainpqJ+
X-Gm-Gg: AYBFou1ZL2C0FlVEinyL5Yx8WRSgWj3SQs1cHxnncC7txJpYWHEIfDFvo4zY+JnU/Xh
	51xYXYOHZ8EZj0Gb+lw4FTxhtNMylAbAtXDVyUGY2nGkb38fxk7+Ms6SFZYwfFuGDvhSOLhogZ3
	oHiFLEDA3lJUpaQmedsTANRt+ImpcSdgLSeAsgWzcDpTybj2IOXSwK+MJgzQB1mrz0s6iZO+kYV
	o6RrbnijcPQu8iXSg+jz00Z7r4astSX7LFskyxBqCl4VANFJanV+WejNxldL0ZZ+6GfGS3XjjEI
	VCeqAJduLXDz6ZoIWChzpEAy0MNW3YlZ0EKObKFFGRih0+Hu6v6CDBpAUdv5/KrxmuL4K+9l4NK
	86nCzuStYMqzCAN/okBK0KMO5TSVOuxJfCCj2vdpOTtQllpzAqcfPaF62rFl3wLp5at7wAQypvp
	ktMJ/aTLyVfbBDeM4rR9mZNfiVB50LfE3tcZBrvIuLG32LfcmCnCTF2JWtt2/g0l7IOJCeJIVJu
	J6sbTexNHaH4Zh4w24=
X-Received: by 2002:a05:600c:8b61:b0:49d:e0c:e55e with SMTP id 5b1f17b1804b1-49fc574a635mr168930385e9.23.1790005961825;
        Mon, 21 Sep 2026 08:52:41 -0700 (PDT)
Received: from royzah-ThinkPad-T14-Gen-4.lan ([2001:8f8:1137:5e38:fead:ea16:3634:833f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd10273fsm243194935e9.7.2026.09.21.08.52.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 08:52:41 -0700 (PDT)
From: Royyan Zahir <royzah@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
Subject: Re: [meson.bbclass] bindgen_clang_arguments lacks C++ include paths, breaks C++ bindgen (mesa rusticl)
Date: Mon, 21 Sep 2026 19:52:28 +0400
Message-ID: <20260921155228.256241-1-royzah@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260921091118.3545921-1-royzah@gmail.com>
References: <20260919172851.1564760-1-royzah@gmail.com> <20260921091118.3545921-1-royzah@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 16:05:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246342

On Mon, 21 Sep 2026, Paul Barker wrote:
> Yes, I'd like you to confirm that the error happens on stock
> poky/qemuarm64 with just the DISTRO_FEATURES change to enable opencl.
>
> Also, please quote the email you're replying to so it's easier to follow
> the conversation.

Sorry about the quoting, fixed here.

Ran it, and it does NOT reproduce on stock poky. So my report was wrong, sorry for the noise.

oe-core f7397af248 + bitbake 2.18 0ad6c1c34, nothing else, local.conf was just:

  MACHINE = "qemuarm64"
  DISTRO_FEATURES:append = " opencl"

bitbake mesa: 2659 tasks, all succeeded.

rusticl was definitely on and bindgen definitely ran, so it is not that the path was skipped:

  gallium-rusticl=true                                    (log.do_configure)
  bindgen appears 4x in log.do_compile
  build/src/gallium/frontends/rusticl/rusticl_llvm_bindings.rs   13502 bytes, generated fine

And the interesting bit: bindgen_clang_arguments in that build has no C++ include paths either, same as ours:

  bindgen_clang_arguments = ['-mcpu=cortex-a57+crc', '-mbranch-protection=standard',
    '-fstack-protector-strong', '-O2', '-D_FORTIFY_SOURCE=2', '-Wformat',
    '-Wformat-security', '-Werror=format-security',
    '--sysroot=.../mesa/26.0.5/recipe-sysroot', '--target=aarch64-oe-linux']

so clang finds cassert anyway. My "any recipe doing C++ bindgen will hit this" claim is just wrong, ignore it.

One difference I can see: stock poky pulls LLVM 22.1.8, our stack is on 22.1.3 (meta-qcom pins it). The failure is clang chasing cassert from llvm/ADT/DenseMapInfo.h, so an older LLVM header pulling in something slightly different is my current guess. Guess only, I have not tested it yet.

Next thing I can do is the same stock build plus meta-qcom and its LLVM pin, one variable at a time, and see which one flips it. Will report back if you think it is worth it, otherwise happy to just carry our bbappend and drop this.

Royyan

