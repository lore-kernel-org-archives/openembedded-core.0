Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE92AE77172
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 06:50:01 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.8193.1733295001135606984
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Dec 2024 22:50:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iIs0/b60;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-434aa472617so52668865e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 22:50:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733294999; x=1733899799; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6rno7XhMkTjDuHVhu7GxVb3UosiQ1XpYnsLogZDJ60g=;
        b=iIs0/b60vEOkNRt3Zz7hmUQXtLLuynMtnR42L9au4H/s4fSG/dIQO3ZQjMGj7hIXKc
         3tqYtCyFL/Fss49jWIaShBKVNwNq73+V0cInxw1WzmcFNMmC5riOIUkRhQ/P4Lp4wWxl
         IQJb5oUJwht+i+GFPprO0xEyhAZ1ApFuX8b63/3jDdWZ/SfL3mqn5Wipoe5hUapS3eaM
         z4XLEeaMcrc6CDtI+waZzl/t17WhDiX0H+eOnvHEklpKr2a6/B1/V+TKbwaujt901r6V
         gwOdNzuSP0l4YED6bBZlXXUBgAskfIsXLq5ZAt2IalIjnS6J7IxCGjvywD7WRf2gfRp0
         iDWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733294999; x=1733899799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6rno7XhMkTjDuHVhu7GxVb3UosiQ1XpYnsLogZDJ60g=;
        b=Aa+dqDnBUFa6AhDCOotgBFTJzQAjUaLDDi+sMjboPmvPILrx1mK3eo28GdvlXxInlF
         4doOgAM2VW/+NNlhqv1O8S6Vjqb9/x4W3CTB0SJL28hVps5sCgk7XJ2h5Qx1pPeQw718
         SCp24c0fP3bB5Jd/rBexPSj9KGza0fNbx+5Zdvnvq0wphsN1iGQFQwFr9TUuCF6MvBF2
         kqB0EN/rbBWXdNBFe7ZAnZzh6C4UT35QHkX1dhldDW+MgDEOYNJgvCZzpdfxtBNY54Gc
         O0b62RI4pMwhch4uA9o/XRsAnrJTyF5om+9Rqt4d3iE7i50zkB1q0hUI8Yjs/jyhGxmM
         ZrKQ==
X-Gm-Message-State: AOJu0Yww3NBd1AcFmIcasgWjxIDOI61ztCsZIHa9VUEcLfwhwMCntKW2
	tUF4AiufygYldFKo+eZ9Fk8CZ2i/jJRolbFmosLutQGgqBgYduolmAZp+g==
X-Gm-Gg: ASbGncvyfiJULJpjkv5qLk8T4zrtI2zmzspbzCHHpdhUPrCSpmVuk+93HsDZHjZeghk
	ocgdfwDwjki1yMkn90XFWHrS+yLVCcMjmwN+5qP5v6alvyctyW3OWhGnEdcgs1jbKZHIG3fAPxo
	P1Ib7CVIObcLgM6UR5ZeBAM12VubArti2j6YMxpugHlosxkP0Ww6uBS6GtYvbcI4scToocRYbKC
	SPLX+YsUQbn1HjWFI1hK0AjWJ/LpO+htt3U+EHJA/Qjc50XSuKvZ+Ufvlhd/X/0TQIdZMlqVyAN
	yg9bjGPqafQ=
X-Google-Smtp-Source: AGHT+IFkA+DGLIDZdcaUT7uhZ424eDDHraNx3x/z92aegREZTbwIGuBGsZhm5WTbDhU4QMQvGOXxZQ==
X-Received: by 2002:a05:600c:5118:b0:434:a4a6:51f8 with SMTP id 5b1f17b1804b1-434d09051fbmr48680965e9.0.1733294999315;
        Tue, 03 Dec 2024 22:49:59 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385f343f293sm7435757f8f.36.2024.12.03.22.49.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 22:49:58 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 30/37] libpipeline: update 1.5.7 -> 1.5.8
Date: Wed,  4 Dec 2024 07:49:13 +0100
Message-Id: <20241204064920.817016-30-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241204064920.817016-1-alex.kanavin@gmail.com>
References: <20241204064920.817016-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 06:50:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208259

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../libpipeline/autoconf-2.73.patch           | 24 -------------------
 ...pipeline_1.5.7.bb => libpipeline_1.5.8.bb} |  3 +--
 2 files changed, 1 insertion(+), 26 deletions(-)
 delete mode 100644 meta/recipes-extended/libpipeline/libpipeline/autoconf-2.73.patch
 rename meta/recipes-extended/libpipeline/{libpipeline_1.5.7.bb => libpipeline_1.5.8.bb} (79%)

diff --git a/meta/recipes-extended/libpipeline/libpipeline/autoconf-2.73.patch b/meta/recipes-extended/libpipeline/libpipeline/autoconf-2.73.patch
deleted file mode 100644
index e61e5aa869e..00000000000
--- a/meta/recipes-extended/libpipeline/libpipeline/autoconf-2.73.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-The gnulib largefile macro needs updating to work with autoconf 2.73. Rather
-than the full code:
-
-https://git.savannah.gnu.org/cgit/gnulib.git/commit/m4/largefile.m4?id=f91f633858cf132e50924224c50d6264a92caabb
-
-Just tweak the exiting code to work with 2.73. The next libpipeline upgrade should
-update to new gnulib
-
-Upstream-Status: Inappropriate
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-
-Index: findutils-4.9.0/gl/m4/largefile.m4
-===================================================================
---- findutils-4.9.0.orig/gl/m4/largefile.m4
-+++ findutils-4.9.0/gl/m4/largefile.m4
-@@ -26,7 +26,7 @@ AC_DEFUN([gl_SET_LARGEFILE_SOURCE],
- # with _TIME_BITS.  Also, work around a problem in autoconf <= 2.69:
- # AC_SYS_LARGEFILE does not configure for large inodes on Mac OS X 10.5,
- # or configures them incorrectly in some cases.
--m4_version_prereq([2.70], [], [
-+m4_version_prereq([2.73], [], [
- 
- # _AC_SYS_LARGEFILE_TEST_INCLUDES
- # -------------------------------
diff --git a/meta/recipes-extended/libpipeline/libpipeline_1.5.7.bb b/meta/recipes-extended/libpipeline/libpipeline_1.5.8.bb
similarity index 79%
rename from meta/recipes-extended/libpipeline/libpipeline_1.5.7.bb
rename to meta/recipes-extended/libpipeline/libpipeline_1.5.8.bb
index 7e3f13ebde0..bd3f40ab822 100644
--- a/meta/recipes-extended/libpipeline/libpipeline_1.5.7.bb
+++ b/meta/recipes-extended/libpipeline/libpipeline_1.5.8.bb
@@ -7,8 +7,7 @@ LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464"
 
 SRC_URI = "${SAVANNAH_GNU_MIRROR}/libpipeline/libpipeline-${PV}.tar.gz"
-SRC_URI += "file://autoconf-2.73.patch"
-SRC_URI[sha256sum] = "b8b45194989022a79ec1317f64a2a75b1551b2a55bea06f67704cb2a2e4690b0"
+SRC_URI[sha256sum] = "1b1203ca152ccd63983c3f2112f7fe6fa5afd453218ede5153d1b31e11bb8405"
 
 inherit pkgconfig autotools
 
-- 
2.39.5


