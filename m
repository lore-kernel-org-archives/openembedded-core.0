Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83762CA0EFF
	for <webhook@archiver.kernel.org>; Wed, 27 Aug 2025 21:30:39 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.6607.1756330229845953555
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Aug 2025 14:30:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=xwgj5HpA;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7704f3c46ceso283986b3a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Aug 2025 14:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1756330229; x=1756935029; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j7la/fFiO76PT50sbrmKizbT8InT19wZzwKvmHgaPao=;
        b=xwgj5HpA2XIly11UtD2vdotb8/DPUiF0LUI9yA1qUH89bbgpFByGXCb4twvRse93Qr
         IF/xYsE6fvtVJTvC1ZdFRdnoDI4/IALHDG/IaeOH580bkupjgNkNG0khxBQ0ZUjisWTo
         KyeDDexsrTMjcceDxY0yd8HWMp5VvP/0WovCL/C2Z4ltAQqPAVKt61U+WYYrFs16RPWo
         0O3esgvFqJeGBR4iBWxlT+jlCNqBr5MEa92vTVMqQx2tUSiIgKgMVmh05NM/y9eABWhf
         s5dJij+81DMNTFr0j1oB79P832VmnpDvc/0qvVuyDoSHB1Auh5NtvwaE5iJxowSPSPvT
         0wLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756330229; x=1756935029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j7la/fFiO76PT50sbrmKizbT8InT19wZzwKvmHgaPao=;
        b=NM9swrwnzvxnihEkAlHKFfLcjM9sx13JwdzSjwoCOXR8lYbLYtfWH6VR0TbcvTMYXm
         VEMP8DdUMy0/vK1r76MIedNFQhehpLjIbUhCLO9LOBQDAXoCDHfbILYiXFmUgStPL4qc
         buu6OZmNYT2oWfqWESQCF+3Fj1pIpjiuEjGfdnUtC7Rl0sJLfJ6YHdEbqmieF17acTUU
         X+b/2DwQm9tMFI04cdTDdfRLZxcOeuUIMP0mIIcllqNQiRbLbIjaZ+Y84XHyfqOy7SQf
         FYL43NDF9V22XDjLxckMeLCvHzYLc4mmxtz8aTtMN0OtKPiV+8QgHlBNuRyvH4Ykr95t
         7FOg==
X-Gm-Message-State: AOJu0Ywer8fqr4jDE+bvwFQoT+vDS3wY1XVwnCiJHauQ7SLYh0J8s82t
	ZjJnY++c31iDeeUz1KN1dF9f8u4kyeU1ZDtzyYxvdkzNRz+yA7T3Ibg5+/dy+uJrCF5NUYulOqa
	zlyeH
X-Gm-Gg: ASbGncu8BPOFVJJXPpA0AuUlLCCrtVl0FSgx4KBrAxy3/Zri72CmHu5xze/tiSkPLNe
	U/uM4d+76g6RSWamC7J0zlwlMghZQVwP/sfNRpHytOOuxVfg1moYTiOln/VFVpVphNa53TtsfrF
	Pmja563Hlyx22th7FeW95hWJ/BTZoYQBQh4taTT4kfem8lEoTvZU5oKfzF1WW0wnn7c0LrOtlo1
	ZbZf2PsdYYNM2o0gI7peNmtcpRDL/kv8KyO5ls3p/lmRi3rj5crKVfG6n9uZCLA4MRQefQLdIXj
	nvETFTLt8L/TWee8EZ3cJQAcCr2b79Qt0Oo0cmxSw5u6jWIDYrKS0+FWBIRIHTkzGWh+nZn97nF
	Ld26+KCOxsoGofzeEKXoIC6RL
X-Google-Smtp-Source: AGHT+IFftx6LQRNtJijmwg6salDvyRukHjFTWqyfc77bsNlrtxI9PAl3j+Xtn9AkMkltCMJOxC6JZg==
X-Received: by 2002:a05:6a20:734e:b0:240:1918:1c1f with SMTP id adf61e73a8af0-24340d2c281mr32828629637.39.1756330229010;
        Wed, 27 Aug 2025 14:30:29 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:d0c9:1052:20fd:8423])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3276fce1f30sm2905857a91.23.2025.08.27.14.30.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 14:30:28 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 20/33] gdbm: Use C11 standard
Date: Wed, 27 Aug 2025 14:29:27 -0700
Message-ID: <97989d81c5e30434594beadd9449e907e98d3ceb.1756329972.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1756329972.git.steve@sakoman.com>
References: <cover.1756329972.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Aug 2025 21:30:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222528

From: Khem Raj <raj.khem@gmail.com>

GCC15 is switching defaults to C23 and gdbm is not yet ready to
compile using C23 std.

For scarthgap also add it in BUILD_CFLAGS.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/gdbm/gdbm_1.23.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-support/gdbm/gdbm_1.23.bb b/meta/recipes-support/gdbm/gdbm_1.23.bb
index a08079741d..9b32935571 100644
--- a/meta/recipes-support/gdbm/gdbm_1.23.bb
+++ b/meta/recipes-support/gdbm/gdbm_1.23.bb
@@ -23,6 +23,10 @@ EXTRA_OECONF = "--enable-libgdbm-compat --without-readline"
 # Stop presence of dbm/nbdm on the host contaminating builds
 CACHED_CONFIGUREVARS += "ac_cv_lib_ndbm_main=no ac_cv_lib_dbm_main=no"
 
+# Not yet ready for C23
+CFLAGS += "-std=gnu11"
+BUILD_CFLAGS += "-std=gnu11"
+
 BBCLASSEXTEND = "native nativesdk"
 
 do_install:append () {
-- 
2.43.0


