Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 816EACA0FED
	for <webhook@archiver.kernel.org>; Fri,  5 Sep 2025 16:09:39 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web10.548.1757088574151853118
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Sep 2025 09:09:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GbN8hSuL;
 spf=pass (domain: gmail.com, ip: 209.85.222.171, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-810e642c0bbso123731185a.3
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Sep 2025 09:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757088573; x=1757693373; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SNVckkuakCzzwZ1gfpZgzALSFwwWnZba5qmB+DqV6oQ=;
        b=GbN8hSuLpfTr1hJo9e1Fh83AN+SSWLQZM6WCs6J2o6a3YIFOiVQDUfULs2jLDYoyvD
         kuBIuMxaVE/BwwLIUacUrFKj1cbFSd7c4ikD5sbRATqnfCIvBi+PaU2Xme6EU54SbsD2
         E+lFn2ZLDywCdRM0OMlJEpQ4NVof5nLA3bRMfpYOa6nBZ+Vx51Efein2N1d1ekfTEInV
         VWy0V7i0KIoPShENnI43bgkzWps2owwXedgV6o1s/Ns5JqhpKSypMDBlDjHpyGOfJaVi
         K6OPIxuc3lYgE4cCTW3T/fKB4kaz3C9EyycXu0mjdqnXg/UGyznnRec2y1uRKb1dT3YH
         Nr8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757088573; x=1757693373;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SNVckkuakCzzwZ1gfpZgzALSFwwWnZba5qmB+DqV6oQ=;
        b=pqsR0ft1T5zghNWqmwE+/cnwMrycIy1wSpahWymJhQCqlewdqpRR8pFY/HV+PQTNMp
         h9kOP2g3G2V05LNIeCU+N22Eu7zx8lUMjSZaKnwTbkxY0EfdxBYszmLwaZwjjTY3m5tQ
         LQUu0Q82w7wZEbLG3bx0j0MF9g+N1qrMDDQ+3DiAc2kqisQ+VP49DYpQsuHPFZy3hqJE
         jUvJhemcncXazCJJkpQeGPxQfJUOsE9Q9Evr+truWXE4Y6zhkAL3/eveNsWxOLsw6v/O
         V0fqrNGsF5Sk9xM8I6j1utILHjXbmQiF9NoIf4AP+kSkrmS7UlnNiVXZUSkv7wjDzAyv
         s4bw==
X-Gm-Message-State: AOJu0YzJJ+tjHB5BtqYXfoQtNLc7CZ+TbBmu0T94cSMhsFTxaRSbyNGT
	vrrlO6ll2dGWYi8PfFLbxK3UCNcQFfACU1o0fb4itBRQ6WHvchSaXFzpK/ObmOht
X-Gm-Gg: ASbGncvF8BSj8scz6lctvZBwtHj5/orm7ccF0WUb536TsGfaH9FcF//BeY/vkkqFMdF
	P/4ntwRvUkF84Sv31bYObhctnO/N6sXwl2pBPlpjM6P7gSk2arU/4akJ9S3ccs6PjrGFrrxUuWM
	QmMYwmXb+6nCi52psmH/kyGc31vbUXk7Xhb0CN4nTZYokGSCYjMeM9E8kB8rXm6DpoHc60htwvC
	bsMhOiul+/pp+BA56Xl41/aEoeuT/Qhsg3JdmPKh59YWb0cWatDZJnEuaCJp0KYNIFiXlF02mpT
	Z3JcT5lG1X40yxluip2oBZL4nfXENmLf8XwPd/6zJ0ezHcVnufOTbwqYtAziV7OopN4RiXZ8kdd
	FCGZtvqW+oeLtZugREd4PbKdYTEw2+XlxyY1+vS1nez7ap/zB6xKfkHHQKsY85giAyvaSJ+kIH4
	MyoRQKBppK+SCbhcJOXSzaMSpEglqeDH6C+ILjFmpzClgjXciQ0mi5LcY=
X-Google-Smtp-Source: AGHT+IFYMzW22at6D/dnxfRg62hyni3y8tYTBMCIP03G+FkljAvLYd8sOZlOMBcs4YaYoVh7Znpk6Q==
X-Received: by 2002:a05:6214:238d:b0:70f:a67b:a622 with SMTP id 6a1803df08f44-70fac895b6cmr255829636d6.32.1757088572558;
        Fri, 05 Sep 2025 09:09:32 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-720ac16de30sm69127446d6.7.2025.09.05.09.09.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 09:09:31 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/5] linux-yocto/6.16: update CVE exclusions (6.16.4)
Date: Fri,  5 Sep 2025 12:09:25 -0400
Message-Id: <8a6cee835672e719224b84a73d8d56563c87a07e.1757088383.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1757088383.git.bruce.ashfield@gmail.com>
References: <cover.1757088383.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Sep 2025 16:09:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223013

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Data pulled from: https://github.com/CVEProject/cvelistV5

    1/1 [
        Author: cvelistV5 Github Action
        Email: github_action@example.com
        Subject: 6 changes (1 new | 5 updated): - 1 new CVEs: CVE-2025-36193 - 5 updated CVEs: CVE-2022-20358, CVE-2022-2460, CVE-2022-34661, CVE-2025-9839, CVE-2025-9840
        Date: Wed, 3 Sep 2025 19:07:24 +0000

    ]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/cve-exclusion_6.16.inc              | 136 +++++++++++++++++-
 1 file changed, 132 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.16.inc b/meta/recipes-kernel/linux/cve-exclusion_6.16.inc
index a6e5de653f..f3fb0f9fb0 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.16.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.16.inc
@@ -1,11 +1,11 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2025-08-20 21:21:57.816408+00:00 for kernel version 6.16.2
-# From linux_kernel_cves cve_2025-08-20_2100Z
+# Generated at 2025-09-03 19:14:52.747326+00:00 for kernel version 6.16.4
+# From linux_kernel_cves cve_2025-09-03_1900Z
 
 
 python check_kernel_cve_status_version() {
-    this_version = "6.16.2"
+    this_version = "6.16.4"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
@@ -12000,6 +12000,10 @@ CVE_STATUS[CVE-2024-58237] = "fixed-version: Fixed from version 6.13"
 
 CVE_STATUS[CVE-2024-58238] = "fixed-version: Fixed from version 6.9"
 
+CVE_STATUS[CVE-2024-58239] = "fixed-version: Fixed from version 6.8"
+
+CVE_STATUS[CVE-2024-58240] = "fixed-version: Fixed from version 6.8"
+
 CVE_STATUS[CVE-2025-21629] = "fixed-version: Fixed from version 6.13"
 
 CVE_STATUS[CVE-2025-21631] = "fixed-version: Fixed from version 6.13"
@@ -13734,7 +13738,7 @@ CVE_STATUS[CVE-2025-38090] = "fixed-version: Fixed from version 6.16"
 
 CVE_STATUS[CVE-2025-38091] = "fixed-version: Fixed from version 6.15"
 
-CVE_STATUS[CVE-2025-38092] = "fixed-version: Fixed from version 6.15"
+CVE_STATUS[CVE-2025-38092] = "fixed-version: Fixed from version 6.14.10"
 
 CVE_STATUS[CVE-2025-38093] = "fixed-version: Fixed from version 6.16"
 
@@ -14778,8 +14782,132 @@ CVE_STATUS[CVE-2025-38614] = "cpe-stable-backport: Backported in 6.16.1"
 
 CVE_STATUS[CVE-2025-38615] = "cpe-stable-backport: Backported in 6.16.1"
 
+CVE_STATUS[CVE-2025-38616] = "cpe-stable-backport: Backported in 6.16.2"
+
+CVE_STATUS[CVE-2025-38617] = "cpe-stable-backport: Backported in 6.16.1"
+
+CVE_STATUS[CVE-2025-38618] = "cpe-stable-backport: Backported in 6.16.1"
+
+CVE_STATUS[CVE-2025-38619] = "cpe-stable-backport: Backported in 6.16.1"
+
+CVE_STATUS[CVE-2025-38620] = "cpe-stable-backport: Backported in 6.16.1"
+
+CVE_STATUS[CVE-2025-38621] = "cpe-stable-backport: Backported in 6.16.1"
+
+CVE_STATUS[CVE-2025-38622] = "cpe-stable-backport: Backported in 6.16.1"
+
+CVE_STATUS[CVE-2025-38623] = "cpe-stable-backport: Backported in 6.16.1"
+
+CVE_STATUS[CVE-2025-38624] = "cpe-stable-backport: Backported in 6.16.1"
+
+CVE_STATUS[CVE-2025-38625] = "cpe-stable-backport: Backported in 6.16.1"
+
+CVE_STATUS[CVE-2025-38626] = "cpe-stable-backport: Backported in 6.16.1"
+
+CVE_STATUS[CVE-2025-38627] = "cpe-stable-backport: Backported in 6.16.1"
+
+CVE_STATUS[CVE-2025-38628] = "cpe-stable-backport: Backported in 6.16.1"
+
+CVE_STATUS[CVE-2025-38629] = "cpe-stable-backport: Backported in 6.16.1"
+
+CVE_STATUS[CVE-2025-38630] = "cpe-stable-backport: Backported in 6.16.1"
+
+CVE_STATUS[CVE-2025-38631] = "cpe-stable-backport: Backported in 6.16.1"
+
+CVE_STATUS[CVE-2025-38632] = "cpe-stable-backport: Backported in 6.16.1"
+
+CVE_STATUS[CVE-2025-38633] = "cpe-stable-backport: Backported in 6.16.1"
+
+CVE_STATUS[CVE-2025-38634] = "cpe-stable-backport: Backported in 6.16.1"
+
+CVE_STATUS[CVE-2025-38635] = "cpe-stable-backport: Backported in 6.16.1"
+
+CVE_STATUS[CVE-2025-38636] = "cpe-stable-backport: Backported in 6.16.1"
+
 CVE_STATUS[CVE-2025-38637] = "fixed-version: Fixed from version 6.15"
 
+CVE_STATUS[CVE-2025-38638] = "cpe-stable-backport: Backported in 6.16.1"
+
+CVE_STATUS[CVE-2025-38639] = "cpe-stable-backport: Backported in 6.16.1"
+
+CVE_STATUS[CVE-2025-38640] = "cpe-stable-backport: Backported in 6.16.1"
+
+CVE_STATUS[CVE-2025-38641] = "cpe-stable-backport: Backported in 6.16.1"
+
+CVE_STATUS[CVE-2025-38642] = "cpe-stable-backport: Backported in 6.16.1"
+
+CVE_STATUS[CVE-2025-38643] = "cpe-stable-backport: Backported in 6.16.1"
+
+CVE_STATUS[CVE-2025-38644] = "cpe-stable-backport: Backported in 6.16.1"
+
+CVE_STATUS[CVE-2025-38645] = "cpe-stable-backport: Backported in 6.16.1"
+
+CVE_STATUS[CVE-2025-38646] = "cpe-stable-backport: Backported in 6.16.1"
+
+CVE_STATUS[CVE-2025-38647] = "cpe-stable-backport: Backported in 6.16.1"
+
+CVE_STATUS[CVE-2025-38648] = "cpe-stable-backport: Backported in 6.16.1"
+
+CVE_STATUS[CVE-2025-38649] = "cpe-stable-backport: Backported in 6.16.1"
+
+CVE_STATUS[CVE-2025-38650] = "cpe-stable-backport: Backported in 6.16.1"
+
+CVE_STATUS[CVE-2025-38651] = "cpe-stable-backport: Backported in 6.16.1"
+
+CVE_STATUS[CVE-2025-38652] = "cpe-stable-backport: Backported in 6.16.1"
+
+CVE_STATUS[CVE-2025-38653] = "cpe-stable-backport: Backported in 6.16.1"
+
+CVE_STATUS[CVE-2025-38654] = "cpe-stable-backport: Backported in 6.16.1"
+
+CVE_STATUS[CVE-2025-38655] = "cpe-stable-backport: Backported in 6.16.1"
+
+# CVE-2025-38656 has no known resolution
+
+CVE_STATUS[CVE-2025-38657] = "cpe-stable-backport: Backported in 6.16.1"
+
+CVE_STATUS[CVE-2025-38658] = "cpe-stable-backport: Backported in 6.16.1"
+
+CVE_STATUS[CVE-2025-38659] = "cpe-stable-backport: Backported in 6.16.1"
+
+CVE_STATUS[CVE-2025-38660] = "cpe-stable-backport: Backported in 6.16.1"
+
+CVE_STATUS[CVE-2025-38661] = "fixed-version: Fixed from version 6.16"
+
+CVE_STATUS[CVE-2025-38662] = "fixed-version: Fixed from version 6.16"
+
+CVE_STATUS[CVE-2025-38663] = "fixed-version: Fixed from version 6.16"
+
+CVE_STATUS[CVE-2025-38664] = "fixed-version: Fixed from version 6.16"
+
+CVE_STATUS[CVE-2025-38665] = "fixed-version: Fixed from version 6.16"
+
+CVE_STATUS[CVE-2025-38666] = "fixed-version: Fixed from version 6.16"
+
+CVE_STATUS[CVE-2025-38667] = "fixed-version: Fixed from version 6.16"
+
+CVE_STATUS[CVE-2025-38668] = "fixed-version: Fixed from version 6.16"
+
+CVE_STATUS[CVE-2025-38669] = "fixed-version: Fixed from version 6.16"
+
+CVE_STATUS[CVE-2025-38670] = "fixed-version: Fixed from version 6.16"
+
+CVE_STATUS[CVE-2025-38671] = "fixed-version: Fixed from version 6.16"
+
+CVE_STATUS[CVE-2025-38672] = "fixed-version: Fixed from version 6.16"
+
+CVE_STATUS[CVE-2025-38673] = "fixed-version: Fixed from version 6.16"
+
+CVE_STATUS[CVE-2025-38674] = "fixed-version: Fixed from version 6.16"
+
+CVE_STATUS[CVE-2025-38675] = "fixed-version: Fixed from version 6.16"
+
+CVE_STATUS[CVE-2025-38676] = "cpe-stable-backport: Backported in 6.16.4"
+
+CVE_STATUS[CVE-2025-38677] = "cpe-stable-backport: Backported in 6.16.4"
+
+CVE_STATUS[CVE-2025-38678] = "cpe-stable-backport: Backported in 6.16.2"
+
 CVE_STATUS[CVE-2025-39688] = "fixed-version: Fixed from version 6.15"
 
 CVE_STATUS[CVE-2025-39728] = "fixed-version: Fixed from version 6.15"
-- 
2.39.2


