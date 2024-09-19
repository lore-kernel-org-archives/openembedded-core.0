Return-Path: <danismostlikely@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E582CF3963
	for <webhook@archiver.kernel.org>; Thu, 19 Sep 2024 16:26:38 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web10.24222.1726763190991520805
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Sep 2024 09:26:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TJl/ueeC;
 spf=pass (domain: gmail.com, ip: 209.85.222.173, mailfrom: danismostlikely@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7a9b3cd75e5so102063385a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Sep 2024 09:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726763190; x=1727367990; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0vikOF2Ipr8kVreDKVmpkM3qt3VS9I+TExwKTIVd2PU=;
        b=TJl/ueeCzlwbgbNCtH+OnFCHMeCnPAyw8JSP0+weVbAPm71opx1+AmuKutsc2bwrJg
         B7fF1+YQc1Gs0gGKXiEHMQW5XYh1XQjqQWBxZmAnrjb8DHW+6vbL01qrf6quP+nyaItn
         t2OymE9ZH31bcqnTfOmXcMjl05nrOBFRCGdQZgMILpALeknJnLGYcPYvGmjiwZnkhoTc
         yhGbpMMGFPzhRcYS92YkLJZuYZukeKRssoZBpJh5Q10IedIAvpbf6K6NJ07YBbeqMilE
         7PSbn/lIGeeHOkv3HCILt5adKhbs421+nTopAnNKYK8kYynLWe+YJkH6U4fNiODiINq6
         QAvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726763190; x=1727367990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0vikOF2Ipr8kVreDKVmpkM3qt3VS9I+TExwKTIVd2PU=;
        b=wPwMoreXlD+RqWN/EM8GTnRNHnWFPWGhcUWoA1D297Qk9+eBRvbwf1bzkACF3gvAhJ
         Ntx88afn7uB/K+kmuG2PqM3GwK4AFNZ/iuOu1z6AMPdEZNjZEBKVDDNAElA8sY/JE/XU
         ZtgRbeHg/KUKtsW9ns7xoJXbwWJSpwdh14sHQx6dU2whn96PxNnG5Ie27/ry79n2e8aX
         zvzJl83chG/MGbOZFKKxw68GtEe/Q9gId0qr8tWVRVLRiTEJjLufp9HnNc5YIYuQrmo5
         dSzKtaCe66Z2exFQlaab7e8Y4JySJdvZoiE97yF6M6NufR/TCwUfGPikoVJ0UtFYZ0yT
         UjVA==
X-Gm-Message-State: AOJu0YzmeOhXYVH16bRm0IesUg8TEaAwnk2WnLhkbtaTCRu0UKPBlTxm
	ZIYZrVvmzKfQaNSr22MtDKwZvTMyBxcRItzHz/aqROpRyP+P7d9LLtrgrw==
X-Google-Smtp-Source: AGHT+IGx0GOHjInLhrPgqtltllEe5MnO2cXN82PZ9+rZ3SWlbVATxhKTIiYB9n+5TjowXsTEqPU+xA==
X-Received: by 2002:a05:620a:2409:b0:7a9:ae1e:1055 with SMTP id af79cd13be357-7a9e5f7c3dcmr4668521585a.59.1726763189673;
        Thu, 19 Sep 2024 09:26:29 -0700 (PDT)
Received: from nebuchadnezzar.home.arpa ([204.83.204.143])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7acb08bddc3sm88636485a.90.2024.09.19.09.26.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2024 09:26:29 -0700 (PDT)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Dan McGregor <dan.mcgregor@usask.ca>
Subject: [PATCH 2/3] image_types: make tar images more reproducible
Date: Thu, 19 Sep 2024 10:24:59 -0600
Message-ID: <20240919162500.2642940-2-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20240919162500.2642940-1-danismostlikely@gmail.com>
References: <20240919162500.2642940-1-danismostlikely@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Sep 2024 16:26:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204708

From: Dan McGregor <dan.mcgregor@usask.ca>

Use tar-native from our build system. GNU tar changed its behaviour
starting with version 1.35. It no longer stores device numbers for
regular, non-device files. Since some supported host distributions
still use 1.34, rely on tar-native for consistency.

Strip atime and ctime from tar archives, they're not necessary and
can change from invocation to invocation. Eliminate them from the
tar output as suggested in the tar 1.35 documentation[1].

[1] https://www.gnu.org/software/tar/manual/html_node/Reproducibility.html

Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
---
 meta/classes-recipe/image_types.bbclass | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/image_types.bbclass b/meta/classes-recipe/image_types.bbclass
index b230add3141..87d6effc6cf 100644
--- a/meta/classes-recipe/image_types.bbclass
+++ b/meta/classes-recipe/image_types.bbclass
@@ -145,7 +145,7 @@ IMAGE_CMD:vfat = "oe_mkvfatfs ${EXTRA_IMAGECMD}"
 
 IMAGE_CMD_TAR ?= "tar"
 # ignore return code 1 "file changed as we read it" as other tasks(e.g. do_image_wic) may be hardlinking rootfs
-IMAGE_CMD:tar = "${IMAGE_CMD_TAR} --sort=name --format=posix --numeric-owner -cf ${IMGDEPLOYDIR}/${IMAGE_NAME}.tar -C ${IMAGE_ROOTFS} . || [ $? -eq 1 ]"
+IMAGE_CMD:tar = "${IMAGE_CMD_TAR} --sort=name --format=posix --pax-option=delete=atime,delete=ctime --numeric-owner -cf ${IMGDEPLOYDIR}/${IMAGE_NAME}.tar -C ${IMAGE_ROOTFS} . || [ $? -eq 1 ]"
 SPDX_IMAGE_PURPOSE:tar = "archive"
 
 do_image_cpio[cleandirs] += "${WORKDIR}/cpio_append"
@@ -283,6 +283,7 @@ EXTRA_IMAGECMD:f2fs ?= ""
 # otherwise mkfs.vfat will automatically pick one.
 EXTRA_IMAGECMD:vfat ?= ""
 
+do_image_tar[depends] += "tar-replacement-native:do_populate_sysroot"
 do_image_cpio[depends] += "cpio-native:do_populate_sysroot"
 do_image_jffs2[depends] += "mtd-utils-native:do_populate_sysroot"
 do_image_cramfs[depends] += "util-linux-native:do_populate_sysroot"
@@ -391,3 +392,5 @@ IMAGE_TYPES_MASKED ?= ""
 
 # bmap requires python3 to be in the PATH
 EXTRANATIVEPATH += "${@'python3-native' if d.getVar('IMAGE_FSTYPES').find('.bmap') else ''}"
+# reproducible tar requires our tar, not the host's
+EXTRANATIVEPATH += "${@'tar-native' if 'tar' in d.getVar('IMAGE_FSTYPES') else ''}"
-- 
2.46.1


