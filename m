Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web12.14998.1611783041134613671
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Jan 2021 13:30:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kwZN/OMV;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: tomasz.dziendzielski@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id q8so4725868lfm.10
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Jan 2021 13:30:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=orQiUpPtlYXRbiqMDoE7ADpCcmHLc38AgYeFLao70y4=;
        b=kwZN/OMVSrmkK82cE+cMQosAxhHzj1f2mu7EHVfeaCJWf5vmMpUD0My0JOS72+nyQe
         bR3jKIzikWiPIM1PON9j7D5NeWlW34GQBBGtVGd5sw9IbpW9UVbkU8Sgu+jl99Nr/No1
         uNUa3YWuFq84SUiffXdO4qNML/9fd7pexKYGgqEh6kfenbPbb7N98Md7Xfkh20Bs/arK
         g2Q6g6ZXzWyAotYYZYUIznwR46Li7sxp2c572gjUkjuAnrVDS/qOpeNSYcPEVtsCJim/
         zKGthwij7XMUlrfh5wop9qqbp8OuB0G3karQEyy2HUDUEQuh2T+I2/7zsimRatTW6dgf
         eATA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=orQiUpPtlYXRbiqMDoE7ADpCcmHLc38AgYeFLao70y4=;
        b=DVEVKmi6oF5mS/T4fAWE8+64jDGstxWxl8d6tcDDVsfdAfebhrd/vtaC0DBtHjC68F
         Byx79PLm4vSTf7mu6pyZKZNZYILIFVuZxhb1DCIEbdJ0u4q6Q3YjWNfpnIUKEIkgrgfz
         0pXHazQ64B67VnC0Gs0PhAJcx53OnrKXVsCiUZgpbm8sk9QIw5fRPVYst195yq2Ioppo
         /TBHXixjVBqsGvU3OFHVbFyI51JGLRyqooVdbgzJTntALEAC/iQFNwlujqsnCDokOoXz
         NczXGwlNzX0TGiHt06AmKQ7yhxJ/qLZNZIFHo0ofoOfCEwTdw7JyQPnApytu6ToyRMwe
         oj/A==
X-Gm-Message-State: AOAM533fUAG54r9IMYTg9Ot7pPYg0AQwgu6uBR7nrzzhFqMP8JCnzLA/
	PGL/FBVTXlz4VUUwdOYT6y4GtT0X20I=
X-Google-Smtp-Source: ABdhPJwQ50ojTZZmQVB0L3illKbBdsz1qH/YgWY7FPwHXLbg3hqsbmzdxv3v0TaSlIG/Y4rIYFSWkQ==
X-Received: by 2002:a05:6512:3710:: with SMTP id z16mr5872207lfr.646.1611783039216;
        Wed, 27 Jan 2021 13:30:39 -0800 (PST)
Return-Path: <tomasz.dziendzielski@gmail.com>
Received: from localhost.localdomain (h124200.man.tk-internet.pl. [93.175.124.200])
        by smtp.gmail.com with ESMTPSA id m10sm829319lfk.2.2021.01.27.13.30.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jan 2021 13:30:38 -0800 (PST)
From: "Tomasz Dziendzielski" <tomasz.dziendzielski@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
Subject: [PATCH 2/2] insane: native-last: Print classes inherited after native/nativesdk
Date: Wed, 27 Jan 2021 22:33:11 +0100
Message-Id: <20210127213311.6030-2-tomasz.dziendzielski@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210127213311.6030-1-tomasz.dziendzielski@gmail.com>
References: <20210127213311.6030-1-tomasz.dziendzielski@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

See [YOCTO #5729] for details.

Signed-off-by: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
---
 meta/classes/insane.bbclass | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index e371c1c71f..53230fc667 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -1381,6 +1381,7 @@ python () {
                     # native also inherits nopackages and relocatable bbclasses
                     skip_classes.extend(['nopackages', 'relocatable'])
 
+                broken_order = []
                 for class_item in reversed(inherited_classes):
                     if needle not in class_item:
                         for extend_item in skip_classes:
@@ -1388,10 +1389,13 @@ python () {
                                 break
                         else:
                             pn = d.getVar('PN')
-                            package_qa_handle_error("native-last", "%s: native/nativesdk class is not inherited last, this can result in unexpected behaviour. " % pn, d)
-                            break
+                            broken_order.append(os.path.basename(class_item))
                     else:
                         break
+                if broken_order:
+                    package_qa_handle_error("native-last", "%s: native/nativesdk class is not inherited last, this can result in unexpected behaviour. "
+                                             "Classes inherited after native/nativesdk: %s" % (pn, " ".join(broken_order)), d)
+
 
     qa_sane = d.getVar("QA_SANE")
     if not qa_sane:
-- 
2.30.0

