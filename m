Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com [209.85.160.193])
 by mx.groups.io with SMTP id smtpd.web11.19421.1597251822725898861
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Aug 2020 10:03:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KZW/I8Ck;
 spf=pass (domain: gmail.com, ip: 209.85.160.193, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f193.google.com with SMTP id o22so1993619qtt.13
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2020 10:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hQBv5GyfkvA78CkIDhvKSyv/FKohkBOgR81umI46GTA=;
        b=KZW/I8Ck/nZ9Eb57G+Eig7oaIHNZBAH5mQoGeg0P1Cn4CvXR68CGSysDKGUAJD+xEd
         9+SBChY1mGh0s0Tk4YlGwt+CotxVfQbcNIKb8enFqUudsdyEhNgmMyzlI6rRaSxH0uOM
         22TgiPmXzPb6zN2RhV4OBOzyd83dxMjv38bQ7ogbuBu79qh1md4AEe8umWNsP4gEoixC
         MN1o0+P4Neb0uyVmohd5nhTbyqKW6svC+PSDx7/S/aVv09Wp7rztWlb1U/SrecAIjP2s
         IEIapizvgKmO7XGTZLAWoY30UfW43aamyNSlzA0g/svh3j0HL2qQbITlv7Hnr7sFpK4d
         Vj2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hQBv5GyfkvA78CkIDhvKSyv/FKohkBOgR81umI46GTA=;
        b=biuuBXJHym7DFehwydePglTI6P78VauHD1K/RvDDBhpJKLlLB8GX474Nk/ucAc8Ez3
         KTYEGutag4EduasRBR99+jEwgJ8RvbAARsXpSfzjdAAJ0rvA2JvfOPkVPabNKk57XDh7
         UHbktTqC91qVtfh3KHst6pNFaGeDf2Plu3G7O3ndcDfKS2aK/z9lGyMg96aed0Wl2H1M
         bIAJ6b4IspYORzWLedj0t3IUSamKc2PUCL8zo4O/BZWpz2hanRN+1XOxfHkVt91iJZ6T
         1JuWSxgzTA7Sx61RxcCels22i52MSiJpfzWjZ4bWzGpIA68KTytrSBoQWl9g0ZAUS2WT
         MVkA==
X-Gm-Message-State: AOAM530JFgc8LXjP8Hil0twtoKXhW5gKOYBkJtZewtSLkh3SSGvtJlv5
	P7J220wYyb9cJE0kXxagZBE=
X-Google-Smtp-Source: ABdhPJyaZHSt4EreM1vuKBmVeARTioqq06PJcL6ToXbVic5FY90nnsv2vRtBuxVIh2cKIMHWn3f8dg==
X-Received: by 2002:ac8:7a66:: with SMTP id w6mr653120qtt.242.1597251821790;
        Wed, 12 Aug 2020 10:03:41 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id k24sm3249977qtb.26.2020.08.12.10.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2020 10:03:40 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 05/10] kernel-yocto: set cwd before querying the meta data dir
Date: Wed, 12 Aug 2020 13:03:26 -0400
Message-Id: <bd6218b385505e22b847fc88204f3112586004c6.1597203921.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1597203921.git.bruce.ashfield@gmail.com>
References: <cover.1597203921.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

To aid classifying options and streamling reports, fragments
and classification info are consolidated into a kernel meta
directory.

The name of the meta directory is (somewhat) flexible, and hence
is queried by the tools and created if it doesn't exist.

The recent enhancements to the .config auditing introduced a
new query for the meta directory, but isn't being run in the
kernel's source directory .. and is hence creating an unwanted
file in $TOPDIR. We set the kernel source directory as the cwd
for the call, and everything goes back to where it belongs.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/classes/kernel-yocto.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 77849a28c9..fa8466e587 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -475,7 +475,7 @@ python do_kernel_configcheck() {
     # meta-series for processing
     kmeta = d.getVar("KMETA") or "meta"
     if not os.path.exists(kmeta):
-        kmeta = subprocess.check_output(['kgit', '--meta']).decode('utf-8').rstrip()
+        kmeta = subprocess.check_output(['kgit', '--meta'], cwd=d.getVar('S')).decode('utf-8').rstrip()
 
     s = d.getVar('S')
 
-- 
2.19.1

