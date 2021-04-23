Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web08.4774.1619148549327153965
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Apr 2021 20:29:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: kai.kang@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 13N3T8iW017668
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 22 Apr 2021 20:29:08 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Thu, 22 Apr 2021 20:29:07 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.4 via Frontend Transport; Thu, 22 Apr 2021 20:29:07 -0700
From: "kai" <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 2/2] kernel-yocto.bbclass: chdir to ${WORKDIR} for do_kernel_checkout
Date: Fri, 23 Apr 2021 11:29:04 +0800
Message-ID: <20210423032904.1086-2-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210423032904.1086-1-kai.kang@windriver.com>
References: <20210423032904.1086-1-kai.kang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

It chdirs to ${S} at the beginning of task do_kernel_checkout. Then it
removes ${S} when it still resides in ${S}. It may fail to run the task
do_kernel_checkout when bitbake is called by third-part wrapper script.
So chdir to ${WORKDIR} by default for do_kernel_checkout. And it will
chdir to ${S} afterwards in task do_kernel_checkout.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/classes/kernel-yocto.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 15c8dbb81f..30f07de4ca 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -378,7 +378,7 @@ do_kernel_checkout() {
 	# checkout and clobber any unimportant files
 	git checkout -f ${machine_branch}
 }
-do_kernel_checkout[dirs] = "${S}"
+do_kernel_checkout[dirs] = "${S} ${WORKDIR}"
 
 addtask kernel_checkout before do_kernel_metadata after do_symlink_kernsrc
 addtask kernel_metadata after do_validate_branches do_unpack before do_patch
-- 
2.17.1

