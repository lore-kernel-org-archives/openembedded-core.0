Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com [209.85.208.193])
 by mx.groups.io with SMTP id smtpd.web11.39191.1589797328735344518
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 May 2020 03:22:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QUL/5apg;
 spf=pass (domain: gmail.com, ip: 209.85.208.193, mailfrom: ricardo.ribalda@gmail.com)
Received: by mail-lj1-f193.google.com with SMTP id g1so9220299ljk.7
        for <openembedded-core@lists.openembedded.org>; Mon, 18 May 2020 03:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VGPi1k4s3Ik7YA81EbdDJIWIuMvICmPvMybJloiKGV8=;
        b=QUL/5apgPvNABc1uTBl6I50VHHHotP2rQ7bpyNFKWMaC+pr0mgejjrITJJdHfYthXO
         q3nLv4suMqpNLe1ad1doa6qZbAUDNa/xNzRgxMH+WKdbQq4DJs78kbxWJkqPQLazKpix
         yu84k8gAs4U8M7tBWVEPrb1JXusurtr6CWdSXwfP7MQfn+98rWx0rDGPlmnQM+iLJzF0
         IEgQccGx0IOg/gfrCJushpuiuqoM5c5RNjfdLEZepDihjdDDITHnOdAZmJvAeHetraxc
         CdWDb631ueOLtyhdnBif3DIrLPvJq9q4b8jIrjL2Owg38sNgIFmeL61/HRqtHlBywMRm
         BQNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=VGPi1k4s3Ik7YA81EbdDJIWIuMvICmPvMybJloiKGV8=;
        b=szsoMkSwH3d4UcZFDR2T8/llbq0oCejMyKq+XXhu+ftz/E+7I18zEOzuJ2ey0+FJsM
         o9EtEf7ZEqTmp7pz9QelyBprLbpqwuGKr8+b5Nj0Llvko3bzsRC+Zoi6FE4iK8hL3GSS
         yZ/1f/k+5V47YN/fWvTMOZ2F7K4+DOVGzbyteJA9lbAdAAjZK9q81IWIL3dooak41nl0
         hnfsT09T69ktQ7vpSQNlzPTMrMFHOC7Aa5KS/L1zgZ6hAVuSW5vQ2E4Jssi3x5fN0UwO
         hZ3HWSY3NK3FGVQoU0GMjETQR+Cc2GZTqd7D2OErdnfRkVPpB6FRpSGccjxEL6apiv6i
         kGwg==
X-Gm-Message-State: AOAM5309Js+Sidjnc2tzrPVTiHJvdKGAPDK5TPGocarymkgAQjj59BCs
	RyJHGcntyOiRZxxMXGUovIgT8kTtie/XlA==
X-Google-Smtp-Source: ABdhPJxO6xSVBUUAItSBIi7SBYeb4pcjQID8xfNCxfJODloLzTkToXGpo8guC2X0e9j6hG1uDlo4Ug==
X-Received: by 2002:a2e:87d3:: with SMTP id v19mr9476451ljj.176.1589797326516;
        Mon, 18 May 2020 03:22:06 -0700 (PDT)
Return-Path: <ricardo.ribalda@gmail.com>
Received: from neopili.qtec.com (cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id m4sm3615046ljb.46.2020.05.18.03.22.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 03:22:05 -0700 (PDT)
Sender: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
From: "Ricardo Ribalda" <ricardo.ribalda@gmail.com>
To: openembedded-core@lists.openembedded.org,
	dggonz@gmail.com
Cc: Ricardo Ribalda <ricardo@ribalda.com>
Subject: [PATCH] classes/image_types_wic: Reorder do_flush_pseudodb
Date: Mon, 18 May 2020 12:22:04 +0200
Message-Id: <20200518102204.2676702-1-ricardo@ribalda.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When IMAGE_FSTYPES contains more types than wic, it can happen than the
pseudo database is not flushed properly.

This can be solved by changing the order of when do_flush_pseudodb is
launched.

Yocto Bug: https://bugzilla.yoctoproject.org/show_bug.cgi?id=13898
Fixes: dde90a5dd2b2 ("wic: Fix multi images .wks with bitbake")
Signed-off-by: Ricardo Ribalda <ricardo@ribalda.com>
---
 meta/classes/image_types_wic.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image_types_wic.bbclass b/meta/classes/image_types_wic.bbclass
index 96ed0473ee..7b1db50a28 100644
--- a/meta/classes/image_types_wic.bbclass
+++ b/meta/classes/image_types_wic.bbclass
@@ -142,7 +142,7 @@ python do_rootfs_wicenv () {
     depdir = d.getVar('IMGDEPLOYDIR')
     bb.utils.copyfile(os.path.join(outdir, basename) + '.env', os.path.join(depdir, basename) + '.env')
 }
-addtask do_flush_pseudodb after do_image before do_image_wic
+addtask do_flush_pseudodb after do_rootfs before do_image do_image_qa
 addtask do_rootfs_wicenv after do_image before do_image_wic
 do_rootfs_wicenv[vardeps] += "${WICVARS}"
 do_rootfs_wicenv[prefuncs] = 'set_image_size'
-- 
2.26.2

