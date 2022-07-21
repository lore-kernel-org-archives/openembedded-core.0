Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C41DC433EF
	for <webhook@archiver.kernel.org>; Thu, 21 Jul 2022 09:39:34 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.4401.1658396371029839818
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Jul 2022 02:39:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=J/IGyX4I;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id z13so1396559wro.13
        for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Jul 2022 02:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Sn50UCfA4g2cYvFHO3WVf5ucEO99JR/N7JzFZSuMX1A=;
        b=J/IGyX4IP6lZNuBFLcF0lHBVlSqiWqcW/3I3zrkUHR15XlOTUOkUbCUBOCDgwTkubB
         MEo9aw135WFPgfMFWjc406KNTzeUqaQTVfRybjTU3VURqz9fX6dYWey5RiJRxjoMKocZ
         /1G4Xt0TbOO6wmPrMqlxuUDgMO7eEc/6IVDSM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Sn50UCfA4g2cYvFHO3WVf5ucEO99JR/N7JzFZSuMX1A=;
        b=O2KBLnHiSiDHd97XByIaLWvJDg44OjyFINitrqGEVDX37GHFLlLKqAgyHW6HE1cjPR
         DYm5O63k+0HXGpkjyDCsWyw6I7yvhxFe+P9w1BEZe/ytTJRlhP/0jrZLNmx7RMsqMR6h
         zw6KlTXtUuLBVS/k69nUZ0YBZK1oJnV2LOCwBHoZr52mpLpQbnNZG0SxnveEUkzI1+P5
         icipvFiNFBX+n3GJOfaA8KQYu2vLiypOVioA2d48b7j7EWGuQqFqYUR9d5d6kZJYNx17
         WUbCDFvEG+wQ/fjfk45SOqQPcmbEXuWj8F7qQrgcBcq3wRMhyFKEdRT9e9W+E89N7BuD
         ccHA==
X-Gm-Message-State: AJIora8pn3MWlIvsD9KDlIfu2MNqFZP4SB2zCoVXn+rw5dZwPuH62+Iw
	SvLubgUJ4gFEtefv4jcjzuwRiG5CTkMybg==
X-Google-Smtp-Source: 
 AGRyM1t0XzJ2fevLbUDpa1bLnTbtXSX/PPZj+nrMFfDxD1lpDmAB41zu+211VDvsL3K0RL/xOcHZEA==
X-Received: by 2002:adf:e283:0:b0:21e:26fe:14f3 with SMTP id
 v3-20020adfe283000000b0021e26fe14f3mr12987439wri.98.1658396367650;
        Thu, 21 Jul 2022 02:39:27 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:cb8c:809a:61d7:956])
        by smtp.gmail.com with ESMTPSA id
 b17-20020a5d40d1000000b0021d6dad334bsm1391882wrq.4.2022.07.21.02.39.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jul 2022 02:39:26 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] base/reproducible: Change Source Date Epoch generation
 methods
Date: Thu, 21 Jul 2022 10:39:26 +0100
Message-Id: <20220721093926.1489066-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Jul 2022 09:39:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168384

In bc, we found that there are files newer than Changelog (e.g. scan.l)
which means after install runs, the timestamp is clamped to SDE which means
"bitbake bc -C compile" would then try and regenerate generated files and
complain flex was missing.

Rather than assuming Changelog/NEWS are magic for dates, drop that scan
method and scan all unpacked files. This shouldn't be that slow as they'd
be in the disk cache already after an unpack.

For bc, this changes SDE by about two minutes and avoids the problems
rebuilding.

Add a version comment to the task definition as changes in python library
code won't trigger a rebuild and we need one here.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/base.bbclass   | 1 +
 meta/lib/oe/reproducible.py | 1 -
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index cc02de5f77e..571b6754f22 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -209,6 +209,7 @@ addtask do_deploy_source_date_epoch_setscene
 addtask do_deploy_source_date_epoch before do_configure after do_patch
 
 python create_source_date_epoch_stamp() {
+    # Version: 1
     source_date_epoch = oe.reproducible.get_source_date_epoch(d, d.getVar('S'))
     oe.reproducible.epochfile_write(source_date_epoch, d.getVar('SDE_FILE'), d)
 }
diff --git a/meta/lib/oe/reproducible.py b/meta/lib/oe/reproducible.py
index 35b8be6d084..2e815df1907 100644
--- a/meta/lib/oe/reproducible.py
+++ b/meta/lib/oe/reproducible.py
@@ -152,7 +152,6 @@ def fixed_source_date_epoch(d):
 def get_source_date_epoch(d, sourcedir):
     return (
         get_source_date_epoch_from_git(d, sourcedir) or
-        get_source_date_epoch_from_known_files(d, sourcedir) or
         get_source_date_epoch_from_youngest_file(d, sourcedir) or
         fixed_source_date_epoch(d)       # Last resort
     )
-- 
2.34.1


