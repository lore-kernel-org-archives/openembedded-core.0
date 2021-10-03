Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8186DC433EF
	for <webhook@archiver.kernel.org>; Sun,  3 Oct 2021 11:14:47 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web09.21185.1633259686112508180
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Oct 2021 04:14:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=A6BAZDcv;
 spf=pass (domain: gmail.com, ip: 209.85.128.50,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id
 b136-20020a1c808e000000b0030d60716239so2652605wmd.4
        for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Oct 2021 04:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xeuQvXW4VfEW+Rv/g3mu2Kw2AasKJ0MPlgyDY4XtKAA=;
        b=A6BAZDcv4HGWtnhgqQBkFojMYwe+BLtfD7+TGhoinsx5I+EP7cpVZwVZOzqnFAqrZH
         YrqL4ET5dgy5HSQ47kIiarR0Klhkk2E4WoNIZmwBvPaRXQNJu/A6aSGSifDgr7qZJKvJ
         QTbIKkLeJ2CnNsYx747h04RbJQaD/nAnav7kg3r6pDcts7/okFoZqOrfF27xNZ7MuL/c
         ZOlRpFU0AT/L2ZcD/x8PDP6jMZCjS/tRrI/OxddFukKPooJWAJGiUbuisRKENueOT8XO
         l/PTx9DurFfn55V3HxO8M0DgI7sFxfcQmEupyYGZrHoX01ib7xh0pJIRbmn85Ub46G+d
         QSxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xeuQvXW4VfEW+Rv/g3mu2Kw2AasKJ0MPlgyDY4XtKAA=;
        b=ZozCMZt3O9ZqlQDRAkm/MSyIG2UWuIxHElPzxfhs94Oexzg/hSba8pkJDM+s4gmTUN
         n04tTvmkO/e/70kw/X4vAI1Yfmkfs/in0tFZqCZ7RR31Cch9WXjjnAdXdS8FIEl+7zjX
         2sQ8JmVCVjd/ciia7l4h4nD7wPFYJ8jfEsNxGxNsOw0DIGEUvkvt+3VZOnpG93lTWs40
         aPPdBaGQWt+H31PBpxa5c6nu0zmocVd2zZZOeRnVUgsdT9Nz2gihqmEIbxz6mkOJj7Sj
         jo5ZjR58HaBsGsejrVqxpitxlQd3anUBdJ6jm8mwR0rCNpUQgSNrqLmAmtDMIb1o19ma
         d/oQ==
X-Gm-Message-State: AOAM532frS0HAn2m1Kz3t1S8falHLQYHvsORU3WZfDIMiL76lG1fx96r
	BL/PHNG7+4xIZT0d2e12SG8xOlCJF7FOpA==
X-Google-Smtp-Source: 
 ABdhPJwktfg0eZAUzV1fQKfe+p+C+SvRFC8OcVAAe5DigmiOUycd8Jv42simHeRbbsfxe3RI7ekwQg==
X-Received: by 2002:a1c:a512:: with SMTP id
 o18mr13305420wme.162.1633259684307;
        Sun, 03 Oct 2021 04:14:44 -0700 (PDT)
Received: from localhost.localdomain (176.57.115.89.rev.vodafone.pt.
 [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 c7sm14179402wmq.13.2021.10.03.04.14.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Oct 2021 04:14:43 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: foss@0leil.net,
	Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH v4] patch.bbclass: when the patch fails show more info on the
 fatal error
Date: Sun,  3 Oct 2021 12:14:03 +0100
Message-Id: <20211003111403.334046-1-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 03 Oct 2021 11:14:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156549

There are situration when the user have the 'patchdir' defined
as a parameter on SRC_URI. However he doesn't know with this,
the patch is applied relatively to the receipe source dir 'S'.

When user have 'patchdir' defined check if this directory exist.
If the patch fails show addition info to the user:
 * Import: show the striplevel
 * Resolver: show the expanded 'patchdir' to the user.

On the next example, the patch is applied on ${WORKDIR}/contrib.

S = "${WORKDIR}/git"
SRCREV_FORMAT = "opencv_contrib"
SRC_URI = "git://github.com/opencv/opencv.git;name=opencv \
           git://github.com/opencv/opencv_contrib.git;destsuffix=contrib;name=contrib \
           file://0001-sfm-link-with-Glog_LIBS.patch;patchdir=../contrib \
           "

But if the user specifies a path on 'patchdir' that don't exist,
(patchdir=../no-found-on-file-system) the patch will fail and there
are no message that indicates the real cause.

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 meta/classes/patch.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/patch.bbclass b/meta/classes/patch.bbclass
index 388773a237..30753dc65b 100644
--- a/meta/classes/patch.bbclass
+++ b/meta/classes/patch.bbclass
@@ -131,6 +131,9 @@ python patch_do_patch() {
             patchdir = parm["patchdir"]
             if not os.path.isabs(patchdir):
                 patchdir = os.path.join(s, patchdir)
+            if not os.path.isdir(patchdir):
+                bb.fatal("Patch target source directory '%s' not found, 'patchdir' is incorrect in '%s'" %
+                    (patchdir, parm['patchname']))
         else:
             patchdir = s
 
@@ -147,11 +150,13 @@ python patch_do_patch() {
             patchset.Import({"file":local, "strippath": parm['striplevel']}, True)
         except Exception as exc:
             bb.utils.remove(process_tmpdir, True)
+            bb.fatal("Import patch '%s' with striplevel '%s'" % (parm['patchname'], parm['striplevel']))
             bb.fatal(str(exc))
         try:
             resolver.Resolve()
         except bb.BBHandledException as e:
             bb.utils.remove(process_tmpdir, True)
+            bb.fatal("Resolve patch '%s' on target directory '%s'" % (parm['patchname'], patchdir))
             bb.fatal(str(e))
 
     bb.utils.remove(process_tmpdir, True)
-- 
2.33.0


