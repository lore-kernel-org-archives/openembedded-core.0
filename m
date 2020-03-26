Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web12.484.1585256034131263401
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2020 13:53:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=udba+4tc;
 spf=pass (domain: gmail.com, ip: 209.85.128.66, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f66.google.com with SMTP id b12so8583996wmj.3
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2020 13:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=D2PnirpQk0EYu6ONbAyqd0OV4XeNECREhGzOQpVcahA=;
        b=udba+4tcO6gjnNU7CHSkZcTxWsCfVHs00zE/nIpA+B1wlGYIX1cHH2veIypOWHHIrj
         kd5+Q2aaUZNBDJ2KWy0rVzU4yKLoSWg00Qn3piz5b5bPjxv2grHQ5CLVOSBd7c+WuKd4
         OvhOS8BjFiwlS/cGsXTDL+1IB9L3Vq0HPv7T4blThJ16HcoR5sd8iGAbQiiJL+TD4PMd
         bTJI5tZCrdsujw8N+MptmmbJyF/j7DuLuYdItTi/eHpvD8DCQCEUup8v9tahD1g0ZNiG
         saijIuFw0kzx0KS3zPeEks8kYoR6YCRro+83qO5hqX0QYNa5o0Gyxdfg6O7DC2T/14ux
         lMDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=D2PnirpQk0EYu6ONbAyqd0OV4XeNECREhGzOQpVcahA=;
        b=clDgsa7baUfSQqXWoJyuvNx6wErFN7znXsKu/EZtg2FG7iFiXK1H2Vl8kHzXwP5KRR
         oVQlinDIVpah3PBLQ+ONWe5Pv+uDz03NTLSQWdaGhIcteiOaWvOmDwgmgtD1/6bN4Te2
         xI9unhWqLM2KwBlkKtgxjn3OOB8LjRgnE33HcXqLKEP1NEzBfxe84n1ONNC6wqCKwLqP
         Osv/ubQWjyZ56DFzs2Ucz05iNwQi/wzkrLjFIIh1WML7k52mzKfKvBz0tQIdEE+wTDEX
         l7RQtiZszTK7HNuYcZLvQwu30mw7dFFZi44z8dBBEokJGleFuHIq35BGsgkrClEWRanY
         R7/Q==
X-Gm-Message-State: ANhLgQ0TaYWtGTBMSTo5HF5tbF622Nfjx14MD5O5NYkX7fn+ezlBE2D0
	G73dsomKlsGFal1YW3cOd8y+SDcGKPs=
X-Google-Smtp-Source: ADFU+vvtJ0775iO29fgCarThr/bMyB6Yn2HOPNAgOGWyArXlpf5PQUZN71BBcJnQ5U4Q0AGioJk20w==
X-Received: by 2002:a1c:147:: with SMTP id 68mr1920092wmb.28.1585256032434;
        Thu, 26 Mar 2020 13:53:52 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
        by smtp.gmail.com with ESMTPSA id d21sm5251532wrb.51.2020.03.26.13.53.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2020 13:53:51 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH] gdk-pixbuf: remove a test that sporadically fails without reproducibility
Date: Thu, 26 Mar 2020 21:53:44 +0100
Message-Id: <20200326205344.19520-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The test is randomly modifying file data and some of these random
modifications cause OOM failures. There is no way to preserve and repeat
what was modified, so the test needs to re-engineered to do
proper fuzzing.

See here for details:
https://gitlab.gnome.org/GNOME/gdk-pixbuf/-/issues/146

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb
index 699c4ecd0b..d0df5015a5 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb
@@ -99,6 +99,11 @@ do_install_append() {
 
 }
 
+# Remove a bad fuzzing attempt that sporadically fails without a way to reproduce
+do_install_ptest() {
+	rm ${D}/${datadir}/installed-tests/gdk-pixbuf/pixbuf-randomly-modified.test
+}
+
 do_install_append_class-native() {
 	find ${D}${libdir} -name "libpixbufloader-*.la" -exec rm \{\} \;
 
-- 
2.25.1

