Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web11.9521.1621419787417300836
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 May 2021 03:23:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BsCFd1lv;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id l4so19164351ejc.10
        for <openembedded-core@lists.openembedded.org>; Wed, 19 May 2021 03:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dcvU/52hY/RMCvd8+f8mhjYwcfmyCaQ0Vl+Txui+aRg=;
        b=BsCFd1lv4/PZjz133yKdmIiW+dVVsSJ0GCHs8rPSxmJYUuu86803vp5xUnICd18Rjq
         0+gtR49MjxEfFjYf1ftsinCXKHjrTBxhcVC7Y/MwJmROaWMoLdCyj8FzL/ezisw3Mncl
         j3feCUoSmTkynboY3rkndxuOsI0OdtZ3dM/u0tx8LTpGulR0YldVH4IK+8/IBMTIRbZP
         Iz9LluBH7unPpO75y7y1/y6eWzJWwN8BfrQklMCXrKP7Bh21/9JtBdphGUbZjR4PNtbX
         iaCk4TaMKDuFm5wNpx2643cDPYNr5gatLXqeNNUpy/Mb5+iUTHZyKj3LghgkGR5MY2da
         eyDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dcvU/52hY/RMCvd8+f8mhjYwcfmyCaQ0Vl+Txui+aRg=;
        b=pKQ5RXQ2Bj9YDT/JjMHN2ahycbfZ07QjwvFWpHErY0wh27+qaD8aVtJAV6h0YYWxrg
         eW61K+4uGhNrDWEuM/Ft05hjAmYFP773seQgwzRTlW6Mg2HVj0fFDWP8S8wosmI4XLSa
         k8xHf2SoBBlZfSWwgoW8viaAqrjlTF/UsVdlbSMVYatFAFqmGi+YbkkDq93ooB5eg7J2
         yafXUKYrGRfBHWgvjxLIA19fVL9oO5ZU6WFMuErqDy9Qo15K4MJUKxPVsbg2fBmjgSzg
         xgTgzNi2ED5Pt0nna5S7NGoM+0wtcTIS1BTssEv1IRS1fwU1euFzL9L/tXsrhrGJaRIZ
         O9eA==
X-Gm-Message-State: AOAM532PeZlmeNuyz1a4U2BLAOCgTFYd7rx/RTxkhIgvxPQSFH9TUq7H
	bhPajaQqR+JyaofSfuRnitQVML+sGDY=
X-Google-Smtp-Source: ABdhPJys5M7HfN8E5S1xJrjTn+ycJ5WoHd7dH5MmiP2zkGDIdNg5WtriSEofjttKZB3vSsBVEAuGVA==
X-Received: by 2002:a17:906:3a45:: with SMTP id a5mr12166701ejf.288.1621419785906;
        Wed, 19 May 2021 03:23:05 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id bh3sm12398140ejb.19.2021.05.19.03.23.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 May 2021 03:23:05 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH] sstatesig.py: make it fatal error when sstate manifest isn't found
Date: Wed, 19 May 2021 12:23:02 +0200
Message-Id: <20210519102302.2674317-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* all known issues in this area were fixed, make it fatal that it
  cannot be overlooked if someone triggers this issue again

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/lib/oe/sstatesig.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index 6cd6e11acc..e86a09b332 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -453,7 +453,7 @@ def find_sstate_manifest(taskdata, taskdata2, taskname, d, multilibcache):
         manifest = d2.expand("${SSTATE_MANIFESTS}/manifest-%s-%s.%s" % (pkgarch, taskdata, taskname))
         if os.path.exists(manifest):
             return manifest, d2
-    bb.error("Manifest %s not found in %s (variant '%s')?" % (manifest, d2.expand(" ".join(pkgarchs)), variant))
+    bb.fatal("Manifest %s not found in %s (variant '%s')?" % (manifest, d2.expand(" ".join(pkgarchs)), variant))
     return None, d2
 
 def OEOuthashBasic(path, sigfile, task, d):
-- 
2.30.2

