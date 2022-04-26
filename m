Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33313C433EF
	for <webhook@archiver.kernel.org>; Tue, 26 Apr 2022 22:45:49 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web08.1654.1651013140590044178
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Apr 2022 15:45:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mBoYrc68;
 spf=pass (domain: gmail.com, ip: 209.85.214.174,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id c12so70227plr.6
        for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Apr 2022 15:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lBeScZd0Nx3DlFT+cNGmM5edh/cEosSJJdjTz4WIUdM=;
        b=mBoYrc68t1/TYEyCaOpXo/Ki+RNp/hZZwxctm+YGrghdXrgWSJF6PpFXlDh6R6k3AW
         my78O7rYPL7+Mo4Ef038QzD64QNxnyd40zl0Zh5h8jmKItDfU4KR0GCHUX+lQX6+1HDg
         5+83fCap0L8Y4cvomrdLz3ouvf1z5to8zO9YNK2i8RPunU9ZyxKBfbOCL17vbHMwYaUF
         GcHhBoaQ+CBCfVD6/5thcfbo8trcQj0ep+4greaC2YrA2qFswflreIhEQG89MvYePSGN
         ZaQdOSkEqn4YJDz7caep7KB9re4v+oXcuEQ7HpL610ZeCtY9StTVth5KbGWKDHi5+M/E
         7PzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lBeScZd0Nx3DlFT+cNGmM5edh/cEosSJJdjTz4WIUdM=;
        b=diWEuYn4/S3LrCKG9SHAOPXMdAeNaEBISWWAfHT6qj7PJJ1mgabMbMxO5EziFP05fk
         itNEvHHg1q6l89W6t6PZ9CBCQG8zJHZUl/JuHS2zHadKxkR0mNHo0AwzPj+pTSVu6qG1
         1LrR1EtAkNPtW/t/ORoPiKbY5bS7b5AgWKC+gRnHidb/5o2XEjqyBPTUcJqgHJeh51CH
         xjjWa9WLLCkcov0wZcjgfLpFbo0EYoDmzPbJUM68AESsy8hqXPpR5VWp9qtrfmNMraGl
         yUtChq0YGsDi06MnBX1YID+R3Zh3Pj0QF0fyZQec2DHHh7C9ZqfvG4Hj4u6YSyKEYrCl
         0g3w==
X-Gm-Message-State: AOAM531/6aFyh7QutFEjl1yS+6GPl8zicoyW33zggm75e1UpHpaIla7A
	YGnzdYbgoMvjGSHs/ilw19RBcFghpI9SUQ==
X-Google-Smtp-Source: 
 ABdhPJzLlev4SqCuUXIX9CxcMbpnKtM1EkF7NmhLZq0PNLW3JVPaXx6/xUNWYRQY65j4Pec/HIeUvQ==
X-Received: by 2002:a17:902:ce11:b0:15b:4232:e5e7 with SMTP id
 k17-20020a170902ce1100b0015b4232e5e7mr25591178plg.39.1651013139761;
        Tue, 26 Apr 2022 15:45:39 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::2ca3])
        by smtp.gmail.com with ESMTPSA id
 t4-20020a628104000000b0050d3ccc653dsm9094305pfd.116.2022.04.26.15.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Apr 2022 15:45:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] util-linux: Create u-a symlink for findfs utility
Date: Tue, 26 Apr 2022 15:45:36 -0700
Message-Id: <20220426224536.1906939-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Apr 2022 22:45:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164886

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
---
 meta/recipes-core/util-linux/util-linux_2.37.4.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/util-linux/util-linux_2.37.4.bb b/meta/recipes-core/util-linux/util-linux_2.37.4.bb
index d609c30067f..b39020884fb 100644
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
2.36.0


