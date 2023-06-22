Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4207EB64DC
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 17:11:18 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web11.17329.1687453869834016087
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jun 2023 10:11:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=oyA5DSnm;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-988a076a7d3so700254066b.3
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 10:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687453868; x=1690045868;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nuQByMN3nmu2V9tADR0A1mWyqgKtEwYXzlcDVwH3VpY=;
        b=oyA5DSnmNKoRa2ppK+ih0FCSyiREBBJWDujjzCxif/2v1BEzdQOLLbSC9Ituw6wFUR
         ylWBHfe2IelkNr4uoAmc0X+7N37ShjnvdMYSWWkkWGxT4Udp5/UpRkrKu9ltyBAz0LE5
         y8MmGf4R/DREJv8gALQ0UOx4WpDy2gxHInhAir/VmVzDKzidBg7LIA/naQVnPJhr3tWs
         tmE1rkUwrL9MKQqTgInAiH7D5bERaFMaM6BRwNnLPmtE2lRg1qPIkfzgvFty53Okbe36
         OBhHeLHiUdyJ8a/6aNuhoMhCK8QNRRqMXTUnZkw6X3ZBV5R8fsaDFBn4mNAzLk4Lsp1J
         8+tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687453868; x=1690045868;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nuQByMN3nmu2V9tADR0A1mWyqgKtEwYXzlcDVwH3VpY=;
        b=V6Lo/7bPnE1ybZg3Bgsg6Ayxg6nG5SrpCbEuwsQVdc4eEu9GFw8/7qQjPj3mrgPwq3
         3uiuo69WblKXyzBHHdewJXY9qEP7YrdoApUiijPPv5BUSEm0eLOiX4dP8xB2aZ4WJkUw
         1NrnlewJKQA22jls8cM0dUhMoci+/CCGCX/lK3J3oZCxU9BJAjIfwzaVxc571EOuVSlS
         jUfiKS3LXOnAJU6qFk8OC7f2RuGZFVcuVWgqjJl1yWI1sGofK8etQ+Sq2GIhUNZMFryy
         bByoGu5w8RDHJaL89Uv+cEN40GxawAWsUhOGnwGnDUuJALWOZghPuU6877xyFQkdk3hA
         pb3Q==
X-Gm-Message-State: AC+VfDwwmF3M/Kgjl57bvq/fNmOLiOjwLuACcaB+XU3uRmQAtNBeHXDE
	Kzg8sqm8KPfarAuZN6FwmExy/1cyHhQ=
X-Google-Smtp-Source: ACHHUZ6yW91gFSxMfgneD41wzTRcR6Z6mHj3OQdQW0gsfkkXtP0eqI9KJH9UXvBuzB++5GVS+TqvLw==
X-Received: by 2002:a17:907:72c1:b0:96f:a891:36cb with SMTP id du1-20020a17090772c100b0096fa89136cbmr17903473ejc.0.1687453867691;
        Thu, 22 Jun 2023 10:11:07 -0700 (PDT)
Received: from t14s-af.fritz.box ([2a02:169:59a6:0:5488:f785:9061:cf6c])
        by smtp.gmail.com with ESMTPSA id m12-20020a1709062acc00b00982b8cd7a44sm4917053eje.139.2023.06.22.10.11.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 10:11:07 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 0/9] fixes for runqemu-gen-tapdevs
Date: Thu, 22 Jun 2023 19:01:20 +0200
Message-ID: <20230622170946.10082-1-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 17:11:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183277

At least on my machine recent the changes related to the tap interface
setup for Qemu broke even more than already discussed e.g. here:
https://lists.openembedded.org/g/openembedded-core/message/183176
These patches should fix and improve the related scripts:
- First interface is now tap1 with IP address 192.168.7.3. Go back to
  tap0 with IP 192.168.7.1.
- Rather than looping over all tap interfaces which are available on a
  machine, handle only interfaces with a name like tap*. (I need my VPN.)
- New feature: Make the tap interface names configurable at least for
  the basic runqemu use case.
- Cleanup unused parameters and variables. Scripts are supposed to be
  backward compatible. They print warnings for deprecated parameters.

I did not yet run the self tests, but I tested it like that:

Without these patches:
The tap interfaces get created with index 1 instead of 0. Also the ip starts at 3 instead of 1.
This breaks probably several things which use the well known 7.2 IP.

$ sudo -E ./scripts/runqemu-gen-tapdevs 1000 1000 0 $BUILDDIR/tmp/sysroots-components/x86_64/qemu-helper-native/usr/bin
$ ip l
#OK no tap interfaces
$ sudo -E ./scripts/runqemu-gen-tapdevs 1000 1000 2 $BUILDDIR/tmp/sysroots-components/x86_64/qemu-helper-native/usr/bin
Creating 2 tap devices for UID: 1000 GID: 1000...
Creating tap0
Creating tap1

$ ip l
80: tap1: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc fq_codel state DOWN mode DEFAULT group default qlen 1000
    link/ether 36:74:1b:fa:be:df brd ff:ff:ff:ff:ff:ff
81: tap2: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc fq_codel state DOWN mode DEFAULT group default qlen 1000
    link/ether e2:49:ac:ff:cf:0f brd ff:ff:ff:ff:ff:ff
$ ip address show dev tap1
80: tap1: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc fq_codel state DOWN group default qlen 1000
    link/ether 36:74:1b:fa:be:df brd ff:ff:ff:ff:ff:ff
    inet 192.168.7.3/32 brd 192.168.7.255 scope global tap1
       valid_lft forever preferred_lft forever
# Bug: Why not tap0? Also the first IP is now 192.168.7.3 instead of 192.168.7.1

With these patches:

$ sudo -E ./scripts/runqemu-gen-tapdevs 1000 1000 0 $BUILDDIR/tmp/sysroots-components/x86_64/qemu-helper-native/usr/bin
Warning: Ignoring the <native-sysroot-basedir> parameter. It is no longer needed.
Warning: Ignoring the <uid> parameter. It is no longer needed.
Note: Destroying pre-existing tap interface tap0...
Note: Destroying pre-existing tap interface tap1...
$ ip l
#OK no tap interfaces

$ sudo -E ./scripts/runqemu-gen-tapdevs 1000 1000 2 $BUILDDIR/tmp/sysroots-components/x86_64/qemu-helper-native/usr/bin
Warning: Ignoring the <native-sysroot-basedir> parameter. It is no longer needed.
Warning: Ignoring the <uid> parameter. It is no longer needed.
Creating 2 tap devices for GID: 1000...
Creating tap0
Creating tap1
$ ip a
84: tap0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc fq_codel state DOWN group default qlen 1000
    link/ether 1e:d7:db:93:1d:dc brd ff:ff:ff:ff:ff:ff
    inet 192.168.7.1/32 brd 192.168.7.255 scope global tap0
       valid_lft forever preferred_lft forever
85: tap1: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc fq_codel state DOWN group default qlen 1000
    link/ether 36:74:1b:fa:be:df brd ff:ff:ff:ff:ff:ff
    inet 192.168.7.3/32 brd 192.168.7.255 scope global tap1
       valid_lft forever preferred_lft forever
#OK: fixed start index of tap


Without these patches the scripts try to delete other tap interfaces asa well:

$ sudo ip tuntap add foo-tap mode tap group 1000
sudo -E ./scripts/runqemu-gen-tapdevs 1000 1000 0 $BUILDDIR/tmp/sysroots-components/x86_64/qemu-helper-native/usr/bin
Note: Destroying pre-existing tap interface tap0...
Note: Destroying pre-existing tap interface tap1...
--> Note: Destroying pre-existing tap interface foo-tap...

With these patches this is fixed:

$ sudo -E ./scripts/runqemu-gen-tapdevs 1000 2
Creating 2 tap devices for GID: 1000...
Creating tap0
Creating tap1
$ sudo ip tuntap add foo-tap mode tap group 1000
$ ip l
89: foo-tap: <BROADCAST,MULTICAST> mtu 1500 qdisc noop state DOWN mode DEFAULT group default qlen 1000
    link/ether 8a:93:d3:4f:0d:ae brd ff:ff:ff:ff:ff:ff
90: tap0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc fq_codel state DOWN mode DEFAULT group default qlen 1000
    link/ether 1e:d7:db:93:1d:dc brd ff:ff:ff:ff:ff:ff
91: tap1: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc fq_codel state DOWN mode DEFAULT group default qlen 1000
    link/ether 36:74:1b:fa:be:df brd ff:ff:ff:ff:ff:ff
$ sudo -E ./scripts/runqemu-gen-tapdevs 1000 0
Note: Destroying pre-existing tap interface tap0...
Note: Destroying pre-existing tap interface tap1...

ip l
89: foo-tap: <BROADCAST,MULTICAST> mtu 1500 qdisc noop state DOWN mode DEFAULT group default qlen 1000
    link/ether 8a:93:d3:4f:0d:ae brd ff:ff:ff:ff:ff:ff


New feature: OE_TAP_NAME variable allows to rename the tap

export OE_TAP_NAME=tap-yocto-
$ sudo -E ./scripts/runqemu-gen-tapdevs 1000 2
Creating 2 tap devices for GID: 1000...
Creating tap-yocto-0
Creating tap-yocto-1
Note: For systems running NetworkManager, it's recommended
Note: that the tap devices be set as unmanaged in the
Note: NetworkManager.conf file. Add the following lines to
Note: /etc/NetworkManager/NetworkManager.conf
[keyfile]
unmanaged-devices=interface-name:tap-yocto-*
$ ip a
92: tap-yocto-0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc fq_codel state DOWN group default qlen 1000
    link/ether f2:9c:14:41:b1:e3 brd ff:ff:ff:ff:ff:ff
    inet 192.168.7.1/32 brd 192.168.7.255 scope global tap-yocto-0
       valid_lft forever preferred_lft forever
93: tap-yocto-1: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc fq_codel state DOWN group default qlen 1000
    link/ether 06:08:16:73:be:48 brd ff:ff:ff:ff:ff:ff
    inet 192.168.7.3/32 brd 192.168.7.255 scope global tap-yocto-1
       valid_lft forever preferred_lft forever

runqemu serialstdio
...
runqemu - INFO - Using preconfigured tap device tap-yocto-0
runqemu - INFO - If this is not intended, touch /tmp/qemu-tap-locks/tap-yocto-0.skip to make runqemu skip tap-yocto-0.
runqemu - INFO - Network configuration: ip=192.168.7.2::192.168.7.1:255.255.255.0::eth0:off:8.8.8.8
...



Adrian Freihofer (9):
  runqemu-ifup: remove uid parameter
  runqemu-ifup: configurable tap names
  runqemu-ifup: fix tap index
  runqemu-ifup: remove only our taps
  runqemu-gen-tapdevs: remove staging dir parameter
  runqemu-gen-tapdevs: remove uid parameter
  runqemu-gen-tapdevs: configurable tap names
  runqemu-gen-tapdevs: remove only our taps
  runqemu: configurable tap names

 scripts/runqemu             |  8 +++++--
 scripts/runqemu-gen-tapdevs | 45 ++++++++++++++++++++++---------------
 scripts/runqemu-ifup        | 30 +++++++++++++++++--------
 3 files changed, 54 insertions(+), 29 deletions(-)

-- 
2.41.0


