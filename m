Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Hongxu.Jia@windriver.com>) id 1TrI86-0008Nf-5Z
	for openembedded-core@lists.openembedded.org;
	Sat, 05 Jan 2013 02:00:56 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r050jltW026901
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 4 Jan 2013 16:45:47 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.131) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Fri, 4 Jan 2013 16:45:47 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 5 Jan 2013 08:45:43 +0800
Message-ID: <c7eeaf9b46dd9c854603f2c5e3157799390ab76d.1357290320.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1357290320.git.hongxu.jia@windriver.com>
References: <cover.1357290320.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] image.bbclass:specify the order of do_rootfs
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 05 Jan 2013 01:00:59 -0000
Content-Type: text/plain

The task of do_populate_lic use "bb.build.exec_func" to execute shell function
"sstate_create_package", and "bb.build.exec_func" use ${B} as default dir to cd
and execute the shell function. At this place, B = "${WORKDIR}/${BPN}-${PV}/",
and "${WORKDIR}/${BPN}-${PV}/" is removed by task do_rootfs.

When we use more than one bitabke to run tasks, there is a chance that do_rootfs
and do_populate_lic are being executed at the same time. So we should explicity
specify the order of do_populate_lic and do_rootfs to let "${WORKDIR}/${BPN}-${PV}/"
could be correctly used and removed.

[YOCTO #3674]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/classes/image.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index d3a416d..c2dab36 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -472,4 +472,4 @@ do_package_write_ipk[noexec] = "1"
 do_package_write_deb[noexec] = "1"
 do_package_write_rpm[noexec] = "1"
 
-addtask rootfs before do_build
+addtask rootfs before do_build after do_populate_lic
-- 
1.7.10.4



