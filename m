Return-Path: <Zhixiong.Chi@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4B6D278EC8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Aug 2018 07:32:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w7A7VEfK002173
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Aug 2018 00:31:52 -0700
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.399.0;
	Fri, 10 Aug 2018 00:31:39 -0700
From: Zhixiong Chi <zhixiong.chi@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 10 Aug 2018 00:31:34 -0700
Message-ID: <20180810073139.89868-1-zhixiong.chi@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [PATCH 1/6] multilib-script: fix ALTERNATIVE_${PN} override issue
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
X-List-Received-Date: Fri, 10 Aug 2018 07:32:01 -0000
Content-Type: text/plain

If multilib scripts are more than one file, the variable
ALTERNATIVE_${PN} will be overrode. Finally, there will be only
one symbol link file.

Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
---
 meta/classes/multilib_script.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/multilib_script.bbclass b/meta/classes/multilib_script.bbclass
index a5a552b716..51c9fcc12c 100644
--- a/meta/classes/multilib_script.bbclass
+++ b/meta/classes/multilib_script.bbclass
@@ -25,7 +25,7 @@ python () {
     for entry in (d.getVar("MULTILIB_SCRIPTS", False) or "").split():
        pkg, script = entry.split(":")
        scriptname = os.path.basename(script)
-       d.setVar("ALTERNATIVE_" + pkg, scriptname)
+       d.appendVar("ALTERNATIVE_" + pkg, scriptname + " ")
        d.setVarFlag("ALTERNATIVE_LINK_NAME", scriptname, script)
        d.setVarFlag("ALTERNATIVE_TARGET", scriptname, script + "-${MULTILIB_SUFFIX}")
        d.appendVar("multilibscript_rename",  "\n	mv ${PKGD}" + script + " ${PKGD}" + script + "-${MULTILIB_SUFFIX}")
-- 
2.17.1


