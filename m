Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AB7EC433EF
	for <webhook@archiver.kernel.org>; Wed, 25 May 2022 16:41:37 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web08.9253.1653496890401167336
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 09:41:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=AneDMWm0;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id
 67-20020a1c1946000000b00397382b44f4so3690581wmz.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 09:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mxo8tYN0e9J4MyIaNT4xtwWgjGkpBN32WQyDIhYCBCw=;
        b=AneDMWm0RONlwqfitk3iXk0iM7hLiIjcFYdZ9G2B6oobIi3wNUg8IsxmbMbx4a89rQ
         dlfQGSkPuRzNxbFjp5PqrnoFPzmdQfmMvYejfs5s9CGuvPCEWLVz9mhz/pg4Ck0MGMpz
         k+v/A2qEcmu0+TknH+yD+EvwTORR43VJsRsQc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mxo8tYN0e9J4MyIaNT4xtwWgjGkpBN32WQyDIhYCBCw=;
        b=CWTW2CT641Af5FxIFDtB3+XRLr3fSTprxy4KNujMaqDdiB0OxxpT/Aj+SXPUiT1Ipe
         9ImCKX7Gak4ZFHY/wHDkizk7g6kUGhGE97/IE0JDf9ezkYmSNmYE5F6BeDTWwxhZuGH9
         MLmfrS/wX6UM4SW9fbs01aPp4CcmJBEjXohEtFltSovFFgQIB7GCxuqPHfkqBd4bWbEQ
         XqhoexN8kQgx114XhMsxqkiPEAFy6ikNDlwMUbt7hy5Dm5W+tEmBjFqI4BkYtizw7+1k
         jVLWl0WUo9Ndhi0iP1n7oPDlxWo/PVZR9+5r9icWG6cNX82fz/IF2bmGOOFDlN5qWNlv
         PtCA==
X-Gm-Message-State: AOAM5315yPvRldqJlh5llVIldtM6mv+/kH85/Fvgyy6tWuF/YZbchML2
	UpDe6HNZa98Ix91fTqueEVoPTGeH4kZoJVyS
X-Google-Smtp-Source: 
 ABdhPJxfv0JvZ7NzaiwcbJkavSB6r1V8+TZ3eWtMKs9nLQkrP9hYiilslAYx8/7iBDjoAfwYgW633w==
X-Received: by 2002:a05:600c:20e:b0:397:697f:172b with SMTP id
 14-20020a05600c020e00b00397697f172bmr4374140wmi.84.1653496888440;
        Wed, 25 May 2022 09:41:28 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:5808:e02b:90d6:3f52])
        by smtp.gmail.com with ESMTPSA id
 o4-20020a05600002c400b0020d0cdbf7eesm2588842wry.111.2022.05.25.09.41.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 May 2022 09:41:27 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] cve-extra-exclusions: Add kernel CVEs
Date: Wed, 25 May 2022 17:41:26 +0100
Message-Id: <20220525164126.358811-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 May 2022 16:41:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166154

For OE-Core our policy is to stay as close to the kernel stable releases
as we can. This should ensure the bulk of the major kernel CVEs are fixed
and we don't dive into each individual issue as the stable maintainers are
much more able to do that.

Rather than just ignore all kernel CVEs which is what we have been doing,
list the ones we ignore on this basis here, allowing new issues to be
visible. If anyone wishes to clean up CPE entries with NIST for these, we'd
welcome than and then entries can likely be removed from here.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../distro/include/cve-extra-exclusions.inc   | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/meta/conf/distro/include/cve-extra-exclusions.inc b/meta/conf/distro/include/cve-extra-exclusions.inc
index 6c19cd293ddf..2206d2284ca9 100644
--- a/meta/conf/distro/include/cve-extra-exclusions.inc
+++ b/meta/conf/distro/include/cve-extra-exclusions.inc
@@ -53,6 +53,43 @@ CVE-2015-4778 CVE-2015-4779 CVE-2015-4780 CVE-2015-4781 CVE-2015-4782 CVE-2015-4
 CVE-2015-4785 CVE-2015-4786 CVE-2015-4787 CVE-2015-4788 CVE-2015-4789 CVE-2015-4790 CVE-2016-0682 \
 CVE-2016-0689 CVE-2016-0692 CVE-2016-0694 CVE-2016-3418 CVE-2020-2981"
 
+
+#
+# Kernel CVEs, e.g. linux-yocto*
+#
+# For OE-Core our policy is to stay as close to the kernel stable releases as we can. This should
+# ensure the bulk of the major kernel CVEs are fixed and we don't dive into each individual issue
+# as the stable maintainers are much more able to do that.
+#
+# Rather than just ignore all kernel CVEs, list the ones we ignore on this basis here, allowing new
+# issues to be visible. If anyone wishes to clean up CPE entries with NIST for these, we'd
+# welcome than and then entries can likely be removed from here.
+#
+# 1999-2010
+CVE_CHECK_WHITELIST += "CVE-1999-0524 CVE-1999-0656 CVE-2006-2932 CVE-2007-2764 CVE-2007-4998 CVE-2008-2544 \
+                        CVE-2008-4609 CVE-2010-0298 CVE-2010-4563"
+# 2011-2017
+CVE_CHECK_WHITELIST += "CVE-2011-0640 CVE-2014-2648 CVE-2014-8171 CVE-2016-0774 CVE-2016-3695 CVE-2016-3699 \
+                        CVE-2017-1000255 CVE-2017-1000377 CVE-2017-5897 CVE-2017-6264"
+# 2018
+CVE_CHECK_WHITELIST += "CVE-2018-1000026 CVE-2018-10840 CVE-2018-10876 CVE-2018-10882 CVE-2018-10901 CVE-2018-10902 \
+                        CVE-2018-14625 CVE-2018-16880 CVE-2018-16884 CVE-2018-5873 CVE-2018-6559"
+# 2019
+CVE_CHECK_WHITELIST += "CVE-2019-10126 CVE-2019-14899 CVE-2019-18910 CVE-2019-3016 CVE-2019-3819 CVE-2019-3846 CVE-2019-3887"
+# 2020
+CVE_CHECK_WHITELIST += "CVE-2020-10732 CVE-2020-10742 CVE-2020-16119 CVE-2020-1749 CVE-2020-25672 CVE-2020-27820 CVE-2020-35501 CVE-2020-8834"
+# 2021
+CVE_CHECK_WHITELIST += "CVE-2021-20194 CVE-2021-20226 CVE-2021-20265 CVE-2021-3564 CVE-2021-3743 CVE-2021-3847 CVE-2021-4002 \
+                        CVE-2021-4090 CVE-2021-4095 CVE-2021-4197 CVE-2021-4202 CVE-2021-44879 CVE-2021-45402"
+# 2022
+CVE_CHECK_WHITELIST += "CVE-2022-0185 CVE-2022-0264 CVE-2022-0286 CVE-2022-0330 CVE-2022-0382 CVE-2022-0433 CVE-2022-0435 \
+                        CVE-2022-0492 CVE-2022-0494 CVE-2022-0500 CVE-2022-0516 CVE-2022-0617 CVE-2022-0742 CVE-2022-0854 \
+                        CVE-2022-0995 CVE-2022-0998 CVE-2022-1011 CVE-2022-1015 CVE-2022-1048 CVE-2022-1055 CVE-2022-1195 \
+                        CVE-2022-1353 CVE-2022-24122 CVE-2022-24448 CVE-2022-24958 CVE-2022-24959 CVE-2022-25258 CVE-2022-25265 \
+                        CVE-2022-25375 CVE-2022-26490 CVE-2022-26878 CVE-2022-26966 CVE-2022-27223 CVE-2022-27666 CVE-2022-27950 \
+                        CVE-2022-28356 CVE-2022-28388 CVE-2022-28389 CVE-2022-28390 CVE-2022-28796 CVE-2022-28893 CVE-2022-29156 \
+                        CVE-2022-29582 CVE-2022-29968"
+
 #### CPE update pending ####
 
 # groff:groff-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2000-0803
-- 
2.34.1


