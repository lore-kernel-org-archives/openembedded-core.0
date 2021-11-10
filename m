Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70E4FC433EF
	for <webhook@archiver.kernel.org>; Wed, 10 Nov 2021 23:19:13 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web10.3284.1636586350597814791
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 15:19:12 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com
 header.s=axis-central1 header.b=nFDmtANI;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1636586351;
  x=1668122351;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=2mZbiAQIe2MubnXozEMkILcekYOJgCFlsv9sTxq1+qE=;
  b=nFDmtANIhqPR8HGHG/EwEC8sJ9UlMuFjW7FR4v5fQkIStQk8m9sEaVQm
   lOyTd4PJl+wq7YQC3Rhasbn++VSxf6c/zqpaO4TbB4ZgD2kWt87zAwSo5
   fjV61MBZwB8HQ3wakA11b28z3VkT0Wt+F8B6R4ijc3TzCx99dvONj1/Mo
   e/UXXAo+Bkek/gQFuYoMa3SUNvdlEbIKg+ByQFlMdnnPO86x2B1Vxp3U+
   INMwxo5xA3llNiBt6meEOx6XWZ3HYcBNIM5S0Zvy3nV6FV1n35YxcvRTo
   ILBMB2mFCEHwtU2VPdgl3M8WXs+RMTa0AhU3+Lv3TTv4zSZvgnLDhdxrp
   A==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 5/5] testsdk.py: Clean up the additions to PREMIRRORS and
 SSTATE_MIRRORS
Date: Thu, 11 Nov 2021 00:18:56 +0100
Message-ID: <20211110231856.5799-5-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20211110231856.5799-1-pkj@axis.com>
References: <20211110231856.5799-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Nov 2021 23:19:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158120

Since commit 044fb04d in bitbake (fetch2: Allow whitespace only mirror
entries) there is no need to separate the entries in PREMIRRORS and
SSTATE_MIRRORS with "\n".

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/lib/oeqa/sdkext/testsdk.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/sdkext/testsdk.py b/meta/lib/oeqa/sdkext/testsdk.py
index 6b564fa455..159f0d135b 100644
--- a/meta/lib/oeqa/sdkext/testsdk.py
+++ b/meta/lib/oeqa/sdkext/testsdk.py
@@ -67,10 +67,10 @@ class TestSDKExt(TestSDKBase):
             # and we don't spend hours downloading kernels for the kernel module test
             # Abuse auto.conf since local.conf would be overwritten by the SDK
             with open(os.path.join(sdk_dir, 'conf', 'auto.conf'), 'a+') as f:
-                f.write('SSTATE_MIRRORS += " \\n file://.* file://%s/PATH"\n' % test_data.get('SSTATE_DIR'))
+                f.write('SSTATE_MIRRORS += "file://.* file://%s/PATH"\n' % test_data.get('SSTATE_DIR'))
                 f.write('SOURCE_MIRROR_URL = "file://%s"\n' % test_data.get('DL_DIR'))
                 f.write('INHERIT += "own-mirrors"\n')
-                f.write('PREMIRRORS:prepend = " git://git.yoctoproject.org/.* git://%s/git2/git.yoctoproject.org.BASENAME \\n "\n' % test_data.get('DL_DIR'))
+                f.write('PREMIRRORS:prepend = "git://git.yoctoproject.org/.* git://%s/git2/git.yoctoproject.org.BASENAME "\n' % test_data.get('DL_DIR'))
 
             # We need to do this in case we have a minimal SDK
             subprocess.check_output(". %s > /dev/null; devtool sdk-install meta-extsdk-toolchain" % \

