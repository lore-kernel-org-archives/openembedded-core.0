Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98CC9C79F99
	for <webhook@archiver.kernel.org>; Sun,  6 Sep 2026 08:06:01 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9859.1788681959549187547
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Sep 2026 01:06:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=glZgFdly;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49b8ce9b733so18149765e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 06 Sep 2026 01:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1788681958; x=1789286758; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xyuMXr1GfiL6J776wbS9/qHRnkOFvDgcBMZnau90sno=;
        b=glZgFdlyXpKC40IGQQ654yKTtolmAq5gTKmy7N17TjEyWxO2l4Ku6vx+K/2TQ2nAgK
         2dGbAtDRdn/0WJJukPyWbr2oFs/Q9fni/Sz7ipXQXSA7jPsEK7J1lRLLxmpx7OBVcWkk
         qdiISRPmU3HlqIFPmXoEEugxGUK5G4l8nZHJs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788681958; x=1789286758;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xyuMXr1GfiL6J776wbS9/qHRnkOFvDgcBMZnau90sno=;
        b=RrRk2mxUc5EOKqh7LLAWX8Aogdd5MAXvoGu/eQrG5tLk9ER7vgScXBF/0euoBdEfqD
         x60xhIHDBeKZKETttr7Mti4+9gOvBJ60YAVGIp5pHbNJHrC0LacNu8GV7fixPSlGERAB
         clRtINAKOcXDMXazZb91oH0XdO826PA8ZQGBkmfUkPi336Oo0LBojlIZYKZmBTK4hKUb
         DmbGPx8gGIYfohyS7d/m1nNky2bKt5rpCRaS+DKbQDDI6kP3RDiFFAlPaGGX43x/th1m
         scXRBfZgpvDfn5hyA8FOncZCgdxHw+UbGQIfNF9zdPAXywDOX3NqMRJDY+z/9/qsdcHD
         33dg==
X-Gm-Message-State: AFuF++kcDgaUOKEOL+Rnwttj1QTm+iyEd1Hva9HXklFFDK/BfYxb3aaK
	HOvuIlZ7P2hjkLgZjRFLXY1nNYR6EzQX6C0KSTd8E4147DFmBU2oav48Jm5UVtgIWXtVostU363
	irZrWnGc=
X-Gm-Gg: AYBFou05ESW7GFM4R2sp2/14M/IAml0fWj0AFmu1ss4IIYZPBOv393Rl1jpQOl+JY2w
	CYiaZyBQlF+vYnR7zZpm2h/GuiS69Ssc0EpgbknYIRsUMCKyl9nWjtWzkCrtdJ7iUMhAlHWo3jj
	w72n8Z4hysexQ4L6sk33R2NUn6Xj9CmCptItJVLxBCabJ66sEmtmiuRRMyY925BfG1dYCqXQ9oq
	uqs4qcZsiO8aTLbuG/soJo3aBqCGcGlP8GaJLuc57XNRURtgZqSgfp+kPxaat6aL6vheD62hmTt
	nI7hEe+fVO06GHmWcIFWhzN/4LWPjOhqx7vHmWLM5jL1FdTxPCxrEk3TEygWn9kYQT6kXL6PTUf
	wQWXyWKq5HC08kUNHK0wHfL3gid9h5kkLxBZiE4NaFfWkVXYxx+m1WIVZz9V9onk8MgbhdlD6nB
	3Y2rPh2f9xj5kDhWEcGnzow1ynhNW6V3LmyZKWBTT4oW0QkCpFV8ZS8+r3v6ihrl0qMwJMoK5wN
	vFOIMoakR4G82h2Bg==
X-Received: by 2002:a05:600c:4693:b0:49d:39:90ba with SMTP id 5b1f17b1804b1-49d00399d19mr86683235e9.3.1788681957351;
        Sun, 06 Sep 2026 01:05:57 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:a7e4:ecad:c000:9c61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cfbdacc45sm183691545e9.11.2026.09.06.01.05.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 01:05:56 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/6] hwdata: upgrade 0.410 -> 0.411
Date: Sun,  6 Sep 2026 09:05:48 +0100
Message-ID: <20260906080553.3151802-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Sep 2026 08:06:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245202

7fc63d4 Update pci and vendor ids

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../recipes-support/hwdata/{hwdata_0.410.bb => hwdata_0.411.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/hwdata/{hwdata_0.410.bb => hwdata_0.411.bb} (93%)

diff --git a/meta/recipes-support/hwdata/hwdata_0.410.bb b/meta/recipes-support/hwdata/hwdata_0.411.bb
similarity index 93%
rename from meta/recipes-support/hwdata/hwdata_0.410.bb
rename to meta/recipes-support/hwdata/hwdata_0.411.bb
index a34724abeaa..b83c11f09de 100644
--- a/meta/recipes-support/hwdata/hwdata_0.410.bb
+++ b/meta/recipes-support/hwdata/hwdata_0.411.bb
@@ -8,7 +8,7 @@ LICENSE = "GPL-2.0-or-later OR X11"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1556547711e8246992b999edd9445a57"
 
 SRC_URI = "git://github.com/vcrhonek/${BPN}.git;branch=master;protocol=https;tag=v${PV}"
-SRCREV = "8bb6c48dc2e683777e625d1c9ef02c1b25b741cd"
+SRCREV = "7fc63d411377e40aab66bfbf77dce6a439c3fe87"
 
 inherit allarch
 

