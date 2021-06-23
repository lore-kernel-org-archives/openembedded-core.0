Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.7238.1624453610377858513
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Jun 2021 06:06:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PYV1aD2z;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id t11-20020a1cc30b0000b02901cec841b6a0so3221744wmf.0
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Jun 2021 06:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LJQUuRWaciqsW+/azFKtzv1PaiZB+K4QH5loSE1Bfgo=;
        b=PYV1aD2zZKHHRDyV/KGfEjTWDzrwnoMivUIfnNB+PpwBF6u+HczrCadr71A/qYvI0r
         TiVm86kSsWBwVRQNfD4Yl1/xIYFTQcxV9yULXKAWj5fxZa2rQiilT/gqDb0vzk7UyhaZ
         mgtrhcZkgDVX0mnzTD4+iMVsqjJkhz1UmpnquPMV+ud70gJz0xz+gighV/DjdP6n8NMq
         RZrG8jdypz91J/TW4ZItIPnpRI/44XFAoJQ1pLXDs5FXozwW91/4ki4vQUjJrGDM9Whe
         z4/8NC9ekb+jAw2dhj7Jkq7uLVD/EbXjuwCfOaBabu+LQnjolI8HcpWtRLLXWjnioPqC
         dy7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LJQUuRWaciqsW+/azFKtzv1PaiZB+K4QH5loSE1Bfgo=;
        b=aetHdvM2vxnF7uJj6tywwUDrirriKXla4Zw1ilAIMlERB91VYLue44BpDGdT9PM2JF
         Lw0ks6+5fmCLVilARYJpMLMUcihv/Lro9F8KnMbbztKsYvHQw+TGnajn/+bIk5ADeBXK
         41OfSGVkjSfSPBdVg4q+PGO8hZsbPlP7cpX0FXD6t0eSmPhKLX0gNtvVfxPbkgPNGhY3
         5Vyg6ebpOCMKg9wi5XetEwXpF85pAfKV5a9QR+auBPwLUdsqMfjKo/fqjOeFmLIp9gk+
         oN3QwHH8Re2evrtPmvfm1ymHqe0qHHRkCRW0pwTHO411z6HjidsWrgSPg8WjFuCOOnHN
         pkSw==
X-Gm-Message-State: AOAM530DxlqTG9uXWIiUSz3s1snHhR6QSWcNiZx4oaCgq3uPci9POvtb
	3K5r1yMcT+Pwhl3giCu1g2uh4HyxvQY=
X-Google-Smtp-Source: ABdhPJyagYWR1PHOtBnO9sjfrNPJNmBl41OIUAeaucN4Dv0UHTJQ8lrTFvvuPDU7/FNWwogDn7mBZw==
X-Received: by 2002:a05:600c:21c7:: with SMTP id x7mr11049767wmj.82.1624453608780;
        Wed, 23 Jun 2021 06:06:48 -0700 (PDT)
Return-Path: <frederic.martinsons@gmail.com>
Received: from SGX-CMP-776.sigfox.io ([217.114.204.178])
        by smtp.gmail.com with ESMTPSA id y3sm1752155wru.78.2021.06.23.06.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jun 2021 06:06:48 -0700 (PDT)
From: "Frederic Martinsons" <frederic.martinsons@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Frederic Martinsons <frederic.martinsons@gmail.com>
Subject: [PATCH 2/2] package.bbclass: manage external sources for debug source file packaging
Date: Wed, 23 Jun 2021 15:06:37 +0200
Message-Id: <20210623130637.3314755-2-frederic.martinsons@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210623130637.3314755-1-frederic.martinsons@gmail.com>
References: <20210623130637.3314755-1-frederic.martinsons@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Frederic Martinsons <frederic.martinsons@gmail.com>
---
 meta/classes/package.bbclass | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index cf30f33f3d..38e9065f25 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -560,13 +560,20 @@ def copydebugsources(debugsrcdir, sources, d):
         strip = d.getVar("STRIP")
         objcopy = d.getVar("OBJCOPY")
         workdir = d.getVar("WORKDIR")
-        workparentdir = os.path.dirname(os.path.dirname(workdir))
+        externalsrc = d.getVar('EXTERNALSRC')
+        if externalsrc:
+            workparentdir = os.path.dirname(externalsrc)
+        else:
+            workparentdir = os.path.dirname(os.path.dirname(workdir))
+
         workbasedir = os.path.basename(os.path.dirname(workdir)) + "/" + os.path.basename(workdir)
 
         # If build path exists in sourcefile, it means toolchain did not use
         # -fdebug-prefix-map to compile
         if checkbuildpath(sourcefile, d):
             localsrc_prefix = workparentdir + "/"
+        elif externalsrc:
+            localsrc_prefix = os.path.join("/usr/src/debug/", workbasedir) + "/"
         else:
             localsrc_prefix = "/usr/src/debug/"
 
-- 
2.25.1

