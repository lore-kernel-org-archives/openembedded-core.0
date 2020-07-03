Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web10.7690.1593772556831558610
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jul 2020 03:35:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TR3Oz89A;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f66.google.com with SMTP id b6so32102573wrs.11
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Jul 2020 03:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XvGSedZZUPbxgnSvJzAazXxbDRkWHOfMD+QyFGXf7Wg=;
        b=TR3Oz89A1p7DhU2upVJ2IhSuJPSV954z/+MJtGDrq95yhxP+8e2pf9rc1geh/xmhBh
         x+xDaoRcmaN2DKzObxstmjJbMViWiXaeiZF/GoLShpD3X4yD+n3U7RGjycK6HdmXKzuE
         6RCD8+FSfS4XFdrZnTa8MgN0LXWb4rns8yP4c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XvGSedZZUPbxgnSvJzAazXxbDRkWHOfMD+QyFGXf7Wg=;
        b=qbL7vYHojrO+NoIbtxTjMBRjAVuSGmxKW11KyGtAzaxutMxaxsVUc0os0OXfyTQlWK
         2UO7fTSpPaEXiiDX/b1u3/H09dMYH9pHEkN1goTyLev3LGRuMXFFgL8NK2GAwtcRMOdL
         zV2wjPffxpo71J7snJnR6hF/CUIiyb/qJl/m7PYseKmzhOzkO+YYOC8vqllloIoOOL+D
         HIP4w9vVtBCyEjP33xqmry2fcCG4Ut+nkz2t0n/WpriCsCS4GMvSIIRY2/cKETZBUwGg
         97MQqtpIoStCUiAC3rNkW11sbbH8enZURFRKdwLHxbPaqZ69jsQCM79pwFM1VnVZbxBq
         l1lQ==
X-Gm-Message-State: AOAM532l+/6s2P/j55VlLm8127C05ja5CemJeAj/TaspdzNDFgsskFl1
	op9PtcwKnyZfJIplXFhiEPtwxRl6ExXMEA==
X-Google-Smtp-Source: ABdhPJyQjS6oTvbKMPnvhmdnz0fz+GbGBY1cS7pQsU3KaBuFvRsjfFimdhHIEG+IZROkYyCrlSAJmg==
X-Received: by 2002:a05:6000:46:: with SMTP id k6mr7097382wrx.102.1593772554839;
        Fri, 03 Jul 2020 03:35:54 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id n5sm13016875wmi.34.2020.07.03.03.35.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2020 03:35:54 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/targetcontrol: Attempt to fix log closure warning message
Date: Fri,  3 Jul 2020 11:35:53 +0100
Message-Id: <20200703103553.210391-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We continue to see the warning message:

WARNING: lib/bb/daemonize.py:76: ResourceWarning: unclosed file <_io.TextIOWrapper
name='build/tmp/work/qemux86_64-poky-linux/oe-selftest-image/1.0-r0/testimage/qemurunner_log.20200703011821'
mode='a' encoding='UTF-8'>

I've been unable to reprodue this but believe its caused by garbage
collection of the FileHandler used in QemuTarget being delayed until
after a new tinfoil instance is created by a subseqent test.

Force the log file to be closed when we stop using it to avoid this.

[YOCTO #13961]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/targetcontrol.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oeqa/targetcontrol.py b/meta/lib/oeqa/targetcontrol.py
index 7bbba6016b2..19f5a4ea7e9 100644
--- a/meta/lib/oeqa/targetcontrol.py
+++ b/meta/lib/oeqa/targetcontrol.py
@@ -187,6 +187,7 @@ class QemuTarget(BaseTarget):
         except:
             pass
         self.logger.removeHandler(self.loggerhandler)
+        self.loggerhandler.close()
         self.connection = None
         self.ip = None
         self.server_ip = None
-- 
2.25.1

