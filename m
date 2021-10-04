Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16C00C433EF
	for <webhook@archiver.kernel.org>; Mon,  4 Oct 2021 14:21:18 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web09.10128.1633357277582699712
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Oct 2021 07:21:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=D/Ptxufi;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id n2so11189734plk.12
        for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Oct 2021 07:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=leVONK2hxspoFQLU2I5LmbNdE0uyfe9DzN3BZ+aLrRw=;
        b=D/Ptxufio99SrnUCoAclvLcTlqYqs0razNfryz+XGdHeZcFn7b3TgQg4pZ9E9TYWqa
         ZtzoN7uP30Va+3KuUMmniBGXNnQan1J/bSfo/qH4M+6EzwlOHni2eaC8J+CJdyiQIFBl
         /dB5Kc8vTmc2Fciha7S7il1olznuB5esnXXqDAjHGeM+98j3pJKh78S96mPBzzSMx0xV
         mVOrr6feixKiIHsUci/kFPYR3o/9okRadmYXQgnwXIRT57cJdNxUwaTmLFNx/w0ZnGW1
         NmB00kJxTCxIRRjVvAmpl+2iXNbezKlrnDt13NUt/mHaz02pBF0tMrIhjK6kodwnPkrB
         yOcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=leVONK2hxspoFQLU2I5LmbNdE0uyfe9DzN3BZ+aLrRw=;
        b=hGpAe63t5TsZXQqoYGdLuMRDTI8xofiaTuBbpyjHJq6cEl8gMpbL/1vwM4vxh7OJmg
         3CnSPDJgbS8v9x/bsmjlati03nfSps2fLFyjEUQvOaN+xlav2oSxO2IpK+Z7OZHzY3NA
         qFJzMNYbZ+Fc0Dw7X5ew4nRgyKoR6zRT6FfqgahUpBYJbHahV0d7uj2xukCI9HXDUX1Q
         gblA3qtDIhkzRirVpiYZ5wCBXOjbWb+z5dOnxH4xxDfTtE36iXEMmk0uaqzgaANZKpgS
         cmwwlZO1souj6Cp+ngMpFoNPw7ryfaf9nT3iXiEsiKhEqZBp5e6zAQp8k1J039QVm5Vi
         J4Mw==
X-Gm-Message-State: AOAM532P/6RMm9zQwvE8+j9UAowM6dMCDL/g67AiIPkc7d9/RtKtJiXr
	x29mgcuY7+6EXnP6bhysfQ0z53efvpuFiHADit4=
X-Google-Smtp-Source: 
 ABdhPJya31llDpjSd2k7mZfpOQ05og2FmzXeTqa9Hts1ZjTWm+MGyhiYRSXeCQwDVqDXqt3JFHvk3g==
X-Received: by 2002:a17:90a:6401:: with SMTP id
 g1mr37345993pjj.228.1633357276624;
        Mon, 04 Oct 2021 07:21:16 -0700 (PDT)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 t4sm8313066pfj.13.2021.10.04.07.21.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 07:21:16 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 08/15] libsamplerate0: Set correct soname for 0.1.9
Date: Mon,  4 Oct 2021 04:18:36 -1000
Message-Id: 
 <eb637a677dfed8680d680349e616a358795a7d56.1633356813.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1633356813.git.steve@sakoman.com>
References: <cover.1633356813.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Oct 2021 14:21:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156601

From: Tom Pollard <tom.pollard@codethink.co.uk>

Manually patch SHARED_VERSION_INFO, which was missed in
the 0.1.9 release and later incorrectly fixed until 0.2.1

Signed-off-by: Tom Pollard <tom.pollard@codethink.co.uk>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit cb2e8efd316d44b9b1453882114856e0eb7b3500)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libsamplerate0/shared_version_info.patch        | 13 +++++++++++++
 .../libsamplerate/libsamplerate0_0.1.9.bb           |  1 +
 2 files changed, 14 insertions(+)
 create mode 100644 meta/recipes-multimedia/libsamplerate/libsamplerate0/shared_version_info.patch

diff --git a/meta/recipes-multimedia/libsamplerate/libsamplerate0/shared_version_info.patch b/meta/recipes-multimedia/libsamplerate/libsamplerate0/shared_version_info.patch
new file mode 100644
index 0000000000..b42d564b4b
--- /dev/null
+++ b/meta/recipes-multimedia/libsamplerate/libsamplerate0/shared_version_info.patch
@@ -0,0 +1,13 @@
+Index: libsamplerate-0.1.8/configure.ac
+===================================================================
+--- libsamplerate-0.1.8.orig/configure.ac
++++ libsamplerate-0.1.8/configure.ac
+@@ -53,7 +53,7 @@ AC_PROG_LN_S
+ #  6. If any interfaces have been removed since the last public release, then set age
+ #     to 0.
+ 
+-SHARED_VERSION_INFO="1:8:1"
++SHARED_VERSION_INFO="1:9:1"
+ 
+ 
+ 
diff --git a/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb b/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb
index 6dfc42b436..8345d6880f 100644
--- a/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb
+++ b/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb
@@ -10,6 +10,7 @@ PR = "r1"
 
 SRC_URI = "http://www.mega-nerd.com/SRC/libsamplerate-${PV}.tar.gz \
            file://0001-configure.ac-improve-alsa-handling.patch \
+           file://shared_version_info.patch \
 "
 
 SRC_URI[md5sum] = "2b78ae9fe63b36b9fbb6267fad93f259"
-- 
2.25.1


