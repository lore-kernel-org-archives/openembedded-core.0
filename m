Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id EFC1C7719F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jun 2018 07:57:18 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w5D7usMt027628
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jun 2018 00:57:10 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Wed, 13 Jun 2018 00:56:44 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 13 Jun 2018 15:58:25 +0800
Message-ID: <1ffc7d707b79a30363c826a1e0c6f57cc252afa2.1528870775.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1528870775.git.Qi.Chen@windriver.com>
References: <cover.1528870775.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 7/7] dnf: default to disable systemd units
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
X-List-Received-Date: Wed, 13 Jun 2018 07:57:19 -0000
Content-Type: text/plain

The services and timers are not useful if a repo is not configured.
In OE, we default to have no repo configured. So we default to disable
these units.

The problem was found by the test_systemd_failed runtime test case.
dnf-makecache.service is found to fail. This is due to lack of repo.
Note that as this service is started by the dnf-makecache.timer, it's
possible that test_systemd_failed passes in case the timer is not started
yet.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-devtools/dnf/dnf_2.7.5.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/dnf/dnf_2.7.5.bb b/meta/recipes-devtools/dnf/dnf_2.7.5.bb
index b88ddb4..df60d73 100644
--- a/meta/recipes-devtools/dnf/dnf_2.7.5.bb
+++ b/meta/recipes-devtools/dnf/dnf_2.7.5.bb
@@ -72,3 +72,4 @@ SYSTEMD_SERVICE_${PN} = "dnf-makecache.service dnf-makecache.timer \
                          dnf-automatic-install.service dnf-automatic-install.timer \
                          dnf-automatic-notifyonly.service dnf-automatic-notifyonly.timer \
 "
+SYSTEMD_AUTO_ENABLE ?= "disable"
-- 
1.9.1


