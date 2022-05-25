Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62770C433EF
	for <webhook@archiver.kernel.org>; Wed, 25 May 2022 16:49:17 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web08.9350.1653497356107929559
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 09:49:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SmHxlTF3;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id z15so7098107wrg.11
        for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 09:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qBE4ogaqFZE1lHzReagimHFv52v80y/Vk2PogxPfRiI=;
        b=SmHxlTF3I1RCmzbNbWEnnkoGs+OayqdV91hZ50VnxjP8NBXEG1jRxy0pUF+jgrORb9
         8teLn6TTbXzKd2dYCqvZRmdQB65MEa1r8jvKZe7bmEL09x4LSAlY3uWe7nM3s1DK1MmB
         Ec/qYhlF3HDpI2J3KBWARLG6ziDgvq5u7yEus=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qBE4ogaqFZE1lHzReagimHFv52v80y/Vk2PogxPfRiI=;
        b=UtsMVuvNttJfAbtFfS++ibSVV0PjI2vm+L1r7m6iNvKEbkTzhHXOd3kwxdOXq9/H3I
         WnmK2ZV9FWGK+KfoivTz169+THgn8e/jo7CwD9dWfQwtG1Vdz+dUi+wFu7/Wi95iH5mZ
         OOed6mBiMzPbkSND9gNqaNy/vOKM8cEo8kkOT3SUCpF/liU0cw276QjI3XuI8QnHd4Qm
         s60wT+JTpMzWeGpjRUtsnp0xCkFBTyCwbEjwuissYEQ0YwCG/U0QMpwsXs4veKPl3N2g
         0G+ijhDcqyUhUHAIA3Jf1KePg+zZ4a1EQcdfkFXO+QimBxydpJOQxU4NpXcSGvV+0RUV
         KFEA==
X-Gm-Message-State: AOAM5325aa5sSEtN8FUSgDmiQeuvDqj6vAFAdi1/YoE6f41LPNyqRfU7
	APRrYE/SNEmlLLvRATZyjceluXIvFsJAa6Yy
X-Google-Smtp-Source: 
 ABdhPJwxGjtf6jCD48Xbagh6v4Ua17GEPmTgII7AuoEM5d39W1tTQb//5E4XGc269ZA7B599Bhxi/Q==
X-Received: by 2002:a5d:654b:0:b0:20d:e3e:7945 with SMTP id
 z11-20020a5d654b000000b0020d0e3e7945mr29446782wrv.113.1653497353829;
        Wed, 25 May 2022 09:49:13 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:5808:e02b:90d6:3f52])
        by smtp.gmail.com with ESMTPSA id
 az19-20020a05600c601300b003973c54bd69sm2310828wmb.1.2022.05.25.09.49.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 May 2022 09:49:13 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] cve-extra-exclusions: Add kernel CVEs
Date: Wed, 25 May 2022 17:49:12 +0100
Message-Id: <20220525164912.359426-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 May 2022 16:49:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166155

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
index 6c19cd293ddf..993ee2811a3d 100644
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
+CVE_CHECK_IGNORE += "CVE-1999-0524 CVE-1999-0656 CVE-2006-2932 CVE-2007-2764 CVE-2007-4998 CVE-2008-2544 \
+                     CVE-2008-4609 CVE-2010-0298 CVE-2010-4563"
+# 2011-2017
+CVE_CHECK_IGNORE += "CVE-2011-0640 CVE-2014-2648 CVE-2014-8171 CVE-2016-0774 CVE-2016-3695 CVE-2016-3699 \
+                     CVE-2017-1000255 CVE-2017-1000377 CVE-2017-5897 CVE-2017-6264"
+# 2018
+CVE_CHECK_IGNORE += "CVE-2018-1000026 CVE-2018-10840 CVE-2018-10876 CVE-2018-10882 CVE-2018-10901 CVE-2018-10902 \
+                     CVE-2018-14625 CVE-2018-16880 CVE-2018-16884 CVE-2018-5873 CVE-2018-6559"
+# 2019
+CVE_CHECK_IGNORE += "CVE-2019-10126 CVE-2019-14899 CVE-2019-18910 CVE-2019-3016 CVE-2019-3819 CVE-2019-3846 CVE-2019-3887"
+# 2020
+CVE_CHECK_IGNORE += "CVE-2020-10732 CVE-2020-10742 CVE-2020-16119 CVE-2020-1749 CVE-2020-25672 CVE-2020-27820 CVE-2020-35501 CVE-2020-8834"
+# 2021
+CVE_CHECK_IGNORE += "CVE-2021-20194 CVE-2021-20226 CVE-2021-20265 CVE-2021-3564 CVE-2021-3743 CVE-2021-3847 CVE-2021-4002 \
+                     CVE-2021-4090 CVE-2021-4095 CVE-2021-4197 CVE-2021-4202 CVE-2021-44879 CVE-2021-45402"
+# 2022
+CVE_CHECK_IGNORE += "CVE-2022-0185 CVE-2022-0264 CVE-2022-0286 CVE-2022-0330 CVE-2022-0382 CVE-2022-0433 CVE-2022-0435 \
+                     CVE-2022-0492 CVE-2022-0494 CVE-2022-0500 CVE-2022-0516 CVE-2022-0617 CVE-2022-0742 CVE-2022-0854 \
+                     CVE-2022-0995 CVE-2022-0998 CVE-2022-1011 CVE-2022-1015 CVE-2022-1048 CVE-2022-1055 CVE-2022-1195 \
+                     CVE-2022-1353 CVE-2022-24122 CVE-2022-24448 CVE-2022-24958 CVE-2022-24959 CVE-2022-25258 CVE-2022-25265 \
+                     CVE-2022-25375 CVE-2022-26490 CVE-2022-26878 CVE-2022-26966 CVE-2022-27223 CVE-2022-27666 CVE-2022-27950 \
+                     CVE-2022-28356 CVE-2022-28388 CVE-2022-28389 CVE-2022-28390 CVE-2022-28796 CVE-2022-28893 CVE-2022-29156 \
+                     CVE-2022-29582 CVE-2022-29968"
+
 #### CPE update pending ####
 
 # groff:groff-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2000-0803
-- 
2.34.1


