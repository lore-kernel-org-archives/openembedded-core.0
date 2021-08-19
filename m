Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web12.67170.1629361784493475253
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Aug 2021 01:29:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=H5ThFaho;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id q6so7760579wrv.6
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Aug 2021 01:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LCz5yq+B5Qx8Lv61NGJ2SavATPABYt4KeLw8iukxIhA=;
        b=H5ThFahoiG/TUJkA6hJ+OATmZvWMbmDjjOQYYyys8gZ2UJa//YUp5Rp+Zch8dfMVJs
         GMAtzMoOefAsm3d68bEHp+cPFVzN78u1wurhPj2IXwC4DBk1Q8eAidNwY/Xa11vSciOd
         4dYOAHpaErFF3yU/rUauNVW2kpnM0xfS/ii8hnkjp/2k2OVKyLSrISbJvj8vqIqvh0HT
         3T4YCO/EA09Z8R91lemqC+bwyPIJczIJooNa5WAtiAl0Wa9Gs5q1sBiI6zB7Ue2t9cqw
         fdfivj6jNFjQVWRlN7yAvHjcV55vfSHE/fNXoWErkm3PrFt2zc0aiDpoP634deaHvQZD
         RkNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LCz5yq+B5Qx8Lv61NGJ2SavATPABYt4KeLw8iukxIhA=;
        b=M190b8otVtXdNBdKzUhLA7wIAfykzhSKHWS5AEb02S+eFiFPb6diiQ9OyUSDERPQIa
         lL8KnkKixm2Fu62BdfSzA6kshaP1Am+mt6jRct30DWyUk3IbQDHg/oyydDfqGl0j4WhZ
         3or/9p7DRHqM65XmLYYRRoR8vv+LpfWSuWx9F6O1ASBZ82iXdvETeQblNn05XM9Vzx1N
         gfNOSj1njywRG1kFFFOzK+sp4kFLrBrUArNwcj33BPg6HfHdMqwmbZkqSp4ZJYOacSHF
         Kt/LYSPqt3vxtpisEbRXK5zsvrAkzuM2zyecltyG7EtEjTP1UvfABdzT+eYDeh08ckC1
         euMQ==
X-Gm-Message-State: AOAM532Sgsu3RMj/Cir28ovH7F9So3OgjOhWSXW4I4M3FedggCO4Lu2A
	HlVKyVSHWa0leAp7JRnkyK0Ew6yozdg=
X-Google-Smtp-Source: ABdhPJwKgVyMU1a/F+JR6k+teAZvmL0zUsqFJlwYVBmUF8c6oxLr13OQ/8I8LTb7UOUAItizGQVvzA==
X-Received: by 2002:adf:a309:: with SMTP id c9mr2251673wrb.99.1629361782792;
        Thu, 19 Aug 2021 01:29:42 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from CTW-01195.lan ([88.157.222.244])
        by smtp.gmail.com with ESMTPSA id w1sm6993671wmc.19.2021.08.19.01.29.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Aug 2021 01:29:42 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH v3] patch.bbclass: check if patchdir exist
Date: Thu, 19 Aug 2021 09:29:34 +0100
Message-Id: <20210819082934.10907-1-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

if the user specifies path on 'patchdir' that don't exist,
the patch will fail and there are no message that indicates the real cause.

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 meta/classes/patch.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/patch.bbclass b/meta/classes/patch.bbclass
index 559c6f45bd..1e9a024bf9 100644
--- a/meta/classes/patch.bbclass
+++ b/meta/classes/patch.bbclass
@@ -131,6 +131,8 @@ python patch_do_patch() {
             patchdir = parm["patchdir"]
             if not os.path.isabs(patchdir):
                 patchdir = os.path.join(s, patchdir)
+            if not os.path.isdir(patchdir):
+                bb.fatal("Patch source directory don't found '%s'" % patchdir)
         else:
             patchdir = s
 
-- 
2.33.0

