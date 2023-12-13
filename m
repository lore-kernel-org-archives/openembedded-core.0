Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30846C4332F
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 22:26:03 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.2638.1702506355079547494
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Dec 2023 14:25:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VY2mFUrd;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3333131e08dso7929793f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 14:25:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1702506353; x=1703111153; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=7KuzKehcQrYmGUTvW5zCcnx7SOfxzO7D8wpfK8ZMUsU=;
        b=VY2mFUrdJDaknuxoVRTBUI5rWFAULfTk4uJOcaHawMzIvGXmjlEVQ78fHb3QDsrlBo
         PT/pxMHy4jvrrsH+4Bm4aehMp7lMv2Z4Txv0sUzkNCXH37iGNQYZwaYjddEmBFfQflc0
         +qSqVkkdDgeMHrRFJozH+4+kIrTirFA/QyKpM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702506353; x=1703111153;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7KuzKehcQrYmGUTvW5zCcnx7SOfxzO7D8wpfK8ZMUsU=;
        b=vrrNtm2zwEUVlHB2CpgnA+JlE+jaLcC/aimeWS+KpODud3HohmsOlOFU+Zzzx6MmNM
         GI6cVPEPCGbhwM+DFfZmvWpQz433fF6TWuxr19BJak+OqnerrmV2o0zW4WaX1GxGsbZT
         FpVY+0uuTTtI55KNjExFTdMvEW0wmmPM+Gj49DdJr0bA7CwXPNcGb0pRjDI5+S0mZCrn
         tRriqJcc34TGBliMmnmQD9+VJy0CM8BGQij+6CCSjaKLlollbv5Z2F0iSkSdD01jggH2
         ABQESfx+mCRr0n3C1rVMuZwPDz1j+odbkqu9q0aJ/H+vJm/5h7Gxm4IB2ZYS6UXlKvul
         xOFA==
X-Gm-Message-State: AOJu0YxkL6KT+ocbHqj8DOmtIPjoCWobzhFsHRTf4uI1aP9JOP1ke69I
	JjTfGsQh46c5GriorPiEDw8vpkcD0GYWDzo1ruc=
X-Google-Smtp-Source: AGHT+IGXX63Cc6RdKMPEdSiiKpyiV6Hmp4lFmaLKWWExcNl0Xq0rYOBmEm8IhOXbw9ftiGpnIqfmyA==
X-Received: by 2002:adf:9d8e:0:b0:336:36fa:a2f2 with SMTP id p14-20020adf9d8e000000b0033636faa2f2mr1214991wre.103.1702506353155;
        Wed, 13 Dec 2023 14:25:53 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:7173:bb34:6d69:83d3])
        by smtp.gmail.com with ESMTPSA id c11-20020a5d414b000000b0033342f72bf8sm14451291wrq.9.2023.12.13.14.25.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 14:25:52 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] sstate: Fix dir ownership issues in SSTATE_DIR
Date: Wed, 13 Dec 2023 22:25:52 +0000
Message-Id: <20231213222552.2662715-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 22:26:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192331

We currently use mkdir -p to create missing parent directories within SSTATE_DIR.
Reading the man page for mkdir mentions that parent directories are created with
the current umask, *not* the mode passed upon the commandline.

We could fix this by setting and resetting the umask but since we already have
decent python code able to do this, move to using that injecting a python function
into the chain of functions already present.

This should help fix the occasional sstate directory creation with the wrong
permissions.

[YOCTO #14385]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/sstate.bbclass | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sstate.bbclass
index 95d5803f17d..9330433bb2d 100644
--- a/meta/classes-global/sstate.bbclass
+++ b/meta/classes-global/sstate.bbclass
@@ -703,7 +703,7 @@ def sstate_package(ss, d):
     if d.getVar('SSTATE_SKIP_CREATION') == '1':
         return
 
-    sstate_create_package = ['sstate_report_unihash', 'sstate_create_package']
+    sstate_create_package = ['sstate_report_unihash', 'sstate_create_pkgdirs', 'sstate_create_package']
     if d.getVar('SSTATE_SIG_KEY'):
         sstate_create_package.append('sstate_sign_package')
 
@@ -810,6 +810,12 @@ python sstate_task_postfunc () {
 }
 sstate_task_postfunc[dirs] = "${WORKDIR}"
 
+python sstate_create_pkgdirs () {
+    # report_unihash can change SSTATE_PKG and mkdir -p in shell doesn't own intermediate directories
+    # correctly so do this in an intermediate python task
+    with bb.utils.umask(0o002):
+        bb.utils.mkdirhier(os.path.dirname(d.getVar('SSTATE_PKG')))
+}
 
 #
 # Shell function to generate a sstate package from a directory
@@ -822,7 +828,6 @@ sstate_create_package () {
 		return
 	fi
 
-	mkdir --mode=0775 -p `dirname ${SSTATE_PKG}`
 	TFILE=`mktemp ${SSTATE_PKG}.XXXXXXXX`
 
 	OPT="-cS"
-- 
2.39.2


