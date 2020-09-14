Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web11.62252.1600092785417707423
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Sep 2020 07:13:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=q/zwBZwq;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.181, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f181.google.com with SMTP id d13so3422666pgl.6
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2020 07:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=0JhK8in6q2F/5da9drCDgv544H5X6iTqOt6nknCDkWY=;
        b=q/zwBZwqrOqt4949cNJZ9erBVFQdU0MgwEajohxhs9k8hmH3H1gbBFOZCC8AC1KdTr
         6DGL59Dr7Dtw5Hx0GZnL5C69VRLyEdxg39PSDPABvKaF+DX+sBRT+nIgFuovioC926Gl
         engX7aolrfP1Dft3GF/ukJUKiecpt7P0oEewqfR2jrMZgRoAcuJZv2pn9QBkJ7RSPfgg
         EQrSXuR6cVtyXREQXsBR38y+ykfR2qAKSFayBNFp0XRLD5HVde5Xu7mXP4nuP7yryxUs
         54LG9zipF0bzllNtc2pi3FU0sPlq7/VOSaW+3p6grK9ZiM3qfbtT/ktnqR+kl26MF06G
         zBtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=0JhK8in6q2F/5da9drCDgv544H5X6iTqOt6nknCDkWY=;
        b=i9yBpoCCt2Cg0dqqYrf6yKTK/RPQzt0KEEqpr/zRRu8W9kVT57vErMj8jM0q5N7HK4
         wF6qBq/j38vLFiejoDyWTDbLGddK/CN/Rscb+gX56yzzyocZw5Nd4gOl382ib4XnlVf/
         yNb95znweU9jAhXUWFfMi5T3ve8NiAQbSLb6bzLjwFt6oudBIoaYRedunh+8k+jj67e1
         nzmxXvwCpRmfYc8KCFZNSx6ykCRV+OE/07TZpEe0BVDhLTOWr7QSrXJJzveYhsHa9ZhX
         9tQdGLpI7ootBamYtXqQnXIPg7kOAXLt+vBnsGiiev1XXm6tJKZ7B+TYFrotSE5el4wq
         dZUw==
X-Gm-Message-State: AOAM531np2Ql88A0fsrp0hu0PIvAFFj1Scn4aiNEh2n6M7Y+KcG0HgFB
	gJW+hDA55Ulv2rcGBcFhpKhJvfKhli8eGwX7yB0=
X-Google-Smtp-Source: ABdhPJzNfvN2CbZBwL+0/p85mN94RKMxn4D5wwpeoD2uWiEyU7UZQotimSGkiPe+vmRRP44CMC+udw==
X-Received: by 2002:a63:5663:: with SMTP id g35mr11270747pgm.163.1600092784378;
        Mon, 14 Sep 2020 07:13:04 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id z22sm11053183pjq.2.2020.09.14.07.13.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2020 07:13:03 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 24/24] cve-check: avoid FileNotFoundError if no do_cve_check task has run
Date: Mon, 14 Sep 2020 04:11:42 -1000
Message-Id: <bc613b8d05930b9aef847bf96c1068b33138d86b.1600092418.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1600092418.git.steve@sakoman.com>
References: <cover.1600092418.git.steve@sakoman.com>

From: Chris Laplante <chris.laplante@agilent.com>

For example, if you just run 'bitbake cve-update-db-native' in a clean
build system, |cve_tmp_file| won't exist yet.

Signed-off-by: Chris Laplante <chris.laplante@agilent.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit dd4473f3d8e1c1a587b6de660775e4b46ddc5fad)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/cve-check.bbclass | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 35b7d0f298..17f64a8a9c 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -63,14 +63,15 @@ python cve_save_summary_handler () {
     timestamp = datetime.datetime.now().strftime('%Y%m%d%H%M%S')
     cve_summary_file = os.path.join(cvelogpath, "%s-%s.txt" % (cve_summary_name, timestamp))
 
-    shutil.copyfile(cve_tmp_file, cve_summary_file)
+    if os.path.exists(cve_tmp_file):
+        shutil.copyfile(cve_tmp_file, cve_summary_file)
 
-    if cve_summary_file and os.path.exists(cve_summary_file):
-        cvefile_link = os.path.join(cvelogpath, cve_summary_name)
+        if cve_summary_file and os.path.exists(cve_summary_file):
+            cvefile_link = os.path.join(cvelogpath, cve_summary_name)
 
-        if os.path.exists(os.path.realpath(cvefile_link)):
-            os.remove(cvefile_link)
-        os.symlink(os.path.basename(cve_summary_file), cvefile_link)
+            if os.path.exists(os.path.realpath(cvefile_link)):
+                os.remove(cvefile_link)
+            os.symlink(os.path.basename(cve_summary_file), cvefile_link)
 }
 
 addhandler cve_save_summary_handler
-- 
2.17.1

