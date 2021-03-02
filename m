Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web09.350.1614711190562076016
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Mar 2021 10:53:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=EBUkfV82;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.169, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f169.google.com with SMTP id z128so21321275qkc.12
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Mar 2021 10:53:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Twu+vp2O1gmBZUQBY0MJhIMaYqb295hwIyENGHU6lKE=;
        b=EBUkfV82ZFFhGwQ+CuTezX+x2pDYEDlrkcM8rcg1eX4luHcDULfHIIXwwV1ANKISYs
         gvMkq6ZZcY/4o+v+4f9VMG0tP9zifyR2Ni1n53m7q2l7pfCOhyR5GlpMRlHx4z3WpDN2
         EbbS7ahXFkvjkdQok+PBk3C782Shh00hVzUaTs2JEf6IPbzB4LmcD+ZYYOg4DJSpW5RV
         5ZYlkcJYRDXOvg8bxMxgflEzkKarnCst+L4SJJ0lhPjJiN++JV2PClqqsQ0onfcWtpXr
         lL/yuwIToC/fERlEtTwZXVKgj7UYlWyWyEabMe3s9b6Vmp6sLWkkqFofpqe2tIaTpYGU
         aIgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Twu+vp2O1gmBZUQBY0MJhIMaYqb295hwIyENGHU6lKE=;
        b=G+hb4b72hwpNJT+6h+wOG6QziZ3G1V36aHb4py6vJ021/EnM1gwl1btWSSaBRVpdmJ
         11S6kx4UQhFuomR5mCKNbwQGwMwSai9fCF0HTEr0woJCo1c+tmfF54VrJC79BAvBk54X
         fwLeMpOjfhND5vAUwihRBs46tKq1mAIoek4rJMctsBZ41rbFyX4f0ZU1d8JvJwPRr+Pk
         HbB7tF4gntDPHHHCxSx3q0tZ73UoK/ChCVW/znnVtMCQcI1PLJC1ytDkIPtKB4CeICuL
         mgZcs2+0/yqkRxplaUHfW5onZoCSQ44bL5IiKoFpKn2GnWfVJzld9TiNPOrZVRhUMhw5
         ytdQ==
X-Gm-Message-State: AOAM531+M6SL6aTWk8+162WIm9tXRIPitdTXauS3nvbCteIG9o3s6bwt
	ZVv8fhBA9r9e1MZ1udSRd+NE8oh1leLxbeaG
X-Google-Smtp-Source: ABdhPJxcEIT2Bob4oez8AwB0EQDSQfmOXepzNEb46JiG/xeNfTAnH4K4o7qZpwg4SoPYlfjZyx5Esg==
X-Received: by 2002:a37:a615:: with SMTP id p21mr21142018qke.352.1614711189553;
        Tue, 02 Mar 2021 10:53:09 -0800 (PST)
Return-Path: <jdmason@kudzu.us>
Received: from localhost ([2605:a601:a62f:6d00:b028:6684:bbdb:6f5e])
        by smtp.gmail.com with ESMTPSA id b21sm4051626qkl.14.2021.03.02.10.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 10:53:09 -0800 (PST)
From: "Jon Mason" <jdmason@kudzu.us>
To: openembedded-core@lists.openembedded.org
Cc: Jon Mason <jon.mason@arm.com>
Subject: [PATCH] runqemu: use "raw" instead of "bin" for ovmf
Date: Tue,  2 Mar 2021 13:53:08 -0500
Message-Id: <20210302185308.28326-1-jdmason@kudzu.us>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jon Mason <jon.mason@arm.com>

bin is not an acceptable format for qemu and will throw an error is set.
The correct format in this case is raw.

Signed-off-by: Jon Mason <jon.mason@arm.com>
Change-Id: I9d78e356d39ecb15bef886c19870b029d9badd65
---
 scripts/runqemu | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/runqemu b/scripts/runqemu
index 532f2e338d52..392576bf4997 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -1345,6 +1345,8 @@ class BaseConfig(object):
 
         for ovmf in self.ovmf_bios:
             format = ovmf.rsplit('.', 1)[-1]
+            if format == "bin":
+                format == "raw"
             self.qemu_opt += ' -drive if=pflash,format=%s,file=%s' % (format, ovmf)
 
         self.qemu_opt += ' ' + self.qemu_opt_script
-- 
2.20.1

