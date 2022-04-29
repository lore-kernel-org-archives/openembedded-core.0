Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0B64C4332F
	for <webhook@archiver.kernel.org>; Fri, 29 Apr 2022 16:02:49 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web10.12148.1651248162663369431
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 09:02:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=SfiZzvYP;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.54,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f54.google.com with SMTP id
 cx11-20020a17090afd8b00b001d9fe5965b3so8977795pjb.3
        for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 09:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=mJu68s99KddCp62wdCJyE3jX6h7/bn4S/P0m3Yo+t6Y=;
        b=SfiZzvYP8SITndT+qlHbAGv6In5Of2mj2mST8ftWoeUf+OSSrYFZUHPM+m0GcShSDf
         D2wnjubHmbiXqpbi2K4X1vxoTVwltpJW3U4AjSHfWHpzqxmgkRBtUUfxob7Rx8Ik1BhE
         UTCFKyT6ZuBlY2sajPiTg6feANc91BbL5202lSMibkZxS9Dms55gJNBhKs6OBXhAwWxb
         8rQG9SgnqVLv366rRo3JlDPo5DNWjelOxSSLrYMX3CvrMCnc6kLWmMFf2HJ/gCdKVjQ2
         CMrUle1PQbKFYFQZNV7cxPAjhjuV/z1+OUmZqJrDsF+CJ2hssWMNWVqWSIyPpi7fXryO
         Kc0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mJu68s99KddCp62wdCJyE3jX6h7/bn4S/P0m3Yo+t6Y=;
        b=SNeaNAdlG/oYV0Y9QwO1JAw3sRYJgHeze7J+6+fr2z8wC8tS4pd10EHw7tt/0VNAo5
         wDg3jHI09sQJUHeF8h+kurJlnvkgbtFEAvTzS8FiishqjxoZJhyOytsJda0W2bV7s48w
         LvGHt8ohzuOvk6Ccoc6roRj8A8WpDLmw8RmPTdzJy0WYCgxJVY9u1tm6Zzlb9GA0iiqU
         HbOWKaZ89h0kaJhAo+DtJosKP+vyeUvwAOCqPr8PaDx/9JSayOEpbw1QsYquY/RYUo5J
         ju3IPCEIP96ukHgvekZ/5YBnY70Syy4flGN1dsD2EmXXxNwCXXZlgVcdxrXgt5dQE7Ps
         +OpA==
X-Gm-Message-State: AOAM533HFh3lRC40SV6m7Fkm058we5bZgVs4ZaiE5k7UNz2q3eliB8gc
	wxh6OTiuTCMU+8HFnI5w+05ytfAWDteF/49zybA=
X-Google-Smtp-Source: 
 ABdhPJxzHKpeJ4+oa/mnBZNi4u4OyAK3U+zzN5Pw4I9pVw1pm7OCvoBCzQrqXYEn4khg2cupv5DUZA==
X-Received: by 2002:a17:902:e84b:b0:15d:5c31:8f8e with SMTP id
 t11-20020a170902e84b00b0015d5c318f8emr12657350plg.118.1651248161334;
        Fri, 29 Apr 2022 09:02:41 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 i3-20020a056a00224300b0050d32f838e1sm3486125pfu.21.2022.04.29.09.02.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Apr 2022 09:02:40 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 32/34] util-linux: Create u-a symlink for findfs
 utility
Date: Fri, 29 Apr 2022 06:00:51 -1000
Message-Id: 
 <04e03fa3acde7a23825fb9a17de98f1cecaae097.1651246310.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1651246310.git.steve@sakoman.com>
References: <cover.1651246310.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Apr 2022 16:02:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165051

From: Khem Raj <raj.khem@gmail.com>

busybox also installs findfs but into base_sbindir which works out to be
ok when sbindir != base_sbindir but with usrmerge distro feature enabled
this starts to cause trouble because busybox's postinst is trying to
create a symlink for findfs applet in base_sbindir which is same as
sbindir now and there already is binary from util-linux and image fails
to build

do_rootfs: Postinstall scriptlets of ['busybox'] have failed. If the intention is to defer them to first boot,
then please place them into pkg_postinst_ontarget:${PN} ().

The real reason is burried in do_rootfs logs

update-alternatives: Error: not linking /mnt/b/yoe/master/build/tmp/work/beaglebone-yoe-linux-gnueabi/yoe-sdk-image/1.0-r0/rootfs/usr/sbin/findfs to /usr/bin/busybox.suid since /mnt/b/yoe/master/build/tmp/work/beaglebone-yoe-linux-gnueabi/yoe-sdk-image/1.0-r0/rootfs/usr/sbin/findfs exists and is not a link

Creating proper u-a for findfs in util-linux fixes the issue

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 211ae2db1ab8fec1ed678170f9d8cbca2cc27ef3)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/util-linux/util-linux_2.37.4.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/util-linux/util-linux_2.37.4.bb b/meta/recipes-core/util-linux/util-linux_2.37.4.bb
index d609c30067..b39020884f 100644
--- a/meta/recipes-core/util-linux/util-linux_2.37.4.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.37.4.bb
@@ -221,6 +221,7 @@ ALTERNATIVE_LINK_NAME[dmesg] = "${base_bindir}/dmesg"
 ALTERNATIVE_LINK_NAME[eject] = "${bindir}/eject"
 ALTERNATIVE_LINK_NAME[fallocate] = "${bindir}/fallocate"
 ALTERNATIVE_LINK_NAME[fdisk] = "${base_sbindir}/fdisk"
+ALTERNATIVE_LINK_NAME[findfs] = "${sbindir}/findfs"
 ALTERNATIVE_LINK_NAME[flock] = "${bindir}/flock"
 ALTERNATIVE_LINK_NAME[fsck] = "${base_sbindir}/fsck"
 ALTERNATIVE_LINK_NAME[fsfreeze] = "${sbindir}/fsfreeze"
-- 
2.25.1


