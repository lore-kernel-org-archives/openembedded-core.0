Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59B1EC433F5
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 19:54:43 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web10.15518.1634673282855719744
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 12:54:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=K6Htnnf5;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.172,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f172.google.com with SMTP id e65so17961215pgc.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 12:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Dre+yIbnqhQl6YVjlK9zeYJvS3JmPkJjqD39TiCr7nc=;
        b=K6Htnnf5CmUKCBGTEH4rwM0tZnK7qadxoyGPVICtCDDmE/HaWqvasAeLKLqKRfxBq3
         46HfzfC1VLchA86GroIiIt4Km/V73J2jHm5y9qMLTVkC2wFCE3xnyb2SBGO7quO2qiNb
         gJRKf0Wa1QLYyqk+kNnlJCP2Uhq07+NEmcSn7DBgN1myTW75MjCJXtD6jG8yETXKoPAS
         SQC+8wwF1jTxUCzQT2kxflOc/s58enow8ZxHHDezKeCbpUANd5kupJkFjdiOwYYEKL1P
         d85u77/7tjUAxHX+gu0B5F3TKNciJjei1Hojy3l4WOE6u9+NDr5I3zZxhmepWAivMB6y
         1rCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Dre+yIbnqhQl6YVjlK9zeYJvS3JmPkJjqD39TiCr7nc=;
        b=XYLqnvTFQEuVAJsSaKKpOq5+M1k8SRIrfKG7/dvVTCoWKCLZ+wD89DNb5vhNez47VE
         /fOnOXkL5mIpb5IM4FflcmOKSEHin3/TbbPuhNqiwOiQRBP2YjquuA7irA0yrMBicdYJ
         lQieCNm9IDxkHud19b4u5w6WN3XK9/znbIHrwAKZ5YsrUIni3Ya+h2R2+RZ+yCy8DTaE
         M2izBpJY6ilZbYz5842jdy2B9Yc09biBS0DuVSmaMa8riI9au4MkL+pLs/gh4ubXvIhi
         hS5fpYIIrjfsob/l1LwFKEHhIoS0KY4IeMXKAOnST2ngtzcbu/XFOU1zxS3kbkucJwIz
         cN3w==
X-Gm-Message-State: AOAM533xqJxTVouvB9q6MWX7qPDKhqSsJ5V+s40DGCM8fBR9aZr/FDfg
	OG+2tFVjKCZyR7rAQZWc1ctuJ4AfIOrDcafUFfA=
X-Google-Smtp-Source: 
 ABdhPJzXT/ruIyczFhWHLyV5zoSrjtE5Adlt0zo17yJA3XUPZPILerD7QaeWtzyOITppuGR4J79HfA==
X-Received: by 2002:aa7:9197:0:b0:44d:a2e9:72cf with SMTP id
 x23-20020aa79197000000b0044da2e972cfmr1797509pfa.38.1634673281807;
        Tue, 19 Oct 2021 12:54:41 -0700 (PDT)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id q14sm67104pfk.3.2021.10.19.12.54.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 12:54:41 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 15/38] patch.bbclass: when the patch fails show
 more info on the fatal error
Date: Tue, 19 Oct 2021 09:53:26 -1000
Message-Id: 
 <af46b360b364f6b50cd389d838dc5dd3099ecc41.1634665675.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1634665675.git.steve@sakoman.com>
References: <cover.1634665675.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 19:54:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157220

From: Jose Quaresma <quaresma.jose@gmail.com>

There are situations when the user have the 'patchdir' defined
as a parameter on SRC_URI. However he doesn't know that with this
the patch is applied relatively to the receipe source dir 'S'.

- When user have 'patchdir' defined check if this directory exist.
- If the patch fails show addition info to the user:
  - Import: show the striplevel
  - Resolver: show the expanded 'patchdir' to the user.

The next example is from opencv in meta-oe layer, here the
patch is applied on the target directory ${WORKDIR}/git/contrib.

S = "${WORKDIR}/git"
SRCREV_FORMAT = "opencv_contrib"
SRC_URI = "git://github.com/opencv/opencv.git;name=opencv \
           git://github.com/opencv/opencv_contrib.git;destsuffix=contrib;name=contrib \
           file://0001-sfm-link-with-Glog_LIBS.patch;patchdir=../contrib \
           "

* When the patch fail there are no message that indicates the real reason.
  patchdir=../no-found-on-file-system

ERROR: opencv-4.5.2-r0 do_patch: Command Error: 'quilt --quiltrc /build/tmp/work/core2-64-poky-linux/opencv/4.5.2-r0/recipe-sysroot-native/etc/quiltrc push' exited with 0  Output:
stdout: Applying patch 0001-sfm-link-with-Glog_LIBS.patch
can't find file to patch at input line 37
Perhaps you used the wrong -p or --strip option?

* The check of the patchdir will add a new fatal error
  when the user specifies a wrong path than don't exist.
  patchdir=../no-found-on-file-system

ERROR: opencv-4.5.2-r0 do_patch: Target directory '/build/tmp/work/core2-64-poky-linux/opencv/4.5.2-r0/git/../no-found-on-file-system' not found, patchdir '../no-found-on-file-system' is incorrect in patch file '0001-sfm-link-with-Glog_LIBS.patch'

* When we can't aplly the patch but the patchdir exist,
  show the expanded patchdir on fatal error.
  patchdir=../git

ERROR: opencv-4.5.2-r0 do_patch: Applying patch '0001-sfm-link-with-Glog_LIBS.patch' on target directory '/build/tmp/work/core2-64-poky-linux/opencv/4.5.2-r0/git/../git'
Command Error: 'quilt --quiltrc /build/tmp/work/core2-64-poky-linux/opencv/4.5.2-r0/recipe-sysroot-native/etc/quiltrc push' exited with 0  Output:
stdout: Applying patch 0001-sfm-link-with-Glog_LIBS.patch
can't find file to patch at input line 37
Perhaps you used the wrong -p or --strip option?

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit c44bc7c0fb8b7c2e44dd93607a3bfd9733e1df80)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/patch.bbclass | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/classes/patch.bbclass b/meta/classes/patch.bbclass
index 25ec089ae1..484d27ac76 100644
--- a/meta/classes/patch.bbclass
+++ b/meta/classes/patch.bbclass
@@ -131,6 +131,9 @@ python patch_do_patch() {
             patchdir = parm["patchdir"]
             if not os.path.isabs(patchdir):
                 patchdir = os.path.join(s, patchdir)
+            if not os.path.isdir(patchdir):
+                bb.fatal("Target directory '%s' not found, patchdir '%s' is incorrect in patch file '%s'" %
+                    (patchdir, parm["patchdir"], parm['patchname']))
         else:
             patchdir = s
 
@@ -147,12 +150,12 @@ python patch_do_patch() {
             patchset.Import({"file":local, "strippath": parm['striplevel']}, True)
         except Exception as exc:
             bb.utils.remove(process_tmpdir, True)
-            bb.fatal(str(exc))
+            bb.fatal("Importing patch '%s' with striplevel '%s'\n%s" % (parm['patchname'], parm['striplevel'], str(exc)))
         try:
             resolver.Resolve()
         except bb.BBHandledException as e:
             bb.utils.remove(process_tmpdir, True)
-            bb.fatal(str(e))
+            bb.fatal("Applying patch '%s' on target directory '%s'\n%s" % (parm['patchname'], patchdir, str(e)))
 
     bb.utils.remove(process_tmpdir, True)
     del os.environ['TMPDIR']
-- 
2.25.1


