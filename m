Return-Path: <oo.hehir@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 573D3CCF2CC
	for <webhook@archiver.kernel.org>; Sat, 17 Oct 2026 11:24:12 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4491.1792236248644873452
 for <openembedded-core@lists.openembedded.org>;
 Sat, 17 Oct 2026 04:24:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Ax96GbcZ;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: oo.hehir@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48af4d4e61fso364348f8f.2
        for <openembedded-core@lists.openembedded.org>; Sat, 17 Oct 2026 04:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792236247; x=1792841047; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FFDSI5MWwc1WiEvgx1yW8wnz9bkGttMHMHTyDy6i7mU=;
        b=Ax96GbcZi94dQWZobrXJqpYVVxHNTSMGBfYUsTH4BmO6CrrvAJEPDXttrgd8tZhuOC
         sv/RLmGsLry2qWhSpXJRk0ms/SWKXnh5QkRyhHcrq1tVybQ4qXEQUIG+dN+uZo4rnkNK
         F6W0CIoLTMPypMJFe+D0KMU54BkV8jBgfotCS38Bz80BLZmMBlod6Zt2ngRqkaeUo8PZ
         aRpipVDFpiWT4xCJCqNjW+pOTzHQxd2//UFmFiomHrIAXYzmcx0unoWB9eAxRibrijgB
         Iuk4zJNOU1PPK3A8I7eihgZMzm/WhFYQM+KYqnWJ0iL+fNGYm9/J/ZyB+JiZmFYcvkxD
         p4aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792236247; x=1792841047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FFDSI5MWwc1WiEvgx1yW8wnz9bkGttMHMHTyDy6i7mU=;
        b=jMZCMYF+mBjttAo2K3Ai+N3UFRagYustOdudrIxaGXgBShbVcaT6ubXmfnQ7yV8cAB
         NJBvGc7Kc8icchK/ISuXRFR9g4W5TM4u/NZHlmXMRRQtlfvn1OePpX405GoVY/JA3kD9
         hfiG6gxvdN2Cw7+pIovolFbjkfZIPiSB//OlrP0ska598pC9KFKWpqlUttMmKOt3jf9z
         BRjLESF3BTwTnUvqfMokjOdfjY3f0RMCdo0PNtuMpAoYUyposK7L47qOqX6FG/s1rna+
         KBuqWqwm/+5018XDHfl5dijzee8mhnvsdgokOQuvFjKWSG11pCUwy43hP4ouOETH9ZdK
         7HeQ==
X-Gm-Message-State: AFq9FYLU56gMEwtnOZscLmnJww4kt/ZFIhNeZXoGBwIedMR6iPWFxyTb
	0spxaEAIJpRbeaN3Rh5WPc1IHryuytlNt0jBulzU3vknhq9HoR5fgVF/es5js/JJ
X-Gm-Gg: AYBFou2YZpHXylVj8SPgT1DJILOyysnFBbT8T/Lyg2tiOQoXAqjJV6e5IFD0bvGswcF
	Huuh/IkuHE3qrBOvNn7W6zNP8duEb4YTNz0pMRt75JdWOW+NvKXTjSSAOR2kUIukdzpSCe5mpVh
	qNKRowUOcKM4arqOqbK5l/RsEr3hcSrJzegixDiJeTdIAqi8et+Bxn/kOx9t236ZF0GVJ9MHUNc
	D3rRr7UUrewp+IfjsLi77uSAX0id8p+YJlw6IPSQnPvo9v3QLzp1KZ812PmOcCdiy5XgN6ulVVm
	YaSxb+l50A4OPqsLkFugFtW3ew9B/BJrcT3PUuKO3tbJmx3Cl4/OIDhL6QYVW1l0q71mvvXkwTw
	3P0DbqCbwM/t584Optx6mkrGIP+LAOVolN1Z1PKGXG5nHX5K/WsISnlkewJNBTPmMSJncqjfxGv
	H8jydm8PUAbzvD+nYN9EjYg6rHBBH8MnbiJppucI7EcjC364w7kygMj8i2143jbtx2TnSheQWys
	lDLHA==
X-Received: by 2002:a05:6000:4a0e:b0:48b:1119:5756 with SMTP id ffacd0b85a97d-48e07bbd34bmr3838930f8f.17.1792236246877;
        Sat, 17 Oct 2026 04:24:06 -0700 (PDT)
Received: from hp-z640.fritz.box ([109.77.135.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd471877sm9140287f8f.1.2026.10.17.04.24.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 04:24:06 -0700 (PDT)
From: OOHehir <oo.hehir@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com,
	tgamblin@baylibre.com,
	mathieu.dubois-briand@bootlin.com,
	OOHehir <oo.hehir@gmail.com>
Subject: [PATCH v2 2/8] ptest-packagelists.inc: re-enable strace for riscv64
Date: Sat, 17 Oct 2026 12:23:51 +0100
Message-ID: <20261017112358.77434-3-oo.hehir@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261017112358.77434-1-oo.hehir@gmail.com>
References: <20261016204547.2328847-1-oo.hehir@gmail.com>
 <20261017112358.77434-1-oo.hehir@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 17 Oct 2026 11:24:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248081

strace was parked with the other failing riscv64 ptests in 22736c5281 &
passes now. core-image-ptest-strace on qemuriscv64, with the previous
commit: 1081 pass, 0 fail, in 24 min. On a VisionFive 2 (JH7110): 1212
pass, 0 fail.

Signed-off-by: OOHehir <oo.hehir@gmail.com>
---
 meta/conf/distro/include/ptest-packagelists.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 2bd11b1706..5e99b59d4a 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -167,8 +167,8 @@ PTESTS_PROBLEMS:append:riscv32 = " lttng-tools strace"
 PTESTS_SLOW:append:libc-musl = " libc-test"
 
 # These tests don't yet pass for riscv64
-PTESTS_SLOW:remove:riscv64 = "tcl tcl8 python3-cffi strace lttng-tools python3-numpy perl glib-2.0 zstd libpcap"
-PTESTS_PROBLEMS:append:riscv64 = " tcl tcl8 python3-cffi strace lttng-tools python3-numpy perl glib-2.0 zstd libpcap"
+PTESTS_SLOW:remove:riscv64 = "tcl tcl8 python3-cffi lttng-tools python3-numpy perl glib-2.0 zstd libpcap"
+PTESTS_PROBLEMS:append:riscv64 = " tcl tcl8 python3-cffi lttng-tools python3-numpy perl glib-2.0 zstd libpcap"
 
 # These tests don't yet pass for musl qemuarm64
 PTESTS_SLOW:remove:libc-musl:qemuarm64 = "strace perl gnutls glib-2.0"
-- 
2.43.0


