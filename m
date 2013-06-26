Return-Path: <rewitt@declaratino.com>
Received: from p3plsmtpa09-08.prod.phx3.secureserver.net
	(p3plsmtpa09-08.prod.phx3.secureserver.net [173.201.193.237])
	by mail.openembedded.org (Postfix) with ESMTP id B21B56AB81
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2013 17:33:37 +0000 (UTC)
Received: from localhost.localdomain ([74.131.113.133])
	by p3plsmtpa09-08.prod.phx3.secureserver.net with 
	id t5ZJ1l0082skrMm015ZeGC; Wed, 26 Jun 2013 10:33:38 -0700
From: Randy Witt <rewitt@declaratino.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Jun 2013 13:33:16 -0400
Message-Id: <1372267997-9077-2-git-send-email-rewitt@declaratino.com>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <1372267997-9077-1-git-send-email-rewitt@declaratino.com>
References: <1372267997-9077-1-git-send-email-rewitt@declaratino.com>
Subject: [PATCH 1/2] systemd: Don't enable systemd services when native.
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
X-List-Received-Date: Wed, 26 Jun 2013 17:33:38 -0000

From: Randy Witt <rewitt@lpdev.prtdev.lexmark.com>

It shouldn't be desired that systemd enable services when using
class native. Blanking out the SYSTEMD_PACKAGES when native seems
like the most straightforward way to fix this problem.

Signed-off-by: Randy Witt <rewitt@declaratino.com>
---
 meta/classes/systemd.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/systemd.bbclass b/meta/classes/systemd.bbclass
index 86d9a9a..0447e53 100644
--- a/meta/classes/systemd.bbclass
+++ b/meta/classes/systemd.bbclass
@@ -2,6 +2,8 @@
 # each entry, optionally have a SYSTEMD_SERVICE_[package] that lists the service
 # files in this package.  If this variable isn't set, [package].service is used.
 SYSTEMD_PACKAGES ?= "${PN}"
+SYSTEMD_PACKAGES_class-native ?= ""
+SYSTEMD_PACKAGES_class-nativesdk ?= ""
 
 # Whether to enable or disable the services on installation.
 SYSTEMD_AUTO_ENABLE ??= "enable"
-- 
1.8.1.4


