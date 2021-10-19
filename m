Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51212C433F5
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 19:54:33 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web09.15346.1634673272949556940
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 12:54:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=nnn7Xfhs;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id m26so912163pff.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 12:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=CjX3sNvpLH9naPFslmw33v36+i7CHSqrYVezWfXv2nk=;
        b=nnn7Xfhsx3sdzqFxja+5DUyvWFjGMh20bHnBtNFqdHx6zqEfP3P6NDVLR3zW4FVuWE
         yiemF+ls6OpJy6KuCvQVczu0qLJs6TyrsrHheAFWBx+VduZtltdphv4hjMaWAthxmZoQ
         6GgXAbM/LJsSTX+89Z1XWJP2ylPDbBmxDt+zU2ZNHED4hcQ5vADg4/BzsveTpREOrZTN
         ndBKxa8zf/OwieidPIJn3qZCWPMjB3kOHKjD0NAEKmq2dRSf3ioO9i2lzLo/lThhoHUt
         tEjjAoMiZhqLBUCrVKME4sYyDJ6WFViduqieNVdJLcDh4eLlFPvxxnettgbH3wm6xNsd
         Emlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CjX3sNvpLH9naPFslmw33v36+i7CHSqrYVezWfXv2nk=;
        b=dQ+Jphi7Fm97P7xwMihAYLK9p2V7j8H/GYU6RcH0eQKCnC40P4UmBStqi9o2trsWLP
         tH6WuZSS8IxjdRfSEbYwPCEMnT9fmq5HohqMc0vtBs4WVm7jCXjRrzQZXUcAgRtGWTYB
         eJ1F4XDat4hELlrRcGTMA4GSKBNtJzoPIU8MjruViymHMDTf82xqBeQs2CUobpemmTRB
         l6ymy9BGR16pwQtjufFYA5A+JE/TBuop3R7kSHLy9HfBs5b2uTklRHMtW8e9z7AqV81/
         owRrcbaHSaCMK+Zoy9VwqCcYuZaulg9uGqOXkrqn9mvmz6l7jqftf1qYr03U+fMFBiKn
         6jPQ==
X-Gm-Message-State: AOAM5319QRA2IDl92EIqr7W5/sMhwwn082xNO7xbpa1OrxM4BbWIDXw5
	pt3zjN8kirMxB5PPRrl3dApiY+oGGg1gTW/VMNU=
X-Google-Smtp-Source: 
 ABdhPJw0ElM8tDJoEL51Wr+cZ/lsf46VMxJpZzBNb/CIpjXglY8D6038ScBM47CFedMXPA7m8FQjZg==
X-Received: by 2002:a63:200a:: with SMTP id
 g10mr29430035pgg.242.1634673271860;
        Tue, 19 Oct 2021 12:54:31 -0700 (PDT)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id q14sm67104pfk.3.2021.10.19.12.54.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 12:54:31 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 11/38] scriptutils.py: Add check before deleting
 path
Date: Tue, 19 Oct 2021 09:53:22 -1000
Message-Id: 
 <a21d3d8f6da9fbb71f484343244cc3a63a346337.1634665675.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1634665675.git.steve@sakoman.com>
References: <cover.1634665675.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 19:54:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157216

From: Chandana kalluri <ckalluri@xilinx.com>

Add a check before deleting path when using recipetool commands to avoid the following type of errors:

Traceback (most recent call last):
   File "<workdir>/sources/core/scripts/lib/scriptutils.py", line 218, in fetch_url
    shutil.rmtree(path)
  File "/usr/local/lib/python3.7/shutil.py", line 476, in rmtree
    onerror(os.lstat, path, sys.exc_info())
  File "/usr/local/lib/python3.7/shutil.py", line 474, in rmtree
    orig_st = os.lstat(path)
FileNotFoundError: [Errno 2] No such file or directory: '<workdir>/build/tmp/work/recipetool-usg7o81n/work/recipe-sysroot'
ERROR: Command 'script -e -q -c "recipetool --color=always create --devtool -o /tmp/devtool5sq_op37 'file:///<SRCTREE>'  -x <workdir>/build/workspace/sources/devtoolsrcxc1b9zjq -N test" /dev/null' failed

Signed-off-by: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b6aa8b47e023004ffd6958d1cec18c2d9c95d77b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/scriptutils.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/scriptutils.py b/scripts/lib/scriptutils.py
index f92255d8dc..3164171eb2 100644
--- a/scripts/lib/scriptutils.py
+++ b/scripts/lib/scriptutils.py
@@ -215,7 +215,8 @@ def fetch_url(tinfoil, srcuri, srcrev, destdir, logger, preserve_tmp=False, mirr
                 pathvars = ['T', 'RECIPE_SYSROOT', 'RECIPE_SYSROOT_NATIVE']
                 for pathvar in pathvars:
                     path = rd.getVar(pathvar)
-                    shutil.rmtree(path)
+                    if os.path.exists(path):
+                        shutil.rmtree(path)
         finally:
             if fetchrecipe:
                 try:
-- 
2.25.1


