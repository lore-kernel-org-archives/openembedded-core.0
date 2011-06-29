Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1Qbjqk-00082h-JM
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Jun 2011 03:45:54 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5T1gCcU024916
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jun 2011 18:42:12 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Tue, 28 Jun 2011 18:42:11 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 28 Jun 2011 20:42:34 -0500
Message-ID: <5d587020e89f331fbd31884d283ceb23756b3c9a.1309311666.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1309311666.git.mark.hatle@windriver.com>
References: <cover.1309311666.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 1/2] sstate.bbclass: Fix an issue if the config changes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 29 Jun 2011 01:45:55 -0000
Content-Type: text/plain

We need to check if we know of the task type, before we attempt
to process it.  In order to reproduce the problem build with:

PACKAGE_CLASSES = "package_ipk"

Then change it to:

PACKAGE_CLASSES = "package_rpm"

Build again -- and then try bitbake -c cleansstate <recipe>

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/sstate.bbclass |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 14c90ec..0daaf48 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -273,6 +273,8 @@ python sstate_cleanall() {
              name = manifest.replace(manifest_pattern[:-1], "")
              namemap = d.getVar('SSTATETASKNAMES', True).split()
              tasks = d.getVar('SSTATETASKS', True).split()
+             if name not in namemap:
+                  continue
              taskname = tasks[namemap.index(name)]
              shared_state = sstate_state_fromvars(d, taskname[3:])
              sstate_clean(shared_state, d)
-- 
1.7.3.4



