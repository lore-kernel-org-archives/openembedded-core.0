Return-Path: <ola.x.nilsson@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 9BEA771C2F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Oct 2016 11:03:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id DF46C2E4CD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Oct 2016 13:03:45 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id TKp2WDMq+X78
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Oct 2016 13:03:37 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bes.se.axis.com (Postfix) with ESMTPS id 8058E2E4D0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Oct 2016 13:03:37 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 69C571E094
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Oct 2016 13:03:37 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5DEF01E092
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Oct 2016 13:03:37 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Oct 2016 13:03:37 +0200 (CEST)
Received: from lnxolani.se.axis.com (lnxolani.se.axis.com [10.88.67.1])
	by thoth.se.axis.com (Postfix) with ESMTP id 50514373;
	Tue, 25 Oct 2016 13:03:36 +0200 (CEST)
Received: by lnxolani.se.axis.com (Postfix, from userid 20853)
	id DB1B37C610; Tue, 25 Oct 2016 13:03:35 +0200 (CEST)
From: Ola x Nilsson <ola.x.nilsson@axis.com>
To: olani@axis.com,
	openembedded-core@lists.openembedded.org
Date: Tue, 25 Oct 2016 13:03:35 +0200
Message-Id: <1477393415-13053-5-git-send-email-olani@axis.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1477393415-13053-1-git-send-email-olani@axis.com>
References: <1477393415-13053-1-git-send-email-olani@axis.com>
X-TM-AS-GCONF: 00
Subject: [PATCH 4/4] recipetool: Load plugins in a well defined order
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
X-List-Received-Date: Tue, 25 Oct 2016 11:03:44 -0000

From: Ola x Nilsson <ola.x.nilsson@axis.com>

To allow recipetool plugins in one layer to shadow another in a well
defined way, first search BBPATH/lib/recipetool directories and then
scripts/lib/recipetool and load only the first found.

The previous search and load loop would load all found plugins with the
ones found later replacing any found before.

Signed-off-by: Ola x Nilsson <ola.x.nilsson@axis.com>
---
 scripts/recipetool | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/recipetool b/scripts/recipetool
index 1052cd2..00c9007 100755
--- a/scripts/recipetool
+++ b/scripts/recipetool
@@ -78,8 +78,8 @@ def main():
 
     tinfoil = tinfoil_init(False)
     try:
-        for path in ([scripts_path] +
-                    tinfoil.config_data.getVar('BBPATH', True).split(':')):
+        for path in (tinfoil.config_data.getVar('BBPATH', True).split(':')
+                     + [scripts_path]):
             pluginpath = os.path.join(path, 'lib', 'recipetool')
             scriptutils.load_plugins(logger, plugins, pluginpath)
 
-- 
2.1.4


