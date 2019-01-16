Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C4F4D7C1BA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jan 2019 06:08:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x0G68qwq000628
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 22:08:52 -0800 (PST)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.408.0; Tue, 15 Jan 2019 22:08:52 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 16 Jan 2019 14:27:08 +0800
Message-ID: <a17e2d2723b483a94527fb5cd7533b85d850f2a5.1547620011.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1547620011.git.liezhi.yang@windriver.com>
References: <cover.1547620011.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] sstate.bbclass: remove dependencies of SSTATE_EXTRAPATHWILDCARD
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
X-List-Received-Date: Wed, 16 Jan 2019 06:08:51 -0000
Content-Type: text/plain

There might be do_cleansstate errors sometimes:
ERROR: When reparsing
/path/to/meta/recipes-devtools/quilt/quilt-native_0.65.bb.do_cleansstate,
the basehash value changed from
b4dbcb956a32ed4c3f58b7971717907bfc03bb21f3b140fa97f7765ee695f4d0 to
c8307418a671686349b73efbd51c5c82c897a88707a759ddb22fd95baa5df2ba. The metadata
is not deterministic and this needs to be fixed.

The stable reproducer is:
- Initial a fresh build, this is a must, otherwise we may can't reproduce it
  $ . oe-init-build-env build
  $ bitbake quilt-native -ccleansstate

This is because uninative.bbclass resets NATIVELSBSTRING from distro (e.g.,
ubuntu) to universal, remove dependencies of SSTATE_EXTRAPATHWILDCARD as
SSTATE_EXTRAPATH did can fix the problem.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/sstate.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 482ffa8..763fce0 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -23,6 +23,7 @@ PV[vardepvalue] = "${PV}"
 # We don't want the sstate to depend on things like the distro string
 # of the system, we let the sstate paths take care of this.
 SSTATE_EXTRAPATH[vardepvalue] = ""
+SSTATE_EXTRAPATHWILDCARD[vardepvalue] = ""
 
 # For multilib rpm the allarch packagegroup files can overwrite (in theory they're identical)
 SSTATE_DUPWHITELIST = "${DEPLOY_DIR}/licenses/"
-- 
2.7.4


