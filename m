Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E53E9C88E70
	for <webhook@archiver.kernel.org>; Mon, 14 Sep 2026 12:09:35 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18522.1789387771953848980
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Sep 2026 05:09:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=SreSCU5p;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48586861639so1295766f8f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2026 05:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789387770; x=1789992570; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1z4ixGgY2Pl+/5mAK5ZQE+uuyXr4HMlfr04dqBENeAg=;
        b=SreSCU5pEa1YYssBRCXTmgyO0hvtXUl1fhwG4p/XynUwOaMlLd+Wzi0dAoNGErTEsI
         EJAuRDdDtowPd0wyYQO5p+Foi7wI5xzBCCSHSx6f72d0xrCfk94n3f4xzN1rq/x66BvS
         ajmDikarMbS2NwYbqG6GvciJ2dFJPxmuiqL/cGYyS6hNFNuzW/bZzKcJ07MzgyQnzV9A
         EsDyil7co+U/CE3BGZuzlznj9AaT3pa9UmWcnaqjHpshoslLUJa+WCQPDdnPBOsP2+AB
         j3DWY2tO2vQ/qIx8h3IgbMfjmSWiuAQLQ4BcCMOfuAbFt0NuUlGz8gOEK/bM26lVfFEj
         Ox/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789387770; x=1789992570;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1z4ixGgY2Pl+/5mAK5ZQE+uuyXr4HMlfr04dqBENeAg=;
        b=orUoKpUUCSHVWXGQq1NlsXJPddjptumUn9UhO5kOWkDrtUcf0pxFhDlq4bM6qgHjXA
         AgXcRz9nk+e85n6dKbiRI44Oy/117/VWbAgw3HhlpaeHSAf/JizW+7cA6j8NYHZBEBxx
         8St+jKvNpr7oQFXUCnDLIcXwwvr0fRiNUhJXoKR3dk+W/kA/WbuWp/iMXYqsP18OBKts
         Q8/xF8htXOzu9AlgTrmMrXQI9a0hOvwC9AlHCscXxC4Eqeg8TwPAdPaWTrh7LbrsXTBy
         Rqyve+Ns2+3BbM7HRsUMdGbWbPlikWB/oox/V4MvvFJfXKqdof/6l3howmTQl77FEdMO
         iZig==
X-Gm-Message-State: AFuF++kfihTrS6ybk/dWRt6XUCh1T1GYguNzs/49/2d3JMrsnGFZLEFh
	Jqf4HmjzDfpyERIiU0l7JwFS7DIetzHARILojAMwJZD8fXdsxIvPelur/g20xQ==
X-Gm-Gg: AYBFou25oXLri+L2mi5fGzXS0K2WHF2mIfe+B9lKpQAvjHeY6W6fTD1rAWrRgC8rd4n
	C9PupozwwpR2Pt3D4fH5VtGXplpru5SASCWyAhn31a2TEr1cXEuVRE+yp8ENHMEJleNq72xvxv9
	vsFZkitwOJv1OTu94VJNKv+5jOoxDGKpfpUstvZ41mFGV0TVdRO3i63POnO7hVOIMrqzmRr5OwJ
	9QYsHEN67qwVD/gcuSyLCbH8NjPW9XTbbTHk/KiXM5rZP/SN6O5RYIgwBNaenXfzmzVGwcYDU1K
	x799ZwZguudPwk4LvUnfP2f9ovYXlHWNO+IDGMFkh6kJywQsafbXqUx6SCHaXRTyXQsJayQ/mKG
	GsdNk/RMOMfbqXkhJzA8Th9TG+DgK5RPxbRf3Zi8zibtttMPdczvlzpCwaMJ9GEJSR3+M3P2vrH
	xio41ynKJP7dwePiXem9QB4PyHolVNAbBq3AQNpyDR9XmzPUtWgpyaOsa9kmeKLGEL5kVrdHZ1u
	syk4DjbtXaw0tlna1yMXdJUXzF8sUlCk4MchSGdt1NJiQ==
X-Received: by 2002:a05:6000:29d2:b0:486:fdd9:a0d9 with SMTP id ffacd0b85a97d-486fdd9a116mr4602232f8f.20.1789387769938;
        Mon, 14 Sep 2026 05:09:29 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb33ee5csm26590821f8f.20.2026.09.14.05.09.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:09:29 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/4] gstreamer1.0-plugins-rs: fix upstream tag check
Date: Mon, 14 Sep 2026 14:09:22 +0200
Message-ID: <20260914120925.1153614-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2026 12:09:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245770

From: Alexander Kanavin <alex@linutronix.de>

Upstream maintains two sets of tags: one of the actual
releases and another to align with and match
gstreamer C versions:
https://gitlab.freedesktop.org/gstreamer/gst-plugins-rs/-/tags

Somewhat counter-intuitively, the latter is intended
only for gstreamer's own use (to make binary releases),
and distributions and packagers should use the former.
The regex tweak ensures that, as aligned versions sort higher
and need to be excluded.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../gstreamer/gstreamer1.0-plugins-rs_0.15.3.bb                  | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-rs_0.15.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-rs_0.15.3.bb
index 1800dfc5439..5f4db41c136 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-rs_0.15.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-rs_0.15.3.bb
@@ -7,6 +7,7 @@ SRC_URI += "\
 git://gitlab.freedesktop.org/gstreamer/gst-plugins-rs;protocol=https;tag=${PV};nobranch=1;name=default \
 "
 SRCREV = "6302bea23b53e6461c104f9543df887a63b2d6ec"
+UPSTREAM_CHECK_GITTAGREGEX = "^(?P<pver>\d+(\.\d+)+)"
 
 LIC_FILES_CHKSUM =  " \
     file://${BPN}-${PV}/LICENSE-MPL-2.0;md5=815ca599c9df247a0c7f619bab123dad \
-- 
2.47.3


