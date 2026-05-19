Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 815CFCD5BA6
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 23:30:51 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1019.1779233443621298853
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2026 16:30:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=qgZwmynp;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48ff4f8ef0dso47477165e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 16:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1779233442; x=1779838242; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oE3aYSBF52qVbSf0opU/ta0V1vEo1StKEh3KB5OFdW8=;
        b=qgZwmynpExXUmDXIrhZ0Dy0xsB3RnXYz7A7CjR46ru2FXe15jyltFGmOVCoaPUeJgR
         DsVLrpwzXRWJdNFSlZ1bvlz8YZvV3gu/Iz+BOf9GG9Uud5YfrNzTtdqVy4n19RdZPsbb
         wGl4r4LNZMgKij3rYZRpAyc1Xql/VHPP4leBI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779233442; x=1779838242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oE3aYSBF52qVbSf0opU/ta0V1vEo1StKEh3KB5OFdW8=;
        b=dbXxw8LqZu2Oltn/O3VgBP8dxynjiTYTwP9ES25AVaKu18kGIOyW0JGaVT2xq9mCQk
         hOKkhgwLoyJoRgVhwdvhhKy4ph7TnIjKp1o81NjTKj6w2NZRcavH0qjU2coM2KWEopm5
         6EsCQO8OoZeM5QPQ2HjEakBlfAWQhqrkNJSdlMHRHf3eKKP4wXxBETManhJ8qdIQligk
         tfo1MuCAiC/T1zgXxUZo0BbgQuQOy2tldD8QwQf7RT6/VKk3J4R0mfsempg7cdHBhZkA
         CqIPJDN/h7D+g5HGPvELzlrS1B0YaqD08/rEujaNDV7SITgqvx0FDXrrHBhFrXZk6Jb7
         4kMg==
X-Gm-Message-State: AOJu0YzH6I+ylkAdndEDLg7e4ikqhsk81aPqigXXdxpLmH6QKA/KQNYB
	w8UC9L5ogL1hX8M3Vt/Qngsg4gOATV0xsotItFbuWtIW2oqWfdaDNgTh/jGj04pc/alhLO1IIS7
	kf3jA
X-Gm-Gg: Acq92OEpAAf3z7ORhk0j6fVGzUxIK6VQ7tNAthq/KtZ1UsoWfgdcvb0jN0yQQyk+lau
	mdGm50e53uabSUf44Wf6YqA9RKKCoHEPvEWzH/5tBGkdgBYCWTGkyk4fHZSG1MCnXlEd0+z+4y+
	MHiuslhCWhGccJJJIDPXgFnT+2bHRVaOn44jCEpjoXrKKsiXSzup0JfRuiWIqSJOlJd68RX2M6+
	iopIUO7Y/I6t5lhuwsIvcESrs5DWGfMIDGgeTQby5dU2SpoZAufQb5f84YM1rB6+f8KqRrhrBme
	237turY3hXLVdundJUhZKtkaPL3eN1LFRBKc/wCELlaPlrj9m1LK5v+sBk2Ei2k0DzftM6Yss/A
	Tw10eZ+4uQ6BfPEPf+cgmQIB493bT0ntuY/nIuasx19vBhMCU2j6oA4Lex9fJIqTbPTdON49nFJ
	lJt3rO+kBMvwp4IWzM9KT9BqHrGZ6dri1sFqvR8HTB2IROTP9AhLc75X1c/vJ++ynJ2kMAVMdJt
	5b7su14rCaUwoHyemk5PHrGE8lLIgcdYVGqJoYscKwRT80X
X-Received: by 2002:a05:600c:6206:b0:489:5022:39a4 with SMTP id 5b1f17b1804b1-48fe60e79fdmr339333075e9.9.1779233441683;
        Tue, 19 May 2026 16:30:41 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe5bc94sm224705795e9.4.2026.05.19.16.30.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 16:30:41 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 26/28] default-distrovars.inc: add missing spaces in append overrides
Date: Wed, 20 May 2026 01:30:03 +0200
Message-ID: <de013da75cefd30d065089e50865e132d9a69156.1779232800.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1779232800.git.yoann.congal@smile.fr>
References: <cover.1779232800.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 23:30:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237373

From: João Marcos Costa <joaomarcos.costa@bootlin.com>

DISTRO_FEATURES_OPTED_OUT is a space-separated list, so the missing
space leads to:

$ bitbake-getvar DISTRO_FEATURES_OPTED_OUT
(...)
   set /src/build/conf/local.conf:277
     "x11"
(...)
   :append[loongarch64] /src/openembedded-core/meta/conf/distro/include/default-distrovars.inc:26
     "seccomp"
(...)
DISTRO_FEATURES_OPTED_OUT="x11seccomp"

Signed-off-by: João Marcos Costa <joaomarcos.costa@bootlin.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f1e6a11501224e68a5989cc6cd33cf1b903e542d)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/conf/distro/include/default-distrovars.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
index 4bfe2469e28..69c6db589b7 100644
--- a/meta/conf/distro/include/default-distrovars.inc
+++ b/meta/conf/distro/include/default-distrovars.inc
@@ -14,16 +14,16 @@ LOCALE_UTF8_IS_DEFAULT ?= "1"
 LOCALE_UTF8_IS_DEFAULT:class-nativesdk = "0"
 
 # seccomp is not yet ported to rv32
-DISTRO_FEATURES_OPTED_OUT:append:riscv32 = "seccomp"
+DISTRO_FEATURES_OPTED_OUT:append:riscv32 = " seccomp"
 
 # seccomp is not yet ported to ARC
-DISTRO_FEATURES_OPTED_OUT:append:arc = "seccomp"
+DISTRO_FEATURES_OPTED_OUT:append:arc = " seccomp"
 
 # seccomp is not yet ported to microblaze
-DISTRO_FEATURES_OPTED_OUT:append:microblaze = "seccomp"
+DISTRO_FEATURES_OPTED_OUT:append:microblaze = " seccomp"
 
 # seccomp is not yet ported to loongarch64
-DISTRO_FEATURES_OPTED_OUT:append:loongarch64 = "seccomp"
+DISTRO_FEATURES_OPTED_OUT:append:loongarch64 = " seccomp"
 
 DISTRO_FEATURES_DEFAULTS ?= " \
     acl alsa bluetooth debuginfod ext2 ipv4 ipv6 \

