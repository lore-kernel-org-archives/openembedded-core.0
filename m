Return-Path: <Jian.Liu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5944A72165
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Nov 2014 09:17:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sAL9HM5i007123
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Nov 2014 01:17:22 -0800 (PST)
Received: from localhost.localdomain (128.224.153.42) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Fri, 21 Nov 2014 01:17:21 -0800
From: Jian Liu <jian.liu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 21 Nov 2014 17:17:12 +0800
Message-ID: <1416561434-17862-4-git-send-email-jian.liu@windriver.com>
X-Mailer: git-send-email 1.7.0.5
In-Reply-To: <1416561434-17862-1-git-send-email-jian.liu@windriver.com>
References: <1416561434-17862-1-git-send-email-jian.liu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 3/5] logrotate: avoid overwritting editable files during package updating
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 21 Nov 2014 09:17:22 -0000
Content-Type: text/plain

Use CONFFILES to mark editable files as such,
  /var/lib/logrotate.status

If there is no %config micro before the file name in the spec file,
this file will be overwritten after updating package. 
This will make our settings lost.

Signed-off-by: Jian Liu <jian.liu@windriver.com>
---
 meta/recipes-extended/logrotate/logrotate_3.8.7.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/logrotate/logrotate_3.8.7.bb b/meta/recipes-extended/logrotate/logrotate_3.8.7.bb
index faa8e02..8b39602 100644
--- a/meta/recipes-extended/logrotate/logrotate_3.8.7.bb
+++ b/meta/recipes-extended/logrotate/logrotate_3.8.7.bb
@@ -54,3 +54,5 @@ do_install(){
     install -p -m 755 examples/logrotate.cron ${D}${sysconfdir}/cron.daily/logrotate
     touch ${D}${localstatedir}/lib/logrotate.status
 }
+
+CONFFILES_${PN} += "${localstatedir}/lib/logrotate.status"
-- 
1.8.5.2.233.g932f7e4


