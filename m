Return-Path: <li.wang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8C7AF531FC
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 03:22:44 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10975.1776223356404013155
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Apr 2026 20:22:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=sjRJnWDN;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=85650a9195=li.wang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63F0j01K1553408
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 03:22:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=nYwYx5I79zhLn5GrOYI8
	fOwm/lVbKauLPilZNwP/140=; b=sjRJnWDNbcuQF+qSehRxWJBszVTMhR6k2WQW
	d//wGzGQOcr22oNZsbdqqj4E7OAOA0vxAniCO9BydIAxJnuqJ/T779eVnM7n3szk
	asvx8LSAIEHKl9dnxJ/0pVtyWvkq05t7Z4klqt+pzE+UVibg2wWSCEOlKs6OJq4Q
	DDo/xH+uqCKPULd2A5Mhb3dRo3LXkX8ZWOM/iAy9LCXzqvmh11TnrLubtg1+dVM0
	Nb9n0zJUwwXL4Jw6rK9U4gxyrg4O+44rkDctisoOoCV/OlYVupMfQQV+YpdtB+mk
	NMg4fRSJDX8ZoRnjgFItQSd6LhYooaT2RnrDOY1hpb/YmEMRcQ==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dh87a9hud-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 03:22:35 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Tue, 14 Apr 2026 20:22:33 -0700
Received: from pek-lpg-core6.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Tue, 14 Apr 2026 20:22:33 -0700
From: Li Wang <li.wang@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <li.wang@windriver.com>
Subject: [scarthgap][PATCH] ltp: fix epoll_ctl04 failed
Date: Wed, 15 Apr 2026 11:22:32 +0800
Message-ID: <20260415032232.2057560-1-li.wang@windriver.com>
X-Mailer: git-send-email 2.49.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 6uTW3GnXAPhfiydcnfeCeye_Fso6j90m
X-Authority-Analysis: v=2.4 cv=Q4jiJY2a c=1 sm=1 tr=0 ts=69df047b cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=klDOsUkWDRETUCZYPvoE:22 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=20KFwNOVAAAA:8
 a=t7CeM3EgAAAA:8 a=iox4zFpeAAAA:8 a=39dCfGlMvhMnTBUAMx8A:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=WzC6qhA0u3u7Ye7llzcV:22
X-Proofpoint-ORIG-GUID: 6uTW3GnXAPhfiydcnfeCeye_Fso6j90m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDAyOSBTYWx0ZWRfX3lQ8SNYjy73I
 5e6Ho5itLPNnrE2h83KTyNUvTosqSF/EjupEBtfWXdoyNeHBsyNd+brSlKffubnWYlaM+27ZE5t
 8An5yWaszkLHVZPYzk6KWI+RDi8XpZ8koxrFqHhKHZdvmysLF3Zouoyeu9nDZBu5pW1oyXADbDV
 XOtRAdw49oJOVPZUuzPIAvWafOoolfxezwx7Wbl1JgLWMAth4SU8twOrlHuRFT7er3MplMdAnBo
 cSVihM6FXEmO/m71osJCCV2FFvHGengjvAZ3KE6beiBpV3H4L7veTJdNgUoVXu8Uz+sv9doC2q+
 rRpjVFFH0XciWUrloGti6d76Mdd6WykKA+nhnlHBzDCyQAM2oh2h/1ajyC+ypvlwhf7kxh3PYlm
 3y4UwdLWx4LUvh4GmPWToSLW8W0U7bHuOlsWYzNgXRq+AQcteFEmgck6ZxFNwsdxzWoqW8EgivF
 tsnlczRp4QOwaIxeB1g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_04,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604150029
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 03:22:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235177

backport from ltp upstream commit:
https://github.com/linux-test-project/ltp/commit/e84f0689cf7a8a77478a0e70aa62560f66c3bceb

the related kernel patch was already merged into yocto linux:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f2e467a48287c868818085aa35389a224d226732

Signed-off-by: Li Wang <li.wang@windriver.com>
---
 ...l_ctl04-add-ELOOP-to-expected-errnos.patch | 49 +++++++++++++++++++
 meta/recipes-extended/ltp/ltp_20240129.bb     |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta/recipes-extended/ltp/ltp/0001-syscalls-epoll_ctl04-add-ELOOP-to-expected-errnos.patch

diff --git a/meta/recipes-extended/ltp/ltp/0001-syscalls-epoll_ctl04-add-ELOOP-to-expected-errnos.patch b/meta/recipes-extended/ltp/ltp/0001-syscalls-epoll_ctl04-add-ELOOP-to-expected-errnos.patch
new file mode 100644
index 0000000000..203836a5f6
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0001-syscalls-epoll_ctl04-add-ELOOP-to-expected-errnos.patch
@@ -0,0 +1,49 @@
+From e84f0689cf7a8a77478a0e70aa62560f66c3bceb Mon Sep 17 00:00:00 2001
+From: Jan Stancek <jstancek@redhat.com>
+Date: Tue, 5 Aug 2025 11:27:23 +0200
+Subject: [PATCH] syscalls/epoll_ctl04: add ELOOP to expected errnos
+
+Kernel commit f2e467a48287 ("eventpoll: Fix semi-unbounded recursion")
+added an extra checks for determining the maximum depth of an upwards walk,
+which starting with 6.17-rc kernels now hits ELOOP before EINVAL.
+
+Add ELOOP to list of expected errnos.
+
+Upstream-Status: Backport from
+[https://github.com/linux-test-project/ltp/commit/e84f0689]
+
+Link: https://lore.kernel.org/ltp/39ee7abdee12e22074b40d46775d69d37725b932.1754386027.git.jstancek@redhat.com/
+Reviewed-by: Andrea Cervesato <andrea.cervesato@suse.com>
+Reviewed-by: Petr Vorel <pvorel@suse.cz>
+Reviewed-by: Avinesh Kumar <akumar@suse.de>
+Tested-by: Avinesh Kumar <akumar@suse.de>
+Signed-off-by: Jan Stancek <jstancek@redhat.com>
+[ modify TST_EXP_FAIL2_ARR function parameters ]
+Signed-off-by: Li Wang <li.wang@windriver.com>
+---
+ testcases/kernel/syscalls/epoll_ctl/epoll_ctl04.c | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/testcases/kernel/syscalls/epoll_ctl/epoll_ctl04.c b/testcases/kernel/syscalls/epoll_ctl/epoll_ctl04.c
+index 955959b6b26..feb49623b15 100644
+--- a/testcases/kernel/syscalls/epoll_ctl/epoll_ctl04.c
++++ b/testcases/kernel/syscalls/epoll_ctl/epoll_ctl04.c
+@@ -51,13 +51,16 @@ static void cleanup(void)
+ 
+ static void verify_epoll_ctl(void)
+ {
++	const int exp_errnos[] = {EINVAL, ELOOP};
++
+ 	new_epfd = epoll_create(1);
+ 	if (new_epfd == -1)
+ 		tst_brk(TBROK | TERRNO, "fail to create epoll instance");
+ 
+ 	events.data.fd = epfd;
+-	TST_EXP_FAIL(epoll_ctl(new_epfd, EPOLL_CTL_ADD, epfd, &events), EINVAL,
+-		     "epoll_ctl(..., EPOLL_CTL_ADD, ...) with number of nesting is 5");
++	TST_EXP_FAIL2_ARR(epoll_ctl(new_epfd, EPOLL_CTL_ADD, epfd, &events),
++		exp_errnos,
++		"epoll_ctl(..., EPOLL_CTL_ADD, ...) with number of nesting is 5");
+ 	SAFE_CLOSE(new_epfd);
+ }
+ 
diff --git a/meta/recipes-extended/ltp/ltp_20240129.bb b/meta/recipes-extended/ltp/ltp_20240129.bb
index 18c6439283..ec31c98544 100644
--- a/meta/recipes-extended/ltp/ltp_20240129.bb
+++ b/meta/recipes-extended/ltp/ltp_20240129.bb
@@ -31,6 +31,7 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=ht
            file://0001-scenario_groups-default-remove-connectors.patch \
            file://0001-sched_stress-Use-time_t-instead-of-long-for-type.patch \
            file://0001-cve-2015-3290-Disable-AVX-for-x86_64.patch \
+           file://0001-syscalls-epoll_ctl04-add-ELOOP-to-expected-errnos.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.49.1


