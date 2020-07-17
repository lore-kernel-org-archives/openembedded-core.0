Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web11.8588.1594982045453962510
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jul 2020 03:34:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JBJsVa+h;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: rehsack@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id a1so7253403edt.10
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2020 03:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=P4v3zcUavpljo3jL6kJRgaEI1eSOx2NNzk0gM4eppJg=;
        b=JBJsVa+hudQhLPaQwrpwh28C02IoogHJJ5tjYSiyCRDO0izz8Q2zaeJ9iVHBzGfXFN
         zfvl1WT4glogr9/HLHozAFShrS57z6vrh1E6/j+2heLKrOYWQHIIpHkQTQq8MUjGYFze
         JubHBUDQiOmhax5TQdKmkon8QHV8dGwfRIrdb3vS+MgcZECflSon9QkMzImfCJJEx8Ao
         CcxO/tUQIA5Mio7D2D5cVHqcTnTP4oI8JulE4bFpwxmSzeiFbF+HrbPuScP6HH/OeEY6
         y/6tLAyGe6Grax5ZBY5nH1mo5GfrRzbvJCvSY0tT39hYED/xbJRk7HLQhnaOyRaJK32P
         kPYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=P4v3zcUavpljo3jL6kJRgaEI1eSOx2NNzk0gM4eppJg=;
        b=OVSrCClLr6aP110GGUGy+9wv4MPgXhZtYunY9KmfAAJ8Ky00DRsBuzIij4178oumwd
         gDlIOMVhMlDfvqb3Lrpj6lJB6/nrDG8LM60F42U72esPIU/NNUc2Eexm72uKMAsTwEr9
         2aVLwE9aRWR4WzVSuMgdCW79op2Jxrxks/elWZpDNMdD8v/wNeJ1kPHZlUFIct+UBmoy
         QhCw1lpJ6OgyosubTbiCzIogINmkr7yQ5eWuONuwyvMoYO4JBRPf9ckLJEFg67Nfc+iT
         c0tbA+NTYtVlic3UhsqQqQUFFcrmicGDhwk0mNpwZEwowhJWT5QuiaaE0Wh4EPCTYJlW
         6OWQ==
X-Gm-Message-State: AOAM530uVANqQupSOG/WuNH8r5Il+mupR+5+Cz/lgvEwLFms1q6Gwq+O
	rapnzUrYv7Qx89MlVfKF8R66Lp7p
X-Google-Smtp-Source: ABdhPJzpGTmmrAsQwACCzsaVjFWeMTpzkaI0+zitNFdogpyZH+HMeR4dePAdh6LEeKT+rj7pgicf5A==
X-Received: by 2002:a05:6402:796:: with SMTP id d22mr8956935edy.78.1594982043528;
        Fri, 17 Jul 2020 03:34:03 -0700 (PDT)
Return-Path: <rehsack@gmail.com>
Received: from beaker.muppets.liwing.de (p5b25b9cc.dip0.t-ipconnect.de. [91.37.185.204])
        by smtp.gmail.com with ESMTPSA id o21sm7567537eja.37.2020.07.17.03.34.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2020 03:34:02 -0700 (PDT)
Sender: Jens Rehsack <rehsack@gmail.com>
From: "Jens Rehsack" <rehsack@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jens Rehsack <sno@netbsd.org>
Subject: [OE-core][RFC 1/2] toolchain-scripts.bbclass: also recognize ${SDK_SYS} env setups
Date: Fri, 17 Jul 2020 12:33:47 +0200
Message-Id: <20200717103348.17225-1-sno@netbsd.org>
X-Mailer: git-send-email 2.17.1

Instead of recognizing only environment-setup scripts in
${STAGING_DIR_TARGET} or ${STAGING_DIR_NATIVE}, respectively - lurk also into
${SDKPATH}/buildtools/sysroots/${SDK_SYS} where nativesdk-openssl installs
setup files.

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 meta/classes/toolchain-scripts.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
index db1d3215ef..e3959e21e8 100644
--- a/meta/classes/toolchain-scripts.bbclass
+++ b/meta/classes/toolchain-scripts.bbclass
@@ -119,6 +119,11 @@ if [ -d "\$OECORE_NATIVE_SYSROOT/environment-setup.d" ]; then
 	    . \$envfile
     done
 fi
+if [ -d "${SDKPATH}/buildtools/sysroots/${SDK_SYS}/environment-setup.d" ]; then
+    for envfile in ${SDKPATH}/buildtools/sysroots/${SDK_SYS}/environment-setup.d/*.sh; do
+	    . \$envfile
+    done
+fi
 EOF
 }
 
-- 
2.17.1

