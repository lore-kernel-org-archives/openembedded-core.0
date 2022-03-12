Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDF1CC433F5
	for <webhook@archiver.kernel.org>; Sat, 12 Mar 2022 11:53:09 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web09.3929.1647085988892789413
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Mar 2022 03:53:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aFSwm13L;
 spf=pass (domain: gmail.com, ip: 209.85.167.49,
 mailfrom: liu.ming50@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id z11so19272889lfh.13
        for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Mar 2022 03:53:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PN/ZjL1FZe4hrVHu0INjRmRNgmRxMmRU6grrTh8xBbw=;
        b=aFSwm13LdId5x1e+L7l7oo5KDi3bc8Vk6FN/cjGVwi8DO5L7v2S0iRzr/zgb6S4WJD
         85fOR2KvrYKiWlKdr7hS4tybm1ePoshfKYOiPp7OXJypkLc/uIhijN7YVywUN2syucWq
         SxtQyFXYGGIKTf2CpptvRYYwpJ5+afa+jqr3ERgnDeIeBglpE1hOI9BcxoqB2G2r1hoX
         cmYiYiBSB1lCZTGxpZOuSlShIy/jDXb/wXJX6z8996IoiAUj7NoCTTQ43WHwYGHl3rxl
         +6I6ePeMj9XpPjMPOy3hJdUvDSI2glSj7591OgNAF9p+DeIicDEd70rGz686erXynviN
         PyzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PN/ZjL1FZe4hrVHu0INjRmRNgmRxMmRU6grrTh8xBbw=;
        b=ZbPj0DbuLMNL2svRx8ENoTHOe/iTFaj/bsSPSdCCMN40JOvTbAKj0O8UnzZvCTspY+
         b4vc1LGiE6Pdtbw8s8Xv3bcxjDCFR2Qj5ZnWZzUZZNtLue/7OhrpxBscWxV+KT0Tq+uo
         MXPzRvFsCLhW4BwQi3Q/Yl/d8Z1804R0isY4ZrCBAEW5BGpBxMraMFqgnlFrc877e4ti
         B81IhKDX0KyeCYjKJUdHMn6tvssGMlWIk7GffFSyXUy4QLmm/ZBZ1bWN3iSGJPU/jB4r
         UgirwmhhUXFEAfuxsS+V7LGeP4xx9+lh0e6JopdEgu8qsTIj+CorTOM9JPmMdiGeyP94
         ThCg==
X-Gm-Message-State: AOAM533YqVM6hvU+/3HJlGOvHIlhN74Ki6Qjv2cYiAcUuMdcmVKUi9q5
	Ktzjyo2yzWjN59zIXC9IVCoGq96UBDnKpA==
X-Google-Smtp-Source: 
 ABdhPJxtp0ZjhYUB24WOFtjDOYiP+cFXMy3moM/qmDWs8SmT2zyZCu9sFbQK+K+pVbAvz/ac67b/ug==
X-Received: by 2002:a05:6512:3704:b0:448:599e:30ea with SMTP id
 z4-20020a056512370400b00448599e30eamr8546785lfr.311.1647085986727;
        Sat, 12 Mar 2022 03:53:06 -0800 (PST)
Received: from peterliu-Precision-7530.lan
 (customer-212-100-112-191.stosn.net. [212.100.112.191])
        by smtp.gmail.com with ESMTPSA id
 k7-20020ac257c7000000b0044854f11248sm2026535lfo.55.2022.03.12.03.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Mar 2022 03:53:06 -0800 (PST)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [OE-core] [PATCH] image.bbclass: make sure do_rootfs run from a clean
 workspace
Date: Sat, 12 Mar 2022 12:53:03 +0100
Message-Id: <20220312115303.10434-1-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 12 Mar 2022 11:53:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163087

From: Ming Liu <liu.ming50@gmail.com>

Add ${IMAGE_ROOTFS} and ${IMGDEPLOYDIR} to do_rootfs[dirs] and
do_rootfs[cleandirs], this ensures do_rootfs run from a clean
workspace, with this change, we can now remove two bb.utils.mkdirhier
lines from meta/lib/oe/rootfs.py.

Also drop ${S} from do_rootfs[cleandirs], nothing being installed into
that directory.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta/classes/image.bbclass | 4 ++--
 meta/lib/oe/rootfs.py      | 4 ----
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 2b0ce4a988..98a0555040 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -252,8 +252,8 @@ fakeroot python do_rootfs () {
 
     progress_reporter.finish()
 }
-do_rootfs[dirs] = "${TOPDIR}"
-do_rootfs[cleandirs] += "${S} ${IMGDEPLOYDIR}"
+do_rootfs[dirs] = "${IMAGE_ROOTFS} ${IMGDEPLOYDIR} ${TOPDIR}"
+do_rootfs[cleandirs] += "${IMAGE_ROOTFS} ${IMGDEPLOYDIR}"
 do_rootfs[file-checksums] += "${POSTINST_INTERCEPT_CHECKSUMS}"
 addtask rootfs after do_prepare_recipe_sysroot
 
diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index b0dd625539..98cf3f244d 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -190,10 +190,6 @@ class Rootfs(object, metaclass=ABCMeta):
         post_process_cmds = self.d.getVar("ROOTFS_POSTPROCESS_COMMAND")
         rootfs_post_install_cmds = self.d.getVar('ROOTFS_POSTINSTALL_COMMAND')
 
-        bb.utils.mkdirhier(self.image_rootfs)
-
-        bb.utils.mkdirhier(self.deploydir)
-
         execute_pre_post_process(self.d, pre_process_cmds)
 
         if self.progress_reporter:
-- 
2.25.1


