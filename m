Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DF60C43217
	for <webhook@archiver.kernel.org>; Fri, 29 Apr 2022 16:02:09 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web08.11884.1651248124408488434
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 09:02:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=Inr+pKwG;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id b12so7523274plg.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 09:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=BioE3USUGxMcoG8mNvDs7EYRnMkvdj/nwkijiMGo7gU=;
        b=Inr+pKwGY8j0N3Eoax72FYjaJVsxh2vLKI4pYaAOnSA5ql+93zOJg+GVNf5CgJ+Fly
         /AF78mbDegSb0WWW6v7tEuAm/vf+84wRMKhgT68CaE/Qrk3TT5HiVUDTiOdeIbUTli4k
         1YhoasmamlMjRg62MmIPvuOGSgkjew0n37MvYZ1dYkmYbhxnrGzB66yb2qYFKSx0X9IN
         FM907uLee+x6s5tWwB8ar+Q4otBDm4/enDfvhWV7sGj/wVaoVQ6iqx49zlNFcB0Vxe/g
         Ubgp6IwmPk/9CyDj6+2MMjP8ey0+PnrlJdcRXPdicLqtNJjxa0vGAgKb37cPMKtJkZE3
         rrfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BioE3USUGxMcoG8mNvDs7EYRnMkvdj/nwkijiMGo7gU=;
        b=kcmmFm41GnPOfAxoRqJD1UprnXuwEsFUyYNs2NceDAdgnA+Azj1mM0OaxaK2zUP8mR
         tgYimCOz9QoVWFYWH5koSyx+XEBx/RwQPiIRU0Xn7aMdbMbTd4ZzH19FBVLwBXZcRkj/
         s14aAiAQpfnfw/EFYEF6VSL8F1e76cMALcuA2Rh6dMxbgwkzyTW4Rb3cIQwVgi4f2Ie7
         rYbodLS0xEGBRdlFBpfnL++XP4fNVrpKsuT6Q7OMJyEoDJ0coRYob1i/yFD44mPBlu3b
         /+49N1rWoQcX7LgjTTz7w8oo5iVWPpwmy2U3vJQB7CouBXKPisJP6LtU1hSbHAuR+MVC
         v3pA==
X-Gm-Message-State: AOAM531B4WmsbJf+jvf8r+fhgFiLdradd6I9ci6t1k0+5AgmhMrwIWag
	RZhByCsHwkmjkSdxzGAiTlWae9Vt7+Mt1QnrlP8=
X-Google-Smtp-Source: 
 ABdhPJy2HyuG4lracpoNXsLDq/TDmBSK1em4vblPRZSqN6qUahxyYEw+BB18e+mdyTnkph6y7UX+Ow==
X-Received: by 2002:a17:902:ce02:b0:151:a86d:dc2b with SMTP id
 k2-20020a170902ce0200b00151a86ddc2bmr82388plg.57.1651248123224;
        Fri, 29 Apr 2022 09:02:03 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 i3-20020a056a00224300b0050d32f838e1sm3486125pfu.21.2022.04.29.09.02.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Apr 2022 09:02:01 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 17/34] qemu.bbclass: Extend ppc/ppc64 extra
 options
Date: Fri, 29 Apr 2022 06:00:36 -1000
Message-Id: 
 <05caadbfb940e236dcdc41620cf20de5809e8f40.1651246310.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1651246310.git.steve@sakoman.com>
References: <cover.1651246310.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Apr 2022 16:02:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165036

From: Khem Raj <raj.khem@gmail.com>

Some recipes are marked machine specific which need qemu usermode during
build eg. if they use meson build system, which means they wont get
right -cpu settings to run qemu-ppc/qemu-ppc64 and build fails, this
ensures that we set the right options when PACKAGE_ARCH is set to
MACHINE_ARCH on ppc/ppc64 qemu

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9f71bbe65a458f08cd8ede6522c8b988603202a0)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/qemu.bbclass | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/classes/qemu.bbclass b/meta/classes/qemu.bbclass
index 01a7b86ae1..7493ac34d4 100644
--- a/meta/classes/qemu.bbclass
+++ b/meta/classes/qemu.bbclass
@@ -64,4 +64,8 @@ QEMU_EXTRAOPTIONS_ppc64e5500 = " -cpu e500mc"
 QEMU_EXTRAOPTIONS_ppce6500 = " -cpu e500mc"
 QEMU_EXTRAOPTIONS_ppc64e6500 = " -cpu e500mc"
 QEMU_EXTRAOPTIONS_ppc7400 = " -cpu 7400"
-QEMU_EXTRAOPTIONS:powerpc64le = " -cpu POWER8"
+QEMU_EXTRAOPTIONS_powerpc64le = " -cpu POWER9"
+# Some packages e.g. fwupd sets PACKAGE_ARCH = MACHINE_ARCH and uses meson which
+# needs right options to usermode qemu
+QEMU_EXTRAOPTIONS_qemuppc = " -cpu 7400"
+QEMU_EXTRAOPTIONS_qemuppc64 = " -cpu POWER9"
-- 
2.25.1


