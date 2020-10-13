Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web11.11824.1602595289952374304
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Oct 2020 06:21:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@blade-group.com header.s=google header.b=PacR49gv;
 spf=pass (domain: blade-group.com, ip: 209.85.221.65, mailfrom: yann.dirson@blade-group.com)
Received: by mail-wr1-f65.google.com with SMTP id n15so24043546wrq.2
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2020 06:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blade-group.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nxoJKlLgXqMGFuT1Z8ULw2c2vr6HrjPtmvQbrBV9rc4=;
        b=PacR49gveMcRi0J4r59HN6vjdMBbJuuroT46pV65Fh1sGvgyvJJpGegM5oGW+IlbnW
         8N4k2MHi8yx6CfFFHVTcwpKRLKgArLznGXEj61ljwyxitGJEJz8Z0XD/gCfGgfLA2PYp
         tcnl7cnSZahj7ckDuAi5w5LlX65TIG+mvvxiCzx+RLCVnpS3gJMdxWfTHF6FqfU5I65P
         06YEDMYI6OyQ1TywqjHGCDyet9TUUuasCnsmQr3awmiTh/FCrDz6K4fbtUlDR/5vr+B2
         jNxFzeH1ZtUCHcXQa2m/W1uMBFEF5+g+7xdcHRXsbVlJlcW2Dc3fKwKFDGrXziK5yKhV
         Bp5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nxoJKlLgXqMGFuT1Z8ULw2c2vr6HrjPtmvQbrBV9rc4=;
        b=RHGshcp9nghQRKJCPWNyEPBgK4KD8SYnDWkE8oOJDDOW4BR8tG6MUDnU4LWu19P4lU
         nvMDA3Ic3Id8WW/G16iUU3Hmy6GZ11EXi4t2yunMU4/mn1EteZAkjobFk/HMb1sN0ggX
         BcAtmRONdel1A2x8rIsJEAJT28IGSmRuPIHB6fYdxhI26iSEtOUAC2YOWUAc3cS6O8eE
         gId1uTNxA/gLjGJLePG1q6FIJP5B+637XYOLixIdXni7rEjdYM7jY+8ejjLOZzy+zGyq
         +v93axjKAe/ShQFs2gHI7ABlK0QFjrjJp+cstgl9aJQ2dKtCTjZbK5UtIC7JLqJMqjDw
         TO1Q==
X-Gm-Message-State: AOAM532SyCHLCneQH8i3Jl9R4/eoY8EsPYNnTmIVRkk31tNBnE1Jkz0C
	6sF3C2UTldtQR5nDrjxWsQgHXMQ7135rVPxN
X-Google-Smtp-Source: ABdhPJwQcdyiDumMe9GsKG3kfQBLu7Dt7cYfeZHN35p/xXt3yUTZl/Irfe0NyJnVKj4gleER9ryJ/Q==
X-Received: by 2002:adf:df07:: with SMTP id y7mr39052083wrl.347.1602595287968;
        Tue, 13 Oct 2020 06:21:27 -0700 (PDT)
Return-Path: <yann.dirson@blade-group.com>
Received: from blanquette.lan ([88.120.44.86])
        by smtp.gmail.com with ESMTPSA id q6sm26579715wma.0.2020.10.13.06.21.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2020 06:21:26 -0700 (PDT)
From: "Yann Dirson" <yann.dirson@blade-group.com>
X-Google-Original-From: yann@blade-group.com
To: openembedded-core@lists.openembedded.org
Cc: Yann Dirson <yann@blade-group.com>
Subject: [dunfell][PATCH] kernel-yocto.bbclass: fix reporting of config mismatches
Date: Tue, 13 Oct 2020 15:21:09 +0200
Message-Id: <20201013132109.2588755-1-yann@blade-group.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yann Dirson <yann@blade-group.com>

The warning was not issued because of a filename error (looking for a
gatesgath-era file in older tree).

Before gatesgarth we have two files (one with short list and one with
more details), whereas starting with gatesgarth we only have a single
file with all details.  Nevertheless, for consistency with the
presentation of "invalid.cfg" we'll just print the contents of the
short "mismatch.cfg" and point the user to the more detailed
information.

Signed-off-by: Yann Dirson <yann@blade-group.com>
---
 meta/classes/kernel-yocto.bbclass | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

This is not applicable to master, where the "mismatch.txt" file exists
and shows even greater details.  Looks like the change was introduced
for sumo in 5ef0620b18606fd5749b6e7811d337f26075b86b - would that be a
mismatch with yocto-kernel-tools version ?

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index cc8bcb909a..771b4d8654 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -431,12 +431,13 @@ python do_kernel_configcheck() {
     bsp_check_visibility = int(d.getVar("KCONF_BSP_AUDIT_LEVEL") or 0)
 
     # if config check visibility is non-zero, report dropped configuration values
-    mismatch_file = d.expand("${S}/%s/cfg/mismatch.txt" % kmeta)
+    mismatch_file = d.expand("${S}/%s/cfg/mismatch.cfg" % kmeta)
     if os.path.exists(mismatch_file):
         if config_check_visibility:
+            mismatch_details_file = d.expand("${S}/%s/cfg/mismatch-all.txt" % kmeta)
             with open (mismatch_file, "r") as myfile:
                 results = myfile.read()
-                bb.warn( "[kernel config]: specified values did not make it into the kernel's final configuration:\n\n%s" % results)
+                bb.warn( "[kernel config]: specified values did not make it into the kernel's final configuration (see details in %s):\n\n%s" % (mismatch_details_file, results))
 
     if bsp_check_visibility:
         invalid_file = d.expand("${S}/%s/cfg/invalid.cfg" % kmeta)
-- 
2.28.0

