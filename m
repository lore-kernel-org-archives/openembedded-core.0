Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 47E6A71AD1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Mar 2017 07:02:18 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v2A72Jid026459
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 9 Mar 2017 23:02:19 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.201) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Thu, 9 Mar 2017 23:02:18 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 10 Mar 2017 15:03:05 +0800
Message-ID: <536d9fa42f009bbd263e196737f1134178de11c6.1489129334.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1489129334.git.Qi.Chen@windriver.com>
References: <cover.1489129334.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] procps: fix ALTERNATIVE_PRIORITY to avoid conflict
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
X-List-Received-Date: Fri, 10 Mar 2017 07:02:19 -0000
Content-Type: text/plain

Previously, 'pidof' utility has two providers, sysvinit and procps, and
both have the same priority 200. Fix procps to lower the priority of its
'pidof' to 150 to avoid conflict.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-extended/procps/procps_3.3.12.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/procps/procps_3.3.12.bb b/meta/recipes-extended/procps/procps_3.3.12.bb
index 1f793b9..adabd75 100644
--- a/meta/recipes-extended/procps/procps_3.3.12.bb
+++ b/meta/recipes-extended/procps/procps_3.3.12.bb
@@ -49,6 +49,7 @@ base_bindir_progs += "kill pidof ps watch"
 base_sbindir_progs += "sysctl"
 
 ALTERNATIVE_PRIORITY = "200"
+ALTERNATIVE_PRIORITY[pidof] = "150"
 
 ALTERNATIVE_${PN} = "${bindir_progs} ${base_bindir_progs} ${base_sbindir_progs}"
 
-- 
1.9.1


