Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83DF8C433EF
	for <webhook@archiver.kernel.org>; Sat, 21 May 2022 09:03:09 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web08.3887.1653123787958524262
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 May 2022 02:03:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YcJxarDB;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id k30so14244742wrd.5
        for <openembedded-core@lists.openembedded.org>;
 Sat, 21 May 2022 02:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Yx5dZ4Q8ixtJaB0Kj1E2N4jf2rmHmfkusL0DogaPw9I=;
        b=YcJxarDBNKUVpuDAlCNGb0XYOQfpCwd8bShUe+tZcVeHzvNOQVEVVPF8Lzn1QdR9Xh
         pQBtUhm8P0VXqTpKzW02Fa8wimNcQ4uFwXY97Z5NhNrxCAN1P8Fs++/SDR0MbdPwaOGK
         ooIyNv/870RkgU1Mb/h85h4yCzoxwTGEdHVi8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Yx5dZ4Q8ixtJaB0Kj1E2N4jf2rmHmfkusL0DogaPw9I=;
        b=F2eOtLC0Na0KEDrv+h4/efrrAu4cSJYUjP5XbO2au8aqHlg7mjbPKKHoPXOSo7l0bF
         mZWDyLa35N+hb7QSE1b2EabXsJMMmmnU/OaJuH2V36Qgw79P0AuHabc0cHfqWoOVapwD
         21d6s8116tKYp+J8ExF0qhEuJ/y7sdo5tZw4PMPuBASrkD3xKnLqwU3hLwKCANnxYkIj
         icIioYXRb+zqiLUYNlAoMDtkNPY0HwQN/D42Wsfa/Ovj116v57sWjm1nwlnH3mdIUKRu
         jKP/oDvdPsJ9KHqtpW5EZky4mX24f0frjyjEbQecr0E0xYyArXWYj3IIrZ8ulnA878i+
         ivWQ==
X-Gm-Message-State: AOAM532//LT46/wdWYEb2ib3fBQ7XZoEQkF1zEl1ID+bXsQDWUD4lvGd
	0HUtx5Xvq3Yf9jTXFxIMRRRfpJL2y9Z6kZC/
X-Google-Smtp-Source: 
 ABdhPJzFgrRxpOyLsW1kxrxybkwRnz5ZshsY4m3i55yBGrYfi2iTOeOuRLxxfIE2xXFQd8IBTVzM0A==
X-Received: by 2002:a5d:598f:0:b0:20c:83c9:b05b with SMTP id
 n15-20020a5d598f000000b0020c83c9b05bmr11399912wri.343.1653123785960;
        Sat, 21 May 2022 02:03:05 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:d812:46de:9e00:ca1c])
        by smtp.gmail.com with ESMTPSA id
 x18-20020adfae12000000b0020c5253d8e1sm5570064wrc.45.2022.05.21.02.03.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 May 2022 02:03:05 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] rust-common: Fix sstate signatures between arm hf and non-hf
Date: Sat, 21 May 2022 10:03:04 +0100
Message-Id: <20220521090304.173824-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 May 2022 09:03:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165961

Building with MACHINE=qemuarm and MACHINE=qemux86-64 causes rust-native
to rebuild. The reason is all the ingredients into the RUST_*_SYS
variables are being tracked but that doesn't really make sense in this
case:

$ bitbake-diffsigs tmp/stamps/x86_64-linux/rust-native/1.60.0-r0.do_rust_gen_targets.sigdata.63* tmp/stamps/x86_64-linux/rust-native/1.60.0-r0.do_rust_gen_targets.sigdata.34*
NOTE: Starting bitbake server...
basehash changed from 860b8f11b10182dc5b2737f62cdb697477f714adb63eeb4d4b932d67cac8eec2 to 9379e8b9df9696e8056fec7d1534661f34dda073f6d816e241b09a2dff76ae2d
Variable rust_base_triple value changed:
@@ -36,4 +36,4 @@

 # In some cases uname and the toolchain differ on their idea of the arch name
-TUNE_FEATURES{callconvention-hard} = Set
+TUNE_FEATURES{callconvention-hard} = Unset

Switch to using the final variable value for sstate signature purposes
which avoids this issue.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/rust-common.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/rust-common.bbclass b/meta/classes/rust-common.bbclass
index 02a538258af6..cb811ac5da7d 100644
--- a/meta/classes/rust-common.bbclass
+++ b/meta/classes/rust-common.bbclass
@@ -117,8 +117,11 @@ RUST_BUILD_ARCH = "${@oe.rust.arch_to_rust_arch(d.getVar('BUILD_ARCH'))}"
 # its likely best to not use the triple suffix due to potential confusion.
 
 RUST_BUILD_SYS = "${@rust_base_triple(d, 'BUILD')}"
+RUST_BUILD_SYS[vardepvalue] = "${RUST_BUILD_SYS}"
 RUST_HOST_SYS = "${@rust_base_triple(d, 'HOST')}"
+RUST_HOST_SYS[vardepvalue] = "${RUST_HOST_SYS}"
 RUST_TARGET_SYS = "${@rust_base_triple(d, 'TARGET')}"
+RUST_TARGET_SYS[vardepvalue] = "${RUST_TARGET_SYS}"
 
 # wrappers to get around the fact that Rust needs a single
 # binary but Yocto's compiler and linker commands have
-- 
2.34.1


