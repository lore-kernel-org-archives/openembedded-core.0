Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8AA2C4332F
	for <webhook@archiver.kernel.org>; Fri, 29 Apr 2022 16:02:39 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web12.12078.1651248156661569769
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 09:02:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=XixL4kgH;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.54,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f54.google.com with SMTP id
 iq2-20020a17090afb4200b001d93cf33ae9so10894093pjb.5
        for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 09:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=epOm6QRiZhVnONVrBL9YJ2qUEo8DFwcGMEk5pldKzG0=;
        b=XixL4kgHiHuxgAamKid05u9x29COw5FbiaVMy0LQ8vNFtWSGnrz+XWir9oGdfIgPuU
         9P0ocakSTKeELJV4vdQmo8E8osFm4dXCs/K3928Qu9gUf1fNJBuXett2mAQ2JO5+6M/N
         VjGFwU0qL+/uIciR8Wy/ZNZq4QAL9DuuCKP2sp0ckZZh8YA78yiXHc7YvnyTSzg3n4pO
         S/uU3mJ7wgXC/UKqtQGVOUtMaVzWUolnufjv161WuzC3qmbz3FF1NMaItg2Krlh/MprY
         wJscSUHoUXAgXxb5tMmXig2M/eEs+5fHL9c3oZCKFiXCc65Fo+cYjEq4KhsMYoThh0lB
         5R1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=epOm6QRiZhVnONVrBL9YJ2qUEo8DFwcGMEk5pldKzG0=;
        b=TKX6psa/zp8fX7EZrVN33v6oqDbWmdPzofEYYROZiw0H1eNxfE7EFb6kk3uf7v6y2+
         W+NJLkX8zmLo/92+IBY0Xt3Abczzx7E+PvsgmPXkAW27ATjmp4xhQA+UKubhNbdKjuJy
         Dp1dgjyYT1Dbj1qSfbnKTJ1I0dxOXVBu/qY5c3bhN8pGATs1rbAWu+J5c24NWu10Vm6b
         +XELzKlFaPkKCuHwVIUm1uCEJbdj+QQAjmyqtcvEHSYnYQkWbu2SpU/HW7HCpSr2hKf0
         YWMQyUMIADqeo0+uWQ5BqaIjiy4Jqzv0ih4u1lPJNIBCZZPE0n1FZbjMctcMahryhnx5
         hn7Q==
X-Gm-Message-State: AOAM530023zi+FR44+AoCmIiILVUYHJqs7ufWF7d64v6+HF2tGRWZqe0
	U9CRdkZYuwmhUE308tjRJvJVD/hCs9rUbg8K7gM=
X-Google-Smtp-Source: 
 ABdhPJwEyFmMV/3fzrWON021KIvIfCny/1OVdVw3c/v3C1MgxGs50Z0qpZ5hmefCtvT63TrliUwSZg==
X-Received: by 2002:a17:90b:4b04:b0:1d9:a2c5:36d1 with SMTP id
 lx4-20020a17090b4b0400b001d9a2c536d1mr4714431pjb.86.1651248155492;
        Fri, 29 Apr 2022 09:02:35 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 i3-20020a056a00224300b0050d32f838e1sm3486125pfu.21.2022.04.29.09.02.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Apr 2022 09:02:34 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 30/34] neard: Switch SRC_URI to git repo
Date: Fri, 29 Apr 2022 06:00:49 -1000
Message-Id: 
 <ed3fafcb99c1d9f06c8cac65524aedbc52c6c199.1651246310.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1651246310.git.steve@sakoman.com>
References: <cover.1651246310.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Apr 2022 16:02:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165049

From: Rahul Kumar <rahul.kumar_3@philips.com>

The tarball (neard-0.16.tar.xz) fetched by the recipe is incomplete.
Few plugins (e.g. tizen) and tests scripts (e.g. Test-channel, test-see,
neard-ui.py, ndef-agent etc) are missing.

Since neard did not release latest tarballs, so as per community
recommendation switching the recipe SRC_URI to git repo.

Community Discussion:
https://lists.openembedded.org/g/openembedded-core/topic/90058043#163681

Signed-off-by: Rahul Kumar <rahul.kumar_3@philips.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b563f40ebf4461d9c35df72bd7599ea11e97da9c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-connectivity/neard/neard_0.16.bb | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-connectivity/neard/neard_0.16.bb b/meta/recipes-connectivity/neard/neard_0.16.bb
index 57f2a3e2e1..bc9ce07d79 100644
--- a/meta/recipes-connectivity/neard/neard_0.16.bb
+++ b/meta/recipes-connectivity/neard/neard_0.16.bb
@@ -2,21 +2,22 @@ SUMMARY = "Linux NFC daemon"
 DESCRIPTION = "A daemon for the Linux Near Field Communication stack"
 HOMEPAGE = "http://01.org/linux-nfc"
 LICENSE = "GPL-2.0-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
+                    file://src/near.h;beginline=1;endline=20;md5=358e4deefef251a4761e1ffacc965d13 \
+                   "
 
 DEPENDS = "dbus glib-2.0 libnl"
 
-SRC_URI = "${KERNELORG_MIRROR}/linux/network/nfc/${BP}.tar.xz \
+SRC_URI = "git://git.kernel.org/pub/scm/network/nfc/neard.git;protocol=git;branch=master \
            file://neard.in \
            file://Makefile.am-fix-parallel-issue.patch \
            file://Makefile.am-do-not-ship-version.h.patch \
            file://0001-Add-header-dependency-to-nciattach.o.patch \
           "
-SRC_URI[md5sum] = "5c691fb7872856dc0d909c298bc8cb41"
-SRC_URI[sha256sum] = "eae3b11c541a988ec11ca94b7deab01080cd5b58cfef3ced6ceac9b6e6e65b36"
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
- file://src/near.h;beginline=1;endline=20;md5=358e4deefef251a4761e1ffacc965d13 \
- "
+SRCREV = "949795024f7625420e93e288c56e194cb9a3e74a"
+
+S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig systemd update-rc.d
 
-- 
2.25.1


