Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93565C0219B
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 00:36:53 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web10.40891.1739147803951377022
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Feb 2025 16:36:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mRpiA+8r;
 spf=pass (domain: gmail.com, ip: 209.85.222.176, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7c05c30e0aaso69511885a.3
        for <openembedded-core@lists.openembedded.org>; Sun, 09 Feb 2025 16:36:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739147803; x=1739752603; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I0n1d4524DR0+Z8121bXgsgNaLM0dk8qYXXm7/YEvtg=;
        b=mRpiA+8rQZMb3ny/WmB64WtmjTCjgXspGrQEK+/exelpgXLgIGyT00XZmVnzO+CaV+
         dib1kJw7XYCVNH5DU0YCPIM0pXg1RwzvNt1UekHXAB7/7NAzjNwGcbmTkt+G3h/G9BkD
         zv4oX5ALLMfJniHzypc/RmvD8T92BOXPweIuYiLUZLQW6A+DzEQm0EDAmb3pVMQUOZcf
         NHA6nVALDAELBEXdEmFTxKWL/BRqxkgm6Qkb/34aLwqG7I91Rc38F0+H932t5Wg9XL4v
         N8USG9FRU0QoZ5FhioOuZOcgfKyz+JfWMIgEgb73ylR0TZojCgSNiezeLnksw30XzESG
         pA7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739147803; x=1739752603;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I0n1d4524DR0+Z8121bXgsgNaLM0dk8qYXXm7/YEvtg=;
        b=J5+7HGwCieVi7gL+5zvXmXJT5VZptBaUuSVrpliqM2F6niYhwNwCIkeUOOEBhz5J4q
         G9r3ay1irZIY6U1cFdbbpAVofgXOeBLUz4d0OiZAEE1bEyhPFcg3tvpcKg9p5QAQ/teQ
         ALaZz6Zkt+qJhhuvijRlEIoVyPGCyeeiwksQos9gqcz/FsNaAdaAxlMFBMej3a/nNRVv
         87YhbKs6Mb/G4TlaVPqMP9gWItdKtSr4s7jUxb2f24XW2ky63Q8G1vfZCXAXzQ2twseB
         YA9KvHyCqnMpIfXmnPfpk3IoxuUeWwXfcH4M5QBV9owWPOot0cuHBFEbWTUU6oKeI5n6
         GrBQ==
X-Gm-Message-State: AOJu0YzJX8g5IjRz8DhEuimlsze87waRX3yFetwanP4LLcK694Qa/zqU
	WlvS0Qoa3+9z1R2LK+XWmJyfu3byxs0cPYygMNuXLwzTwDoNKUl7
X-Gm-Gg: ASbGncvS72YzhempccIprlYrXQpFojdO9LDRYw3/KOx/B3Oj2RF6pgA+q8BslliUMA+
	ytqB4zuP7fF6i8J+6nH307Y2eR+2Gn23zEcgHhm1Hb90bsphFnNdleUGWmlFjmCbI568lFQ8t6U
	+yKr3A4guzT+ulVtZEGUEWCQTj8k06u/MsTENU2UGQrvVz8HCyDEjBh6y0c52IXpKIjiuZqmFVm
	ETCtwyJ0E2AharrltY/BY5SgO/45C+iNlhZ8IyqKuVTu/EMRePONoftSgGMH7yFMgdFX8QAKm0Q
	+oBcSdC6HLOqpotp8IiNKLAVbubU3cxiCOXcrDGBbauZ4i2RtlRQg3nsjb/B8VGQiEhBCFpRttb
	MboTAPa27mPuyx5aX
X-Google-Smtp-Source: AGHT+IFGlR4glS8oqmnCph0kJiQ4q72WdjkF3e8Qcpjupqo2/UO9Q9y3ybOeVdQ3Wxel4yvudD2izA==
X-Received: by 2002:ad4:5caf:0:b0:6d8:a1fe:7293 with SMTP id 6a1803df08f44-6e44576b912mr190998116d6.42.1739147803000;
        Sun, 09 Feb 2025 16:36:43 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e454130846sm19176976d6.114.2025.02.09.16.36.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 16:36:42 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH][v2] poky-alt: switch preferred kernel to 6.12
Date: Sun,  9 Feb 2025 19:36:40 -0500
Message-Id: <20250210003640.67945-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Feb 2025 00:36:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211073

From: Bruce Ashfield <bruce.ashfield@gmail.com>

6.6 is being removed from the upcoming LTS release, so we
adjust the alt config to use the 6.12 reference.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---

v1 was missing the 2, in "12", but was working since the
wildcard happily matches 6.12 in the available kernels
in master.

We of course need to be more specific, so v2 fixes that up.

Bruce

 meta-poky/conf/distro/include/poky-distro-alt-test-config.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-poky/conf/distro/include/poky-distro-alt-test-config.inc b/meta-poky/conf/distro/include/poky-distro-alt-test-config.inc
index 3e10251e8b..da9199dcd4 100644
--- a/meta-poky/conf/distro/include/poky-distro-alt-test-config.inc
+++ b/meta-poky/conf/distro/include/poky-distro-alt-test-config.inc
@@ -2,7 +2,7 @@
 DISTRO_FEATURES:append = " pam usrmerge"
 
 # Use our alternate kernel version
-PREFERRED_VERSION_linux-yocto = "6.6%"
+PREFERRED_VERSION_linux-yocto = "6.12%"
 
 # Ensure the kernel nfs server is enabled
 KERNEL_FEATURES:append:pn-linux-yocto = " features/nfsd/nfsd-enable.scc"
-- 
2.39.2


