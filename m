Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAFA9C53210
	for <webhook@archiver.kernel.org>; Fri, 30 Dec 2022 16:45:14 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web11.22431.1672418709451734916
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Dec 2022 08:45:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=Pt/CE105;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.46, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f46.google.com with SMTP id 60-20020a17090a0fc200b002264ebad204so516918pjz.1
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Dec 2022 08:45:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PMGDWmg9PAddFOEGVeU0sof0rI6I7p3mI43qD5Jzhbg=;
        b=Pt/CE105mr8wYtI8SNmnVyRoOfnadL1c6EMxndvdZsXAhUKdAPG+/+2amNMdZXk3Dy
         CTOzh82wsyiWIA4zOxmBt4cLvqfmgNhnUQfbwnw9QetHyJM7O2ErDlSG65QeSva5ZbuA
         KKWXDnEH56qfp9aDqgSeC8ILBANQF9ST2CxRFKEFsq1rpuIvmxWX7T48f7kWUuF3s/de
         LyBoJ3d+iOcpoadPHVp1vUxPwe3RYL0Hu8SI7eD+8ktDLlrUkjveGIyFoTmBTYUJ8T0P
         p3dhkKF9awxQMgMwjFQTt3B7WSopZtLXDopLBfJ88nE5NALqFvPLK7OTZ10ywFkzZhe1
         QJKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PMGDWmg9PAddFOEGVeU0sof0rI6I7p3mI43qD5Jzhbg=;
        b=09L522v2p9tLrpOJcTpdhwOouf9widSjizehA17GyXSrP5immSOk5gugLp07HBGK0p
         RXMDIIgqUFuoaa9v8Pv6hx9dFRsucDA4KAk3d6BYqbAHNvo1+s7dJXo+WFOYL85fj+l2
         TO19IW56rwHdKpjC98EQfRiYhsc7VPHY8p3eCTUN4zaaMPLVXYF3F7gT155kMn6gNq+a
         ZR5g8dRmBCMtij3qS7RXueXOc+F1OTyhNiwShb9o9Hs89ctGZBYRUV9bqy9++jhBcCRv
         3/g9jtcucsHDF3AX4Max8Htjg81pFa4gBX/lTc4uz5KVihV2zeBH2jINEPlRHv36fQc0
         vEiA==
X-Gm-Message-State: AFqh2krIaG4lehdai2pG7u3Qx0F9pWucHxZL2mqp3JtUZrF6ZUU1WWEh
	cXuqa7lPzdmZ28/HyvP78WVrElQW1wLe3toqX1A=
X-Google-Smtp-Source: AMrXdXtq5cgZaD7lywT55gPsgkw4Ky8N/FOTqFWJO6NkWW4bsa8hAax60gCDISPtaODGK3Zs9tBVBQ==
X-Received: by 2002:a05:6a20:3b13:b0:ae:47a6:e6d9 with SMTP id c19-20020a056a203b1300b000ae47a6e6d9mr35423638pzh.6.1672418708444;
        Fri, 30 Dec 2022 08:45:08 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id a79-20020a621a52000000b00581ad007a9fsm4413200pfa.153.2022.12.30.08.45.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Dec 2022 08:45:08 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 12/22] openssh: remove RRECOMMENDS to rng-tools for sshd package
Date: Fri, 30 Dec 2022 06:44:02 -1000
Message-Id: <cdc166e1768efed848154b57e0174831cefb95bb.1672418540.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1672418540.git.steve@sakoman.com>
References: <cover.1672418540.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Dec 2022 16:45:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175153

From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>

It appears that rngd is not needed as of linux-5.6 and later[1]
and should not be installed by default since the purpose of rngd
is to provide additional trusted sources of entropy.

We did some testing on real hardware, the result seems to support that
we no longer need rngd by default on kernel v5.6 and later.

Testing result as below:

1. observing the crng init stage.
 the "random: crng init done" always available before fs being mounted.

2. generating random number without rngd.
 testing command: dd if=/dev/random of=/dev/null status=progress
   on Marvell CN96xx RDB board, speed almost 20.4 MB/s without block
   on NXP i.mx6q board, speed almost 31.9 MB/s without block
   on qemu x86-64, speed almost 2.6MB/s without block

3. using rngtest command without rngd
 testing command: rngtest -c 1000 </dev/random
   on Marvell CN96xx RDB board:
      rngtest: input channel speed: (min=4.340; avg=135.364; max=146.719)Mibits/s
      rngtest: FIPS tests speed: (min=8.197; avg=69.020; max=72.800)Mibits/s
      rngtest: Program run time: 418771 microseconds

   on NXP i.mx6q board:
      rngtest: input channel speed: (min=96.820; avg=326.769; max=340.598)Mibits/s
      rngtest: FIPS tests speed: (min=15.090; avg=37.543; max=40.324)Mibits/s
      rngtest: Program run time: 570229 microseconds

   on qemu x86-64:
      rngtest: input channel speed: (min=37.769; avg=101.136; max=136.239)Mibits/s
      rngtest: FIPS tests speed: (min=10.288; avg=30.682; max=40.155)Mibits/s
      rngtest: Program run time: 836800 microseconds

4. observing sshd service.
  using "systemctl disable rng-tools" disable service and reboot system.
  system boot up normal, sshd service also start in normal time without
  block.

Reference:
[1] https://github.com/torvalds/linux/commit/30c08efec8884fb106b8e57094baa51bb4c44e32

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 868dfb46d96a27ec9041cb902fb769330277257d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-connectivity/openssh/openssh_9.0p1.bb | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/meta/recipes-connectivity/openssh/openssh_9.0p1.bb b/meta/recipes-connectivity/openssh/openssh_9.0p1.bb
index b63ea2b137..689952e857 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.0p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.0p1.bb
@@ -52,15 +52,12 @@ SYSTEMD_SERVICE:${PN}-sshd = "sshd.socket"
 
 inherit autotools-brokensep ptest
 
-PACKAGECONFIG ??= "rng-tools"
+PACKAGECONFIG ??= ""
 PACKAGECONFIG[kerberos] = "--with-kerberos5,--without-kerberos5,krb5"
 PACKAGECONFIG[ldns] = "--with-ldns,--without-ldns,ldns"
 PACKAGECONFIG[libedit] = "--with-libedit,--without-libedit,libedit"
 PACKAGECONFIG[manpages] = "--with-mantype=man,--with-mantype=cat"
 
-# Add RRECOMMENDS to rng-tools for sshd package
-PACKAGECONFIG[rng-tools] = ""
-
 EXTRA_AUTORECONF += "--exclude=aclocal"
 
 # login path is hardcoded in sshd
@@ -160,10 +157,6 @@ FILES:${PN}-keygen = "${bindir}/ssh-keygen"
 
 RDEPENDS:${PN} += "${PN}-scp ${PN}-ssh ${PN}-sshd ${PN}-keygen ${PN}-sftp-server"
 RDEPENDS:${PN}-sshd += "${PN}-keygen ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-keyinit pam-plugin-loginuid', '', d)}"
-RRECOMMENDS:${PN}-sshd:append:class-target = "\
-    ${@bb.utils.filter('PACKAGECONFIG', 'rng-tools', d)} \
-"
-
 # gdb would make attach-ptrace test pass rather than skip but not worth the build dependencies
 RDEPENDS:${PN}-ptest += "${PN}-sftp ${PN}-misc ${PN}-sftp-server make sed sudo coreutils"
 
-- 
2.25.1


