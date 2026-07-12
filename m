Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25052C43458
	for <webhook@archiver.kernel.org>; Sun, 12 Jul 2026 05:51:27 +0000 (UTC)
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9333.1783835485384034461
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Jul 2026 22:51:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=JLa86XZb;
 spf=pass (domain: underview.tech, ip: 74.125.224.47, mailfrom: vince@underview.tech)
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-6676fc59e59so3241343d50.2
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Jul 2026 22:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1783835484; x=1784440284; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uaMxh+dzg/un/hLHsZMvIvCzNPtruP2sUzJDFNNdd4s=;
        b=JLa86XZb5nakcsEpoHX/5qxmTq6ybYqIkuW/JXuJZEolvgA60wEoDWbqAA+zsd2pYH
         lkxH2Q6PX7jFkc6VKjOuAClAyDPv8CK7pvsVbhbK9N1Pd/I+6ZdbBX4QPr4/X3wt1C8Q
         /1stsepPJEW4v042n+xz8LRl5xRdqvxnqE/o79K5xWHEWvFo297PJGZpKBDX4+g+2kfz
         DZzL2lydwsc/CD7KvVaLi1H04BHpoJ19FOKidIdviez2MBzSc/Ws2XtxzUh88UVqjJ4/
         uPSKxphqBzGxR6HHJA09pbJDpxiwgAhu9Nl82I2MGNp/WJEeDdEqHCA7bm8/nSrbPaWv
         QVHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783835484; x=1784440284;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uaMxh+dzg/un/hLHsZMvIvCzNPtruP2sUzJDFNNdd4s=;
        b=fSyqE48cUxOIFr3O/Q1YIDquTeUzQBdJC8tiVlJ6YEOBfLUxETjFTOSX5NVNrf0Opu
         4f+31TbyKBBO/kVrjcwDFPNOTFg/75jCMhQzP9KUrT6pAgcoQ9jojYAy1LHC7rotU0ys
         w0ObVc0tiB37zQVn7YW1ugZgm1c3Un43vjTOuOKlkXtQ62p6dNuZCI3EaX7ia+a3DgR/
         Rg5K5FHFdxGraFah0vMPSFjoyzWtwhDSsEvV8AY4nshomAwD0RoVtLtywwxDcgplHBz7
         w27Ak7X79ueNH+eE8IG8DQxqkynsoBQ9WHx1ytq3I4zrak8UkZz5pi4i6j2OjToVaxcV
         Lk7g==
X-Gm-Message-State: AOJu0YwxBNj3/6yqCI/b9mkd62fzaFSCp0kHAkm5aLKN+162ClTaSgND
	nNhbn+84kn6i7PaXAmP2uHFcVmKV59yKAmGwIaNsjnWiM6TgW7WQT55t93f1TNRqGc/K3oWnASf
	/v5ZB2dk=
X-Gm-Gg: AfdE7cnY1v/ntH5fwDyexIfYEzM6886hgemD36egjYELnyqF4NOXN+xzAMIZW4DeCeW
	ojd+V2oZn3JEaSZx2DUGjKiRm3WpSJaG4ChHEPR7Pcs04JtE+6UUoeM3+rrNcS0e3o5aeiFnY9x
	w33CoPbtxbrHdwrHXrh/0VzfN3tdsdelev5TZ5ZZBhUT87erhsqtnFaa8CMnC9chUbvfBX6G0WM
	K3KYc7PO0wULygWv8pbxCFFie2I7BeSCeZBYbHoi0j3UQt84tQAP5wxIX1nuMnNvM1E6wa0S1uV
	i/dEr6IXVCmDGBO61fH4T/NlW7YTQW6u//bF1IvpwwRMMv8fuCwNuAYXRMq861BqFBM/6rM6OPe
	y5Za42jYP+h3LU5eyam/ils/CpD+y1xcSfpVwFEsDyfz3UnWuD3u0I2RBuFKjs9CAkxpEeVRNv3
	/SdkAGhI+zW+IsXVlsk0QgdMPR
X-Received: by 2002:a05:690e:120d:b0:664:ae6d:ad2f with SMTP id 956f58d0204a3-667d7bd167fmr3388327d50.73.1783835484311;
        Sat, 11 Jul 2026 22:51:24 -0700 (PDT)
Received: from vince-server.attlocal.net ([2600:1700:b540:3af0::42])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6678779e37fsm10764901d50.5.2026.07.11.22.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 22:51:23 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH v2 01/26] bitbake: globally define KERNEL_PACKAGE_NAME
Date: Sun, 12 Jul 2026 01:49:29 -0400
Message-ID: <20260712054954.4063745-1-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 05:51:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240726

A number of recipes rely on hard coded
kernel prefix set by KERNEL_PACKAGE_NAME
when including modules. This leads to build
time failures such as.

ERROR: Nothing RPROVIDES 'kernel-module-*'

Commit globally defines variable so that
recipes aren't reliant on hardcoded 'kernel'
prefix.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 meta/conf/bitbake.conf | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index bdf37d0da2..f06f97a8ee 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -493,6 +493,9 @@ KERNEL_SRC_PATH = "/usr/src/kernel"
 STAGING_KERNEL_DIR = "${TMPDIR}/work-shared/${MACHINE}/kernel-source"
 STAGING_KERNEL_BUILDDIR = "${TMPDIR}/work-shared/${MACHINE}/kernel-build-artifacts"
 
+# Globally define base string for kernel packages
+KERNEL_PACKAGE_NAME ??= "kernel"
+
 ##################################################################
 # Specific image creation and rootfs population info.
 ##################################################################
-- 
2.43.0


