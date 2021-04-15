Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.6440.1618491051060248231
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Apr 2021 05:50:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hj82AjZr;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id r7so11190103wrm.1
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Apr 2021 05:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pd6cJeX+9RAHRhKfb9+ER9oxPzAZ4YHEhor+C6v7rAs=;
        b=hj82AjZrbybOgrwJNxbINkA8sOy+6d/LdZJGZ23B63b8RDXDOwzKe1zB2JoSh760Xy
         503eKNgzDsZbM42qxntquohDwZTy1QIMHOADYjAE/ajZAF8bk9przwwX1N57ccPHqyaQ
         yIlLkrXwF+sa+tM/41bvmzRIYHWzVnfGn6HOc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pd6cJeX+9RAHRhKfb9+ER9oxPzAZ4YHEhor+C6v7rAs=;
        b=QqOSDHCY/ZfEVu2t2hN20uoj+Iy2Diu0l4+yp1IseaG7glGYSbXsnqhY3YieHpqNrR
         rokCkWe7uK3wNlsYR44QpQ1X2gaKeioH+6k+PYhvpWju/vmDg2D5sXef7Cs/oSFpTvaj
         c7x17ojZAvN/UmtA0sV91ajovEhhPaUNanctqO2qwMNM4dcMPGZyEQlnG93bc9T2K7/b
         WXUoljZEqWDUItLyUDWktkslnNER69xhemx/enpn/5OAaZ1SR3f/Mxu4vfcm1QBS63H9
         d6pdLEt/1IUl+78J9ORswp0zVlh+17E2JO7GA3nvLQr1DG1q4cJMZ1hxdmEAmHQTcMjP
         mdJA==
X-Gm-Message-State: AOAM530bhPSOsqSUNrF8nTsFBrV+GWo3O7vZNupeWWCv3FCLduK804yb
	I9lsXWUS9npshbbFjPpXSJAYjcSWRkrTHw==
X-Google-Smtp-Source: ABdhPJyvdhcaRbHFAzo/OtNEb04Gi3TBMjFV5QspfXyLfGh335KLXxllE4UfGg1gRj17VWYRScF6JQ==
X-Received: by 2002:adf:ec42:: with SMTP id w2mr2213973wrn.373.1618491042326;
        Thu, 15 Apr 2021 05:50:42 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:b769:fd13:2e7b:1bdf])
        by smtp.gmail.com with ESMTPSA id v14sm2951567wrd.48.2021.04.15.05.50.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Apr 2021 05:50:42 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] sanity: Add error check for '%' in build path
Date: Thu, 15 Apr 2021 13:50:41 +0100
Message-Id: <20210415125041.1315100-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It has been reported that '%' characters in build paths break with python
exceptions, probably due to confusion with python string escaping. Whilst it
is probably fixable, showing the user a human readable error is better given
it doesn't work.

[YOCTO #14282]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/sanity.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 894f0e31078..14ffac0bf28 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -887,6 +887,8 @@ def check_sanity_everybuild(status, d):
         status.addresult("Error, you have an invalid character (+) in your COREBASE directory path. Please move the installation to a directory which doesn't include any + characters.")
     if oeroot.find('@') != -1:
         status.addresult("Error, you have an invalid character (@) in your COREBASE directory path. Please move the installation to a directory which doesn't include any @ characters.")
+    if oeroot.find('%') != -1:
+        status.addresult("Error, you have an invalid character (%) in your COREBASE directory path which causes problems with python string formatting. Please move the installation to a directory which doesn't include any % characters.") 
     if oeroot.find(' ') != -1:
         status.addresult("Error, you have a space in your COREBASE directory path. Please move the installation to a directory which doesn't include a space since autotools doesn't support this.")
 
-- 
2.30.2

