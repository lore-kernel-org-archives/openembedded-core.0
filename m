Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web11.30209.1620023764473343745
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 May 2021 23:36:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fGJisVRa;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id m12so2947095pgr.9
        for <openembedded-core@lists.openembedded.org>; Sun, 02 May 2021 23:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=piYWCmn196XnN0lOPWVt3aN1Rldsq3ux4G6OvJ2PS0E=;
        b=fGJisVRawQDstCvldoT8SBmw/8sWJMC7Tdfrnp+cOLqGeCkK6WaqO0bf5QlswTFy/N
         xZzSqNfAFNmSNJ9DVu3ndg0dD2P4zp0K5Nxqf6DsvIKlLs/bPhui0MW6yYCfrbREDPrP
         i9/2dad8JoFJGiWixCKWQwnZXwewO1Ip9o2plqOd/myLY/AYOq221MSQ2Ny9RGM/sCw8
         VpSOCX8v/IIgWZR3ubTWwVEGYJc73H1Jah8Oy52CJ6LfYPrPkdDMh8SW9O8nRisAC/2A
         JKI0JCQbHoIA0VYvODHj8GzKzkglktQz3DUopXHnoWiXKCLZ665+lH0sfiCZwiMxlb+W
         Gt/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=piYWCmn196XnN0lOPWVt3aN1Rldsq3ux4G6OvJ2PS0E=;
        b=uE+vHFuSSY2x2jDzerjVCz2NgenqG9undaJjtPJr3WSDq8dn/rXj6uzPQeylDwRO5x
         zL3JTaNbn6l+s6N/u9G/2InvfI/zPoonsBlRy0upG8I6Un4FYDW9yC1Gi5geY6zbEZ0B
         nQWlV6i2XLVCRxmdykRjL/1y1WLOimIGzD5vDYbz1a/fS/3RYWjcyV2vqXnmH9J80jfb
         YkC2oC7Zgg1b7V9xMr5HeoKv0ZxuKuR3ukorXxDwo4u4tgZBvBHLFsBAg170YlexHj6o
         FeFRD1OABDl1rIbi9xA1Wvs5JB1ITYPua3NWf7ZZBGv8/YxdcekydLmq7Z3elvximyIA
         Gbgg==
X-Gm-Message-State: AOAM532/LY91WKL1ypgeq7Hafjr70mMOou+InjAJMoWM4ejrmO0/csDW
	M6qqaigqh8Cq3mCfwSwb4iCEDbIOC8T84g==
X-Google-Smtp-Source: ABdhPJz23dKRrKZe4mpGnutvd6ovnN/vTXDnyBQIq0xjFulDrFpDjgwc+BxSy1d30g8V3R90NGJaUA==
X-Received: by 2002:a63:231c:: with SMTP id j28mr16764448pgj.165.1620023763745;
        Sun, 02 May 2021 23:36:03 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::a7ac])
        by smtp.gmail.com with ESMTPSA id j189sm8012890pfd.21.2021.05.02.23.36.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 May 2021 23:36:03 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] cml1.bbclass: Return sorted list of cfg files
Date: Sun,  2 May 2021 23:36:00 -0700
Message-Id: <20210503063600.1595267-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since these files are passed to merge_config.sh its better to use a
sorted list, so we can be sure that this list is always fed in same
order irrespective of python versions on host

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/cml1.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/cml1.bbclass b/meta/classes/cml1.bbclass
index d319d66ab2..1c3d70b48d 100644
--- a/meta/classes/cml1.bbclass
+++ b/meta/classes/cml1.bbclass
@@ -6,7 +6,7 @@ def find_cfgs(d):
         if s.endswith('.cfg'):
             sources_list.append(s)
 
-    return sources_list
+    return sorted(sources_list)
 
 cml1_do_configure() {
 	set -e
-- 
2.31.1

