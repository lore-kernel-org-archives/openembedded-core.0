Return-Path: <peter.marko@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id ACEFE780F8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jun 2017 06:05:37 +0000 (UTC)
Received: from mail2.siemens.de (mail2.siemens.de [139.25.208.11])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id v5765cWN030784
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 7 Jun 2017 08:05:38 +0200
Received: from dev.sbt.siemens.com ([163.242.44.98])
	by mail2.siemens.de (8.15.2/8.15.2) with ESMTP id v5765c09028113;
	Wed, 7 Jun 2017 08:05:38 +0200
Received: from dev.sbt.siemens.com (localhost [127.0.0.1])
	by dev.sbt.siemens.com (Postfix) with ESMTP id 2D1201CB951;
	Wed,  7 Jun 2017 08:05:38 +0200 (CEST)
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Jun 2017 08:04:29 +0200
Message-Id: <1496815471-23075-3-git-send-email-peter.marko@siemens.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1496815471-23075-1-git-send-email-peter.marko@siemens.com>
References: <1496815471-23075-1-git-send-email-peter.marko@siemens.com>
In-Reply-To: <1496647273-9693-1-git-send-email-peter.marko@siemens.com>
References: <1496647273-9693-1-git-send-email-peter.marko@siemens.com>
Subject: [PATCH v2 2/4] cve-check: do not parse error output
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
X-List-Received-Date: Wed, 07 Jun 2017 06:05:38 -0000

Sometimes there are control messages in cve-check-tool printed to
stderr. These lead to parsing error and thus failed build.
This can happen for instance when cve database needs to be
refreshed during build.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/classes/cve-check.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 660fe7a..1f0b691 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -172,7 +172,7 @@ def check_cves(d, patched_cves):
             f.write("%s,%s,%s," % (bpn, pv, cves))
         cmd.append(faux)
 
-        output = subprocess.check_output(cmd, stderr=subprocess.STDOUT).decode("utf-8")
+        output = subprocess.check_output(cmd).decode("utf-8")
         bb.debug(2, "Output of command %s:\n%s" % ("\n".join(cmd), output))
     except subprocess.CalledProcessError as e:
         bb.warn("Couldn't check for CVEs: %s (output %s)" % (e, e.output))
-- 
2.1.4


