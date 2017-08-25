Return-Path: <o.mandel@menlosystems.com>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id DBD3C78467
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Aug 2017 17:02:20 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 3xf6sT4Yd1z1qsZc;
	Fri, 25 Aug 2017 19:02:21 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 3xf6sT4HPdz3hhTp;
	Fri, 25 Aug 2017 19:02:21 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id PBHM8YZA6qa7; Fri, 25 Aug 2017 19:02:20 +0200 (CEST)
X-Auth-Info: 1nwwsbHnseRyScUVBcRy8QZz8ZNSHlTFlLTnVp0p4h2cNBZYZBB2/pf5SGs6/IR1
Received: from menlobldserver.menlosystems.local
	(host-141-40-253-38.customer.izb-online.de [141.40.253.38])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Fri, 25 Aug 2017 19:02:20 +0200 (CEST)
From: Olaf Mandel <o.mandel@menlosystems.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Aug 2017 17:01:57 +0000
Message-Id: <20170825170157.14883-1-o.mandel@menlosystems.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <26cd356d-9d62-145e-a11b-0a0bf682fdd7@menlosystems.com>
References: <26cd356d-9d62-145e-a11b-0a0bf682fdd7@menlosystems.com>
Cc: Olaf Mandel <o.mandel@menlosystems.com>
Subject: [PATCH v3] (PRE)MIRRORS: fix pattern for npm:// without slash
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
X-List-Received-Date: Fri, 25 Aug 2017 17:02:21 -0000

For URIs with the npm:// transport but with no other slash in it, the
common MIRRORS and PREMIRRORS pattern of npm://.*/.* fails to match.
Make the last slash in the pattern optional in the mirros.bbclass and
own-mirrors.bbclass classes.

Many URIs with the npm:// transport have no slash after the host part:

  npm://registry.npmjs.org;name=foo;version=0.1.2

This means that MIRRORS and PREMIRRORS containing entries like the
first one will not match these URIs:

  npm://.*/.*   # fails to match
  npm://.*/?.*  # matches this and URIs with path components

For normal regular expressions, a pattern like 'npm://.*(/.*)?' would
probably be preferred, but that won't work here: the pattern gets split
into the substrings 'npm', '.*(' and '/.*)?', which are not valid
regular expressions individually.

Signed-off-by: Olaf Mandel <o.mandel@menlosystems.com>
---
 meta/classes/mirrors.bbclass     | 4 ++--
 meta/classes/own-mirrors.bbclass | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/mirrors.bbclass b/meta/classes/mirrors.bbclass
index b98684f5c6..766f1cb6fa 100644
--- a/meta/classes/mirrors.bbclass
+++ b/meta/classes/mirrors.bbclass
@@ -48,7 +48,7 @@ p4://.*/.*      http://downloads.yoctoproject.org/mirror/sources/ \n \
 osc://.*/.*     http://downloads.yoctoproject.org/mirror/sources/ \n \
 https?$://.*/.* http://downloads.yoctoproject.org/mirror/sources/ \n \
 ftp://.*/.*     http://downloads.yoctoproject.org/mirror/sources/ \n \
-npm://.*/.*     http://downloads.yoctoproject.org/mirror/sources/ \n \
+npm://.*/?.*    http://downloads.yoctoproject.org/mirror/sources/ \n \
 cvs://.*/.*     http://sources.openembedded.org/ \n \
 svn://.*/.*     http://sources.openembedded.org/ \n \
 git://.*/.*     http://sources.openembedded.org/ \n \
@@ -58,7 +58,7 @@ p4://.*/.*      http://sources.openembedded.org/ \n \
 osc://.*/.*     http://sources.openembedded.org/ \n \
 https?$://.*/.* http://sources.openembedded.org/ \n \
 ftp://.*/.*     http://sources.openembedded.org/ \n \
-npm://.*/.*     http://sources.openembedded.org/ \n \
+npm://.*/?.*    http://sources.openembedded.org/ \n \
 ${CPAN_MIRROR}  http://cpan.metacpan.org/ \n \
 ${CPAN_MIRROR}  http://search.cpan.org/CPAN/ \n \
 "
diff --git a/meta/classes/own-mirrors.bbclass b/meta/classes/own-mirrors.bbclass
index 12b42675bc..0296d545be 100644
--- a/meta/classes/own-mirrors.bbclass
+++ b/meta/classes/own-mirrors.bbclass
@@ -9,5 +9,5 @@ p4://.*/.*      ${SOURCE_MIRROR_URL}
 osc://.*/.*     ${SOURCE_MIRROR_URL}
 https?$://.*/.* ${SOURCE_MIRROR_URL}
 ftp://.*/.*     ${SOURCE_MIRROR_URL}
-npm://.*/.*     ${SOURCE_MIRROR_URL}
+npm://.*/?.*    ${SOURCE_MIRROR_URL}
 }
-- 
2.11.0


