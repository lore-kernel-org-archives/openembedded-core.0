Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A31FCC433F5
	for <webhook@archiver.kernel.org>; Thu,  6 Jan 2022 16:44:04 +0000 (UTC)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com
 [209.85.167.172])
 by mx.groups.io with SMTP id smtpd.web12.11112.1641487443235449114
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jan 2022 08:44:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Yd293YeU;
 spf=pass (domain: gmail.com, ip: 209.85.167.172,
 mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f172.google.com with SMTP id u21so4470393oie.10
        for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jan 2022 08:44:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hhhRpkNmpNaERfmNoo0KYq+Ut/RiGIxuiVMKArDU29g=;
        b=Yd293YeUjq9kcVba6+z8VLoJLzWOzxJZbY0BxMzlc6I0nqIN7qqbMou7wK69o6NJLH
         9jCBo67BmE3SZ1AkJvgphlubqojwu6hWnVR1/qAC8xkoZBUBw3GbBTxkaht4pUsai+PK
         prYkdqB+DA4yNDYFeJyEQ92KlDGI6DjmxIj95iUXWL29lLhk/ExSFwZBXVWORGVQd2dL
         iuoIOeU4XGmf8J3Tobkr1ltrZ8EsBObRmZ+5YnNLCJ6RZbY7BhDTXw5Mk1efrrPYpCQ2
         dM0Tjstf50dNkfAe349/yPo4M5h2n5cBQJ+kpiiG3kkbRXqwM124T7WzpQn13bJd4M6R
         7C2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hhhRpkNmpNaERfmNoo0KYq+Ut/RiGIxuiVMKArDU29g=;
        b=LL6xl8giZhhRMyEocW0qkff0hic1PKCmrnf5DD35FP6nT9C8wp4PHcVEBAz+yA6ENB
         aGWxGiCFThI7qPjSSbu3o7gbVl6zF0bMjNmrNkQtsesFFctS5ziFlaN7ROoppSbUwXoI
         hKWTY4s+N0Btom489WwEgup5SE1OHRfy3hR9J2xZmhKNigh//4FpQRYFsnxHvBvBBtyL
         rWup16H3XYCVH+rbNN1PIlLq6VHckIW6Iq7RkX9HcLpg7DYuY140Se7BDCGNk6EQ4I4Z
         OBRKp8deqoVkCM7uWkMk6h6EMBlb8MSabh9H2qooS8mmbTGri9fKjlv+knGox5Jh6d29
         UQmQ==
X-Gm-Message-State: AOAM531veYMUAnEAH/m2lwT1crbfOzPtrI/qNQtxNkWm2wjUdyfmXIFx
	CRILm3cyurjs7rnYOk1URodnWwxOG1M=
X-Google-Smtp-Source: 
 ABdhPJxnNS5fq/HURH5Te01vvfmUWwnNRhlkUF54Ed24481DQfa1XUARlLepJAY1Jdthb9eI7K4JkA==
X-Received: by 2002:a05:6808:1996:: with SMTP id
 bj22mr6988094oib.165.1641487442294;
        Thu, 06 Jan 2022 08:44:02 -0800 (PST)
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id
 k20sm429205otb.50.2022.01.06.08.44.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jan 2022 08:44:01 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] selftest: reproducible: Set maximum report size
Date: Thu,  6 Jan 2022 10:42:36 -0600
Message-Id: <20220106164236.599621-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jan 2022 16:44:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160237

Diffoscope can end up running for a very long time if there are a lot of
changes. To put a limit on how long it can run, cap the maximum report
size at 250 MB by default.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oeqa/selftest/cases/reproducible.py | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index 2e983d2f17..324b43d454 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -118,8 +118,9 @@ def compare_file(reference, test, diffutils_sysroot):
     result.status = SAME
     return result
 
-def run_diffoscope(a_dir, b_dir, html_dir, **kwargs):
-    return runCmd(['diffoscope', '--no-default-limits', '--exclude-directory-metadata', 'yes', '--html-dir', html_dir, a_dir, b_dir],
+def run_diffoscope(a_dir, b_dir, html_dir, max_report_size=0, **kwargs):
+    return runCmd(['diffoscope', '--no-default-limits', '--max-report-size', str(max_report_size),
+                   '--exclude-directory-metadata', 'yes', '--html-dir', html_dir, a_dir, b_dir],
                 **kwargs)
 
 class DiffoscopeTests(OESelftestTestCase):
@@ -149,6 +150,9 @@ class ReproducibleTests(OESelftestTestCase):
 
     package_classes = ['deb', 'ipk', 'rpm']
 
+    # Maximum report size, in bytes
+    max_report_size = 250 * 1024 * 1024
+
     # targets are the things we want to test the reproducibility of
     targets = ['core-image-minimal', 'core-image-sato', 'core-image-full-cmdline', 'core-image-weston', 'world']
     # sstate targets are things to pull from sstate to potentially cut build/debugging time
@@ -324,7 +328,7 @@ class ReproducibleTests(OESelftestTestCase):
                 # Copy jquery to improve the diffoscope output usability
                 self.copy_file(os.path.join(jquery_sysroot, 'usr/share/javascript/jquery/jquery.min.js'), os.path.join(package_html_dir, 'jquery.js'))
 
-                run_diffoscope('reproducibleA', 'reproducibleB', package_html_dir,
+                run_diffoscope('reproducibleA', 'reproducibleB', package_html_dir, max_report_size=self.max_report_size,
                         native_sysroot=diffoscope_sysroot, ignore_status=True, cwd=package_dir)
 
         if fails:
-- 
2.33.0


