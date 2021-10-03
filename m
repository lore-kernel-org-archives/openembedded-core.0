Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39A44C433F5
	for <webhook@archiver.kernel.org>; Sun,  3 Oct 2021 21:31:58 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.1197.1633296716776759538
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Oct 2021 14:31:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aMGm0uL5;
 spf=pass (domain: gmail.com, ip: 209.85.128.42,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id
 o4-20020a05600c510400b0030d55d6449fso4670165wms.5
        for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Oct 2021 14:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=L5dxvrP6n0FUkv+yY1GJ8vi+3NAmg28wDDBXT4QiZ3s=;
        b=aMGm0uL5zShhGJZIdtOKHOJscPjS+xw+HYqGAhz9NGvfPR9McdMnu/QdrdqmpydZJi
         R81PA0FETWutJjH/oWd0XSoHvX0mfr/nu9ijGbr7Ddc/vIDnSn+kDWXsxMrhPl07Ial7
         cd0vHj3H/hlP7dXq6/AZQi499oyw+JZunu9uQ+2VeqXlj8VO54u48JsFsbLx0jjOO6pw
         6qJZTqTMvCwJpkef+4M2oAF0ToXkJPscvTzGjVtpm/GfCqemJqD7GLUxO2vAqP1tGGu/
         /48yXfnhSJbnNYPhW5/V6eMpDyPXI9Hf82SDzpQ758QuwhtJ0GiWZT33iAaU70jQpJgr
         tXHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=L5dxvrP6n0FUkv+yY1GJ8vi+3NAmg28wDDBXT4QiZ3s=;
        b=KjB6MHaWyqrczL6xUDElTk9xEH9opos2gh0kj0AVv0LHO3Jwtgf+aMJhCYL7Y4wSEh
         sbXqcMVb0w2NjudiKUUGlhlFdDTAQS2QpWvNI8+zHP9f2mXsaPHEXtkDn8bqwQpQIN17
         /lBAt/JnQqLeutUwuadl0CDyxIf5wdKZjOaCLNHnAN4J6uC7YVTRMndJ06rRyVF97CTA
         tA+z1iG8PezaUBvRzhubawkzJgdgkDhlEKkEOicP2UQV/JWfDYB4K7Jk1MhXHg7gi0Sn
         KCu8hoZkQo71qy3ZgUMRmQcJn8D/fT4VOZeuGKFaqYffmBzyvYvs8ihDxEXe281Pixlk
         EhIA==
X-Gm-Message-State: AOAM532J+8/MOrTCqg5V2sL7JdP8iw7hEfl6tNsua0LWxiqqs06GrZY9
	6D8CjFw86wTMkCRoi+Q3I36x4gDFy3xXQQ==
X-Google-Smtp-Source: 
 ABdhPJwm0rLd1ottPbQaXr0iHw865x4K1EzUmbZADMI0F4XgzL5cjIglGwoC8vBynySG4muUG+h+Aw==
X-Received: by 2002:a7b:ce16:: with SMTP id m22mr15707134wmc.13.1633296714850;
        Sun, 03 Oct 2021 14:31:54 -0700 (PDT)
Received: from CTW-01195.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 a63sm13295390wme.18.2021.10.03.14.31.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Oct 2021 14:31:54 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH v5] patch.bbclass: when the patch fails show more info on the
 fatal error
Date: Sun,  3 Oct 2021 22:31:50 +0100
Message-Id: <20211003213150.933534-1-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 03 Oct 2021 21:31:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156560

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
---
 meta/classes/patch.bbclass | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/classes/patch.bbclass b/meta/classes/patch.bbclass
index 388773a237..87bcaf91a8 100644
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
2.33.0


